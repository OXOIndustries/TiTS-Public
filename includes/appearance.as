import classes.Characters.PlayerCharacter;
import classes.Creature;
public function pcAppearance(e:MouseEvent = null):void 
{
	if (pc.short.length == 0) return;
	
	if (!userInterface.appearanceButton.isActive)
	{
		return;
	}
	else if (userInterface.showingPCAppearance)
	{
		userInterface.showPrimaryOutput();
		userInterface.showingPCAppearance = false;
	}
	else
	{
		userInterface.showSecondaryOutput();
		userInterface.appearanceButton.Glow();
		appearance(pc);
		userInterface.showingPCAppearance = true;
	}
}

public function appearance(forTarget:Creature):void
{
	setTarget(forTarget);

	clearOutput2();
	showLocationName();
	showName("\nAPPEARANCE");
	clearGhostMenu();
	addGhostButton(14, "Back", pcAppearance);
	
	var rando:int = 0;
	var feedVal:int;
	if(target == pc) {
		//Creation stuff
		if(target.hasStatusEffect("In Creation"))
		{
			output2("You are currently creating yourself!");
			output2("\n\n<i>(Detailed information about your appearance will be displayed here.)</i>");
			return;
		}
		
		//Overall
		if(target.originalRace == target.race()) output2("You are " + indefiniteArticle(target.originalRace) + ".");
		else
		{
			output2("You started your journey as " + indefiniteArticle(target.originalRace) + ", but you’ve become "+indefiniteArticle(target.race())+" over the course of your adventures.");
		}
		output2(" You’re a good " + Math.floor(target.tallness / 12) + " feet");
		if(target.tallness % 12 != 0) output2(" and " + Math.round(target.tallness % 12) + " inches");
		output2(" tall by ancient imperial measurements and " + Math.round(target.tallness * 0.0254 * 100)/100 + " meters in the more accepted metric system.");
		output2(" Right now, you’re");
		if(target.isNude() || target.armor is EmptySlot) output2(" not wearing a single scrap of armor,");
		else output2(" wearing " + target.armor.description + ",");
		if(target.isNude() || target.lowerUndergarment is EmptySlot) output2(" going commando down south,");
		else output2(" using " + target.lowerUndergarment.description + " for underwear,");
		if(target.isNude() || target.upperUndergarment is EmptySlot) output2(" and letting your torso breathe, unrestricted by any undertop.");
		else output2(" and girding your upper body with " + target.upperUndergarment.description + ".");
		if(!target.isNude() && ((target.isChestExposed() && target.hasBreasts()) || target.isCrotchExposed() || target.isAssExposed()))
		{
			output2(" Your outfit leaves little to the imagination, exposing your");
			if (target.isChestExposed() && target.hasBreasts())
			{
				output2(" breasts");
				if(target.isCrotchExposed() && target.isAssExposed()) output2(",");
				else if(target.isCrotchExposed() || target.isAssExposed()) output2(" and");
			}
			if(target.isCrotchExposed())
			{
				output2(" crotch");
				if(target.isAssExposed()) output2(" and");
			}
			if(target.isAssExposed()) output2(" ass");
			output2(" to the world.");
		}
		if(target.isChestExposed() && target.isCrotchExposed() && target.isAssExposed()) {
			if(target.exhibitionism() >= 100) output2(" You’re a shameless exhibitionist and proud of it, flaunting your naked body and giving the entire galaxy quite an eyeful!");
			else if(target.exhibitionism() >= 66) output2(" Your naked body is like a second outfit for you, giving you naughty thoughts when in the public’s gaze.");
			else if(target.exhibitionism() >= 50) output2(" Maybe you’re some kind of nudist, but it’s not like you mind being naked anyway.");
			else if(target.exhibitionism() >= 33) output2(" It’s okay to show some nudity once in a while, right?");
			else if(target.exhibitionism() >= 20) output2(" If anyone sees you this way, you can’t help but be aroused a little.");
			else if(target.exhibitionism() >= 10) output2(" If anyone sees you now, they’re sure to think you’re a nudist...");
			else output2(" If anyone sees you now, they’re sure to think you’re a nudist!");
		}

		//Face
		output2("\n\n");
		if(InCollection(target.faceType, GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_NALEEN_FACE, GLOBAL.TYPE_SHARK, GLOBAL.TYPE_SIREN, GLOBAL.TYPE_LAPINE)) {
			if(target.hasFaceFlag(GLOBAL.FLAG_SMOOTH) || target.faceType == GLOBAL.TYPE_NALEEN_FACE || InCollection(target.skinType, GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO, GLOBAL.SKIN_TYPE_LATEX)) output2("Your face is human in shape and structure, with " + target.skin(true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2("Under your " + target.skinFurScales(true,true) + " you have a human-shaped head with " + target.skin(true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("Your face is fairly human in shape, but is covered in " + target.skinFurScales(true,true) + " over " + target.skin(true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS) output2("Your face is human-shaped with " + target.skin(true,true) + " and lightly framed with " + target.skinFurScales(true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_CHITIN) output2("Your face is mostly human in shape, decorated with " + target.skinFurScales(true,true) + " over " + target.skin(true,true) + ".");
			// Special addons
			if(target.faceType == GLOBAL.TYPE_SHARK || target.faceType == GLOBAL.TYPE_SIREN) output2(" A set of razor-sharp, retractable shark-teeth fill your mouth and gives your visage a slightly angular appearance.");
			else if(target.faceType == GLOBAL.TYPE_LAPINE) output2(" The constant twitches of your nose and the length of your incisors gives your visage a hint of bunny-like cuteness.");
			else if(target.faceType == GLOBAL.TYPE_NALEEN_FACE) output2(" A set of retractable, needle-like fangs sit in place of your canines, just like a naleen.");
			else if(target.faceType == GLOBAL.TYPE_HUMAN && target.hasStatusEffect("Mimbrane Face"))
			{
				if (target.statusEffectv3("Mimbrane Face") >= 3 && target.statusEffectv3("Mimbrane Face") < 8) output2(" Your lips appear slightly puffy.");
				else if (target.statusEffectv3("Mimbrane Face") >= 8 && target.statusEffectv3("Mimbrane Face") < 13) output2(" Your lips look deliciously pillowy.");
				else if (target.statusEffectv3("Mimbrane Face") >= 13) output2(" Your lips appear lusciously large and undeniably kissable.");
			}
		}
		else if(target.faceType == GLOBAL.TYPE_HUMANMASKED) {
			//appearance for skinheads
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.skinType != GLOBAL.SKIN_TYPE_SCALES) {
				output2("Your face is human in shape and structure, with " + target.skin(true,true));
				if(InCollection(target.skinTone, "black", "ebony", "sable") && InCollection(target.skinType, GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO)) output2(", though with your dusky hue, the black kui-tan mask you sport isn’t properly visible.");
				else output2(", though it is decorated with a sly-looking kui-tan mask over your eyes.");
			}
			//appearance furscales
			else {
				var furScaleColor:String = "";
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR) furScaleColor = target.furColor;
				else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) furScaleColor = target.scaleColor;
				//(black/midnight furscales)
				if(InCollection(furScaleColor, "black", "midnight")) output2("Under your " + target.skinFurScales(true,true) + " hides a black kui-tan mask, barely visible due to your inky hue, and");
				else 
				{
					if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" Your " + target.skinFurScales(true,true) + " are decorated with a sly-looking kui-tan mask, and under them");
					else output2(" Your " + target.skinFurScales(true,true) + " is decorated with a sly-looking kui-tan mask, and under it");
				}
				output2(" you have a human-shaped head with " + target.skin(true,true) + ".");
			}
		}
		else if(target.faceType == GLOBAL.TYPE_KUITAN) {
			output2("You have a triangular kui-tan face, replete with sensitive whiskers and a little black nose; a mask shades the space around your eyes, set apart from your " + target.skinFurScales() + " by a band of white.");
			//(if skin)
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN) output2(" It looks a bit strange with only the skin and no fur.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" The presence of said scales gives your visage an eerie look, more reptile than mammal.");
		}
		else if(target.faceType == GLOBAL.TYPE_VULPINE) {
			output2("You have a tapered, shrewd-looking vulpine face with a speckling of downward-curved whiskers just behind the nose.");
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN) output2(" Oddly enough, there’s no fur on your animalistic muzzle, just " + target.skinFurScales(true,true) + "."); 
			else if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" A coat of " + target.skinFurScales(true,true) + " decorates your muzzle.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" Strangely, " + target.skinFurScales(true,true) + " adorn every inch of your animalistic visage.");
		}
		else if(target.faceType == GLOBAL.TYPE_MOUSEMAN) {
			//appearance
			output2("Your face is generally human in shape and structure, with " + target.skin(true,true));
			if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS)) output2(" under your " + target.skinFurScales(true,true));
			output2(" and mousey buckteeth.");
		}
		else if(target.faceType == GLOBAL.TYPE_MOUSE) {
			//appearance
			output2("You have a snubby, tapered mouse’s face, with whiskers, a little pink nose, and ");
			if(!InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_FEATHERS)) output2(target.skin(true,true));
			else output2(target.skin(true,true) + " under your " + target.skinFurScales(true,true));
			output2(". Two large incisors complete it.");
		}
		//Naga (same as snake)
		else if(target.faceType == GLOBAL.TYPE_SNAKE) {
			output2("You have a face that resembles a combination between a human’s and a snake’s,");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" covered in a layer of " + target.skinFurScales(true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" covered in " + target.skinFurScales(true,true) + ", as one would expect of such a reptilian visage.");
			else output2(" oddly uncovered by scales. Instead, your snake-like snout is covered in " + target.skin(true,true) + ".");
			if(rand(2) == 0) output2(" A set of retractable, needle-like fangs sit in place of your canines and are ready to dispense their venom.");
			else output2(" In addition, a pair of poisonous fangs protrude from your mouth over your lower lip.");
		}
		//horse-face
		else if(target.faceType == GLOBAL.TYPE_EQUINE) {
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2("Your face is almost entirely equine in appearance, even having " + target.skinFurScales() + ". Underneath the fur, you believe you have " + target.skin(true,false) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("You have the face and head structure of a horse, overlaid with " + target.skinFurScales(true,true) + ".");
			else output2("Your face is equine in shape and structure. The odd visage is hairless and covered with " + target.skinFurScales(true,true) + ".");
		}
		//dog-face
		else if(target.faceType == GLOBAL.TYPE_CANINE) {
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2("You have a dog’s face, complete with wet nose and panting tongue. You’ve got " + target.skinFurScales(true,true) + ", hiding your " + target.skin(true,true) + " underneath your furry visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("You have the facial structure of a dog, wet nose and all, but overlaid with " + target.skinFurScales(true,true) + ".");
			else output2("You have a dog-like face, complete with a wet nose. The odd visage is hairless and covered with " + target.skinFurScales(true,true) + ".");
		}
		//cat-face
		else if(target.faceType == GLOBAL.TYPE_FELINE) {
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2("You have a cat-like face, complete with moist nose and whiskers. Your " + target.skinFurScales(true,true) + " hides " + target.skin(true,true) + " underneath.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("Your facial structure blends humanoid features with those of a cat. A moist nose and whiskers are included, but overlaid with " + target.skinFurScales(true,true) + ".");
			else output2("You have a cat-like face, complete with a cute, moist nose and whiskers. The " + target.skin(true,true) + " that is revealed by your lack of fur looks quite unusual on so feline a face.");
		}
		//Minotaaaauuuur-face
		else if(target.faceType == GLOBAL.TYPE_BOVINE) {
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2("You have a face resembling that of an anthropomorphic bovine, with cow-like features, particularly a squared off wet nose. Your " + target.skinFurScales(true,true) + " thickens noticably on your head, looking shaggy and more than a little monstrous once laid over your visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("Your face resembles an anthropomorphic bovine’s, though strangely, it is covered in shimmering scales, right up to the flat, cow-like nose that protrudes from your face.");
			else output2("You have a face resembling that of an anthropomorphic bovine, with cow-like features, particularly a squared off wet nose. Despite your lack of fur elsewhere, your visage does have a short layer of " + target.furColor + " fuzz.");
		}
		//Panda-face
		else if(target.faceType == GLOBAL.TYPE_PANDA) {
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2("You have a face resembling that of an anthropomorphic panda, with a short muzzle and black nose. Your " + target.skinFurScales(true,true) + " hides " + target.skin(true,true) + " underneath.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("Your face resembles an anthropomorphic panda’s, though strangely, it is covered in shimmering scales, right up to your black nose.");
			else output2("You have a face resembling that of an anthropomorphic panda, with a short muzzle and black nose. Despite your lack of fur elsewhere, your visage does have a short layer of " + target.furColor + " fuzz.");
		}
		//Lizard-face
		else if(target.faceType == GLOBAL.TYPE_LIZAN) {
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2("You have a face resembling that of a lizard. Between the toothy maw, pointed snout, and the layer of " + target.skinFurScales(true,true) + " covering your face, you have quite the fearsome visage.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("Your face is that of a lizard, complete with a toothy maw and pointed snout. " + StringUtil.upperCase(target.skinFurScales(true,true)) + " complete the look, making you look quite fearsome.");
			else output2("You have a face resembling that of a lizard, and with your toothy maw, you have quite a fearsome visage. The reptilian visage does look a little odd with just " + target.skin(true,true) + " and not a single scale.");
		}
		else if(target.faceType == GLOBAL.TYPE_BADGER)
		{
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2("Your head pushes out into a muzzle with white fur across your nose and mouth as well as in a wide stripe up the center of your brow, giving you the appearance of a humanoid badger. The rest of it is wrapped in " + target.skinFurScales(true,true) + " that covers your " + target.skin(true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("Your head pushes out into a muzzle with white scales across your nose and mouth as well as in a wide stripe up the center of your brow, giving you the appearance of a humanoid, scaled badger. The rest of it is wrapped in " + target.skinFurScales(true,true) + " that covers your " + target.skin(true,true) + ".");
			else output2("Your head pushes out into a curiously hairless badger-face, covered only with " + target.skin(true,true) + ".");
		}
		else if(target.faceType == GLOBAL.TYPE_DRACONIC) {
			output2("Your face is a narrow, reptilian muzzle. It looks like a predatory lizard’s at first glance, but with an unusual array of spikes along the under-jaw. It gives you a regal but fierce visage. Opening your mouth reveals several rows of dagger-like sharp teeth. The fearsome visage is decorated by " + target.skinFurScales(true,true) + ".");
		}
		else if(target.faceType == GLOBAL.TYPE_KANGAROO) {
			output2("Your face is shaped like that of a kangaroo ");
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN) output2("but bald, not covered in fur");
			else output2("and covered with " + target.skinFurScales(true,true));
			output2(". It’s almost rabbit-like, except for the length of your muzzle.");
		}
		else if(target.faceType == GLOBAL.TYPE_GABILANI) {
			output2("You have a narrow-jawed gabilani face");
			if(target.skinType != GLOBAL.SKIN_TYPE_SKIN) output2(", covered in " + target.skinFurScales(true,true));
			else output2(", covered with " + target.skinFurScales(true,true));
			output2(", appearing almost goblinoid with alien facial features.");
		}
		else if(target.faceType == GLOBAL.TYPE_FROG)
		{
			output2("Your face is anuran in shape, reflecting the frog-like transformations you’ve undergone. The smooth visage is further exaggerated with a notable lack of a nose, having broadly spaced nostrils instead.");
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(" Your face is covered in " + target.skin(true,true) + ".");
			else output2(" Strangely enough, your face is also covered with " + target.skin(true,true) + ".");
		}
		// Special face additions
		if(target.hasStatusEffect("Naoki Stripe") && pc.skinTone != "purple") output2(" A distinctive purple stripe runs across the bridge of your nose.");
		//M/F stuff!
		output2(" Overall, your visage has " + target.faceDesc() + ".");
		//Eyes
		var hasMetallicEyes:Boolean = InCollection(target.eyeColor, "copper", "silver", "gold", "platinum", "sable");
		var hasGemstoneEyes:Boolean = InCollection(target.eyeColor, "crimson", "garnet", "ruby", "citrine", "topaz", "amber", "peridot", "emerald", "jade", "turquoise", "aquamarine", "lapis", "sapphire", "violet", "amethyst", "opal", "pearl");
		var hasLuminousEyes:Boolean = (target.eyeColor.indexOf("luminous") != -1 || target.eyeColor.indexOf("glowing") != -1);
		if (target.eyeType == GLOBAL.TYPE_ARACHNID)
		{
			output2(" In addition to your primary two eyes, you have a second, smaller pair on your forehead");
			if (hasMetallicEyes) output2(", all of which reflect back a metallic " + target.eyeColor + " in the light.");
			else if (hasGemstoneEyes) output2(", all of which shimmer " + target.eyeColor + " in the light like jewels.");
			else if (hasLuminousEyes) output2(", all of which beam " + target.eyeColor + " in the darkness.");
			else output2(", all of which are " + target.eyeColor + ".");
		}
		else if (target.eyeType == GLOBAL.TYPE_BEE)
		{
			if (target.eyeColor == "gold") output2(" Your eyes are completely pitch black with the exception of your vibrant golden irises.");
			else if (target.eyeColor != "black") output2(" Your eyes are pitch black with " + target.eyeColor + " irises.");
			else output2(" The black sclera and iris of both of your eyes make them appear as solid black and very alien.");
			output2(" Their structure allows you to have a larger angle of vision as well as detecting the fastest of movements.");
		}
		else if (target.eyeType == GLOBAL.TYPE_FELINE || target.eyeType == GLOBAL.TYPE_SNAKE || target.eyeType == GLOBAL.TYPE_DEMONIC)
		{
			output2(" Your eyes bear a vertical slit instead of rounded pupils, ");
			if (hasMetallicEyes) output2("surrounded by a metallically glistening " + target.eyeColor + " iris");
			else if (hasGemstoneEyes) output2("surrounded by a gem-like shimmering " + target.eyeColor + " iris");
			else if (hasLuminousEyes) output2("surrounded by a brightly " + target.eyeColor + " iris");
			else output2("surrounded by " + indefiniteArticle(target.eyeColor) + " iris");
			if (target.eyeType != GLOBAL.TYPE_DEMONIC)
			{
				output2(".");
			}
			else
			{
				output2(" and nestled within the inky blackness of your eyeball proper.");
			}
		}
		else if (target.eyeType == GLOBAL.TYPE_LEITHAN)
		{
			output2(" Your eyes each feature a secondary pupil, ");
			if (target.eyeColor == "blue")
			{
				output2("forming an intensely striking symbol of infinity nestled as they are amongst a single brilliantly bright blue iris.");
			}
			else if (hasMetallicEyes) output2("both embedded in a single, overly large metallical " + target.eyeColor + " iris.");
			else if (hasGemstoneEyes) output2("both embedded in a single shimmering " + target.eyeColor + " iris.");
			else if (hasLuminousEyes) output2("both embedded in a single brightly " + target.eyeColor + " iris.");
			else output2("surrounded by a single " + target.eyeColor + " iris.");
		}
		else if (target.eyeType == GLOBAL.TYPE_MYR)
		{
			output2(" Your eyes are gleaming, solid " + target.eyeColor + " orbs that seem to give little away.");
		}
		else if (target.eyeType == GLOBAL.TYPE_NYREA)
		{
			output2(" Your eyes are solid " + target.eyeColor + " in color. They are well adapted to low light environments, befitting a cave-dwelling species like the nyrea.");
		}
		else if (target.eyeType == GLOBAL.TYPE_GABILANI)
		{
			if (target.eyeColor == "black") output2(" Your alien eyes are dark as the void, with irises that are completely black and indistinguishible from the pupils themselves, making you appear disconcerting from afar.");
			else output2(" Your eyes are completely " + target.eyeColor + ", with irises of the same color and indistinguishible from the pupils themselves, making you appear quite alien.");
		}
		else if (target.eyeType == GLOBAL.TYPE_FROG)
		{
			if (target.eyeColor == "black") output2(" Void black eyes with glowing iridescent");
			else
			{
				if (hasMetallicEyes) output2(" Metallically glistening " + target.eyeColor);
				else if (hasGemstoneEyes) output2(" Like jewels, shimmering " + target.eyeColor);
				else if (hasLuminousEyes) output2(" Like twinkling beacons, " + target.eyeColor);
				else output2(" " + StringUtil.capitalize(target.eyeColor));
				output2(" eyes with dark");
			}
			output2(" ‘plus’-shaped pupils assess your surroundings with little issue.");
		}
		else if (target.eyeType == GLOBAL.TYPE_SYNTHETIC)
		{
			if (target.eyeColor == "black") output2(" Your eyes are pitch black with digitally-projected glowing white squares that form each iris,");
			else
			{
				output2(" Your eyes are mapped like a printed circuit board and ");
				if (hasMetallicEyes) output2(" glisten with rings of metallic " + target.eyeColor);
				else if (hasGemstoneEyes) output2(" light up with rings of shimmering " + target.eyeColor);
				else if (hasLuminousEyes) output2(" pulse to life with rings of " + target.eyeColor);
				else output2(" are decorated with rings of " + StringUtil.capitalize(target.eyeColor));
				output2(" around each iris,");
			}
			output2(" giving them a very synthetic appearance.");
		}
		else
		{
			if (hasMetallicEyes) output2(" Metallically glistening " + target.eyeColor + " eyes allow you to take in your surroundings without trouble.");
			else if (hasGemstoneEyes) output2(" Like jewels, shimmering " + target.eyeColor + " eyes allow you to take in your surroundings without trouble.");
			else if (hasLuminousEyes) output2(" Like twinkling beacons, " + target.eyeColor + " eyes seem to draw the attention of everyone around you.");
			else
			{
				if (rand (10) == 0) output2(" Fairly unremarkable " + target.eyeColor);
				else if (rand(3) == 0) output2(" Regular " + target.eyeColor);
				else if (rand(2) == 0) output2(" Normal-looking " + target.eyeColor);
				else output2(" " + StringUtil.capitalize(target.eyeColor) + "-colored");
				output2(" eyes allow you to take in your surroundings without trouble.");
			}
		}
		//Hair
		//if bald
		if(target.hairLength == 0) {
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" You have no hair, only a thin layer of fur atop of your head. ");
			else output2(" You have no hair, showing only shiny " + target.skinFurScales() + " where your hair should be.");
			if(target.earType == GLOBAL.TYPE_EQUINE) output2(" A pair of horse-like ears rise up from the top of your skull.");
			else if(target.earType == GLOBAL.TYPE_CANINE) output2(" A pair of pointed ausar-like ears protrude from your skull, pointed and alert.");
			else if(target.earType == GLOBAL.TYPE_BOVINE) output2(" A pair of round, floppy cow ears protrude from the sides of your skull.");
			else if(target.earType == GLOBAL.TYPE_DRIDER) output2(" A pair of large pointy ears stick out from your skull.");
			else if(target.earType == GLOBAL.TYPE_FELINE)
			{
				output2(" A pair of cute");
				if(target.skinType != GLOBAL.SKIN_TYPE_GOO) output2(", fuzzy");
				output2(" cat-like ears have sprouted from the top of your skull.");
			}
			else if(target.earType == GLOBAL.TYPE_LIZAN) output2(" A pair of rounded protrusions with small holes on the sides of your skull serve as your ears.");
			else if(target.earType == GLOBAL.TYPE_LAPINE || target.earType == GLOBAL.TYPE_LEITHAN) output2(" A pair of floppy rabbit ears stick up from the top of your skull, flopping around as you [target.walk].");
			else if(target.earType == GLOBAL.TYPE_KANGAROO)
			{
				output2(" A pair of long");
				if(target.skinType != GLOBAL.SKIN_TYPE_GOO) output2(", furred");
				output2(" kangaroo ears stick out from your skull at an angle.");
			}
			else if(target.earType == GLOBAL.TYPE_VULPINE) output2(" A pair of large, adept fox ears sit high on your skull, always listening.");
			else if(target.earType == GLOBAL.TYPE_DEER) output2(" A pair of pointed, oval-shaped ears poke out from the sides of your skull, flicking and flopping about, making you look very much like a deer.");
			else if(target.earType == GLOBAL.TYPE_DRACONIC) output2(" A pair of rounded protrusions with small holes on the sides of your skull serve as your ears. Bony fins sprout behind them.");
			else if(target.earType == GLOBAL.TYPE_KUITAN)
			{
				output2(" A pair of vaguely egg-shaped");
				if(target.skinType != GLOBAL.SKIN_TYPE_GOO) output2(", furry");
				output2(" raccoon ears adorns your skull.");
			}
			else if(target.earType == GLOBAL.TYPE_MOUSE) output2(" A pair of large, dish-shaped mouse ears tops your skull.");
			else if(target.earType == GLOBAL.TYPE_VANAE) output2(" A pair of pointed, finned ears tops your skull.");
			else if(target.earType == GLOBAL.TYPE_PANDA) output2(" A pair of rounded, panda-like ears protrude from your skull, " + target.mf("standing tall and proud","looking absolutely adorable") + ".");
			else if(target.earType == GLOBAL.TYPE_RASKVEL)
			{
				output2(" A pair of");
				if(target.earLength >= (target.tallness * 0.6)) output2(" " + num2Text(target.earLength) + "-inch");
				output2(" long raskvel ears dangle from your skull down past your waist.");
			}
			else if(target.earType == GLOBAL.TYPE_SYLVAN) 
			{
				if(target.earLength <= 1) output2(" A pair of mostly-human ears with slightly pointed tips protrude from the sides of your skull, just like a fantasy elf’s.");
				//2-4 inches: 
				else if(target.earLength <= 4) output2(" A pair of triangular, elven ears protrude from the sides of your skull, sticking out a full " + num2Text(target.earLength) + " inches from the sides of your head. Small extra muscles let them twitch or droop expressively.");
				//5+ inches:
				else output2(" A pair of exquisitely long, elf-like ears extend a full " + num2Text(target.earLength) + " inches from the sides of your head, triangular in shape with a bit of downward curve along their length. A thought is all it takes for them to change their angle to suit your expression, letting even the most rugged face pull off a cutesy pout with ease.");
			}
			else if(target.earType == GLOBAL.TYPE_GABILANI)
			{
				output2(" A pair of long, triangular goblin ears point outwards");
				if(target.earLength > 1) output2(" " + num2Text(target.earLength) + " inches from your");
				output2(" from your skull.");
			}
			else if(target.earType == GLOBAL.TYPE_DEMONIC)
			{
				output2(" A pair of wicked-looking ears point outwards");
				if(target.earLength > 1) output2(" " + num2Text(target.earLength) + " inches from your");
				output2(" from your skull.");
			}
			else if(target.earType == GLOBAL.TYPE_FROG) output2(" A pair of small indented holes on the sides of your skull make up your ears.");
			if(target.hasAntennae())
			{
				if(target.antennae == 1) output2(" A floppy [target.antenna] also appears");
				else if(rand(2) == 0) output2(" " + StringUtil.capitalize(num2Text(target.antennae)) + " floppy [target.antennae] also grow");
				else output2(" Floppy [target.antennae] also appear");
				output2(" on your head, bouncing and swaying in the breeze.");
			}
		}
		//not bald
		else {
			if(target.earType == GLOBAL.TYPE_HUMAN) output2(" Your " + target.hairDescript(true,true) + " looks good on you, accentuating your features well.");
			else if(target.earType == GLOBAL.TYPE_EQUINE) output2(" The " + target.hairDescript(true,true) + " on your head parts around a pair of very horse-like ears that grow up from your head.");
			else if(target.earType == GLOBAL.TYPE_CANINE) output2(" The " + target.hairDescript(true,true) + " on your head is overlapped by a pair of pointed dog ears.");
			else if(target.earType == GLOBAL.TYPE_BOVINE) output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of rounded cow ears that stick out sideways.");
			else if(target.earType == GLOBAL.TYPE_DRIDER) output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of cute pointed ears, bigger than your old human ones.");
			else if(target.earType == GLOBAL.TYPE_FELINE)
			{
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of cute");
				if(target.skinType != GLOBAL.SKIN_TYPE_GOO) output2(", fuzzy");
				output2(" feline ears, sprouting from atop your head and pivoting towards any sudden noises.");
			}
			else if(target.earType == GLOBAL.TYPE_LIZAN) output2(" The " + target.hairDescript(true,true) + " atop your head makes it nigh-impossible to notice the two small rounded openings that are your ears.");
			else if(target.earType == GLOBAL.TYPE_LAPINE || target.earType == GLOBAL.TYPE_LEITHAN) output2(" A pair of floppy rabbit ears stick up out of your " + target.hairDescript(true,true) + ", bouncing around as you [target.walk].");
			else if(target.earType == GLOBAL.TYPE_KANGAROO)
			{
				output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of long");
				if(target.skinType != GLOBAL.SKIN_TYPE_GOO) output2(", furred");
				output2(" kangaroo ears that stick out at an angle.");
			}
			else if(target.earType == GLOBAL.TYPE_VULPINE) output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of large, adept fox ears that always seem to be listening.");
			else if(target.earType == GLOBAL.TYPE_DEER) output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of rounded ears that point out sideways, flicking and flopping about, making you look very much like a deer.");
			else if(target.earType == GLOBAL.TYPE_DRACONIC) output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of rounded protrusions with small holes on the sides of your head serve as your ears. Bony fins sprout behind them.");
			else if(target.earType == GLOBAL.TYPE_KUITAN)
			{
				output2(" The " + target.hairDescript(true,true) + " on your head parts around a pair of egg-shaped");
				if(target.skinType != GLOBAL.SKIN_TYPE_GOO) output2(", furry");
				output2(" raccoon ears.");
			}
			else if(target.earType == GLOBAL.TYPE_MOUSE) output2(" The " + target.hairDescript(true,true) + " atop your head is funneled between and around a pair of large, dish-shaped mouse ears that stick up prominently.");
			else if(target.earType == GLOBAL.TYPE_VANAE) output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of pointed, fin-like ears, sensitive to the slightest sound.");
			else if(target.earType == GLOBAL.TYPE_PANDA) output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of round panda ears.");
			else if(target.earType == GLOBAL.TYPE_RASKVEL)
			{
				output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of");
				if(target.earLength >= (target.tallness * 0.6)) output2(" " + num2Text(target.earLength) + "-inch");
				output2(" long raskvel ears that dangle down past your waist.");
			}
			else if(target.earType == GLOBAL.TYPE_SYLVAN) 
			{
				if(target.earLength <= 1) output2(" The " + target.hairDescript(true,true) + " on your head nearly conceals a pair of mostly-human ears with slightly pointed tips, just like a fantasy elf’s.");
				//2-4 inches: 
				else if(target.earLength <= 4) output2(" The " + target.hairDescript(true,true) + " on your head can’t hide a pair of triangular, elven ears. They stick out a full " + num2Text(target.earLength) + " inches from the sides of your head. Small extra muscles let them twitch or droop expressively.");
				//5+ inches:
				else output2(" The " + target.hairDescript(true,true) + " atop your head can’t possibly hide a pair of exquisitely long, elf-like ears. They extend a full " + num2Text(target.earLength) + " inches from the sides of your head, triangular in shape with a bit of downward curve along their length. A thought is all it takes for them to change their angle to suit your expression, letting even the most rugged face pull off a cutesy pout with ease.");
			}
			else if(target.earType == GLOBAL.TYPE_GABILANI)
			{
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of");
				if(target.earLength > 1) output2(" " + num2Text(target.earLength) + "-inch");
				output2(" long, triangular goblin ears.");
			}
			else if(target.earType == GLOBAL.TYPE_DEMONIC)
			{
				output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of");
				if(target.earLength > 1) output2(" " + num2Text(target.earLength) + "-inch long,");
				output2(" wicked-looking demonic ears.");
			}
			else if(target.earType == GLOBAL.TYPE_FROG) output2(" The " + target.hairDescript(true,true) + " atop your head covers the two small openings that make up your ears.");
			if(target.hasAntennae())
			{
				if(target.earType == GLOBAL.TYPE_LAPINE)
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
		if(target.earType == GLOBAL.TYPE_LEITHAN)
		{
			output2(" In addition,");
			if(target.earLength > 1) output2(" " + num2Text(target.earLength) + "-inch long");
			output2(" pointed elfin ears jut out below them, giving you exceptional hearing.");
		}
		//Tongue
		if(target.tongueType == GLOBAL.TYPE_SNAKE) output2(" A snake-like [target.tongueNoun] occasionally flits between your lips, tasting the air.");
		else if(target.tongueType == GLOBAL.TYPE_DEMONIC) output2(" A slowly undulating [target.tongueNoun] occasionally slips from between your lips. It hangs nearly two feet long when you let the whole thing slide out, though you can retract it to appear normal.");
		else if(target.tongueType == GLOBAL.TYPE_DRACONIC) output2(" Your mouth contains a thick, fleshy [target.tongueNoun] that, if you so desire, can telescope to a distance of about four feet. It has sufficient manual dexterity that you can use it almost like a third arm.");
		else if(target.tongueType == GLOBAL.TYPE_LEITHAN) output2(" Your mouth contains a narrow but flexible [target.tongueNoun] that, if you so desire, can extend a good distance out from your mouth. Its tip is forked, and you are capable of moving it around in an almost prehensile manner.");
		else if(target.tongueType == GLOBAL.TYPE_RASKVEL) output2(" Your mouth contains a thick, purple tongue that, if you so desire, can extend a fair portion from your mouth. Its tip is blunted slightly.");
		else if(target.tongueType == GLOBAL.TYPE_OVIR)
		{
			if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) output2(" A lengthy, tapered tongue fills your mouth, able to stretch out almost nine inches in order to taste the very air.");
			else output2(" A tapered tongue fills your mouth, able to taste the very air when extended beyond your oral cavity.");
		}
		else if(target.tongueType == GLOBAL.TYPE_BEE) output2(" Your mouth contains a long, bright yellow [target.tongueNoun] that can extend a foot past past your [target.lips] when fully extended. The tip has a tube inside it, capable of gathering sweet nectar from jungle flowers or lovers.");
		else if(target.tongueType == GLOBAL.TYPE_FROG)
		{
			if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) output2(" Your mouth contains a long and stretchy frog tongue, capable of reaching much longer distances than most races.");
			else output2(" Your mouth contains a stretchy frog-like tongue.");
		}
		else if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) output2(" Your mouth contains a lengthy tongue.");
		else output2(" Your mouth contains a [target.tongue].");

		//Horns
		if(target.horns > 0)
		{
			//Demonic horns
			if(target.hornType == GLOBAL.TYPE_DEMONIC) {
				if(target.horns <= 2) output2(" A small pair of pointed horns has broken through the " + target.skin() + " on your forehead, proclaiming some demonic taint to any who see them.");
				else if(target.horns <= 4) output2(" A quartet of prominent horns has broken through your " + target.skin() + ". The back pair are longer, and curve back along your head. The front pair protrude forward demonically.");
				else if(target.horns <= 6) output2(" Six horns have sprouted through your " + target.skin() + ", the back two pairs curve backwards over your head and down towards your neck, while the front two horns stand almost eight inches long upwards and a little forward.");
				else output2(" A large number of thick demonic horns sprout through your " + target.skin() + ", each pair sprouting behind the ones before. The front jut forwards nearly " + num2Text(target.hornLength) + " inches while the rest curve back over your head, some of the points ending just below your ears. You estimate you have a total of " + num2Text(target.horns) + " horns.");
			}
			//Minotaur horns
			if(target.hornType == GLOBAL.TYPE_BOVINE) {
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
			}
			//Lizard horns
			else if(target.hornType == GLOBAL.TYPE_LIZAN || target.hornType == GLOBAL.TYPE_DRACONIC) {
				if(target.horns == 2 && target.hornType != GLOBAL.TYPE_DRACONIC) output2(" A pair of " + num2Text(int(target.hornLength)) + "-inch horns grow from the sides of your head, sweeping backwards and adding to your imposing visage.");
				//Super lizard horns
				else output2(" Two pairs of horns, roughly a foot long, sprout from the sides of your head. They sweep back and give you a fearsome look, almost like the dragons from terran legends.");
			}
			//Antlers!
			else if(target.hornType == GLOBAL.TYPE_DEER) {
				if(target.horns > 0) output2(" Two antlers, forking into " + num2Text(target.horns) + " points, have sprouted from the top of your head, forming a spiky, regal crown of bone.");
			}
			//Goatliness is next to godliness.
			else if(target.hornType == GLOBAL.TYPE_GOAT)
			{
				if(target.horns > 0) output2(" Two curled ram horns twist back from your forehead, curling over your [target.ears] like a satyr out of terran legend.");
			}
			//Rhinoceros horn!
			else if(target.hornType == GLOBAL.TYPE_RHINO)
			{
				// Default
				if(target.horns == 1) output2(" A thick, wide keratin horn emerges from your forehead, " + num2Text(int(target.hornLength)) + "-inches long and sporting a slight upward curve.");
				// More rhino-esque
				else if(target.horns == 2) output2(" Protruding from the bridge of your nose, a thick, " + num2Text(int(target.hornLength)) + "-inch long keratin horn emerges, sporting a slight upward curve and followed by a smaller, smoother bump of horn right behind it.");
				// Triceratops!
				else if(target.horns == 3) output2(" Two thick, wide keratin horns emerge from your forehead, " + num2Text(int(target.hornLength)) + "-inches long with a slight upward curve. A third, smaller horn protrudes from, and perpendicular to, your nose bridge.");
				// Too many horns...
				else output2(" Thick, keratin horns emerge from your forehead and face, all varying sizes, with the largest at about " + num2Text(int(target.hornLength)) + "-inches long. They all protrude forward and slightly curve upwards, creating a very menacing pincusion-like visage.");
			}
			//Unicorn horn!
			else if(target.hornType == GLOBAL.TYPE_NARWHAL)
			{
				if(target.horns > 0) output2(" A slender ivory horn extends from your forehead, " + num2Text(int(target.hornLength)) + "-inches long with a spiral pattern of ridges and grooves up its length, giving it a graceful appearance.");
			}
		}
		else if(target.hasStatusEffect("Horn Bumps")) output2(" <b>Your forehead is red and irritated in two different places. The upraised bumps stand out quite visibly.</b>");
		//BODY PG HERE
		output2("\n\nYou have a humanoid upper body with the usual torso, arms, hands, and fingers");
		if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(", mostly covered in a layer of " + target.skinFurScales(true, true));
		else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(", covered in a layer of " + target.skinFurScales(true, true));
		else if(target.skinType == GLOBAL.SKIN_TYPE_CHITIN) output2(", covered in a layer of " + target.skinFurScales(true, true));
		else if(target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(", all of them glittering, semi-transparent goo");
		if(target.wingType != GLOBAL.TYPE_HUMAN) {
			output2(", and ");
			//WINGS!
			if(target.wingType == GLOBAL.TYPE_SMALLBEE || target.wingType == GLOBAL.TYPE_MYR) output2("a pair of insect-like wings sprout from your back, too small to allow you to fly. They shimmer beautifully in the light.");
			else if(target.wingType == GLOBAL.TYPE_BEE) output2("a pair of large, insectile wings sprout from your back, reflecting the light through their clear membranes beautifully. They’ll bear your weight if you choose to fly.");
			else if(target.wingType == GLOBAL.TYPE_SMALLDEMONIC) output2("a pair of tiny bat-like demon-wings sprout from your back, flapping cutely, otherwise of little use.");
			else if(target.wingType == GLOBAL.TYPE_DEMONIC) output2("a pair of large bat-like demon-wings fold behind your shoulders. With a muscle-twitch, you can extend them, and use them to soar gracefully through the air.");
			else if(target.wingType == GLOBAL.TYPE_SHARK) output2("a large shark-like fin has sprouted between your shoulder blades. With it you have far more control over swimming underwater.");
			else if(target.wingType == GLOBAL.TYPE_AVIAN) output2("a pair of large, feathery wings sprout from your back. Though you usually keep the " + target.hairColor + "-colored wings folded close, they can unfurl to allow you to soar as gracefully as a bird.");
			else if(target.wingType == GLOBAL.TYPE_SMALLDRACONIC) output2("small, vestigial wings sprout from your shoulders. They might look like bat’s wings, but the membranes are covered in fine, delicate scales.");
			else if(target.wingType == GLOBAL.TYPE_DRACONIC) output2("magnificent wings sprout from your shoulders. When unfurled they stretch further than your arm span, and a single beat of them is all you need to set out toward the sky. They look a bit like bat’s wings, but the membranes are covered in fine, delicate scales and a wicked talon juts from the end of each bone.");
			else if(target.wingType == GLOBAL.TYPE_DRAGONFLY) output2("giant dragonfly wings hang from your shoulders. At a whim, you could twist them into a whirring rhythm fast enough to lift you off the ground and allow you to fly.");
			else if(target.wingType == GLOBAL.TYPE_SYLVAN) output2("a quartet of blue gossamer wings sprout from your back, displaying a prismatic sheen when they flap. Despite their delicate appearance they have no problem carrying you aloft, and can fold up safely against your back for protection.");
			else if(target.wingType == GLOBAL.TYPE_DARK_SYLVAN) output2("a quartet of gossamer wings sprout from your back, glittering black with a pattern that makes them look as though they’re coated in wisps of shadow when they flap. Despite their delicate appearance they have no problem carrying you aloft, and can fold up safely against your back for protection.");
			else if(target.wingType == GLOBAL.TYPE_DOVETWO) output2("a pair of [pc.furColor] wings adorn your back, feathered like a dove’s and big enough to be worn like a cloak when folded over your body. They’re strong enough to glide with, but nice and soft to the touch.");
			else if(target.wingType == GLOBAL.TYPE_DOVEFOUR) output2("four wings sprout from your back, each covered in wonderfully soft [pc.furColor] feathers and big enough to be worn like a robe when all four are folded over your body. They’re arranged so they don’t get in each other’s way when spread, thus you can still glide with them.");
			else if(target.wingType == GLOBAL.TYPE_DOVESIX) output2("six wings sprout from your back, each covered in wonderfully soft [pc.furColor] feathers and big enough to be worn like a luxurious ceremonial robe when all six are folded over your body, which you often find yourself doing to help with getting through tight spaces. Despite their sheer bulk, you can still glide with them.");
		}
		else output2(".");
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
				fluidLayer = target.statusEffectv1("Cum Soaked");
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
				fluidLayer = target.statusEffectv1("Pussy Drenched");
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
		//Vanaebutt Skin
		if(target.hasStatusEffect("Vanae Markings")) output2(" Swirls of " + target.skinAccent + " trace brighter accents across much of your form.");
		// Lube skin!
		if(target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED))
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
		//Wing arms
		if(target.armType == GLOBAL.TYPE_AVIAN)
		{
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Feather-shaped shingles of goo");
			else output2(" Feathers");
			output2(" hang off your arms from shoulder to wrist, giving them a slightly wing-like look.");
		}
		else if(target.armType == GLOBAL.TYPE_LEITHAN) 
		{
			output2(" Small claws protrude from the tips of your");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			output2(" fingers in place of fingernails");
			if (target.hasArmFlag(GLOBAL.FLAG_CHITINOUS)) output2(", and your arms are covered from fingertip to elbow with a thick layer of chitinous plates");
			else if (target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(", and your arms are covered in scales up to the shoulders");
			output2(".");
		}
		else if(target.armType == GLOBAL.TYPE_EQUINE)
		{
			output2(" Hard, hoof-like tips have grown in place of fingernails, covering the end of each");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			output2(" digit in shiny black. You can still feel through them all the same.")
		}
		else if(target.armType == GLOBAL.TYPE_CANINE) 
		{
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) output2(" A coat of " + target.furColor + " fur covers your arms, giving them a distinctly animalistic bent.");
			output2(" Your fingers are tipped with short, canine claws as well, just like one of the ausar.");
		}
		else if(target.armType == GLOBAL.TYPE_DEMONIC)
		{
			output2(" Your");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			else output2(" human-shaped");
			output2(" hands appear very demonic, tipped with sharp claws that seem to have replaced your fingernails.");
			if(target.hasArmFlag(GLOBAL.FLAG_CHITINOUS)) output2(" In addition, your forearms are covered by sleek plates of jet-black chitin along the outside of each arm. Smaller pentagonal plates trail up your upper arms and over your shoulders.");
			else if(target.hasArmFlag(GLOBAL.FLAG_SPIKED)) output2(" In addition, a set of short jet-black bone spikes grow along the outside of each forearm and out of the back of your elbows, giving you an incredibly imposing look.");
		}
		else if(InCollection(target.armType, GLOBAL.TYPE_ARACHNID, GLOBAL.TYPE_DRIDER, GLOBAL.TYPE_BEE, GLOBAL.TYPE_NYREA))
		{
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Shiny hardened " + target.scaleColor + " goo covers your arms from the biceps down, resembling a pair of long " + target.scaleColor + " gloves from a distance.");
			else output2(" Shining black exoskeleton covers your arms from the biceps down, resembling a pair of long black gloves from a distance.");
		}
		else if(target.armType == GLOBAL.TYPE_MYR)
		{
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Shiny hardened " + target.scaleColor + " goo");
			else output2(" Shining " + target.scaleColor + " exoskeleton");
			output2(" covers parts of your arms in a gleaming patchwork.");
		}
		else if(target.armType == GLOBAL.TYPE_FELINE) 
		{
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) output2(" A coat of " + target.furColor + " fur covers your arms, giving them a distinctly animalistic bent.");
			output2(" Your");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			output2(" hands are still largely human in shape and dexterity aside from the fairly feline claws that have replaced your fingernails.");
		}
		else if(target.armType == GLOBAL.TYPE_PANDA) 
		{
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) output2(" A coat of " + target.furColor + " fur covers your arms, giving them a distinctly animalistic bent.");
			output2(" Your");
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			output2(" fingers are thick and capped with bear-like claws but maintain their human opposability.");
		}
		else if(target.armType == GLOBAL.TYPE_KUITAN)
		{
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Your gooey arms end with gel-padded fingers. ");
			else if(!target.hasFur()) output2(" Dark brown pads rest on the tips of each of your fingers. ");
			else output2(" A coat of " + target.furColor + " fur covers your arms below the shoulders, and your fingers are tipped with dark brown pads. ");
			output2("They’re softer and more supple than the finest leather.");
		}
		else if(target.armType == GLOBAL.TYPE_BADGER) 
		{
			if(target.hasArmFlag(GLOBAL.FLAG_GOOEY)) output2(" Your gooey arms are tipped with clawed fingers.");
			else if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.hasArmFlag(GLOBAL.FLAG_FURRED)) output2(" A coat of thick " + target.furColor + " fur covers your arms while claws tip your fingers.");
			else output2(" Claws tip your fingers.");
			output2(" These claws aren’t very long or sharp, and you get the feeling that the only thing they’re truly useful for is digging into someone’s skin emphatically while you’re fucking them roughly.");
		}
		else if(target.armType == GLOBAL.TYPE_FROG) 
		{
			if(!target.hasFur() || !target.hasFeathers()) output2(" Your arms are incredibly smooth with a tendency to glisten in the light.");
			output2(" Your webbed hands are very amphibious in appearance. Each of your elongated fingers are capped with a round bulb, capable of sticking to flat surfaces like a suction cup.");
		}
		else if (target.hasStatusEffect("Mimbrane Hand Left") || target.hasStatusEffect("Mimbrane Hand Right"))
		{
			var bothHands:Boolean = false;
			feedVal = 0;

			if (target.hasStatusEffect("Mimbrane Hand Left") && target.hasStatusEffect("Mimbrane Hand Right")) bothHands = true;
			
			if (!bothHands)
			{
				if (target.hasStatusEffect("Mimbrane Hand Left")) feedVal = target.statusEffectv3("Mimbrane Hand Left");
				else feedVal = target.statusEffectv3("Mimbrane Hand Right");
			}
			else
			{
				//The feed values should be synced for hands, so use one of them!
				feedVal = target.statusEffectv3("Mimbrane Hand Right");
			}

			if (feedVal >= 3)
			{
				output2(" Your hand");
				if (bothHands) output2("s");
				output2(" appear");
				if (!bothHands) output2("s");
				if (feedVal < 8) output2(" to be slightly distended.");
				else if (feedVal < 13) output2(" puffy and inflated.");
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
		else if(target.legType == GLOBAL.TYPE_LIZAN && target.legCount == 6) output2(" From the waist down, you have a powerful, six-legged body that looks like a crossbreed of a lizard and a horse.");
		else if(target.isTaur())
		{
			output2(" From the waist down, you have a bestial, " + num2Text(target.legCount) + "-legged form vaguely like that of a");
			if(target.legType == GLOBAL.TYPE_BOVINE) output2(" " + target.mf("bull","cow") + ".");
			else output2(" horse.");
		}
		//Hip info only displays if you aren't a centaur. 
		if(!target.isTaur()) {
			if(target.thickness > 70) {
				output2(" You have " + target.hipsDescript());
				if(target.hipRating() < 6) {
					if(target.tone < 65) output2(" buried under a noticeable muffin-top, and");
					else output2(" that blend into your pillar-like waist, and");
				}
				if(target.hipRating() >= 6 && target.hipRating() < 10) output2(" that blend into the rest of your thick form, and");
				if(target.hipRating() >= 10 && target.hipRating() < 15) output2(" that would be much more noticeable if you weren’t so wide-bodied, and");
				if(target.hipRating() >= 15 && target.hipRating() < 20) output2(" that sway and emphasize your thick, curvy shape, and");
				if(target.hipRating() >= 20) output2(" that sway hypnotically on your extra-curvy frame, and");
			}
			else if(target.thickness < 30) {
				output2(" You have " + target.hipsDescript());
				if(target.hipRating() < 6) output2(" that match your trim, lithe body, and");
				if(target.hipRating() >= 6 && target.hipRating() < 10) output2(" that sway to and fro, emphasized by your trim body, and");
				if(target.hipRating() >= 10 && target.hipRating() < 15) output2(" that swell out under your trim waistline, and");
				if(target.hipRating() >= 15 && target.hipRating() < 20) output2(", emphasized by your narrow waist, and");
				if(target.hipRating() >= 20) output2(" that swell disproportionately wide on your lithe frame, and");
			}
			//STANDARD
			else {
				output2(" You have " + target.hipsDescript());
				if(target.hipRating() < 6) output2(", and");
				if(target.femininity > 50) {
					if(target.hipRating() >= 6 && target.hipRating() < 10) output2(" that draw the attention of those around you, and");
					if(target.hipRating() >= 10 && target.hipRating() < 15) output2(" that make you [target.walk] with a sexy, swinging gait, and");
					if(target.hipRating() >= 15 && target.hipRating() < 20) output2(" that make it look like you’ve birthed many children, and");
					if(target.hipRating() >= 20) output2(" that make you look more like an animal waiting to be bred than any kind of human, and");
				}
				else {
					if(target.hipRating() >= 6 && target.hipRating() < 10) output2(" that give you a graceful stride, and");
					if(target.hipRating() >= 10 && target.hipRating() < 15) output2(" that add a little feminine swing to your gait, and");
					if(target.hipRating() >= 15 && target.hipRating() < 20) output2(" that force you to sway and wiggle as you move, and");
					if(target.hipRating() >= 20) {
						output2(" that give your ");
						if(target.balls > 0) output2("balls plenty of room to breathe");
						else if(target.hasCock()) output2(target.multiCockDescript() + " plenty of room to swing");
						else if(target.hasVagina()) output2(target.vaginaDescript() + " a nice, wide berth");
						else output2("vacant groin plenty of room");
						output2(", and");
					}
				}
			}
		}
		//ASS
		//Horse version
		if(target.isTaur()) {
			//FATBUTT
			if(target.tone < 65) {
				output2(" Your " + target.buttDescript());
				if(target.buttRating() < 4) output2(" is lean, from what you can see of it.");
				if(target.buttRating() >= 4 && target.buttRating() < 6) output2(" looks fairly average.");
				if(target.buttRating() >= 6 && target.buttRating() <10) output2(" is fairly plump and healthy.");
				if(target.buttRating() >= 10 && target.buttRating() < 15) output2(" jiggles a bit as you trot around.");
				if(target.buttRating() >= 15 && target.buttRating() < 20) output2(" jiggles and wobbles as you trot about.");
				if(target.buttRating() >= 20) output2(" is obscenely large, bordering freakish, even for a tauric being.");
			}
			//GIRL LOOK AT DAT BOOTY
			else {
				output2(" Your " + target.buttDescript());
				if(target.buttRating() < 4) output2(" is barely noticable, showing off the muscles of your haunches.");
				if(target.buttRating() >= 4 && target.buttRating() < 6) output2(" matches your toned, tauric frame quite well.");
				if(target.buttRating() >= 6 && target.buttRating() <10) output2(" gives hints of just how much muscle you could put into a kick.");
				if(target.buttRating() >= 10 && target.buttRating() < 15) output2(" surges with muscle whenever you trot about.");
				if(target.buttRating() >= 15 && target.buttRating() < 20) output2(" flexes its considerable mass as you move.");
				if(target.buttRating() >= 20) output2(" is stacked with layers of muscle, huge even for a tauric being.");
			}
		}
		//Non-horse PCs
		else {
			//TUBBY ASS
			if(target.tone < 60) {
				output2(" your " + target.buttDescript());
				if(target.buttRating() < 4) output2(" looks great under your gear.");
				if(target.buttRating() >= 4 && target.buttRating() < 6) output2(" has the barest amount of sexy jiggle.");
				if(target.buttRating() >= 6 && target.buttRating() <10) output2(" fills out your clothing nicely.");
				if(target.buttRating() >= 10 && target.buttRating() < 15) output2(" wobbles enticingly with every step.");
				if(target.buttRating() >= 15 && target.buttRating() < 20) output2(" wobbles like a bowl full of jello as you [target.walk].");
				if(target.buttRating() >= 20) output2(" is obscenely large, bordering freakish, and makes it difficult to run.");
			}
			//FITBUTT
			else {
				output2(" your " + target.buttDescript());
				if(target.buttRating() < 4) output2(" molds closely against your form.");
				if(target.buttRating() >= 4 && target.buttRating() < 6) output2(" contracts with every motion, displaying the detailed curves of its lean musculature.");
				if(target.buttRating() >= 6 && target.buttRating() <10) output2(" fills out your clothing nicely.");
				if(target.buttRating() >= 10 && target.buttRating() < 15) output2(" stretches your gear, flexing it with each step.");
				if(target.buttRating() >= 15 && target.buttRating() < 20) output2(" threatens to bust out from under your kit each time you clench it.");
				if(target.buttRating() >= 20) output2(" is marvelously large, but completely stacked with muscle.");
			}
		}
		
		//Tramp Stamps
		if(target.hasPerk("Slut Stamp")) output2(" To highlight your vulgarity, a tattoo is permanently printed on your lower back, advertising how much of a slut you are to anyone who sees it.");
		
		//TAILS
		if(target.tailType == GLOBAL.TYPE_EQUINE) output2(" A long " + target.hairColor + " horsetail hangs from your " + target.buttDescript() + ", smooth and shiny.");
		else if(target.tailType == GLOBAL.TYPE_CANINE)
		{
			output2(" A");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			else output2(" fuzzy");
			output2(" " + target.furColor + " dogtail sprouts just above your " + target.buttDescript() + ", wagging to and fro whenever you are happy.");
		}
		else if(target.tailType == GLOBAL.TYPE_DEMONIC) output2(" A narrow tail ending in a spaded tip curls down from your " + target.buttDescript() + ", wrapping around your " + target.leg() + " sensually at every opportunity.");
		else if(target.tailType == GLOBAL.TYPE_BOVINE) 
		{
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
		}
		else if(target.tailType == GLOBAL.TYPE_DRIDER || target.tailType == GLOBAL.TYPE_ARACHNID) {
			output2(" A large, spherical spider-abdomen has grown out from your backside, covered in shiny");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" hardened " + target.scaleColor + " goo");
			else output2(" black chitin");
			output2(". Though it’s heavy and bobs with every motion, it doesn’t seem to slow you down.");
			/*
			if(target.tailVenom > 50 && target.tailVenom < 80) output2(" Your bulging arachnid posterior feels fairly full of webbing.");
			if(target.tailVenom >= 80 && target.tailVenom < 100) output2(" Your arachnid rear bulges and feels very full of webbing.");
			if(target.tailVenom == 100) output2(" Your swollen spider-butt is distended with the sheer amount of webbing it’s holding.");
			*/
		}
		else if(target.tailType == GLOBAL.TYPE_BEE) {
			output2(" A large, insectile abdomen dangles from just above your backside, bobbing with its own weight as you shift. It is covered in hard");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2("ened " + target.scaleColor + " goo");
			else output2(" black chitin");
			output2(" and tipped with a needle-like stinger.");
			/*
			if(target.tailVenom > 50 && target.tailVenom < 80) output2(" A single drop of poison hangs from your exposed stinger.");
			if(target.tailVenom >= 80 && target.tailVenom < 100) output2(" Poisonous bee venom coats your stinger completely.");
			if(target.tailVenom == 100) output2(" Venom drips from your poisoned stinger regularly.");
			*/
		}
		else if(target.tailType == GLOBAL.TYPE_MYR) {
			output2(" A large, insectile abdomen dangles from just above your backside, bobbing with its own weight as you shift. It is covered in hard");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2("ened " + target.scaleColor + " goo");
			else output2(" " + target.scaleColor + " chitin");
			output2(" that is smooth to the touch.");
		}
		else if(target.tailType == GLOBAL.TYPE_SHARK || target.tailType == GLOBAL.TYPE_SIREN) {
			output2(" A long shark-tail trails down from your backside, swaying to and fro while giving you a dangerous air.");
		}
		else if(target.tailType == GLOBAL.TYPE_FELINE) {
			if(target.tailCount == 1)
			{
				output2(" A");
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" slimy");
				else output2(" soft");
				output2(" " + target.furColor + " cat-tail sprouts just above your " + target.buttDescript() + ", curling and twisting with every step to maintain perfect balance.");
			}
			else
			{
				output2(" " + StringUtil.upperCase(num2Text(target.tailCount)));
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" slimy");
				else output2(" soft");
				output2(", " + target.furColor + " cat-tails sprout just above your " + target.buttDescript() + ", curling and twisting with every step to maintain perfect balance.");
			}
		}
		else if(target.tailType == GLOBAL.TYPE_LIZAN) {
			output2(" A tapered tail hangs down from just above your " + target.buttDescript() + ". It sways back and forth, assisting you with keeping your balance.");
		}
		else if(target.tailType == GLOBAL.TYPE_LAPINE) {
			output2(" A short,");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" slimy");
			else output2(" soft");
			output2(" bunny tail sprouts just above your " + target.buttDescript() + ", twitching constantly whenever you don’t think about it.");
		}
		else if(target.tailType == GLOBAL.TYPE_AVIAN) {
			output2(" A tail of");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			output2(" feathers fans out from just above your " + target.buttDescript() + ", twitching instinctively to help guide you if you were to take flight.");
		}
		else if(target.tailType == GLOBAL.TYPE_KANGAROO) {
			output2(" A conical, ");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2("gooey, " + target.skinTone);
			else output2("furry, " + target.furColor);
			output2(" tail extends from your " + target.buttDescript() + ", bouncing up and down as you move and helping to counterbalance you.");
		}
		else if(target.tailType == GLOBAL.TYPE_VULPINE) {
			if(target.tailCount == 1)
			{
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" A swishing fox tail extends from your " + target.buttDescript() + ", curling around your body, all slick and shiny.");
				else output2(" A swishing, colorful fox’s brush extends from your " + target.buttDescript() + ", curling around your body - the soft fur feels lovely.");
			}
			else
			{
				if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " swishing fox tails extend from your " + target.buttDescript() + ", curling around your body, all slick and shiny.");
				else output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " swishing, colorful fox’s tails extend from your " + target.buttDescript() + ", curling around your body - the soft fur feels lovely.");
			}
		}
		else if(target.tailType == GLOBAL.TYPE_DRACONIC) {
			output2(" A thin,");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" gooey");
			else output2(" scaly");
			output2(", prehensile reptilian tail, almost as long as you are tall, swings behind you like a living bullwhip. Its tip menaces with spikes of bone, meant to deliver painful blows.");		
		}
		else if(target.tailType == GLOBAL.TYPE_KUITAN) 
		{
			if(target.furColor == "black") output2(" A solid-black kui-tan tail waves behind you.");
			else output2(" A black-and-" + target.furColor + "-ringed kui-tan tail waves behind you.");
		}
		else if(target.tailType == GLOBAL.TYPE_DEER) {
			output2(" A short");
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" nub");
			else output2(" tuft");
			output2(" of deer tail sprouts just above your " + target.buttDescript() + ", sometimes twitching at the slightest movements.");
		}
		else if(target.tailType == GLOBAL.TYPE_MOUSE) output2(" A naked, " + target.skinTone + " mouse tail pokes from your butt, dragging on the ground and twitching occasionally.");
		else if(target.tailType == GLOBAL.TYPE_CUNTSNAKE) {
			if(target.tailCount <= 1) output2(" A sinuous, almost snake-like tail waves behind you, covered in " + target.skinFurScales(true) + " like the rest of you except at the tip. There, it terminates in " + indefiniteArticle(target.tailVaginaDescript()) + " that always seems to crave fresh sperm.");
			else output2(" " + StringUtil.upperCase(num2Text(target.tailCount)) + " sinuous, almost snake-like tails wave behind you, covered in " + target.skinFurScales(true) + " like the rest of you except at the tip. There, they terminate in " + plural(target.tailVaginaDescript()) + " that always seem to crave fresh sperm.");
		}
		else if(target.tailType == GLOBAL.TYPE_PANDA) {
			if(target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" A short, slimy panda tail sprouts just above your " + target.buttDescript() + ". It just kind of sits there, not doing much beyond being a gooey little accent.");
			else output2(" A short, soft panda tail sprouts just above your " + target.buttDescript() + ". It just kind of sits there, not doing much beyond being a furry little accent.");
		}
		else if(target.tailType == GLOBAL.TYPE_RASKVEL) {
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
		}
		else if(target.tailType == GLOBAL.TYPE_BADGER) 
		{
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
		}
		else if(target.tailType == GLOBAL.TYPE_VANAE) 
		{
			if(target.tailCount == 1) output2(" Protruding from above your butt, a long, slippery tail wiggles behind you. It is lined with octopus-like suckers on the bottom, very much like a tentacle of some underwater... or perhaps tree-dwelling, creature.");
			else output2(" Protruding from above your butt, " + num2Text(target.tailCount) + " long, slippery tails wiggle behind you. They are lined with octopus-like suckers on the bottom, very much like the tentacles of some underwater... or perhaps tree-dwelling, creature.");
		}
		else if(target.tailType == GLOBAL.TYPE_OVIR)
		{
			if(target.tailCount == 1) output2(" A thick, reptilian tail dangles behind you, swaying as a living counterbalance.");
			else
			{
				output2(StringUtil.upperCase(num2Text(target.tailCount)) + " thick, reptilian tails dangle behind you, swaying like living counterbalance. It’s difficult to keep the thick appendages from idly squirming");
				if(!target.hasTailFlag(GLOBAL.FLAG_GOOEY)) output2(" their scales");
				output2(" against one another.");
			}
		}
		else if(target.tailType == GLOBAL.TYPE_COCKVINE)
		{
			if(target.tailCount == 1) output2(" A writhing, sinuous appendage flows after you, bobbing and undulating with the slightest movement of your hips.");
			else output2(StringUtil.upperCase(num2Text(target.tailCount)) + " writhing, sinuous appendages flow after you, all similar in appearance. Studying one of them, you see that it appears vine-like though very much alive and moving.");
			
			// Cockvine
			if (target.tailGenitalArg == GLOBAL.TYPE_COCKVINE && !target.hasTailFlag(GLOBAL.FLAG_RIBBED))
			{
				output2(" Most of the length of the thing is coated in "+ target.skinTone +" skin, culminating in");
				if(target.tailGenitalColor != "" && rand(2) == 0) output2(" " + indefiniteArticle(target.tailGenitalColor) + " shaft with");
				output2(" a proud purple head that’s distinctly cock-shaped in nature.");
			}
			// Horse
			else if (target.tailGenitalArg == GLOBAL.TYPE_EQUINE)
			{
				output2(" Most of the length of the thing is coated in "+ target.skinTone +" skin, culminating in a girthy, flared tip, distinctly reminiscent of");
				if(target.tailGenitalColor != "" && rand(2) == 0) output2(" " + indefiniteArticle(target.tailGenitalColor));
				else output2(" a");
				output2(" horse-cock.");
			}
			// Human
			else if (target.tailGenitalArg == GLOBAL.TYPE_HUMAN)
			{
				output2(" Most of the length of the thing is coated in "+ target.skinTone +" skin, culminating in a fleshy");
				if(target.tailGenitalColor != "") output2(" " + target.tailGenitalColor);
				else output2(" pink");
				output2(" head that’s distinctly cock-shaped in nature.");
			}
			// Bulbous
			else if (target.tailGenitalArg == GLOBAL.TYPE_CANINE)
			{
				output2(" Most of the length of the thing is coated in "+ target.skinTone +" skin, culminating in a thick bulge a few inches below a tapered,");
				if(target.tailGenitalColor != "") output2(" " + target.tailGenitalColor);
				else output2(" dark-red");
				output2(" tip.");
			}
			// Demonic
			else if (target.tailGenitalArg == GLOBAL.TYPE_DEMONIC)
			{
				output2(" Most of the length of the thing is coated in "+ target.skinTone +" skin, culminating in a thick bulge at the base and");
				if(target.tailGenitalColor != "") output2(" " + indefiniteArticle(target.tailGenitalColor));
				else output2(" a dark purple");
				output2(" shaft lined with sensitive nodules up to the tip.");
			}
			// Ribbed
			else if (target.hasTailFlag(GLOBAL.FLAG_RIBBED))
			{
				output2(" Most of the length of the thing is coated in "+ target.skinTone +" skin, culminating in");
				if(target.tailGenitalColor != "" && rand(2) == 0) output2(" " + indefiniteArticle(target.tailGenitalColor) + " shaft with");
				output2(" a series of noticeable ridges that gradually thin as they appear closer to the tip.");
			}
		}
		else if(target.tailType == GLOBAL.TYPE_FROG) output2(" Your stubby frog tail wiggles around at the back of your waist, just asking to be squeezed.");
		//Ovipositor
		if(target.hasTailFlag(GLOBAL.FLAG_OVIPOSITOR))
		{
			output2(" In addition,");
			if(target.tailCount == 1) output2(" it is an organ");
			else output2(" your [target.tails] are organs");
			output2(" capable of laying eggs into an orifice.");
		}
		
		//legType notez!
		if(target.legType == GLOBAL.TYPE_HUMAN)
		{
			if(target.legCount < 4) output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? " gooey" : " normal") + " human legs extend below your waist, ending in normal human feet.");
			else output2(" You have " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "normal") + " human legs that end in " + target.feet(true,true) + ".");
		}
		else if(target.legType == GLOBAL.TYPE_MYR)
		{
			if(target.legCount < 4) output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " human-like legs extend below your waist, covered in numerous " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "semi-solid" : "chitin") + " plates all the way to your feet.");
			else output2(" You have human-like legs that end in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "hardened" : "chitinous") + " feet.");
		}
		else if(target.legType == GLOBAL.TYPE_EQUINE || target.legType == GLOBAL.TYPE_BOVINE) 
		{
			if(target.legCount == 2) output2(" Your legs are muscled and jointed oddly, covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : "fur") + ", and end in a pair of bestial hooves.");
			else if(target.legCount < 4) output2(" Your legs are muscled and jointed oddly, covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : "fur") + ", and end in bestial hooves.");
			else output2(" You have oddly-jointed legs that end in " + target.feet(true,true) + ".");
		}
		else if(target.legType == GLOBAL.TYPE_CANINE) 
		{
			if (target.legCount < 4) 
			{
				output2(" " + StringUtil.upperCase(num2Text(target.legCount)));
				if (target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else output2(" plantigrade");
				output2(" legs grow downwards from your waist, ending in " + target.feet(true, true) + ".");
			}
			else
			{
				output2(" You have");
				if(target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else output2(" plantigrade");
				output2(" legs that end in " + target.feet(true,true) + ".");
			}
		}
		else if(target.legType == GLOBAL.TYPE_NAGA) 
		{
			if(target.legCount == 1) output2(" Below your thighs, your flesh is fused together into a very long, snake-like tail, leaving a narrow, connecting gap between your crotch and [target.asshole]. It is");
			else if(target.legCount < 4) output2(" Below your thighs, " + num2Text(target.legCount) + " wiggling, snake-like appendages allow you to slither around. They are");
			else output2(" You have wiggling snake-like appendages to propel yourself around on, all");
			output2(" covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : target.scaleColor + "-colored scales") + ".");
		}
		//Horse body is placed higher for readability purposes
		else if(target.legType == GLOBAL.TYPE_SUCCUBUS) 
		{
			if(target.legCount < 4) output2(" Your perfectly lissom legs end in mostly human feet, apart from the horn protruding straight down from the heel that forces you to walk with a sexy, swaying gait. Surprisingly your mobility isn’t impaired by having your feet converted into natural high heels, although you are forced to totter about with your upper body thrust forward a little to compensate, leaving you permanently locked into an awkwardly sexy pose.");
			else output2(" You have perfectly lissom legs that end in " + target.feet(true,true) + ".");
		}
		else if(target.legType == GLOBAL.TYPE_DEMONIC) 
		{
			if(target.legCount < 4) output2(" Your lithe legs are capped with flexible clawed feet. Sharp black nails grow where once you had toe-nails, giving you fantastic grip.");
			else output2(" You have lithe legs that end in " + target.feet(true,true) + ". Sharp black nails grow in place of toenails.");
		}
		else if(target.legType == GLOBAL.TYPE_BEE) 
		{
			output2(" Shimmering, " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "hardened goo" : "armor-like chitin") + " girds your legs from your toes to your mid-thigh. The " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "coating is semi-" : "sable material is rock ") + "hard right up until the ring of soft fluff that grows over the uppermost edge.");
		}
		else if(target.legType == GLOBAL.TYPE_GOOEY) 
		{
			if(target.legCount == 1)
			{
				// Gel tail
				if(target.hasLegFlag(GLOBAL.FLAG_PREHENSILE)) output2(" In place of legs you have a semi-solid, gel-like lower body, shaped into a prehensile mass that bends and twists as you move.");
				// Goo moound
				else
				{
					output2(" In place of legs you have a shifting amorphous blob. Thankfully it’s quite easy to propel yourself around on.");
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
							if(target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) output2(", shaped into plantigrade legs and");
							output2(" ending in " + target.feet());
						}
					}
					output2(". They are capable of shifting and morphing when you will them to.");
				}
			}
		}
		else if(target.legType == GLOBAL.TYPE_FELINE)
		{
			if(target.isTaur()) output2(" Your digitigrade legs end in soft, " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo-" : "") + "padded cat-paws.");
			else output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " digitigrade legs grow downwards from your waist, ending in soft, " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo-" : "") + "padded cat-paws.");
		}
		else if(target.legType == GLOBAL.TYPE_LIZAN)
		{
			if(target.legCount < 4) output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " digitigrade legs grow down from your " + target.hipDescript() + ", ending in clawed feet. There are three long toes on the front and a small hind-claw on the back.");
			else output2(" Your " + plural(target.leg(true)) + " end in clawed feet, tipped with three long toes and a small hind-claw on the back.");
		}
		else if(target.legType == GLOBAL.TYPE_RASKVEL)
		{
			if(target.legCount < 4) output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " plantigrade legs grow down from your " + target.hipDescript() + ", ending in clawed feet. There are four long toes tipping the humanoid soles.");
			else output2(" Your " + plural(target.leg(true)) + " end in clawed feet, tipped with four long toes at the front of the terran-like soles.");
		}
		else if(target.legType == GLOBAL.TYPE_LAPINE) 
		{
			if(target.legCount < 4) output2(" Your legs thicken below the waist as they turn into " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo-covered" : "soft-furred") + " rabbit-like legs. You even have large bunny feet that make hopping around a little easier than walking.");
			else output2(" You have thick rabbit legs that terminate in " + target.feet(true,true) + ". At least jumping should be a breeze.");
		}
		else if(target.legType == GLOBAL.TYPE_AVIAN) 
		{
			if(target.legCount < 4) output2(" Your legs are covered with " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : target.furColor + " plumage") + ". Thankfully the thick, powerful thighs are perfect for launching you into the air, and your feet remain mostly human, even if they are two-toed and tipped with talons.");
			else output2(" You have " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : target.furColor + " plumage across your") + " legs. It ends just above your two-toed, taloned feet.");
		}
		else if(target.legType == GLOBAL.TYPE_KANGAROO) 
		{
			if(target.legCount < 4) output2(" Your " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "furry") + " legs have short thighs and long calves, with even longer feet ending in prominently-nailed toes.");
			else output2(" You have " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : target.furColor + "-furred") + " legs with short thighs and long calves, perfect for jumping.");
		}
		else if(InCollection(target.legType, GLOBAL.TYPE_ARACHNID, GLOBAL.TYPE_NYREA)) 
		{
			if(target.legCount == 2) output2(" Your legs are covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "shiny, hardened goo" : "a reflective black, insectile carapace") + " up to your mid-thigh, looking more like a pair of ‘fuck-me-boots’ than exoskeleton.");
			else if(target.legCount < 4) output2(" Your legs are covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "shiny, hardened goo" : "a reflective black, insectile carapace") + " up to your mid-thigh, looking more like ‘fuck-me-boots’ than exoskeleton.");
			else output2(" " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "Hardened goo" : "Black chitin") + " covers your legs up to the mid-thigh, looking more like a set of ‘fuck-me-boots’ than insectile armor.");
		}
		else if(target.legType == GLOBAL.TYPE_DRIDER) 
		{
			if(target.isTaur()) output2(" Your legs are long and spindly, sprouting outwards from your sides like a spider.");
			else output2(" Where your legs would normally start you have grown the body of a spider, with " + num2Text(target.legCount) + " spindly legs that sprout from its sides.");
		}
		else if(target.legType == GLOBAL.TYPE_VULPINE) output2(" Your legs are crooked into high knees with hocks and long feet, like those of a fox; cute bulbous toes decorate the ends.");
		else if(target.legType == GLOBAL.TYPE_DRACONIC)
		{
			if(target.isTaur()) output2(" Your human-like legs are sheathed in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and end in clawed feet.");
			else output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " human-like legs grow down from your " + target.hipDescript() + ", sheathed in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and ending in clawed feet.");
			output2(" There are three long toes on the front, and a small hind-claw on the back.");
		}
		else if(target.legType == GLOBAL.TYPE_KUITAN) output2(" Your legs, though covered in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "goo" : "fur") + ", are humanlike. Long feet on the ends bear equally long toes, and the pads on the bottoms are quite sensitive to the touch.");
		else if(target.legType == GLOBAL.TYPE_PANDA)
		{
			if(target.isTaur()) output2(" Your digitigrade legs end in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gummi-like" : "fluffy") + " panda-paws.");
			else output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " digitigrade legs grow downwards from your waist, ending in " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gummi-like" : "fluffy") + " panda-paws.");
			output2(" You even have " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "blunt" : "sharp-looking") + " claws growing from the tips of your short toes.");
		}
		else if(target.legType == GLOBAL.TYPE_FROG)
		{
			if(target.legCount < 4) output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " digitigrade legs grow down from your " + target.hipDescript() + ", ending in three-toed, webbed, frog-like feet. They look built for leaping and sticking to flat surfaces rather than running.");
			else output2(" Your " + plural(target.leg(true)) + " look built for leaping than running, ending in three-toed, webbed, frog-like feet.");
		}
		else if (target.legType == GLOBAL.TYPE_OVIR)
		{
			if(target.skinType != GLOBAL.SKIN_TYPE_SCALES)
			{
				if(target.isTaur()) output2(" Your legs are curiously coated in a layer of " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales and end in human-like feet.");
				else output2(" Your " + num2Text(target.legCount) + " legs are curiously coated in a layer of " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey " : "") + "scales but are otherwise normal, human-like limbs.");
			}
			else
			{
				if(target.isTaur()) output2(" Your " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "scaled") + ", plantigrade legs end in human-like feet.");
				else output2(" " + StringUtil.upperCase(num2Text(target.legCount)) + " " + (target.hasLegFlag(GLOBAL.FLAG_GOOEY) ? "gooey" : "scaled") + ", plantigrade legs extend below your waist, ending in human-like feet.");
			}
		}
		//Catch all
		else
		{
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
					if(target.legCount == 1) output2("a " + target.foot(true, true));
					else output2(target.feet(true, true));
				}
				output2(".");
			}
		}
		
		// Mimbrane feet for applicable legTypes (any pair of humanoid legs with existing feet)!
		if (target.isBiped() && target.hasFeet() && target.hasToes())
		{
			if (target.hasStatusEffect("Mimbrane Foot Left") || target.hasStatusEffect("Mimbrane Foot Right"))
			{
				var bothFeet:Boolean = false;
				feedVal = 0;

				if (target.hasStatusEffect("Mimbrane Foot Left") && target.hasStatusEffect("Mimbrane Foot Right")) bothFeet = true;
				
				if (!bothFeet)
				{
					if (target.hasStatusEffect("Mimbrane Foot Left")) feedVal = target.statusEffectv3("Mimbrane Foot Left");
					else feedVal = target.statusEffectv3("Mimbrane Foot Right");
				}
				// Don't foget to set feedVal for bothHands!
				else
				{
					//The feed values should be synced for feet, so use one of them!
					feedVal = target.statusEffectv3("Mimbrane Foot Right");
				}

				if (feedVal >= 3)
				{
					output2(" Your");
					if(target.hasLegFlag(GLOBAL.FLAG_HEELS))
					{
						if (bothFeet) output2(" feet appear");
						else output2(" foot appears");
					}
					else
					{
						if (bothFeet) output2(" [target.feet] appear");
						else output2(" [target.foot] appears");
					}
					if (feedVal < 8) output2(" to be slightly distended.");
					else if (feedVal < 13) output2(" puffy and inflated.");
					else output2(" unusually large and somewhat swollen, almost engorged.");
				}
			}
		}
		
		// CoC places the pregnancy output directly after leg output
		//Start a new paragraph with bellies if preggers, otherwise tack onto the end of the last one.
		if (target.isPregnant()) output2("\n\n");
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
		if (tempBelly <= 5)
		{
			if(target.tone >= 75) output2("Your " + RandomInCollection("belly", "midriff", "middle", "six pack") + " is rock-hard, shaped by a good diet, steady conditioning, or both.");
			else if(target.tone >= 50) output2("Your " + RandomInCollection("belly", "midriff", "middle", "six pack") + " is fairly well-toned.");
			else output2("Your [target.belly] is nice and smooth.");
		}
		else if (tempBelly <= 10) output2("Your [target.belly] is fairly average in appearance.");
		else if (tempBelly <= 15) output2("Your [target.belly] would just barely push past the waistband of a pair of pants. It’s a little bit of a muffin-top.");
		else if (tempBelly <= 20) output2("Your [target.belly] is pretty decent-sized. There’s no real hiding it.");
		else if (tempBelly <= 30) output2("Your [target.belly] is impossible to miss. Wearing loose clothing wouldn’t even help at this point.");
		//full round bulky
		else if (tempBelly <= 40) output2("Your [target.belly] is big enough that passersby might think you pregnant at a glance.");
		//expansive extensive spacious
		else if (tempBelly <= 50) output2("Your [target.belly] would look more at home on a woman in the later stages of her pregnancy than an adventuring rusher.");
		//inflated excessive whopping
		else if (tempBelly <= 60) output2("Your [target.belly] is weighty enough to jiggle when you shift positions too suddenly, but still small enough for easy portability.");
		//distended immense bloated
		else if (tempBelly <= 70) output2("Your [target.belly] sticks out very noticeably, wobbling slightly with your motions. It would look right at home on a reclining, full-time breeding servant.");
		//over-inflated jumbo-sized
		else if (tempBelly <= 80) output2("Your [target.belly] is obscene testament to what the body can endure. When you look down, you have no hope of seeing your crotch, let alone your [target.feet].");
		//Very distended monumental massive
		else if (tempBelly <= 90) 
		{
			output2("Your [target.belly] is so big that it makes your [target.skin] tight and shiny");
			if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_SCALES, GLOBAL.SKIN_TYPE_CHITIN, GLOBAL.SKIN_TYPE_FEATHERS))
				output2(" under your [target.skinFurScales]");
			output2(". Movement is a little impractical with the extra bulk.");
		}
		//ginormous over-inflated blimp-like
		else output2("Your [target.belly] protrudes obscenely from your form, hanging heavily. Getting around is a struggle with so much extra mass on you.");
		
		//Tack on preg flavor shit to the end of belly descripts.
		if (target.isPregnant())
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
		
		var btnIndex:int = 0;
		addGhostButton(btnIndex++, "PrefGender", selectGenderPref, undefined, "Preferred Gender", "Indicate the gender you would prefer your character to be considered.");
		//PC Goo'ed up?
		if (target.hairType == GLOBAL.HAIR_TYPE_GOO || target.hasStatusEffect("Goo Vent") || target.hasStatusEffect("Goo Crotch"))
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
		if (attachedMimbranes() > 0)
		{
			if (kGAMECLASS.canSaveAtCurrentLocation) addGhostButton(btnIndex++, "Mimbranes", mimbraneMenu);
			else addDisabledGhostButton(btnIndex++,"Mimbranes","Mimbranes","You cannot access your mimbrane menu at this time.");
			
			// Detailed Mimbrane sentence that includes specific body regions.
			output2("\n\nFrom time to time, small chirps remind you that your body is not owned by just you alone. The");
			// Just one.
			if(attachedMimbranes() == 1) 
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
				if(attachedMimbranes() == 2)
				{
					if(target.hasStatusEffect("Mimbrane Cock") && target.hasStatusEffect("Mimbrane Balls")) output2(" your cock and balls");
					else if(target.hasStatusEffect("Mimbrane Boobs") && target.hasStatusEffect("Mimbrane Ass")) output2(" your tits and ass");
					else if(target.hasStatusEffect("Mimbrane Pussy") && target.hasStatusEffect("Mimbrane Ass")) output2(" your bodily glory holes");
					else if(target.hasStatusEffect("Mimbrane Cock") && target.hasStatusEffect("Mimbrane Pussy")) output2(" your genitalia");
					else if(target.hasStatusEffect("Mimbrane Hand Left") && target.hasStatusEffect("Mimbrane Hand Right")) output2(" both of your hands");
					else if(target.hasStatusEffect("Mimbrane Foot Left") && target.hasStatusEffect("Mimbrane Foot Right")) output2(" your [target.feet]");
					else output2(" a couple of your appendages");
				}
				else if(attachedMimbranes() == 3)
				{
					if(target.hasStatusEffect("Mimbrane Cock") && target.hasStatusEffect("Mimbrane Balls") && target.hasStatusEffect("Mimbrane Ass")) output2(" your masculine bits");
					else if(target.hasStatusEffect("Mimbrane Boobs") && target.hasStatusEffect("Mimbrane Pussy") && target.hasStatusEffect("Mimbrane Ass")) output2(" your lady-like bits");
					else output2(" a few of your appendages");
				}
				else if(attachedMimbranes() == 4)
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
	}
	
	setTarget(null);
}

public function boobStuff(forTarget:Creature = null):void
{
	if (forTarget != null) setTarget(forTarget);
	
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
			if (rand(3) == 0) output2("You have the barest hint of breasts, " + num2Text(target.breastRows[0].breasts) + " teasing feminine rises on your chest");
			else if (rand(2) == 0) output2("You have tiny, cute mosquito bites for breasts, pert and sensitive");
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
				if (rand(3) == 0) output2("You have a waif’s chest, flat and innocent-looking");
				else if (rand(2) == 0) output2("You have a girly, soft, undefined flat chest");
				else output2("The top half of your body is willowy and breast-less, graceful yet vaguely austere");
			}
			// Masculine, High Tone, High Thickness
			else if((target.mf("m","f") == "m") && target.tone >= 60 && target.thickness >= 60) {
				if (rand(3) == 0) output2("You have a fuck-off six pack, bulging with heavy muscle. Above it, you have a broad chest");
				else if (rand(2) == 0) output2("You’re ripped as hell, sporting the kind of muscle guys want and girls want around them. Much can be said about your pecs");
				else output2("You have remarkably well defined, heavyweight abs, rounded and beefy. Above it, you have a muscled chest");
			}
			// Masculine, Low Tone, High Thickness
			else if((target.mf("m","f") == "m") && target.tone <= 30 && target.thickness >= 60) {
				if (rand(3) == 0) output2("You have a broad, incredibly masculine chest, bulky and assured");
				else if (rand(2) == 0) output2("You have a bear-like upper frame, voluminous and imminently cuddly");
				else output2("You have a wide, hearty, supremely manly chest");
			}
			// Masculine/Feminine/Andro, High Tone, Low Thickness
			else if(target.tone >= 60 && target.thickness <= 30) {
				if (rand(3) == 0) output2(target.mf("You have a narrow, well defined but unostentatious six pack. Above it, you have a chiseled chest", "You have a flat, athlete’s chest, supple and thin"));
				else if (rand(2) == 0) output2(target.mf("You have a sleek, tight featherweight’s six pack. Above it, you have a defined chest", "You have a no-nonsense flat chest, framed by rounded, subtle amounts of muscle"));
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
		if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_DICK || target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_NORMAL)
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
			if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE) {
				output2(" The " + target.areolaSizeDescript() + " areolae are " + target.nippleColor + ".");
				output2(" While you may appear to have inverted nipples, your chest actually houses wet, slippery secrets. A finger or cock could easily slip inside you to give and get as much pleasure as any crotch-couched cunt.");
			}
			else if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES) {
				output2(" The plump, " + target.areolaSizeDescript() + ", " + target.nippleColor + " lips that you have in place of areolae could easily be parted to allow something stiff and hard inside your sensitive chest-based passages.");
			}
			else if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FLAT) {
				output2(" There isn’t any actual nub to your nipples - just flat, " + target.areolaSizeDescript() + ", " + target.nippleColor + " areolae.");
			}
			else if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED) {
				output2(" The " + target.areolaSizeDescript() + " areolae are " + target.nippleColor + ".");
				output2(" When you’re aroused enough, your " + int(target.nippleLength(0)*10)/10 + "-inch nipples pop out, ready for action.");
			}
			else if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_TENTACLED) {
				output2(" Once you are worked up, several long, prehensile tentacles emerge from their " + target.nippleColor + " home, seeking for an orifice to pleasure.");
			}
		}
		//Lactation and breast cup final!
		if (target.isLactating())
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
		if (target.breastRows[0].breastRating() >= 1) output2(" You could easily fill " + indefiniteArticle(target.breastCup(0)) + " bra.");
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
				if(temp == 0) output2(" Your uppermost row houses ");
				if(temp == 1) output2(" The second group holds ");
				if(temp == 2) output2(" Your third batch contains ");
				if(temp == 3) output2(" Your fourth set cradles ");
				if(temp == 4) output2(" Your fifth has ");
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
				if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_DICK) {
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
				if(target.breastRows[temp].nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE) {
					output2(" They actually house wet, slippery, secret entrances.");
				}
				else if(target.breastRows[temp].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES) {
					output2(" Plump lips cap them off in place of nipples.");
				}
				else if(target.breastRows[temp].nippleType == GLOBAL.NIPPLE_TYPE_FLAT) {
					output2(" There isn’t any actual nub to the nipples - just flat areolae.");
				}
				else if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED) {
					output2(" When you’re aroused enough, the nubs pop out, ready to play.");
				}
				else if(target.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_TENTACLED) {
					output2(" They hide several long, prehensile tentacles, eager for an orifice to pleasure.");
				}
			}
			if(target.breastRows[temp].breastRating() >= 1) output2(" They could easily fill " + indefiniteArticle(target.breastCup(temp)) + " bra.");
			temp++;
		}
		//Done with tits. Move on.
		//Lactation and breast cup final!
		if (target.isLactating())
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
	
	if (forTarget != null) setTarget(null);
}

public function crotchStuff(forTarget:Creature = null):void
{
	if (forTarget != null) setTarget(forTarget);
	
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
		else if(target.genitalLocation() == 0)
		{
			output2("Your sexual equipment is located at your");
			if(!target.isHuman() || !target.isHalfHuman()) output2(" humanoid");
			output2(" waist. ");
		}
		else if(target.genitalLocation() == 1)
		{
			output2("Your sexual equipment is located in the middle of your");
			if(target.legCount == 1 && target.isNaga()) output2(" long tail");
			else output2(" lower body");
			output2(". ");
		}
		else if(target.isTaur() && target.genitalLocation() == 2 && target.originalRace == "half-leithan")
		{
			output2("Your sexual equipment is positioned at the back of your tauric hindquarters, rather than at your humanoid waist. ");
		}
		else if(target.isTaur() && target.genitalLocation() == 2)
		{
			output2("Your sexual equipment is");
			if(target.race() != target.originalRace) output2(" no longer below your waist, but instead");
			output2(" at the back of your");
			if(target.legType == GLOBAL.TYPE_EQUINE) output2(" equine");
			else if(target.legType == GLOBAL.TYPE_BOVINE) output2(" bovine");
			else output2(" tauric");
			output2(" hindquarters. ");
		}
		else if(target.genitalLocation() == 2)
		{
			output2("Your sexual equipment is located at your rear");
			if(target.legCount > 1 && target.isNaga()) output2(" tails");
			else if(target.legCount > 1) output2(" legs");
			output2(". ");
		}
		else if(target.genitalLocation() == 3)
		{
			output2("Your sexual equipment is located");
			if(target.isDrider()) output2(" at the end of your drider abdomen");
			else if(target.legCount == 1 && target.isNaga()) output2(" on the underside of your long tail");
			else output2(" on the underside of your lower body");
			output2(". ");
		}
		
		//SINGLE DICKS!
		if(target.cockTotal() == 1) {
			output2("Your " + target.cockDescript() + " is " + Math.floor(10*target.cocks[0].cLength())/10 + " inches long and ");
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
			output2("Where a penis would normally be located, you have instead grown your " + target.multiCockDescript() + ":");
			while(temp < target.cocks.length) 
			{
				//middle cock description
				if(rando == 0) {
					if(temp == 0)output2("\nYour first ");
					else output2("\nYour next ");
					output2(target.cockDescript(temp));
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
					output2(target.cockDescript(temp) + " is " + Math.round(10*target.cocks[temp].cLength())/10 + " inches long and ");
					if(Math.floor(target.cocks[temp].thickness()) >= 2) output2(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches thick.");
					else {
						if(target.cocks[temp].thickness() == 1) output2("one-inch thick.");
						else output2(Math.round(target.cocks[temp].thickness()*10)/10 + " inches thick.");
					}
				}
				if(rando == 2) {
					output2("\nThe " + num2Ordinal(temp + 1) + " ");
					output2(target.cockDescript(temp) + " is " + Math.round(10*target.cocks[temp].cLength())/10 + " inches long and ");
					if(Math.floor(target.cocks[temp].thickness()) >= 2) output2(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches thick.");
					else {
						if(target.cocks[temp].thickness() == 1) output2("one-inch thick.");
						else output2(Math.round(target.cocks[temp].thickness()*10)/10 + " inches thick.");
					}
				}
				if(rando == 3) {
					if(temp > 0) output2("\nYour next ");
					else output2("\nYour first ");
					output2(target.cockDescript(temp) + " is " + Math.round(10*target.cocks[temp].cLength())/10 + " inches long and ");
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
		
		if(target.cockTotal() == 0 && !target.hasVagina()) output2("\n\n");
		else if(target.cockTotal() > 1) output2("\n\n");
		else output2(" ");
		if(target.hasStatusEffect("Uniball"))
		{
			if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_FEATHERS)) output2("Your fuzzy " + target.sackDescript(true,true) + " hugs your " + sTesticleDesc + " tightly against your body.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("Your scaly " + target.sackDescript(true,true) + " hugs your " + sTesticleDesc + " tightly against your body.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_GOO) output2("Your " + target.sackDescript(true,true) + " clings tightly to your groin, dripping ooze and holding " + sTesticleDesc + " snugly against you.");
			else output2("Your " + target.sackDescript(true,true) + " clings tightly to your groin, holding your " + sTesticleDesc + " snugly against you.");
		}
		else if(target.cockTotal() == 0)
		{
			if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_FEATHERS)) output2("A fuzzy " + target.sackDescript(true,true) + " filled with " + sTesticleDesc + " swings low under where a penis would normally grow.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("A scaly " + target.sackDescript(true,true) + " filled with " + sTesticleDesc + " swings low under where a penis would normally grow.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_GOO) output2("An oozing, semi-solid sack with " + sTesticleDesc + " swings heavily under where a penis would normally grow.");
			else output2("" + StringUtil.capitalize(indefiniteArticle(target.sackDescript(true,true))) + " with " + sTesticleDesc + " swings heavily under where a penis would normally grow.");
		}
		else
		{
			if(InCollection(target.skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_FEATHERS)) output2("A fuzzy " + target.sackDescript(true,true) + " filled with " + sTesticleDesc + " swings low under your " + target.multiCockDescript() + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("A scaly " + target.sackDescript(true,true) + " filled with " + sTesticleDesc + " swings low under your " + target.multiCockDescript() + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_GOO) output2("An oozing, semi-solid sack with " + sTesticleDesc + " swings heavily beneath your " + target.multiCockDescript() + ".");
			else output2(StringUtil.capitalize(indefiniteArticle(target.sackDescript(true,true))) + " with " + sTesticleDesc + " swings heavily beneath your " + target.multiCockDescript() + ".");
		}
		//Does it mention the dick at the end of the sentence? If so, dont use pronoun here:
		if(target.hasCock() && !target.hasStatusEffect("Uniball"))
		{
			if(target.balls == 1) output2(" You estimate the testicle to be about " + num2Text(Math.round(target.ballSize())) + " ");
			else output2(" You estimate each testicle to be about " + num2Text(Math.round(target.ballSize())) + " ");
		}
		//No dick mention? Great! Pronouns deployed!
		else if(target.balls == 1) output2(" You estimate it to be about " + num2Text(Math.round(target.ballSize())) + " ");
		else output2(" You estimate each of them to be about " + num2Text(Math.round(target.ballSize())) + " ");
		if(Math.round(target.ballSize()) == 1) output2("inch");
		else output2("inches");
		var ballDisplayDiameter:Number = Math.round(target.ballDiameter()*10)/10;
		output2(" around and " + ballDisplayDiameter);
		if(ballDisplayDiameter != 1) output2(" inches");
		else output2(" inch");
		output2(" across.");
		//Vanaeballs
		if(target.statusEffectv4("Vanae Markings") > 0) output2(" Flowing across the surface of your nutsack are intricate markings that glow " + target.skinAccent + ", softly pulsing with life.");
	}
	//VAGOOZ
	if(target.vaginas.length > 0) {
		if(target.hasCock()) output2("\n\n");
		if(!target.hasCock() && target.isTaur()) output2("As a tauric creature, your womanly parts lie between your rear legs in a rather equine fashion. ");
		//Vaginal Numbers
		if(target.vaginaTotal() == 1) {
			output2("You have " + indefiniteArticle(target.vaginaDescript(0)) + ", with " + num2Text(target.vaginas[0].clits) + " " + Math.round(target.clitLength*10)/10 + "-inch clit");
			if(target.vaginas[0].clits > 1) output2("s");
			if(target.vaginas[0].hymen) output2(" and an intact hymen");
			output2(". ");

			if (target.hasStatusEffect("Mimbrane Pussy") && target.statusEffectv3("Mimbrane Pussy") > 3)
			{
				if (target.statusEffectv3("Mimbrane Pussy") < 8)
				{
					output2("Your pussy appears slightly swollen. ");
				}
				else if (target.statusEffectv3("Mimbrane Pussy") < 13)
				{
					output2("Your pussy appears noticably inflated");
					if (!target.isCrotchExposed())
					{
						output2(" and creates a slight bulge beneath your");
						if (target.armor.type == GLOBAL.ARMOR) output2(" armor");
						else output2(" clothing");
					}
					output2(". ");
				}
				else
				{
					output2("Your pussy appears delightfully plump");
					if (!target.isCrotchExposed())
					{
						output2(", creating an undeniable bulge in your");
						if (target.armor.type == GLOBAL.ARMOR) output2(" armor");
						else output2(" clothing");
					}
					output2(". ");
				}
			}
			//Variances based on lustiness & wetness & such. THE DETAIL!
			if(target.libido() < 50 && target.lust() < 50) //not particularly horny
			{
				//Wetness
				if(target.vaginas[0].wetness() < 2) output2("No moisture presently escapes ");
				else if(target.vaginas[0].wetness() < 4) output2("Moisture gleams in ");
				else if(target.vaginas[0].wetness() >= 4) output2("Occasional beads of [target.girlCum] drip from ");
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
			else if(target.vaginas[0].looseness() < 4) output2("your " + target.vaginaDescript(0) + ", their lips slightly parted.");
			else output2("the massive hole that is your " + target.vaginaDescript(0) + ".");
			//Flavor
			vaginaBonusForAppearance(null, 0, false);
		}
		//MULTICOOCH!
		else if(target.vaginaTotal() > 1) 
		{
			output2("You have " + num2Text(target.vaginas.length) + " " + target.vaginasDescript() + ", ");
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
				output2(" is " + indefiniteArticle(target.vaginaNounDescript(temp)) + " with " + num2Text(target.vaginas[temp].clits) + " " + int(target.clitLength*10)/10 + "-inch clit");
				if(target.vaginas[temp].clits > 1) output2("s");
				//Virginal trumps all else
				if(target.vaginas[temp].hymen) output2(", still virginal in appearance.");
				//Else wetness -> size
				else
				{
					//High wetness shit
					if(target.vaginas[temp].wetness() >= 4)
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
				if (temp == 0 && target.hasStatusEffect("Mimbrane Pussy") && target.statusEffectv3("Mimbrane Pussy") > 3)
				{
					if (target.statusEffectv3("Mimbrane Pussy") < 8)
					{
						output2(" It appears slightly swollen from the mimbrane.");
					}
					else if (target.statusEffectv3("Mimbrane Pussy") < 13)
					{
						output2(" It appears noticably inflated");
						if (!target.isCrotchExposed())
						{
							output2(" and creates a slight bulge beneath your");
							if (target.armor.type == GLOBAL.ARMOR) output2(" armor");
							else output2(" clothing");
						}
						output2(".");
					}
					else
					{
						output2(" It appears delightfully plump");
						if (!target.isCrotchExposed())
						{
							output2(", creating an undeniable bulge in your");
							if (target.armor.type == GLOBAL.ARMOR) output2(" armor");
							else output2(" clothing");
						}
						output2(".");
					}
				}
				temp++;
			}
			if(target.matchedVaginas())
			{
				vaginaBonusForAppearance(null, 0, true);
			}
		}
	}
	//Genderless lovun'
	if(!target.hasGenitals()) {
		output2("\n\nYou have a curious lack of any sexual endowments.");
	}
	//BUNGHOLIO
	if(target.ass != null) {
		output2("\n\nYou have one " + target.assholeDescript() + ", placed between your cheeks where it belongs");
		if(target.libido() < 50 && target.lust() < 50) //not particularly horny
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
	}
	
	if (forTarget != null) setTarget(null);
}

public function selectGenderPref():void
{
	clearOutput2();
	output2("Your current preferred gender is set to ");
	
	clearGhostMenu();
	
	addGhostButton(0, "Female", setGenderPref, "female");
	addGhostButton(1, "Male", setGenderPref, "male");
	addGhostButton(2, "Auto", setGenderPref, "auto");
	
	if (pc.hasStatusEffect("Force Fem Gender"))
	{
		output2("<b>Female</b>.");
		output2("\n\nNo matter your femininity value, genitalia presence, or any other contributing factors, where possible you will be considered female.");
		addDisabledGhostButton(0, "Female");
	}
	else if (pc.hasStatusEffect("Force Male Gender"))
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
	
	addGhostButton(14, "Back", appearance, pc);
}

public function setGenderPref(pref:String):void
{
	if (pref == "auto")
	{
		pc.removeStatusEffect("Force Fem Gender");
		pc.removeStatusEffect("Force Male Gender");
	}
	else if (pref == "female")
	{
		pc.removeStatusEffect("Force Male Gender");
		pc.createStatusEffect("Force Fem Gender");
	}
	else if (pref == "male")
	{
		pc.removeStatusEffect("Force Fem Gender");
		pc.createStatusEffect("Force Male Gender");
	}
	
	selectGenderPref();
}

public function dickBonusForAppearance(forTarget:Creature = null, x:int = 0):void
{
	if (forTarget != null) setTarget(forTarget);
	
	trace("DICK FLAVOR FIRED!");
	//Color shit
	if(target.cocks[x].cType == GLOBAL.TYPE_EQUINE)
	{
		if(target.cocks[x].cockColor == "mottled pink and black") output2(" It’s mottled pink and black in a very animalistic pattern.");
		else output2(" It’s " + target.cocks[x].cockColor + " in color and laced with thick veins.");
	}
	//More general descripts - gotta be before flare/knot due to "It" sentence subject.
	if(target.cocks[x].cType == GLOBAL.TYPE_RASKVEL) {
		output2(" It’s fairly smooth and shapely in appearance, lacking in any severe or stimulating ridges.");
	}
	//Tentacle cock flavor
	else if(target.cocks[x].cType == GLOBAL.TYPE_TENTACLE) {
		if(target.cocks[x].hasFlag(GLOBAL.FLAG_LUBRICATED)) output2(" The entirety of its " + target.cocks[x].cockColor + " surface is covered in perspiring beads of slick moisture. It");
		else output2(" Its " + target.cocks[x].cockColor + " length");
		output2(" frequently shifts and moves of its own volition, the slightly oversized and mushroom-like head shifting in coloration to purplish-red whenever you become aroused.");
	}
	//Cat cock flavor
	else if(target.cocks[x].cType == GLOBAL.TYPE_FELINE) {
		output2(" It ends in a tapered head");
		if(target.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) output2(", ringed in small, fleshy nubs that terrans have taken to calling “barbs” in spite of their softness. More of these “barbs” line the shaft, but they’re largest at the base, where they are likely to be rubbed against a clit mid-coitus.");
		else output2(" much like that of a feline.");
	}
	//Snake cock flavor
	else if(target.cocks[x].cType == GLOBAL.TYPE_SNAKE) {
		if(target.originalRace == "snake" || target.originalRace == "naga" || target.originalRace == "naleen" || target.originalRace == "leithan" || target.originalRace == "half-leithan") output2(" It’s a deep, iridescent " + target.cocks[x].cockColor + " in color. The shaft is patterned with multiple bulbous bumps to stimulate potential partners, and the whole of its length is glossy and smooth.");
		else output2(" It’s a deep, iridescent " + target.cocks[x].cockColor + " in color. Unlike a " + target.originalRace + " penis, the shaft is patterned with multiple bulbous bumps to stimulate potential partners, and the whole of its length is glossy and smooth.");
	}
	//Anemone cock flavor
	else if(target.cocks[x].cType == GLOBAL.TYPE_ANEMONE || target.cocks[x].cType == GLOBAL.TYPE_SIREN) {
		output2(" The crown is surrounded by tiny tentacles with a venomous, aphrodisiac payload. At its base a number of similar, longer tentacles have formed, guaranteeing that pleasure will be forced upon your partners.");
	}
	//Kangawang flavor
	else if(target.cocks[x].cType == GLOBAL.TYPE_KANGAROO) {
		output2(" It");
		if(target.hasSheath(x)) output2(" usually lies coiled inside a sheath, but");
		output2(" undulates gently and tapers to a point when erect, somewhat like a taproot.");
	}
	//Draconic Cawk Flava flav
	else if(target.cocks[x].cType == GLOBAL.TYPE_DRACONIC) {
		output2(" With its tapered tip, there are few holes you wouldn’t be able to get into. It has a strange, knot-like bulb at its base, but doesn’t usually flare during arousal as a dog’s knot would.");
	}
	//Beees
	else if(target.cocks[x].cType == GLOBAL.TYPE_BEE) {
		if(target.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) output2(" There’s a lot in common between human and zil genitals, but the alien member you’re packing has a much longer, stretchier foreskin than most terrans can pack. It also");
		else output2(" The zil-like member you’re packing ");
		output2(" looks vaguely glossy, like you oiled it up just a moment ago.");
	}
	//Vanae flavor
	else if(target.cocks[x].cType == GLOBAL.TYPE_VANAE) {
		output2(" The marine-like phallus has a tip capped with a cephalopod-shaped sucker, used to grasp and tug through sensitive depths for insemination or stimulation.");
	}
	//Nyrean Girl-Cock flavor
	else if(target.cocks[x].cType == GLOBAL.TYPE_NYREA) {
		output2(" The pseudo-penis is large and thick, with a shape similar to a horse phallus and lacking any veins. The flared tip is ringed with spikes meant to rupture the sperm sacs of a male nyrea and its slit is in the shape of an ‘x’.");
	}
	//Little Green Man
	else if (target.cocks[x].cType == GLOBAL.TYPE_HRAD) {
		output2(" The phallic member");
		if (target.skinFurScalesColor() != target.cocks[x].cockColor) output2(" appears very much two-toned, with " + indefiniteArticle(target.skinFurScalesColor()) + " shaft and ending in " + indefiniteArticle(target.cocks[x].cockColor) + ",");
		else output2(" has a");
		output2(" pronounced bullet-shaped tip.");
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
	if(target.hasSheath(x) && target.cocks[x].cType != GLOBAL.TYPE_KANGAROO)
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
		output2("crown is ringed with a circle of rubbery protrusions that grow larger as you get more aroused. The entire thing is shiny and covered with tiny, sensitive nodules that leave no doubt about its demonic influences.");
	}
	//Foreskins
	if(target.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED) && target.cocks[x].cType != GLOBAL.TYPE_BEE)
	{
		output2(" The head is also covered by stretchy foreskin, ensuring that it is kept protected and sensitive.");
	}
	//KNOT STUFF
	if(target.hasKnot(x))
	{
		trace("KNOT FIRED!");
		if(target.cocks[x].knotMultiplier > 1)
		{
			if(target.cocks[x].knotMultiplier < 1.4) output2(" A small knot of thicker flesh is near the base of your " + target.cockDescript(x) + ", ready to expand to help you lodge it inside a female.");
			else if(target.cocks[x].knotMultiplier <= 2) output2(" A large bulge of flesh nestles just above the bottom of your " + target.cockDescript(x) + ", to ensure it stays where it belongs during mating.");
			else output2(" The obscenely swollen lump of flesh near the base of your " + target.cockDescript(x) + " looks almost too big for your cock.");
		}
		//List thickness
		output2(" The knot is " + Math.round(target.cocks[x].thickness() * target.cocks[x].knotMultiplier * 10)/10 + " inches wide when at full size.");
		//Appended to knot texts!
		if(target.cocks[x].cType == GLOBAL.TYPE_KUITAN)
		{
			output2(" Two smaller ones line the length of the shaft, the hallmark of the kui-tan race.");
		}
	}
	else trace("NO KNOT");
	// Mimbranes
	if(x == 0 && target.hasStatusEffect("Mimbrane Cock") && target.statusEffectv3("Mimbrane Cock") > 3)
	{
		output2(" The phallus itself");
		if (!target.isCrotchExposed()) output2(" feels");
		else output2(" looks");
		if (target.statusEffectv3("Mimbrane Cock") < 8) output2(" slightly swollen");
		else if (target.statusEffectv3("Mimbrane Cock") < 13) output2(" noticably inflated");
		else output2(" unnaturally plump");
		if (!target.isCrotchExposed())
		{
			output2(" under your");
			if (target.armor.type == GLOBAL.ARMOR) output2(" armor");
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
	
	if (forTarget != null) setTarget(null);
}

public function vaginaBonusForAppearance(forTarget:Creature = null, x:int = 0, eachOne:Boolean = false):void
{
	if (forTarget != null) setTarget(forTarget);
	
	//Zil flavor!
	if(target.vaginas[x].type == GLOBAL.TYPE_BEE && target.vaginas[x].vaginaColor == "black and gold") {
		if(!eachOne) output2(" The exterior folds are a dusky black, while the inner lining of your tunnel is a glorious golden hue.");
		else output2("\nEach vagina’s exterior folds are a dusky black, while the inner linings of your tunnels are a glorious golden hue.");
	}
	//Naleen flavor
	else if(target.vaginas[x].type == GLOBAL.TYPE_NAGA) {
		if(!eachOne) output2(" The exterior lips are subtle and narrow, making your lengthy entrance a little more discrete.");
		else output2("\nEach vagina’s exterior lips are subtle and narrow, making your lengthy entrances a little more discrete.");
	}
	//LEITHAN FLAVOR
	else if(target.vaginas[x].type == GLOBAL.TYPE_LEITHAN || target.vaginas[x].type == GLOBAL.TYPE_EQUINE) {
		if(!eachOne) output2(" The exterior lips are fat and swollen. They could easily be described as rubbery, and they often shine with a wet sheen, regardless of your arousal. When you’re aroused, you’re told that they wink.");
		else output2("\nEach vagina’s exterior lips are fat and swollen. They could easily be described as rubbery, and they often shine with a wet sheen, regardless of your arousal. When you’re aroused, you’re told that they wink.");
	}
	//Lapinara flavor
	else if(target.vaginas[x].type == GLOBAL.TYPE_LAPINARA) {
		if(!eachOne) output2(" The exterior lips are chubby and the entrance seems eager to be packed with an ovipositor - or any phallus-shaped object.");
		else output2("\nEach vagina’s exterior lips are chubby and their entrances seem eager to be packed with ovipositors - or any other phallus-shaped objects.");
	}
	//Vanae flavor
	else if(target.vaginas[x].type == GLOBAL.TYPE_VANAE) {
		if(!eachOne) output2(" The exterior folds glisten in the light, while the inner tunnel is lined with writhing, tentacle-like feelers.");
		else output2("\nEach vagina’s exterior folds glisten in the light, while the inner tunnels are lined with writhing, tentacle-like feelers.");
	}
	//Kui-tan flavor
	else if(target.vaginas[x].type == GLOBAL.TYPE_KUITAN && target.vaginas[x].vaginaColor == "black") {
		if(!eachOne) output2(" The exterior folds are dusky black, looking almost animalistic on your body.");
		else output2("\nEach vagina’s exterior folds are dusky black, looking almost animalistic on your body.");
	}
	//Doggie flavor
	else if(target.vaginas[x].type == GLOBAL.TYPE_CANINE) {
		if(!eachOne) output2(" The exterior lips are that of a bitch and have a tendency to swell when in heat, giving it a very animalistic bent.");
		else output2("\nEach vagina’s exterior lips are that of a bitch and have a tendency to swell when in heat, giving them a very animalistic bent.");
	}
	//Siren flavor
	else if(target.vaginas[x].type == GLOBAL.TYPE_SIREN) {
		if(!eachOne) output2(" The exterior opening is framed in writhing tentacles and the interior is lined with aphrodisiac-laced cilia.");
		else output2("\nEach vagina’s exterior openings are framed in writhing tentacles and the interiors are lined with aphrodisiac-laced cilia.");
	}
	//Goblin flavor
	else if(target.vaginas[x].type == GLOBAL.TYPE_GABILANI) {
		if(!eachOne) output2(" The special muscles around your vagina are strong and powerful, making it possible to swallow any insertion without the need to push it in.");
		else output2("\nThe special muscles around your talented vaginas are strong and powerful, making it possible to swallow insertions without the need of external forces to push them in.");
	}
	//Nyrean flavor
	else if(target.vaginas[x].type == GLOBAL.TYPE_NYREA) {
		if(!eachOne) output2(" The nyrean “pussy” is very soft, warm and puffy. Its interior is coated with your [target.girlCum], ready to rear any eggs you might have the (mis)fortune of fertilizing.");
		else output2("\nEach of your nyrean “pussies” are very soft, warm and puffy. The interior is coated with your [target.girlCum], ready to rear any eggs you might have the (mis)fortune of fertilizing.");
	}
	
	//Nubby
	if(target.vaginas[x].hasFlag(GLOBAL.FLAG_NUBBY) && target.vaginas[x].type != GLOBAL.TYPE_SIREN) {
		if(!eachOne) output2(" The lips and insides are covered in numerous nub-like protrusions.");
		else output2(" Their lips and insides are covered in numerous nub-like protrusions.");
	}
	//Ovipositor
	if(target.vaginas[x].hasFlag(GLOBAL.FLAG_OVIPOSITOR))
	{
		if(!eachOne) output2(" Moving its internal muscles, you know it has the ability to lay eggs into another orifice.");
		else output2(" Moving their internal muscles, you know they have the ability to lay eggs into another orifice.");
	}
	
	if (forTarget != null) setTarget(null);
}
