import classes.Characters.PlayerCharacter;
import classes.Creature;
public function pcAppearance(e:MouseEvent = null):void 
{
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

public function appearance(target:Creature):void {
	clearOutput2();
	var rando:int = 0;
	var feedVal:int;
	if(target == pc) {
		//Overall
		if(target.originalRace == target.race()) output2("You are a " + target.originalRace + ".");
		else
		{
			output2("You started your journey as a " + target.originalRace + ", but you've become "+indefiniteArticle(target.race())+" over the course of your adventures.");
		}
		output2(" You're a good " + Math.floor(target.tallness / 12) + " feet");
		if(target.tallness % 12 != 0) output2(" and " + target.tallness % 12 + " inches");
		output2(" tall by ancient imperial measurements and " + Math.round(target.tallness * 0.0254 * 100)/100 + " meters in the more accepted metric system.");
		output2(" Right now, you're");
		if(target.armor is EmptySlot) output2(" not wearing a single scrap of armor,");
		else output2(" wearing " + target.armor.description + ",");
		if(target.lowerUndergarment is EmptySlot) output2(" going commando down south,");
		else output2(" using " + target.lowerUndergarment.longName + " for underwear,");
		if(target.upperUndergarment is EmptySlot) output2(" and letting your torso breathe, unrestricted by any undertop.");
		else output2(" and girding your upper body with " + target.upperUndergarment.description + ".");
		if(target.isNude()) {
			if(target.exhibitionism() >= 100) output2(" You're a shameless exhibitionist and proud of it, flaunting your naked body and giving the entire galaxy quite an eyeful!");
			else if(target.exhibitionism() >= 66) output2(" Your naked body is like a second outfit for you, giving you naughty thoughts when in the public's gaze.");
			else if(target.exhibitionism() >= 50) output2(" Maybe you're some kind of nudist, but it's not like you mind being naked anyway.");
			else if(target.exhibitionism() >= 33) output2(" It's okay to show some nudity once in a while, right?");
			else if(target.exhibitionism() >= 20) output2(" If anyone sees you this way, you can't help but be aroused a little.");
			else if(target.exhibitionism() == 10) output2(" If anyone sees you now, they're sure to think you're a nudist...");
			else output2(" If anyone sees you now, they're sure to think you're a nudist!");
		}

		//Face
		output2("\n\n");
		if(target.faceType == GLOBAL.TYPE_NALEEN_FACE || target.faceType == GLOBAL.TYPE_HUMAN || target.faceType == GLOBAL.TYPE_SHARK || target.faceType == GLOBAL.TYPE_SIREN || target.faceType == GLOBAL.TYPE_LAPINE || target.faceType == GLOBAL.TYPE_NAGA) {
			if(target.hasFaceFlag(GLOBAL.FLAG_SMOOTH) || target.faceType == GLOBAL.TYPE_NALEEN_FACE || target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO) output2("Your face is human in shape and structure, with " + target.skin(true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" Under your " + target.skinFurScales(true,true) + " you have a human-shaped head with " + target.skin(true,true) + ".");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" Your face is fairly human in shape, but is covered in " + target.skinFurScales(true,true) + " over " + target.skin(true,true) + ".");
			if(target.faceType == GLOBAL.TYPE_SHARK || target.faceType == GLOBAL.TYPE_SIREN) output2(" A set of razor-sharp, retractable shark-teeth fill your mouth and gives your visage a slightly angular appearance.");
			else if(target.faceType == GLOBAL.TYPE_LAPINE) output2(" The constant twitches of your nose and the length of your incisors gives your visage a hint of bunny-like cuteness.");
			else if(target.faceType == GLOBAL.TYPE_NAGA) output2(" A set of retractable, needle-like fangs sit in place of your canines and are ready to dispense their venom.");
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
				output2(" Your face is human in shape and structure, with " + target.skin(true,true));
				if((target.skinTone == "ebony" || target.skinTone == "black") && (target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO)) output2(", though with your dusky hue, the black kui-tan mask you sport isn't properly visible.");
				else output2(", though it is decorated with a sly-looking kui-tan mask over your eyes.");
			}
			//appearance furscales
			else {
				//(black/midnight furscales)
				if(((target.hairColor == "black" || target.hairColor == "midnight") && (target.skinType == GLOBAL.SKIN_TYPE_FUR || target.skinType == GLOBAL.SKIN_TYPE_SCALES))) output2(" Under your " + target.skinFurScales(true,true) + " hides a black kui-tan mask, barely visible due to your inky hue, and");
				else 
				{
					if(pc.hasScales()) output2(" Your " + target.skinFurScales(true,true) + " are decorated with a sly-looking kui-tan mask, and under them");
					else output2(" Your " + target.skinFurScales(true,true) + " is decorated with a sly-looking kui-tan mask, and under it");
				}
				output2(" you have a human-shaped head with " + target.skin(true,true) + ".");
			}
		}
		else if(target.faceType == GLOBAL.TYPE_KUITAN) {
			output2(" You have a triangular kui-tan face, replete with sensitive whiskers and a little black nose; a mask shades the space around your eyes, set apart from your " + target.skinFurScales() + " by a band of white.");
			//(if skin)
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN) output2(" It looks a bit strange with only the skin and no fur.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" The presence of said scales gives your visage an eerie look, more reptile than mammal.");
		}
		else if(target.faceType == GLOBAL.TYPE_VULPINE) {
			output2(" You have a tapered, shrewd-looking vulpine face with a speckling of downward-curved whiskers just behind the nose.");
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN) output2(" Oddly enough, there's no fur on your animalistic muzzle, just " + target.skinFurScales(true,true) + "."); 
			else if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" A coat of " + target.skinFurScales(true,true) + " decorates your muzzle.");
			else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" Strangely, " + target.skinFurScales(true,true) + " adorn every inch of your animalistic visage.");
		}
		else if(target.faceType == GLOBAL.TYPE_MOUSEMAN) {
			//appearance
			output2(" Your face is generally human in shape and structure, with " + target.skin(true,true));
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR || target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" under your " + target.skinFurScales(true,true));
			output2(" and mousey buckteeth.");
		}
		else if(target.faceType == GLOBAL.TYPE_MOUSE) {
			//appearance
			output2(" You have a snubby, tapered mouse's face, with whiskers, a little pink nose, and ");
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.skinType != GLOBAL.SKIN_TYPE_SCALES) output2(target.skin(true,true));
			else output2(target.skin(true,true) + " under your " + target.skinFurScales(true,true));
			output2(". Two large incisors complete it.");
		}
		//Naga
		if(target.faceType == GLOBAL.TYPE_SNAKE) {
			output2(" You have a face that resembles a combination between a human's and a snake's,");
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN) output2(" oddly uncovered by scales. Instead, your snake-like snout is covered in " + target.skin(true,true) + ".");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" covered in a layer of " + target.skinFurScales(true,true) + ".");
			if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" covered in " + target.skinFurScales(true,true) + ", as one would expect of such a reptilian visage.");
			output2("In addition, a pair of poisonous fangs protrude from your mouth over your lower lip.");
		}
		//horse-face
		if(target.faceType == GLOBAL.TYPE_EQUINE) {
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(" Your face is equine in shape and structure. The odd visage is hairless and covered with " + target.skinFurScales(true,true) + ".");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" Your face is almost entirely equine in appearance, even having " + target.skinFurScales() + ". Underneath the fur, you believe you have " + target.skin(true,false) + ".");
			if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" You have the face and head structure of a horse, overlaid with " + target.skinFurScales(true,true) + ".");
		}
		//dog-face
		if(target.faceType == GLOBAL.TYPE_CANINE) {
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(" You have a dog-like face, complete with a wet nose. The odd visage is hairless and covered with " + target.skinFurScales(true,true) + ".");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" You have a dog's face, complete with wet nose and panting tongue. You've got " + target.skinFurScales(true,true) + ", hiding your " + target.skin(true,true) + " underneath your furry visage.");
			if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" You have the facial structure of a dog, wet nose and all, but overlaid with " + target.skinFurScales(true,true) + ".");
		}
		//cat-face
		if(target.faceType == GLOBAL.TYPE_FELINE) {
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(" You have a cat-like face, complete with a cute, moist nose and whiskers. The " + target.skin(true,true) + " that is revealed by your lack of fur looks quite unusual on so feline a face.");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" You have a cat-like face, complete with moist nose and whiskers. Your " + target.skinFurScales(true,true) + " hides " + target.skin(true,true) + " underneath.");
			if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" Your facial structure blends humanoid features with those of a cat. A moist nose and whiskers are included, but overlaid with " + target.skinFurScales(true,true) + ".");
		}
		//Minotaaaauuuur-face
		if(target.faceType == GLOBAL.TYPE_BOVINE) {
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(" You have a face resembling that of an anthropomorphic bovine, with cow-like features, particularly a squared off wet nose. Despite your lack of fur elsewhere, your visage does have a short layer of " + target.furColor + " fuzz.");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" You have a face resembling that of an anthropomorphic bovine, with cow-like features, particularly a squared off wet nose. Your " + target.skinFurScales(true,true) + " thickens noticably on your head, looking shaggy and more than a little monstrous once laid over your visage.");
			if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" Your face resembles an anthropomorphic bovine's, though strangely, it is covered in shimmering scales, right up to the flat, cow-like nose that protrudes from your face.");
		}
		//Panda-face
		if(target.faceType == GLOBAL.TYPE_PANDA) {
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(" You have a face resembling that of an anthropomorphic panda, with a short muzzle and black nose. Despite your lack of fur elsewhere, your visage does have a short layer of " + target.furColor + " fuzz.");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" You have a face resembling that of an anthropomorphic panda, with a short muzzle and black nose. Your " + target.skinFurScales(true,true) + " hides " + target.skin(true,true) + " underneath.");
			if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" Your face resembles an anthropomorphic panda's, though strangely, it is covered in shimmering scales, right up to your black nose.");
		}
		//Lizard-face
		if(target.faceType == GLOBAL.TYPE_LIZAN) {
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(" You have a face resembling that of a lizard, and with your toothy maw, you have quite a fearsome visage. The reptilian visage does look a little odd with just " + target.skin(true,true) + " and not a single scale.");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" You have a face resembling that of a lizard. Between the toothy maw, pointed snout, and the layer of " + target.skinFurScales(true,true) + " covering your face, you have quite the fearsome visage.");
			if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" Your face is that of a lizard, complete with a toothy maw and pointed snout. " + upperCase(target.skinFurScales(true,true)) + " complete the look, making you look quite fearsome.");
		}
		if(target.faceType == GLOBAL.TYPE_BADGER)
		{
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN || target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(" Your head pushes out into a curiously hairless badger-face, covered only with " + target.skin(true,true) + ".");
			if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" Your head pushes out into a muzzle with white fur across your nose and mouth as well as in a wide stripe up the center of your brow, giving you the appearance of a humanoid badger. The rest of it is wrapped in " + target.skinFurScales(true,true) + " that covers your " + target.skin(true,true) + ".");
			if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(" Your head pushes out into a muzzle with white scales across your nose and mouth as well as in a wide stripe up the center of your brow, giving you the appearance of a humanoid, scaled badger. The rest of it is wrapped in " + target.skinFurScales(true,true) + " that covers your " + target.skin(true,true) + ".");
		}
		if(target.faceType == GLOBAL.TYPE_DRACONIC) {
			output2(" Your face is a narrow, reptilian muzzle. It looks like a predatory lizard's at first glance, but with an unusual array of spikes along the under-jaw. It gives you a regal but fierce visage. Opening your mouth reveals several rows of dagger-like sharp teeth. The fearsome visage is decorated by " + target.skinFurScales(true,true) + ".");
		}
		if(target.faceType == GLOBAL.TYPE_KANGAROO) {
			output2(" Your face is ");
			output2("shaped like that of a kangaroo ");
			if(target.skinType == GLOBAL.SKIN_TYPE_SKIN) output2("but bald, not covered in fur");
			else output2("and covered with " + target.skinFurScales(true,true));
			output2(". It's almost rabbit-like, except for the length of your muzzle.");
		}

		//M/F stuff!
		output2(" Overall, your visage has " + target.faceDesc() + ".");
		//Eyes
		if(target.eyeType == GLOBAL.TYPE_ARACHNID) 
		{
			output2(" In addition to your primary two eyes, you have a second, smaller pair on your forehead");
			if(target.eyeColor == "silver" || target.eyeColor == "copper" || target.eyeColor == "gold" || target.eyeColor == "sable") output2(", all of which reflect back a metallic " + target.eyeColor + " in the light.");
			else if(target.eyeColor == "emerald" || target.eyeColor == "crimson" || target.eyeColor == "violet" || target.eyeColor == "amber") output2(", all of which shimmer " + target.eyeColor + " in the light like jewels.");
			else output2(", all of which are " + target.eyeColor + ".");
		}
		else if(target.eyeType == GLOBAL.TYPE_FELINE || target.eyeType == GLOBAL.TYPE_SNAKE) 
		{
			output2(" Your eyes bear a vertical slit instead of rounded pupils, ");
			if(target.eyeColor == "silver" || target.eyeColor == "copper" || target.eyeColor == "gold" || target.eyeColor == "sable") output2("surrounded by a metallically glistening " + target.eyeColor + " iris.");
			else if(target.eyeColor == "emerald" || target.eyeColor == "crimson" || target.eyeColor == "violet" || target.eyeColor == "amber") output2("surrounded by a gem-like shimmering " + target.eyeColor + " iris.");
			else output2("surrounded by a " + target.eyeColor + " iris.");
		}
		else if (target.eyeType == GLOBAL.TYPE_LEITHAN)
		{
			output2(" Your eyes each feature a secondary pupil, ");
			if (target.eyeColor == "blue")
			{
				output2("forming an intensely striking symbol of infinity nestled as they are amongst a single brilliantly bright blue iris.");
			}
			else if(target.eyeColor == "silver" || target.eyeColor == "copper" || target.eyeColor == "gold" || target.eyeColor == "sable") output2("both embedded in a single, overly large metallical " + target.eyeColor + " iris.");
			else if(target.eyeColor == "emerald" || target.eyeColor == "crimson" || target.eyeColor == "violet" || target.eyeColor == "amber") output2("both embedded in a single shimmering " + target.eyeColor + " iris.");
			else output2("surrounded by a single " + target.eyeColor + " iris.");
		}
		else 
		{
			if (target.eyeColor == "silver" || target.eyeColor == "copper" || target.eyeColor == "gold" || target.eyeColor == "sable") output2(" Metallically glistening " + target.eyeColor + " eyes allow you to take in your surroundings without trouble.");
			else if (target.eyeColor == "emerald" || target.eyeColor == "crimson" || target.eyeColor == "violet" || target.eyeColor == "amber") output2(" Like jewels, shimmering " + target.eyeColor + " eyes allow you to take in your surroundings without trouble.");
			//Vanae eyes
			else if(target.eyeColor == "luminous violet" || target.eyeColor == "luminous purple" || target.eyeColor == "luminous blue" || target.eyeColor == "luminous pink" || target.eyeColor == "luminous orange" || target.eyeColor == "luminous green" || target.eyeColor == "luminous silver" || target.eyeColor == "glowing gold") output2(" Like twinkling beacons, " + target.eyeColor + " eyes seem to draw the attention of everyone around you.");
			else output2(" Fairly unremarkable " + target.eyeColor + " eyes allow you to take in your surroundings without trouble.");
		}
		//Hair
		//if bald
		if(pc.hairLength == 0) {
			if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" You have no hair, only a thin layer of fur atop of your head. ");
			else output2(" You have no hair, showing only shiny " + target.skinFurScales() + " where your hair should be.");
			if(pc.earType == GLOBAL.TYPE_EQUINE) output2(" A pair of horse-like ears rise up from the top of your skull.");
			else if(pc.earType == GLOBAL.TYPE_CANINE) output2(" A pair of pointed ausar-like ears protrude from your skull, pointed and alert.");
			else if(pc.earType == GLOBAL.TYPE_BOVINE) output2(" A pair of round, floppy cow ears protrude from the sides of your skull.");
			else if(pc.earType == GLOBAL.TYPE_DRIDER) output2(" A pair of large pointy ears stick out from your skull.");
			else if(pc.earType == GLOBAL.TYPE_FELINE) output2(" A pair of cute, fuzzy cat-like ears have sprouted from the top of your skull.");
			else if(pc.earType == GLOBAL.TYPE_LIZAN) output2(" A pair of rounded protrusions with small holes on the sides of your skull serve as your ears.");
			else if(pc.earType == GLOBAL.TYPE_LAPINE || pc.earType == GLOBAL.TYPE_LEITHAN) output2(" A pair of floppy rabbit ears stick up from the top of your skull, flopping around as you walk.");
			else if(pc.earType == GLOBAL.TYPE_KANGAROO) output2(" A pair of long, furred kangaroo ears stick out from your skull at an angle.");
			else if(pc.earType == GLOBAL.TYPE_VULPINE) output2(" A pair of large, adept fox ears sit high on your skull, always listening.");
			else if(pc.earType == GLOBAL.TYPE_DRACONIC) output2(" A pair of rounded protrusions with small holes on the sides of your skull serve as your ears. Bony fins sprout behind them.");
			else if(pc.earType == GLOBAL.TYPE_KUITAN) output2(" A pair of vaguely egg-shaped, furry raccoon ears adorns your skull.");
			else if(pc.earType == GLOBAL.TYPE_MOUSE) output2(" A pair of large, dish-shaped mouse ears tops your skull.");
			else if(pc.earType == GLOBAL.TYPE_VANAE) output2(" A pair of pointed, finned ears tops your skull.");
			else if(pc.earType == GLOBAL.TYPE_PANDA) output2(" A pair of rounded, panda-like ears protrude from your skull, " + pc.mf("standing tall and proud","looking absolutely adorable") + ".");
			else if(pc.earType == GLOBAL.TYPE_RASKVEL) output2(" A pair of long raskvel ears dangle from your skull down past your waist.");
			else if(pc.earType == GLOBAL.TYPE_SYLVAN) 
			{
				if(pc.earLength <= 1) output2(" A pair of mostly-human ears with slightly pointed tips protrude from the sides of your skull, just like a fantasy elf's.");
				//2-4 inches: 
				else if(pc.earLength <= 4) output2(" A pair of triangular, elven ears protrude from the sides of your skull, sticking out a full " + num2Text(pc.earLength) + " inches from the sides of your head. Small extra muscles let them twitch or droop expressively.");
				//5+ inches:
				else output2(" A pair of exquisitely long, elf-like ears extend a full " + num2Text(pc.earLength) + " inches from the sides of your head, triangular in shape with a bit of downward curve along their length. A thought is all it takes for them to change their angle to suit your expression, letting even the most rugged face pull off a cutesy pout with ease.");
			}
			if(pc.antennae == 2) output2(" Floppy antennae also appear on your head, bouncing and swaying in the breeze.");
		}
		//not bald
		else {
			if(pc.earType == GLOBAL.TYPE_HUMAN) output2(" Your " + target.hairDescript(true,true) + " looks good on you, accentuating your features well.");
			else if(pc.earType == GLOBAL.TYPE_EQUINE) output2(" The " + target.hairDescript(true,true) + " on your head parts around a pair of very horse-like ears that grow up from your head.");
			else if(pc.earType == GLOBAL.TYPE_CANINE) output2(" The " + target.hairDescript(true,true) + " on your head is overlapped by a pair of pointed dog ears.");
			else if(pc.earType == GLOBAL.TYPE_BOVINE) output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of rounded cow ears that stick out sideways.");
			else if(pc.earType == GLOBAL.TYPE_DRIDER) output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of cute pointed ears, bigger than your old human ones.");
			else if(pc.earType == GLOBAL.TYPE_FELINE) output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of cute, fuzzy feline ears, sprouting from atop your head and pivoting towards any sudden noises.");
			else if(pc.earType == GLOBAL.TYPE_LIZAN) output2(" The " + target.hairDescript(true,true) + " atop your head makes it nigh-impossible to notice the two small rounded openings that are your ears.");
			else if(pc.earType == GLOBAL.TYPE_LAPINE || pc.earType == GLOBAL.TYPE_LEITHAN) output2(" A pair of floppy rabbit ears stick up out of your " + target.hairDescript(true,true) + ", bouncing around as you walk.");
			else if(pc.earType == GLOBAL.TYPE_KANGAROO) output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of long, furred kangaroo ears that stick out at an angle.");
			else if(pc.earType == GLOBAL.TYPE_VULPINE) output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of large, adept fox ears that always seem to be listening.");
			else if(pc.earType == GLOBAL.TYPE_DRACONIC) output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of rounded protrusions with small holes on the sides of your head serve as your ears. Bony fins sprout behind them.");
			else if(pc.earType == GLOBAL.TYPE_KUITAN) output2(" The " + target.hairDescript(true,true) + " on your head parts around a pair of egg-shaped, furry raccoon ears.");
			else if(pc.earType == GLOBAL.TYPE_MOUSE) output2(" The " + target.hairDescript(true,true) + " atop your head is funneled between and around a pair of large, dish-shaped mouse ears that stick up prominently.");
			else if(pc.earType == GLOBAL.TYPE_VANAE) output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a pair of pointed, fin-like ears, sensitive to the slightest sound.");
			else if(pc.earType == GLOBAL.TYPE_PANDA) output2(" The " + target.hairDescript(true,true) + " on your head is parted by a pair of round panda ears.");
			else if(pc.earType == GLOBAL.TYPE_RASKVEL) output2(" The " + target.hairDescript(true,true) + " atop your head is parted by a long pair of raskvel ears that dangle down past your waist.");
			else if(pc.earType == GLOBAL.TYPE_SYLVAN) 
			{
				if(pc.earLength <= 1) output2(" The " + target.hairDescript(true,true) + " on your head nearly conceals a pair of mostly-human ears with slightly pointed tips, just like a fantasy elf's.");
				//2-4 inches: 
				else if(pc.earLength <= 4) output2(" The " + target.hairDescript(true,true) + " on your head can't hide a pair of triangular, elven ears. They stick out a full " + num2Text(pc.earLength) + " inches from the sides of your head. Small extra muscles let them twitch or droop expressively.");
				//5+ inches:
				else output2(" The " + target.hairDescript(true,true) + " atop your head can't possibly hide a pair of exquisitely long, elf-like ears. They extend a full " + num2Text(pc.earLength) + " inches from the sides of your head, triangular in shape with a bit of downward curve along their length. A thought is all it takes for them to change their angle to suit your expression, letting even the most rugged face pull off a cutesy pout with ease.");
			}
			if(pc.antennae == 2) {
				if(pc.earType == GLOBAL.TYPE_LAPINE) output2(" Limp antennae also grow from just behind your hairline, waving and swaying in the breeze with your ears.");
				else output2(" Floppy antennae also grow from just behind your hairline, bouncing and swaying in the breeze.");
			}
		}
		if(pc.earType == GLOBAL.TYPE_LEITHAN) output2(" In addition, pointed elfin ears jut out below them, giving you exceptional hearing.");
		//Tongue
		if(pc.tongueType == GLOBAL.TYPE_NAGA || pc.tongueType == GLOBAL.TYPE_SNAKE) output2(" A snake-like [pc.tongueNoun] occasionally flits between your lips, tasting the air.");
		else if(pc.tongueType == GLOBAL.TYPE_DEMONIC) output2(" A slowly undulating [pc.tongueNoun] occasionally slips from between your lips. It hangs nearly two feet long when you let the whole thing slide out, though you can retract it to appear normal.");
		else if(pc.tongueType == GLOBAL.TYPE_DRACONIC) output2(" Your mouth contains a thick, fleshy [pc.tongueNoun] that, if you so desire, can telescope to a distance of about four feet. It has sufficient manual dexterity that you can use it almost like a third arm.");
		else if(pc.tongueType == GLOBAL.TYPE_LEITHAN) output2(" Your mouth contains a narrow but flexible [pc.tongueNoun] that, if you so desire, can extend a good distance out from your mouth. Its tip is forked, and you are capable of moving it around in an almost prehensile manner.");
		else if(pc.tongueType == GLOBAL.TYPE_RASKVEL) output2(" Your mouth contains a thick, purple tongue that, if you so desire, can extend a fair portion from your mouth. Its tip is blunted slightly.");
		else if(pc.tongueType == GLOBAL.TYPE_OVIR)
		{
			if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output2(" A lengthy, tapered tongue fills your mouth, able to stretch out almost nine inches in order to taste the very air.");
			else output2(" A tapered tongue fills your mouth, able to taste the very air when extended beyond your oral cavity.");
		}
		else if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output2(" Your mouth contains a lengthy tongue.");
		else output2(" Your mouth contains a [pc.tongue].");

		//Horns
		if(pc.horns > 0)
		{
			//Demonic horns
			if(pc.hornType == GLOBAL.TYPE_DEMONIC) {
				if(pc.horns <= 2) output2(" A small pair of pointed horns has broken through the " + pc.skin() + " on your forehead, proclaiming some demonic taint to any who see them.");
				else if(pc.horns <= 4) output2(" A quartet of prominent horns has broken through your " + pc.skin() + ". The back pair are longer, and curve back along your head. The front pair protrude forward demonically.");
				else if(pc.horns <= 6) output2(" Six horns have sprouted through your " + pc.skin() + ", the back two pairs curve backwards over your head and down towards your neck, while the front two horns stand almost eight inches long upwards and a little forward.");
				else output2(" A large number of thick demonic horns sprout through your " + pc.skin() + ", each pair sprouting behind the ones before. The front jut forwards nearly ten inches while the rest curve back over your head, some of the points ending just below your ears. You estimate you have a total of " + num2Text(pc.horns) + " horns.");	
			}
			//Minotaur horns
			if(pc.hornType == GLOBAL.TYPE_BOVINE) {
				if(pc.hornLength < 1) output2(" Two tiny horn-like nubs protrude from your forehead, resembling the horns of the young livestock kept by terrans.");
				else if(pc.hornLength < 2) output2(" Two small, roughly 1\" long bovine horns protrude from your forehead. They're kind of cute, actually.");
				else if(pc.hornLength < 3) output2(" Two bovine horns, approximately two inches in length, jut from your forehead.");
				else if(pc.hornLength < 4) output2(" A pair of bovine horns jut a full three inches from your forehead.");
				else if(pc.hornLength < 5) output2(" Two horns protrude through the [pc.skin] of your forehead. Each is about four inches in length and impossible to ignore.");
				else if(pc.hornLength < 6) output2(" Two big, strong bovine horns jut from your forehead. Their weight is a constant reminder just how much you look like a " + pc.mf("bull","cow") + ".");
				else if(pc.hornLength < 8) output2(" Roughly half a foot of powerful, bovine horn protrudes from your skull. All you have to do is lower your head, and suddenly, you look quite dangerous.");
				else if(pc.hornLength < 12) output2(" Two large horns sprout from your forehead, curving forwards like those of a bull.");
				else if(pc.hornLength < 20) output2(" Two very large and dangerous looking horns sprout from your head, curving forward and over a foot long. They have dangerous looking points.");
				else output2(" Two huge horns erupt from your forehead, curving outward at first, then forwards. The weight of them is heavy, and they end in dangerous looking points.");
			}
			//Lizard horns
			else if(pc.hornType == GLOBAL.TYPE_LIZAN) {
				if(pc.horns == 2) output2(" A pair of " + num2Text(int(pc.hornLength)) + "-inch horns grow from the sides of your head, sweeping backwards and adding to your imposing visage.");
				//Super lizard horns
				else output2(" Two pairs of horns, roughly a foot long, sprout from the sides of your head. They sweep back and give you a fearsome look, almost like the dragons from terran legends.");
			}
			//Antlers!
			else if(pc.hornType == GLOBAL.TYPE_DEER) {
				if(pc.horns > 0) output2(" Two antlers, forking into " + num2Text(pc.horns) + " points, have sprouted from the top of your head, forming a spiky, regal crown of bone.");
			}
			//Goatliness is next to godliness.
			else if(pc.hornType == GLOBAL.TYPE_GOAT)
			{
				if(pc.horns > 0) output2(" Two curled ram horns twist back from your forehead, curling over your [pc.ears] like a satyr out of terran legend.");
			}
		}
		else if(pc.hasStatusEffect("Horn Bumps")) output2(" <b>Your forehead is red and irritated in two different places. The upraised bumps stand out quite visibly.</b>");
		//BODY PG HERE
		output2("\n\nYou have a humanoid upper body with the usual torso, arms, hands, and fingers");
		if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2(", mostly covered in a layer of " + target.skinFurScales(true, true));
		else if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2(", covered in a layer of " + target.skinFurScales(true, true));
		else if(target.skinType == GLOBAL.SKIN_TYPE_CHITIN) output2(", covered in a layer of " + target.skinFurScales(true, true));
		else if(target.skinType == GLOBAL.SKIN_TYPE_GOO) output2(", all of them glittering, semi-transparent goo");
		if(target.wingType != GLOBAL.TYPE_HUMAN) {
			output2(", and ");
			//WINGS!
			if(target.wingType == GLOBAL.TYPE_SMALLBEE) output2("a pair of insect-like wings sprout from your back, too small to allow you to fly. They shimmer beautifully in the light.");
			if(target.wingType == GLOBAL.TYPE_BEE) output2("a pair of large, insectile wings sprout from your back, reflecting the light through their clear membranes beautifully. They'll bear your weight if you choose to fly.");
			if(target.wingType == GLOBAL.TYPE_SMALLDEMONIC) output2("a pair of tiny bat-like demon-wings sprout from your back, flapping cutely, otherwise of little use.");
			if(target.wingType == GLOBAL.TYPE_DEMONIC) output2("a pair of large bat-like demon-wings fold behind your shoulders. With a muscle-twitch, you can extend them, and use them to soar gracefully through the air.");
			if(target.wingType == GLOBAL.TYPE_SHARK) output2("a large shark-like fin has sprouted between your shoulder blades. With it you have far more control over swimming underwater.");
			if(target.wingType == GLOBAL.TYPE_AVIAN) output2("a pair of large, feathery wings sprout from your back. Though you usually keep the " + target.hairColor + "-colored wings folded close, they can unfurl to allow you to soar as gracefully as a bird.");
			if(target.wingType == GLOBAL.TYPE_SMALLDRACONIC) output2("small, vestigial wings sprout from your shoulders. They might look like bat's wings, but the membranes are covered in fine, delicate scales.");
			else if(target.wingType == GLOBAL.TYPE_DRACONIC) output2("magnificent wings sprout from your shoulders. When unfurled they stretch further than your arm span, and a single beat of them is all you need to set out toward the sky. They look a bit like bat's wings, but the membranes are covered in fine, delicate scales and a wicked talon juts from the end of each bone.");
			else if(target.wingType == GLOBAL.TYPE_DRAGONFLY) output2("giant dragonfly wings hang from your shoulders. At a whim, you could twist them into a whirring rhythm fast enough to lift you off the ground and allow you to fly.");
			else if(target.wingType == GLOBAL.TYPE_SYLVAN) output2("a quartet of blue gossamer wings sprout from your back, displaying a prismatic sheen when they flap. Despite their delicate appearance they have no problem carrying you aloft, and can fold up safely against your back for protection");
			else if(target.wingType == GLOBAL.TYPE_DARK_SYLVAN) output2("a quartet of gossamer wings sprout from your back, glittering black with a pattern that makes them look as though they’re coated in wisps of shadow when they flap. Despite their delicate appearance they have no problem carrying you aloft, and can fold up safely against your back for protection.");
		}
		else output2(".");
		//Vanaebutt Skin
		if(pc.hasStatusEffect("Vanae Markings")) output2(" Swirls of " + pc.skinAccent + " trace brighter accents across much of your form.");
		// Muscles - Sweaty ( Shazam Remix )
		if(pc.hasStatusEffect("Sweaty"))
		{
			output2(" In addition, your body");
			if(pc.statusEffectv1("Sweaty") <= 1) output2(" is sprinkled with a light layer");
			else if(pc.statusEffectv1("Sweaty") <= 2) output2(" glistens with visible layers");
			else if(pc.statusEffectv1("Sweaty") <= 4) output2(" is covered in multiple layers");
			else output2(" looks soaked, completely drenched in thick layers");
			output2(" of sweat, signaling the exertion of your previous physical activities.");
		}
		//Wing arms
		if(target.armType == GLOBAL.TYPE_AVIAN) output2(" Feathers hang off your arms from shoulder to wrist, giving them a slightly wing-like look.");
		else if(target.armType == GLOBAL.TYPE_LEITHAN) 
		{
			output2(" Small claws protrude from the tips of your fingers in place of fingernails");
			if(target.skinType != GLOBAL.SKIN_TYPE_SCALES) output2(", and your arms are covered in scales up to the shoulders");
			output2(".");
		}
		else if(target.armType == GLOBAL.TYPE_EQUINE) output2(" Hard, hoof-like tips have grown in place of fingernails, covering the end of each digit in shiny black. You can still feel through them all the same.")
		else if(target.armType == GLOBAL.TYPE_CANINE) 
		{
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR) output2(" A coat of " + pc.furColor + " fur covers your arms, giving them a distinctly animalistic bent.");
			output2(" Your fingers are tipped with short, canine claws as well, just like one of the ausar.");
		}
		else if(target.armType == GLOBAL.TYPE_ARACHNID || target.armType == GLOBAL.TYPE_DRIDER || target.armType == GLOBAL.TYPE_BEE) output2(" Shining black exoskeleton covers your arms from the biceps down, resembling a pair of long black gloves from a distance.");	
		else if(target.armType == GLOBAL.TYPE_FELINE) 
		{
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR) output2(" A coat of " + pc.furColor + " fur covers your arms, giving them a distinctly animalistic bent.");
			output2(" Your hands are still largely human in shape and dexterity aside from the fairly feline claws that have replaced your fingernails.");
		}
		else if(target.armType == GLOBAL.TYPE_PANDA) 
		{
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR) output2(" A coat of " + pc.furColor + " fur covers your arms, giving them a distinctly animalistic bent.");
			output2(" Your fingers are thick and capped with bear-like claws but maintain their human opposability.");
		}
		else if(target.armType == GLOBAL.TYPE_KUITAN)
		{
			if(target.hasFur()) output2(" Dark brown pads rest on the pads of each of your fingers. ");
			else output2(" A coat of " + pc.furColor + " fur covers your arms below the shoulders, and your fingers are tipped with dark brown pads. ");
			output2("They're softer and more supple than the finest leather.");
		}
		else if(target.armType == GLOBAL.TYPE_BADGER) 
		{
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR) output2(" A coat of thick " + pc.furColor + " fur covers your arms while claws tip your fingers.");
			else output2(" Claws tip your fingers.");
			output2(" These claws aren’t very long or sharp, and you get the feeling that the only thing they’re truly useful for is digging into someone’s skin emphatically while you’re fucking them roughly.");
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
				if (feedVal < 8)
				{
					output2(" Your hand");
					if (bothHands) output2("s");
					output2(" appear");
					if (!bothHands) output2("s");
					output2(" to be slightly distended.");
				}
				else if (feedVal < 13)
				{
					output2(" Your hand");
					if (bothHands) output2("s");
					output2(" appear");
					if (!bothHands) output2("s");
					output2(" puffy and inflated.");
				}
				else
				{
					output2(" Your hand");
					if (bothHands) output2("s");
					output2(" appear");
					if (!bothHands) output2("s");
					output2(" unusually large, almost engorged.");
				}
			}
		}
		//Done with head bits. Move on to body stuff
		//Horse legType, other legType texts appear lower
		if(target.legType == GLOBAL.TYPE_MLP) output2(" From the waist down, you have an incredibly cute and cartoonish parody of a horse's body, with all four legs ending in flat, rounded feet.");
		else if(target.legType == GLOBAL.TYPE_LIZAN && target.legCount == 6) output2(" From the waist down, you have a powerful, six-legged body that looks like a crossbreed of a lizard and a horse.")
		else if(target.isTaur()) output2(" From the waist down, you have a bestial, " + num2Text(target.legCount) + "-legged form vaguely like that of a horse.");
		//Hip info only displays if you aren't a centaur. 
		if(!target.isTaur()) {
			if(target.thickness > 70) {
				output2(" You have " + target.hipsDescript());
				if(target.hipRating() < 6) {
					if(target.tone < 65) output2(" buried under a noticeable muffin-top, and");
					else output2(" that blend into your pillar-like waist, and");
				}
				if(target.hipRating() >= 6 && target.hipRating() < 10) output2(" that blend into the rest of your thick form, and");
				if(target.hipRating() >= 10 && target.hipRating() < 15) output2(" that would be much more noticeable if you weren't so wide-bodied, and");
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
				output2(" You have " + pc.hipsDescript());
				if(target.hipRating() < 6) output2(", and");
				if(target.femininity > 50) {
					if(target.hipRating() >= 6 && target.hipRating() < 10) output2(" that draw the attention of those around you, and");
					if(target.hipRating() >= 10 && target.hipRating() < 15) output2(" that make you walk with a sexy, swinging gait, and");
					if(target.hipRating() >= 15 && target.hipRating() < 20) output2(" that make it look like you've birthed many children, and");
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
				if(target.buttRating() >= 20) output2(" is obscenely large, bordering freakish, even for a horse.");
			}
			//GIRL LOOK AT DAT BOOTY
			else {
				output2(" Your " + target.buttDescript());
				if(target.buttRating() < 4) output2(" is barely noticable, showing off the muscles of your haunches.");
				if(target.buttRating() >= 4 && target.buttRating() < 6) output2(" matches your toned equine frame quite well.");
				if(target.buttRating() >= 6 && target.buttRating() <10) output2(" gives hints of just how much muscle you could put into a kick.");
				if(target.buttRating() >= 10 && target.buttRating() < 15) output2(" surges with muscle whenever you trot about.");
				if(target.buttRating() >= 15 && target.buttRating() < 20) output2(" flexes its considerable mass as you move.");
				if(target.buttRating() >= 20) output2(" is stacked with layers of muscle, huge even for a horse.");
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
				if(target.buttRating() >= 15 && target.buttRating() < 20) output2(" wobbles like a bowl full of jello as you walk.");
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
		//TAILS
		if(target.tailType == GLOBAL.TYPE_EQUINE) output2(" A long " + target.hairColor + " horsetail hangs from your " + target.buttDescript() + ", smooth and shiny.");
		else if(target.tailType == GLOBAL.TYPE_CANINE) output2(" A fuzzy " + target.furColor + " dogtail sprouts just above your " + target.buttDescript() + ", wagging to and fro whenever you are happy.");
		else if(target.tailType == GLOBAL.TYPE_DEMONIC) output2(" A narrow tail ending in a spaded tip curls down from your " + target.buttDescript() + ", wrapping around your " + target.leg() + " sensually at every opportunity.");
		else if(target.tailType == GLOBAL.TYPE_BOVINE) 
		{
			if(target.tailCount == 1) output2(" A long cow tail with a puffy tip swishes back and forth as if swatting at flies.");
			else output2(" " + upperCase(num2Text(target.tailCount)) + " long cow tails with puffy tips swish back and forth as if swatting at flies.");
		}
		else if(target.tailType == GLOBAL.TYPE_DRIDER || target.tailType == GLOBAL.TYPE_ARACHNID) {
			output2(" A large, spherical spider-abdomen has grown out from your backside, covered in shiny black chitin. Though it's heavy and bobs with every motion, it doesn't seem to slow you down.");
			if(target.tailVenom > 50 && target.tailVenom < 80) output2(" Your bulging arachnid posterior feels fairly full of webbing.");
			if(target.tailVenom >= 80 && target.tailVenom < 100) output2(" Your arachnid rear bulges and feels very full of webbing.");
			if(target.tailVenom == 100) output2(" Your swollen spider-butt is distended with the sheer amount of webbing it's holding.");
		}
		else if(target.tailType == GLOBAL.TYPE_BEE) {
			output2(" A large, insectile abdomen dangles from just above your backside, bobbing with its own weight as you shift. It is covered in hard black chitin and tipped with a needle-like stinger.");
			/*
			if(target.tailVenom > 50 && target.tailVenom < 80) output2(" A single drop of poison hangs from your exposed stinger.");
			if(target.tailVenom >= 80 && target.tailVenom < 100) output2(" Poisonous bee venom coats your stinger completely.");
			if(target.tailVenom == 100) output2(" Venom drips from your poisoned stinger regularly.");*/
		}
		else if(target.tailType == GLOBAL.TYPE_SHARK || target.tailType == GLOBAL.TYPE_SIREN) {
			output2(" A long shark-tail trails down from your backside, swaying to and fro while giving you a dangerous air.");
		}
		else if(target.tailType == GLOBAL.TYPE_FELINE) {
			if(target.tailCount == 1) output2(" A soft " + target.hairColor + " cat-tail sprouts just above your " + target.buttDescript() + ", curling and twisting with every step to maintain perfect balance.");
			else output2(" " + upperCase(num2Text(target.tailCount)) + " soft, " + target.hairColor + " cat-tails sprout just above your " + target.buttDescript() + ", curling and twisting with every step to maintain perfect balance.");
		}
		else if(target.tailType == GLOBAL.TYPE_LIZAN) {
			output2(" A tapered tail hangs down from just above your " + target.buttDescript() + ". It sways back and forth, assisting you with keeping your balance.");
		}
		else if(target.tailType == GLOBAL.TYPE_LAPINE) output2(" A short, soft bunny tail sprouts just above your " + target.buttDescript() + ", twitching constantly whenever you don't think about it.");
		else if(target.tailType == GLOBAL.TYPE_AVIAN) output2(" A tail of feathers fans out from just above your " + target.buttDescript() + ", twitching instinctively to help guide you if you were to take flight.");
		else if(target.tailType == GLOBAL.TYPE_KANGAROO) {
			output2(" A conical, ");
			if(target.skinType == GLOBAL.SKIN_TYPE_GOO) output2("gooey, " + target.skinTone);
			else output2("furry, " + target.hairColor);
			output2(", tail extends from your " + target.buttDescript() + ", bouncing up and down as you move and helping to counterbalance you.");
		}
		else if(target.tailType == GLOBAL.TYPE_VULPINE) {
			if(target.tailCount == 1) output2(" A swishing, colorful fox's brush extends from your " + target.buttDescript() + ", curling around your body - the soft fur feels lovely.");
			else output2(" " + upperCase(num2Text(target.tailCount)) + " swishing, colorful fox's tails extend from your " + target.buttDescript() + ", curling around your body - the soft fur feels lovely.");
		}
		else if(target.tailType == GLOBAL.TYPE_DRACONIC) output2(" A thin, scaly, prehensile reptilian tail, almost as long as you are tall, swings behind you like a living bullwhip. Its tip menaces with spikes of bone, meant to deliver painful blows.");		
		else if(target.tailType == GLOBAL.TYPE_KUITAN) 
		{
			if(target.furColor == "black") output2(" A solid-black kui-tan tail waves behind you.");
			else output2(" A black-and-" + target.furColor + "-ringed kui-tan tail waves behind you.");
		}
		else if(target.tailType == GLOBAL.TYPE_MOUSE) output2(" A naked, " + target.skinTone + " mouse tail pokes from your butt, dragging on the ground and twitching occasionally.");
		else if(target.tailType == GLOBAL.TYPE_CUNTSNAKE) {
			if(target.tailCount <= 1) output2(" A sinuous, almost snake-like tail waves behind you, covered in " + target.skinFurScales() + " like the rest of you except at the tip. There, it terminates in a " + target.tailVaginaDescript() + " that always seems to crave fresh sperm.");
			else output2(" " + upperCase(num2Text(target.tailCount)) + " sinuous, almost snake-like tails wave behind you, covered in " + target.skinFurScales() + " like the rest of you except at the tip. There, they terminate in " + plural(target.tailVaginaDescript()) + " that always seem to crave fresh sperm.");
		}
		else if (target.tailType == GLOBAL.TYPE_PANDA) output2(" A short, soft panda tail sprouts just above your " + target.buttDescript() + ". It just kind of sits there, not doing much beyond being a furry little accent.");
		else if(target.tailType == GLOBAL.TYPE_RASKVEL) {
			if(target.tailCount == 1) output2(" A scaled " + target.scaleColor + " tail sprouts just above your " + target.buttDescript() + ", dangling behind you. Softer, lighter scales cover its bottom.");
			else output2(" " + upperCase(num2Text(target.tailCount)) + " scaled " + target.scaleColor + " tails sprout just above your " + target.buttDescript() + ", their undersides covered with softer, lighter scales.");
		}
		else if(target.tailType == GLOBAL.TYPE_BADGER) 
		{
			if(target.tailCount == 1) output2(" A little fluffy " + target.furColor + " tuft dangles atop your" + target.buttDescript() + ". It mischievously flicks back and forth from time to time.");
			else output2(" " + upperCase(num2Text(target.tailCount)) + " fluffy little " + target.furColor + " tufts dangle atop your" + target.buttDescript() + ". They mischievously flick back and forth from time to time.");
		}
		else if(target.tailType == GLOBAL.TYPE_VANAE) 
		{
			if(target.tailCount == 1) output2(" Protruding from above your butt, a long, slippery tail wiggles behind you. It is lined with octopus-like suckers on the bottom, very much like a tentacle of some underwater... or perhaps tree-dwelling, creature.");
			else output2(" Protruding from above your butt, " + num2Text(target.tailCount) + " long, slippery tails wiggle behind you. They is lined with octopus-like suckers on the bottom, very much like the tentacles of some underwater... or perhaps tree-dwelling, creature.");
		}
		else if(target.tailType == GLOBAL.TYPE_OVIR)
		{
			if(target.tailCount == 1) output2(" A thick, reptilian tail dangles behind you, swaying as a living counterbalance.");
			else output2(upperCase(num2Text(target.tailCount))  + " thick, reptilian tails dangle behind you, swaying like living counterbalance. It's difficult to keep the thick appendages from idly squirming their scales against one another.");
		}
		else if (target.tailType == GLOBAL.TYPE_COCKVINE)
		{
			output2(" A writhing, sinuous appendage flows after you, bobbing and undulating with the slightest movement of your hips.");
			
			// Cockvine
			if (target.tailGenitalArg == GLOBAL.TYPE_COCKVINE && !target.hasTailFlag(GLOBAL.FLAG_RIBBED))
			{
				output2(" Most of the length of the thing is coated in "+ (target as PlayerCharacter).skinTone +" skin, culminating in a proud purple head that's distinctly cock-shaped in nature.");
			}
			// Horse
			else if (target.tailGenitalArg == GLOBAL.TYPE_EQUINE)
			{
				output2(" Most of the length of the thing is coated in "+ (target as PlayerCharacter).skinTone +" skin, culminating in a girthy, flared tip, distinctly reminiscent of a horse-cock.");
			}
			// Human
			else if (target.tailGenitalArg == GLOBAL.TYPE_HUMAN)
			{
				output2(" Most of the length of the thing is coated in "+ (target as PlayerCharacter).skinTone +" skin, culminating in a fleshy pink head that's distinctly cock-shaped in nature.");
			}
			// Bulbous
			else if (target.tailGenitalArg == GLOBAL.TYPE_CANINE)
			{
				output2(" Most of the length of the thing is coated in "+ (target as PlayerCharacter).skinTone +" skin, culminating in a thick bulge a few inches below a tapered, dark-red tip.");
			}
			// Ribbed
			else
			{
				output2(" Most of the length of the thing is coated in "+ (target as PlayerCharacter).skinTone +" skin, culminating in a series of noticeable ridges that gradually thin as they appear closer to the tip.");
			}
		}
		
		//legType notez!
		if(target.legType == GLOBAL.TYPE_HUMAN)
		{
			if(pc.legCount < 4) output2(" " + upperCase(num2Text(target.legCount)) + " normal human legs extend below your waist, ending in normal human feet.");
			else output2(" You have normal human legs that end in " + target.feet(true,true) + ".");
		}
		else if(target.legType == GLOBAL.TYPE_EQUINE || target.legType == GLOBAL.TYPE_BOVINE) 
		{
			if(pc.legCount < 4) output2(" Your legs are muscled and jointed oddly, covered in fur, and end in a pair of bestial hooves.");
			else output2(" You have oddly-jointed legs that end in " + target.feet(true,true) + ".");
		}
		else if(target.legType == GLOBAL.TYPE_CANINE) 
		{
			if (pc.legCount < 4) 
			{
				output2(" " + upperCase(num2Text(target.legCount)));
				if (pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else output2(" plantigrade");
				output2(" legs grow downwards from your waist, ending in " + target.feet(true, true) + ".");
			}
			else
			{
				output2(" You have");
				if(pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output2(" digitigrade");
				else output2(" plantigrade");
				output2(" legs that end in " + target.feet(true,true) + ".");
			}
		}
		else if(target.legType == GLOBAL.TYPE_NAGA) 
		{
			if(target.legCount == 1) output2(" Below your thighs, your flesh is fused together into a very long, snake-like tail, leaving a narrow, connecting gap between your crotch and [pc.asshole].");
			else if(target.legCount < 4) output2(" Below your thighs, " + num2Text(target.legCount) + " wiggling, snake-like appendages allow you to slither around.");
			else output2(" You have wiggling snake-like appendages to propel yourself around on.");
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
			output2(" Shimmering, armor-like chitin girds your legs from your toes to your mid-thigh. The sable material is rock hard right up until the ring of soft fluff that grows over the uppermost edge.");
		}
		else if(target.legType == GLOBAL.TYPE_GOOEY) 
		{
			if(target.legCount == 1) output2(" In place of legs you have a shifting amorphous blob. Thankfully it's quite easy to propel yourself around on. The lowest portions of your " + target.armor.longName + " float around inside you, bringing you no discomfort.");
			else output2(" In place of legs you have a shifting, amorphous blob. It splits apart just beneath your genitals into " + num2Text(target.legCount) + " semi-solid limbs.");
		}
		else if(target.legType == GLOBAL.TYPE_FELINE) output2(" " + upperCase(num2Text(target.legCount)) + " digitigrade legs grow downwards from your waist, ending in soft, padded cat-paws.");
		else if(target.legType == GLOBAL.TYPE_LIZAN)
		{
			if(target.legCount < 4) output2(" " + upperCase(num2Text(target.legCount)) + " digitigrade legs grow down from your " + target.hipDescript() + ", ending in clawed feet. There are three long toes on the front and a small hind-claw on the back.");
			else output2(" Your " + plural(target.leg(true)) + " end in clawed feet, tipped with three long toes and a small hind-claw on the back.");
		}
		else if(target.legType == GLOBAL.TYPE_RASKVEL)
		{
			if(target.legCount < 4) output2(" " + upperCase(num2Text(target.legCount)) + " plantigrade legs grow down from your " + target.hipDescript() + ", ending in clawed feet. There are four long toes tipping the humanoid soles.");
			else output2(" Your " + plural(target.leg(true)) + " end in clawed feet, tipped with four long toes at the front of the terran-like soles.");
		}
		else if(target.legType == GLOBAL.TYPE_LAPINE) 
		{
			if(target.legCount < 4) output2(" Your legs thicken below the waist as they turn into soft-furred rabbit-like legs. You even have large bunny feet that make hopping around a little easier than walking.");
			else output2(" You have thick rabbit legs that terminate in " + target.feet(true,true) + ". At least jumping should be a breeze.");
		}
		else if(target.legType == GLOBAL.TYPE_AVIAN) 
		{
			if(target.legCount < 4) output2(" Your legs are covered with " + target.furColor + " plumage. Thankfully the thick, powerful thighs are perfect for launching you into the air, and your feet remain mostly human, even if they are two-toed and tipped with talons.");
			else output2(" You have " + target.furColor + " plumage across your legs. It ends just above your two-toed, taloned feet.");
		}
		else if(target.legType == GLOBAL.TYPE_KANGAROO) 
		{
			if(target.legCount < 4) output2(" Your furry legs have short thighs and long calves, with even longer feet ending in prominently-nailed toes.");
			else output2(" You have " + pc.furColor + "-furred legs with short thighs and long calves, perfect for jumping.");
		}
		else if(target.legType == GLOBAL.TYPE_ARACHNID) 
		{
			if(target.legCount < 4) output2(" Your legs are covered in a reflective black, insectile carapace up to your mid-thigh, looking more like a pair of 'fuck-me-boots' than exoskeleton.");
			else output2(" Black chitin covers your legs up to the mid-thigh, looking more like a pair of 'fuck-me-boots' than insectile armor.");
		}
		else if(target.legType == GLOBAL.TYPE_DRIDER) 
		{
			output2(" Where your legs would normally start you have grown the body of a spider, with " + num2Text(target.legCount) + " spindly legs that sprout from its sides.");
		}
		else if(target.legType == GLOBAL.TYPE_VULPINE) output2(" Your legs are crooked into high knees with hocks and long feet, like those of a fox; cute bulbous toes decorate the ends.");
		else if(target.legType == GLOBAL.TYPE_DRACONIC) output2(" " + upperCase(num2Text(target.legCount)) + " human-like legs grow down from your " + target.hipDescript() + ", sheathed in scales and ending in clawed feet. There are three long toes on the front, and a small hind-claw on the back.");
		else if(target.legType == GLOBAL.TYPE_KUITAN) output2(" Your legs, though covered in fur, are humanlike. Long feet on the ends bear equally long toes, and the pads on the bottoms are quite sensitive to the touch.");
		else if (target.legType == GLOBAL.TYPE_PANDA) output2(" " + upperCase(num2Text(target.legCount)) + " digitigrade legs grow downwards from your waist, ending in fluffy panda-paws. You even have sharp-looking claws growing from the tips of your short toes.");
		//Catch all (mostly there for Ovir feet)
		else if (target.legType == GLOBAL.TYPE_OVIR)
		{
			if(target.skinType != GLOBAL.SKIN_TYPE_SCALES) output2(" Your " + num2Text(target.legCount) + " legs are curiously coated in a layer of scales but are otherwise normal, human-like limbs.");
			else output2(" " + upperCase(num2Text(target.legCount)) + " scaled, plantigrade legs extend below your waist, ending in human-like feet.");
		}

		// Mimbrane feet for applicable legTypes (any pair of humanoid legs with existing feet)!
		if (target.legCount == 2 && !target.isTaur())
		{
			if (target.legType != GLOBAL.TYPE_NAGA || target.legType != GLOBAL.TYPE_GOOEY || target.legType != GLOBAL.TYPE_DRIDER)
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
						if (feedVal < 8)
						{
							output2(" Your");
							if (bothFeet) output2(" [pc.feet] appear");
							else output2(" [pc.foot] appears");
							output2(" to be slightly distended.")
						}
						else if (feedVal < 13)
						{
							output2(" Your");
							if (bothFeet) output2(" [pc.feet] appear");
							else output2(" [pc.foot] appears");
							output2(" puffy and inflated.")
						}
						else
						{
							output2(" Your");
							if (bothFeet) output2(" [pc.feet] appear");
							else output2(" [pc.foot] appears");
							output2(" unusually large and somewhat swollen, almost engorged.")
						}
					}
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
		var toneMod:Number = pc.thickness - pc.tone;
		//Prevent negatives for the uberfit:
		if(toneMod < 0) toneMod = 0;
		//Worst = 100. Scale down by factor of 5
		toneMod /= 5;
		//Add to our working belly amount for funtimes:
		tempBelly += toneMod;

		//Display belly size
		if (tempBelly <= 5)
		{
			if(pc.tone >= 75) output2("Your [pc.belly] is rock-hard, shaped by a good diet, steady conditioning, or both.") 
			else if(pc.tone >= 50) output2("Your [pc.belly] is fairly well-toned.")
			else output2("Your [pc.belly] is nice and smooth.");
		}
		else if (tempBelly <= 10) output2("Your [pc.belly] is fairly average in appearance.");
		else if (tempBelly <= 15) output2("Your [pc.belly] would just barely push past the waistband of a pair of pants. It's a little bit of a muffin-top.");
		else if (tempBelly <= 20) output2("Your [pc.belly] is pretty decent-sized. There's no real hiding it.");
		else if (tempBelly <= 30) output2("Your [pc.belly] is impossible to miss. Wearing loose clothing wouldn't even help at this point.");
		//full round bulky
		else if (tempBelly <= 40) output2("Your [pc.belly] is big enough that passersby might think you pregnant at a glance.");
		//expansive extensive spacious
		else if (tempBelly <= 50) output2("Your [pc.belly] would look more at home on a woman in the later stages of her pregnancy than an adventuring rusher.");
		//inflated excessive whopping
		else if (tempBelly <= 60) output2("Your [pc.belly] is weighty enough to jiggle when you shift positions too suddenly, but still small enough for easy portability.");
		//distended immense bloated
		else if (tempBelly <= 70) output2("Your [pc.belly] sticks out very noticeably, wobbling slightly with your motions. It would look right at home on a reclining, full-time breeding servant.");
		//over-inflated jumbo-sized
		else if (tempBelly <= 80) output2("Your [pc.belly] is obscene testament to what the body can endure. When you look down, you have no hope of seeing your crotch, let alone your [pc.feet].");
		//Very distended monumental massive
		else if (tempBelly <= 90) 
		{
			output2("Your [pc.belly] is so big that it makes your [pc.skin] tight and shiny");
			if(pc.skinType == GLOBAL.SKIN_TYPE_FUR || pc.skinType == GLOBAL.SKIN_TYPE_SCALES || pc.skinType == GLOBAL.SKIN_TYPE_CHITIN)
				output2(" under your [pc.skinFurScales]");
			output2(". Movement is a little impractical with the extra bulk.");
		}
		//ginormous over-inflated blimp-like
		else output2("Your [pc.belly] protrudes obscenely from your form, hanging heavily. Getting around is a struggle with so much extra mass on you.");
		
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
		output2("\n\n");
		if(target.gills) output2("A pair of feathery gills are growing out just below your neck, spreading out horizontally and draping down your chest. They allow you to stay in the water for quite a long time. ");
		//Chesticles..I mean bewbz.
		if(target.breastRows.length == 1) {
			if(target.biggestTitSize() >= 1) output2("You have " + num2Text(target.breastRows[0].breasts) + " " + target.chestDesc() + ", capped with ");
			else output2("You have a flat chest with unremarkable pectoral muscles, capped with ");
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
					output2(" There isn't any actual nub to your nipples - just flat, " + target.areolaSizeDescript() + ", " + pc.nippleColor + " areolae.");
				}
			}
			//Lactation and breast cup final!
			if (target.isLactating())
			{
				if(target.milkFullness < 50) output2(" Your " + target.breastDescript(0) + " are producing [pc.milk] but are nowhere near full at the moment.");
				else if(target.milkFullness < 75) output2(" Your " + target.breastDescript(0) + " have a noticable amount of [pc.milk] inside them now. Before long, they'll start swelling.");
				else if(target.milkFullness < 100) output2(" Your " + target.breastDescript(0) + " are fairly full of [pc.milk] and noticeably swollen.");
				else if(target.milkFullness < 150) output2(" Your " + target.breastDescript(0) + " are sore and sensitive from being so stuffed with [pc.milk]. You should release the pressure soon.");
				else if(target.milkFullness < 200)    
				{
					if(pc.hasPerk("Milky") && pc.hasPerk("Treated Milk") && this.rand(2) == 0) output2(" Your " + target.breastDescript(0) + " are incredibly swollen with [pc.milk], so much that they're much bigger than normal. Your lactation shows no signs of slowing down in the slightest.");
					else if(pc.hasPerk("Milky") && pc.hasPerk("Treated Milk")) output2(" At least you are certain your enhanced [pc.fullChest] will never stop lactating, no matter what.");
					else output2(" Your " + target.breastDescript(0) + " are painfully swollen with [pc.milk], so much that they're much bigger than normal. The longer they stay like this, the more your lactation will slow.");
				}
				else 
				{
					if(pc.hasPerk("Milky") && pc.hasPerk("Treated Milk") && this.rand(2) == 0) output2(" <b>Your " + target.breastDescript(0) + " are so full that they might burst! They radiate a constant yet rhythmic pulse of pressure, a sign that you are quite the productive [pc.milk] factory!</b>");
					else if(pc.hasPerk("Milky") && pc.hasPerk("Treated Milk")) output2(" Despite the uncomfortable fullness, you are at ease - you know your enhanced [pc.fullChest] will never stop lactating, no matter what.");
					else output2(" <b>Your " + target.breastDescript(0) + " are so full that they feel about to burst! Spending time like this is going to slow your milk production.</b>");
				}
				
				//Don't forget about the bras! Primarily when mentioning the slowing of milk production.
				if(target.milkFullness > 150 && target.upperUndergarment.shortName != "")
				{
					if(target.upperUndergarment.shortName == "Bounty Bra" && (pc.hasPerk("Milky") && pc.hasPerk("Treated Milk"))) output2(" The massaging vibrations eminating from your JoyCo maternity bra reminds you that you'll never stop lactating, but you wonder if it is really necessary since your lactation seems to be on an endless outflow.");
					else if(target.upperUndergarment.shortName == "Bounty Bra") output2(" Luckily, the massaging vibrations emanating from your JoyCo maternity bra reminds you that you'll never stop lactating as long as you continue to wear the " + target.upperUndergarment.shortName + ".");
					else output2(" Unfortunately, a bit of [pc.milk] leaks out onto your " + target.upperUndergarment.description + "... Maybe you should invest in a maternity bra?");
				}
			}
			if (target.breastRows[0].breastRating() >= 1) output2(" You could easily fill a " + target.breastCup(0) + " bra.");
		}
		//many rows
		else {
			output2("You have " + num2Text(target.breastRows.length) + " rows of breasts");
			if(target.biggestTitSize() < 1) output2(", all flat and fairly masculine in look.");
			else output2(", the topmost pair starting at your chest.");
			temp = 0;
			while (temp < target.breastRows.length) {
				if(temp == 0) output2(" Your uppermost row houses ");
				if(temp == 1) output2(" The second group holds ");
				if(temp == 2) output2(" Your third batch contains ");
				if(temp == 3) output2(" Your fourth set cradles ");
				if(temp == 4) output2(" Your fifth has ");
				if(target.breastRows[temp].breastRating() >= 1) output2(num2Text(target.breastRows[temp].breasts) + " " + target.breastDescript(temp) + ", capped with ");
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
						output2(" You can make " + num2Text(Math.round(target.nippleLength(temp) * target.dickNippleMultiplier * 10)/10) + "-inch " + target.nippleCocksDescript(true) + " slide out from behind your normal-looking areolae.");
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
						output2(" Your chest actually houses wet, slippery, secret entrances.");
					}
					else if(target.breastRows[temp].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES) {
						output2(" Plump lips cap off your chest in place of nipples.");
					}
					else if(target.breastRows[temp].nippleType == GLOBAL.NIPPLE_TYPE_FLAT) {
						output2(" There isn't any actual nub to your nipples - just flat areolae.");
					}
				}
				if(target.breastRows[temp].breastRating() >= 1) output2(" You could easily fill a " + target.breastCup(temp) + " bra.");
				temp++;
			}
			//Done with tits. Move on.
			//Lactation and breast cup final!
			if (target.isLactating())
			{
				if(target.milkFullness < 50) output2(" Your [pc.fullChest] are producing [pc.milk] but are nowhere near full at the moment.");
				else if(target.milkFullness < 75) output2(" Your [pc.fullChest] have a noticable amount of [pc.milk] inside them now. Before long, they'll start swelling.");
				else if(target.milkFullness < 100) output2(" Your [pc.fullChest] are fairly full of [pc.milk] and noticeably swollen.")
				else if(target.milkFullness < 150) output2(" Your [pc.fullChest] are sore and sensitive from being so stuffed with [pc.milk]. You should release the pressure soon.");
				else if(target.milkFullness < 200) output2(" Your [pc.fullChest] are painfully swollen with [pc.milk], so much that they're much bigger than normal. The longer they stay like this, the more your lactation will slow.");
				else output2(" <b>Your [pc.fullChest] are so full that they feel about to burst! Spending time like this is going to slow your milk production.</b>");
			}
		}
		//CROTCH STUFF!
		if(target.hasCock() || target.hasVagina()) {
			output2("\n\n");
			//Crotchial stuff - mention snake
			if(target.hasStatusEffect("Genital Slit") && target.hasCock()) {
				output2("Your masculine endowment");
				if((target.hasVagina() && target.hasCock()) || target.totalCocks() > 1) output2("s are ");
				else output2(" is ");
				output2("concealed within a well-hidden slit when not in use, though when the need arises, you can part your concealed entrance and reveal your true self. ");
				if(target.isTaur()) output2("You're probably one of the most modest taurs out there because of this. ");
			}
			else if(target.isTaur() && (target.hasCock() || target.hasVagina()) && target.originalRace == "half-leithan") output2("Your sexual equipment is positioned at the back of your tauric hindquarters, rather than at your humanoid waist. ");
			else if(target.isTaur() && (target.hasCock() || target.hasVagina())) output2("Your sexual equipment is no longer below your waist, but instead at the back of your equine hindquarters. ");
			
			//SINGLE DICKS!
			if(target.cockTotal() == 1) {
				output2("Your " + pc.cockDescript() + " is " + Math.floor(10*target.cocks[0].cLength())/10 + " inches long and ");
				if(Math.floor(10*target.cocks[0].thickness())/10 < 2) {
					if(Math.floor(10*target.cocks[0].thickness())/10 == 1) output2(int(10*target.cocks[0].thickness())/10 + " inch thick.");
					else output2(Math.round(10*target.cocks[0].thickness())/10 + " inches across.");
				}
				else output2(num2Text(Math.round(10*target.cocks[0].thickness())/10) + " inches across.");				
				dickBonusForAppearance(0);
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
						output2("\nYour ");
						output2(target.cockDescript(temp) + " is " + Math.round(10*target.cocks[temp].cLength())/10 + " inches long and ");
						if(Math.floor(target.cocks[temp].thickness()) >= 2) output2(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches thick.");
						else {
							if(target.cocks[temp].thickness() == 1) output2("one inch thick.");
							else output2(Math.round(target.cocks[temp].thickness()*10)/10 + " inches thick.");
						}
					}
					if(rando == 2) {
						output2("\nThis ");
						output2(target.cockDescript(temp) + " is " + Math.round(10*target.cocks[temp].cLength())/10 + " inches long and ");
						if(Math.floor(target.cocks[temp].thickness()) >= 2) output2(num2Text(Math.round(target.cocks[temp].thickness() * 10)/10) + " inches thick.");
						else {
							if(target.cocks[temp].thickness() == 1) output2("one inch thick.");
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
					dickBonusForAppearance(temp);
					temp++;
					rando++
					if(rando > 3) rando = 0;
				}
				//Worm flavor
				if(target.hasStatusEffect("infested")) output2("\nEvery now and again slimy worms coated in spunk slip partway out of your " + target.multiCockDescript() + ", tasting the air like tongues of snakes.");
				//DONE WITH COCKS, moving on!
			}
		}
		//Of Balls and Sacks!
		if(target.balls > 0) {
			if(target.cockTotal() == 0) output2("\n\n");
			else if(target.cockTotal() > 1) output2("\n\n");
			else output2(" ");
			if(target.hasStatusEffect("Uniball")) {
				if(target.skinType != GLOBAL.SKIN_TYPE_GOO) output2("Your " + target.sackDescript(true,true) + " clings tightly to your groin, holding your " + target.ballsDescript(true,true) + " snugly against you.");
				else if(target.skinType == GLOBAL.SKIN_TYPE_GOO) output2("Your " + target.sackDescript(true,true) + " clings tightly to your groin, dripping and holding " + target.ballsDescript(true,true) + " snugly against you.");
			}
			else if(target.cockTotal() == 0) {
				if(target.skinType == GLOBAL.SKIN_TYPE_SKIN) output2("A " + target.sackDescript(true,true) + " with " + target.ballsDescript(true,true) + " swings heavily under where a penis would normally grow.");
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2("A fuzzy " + target.sackDescript(true,true) + " filled with " + target.ballsDescript(true,true) + " swings low under where a penis would normally grow.");
				if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("A scaley " + target.sackDescript(true,true) + " hugs your " + target.ballsDescript(true,true) + " tightly against your body.");
				if(target.skinType == GLOBAL.SKIN_TYPE_GOO) output2("An oozing, semi-solid sack with " + target.ballsDescript(true,true) + " swings heavily under where a penis would normally grow.");
			}
			else {
				if(target.skinType == GLOBAL.TYPE_HUMAN) output2("A " + target.sackDescript(true,true) + " with " + target.ballsDescript(true,true) + " swings heavily beneath your " + target.multiCockDescript() + ".");
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR) output2("A fuzzy " + target.sackDescript(true,true) + " filled with " + target.ballsDescript(true,true) + " swings low under your " + target.multiCockDescript() + ".");
				if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) output2("A scaley " + target.sackDescript(true,true) + " hugs your " + target.ballsDescript(true,true) + " tightly against your body.");
				if(target.skinType == GLOBAL.SKIN_TYPE_GOO) output2("An oozing, semi-solid sack with " + target.ballsDescript(true,true) + " swings heavily beneath your " + target.multiCockDescript() + ".");
			}
			//Does it mention the dick at the end of the sentence? If so, dont use pronoun here:
			if(target.hasCock() && !target.hasStatusEffect("Uniball") && target.skinType != GLOBAL.SKIN_TYPE_SCALES)
			{
				output2(" You estimate each testicle to be about " + num2Text(Math.round(target.ballSize())) + " ");
			}
			//No dick mention? Great! Pronouns deployed!
			else output2(" You estimate each of them to be about " + num2Text(Math.round(target.ballSize())) + " ");
			if(Math.round(target.ballSize()) == 1) output2("inch");
			else output2("inches");
			var ballDisplayDiameter:Number = Math.round(target.ballDiameter()*10)/10;
			output2(" around and " + ballDisplayDiameter);
			if(ballDisplayDiameter != 1) output2(" inches");
			else output2(" inch");
			output2(" across.");
		}	
		//VAGOOZ
		if(target.vaginas.length > 0) {
			if(target.hasCock()) output2("\n\n");
			if(!target.hasCock() && target.isTaur()) output2("As a tauric creature, your womanly parts lie between your rear legs in a rather equine fashion. ");
			//Vaginal Numbers
			if(target.vaginaTotal() == 1) {
				output2("You have a " + target.vaginaDescript(0) + ", with " + num2Text(target.vaginas[0].clits) + " " + Math.round(target.clitLength*10)/10 + "-inch clit");
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
						if (pc.isCrotchGarbed()) output2(" and creates a slight bulge beneath your armor");
						output2(". ")
					}
					else
					{
						output2("Your pussy appears delightfully plump");
						if (pc.isCrotchGarbed()) output2(", creating an undeniable bulge in your armor");
						output2(". ");
					}
				}
				//Variances based on lustiness & wetness & such. THE DETAIL!
				if(target.libido() < 50 && target.lust() < 50) //not particularly horny
				{
					//Wetness
					if(target.vaginas[0].wetness() < 2) output2("No moisture presently escapes ")
					else if(target.vaginas[0].wetness() < 4) output2("Moisture gleams in ");
					else if(target.vaginas[0].wetness() >= 4)
					{
						output2("Occasional beads of ");
						output2("[pc.girlCum] drip from ");
					}				
				}
				else if(target.libido() < 80 && target.lust() < 80) //kinda horny
				{
					//Wetness
					if(target.vaginas[0].wetness() < 1) {}
					else if(target.vaginas[0].wetness() < 2) output2("Moisture gleams in ");
					else if(target.vaginas[0].wetness() < 4) 
					{
						output2("Occasional beads of ");
						output2("[pc.girlCum] drip from ");
					}
					else {
						output2("Thin streams of ");
						output2("[pc.girlCum] occasionally dribble from ");
					}
				}
				else //WTF horny!
				{
					//Wetness
					if(target.vaginas[0].wetness() < 1) {}
					else if(target.vaginas[0].wetness() < 2) 
					{
						output2("Occasional beads of ");
						output2("[pc.girlCum] drip from ");
					}
					else if(target.vaginas[0].wetness() < 4)
					{
						output2("Thin streams of ");
						output2("[pc.girlCum] occasionally dribble from ");
					}
					else 
					{
						output2("Thick streams of ");
						output2("[pc.girlCum] drool constantly from ");
					}				
				}
				//Different description based on vag looseness
				if(target.vaginas[0].looseness() < 2) output2("your " + target.vaginasDescript() + ".");
				else if(target.vaginas[0].looseness() < 4) {
					output2("your " + target.vaginasDescript() + ", ");
					if(target.totalVaginas() > 1) output2("its ");
					else output2("their ");
					output2("lips slightly parted.");
				}
				else {
					output2("the massive hole");
					output2(" that is");
					output2(" your " + target.vaginasDescript() + ".");
				}
				//Zil flavor!
				if(target.totalVaginas(GLOBAL.ZIL) > 0) {
					output2(" The exterior folds are a dusky black, while the inner lining of ");
					output2("your");
					output2(" tunnel is a glorious golden hue.");
				}
				//Naleen flavor
				if(target.totalVaginas(GLOBAL.TYPE_NAGA) > 0) {
					output2(" The exterior lips are subtle and narrow, making ");
					output2("your");
					output2(" lengthy entrance a little more discrete.");
				}
				//LEITHAN FLAVOR
				if(target.totalVaginas(GLOBAL.TYPE_LEITHAN) > 0 || target.totalVaginas(GLOBAL.TYPE_EQUINE) > 0)
				{
					output2(" The exterior lips are fat and swollen. They could easily be described as rubbery, and they often shine with a wet sheen, regardless of your arousal. When you're aroused, you're told that they wink.");
				}
			}
			//MULTICOOCH!
			else if(target.vaginaTotal() > 1) 
			{
				output2("You have " + num2Text(target.vaginas.length) + " " + target.vaginasDescript() + ", ");
				if(target.matchedVaginas()) output2(" all similar in appearance.");
				else output2(" each a unique and beautiful flower.");
				temp = 0;
				while(temp < target.totalVaginas())
				{
					if(temp == 0) output2("\nYour first entrance");
					else if(temp == 1) output2("\nThe second slit");
					else output2("\nThe third and final vagina");
					output2(" is a " + target.vaginaNounDescript(temp) + " with " + num2Text(target.vaginas[temp].clits) + " " + int(target.clitLength*10)/10 + "-inch clit");
					if(target.vaginas[temp].clits > 1) output2("s");
					//Virginal trumps all else
					if(target.vaginas[temp].hymen) output2(", still virginal in appearance.");
					//Else wetness -> size
					else
					{
						//High wetness shit
						if(target.vaginas[temp].wetness() >= 4)
						{
							if(target.lust() < 50) output2(", occassionally beading its ever-present [pc.girlCumNoun]");
							else if(target.lust() < 75) output2(", frequently drooling its ever-present [pc.girlCumNoun]");
							else output2(", constantly-drooling thick strands of [pc.girlCumNoun]");
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
						output2(".")
						//Zil flavor!
						if(target.vaginas[temp].type == GLOBAL.ZIL) {
							output2(" The exterior folds are a dusky black, while the inner lining of ");
							output2("your");
							output2(" tunnel is a glorious golden hue.");
						}
						//Naleen flavor
						if(target.vaginas[temp].type == GLOBAL.TYPE_NAGA) {
							output2(" The exterior lips are subtle and narrow, making ");
							output2("your");
							output2(" lengthy entrance a little more discrete.");
						}
						//LEITHAN FLAVOR
						if(target.vaginas[temp].type == GLOBAL.TYPE_LEITHAN)
						{
							output2(" The exterior lips are fat and swollen. They could easily be described as rubbery, and they often shine with a wet sheen, regardless of your arousal. When you're aroused, you're told that they wink.");
						}
					}
					if (temp == 0 && target.hasStatusEffect("Mimbrane Pussy") && target.statusEffectv3("Mimbrane Pussy") > 3)
					{
						if (target.statusEffectv3("Mimbrane Pussy") < 8)
						{
							output2(" Your pussy appears slightly swollen from the mimbrane.");
						}
						else if (target.statusEffectv3("Mimbrane Pussy") < 13)
						{
							output2(" Your pussy appears noticably inflated");
							if (pc.isCrotchGarbed()) output2(" and creates a slight bulge beneath your armor");
							output2(".")
						}
						else
						{
							output2(" Your pussy appears delightfully plump");
							if (pc.isCrotchGarbed()) output2(", creating an undeniable bulge in your armor");
							output2(".");
						}
					}
					temp++;
				}
			}
		}
		//Genderless lovun'
		if(!pc.hasVagina() && !pc.hasCock()) output2("\n\nYou have a curious lack of any sexual endowments.");
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
		
		clearGhostMenu();
		// Mimbrane hooooook
		// [MIMBRANECODE]
		if (attachedMimbranes() > 0)
		{
			if (kGAMECLASS.canSaveAtCurrentLocation) addGhostButton(0, "Mimbranes", mimbraneMenu);
			else addDisabledGhostButton(0,"Mimbranes","Mimbranes","You cannot access your mimbrane menu at this time.");
			
			// Detailed Mimbrane sentence that includes specific body regions.
			output2("\n\nFrom time to time, small chirps remind you that your body is not owned by just you alone. The");
			// Just one.
			if(attachedMimbranes() == 1) 
			{
				output2(" parasite attached to");
				if(pc.hasStatusEffect("Mimbrane Cock")) output2(" [pc.eachCock]");
				else if(pc.hasStatusEffect("Mimbrane Pussy")) output2(" [pc.eachVagina]");
				else if(pc.hasStatusEffect("Mimbrane Ass")) output2(" your [pc.butt]");
				else if(pc.hasStatusEffect("Mimbrane Balls")) output2(" your [pc.balls]");
				else if(pc.hasStatusEffect("Mimbrane Boobs")) output2(" your [pc.chest]");
				else if(pc.hasStatusEffect("Mimbrane Hand Left")) output2(" your left hand");
				else if(pc.hasStatusEffect("Mimbrane Hand Right")) output2(" your right hand");
				else if(pc.hasStatusEffect("Mimbrane Foot Left")) output2(" your left [pc.foot]");
				else if(pc.hasStatusEffect("Mimbrane Foot Right")) output2(" your right [pc.foot]");
				else if(pc.hasStatusEffect("Mimbrane Face")) output2(" your [pc.face]");
				else output2(" your body");
				output2(" seems");
			}
			// More than one.
			else
			{
				output2(" parasites attached to");
				if(attachedMimbranes() == 2)
				{
					if(pc.hasStatusEffect("Mimbrane Cock") && pc.hasStatusEffect("Mimbrane Balls")) output2(" your cock and balls");
					else if(pc.hasStatusEffect("Mimbrane Boobs") && pc.hasStatusEffect("Mimbrane Ass")) output2(" your tits and ass");
					else if(pc.hasStatusEffect("Mimbrane Pussy") && pc.hasStatusEffect("Mimbrane Ass")) output2(" your bodily glory holes");
					else if(pc.hasStatusEffect("Mimbrane Cock")&& pc.hasStatusEffect("Mimbrane Pussy")) output2(" your genitalia");
					else if(pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right")) output2(" both of your hands");
					else if(pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right")) output2(" your [pc.feet]");
					else output2(" a couple of your appendages");
				}
				else if(attachedMimbranes() == 3)
				{
					if(pc.hasStatusEffect("Mimbrane Cock") && pc.hasStatusEffect("Mimbrane Balls") && pc.hasStatusEffect("Mimbrane Ass")) output2(" your masculine bits");
					else if(pc.hasStatusEffect("Mimbrane Boobs") && pc.hasStatusEffect("Mimbrane Pussy") && pc.hasStatusEffect("Mimbrane Ass")) output2(" your lady-like bits");
					else output2(" a few of your appendages");
				}
				else if(attachedMimbranes() == 4)
				{
					if(pc.hasStatusEffect("Mimbrane Cock") && pc.hasStatusEffect("Mimbrane Balls") && pc.hasStatusEffect("Mimbrane Pussy") && pc.hasStatusEffect("Mimbrane Ass")) output2(" your sensitive genitals");
					else if(pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right") && pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right")) output2(" your major limbs");
					else output2(" some of your appendages");
				}
				else output2(" a variety of your appendages");
				output2(" seem");
			}
			output2(" intelligent enough for some rudimentary communication....");
		}		
		addGhostButton(14, "Back", pcAppearance);
	}
}

public function dickBonusForAppearance(x:int = 0):void
{
	trace("DICK FLAVOR FIRED!");
	//Color shit
	if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE)
	{
		if(pc.cocks[x].cockColor == "mottled pink and black") output2(" It's mottled pink and black in a very animalistic pattern.");
		else output2(" It's " + pc.cocks[x].cockColor + " in color and laced with thick veins.");
	}

	//More general descripts - gotta be before flare/knot due to "It" sentence subject.
	if(pc.cocks[x].cType == GLOBAL.TYPE_RASKVEL) {
		output2(" It's fairly smooth and shapely in appearance, lacking in any severe or stimulating ridges.");
	}
	//Tentacle cock flavor
	else if(pc.cocks[x].cType == GLOBAL.TYPE_TENTACLE) {
		output2(" The entirety of its " + pc.cocks[x].cockColor + " surface is covered in perspiring beads of slick moisture. It frequently shifts and moves of its own volition, the slightly oversized and mushroom-like head shifting in coloration to purplish-red whenever you become aroused.");
	}
	//Cat cock flavor
	else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY)) {
		if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE) output2(" It ends in a tapered head, ringed in small, fleshy nubs that terrans have taken to calling \"barbs\" in spite of their softness. More of these \"barbs\" line the shaft, but they're largest at the base, where they are likely to be rubbed against a clit mid-coitus.");
		else output2(" It is covered in barb-like nubs, soft and rounded enough to massage any passage into which it is inserted. ");
	}
	//Snake cock flavor
	else if(pc.cocks[x].cType == GLOBAL.TYPE_SNAKE) {
		if(pc.originalRace == "snake" || pc.originalRace == "naga" || pc.originalRace == "naleen" || pc.originalRace == "leithan" || pc.originalRace == "half-leithan") output2(" It's a deep, iridescent " + pc.cocks[x].cockColor + " in color. The shaft is patterned with multiple bulbous bumps to stimulate potential partners, and the whole of its length is glossy and smooth.");
		else output2(" It's a deep, iridescent " + pc.cocks[x].cockColor + " in color. Unlike a " + pc.originalRace + " penis, the shaft is patterned with multiple bulbous bumps to stimulate potential partners, and the whole of its length is glossy and smooth.");
	}
	//Anemone cock flavor
	else if(pc.cocks[x].cType == GLOBAL.TYPE_ANEMONE || pc.cocks[x].cType == GLOBAL.TYPE_SIREN) {
		output2(" The crown is surrounded by tiny tentacles with a venomous, aphrodisiac payload. At its base a number of similar, longer tentacles have formed, guaranteeing that pleasure will be forced upon your partners.");
	}
	//Kangawang flavor
	else if(pc.cocks[x].cType == GLOBAL.TYPE_KANGAROO) {
		output2(" It usually lies coiled inside a sheath, but undulates gently and tapers to a point when erect, somewhat like a taproot.");
	}
	//Draconic Cawk Flava flav
	else if(pc.cocks[x].cType == GLOBAL.TYPE_DRACONIC) {
		output2(" With its tapered tip, there are few holes you wouldn't be able to get into. It has a strange, knot-like bulb at its base, but doesn't usually flare during arousal as a dog's knot would.");
	}
	else if(pc.cocks[x].cType == GLOBAL.TYPE_BEE) {
		output2(" There's a lot in common between human and zil genitals, but the alien member you're packing has a much longer, stretchier foreskin than most terrans can pack. It also looks vaguely glossy, like you oiled it up just a moment ago.");
	}

	//FLARE STUFF
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED))
	{
		if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) output2(" The 'head' of your shaft flares proudly, just like a horse's.");
		else output2(" The 'head' of your shaft widens quite noticeably, the better to stimulate your partners.");
	}
	//"Blunt" head - for non-flared flat-tops
	else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT))
	{
		output2(" Your shaft ends in a blunted tip");
		if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE) output2(" similar to a terran horse's");
		output2(".");
	}
	//Demon cock flavor
	if(pc.cocks[x].cType == GLOBAL.TYPE_DEMONIC) {
		output2(" The ");
		if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output2("flared ");
		else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT)) output2("blunt ");
		output2("crown is ringed with a circle of rubbery protrusions that grow larger as you get more aroused. The entire thing is shiny and covered with tiny, sensitive nodules that leave no doubt about its demonic origins.");
	}

	//KNOT STUFF
	if(pc.hasKnot(x))
	{
		trace("KNOT FIRED!");
		if(pc.cocks[x].knotMultiplier > 1 && pc.cocks[x].knotMultiplier < 1.4) output2(" A small knot of thicker flesh is near the base of your " + pc.cockDescript(x) + ", ready to expand to help you lodge it inside a female.");
		if(pc.cocks[x].knotMultiplier >= 1.4 && pc.cocks[x].knotMultiplier <= 2) output2(" A large bulge of flesh nestles just above the bottom of your " + pc.cockDescript(x) + ", to ensure it stays where it belongs during mating.");
		if(pc.cocks[x].knotMultiplier > 2) output2(" The obscenely swollen lump of flesh near the base of your " + pc.cockDescript(x) + " looks almost too big for your cock.");
		//List thickness
		output2(" The knot is " + Math.round(pc.cocks[x].thickness() * pc.cocks[x].knotMultiplier * 10)/10 + " inches wide when at full size.");
		//Appended to knot texts!
		if(pc.cocks[x].cType == GLOBAL.TYPE_KUITAN)
		{
			output2(" Two smaller ones line the length of the shaft, the hallmark of the kui-tan race.");
		}
	}
	else trace("NO KNOT");
	//Worm flavor
	if(pc.hasStatusEffect("infested")) output2(" Every now and again a slimy worm coated in spunk slips partway out of your " + pc.cockDescript(x) + ", tasting the air like a snake's tongue.");		
}