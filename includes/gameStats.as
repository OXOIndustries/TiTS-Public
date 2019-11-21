/* Stat Screen Stuff */

// Modular Stats screen button menu
public function statsScreenMenu(currentFunc:Function):Boolean
{
	var showID:String = flags["TOGGLE_MENU_STATS"];
	
	// Personal
	if(showID == "Personal") addDisabledGhostButton(0, "Personal");
	else addGhostButton(0, "Personal", currentFunc, "Personal", "Personal Statistics", "Show information about yourself.");
	// Medical
	if(showID == "Medical") addDisabledGhostButton(1, "Medical");
	else addGhostButton(1, "Medical", currentFunc, "Medical", "Medical Statistics", "Show your medical statistics.");
	// Encounters
	addGhostButton(2, "Encounters", displayEncounterLog, flags["TOGGLE_MENU_LOG"], "Encounters", "Show the encounters and other miscellaneous information.");
	// Location
	if(showID == "Location") addDisabledGhostButton(3, "Location");
	else addGhostButton(3, "Location", currentFunc, "Location", "Location Information", "Show information about the current location.");
	// Combat
	if(showID == "Combat") addDisabledGhostButton(5, "Combat");
	else addGhostButton(5, "Combat", currentFunc, "Combat", "Combat Statistics", "Show your combat statistics.");
	// Other
	if(showID == "Other") addDisabledGhostButton(6, "Other");
	else addGhostButton(6, "Other", currentFunc, "Other", "Other Statistics", "Show your other statistics.");
	// Racial Scores
	if(showID == "Race") addDisabledGhostButton(7, "Race");
	else addGhostButton(7, "Race", currentFunc, "Race", "Racial Scores", "Show your categorized genetic makeup.");
	// Everything
	if(showID == "All") addDisabledGhostButton(13, "All");
	else addGhostButton(13, "All", currentFunc, "All", "All Data", "Show the cumulative log.");
	
	return true;
}

// Show Stats screen
public function statisticsScreen(showID:String = "All"):void
{
	clearOutput2();
	clearGhostMenu();
	addGhostButton(14, "Back", showCodex);
	
	// Generate buttons and headers (if necessary)
	flags["TOGGLE_MENU_STATS"] = showID;
	statsScreenMenu(statisticsScreen);
	
	output2(header("<u>Stats</u>", false))
	var i:int = 0;
	var x:int = 0;
	
	// Personal Stats
	if(showID == "Personal" || showID == "All")
	{
		//======PC STATISTICS=====//
		output2("\n\n" + blockHeader("Personal Statistics", false));
		// Profile
		output2("\n<b><u>Profile</u></b>");
		output2("\n<b>* Name:</b> [pc.fullName]");
		output2("\n<b>* Occupation:</b> " + GLOBAL.CLASS_NAMES[pc.characterClass]);
		if(flags["PC_UPBRINGING"] != undefined) output2("\n<b>* Upbringing:</b> " + GLOBAL.UPBRINGING_NAMES[flags["PC_UPBRINGING"]]);
		if(pc.affinity != "none") output2("\n<b>* Affinity:</b> " + StringUtil.toTitleCase(pc.affinity));
		if(pc.originalRace != pc.race())
		{
			output2("\n<b>* Initial Race:</b> " + StringUtil.toTitleCase(pc.originalRace));
			output2("\n<b>* Current Race:</b> " + StringUtil.toTitleCase(pc.race()));
		}
		else output2("\n<b>* Race:</b> " + StringUtil.toTitleCase(pc.originalRace));
		output2("\n<b>* Height:</b> " + prettifyLength(pc.tallness));
		output2("\n<b>* Weight:</b> " + prettifyWeight(pc.fullBodyWeight()));
		output2("\n<b>* Sex:</b> ");
		if(pc.genderTextOverride() != "") output2(pc.genderTextOverride());
		else if(pc.hasCock() && !pc.hasVagina()) output2("Male");
		else if(!pc.hasCock() && pc.hasVagina()) output2("Female");
		else if(pc.hasCock() && pc.hasVagina()) output2("Hermaphrodite");
		else output2("Sexless");
		if(pc.hasStatusEffect("Force Fem Gender")) output2("\n<b>* Gender Preference:</b> Female");
		else if(pc.hasStatusEffect("Force Male Gender")) output2("\n<b>* Gender Preference:</b> Male");
		else output2("\n<b>* Gender Alignment:</b> " + pc.mfn("Male", "Female", pc.mf("Androgynous, Male Pronouns", "Androgynous, Female Pronouns")));
		output2("\n<b>* Gender Appearance Rating:</b> " + formatFloat(pc.genderWeight(), 3) + ", " + pc.mfn("Masculine", "Feminine", "Androgynous", true));
		output2("\n<b>* " + (pc.femininity >= 50 ? "Femininity" : "Masculinity") + ":</b> " + Math.abs(Math.round((pc.femininity - 50) * 2)) + " %");
		output2("\n<b>* Personality Score:</b> " + Math.round(pc.personality));
		if(pc.isNice()) output2(", Kind");
		if(pc.isMischievous()) output2(", Mischievous");
		if(pc.isAss()) output2(", Hard");
		if(pc.isBimbo()) output2(", Ditz");
		if(pc.isBro()) output2(", Brute");
		output2("\n<b>* Alcohol Tolerance:</b> " + pc.tolerance() + "/100");
		if(pc.hasStatusEffect("Alcohol"))
		{
			output2("\n<b>* Alcohol Imbibed:</b> " + pc.statusEffectv1("Alcohol") + " %");
			output2("\n<b>* Blood Alcohol Content:</b> " + formatFloat((pc.statusEffectv2("Alcohol") * 0.002), 3) + " %");
		}
		var exposureVisible:int = pc.exposureLevel(true);
		var exposurePhysical:int = pc.exposureLevel(false);
		output2("\n<b>* Body Exposure Level:</b>");
		if(pc.isNude())
		{
			output2(" Nude");
			if(exposureVisible <= 0) output2(", Covered");
		}
		else
		{
			output2(" Clothed");
			var kinkyOutfit:Boolean = (pc.hasArmor() && (pc.isAssExposedByArmor() || pc.isCrotchExposedByArmor() || pc.isChestExposedByArmor()));
			var kinkyUndies:Boolean = ((pc.hasLowerGarment() && (pc.isAssExposedByLowerUndergarment() || pc.isCrotchExposedByLowerUndergarment())) || (pc.hasUpperGarment() && pc.isChestExposedByUpperUndergarment()));
			if(kinkyOutfit || kinkyUndies) output2(", Kinky " + (kinkyOutfit ? "outfit" : "undergarments"));
			if(pc.hasAirtightSuit()) output2(", Airtight outfit");
		}
		if(exposureVisible > 0) output2(", " + exposureVisible + " Visible");
		if(exposurePhysical > 0) output2(", " + exposurePhysical + " Exposed");
		output2("\n<b>* Exhibitionism:</b> " + formatFloat(pc.exhibitionism(), 1) + "/100");
		output2("\n<b>* Carry Threshold:</b> " + prettifyWeight(pc.bodyStrength()));
		//if(pc.weightQ("full") > 0) output2(" (" + pc.weightQ("full") + " %)");
		// Head
		output2("\n<b><u>Head</u></b>");
		output2("\n<b>* Face:</b>");
		if(pc.faceFlags.length > 0)
		{
			for(i = 0; i < pc.faceFlags.length; i++)
			{
				output2(" " + GLOBAL.FLAG_NAMES[pc.faceFlags[i]] + ",");
			}
		}
		output2(" " + GLOBAL.TYPE_NAMES[pc.faceType]);
		if(pc.hasBeard())
		{
			output2("\n<b>* Beard:</b>");
			if(pc.beardColor != "no") output2(" " + StringUtil.toDisplayCase(pc.beardColor) + ",");
			output2(" " + GLOBAL.HAIR_TYPE_NAMES[pc.beardType]);
			output2("\n<b>* Beard, Length:</b>");
			if(pc.beardLength > 0.125)
			{
				output2(" " + prettifyLength(pc.beardLength));
				if(pc.beardStyle != 0) output2("\n<b>* Beard, Style:</b> " + StringUtil.toDisplayCase(pc.beardStyles()));
			}
			else if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" Short, Fur");
			else if(pc.beardLength > 0.0625) output2(" Stubble");
			else output2(" Shaved");
		}
		if(pc.gills) output2("\n<b>* Neck:</b> Gills");
		output2("\n<b>* Hair:</b>");
		if(pc.hasHair())
		{
			if(pc.hairColor != "no") output2(" " + StringUtil.toDisplayCase(pc.hairColor) + ",");
			if(pc.hasStatusEffect("Latex Hair")) output2(" Latex,");
			if(pc.hasPerk("Mane")) output2(" Mane,");
			output2(" " + GLOBAL.HAIR_TYPE_NAMES[pc.hairType]);
			output2("\n<b>* Hair, Length:</b>");
			if(pc.hairLength > 0.125)
			{
				output2(" " + prettifyLength(pc.hairLength));
				if(pc.hairStyle != "null") output2("\n<b>* Hair, Style:</b> " + StringUtil.toDisplayCase(pc.hairStyle));
			}
			else output2(" Shaved");
		}
		else if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" Fur");
		else output2(" None");
		if(pc.hasAntennae()) output2("\n<b>* Antennae:</b> " + pc.antennae + ", " + GLOBAL.TYPE_NAMES[pc.antennaeType]);
		output2("\n<b>* Ears:</b>");
		if(pc.hasLongEars()) output2(" " + prettifyLength(pc.earLength) + ",");
		if(pc.earFlags.length > 0)
		{
			for(i = 0; i < pc.earFlags.length; i++)
			{
				output2(" " + GLOBAL.FLAG_NAMES[pc.earFlags[i]] + ",");
			}
		}
		output2(" " + GLOBAL.TYPE_NAMES[pc.earType]);
		if(pc.hasEarPiercing()) output2("\n<b>* Ear Piercing:</b> " + StringUtil.toDisplayCase(pc.earPiercing.longName));
		output2("\n<b>* Eyes:</b>");
		if(pc.eyeCount() > 0) output2(" " + pc.eyeCount() + ",");
		if(pc.eyeColor != "") output2(" " + StringUtil.toDisplayCase(pc.eyeColor) + ",");
		output2(" " + GLOBAL.TYPE_NAMES[pc.eyeType]);
		if(pc.hasEyebrowPiercing()) output2("\n<b>* Eyebrow Piercing:</b> " + StringUtil.toDisplayCase(pc.eyebrowPiercing.longName));
		if(pc.hasNosePiercing()) output2("\n<b>* Nose Piercing:</b> " + StringUtil.toDisplayCase(pc.nosePiercing.longName));
		output2("\n<b>* Lips:</b> " + showCharLipRating("PC"));
		if(pc.lipColor != "") output2(", " + StringUtil.toDisplayCase(pc.lipColor));
		if(pc.lipMod != 0 && pc.siliconeRating("lips") != 0) output2("\n<b>* Lips, Silicone Size Rating:</b> " + formatFloat(pc.siliconeRating("lips"), 3));
		if(pc.lipPierced != 0 || flags["MIMBRANE_FACE_APPEARANCE"] == 1 || flags["MIMBRANE_FACE_APPEARANCE"] == 2)
		{
			output2("\n<b>* Lip Accent:</b>");
			if(flags["MIMBRANE_FACE_APPEARANCE"] == 1) output2(" Beauty Marks");
			if(flags["MIMBRANE_FACE_APPEARANCE"] == 2) output2(" Pair of Piercings");
		}
		if(pc.hasLipPiercing()) output2("\n<b>* Lip Piercing:</b> " + StringUtil.toDisplayCase(pc.lipPiercing.longName));
		output2("\n<b>* Tongue:</b>");
		if(pc.tongueFlags.length > 0)
		{
			for(i = 0; i < pc.tongueFlags.length; i++)
			{
				output2(" " + GLOBAL.FLAG_NAMES[pc.tongueFlags[i]] + ",");
			}
		}
		output2(" " + GLOBAL.TYPE_NAMES[pc.tongueType]);
		if(pc.hasTonguePiercing()) output2("\n<b>* Tongue Piercing:</b> " + StringUtil.toDisplayCase(pc.tonguePiercing.longName));
		if(pc.hasHorns())
		{
			output2("\n<b>* [pc.HornsNoun]:</b>");
			if(pc.hasStatusEffect("Horn Bumps")) output2(" Horn Bumps");
			else
			{
				if(InCollection(pc.hornType, GLOBAL.TYPE_DEER, GLOBAL.TYPE_DRYAD)) output2(" 2, " + prettifyLength(pc.hornLength) + ", " + GLOBAL.TYPE_NAMES[pc.hornType] + ", " + pc.horns + " Points");
				else 
				{
					output2(" " + pc.horns + ",");
					if(pc.hornLength > 0) output2(" " + prettifyLength(pc.hornLength) + ",");
					output2(" " + GLOBAL.TYPE_NAMES[pc.hornType]);
				}
			}
		}
		if(pc.hasPerk("Regal Mane")) output2("\n<b>* Neck, Mane:</b> " + GLOBAL.FLAG_NAMES[pc.perkv1("Regal Mane")]);
		// Body
		output2("\n<b><u>Body</u></b>");
		if(pc.hasStatusEffect("Sore Counter")) output2("\n<b>* Soreness Level:</b> " + pc.statusEffectv1("Sore Counter"));
		if(pc.hasStatusEffect("Sweaty")) output2("\n<b>* Sweat Level:</b> " + pc.statusEffectv1("Sweaty"));
		output2("\n<b>* Tone:</b> " + pc.toneMin() + "/" + pc.tone + "/" + pc.toneMax());
		output2("\n<b>* Thickness:</b> " + pc.thicknessMin() + "/" + pc.thickness + "/" + pc.thicknessMax());
		output2("\n<b>* Skin:</b>");
		if(pc.skinFlags.length > 0)
		{
			for(i = 0; i < pc.skinFlags.length; i++)
			{
				output2(" " + GLOBAL.FLAG_NAMES[pc.skinFlags[i]] + ",");
			}
		}
		output2(" " + GLOBAL.SKIN_TYPE_NAMES[pc.skinType]);
		output2("\n<b>* Skin Tone:</b> " + StringUtil.toDisplayCase(pc.skinTone));
		if(pc.hasAccentMarkings()) output2("\n<b>* Accent Color:</b> " + StringUtil.toDisplayCase(pc.skinAccent) + " " + StringUtil.toDisplayCase(pc.getAccentMarking(pc.accentMarkings())));
		if(pc.hasPartFur() || pc.hasPartFeathers()) output2("\n<b>* Fur Color:</b> " + StringUtil.toDisplayCase(pc.furColor));
		if(pc.hasPartScales()) output2("\n<b>* Scale Color:</b> " + StringUtil.toDisplayCase(pc.scaleColor));
		if(pc.hasPartChitin()) output2("\n<b>* Chitin Color:</b> " + StringUtil.toDisplayCase(pc.chitinColor()));
		output2("\n<b>* Arms:</b> 2,");
		if(pc.armFlags.length > 0)
		{
			for(i = 0; i < pc.armFlags.length; i++)
			{
				output2(" " + GLOBAL.FLAG_NAMES[pc.armFlags[i]] + ",");
			}
		}
		output2(" " + GLOBAL.TYPE_NAMES[pc.armType]);
		if(pc.legCount >= 2)
		{
			if(pc.legType == GLOBAL.TYPE_NAGA) output2("\n<b>* Lower Tails:</b>");
			else output2("\n<b>* Legs:</b>");
			output2(" " + pc.legCount + ",");
		}
		else output2("\n<b>* Lower Body:</b>");
		if(pc.legFlags.length > 0)
		{
			for(i = 0; i < pc.legFlags.length; i++)
			{
				output2(" " + GLOBAL.FLAG_NAMES[pc.legFlags[i]] + ",");
			}
		}
		output2(" " + GLOBAL.TYPE_NAMES[pc.legType]);
		if(pc.wingType != 0)
		{
			output2("\n<b>* Back:</b>");
			if(pc.wingCount > 0) output2(" " + pc.wingCount + ",");
			if(pc.wingTexture() > 0) output2(" " + GLOBAL.FLAG_NAMES[pc.wingTexture()] + ",");
			if(pc.wingColor() != "") output2(" " + StringUtil.toDisplayCase(pc.wingColor()) + ",");
			output2(" " + GLOBAL.TYPE_NAMES[pc.wingType] + " " + StringUtil.toDisplayCase(pc.wingsDescript(true)));
		}
		if(pc.tailCount > 0)
		{
			if(pc.tailCount == 1) output2("\n<b>* Tail:</b>");
			else output2("\n<b>* Tails:</b>");
			output2(" " + pc.tailCount + ",");
			if(pc.tailFlags.length > 0)
			{
				for(i = 0; i < pc.tailFlags.length; i++)
				{
					output2(" " + GLOBAL.FLAG_NAMES[pc.tailFlags[i]] + ",");
				}
			}
			if(pc.hasParasiteTail()) output2(" Parasitic");
			output2(" " + GLOBAL.TYPE_NAMES[pc.tailType]);
		}
		if(pc.hasTailCock() || pc.hasTailCunt())
		{
			output2("\n<b>* Tail, Genital Type:</b> ");
			if(pc.tailGenitalColor != "") output2(StringUtil.toDisplayCase(pc.tailGenitalColor) + ", ");
			output2(GLOBAL.TYPE_NAMES[pc.tailGenitalArg]);
			if(pc.hasTailCock()) output2(", " + GLOBAL.TAIL_GENTIAL_TYPE_NAMES[1]);
			if(pc.hasTailCunt()) output2(", " + GLOBAL.TAIL_GENTIAL_TYPE_NAMES[2]);
			if(pc.hasTailCock()) output2("\n<b>* Tail, Genital Volume:</b> " + prettifyVolume(pc.tailCockVolume()));
			if(pc.hasTailCunt()) output2("\n<b>* Tail, Genital Capacity:</b> " + prettifyVolume(pc.tailCuntCapacity()));
		}
		if(pc.hasGenitals())
		{
			output2("\n<b>* Genital Elasticity:</b> " + formatFloat(pc.elasticity, 3));
			output2("\n<b>* Genital Location:</b> " + GLOBAL.GENITAL_SPOT_NAMES[pc.genitalLocation()]);
			if(pc.hasStatusEffect("Genital Slit")) output2(", Genital Slit");
		}
		if(pc.hasPheromones()) output2("\n<b>* Pheromone Level:</b> " + pc.pheromoneLevel());
		
		// Chest
		if(pc.breastRows.length > 0 || pc.hasNipples())
		{
			output2("\n<b><u>Chest</u></b>");
			if(pc.hasBreasts())
			{
				output2("\n<b>* Breasts:</b>");
				output2(" " + pc.totalBreasts() + " Breast");
				if(pc.totalBreasts() != 1) output2("s");
			}
			if(pc.breastRows.length > 1)
			{
				output2("\n<b>* Breasts, Weight:</b> " + prettifyWeight(pc.bodyPartWeight("breast")) + ", total");
				if(pc.weightQ("breast") > 0) output2(" (" + pc.weightQ("breast") + " %)");
			}
			if(pc.hasNipples())
			{
				output2("\n<b>* Nipples:</b>");
				output2(" " + pc.totalNipples());
				if(pc.nippleColor != "") output2(" " + StringUtil.toDisplayCase(pc.nippleColor));
				output2(" Nipple");
				if(pc.totalNipples() != 1) output2("s");
				if(pc.totalNipples() > 1) output2(", " + pc.nipplesPerBreast + " per breast");
				if(pc.isLactating()) output2(", Lactation Active");
				output2("\n<b>* Nipple, Length Ratio:</b> " + formatFloat(pc.nippleLengthRatio, 3));
				output2("\n<b>* Areola, Width Ratio:</b> " + formatFloat(pc.nippleWidthRatio, 3));
			}
			// Lactation
			if(pc.canLactate())
			{
				output2("\n<b><u>Lactation</u></b>");
				output2("\n<b>* Milk, Type:</b> " + GLOBAL.FLUID_TYPE_NAMES[pc.milkType]);
				output2("\n<b>* Milk, Capacity:</b> " + formatFloat(pc.milkFullness, 1) + " %");
				output2("\n<b>* Milk, Current" + ((pc.breastRows.length == 1) ? "" : ", Total") + ":</b> " + mLs(Math.round(pc.lactationQ(99))));
				output2("\n<b>* Milk, Max" + ((pc.breastRows.length == 1) ? "" : ", Total") + ":</b> " + mLs(pc.milkCapacity(99)));
				output2("\n<b>* Milk, Production Training:</b> " + formatFloat(pc.milkMultiplier, 1) + " %");
				output2("\n<b>* Milk, Production Bonus:</b> " + Math.round(pc.milkRate*100)/10 + " %");
			}
			// Breasts
			if(pc.totalBreasts() > 0)
			{
				for(x = 0; x < pc.breastRows.length; x++)
				{
					if(pc.breastRows.length == 1)
					{
						if(pc.breastRows[x].breasts == 1) output2("\n<b><u>Breast</u></b>");
						else output2("\n<b><u>Breasts</u></b>");
					}
					else output2("\n<b><u>" + StringUtil.toTitleCase(num2Ordinal(x + 1)) + " Breast Row</u></b>");
					output2("\n<b>* Breast, Count:</b> " + pc.breastRows[x].breasts);
					if(pc.breastRows[x].breastRating() > 0)
					{
						output2("\n<b>* Breast, Size:</b> " + StringUtil.toTitleCase(pc.breastCup(x)));
						if(pc.breastRows[x].breasts != 1) output2("s");
						if(pc.breastRows[x].breastRating() >= 200) output2(" (" + formatFloat(pc.breastRows[x].breastRating(), 3) + ")");
						if(pc.breastRows[x].breastRatingMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.breastRows[x].breastRatingMod, 3)) + ")");
						if(pc.breastRows[x].breastRatingMod != 0 && pc.siliconeRating("tits") != 0) output2("\n<b>* Breast, Silicone Size Rating:</b> " + formatFloat(pc.siliconeRating("tits"), 3));
						if(pc.breastRows[x].breastRatingHoneypotMod != 0) output2("\n<b>* Breast, Honeypot Size Rating:</b> " + formatFloat(pc.breastRows[x].breastRatingHoneypotMod, 3));
						if(pc.breastRows[x].breastRatingLactationMod != 0) output2("\n<b>* Breast, Lactation Size Rating:</b> " + formatFloat(pc.breastRows[x].breastRatingLactationMod, 3));
						output2("\n<b>* Breast Row, Weight:</b> " + prettifyWeight(pc.bodyPartWeight("breast", x)));
						if(pc.weightQ("breast", x) > 0) output2(" (" + pc.weightQ("breast", x) + " %)");
					}
					output2("\n<b>* Areola:</b> " + " " + StringUtil.toDisplayCase(pc.areolaFlagDescript(x)));
					output2("\n<b>* Areola, Size:</b> " + prettifyLength(pc.nippleWidth(x)));
					output2("\n<b>* Nipple, Type:</b> " + " " + GLOBAL.NIPPLE_TYPE_NAMES[pc.breastRows[x].nippleType]);
					if(pc.breastRows[x].fuckable()) output2(", Fuckable");
					if(pc.breastRows[x].nippleType == GLOBAL.NIPPLE_TYPE_DICK) output2("\n<b>* Nipple, Genital Type:</b> " + GLOBAL.TYPE_NAMES[pc.dickNippleType]);
					if(pc.breastRows[x].nippleType != GLOBAL.NIPPLE_TYPE_FUCKABLE && pc.breastRows[x].nippleType != GLOBAL.NIPPLE_TYPE_FLAT && pc.breastRows[x].nippleType != GLOBAL.NIPPLE_TYPE_INVERTED)
					{
						if(pc.breastRows[x].nippleType == GLOBAL.NIPPLE_TYPE_DICK)
						{
							output2("\n<b>* Nipple, Length, Flaccid:</b> " + prettifyLength(pc.nippleLength(0)));
							output2("\n<b>* Nipple, Length, Erect:</b> " + prettifyLength(pc.nippleLength(0) * pc.dickNippleMultiplier));
						}
						else output2("\n<b>* Nipple, Length:</b> " + prettifyLength(pc.nippleLength(x)));
						if(pc.breastRows[x].breasts != 1) output2(" each");
					}
					if(pc.hasPiercedNipples(x)) output2("\n<b>* Nipple Piercing:</b> " + StringUtil.toDisplayCase(pc.breastRows[x].piercing.longName));
					if(pc.breastRows[x].breasts != 1) output2(" each");
					if(pc.breastRows.length != 1)
					{
						output2("\n<b>* Milk, Current:</b> " + mLs(Math.round(pc.lactationQ(x))));
						output2("\n<b>* Milk, Max:</b> " + mLs(pc.milkCapacity(x)));
					}
				}
			}
		}
		
		// Genitals
		if(pc.hasCock() || pc.balls != 0)
		{
			output2("\n<b><u>Male Organs</u></b>");
			//output2("\n<b>* Total Count:</b>");
			if(pc.cocks.length > 0)
			{
				output2("\n<b>* Penis, Count:</b> " + pc.cocks.length);
				//output2(" " + pc.cocks.length + " Penis");
				//if(pc.cocks.length != 1) output2("es");
			}
			if(pc.balls <= 0)
			{
				//output2(", Prostate");
				output2("\n<b>* Prostate, Volume:</b> " + prettifyVolume(pc.ballVolume(), 1));
				output2("\n<b>* Prostate, Weight:</b> " + prettifyWeight(pc.bodyPartWeight("testicle")));
				if(pc.weightQ("testicle") > 0) output2(" (" + pc.weightQ("testicle") + " %)");
			}
			else if(pc.balls > 0)
			{
				output2("\n<b>* Testicle, Count:</b> " + pc.balls);
				//if(pc.cocks.length > 0) output2(",");
				//output2(" " + pc.balls + " Testicle");
				//if(pc.balls != 1) output2("s");
				if(pc.hasStatusEffect("Uniball")) output2(", Uniball");
				if(pc.hasStatusEffect("Special Scrotum"))
				{
					output2(", " + GLOBAL.FLAG_NAMES[pc.statusEffectv1("Special Scrotum")]);
					if(pc.getStatusTooltip("Special Scrotum") != "") output2(", " + StringUtil.toDisplayCase(pc.getStatusTooltip("Special Scrotum")));
				}
				if(pc.statusEffectv4("Vanae Markings") > 0) output2(", " + StringUtil.toDisplayCase(pc.skinAccent) + " Markings");
				output2("\n<b>* Testicle, Size:</b> " + prettifyLength(pc.ballDiameter()) + " across, " + prettifyLength(pc.ballSize()) + " around");
				if(pc.ballSizeMod != 1) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.ballSizeMod, 3)) + ")");
				if(pc.balls != 1) output2(", each");
				output2("\n<b>* Testicle, Volume:</b> " + prettifyVolume(pc.ballVolume(), 1));
				if(pc.balls != 1) output2(", each");
				output2("\n<b>* Testicle, Weight:</b> " + prettifyWeight(pc.bodyPartWeight("testicle")));
				if(pc.balls != 1) output2(", total");
				if(pc.weightQ("testicle") > 0) output2(" (" + pc.weightQ("testicle") + " %)");
			}
			output2("\n<b>* Penis, Virginity:</b>");
			if(pc.cockVirgin) output2(" Virgin");
			else output2(" Taken");
			if(pc.cocks.length > 1)
			{
				output2("\n<b>* Penis, Weight:</b> " + prettifyWeight(pc.bodyPartWeight("penis")));
				if(pc.cocks.length > 1) output2(", total");
				if(pc.weightQ("penis") > 0) output2(" (" + pc.weightQ("penis") + " %)");
			}
			// Cum Stats
			output2("\n<b>* Cum, Type:</b> " + GLOBAL.FLUID_TYPE_NAMES[pc.cumType]);
			output2("\n<b>* Cum, Capacity:</b>");
			if(pc.ballSizeRaw > 0 && pc.perkv1("'Nuki Nuts") > 0) output2(" " + formatFloat(pc.ballFullness + ((pc.perkv1("'Nuki Nuts")/pc.ballSizeRaw) * 100), 1) + " %");
			else output2(" " + formatFloat(pc.ballFullness, 1) + " %");
			output2("\n<b>* Cum, Quantity Modifier:</b> " + Math.round(pc.cumMultiplier()*1000)/10 + " %");
			output2("\n<b>* Cum, Current Internal:</b> " + mLs(pc.currentCum()));
			output2("\n<b>* Cum, Probable Ejaculation:</b> " + mLs(Math.round(pc.cumQ())));
			output2("\n<b>* Cum, Max:</b> " + mLs(pc.maxCum()));
			output2("\n<b>* Refractory Rate:</b> " + Math.round(pc.refractoryRate*1000)/10 + " %");
			if(pc.virility() <= 0) output2("\n<b>* Virility:</b> Infertile");
			else
			{
				output2("\n<b>* Virility:</b> " + Math.round(pc.virility()*1000)/10 + " %");
				output2("\n<b>* Virility, Speed Modifier:</b> " + Math.round(pc.pregnancyIncubationBonusFather()*1000)/10 + " %");
			}
			// Cocks
			if(pc.cocks.length >= 1)
			{
				for(x = 0; x < pc.cocks.length; x++)
				{
					if(pc.cocks.length == 1) output2("\n<b><u>Penis</u></b>");
					else output2("\n<b><u>" + StringUtil.toTitleCase(num2Ordinal(x + 1)) + " Penis</u></b>");
					output2("\n<b>* Type:</b>");
					if(pc.cocks[x].cockFlags.length > 0)
					{
						for(i = 0; i < pc.cocks[x].cockFlags.length; i++)
						{
							output2(" " + GLOBAL.FLAG_NAMES[pc.cocks[x].cockFlags[i]] + ",");
						}
					}
					if(pc.cocks[x].cockColor != "") output2(" " + StringUtil.toDisplayCase(pc.cocks[x].cockColor) + ",");
					output2(" " + GLOBAL.TYPE_NAMES[pc.cocks[x].cType]);
					output2("\n<b>* Length, Flaccid:</b> " + prettifyLength(pc.cLengthFlaccid(x)));
					output2("\n<b>* Length, Current:</b> " + prettifyLength(pc.cLengthFlaccid(x, true)));
					output2("\n<b>* Length, Erect:</b> " + prettifyLength(pc.cLength(x)));
					output2("\n<b>* Thickness:</b> " + prettifyLength(pc.cThickness(x)));
					output2("\n<b>* Thickness, Ratio Modifier:</b> " + Math.round(pc.cocks[x].cThicknessRatio()*1000)/10 + " %");
					output2("\n<b>* Girth:</b> " + prettifyLength(pc.cGirth(x)));
					if(pc.hasKnot(x))
					{
						output2("\n<b>* Knot Thickness:</b> " + prettifyLength(pc.knotThickness(x)));
						output2("\n<b>* Knot Girth:</b> " + prettifyLength(pc.knotGirth(x)));
					}
					if(pc.cockVolume(x, false) != pc.cockVolume(x))
					{
						output2("\n<b>* Volume, Physical:</b> " + prettifyVolume(pc.cockVolume(x, false)));
						output2("\n<b>* Volume, Effective:</b> " + prettifyVolume(pc.cockVolume(x)));
					}
					else output2("\n<b>* Volume:</b> " + prettifyVolume(pc.cockVolume(x)));
					output2("\n<b>* Capacity:</b> " + prettifyVolume(pc.cockCapacity(x)));
					output2("\n<b>* Weight:</b> " + prettifyWeight(pc.bodyPartWeight("penis", x)));
					if(pc.weightQ("penis", x) > 0) output2(" (" + pc.weightQ("penis", x) + " %)");
					if(pc.hasCockPiercing(x)) output2("\n<b>* Piercing:</b> " + StringUtil.toDisplayCase(pc.cocks[x].piercing.longName));
					if(pc.hasCocksock(x)) output2("\n<b>* Sock:</b> " + StringUtil.toDisplayCase(pc.cocks[x].cocksock.longName));
				}
			}
		}
		if(pc.hasVagina())
		{
			output2("\n<b><u>Female Organs</u></b>");
			//output2("\n<b>* Total Count:</b>");
			if(pc.vaginas.length != 0)
			{
				output2("\n<b>* Vagina, Count:</b> " + pc.vaginas.length);
				//output2(" " + pc.vaginas.length + " Vagina");
				//if(pc.vaginas.length != 1) output2("s");
			}
			if(pc.totalClits() > 0)
			{
				output2("\n<b>* Clitoris, Count:</b> " + pc.totalClits());
				//if(pc.vaginas.length != 0) output2(",");
				//output2(" " + pc.totalClits() +" Clit");
				//if(pc.totalClits() != 1) output2("s");
				if(pc.clitLength != 0) output2("\n<b>* Clitoris, Length:</b> " + prettifyLength(pc.clitLength));
				if(pc.totalClits() != 1) output2(", each");
				if(pc.vaginas.length > 1)
				{
					output2("\n<b>* Clitoris, Weight:</b> " + prettifyWeight(pc.bodyPartWeight("clitoris")));
					if(pc.totalClits() != 1) output2(", total");
					if(pc.weightQ("clitoris") > 0) output2(" (" + pc.weightQ("clitoris") + " %)");
				}
			}
			output2("\n<b>* Vagina, Virginity:</b>");
			if(pc.vaginalVirgin) output2(" Virgin");
			else output2(" Taken");
			// Girlcum Stats
			output2("\n<b>* Girlcum, Type:</b> " + GLOBAL.FLUID_TYPE_NAMES[pc.girlCumType]);
			output2("\n<b>* Girlcum, Quantity Modifier:</b> " + Math.round(pc.girlCumMultiplier()*1000)/10 + " %");
			output2("\n<b>* Girlcum, Probable Ejaculation:</b> " + mLs(pc.girlCumQ()));
			// Fertility
			if(pc.fertility() <= 0) output2("\n<b>* Fertility:</b> Infertile");
			else
			{
				output2("\n<b>* Fertility:</b> " + Math.round(pc.fertility()*1000)/10 + " %");
				output2("\n<b>* Fertility, Speed Modifier:</b> " + Math.round(pc.pregnancyIncubationBonusMother()*1000)/10 + " %");
				output2("\n<b>* Fertility, Quantity Modifier:</b> " + Math.round(pc.pregnancyMultiplier()*1000)/10 + " %");
				if(pc.hasStatusEffect("Venus Pitcher Seed Residue")) output2("\n<b>* Fertility, Venus Pitcher Seed Residue, Time Left:</b> " + prettifyMinutes(pc.getStatusMinutes("Venus Pitcher Seed Residue")));
				if(pc.statusEffectv2("Ovilium") > 0) output2("\n<b>* Fertility, Ovilium:</b> Boosted");
			}
			// Vaginas
			if(pc.vaginas.length >= 1)
			{
				for(x = 0; x < pc.vaginas.length; x++)
				{
					if(pc.vaginas.length == 1) output2("\n<b><u>Vagina</u></b>");
					else output2("\n<b><u>" + StringUtil.toTitleCase(num2Ordinal(x + 1)) + " Vagina</u></b>");
					output2("\n<b>* Type:</b>");
					if(pc.vaginas[x].vagooFlags.length > 0)
					{
						for(i = 0; i < pc.vaginas[x].vagooFlags.length; i++)
						{
							output2(" " + GLOBAL.FLAG_NAMES[pc.vaginas[x].vagooFlags[i]] + ",");
						}
					}
					if(pc.vaginas[x].vaginaColor != "") output2(" " + StringUtil.toDisplayCase(pc.vaginas[x].vaginaColor) + ",");
					output2(" " + GLOBAL.TYPE_NAMES[pc.vaginas[x].type]);
					output2("\n<b>* Hymen:</b>");
					if(pc.vaginas[x].hymen) output2(" Virgin");
					else output2(" Taken");
					if(pc.vaginas[x].bonusCapacity == 0) output2("\n<b>* Capacity:</b> " + prettifyVolume(pc.vaginalCapacity(x)));
					else
					{
						output2("\n<b>* Capacity, Bonus:</b> " + prettifyVolume(pc.vaginas[x].bonusCapacity));
						output2("\n<b>* Capacity, Effective:</b> " + prettifyVolume(pc.vaginalCapacity(x)));
					}
					output2("\n<b>* Looseness Level, Current:</b> " + formatFloat(pc.vaginas[x].looseness(), 3));
					output2("\n<b>* Looseness Level, Minimum:</b> " + formatFloat(pc.vaginas[x].minLooseness, 3));
					output2("\n<b>* Wetness Level:</b> " + formatFloat(pc.vaginas[x].wetness(), 3));
					if(pc.isSquirter(x)) output2(", Squirter");
					if(pc.vaginas[x].clits > 0)
					{
						output2("\n<b>* Clitoris:</b> " + pc.vaginas[x].clits);
						output2("\n<b>* Clitoris, Weight:</b> " + prettifyWeight(pc.bodyPartWeight("clitoris", x)));
						if(pc.vaginas[x].clits != 1) output2(", total");
						if(pc.weightQ("clitoris", x) > 0) output2(" (" + pc.weightQ("clitoris", x) + " %)");
					}
					if(pc.hasClitPiercing(x)) output2("\n<b>* Clit Piercing:</b> " + StringUtil.toDisplayCase(pc.vaginas[x].clitPiercing.longName));
					if(pc.hasVaginaPiercing(x)) output2("\n<b>* Labia Piercing:</b> " + StringUtil.toDisplayCase(pc.vaginas[x].piercing.longName));
				}
			}
		}
		if(pc.hasOvipositor())
		{
			output2("\n<b><u>Ovipositor Organs</u></b>");
			output2("\n<b>* Total Count:</b> " + pc.totalOvipositors());
			if(pc.eggCount() > 0) output2("\n<b>* Fertility, Ovipositor Eggs, Total:</b> " + pc.eggCount());
			if(pc.eggCount(-1) > 0) output2("\n<b>* Fertility, Ovipositor Eggs, Unfertilized, Total:</b> " + pc.eggCount(-1));
			if(pc.eggCount(1) > 0) output2("\n<b>* Fertility, Ovipositor Eggs, Fertilized, Total:</b> " + pc.eggCount(1));
			if(pc.hasStatusEffect("Nyrea Eggs")) output2("\n<b>* Fertility, Nyrean Eggs, Quantity Modifier:</b> " + Math.round(pc.statusEffectv2("Nyrea Eggs")*1000)/10 + " %");
			if(pc.statusEffectv1("Nyrea Eggs") > 0) output2("\n<b>* Fertility, Nyrean Eggs, Total:</b> " + pc.statusEffectv1("Nyrea Eggs"));
		}
		
		// Belly
		output2("\n<b><u>Belly</u></b>");
		if(pc.isPregnant()) output2("\n<b>* Belly, Size Rating, Total:</b>");
		else output2("\n<b>* Belly, Size Rating:</b>");
		output2(" " + formatFloat(pc.bellyRating(), 3));
		if(pc.bellyRatingMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.bellyRatingMod, 3)) + ")");
		output2("\n<b>* Belly, Weight:</b> " + prettifyWeight(pc.bodyPartWeight("belly")));
		if(pc.weightQ("belly") > 0) output2(" (" + pc.weightQ("belly") + " %)");
		if(pc.hasBellyPiercing()) output2("\n<b>* Belly Piercing:</b> " + StringUtil.toDisplayCase(pc.bellyPiercing.longName));
		if(pc.statusEffectv1("Orally-Filled") > 0) output2("\n<b>* Cumflation, Oral:</b> " + GLOBAL.FLUID_TYPE_NAMES[pc.statusEffectv3("Orally-Filled")] + ", " + mLs(Math.round(pc.statusEffectv1("Orally-Filled"))));
		if(pc.statusEffectv1("Anally-Filled") > 0) output2("\n<b>* Cumflation, Anal:</b> " + GLOBAL.FLUID_TYPE_NAMES[pc.statusEffectv3("Anally-Filled")] + ", " + mLs(Math.round(pc.statusEffectv1("Anally-Filled"))));
		if(pc.statusEffectv1("Vaginally-Filled") > 0) output2("\n<b>* Cumflation, Vaginal:</b> " + GLOBAL.FLUID_TYPE_NAMES[pc.statusEffectv3("Vaginally-Filled")] + ", " + mLs(Math.round(pc.statusEffectv1("Vaginally-Filled"))));
		if(!pc.hasVagina() || pc.fertility() <= 0)
		{
			output2("\n<b>* Incubation, Speed Modifier:</b> " + Math.round(pc.pregnancyIncubationBonusMother()*1000)/10 + " %");
			output2("\n<b>* Incubation, Quantity Modifier:</b> " + Math.round(pc.pregnancyMultiplier()*1000)/10 + " %");
		}
		if(pc.isPregnant())
		{
			output2("\n<b>* Active Pregnancies, Total:</b> " + pc.totalPregnancies());
			for (x = 0; x < pc.pregnancyData.length; x++)
			{
				var pData:PregnancyData = pc.pregnancyData[x];
				if(pData.pregnancyType != "")
				{
					if(x != 3)
					{
						if(pc.totalVaginas() == 1) output2("\n<b><u>Womb</u></b>");
						else output2("\n<b><u>" + StringUtil.toTitleCase(num2Ordinal(x + 1)) + " Womb</u></b>");
					}
					else
					{
						if(silly) output2("\n<b><u>Anal Womb</u></b>");
						else output2("\n<b><u>Bowels</u></b>");
					}
					output2("\n<b>* Belly, Size Rating:</b> " + formatFloat(pData.pregnancyBellyRatingContribution, 3));
					output2("\n<b>* Pregnancy, Type:</b>");
					switch(pData.pregnancyType)
					{
						case "HumanPregnancy": output2(" Human"); break;
						case "AusarPregnancy": output2(" Ausar"); break;
						case "KaithritPregnancy": output2(" Kaithrit"); break;
						case "LeithanPregnancy": output2(" Leithan"); break;
						case "KuitanPregnancy": output2(" Kui-Tan"); break;
						case "GryvainPregnancy": output2(" Gryvain"); break;
						case "SuulaPregnancy": output2(" Suula"); break;
						case "VenusPitcherSeedCarrier": output2(" Venus Pitcher, Seed"); break;
						case "VenusPitcherFertilizedSeedCarrier": output2(" Venus Pitcher, Seed, Fertilized"); break;
						case "NyreaEggPregnancy": output2(" Nyrean Huntress, Eggs"); break;
						case "RoyalEggPregnancy": output2(" Royal Nyrea, Eggs"); break;
						case "RenvraEggPregnancy": output2(" Renvra, Eggs"); break;
						case "RenvraFullPregnancy": output2(" Renvra"); break;
						case "CockvinePregnancy": output2(" Cockvine"); break;
						case "DeepQueenPregnancy": output2(" Water Queen"); break;
						case "OviliumEggPregnancy": output2(" Ovilium, Eggs"); break;
						case "EggTrainerCarryTraining": output2(" Egg Trainer, Eggs"); break;
						case "EggTrainerFauxPreg": output2(" Egg Trainer"); break;
						case "PsychicTentacles": output2(" Psychic Tentacle Beast"); break;
						case "SydianPregnancy": output2(" Sydian"); break;
						case "SeraSpawnPregnancy": output2(" Sera"); break;
						case "MilodanPregnancy": output2(" Milodan"); break;
						case "BothriocPregnancy": output2(" Bothrioc, Eggs"); break;
						case "OvalastingEggPregnancy": output2(" Ovalasting, Eggs"); break;
						case "LapinaraPregnancy": output2(" Lapinara, Eggs"); break;
						case "RahnPregnancy": output2(" Rahn, Eggs"); break;
						case "RahnPregnancyBreedwell": output2(" Breedwell Rahn, Eggs"); break;
						case "KorgonnePregnancy": output2(" Korgonne"); break;
						case "RiyaPregnancy": output2(" Riya"); break;
						case "ZaaltPregnancy": output2(" Zaalt"); break;
						case "ZilPregnancy": output2(" Zil"); break;
						case "ZilBullPregnancy": output2(" Treated Zil"); break;
						case "RaskvelPregnancy": output2(" Raskvel, Eggs"); break;
						case "ShekkaPregnancy": output2(" Shekka, Eggs"); break;
						case "FrostwyrmPregnancy": output2(" [frostwyrm.name], Eggs"); break;
						case "LahPregnancy": output2(" Lah"); break;
						case "ZephyrPregnancy": output2(" Zephyr"); break;
						case "ButtBugPregnancy": output2(" Butt Bug, Egg" + (pData.pregnancyQuantity == 1 ? "" : "s")); break;
						case "ButtBugPregnancy0": output2(" Butt Bug, Egg" + (pData.pregnancyQuantity == 1 ? "" : "s") + (pc.statusEffectv2("Butt Bug (Female)") == 1 ? ", Fertilized" : "")); break;
						case "ButtBugPregnancy1": output2(" Butt Bug, Cycling Egg" + (pData.pregnancyQuantity == 1 ? "" : "s") + (pc.statusEffectv2("Butt Bug (Female)") == 1 ? ", Fertilized" : "")); break;
						case "ButtBugPregnancy2": output2(" Butt Bug, Hybrid Egg" + (pData.pregnancyQuantity == 1 ? "" : "s") + (pc.statusEffectv2("Butt Bug (Female)") == 1 ? ", Fertilized" : "")); break;
						case "QuaellePregnancy": output2(" Quaelle"); break;
						case "BoredJumperPregnancy": output2(" Laquine"); break;
						case "LaquinePregnancy": output2(" Laquine"); break;
						case "LDCShockHopperPregnancy": output2(" Laquine"); break;
						case "MirrinPregnancy": output2(" Mirrin"); if(rand(4) == 0) output2(", (Torri?)"); else if(rand(3) == 0) output2(", (Einar?)"); break;
						case "SiegwulfeEggnancy": output2(" [wulfe.name], Eggs"); break;
						case "IlariaPregnancy": output2(" Ilaria"); break;
						default: output2(" <i>Unknown</i>"); break;
					}
					if(pData.pregnancyIncubation > -1)
					{
						var pIncubation:int = pData.pregnancyIncubation;
						var pIncubationMulti:Number = pData.pregnancyIncubationMulti;
						output2("\n<b>* Pregnancy, Gestation Time:</b> " + prettifyMinutes(Math.floor(pIncubation * (1 / pIncubationMulti))));
						if(pIncubationMulti != 1) output2("\n<b>* Pregnancy, Incubation Speed Modifier:</b> " + Math.round(pIncubationMulti * 1000)/10 + " %");
					}
					if(pData.pregnancyQuantity > 0)
					{
						var pChildType:int = PregnancyManager.getPregnancyChildType(pc, x);
						output2("\n<b>* Pregnancy,");
						if(pChildType == GLOBAL.CHILD_TYPE_SEED) output2(" Seedling");
						else if(pChildType == GLOBAL.CHILD_TYPE_EGGS) output2(" Egg");
						else output2(" Offspring");
						output2(" Count:</b> " + pData.pregnancyQuantity);
					}
				}
			}
		}
		
		// Ass
		output2("\n<b><u>Ass</u></b>");
		output2("\n<b>* Hip, Size Rating:</b> " + formatFloat(pc.hipRating(), 3));
		if(pc.hipRatingMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.hipRatingMod, 3)) + ")");
		if(pc.hipRatingMod != 0 && pc.siliconeRating("hips") != 0) output2("\n<b>* Hip, Silicone Size Rating:</b> " + formatFloat(pc.siliconeRating("hips"), 3));
		output2("\n<b>* Butt, Size Rating:</b> " + formatFloat(pc.buttRating(), 3));
		if(pc.buttRatingMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.buttRatingMod, 3)) + ")");
		if(pc.buttRatingMod != 0 && pc.siliconeRating("butt") != 0) output2("\n<b>* Butt, Silicone Size Rating:</b> " + formatFloat(pc.siliconeRating("butt"), 3));
		output2("\n<b>* Butt, Weight:</b> " + prettifyWeight(pc.bodyPartWeight("butt")));
		if(pc.weightQ("butt") > 0) output2(" (" + pc.weightQ("butt") + " %)");
		if(pc.buttTone() != pc.tone) output2("\n<b>* Butt, Tone:</b> " + pc.toneMin() + "/" + pc.buttTone() + "/" + pc.toneMax());
		output2("\n<b>* Anus:</b> 1,");
		if(pc.ass.vagooFlags.length > 0)
		{
			for(i = 0; i < pc.ass.vagooFlags.length; i++)
			{
				output2(" " + GLOBAL.FLAG_NAMES[pc.ass.vagooFlags[i]] + ",");
			}
		}
		output2(" Asshole");
		output2("\n<b>* Anus, Virginity:</b>");
		if(pc.analVirgin) output2(" Virgin");
		else output2(" Taken");
		if(pc.ass.bonusCapacity == 0) output2("\n<b>* Anus, Capacity:</b> " + prettifyVolume(pc.analCapacity()));
		else
		{
			output2("\n<b>* Anus, Capacity, Bonus:</b> " + prettifyVolume(pc.ass.bonusCapacity));
			output2("\n<b>* Anus, Capacity, Effective:</b> " + prettifyVolume(pc.analCapacity()));
		}
		output2("\n<b>* Anus, Looseness Level:</b> " + formatFloat(pc.ass.looseness(), 3));
		output2("\n<b>* Anus, Wetness Level:</b> " + formatFloat(pc.ass.wetness(), 3));
		
		// Sexuality
		output2("\n<b><u>Sexuality</u></b>");
		output2("\n<b>* Orgasms, Total:</b> " + StatTracking.getStat("sex/player/orgasms"));
		if(pc.timesCum > 0) output2("\n<b>* Orgasms, Time Since Last Orgasm:</b> " + prettifyMinutes(pc.minutesSinceCum));
		//if(pc.isSubby()) output2("\n<b>* Preferences, Power Role:</b> Submissive");
		if(pc.sexualPreferences._sexPrefs.length > 0)
		{
			for(i = 0; i < GLOBAL.MAX_SEXPREF_VALUE; i++)
			{
				if(pc.sexualPreferences.getPref(i) != 0)
				{
					output2("\n<b>* Preferences, " + StringUtil.toDisplayCase(GLOBAL.SEXPREF_DESCRIPTORS[i]) + ":</b>");
					switch(pc.sexualPreferences.getPref(i))
					{
						case GLOBAL.REALLY_LIKES_SEXPREF: output2(" Really likes!"); break;
						case GLOBAL.KINDA_LIKES_SEXPREF: output2(" Kinda likes!"); break;
						case GLOBAL.KINDA_DISLIKES_SEXPREF: output2(" Dislikes!"); break;
						case GLOBAL.REALLY_DISLIKES_SEXPREF: output2(" Dislikes a lot!"); break;
						default: output2(" <i>Unknown</i>"); break;
					}
				}
			}
		}
		var selfSuck:int = 0;
		if(flags["PC_SELF_SUCKED_STANDARD"] != undefined) selfSuck += flags["PC_SELF_SUCKED_STANDARD"];
		if(pc.hasPerk("Auto-Autofellatio")) selfSuck += pc.perkv1("Auto-Autofellatio");
		if(selfSuck > 0) output2("\n<b>* Masturbation, Times Autofellatio:</b> " + selfSuck);
		if(flags["SERA_COLLAR_FAPS"] > 0) output2("\n<b>* Masturbation, Times Used Sera’s Collar:</b> " + flags["SERA_COLLAR_FAPS"]);
		if(flags["HL_STRAPON_FAP_ADJUSTABLE"] != undefined) output2("\n<b>* Masturbation, Times Used Upgraded Hardlight Strap-On:</b> " + flags["HL_STRAPON_FAP_ADJUSTABLE"]);
		if(pc.hasStatusEffect("Exhibitionism Reserve")) output2("\n<b>* Exhibitionism, Times Done Excessive Acts:</b> " + pc.statusEffectv1("Exhibitionism Reserve"));
	}
	
	// Combat
	if(showID == "Combat" || showID == "All")
	{
		//======CORE STATISTICS=====//
		output2("\n\n" + blockHeader("Core Statistics", false));
		output2("\n<b><u>Advancement</u></b>");
		output2("\n<b>* Level:</b> " + pc.level);
		if(pc.level <= pc.levelMin()) output2(", Min");
		if(pc.level >= pc.levelMax()) output2(", Max");
		output2("\n<b>* Experience:</b> " + pc.XP() + "/" + pc.XPMax());
		if(pc.level < pc.levelMax() && pc.XPRaw < pc.XPMax()) output2(", <i>" + (pc.XPMax() - pc.XPRaw) + " XP to next Level</i>");
		output2("\n<b>* Credits:</b> " + pc.credits);
		output2("\n<b><u>Active Stats</u></b>");
		output2("\n<b>* " + StringUtil.capitalize(pc.shieldDisplayName) + ":</b> " + pc.shieldsQ() + " %, " + "0/" + pc.shields() + "/" + pc.shieldsMax());
		if(pc.hasShields() && !pc.hasShieldGenerator(true)) output2(", <i>No active shield generator equipped!</i>");
		output2("\n<b>* HP:</b> " + pc.HPQ() + " %, " + "0/" + pc.HP() + "/" + pc.HPMax());
		if(pc.HPMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.HPMod, 3)) + ")");
		output2("\n<b>* Lust:</b> " + pc.lustQ() + " %, " + pc.lustMin() + "/" + pc.lust() + "/" + pc.lustMax());
		if(pc.lustMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.lustMod, 3)) + ")");
		output2("\n<b>* Energy:</b> " + pc.energyQ() + " %, " + pc.energyMin() + "/" + pc.energy() + "/" + pc.energyMax());
		if(pc.energyMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.energyMod, 3)) + ")");
		output2("\n<b><u>Passive Stats</u></b>");
		output2("\n<b>* Physique:</b> " + pc.PQ() + " %, " + "0/" + pc.physique() + "/" + pc.physiqueMax());
		if(pc.physiqueMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.physiqueMod, 3)) + ")");
		output2("\n<b>* Reflexes:</b> " + pc.RQ() + " %, " + "0/" + pc.reflexes() + "/" + pc.reflexesMax());
		if(pc.reflexesMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.reflexesMod, 3)) + ")");
		output2("\n<b>* Aim:</b> " + pc.AQ() + " %, " + "0/" + pc.aim() + "/" + pc.aimMax());
		if(pc.aimMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.aimMod, 3)) + ")");
		output2("\n<b>* Intelligence:</b> " + pc.IQ() + " %, " + "0/" + pc.intelligence() + "/" + pc.intelligenceMax());
		if(pc.intelligenceMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.intelligenceMod, 3)) + ")");
		output2("\n<b>* Willpower:</b> " + pc.WQ() + " %, " + "0/" + pc.willpower() + "/" + pc.willpowerMax());
		if(pc.willpowerMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.willpowerMod, 3)) + ")");
		output2("\n<b>* Libido:</b> " + pc.LQ() + " %, " + pc.libidoMin() + "/" + pc.libido() + "/" + pc.libidoMax());
		if(pc.libidoMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.libidoMod, 3)) + ")");
		output2("\n<b>* Taint:</b> " + pc.TQ() + " %, " + pc.taintMin() + "/" + pc.taint() + "/" + pc.taintMax());
		if(pc.taintMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.taintMod, 3)) + ")");
		if(pc.hasPerk("Corrupted")) output2(", <i>Corrupted</i>");
		
		//======COMBAT STATISTICS=====//
		output2("\n\n" + blockHeader("Combat Statistics", false));
		// Physical Combat
		output2("\n<b><u>Physical Combat</u></b>");
		output2("\n<b>* Accuracy Bonus, Melee:</b> " + formatFloat(pc.attack(true), 3) + " %");
		output2("\n<b>* Accuracy Bonus, Ranged:</b> " + formatFloat(pc.attack(false), 3) + " %");
		output2("\n<b>* Critical Chance, Melee:</b> " + formatFloat(pc.critBonus(true), 3) + " %");
		output2("\n<b>* Critical Chance, Ranged:</b> " + formatFloat(pc.critBonus(false), 3) + " %");
		output2("\n<b>* Defense, Armor:</b> " + formatFloat(pc.defense(), 3));
		output2("\n<b>* Defense, Shields:</b> " + formatFloat(pc.shieldDefense(), 3));
		output2("\n<b>* Defense, Lust:</b> " + formatFloat(pc.lustDef(), 3));
		output2("\n<b>* Evasion Bonus:</b> " + formatFloat(pc.evasion(), 3) + " %");
		output2("\n<b>* Fortification:</b> " + formatFloat(pc.fortification(), 3));
		// Melee
		var meleeDamage:TypeCollection = pc.meleeDamage();
		if(meleeDamage.unresistable_hp.damageValue != 0)
			output2("\n<b>* Melee Damage, HP:</b> " + formatFloat(meleeDamage.unresistable_hp.damageValue, 3));
		if(meleeDamage.kinetic.damageValue != 0)
			output2("\n<b>* Melee Damage, Kinetic:</b> " + formatFloat(meleeDamage.kinetic.damageValue, 3));
		if(meleeDamage.electric.damageValue != 0)
			output2("\n<b>* Melee Damage, Electric:</b> " + formatFloat(meleeDamage.electric.damageValue, 3));
		if(meleeDamage.burning.damageValue != 0)
			output2("\n<b>* Melee Damage, Burning:</b> " + formatFloat(meleeDamage.burning.damageValue, 3));
		if(meleeDamage.freezing.damageValue != 0)
			output2("\n<b>* Melee Damage, Freezing:</b> " + formatFloat(meleeDamage.freezing.damageValue, 3));
		if(meleeDamage.corrosive.damageValue != 0)
			output2("\n<b>* Melee Damage, Corrosive:</b> " + formatFloat(meleeDamage.corrosive.damageValue, 3));
		if(meleeDamage.poison.damageValue != 0)
			output2("\n<b>* Melee Damage, Poison:</b> " + formatFloat(meleeDamage.poison.damageValue, 3));
		// Ranged
		var rangedDamage:TypeCollection = pc.rangedDamage();
		if(rangedDamage.unresistable_hp.damageValue != 0)
			output2("\n<b>* Ranged Damage, HP:</b> " + formatFloat(rangedDamage.unresistable_hp.damageValue, 3));
		if(rangedDamage.kinetic.damageValue != 0)
			output2("\n<b>* Ranged Damage, Kinetic:</b> " + formatFloat(rangedDamage.kinetic.damageValue, 3));
		if(rangedDamage.electric.damageValue != 0)
			output2("\n<b>* Ranged Damage, Electric:</b> " + formatFloat(rangedDamage.electric.damageValue, 3));
		if(rangedDamage.burning.damageValue != 0)
			output2("\n<b>* Ranged Damage, Burning:</b> " + formatFloat(rangedDamage.burning.damageValue, 3));
		if(rangedDamage.freezing.damageValue != 0)
			output2("\n<b>* Ranged Damage, Freezing:</b> " + formatFloat(rangedDamage.freezing.damageValue, 3));
		if(rangedDamage.corrosive.damageValue != 0)
			output2("\n<b>* Ranged Damage, Corrosive:</b> " + formatFloat(rangedDamage.corrosive.damageValue, 3));
		if(rangedDamage.poison.damageValue != 0)
			output2("\n<b>* Ranged Damage, Poison:</b> " + formatFloat(rangedDamage.poison.damageValue, 3));
		// Drone
		if(pc.hasActiveCombatDrone())
		{
			var droneName:String = "Drone";
			if(pc.accessory.droneAttack != null)
			{
				/*
				// Probably not reliable, given all the variability...
				droneName = StringUtil.toDisplayCase(pc.accessory.longName);
				var untypedDroneDamageMin:Number = pc.untypedDroneDamage("min");
				var untypedDroneDamageMax:Number = pc.untypedDroneDamage("max");
				if(untypedDroneDamageMin != 0 || untypedDroneDamageMax != 0)
					output2("\n<b>* " + droneName + " Damage, <i>Base</i>:</b> " + formatFloat(untypedDroneDamageMin, 3) + " - " + formatFloat(untypedDroneDamageMax, 3));
				*/
			}
			else
			{
				droneName = "Attack Drone";
				var droneDamageMin:TypeCollection = pc.droneDamage("min");
				var droneDamageMax:TypeCollection = pc.droneDamage("max");
				if(droneDamageMin.unresistable_hp.damageValue != 0 || droneDamageMax.unresistable_hp.damageValue != 0)
					output2("\n<b>* " + droneName + " Damage, HP:</b> " + formatFloat(droneDamageMin.unresistable_hp.damageValue, 3) + " - " + formatFloat(droneDamageMax.unresistable_hp.damageValue, 3));
				if(droneDamageMin.kinetic.damageValue != 0 || droneDamageMax.kinetic.damageValue != 0)
					output2("\n<b>* " + droneName + " Damage, Kinetic:</b> " + formatFloat(droneDamageMin.kinetic.damageValue, 3) + " - " + formatFloat(droneDamageMax.kinetic.damageValue, 3));
				if(droneDamageMin.electric.damageValue != 0 || droneDamageMax.electric.damageValue != 0)
					output2("\n<b>* " + droneName + " Damage, Electric:</b> " + formatFloat(droneDamageMin.electric.damageValue, 3) + " - " + formatFloat(droneDamageMax.electric.damageValue, 3));
				if(droneDamageMin.burning.damageValue != 0 || droneDamageMax.burning.damageValue != 0)
					output2("\n<b>* " + droneName + " Damage, Burning:</b> " + formatFloat(droneDamageMin.burning.damageValue, 3) + " - " + formatFloat(droneDamageMax.burning.damageValue, 3));
				if(droneDamageMin.freezing.damageValue != 0 || droneDamageMax.freezing.damageValue != 0)
					output2("\n<b>* " + droneName + " Damage, Freezing:</b> " + formatFloat(droneDamageMin.freezing.damageValue, 3) + " - " + formatFloat(droneDamageMax.freezing.damageValue, 3));
				if(droneDamageMin.corrosive.damageValue != 0 || droneDamageMax.corrosive.damageValue != 0)
					output2("\n<b>* " + droneName + " Damage, Corrosive:</b> " + formatFloat(droneDamageMin.corrosive.damageValue, 3) + " - " + formatFloat(droneDamageMax.corrosive.damageValue, 3));
				if(droneDamageMin.poison.damageValue != 0 || droneDamageMax.poison.damageValue != 0)
					output2("\n<b>* " + droneName + " Damage, Poison:</b> " + formatFloat(droneDamageMin.poison.damageValue, 3) + " - " + formatFloat(droneDamageMax.poison.damageValue, 3));
			}
		}
		// Resist
		var HPName:String = "HP";
		var shieldName:String = StringUtil.toDisplayCase(pc.shieldDisplayName.toLowerCase());
		var shieldResistance:TypeCollection = pc.getShieldResistances();
		var hpResistance:TypeCollection = pc.getHPResistances();
		if((shieldResistance.unresistable_hp.resistanceValue + hpResistance.unresistable_hp.resistanceValue) != 0)
			output2("\n<b>* Resistance, HP:</b> " + formatFloat(hpResistance.unresistable_hp.resistanceValue, 3) + " % " + HPName + ", " + formatFloat(shieldResistance.unresistable_hp.resistanceValue, 3) + " % " + shieldName);
		if((shieldResistance.kinetic.resistanceValue + hpResistance.kinetic.resistanceValue) != 0)
			output2("\n<b>* Resistance, Kinetic:</b> " + formatFloat(hpResistance.kinetic.resistanceValue, 3) + " % " + HPName + ", " + formatFloat(shieldResistance.kinetic.resistanceValue, 3) + " % " + shieldName);
		if((shieldResistance.electric.resistanceValue + hpResistance.electric.resistanceValue) != 0)
			output2("\n<b>* Resistance, Electric:</b> " + formatFloat(hpResistance.electric.resistanceValue, 3) + " % " + HPName + ", " + formatFloat(shieldResistance.electric.resistanceValue, 3) + " % " + shieldName);
		if((shieldResistance.burning.resistanceValue + hpResistance.burning.resistanceValue) != 0)
			output2("\n<b>* Resistance, Burning:</b> " + formatFloat(hpResistance.burning.resistanceValue, 3) + " % " + HPName + ", " + formatFloat(shieldResistance.burning.resistanceValue, 3) + " % " + shieldName);
		if((shieldResistance.freezing.resistanceValue + hpResistance.freezing.resistanceValue) != 0)
			output2("\n<b>* Resistance, Freezing:</b> " + formatFloat(hpResistance.freezing.resistanceValue, 3) + " % " + HPName + ", " + formatFloat(shieldResistance.freezing.resistanceValue, 3) + " % " + shieldName);
		if((shieldResistance.corrosive.resistanceValue + hpResistance.corrosive.resistanceValue) != 0)
			output2("\n<b>* Resistance, Corrosive:</b> " + formatFloat(hpResistance.corrosive.resistanceValue, 3) + " % " + HPName + ", " + formatFloat(shieldResistance.corrosive.resistanceValue, 3) + " % Shield");
		if((shieldResistance.poison.resistanceValue + hpResistance.poison.resistanceValue) != 0)
			output2("\n<b>* Resistance, Poison:</b> " + formatFloat(hpResistance.poison.resistanceValue, 3) + " % " + HPName + ", " + formatFloat(shieldResistance.poison.resistanceValue, 3) + " % " + shieldName);
		// Sexual Combat
		output2("\n<b><u>Sexual Combat</u></b>");
		// Melee
		if(meleeDamage.unresistable_lust.damageValue != 0)
			output2("\n<b>* Melee Damage, Lust:</b> " + formatFloat(meleeDamage.unresistable_lust.damageValue, 3));
		if(meleeDamage.psionic.damageValue != 0)
			output2("\n<b>* Melee Damage, Psionic:</b> " + formatFloat(meleeDamage.psionic.damageValue, 3));
		if(meleeDamage.drug.damageValue != 0)
			output2("\n<b>* Melee Damage, Drug:</b> " + formatFloat(meleeDamage.drug.damageValue, 3));
		if(meleeDamage.pheromone.damageValue != 0)
			output2("\n<b>* Melee Damage, Pheromone:</b> " + formatFloat(meleeDamage.pheromone.damageValue, 3));
		if(meleeDamage.tease.damageValue != 0)
			output2("\n<b>* Melee Damage, Tease:</b> " + formatFloat(meleeDamage.tease.damageValue, 3));
		// Ranged
		if(rangedDamage.unresistable_lust.damageValue != 0)
			output2("\n<b>* Ranged Damage, Lust:</b> " + formatFloat(rangedDamage.unresistable_lust.damageValue, 3));
		if(rangedDamage.psionic.damageValue != 0)
			output2("\n<b>* Ranged Damage, Psionic:</b> " + formatFloat(rangedDamage.psionic.damageValue, 3));
		if(rangedDamage.drug.damageValue != 0)
			output2("\n<b>* Ranged Damage, Drug:</b> " + formatFloat(rangedDamage.drug.damageValue, 3));
		if(rangedDamage.pheromone.damageValue != 0)
			output2("\n<b>* Ranged Damage, Pheromone:</b> " + formatFloat(rangedDamage.pheromone.damageValue, 3));
		if(rangedDamage.tease.damageValue != 0)
			output2("\n<b>* Ranged Damage, Tease:</b> " + formatFloat(rangedDamage.tease.damageValue, 3));
		// Resist
		var lustResistance:TypeCollection = pc.getLustResistances();
		if(lustResistance.unresistable_lust.resistanceValue != 0)
			output2("\n<b>* Resistance, Lust:</b> " + formatFloat(lustResistance.unresistable_lust.resistanceValue, 3) + " %");
		if(lustResistance.psionic.resistanceValue != 0)
			output2("\n<b>* Resistance, Psionic:</b> " + formatFloat(lustResistance.psionic.resistanceValue, 3) + " %");
		if(lustResistance.drug.resistanceValue != 0)
			output2("\n<b>* Resistance, Drug:</b> " + formatFloat(lustResistance.drug.resistanceValue, 3) + " %");
		if(lustResistance.pheromone.resistanceValue != 0)
			output2("\n<b>* Resistance, Pheromone:</b> " + formatFloat(lustResistance.pheromone.resistanceValue, 3) + " %");
		if(lustResistance.tease.resistanceValue != 0)
			output2("\n<b>* Resistance, Tease:</b> " + formatFloat(lustResistance.tease.resistanceValue, 3) + " %");
		// Sexy Stuff
		output2("\n<b>* Sexiness:</b> " + pc.sexiness());
		output2("\n<b>* Sexiness, Attire, Total:</b> " + formatFloat(pc.outfitSexiness(), 3));
		if(pc.hasArmor()) output2("\n<b>* Sexiness, Attire, Outfit:</b> " + formatFloat(pc.itemSexiness(pc.armor), 3) + (pc.wornItemIsTransparent(pc.armor) ? ", Transparent" : ""));
		if(pc.hasUpperGarment()) output2("\n<b>* Sexiness, Attire, Upper Undergarment:</b> " + formatFloat(pc.itemSexiness(pc.upperUndergarment), 3) + (pc.wornItemIsTransparent(pc.upperUndergarment) ? ", Transparent" : ""));
		if(pc.hasLowerGarment()) output2("\n<b>* Sexiness, Attire, Lower Undergarment:</b> " + formatFloat(pc.itemSexiness(pc.lowerUndergarment), 3) + (pc.wornItemIsTransparent(pc.lowerUndergarment) ? ", Transparent" : ""));
		var teases:Array = [-1, -1, -1, -1, -1];
		if(flags["TIMES_BUTT_TEASED"] != undefined) teases[0] = Math.min(flags["TIMES_BUTT_TEASED"], 100);
		if(flags["TIMES_CHEST_TEASED"] != undefined) teases[1] = Math.min(flags["TIMES_CHEST_TEASED"], 100);
		if(flags["TIMES_CROTCH_TEASED"] != undefined) teases[2] = Math.min(flags["TIMES_CROTCH_TEASED"], 100);
		if(flags["TIMES_HIPS_TEASED"] != undefined) teases[3] = Math.min(flags["TIMES_HIPS_TEASED"], 100);
		if(flags["TIMES_ORAL_TEASED"] != undefined) teases[4] = Math.min(flags["TIMES_ORAL_TEASED"], 100);
		if(teases[0] >= 0) output2("\n<b>* Tease Skill, Ass:</b> " + teases[0] + "/100");
		if(teases[1] >= 0) output2("\n<b>* Tease Skill, Chest:</b> " + teases[1] + "/100");
		if(teases[2] >= 0) output2("\n<b>* Tease Skill, Crotch:</b> " + teases[2] + "/100");
		if(teases[3] >= 0) output2("\n<b>* Tease Skill, Hips:</b> " + teases[3] + "/100");
		if(teases[4] >= 0) output2("\n<b>* Tease Skill, Oral:</b> " + teases[4] + "/100");
		// Performance
		output2("\n<b><u>Combat Performance</u></b>");
		output2("\n<b>* Combat, Losses:</b> " + StatTracking.getStat("combat/losses"));
		output2("\n<b>* Combat, Victories:</b> " + StatTracking.getStat("combat/wins"));
		if(flags["TIMES_BUTT_TEASED"] != undefined) output2("\n<b>* Tease, Times Used Ass:</b> " + flags["TIMES_BUTT_TEASED"]);
		if(flags["TIMES_CHEST_TEASED"] != undefined) output2("\n<b>* Tease, Times Used Chest:</b> " + flags["TIMES_CHEST_TEASED"]);
		if(flags["TIMES_CROTCH_TEASED"] != undefined) output2("\n<b>* Tease, Times Used Crotch:</b> " + flags["TIMES_CROTCH_TEASED"]);
		if(flags["TIMES_HIPS_TEASED"] != undefined) output2("\n<b>* Tease, Times Used Hips:</b> " + flags["TIMES_HIPS_TEASED"]);
		if(flags["TIMES_ORAL_TEASED"] != undefined) output2("\n<b>* Tease, Times Used Oral:</b> " + flags["TIMES_ORAL_TEASED"]);
		
		//======NPC STATISTICS=====//
		
		/*
		output2("\n\n" + blockHeader("Interpersonal Statistics", false));
		
		Moved all these to their respective sections under "Encounters"!
		
		*/
	}
	
	// Location
	if(showID == "Location" || showID == "All")
	{
		//=====LOCATION=====//
		output2("\n\n" + blockHeader("Location Information", false));
		
		// Physical Location
		output2("\n<b><u>Current Location</u></b>");
		var inShip:Boolean = InShipInterior();
		var roomFlagTypes:Array = [];
		var roomFlagRules:Array = [];
		var roomFlagPlace:Array = [];
		var roomFlagFlags:Array = [];
		for(i = 0; i < rooms[currentLocation].roomFlags.length; i++)
		{
			switch(rooms[currentLocation].roomFlags[i])
			{
				case GLOBAL.PUBLIC: roomFlagTypes.push("Public"); break;
				case GLOBAL.PRIVATE: roomFlagTypes.push("Private"); break;
				case GLOBAL.INDOOR: roomFlagTypes.push("Indoors"); break;
				case GLOBAL.OUTDOOR: roomFlagTypes.push("Outdoors"); break;
				case GLOBAL.SHIPINTERIOR: roomFlagTypes.push("Ship Interior"); break;
				
				case GLOBAL.LOW_TECH: roomFlagTypes.push("Technologically Limited"); break;
				case GLOBAL.FOREST: roomFlagTypes.push("Forest"); break;
				case GLOBAL.JUNGLE: roomFlagTypes.push("Jungle"); break;
				case GLOBAL.WATERFALL: roomFlagTypes.push("Waterfall"); break;
				case GLOBAL.DESERT: roomFlagTypes.push("Desert"); break;
				case GLOBAL.CAVE: roomFlagTypes.push("Caves"); break;
				case GLOBAL.ICYTUNDRA: roomFlagTypes.push("Icy Tundra"); break;
				case GLOBAL.FROZENTUNDRA: roomFlagTypes.push("Frozen Tundra"); break;
				case GLOBAL.LOW_GRAVITY: roomFlagTypes.push("Low Gravity"); break;
				
				case GLOBAL.NUDITY_ILLEGAL: roomFlagRules.push("Nudity Illegal"); break;
				case GLOBAL.FAPPING_ILLEGAL: roomFlagRules.push("Masturbation Illegal"); break;
				case GLOBAL.NOFAP: roomFlagRules.push("Masturbation Impossible"); break;
				
				case GLOBAL.SHIPHANGAR: roomFlagPlace.push("Ship Hangar"); break;
				case GLOBAL.NURSERY: roomFlagPlace.push("Nursery"); break;
				case GLOBAL.BAR: roomFlagPlace.push("Bar"); break;
				case GLOBAL.COMMERCE: roomFlagPlace.push("Commerce"); break;
				case GLOBAL.MEDICAL: roomFlagPlace.push("Medical"); break;
				case GLOBAL.FIRST_AID: roomFlagPlace.push("First Aid"); break;
				case GLOBAL.POOL: roomFlagPlace.push("Pool"); break;
				case GLOBAL.LIFTUP:
				case GLOBAL.LIFTDOWN: roomFlagPlace.push("Lift"); break;
				case GLOBAL.TAXI: roomFlagPlace.push("Transport"); break;
				case GLOBAL.PLANE: roomFlagPlace.push("Airplane"); break;
				case GLOBAL.PLANT_BULB: roomFlagPlace.push("Venus Trap"); break;
				case GLOBAL.SPIDER_WEB: roomFlagPlace.push("Web Trap"); break;
				
				case GLOBAL.QUEST: roomFlagFlags.push("This is an important location."); break;
				case GLOBAL.OBJECTIVE: roomFlagFlags.push("This is a point of interest."); break;
				case GLOBAL.HAZARD: roomFlagFlags.push("This location is potentially hazardous."); break;
				case GLOBAL.NPC: roomFlagFlags.push("You may interact with someone here."); break;
				case GLOBAL.BED: roomFlagFlags.push("It is possible to sleep here."); break;
			}
		}
		if(disableExploreEvents()) roomFlagFlags.push("<i>Explore events are disabled.</i>");
		output2("\n<b>* " + (rooms[(inShip ? shipLocation : currentLocation)].planet.indexOf("PLANET:") != -1 ? "Planet" : "Location") + ":</b> " + getPlanetName((inShip ? shipLocation : currentLocation), true));
		output2("\n<b>* System:</b> " + getSystemName((inShip ? shipLocation : currentLocation), true));
		if(roomFlagTypes.length > 0)
		{
			output2("\n<b>* Area:</b> ");
			for(i = 0; i < roomFlagTypes.length; i++)
			{
				if(i != 0) output2(", ");
				output2(roomFlagTypes[i]);
			}
		}
		if(roomFlagRules.length > 0)
		{
			output2("\n<b>* Rules:</b> ");
			for(i = 0; i < roomFlagRules.length; i++)
			{
				if(i != 0) output2(", ");
				output2(roomFlagRules[i]);
			}
		}
		if(roomFlagPlace.length > 0)
		{
			output2("\n<b>* Usage:</b> ");
			for(i = 0; i < roomFlagPlace.length; i++)
			{
				if(i != 0) output2(", ");
				output2(roomFlagPlace[i]);
			}
		}
		if(roomFlagFlags.length > 0)
		{
			output2("\n<b>* Notes:</b> ");
			for(i = 0; i < roomFlagFlags.length; i++)
			{
				if(i != 0) output2(" ");
				output2(roomFlagFlags[i]);
			}
		}
		//var medRoomID:String = nearestMedicalCenter("", false);
		//if(medRoomID != "") output2("\n<b>* Nearest Care Area:</b> " + StringUtil.toDisplayCase((rooms[medRoomID].roomName.replace("\n", " ")).toLowerCase()));
		
		// Ship Location
		output2("\n<b><u>Current Ship Details</u></b>");
		output2("\n<b>* Name:</b> " + PCShipName(true));
		//output2("\n<b>* Manufacturer:</b> " + PCShipManufacturer());
		//output2("\n<b>* Model:</b> " + PCShipModel());
		output2("\n<b>* Manufacturer/Model:</b> " + PCShipModel());
		// Temp ship stuff!
		if(shits["SHIP"] != undefined)
		{
			var pcShip:ShittyShip = shits["SHIP"];
			var pcCrew:int = crew(true, false);
			output2("\n<b>* Base Value:</b> " + pcShip.shipCost() + " Credits");
			output2("\n<b>* Shields:</b> " + pcShip.shieldsQ() + " %, " + "0/" + formatFloat(pcShip.shields(), 3) + "/" + formatFloat(pcShip.shieldsMax(), 3));
			if(pcShip.hasShields() && !pcShip.hasShieldGenerator(true)) output2(", <i>No active shield generator equipped!</i>");
			output2("\n<b>* Armor:</b> " + pcShip.HPQ() + " %, " + "0/" + formatFloat(pcShip.HP(), 3) + "/" + formatFloat(pcShip.HPMax(), 3));
			output2("\n<b>* Energy:</b> " + pcShip.energyQ() + " %, " + formatFloat(pcShip.energyMin(), 3) + "/" + formatFloat(pcShip.energy(), 3) + "/" + formatFloat(pcShip.energyMax(), 3));
			output2("\n<b>* Defense, Shield:</b> " + formatFloat(pcShip.shieldDefense(), 3));
			output2("\n<b>* Defense, Armor:</b> " + formatFloat(pcShip.defense(), 3));
			output2("\n<b>* Power Generation:</b> " + formatFloat(pcShip.shipPowerGen(), 3));
			output2("\n<b>* Agility:</b> " + formatFloat(pcShip.shipAgility(), 3));
			output2("\n<b>* Sensors:</b> " + formatFloat(pcShip.shipSensors(), 3));
			output2("\n<b>* Systems:</b> " + formatFloat(pcShip.shipSystems(), 3));
			output2("\n<b>* Thrust:</b> " + formatFloat(pcShip.shipThrust(), 3));
			output2("\n<b>* Accuracy:</b> " + formatFloat(pcShip.shipAccuracy(), 3));
			output2("\n<b>* Evasion:</b> " + formatFloat(pcShip.shipEvasion(), 3));
			output2("\n<b>* Modules, Total Capacity:</b> " + pcShip.shipCapacity());
			output2("\n<b>* Modules, Installed:</b> " + pcShip.inventory.length);
			output2("\n<b>* Modules, Crew:</b> " + Math.min(pcCrew, pcShip.shipCrewCapacity()));
			if(pcCrew > pcShip.shipCrewCapacity()) output2(" (" + pcCrew + ")");
			output2("\n<b>* Weapons, Total:</b> " + pcShip.listShipWeapons().length + "/" + pcShip.shipGunCapacity());
			output2("\n<b>* Gadgets, Total:</b> " + pcShip.listShipGadgets().length);
		}
		if(!inShip)
		{
			output2("\n<b><u>Ship Location</u></b>");
			output2("\n<b>* " + (rooms[shipLocation].planet.indexOf("PLANET:") != -1 ? "Planet" : "Location") + ":</b> " + getPlanetName(shipLocation, true));
			output2("\n<b>* System:</b> " + getSystemName(shipLocation, true));
		}
	}
	
	// Other
	if(showID == "Other" || showID == "All")
	{
		//=====GENERAL STATS=====//
		output2("\n\n" + blockHeader("General Statistics", false));
		// Crew
		output2("\n<b><u>Crew</u></b>");
		output2("\n<b>* Total Recruited:</b> " + crewRecruited(true).length);
		output2("\n<b>* Total Onboard:</b> " + crew(true, true));
		// Traveling
		output2("\n<b><u>Travel</u></b>");
		output2("\n<b>* Time Spent Moving From Room to Room:</b> " + prettifyMinutes(StatTracking.getStat("movement/time travelled")));
		output2("\n<b>* Time Spent Flying:</b> " + prettifyMinutes(StatTracking.getStat("movement/time flown")));
		// Sleeping partner
		var sleepingPartner:String = getSleepingPartnerName();
		// Virgin booties claimed
		var totalVirginitiesTaken:Number = 0;
		if(StatTracking.getStat("characters/maiden vanae/cherrys popped") > 0) totalVirginitiesTaken += StatTracking.getStat("characters/maiden vanae/cherrys popped");
		if(!chars["ANNO"].analVirgin) totalVirginitiesTaken++;
		if(!chars["EMBRY"].analVirgin) totalVirginitiesTaken++;
		if(!chars["EMBRY"].cockVirgin) totalVirginitiesTaken++;
		if(!chars["EMBRY"].vaginalVirgin) totalVirginitiesTaken++;
		if(!chars["FISIANNA"].vaginalVirgin) totalVirginitiesTaken++;
		if(!chars["GEOFF"].analVirgin || flags["GEOFF_TOPPED"] != undefined) totalVirginitiesTaken++;
		if(!chars["KIRO"].vaginalVirgin) totalVirginitiesTaken++;
		if(!chars["LERRIS"].vaginalVirgin) totalVirginitiesTaken++;
		if(!chars["PENNY"].cockVirgin) totalVirginitiesTaken++;
		if(!chars["SAENDRA"].cockVirgin) totalVirginitiesTaken++;
		if(flags["TOOK_DELILAHS_BUTTGINITY"] != undefined) totalVirginitiesTaken++;
		if(flags["TOOK_PRINCESS_BUTTGINITY"] != undefined) totalVirginitiesTaken++;
		if(flags["ANZHELA_ANALED"] != undefined) totalVirginitiesTaken++;
		if(flags["NAYNA_FUCKED"] != undefined) totalVirginitiesTaken++;
		if(flags["ANALED_YAMMI"] != undefined) totalVirginitiesTaken++;
		if(flags["INESSA_VIRGINITY"] != undefined) totalVirginitiesTaken++;
		if(flags["SERA_VIRGINITY_TAKEN"] != undefined) totalVirginitiesTaken++;
		if(flags["GIL_PUSS_FUCKED"] != undefined) totalVirginitiesTaken++;
		if(flags["CHRISSY_ANAL"] != undefined) totalVirginitiesTaken++;
		if(flags["ULA_DEFLOWERED"] != undefined) totalVirginitiesTaken++;
		if(flags["LILA_VIRGINITY_TAKEN"] != undefined) totalVirginitiesTaken++;
		if(flags["HALEY_ANAL_VIRGINITY_TAKEN"] != undefined) totalVirginitiesTaken++;
		if(!ainaIsVirgin()) totalVirginitiesTaken++;
		if(sleepingPartner != "" || totalVirginitiesTaken > 0 || pantyFapCount() > 0)
		{
			output2("\n<b><u>Sexploration</u></b>");
			if(sleepingPartner != "") output2("\n<b>* Sleeping With:</b> " + sleepingPartner);
			if(totalVirginitiesTaken > 0) output2("\n<b>* Virginities Claimed:</b> " + totalVirginitiesTaken);
			if(pantyFapCount() > 0) output2("\n<b>* Panties Owned:</b> " + pantyFapCount());
		}
		
		//Births header!
		var totalOffspring:Number = (StatTracking.getStat("pregnancy/total births") + StatTracking.getStat("pregnancy/total sired"));
		var totalProduce:Number = 0;
		totalProduce += StatTracking.getStat("pregnancy/ovalasting eggs laid");
		totalProduce += StatTracking.getStat("pregnancy/ovilium eggs laid");
		totalProduce += StatTracking.getStat("pregnancy/siegwulfe eggs laid");
		totalProduce += StatTracking.getStat("pregnancy/egg trainer eggs laid");
		totalProduce += StatTracking.getStat("pregnancy/unfertilized venus pitcher seeds");
		if((totalOffspring + totalProduce) > 0)
		{
			output2("\n\n" + blockHeader("Reproduction Statistics", false));
			if(totalOffspring)
			{
				output2("\n<b><u>Offspring</u></b>");
				output2("\n<b>* Total:</b> " + totalOffspring);
				if(StatTracking.getStat("pregnancy/total day care") > 0)
					output2("\n<b>* Total @ Daycare:</b> " + StatTracking.getStat("pregnancy/total day care"));
				// Mother
				if(StatTracking.getStat("pregnancy/total births") > 0)
					output2("\n<b>* Births, Total:</b> " + StatTracking.getStat("pregnancy/total births"));
				if(StatTracking.getStat("pregnancy/ausar births") > 0)
					output2("\n<b>* Births, Ausar Children (generic):</b> " + StatTracking.getStat("pregnancy/ausar births"));
				if(StatTracking.getStat("pregnancy/jumper horse births") > 0)
					output2("\n<b>* Births, Bored Jumper (Gray) Children:</b> " + StatTracking.getStat("pregnancy/jumper horse births"));
				if(StatTracking.getStat("pregnancy/jumper dog births") > 0)
					output2("\n<b>* Births, Bored Jumper (White) Children:</b> " + StatTracking.getStat("pregnancy/jumper dog births"));
				if(StatTracking.getStat("pregnancy/jumper cat births") > 0)
					output2("\n<b>* Births, Bored Jumper (Creamy) Children:</b> " + StatTracking.getStat("pregnancy/jumper cat births"));
				if(StatTracking.getStat("pregnancy/jumper terran births") > 0)
					output2("\n<b>* Births, Bored Jumper (Brown) Children:</b> " + StatTracking.getStat("pregnancy/jumper terran births"));
				if(StatTracking.getStat("pregnancy/fertile bothrioc eggs") > 0)
					output2("\n<b>* Births, Bothrioc Eggs, Fertile:</b> " + StatTracking.getStat("pregnancy/fertile bothrioc eggs"));
				if(StatTracking.getStat("pregnancy/infertile bothrioc eggs") > 0)
					output2("\n<b>* Births, Bothrioc Eggs, Infertile:</b> " + StatTracking.getStat("pregnancy/infertile bothrioc eggs"));
				var buttbugNormalEggs:Number = (StatTracking.getStat("pregnancy/butt bugs/eggs laid/type0") + StatTracking.getStat("pregnancy/butt bugs/eggs laid/type1"));
				if(StatTracking.getStat("pregnancy/butt bugs/eggs laid/total") > 0)
					output2("\n<b>* Births, Butt Bug Eggs, Total:</b> " + StatTracking.getStat("pregnancy/butt bugs/eggs laid/total"));
				if(StatTracking.getStat("pregnancy/butt bugs/eggs laid/infertile") > 0)
					output2("\n<b>* Births, Butt Bug Eggs, Infertile:</b> " + StatTracking.getStat("pregnancy/butt bugs/eggs laid/infertile"));
				if(buttbugNormalEggs > 0)
					output2("\n<b>* Births, Butt Bug Eggs, Fertile:</b> " + buttbugNormalEggs);
				if(StatTracking.getStat("pregnancy/butt bugs/eggs laid/type2") > 0)
					output2("\n<b>* Births, Butt Bug Eggs, Fertile, Hybrid:</b> " + StatTracking.getStat("pregnancy/butt bugs/eggs laid/type2"));
				if(StatTracking.getStat("pregnancy/cockvine seedlings birthed") > 0)
					output2("\n<b>* Births, Cockvines:</b> " + StatTracking.getStat("pregnancy/cockvine seedlings birthed"));
				if(StatTracking.getStat("pregnancy/cockvine seedlings captured") > 0)
					output2("\n<b>* Births, Cockvines, Captured:</b> " + StatTracking.getStat("pregnancy/cockvine seedlings captured"));
				if(StatTracking.getStat("pregnancy/cuntsnake hatched") > 0)
					output2("\n<b>* Births, Cunt Snake Eggs, Hatched:</b> " + StatTracking.getStat("pregnancy/cuntsnake hatched"));
				if(StatTracking.getStat("pregnancy/frostwyrm eggs laid") > 0)
					output2("\n<b>* Births, [frostwyrm.name]’s Eggs:</b> " + StatTracking.getStat("pregnancy/frostwyrm eggs laid"));
				if(StatTracking.getStat("pregnancy/ilaria births") > 0)
					output2("\n<b>* Births, Ilaria Children:</b> " + StatTracking.getStat("pregnancy/ilaria births"));
				if(StatTracking.getStat("pregnancy/korgonne births") > 0)
					output2("\n<b>* Births, Korgonne Young:</b> " + StatTracking.getStat("pregnancy/korgonne births"));
				if(StatTracking.getStat("pregnancy/lah kids") > 0)
					output2("\n<b>* Births, Lah’s Children:</b> " + StatTracking.getStat("pregnancy/lah kids"));
				if(StatTracking.getStat("pregnancy/lapinara eggs") > 0)
					output2("\n<b>* Births, Lapinara Eggs:</b> " + StatTracking.getStat("pregnancy/lapinara eggs"));
				if(StatTracking.getStat("pregnancy/laquine births") > 0)
					output2("\n<b>* Births, Laquine Children (generic):</b> " + StatTracking.getStat("pregnancy/laquine births"));
				if(StatTracking.getStat("pregnancy/l. d. c. births") > 0)
					output2("\n<b>* Births, L.D.C.’s Children:</b> " + StatTracking.getStat("pregnancy/l. d. c. births"));
				if(StatTracking.getStat("pregnancy/milodan births") > 0)
					output2("\n<b>* Births, Milodan Young:</b> " + StatTracking.getStat("pregnancy/milodan births"));
				if(StatTracking.getStat("pregnancy/mirrin kids") > 0)
					output2("\n<b>* Births, Mirrin’s Children:</b> " + StatTracking.getStat("pregnancy/mirrin kids"));
				var nyreanEggs:Number = 0;
				if(StatTracking.getStat("pregnancy/nyrea eggs") > 0)
				{
					nyreanEggs += StatTracking.getStat("pregnancy/nyrea eggs");
					output2("\n<b>* Births, Nyrean Eggs, Huntress:</b> " + StatTracking.getStat("pregnancy/nyrea eggs"));
				}
				if(StatTracking.getStat("pregnancy/renvra eggs") > 0)
				{
					nyreanEggs += StatTracking.getStat("pregnancy/renvra eggs");
					output2("\n<b>* Births, Nyrean Eggs, Renvra:</b> " + StatTracking.getStat("pregnancy/renvra eggs"));
				}
				if(StatTracking.getStat("pregnancy/royal nyrea eggs") > 0)
				{
					nyreanEggs += StatTracking.getStat("pregnancy/royal nyrea eggs");
					output2("\n<b>* Births, Nyrean Eggs, Royal:</b> " + StatTracking.getStat("pregnancy/royal nyrea eggs"));
				}
				if(nyreanEggs > 0)
					output2("\n<b>* Births, Nyrean Eggs, Total:</b> " + nyreanEggs);
				if(StatTracking.getStat("pregnancy/psychic tentacle beast birthed") > 0)
					output2("\n<b>* Births, Psychic Tentacle Beasts, Total:</b> " + StatTracking.getStat("pregnancy/psychic tentacle beast birthed"));
				if(StatTracking.getStat("pregnancy/psychic tentacle beast day care") > 0)
					output2("\n<b>* Births, Psychic Tentacle Beasts @ Daycare:</b> " + StatTracking.getStat("pregnancy/psychic tentacle beast day care"));
				if(StatTracking.getStat("pregnancy/quaelle births") > 0)
					output2("\n<b>* Births, Quaelle’s Children:</b> " + StatTracking.getStat("pregnancy/quaelle births"));
				if(StatTracking.getStat("pregnancy/rahn eggs/birthed") > 0)
					output2("\n<b>* Births, Rahn Eggs, Total:</b> " + StatTracking.getStat("pregnancy/rahn eggs/birthed"));
				if(StatTracking.getStat("pregnancy/rahn eggs/day care") > 0)
					output2("\n<b>* Births, Rahn Eggs @ Daycare:</b> " + StatTracking.getStat("pregnancy/rahn eggs/day care"));
				if(StatTracking.getStat("pregnancy/rahn eggs/tamani") > 0)
					output2("\n<b>* Births, Rahn Eggs @ TamaniCorp:</b> " + StatTracking.getStat("pregnancy/rahn eggs/tamani"));
				if(StatTracking.getStat("pregnancy/raskvel births") > 0)
					output2("\n<b>* Births, Raskvel Eggs, Total:</b> " + StatTracking.getStat("pregnancy/raskvel births"));
				if(StatTracking.getStat("pregnancy/renvra kids") > 0)
					output2("\n<b>* Births, Renvra’s Children:</b> " + StatTracking.getStat("pregnancy/renvra kids"));
				if(StatTracking.getStat("pregnancy/riya kids") > 0)
					output2("\n<b>* Births, Riya’s Children:</b> " + StatTracking.getStat("pregnancy/riya kids"));
				if(StatTracking.getStat("pregnancy/sera kids") > 0)
					output2("\n<b>* Births, Sera’s Children:</b> " + StatTracking.getStat("pregnancy/sera kids"));
				if(StatTracking.getStat("pregnancy/shekka kids") > 0)
					output2("\n<b>* Births, Shekka’s Children:</b> " + StatTracking.getStat("pregnancy/shekka kids"));
				if(StatTracking.getStat("pregnancy/shock hopper births") > 0)
					output2("\n<b>* Births, Shock Hopper’s Children:</b> " + StatTracking.getStat("pregnancy/shock hopper births"));
				if(StatTracking.getStat("pregnancy/sydian births") > 0)
					output2("\n<b>* Births, Sydian Young:</b> " + StatTracking.getStat("pregnancy/sydian births"));
				if(StatTracking.getStat("pregnancy/venus pitcher seeds") > 0)
					output2("\n<b>* Births, Venus Pitcher Seeds, Total:</b> " + StatTracking.getStat("pregnancy/venus pitcher seeds"));
				if(StatTracking.getStat("pregnancy/venus pitcher seeds") > 0)
					output2("\n<b>* Births, Venus Pitcher Seeds, Planted:</b> " + (StatTracking.getStat("pregnancy/venus pitcher seeds") - StatTracking.getStat("pregnancy/fertilized venus pitcher seeds/day care") - StatTracking.getStat("pregnancy/unfertilized venus pitcher seeds")));
				if(StatTracking.getStat("pregnancy/fertilized venus pitcher seeds/day care") > 0)
					output2("\n<b>* Births, Venus Pitcher Seeds @ Daycare:</b> " + StatTracking.getStat("pregnancy/fertilized venus pitcher seeds/day care"));
				if(StatTracking.getStat("pregnancy/queen of the deep eggs") > 0)
					output2("\n<b>* Births, Water Queen Young:</b> " + StatTracking.getStat("pregnancy/queen of the deep eggs"));
				if(StatTracking.getStat("pregnancy/zaalt kids") > 0)
					output2("\n<b>* Births, Zaalt’s Children:</b> " + StatTracking.getStat("pregnancy/zaalt kids"));
				if(StatTracking.getStat("pregnancy/zephyr births") > 0)
					output2("\n<b>* Births, Zephyr’s Children:</b> " + StatTracking.getStat("pregnancy/zephyr births"));
				if(StatTracking.getStat("pregnancy/zil birthed") > 0)
					output2("\n<b>* Births, Zil Young:</b> " + StatTracking.getStat("pregnancy/zil birthed"));
				// Father
				if(StatTracking.getStat("pregnancy/total sired") > 0)
					output2("\n<b>* Sired, Total:</b> " + StatTracking.getStat("pregnancy/total sired"));
				if(StatTracking.getStat("pregnancy/aina sired") > 0)
				{
					output2("\n<b>* Sired, Aina’s Children:</b> ");
					var ainaKids:Number = StatTracking.getStat("pregnancy/aina sired");
					output2(" Nina");
					if(ainaKids > 1) output2(" and other");
					if(ainaKids > 2) output2("s");
				}
				if(StatTracking.getStat("pregnancy/aina sons") > 0)
					output2("\n<b>* Sired, Aina’s Sons:</b> " + StatTracking.getStat("pregnancy/aina sons"));
				if(StatTracking.getStat("pregnancy/aina daughters") > 0)
					output2("\n<b>* Sired, Aina’s Daughters:</b> " + StatTracking.getStat("pregnancy/aina daughters"));
				if(StatTracking.getStat("pregnancy/briha kids") > 0)
				{
					output2("\n<b>* Sired, Briha’s Children:</b> ");
					var unnamedBrihaKids:Number = StatTracking.getStat("pregnancy/briha kids");
					if(flags["BRIHA_OLDEST_SPAWN_AGE"] != undefined)
					{
						output2(" Aya");
						unnamedBrihaKids--;
						if(unnamedBrihaKids > 1) output2(",");
					}
					if(flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"] != undefined)
					{
						if(unnamedBrihaKids == 1) output2(" and");
						output2(" Brahn");
						unnamedBrihaKids--;
					}
					if(unnamedBrihaKids > 0)
					{
						output2(" and " + num2Text(unnamedBrihaKids) + " other");
						if(unnamedBrihaKids != 1) output2("s");
					}
					else if(flags["BRIHA_OLDEST_SPAWN_AGE"] == undefined && flags["BRIHA_SECOND_OLDEST_SPAWN_AGE"] == undefined) output2(" " + unnamedBrihaKids);
				}
				if(StatTracking.getStat("pregnancy/briha sons") > 0)
					output2("\n<b>* Sired, Briha’s Sons:</b> " + StatTracking.getStat("pregnancy/briha sons"));
				if(StatTracking.getStat("pregnancy/briha daughters") > 0)
					output2("\n<b>* Sired, Briha’s Daughters:</b> " + StatTracking.getStat("pregnancy/briha daughters"));
				if(StatTracking.getStat("pregnancy/jumper horse sired") > 0)
					output2("\n<b>* Sired, Bored Jumper (Gray) Children:</b> " + StatTracking.getStat("pregnancy/jumper horse sired"));
				if(StatTracking.getStat("pregnancy/jumper dog sired") > 0)
					output2("\n<b>* Sired, Bored Jumper (White) Children:</b> " + StatTracking.getStat("pregnancy/jumper dog sired"));
				if(StatTracking.getStat("pregnancy/jumper cat sired") > 0)
					output2("\n<b>* Sired, Bored Jumper (Creamy) Children:</b> " + StatTracking.getStat("pregnancy/jumper cat sired"));
				if(StatTracking.getStat("pregnancy/jumper terran sired") > 0)
					output2("\n<b>* Sired, Bored Jumper (Brown) Children:</b> " + StatTracking.getStat("pregnancy/jumper terran sired"));
				if(StatTracking.getStat("pregnancy/ellie sired") > 0)
					output2("\n<b>* Sired, Ellie’s Children:</b> " + StatTracking.getStat("pregnancy/ellie sired"));
				if(StatTracking.getStat("pregnancy/frostwyrm eggs sired") > 0)
					output2("\n<b>* Sired, [frostwyrm.name]’s Eggs:</b> " + StatTracking.getStat("pregnancy/frostwyrm eggs sired"));
				if(StatTracking.getStat("pregnancy/ilaria sired") > 0)
					output2("\n<b>* Sired, Ilaria’s Children:</b> " + StatTracking.getStat("pregnancy/ilaria sired"));
				if(StatTracking.getStat("pregnancy/khorgan sired") > 0)
					output2("\n<b>* Sired, Khorgan’s Children:</b> " + StatTracking.getStat("pregnancy/khorgan sired"));
				if(StatTracking.getStat("pregnancy/mirrin sired") > 0)
					output2("\n<b>* Sired, Mirrin’s Children:</b> " + StatTracking.getStat("pregnancy/mirrin sired"));
				if(StatTracking.getStat("pregnancy/royal nyrea eggs sired") > 0)
					output2("\n<b>* Sired, Nyrean Eggs, Royal:</b> " + StatTracking.getStat("pregnancy/royal nyrea eggs sired"));
				if(StatTracking.getStat("pregnancy/quaelle sired") > 0)
					output2("\n<b>* Sired, Quaelle’s Children:</b> " + StatTracking.getStat("pregnancy/quaelle sired"));
				if(StatTracking.getStat("pregnancy/quinn sired") > 0)
					output2("\n<b>* Sired, Quinn’s Children:</b> " + StatTracking.getStat("pregnancy/quinn sired"));
				if(StatTracking.getStat("pregnancy/raskvel sired/total") > 0)
					output2("\n<b>* Sired, Raskvel Eggs:</b> " + StatTracking.getStat("pregnancy/raskvel sired/total"));
				if(StatTracking.getStat("pregnancy/raskvel sired/day care") > 0)
					output2("\n<b>* Sired, Raskvel @ Daycare:</b> " + StatTracking.getStat("pregnancy/raskvel sired/day care"));
				if(StatTracking.getStat("pregnancy/roxy sired") > 0)
					output2("\n<b>* Sired, Roxy’s Children:</b> " + StatTracking.getStat("pregnancy/roxy sired"));
				if(StatTracking.getStat("pregnancy/sam sired") > 0)
					output2("\n<b>* Sired, Sam’s Children:</b> " + StatTracking.getStat("pregnancy/sam sired"));
				if(StatTracking.getStat("pregnancy/sera sired") > 0)
					output2("\n<b>* Sired, Sera’s Children:</b> " + StatTracking.getStat("pregnancy/sera sired"));
				if(StatTracking.getStat("pregnancy/Stella children sired/total") > 0)
					output2("\n<b>* Sired, Stella’s Children:</b> " + StatTracking.getStat("pregnancy/Stella children sired/total"));
				if(StatTracking.getStat("pregnancy/tam sired") > 0)
					output2("\n<b>* Sired, Tam’s Children:</b> " + StatTracking.getStat("pregnancy/tam sired"));
				if(StatTracking.getStat("pregnancy/ula sired") > 0)
					output2("\n<b>* Sired, Ula’s Children:</b> " + StatTracking.getStat("pregnancy/ula sired"));
				if(StatTracking.getStat("pregnancy/zil call girl kids") > 0)
					output2("\n<b>* Sired, " + (flags["ZIL_CALLGIRL_NAME_KNOWN"] == undefined ? "Zil Call Girl" : "Zheniya") + " Children:</b> " + StatTracking.getStat("pregnancy/zil call girl kids"));
				if(StatTracking.getStat("pregnancy/zil sired") > 0)
					output2("\n<b>* Sired, Zil Children:</b> " + StatTracking.getStat("pregnancy/zil sired"));
			}
			if(totalProduce)
			{
				output2("\n<b><u>Produce</u></b>");
				output2("\n<b>* Total:</b> " + totalProduce);
				if(StatTracking.getStat("pregnancy/ovalasting eggs laid") > 0)
					output2("\n<b>* Births, Ovalasting Eggs, Total:</b> " + StatTracking.getStat("pregnancy/ovalasting eggs laid"));
				if(StatTracking.getStat("pregnancy/ovilium eggs laid") > 0)
					output2("\n<b>* Births, Ovilium Eggs, Total:</b> " + StatTracking.getStat("pregnancy/ovilium eggs laid"));
				if(StatTracking.getStat("pregnancy/siegwulfe eggs laid") > 0)
					output2("\n<b>* Births, [wulfe.name] Eggs, Total:</b> " + StatTracking.getStat("pregnancy/siegwulfe eggs laid"));
				if(StatTracking.getStat("pregnancy/egg trainer eggs laid") > 0)
					output2("\n<b>* Births, TamaniCorp Egg Trainer Eggs, Total:</b> " + StatTracking.getStat("pregnancy/egg trainer eggs laid"));
				if(StatTracking.getStat("pregnancy/unfertilized venus pitcher seeds") > 0)
					output2("\n<b>* Births, Venus Pitcher Seeds, Unfertilized:</b> " + StatTracking.getStat("pregnancy/unfertilized venus pitcher seeds"));
			}
		}
	}
	
	// Racial scores
	// It may be preferable for balance reasons to only allow this section to be visible if Easy Mode is on,
	// or maybe only after unlocking it by talking to some doctor/geneticist (maybe Dr. McAllister on Myrmedion?)
	// Represented as: prettifyGeneticMarker(race's current score, race's 100% score, race's maximum score)
	// Gotta know what it is before you know how much of one you are (just in case the score for a race would somehow be above 0 before even meeting a member of that race)
	if(showID == "Race" || showID == "All")
	{
		//======GENETIC MAKEUP=====//
		output2("\n\n" + blockHeader("Genetic Makeup", false));
		
		output2("\n<b><u>Genotype Grades</u></b>");
		if(CodexManager.entryUnlocked("Humans") && pc.humanScore() > 0)
			output2("\n<b>* Human:</b> " + prettifyGeneticMarker(pc.humanScore(), 4, 6));
		if(CodexManager.entryUnlocked("Ausar") && pc.ausarScore() > 0)
		{
			output2("\n<b>* Ausar:</b> " + prettifyGeneticMarker(pc.ausarScore(), 4, 5));
			if(pc.huskarScore() > 0)
				output2("\n<b>* Ausar, Huskar:</b> " + prettifyGeneticMarker(pc.huskarScore(), 3, 5));
		}
		if(CodexManager.entryUnlocked("Kaithrit") && pc.kaithritScore() > 0)
			output2("\n<b>* Kaithrit:</b> " + prettifyGeneticMarker(pc.kaithritScore(), 6, 9));
		if(CodexManager.entryUnlocked("Leithans") && pc.leithanScore() > 0)
			output2("\n<b>* Leithan:</b> " + prettifyGeneticMarker(pc.leithanScore(), 6, 9));
		if(CodexManager.entryUnlocked("Kui-Tan") && pc.nukiScore() > 0)
			output2("\n<b>* Kui-Tan:</b> " + prettifyGeneticMarker(pc.nukiScore(), 6, 7));
		if(CodexManager.entryUnlocked("Suulas") && pc.suulaScore() > 0)
			output2("\n<b>* Suula:</b> " + prettifyGeneticMarker(pc.suulaScore(), 8, 11));
		if(pc.gooScore() > 0)
			output2("\n<b>* Goo:</b> " + prettifyGeneticMarker(pc.gooScore(), 6, 9));
		if(pc.amazonScore() > 0)
			output2("\n<b>* Amazon:</b> " + prettifyGeneticMarker(pc.amazonScore(), 4, 5));
		if(pc.avianScore() > 0)
			output2("\n<b>* Avian:</b> " + prettifyGeneticMarker(pc.avianScore(), 4, 7));
		if(pc.badgerScore() > 0)
			output2("\n<b>* Badger:</b> " + prettifyGeneticMarker(pc.badgerScore(), 4, 4));
		if(pc.bovineScore() > 0)
			output2("\n<b>* Bovine:</b> " + prettifyGeneticMarker(pc.bovineScore(), 3, 6));
		if(pc.cowScore() > 0 && pc.bovineScore() > 0)
			output2("\n<b>* Bovine, Cow:</b> " + prettifyGeneticMarker(pc.cowScore(), 4, 12));
		if(pc.bunnyScore() > 0)
			output2("\n<b>* Bunny:</b> " + prettifyGeneticMarker(pc.bunnyScore(), 4, 6));
		if(pc.canineScore() > 0)
			output2("\n<b>* Canine:</b> " + prettifyGeneticMarker(pc.canineScore(), 5, 9));
		if(pc.deerScore() > 0)
			output2("\n<b>* Deer:</b> " + prettifyGeneticMarker(pc.deerScore(), 5, 8));
		if(pc.demonScore() > 0)
			output2("\n<b>* Demon:</b> " + prettifyGeneticMarker(pc.demonScore(), 5, 8));
		if(pc.dragonScore() > 0)
			output2("\n<b>* Dragon:</b> " + prettifyGeneticMarker(pc.dragonScore(), 5, 10));
		if(CodexManager.entryUnlocked("Dzaan") &&  pc.dzaanScore() > 0)
			output2("\n<b>* Dzaan:</b> " + prettifyGeneticMarker(pc.dzaanScore(), 6, 8));
		if(pc.felineScore() > 0)
			output2("\n<b>* Feline:</b> " + prettifyGeneticMarker(pc.felineScore(), 5, 7));
		if(CodexManager.entryUnlocked("Frostwyrm") && pc.frostyScore() > 0)
			output2("\n<b>* Frostwyrm:</b> "+ prettifyGeneticMarker(pc.frostyScore(), 6, 11));
		if(CodexManager.entryUnlocked("Gabilani") && pc.gabilaniScore() > 0)
			output2("\n<b>* Gabilani:</b> " + prettifyGeneticMarker(pc.gabilaniScore(), 5, 11));
		if(pc.goatScore() > 0)
			output2("\n<b>* Goat:</b> " + prettifyGeneticMarker(pc.goatScore(), 4, 7));
		if(CodexManager.entryUnlocked("Gryvain") && pc.gryvainScore() > 0)
			output2("\n<b>* Gryvain:</b> " + prettifyGeneticMarker(pc.gryvainScore(), 9, 11));
		if(pc.horseScore() > 0)
			output2("\n<b>* Horse:</b> " + prettifyGeneticMarker(pc.horseScore(), 5, 8));
		if(pc.hyenaScore() > 0)
			output2("\n<b>* Hyena:</b> " + prettifyGeneticMarker(pc.hyenaScore(), 5, 10));
		if(flags["LIRIEL_MET"] != undefined && pc.hradScore() > 0)
			output2("\n<b>* Hrad:</b> " + prettifyGeneticMarker(pc.hradScore(), 4, 8));
		if(false && pc.janeriaScore() > 0)
			output2("\n<b>* Janeria:</b> " + prettifyGeneticMarker(pc.janeriaScore(), 6, 10));
		if(CodexManager.entryUnlocked("Kerokoras") && pc.frogScore() > 0)
			output2("\n<b>* Kerokoras:</b> " + prettifyGeneticMarker(pc.frogScore(), 5, 8));
		if(CodexManager.entryUnlocked("Korgonne") && pc.korgonneScore() > 0)
			output2("\n<b>* Korgonne:</b> " + prettifyGeneticMarker(pc.korgonneScore(), 4, 5));
		if(pc.laquineScore() > 0)
			output2("\n<b>* Laquine:</b> " + prettifyGeneticMarker(pc.laquineScore(), 5, 6));
		if(pc.lupineScore() > 0)
			output2("\n<b>* Lupine:</b> " + prettifyGeneticMarker(pc.lupineScore(), 5, 5));
		if(CodexManager.entryUnlocked("Mothrine") && pc.mothrineScore() > 0)
			output2("\n<b>* Mothrine:</b> " + prettifyGeneticMarker(pc.mothrineScore(), 5, 10));
		if(pc.rodentScore() > 0)
			output2("\n<b>* Mouse:</b> " + prettifyGeneticMarker(pc.rodentScore(), 4, 7));
		if(myrellionCoordinatesUnlocked())
		{
			if(pc.myrScore() > 0) output2("\n<b>* Myr:</b> " + prettifyGeneticMarker(pc.myrScore(), 4, 6));
			if(CodexManager.entryUnlocked("Red Myr") && pc.redMyrScore() > 0)
				output2("\n<b>* Myr, Red:</b> " + prettifyGeneticMarker(pc.redMyrScore(), 8, 12));
			if(CodexManager.entryUnlocked("Gold Myr") && pc.goldMyrScore() > 0)
				output2("\n<b>* Myr, Gold:</b> " + prettifyGeneticMarker(pc.goldMyrScore(), 8, 15));
			if(flags["MCALLISTER_MYR_HYBRIDITY"] >= 3 && pc.orangeMyrScore() > 0)
				output2("\n<b>* Myr, Orange:</b> " + prettifyGeneticMarker(pc.orangeMyrScore(), 9, 16));
		}
		if(CodexManager.entryUnlocked("Naleen") && pc.naleenScore() > 0)
			output2("\n<b>* Naleen:</b> " + prettifyGeneticMarker(pc.naleenScore(), 5, 10));
		if(CodexManager.entryUnlocked("Nyrea") && pc.nyreaScore() > 0)
			output2("\n<b>* Nyrea:</b> " + prettifyGeneticMarker(pc.nyreaScore(), 5, 7));
		if(CodexManager.entryUnlocked("Ovir") && pc.ovirScore() > 0)
			output2("\n<b>* Ovir:</b> " + prettifyGeneticMarker(pc.ovirScore(), 5, 9));
		if(pc.pandaScore() > 0)
			output2("\n<b>* Panda:</b> " + prettifyGeneticMarker(pc.pandaScore(), 4, 6));
		if(pc.pigScore() > 0)
			output2("\n<b>* Pig:</b> " + prettifyGeneticMarker(pc.pigScore(), 4, 9));
		if(pc.plantScore() > 0)
			output2("\n<b>* Plant:</b> " + prettifyGeneticMarker(pc.plantScore(), 5, 9));
		if(CodexManager.entryUnlocked("Raskvel") && pc.raskvelScore() > 0)
			output2("\n<b>* Raskvel:</b> " + prettifyGeneticMarker(pc.raskvelScore(), 6, 8));
		if(pc.redPandaScore() > 0)
			output2("\n<b>* Red Panda:</b> " + prettifyGeneticMarker(pc.redPandaScore(), 4, 8));
		if(pc.lizanScore() > 0)
			output2("\n<b>* Reptile:</b> " + prettifyGeneticMarker(pc.lizanScore(), 7, 13));
		if(CodexManager.entryUnlocked("Saurmorians") && pc.saurmorianScore() > 0)
			output2("\n<b>* Saurmorian:</b> " + prettifyGeneticMarker(pc.saurmorianScore(), 6, 11));
		if(pc.sharkScore() > 0)
			output2("\n<b>* Shark:</b> " + prettifyGeneticMarker(pc.sharkScore(), 5, 12));
		if(pc.sheepScore() > 0)
			output2("\n<b>* Sheep:</b> " + prettifyGeneticMarker(pc.sheepScore(), 5, 9));
		if(CodexManager.entryUnlocked("Simii") && pc.simiiScore() > 0)
			output2("\n<b>* Simii:</b> " + prettifyGeneticMarker(pc.simiiScore(), 4, 5));
		if(pc.spiderScore() > 0)
			output2("\n<b>* Spider:</b> " + prettifyGeneticMarker(pc.spiderScore(), 4, 6));
		if(pc.tentacleScore() > 0)
			output2("\n<b>* Tentacle:</b> " + prettifyGeneticMarker(pc.tentacleScore(), 15, -99));
		if(CodexManager.entryUnlocked("Vanae") && pc.vanaeScore() > 0)
			output2("\n<b>* Vanae:</b> " + prettifyGeneticMarker(pc.vanaeScore(), 6, 10));
		if(pc.vulpineScore() > 0)
		{
			output2("\n<b>* Vulpine:</b> " + prettifyGeneticMarker(pc.vulpineScore(), 4, 9));
			if(pc.kitsuneScore() > 0 && pc.tailCount > 1)
				output2("\n<b>* Vulpine, Kitsune:</b> " + prettifyGeneticMarker(pc.kitsuneScore(), 4, 8));
		}
		if(CodexManager.entryUnlocked("Xhelarfog") && pc.xhelScore() > 0)
			output2("\n<b>* Xhelarfog:</b> " + prettifyGeneticMarker(pc.xhelScore(), 6, 9));
		if(CodexManager.entryUnlocked("Zil") && pc.zilScore() > 0)
			output2("\n<b>* Zil:</b> " + prettifyGeneticMarker(pc.zilScore(), 6, 10));
		/* pls add cyborg stuff :(
		if(cyborgScore() > 0)
			output2("\n<b>* Cyborg:</b> " + prettifyGeneticMarker(cyborgScore(), 1, 4));
		*/
	}
	
	// Medical
	if(showID == "Medical" || showID == "All")
	{
		//======SSTD STATISTICS=====//
		output2("\n\n" + blockHeader("Infection Statistics", false));
		
		// SSTDs
		output2("\n<b><u>SSTDs</u></b>");
		var bHasSSTD:Boolean = pc.hasSSTD();
		output2("\n<b>* Status:</b> " + (bHasSSTD ? "Infected" : " Not infected"));
		if(pc.isSSTDImmune()) output2(", Immune to SSTDs");
		if(bHasSSTD)
		{
			output2("\n<b>* Infected by, Total:</b> " + pc.sstdTotal());
			var sstdList:Array = sstdList();
			var SSTDs:Array = [];
			for(i = 0; i < pc.statusEffects.length; i++)
			{
				var sstdName:String = pc.statusEffects[i].storageName;
				var sstdDetected:Boolean = (sstdName.indexOf("Undetected") == -1);
				if(InCollection(sstdName, sstdList))
				{
					output2("\n<b><u>" + (!sstdDetected ? "<i>Unknown SSTD</i>" : sstdName) + "</u></b>");
					output2("\n<b>* Duration:</b> " + prettifyMinutes(sstdMaxTime(sstdName) - pc.statusEffects[i].minutesLeft));
				}
			}
		}
		
		//======PARASITE STATISTICS=====//
		//Parasites!
		output2("\n\n" + blockHeader("Parasite Statistics", false));
		var bHasParasites:Boolean = false;
		
		// Butt Bugs
		if(pc.hasStatusEffect("Butt Bug (Female)") || pc.hasKeyItem("Butt Bug (Male)"))
		{
			output2("\n<b><u>Butt Bugs</u></b>");
			if(pc.hasStatusEffect("Butt Bug (Female)"))
			{
				output2("\n<b>* Attached:</b> Female Butt Bug");
				switch(pc.statusEffectv1("Butt Bug (Female)")) {
					case 0: output2(", Beige"); break;
					case 1: output2(", Green"); break;
					case 2: output2(", Orange-Striped"); break;
				}
				if(pc.statusEffectv2("Butt Bug (Female)") > 0) output2(", Inseminated");
				if(pc.statusEffectv4("Butt Bug (Female)") > 0) output2("\n<b>* Attached Female Butt Bug, Offspring Produced:</b> " + pc.statusEffectv4("Butt Bug (Female)"));
				if(pc.hasStatusEffect("Butt Bug Egg Cycle")) output2("\n<b>* Attached Female Butt Bug, Egg Cycle:</b> " + (pc.statusEffectv1("Butt Bug Egg Cycle") == 0 ? "Inactive" : "Active"));
			}
			if(pc.hasKeyItem("Butt Bug (Male)"))
			{
				output2("\n<b>* Captured:</b> Male Butt Bug");
				if(pc.keyItemv1("Butt Bug (Male)") > 0) output2("\n<b>* Captured Male Butt Bug, Masturbation, Anal, Total:</b> " + pc.keyItemv1("Butt Bug (Male)"));
				if(pc.keyItemv2("Butt Bug (Male)") > 0) output2("\n<b>* Captured Male Butt Bug, Masturbation, Vaginal, Total:</b> " + pc.keyItemv2("Butt Bug (Male)"));
			}
			bHasParasites = true;
		}
		// Cockvines
		if(pc.hasTailCock() && pc.hasParasiteTail())
		{
			output2("\n<b><u>Cockvine</u></b>");
			if(pc.hasTailCock() && pc.hasParasiteTail()) output2("\n<b>* Attached, Type:</b> " + GLOBAL.TYPE_NAMES[pc.tailGenitalArg]);
			bHasParasites = true;
		}
		// Cunt Snakes
		if(pc.hasCuntSnake() || flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined || flags["TIMES_FED_CUNT_SNAKE"] != undefined || (flags["CUNT_TAIL_PREGNANT_TIMER"] != undefined && flags["CUNT_TAIL_PREGNANT_TIMER"] > 0) || flags["CUNT_SNAKES_HELPED_TO_INFEST"] != undefined || flags["CUNT_SNAKE_EGGS_FAXED_HOME"] != undefined)
		{
			output2("\n<b><u>Cunt Snake</u></b>");
			if(pc.tailType == GLOBAL.TYPE_CUNTSNAKE && pc.tailCount > 0) output2("\n<b>* Attached, Type:</b> " + GLOBAL.TYPE_NAMES[pc.tailGenitalArg]);
			
			if(pc.hasCuntSnake()) output2("\n<b>* Feeding, Current:</b> " + flags["DAYS_SINCE_FED_CUNT_TAIL"] + " day" + (flags["DAYS_SINCE_FED_CUNT_TAIL"] == 1 ? "" : "s") + " since last fed");
			if(flags["TIMES_FED_CUNT_SNAKE"] != undefined) output2("\n<b>* Feeding, Total:</b> " + flags["TIMES_FED_CUNT_SNAKE"] + " time" + (flags["TIMES_FED_CUNT_SNAKE"] == 1 ? "" : "s"));
			
			if(flags["CUNT_TAIL_PREGNANT_TIMER"] != undefined) output2("\n<b>* Pregnancy, Gestation Time:</b> " + prettifyMinutes(flags["CUNT_TAIL_PREGNANT_TIMER"]) + " until birth");
			
			if(flags["CUNT_SNAKE_EGGS_FAXED_HOME"] != undefined && flags["CUNT_SNAKE_EGGS_FAXED_HOME"] > 0) output2("\n<b>* Reproduction, Eggs in Hatchery:</b> " + flags["CUNT_SNAKE_EGGS_FAXED_HOME"]);
			if(flags["CUNT_SNAKES_HELPED_TO_INFEST"] != undefined || flags["CUNT_SNAKE_EGGS_FAXED_HOME"] != undefined)
			{
				output2("\n<b>* Reproduction, Eggs Laid Total:</b> ");
				if(flags["CUNT_SNAKE_EGGS_FAXED_HOME"] == undefined) output2(flags["CUNT_SNAKES_HELPED_TO_INFEST"]);
				else if(flags["CUNT_SNAKES_HELPED_TO_INFEST"] == undefined) output2(flags["CUNT_SNAKE_EGGS_FAXED_HOME"]);
				else output2(flags["CUNT_SNAKES_HELPED_TO_INFEST"] + flags["CUNT_SNAKE_EGGS_FAXED_HOME"]);
			}
			bHasParasites = true;
		}
		// Mimbranes
		if(attachedMimbranes() > 0 || flags["MIMBRANE_COCK_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_PUSSY_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_ASS_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_BALLS_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_BOOBS_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_HAND_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_FOOT_REPRODUCTION_NOTICED"] != undefined || flags["MIMBRANE_FACE_REPRODUCTION_NOTICED"] != undefined)
		{
			output2("\n<b><u>Mimbranes</u></b>");
			if(attachedMimbranes() > 0) output2("\n<b>* Attached, Total:</b> " + attachedMimbranes());
			
			var mimSumReproductionCounter:int = 0;
			var mimSumRepNoteCounter:int = 0;
			
			if(pc.hasStatusEffect("Mimbrane Cock")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Cock");
			if(pc.hasStatusEffect("Mimbrane Pussy")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Pussy");
			if(pc.hasStatusEffect("Mimbrane Ass")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Ass");
			if(pc.hasStatusEffect("Mimbrane Balls")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Balls");
			if(pc.hasStatusEffect("Mimbrane Boobs")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Boobs");
			if(pc.hasStatusEffect("Mimbrane Hand Left")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Hand Left");
			if(pc.hasStatusEffect("Mimbrane Hand Right")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Hand Right");
			if(pc.hasStatusEffect("Mimbrane Foot Left")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Foot Left");
			if(pc.hasStatusEffect("Mimbrane Foot Right")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Foot Right");
			if(pc.hasStatusEffect("Mimbrane Face")) mimSumReproductionCounter += pc.statusEffectv4("Mimbrane Face");
			
			if(flags["MIMBRANE_COCK_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_COCK_REPRODUCTION_NOTICED"];
			if(flags["MIMBRANE_PUSSY_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_PUSSY_REPRODUCTION_NOTICED"];
			if(flags["MIMBRANE_ASS_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_ASS_REPRODUCTION_NOTICED"];
			if(flags["MIMBRANE_BALLS_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_BALLS_REPRODUCTION_NOTICED"];
			if(flags["MIMBRANE_BOOBS_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_BOOBS_REPRODUCTION_NOTICED"];
			if(flags["MIMBRANE_HAND_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_HAND_REPRODUCTION_NOTICED"];
			if(flags["MIMBRANE_FOOT_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_FOOT_REPRODUCTION_NOTICED"];
			if(flags["MIMBRANE_FACE_REPRODUCTION_NOTICED"] != undefined) mimSumRepNoteCounter += flags["MIMBRANE_FACE_REPRODUCTION_NOTICED"];
			
			if(mimSumReproductionCounter > 0) output2("\n<b>* Reproduction, Current Total:</b> " + mimSumReproductionCounter + " times");
			if(mimSumRepNoteCounter > 0) output2("\n<b>* Reproduction, Total Noticed:</b> " + mimSumRepNoteCounter + " times");
			
			bHasParasites = true;
		}
		// You're clean!
		if(!bHasParasites)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>There is no history of any attached parasites.</i>");
		}
	}
	
	output2("\n\n");
}

public function displayCodexOptions():void
{
	clearOutput2();
	
	output2(header("<u>Codex Options</u>", false));
	
	output2("\nAdjust the settings to your codex display.");
	output2("\n");
	
	output2("\n<b><u>Measurement Units</u></b>");
	output2("\n<i>Note that Imperial units are actually in ancient U.S. customary units.</i>");
	output2("\n<b>* Length:</b> ");
	switch(flags["UNITS_LENGTH"]) {
		case -2: output2("Imperial (inches only)"); break;
		case -1: output2("Imperial"); break;
		case 0: output2("Imperial and Metric"); break;
		case 1: output2("Metric"); break;
		default: output2("<i>Default</i>"); break;
	}
	output2("\n<b>* Volume, Cubic Length:</b> ");
	switch(flags["UNITS_VOLUME"]) {
		case -1: output2("Imperial"); break;
		case 0: output2("Imperial and Metric"); break;
		case 1: output2("Metric"); break;
		default: output2("<i>Default</i>"); break;
	}
	output2("\n<b>* Volume, Liquid:</b> ");
	switch(flags["UNITS_LIQUID"]) {
		case -1: output2("Imperial"); break;
		case 0: output2("Imperial and Metric"); break;
		case 1: output2("Metric"); break;
		default: output2("<i>Default</i>"); break;
	}
	output2("\n<b>* Weight:</b> ");
	switch(flags["UNITS_WEIGHT"]) {
		case -1: output2("Imperial"); break;
		case 0: output2("Imperial and Metric"); break;
		case 1: output2("Metric"); break;
		default: output2("<i>Default</i>"); break;
	}
	output2("\n\n");
	
	clearGhostMenu();
	addGhostButton(0, "Length", toggleCodexOption, "length", "Toggle Length Units", "Change units for length.");
	addGhostButton(1, "Volume", toggleCodexOption, "volume", "Toggle Volume Units", "Change units for volume (cubic length).");
	addGhostButton(2, "Liquid", toggleCodexOption, "liquid", "Toggle Liquid Units", "Change units for volume (liquid).");
	addGhostButton(3, "Weight", toggleCodexOption, "weight", "Toggle Weight Units", "Change units for weight.");
	if(!canSaveAtCurrentLocation) addDisabledGhostButton(4, "Console", "Command Console Input", "You cannot use this at the moment.");
	else addGhostButton(4, "Console", commandCodexInput, undefined, "Command Console Input", "Test console commands using the input function.");
	addGhostButton(14, "Back", showCodex);
}
public function toggleCodexOption(option:String = ""):void
{
	switch(option)
	{
		case "length":
			switch(flags["UNITS_LENGTH"]) {
				case undefined: flags["UNITS_LENGTH"] = -2; break;
				case -2: flags["UNITS_LENGTH"] = -1; break;
				case -1: flags["UNITS_LENGTH"] = 0; break;
				case 0: flags["UNITS_LENGTH"] = 1; break;
				default: flags["UNITS_LENGTH"] = undefined; break;
			}
			break;
		case "volume":
			switch(flags["UNITS_VOLUME"]) {
				case undefined: flags["UNITS_VOLUME"] = -1; break;
				case -1: flags["UNITS_VOLUME"] = 0; break;
				case 0: flags["UNITS_VOLUME"] = 1; break;
				default: flags["UNITS_VOLUME"] = undefined; break;
			}
			break;
		case "liquid":
			switch(flags["UNITS_LIQUID"]) {
				case undefined: flags["UNITS_LIQUID"] = -1; break;
				case -1: flags["UNITS_LIQUID"] = 0; break;
				case 0: flags["UNITS_LIQUID"] = 1; break;
				default: flags["UNITS_LIQUID"] = undefined; break;
			}
			break;
		case "weight":
			switch(flags["UNITS_WEIGHT"]) {
				case undefined: flags["UNITS_WEIGHT"] = -1; break;
				case -1: flags["UNITS_WEIGHT"] = 0; break;
				case 0: flags["UNITS_WEIGHT"] = 1; break;
				default: flags["UNITS_WEIGHT"] = undefined; break;
			}
			break;
	}
	displayCodexOptions();
}
public function commandCodexInput():void
{
	clearOutput2();
	output2("This is the exprimental console command interface.");
	
	output2("\n\nPlease enter a command code to execute:\n");
	
	displayInput();
	output2("\n\n\n");
	
	clearGhostMenu();
	addGhostButton(0, "Execute", commandCodexInputConfirm);
	addGhostButton(4, "Exit", commandCodexInputBack, true);
	addGhostButton(14, "Back", commandCodexInputBack);
}
public function commandCodexInputBack(toMainMenu:Boolean = false):void
{
	removeInput();
	
	if(toMainMenu) exitCodex();
	else displayCodexOptions();
}
public function commandCodexInputConfirm():void
{
	var sText:String = userInterface.textInput.text;
	
	if(sText == "")
	{
		commandCodexInput();
		output2("<b>You must input something.</b>");
		return;
	}
	if(InCollection(sText, ["return","back","exit","quit","qqq"]))
	{
		commandCodexInputBack(sText == "qqq" ? true : false);
		return;
	}
	if(!hasCheatInput(sText))
	{
		commandCodexInput();
		output2("Command not recognized. <b>Please try again.</b>");
		return;
	}
	
	removeInput();
	
	clearOutput2();
	output2("<b>Command ‘" + sText + "’ recognized!</b>");
	output2("\n\nYou can choose to exit the console or try another command code:\n");
	
	displayInput();
	output2("\n\n\n");
	
	clearGhostMenu();
	addGhostButton(0, "Execute", commandCodexInputConfirm, undefined, "Next Input", "Add another input into the command console.");
	addGhostButton(4, "Exit", commandCodexInputBack, true);
	addGhostButton(14, "Back", commandCodexInputBack);
}

// Genetic Marker Weighting
public function prettifyGeneticMarker(score:Number = 0, limit:Number = 0, max:Number = -1):String
{
	var retStr:String = "";
	
	if(score != 0 && limit != 0)
	{
		retStr += (Math.round((score / limit) * 10000) / 100) + " %, " + score + "/" + limit;
		if(max > 0 && score >= max) retStr += ", " + max + " Maximum";
	}
	
	return retStr;
}

// Prettify Volume!
// amount: pounds
// printMeters: -1 is pounds, 0 is both pounds and grams, 1 is grams only
public function prettifyWeight(amount:Number, printMeters:int = -1):String
{
	if(flags["UNITS_WEIGHT"] != undefined) printMeters = flags["UNITS_WEIGHT"];
	
	var retStr:String = "";
	if(printMeters < 1)
	{
		retStr += formatFloat(amount, 3) + " lb";
		if(amount != 1) retStr += "s";
	}
	// Prettified meters
	if(printMeters > -1)
	{
		if(printMeters == 0) retStr += " (";
		// Convert pounds to grams!
		// 1 lb = 453.592 g or .0453592 kg
		var meter:Number = (amount *= 453.592);
		if(meter < 1000) retStr += formatFloat(meter, 3) + " g";
		else retStr += formatFloat((meter / 1000), 3) + " kg";
		if(printMeters == 0) retStr += ")";
	}
	return retStr;
}

// Prettify Volume!
// amount: cubic inches
// printMeters: -1 is inches, 0 is both inches and meters, 1 is meters only
public function prettifyVolume(amount:Number, printMeters:int = -1):String
{
	if(flags["UNITS_VOLUME"] != undefined) printMeters = flags["UNITS_VOLUME"];
	
	var retStr:String = "";
	if(printMeters < 1)
	{
		retStr += formatFloat(amount, 3) + " cubic inch";
		if(amount != 1) retStr += "es";
	}
	// Prettified meters
	if(printMeters > -1)
	{
		if(printMeters == 0) retStr += " (";
		// Convert inches to centimeters!
		// 1 in = 2.54 cm, (1 in)^3 = (2.54 cm)^3, 1 in^3 = 16.387064 cm^3
		// 1 cm^3 = 1 mL
		var meter:Number = (amount * 16.387064);
		retStr += formatFloat(meter, 3) + " mLs";
		if(printMeters == 0) retStr += ")";
	}
	return retStr;
}
// Display mLs or convert if options dictate
// Used specifically for liquid volume
// printMeters: -1 is inches, 0 is both inches and meters, 1 is meters only
public function mLs(amount:Number, printMeters:int = 1):String
{
	if(flags["UNITS_LIQUID"] != undefined) printMeters = flags["UNITS_LIQUID"];
	
	var retStr:String = "";
	if(printMeters < 1)
	{
		var imperial:Number = (amount * 0.033814);
		if(imperial < 128) retStr += formatFloat(imperial, 3) + " fl oz";
		else retStr += formatFloat((imperial / 128), 3) + " gal";
	}
	if(printMeters > -1)
	{
		if(printMeters == 0) retStr += " (";
		retStr += formatFloat(amount, 3) + " mLs";
		if(printMeters == 0) retStr += ")";
	}
	return retStr;
}

// Prettify Lengths!
// amount: inch length
// printMeters: -2 is inches only, -1 is feet and inches, 0 is both inches and meters, 1 is meters only
public function prettifyLength(amount:Number, printMeters:int = -1):String
{
	if(flags["UNITS_LENGTH"] != undefined) printMeters = flags["UNITS_LENGTH"];
	
	var retStr:String = "";
	if(printMeters < 1)
	{
		// Prettified over an inch
		if(amount >= 1 && printMeters != -2)
		{
			// Feet
			var feet:int = Math.floor(amount / 12);
			// Inches
			var inch:int = Math.floor(amount % 12);
			var num:String = "";
			var den:String = "";
			if(amount % 12 > 0)
			{
				// Fractional stuff, proper maffs format! (to the nearest 1/16th inch)
				var fraction:Number = formatFloat((amount - Math.floor(amount)), 4);
				if(fraction >= 0.0125)
				{
					if(fraction <= 0.0625) { num = "1"; den = "16"; }
					else if(fraction <= 0.125) { num = "1"; den = "8"; }
					else if(fraction <= 0.1875) { num = "3"; den = "16"; }
					else if(fraction <= 0.25) { num = "1"; den = "4"; }
					else if(fraction <= 0.3125) { num = "5"; den = "16"; }
					else if(fraction <= 0.375) { num = "3"; den = "8"; }
					else if(fraction <= 0.4375) { num = "7"; den = "16"; }
					else if(fraction <= 0.5) { num = "1"; den = "2"; }
					else if(fraction <= 0.5625) { num = "9"; den = "16"; }
					else if(fraction <= 0.625) { num = "5"; den = "8"; }
					else if(fraction <= 0.6875) { num = "11"; den = "16"; }
					else if(fraction <= 0.75) { num = "3"; den = "4"; }
					else if(fraction <= 0.8125) { num = "13"; den = "16"; }
					else if(fraction <= 0.875) { num = "7"; den = "8"; }
					else if(fraction <= 0.9375) { num = "15"; den = "16"; }
					else {
						inch++;
						if(inch == 12) { feet++; inch = 0; }
						num = ""; den = "";
					}
				}
			}
			if(feet > 0) retStr += feet + "\'";
			if(inch > 0) retStr += (retStr != "" ? " " : "") + inch;
			// Build fractions
			if(den != "") retStr += (retStr != "" ? " " : "") + "<sup>" + num + "</sup>/<sub>" + den + "</sub>";
			if(inch > 0 || den != "") retStr += "\"";
		}
		// Less than an inch get decimal format
		else retStr += formatFloat(amount, 3) + " in";
	}
	// Prettified meters
	if(printMeters > -1)
	{
		if(printMeters == 0) retStr += " (";
		var meter:Number = (amount *= 2.54);
		if(meter < 100) retStr += formatFloat(meter, 3) + " cm";
		else retStr += formatFloat((meter / 100), 3) + " m";
		if(printMeters == 0) retStr += ")";
	}
	return retStr;
}

// Prettify Minutes!
public function prettifyMinutes(nMinutes:Number, toDate:Boolean = false):String
{
	if(nMinutes < 0) nMinutes = Math.abs(nMinutes);
	
	var retStr:String = "";
	var nHours:Number = 0;
	var nDays:Number = 0;
	// Days
	if(nMinutes > 1440)
	{
		nDays = Math.floor(nMinutes/1440);
		nMinutes -= 1440 * nDays;
	}
	// Hourz
	if(nMinutes > 60)
	{
		nHours = Math.floor(nMinutes/60);
		nMinutes -= 60 * nHours;
	}
	// Minutes
	nMinutes = Math.floor(nMinutes);
	
	// Normal!
	if(!toDate)
	{
		if(nDays > 0)
		{
			retStr += nDays + " day";
			if(nDays > 1) retStr += "s";
		}
		if(nHours > 0 || nDays > 0)
		{
			if(nDays > 0) retStr += " ";
			retStr += nHours + " hour"
			if(nHours != 1) retStr += "s";
		}
		if(retStr != "") retStr += " ";
		retStr += nMinutes + " minute";
		if(nMinutes != 1) retStr += "s";
	}
	// Date Formatting!
	else
	{
		retStr += "Day " + nDays + ", ";
		if(nHours < 10) retStr += String(0) + nHours;
		else retStr += String(nHours);
		retStr += ":";
		if(nMinutes < 10) retStr += String(0) + nMinutes;
		else retStr += nMinutes;
	}
	
	return retStr;
}
public function minutesToDate(nMinutes:Number):String
{
	return prettifyMinutes(nMinutes, true);
}
public function minutesToHours(nMinutes:Number):Number
{
	return Math.floor(nMinutes / 60);
}
public function minutesToDays(nMinutes:Number):Number
{
	return Math.floor(nMinutes / 60 / 24);
}
public function minutesToWeeks(nMinutes:Number):Number
{
	return Math.floor(nMinutes / 60 / 24 / 7);
}
public function minutesToYears(nMinutes:Number):Number
{
	return Math.floor(nMinutes / 60 / 24 / 365);
}
public function minutesToMonths(nMinutes:Number):Number
{
	var nMos:int = 0;
	var monthMin:Array = getMonthArray();
	var m:int = getCurrentMonth();
	
	for(var i:int = 0; i < 12; i++)
	{
		if(m > 12) m = 1;
		
		if(nMinutes >= monthMin[m])
		{
			nMinutes -= monthMin[m];
			nMos++;
		}
		
		m++;
	}
	
	return nMos;
}

public function getDayArray(asValue:String = ""):Array
{
	var monthList:Array = [0, 1440, 1440, 1440, 1440, 1440, 1440, 1440];
	var i:int = 0;
	
	if(asValue != "")
	{
		switch(asValue)
		{
			case "hours":
				monthList = [0, 24, 24, 24, 24, 24, 24, 24];
				break;
			case "name":
				monthList = ["null", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
				break;
			case "short":
			case "digit":
				monthList = ["null", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
				break;
		}
	}
	
	return monthList;
}
public function getMonthArray(asValue:String = ""):Array
{
	var monthList:Array = [0, 44640, 40320, 44640, 43200, 44640, 43200, 44640, 44640, 43200, 44640, 43200, 44640];
	var i:int = 0;
	
	if(asValue != "")
	{
		switch(asValue)
		{
			case "days":
				monthList = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
				break;
			case "hours":
				monthList = [0, 744, 672, 744, 720, 744, 720, 744, 744, 720, 744, 720, 744];
				break;
			case "name":
				monthList = ["null", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
				break;
			case "short":
				monthList = ["null", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
				break;
			case "digit":
				monthList = ["--", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
				break;
		}
	}
	
	return monthList;
}

public function getCurrentYear():int
{
	return getCurrentDate("year");
}
public function getCurrentMonth():int
{
	return getCurrentDate("month");
}
public function getCurrentDate(dateType:String = ""):int
{
	// Maybe started adventure in August 29?
	var y:int = 3027;
	var m:int = 8;
	var d:int = 29;
	var currYear:int = (y + minutesToYears(GetGameTimestamp()));
	var monthDay:Array = getMonthArray("days");
	var currDay:int = ((d - 1) + minutesToDays(GetGameTimestamp()));
	
	while(currDay > monthDay[m])
	{
		currDay -= monthDay[m];
		m++;
		if(m > 12)
		{
			m = 1;
			y++;
		}
	}
	if(currDay > monthDay[m])
	{
		currDay -= monthDay[m];
		m++;
		if(m > 12)
		{
			m = 1;
			y++;
		}
	}
	
	if(dateType == "year") return y;
	if(dateType == "month") return m;
	return currDay;
}
public function getCurrentDayWeek():int
{
	// Maybe started adventure on a Wednesday?
	var dw:int = 3;
	var currDay:int = minutesToDays(GetGameTimestamp());
	
	while(currDay > 7)
	{
		currDay -= 7;
	}
	while(currDay > 0)
	{
		currDay--;
		dw++;
		if(dw > 7) dw = 1;
	}
	
	return dw;
}
public function getCurrentDateArray():Array
{
	// [ Year, Month, Day, Day of Week ]
	return [ getCurrentYear(), getCurrentMonth(), getCurrentDate(), getCurrentDayWeek() ];
}

public function prettifyDate(format:String = ""):String
{
	var retStr:String = "";
	
	var y:int = getCurrentYear();
	var m:int = getCurrentMonth();
	var d:int = getCurrentDate();
	var dw:int = getCurrentDayWeek();
	
	var dayWkName:Array = getDayArray(format);
	var monthName:Array = getMonthArray(format);
	
	switch(format)
	{
		case "name": retStr += ( dayWkName[dw] + ", " + monthName[m] + " " + d + ", " + y + " A.C."); break;
		case "short": retStr += ( dayWkName[dw] + ", " + (d < 10 ? ("0" + d) : d) + " - " + monthName[m] + " - " + y ); break;
		case "digit": retStr += ( (d < 10 ? ("0" + d) : d) + " - " + monthName[m] + " - " + y ); break;
		default: retStr += ( m + " / " + d + " / " + y ); break;
	}
	
	return retStr;
}

public function minutesToDurationList(nMinutes:Number, approximate:Boolean = false):Array
{
	var timeList:Array = [];
	var nMin:int = nMinutes;
	var nHrs:int = 0;
	var nDys:int = 0;
	var nWks:int = 0;
	var nMos:int = 0;
	var nYrs:int = 0;
	
	if(nMin >= 525600)
	{
		nYrs = Math.floor(nMin / 525600);
		nMin -= (nYrs * 525600);
		if(approximate && (nMin <= 0 || nYrs >= 10))
		{
			if(nYrs == 1) timeList.push(" a year");
			else if(nYrs <= 2) timeList.push(" a couple years");
			else if(nYrs <= 3) timeList.push(" a few years");
			else if(nYrs <= 4) timeList.push(" some years");
			else if(nYrs <= 9) timeList.push(" several years");
			else timeList.push(" many years");
		}
		else timeList.push(" " + num2Text(nYrs) + " year" + (nYrs == 1 ? "" : "s"));
	}
	if(nMin >= 43200)
	{
		var m:int = getCurrentMonth();
		var monthMin:Array = getMonthArray();
		var i:int = 0;
		
		for(i = 0; i < 12; i++)
		{
			if(m > 12) m = 1;
			
			if(nMin >= monthMin[m])
			{
				nMin -= monthMin[m];
				nMos++;
			}
			
			m++;
		}
		if(approximate && (nMin <= 0 || nMos >= 10))
		{
			if(nMos == 1) timeList.push(" a month");
			else if(nMos <= 2) timeList.push(" a couple months");
			else if(nMos <= 3) timeList.push(" a few months");
			else if(nMos <= 4) timeList.push(" some months");
			else if(nMos <= 9) timeList.push(" several months");
			else timeList.push(" many months");
		}
		else timeList.push(" " + num2Text(nMos) + " month" + (nMos == 1 ? "" : "s"));
	}
	if(nMin >= 10080)
	{
		nWks = Math.floor(nMin / 10080);
		nMin -= (nWks * 10080);
		if(approximate && (nMin <= 0 || nWks >= 3))
		{
			if(nWks == 1) timeList.push(" a week");
			else if(nWks <= 2) timeList.push(" a couple weeks");
			else timeList.push(" a few weeks");
		}
		else timeList.push(" " + num2Text(nWks) + " week" + (nWks == 1 ? "" : "s"));
	}
	if(nMin >= 1440)
	{
		nDys = Math.floor(nMin / 1440);
		nMin -= (nDys * 1440);
		if(approximate && (nMin <= 0 || nDys >= 4))
		{
			if(nDys == 1) timeList.push(" a day");
			else if(nDys <= 2) timeList.push(" a couple days");
			else if(nDys <= 3) timeList.push(" a few days");
			else if(nDys <= 4) timeList.push(" some days");
			else timeList.push(" several days");
		}
		else timeList.push(" " + num2Text(nDys) + " day" + (nDys == 1 ? "" : "s"));
	}
	if(nMin >= 60)
	{
		nHrs = Math.floor(nMin / 60);
		nMin -= (nHrs * 60);
		if(approximate && (nMin <= 0 || nHrs >= 10))
		{
			if(nHrs == 1) timeList.push(" an hour");
			else if(nHrs <= 2) timeList.push(" a couple hours");
			else if(nHrs <= 3) timeList.push(" a few hours");
			else if(nHrs <= 4) timeList.push(" some hours");
			else if(nHrs <= 9) timeList.push(" several hours");
			else timeList.push(" many hours");
		}
		else timeList.push(" " + num2Text(nHrs) + " hour" + (nHrs == 1 ? "" : "s"));
	}
	if(nMin > 0)
	{
		if(approximate)
		{
			if(nMin == 1) timeList.push(" a minute");
			else if(nMin <= 2) timeList.push(" a couple minutes");
			else if(nMin <= 3) timeList.push(" a few minutes");
			else if(nMin <= 4) timeList.push(" some minutes");
			else if(nMin <= 9) timeList.push(" several minutes");
			else timeList.push(" many minutes");
		}
		else if(nMin == 1) timeList.push(" one minute");
		else timeList.push(" " + num2Text(nMin) + " minutes");
	}
	
	return timeList;
}

// Captain's log button menu - now modular!
public function questLogMenu(currentFunc:Function):Boolean
{
	var showID:String = flags["TOGGLE_MENU_LOG"];
	
	// Starter Locations
	if(flags["RIVALCONFIGURED"] != undefined)
	{
		// Tavros
		if(showID == "Tavros") { output2(header("<u>Tavros Station</u>", false)); addDisabledGhostButton(0, "Tavros"); }
		else addGhostButton(0, "Tavros", currentFunc, "Tavros");
		// Mhen'ga
		if(showID == "Mhen'ga") { output2(header("<u>Mhen’ga</u>", false)); addDisabledGhostButton(1, "Mhen’ga"); }
		else addGhostButton(1, "Mhen’ga", currentFunc, "Mhen'ga");
	}
	// Tarkus
	if(tarkusCoordinatesUnlocked())
	{
		if(showID == "Tarkus") { output2(header("<u>Tarkus</u>", false)); addDisabledGhostButton(2, "Tarkus"); }
		else addGhostButton(2, "Tarkus", currentFunc, "Tarkus");
	}
	// Myrellion
	if(myrellionCoordinatesUnlocked())
	{
		if(showID == "Myrellion") { output2(header("<u>Myrellion</u>", false)); addDisabledGhostButton(3, "Myrellion"); }
		else addGhostButton(3, "Myrellion", currentFunc, "Myrellion");
	}
	// Zheng Shi
	if(zhengCoordinatesUnlocked())
	{
		if(showID == "Zheng Shi") { output2(header("<u>Zhèng Shi Station</u>", false)); addDisabledGhostButton(4, "ZhengShi"); }
		else addGhostButton(4, "ZhengShi", currentFunc, "Zheng Shi");
	}
	// New Texas
	if(newTexasCoordinatesUnlocked())
	{
		if(showID == "New Texas") { output2(header("<u>New Texas</u>", false)); addDisabledGhostButton(5, "New Texas"); }
		else addGhostButton(5, "New Texas", currentFunc, "New Texas");
	}
	// Poe A
	if(poeACoordinatesUnlocked())
	{
		if(showID == "Poe A") { output2(header("<u>Poe A</u>", false)); addDisabledGhostButton(6, "Poe A"); }
		else addGhostButton(6, "Poe A", currentFunc, "Poe A");
	}
	// Uveto
	if(uvetoUnlocked())
	{
		if(showID == "Uveto") { output2(header("<u>Uveto VII</u>", false)); addDisabledGhostButton(7, "Uveto"); }
		else addGhostButton(7, "Uveto", currentFunc, "Uveto");
	}
	// Canadia Station
	if(canadiaUnlocked())
	{
		if(showID == "Canadia") { output2(header("<u>Canadia Station</u>", false)); addDisabledGhostButton(8, "Canadia"); }
		else addGhostButton(8, "Canadia", currentFunc, "Canadia");
	}
	// Gastigoth
	if(gastigothCoordinatesUnlocked())
	{
		if(showID == "Gastigoth") { output2(header("<u>Gastigoth Station</u>", false)); addDisabledGhostButton(9, "Gastigoth"); }
		else addGhostButton(9, "Gastigoth", currentFunc, "Gastigoth");
	}
	// Breedwell
	if(breedwellCoordinatesUnlocked())
	{
		if(showID == "Breedwell") { output2(header("<u>Breedwell Centre</u>", false)); addDisabledGhostButton(10, "Breedwell"); }
		else addGhostButton(10, "Breedwell", currentFunc, "Breedwell");
	}
	// Other Info
	if(showID == "Other") addDisabledGhostButton(12, "Other");
	else addGhostButton(12, "Other", currentFunc, "Other", "Other Data", "Show the information not restricted to a location.");
	// Everything
	if(showID == "All") addDisabledGhostButton(13, "All");
	else addGhostButton(13, "All", currentFunc, "All", "All Data", "Show the cumulative log.");
	
	return true;
}

// Displays the Captain's quest log.
public function displayQuestLog(showID:String = "All"):void
{
	clearOutput2();
	clearGhostMenu();
	addGhostButton(14, "Back", showCodex);
	
	// Generate buttons and headers (if necessary)
	flags["TOGGLE_MENU_LOG"] = showID;
	questLogMenu(displayQuestLog);
	
	if(showID == "All" || showID == "Other") output2(header("<u>Captain’s Log:</u>", false));
	
	// Locational Info
	if(showID != "Other" || showID == "All")
	{
		// Main Questline:
		output2("\n\n" + blockHeader("Main Mission", false));
		var mainCount:int = 0;
		// Tavros
		if(flags["RIVALCONFIGURED"] != undefined && (showID == "Tavros" || showID == "All"))
		{
			output2("\n<b><u>Tavros Station</u></b>");
			output2("\n<b>* Status:</b> Acquired Codex, Acquired Casstech Z14, Met [rival.name]");
			output2("\n<b>* Celise:</b>");
			if(flags["RECRUITED_CELISE"] != undefined) output2(" Recruited");
			else output2(" Not taken");
			mainCount++;
		}
		// Mhen'ga
		if(flags["RIVALCONFIGURED"] != undefined && (showID == "Mhen'ga" || showID == "All"))
		{
			output2("\n<b><u>Mhen’ga</u></b>");
			output2("\n<b>* Status:</b>");
			if(flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] != undefined) output2(" Coordinates received, Did not engage [rival.name]");
			else if(flags["WHUPPED_DANES_ASS_ON_MHENGA"] != undefined) output2(" Coordinates received, Won against Dane");
			else if(flags["LOST_TO_DANE_ON_MHENGA"] != undefined) output2(" Coordinates received, Lost against Dane");
			else
			{
				output2(" <i>In progress...</i>");
				output2("\n<b>* Probe Location:</b> <i>It seems the probe fell deep into the jungles.</i>");
			}
			if(flags["MHENGA_PROBE_CASH_GOT"] != undefined) output2(", Reclaimed probe");
			// Scout
			if(flags["MET_FLAHNE"] != undefined)
			{
				output2("\n<b>* Scout Transport:</b> Esbeth");
				if(flags["SALVAGED VANAE CAMP"] >= 2) output2(", Xenogen Camp");
			}
			mainCount++;
		}
		// Tarkus
		if(tarkusCoordinatesUnlocked() && (showID == "Tarkus" || showID == "All"))
		{
			output2("\n<b><u>Tarkus</u></b>");
			output2("\n<b>* Status:</b>");
			if(myrellionCoordinatesUnlocked())
			{
				output2(" Coordinates received");
				if(flags["TARKUS_PROBE_CASH_GOT"] == 1) output2(", Reclaimed probe");
				if(flags["TARKUS_PROBE_CASH_GOT"] == -1) output2(", Sold probe to Shekka");
				if(flags["GAVE_SHEKKA_PROBE"] != undefined) output2(", Gave probe to Shekka");
			}
			else
			{
				output2(" <i>In progress...</i>");
				output2("\n<b>* Probe Location:</b>");
				if(flags["GAVE_SHEKKA_PROBE"] != undefined) output2(" <i>Probe located in Shekka’s shop.</i>");
				else output2(" <i>No indication of where the probe fell.</i>");
				if(flags["MET_UGC_TROOPER_AT_CHASMFALL"] == undefined)
				{
					output2("\n<b>* Scanner Feed:</b> <i>There is a lot of activity around the planetary tether.</i>");
					if(MailManager.isEntryViewed("annoweirdshit")) output2(" <i>Anno confirms this.</i>");
				}
			}
			// Scout
			if(flags["BEEN_ON_TARKUS"] != undefined)
			{
				output2("\n<b>* Scout Transport:</b> Novahome");
				if(flags["TARKUS_DESTROYED"] == undefined && flags["TARKUS_TAXI_STOP_UNLOCKED"] != undefined) output2(", The Lift");
			}
			// The Stellar Tether
			if(flags["MET_UGC_TROOPER_AT_CHASMFALL"] != undefined && flags["FOUGHT_TAM"] != undefined)
			{
				output2("\n<b><u>The Stellar Tether</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["STELLAR_TETHER_CLOSED"] != undefined && flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] <= 0)
				{
					if(!pc.hasKeyItem("Kaska's Detonator") && !pc.hasKeyItem("Khorgan's Detonator")) output2(" Tarkus spared, <i>Tarasque</i> pirates escaped, Completed?");
					else if(flags["TARKUS_DESTROYED"] != undefined) output2(" Tarkus destroyed by pirates of the <i>Tarasque</i>, Completed");
					else output2(" Tarkus saved from pirates of the <i>Tarasque</i>, Completed");
				}
				else output2(" <i>In progress...</i>");
				if(flags["MITZI_RESCUED"] != undefined)
				{
					output2("\n<b>* " + ((flags["MITZI_DISABLED"] != undefined || flags["MITZI_GOODBAD"] != undefined) ? "Mitzi" : "Gabilani Technician") + ":</b> Rescued her");
					if(flags["MITZI_DISABLED"] == undefined && flags["MITZI_GOODBAD"] == undefined) output2(" " + prettifyMinutes(GetGameTimestamp() - flags["MITZI_RESCUED"]) + " ago");
				}
				// Tam
				if(flags["TAM_DISABLE_METHOD"] != undefined || flags["TAKEN_TAMWOLF"] != undefined)
				{
					output2("\n<b>* Tam:</b> Defeated her");
					if(flags["TAM_DISABLE_METHOD"] == 1) output2(", Knocked her out");
					if(flags["TAM_DISABLE_METHOD"] == 2) output2(", Fucked her");
					if(flags["TAKEN_TAMWOLF"] != undefined) output2(", Took Tam-wolf");
				}
				// Rocket pods
				if(flags["ROCKET_PODS_ENCOUNTERED"] != undefined)
				{
					output2("\n<b>* Defenses:</b>");
					if(flags["ROCKET_PODS_HACKED"] != undefined) output2(" Hacked rocket pods");
					else if(flags["ROCKET_PODS_SNEAKED"] != undefined) output2(" Sneaked passed rocket pods");
					else output2(" Destroyed rocket pods");
				}
				// Kaska
				if(pc.hasKeyItem("Kaska's Detonator") || flags["KASKA_FUCKED"] != undefined)
				{
					output2("\n<b>* Kaska:</b> Defeated her");
					if(flags["KASKA_FUCKED"] != undefined) output2(", Fucked her");
				}
				// Khorgan
				if(pc.hasKeyItem("Khorgan's Detonator") || flags["DICKFUCKED_CAPN_KHORGAN"] != undefined || flags["LESBOED_KHORGAN"] != undefined)
				{
					output2("\n<b>* Capt. Khorgan:</b> Defeated her");
					if(flags["DICKFUCKED_CAPN_KHORGAN"] != undefined) output2(", Dick-fucked her");
					if(flags["LESBOED_KHORGAN"] != undefined) output2(", Lesbian-fucked her");
				}
				// Resources
				if(flags["PLATINUM_TAKEN"] != undefined) output2("\n<b>* Resources:</b> Platinum 190 taken");
				// Bomb
				if(flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] > 0) output2("\n<b>* Time-Bomb Countdown:</b> " + prettifyMinutes(flags["TARKUS_BOMB_TIMER"]));
			}
			mainCount++;
		}
		// Myrellion
		if(myrellionCoordinatesUnlocked() && (showID == "Myrellion" || showID == "All"))
		{
			output2("\n<b><u>Myrellion</u></b>");
			output2("\n<b>* Status:</b>");
			if(zhengCoordinatesUnlocked())
			{
				output2(" Coordinates received");
				if(flags["MYRELLION_PROBE_CASH_GOT"] != undefined) output2(", Reclaimed probe");
			}
			else output2(" <i>In progress...</i>");
			if(!reclaimedProbeMyrellion() && flags["KQ2_MYRELLION_STATE"] != 1 && flags["TAIVRA_NEW_THRONE"] == undefined)
			{
				output2("\n<b>* Probe Location:</b> <i>Probe" + (metTaivra() ? " located in Taivra’s" : " appears to be in some kind of royal") + " throne room.</i>");
			}
			// Scout
			if(flags["MYRELLION_EMBASSY_VISITED"] != undefined && flags["KQ2_MYRELLION_STATE"] == undefined)
			{
				output2("\n<b>* Scout Transport:</b> D.M.Z.");
				if(flags["NO_ANTS_LAND_TAXI_UNLOCKED"] != undefined) output2(", No Myr’s Land");
				if(flags["DEEP_CAVES_TAXI_UNLOCKED"] != undefined) output2(", Deep Caves");
			}
			// Taivra's Palace (Quest)
			if(flags["FOUGHT_PRAETORIANS"] != undefined || flags["PLAT190 USED AS NYREA BRIBE"] != undefined || metTaivra())
			{
				output2("\n<b><u>Royal Nyrean Palace</u></b>");
				output2("\n<b>* Status:</b>");
				if(nyreaDungeonFinished())
				{
					if(flags["BEAT_TAIVRA_TIMESTAMP"] != undefined)
					{
						if(flags["KILLED_TAIVRA"] != undefined) output2(" Executed Taivra,");
						else output2(" Spared Taivra,");
					}
					else output2(" Married Taivra,");
					if(flags["KING_NYREA"] != undefined) output2(" Succeeded the throne as " + pc.mf("king","queen") + ",");
					output2(" Completed");
				}
				else output2(" <i>In progress...</i>");
				if(flags["TAIVRA_DEAL_UNLOCKED"] != undefined || flags["OFFERED_TAIVRA_AN_ALLIANCE"] != undefined)
				{
					// Taivra
					output2("\n<b>* Queen Taivra:</b>");
					if(flags["TAIVRA_DEAL_UNLOCKED"] != undefined)
					{
						output2(" Made a deal with her");
						if(flags["TAIVRA_DEAL_ATTEMPTS"] == 1) output2(" once");
						if(flags["TAIVRA_DEAL_ATTEMPTS"] == 2) output2(" twice");
					}
					if(flags["OFFERED_TAIVRA_AN_ALLIANCE"] != undefined)
					{
						if(flags["TAIVRA_DEAL_UNLOCKED"] != undefined) output2(",");
						output2(" Offered alliance");
					}
				}
				if(metTaivra())
				{
					// Rival
					output2("\n<b>* [rival.name]:</b> Seen");
					if(flags["TAIVRA_RIVAL_TALK"] != undefined) output2(", Spoke of [rival.himHer]");
					if(flags["RIVAL_GOT_MYR_COORDS_FIRST"] != undefined) output2(", [rival.HeShe] got coordinates first");
					if(flags["COUSIN_EGGSLUT"] != undefined || flags["COUSIN_BEDWARMER"] != undefined) output2(", Enslaved");
					if(flags["COUSIN_EXECUTED"] != undefined) output2(", Executed");
					// Dane
					output2("\n<b>* Dane:</b> Seen");
					if(flags["FREED_DANE_FROM_TAIVRA"] != undefined) output2(", Freed him from Taivra");
					if(flags["QUEENSGUARD_STAB_TIME"] != undefined || flags["KILLED_TAIVRA"] != undefined) output2(", Escaped with [rival.name]");
				}
			}
			mainCount++;
		}
		// Zheng Shi
		if(zhengCoordinatesUnlocked() && (showID == "Zheng Shi" || showID == "All"))
		{
			output2("\n<b><u>Zhèng Shi Station</u></b>");
			output2("\n<b>* Status:</b>");
			if(flags["ZHENG_SHI_PROBED"] != undefined)
			{
				output2(" Coordinates received");
				if(9999 == 0) output2(", Reclaimed probe");
			}
			else output2(" <i>In progress...</i>");
			if(flags["ZHENG_SHI_PASSWORDED"] != undefined)
			{
				output2("\n<b>* Entry Password:</b>");
				if(flags["KIRO_HELPED_ZHENG"] != undefined) output2(" Kiro assisted,");
				if(flags["PAIGE_HELPED_ZHENG"] != undefined) output2(" Paige assisted,");
				if(flags["ZHENG_SHI_PASSWORDED"] >= 1) output2(" Access granted");
				else output2(" <i>Unknown</i>, Access denied");
			}
			if(flags["ZHENG_SHI_JUMPERSPACESUIT"] == undefined) output2("\n<b>* <i>Sidewinder</i>, Loot, Jumper’s Suit:</b> Taken");
			if(flags["ZHENG_SHI_GALOMAX"] == undefined) output2("\n<b>* <i>Sidewinder</i>, Loot, Galomax:</b> Taken");
			if(flags["FERUZE_ZHENG_OUTCOME"] != undefined)
			{
				// Rival
				output2("\n<b>* [rival.name]:</b> Seen");
				// Feruze
				output2("\n<b>* Feruze:</b> Seen");
				switch(flags["FERUZE_ZHENG_OUTCOME"])
				{
					case -2: output2(", Lost to her face-sitting on you in combat"); break;
					case -1: output2(", Lost to her in combat"); break;
					case 1: output2(", Defeated her"); break;
				}
				if(flags["FERUZE_SEXED"] != undefined) output2("\n<b>* Feruze, Times Sexed:</b> " + flags["FERUZE_SEXED"]);
				if(flags["FERUZE_CAME_INSIDE"] != undefined) output2("\n<b>* Feruze, Times You Came Inside Her:</b> " + flags["FERUZE_CAME_INSIDE"]);
				if(flags["FERUZE_BIG_DICK_TITFUCKED"] != undefined) output2("\n<b>* Feruze, Times Titfucked:</b> " + flags["FERUZE_BIG_DICK_TITFUCKED"]);
			}
			
			mainCount++;
		}
		// Nothing recorded
		if(mainCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No data from your main mission has been logged");
			if(showID != "All") output2(" at this location");
			output2(".</i>");
		}
		
		// Side quests:
		var sideCount:Number = 0;
		output2("\n\n" + blockHeader("Side Missions", false));
		
		if(showID == "Tavros" || showID == "All")
		{
			// Sera: The Bitchening
			if(flags["SERA_ACQUIRED_DATE"] != undefined)
			{
				output2("\n<b><u>The Bitchening</u></b>");
				output2("\n<b>* Status:</b> Sera acquired");
				if(flags["SERA_BUSINESS_SETUP"] != undefined) output2(", Sera used loan");
				if(flags["SERA_MERCHANT"] != undefined) output2(", Sera is merchant");
				if(flags["SERA_REPAID_LOAN"] != undefined) output2(", Sera repaid loan, Completed");
				output2("\n<b>* Sera, Lust:</b> " + chars["SERA"].lust());
				output2("\n<b>* Sera, Obedience:</b> " + seraObedience() + " % (" + flags["SERA_OBEDIENCE_MAX"] + " % Max)");
				if(flags["SERA_BUSINESS_SETUP"] != undefined && (days - flags["SERA_BUSINESS_SETUP"] > 0)) output2("\n<b>* Sera, Days Since Opened Business:</b> " + (days - flags["SERA_BUSINESS_SETUP"]));
				sideCount++;
			}
			// Sera: Disco 3000
			if(flags["SERA_PARTY_INVITE"] != undefined)
			{
				output2("\n<b><u>Disco 3000</u></b>");
				output2("\n<b>* Status:</b> Invited");
				if(flags["SERA_PARTY_INVITE"] == 1) output2(", Attending");
				if(flags["SERA_PARTY_DATE"] != undefined) output2(", Attended");
				if(flags["SERA_PARTY_INVITE"] >= 3) output2(", Completed");
				if(flags["SERA_PARTY_INVITE"] >= 4) output2(", On payroll");
				if(pc.hasKeyItem("Sera’s Collar")) output2(", Gifted with Sera’s Collar");
				if(flags["SERA_PARTY_STAGE1"] != undefined) output2("\n<b>* Selected Costume:</b> " + StringUtil.toDisplayCase(flags["SERA_PARTY_STAGE1"]));
				if(flags["SERA_PARTY_ATTIRE"] != undefined) output2("\n<b>* Sera, Attire:</b> " + StringUtil.toDisplayCase(flags["SERA_PARTY_ATTIRE"]));
				output2("\n<b>* Sera, Influence Score:</b> " + seraInfluence());
				if(flags["SERA_SALARY_PAID"] != undefined && flags["SERA_SALARY_DATE"] != undefined) output2("\n<b>* Time Since Last Salary Payment:</b> " + prettifyMinutes(GetGameTimestamp() - flags["SERA_SALARY_DATE"]));
				sideCount++;
			}
			// Riya Quest
			if(flags["RIYA_QUEST_RESULT"] != undefined)
			{
				output2("\n<b><u>RiyaQuest</u></b>");
				output2("\n<b>* Status:</b>");
				switch(flags["RIYA_QUEST_RESULT"])
				{
					case -1: output2(" Did not follow Riya, Completed"); break;
					case 1: output2(" Followed Riya, Helped Riya with raid, Completed"); break;
					default: output2(" <i>Unknown</i>"); break;
				}
				sideCount++;
			}
			//Host Shukuchi
			if(flags["SHUKUCHI_TAVROS_ENCOUNTER"] != undefined)
			{
				output2("\n<b><u>" + (flags["SHUKUCHI_TAVROS_ENCOUNTER"] < 2 ? "Tavros Mafia?" : "Host Shukuchi") + "</u></b>");
				output2("\n<b>* Status:</b>");
				switch(flags["SHUKUCHI_FOURTH_ENCOUNTER"])
				{
					case undefined: output2(" Tracking"); break;
					case 1: output2(" Paid the Host"); break;
					case 2: output2(" Accepted corporal punishment"); break;
					case 3:
						output2(" Took Akane’s offer");
						if(flags["SHUKUCHI_FOURTH_ENCOUNTER_TIMESTAMP"] != undefined && (flags["SHUKUCHI_FOURTH_ENCOUNTER_TIMESTAMP"] + (24*60)) > GetGameTimestamp()) output2(" (" + prettifyMinutes((flags["SHUKUCHI_FOURTH_ENCOUNTER_TIMESTAMP"] + (24*60)) - GetGameTimestamp()) + " until you can return)");
						break;
				}
				output2("\n<b>* Tavros:</b> " + (flags["SHUKUCHI_TAVROS_ENCOUNTER"] < 3 ? "Chased" : "Didn’t chase") + " culprits");
				if(flags["SHUKUCHI_TAVROS_ENCOUNTER"] >= 2) output2(", Talked to the victim");
				if(flags["SHUKUCHI_MHENGA_ENCOUNTER"] != undefined) output2("\n<b>* Mhenga:</b> " + (flags["SHUKUCHI_MHENGA_ENCOUNTER"] ? "Defeated agent on Mhenga" : "Lost to agent on Mhenga"));
				if(flags["SHUKUCHI_UVETO7_ENCOUNTER"] != undefined) output2("\n<b>* Uveto:</b> " + (flags["SHUKUCHI_UVETO7_ENCOUNTER"] ? "Defeated agents on Uveto" : "Lost to agents on Uveto"));
				sideCount++;
			}
			//AkaneQuest
			if(MailManager.isEntryViewed("akanequest_email"))
			{
				output2("\n<b><u>AkaneQuest</u></b>");
				output2("\n<b>* Status:</b> Read Email");
				if(flags["AKANEQUEST_STAGE"] == 0) output2(", Raid Planned");
				else if(flags["AKANEQUEST_STAGE"] > 0)
				{
					output2(", Raid Succesful");
					if(flags["AKANEQUEST_STAGE"] == 1) output2(", Rewarded with gun");
					else output2(", Rewarded with sword");
				}
				sideCount++;
			}
		}
		if(showID == "New Texas" || showID == "All")
		{
			// Breaking the male milker
			if(flags["MILK_BARN_COCKMILKER_BROKEN"] != undefined || flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] != undefined)
			{
				output2("\n<b><u>Prostate Milker</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] != undefined && flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] <= 0) output2(" Paid for, Fixed!");
				else if(flags["MILK_BARN_COCKMILKER_REPAIR_DAYS"] != undefined) output2(" Paid for, Repairing...");
				else output2(" Broken");
				sideCount++;
			}
			// The Treatment
			if(CodexManager.entryViewed("The Treatment"))
			{
				output2("\n<b><u>The Treatment</u></b>");
				output2("\n<b>* Status:</b> ");
				if(pc.hasStatusEffect("The Treatment")) output2("Undergoing Treatment");
				else if(pc.hasStatusEffect("Temporary Treatment")) output2("Undergoing temporary Treatment");
				else if(pc.hasStatusEffect("Treated")) output2(" Treated");
				else output2(" Untreated");
				if(pc.hasStatusEffect("The Treatment"))
				{
					var treatment:StorageClass = pc.getStatusEffect("The Treatment");
					
					output2("\n<b>* Current Effects:</b>");
					switch(treatment.value1)
					{
						case 0: output2(" Cow"); break;
						case 1: output2(" Stud"); break;
						case 2: output2(" Cum-Cow"); break;
						case 3: output2(" Cow Stud"); break;
						case 4: output2(" Cow-mazon"); break;
						case 5: output2(" Double Stud"); break;
						case 6: output2(" Undersized"); break;
						case 7: output2(" Faux-Cow"); break;
						default: output2(" <i>Unknown</i>"); break;
					}
					// Timer stuff
					var treatedMinutes:Number = 10080 - treatment.minutesLeft;
					output2("\n<b>* Duration:</b> " + prettifyMinutes(treatedMinutes));
				}
				if(pc.hasPerk("Dumb4Cum")) output2("\n<b>* Dumb4Cum, Status:</b> " + pc.perkv1("Dumb4Cum") + " hour" + (pc.perkv1("Dumb4Cum") == 1 ? "" : "s") + " since last ingested cum" + (pc.perkv1("Dumb4Cum") <= 24 ? "" : ", Craving cum"));
				sideCount++;
			}
			// Varmint Wranglin'
			if(flags["MET_CAMERON"] != undefined)
			{
				output2("\n<b><u>Varmint Wranglin’</u></b>");
				output2("\n<b>* Varmints Captured, Total:</b> ");
				if(flags["VARMINTS_CAUGHT"] != undefined) output2(flags["VARMINTS_CAUGHT"]);
				else output2("<i>In progress...</i>");
				// Silicone stuff!
				var siliconeTotal:int = 0;
				if(flags["TAKEN_SILICONE_538"] != undefined) siliconeTotal++;
				if(flags["TAKEN_SILICONE_552"] != undefined) siliconeTotal++;
				if(flags["TAKEN_SILICONE_556"] != undefined) siliconeTotal++;
				if(flags["TAKEN_SILICONE_564"] != undefined) siliconeTotal++;
				if(siliconeTotal > 0) output2("\n<b>* Silicone Collected:</b> " + siliconeTotal);
				if(siliconeTotal >= 4) output2(", Completed");
				sideCount++;
			}
			// Semen Bottling Facility
			if(flags["NT_BUILD_BOTTLE_PLANT"] > 0)
			{
				output2("\n<b><u>Semen Milking Factory</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["NT_BUILD_BOTTLE_PLANT"] >= 3) output2(" Fully built, Expanded, Employed as manager, Completed");
				else if(flags["NT_BUILD_BOTTLE_PLANT"] >= 2) output2(" Half-way built");
				else output2(" Partially built");
				sideCount++;
			}
		}

		if(showID == "Mhen'ga" || showID == "All")
		{
			// Azra's Expeditions
			if(flags["AZRA_MHENGAED"] != undefined || flags["AZRA_EXP_FAILED"] == "mhen'ga")
			{
				output2("\n<b><u>Azra’s Expedition</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["AZRA_EXP_FAILED"] == "mhen'ga") output2(" Defeated by naleen brothers");
				else if(flags["AZRA_MHENGAED"] != 0) output2(" Defeated naleen brothers");
				else output2(" Accepted");
				if(flags["AVOID_9TAIL"] == 1) output2(", Distracted nine-tailed zil");
				if(flags["AVOID_9TAIL"] == 2) output2(", Avoided nine-tailed zil");
				if(flags["FOUGHT_9TAIL"] != undefined) output2(", Defeated nine-tailed zil");
				if(flags["FED_9TAIL"] != undefined) output2(", Fed nine-tailed zil");
				if(flags["AZRA_MHENGAED"] == -1) output2(", Completed, Resisted Azra");
				else if(flags["AZRA_MHENGAED"] == 1) output2(", Completed, Welcomed Azra");
				else if(flags["AZRA_EXP_FAILED"] == "mhen'ga") output2(", Failed");
				else output2(", <i>In progress...</i>");
				if(flags["FUCK_LILLIES_USED"] != undefined) output2("\n<b>* Fuck Lillies, Times Sexed:</b> " + flags["FUCK_LILLIES_USED"]);
				sideCount++;
			}
			// The Forge Machina
			if(flags["TALKED_WITH_CARL_ABOUT_HIS_ROBOT"] != undefined)
			{
				output2("\n<b><u>The Forge Machina</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["ROBOT_QUEST_COMPLETE"] >= 2) output2(" Robot retrieved, Completed");
				else if(flags["ROBOT_QUEST_COMPLETE"] == 1) output2(" Robot found, Return to Carl");
				else output2(" <i>In progress...</i>");
				sideCount++;
			}
			// Penny's Recruitment
			if(flags["PENNY_CREW_ASKED"] != undefined || flags["PENNY_CUMSLUT_RECRUITED"] != undefined || flags["PENNY_BIMBO_RECRUITED"] != undefined)
			{
				output2("\n<b><u>Penny’s Recruitment</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["PENNY_CREW_ASKED"] != undefined)
				{
					switch(flags["PENNY_CREW_ASKED"])
					{
						case -1: output2(" Asked Penny, She refused, <i>Perhaps you should get to know her better?</i>"); break;
						case 1: output2(" Asked Penny, She accepted"); break;
						case 2: output2(" Asked Penny, Accepted, <i>Find Oxonium...</i>"); break;
						case 3: output2(" Asked Penny, Accepted, Found and excavated Oxonium"); break;
						case 3.5: output2(" Asked Penny, Accepted, Found and excavated Oxonium, Offered recruitment"); break;
						case 4: output2(" Asked Penny, Accepted, Found and excavated Oxonium, Penny recruited, Completed"); break;
						default: output2(" <i>In progress...</i>"); break;
					}
				}
				else
				{
					output2(" Asked Penny, Accepted, Penny recruited, Completed");
				}
				if(flags["ONZIA_GOT_PQUEST_LOOT"] != undefined) output2("\n<b>* Onzia:</b> Helped her, Split rewards with her");
				if(flags["PQUEST_ZILTRAP_RESULTS"] != undefined || flags["PQUEST_PENNY_PODDED"] != undefined)
				{
					output2("\n<b>* Ziltraps:</b> Seen them");
					if(flags["PQUEST_PENNY_PODDED"] != undefined) output2(", They trapped Penny");
					if(flags["PQUEST_ZILTRAP_RESULTS"] == 1) output2(", Defeated them by health");
					if(flags["PQUEST_ZILTRAP_RESULTS"] == 2) output2(", Defeated them by lust");
				}
				sideCount++;
			}
			// Penny's Zil Problem
			if(flags["MET_PENNY"] != undefined)
			{
				output2("\n<b><u>Penny’s Zil Problem</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["ZIL_PROBLEM_DEALT_WITH"] != undefined) output2(" Completed");
				else output2(" <i>In progress...</i>");
				sideCount++;
			}
			// Plantation Quest
			if(flags["PQ_RESOLUTION"] != undefined || flags["PLANTATION_QUEST"] != undefined || MailManager.isEntryViewed("plantation_quest_start"))
			{
				output2("\n<b><u>Plantation Quest</u></b>");
				output2("\n<b>* Status:</b>");
				if(plantationQuestComplete())
				{
					output2(" Found Lah");
					if(flags["PQ_FOUGHT_TRIBE"] != undefined) output2(", Fought and defeated zil tribe");
					switch(flags["PQ_RESOLUTION"])
					{
						case 1:
						case 2: output2(", Declared peace with the zil village"); break;
						case -1: output2(", Overthrew the zil village"); break;
					}
					if(flags["PQ_P_BURNED"] != undefined) output2(", Burned down plantation");
					switch(flags["PQ_SECURED_LAH"])
					{
						case 1: output2(", Taken Lah, <i>Return to Darnock...</i>"); break;
						case 2: output2(", Turned Lah in to Darnock, Rewarded, Completed"); break;
						case -1: output2(", Let Lah go, <i>Return to Darnock...</i>"); break;
						case -2: output2(", Let Lah go, Told Darnock, Rewarded, Completed"); break;
					}
				}
				else
				{
					if(flags["PLANTATION_QUEST"] == 0)
					{
						output2(" Talked to Darnock,");
						if(flags["PQUEST_ABLE_TALK_DISABLE"] == 1) output2(" Didn’t talk to Able,");
						else if(flags["PQUEST_ABLE_TALK_DISABLE"] == 2) output2(" Talked to Able,");
						output2(" Find Lah,");
					}
					else output2(" Talk to Darnock,");
					output2(" <i>In progress...</i>");
				}
				if(flags["PQUEST_LAH_CHAT"] != undefined) output2("\n<b>* Clues, About R.K. Lah:</b> <i>Not a killer, but mentally unstable. Arsonist. Influenced a zil tribe...</i>");
				if(flags["PQUEST_WHERE_CHAT"] != undefined) output2("\n<b>* Clues, Lah’s Location:</b> <i>Highlands to the north, on a large waterfall...</i>");
				if(flags["PQUEST_ABLE_CUSTOMS_TALK"] != undefined) output2("\n<b>* Clues, Zil Customs:</b> <i>Challenge Lah to a fair fight and give something zil value to earn chieftain’s trust...</i>");
				if(flags["PQUEST_ABLE_VALUE_TALK"] != undefined) output2("\n<b>* Clues, What Zil Value:</b> <i>Sex, winning belongings fairly, and something Lah is offering them...</i>");
				if(flags["PQ_DIPLO_FAILS"] != undefined || flags["PQ_DIPLO_SUCCESS"] != undefined)
				{
					output2("\n<b>* Diplomacy:</b>");
					if(flags["PQ_DIPLO_SUCCESS"] != undefined) output2(" Succeeded " + (flags["PQ_DIPLO_SUCCESS"] == 1 ? "once" : (flags["PQ_DIPLO_SUCCESS"] + " times")));
					if(flags["PQ_DIPLO_FAILS"] != undefined && flags["PQ_DIPLO_SUCCESS"] != undefined) output2(", ");
					if(flags["PQ_DIPLO_FAILS"] != undefined) output2(" Failed " + (flags["PQ_DIPLO_FAILS"] == 1 ? "once" : (flags["PQ_DIPLO_FAILS"] + " times")));
				}
				if(flags["PQ_TOOK_AMBER"] != undefined) output2("\n<b>* Amber Idol:</b> Taken");
				if(flags["PQUEST_WATERFALLED"] != undefined)
				{
					output2("\n<b>* Kane:</b> Met him");
					if(flags["LOST_TO_KANE"] != undefined)
					{
						output2(", Lost to him");
						if(flags["LOST_TO_KANE"] != 1) output2(flags["LOST_TO_KANE"] + " times");
						else output2(" once");
					}
					if(flags["KANE_DEFEATED"] != undefined) output2(", Defeated him");
				}
				if(flags["PQ_SECURED_LAH"] || flags["PQ_BEAT_LAH"] != undefined)
				{
					output2("\n<b>* R.K. Lah:</b> Met him");
					if(flags["PQ_BEAT_LAH"] == 1) output2(", Defeated him");
					if(flags["PQ_BEAT_LAH"] == -1) output2(", Defeated by him");
				}
				if(flags["PQ_RESOLUTION"] != undefined)
				{
					output2("\n<b>* Quinn:</b> Met her");
					if(flags["PQ_LET_QUINN_GO"] != undefined) output2(", Let her go");
				}
				if(flags["PQ_NALEENED"] != undefined) output2("\n<b>* Naleen Mating Ball, Times Encountered:</b> " + flags["PQ_NALEENED"]);
				
				sideCount++;
			}
			// The Pollen Dance
			if(flags["QUINNFEST_COMPLETE"] != undefined || flags["QUINNFEST_TALKED"] != undefined)
			{
				output2("\n<b><u>The Pollen Dance</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["QUINNFEST_TALK_WHY_GROUP"] != undefined) output2(" Asked about gangbang,");
				switch(flags["QUINNFEST_TALKED"])
				{
					case -1: output2(" Accepted, Decided to spectate"); break;
					case 1: output2(" Accepted, Decided to participate"); break;
				}
				if(flags["QUINNFEST_COMPLETE"] != undefined)
				{
					switch(flags["QUINNFEST_COMPLETE"])
					{
						case -2: output2(", Challenge for top drone, Lost against warriors in combat"); break;
						case -1: output2(", Watched Droning Ball"); break;
						case 0: output2(", Fucked along Quinn in Droning Ball"); break;
						case 1: output2(", Fucked along drones in Droning Ball"); break;
						case 2: output2(", Challenge for top drone, Defeated warriors in combat"); break;
					}
					output2(", Completed");
				}
				else
				{
					if(!quinnFestivalActiveHours()) output2(", <i>Visit the village between 16:45 to 19:00</i>");
					else output2(", <i>In progress...</i>");
				}
				if(flags["QUINN_PREG_TIMER"] != undefined)
				{
					output2("\n<b>* Quinn, Pregnancy:</b> Success, " + flags["QUINN_PREG_TIMER"] + " Days Active");
					if(flags["QUINN_SIRED_KID"] != undefined) output2(", <i>You are the father!</i>");
					if(flags["QUINN_PREG_TIMER"] > 180) output2(", <i>Hurry and give her a visit!</i>");
				}
				else if(flags["QUINN_KID_AGE"] != undefined)
				{
					output2("\n<b>* Quinn, Pregnancy:</b> She has " + indefiniteArticle(num2Text(quinnBabyAge())) + "-day old " + (flags["QUINN_KID_SEX"] == 1 ? "son" : "daughter"));
					if(flags["QUINN_KID_NAME"] != undefined) output2(", " + quinnBabyName());
				}
				if(flags["QUINN_TALK_HERBS"] != undefined)
				{
					output2("\n<b>* Quinn, Talk, Herbs:</b>");
					switch(flags["QUINN_TALK_HERBS"])
					{
						case -1: output2(" You accepted her decision to use the herbs."); break;
						case 0: output2(" You don’t have any strong feelings about it."); break;
						case 1: output2(" You don’t like the idea of her using the herbs."); break;
					}
				}
				if(flags["QUINN_TALK_PREG"] != undefined)
				{
					output2("\n<b>* Quinn, Talk, Struggles:</b>");
					switch(flags["QUINN_TALK_PREG"])
					{
						case -1: output2(" You chatised her for showing weakness while in power."); break;
						case 0: output2(" You suggested using medical equipment to help, but she refused."); break;
						case 1: output2(" You comforted her with some much needed emotional support."); break;
					}
				}
				
				sideCount++;
			}
			// Pump-King
			if(flags["PUMPKING_COMPLETION"] != undefined || MailManager.isEntryViewed("pumpking_alert"))
			{
				output2("\n<b><u>The Pump-King</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["PUMPKING_COMPLETION"] == undefined) output2(" <i>Return to Penny...</i>");
				else
				{
					switch(flags["PUMPKING_COMPLETION"])
					{
						case -1: output2(" Refused to look for Penny, Failed"); break;
						case 1: output2(" Accepted to look for Penny, <i>Find the Pump-king...</i>"); break;
						case 2: output2(" Accepted, Seen ‘Pump-king’, <i>Find the hideout to save Penny...</i>"); break;
						case 3: output2(" Accepted, Found and defeated the ‘Pump-king’, Penny returned, Completed"); break;
					}
				}
				if(flags["PUMPKING_COMPLETION"] != undefined) output2("\n<b>* Lana:</b> Met her");
				if(flags["PUMPKINGS_JOHR_DEFEATED"] != undefined) output2("\n<b>* Johr:</b> Defeated him in combat");
				if(flags["PUMPKING_COMPLETION"] >= 2)
				{
					output2("\n<b>* ‘" + (flags["PUMPKING_COMPLETION"] < 3 ? "Pump-king" : "Amelia") + "’:</b> Met her");
					if(flags["PUMPKING_FUCKED"] != undefined) output2(", Sexed her");
				}
				sideCount++;
			}
			// Pyrite Satellite Recovery
			if(flags["SATELLITE_QUEST"] != undefined)
			{
				output2("\n<b><u>Pyrite Satellite Recovery</u></b>");
				output2("\n<b>* Status:</b>");
				switch(flags["SATELLITE_QUEST"])
				{
					case -2: output2(" Accepted, Lost hard drive, Failed"); break;
					case -1: output2(" Refused to help Pyrite Rep"); break;
					case 1:
						output2(" Accepted");
						if(!pcHasDrive()) output2(", <i>Find hard drive...</i>");
						else output2(", Obtained hard drive, <i>Return to Pyrite Rep...</i>");
						break;
					case 2: output2(" Accepted, Obtained and returned hard drive, Completed"); break;
					default: output2(" <i>In progress...</i>"); break;
				}
				if(flags["SATELLITE_GRYVAIN_DEFEAT"] != undefined)
				{
					output2("\n<b>* Gryvain Agent:</b>");
					switch(flags["SATELLITE_GRYVAIN_DEFEAT"])
					{
						case -1: output2(" Lost against her in combat"); break;
						case 0: output2(" Did not engage her in combat"); break;
						case 1: output2(" Defeated her in combat"); break;
					}
				}
				sideCount++;
			}
			// Zil Capture
			if(flags["ACCEPTED_JULIANS_ZIL_CAPTURE_MISSION"] != undefined)
			{
				output2("\n<b><u>Zil Capture</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["FIRST_CAPTURED_ZIL_REPORTED_ON"] != undefined && flags["SECOND_CAPTURED_ZIL_REPORTED_ON"] != undefined) output2(" Completed");
				else if(flags["JULIANS_QUEST_DISABLED"] != undefined) output2(" Disabled, <i>No longer required</i>");
				else if
				(	(flags["FIRST_CAPTURED_ZIL_REPORTED_ON"] == undefined && (flags["CAPTURED_A_FEMALE_ZIL_FOR_DR_HASWELL"] != undefined || flags["CAPTURED_A_MALE_ZIL_FOR_DR_HASWELL"] != undefined))
				||	(flags["SECOND_CAPTURED_ZIL_REPORTED_ON"] == undefined && (flags["CAPTURED_A_FEMALE_ZIL_FOR_DR_HASWELL"] != undefined && flags["CAPTURED_A_MALE_ZIL_FOR_DR_HASWELL"] != undefined))
				)	output2(" <i>Return to Dr. Haswell!</i>");
				else output2(" <i>In progress...</i>");
				output2("\n<b>* Female Zil:</b>");
				if(flags["CAPTURED_A_FEMALE_ZIL_FOR_DR_HASWELL"] != undefined) output2(" Captured");
				else if(flags["JULIANS_QUEST_DISABLED"] != undefined) output2(" Not captured");
				else output2(" <i>In progress...</i>");
				output2("\n<b>* Male Zil:</b>");
				if(flags["CAPTURED_A_MALE_ZIL_FOR_DR_HASWELL"] != undefined) output2(" Captured");
				else if(flags["JULIANS_QUEST_DISABLED"] != undefined) output2(" Not captured");
				else output2(" <i>In progress...</i>");
				sideCount++;
			}
		}
		
		if(showID == "Tarkus" || showID == "All")
		{
			// Azra's Expeditions
			if(flags["AZRA_TARKUSED"] != undefined || flags["AZRA_MHENGAED"] >= 1 || flags["AZRA_EXP_FAILED"] == "tarkus")
			{
				output2("\n<b><u>Azra’s Expedition</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["AZRA_TARKUSED"] != undefined) output2(" Slutshrooms, Motherhusks, and Spunkshrooms harvested");
				else output2(" Accepted");
				if(flags["AZRA_TARKUSED"] != undefined) output2(", Completed");
				else if(flags["AZRA_EXP_FAILED"] == "tarkus") output2(", Failed");
				else output2(", <i>In progress...</i>");
				if(flags["DOUBLE_GOO_SLUT_RESULT"] != undefined)
				{
					output2("\n<b>* Double Gray Goo:</b> Met her");
					switch(flags["DOUBLE_GOO_SLUT_RESULT"])
					{
						case -1: output2(", Defeated by her in combat"); break;
						case 1: output2(", Defeated her in combat"); break;
						case 2: output2(", Negotiated with her"); break;
						case 3: output2(", Persuaded and sexed her"); break;
						case 4: output2(", Fed her"); break;
					}
				}
				if(flags["RASKDOOR_BROKE"] != undefined || flags["RASKDOOR_HACKED"] != undefined || flags["AZRA_TARKUS_SKIP"] != undefined)
				{
					output2("\n<b>* Bunker:</b>");
					if(flags["RASKDOOR_BROKE"] != undefined) {
						output2(" Broke door");
						if(flags["RASKTURRETS_BROKE"] != undefined) output2(" and turrets");
						else output2(", Hacked turrets");
					}
					else if(flags["RASKDOOR_HACKED"] != undefined) {
						output2(" Hacked door");
						if(flags["RASKTURRETS_BROKE"] != undefined) output2(", Broke turrets");
						else output2(" and turrets");
					}
					else output2(" Visited");
					if(flags["AZRA_TARKUS_SKIP"] != undefined) output2(", Skipped past");
				}
				if(flags["PREG_RASK_GUARD_RESULT"] != undefined)
				{
					output2("\n<b>* Pregnant Rask Guard:</b> Met her");
					switch(flags["PREG_RASK_GUARD_RESULT"])
					{
						case -1: output2(", Waited her out"); break;
						case 1: output2(", Sexed her with your hyper-sized penis"); break;
						case 2: output2(", Fucked her"); break;
						case 3: output2(", She ate you out"); break;
					}
				}
				if(flags["SYDIAN_QUEEN_RESULT"] != undefined)
				{
					output2("\n<b>* Sydian Queen:</b> Met her");
					switch(flags["SYDIAN_QUEEN_RESULT"])
					{
						case 1: output2(", Gave her weapon"); break;
						case 2: output2(", Berated her"); break;
						case 3: output2(", Begged her for mercy"); break;
					}
					output2("\n<b>* Azaphel:</b> Met him");
					if(flags["AZRA_RASK_PC_SUCKED"] != undefined) output2(", Sucked his dick");
					if(flags["AZRA_RASK_ORGIED"] != undefined) output2(", Sexed him in raskvel orgy");
				}
				sideCount++;
			}
			// Dr. Badger's Job
			if(flags["BADGER_QUEST"] != undefined)
			{
				if(flags["PEXIGA_TREATMENT"] != undefined) output2("\n<b><u>Bimbo Quest</u></b>");
				else if(flags["BADGER_QUEST"] >= 0 && !drBadgerImprisioned()) output2("\n<b><u>Doctor Badger’s Job Offer</u></b>");
				else output2("\n<b><u>Doctor Badger’s Big Mistake</u></b>");
				// Bimbo Raygun
				output2("\n<b>* Status:</b>");
				if(drBadgerImprisioned()) output2(" Reported Dr. Badger, Completed");
				else if(flags["BADGER_QUEST"] == 1) output2(" <i>Find Penny!</i>");
				else if(flags["PENNY_BADGER_WARNED"] != undefined)
				{
					output2(" Warned Penny");
					if(flags["NO_ZAP_PENNY"] != undefined) output2(", Refused to zap her");
					if(flags["NO_REPORTING_DOC_BADGER"] != undefined) output2(", Will not report Dr. Badger");
					if(flags["BADGER_QUEST"] == -1)
					{
						output2(", Confiscated Raygun");
						if(pc.hasKeyItem("Doctor Badger's Bimbo Raygun - Still programmed for use on Penny.")) output2(", <i>Get reprogrammed from Dr. Lash!</i>");
						else if(flags["BADGER_QUEST_TIMER"] == -1) output2(", <i>Return to Penny!</i>");
					}
					else if(flags["BADGER_QUEST"] == -2) output2(", Reprogrammed Raygun, <i>Return to Dr. Badger!</i>");
					else if(flags["BADGER_QUEST"] <= -3) output2(", Zapped Dr. Badger, Rewarded, Completed");
					if(flags["BADGER_QUEST"] >= 2) output2(",");
				}
				if(flags["BADGER_QUEST"] == 2) output2(" Zapped Penny, <i>Mission accomplished! Report to Dr. Badger!</i>");
				else if(flags["BADGER_QUEST"] >= 3) output2(" Zapped Penny, Rewarded, Completed");
				sideCount++;
			}
			// Pexiga Uplift, aka Bimbo Quest II: The Search For More Bimbos
			if(flags["PEXIGA_TALKED"] != undefined)
			{
				if(flags["BADGER_QUEST"] != undefined && flags["PEXIGA_TREATMENT"] != undefined) output2("\n<b><u>Bimbo Quest II: The Search For More Bimbos</u></b>");
				else output2("\n<b><u>Pexiga Uplift</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["PEXIGA_TREATMENT"] == undefined) output2(" Talked to Yammi about her pexiga");
				else
				{
					if(drBadgerImprisioned())
					{
						output2(" Talked to Yammi");
						if(flags["LASH_BOMB"] == undefined && flags["DEL_DISTRACT"] == undefined) output2(", <i>U.G.C. authorities are patrolling Dr. Badger’s Bimbotorium...</i>");
						else if(flags["LASH_BOMB"] != undefined) output2(", U.G.C. distracted by Dr. Lash");
						else if(flags["DEL_DISTRACT"] != undefined) output2(", U.G.C. distracted by Delilah");
						if(flags["PEXIGA_TREATMENT"] >= 1) output2(", Bimbofied Yammi’s pexiga, Completed");
						else output2(", <i>Do you bimbofy Yammi’s pexiga?</i>");
					}
					else
					{
						output2(" Talked to Yammi, Talked to Dr. Badger");
						if(flags["PEXIGA_TREATMENT"] >= 1) output2(", Bimbofied Yammi’s pexiga, Completed");
						else output2(", <i>Do you bimbofy Yammi’s pexiga?</i>");
					}
				}
				if(flags["NYM-FOE"] != undefined) output2("\n<b>* Nym-Foe:</b> Met her");
				if(flags["NYM-FOE"] >= 2) output2(", Defeated her");
				if(flags["NYM-FOE_DISASSEMBLED"] != undefined) output2(", Disassembled her");
				if(flags["NYM-FOE_FIXED"] != undefined) output2(", Fixed her");
				if(flags["NYM-FOE_ACTIVATED"] != undefined) output2(", On patrol");
				if(flags["NYM-FOE_FUCKED"] != undefined) output2("\n<b>* Nym-Foe, Times Sexed Her:</b> " + flags["NYM-FOE_FUCKED"]);
				if(flags["NYM-FOE_LOSSES"] != undefined) output2("\n<b>* Nym-Foe, Times Lost to Her:</b> " + flags["NYM-FOE_LOSSES"]);
				if(flags["NYM-FOE_CHIP_RETURN"] != undefined || pc.hasItemByClass(DamagedVIChip) || flags["NYM-FOE_LOOT_CHIP"] != undefined)
				{
					output2("\n<b>* Damaged V.I. Chip:</b> Looted");
					if(flags["NYM-FOE_CHIP_RETURN"] != undefined) output2(", Given to JoyCo, Rewarded");
					else if(pc.hasItemByClass(DamagedVIChip)) output2(", In possession");
				}
				if(flags["DOLLMAKER_STATUS"] != undefined)
				{
					output2("\n<b>* Doll Maker:</b>");
					switch(flags["DOLLMAKER_STATUS"])
					{
						case -1: output2(" Fought it, Defeated it"); break;
						case 1: output2(" Fought it, Lost to it, You’ve gotten dolled up"); break;
						case 2: output2(" Met it, Non-hostile"); break;
						case 3: output2(" Met it, You’ve volunteered to get dolled up"); break;
						default: output2(" Seen it"); break;
					}
				}
				if(flags["DOLLMAKER_FIXED"] != undefined) output2(", Fixed it");
				if(flags["DOLLMAKER_ACTIVATED"] != undefined) output2(", On guard");
				if(flags["IQBGONE_POLICED"] != undefined || pc.hasItemByClass(IQBGone) || flags["DOLLMAKER_LOOT_IQBGONE"] != undefined)
				{
					output2("\n<b>* IQ B-Gone:</b> Looted");
					if(flags["IQBGONE_POLICED"] != undefined)
					{
						output2(", Given to U.G.C.");
						if(flags["IQBGONE_POLICED"] >= 2) output2(", Rewarded");
					}
					else if(pc.hasItemByClass(IQBGone)) output2(", In possession");
				}
				
				sideCount++;
			}
			// Doll Maker Repair
			if(flags["DOLLMAKER_DISASSEMBLED"] >= 4)
			{
				output2("\n<b><u>Fixing the Doll Maker</u></b>");
				output2("\n<b>* Status:</b> Accepted");
				if(flags["DOLLMAKER_FIX_IQBGONE"] != undefined) output2(", Fixed IQ B-Gone");
				if(flags["DOLLMAKER_FIX_LAMP"] != undefined) output2(", Fixed Brainmelt Lamp");
				if(flags["DOLLMAKER_FIX_EMITTER"] != undefined) output2(", Fixed Bimboleum Emitter");
				if(flags["DOLLMAKER_FIX_VISOR"] != undefined) output2(", Fixed Mindwash Visor");
				if(flags["DOLLMAKER_FIXED"]) output2(", Fully fixed, Completed");
				if(pc.hasStatusEffect("Doll Maker Repair Timer")) output2("\n<b>* Doll Maker, Time Until Active:</b> " + prettifyMinutes(pc.getStatusMinutes("Doll Maker Repair Timer")));
				sideCount++;
			}
			// Nym-Foe Repair
			if(flags["NYM-FOE_REPAIR_QUEST"] != undefined)
			{
				output2("\n<b><u>Fixing the Nym-Foe</u></b>");
				output2("\n<b>* Status:</b>");
				switch(flags["NYM-FOE_REPAIR_QUEST"])
				{
					case -1:
					case -2:
					case -3:
						output2(" Accepted, Doctor Badger created VI chip");
						if(flags["NYM-FOE_REPAIR_QUEST"] == -3) output2(", Returned chip to JoyCo");
						else if(flags["NYM-FOE_REPAIR_QUEST"] == -1) output2(", Sold chip");
						else output2(", Lost chip");
						output2(", Failed");
						break;
					case 1:
						output2(" Accepted");
						if(pc.numberOfItemByClass(SexbotChip) < 6) output2(", <i>Retrieve sexbot VI chips...</i>");
						else output2(", Sexbot chips retrieved, <i>Return to Doctor Badger!</i>");
						output2("\n<b>* Inventory, Sexbot VI Chips:</b> " + pc.numberOfItemByClass(SexbotChip) + " / 6");
						break;
					case 2:
						output2(" Accepted, Doctor Badger created VI chip");
						if(pc.hasItemByClass(DamagedVIChip)) output2(", <i>Insert chip into Nym-Foe!</i>");
						break;
					case 3: output2(" Accepted, Doctor Badger created VI chip, Fixed Nym-Foe, Completed"); break;
					default: output2(" <i>Unknown</i>"); break;
				}
				sideCount++;
			}
			// Deck 13
			if(flags["ANNO_MISSION_OFFER"] != undefined)
			{
				if(flags["DECK13_COMPLETE"] != undefined) output2("\n<b><u>Ghost in the Machine</u></b>");
				else output2("\n<b><u>The Ghost Deck</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["ANNO_MISSION_OFFER"] <= 1) output2(" Offered");
				else
				{
					if(flags["DECK13_COMPLETE"] != undefined)
					{
						if(flags["DECK13_GRAY_PRIME_DECISION"] == 1) output2(" Helped Nova with cybernetic bodies");
						if(flags["DECK13_GRAY_PRIME_DECISION"] == 2) output2(" Convinced Nova to make use of gray goo");
						if(flags["DECK13_GRAY_PRIME_DECISION"] == 3) output2(" Killed Nova");
						output2(", Completed");
					}
					else output2(" <i>In progress...</i>");
					output2("\n<b>* Deck 13:</b>");
					if(flags["DECK13_REACTOR_DOOR_OPEN"] != undefined) output2(" Reactor door open");
					else output2(" Reactor door closed");
					if(flags["DECK13_SHIELDS_ON"] != undefined) output2(", Shields on");
					else output2(", Shields off");
					if(flags["DECK13_ARMORY_ENTERED"] != undefined) output2(", Entered armory");
					if(flags["DECK13_TAKEN_PISTOL"] != undefined || flags["DECK13_TAKEN_RIFLE"] != undefined) output2(", Looted armory");
					if(flags["DECK13_SAMPLES_TAKEN"] != undefined) output2("\n<b>* Deck 13, Gray Goo Samples Taken:</b> " + flags["DECK13_SAMPLES_TAKEN"]);
					if(flags["DECK13_CREW_TALK"] != undefined) output2("\n<b>* Nova:</b> Met her, Found out about her crew");
					if(flags["GRAY_PRIME_DEFEATED_VIA_HP"] != undefined)
					{
						output2("\n<b>* Nova, Combat:</b> Defeated her using physical force");
						if(flags["GRAY_PRIME_DEFEATED_VIA_HP"] == 2) output2(" twice in a row");
					}
					if(flags["ANNO_NOVA_UPDATE"] != undefined && flags["ANNO_MISSION_OFFER"] >= 3)
					{
						output2("\n<b>* Nova Update:</b>");
						if(flags["ANNO_NOVA_UPDATE"] >= 2)
						{
							output2(" Acquired [goo.name]");
							if(flags["GRAYGOO_SPESS_SKYPE"] != undefined) output2(", She chatted with Capt. Morrow");
						}
						else output2(" <i>In progress...</i>");
					}
				}
				sideCount++;
			}
			// Colenso's Conspiracy Theories
			if(flags["SEXBOT_QUEST_STATUS"] != undefined)
			{
				output2("\n<b><u>The Hnngularity</u></b>");
				output2("\n<b>* Sexbots Scanned:</b> ");
				if(flags["SEXBOTS_SCANNED_FOR_COLENSO"] != undefined) output2(flags["SEXBOTS_SCANNED_FOR_COLENSO"]);
				else output2(" <i>In progress...</i>");
				if(flags["SEXBOTS_SCANNED_FOR_COLENSO"] >= 4)
				{
					output2(", Completed");
					if(flags["SEXBOT_QUEST_STATUS"] < 2 && flags["HAND_SOS_ROBOT_DESTROYED"] == undefined && flags["HAND_SO_TALKED_DOWN"] == undefined)
					{
						output2("\n<b>* Sexbot Factory:</b> <i>Exploring...</i>");
					}
					else
					{
						output2("\n<b>* Sexbot Factory:</b>");
						if(flags["SEXBOT_FACTORY_DISABLED"] != undefined) output2(" Disabled");
						else if(flags["SEXBOTS_GENDER_SETTING"] == 1) output2(" Active, Male sexbot preferred");
						else if(flags["SEXBOTS_GENDER_SETTING"] == -1) output2(" Active, Female sexbot preferred");
						else output2(" Active");
						if(flags["HAND_SOS_ROBOT_DESTROYED"] != undefined)
						{
							output2("\n<b>* Firewall:</b>");
							if(flags["TASTED_THE_FLAME"] != undefined) output2(" Used flamethrower,");
							output2(" Destroyed");
						}
						output2("\n<b>* Hand So:</b>");
						if(flags["HAND_SO_LISTENED_TO"] != undefined) output2(" Listened to,");
						if(flags["HAND_SOS_CONSOLE_EXPLODED"] != undefined || flags["HAND_SO_LOOTED"] != undefined)
						{
							if(flags["HAND_SO_TALKED_DOWN"] != undefined) output2(" Talked down to");
							else output2(" Defeated");
							if(flags["HAND_SOS_CONSOLE_EXPLODED"] != undefined) output2(", Console destroyed");
							if(flags["HAND_SO_LOOTED"] != undefined)
							{
								if(pc.hasKeyItem("Hand So's Data Bead")) output2(", Contained in data bead");
								else output2(", Disposed of data bead");
							}
						}
						else output2(" <i>Active...</i>");
					}
				}
				sideCount++;
			}
			// Kimber Quest
			if(flags["KIMBER_QUEST"] != undefined || flags["KIMBER_OFFER"] != undefined)
			{
				output2("\n<b><u>Kimber’s Expedition</u></b>");
				output2("\n<b>* Status:</b> Offered");
				if(flags["KIMBER_QUEST"] == -1) output2(", Tarkus destroyed, Unable to start");
				if(flags["KIMBER_QUEST"] == 0) output2(", Accepted, <i>Find daer worm!</i>");
				if(flags["KIMBER_QUEST"] == 1) output2(", Accepted, Found and defeated daer worm, <i>Return to Kimber!</i>");
				if(flags["KIMBER_QUEST"] >= 2) output2(", Accepted, Found and defeated daer worm, Reported to Kimber");
				if(flags["KIMBER_QUEST"] >= 3) output2(", Completed");
				if(flags["KIMBER_QUEST"] >= 4) output2("\n<b>* Gabilani Panties:</b> Taken");
				sideCount++;
			}
			// Lane's Illegal Activity
			if(flags["MET_LANE"] != undefined)
			{
				output2("\n<b><u>Lane’s Hypnotism</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["LANE_FULLY_HYPNOTISED_FOREVER"] == undefined)
				{
					if(flags["LANE_DETOX_COUNTER"] != undefined) output2(" Detoxifying");
					else if(flags["LANE_FULLY_HYPNOTISED"] != undefined && flags["LANE_DISABLED"] == undefined)
					{
						output2(" Fully hypnotized");
						if(flags["LANE_FULLY_HYPNOTISED_DAY"] != undefined)
						{
							output2(" for " + (days - flags["LANE_FULLY_HYPNOTISED_DAY"]) + " day");
							if(days - flags["LANE_FULLY_HYPNOTISED_DAY"] != 1) output2("s");
						}
					}
					else if(hasHypnosisEffect()) output2(" Hypnotized");
					else output2(" Normal");
				}
				else output2(" Hypnotized forever");
				if(flags["LANE_PAYS_PC_ERRY_DAY"] != undefined) output2(", Get paid 200 credits per day");
				if(flags["PC_PAYS_LANE_ERRY_DAY"] != undefined) output2(", Get taxed 500 credits per day");
				if(flags["LANE_DISABLED"] != undefined) output2(", Completed");
				if(flags["LANE_DETOX_COUNTER"] != undefined) output2("\n<b>* Hypnotism Detoxification Duration:</b> " + prettifyMinutes(flags["LANE_DETOX_COUNTER"]));
				sideCount++;
			}
			// ShekkaQuest
			if(flags["SHEKKA_ISSUES"] != undefined || MailManager.isEntryViewed("shekkaFollowerIntroMail"))
			{
				output2("\n<b><u>Shekka’s " + (flags["SHEKKA_PROJECT_FUNDED"] == undefined ? "Issue" : "Project") + "</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["SHEKKA_ISSUES"] == undefined) output2(" Read Shekka’s message, <i>Give Shekka a visit!</i>");
				else
				{
					if(flags["SHEKKA_ISSUES"] == 1) output2(" Shekka requests fertility treatment, <i>Use your name to help Shekka!</i>");
					else
					{
						output2(" Accepted");
						if(flags["SHEKKA_ISSUES"] == 5)
						{
							if(pc.hasStatusEffect("Shekka_Pay_CD")) output2(", <i>Funding...</i>");
							else output2(", Funding complete, <i>Give Shekka a visit!</i>");
						}
						if(flags["SHEKKA_ISSUES"] == 6)
						{
							if(pc.hasStatusEffect("Shekka_Cure_CD")) output2(", Funded, <i>Creating cure...</i>");
							else output2(", Funded, Cure ready, <i>Give Shekka a visit!</i>");
						}
						if(flags["SHEKKA_ISSUES"] >= 7) output2(", Funded, Cure obtained, Completed");
						if(flags["SHEKKA_PROJECT_FUNDED"] != undefined) output2("\n<b>* Research Phase:</b> " + flags["SHEKKA_PROJECT_FUNDED"]);
						if(flags["SHEKKA_ISSUES"] < 5)
						{
							if(pc.hasStatusEffect("Shekka_Pay_CD")) output2(", Funded, <i>Wait until next data set...</i>");
							else output2(", Data package ready, <i>Awaiting payment...</i>");
						}
						else output2(", Fully Funded");
						if(flags["SHEKKA_ISSUES"] == 7 && flags["SHEKKA_CURE_TIMER"] != undefined)
						{
							output2("\n<b>* Shekka, Time Since Cured:</b> " + prettifyMinutes(GetGameTimestamp() - flags["SHEKKA_CURE_TIMER"]));
							if(MailManager.isEntryViewed("shekkaFollowerUnlockEmail")) output2(", <i>Give Shekka a visit!</i>");
						}
					}
				}
				sideCount++;
			}
		}
		
		if(showID == "Myrellion" || showID == "All")
		{
			// The Great Ant World War
			/*
			if(flags["MET_JURO"] != undefined)
			{
				output2("\n<b><u>War in Myrellion</u></b>");
				output2("\n<b>* Status:</b>");
				if(9999 == 0) output2(" ???");
				else output2(" <i>In progress... STILL IN DEVELOPMENT</i>");
				sideCount++;
			}
			*/
			// Ara’s Diplomacy Mission
			if(flags["BOTHRIOC_QUEST"] != undefined || flags["ARAKEI_CLOSED_OFF"] == 1)
			{
				output2("\n<b><u>Ara’s Diplomacy Mission</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["ARAKEI_CLOSED_OFF"] == 1) output2(" Refused to help, Failed");
				else
				{
					switch(flags["BOTHRIOC_QUEST"])
					{
						case BOTHRIOC_QUEST_START:
							if(flags["BOTHRIOC_QUEST_DOCTOR"] != undefined) output2(" Accepted, Help from Doctor " + flags["BOTHRIOC_QUEST_DOCTOR"]);
							else output2(" Agreed to help, <i>Acquire suppressant from a scientist...</i>");
							break;
						case BOTHRIOC_QUEST_RESEARCH:
							output2(" Accepted, Doctor " + flags["BOTHRIOC_QUEST_DOCTOR"] + " creating suppressant");
							if(flags["BOTHRIOC_QUEST_RESEARCH"] != undefined && ((GetGameTimestamp() - flags["BOTHRIOC_QUEST_RESEARCH"]) > (flags["BOTHRIOC_QUEST_DOCTOR"] != "Lessau" ? 4320 : 7200))) output2(", Research Complete, <i>Return to " + flags["BOTHRIOC_QUEST_DOCTOR"] + "</i>");
							else output2(", Researching...");
							if(flags["BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT"] == undefined || flags["BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT"] < 4) output2(", <i>Gather quadommes...</i>");
							break;
						case BOTHRIOC_QUEST_DIPLOMACY:
							output2(" Accepted, Doctor " + flags["BOTHRIOC_QUEST_DOCTOR"] + " created suppressant");
							if(flags["BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT"] == undefined || flags["BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT"] < 4) output2(", <i>Gather quadommes...</i>");
							break;
						case BOTHRIOC_QUEST_QUADOMME:
							output2(" Accepted, Doctor " + flags["BOTHRIOC_QUEST_DOCTOR"] + " created suppressant, Gathered quadommes");
							if(flags["BOTHRIOC_QUEST_COUNTERAGENT"] != undefined) output2(", Gave Ara" + (flags["BOTHRIOC_QUEST_COUNTERAGENT"] > 0 ? "" : " fake") + " suppressant, <i>Attend summit with Ara...</i>");
							else output2(", <i>Return to Ara!</i>");
							break;
						case BOTHRIOC_QUEST_SUCCESS:
							output2(" Accepted, Doctor " + flags["BOTHRIOC_QUEST_DOCTOR"] + " created suppressant, Quadomme summit success");
							break;
						case BOTHRIOC_QUEST_FAILURE:
							output2(" Accepted, Doctor " + flags["BOTHRIOC_QUEST_DOCTOR"] + " created suppressant, Quadomme summit failure");
							break;
					}
					if(flags["BOTHRIOC_QUEST_COMPLETE"] != undefined) output2(", Completed");
					if(flags["BOTHRIOC_QUEST_RESEARCH"] != undefined) output2("\n<b>* Research, Duration:</b> " + prettifyMinutes(GetGameTimestamp() - flags["BOTHRIOC_QUEST_RESEARCH"]));
					if(flags["BOTHRIOC_QUEST_SUMMIT_DATE"] != undefined) output2("\n<b>* Diplomatic Talks, Duration:</b> " + prettifyMinutes(GetGameTimestamp() - flags["BOTHRIOC_QUEST_SUMMIT_DATE"]));
					if(flags["BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT"] != undefined)
					{
						output2("\n<b>* Quadommes to Summit:</b> " + flags["BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT"]);
						if(flags["BOTHRIOC_QUEST_QUADOMME_TO_SUMMIT"] >= 4) output2(", Enough quadommes!");
					}
					if(flags["BOTHRIOC_QUEST_BETA_NYREA_BAITED"] != undefined) output2("\n<b>* Quadommes, Beta Nyrea Baited, Total:</b> " + flags["BOTHRIOC_QUEST_BETA_NYREA_BAITED"]);
					if(flags["BOTHRIOC_QUEST_GENEALOGY"] != undefined) output2("\n<b>* Bothrioc Genealogy, Given To:</b> " + flags["BOTHRIOC_QUEST_GENEALOGY"]);
				}
				sideCount++;
			}
			// Bothrioc Addiction
			if(flags["BOTHRIOC_ADDICTION"] != undefined && flags["BOTHRIOC_ADDICTION"] != 0)
			{
				output2("\n<b><u>Bothrioc Oil</u></b>");
				output2("\n<b>* Status:</b>");
				if(bothriocAddiction() >= 100) output2(" Completely addicted to it");
				else if(bothriocAddiction() >= 50)
				{
					output2(" Permanently aroused by it");
					if(bothriocAddiction() >= 75) output2(", Accepting of it");
				}
				else if(bothriocAddiction() >= 25) output2(" Curious about it");
				else output2(" Exposed to it");
				output2("\n<b>* Bothrioc Hormone Level:</b> " + bothriocAddiction() + " %");
				sideCount++;
			}
			// EmmyQuest
			if(flags["EMMY_QUEST"] != undefined)
			{
				output2("\n<b><u>EmmyQuest</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["EMMY_QUEST"] == 0)
				{
					output2(" Requested a flower");
					if(!pc.hasItemByClass(VenusBloom)) output2(", <i>Find her a flower!</i>");
					else output2(", Flower found, <i>Give her a flower!</i>");
				}
				if(flags["EMMY_QUEST"] >= 1)
				{
					if(MailManager.isEntryViewed("emmy_apology") && flags["EMMY_APOLOGIZED"] != undefined) output2(" Accepted her ‘oral apology’");
					else output2(" Gave her a flower");
				}
				if(flags["EMMY_QUEST"] >= 2)
				{
					if(MailManager.isEntryViewed("emmy_gift_starter") && flags["EMMY_QUEST"] == 2) output2(", <i>Gift her with a gem!</i>");
					else
					{
						output2(", Gave her a gemstone");
						if(flags["EMMY_PRESEX_FUN_TIMER"] == undefined) output2(", <i>Perhaps you should have some fun with her?</i>");
					}
				}
				if(flags["EMMY_QUEST"] >= 3)
				{
					if(MailManager.isEntryViewed("emmy_implant_explain_email") && flags["EMMY_QUEST"] == 3) output2(", <i>Talk to her about her implant!</i>");
					else if(flags["EMMY_QUEST"] == 4)
					{
						output2(", She requests a herm harness");
						if(flags["GET_ME_ONE"] != undefined) output2(" (You asked for one, too!)");
						if(pc.credits < 15000) output2(", Too poor to pay 15000 credits");
						else output2(", Have 15000 credits to pay");
					}
					if(flags["EMMY_QUEST"] == 5)
					{
						output2(", Paid for herm harness");
						if(flags["GET_ME_ONE"] != undefined) output2(" (You asked for one, too!)");
						if(MailManager.isEntryViewed("emmy_harness_here") && flags["EMMY_QUEST"] == 5) output2(", <i>Return to Emmy!</i>");
					}
				}
				if(flags["EMMY_QUEST"] >= 6)
				{
					output2(", Paid for and have controls to her herm harness");
					if(flags["GET_ME_ONE"] != undefined) output2(" (You asked for one, too!)");
				}
				if(flags["EMMY_BANNED"] != undefined) output2(", Banned from her shop, Failed");
				else if(9999 == 0) output2(", Completed");
				if(flags["EMMY_QUEST"] == 5)
				{
					output2("\n<b>Toy Delivery Time:</b>");
					if(flags["EMMY_TOY_TIMER"] > GetGameTimestamp()) output2(" " + prettifyMinutes(flags["EMMY_TOY_TIMER"] - GetGameTimestamp()));
					else output2(" <i>Delivered</i>");
				}
				sideCount++;
			}
			// FazianQuest
			if(flags["FAZIAN_QUEST_STATE"] != undefined && flags["FAZIAN_QUEST_STATE"] != FAZIAN_QUEST_NOTSTARTED && (flags["FAZIAN_QUEST_STATE"] != FAZIAN_QUEST_OFFERING || flags["FAZIAN_QUEST_DELAY"] != undefined))
			{
				output2("\n<b><u>FazianQuest</u></b>");
				output2("\n<b>* Status:</b>");
				switch(flags["FAZIAN_QUEST_STATE"])
				{
					case FAZIAN_QUEST_OFFERING: output2(" <i>Might be able to help...</i>"); break;
					case FAZIAN_QUEST_COMPLETE:
						output2(" Helped Hepane, Saved Fazian from Major Ehstraffe and tarratch slavers");
						if(flags["FAZIAN_QUEST_RESCUE_TIMER"] != undefined) output2(", Completed");
						break;
					case FAZIAN_QUEST_STARTED:
						output2(" Offered to help Hepane");
						if(flags["FAZIAN_QUEST_SUCCESSES"] + flags["FAZIAN_QUEST_FAILURES"] < 3) output2(", <i>Find clues of Fazian’s whereabouts...</i>");
						else
						{
							output2(", Clues found");
							if(flags["FAZIAN_QUEST_SUCCESSES"] + flags["FAZIAN_QUEST_FAILURES"] < 5) output2(", <i>Keep investigating or return to Hepane...</i>");
							else output2(", <i>Return to Hepane!</i>");
						}
						break;
					case FAZIAN_QUEST_REJECTED: output2(" Refused to help Hepane find Fazian"); break;
					case FAZIAN_QUEST_FAILED: output2(" Offered to help Hepane, Did not find enough useful clues, Failed"); break;
					case FAZIAN_QUEST_INVESTIGATED:
						output2(" Offered to help Hepane, Investigated clues, <i>Return to Hepane");
						if((flags["FAZIAN_QUEST_TIMER"] + (24 * 60)) > GetGameTimestamp()) output2(" in " + prettifyMinutes((flags["FAZIAN_QUEST_TIMER"] + (24 * 60)) - GetGameTimestamp()));
						else output2("!");
						output2("</i>");
						break;
					case FAZIAN_QUEST_RESCUE: output2(" Helped Hepane, <i>Locate the warehouse in Kressia and rescue Fazian!</i>"); break;
					case FAZIAN_QUEST_BRIBED: output2(" Betrayed Hepane, Sold Fazian to tarratch slavers for 20000 credits, Completed"); break;
					default: output2(" <i>Unknown</i>"); break;
				}
				if
				(	(flags["FAZIAN_QUEST_STATE"] != FAZIAN_QUEST_OFFERING && flags["FAZIAN_QUEST_STATE"] != FAZIAN_QUEST_REJECTED)
				&&	(flags["FAZIAN_QUEST_SUCCESSES"] != undefined && flags["FAZIAN_QUEST_FAILURES"] != undefined)
				)
					output2("\n<b>* Clues, Lead/Dead-End Ratio:</b> " + flags["FAZIAN_QUEST_SUCCESSES"] + "/" + flags["FAZIAN_QUEST_FAILURES"] + ", of " + (flags["FAZIAN_QUEST_SUCCESSES"] + flags["FAZIAN_QUEST_FAILURES"]) + " clues");
				if(flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_STARTED)
				{
					if(flags["FAZIAN_QUEST_GOLDMYR"] != undefined) output2("\n<b>* Clues, Gold Myr Group:</b> <i>" + (flags["FAZIAN_QUEST_GOLDMYR"] > 0 ? "Possibly not a kidnapping" : "Nothing") + "...</i>");
					if(flags["FAZIAN_QUEST_BARKEEP"] != undefined) output2("\n<b>* Clues, Gold Myr Barkeep:</b> <i>" + (flags["FAZIAN_QUEST_BARKEEP"] > 0 ? "Look in Kressia" : "Nothing") + "...</i>");
					if(flags["FAZIAN_QUEST_DALLY"] != undefined) output2("\n<b>* Clues, Dally:</b> <i>" + (flags["FAZIAN_QUEST_DALLY"] > 0 ? "Suspect is possibly myr" : "Nothing") + "...</i>");
					if(flags["FAZIAN_QUEST_GENE"] != undefined) output2("\n<b>* Clues, Gene:</b> <i>" + (flags["FAZIAN_QUEST_GENE"] > 0 ? "Fazian was invited to do a private performance" : "Nothing") + "...</i>");
					if(flags["FAZIAN_QUEST_JURO"] != undefined) output2("\n<b>* Clues, Juro:</b> <i>" + (flags["FAZIAN_QUEST_JURO"] > 0 ? "Major Ehstraffe, a female red myr officer" : "Nothing") + "...</i>");
				}
				if(flags["GUARD_BRIBE"] != undefined || flags["FAZIAN_QUEST_DOOR"] != undefined || flags["FAZIAN_BACK_WINDOW"] != undefined)
				{
					output2("\n<b>* Warehouse:</b>");
					if(flags["FAZIAN_QUEST_DOOR"] + (6 * 60) >= GetGameTimestamp()) output2(" Actively guarded,");
					output2(" Tried to");
					if(flags["GUARD_BRIBE"] != undefined) output2(" bribe guard");
					if(flags["FAZIAN_QUEST_DOOR"] != undefined || flags["FAZIAN_BACK_WINDOW"] != undefined)
					{
						if(flags["GUARD_BRIBE"] != undefined) output2(" and");
						output2(" sneak through the");
						if(flags["FAZIAN_QUEST_DOOR"] != undefined) output2(" door");
						if(flags["FAZIAN_QUEST_DOOR"] != undefined && flags["FAZIAN_BACK_WINDOW"] != undefined) output2(" and");
						if(flags["FAZIAN_BACK_WINDOW"] != undefined) output2(" window");
					}
					output2(" but failed");
				}
				sideCount++;
			}
			//Federation Quest
			if(flags["FEDERATION_QUEST"] != undefined)
			{
				output2("\n<b><u>FederationQuest</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["FEDERATION_QUEST"] <= 0) output2(" Refused");
				else
				{
					output2(" Accepted");
					if(flags["FEDERATION_QUEST_AMBUSH"] == 0) output2(", Lost to ambush");
					if(flags["FEDERATION_QUEST_AMBUSH"] == 1) output2(", Defeated ambush");
					switch(flags["FEDERATION_QUEST"])
					{
						case 1:
							if(flags["FEDERATION_QUEST_AMBUSH"] != undefined) output2(", <i>Search for the Queen</i>");
							else output2(", <i>Rendevous outside bunker</i>");
							break;
						case 2: output2(", Defeated Estallia, Radio’d Queen, <i>Prepare for confrontation</i>"); break;
						case 3: output2(", Defeated Estallia, Captured Estallia"); break;
						case 4: output2(", Defeated Estallia, Released Estallia"); break;
						case 5: output2(", Estallia agreed to stop attacks"); break;
						case 6: output2(", Remnants plan to assimilate with Kui-tan"); break;
						case 7: output2(", Kara transporting Remnants to Mhen’ga"); break;
						case 8: output2(", Agreed to transport Remnants to Mhen’ga"); break;
						case 9: output2(", Paid to transport Remnants to Mhen’ga"); break;
						case 10: output2(", Transported Remnants to Mhen’ga"); break;
					}
					if(flags["FEDERATION_QUEST"] >= 3) output2(", Completed");
				}

				sideCount++;
			}
			// IrelliaQuest
			if(flags["IRELLIA_QUEST_STATUS"] != undefined)
			{
				output2("\n<b><u>IrelliaQuest</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["IRELLIA_QUEST_STATUS"] == 0) output2(" Refused");
				else if(flags["IRELLIA_QUEST_STATUS"] == -1) output2(" Bomb exploded, Failed");
				else if(flags["IRELLIA_QUEST_STATUS"] == 2) output2(" Investigating, <i>Attend unification rally</i>");
				else if(flags["IRELLIA_QUEST_STATUS"] >= 3)
				{
					output2(" Investigated");
					if(flags["IRELLIA_QUEST_STATUS"] == 3) output2(", Not reported");
					if(flags["IRELLIA_QUEST_STATUS"] >= 4) output2(", Reported");
					if(flags["IRELLIA_QUEST_STATUS"] >= 6) output2(", Rewarded, Irellia’s private chambers unlocked");
					if(flags["IRELLIA_QUEST_STATUS"] >= 5) output2(", Completed");
				}
				else output2(" <i>In progress...</i>");
				sideCount++;
			}
			// Kara's Big Adventure! - Pt.1
			if(flags["BEEN_TO_MYRELLION_BAR"] != undefined && (flags["MET_KARA"] != undefined || flags["LET_SHADE_AND_KARA_DUKE_IT_OUT"] != undefined))
			{
				output2("\n<b><u>KaraQuest: A Damsel in Distress</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["LET_SHADE_AND_KARA_DUKE_IT_OUT"] != undefined) output2(" Ignored " + (flags["MET_KARA"] == undefined ? "cat-girl" : "Kara and Shade"));
				else if(flags["DISTRACTED_SHADE"] != undefined) output2(" Distracted Shade");
				else if(flags["TRIPPED_ON_SHADE"] != undefined) output2(" Tripped on Shade");
				else if(flags["BETRAYED_KARA"] == 1) output2(" Betrayed Kara by telling Shade");
				else if(flags["BETRAYED_KARA"] == 2) output2(" Agreed to Shade’s Offer to catch Kara");
				else output2(" <i>In progress...</i>");
				if(flags["SHADE_DEFEATED_WITH_KARA"] != undefined) output2(", Won against Shade");
				if(flags["KARA_DEFEATED_WITH_SHADE"] != undefined) output2(", Won against Kara");
				if(flags["LOST_TO_SHADE_WITH_KARA"] != undefined) output2(", Lost against Shade");
				if(flags["SHADE_PAID_YOU"] != undefined) output2(", Rewarded by Shade, Completed");
				if(flags["KARA_PAID_YOU"] != undefined) output2(", Rewarded by Kara, Completed");
				sideCount++;
			}
			// Kara's Big Adventure! - Pt.2
			if(flags["KQ2_QUEST_OFFER"] != undefined)
			{
				output2("\n<b><u>KaraQuest 2: Eye of the Beholder</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["KQ2_QUEST_DETAILED"] == undefined)
				{
					output2(" Mission offered, Invited to meet Kara");
				}
				else
				{
					output2(" Met Kara");
					if(flags["KQ2_QUEST_BEGIN"] == 1) output2(", Accepted mission");
					else if(flags["KQ2_QUEST_BEGIN"] == 2) output2(", Rejected mission");
					else output2(", Undecided about mission");
					if(flags["KQ2_SEX_PAY"] != undefined) output2(", Kara sexed you");
					if(flags["KQ2_CREDS_FIRST"] != undefined) output2(", Kara paid you");
					if(flags["KQ2_SHADE_ENCOUNTERED"] != undefined) output2(", Shade encountered");
					if(flags["KQ2_SHADE_DEAD"] != undefined) output2(", Kara killed Shade");
					if(flags["KQ2_KHANS_FILES"] != undefined) output2(", Took Khan’s files");
					if(flags["KQ2_LOST_TO_AMARA"] != undefined) output2(", Lost to Amara");
					if(flags["KQ2_BETRAYED_KARA"] != undefined) output2(", You betrayed Kara");
					if(flags["KQ2_KARA_SACRIFICE"] != undefined) output2(", Kara sacrificed herself");
					if(flags["KQ2_QUEST_FINISHED"] == 1) output2(", Completed");
					else if(flags["KQ2_QUEST_FINISHED"] == 2) output2(", Failed");
					else output2(", <i>In progress...</i>");
					// Pirate Base
					if(flags["KQ2_KARA_WITH_PC"] != undefined)
					{
						output2("\n<b>* Kara, Status:</b>");
						if(flags["KQ2_KARA_WITH_PC"] == 1) output2(" At your side");
						else if(flags["KQ2_KARA_WITH_PC"] == 2) output2(" At the radio tower");
						else output2(" <i>Unknown</i>");
					}
					// Kara headshots
					if(flags["KQ2_KARA_SNIPAH_KILLS"] != undefined) output2("\n<b>* Kara, Enemies Sniped:</b> " + flags["KQ2_KARA_SNIPAH_KILLS"]);
					// Nuke 'em, Rico!
					if(flags["KQ2_NUKE_STARTED"] != undefined)
					{
						output2("\n<b>* Pirate Base, Nuke:</b>");
						if(flags["KQ2_NUKE_STARTED"] < 0) output2(" Activated but cancelled");
						else if(flags["KQ2_NUKE_EXPLODED"] != undefined) output2(" Activated, Detonated, Destroyed Myrellion");
						else output2(" Activated " + prettifyMinutes(GetGameTimestamp() - flags["KQ2_NUKE_STARTED"]) + " ago");
					}
					if(flags["KQ2_FIGHT_STEPS"] != undefined)
					{
						output2("\n<b>* Pirate Base, Entrance:</b>");
						if(flags["KQ2_RND_ENTRANCE_OPEN"] == 1) output2(" Blown open with tank");
						else if(flags["KQ2_RND_ENTRANCE_OPEN"] == 2) output2(" Opened with keycard");
						else if(flags["KQ2_RND_ENTRANCE_OPEN"] == 3) output2(" Opened with manual override");
						else if(flags["KQ2_RND_ENTRANCE_OPEN"] == 4) output2(" Opened by Kara");
						else output2(" Closed");
					}
					if(flags["KQ2_RF_KENNEL_USED"] != undefined)
					{
						output2("\n<b>* Pirate Base, RF Kennel:</b>");
						if(flags["KQ2_RF_KENNEL_USED"] == 1) output2(" Used to fix Tam-wolf");
						else if(flags["KQ2_RF_KENNEL_USED"] == 2) output2(" Used to upgrade Tam-wolf");
						else output2(" Unused");
					}
					if(flags["KQ2_BARRACKS_INTERIOR_ENTERED"] != undefined)
					{
						output2("\n<b>* Pirate Base, Barracks:</b> Entered");
						if(flags["KQ2_TAKEN_ARMOR"] != undefined) output2(", Looted");
					}
					if(flags["KQ2_DEFEATED_KHAN"] != undefined)
					{
						output2("\n<b>* Pirate Base, Dr. Khan:</b> Met him, Defeated him");
						if(flags["KQ2_FUCKED_KHAN"] != undefined) output2(", Sexed him with Kara");
						if(flags["KQ2_KHAN_LOOTED"] != undefined)
						{
							output2(", Looted his room");
							if(flags["KQ2_KHAN_LOOTED_COAT"] != undefined || flags["KQ2_KHAN_LOOTED_CASTER"] != undefined)
							{
								output2(", Took his");
								if(flags["KQ2_KHAN_LOOTED_COAT"] != undefined) output2(" coat");
								if(flags["KQ2_KHAN_LOOTED_COAT"] != undefined && flags["KQ2_KHAN_LOOTED_CASTER"] != undefined) output2(" and");
								if(flags["KQ2_KHAN_LOOTED_CASTER"] != undefined) output2(" gun");
							}
						}
					}
					if(flags["KQ2_LEFT_ENGINEER"] != undefined || flags["KQ2_DEFEATED_ENGINEER"] != undefined)
					{
						output2("\n<b>* Pirate Base, Engineer:</b> Encountered her");
						if(flags["KQ2_LEFT_ENGINEER"] == 2) output2(", Bribed her with porn");
						if(flags["KQ2_LEFT_ENGINEER"] == 3) output2(", Bribed her with money");
						if(flags["KQ2_DEFEATED_ENGINEER"] != undefined)
						{
							output2(", Defeated her");
							if(flags["KQ2_DEFEATED_ENGINEER"] == 2) output2(" with sex");
							else output2(" in combat");
						}
						else output2(", Left her alone");
					}
					if(flags["KQ2_DEFEATED_JUGGERNAUT"] != undefined) output2("\n<b>* Pirate Base, Juggernaut:</b> Defeated him");
					if(flags["KQ2_WATSON_MET"] != undefined) output2("\n<b>* Pirate Base, Watson:</b> Met him");
				}
				sideCount++;
			}
			// MarshalQuestuuuuuu
			if(9999 == 0)
			{
				output2("\n<b><u>MarshalQuest</u></b>");
				output2("\n<b>* Status:</b>");
				if(9999 == 0) output2(" Completed");
				else output2(" <i>In progress...</i>");
				sideCount++;
			}
			// Ant Hybrids
			if(flags["MCALLISTER_MYR_HYBRIDITY"] != undefined)
			{
				output2("\n<b><u>Myr Hybridity</u></b>");
				output2("\n<b>* Research:</b>");
				if(flags["MCALLISTER_MYR_HYBRIDITY"] == 1) output2(" Pending funds...");
				else if(flags["MCALLISTER_MYR_HYBRIDITY"] >= 2)
				{
					output2(" Funded");
					if(flags["MCALLISTER_MYR_HYBRIDITY_START"] != undefined && GetGameTimestamp() < (flags["MCALLISTER_MYR_HYBRIDITY_START"] + (7 * 24 * 60)))
					{
						output2(", Researching...");
						output2("\n<b>* Research, Duration:</b> " + prettifyMinutes(GetGameTimestamp() - flags["MCALLISTER_MYR_HYBRIDITY_START"]));
					}
					else output2(", Completed");
				}
				if(flags["MCALLISTER_MYR_HYBRIDITY"] >= 3)
				{
					output2("\n<b>* Orange Myr Data Chit:</b>");
					if(flags["MCALLISTER_MYR_HYBRIDITY"] == 4) output2(" Gave to Juro");
					else if(pc.hasKeyItem("Orange Myr Data")) output2(" In inventory");
					else output2(" <i>Missing</i>");
				}
				sideCount++;
			}
			// Ant TFs
			if(flags["MET_MCALLISTER"] != undefined)
			{
				output2("\n<b><u>Myr Transformation Experiment</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["MCALLISTER_MYR_TFS"] == undefined) output2(" Researching...");
				else if(flags["MCALLISTER_MYR_TFS"] < 2) output2(" Ready to meet test subjects");
				else output2(" Met test subjects, Successful results, Completed");
			}
			// Red Myr Blood Donation Drive
			if(flags["NEVRIE_QUEST"] != undefined)
			{
				output2("\n<b><u>Nevrie’s Co-worker</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["NEVRIE_QUEST"] >= 2)
				{
					if(flags["NEVRIE_QUEST"] < 3) output2(" Dr. McAllister is out");
					else output2(" Lab unlocked, Completed");
				}
				else output2(" <i>In progress...</i>");
				output2("\n<b>* Red Myr Blood Sample:</b>");
				if(pc.hasKeyItem("Red Myr Blood") || flags["LIEVE_BLOOD_SAMPLE"] != undefined || flags["NEHZARA_BLOOD_SAMPLE"] != undefined)
				{
					output2(" Acquired");
					if(flags["LIEVE_BLOOD_SAMPLE"] != undefined || flags["NEHZARA_BLOOD_SAMPLE"] != undefined) output2(" from");
					if(flags["LIEVE_BLOOD_SAMPLE"] != undefined) output2(" Lieve");
					if(flags["LIEVE_BLOOD_SAMPLE"] != undefined && flags["NEHZARA_BLOOD_SAMPLE"] != undefined) output2(" and");
					if(flags["NEHZARA_BLOOD_SAMPLE"] != undefined) output2(" Nehzara");
					if(flags["NEVRIE_QUEST"] < 2) output2(", <i>Return to Nevrie</i>");
				}
				else output2(" <i>Not yet obtained</i>");
				sideCount++;
			}
			// Getting Taivra a new throne
			if(flags["TAIVRA_NEW_THRONE"] != undefined)
			{
				output2("\n<b><u>Queen Taivra’s New Throne</u></b>");
				output2("\n<b>* Status:</b>");
				switch(flags["TAIVRA_NEW_THRONE"])
				{
					case 0: output2(" Purchased, <i>Retrieve at hangar...</i>"); break;
					case 1: output2(" Purchased, Retrieved, <i>Return to Taivra...</i>"); break;
					case 2: output2(" Purchased, Retrieved, Installed in her throne room, Completed"); break;
					default: output2(" <i>Unknown</i>"); break;
				}
				sideCount++;
			}
			// Red Myr Venom Addiction
			if(CodexManager.entryViewed("Red Myr") && (drankMyrVenom() || sexedMyrVenom()))
			{
				output2("\n<b><u>Red Myr Venom</u></b>");
				output2("\n<b>* Status:</b>");
				if(pc.hasPerk("Venom Slut")) output2(" Complete venom slut");
				else if(flags["VENOM_PROGRESS"] != undefined && flags["VENOM_PROGRESS"] > 0)
				{
					if(pc.hasStatusEffect("Red Myr Venom")) output2(" Currently affected");
					else output2(" In system");
					if(flags["VENOM_ADDICTION"] != undefined && flags["VENOM_ADDICTION"] > 0)
					{
						output2(", Addicted");
						if(pc.hasStatusEffect("Myr Venom Withdrawal")) output2(", Undergoing withdrawal");
						output2("\n<b>* Venom Addiction Level:</b> " + flags["VENOM_ADDICTION"] + " %");
					}
					else output2("\n<b>* Venom Dosage Level:</b> " + flags["VENOM_PROGRESS"] + " %");
				}
				else
				{
					output2(" Tried");
					if(flags["VENOM_PROGRESS"] != undefined && flags["VENOM_PROGRESS"] <= 0) output2(", Cured");
				}
				if(sexedMyrVenom()) output2("\n<b>* Doses, Sex-related:</b> " + flags["SEXED_MYR_VENOM"]);
				if(drankMyrVenom()) output2("\n<b>* Doses, Drink-related:</b> " + flags["DRANK_MYR_VENOM"]);
				sideCount++;
			}
			// "All the Feels: The Quest"
			if(flags["SIERVA_LATEGOODBYE_RESPONSE"] != undefined)
			{
				if(flags["LEARNED_IAYAS_FATE"] == undefined) output2("\n<b><u>In Love and War</u></b>");
				else output2("\n<b><u>War is Hell</u></b>");
				output2("\n<b>* Sierva’s Request:</b>");
				if(flags["SIERVA_LATEGOODBYE_RESPONSE"] == LIEVE_LATEGOODBYE_NO) output2(" Refused");
				else if(flags["SIERVA_LATEGOODBYE_RESPONSE"] == LIEVE_LATEGOODBYE_YES)
				{
					if(flags["LEARNED_IAYAS_FATE"] == undefined) output2(" Accepted, <i>Find Iaya</i>");
					else output2(" Accepted, Learned Iaya’s Fate, <i>Tell Sierva</i>");
				}
				else if(flags["SIERVA_LATEGOODBYE_RESPONSE"] == LIEVE_LATEGOODBYE_COMPLETE) output2(" Accepted, Learned Iaya’s Fate, Told Sierva, Completed");
				sideCount++;
			}
		}
		
		if(showID == "Uveto" || showID == "All")
		{
			// Drone Hunting
			if(flags["MET_NAYNA"] != undefined)
			{
				output2("\n<b><u>Drone Hunting</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["NAYNA_REJECTED"] != undefined) output2(" Refused to help Nayna");
				else if(flags["NAYNA_QUEST_STARTED"] != undefined || flags["NAYNA_DRONES_TURNED_IN"] != undefined)
				{
					var naynaDrones:int = 0;
					if(flags["DRONED_UVIP F20"] != undefined) naynaDrones++;
					if(flags["DRONED_UVIP T6"] != undefined) naynaDrones++;
					if(flags["DRONED_UVIP V14"] != undefined) naynaDrones++;
					if(flags["DRONED_UVIP X34"] != undefined) naynaDrones++;
					if(flags["DRONED_UVIP L28"] != undefined) naynaDrones++;
					
					if(naynaDrones >= 5) output2(" Completed");
					else output2(" <i>In progress...</i>");
					if(naynaDrones > 0) output2("\n<b>* Weather Drones Collected:</b> " + naynaDrones);
				}
				else output2(" <i>Not yet accepted...</i>");
				if(flags["NAYNA_DRONES_TURNED_IN"] != undefined) output2("\n<b>* Weather Drones Turned In:</b> " + flags["NAYNA_DRONES_TURNED_IN"]);
				sideCount++;
			}
			// Fertility Ritual
			if(flags["UVGR_SAVICITE_IDOL"] != undefined)
			{
				output2("\n<b><u>Milodan Ritual</u></b>");
				output2("\n<b>* Status:</b> Seen ritual");
				switch(flags["UVGR_SAVICITE_IDOL"])
				{
					case -1: output2(", Did not take idol"); break;
					case 1: output2(", Took idol"); break;
				}
				sideCount++;
			}
			// Mrs. Reasner
			if(flags["BEA_QUEST"] != undefined)
			{
				output2("\n<b><u>Refueling the <i>S.S. Inexorable</i></u></b>");
				output2("\n<b>* Status:</b>");
				switch(flags["BEA_QUEST"])
				{
					case 1: output2(" Volunteered to help attain savicite,"); break;
					case 2: output2(" Volunteered, Received scarf for savicite,"); break;
					case 3: output2(" Volunteered, Received scarf, Sold enough savicite,"); break;
					case 4: output2(" Volunteered, Received scarf, Sold savicite, Received coin,"); break;
				}
				if(flags["BEA_QUEST"] >= 4) output2(" Completed");
				else output2(" <i>In progress...</i>");
				if(flags["BEA_SAVCOUNT"] != undefined) output2("\n<b>* Savicite Sold to " + flags["BEA_TITLE"] + ", Total:</b> " + flags["BEA_SAVCOUNT"]);
				sideCount++;
			}
			// Tuuva Expedition
			if(flags["TUUVA_50AFF"] != undefined)
			{
				output2("\n<b><u>Tuuva’s Expedition</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["TUUVA_SAVED"] == undefined || flags["TUUVA_SAVED"] < 1)
				{
					output2(" Active");
					if(flags["TUUVA_SAVED"] < 1) output2(" Tuuva lost, <i>Find Tuuva!</i>");
					output2("\n<b>* Duration:</b> " + prettifyMinutes(GetGameTimestamp() - flags["TUUVA_50AFF"]));
				}
				else
				{
					output2(" Saved Tuuva");
					if(flags["TUUVA_SAVED"] >= 2) output2(", Completed");
				}
				sideCount++;
			}
			//Syri Quest
			if(flags["SYRIQUEST_STATE"] != undefined)
			{
				output2("\n<b><u>SyriQuest</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["SYRIQUEST_STATE"] == -1) output2(" Refused");
				else if(flags["SYRIQUEST_STATE"] == 0) output2(" <i>Syri possibly fired from Pyrite job?</i>");
				else if(flags["SYRIQUEST_STATE"] >= 3) output2(" Accepted");
				else output2(" <i>In progress...</i>");
				if(flags["SYRIQUEST_STATE"] == 21) output2(", Killed Valden, Lied to Syri");
				if(flags["SYRIQUEST_STATE"] == 22) output2(", Killed Valden, Told Syri");
				if(flags["SYRIQUEST_STATE"] == 23) output2(", Freed Valden");
				if(flags["SYRIQUEST_STATE"] >= 21) output2(", Completed");
				if(flags["SYRIQUEST_LOCK_BYPASS"] != undefined)
				{
					output2("\n<b>* Cargo Hovercraft:</b>");
					switch(flags["SYRIQUEST_LOCK_BYPASS"])
					{
						case -1: output2(" Failed to open locks"); break;
						case 1: output2(" Bypassed locks to sneak inside"); break;
						case 2: output2(" Used stealth generator to sneak inside"); break;
					}
				}
				if(flags["SYRIQUEST_SYRI_ONAHOLE"] != undefined)
				{
					output2("\n<b>* Living Onahole:</b> Taken");
					if(flags["SYRIQUEST_SYRI_ONAHOLE"] == 2) output2(", Given to Syri");
				}
				if(flags["MET_SCHORA"] != undefined)
				{
					var schoraName:String = "";
					if(flags["MET_SCHORA"] > 3 || flags["SYRIQUEST_STATE"] >= 21)
					{
						schoraName += (flags["SYRIQUEST_LOCK_BYPASS"] >= 1 ? "Commander" : "Alyru") + " Schora";
					}
					else
					{
						schoraName += "Horned Woman";
						if(flags["MET_SCHORA"] > 1 || flags["SYRIQUEST_LOCK_BYPASS"] >= 1) schoraName += " Commander";
					}
					output2("\n<b>* " + schoraName + ":</b>");
					switch(flags["MET_SCHORA"])
					{
						case 1: output2(" Seen her"); break;
						case 2: output2(" Watched her"); break;
						case 3: output2(" Met her"); break;
						case 4: output2(" Met her, Sexed her nicely"); break;
						case 5: output2(" Met her, Sexed her roughly"); break;
					}
				}
				if(flags["MET_TORRA"] != undefined)
				{
					output2("\n<b>* Researcher:</b> Met and sexed her");
				}
				if(flags["SYRIQUEST_STATE"] >= 8)
				{
					output2("\n<b>* Dr. Calnor:</b> Met him");
				}
				if(flags["SYRIQUEST_STATE"] >= 10)
				{
					output2("\n<b>* Valden:</b> Met him");
					if(flags["SYRIQUEST_STATE"] == 21) output2(", Killed him");
					if(flags["SYRIQUEST_STATE"] == 22) output2(", Killed him");
					if(flags["SYRIQUEST_STATE"] == 23) output2(", Freed him");
					if(flags["SYRIQUEST_VALDEN_BODY_CHOICE"] != undefined)
					{
						output2(", He took ");
						switch(flags["SYRIQUEST_VALDEN_BODY_CHOICE"])
						{
							case 1: output2("Dr. Calnor’s body"); break;
							case 2: output2("the body of your Bimbo Siegwulfe " + flags["SYRIQUEST_SIEGWULFE_NAME"]); break;
							case 3: output2("the body of your Siegwulfe " + flags["SYRIQUEST_SIEGWULFE_NAME"]); break;
						}
					}
				}
				sideCount++;
			}
			if(flags["WARGII_PROGRESS"] != undefined || flags["WARGII_SETUP"] != undefined)
			{
				output2("\n<b><u>Warg’ii Hold</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["WARGII_PROGRESS"] != undefined)
				{
					output2(" Talked to Ula");
					if(flags["WARGII_PROGRESS"] <= -1) output2(", Refused to help");
					if(flags["WARGII_ULA_PROMISED"] != undefined) output2(", Agreed to help");
					if(flags["WARGII_PROGRESS"] <= -2) output2(", Korg’ii Hold overthrown, Failed");
					else if(flags["WARGII_PROGRESS"] >= 3)
					{
						output2(", Saved Korg’ii Hold");
						if(flags["WARGII_MILO_SOLUTION"] != undefined)
						{
							switch(flags["WARGII_MILO_SOLUTION"])
							{
								case 0: output2(", Released milodan"); break;
								case 1: output2(", Enslaved milodan"); break;
								case 2: output2(", Temporarily imprisoned milodan"); break;
							}
						}
						output2(", Completed");
					}
					else if(flags["WARGII_PROGRESS"] == 2) output2(", <i>In progress...</i>");
					output2("\n<b>* Influence:</b> " + wargiiScore() + " %");
					if(flags["WARGII_FIGHTS_RAN"] != undefined) output2("\n<b>* Combat, Retreats, Total:</b> " + flags["WARGII_FIGHTS_RAN"]);
					if(flags["WARGII_FIGHTS_WON"] != undefined) output2("\n<b>* Combat, Victories, Total:</b> " + flags["WARGII_FIGHTS_WON"]);
					if(flags["WARGII_HEIDRUN_SAVED"] != undefined) output2("\n<b>* " + (flags["MET_HEIDRUN"] == undefined ? "Korgonne Merchant" : "Heidrun") + ":</b> Saved Her");
					if(flags["WARGII_NENNE_SAVED"] != undefined) output2("\n<b>* Nenne:</b> Saved Her");
					if(flags["WARGII_LUND_SAVED"] != undefined) output2("\n<b>* " + (flags["MET_LUND"] == undefined ? "Male Korgonne" : "Lund") + ":</b> Saved Him");
					if(flags["WARGII_TUUVA_SAVED"] != undefined) output2("\n<b>* " + (flags["MET_TUUVA"] == undefined ? "Korgonne Blacksmith" : "Tuuva") + ":</b> Saved Her");
					if(flags["WARGII_MAJA_SAVED"] != undefined)
					{
						output2("\n<b>* " + (flags["MET_MAJA"] == undefined ? "Korgonne Beast Tamer" : "Maja") + ":</b> Saved Her");
						if(flags["WARGII_MAJA_SAVED"] >= 2) output2(", Saved her animals");
					}					
					if(flags["WARGII_KIONA_SAVED"] != undefined) output2("\n<b>* " + (flags["KIONA_MET"] == undefined ? "Korgonne Jeweler" : "Kiona") + ":</b> Saved Her");
				}
				else output2("<i>Talk to Ula!</i>");
				sideCount++;
			}
		}
		
		if(showID == "Canadia" || showID == "All")
		{
			// Kiro Picardine Quest (Requires Kiro!)
			if(flags["KIRO_KALLY_PICARDINE_QUEST"] != undefined && flags["RESCUE KIRO FROM BLUEBALLS"] == 1)
			{
				output2("\n<b><u>Kally’s Picardine</u></b>");
				output2("\n<b>* Status:</b>");
				switch(flags["KIRO_KALLY_PICARDINE_QUEST"])
				{
					case 0:
						output2(" Know about it");
						if(roamingKiroAvailable()) output2(", <i>Maybe ask Kiro about it...?</i>");
						break;
					case 1:
					case 2:
						output2(" Know of it, Asked Kiro");
						if(!pc.hasStatusEffect("KallyKiro")) output2(", <i>Perhaps " + (flags["KIRO_KALLY_PICARDINE_QUEST"] == 1 ? "tell Kally the truth...?" : "Kally will love to know...") + "</i>");
						else 
						{
							output2(", Told Kally truth");
							if(pc.hasStatusEffect("Wait For Kally Break")) output2(", <i>Wait for Kally’s response to Kiro...</i>");
							else output2(", <i>Has Kally responded to Kiro yet...?</i>");
						}
						break;
					case -1: output2(" Know of it, Asked Kiro, Agreed to not reveal it to Kally"); break;
					case -2: output2(" Know of it, Asked Kiro, Told Kally truth, Kally keeps it a secret from Kiro"); break;
					case 3:
						output2(" Know of it, Asked Kiro, Told Kally truth");
						if(flags["KALLY_KISSED_KIRO"] == undefined) output2(", Kally thanked Kiro");
						else output2(", Kally thanked and kissed Kiro");
						break;
					default: output2(" <i>Unknown</i>"); break;
				}
				if(InCollection(flags["KIRO_KALLY_PICARDINE_QUEST"], [3, -1, -2])) output2(", Completed");
				sideCount++;
			}
		}
		
		if(showID == "Poe A" || showID == "All")
		{
			// The Masque
			if(flags["HOLIDAY_OWEEN_ACTIVATED"] != undefined)
			{
				output2("\n<b><u>The Masque</u></b>");
				output2("\n<b>* Status:</b>");
				// Holiday Hallowieners!
				if(flags["POE_A_DISABLED"] != undefined)
				{
					if(flags["HOLIDAY_OWEEN_LEFT"] != undefined) output2(" Obtained a sabotaged mask from Holiday, Left the party,");
					if(flags["HOLIDAY_OWEEN_PURCHASE"] != undefined)
					{
						if(flags["HOLIDAY_OWEEN_PURCHASE"] == "black cat costume") output2(" Purloined");
						else output2(" Purchased");
						output2(" " + indefiniteArticle(flags["HOLIDAY_OWEEN_PURCHASE"]) + " from Holiday, Celebrated at the party,");
					}
					output2(" Completed");
				}
				else
				{
					output2(" Invite received from ‘Wet & Waiting’");
					if(isHalloweenish()) output2(", <i>In progress...</i>");
					else output2(", <i>Out of season...</i>");
				}
				sideCount++;
			}
		}

		// Nothing recorded
		if(sideCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No side mission data has been logged");
			if(showID != "All") output2(" at this location");
			output2(".</i>");
		}
	}
	
	// Other/Misc Info
	if(showID == "Other" || showID == "All")
	{
		// Distress Calls:
		output2("\n\n" + blockHeader("Distress Calls", false));
		var distressCount:int = 0;
		
		// Operation: Space Phoenix Down
		if(flags["FALL OF THE PHOENIX STATUS"] != undefined)
		{
			output2("\n<b><u>Fall of the Phoenix</u></b>");
			output2("\n<b>* Status:</b>");
			if(flags["FALL OF THE PHOENIX DEFEATED PIRATES"] != undefined)
			{
				if(flags["FALL OF THE PHOENIX DEFEATED PIRATES"] == 1) output2(" Defeated pirates");
				else if(flags["FALL OF THE PHOENIX DEFEATED PIRATES"] == -1) output2(" Lost to pirates");
				if(flags["FALL OF THE PHOENIX TAKEN SHIELD"] != undefined) output2(", Looted ship");
				if(flags["FALL OF THE PHOENIX ENGINEERING STATUS"] != 1) output2(", Engines need starting");
				else if(flags["FALL OF THE PHOENIX ENGINEERING STATUS"] == 1) output2(", Started engines");
				else if(flags["FALL OF THE PHOENIX STATUS"] == -1) output2(", Failed to save ship");
				if(flags["FALL OF THE PHOENIX STATUS"] >= 1) output2(", Saved Captain Saendra, Completed");
			}
			else if(flags["FALL OF THE PHOENIX STATUS"] == -1) output2(" Ignored call");
			else output2(" <i>In progress...</i>");
			if(flags["SAEN MET AT THE BAR"] != undefined)
			{
				output2("\n<b><u>Phoenix Rising</u></b>");
				output2("\n<b>* The <i>Phoenix</i>, Status:</b>");
				if(flags["SAENDRA PHOENIX AVAILABLE"] == undefined) output2(" Locked");
				else output2(" Unlocked");
				if(flags["SAENDRA_XPACK1_CREDITTIME"] != undefined && GetGameTimestamp() >= (flags["SAENDRA_XPACK1_CREDITTIME"] + (24 * 60))) output2(", Fully Repaired");
				else if(flags["SAENDRA_XPACK1_STATUS"] > 1) output2(", Repaired (more or less)");
				else
				{
					output2(", Undergoing repairs");
					if(flags["SAENDRA PHOENIX STATUS TIMES"] != undefined)
					{
						output2(", Status checked");
						if(flags["SAENDRA PHOENIX STATUS TIMES"] != 1) output2(" " + num2Text(flags["SAENDRA PHOENIX STATUS TIMES"]) + " times");
					}
				}
			}
			distressCount++;
		}
		// Operation: Saendra XPack1
		if(flags["SAENDRA_XPACK1_STATUS"] != undefined)
		{
			output2("\n<b><u>Fools Rush In</u></b>");
			output2("\n<b>* Status:</b>");
			if(flags["SAENDRA_XPACK1_STATUS"] <= 1)
			{
				output2(" Received message, Get to Tavros elevator");
				if(flags["SAENDRA_XPACK1_TIMER"] != undefined) output2("\n<b>* Time Left to Respond:</b> " + prettifyMinutes((flags["SAENDRA_XPACK1_TIMER"] + (6 * 60)) - GetGameTimestamp()));
			}
			if(flags["SAENDRA_XPACK1_STATUS"] == 2) output2(" Received message, Time to respond expired!");
			if(flags["SAENDRA_XPACK1_STATUS"] == 3)
			{
				output2(" Received message, Did not respond in time");
				if(flags["SAENDRA_DISABLED"] != undefined) output2(", Saendra missing");
			}
			if(flags["SAENDRA_XPACK1_STATUS"] == 4) output2(" Received message, Responded on time, <i>Exploring...</i>");
			if(flags["SAENDRA_XPACK1_STATUS"] == 5)
			{
				output2(" Responded, Cleared Deck 92");
				if(flags["SAENDRA_XPACK1_TIMER"] != undefined) output2("\n<b>* Time Left to Rescue Hostage:</b> " + prettifyMinutes((flags["SAENDRA_XPACK1_TIMER"] + (7 * 24 * 60)) - GetGameTimestamp()));
			}
			if(flags["SAENDRA_XPACK1_STATUS"] == 6) output2(" Responded, Cleared Deck 92, Rescue time expired");
			if(flags["SAENDRA_XPACK1_STATUS"] == 7) output2(" Responded, Cleared Deck 92, <i>Rescue in progress...</i>");
			if(flags["SAENDRA_XPACK1_STATUS"] == 8)
			{
				output2(" Responded, Cleared Deck 92, Lost to guards, Failed to rescue hostage");
				if(flags["SAENDRA_DISABLED"] != undefined) output2(", Saendra captured");
			}
			if(flags["SAENDRA_XPACK1_STATUS"] == 9 || flags["SAENDRA_XPACK1_STATUS"] == 10)
			{
				output2(" Responded, Cleared Deck 92, Cleared Anon’s board, Rescued Peter");
				if(flags["SAENDRA_XPACK1_STATUS"] == 10) output2(", Released the <i>Phoenix</i>, Completed");
			}
			if(flags["SAENDRA_XPACK1_STATUS"] == 11)
			{
				output2(" Responded, Cleared Deck 92, Rescue time expired, Peter died");
				if(flags["SAENDRA_XPACK1_CREDITOFFER"] == 2) output2(", Paid for the <i>Phoenix</i>, Completed");
			}
			
			if(flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] != undefined)
			{
				output2("\n<b>* Pirate, Merc Guard:</b>");
				if(flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] == 0) output2(" Active");
				if(flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] == 1) output2(" Defeated him using " + (flags["ZIL_CALLGIRL_NAME_KNOWN"] == undefined ? "call girl" : "Zheniya"));
				if(flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] == 2) output2(" Defeated him using Saendra’s tits!");
				if(flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] == 3) output2(" Defeated him in combat");
			}
			if(flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] != undefined)
			{
				output2("\n<b>* Pirate, Techie Guard:</b>");
				if(flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == 0) output2(" Active");
				if(flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == 1) output2(" Defeated her using " + (flags["ZIL_CALLGIRL_NAME_KNOWN"] == undefined ? "call girl" : "Zheniya"));
				if(flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == 2) output2(" Defeated her using holo burn");
				if(flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == 3) output2(" Defeated her in combat");
				if(flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == 4) output2(" Lost against her in combat");
			}
			if(flags["SAENDRA_XPACK1_STATUS"] == 10) output2("\n<b>* Pirate, Mirian Bragga:</b> Know of her <i>(Connected with Saendra’s past)</i>");
			if(flags["SAENDRA_XPACK1_ASKEDSAEN"] != undefined)
			{
				output2("\n<b>* Saendra:</b> Asked her for help");
				if(flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] == 2) output2(", She distracted a guard");
			}
			if(flags["SAENDRA_XPACK1_ASKEDVAL"] != undefined)
			{
				output2("\n<b>* Valeria:</b> Asked her for help");
				if(flags["SAENDRA_XPACK1_ASKEDVAL"] == 2) output2(", Couldn’t hack security");
			}
			distressCount++;
		}
		// Operation: Spooky Aliens
		if(flags["KASHIMA_STATE"] != undefined)
		{
			output2("\n<b><u>The Kashima Incident</u></b>");
			output2("\n<b>* Status:</b>");
			if(flags["KASHIMA_STATE"] == -1) output2(" Ignored call");
			if(flags["KASHIMA_STATE"] > 0)
			{
				output2(" Responded");
				if(flags["KASHIMA_STATE"] < 2) output2(", <i>In progress...</i>");
			}
			if(flags["KASHIMA_STATE"] == 2) output2(", Crew saved, Neutralized parasite, Rewarded, Completed");
			if(flags["KASHIMA_STATE"] == 3) output2(", Crew saved, Saved parasite, Rewarded, Completed");
			if(flags["KASHIMA_STATE"] == 4) output2(", Escaped <i>Kashima</i>, Reported incident, Completed");
			if(flags["KI_P16_FAILURES"] != undefined || flags["KI_P16_UNLOCKED"] != undefined)
			{
				output2("\n<b>* <i>Kashima</i>, Captain’s Ready Room:</b>");
				if(flags["KI_P16_FAILURES"] != undefined)
				{
					output2(" Failed to hack door");
					if(flags["KI_P16_FAILURES"] == 2) output2(" twice");
					if(flags["KI_P16_FAILURES"] > 2) output2(" " + flags["KI_P16_FAILURES"] + " times");
				}
				if(flags["KI_P16_UNLOCKED"] != undefined)
				{
					if(flags["KI_P16_FAILURES"] != undefined) output2(",");
					output2(" Door unlocked");
				}
				if(flags["KI_TAKEN_SWORD"] != undefined) output2(", Looted room");
			}
			if(flags["KI_MEDBAY_SLEEPS"] != undefined)
			{
				output2("\n<b>* <i>Kashima</i>, Medical Bay:</b>");
				if(flags["KI_MEDBAY_SLEEPS"] != undefined)
				{
					output2(" Slept in room");
					if(flags["KI_MEDBAY_SLEEPS"] == 2) output2(" twice");
					if(flags["KI_MEDBAY_SLEEPS"] > 2) output2(" " + flags["KI_MEDBAY_SLEEPS"] + " times");
				}
			}
			if(flags["KIE5_SEARCHED"] != undefined)
			{
				output2("\n<b>* <i>Kashima</i>, Chief Engineer’s Quarters:</b>");
				if(flags["KIE5_SEARCHED"] != undefined) output2(" Looted room");
			}
			if(flags["KII3_SAFECRACK_FAILS"] != undefined || flags["KII3_CRACKED"] != undefined)
			{
				output2("\n<b>* <i>Kashima</i>, Science Quarters:</b>");
				if(flags["KII3_SAFECRACK_FAILS"] != undefined)
				{
					output2(" Failed to open safe");
					if(flags["KII3_SAFECRACK_FAILS"] == 2) output2(" twice");
					if(flags["KII3_SAFECRACK_FAILS"] > 2) output2(" " + flags["KII3_SAFECRACK_FAILS"] + " times");
				}
				if(flags["KII3_CRACKED"] != undefined)
				{
					if(flags["KII3_SAFECRACK_FAILS"] != undefined) output2(",");
					if(flags["KII3_CRACKED"] == -1) output2(" Safe locked permanently");
					if(flags["KII3_CRACKED"] == 1) output2(" Safe unlocked and looted");
				}
			}
			if(flags["KI_CMO_MEDSUPPLIES"] != undefined)
			{
				output2("\n<b>* <i>Kashima</i>, Chief Medical Officer’s Quarters:</b>");
				if(flags["KI_CMO_MEDSUPPLIES"] != undefined) output2(" Looted medical supplies");
				if(flags["KI_CMO_MEDSUPPLIES"] >= 2) output2(", Used stim booster");
			}
			// Master Chief
			var sNeykkarName:String = ("Chief" + ((flags["KASHIMA_BRIDGE"] == 1 || flags["KASHIMA_BRIDGE"] == 2) ? " Ushamee" : "") + " Neykkar");
			output2("\n<b>* " + sNeykkarName + ":</b> Met her");
			if(flags["KASHIMA_STATE"] < 2)
			{
				output2("\n<b>* " + sNeykkarName + ", Status:</b>");
				if(flags["CHIEF_NEYKKAR_WITH_PC"] == 1) output2(" At your side");
				else if(flags["CHIEF_NEYKKAR_WITH_PC"] == 2) output2(" Left behind");
				else output2(" <i>Unknown</i>");
			}
			if(flags["FUCKED_CHIEF_NEYKKAR"] != undefined) output2("\n<b>* " + sNeykkarName + ", Times Sexed:</b> " + flags["FUCKED_CHIEF_NEYKKAR"]);
			// The Captain
			if(flags["KASHIMA_HOLMES_DEFEATED"] != undefined) output2("\n<b>* Captain Holmes:</b> Defeated him");
			// Doctor, doctor! Elenora
			if(flags["KI_VANDERBILT_MET"] != undefined)
			{
				output2("\n<b>* Doctor Elenora Vanderbilt:</b> Met her");
				if(flags["KI_VANDERBILTS_SECRET"] != undefined) output2(", Know of her secret");
				if(flags["KI_VANDERBILTS_SECRET"] >= 2) output2(", Sexed her");
				if(flags["KI_VANDERBILT_WORKING_START"] != undefined && (flags["KASHIMA_STATE"] > 0 && flags["KASHIMA_STATE"] < 4))
				{
					output2("\n<b>* Doctor Elenora Vanderbilt, Cure, Status:</b>");
					if(flags["KI_VANDERBILT_WORKING_START"] + 240 > GetGameTimestamp()) output2(" <i>Working...</i> " + prettifyMinutes((flags["KI_VANDERBILT_WORKING_START"] + 240) - GetGameTimestamp()) + " until completion");
					else output2(" Created, Completed");
					if(flags["KI_CURE_USED"] != undefined) output2(", Used");
				}
			}
			distressCount++;
		}
		// Operation: Tanuki Problems #69
		if(flags["RESCUE KIRO FROM BLUEBALLS"] != undefined)
		{
			if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1 || flags["RESCUE KIRO TECHSPEC MACHINE FIX"] != undefined || flags["KIRO_FUCKED_DURING_RESCUE"] != undefined) output2("\n<b><u>Rescue Kiro from Blueballs</u></b>");
			else output2("\n<b><u>A Leaf-Shaped Ship</u></b>");
			output2("\n<b>* Status:</b>");
			// Did you fix it?
			if(flags["RESCUE KIRO TECHSPEC MACHINE FIX"] == -1) output2(" Failed to fix machine,");
			else if(flags["RESCUE KIRO TECHSPEC MACHINE FIX"] == 1) output2(" Fixed machine,");
			// Did you save her?
			if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1)
			{
				output2(" Saved Kiro");
				if(flags["KIRO_FUCKED_DURING_RESCUE"] != undefined) output2(", Fucked Kiro during rescue");
			}
			else if(flags["RESCUE KIRO FROM BLUEBALLS"] == -1)
			{
				if(flags["RESCUE KIRO TOOK CUTLASS"] != undefined || flags["RESCUE KIRO TOOK PISTOL"] != undefined || flags["RESCUE KIRO TECHSPEC MACHINE FIX"] != undefined || flags["RESCUE KIRO WAITED TO BOARD"] != undefined) output2(" Refused to rescue");
				else output2(" Ignored call");
			}
			else output2(" <i>In progress</i>");
			// Rewards or Loot?
			if(flags["RESCUE KIRO TOOK CUTLASS"] != undefined || flags["RESCUE KIRO TOOK PISTOL"] != undefined) output2(", Looted ship");
			if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1 && flags["RESCUE KIRO TOOK CUTLASS"] == undefined && flags["RESCUE KIRO TOOK PISTOL"] == undefined) output2(", Rewarded");
			distressCount++;
		}
		// Operation: Snowballs the Cat
		if(flags["ICEQUEEN COMPLETE"] != undefined || flags["DO UVETO ICEQUEEN ENTRY"] != undefined)
		{
			output2("\n<b><u>Ice Queen</u></b>");
			output2("\n<b>* Status:</b>");
			if(flags["ICEQUEEN COMPLETE"] == -1) output2(" Ignored call");
			if(flags["ICEQUEEN COMPLETE"] == -2) output2(" Refused to help Zaalt");
			if(flags["ICEQUEEN COMPLETE"] == -3) output2(" Lost to Zaalt");
			if(flags["ICEQUEEN COMPLETE"] > 0) output2(" Defeated Zaalt");
			if(flags["ICEQUEEN COMPLETE"] == 1) output2(" and killed him, Retrieved A.I. Cores");
			if(flags["ICEQUEEN COMPLETE"] == 2) output2(" and arrested him, Retrieved A.I. Cores");
			if(flags["ICEQUEEN COMPLETE"] == 3)
			{
				output2(" and helped him");
				if(flags["ICEQUEEN KARA STUFF"] == 1) output2(", Met Kara, Rewarded 10000 credits");
				if(flags["ICEQUEEN KARA STUFF"] == 2) output2(", Interrupted Kara, Rewarded 8000 credits");
				if(flags["ICEQUEEN KARA STUFF"] == 3) output2(", Rewarded with sex from Kara");
				if(flags["ICEQUEEN KARA STUFF"] == 4) output2(", Interrupted Kara, Retrieved Psi implant");
			}
			if(flags["ICEQUEEN COMPLETE"] > 0) output2(", Completed");
			else if(flags["ICEQUEEN COMPLETE"] <= -3) output2(", Failed");
			else if(flags["ICEQUEEN COMPLETE"] == undefined) output2(" Accepted, <i>In progress...</i>");
			output2("\n<b>* Captain Zaalt Kandar:</b>");
			if(flags["ICEQUEEN COMPLETE"] == -1) output2(" Seen him");
			else output2(" Met him");
			if(flags["ZAALT FLIRTED"] != undefined) output2(", Flirted with");
			if(flags["ZAALT DISARMED"] != undefined) output2(", Disarmed");
			if(flags["ZAALT_DISABLED"] != undefined) output2(", <i>Whereabouts unknown</i>");
			distressCount++;
		}
		
		// Nothing recorded
		if(distressCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No distress call data has been logged.</i>");
		}
		
		// Other:
		output2("\n\n" + blockHeader("Miscellaneous", false));
		var otherCount:int = 0;
		
		// Event Whorizon
		if(flags["EVENT_WHORIZON_STATE"] != undefined)
		{
			output2("\n<b><u>Event Whorizon</u></b>");
			output2("\n<b>* Status:</b>");
			if(flags["EVENT_WHORIZON_STATE"] == -1) output2(" Avoided the anomaly");
			else
			{
				output2(" Entered the anomaly");
				if(flags["EVENT_WHORIZON_STATE"] >= 2) output2(", Investigated, Completed");
				else output2(", <i>Investigating...</i>");
			}
			if(flags["EVENT_WHORIZON_TENTACLE_GARDEN"] != undefined)
			{
				if(flags["EVENT_WHORIZON_TENTACLE_GARDEN"] <= -1) output2("\n<b>* Tentacle Garden, Monster:</b> Lost against it in combat");
				if(flags["EVENT_WHORIZON_TENTACLE_GARDEN"] >= 1) output2("\n<b>* Tentacle Garden, Monster:</b> Defeated it");
				if(flags["EVENT_WHORIZON_TENTACLE_GARDEN"] >= 2) output2("\n<b>* Tentacle Garden, Gardener:</b> Defeated her");
			}
			if(flags["EVENT_WHORIZON_TORMENT_CAGES"] != undefined)
			{
				output2("\n<b>* Torment Cages:</b>");
				if(flags["EVENT_WHORIZON_TORMENT_CAGES"] == -1) output2(" Left rusher");
				if(flags["EVENT_WHORIZON_TORMENT_CAGES"] == 1) output2(" Saved rusher");
			}
			if(flags["EVENT_WHORIZON_FUCK_PRISON"] != undefined) output2("\n<b>* The Fuck Prison, Succubus:</b> Met her");
			if(flags["EVENT_WHORIZON_BONDAGE_PALACE"] != undefined || flags["EVENT_WHORIZON_DEMONSYRI_TALK"] != undefined || flags["EVENT_WHORIZON_FUCKED_DEMONSYRI"] != undefined || flags["EVENT_WHORIZON_DEMONSYRI_LOOKAROUND"] != undefined)
			{
				output2("\n<b>* The Bondage Palace, Demon Queen Syri:</b> Met her");
				if(flags["EVENT_WHORIZON_FUCKED_DEMONSYRI"] != undefined) output2(", Sexed her");
			}
			otherCount++;
		}
		// Puppyslutmas
		if(flags["PUPPYSLUTMAS_2014"] != undefined)
		{
			if(silly) output2("\n<b><u>Puppyslutmas</u></b>");
			else output2("\n<b><u>Dorna Christmas Gala</u></b>");
			output2("\n<b>* Date:</b> " + flags["PUPPYSLUTMAS_2014"]);
			if(flags["PUPPYSLUTMAS_2014"] == "Syri" && flags["PUPPYSLUTMAS_2014_SYRI_CLOTHES"] != undefined) output2(" wearing " + indefiniteArticle(flags["PUPPYSLUTMAS_2014_SYRI_CLOTHES"]));
			output2(", Completed");
			if(flags["PUPPYSLUTMAS_2014_DRINKS"] != undefined)
			{
				output2("\n<b>* Drinks Total:</b> " + flags["PUPPYSLUTMAS_2014_DRINKS"]);
				if(flags["PUPPYSLUTMAS_2014_DRINKS"] >= 4) output2(", Smashed");
				else if(flags["PUPPYSLUTMAS_2014_DRINKS"] >= 2) output2(", Drunk");
				else if(flags["PUPPYSLUTMAS_2014_DRINKS"] >= 1) output2(", Buzzed");
				else output2(", Sober");
			}
			otherCount++;
		}
		// Spess Bear
		if(flags["SPACE_BEAR"] != undefined)
		{
			output2("\n<b><u>Space Bear</u></b>");
			output2("\n<b>* Status:</b>");
			switch(flags["SPACE_BEAR"])
			{
				case 0:
					output2(" Found, Onboard ship");
					if(shipLocation == "TAVROS HANGAR") output2(", Sent to museum, <i>Awaiting appraisal...</i>");
					else output2(", <i>Sell it to a museum</i>");
					break;
				case 1: output2(" Found, Sold to museum, Rewarded 10000 credits, Completed"); break;
			}
			otherCount++;
		}
		
		// Nothing recorded
		if(otherCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No other miscellaneous data has been logged.</i>");
		}
	}
	
	output2("\n\n");
}


// Displays the Captain's encounter log.
public function displayEncounterLog(showID:String = "All"):void
{
	clearOutput2();
	clearGhostMenu();
	addGhostButton(14, "Back", statisticsScreen, flags["TOGGLE_MENU_STATS"]);
	
	// Generate buttons and headers (if necessary)
	flags["TOGGLE_MENU_LOG"] = showID;
	questLogMenu(displayEncounterLog);
	
	if(showID == "All" || showID == "Other") output2(header("<u>Encounter Log:</u>", false));
	var i:int = 0;
	
	// Locational Info
	if(showID != "Other" || showID == "All")
	{
		// Various Encounters:
		output2("\n\n" + blockHeader("Various Encounters", false));
		var variousCount:int = 0;
		
		if(showID == "Tavros" || showID == "All")
		{
			// Hangar stuff
			if(flags["RECRUITED_CELISE"] > 0 || flags["MET_VAHN"] != undefined)
			{
				output2("\n<b><u>Hangar Bay</u></b>");
				// Slimeyface
				if(flags["RECRUITED_CELISE"] > 0)
				{
					output2("\n<b>* Celise:</b> Met her");
					if(flags["GIGACELISE"] == 1)output2(", Gigaform");
					output2(", Crew member");
					if(celiseIsCrew()) output2(" (Onboard Ship)");
					else if(flags["CELISE_ONBOARD"] == undefined) output2(" (At Tavros Station)");
					if(flags["BUBBLED_CELISE"] != undefined) output2("\n<b>* Celise, Times Given Cum Bubble:</b> " + flags["BUBBLED_CELISE"]);
					if(flags["TIMES_CELISE_IN_BALLS"] != undefined)
					{
						output2("\n<b>* Celise, Times She’s Stimulated " + (silly ? "Your Internal Testicular Fortitude" : "the Inside of Your Balls") + ":</b> " + flags["TIMES_CELISE_IN_BALLS"]);
					}
					if(flags["LACTATION_FED_CELISE"] != undefined) output2("\n<b>* Celise, Times Breast-Fed Her:</b> " + flags["LACTATION_FED_CELISE"]);
					if(flags["KIRO_CELISE_3SOME"] != undefined) output2("\n<b>* Celise, Times Sexed with Kiro:</b> " + flags["KIRO_CELISE_3SOME"]);
					if(flags["CELISE_ROOMBA_GOO"] != undefined) output2("\n<b>* Celise, Times Seen Cleaning Ship:</b> " + flags["CELISE_ROOMBA_GOO"]);
				}
				// Vahn
				if(flags["MET_VAHN"] != undefined)
				{
					output2("\n<b>* Vahn:</b> Met him");
					if(flags["SEXED_VAHN"] != undefined)
					{
						output2(", Sexed him");
						if(flags["FUCKED_VAHNS_ASS"] != undefined) output2(", Fucked his ass");
						if(flags["HANDIED_VAHN"] != undefined) output2(", Gave him a handjob");
					}
				}
				variousCount++;
			}
			// Merch Deck
			if(flags["MET_GIL"] != undefined || flags["MET_RIYA"] != undefined || flags["RIYA_PUNCHED"] != undefined || flags["VELTA_MET"] != undefined)
			{
				output2("\n<b><u>Merchant Deck</u></b>");
				if(flags["MET_GIL"] != undefined)
				{
					output2("\n<b>* Gil:</b> Met him");
					if(flags["GIL_DOSES"] != undefined) output2("\n<b>* Gil, Times You Gave Him Pupper Poppers:</b> " + flags["GIL_DOSES"]);
					if(flags["GIL_PUSS_FUCKED"] != undefined) output2("\n<b>* Gil, Times You Fucked " + (silly ? "Him Right in the Pussy" : "His Pussy") + ":</b> " + flags["GIL_PUSS_FUCKED"]);
				}
				if(flags["MET_RIYA"] != undefined || flags["RIYA_PUNCHED"] != undefined)
				{
					output2("\n<b>* Riya:</b> Met her");
					if(flags["RIYA_PUNCHED"] != undefined) output2(", Punched her");
					if(flags["RIYA_REPORTED"] != undefined)
					{
						output2(", Reported her");
						if(flags["RIYA_REPORTED"] == 2) output2(" and snapped at Commander Lorna Grence");
					}
					if(flags["RIYA_RELOCATED"] != undefined) output2(", Relocated to " + (flags["RIYA_RELOCATED"] == 1 ? "Canadia Station" : "Tavros Station"));
					if(flags["RIYA_FUCKED_YA"] != undefined) output2("\n<b>* Riya, Times She Fucked Your Ass:</b> " + flags["RIYA_FUCKED_YA"]);
					if(flags["RIYA_CUNTPOUNDED_YOU"] != undefined) output2("\n<b>* Riya, Times She Fucked Your Vagina:</b> " + flags["RIYA_CUNTPOUNDED_YOU"]);
					if(flags["RIYA_GOT_BLOWN"] != undefined) output2("\n<b>* Riya, Times You Sucked Her Cock:</b> " + flags["RIYA_GOT_BLOWN"]);
				}
				if(flags["VELTA_MET"] != undefined)
				{
					output2("\n<b>* Velta:</b> Met her");
					if(flags["VELTA_FUCK_VAG"] != undefined) output2("\n<b>* Velta, Times You Fucked Her Vagina:</b> " + flags["VELTA_FUCK_VAG"]);
					if(flags["VELTA_FUCK_ANAL"] != undefined) output2("\n<b>* Velta, Times You Fucked Her Ass:</b> " + flags["VELTA_FUCK_ANAL"]);
				}
				variousCount++;
			}
			// Anon's Bar!
			if(flags["MET_ALEX"] != undefined || flags["SEEN_SELLESY"] != undefined || flags["APPROACHED_SHELLY"] != undefined || flags["RAMIS_MET"] != undefined || flags["SAENDRA_XPACK1_CALLGIRLSTATE"] != undefined || flags["SAENDRA_XPACK1_STATUS"] >= 8 || flags["MET_FADIL"] != undefined)
			{
				output2("\n<b><u>Anon’s Bar and Board</u></b>");
				// Alex
				if(flags["MET_ALEX"] != undefined)
				{
					if(flags["DRANK_WITH_ALEX"] != undefined || flags["FUCKED_ALEX"] != undefined || flags["LAST_MINUTE_ALEX_BACK_OUT"] != undefined) output2("\n<b>* Alex:</b>");
					else output2("\n<b>* Pretty Boy:</b>");
					output2(" Met him");
					if(flags["LEFT_ALEX_REASON"] == 1) output2(", Bailed on him");
					else if(flags["LEFT_ALEX_REASON"] == 2) output2(", Declined his offer to drink together");
					if(flags["DRANK_WITH_ALEX"] != undefined) output2(", Drank with him");
					if(flags["ALEX_CONFESSED"] != undefined) output2(", Learned about his gender");
					if(flags["LAST_MINUTE_ALEX_BACK_OUT"] != undefined) output2(", Bailed on him"); //Should this line be changed somehow?
					if(flags["FUCKED_ALEX"] != undefined) output2("\n<b>* Alex, Times Sexed:</b> " + flags["FUCKED_ALEX"]);
					if(flags["ALEX_DRUNK_SEX"] != undefined) output2("\n<b>* Alex, Times Drunk-Sexed:</b> " + flags["ALEX_DRUNK_SEX"]);
				}
				// Fadil
				if(flags["MET_FADIL"] != undefined)
				{
					output2("\n<b>* Fadil:</b>");
					output2(" Met him");
					if(flags["FADIL_MONEY_GIVEN"] != undefined) output2("\n<b>* Fadil, Total Donation Amount:</b> " + flags["FADIL_MONEY_GIVEN"]);
					if(flags["FADIL_DONATION_DAY"] != undefined) output2("\n<b>* Fadil, Days Since Last Donation:</b> " + (days - flags["FADIL_DONATION_DAY"]));
					if(flags["FADIL_SEXED"] != undefined) output2("\n<b>* Fadil, Times Sexed:</b> " + flags["FADIL_SEXED"]);
				}
				// Ramis!
				if(flags["RAMIS_MET"] != undefined)
				{
					output2("\n<b>* Ramis:</b> Met her");
					if(silly && flags["RAMIS_FIRST_IMPRESSION"] != undefined) output2(" <i>(as " + indefiniteArticle(flags["RAMIS_FIRST_IMPRESSION"]) + ")</i>");
					if(ramisRecruited())
					{
						output2(", Crew member");
						if(ramisIsCrew()) output2(" (Onboard Ship)");
						else if(ramisAtAnons()) output2(" (At Tavros Station)");
						else output2(" (Away)");
					}
					if(StatTracking.getStat("contests/ramis arm wrestle losses") + StatTracking.getStat("contests/ramis arm wrestle wins") > 0) output2("\n<b>* Ramis, Arm Wrestling Contest, Win/Loss Ratio:</b> " + StatTracking.getStat("contests/ramis arm wrestle wins") + "/" + StatTracking.getStat("contests/ramis arm wrestle losses") + ", of " + (StatTracking.getStat("contests/ramis arm wrestle losses") + StatTracking.getStat("contests/ramis arm wrestle wins")) + " games");
					if(flags["RAMIS_TIMES_DRINK"] != undefined) output2("\n<b>* Ramis, Times Had Drinks with Her:</b> " + flags["RAMIS_TIMES_DRINK"]);
					if(flags["RAMIS_TIMES_BENDER"] != undefined) output2("\n<b>* Ramis, Times Had a Hangover with Her:</b> " + flags["RAMIS_TIMES_BENDER"]);
					if(ramisTimesSexed() > 0) output2("\n<b>* Ramis, Times Sexed:</b> " + ramisTimesSexed());
					if(flags["RAMIS_SEXED_MAN"] != undefined) output2("\n<b>* Ramis, Times Fucked Her as a Man:</b> " + flags["RAMIS_SEXED_MAN"]);
					if(flags["RAMIS_SEXED_TRAP"] != undefined) output2("\n<b>* Ramis, Times Fucked Her as a Trap:</b> " + flags["RAMIS_SEXED_TRAP"]);
					if(flags["RAMIS_SEXED_STRAP"] != undefined) output2("\n<b>* Ramis, Times Fucked Her With Hardlight Strap-On:</b> " + flags["RAMIS_SEXED_STRAP"]);
					if(flags["RAMIS_SEXED_FACESIT"] != undefined) output2("\n<b>* Ramis, Times She’s Given You a Handjob While Sitting On Your Face:</b> " + flags["RAMIS_SEXED_FACESIT"]);
					if(flags["RAMIS_SEXED_LAPSIT"] != undefined) output2("\n<b>* Ramis, Times She’s Given You a Handjob On Her Lap:</b> " + flags["RAMIS_SEXED_LAPSIT"]);
					if(flags["RAMIS_SEXED_LICKJOB"] != undefined) output2("\n<b>* Ramis, Times She Sucked Your Tiny Dick:</b> " + flags["RAMIS_SEXED_LICKJOB"]);
				}
				// Sellesy
				if(flags["SEEN_SELLESY"] != undefined)
				{
					if(flags["MET_SELLESY"] != undefined)
					{
						output2("\n<b>* Sellesy:</b> Met her");
						if(flags["SELLESY_HL"] != undefined) output2("\n<b>* Sellesy, Times Fucked Her With Hardlight Strap-On:</b> " + flags["SELLESY_HL"]);
					}
					else output2("\n<b>* Three-Breasted Waitress:</b> Seen her");
				}
				// Shelly
				if(flags["APPROACHED_SHELLY"] != undefined)
				{
					if(flags["KNOW_SHELLYS_NAME"] != undefined) output2("\n<b>* Shelly:</b>");
					else output2("\n<b>* Bunny Woman:</b>");
					if(flags["TALKED_TO_SHELLY"] != undefined) output2(" Met her");
					else output2(" Seen her");
					if(flags["CAME_INSIDE_SHELLY"] != undefined) output2(", Came inside her");
					if(flags["KNOWS_ABOUT_SHELLY_CUM_REACTION"] != undefined) output2(", Semen makes her eggs multiply!");
					if(flags["ASSISTED_SHELLY_WITH_LAYING"] != undefined) output2("\n<b>* Shelly, Times Assisted Her Egg Laying:</b> " + flags["ASSISTED_SHELLY_WITH_LAYING"]);
					if(flags["ASSISTED_SHELLY_WITH_INTENSE_LAYING"] != undefined) output2("\n<b>* Shelly, Intense Egg Laying Sessions, Total:</b> " + flags["ASSISTED_SHELLY_WITH_INTENSE_LAYING"]);
				}
				// Zheniya
				if(flags["SAENDRA_XPACK1_CALLGIRLSTATE"] != undefined || flags["SAENDRA_XPACK1_STATUS"] >= 8)
				{
					var zheniyaName:String = (flags["ZIL_CALLGIRL_NAME_KNOWN"] == undefined ? "Call Girl" : "Zheniya");
					
					output2("\n<b>* " + zheniyaName + ":</b>");
					if(flags["SAENDRA_XPACK1_CALLGIRLSTATE"] == undefined && flags["ZIL_CALLGIRL_SEXED"] == undefined) output2(" Seen her");
					else output2(" Met her");
					if(flags["SAENDRA_XPACK1_CALLGIRLSTATE"] >= 2) output2(", Paid her for sex");
					if(flags["ZIL_CALLGIRL_PREG"] != undefined && flags["ZIL_CALLGIRL_GESTATION"] != undefined) output2("\n<b>* " + zheniyaName + ", Days Pregnant:</b> " + Math.floor(zilCallGirlPregTime() / 60 / 24));
					if(zilCallGirlSexed() > 0) output2("\n<b>* " + zheniyaName + ", Times Sexed:</b> " + zilCallGirlSexed());
				}
				variousCount++;
			}
			// Stellaaaa!
			if(flags["SEEN_BEACHNSURF"] != undefined)
			{
				output2("\n<b><u>Beach ‘n Surf</u></b>");
				output2("\n<b>* Store:</b> Visited");
				if(flags["MET_ALEX_SURF"] != undefined) output2("\n<b>* Alex:</b> Met her");
				if(flags["MET_STELLA"] != undefined) output2("\n<b>* Stella:</b> Met her");
				if(flags["STELLA_COLLAR"] != undefined) output2("\n<b>* Stella, Collar, Worn:</b> " + StringUtil.toDisplayCase(flags["STELLA_COLLAR"]));
				if(flags["STELLA_COLLAR_GIFT"] != undefined) output2("\n<b>* Stella, Collar, Gift:</b> " + StringUtil.toDisplayCase(flags["STELLA_COLLAR_GIFT"]));
				if(pc.hasStatusEffect("STELLA_PREGNANT")) output2("\n<b>* Stella, Days Pregnant:</b> " + Math.floor(((60*24*30*3) - pc.getStatusMinutes("STELLA_PREGNANT"))/(60*24)));
				if(flags["STELLA_FUCKED"] != undefined) output2("\n<b>* Stella, Times Sexed:</b> " + flags["STELLA_FUCKED"]);
				if(flags["STELLA_BUTTFUCKED"] != undefined) output2("\n<b>* Stella, Times Fucked Her Ass:</b> " + flags["STELLA_BUTTFUCKED"]);
				if(flags["STELLA_GAVE_ORAL"] != undefined) output2("\n<b>* Stella, Times She She Gave You Oral:</b> " + flags["STELLA_GAVE_ORAL"]);
				if(flags["STELLA_BALLWORSHIPPED"] != undefined) output2("\n<b>* Stella, Times She Worshipped Your Balls:</b> " + flags["STELLA_BALLWORSHIPPED"]);
				if(flags["STELLA_BREEDINGS"] != undefined) output2("\n<b>* Stella, Times Bred Her:</b> " + flags["STELLA_BREEDINGS"]);
				if(flags["STELLA_PETPLAYED"] != undefined) output2("\n<b>* Stella, Times Pet-Played:</b> " + flags["STELLA_PETPLAYED"]);
				if(flags["STELLA_PREG_FUCKED"] != undefined) output2("\n<b>* Stella, Times Preg-Fucked:</b> " + flags["STELLA_PREG_FUCKED"]);
				variousCount++;
			}
			// Beth's Busty Broads
			if(flags["TALK_TO_LADY_1ST"] != undefined || flags["BETHS_TIMES_WHORED"] != undefined || flags["BETHS_OVIR_SEEN"] != undefined || flags["OVIR_TEASED"] != undefined || flags["MET_TERENSHA"] != undefined || flags["MET_VAANDE"] != undefined)
			{
				output2("\n<b><u>Beth’s Busty Broads</u></b>");
				// Turn Tricks
				if(flags["BETHS_TIMES_WHORED"] != undefined)
				{
					output2("\n<b>* Brothel, Times Whored:</b> " + flags["BETHS_TIMES_WHORED"]);
					if(flags["BETHS_CONTRACT_WHORE"] != undefined) output2(", Licensed");
				}
				// Reaha stuffs
				if(flags["TALK_TO_LADY_1ST"] != undefined)
				{
					if(flags["KAT_MET"] == undefined) output2("\n<b>* Brothel Mistress:</b> Met her");
					else output2("\n<b>* Kat:</b> Met her");
					if(pc.isAss() && !reahaRecruited()) output2("\n<b>* Cow-Slut:</b>");
					else output2("\n<b>* Reaha:</b>");
					if(flags["REAHA_BOUGHT"] != undefined) output2(" Bought");
					else output2(" Whoring");
					if(flags["REAHA_FREE"] != undefined) output2(", Free to speak");
					if(flags["REAHA_SLAVE"] != undefined) output2(", Sex slave");
					if(!curedReahaInDebt()) output2(", Freed her debt");
					else if(flags["REAHA_WHORING_UNLOCKED"] == 1) output2(", Selling her milk");
					else if(flags["REAHA_WHORING_UNLOCKED"] == 2) output2(", Whoring herself");
					if(reahaBooted())
					{
						output2(", Left crew, <i>Whereabouts unknown</i>");
					}
					else if(reahaRecruited())
					{
						output2(", Crew member");
						// Reaha Expansion
						if(reahaIsCrew()) output2(" (Onboard Ship)");
						else if(flags["REAHA_IS_CREW"] == 2 || flags["REAHA_IS_CREW"] == 4) output2(" (At Tavros Station)");
						else if(flags["REAHA_IS_CREW"] == 3) output2(" (At New Texas)");
						if(flags["REAHA_PAY_Q"] == 1) output2("\n<b>* Reaha, Credit Debt:</b> <i>Ready to pay!</i>");
						if(flags["REAHA_PC_PAY"] != undefined) output2("\n<b>* Reaha, Credit Debt, Paid:</b> " + flags["REAHA_PC_PAY"] + " credits");
						if(flags["REAHA_FAMILY_RESULT"] != undefined) output2("\n<b>* Reaha, Talk, Family:</b>");
						if(flags["REAHA_FAMILY_RESULT"] == 1) output2(" Encouraged to contact her little sister");
						if(flags["REAHA_FAMILY_RESULT"] == -1) output2(" Discouraged from contacting little sister");
						if(flags["CURED_REAHA_NT_TALK"] != undefined) output2("\n<b>* Reaha, Talk, New Texas:</b>");
						if(flags["CURED_REAHA_NT_TALK"] == 1) output2(" Sympathized with her");
						if(flags["CURED_REAHA_NT_TALK"] == 2) output2(" Reminded her that it’s only natural");
						if(flags["CURED_REAHA_NT_TALK"] == 3) output2(" Told her to man up");
						output2("\n<b>* Reaha, Confidence:</b> " + reahaConfidence() + " %");
						if(flags["REAHA_MILKMODS_UNLOCKED"] != undefined)
						{
							//output2("\n<b>* Reaha, Milk Produced:</b> " + mLs(chars["REAHA"].milkQ()));
							output2("\n<b>* Reaha, Milk Type:</b> " + GLOBAL.FLUID_TYPE_NAMES[chars["REAHA"].milkType]);
							if(flags["REAHA_MILK_CHANGED"] != undefined) output2("\n<b>* Reaha, Milk Type, Times Changed:</b> " + flags["REAHA_MILK_CHANGED"]);
						}
						if(flags["REAHA_TALK_ADDICTION_CURE"] != undefined)
						{
							output2("\n<b>* Reaha, Patch Addiction Level:</b> " + reahaAddiction() + " %");
							if(reahaIsCured()) output2(", Cured");
							else output2(", Ongoing");
						}
						if(flags["REAHA_BOVINIUMED"] != undefined) output2("\n<b>* Reaha, Times Given Bovinium:</b> " + flags["REAHA_BOVINIUMED"]);
						if(!reahaIsCured() && reahaFree() && flags["REAHA_LAST_DOMMY_FUCK"] != undefined) output2("\n<b>* Reaha, Days Since Last Dommy Fuck Attempt:</b> " + (days - flags["REAHA_LAST_DOMMY_FUCK"]));
					}
					if(flags["SEXED_REAHA"] != undefined) output2("\n<b>* Reaha, Times Sexed:</b> " + flags["SEXED_REAHA"]);
				}
				// Ovir Gurrrl
				if(flags["BETHS_OVIR_SEEN"] != undefined || flags["OVIR_TEASED"] != undefined)
				{
					var bethsOvirGirl:String = "Ovir Girl";
					if(knowBethsOvir()) bethsOvirGirl = "Ovir ‘Girl’";
					output2("\n<b>* " + bethsOvirGirl + ":</b> Seen her");
					if(flags["ASKED_AFTER_THE_GIRLS"] != undefined && (hours == 18 || hours == 19 || hours == 21 || hours == 22 || hours == 24 || hours == 1 || hours == 3 || hours == 4)) output2(", Currently performing");
					if(flags["OVIR_TEASED"] != undefined) output2("\n<b>* " + bethsOvirGirl + ", Times Teased:</b> " + flags["OVIR_TEASED"]);
				}
				// Terensha
				if(flags["MET_TERENSHA"] != undefined)
				{
					output2("\n<b>* Terensha:</b> Met her");
					if(terenshaIsDancing()) output2(", Currently performing");
					if(flags["RENSA_FUCKED"] != undefined) output2("\n<b>* Terensha, Times Sexed:</b> " + flags["RENSA_FUCKED"]);
				}
				// Vaande
				if(flags["MET_VAANDE"] != undefined)
				{
					output2("\n<b>* Vaande:</b> Met her");
					if(flags["ASKED_AFTER_THE_GIRLS"] != undefined && (hours == 10 || hours == 13 || hours == 16)) output2(", Currently performing");
					if(flags["VAANDE_BUBBLED"] != undefined) output2("\n<b>* Vaande, Times Given Cum Bubble:</b> " + flags["VAANDE_BUBBLED"]);
					if(flags["SEXED_VAANDE"] != undefined) output2("\n<b>* Vaande, Times Sexed:</b> " + flags["SEXED_VAANDE"]);
				}
				variousCount++;
			}
			// Serabutts
			if(flags["MET_SERA"] != undefined)
			{
				output2("\n<b><u>The Dark Chrysalis</u></b>");
				if(flags["PURCHASED_SERAS_GALO"] != undefined || flags["SAENDRA GONNA GO GET A COCK"] >= 2)
				{
					output2("\n<b>* Unique Sale:</b>");
					if(flags["PURCHASED_SERAS_GALO"] != undefined) output2(" GaloMax");
					if(flags["SAENDRA GONNA GO GET A COCK"] >= 2)
					{
						if(flags["PURCHASED_SERAS_GALO"] != undefined) output2(",");
						output2(" Saendra’s penis growth drug");
						if(flags["SAEN_X_SERA_THREESOME"] > 0) output2(" (with threesome discount)");
					}
				}
				if(StatTracking.getStat("milkers/sera milker") > 0) output2("\n<b>* Breast Milker, Fluid Milked:</b> " + mLs(Math.round(StatTracking.getStat("milkers/sera milker"))));
				if(flags["MET_CHRYSALIS_DRONE"] != undefined) output2("\n<b>* Mods4U Drone:</b> Met it");
				output2("\n<b>* Sera:</b> Met her");
				if(flags["SERA_NO_SEX"] == 1) output2(", Pissed off at you indefinitely");
				if(seraRecruited())
				{
					output2(", Servant, Crew member");
					if(seraIsCrew()) output2(" (Onboard Ship)");
					else if(seraAtTavros())
					{
						output2(" (At Tavros Station");
						if(seraAtNursery()) output2(", In Nursery");
						output2(")");
					}
					else output2(" (<i>Whereabouts unknown</i>)");
				}
				else if(seraIsMistress()) output2(", Mistress");
				else
				{
					if(flags["SERA_TALKED_ABOUT_BEING_PISSED_OFF"] == undefined) output2(", Pissed off");
					else output2(", Vented her frustrations");
				}
				output2("\n<b>* Sera, Skin Tone:</b> " + StringUtil.toDisplayCase(chars["SERA"].skinTone));
				if(flags["SERA_INCH_STEAL"] != undefined) output2("\n<b>* Sera, Tail Length:</b> " + prettifyLength(36 + seraInchGain()));
				if(fuckedSeraBefore())
				{
					if(chars["SERA"].hasCock())
					{
						if(chars["SERA"].virility() <= 0) output2("\n<b>* Sera, Virility:</b> Infertile");
						else output2("\n<b>* Sera, Virility:</b> " + Math.round(chars["SERA"].virility()*1000)/10 + " %");
					}
					if(chars["SERA"].hasVagina())
					{
						if(chars["SERA"].fertility() <= 0) output2("\n<b>* Sera, Fertility:</b> Infertile");
						else output2("\n<b>* Sera, Fertility:</b> " + Math.round(chars["SERA"].fertility()*1000)/10 + " %");
					}
				}
				if(flags["SERA_PREGNANCY_TIMER"] != undefined) output2("\n<b>* Sera, Days Pregnant:</b> " + flags["SERA_PREGNANCY_TIMER"]);
				if(fuckedSeraBefore())
				{
					output2("\n<b>* Sera, Sex Organs:</b> " + listCharGenitals("SERA"));
					output2("\n<b>* Sera, Times Sexed:</b> " + timesFuckedSera());
					if(flags["TIMES_RODE_BY_SERA"] > 0) output2("\n<b>* Sera, Times She Rode You:</b> " + flags["TIMES_RODE_BY_SERA"]);
					if(flags["SERA_STUCK_IT_ALL_IN_BUTT"] > 0) output2("\n<b>* Sera, Times She Stuffed Your Ass with Dicks:</b> " + flags["SERA_STUCK_IT_ALL_IN_BUTT"]);
					if(flags["SERA FUCKED PCS TAILCUNT"] > 0) output2("\n<b>* Sera, Times She Fucked Your Tail Cunt:</b> " + flags["SERA FUCKED PCS TAILCUNT"]);
					if(flags["SERA_URETHRA_TAILFUCKS"] > 0) output2("\n<b>* Sera, Times She Tail-Fucked Your Urethra:</b> " + flags["SERA_URETHRA_TAILFUCKS"]);
					if(flags["SERA_EXHIBITION_BLOWJOB"] != undefined) output2("\n<b>* Sera, Times She Gave You a Public Blowjob:</b> " + flags["SERA_EXHIBITION_BLOWJOB"]);
					if(flags["SERA_IN_JARDI_THREESOME"] != undefined) output2("\n<b>* Sera, Times Sexed in Threesome with Jardi:</b> " + flags["SERA_IN_JARDI_THREESOME"]);
					if(flags["SERA_FACE_RIDE_TRAINING"] != undefined) output2("\n<b>* Sera, Times She Rode Your Face:</b> " + flags["SERA_FACE_RIDE_TRAINING"]);
					if(flags["SERA_TAILED"] != undefined) output2("\n<b>* Sera, Times She Fucked Your Parasitic Tail Cock:</b> " + flags["SERA_TAILED"]);
					if(flags["SERA_TONGUE_FUCKED"] != undefined) output2("\n<b>* Sera, Times She Fucked You with Her Tongue:</b> " + flags["SERA_TONGUE_FUCKED"]);
					if(flags["SERA_MILKINGS"] != undefined) output2("\n<b>* Sera, Times She Milked You:</b> " + flags["SERA_MILKINGS"]);
					if(flags["SERA_PUNISH_FIX"] != undefined) output2("\n<b>* Sera, Times She Punished Fix:</b> " + flags["SERA_PUNISH_FIX"]);
					if(flags["SERA_INCH_STEALING_SEX"] > 0) output2("\n<b>* Sera, Times She Absorbed Your Length:</b> " + flags["SERA_INCH_STEALING_SEX"]);
					if(flags["SERA_INCH_STEALING_HELP"] > 0) output2("\n<b>* Sera, Times You Untangled Her Tail Cock:</b> " + flags["SERA_INCH_STEALING_HELP"]);
					if(flags["SERA_BITCHENING_PUNISH_SPANK"] > 0) output2("\n<b>* Sera, Punish, Times You Spanked Her:</b> " + flags["SERA_BITCHENING_PUNISH_SPANK"]);
					if(flags["SERA_BITCHENING_PUNISH_RATION"] > 0) output2("\n<b>* Sera, Punish, Times You Fed Her Cum:</b> " + flags["SERA_BITCHENING_PUNISH_RATION"]);
					if(flags["SERA_BITCHENING_PUNISH_WALKIES"] > 0) output2("\n<b>* Sera, Punish, Times You Took Her Walkies:</b> " + flags["SERA_BITCHENING_PUNISH_WALKIES"]);
					if(flags["SERA_BITCHENING_TEASE_DENY"] > 0) output2("\n<b>* Sera, Times You Teased Her But Didn’t Let Her Finish:</b> " + flags["SERA_BITCHENING_TEASE_DENY"]);
					if(flags["SERA_BITCHENING_TEASE_RELEASE"] > 0) output2("\n<b>* Sera, Times You Teased Her and Let Her Finish:</b> " + flags["SERA_BITCHENING_TEASE_RELEASE"]);
					if(flags["SERA_BITCHENING_BUTTFUCK"] > 0) output2("\n<b>* Sera, Times You Fucked Her Ass:</b> " + flags["SERA_BITCHENING_BUTTFUCK"]);
					if(flags["SERA_BITCHENING_TITTYFUCK"] > 0) output2("\n<b>* Sera, Times You Titty Fucked Her:</b> " + flags["SERA_BITCHENING_TITTYFUCK"]);
					if(flags["SERA_BITCHENING_DP"] > 0) output2("\n<b>* Sera, Times You DP’d Her Pussy and Ass:</b> " + flags["SERA_BITCHENING_DP"]);
					if(flags["SERA_WAKEUP_SEX"] > 0) output2("\n<b>* Sera, Times She Woke You Up With Sex:</b> " + flags["SERA_WAKEUP_SEX"]);
					if(flags["SERA_MADE_LOVE"] > 0) output2("\n<b>* Sera, Times You Made Tender Love to Her:</b> " + flags["SERA_MADE_LOVE"]);
				}
				//if(pc.hasStatusEffect("Sera Credit Debt")) output2("\n<b>* Sera, Credit Debt:</b> " + pc.statusEffectv1("Sera Credit Debt") + " credits");
				variousCount++;
			}
			// Panda, please
			if(flags["KNOW_JADES_NAME"] != undefined)
			{
				output2("\n<b><u>Fur Effect</u></b>");
				output2("\n<b>* Jade:</b> Met her");
				if(flags["CAN_SUGGEST_JADES_NIPPLE_TREATMENT"] != undefined)
				{
					output2("\n<b>* Jade, Nipple Treatment:</b> Suggested");
					if(flags["TALKED_WITH_JADE_ABOUT_TENTACLE_NIPPLES"] != undefined) output2(", Talked about");
					if(flags["JADE_NIPPLE_TF_QUEUED"] == 1) output2(", Paid for, Has Nipplelux");
					if(flags["JADE_NIPPLE_TF_QUEUED"] >= 2) output2(", Paid for, Used Nipplelux, Completed");
					output2("\n<b>* Jade, Nipple Type:</b> " + GLOBAL.NIPPLE_TYPE_NAMES[chars["JADE"].breastRows[0].nippleType]);
				}
				if(flags["GOTTEN_INTIMATE_WITH_JADE"] != undefined) output2("\n<b>* Jade, Times Sexed:</b> " + flags["GOTTEN_INTIMATE_WITH_JADE"]);
				if(flags["TITFUCKED_JADE"] != undefined) output2("\n<b>* Jade, Times Titfucked:</b> " + flags["TITFUCKED_JADE"]);
				if(flags["TIMES_SAT_ON_JADES_FACE"] != undefined) output2("\n<b>* Jade, Times Sat on Her Face:</b> " + flags["TIMES_SAT_ON_JADES_FACE"]);
				if(flags["JADE_MUFFLINGS"] != undefined) output2("\n<b>* Jade, Times Ate Her Dumplings:</b> " + (flags["JADE_MUFFLINGS"] == -1 ? "<i>Refused to eat from her</i>" : flags["JADE_MUFFLINGS"]));
				variousCount++;
			}
			// Inessassassa
			if(flags["MET_INESSA"] != undefined)
			{
				output2("\n<b><u>Happy Tails</u></b>");
				output2("\n<b>* Inessa:</b> Met her");
				if(flags["INESSA_BELTED"] == 1) output2(", Trapped in chastity belt");
				else if(flags["INESSA_BELTED"] == 2) output2(", Freed from chastity belt");
				if(flags["INESSA_BEING_DOMMED"] != undefined) output2(", You’ve accepted her submission");
				else if(flags["INESSA_SHOT_DOWN"] != undefined) output2(", You’ve refused her submission");
				if(flags["INESSA_BDSM_SETTING"] != undefined) output2("\n<b>* Inessa, Your BDSM Role:</b> " + StringUtil.capitalize(flags["INESSA_BDSM_SETTING"]));
				if(flags["INESSA_BJED"] != undefined || flags["INESSA_TITTYSQUIRT"] != undefined || flags["INESSA_HJ"] != undefined || flags["INESSA_FACE_STRAPPED"] != undefined || flags["INESSA_TAILED"] != undefined)
				{
					output2("\n<b>* Inessa, Sexual History:</b> Sexed her");
					if(flags["INESSA_BJED"] != undefined) output2(", She gave you a blowjob");
					if(flags["INESSA_TITTYSQUIRT"] != undefined) output2(", She squirted you");
					if(flags["INESSA_VIRGINITY"] != undefined) output2(", Took her virginity");
					if(flags["INESSA_HJ"] != undefined) output2("\n<b>* Inessa, Times She’s Given You a Handjob:</b> " + flags["INESSA_HJ"]);
					if(flags["INESSA_FACE_STRAPPED"] != undefined) output2("\n<b>* Inessa, Times She’s Used Her Face Strap-On:</b> " + flags["INESSA_FACE_STRAPPED"]);
					if(flags["INESSA_TAILED"] != undefined) output2("\n<b>* Inessa, Times You Fucked Her with a Parasitic Tail Cock:</b> " + flags["INESSA_TAILED"]);
				}
				variousCount++;
			}
			// Alissiness
			if(flags["MET_ALICE"] != undefined)
			{
				output2("\n<b><u>Mi Amour</u></b>");
				if(flags["ANNO_OWNS_LIGHT_STRAPON"] != undefined)
				{
					output2("\n<b>* Unique Sale:</b> Anno’s hardlight strap-on");
				}
				output2("\n<b>* Aliss:</b> Met her");
				if(flags["TALKED_TO_ALIIS_ABOUT_LIBIDO"] != undefined) output2("\n<b>* Aliss, Lust:</b> " + chars["ALISS"].lust());
				if(flags["ALISS_FIXED_HL_COUNT"] != undefined) output2("\n<b>* Aliss, Times Fixed Hardlight Strap-On Underwear:</b> " + flags["ALISS_FIXED_HL_COUNT"]);
				if(flags["TIMES_SEXED_ALISS"] != undefined) output2("\n<b>* Aliss, Times Sexed:</b> " + flags["TIMES_SEXED_ALISS"]);
				variousCount++;
			}
			// Sentient Acquisitions
			if(flags["ENTERED_ACQUISITIONS"] != undefined)
			{
				output2("\n<b><u>Sentient Acquisitions</u></b>");
				if(flags["ACQUISITIONS_SLAVE_PURCHASES"] != undefined) output2("\n<b>* Sales, Acquired Servants, Total:</b> " + flags["ACQUISITIONS_SLAVE_PURCHASES"]);
				// Teron and Attica
				output2("\n<b>* Teron and Attica:</b> Met them");
				variousCount++;
			}
			// Shear Beauty!
			if(flags["MET_CERIA"] != undefined)
			{
				output2("\n<b><u>Shear Beauty</u></b>");
				output2("\n<b>* Ceria:</b> Met her");
				if(flags["EATEN_CERIA_OUT"] != undefined) output2(", Ate her pussy");
				if(flags["CERIA_MOUTH_FLOOD"] != undefined) output2(", Flooded her mouth with semen");
				if(flags["FUCKED_CERIA"] != undefined) output2("\n<b>* Ceria, Times Sexed:</b> " + flags["FUCKED_CERIA"]);
				if(flags["CERIA_EARFUCKS"] != undefined) output2("\n<b>* Ceria, Times You Gave Her an Ear Fuck:</b> " + flags["CERIA_EARFUCKS"]);
				if(flags["HEARD_OF_NAHRI"] != undefined || 9999 == 0)
				{
					output2("\n<b>* Nahri:</b>");
					if(9999 == 1) output2(" Met her");
					else output2(" Heard of her");
				}
				variousCount++;
			}
			// Nyaaaaan, TamaniCorp
			if(flags["MET_LERRIS"] != undefined)
			{
				output2("\n<b><u>TamaniCorp Shop</u></b>");
				output2("\n<b>* Lerris:</b> Met her");
				if(flags["LERRIS_TALKED_LACTAID"] != undefined)
				{
					output2(", Talked about");
					if(flags["LERRIS_TALKED_LACTAID"] >= 2) output2(" and sampled");
					output2(" Lactaid");
				}
				if(flags["LERRIS_ITEMS_GIVEN"] != undefined)
				{
					output2("\n<b>* Lerris, Items Given:</b> " + flags["LERRIS_ITEMS_GIVEN"]);
					if(flags["LERRIS_BOVINIUMED"] != undefined) output2(", Given Bovinium");
					output2("\n<b>* Lerris, Breast Size:</b> " + StringUtil.toTitleCase(chars["LERRIS"].breastCup(0)) + "s");
					//output2("\n<b>* Lerris, Hip Size:</b> " + formatFloat(chars["LERRIS"].hipRating(), 3));
					//output2("\n<b>* Lerris, Butt Size:</b> " + formatFloat(chars["LERRIS"].buttRating(), 3));
					if(chars["LERRIS"].isLactating()) output2("\n<b>* Lerris, Milk Type:</b> " + GLOBAL.FLUID_TYPE_NAMES[chars["LERRIS"].milkType]);
				}
				if(flags["FUCKED_LERRIS"] != undefined)
				{
					output2("\n<b>* Lerris, Sexual Organs:</b> " + listCharGenitals("LERRIS"));
				}
				if(flags["SUCKLED_LERRIS"] != undefined) output2("\n<b>* Lerris, Times Suckled:</b> " + flags["SUCKLED_LERRIS"]);
				if(flags["FUCKED_LERRIS"] != undefined) output2("\n<b>* Lerris, Times Sexed:</b> " + flags["FUCKED_LERRIS"]);
				variousCount++;
			}
			// Akane
			if(flags["AKANE_VISITS"] != undefined)
			{
				output2("\n<b><u>Host Shukuchi</u></b>");
				output2("\n<b>* Akane:</b> Met her")
				if(pcIsPainslut()) output2(", Became her <i>Painslut</i>");
				if(flags["AKANE_FUN_VISITS"])
				{
					output2("\n<b>* Akane, Times Sexed:</b> " + flags["AKANE_FUN_VISITS"]);
					if(flags["AKANE_TIMES_SHOCKED"]) output2("\n<b>* Akane, Times Stimmed:</b> " + flags["AKANE_TIMES_SHOCKED"]);
					if(flags["AKANE_TIMES_WHIPPED"]) output2("\n<b>* Akane, Times Whipped:</b> " + flags["AKANE_TIMES_WHIPPED"]);
					if(flags["AKANE_TIMES_FORCED"]) output2("\n<b>* Akane, Times Forced Orgasm Sessions:</b> " + flags["AKANE_TIMES_FORCED"]);
					if(flags["AKANE_TIMES_RIDDEN"]) output2("\n<b>* Akane, Times Ridden:</b> " + flags["AKANE_TIMES_RIDDEN"]);
					if(flags["AKANE_TIMES_LICKED"]) output2("\n<b>* Akane, Times Eaten Out:</b> " + flags["AKANE_TIMES_LICKED"]);
				}
				if(flags["AKANE_TIMES_TALKED"])
				{
					output2("\n<b>* Akane, Times Talked:</b> " + flags["AKANE_TIMES_TALKED"]);
					output2("\n<b>* Akane, Talked About:</b> ");
					var akaneTopics:Array = new Array();
					if(flags["AKANE_TIMES_TALKED_HER"]) akaneTopics.push("Her");
					if(flags["AKANE_TIMES_TALKED_YOU"]) akaneTopics.push("You");
					if(flags["AKANE_TIMES_TALKED_MODS"]) akaneTopics.push("Her Mods");
					if(flags["AKANE_TIMES_TALKED_HOST"]) akaneTopics.push("The Host");
					if(flags["AKANE_TIMES_TALKED_RIVALS"]) akaneTopics.push("Her Rivals");
					if(flags["AKANE_TIMES_TALKED_HISTORY"]) akaneTopics.push("Her History");
					if(flags["AKANE_TIMES_TALKED_US"]) akaneTopics.push("Us");
					output2(akaneTopics.join(", "));
				}
				variousCount++;
			}
			// Residential Deck Stuff!
			if(flags["AINA_DAY_MET"] != undefined || flags["SEEN_FYN"] == true || flags["MET_SEMITH"] == true || flags["MET_LIAMME"] != undefined || flags["FISI_MET"] != undefined || flags["MET_PAIGE"] != undefined || flags["BIZZY_PORN_STUDIO"] != undefined || MailManager.isEntryUnlocked("mirrin_tavros"))
			{
				output2("\n<b><u>Residential Deck</u></b>");
				// Aina
				if(flags["AINA_DAY_MET"] != undefined)
				{
					if(flags["MET_AINA"] == undefined) output2("\n<b>* Centaur Girl:</b> Seen her");
					else
					{
						output2("\n<b>* Aina:</b>");
						if(ainaIsInHeat()) output2(" In heat,");
						output2(" Met her");
						if(flags["HELPED_AINA"] == true)
						{
							output2(", Helped");
							if(flags["AINA_WAND_FIXED"] == true) output2(" fix her sex-toy");
							else output2(" her");
						}
						if(flags["AINA_SEXED"] > 0) output2("\n<b>* Aina, Times Sexed:</b> " + flags["AINA_SEXED"]);
						if(flags["AINA_SEXED_WITH_TOY"] > 0) output2("\n<b>* Aina, Times Fucked with Anal Wand:</b> " + flags["AINA_SEXED_WITH_TOY"]);
						if(flags["AINA_PREGHEATFUCK"] != undefined && flags["AINA_PREGHEATFUCK"] > 0) output2("\n<b>* Aina, Times Fucked While She was Pregnant and in Heat:</b> " + flags["AINA_PREGHEATFUCK"]);
						if(flags["AINA_PREG_TIMER"] != undefined) output2("\n<b>* Aina, Days Pregnant:</b> " + flags["AINA_PREG_TIMER"]);
						if(flags["AINA_TOTAL_KIDS"] != undefined && flags["AINA_TOTAL_KIDS"] > 0) output2("\n<b>* Aina, Total Kids:</b> " + flags["AINA_TOTAL_KIDS"]);
					}
				}
				// Bizzy
				if(flags["BIZZY_PORN_STUDIO"] != undefined)
				{
					output2("\n<b>* Bizzy:</b> Met her");
					if(bizzySlaveBoth()) output2(", Has collar and tattoo");
					else if(bizzySlaveCollar()) output2(", Wearing collar");
					else if(bizzySlaveTat()) output2(", Has tattoo");
					if(flags["BIZZY_PORN_STUDIO"] >= 1)
					{
						output2("\n<b>* Bizzy, Body, Breast Size:</b> ");
						if(flags["BIZZY_PORN_STUDIO"] <= 1) output2("Flat chest");
						else if(flags["BIZZY_PORN_STUDIO"] <= 2) output2("C-cups");
						else if(flags["BIZZY_PORN_STUDIO"] <= 3) output2("DD-cups");
						else output2("J-cups");
					}
					output2("\n<b>* Bizzy, Camgirl Status:</b>");
					if(flags["BIZZY_PORN_STUDIO"] <= -1) output2(" Refused to fund");
					else if(flags["BIZZY_PORN_STUDIO"] >= 1)
					{
						output2(" Funded stage " + flags["BIZZY_PORN_STUDIO"]);
						if(flags["BIZZY_PORN_STUDIO"] <= 1) output2(", Beginner");
						else if(flags["BIZZY_PORN_STUDIO"] <= 2) output2(", Camwhore");
						else if(flags["BIZZY_PORN_STUDIO"] <= 3) output2(", Streamslut");
						else if(flags["BIZZY_PORN_STUDIO"] <= 4) output2(", Sexpert performer");
						else output2(", Professional porn studio, Completed");
					}
					if(flags["BIZZY_MAIL_PAYMENT_DAY"] != undefined) output2("\n<b>* Bizzy, Days Since Last Salary Payment:</b> " + (days - flags["BIZZY_MAIL_PAYMENT_DAY"]));
					if(flags["BIZZY_VAG_FUCKED"] != undefined) output2("\n<b>* Bizzy, Times Fucked Her Vagina:</b> " + flags["BIZZY_VAG_FUCKED"]);
					if(flags["BIZZY_BOOBY_RUBBED"] != undefined) output2("\n<b>* Bizzy, Times Rubbed Boobs:</b> " + flags["BIZZY_BOOBY_RUBBED"]);
					if(flags["BIZZY_SUCKED_COCK"] != undefined) output2("\n<b>* Bizzy, Times She Sucked Your Cock:</b> " + flags["BIZZY_SUCKED_COCK"]);
					if(flags["BIZZY_ATE_PUSSY"] != undefined) output2("\n<b>* Bizzy, Times She Ate Your Pussy:</b> " + flags["BIZZY_ATE_PUSSY"]);
					if(flags["BIZZY_TITTYFUCKED"] != undefined) output2("\n<b>* Bizzy, Times Titfucked:</b> " + flags["BIZZY_TITTYFUCKED"]);
				}
				// Fisianna
				if(flags["FISI_MET"] != undefined)
				{
					output2("\n<b>* Fisianna:</b> Met her, ");
					if(flags["FISI_AT_RES_DECK"] == undefined) output2("Acquaintances");
					else if(flags["FISI_MAX"] == undefined) output2("Friends");
					else if(flags["FISI_LOVER"] != undefined) output2("Lovers");
					else if(flags["FISI_REJECTED"] != undefined) output2("Ex-friends");
					else output2("Best friends");
					output2("\n<b>* Fisianna, Trust:</b> " + flags["FISI_TRUST"] + " %");
					if(flags["FISI_REL_TYPE"] != undefined)
					{
						output2("\n<b>* Fisianna, Relationship:</b> ");
						if(flags["FISI_REL_TYPE"] == 1) output2("Monogamous");
						else if(flags["FISI_REL_TYPE"] == 2) output2("Open Relationship");
						else if(flags["FISI_REL_TYPE"] == 3) output2("Polyamorous");
					}
					if(flags["FISI_TIMES_CUDDLED"] > 0) output2("\n<b>* Fisianna, Times Cuddled With Her:</b> " + flags["FISI_TIMES_CUDDLED"]);
					if(flags["FISI_TIMES_MASSAGED"] > 0) output2("\n<b>* Fisianna, Times She Massaged You:</b> " + flags["FISI_TIMES_MASSAGED"]);
					if(flags["FISI_TIMES_SEXED"] > 0)
					{
						if(flags["FISI_PRURIENCE"] > 0) output2("\n<b>* Fisianna, Prurience:</b> " + flags["FISI_PRURIENCE"]);
						output2("\n<b>* Fisianna, Times Sexed:</b> " + flags["FISI_TIMES_SEXED"]);
						if(flags["FISI_TIMES_TJ"] > 0) output2("\n<b>* Fisianna, Times Had a Tailjob from Her:</b> " + flags["FISI_TIMES_TJ"]);
						if(flags["FISI_TIMES_EATEN"] > 0) output2("\n<b>* Fisianna, Times Eaten Her Out:</b> " + flags["FISI_TIMES_EATEN"]);
						if(flags["FISI_TIMES_69"] > 0) output2("\n<b>* Fisianna, Times Sixty-Nine’d:</b> " + flags["FISI_TIMES_69"]);
						if(flags["FISI_TIMES_VAG"] > 0) output2("\n<b>* Fisianna, Times Fucked "+ (silly ? "the Pussy’s Pussy" : "Her Pussy")+ "</b> " + flags["FISI_TIMES_VAG"]);
						if(flags["FISI_TIMES_ANAL"] > 0) output2("\n<b>* Fisianna, Times Fucked Her Ass:</b> " + flags["FISI_TIMES_ANAL"]);
						if(flags["FISI_TIMES_ORAL"] > 0) output2("\n<b>* Fisianna, Times She Gave You Oral:</b> " + flags["FISI_TIMES_ORAL"]);
						if(flags["FISI_TIMES_FS"] > 0) output2("\n<b>* Fisianna, Times You Fucker Her Silly:</b> " + flags["FISI_TIMES_FS"]);
						if(flags["FISI_TIMES_RIDDEN"] > 0) output2("\n<b>* Fisianna, Times She Rode You:</b> " + flags["FISI_TIMES_RIDDEN"]);
						if(flags["FISI_TIMES_PEGGED"] > 0) output2("\n<b>* Fisianna, Times She Pegged You:</b> " + flags["FISI_TIMES_PEGGED"]);
						if(flags["FISI_TIMES_EDGED"] > 0) output2("\n<b>* Fisianna, Times She Edged You:</b> " + flags["FISI_TIMES_EDGED"]);
						if(flags["FISI_TIMES_SEXY_CUDDLED"] > 0) output2("\n<b>* Fisianna, Times You Had Sexy Cuddles With Her:</b> " + flags["FISI_TIMES_SEXY_CUDDLED"]);
						if(flags["FISI_TIMES_BREED"] > 0) output2("\n<b>* Fisianna, Times Breed Her:</b> " + flags["FISI_TIMES_BREED"]);
					}
					if(flags["FISI_TIMES_BET"] != undefined) output2("\n<b>* Fisianna, Sex Bets, Win/Loss Ratio:</b> " + flags["FISI_TIMES_WON"] + "/" + flags["FISI_TIMES_LOST"] + ", of " + flags["FISI_TIMES_BET"] + " games");
				}
				// Fyn
				if(flags["SEEN_FYN"] == true)
				{
					if(flags["MET_FYN"] == undefined) output2("\n<b>* Shirtless Man:</b> Seen him");
					else
					{
						output2("\n<b>* Fyn:</b> Met him");
						if(flags["FYN_SEXED"] > 0) output2("\n<b>* Fyn, Times Sexed:</b> " + flags["FYN_SEXED"]);
					}
				}
				// Liamme
				if(flags["MET_LIAMME"] != undefined)
				{
					output2("\n<b>* Liamme:</b> Met him");
					if(flags["SEXED_LIAMME"] > 0) output2("\n<b>* Liamme, Times Sexed:</b> " + flags["SEXED_LIAMME"]);
				}
				// Paige
				if(flags["MET_PAIGE"] != undefined)
				{
					output2("\n<b>* Paige:</b> Met her");
					if(paigeRecruited())
					{
						output2(", Crew member");
						if(paigeIsCrew()) output2(" (Onboard Ship)");
					}
					if(flags["SEXED_PAIGE"] != undefined) output2("\n<b>* Paige, Times Sexed:</b> " + flags["SEXED_PAIGE"]);
					if(flags["PAIGE_KIRO_THREESOMES"] != undefined) output2("\n<b>* Paige, Times Sexed Her with Kiro:</b> " + flags["PAIGE_KIRO_THREESOMES"]);
					if(flags["MET_IDDI"] != undefined) output2("\n<b>* Iddi:</b> Met her");
				}
				// Semith
				if(flags["MET_SEMITH"] == true)
				{
					output2("\n<b>* Semith:</b> Met him");
					if(flags["SEMITH_SEXED"] > 0) output2("\n<b>* Semith, Times Sexed:</b> " + flags["SEMITH_SEXED"]);
				}
				if(MailManager.isEntryUnlocked("mirrin_tavros")) writeMirrinLogEntry(); // see newTexas/mirrinPregpack.as
				variousCount++;
			}
			// Ilaria Bunnybutts
			if(flags["MET_ILARIA"] != undefined)
			{
				output2("\n<b><u>Bunny’s Buns & Confectionary</u></b>");
				output2("\n<b>* Ilaria:</b> Met her");
				if(flags["ILERIA_GLAZED"] != undefined) output2("\n<b>* Ilaria, Times Glazed Order:</b> " + flags["ILERIA_GLAZED"]);
				if(flags["FUCKED_ILARIA"] != undefined) output2("\n<b>* Ilaria, Times Sexed:</b> " + flags["FUCKED_ILARIA"]);
				if(flags["ILARIA_PREG_TIMER"] != undefined) output2("\n<b>* Ilaria, Days Pregnant:</b> " + flags["ILARIA_PREG_TIMER"]);
				if(flags["ILARIA_TOTAL_KIDS"] > 0) output2("\n<b>* Ilaria, Total Kids:</b> " + flags["ILARIA_TOTAL_KIDS"]);
				variousCount++;
			}
			// Nursery!
			if(flags["USED_NURSERY_COMPUTER"] != undefined || flags["BRIGET_MET"] != undefined || StatTracking.getStat("nursery/milk milked") > 0)
			{
				output2("\n<b><u>Nursery</u></b>");
				if(flags["USED_NURSERY_COMPUTER"] != undefined) output2("\n<b>* Computer:</b> Used");
				if(StatTracking.getStat("nursery/milk milked") > 0)
				{
					output2("\n<b>* Milking Room, Fluid Milked:</b> " + mLs(Math.round(StatTracking.getStat("nursery/milk milked"))));
				}
				if(flags["BRIGET_MET"] != undefined)
				{
					output2("\n<b>* Briget:</b> Met her");
					if(flags["BRIGET_FUCKED"] != undefined) output2("\n<b>* Briget, Times Sexed:</b> " + flags["BRIGET_FUCKED"]);
				}
				variousCount++;
			}
		}
		
		if(showID == "New Texas" || showID == "All")
		{
			// Customs
			if(flags["NEW_TEXAN_CUSTOMS_MET"] != undefined)
			{
				output2("\n<b><u>New Texas Customs Office</u></b>");
				// Ogram and Amma
				output2("\n<b>* Ogram and Amma:</b> Met them");
				if(flags["FUCKED_TEXAN_CUSTOMS"] != undefined) output2("\n<b>* Ogram and Amma, Times Sexed:</b> " + flags["FUCKED_TEXAN_CUSTOMS"]);
				variousCount++;
			}
			// Public
			if(flags["NEW_TEXAS_GANGBANGED"] != undefined || flags["TEXAS_GRAVCUFFS_COWORGY"] != undefined) 
			{
				output2("\n<b><u>New Texas Public</u></b>");
				if(flags["NEW_TEXAS_GANGBANGED"] != undefined) output2("\n<b>* Alpha Bull-Men, Times Gangbanged By:</b> " + flags["NEW_TEXAS_GANGBANGED"]);
				if(flags["TEXAS_GRAVCUFFS_COWORGY"] != undefined) output2("\n<b>* Curvy Cowgirls, Times Gangbanged By:</b> " + flags["TEXAS_GRAVCUFFS_COWORGY"]);
				variousCount++;
			}
			// Big T's Ranch
			if(flags["MET_BIG_T"] != undefined || flags["MET_ELLIE"] != undefined || flags["MET_HERMAN"] != undefined || flags["MET_ZEPHYR"] != undefined)
			{
				output2("\n<b><u>Big T’s Ranch</u></b>");
				// Big T!
				if(flags["MET_BIG_T"] != undefined) 
				{
					output2("\n<b>* Big T:</b> Met him");
					if(flags["SEXED_BIG_T"] != undefined) output2("\n<b>* Big T, Times Sexed:</b> " + flags["SEXED_BIG_T"]);
				}
				// Like, Ellie and stuff!
				if(flags["MET_ELLIE"] != undefined)
				{
					output2("\n<b>* Ellie:</b> Met her");
					if(flags["SUCKED_ELLIES_TITS"] != undefined) output2(", Sucked her tits");
					if(flags["ELLIE_EMBARASSED_LIL_DICK_FUCK"] != undefined) output2(", Fucked her with an embarrassingly small dick for her size");
					if(flags["NEPH_AFFECTION"] != undefined) output2("\n<b>* Ellie, Affection:</b> " + flags["NEPH_AFFECTION"] + " %");
					if(flags["ELLIE_PREG_TIMER"] != undefined && flags["ELLIE_TOTAL_KIDS"] == undefined) output2("\n<b>* Ellie, Days Pregnant:</b> " + flags["ELLIE_PREG_TIMER"]);
					if(flags["ELLIE_TOTAL_KIDS"] > 0) output2("\n<b>* Ellie, Total Kids:</b> " + flags["ELLIE_TOTAL_KIDS"]);
					if(flags["ELLIE_SEXED"] != undefined) output2("\n<b>* Ellie, Times Sexed:</b> " + flags["ELLIE_SEXED"]);
					if(flags["PUBLIC_USE_COUNT"] > 0) output2("\n<b>* Ellie, Times You Were Used Publicly:</b> " + flags["PUBLIC_USE_COUNT"]);
				}
				// BBQ, Mmmm...
				if(flags["MET_HERMAN"] != undefined)
				{
					output2("\n<b>* Herman:</b> Met him");
					if(flags["HERMAN_SPECIAL_ORDER"] != undefined) output2("\n<b>* Herman, Times Requested “Special Order”:</b> " + flags["HERMAN_SPECIAL_ORDER"]);
				}
				// Zephyrbutts
				if(flags["MET_ZEPHYR"] != undefined)
				{
					output2("\n<b>* Zephyr:</b> Met her");
					if(zephAtNursery()) output2(" (At Tavros Station, In Nursery)");
					if(flags["ZEPHYR_PISSED"] != undefined) output2(", Pissed off");
					if(flags["SEXED_ZEPHYR"] != undefined) output2(", Sexed her");
					if(flags["ZEPHYR_FUCKED_PC"] != undefined) output2(", She fucked you");
					if(flags["ZEPHYR_THROBBED"] != undefined) output2(", She used Throbb");
				}
				variousCount++;
			}
			// Brandy
			if(flags["MET_BRANDY"] != undefined)
			{
				output2("\n<b><u>Bailey’s Bovine Brewery</u></b>");
				output2("\n<b>* Brandy:</b> Met her");
				if(flags["BRANDY_AFFECTION"] != undefined) output2("\n<b>* Brandy, Affection:</b> " + flags["BRANDY_AFFECTION"] + " %");
				if(flags["BRANDY_RELATIONSHIP"] != undefined)
				{
					output2("\n<b>* Brandy, Relationship:</b>");
					switch(flags["BRANDY_RELATIONSHIP"])
					{
						default: output2(" Platonic"); break;
						case 1: output2(" Casual"); break;
						case 2: output2(" Couple"); break;
					}
				}
				if(flags["BRANDY_VAGINAL"] != undefined) output2("\n<b>* Brandy, Times Vaginally Fucked Her:</b> " + flags["BRANDY_VAGINAL"]);
				if(flags["BRANDY_FINGERING"] != undefined) output2("\n<b>* Brandy, Times Mutually Fingered Her:</b> " + flags["BRANDY_FINGERING"]);
				if(flags["SUCKLED_BRANDY"] != undefined) output2("\n<b>* Brandy, Times Suckled:</b> " + flags["SUCKLED_BRANDY"]);
				if(flags["BRANDY_MISSIONARY"] != undefined) output2("\n<b>* Brandy, Times Moosionary Fucked Her:</b> " + flags["BRANDY_MISSIONARY"]);
				if(flags["BRANDY_MISCREANTED"] != undefined) output2("\n<b>* Brandy, Times Sexed at Miscreant Manor:</b> " + flags["BRANDY_MISCREANTED"]);
				if(flags["BRANDY_STALLED"] != undefined) output2("\n<b>* Brandy, Times Sexed in Stall:</b> " + flags["BRANDY_STALLED"]);
				if(flags["BRANDY_SALLY_THREESOME_PEN"] != undefined) output2("\n<b>* Brandy, Times had Threesome with Sally (penis):</b> " + flags["BRANDY_SALLY_THREESOME_PEN"]);
				if(flags["BRANDY_SALLY_THREESOME_CUN"] != undefined) output2("\n<b>* Brandy, Times had Threesome with Sally (tongue):</b> " + flags["BRANDY_SALLY_THREESOME_CUN"]);
				variousCount++;
			}
			// Bucking Bronco Saloonary
			if(flags["MET_JAMES"] != undefined || flags["MET_SALLY"] != undefined || flags["MET_SYDNEY"] != undefined || flags["MET_KEGS"] != undefined || flags["LIVING_KEGGED"] != undefined || flags["BRONCO_USED"] != undefined || flags["CIARAN_MET"] != undefined)
			{
				output2("\n<b><u>Bucking Bronco Saloon</u></b>");
				if(flags["BB_5FINGER_DISCOUNT"] == 1 || pc.hasStatusEffect("Bucking Bronco Free Drinks"))
				{
					output2("\n<b>* Bar, Drinks, Discount:</b>");
					if(pc.hasStatusEffect("Bucking Bronco Free Drinks")) output2(" All free for " + prettifyMinutes(pc.getStatusMinutes("Bucking Bronco Free Drinks")));
					else output2(" One free");
				}
				if(flags["MET_KEGS"] != undefined || flags["LIVING_KEGGED"] != undefined) output2("\n<b>* Bailey’s Brewery, Living Kegs, Times Used:</b> " + (flags["LIVING_KEGGED"] != undefined ? flags["LIVING_KEGGED"] : 0));
				if(flags["BRONCO_USED"] != undefined) output2("\n<b>* Fucking Bronco, Times Used:</b> " + flags["BRONCO_USED"]);
				if(StatTracking.getStat("contests/fucking bronco losses") + StatTracking.getStat("contests/fucking bronco wins") > 0) output2("\n<b>* Fucking Bronco, Competition, Win/Loss Ratio:</b> " + StatTracking.getStat("contests/fucking bronco wins") + "/" + StatTracking.getStat("contests/fucking bronco losses") + ", of " + (StatTracking.getStat("contests/fucking bronco losses") + StatTracking.getStat("contests/fucking bronco wins")) + " games");
				// James
				if(flags["MET_JAMES"] != undefined)
				{
					output2("\n<b>* James:</b> Met him");
					if(flags["BB_5FINGER_DISCOUNT"] != undefined) output2(", Gave “Five Finger Discount”");
				}
				// Sally
				if(flags["MET_SALLY"] != undefined)
				{
					output2("\n<b>* Sally:</b> Met her");
					if(flags["SEXED_SALLY"] != undefined) output2("\n<b>* Sally, Times Sexed:</b> " + flags["SEXED_SALLY"]);
				}
				// Sydney
				if(flags["MET_SYDNEY"] != undefined) output2("\n<b>* Sydney:</b> Met him");
				// Ciaran
				if(flags["CIARAN_MET"] != undefined)
				{
					output2("\n<b>* Ciaran:</b> Met him");
					if(flags["CIARAN_LAP"] != undefined || flags["CIARAN_VANILLA"] != undefined || flags["CIARAN_HEAT"] != undefined || flags["CIARAN_FINGER"] != undefined) output2(", Sexed him");
					if(flags["CIARAN_SCRITCH_HIM"] != undefined) output2("\n<b>* Ciaran, Times Scritched:</b> " + flags["CIARAN_SCRITCH_HIM"]);
					if(flags["CIARAN_SPANK"] != undefined) output2("\n<b>* Ciaran, Times He Spanked You:</b> " + flags["CIARAN_SPANK"]);
					var ciaranCum:int = 0;
					if(flags["CIARAN_LAP"] != undefined) ciaranCum += flags["CIARAN_LAP"];
					if(flags["CIARAN_VANILLA"] != undefined) ciaranCum += flags["CIARAN_VANILLA"];
					if(flags["CIARAN_HEAT"] != undefined) ciaranCum += flags["CIARAN_HEAT"];
					if(ciaranCum > 0) output2("\n<b>* Ciaran, Times You Made Him Cum:</b> " + ciaranCum);
				}
				variousCount++;
			}
			// The Fields
			if(flags["MET_CAMERON"] != undefined || flags["MET_VARMINT"] != undefined || flags["MET_VARMINT_PACK"] != undefined || varmintIsCrew())
			{
				output2("\n<b><u>The Fields</u></b>");
				if(flags["MET_CAMERON"] != undefined)
				{
					output2("\n<b>* Cameron:</b> Met him");
					if(flags["SEXED_CAMERON"] != undefined) output2("\n<b>* Cameron, Times Sexed:</b> " + flags["SEXED_CAMERON"]);
				}
				if(flags["MET_VARMINT"] != undefined) output2("\n<b>* Varmint, Times Encountered:</b> " + flags["MET_VARMINT"]);
				if(flags["MET_VARMINT_PACK"] != undefined) output2("\n<b>* Varmint Pack, Times Encountered:</b> " + flags["MET_VARMINT_PACK"]);
				if(varmintIsCrew())
				{
					if(varmintIsTame())
					{
						output2("\n<b>* " + (!varmintRenamend() ? "Pet Varmint" : varmintPetName()) + ":</b> Crew member");
						if(hasVarmintBuddy()) output2(" (Following you)");
						else
						{
							output2(" (Onboard Ship)");
							if(pc.hasStatusEffect("Varmint Leashed")) output2(", Leashed");
							else output2(", Roaming freely");
						}
					}
					else output2("\n<b>* Wild Varmint:</b> Stowaway (Onboard Ship)");
				}
				variousCount++;
			}
			// Iced Teats
			if(flags["MET_YAMMI"] != undefined)
			{
				output2("\n<b><u>Iced Teats</u></b>");
				// Yum, icecream!
				var icedTeatsFlavors:Array = [];
				if(flags["HAD_GEWINFRUIT"] != undefined) icedTeatsFlavors.push("Gewinfruit");
				if(flags["HAD_YOKTO"] != undefined) icedTeatsFlavors.push("Yokto");
				if(flags["HAD_BLITZABERRY"] != undefined) icedTeatsFlavors.push("Blitzaberry");
				if(flags["HAD_STRAWBERRY"] != undefined) icedTeatsFlavors.push("Strawberry");
				if(flags["HAD_JUMBIJUMBI"] != undefined) icedTeatsFlavors.push("Jumbijumbi");
				if(flags["HAD_DARGINUT"] != undefined) icedTeatsFlavors.push("Darginut");
				if(flags["HAD_CHOCOLATE"] != undefined) icedTeatsFlavors.push("Chocolate");
				if(flags["HAD_FLAMEBERKS"] != undefined) icedTeatsFlavors.push("Flameberks");
				if(icedTeatsFlavors.length > 0) output2("\n<b>* Flavors Tasted:</b> " + CompressToList(icedTeatsFlavors, false));
				if(silly && icedTeatsFlavors.length >= 8) output2(", <i>Yum!</i>");
				// Yammi
				output2("\n<b>* Yammi:</b> Met her");
				if(yammiRecruited())
				{
					output2(", Crew member");
					if(yammiIsCrew()) output2(" (Onboard Ship)");
				}
				else
				{
					if(flags["YAMMI_RECRUITED"] == -1) output2(", Freed her, <i>Whereabouts unknown</i>");
					else if(flags["YAMMI_BAD_DAY"] == 1) output2(", Had a bad day");
					else if(flags["YAMMI_BAD_DAY"] == 2) output2(", Owes 7000 credits");
				}
				if(flags["SEXED_YAMMI"] != undefined) output2("\n<b>* Yammi, Times Sexed:</b> " + flags["SEXED_YAMMI"]);
				if(flags["ANALED_YAMMI"] != undefined) output2("\n<b>* Yammi, Times Fucked Her Ass:</b> " + flags["ANALED_YAMMI"]);
				// Pexiga
				if(flags["YAMMI_HELPED"] >= 2)
				{
					var pexigaName:String = (pexigaRecruited() ? "[pexiga.name]" : "Yammi’s Pexiga");
					output2("\n<b>* " + pexigaName + ":</b> Met her");
					if(pexigaRecruited())
					{
						output2(", Crew member");
						if(flags["PEX&YAM_MEETING"] == undefined) output2(" (Following you)");
						else if(pexigaIsCrew()) output2(" (Onboard Ship)");
					}
					if(flags["YAMMI_PEX_MILK"] != undefined) output2("\n<b>* " + pexigaName + ", Times Milked Her with Yammi:</b> " + flags["YAMMI_PEX_MILK"]);
					var pexigaMilked:int = 0;
					if(flags["PEX_MILKED"] != undefined) pexigaMilked += flags["PEX_MILKED"];
					if(flags["PEX_SOLOMILK"] != undefined) pexigaMilked += flags["PEX_SOLOMILK"];
					if(pexigaMilked > 0) output2("\n<b>* " + pexigaName + ", Times Milked Her Solo:</b> " + pexigaMilked);
					if(flags["PEXIGA_BUBBLE"] != undefined) output2("\n<b>* " + pexigaName + ", Time Made Cum-Bubbles for Her:</b> " + flags["PEXIGA_BUBBLE"]);
				}
				// Reaha special
				if(flags["REAHA_ICE_CREAM_DAYS"] != undefined) output2("\n<b>* Reaha, Days Since Last Had Ice Cream With:</b> " + (days - flags["REAHA_ICE_CREAM_DAYS"]));
				if(flags["REAHA_ICE_CREAM_TIMES"] != undefined) output2("\n<b>* Reaha, Times Had Ice Cream With:</b> " + flags["REAHA_ICE_CREAM_TIMES"]);
				variousCount++;
			}
			// Milk Barn, where all the cows stay at!
			if(flags["BRYNN_AUTOENTER"] != undefined || flags["MET_GIANNA"] != undefined || flags["MET_HALEY"] != undefined || flags["USED_MILKER"] != undefined || flags["MET_MILLIE"] != undefined || flags["MET_YANCY"] != undefined || flags["GOBBLES_SEXYTIMES_STARTED"] != undefined || flags["CARRIE_BLOWJOBBED"] != undefined || StatTracking.getStat("milkers/breast milker uses") > 0 || StatTracking.getStat("milkers/prostate milker uses") > 0)
			{
				output2("\n<b><u>Milk Barn</u></b>");
				// Milkers
				if(StatTracking.getStat("milkers/breast milker uses") > 0)
				{
					output2("\n<b>* Milker, Breast, Times Used:</b> " + StatTracking.getStat("milkers/breast milker uses"));
					output2("\n<b>* Milker, Breast, Fluid Milked:</b> " + mLs(Math.round(StatTracking.getStat("milkers/milk milked"))));
				}
				if(StatTracking.getStat("milkers/prostate milker uses") > 0)
				{
					output2("\n<b>* Milker, Prostate, Times Used:</b> " + StatTracking.getStat("milkers/prostate milker uses"));
					output2("\n<b>* Milker, Prostate, Cum Milked:</b> " + mLs(Math.round(StatTracking.getStat("milkers/cum milked"))));
					if(flags["NT_TAILCOCK_MILKINGS"] != undefined) output2("\n<b>* Milker, Prostate, Times Used with Parasitic Tail-Cock:</b> " + flags["NT_TAILCOCK_MILKINGS"]);
				}
				// Brynn
				if(flags["BRYNN_AUTOENTER"] != undefined)
				{
					if(flags["BRYNN_INTRODUCED"] != undefined) output2("\n<b>* Brynn:</b>");
					else output2("\n<b>* Well-Endowed Stud:</b>");
					output2(" Met him");
					if(flags["SUCKED_BRYNN"] != undefined) output2(", Sucked him off");
					if(flags["DEEPTHROATED_BRYNN"] != undefined) output2(", Deepthroated his cock");
				}
				// Turkey Lady
				if(flags["GOBBLES_SEXYTIMES_STARTED"] != undefined)
				{
					if(flags["CANADA_EXPLAINED"] != undefined) output2("\n<b>* Canada:</b>");
					else output2("\n<b>* Turkey Girl:</b>");
					output2(" Encountered");
					if(flags["REPEAT_GOBBLES_MILKED"] == 1) output2(", Milked once");
					else if(flags["REPEAT_GOBBLES_MILKED"] > 1) output2(", Milked " + flags["REPEAT_GOBBLES_MILKED"] + " times");
				}
				// Carrie and friends!
				if(StatTracking.getStat("milkers/prostate milker uses") > 0 || flags["CARRIE_BLOWJOBBED"] != undefined)
				{
					output2("\n<b>* Carrie:</b> Met her");
					if(flags["CARRIE_BLOWJOBBED"] != undefined)
					{
						output2(", Gave you a blowjob");
						if(flags["CARRIE_BLOWJOBBED"] != 1) output2(" " + flags["CARRIE_BLOWJOBBED"] + " times");
					}
					if(flags["CARRIE_SMALLCOCK_SUX"] != undefined) output2(", Sucked your small cock");
					if(StatTracking.getStat("milkers/cum jarred") > 0) output2("\n<b>* Carrie, Cum Jarred:</b> " + mLs(Math.round(StatTracking.getStat("milkers/cum jarred"))));
					if(flags["CAMERON_MILKED"] != undefined) output2("\n<b>* Carrie, Times fucked her and Cameron:</b> " + flags["CAMERON_MILKED"]);
					if(flags["CORA_SUCKED"] != undefined)
					{
						output2("\n<b>* Cora:</b> Met her, Sucked your dick with Carrie");
						if(flags["CORA_SUCKED"] != 1) output2(" " + flags["CORA_SUCKED"] + " times");
					}
					if(flags["CARRIE_SHOWER_THREESOME"] != undefined)
					{
						output2("\n<b>* Carrie and Cora:</b> Had shower threesome");
						if(flags["CARRIE_SHOWER_THREESOME"] != 1) output2(" " + flags["CARRIE_SHOWER_THREESOME"] + " times");
					}
					if(flags["CARRIE_SHOWER_FIVESOME"] != undefined)
					{
						output2("\n<b>* Horisha and Peck:</b> Met them, Had shower fivesome with Carrie and Cora");
						if(flags["CARRIE_SHOWER_FIVESOME"] != 1) output2(" " + flags["CARRIE_SHOWER_FIVESOME"] + " times");
					}
				}
				// Giannannanna
				if(flags["MET_GIANNA"] != undefined)
				{
					output2("\n<b>* Gianna:</b>");
					if(giannaAWOL()) output2(" Away");
					else output2(" Active");
					if(flags["GIVEN_GIANNA_SILICONE"] != undefined) output2(", Gave her Silicone");
					if(flags["BEEN_IN_GIANNA_BODYMOD_MENU"] != undefined)
					{
						output2("\n<b>* Gianna, Body, Breast Size:</b> " + StringUtil.toTitleCase(chars["GIANNA"].breastCup(0)) + "s");
						output2("\n<b>* Gianna, Body, Posterior Size:</b> " + formatFloat(chars["GIANNA"].buttRating(), 3));
						output2("\n<b>* Gianna, Body, Lip Size:</b> " + showCharLipRating("GIANNA"));
					}
					// Talk
					if(flags["TALKED_TO_GIANNA"] != undefined)
					{
						if(flags["GIANNA_ABOUT_HER_TALK_RESULT"] != undefined) output2("\n<b>* Gianna, Talk, A.I. Having Emotions:</b>");
						if(flags["GIANNA_ABOUT_HER_TALK_RESULT"] == 0) output2(" Refuted her");
						if(flags["GIANNA_ABOUT_HER_TALK_RESULT"] == 1) output2(" Agreed with her");
						if(flags["GIANNA_AI_TALK_RESULT"] != undefined) output2("\n<b>* Gianna, Talk, More Than Just a Companion:</b>");
						if(flags["GIANNA_AI_TALK_RESULT"] == 0) output2(" Discouraged her");
						if(flags["GIANNA_AI_TALK_RESULT"] == 1) output2(" Encouraged her");
						if(flags["GIANNA_BODY_TALK_RESULT"] != undefined) output2("\n<b>* Gianna, Talk, Specifications of Her Body:</b>");
						if(flags["GIANNA_BODY_TALK_RESULT"] == 0) output2(" Changed the topic");
						if(flags["GIANNA_BODY_TALK_RESULT"] == 1) output2(" Listened to her");
						if(flags["GIANNA_OWNER_TALK_RESULT"] != undefined) output2("\n<b>* Gianna, Talk, Owner Abandoning Her:</b>");
						if(flags["GIANNA_OWNER_TALK_RESULT"] == 0) output2(" Dissuaded her");
						if(flags["GIANNA_OWNER_TALK_RESULT"] == 1) output2(" Took a neutral stance");
						if(flags["GIANNA_OWNER_TALK_RESULT"] == 2) output2(" Comforted her");
					}
					if(flags["GIANNA_MAXBUTT_REACTION"] != undefined) output2("\n<b>* Gianna, Transformation, Response:</b>");
					if(flags["GIANNA_MAXBUTT_REACTION"] == 0) output2(" Jerk about giant booty");
					if(flags["GIANNA_MAXBUTT_REACTION"] == 1) output2(" Neutral about giant booty");
					if(flags["GIANNA_MAXBUTT_REACTION"] == 2) output2(" Nice about giant booty");
					// Temp
					if(flags["GIANNA_BODY_TALK_RESULT"] != undefined)
					{
						output2("\n<b>* Gianna, Body Temperature:</b>");
						if(flags["GIANNA_TEMP"] <= -1) output2(" Cool");
						else if(flags["GIANNA_TEMP"] >= 1) output2(" Hot");
						else output2(" Normal");
					}
					else output2(" Normal");
					// Personality
					if(flags["GIANNA_ABOUT_HER_TALK_RESULT"] != undefined)
					{
						var giannaPersonality:int = giannaPersonality();
						output2("\n<b>* Gianna, Personality:</b> " + giannaPersonality);
						if(giannaPersonality >= 100) output2(", Hyper Positive");
						else if(giannaPersonality > 80) output2(", Positive");
						else if(giannaPersonality > 60) output2(", Slightly Positive");
						else if(giannaPersonality >= 40) output2(", Generic");
						else if(giannaPersonality >= 20) output2(", Slightly Negative");
						else if(giannaPersonality > 0) output2(", Negative");
						else output2(", Very Negative");
					}
					// Attachments
					if(flags["GIANNA_BODY_TALK_RESULT"] != undefined)
					{
						output2("\n<b>* Gianna, Simulated Sex Organs:</b> " + listCharGenitals("GIANNA"));
					}
					// Sex stuff
					if(flags["GIANNA_STALL_SEEN"] != undefined || flags["GIANNA_TITFUCKS"] != undefined || flags["GIANNA_GIVEN_GIRLY_ORAL_YET"] != undefined || flags["SIXTYNINED_GIANNA"] != undefined || flags["FUCKED_GIANNA_VAGINALLY"] != undefined || flags["GIANNA_CUMFLATION_DISABLED"] != undefined)
					{
						output2("\n<b>* Gianna, Sexual History:</b> Sexed her");
						if(flags["GIANNA_STALL_SEEN"] != undefined) output2(", Fucked in stall");
						if(flags["GIANNA_TITFUCKS"] != undefined) output2(", Titfucked her");
						if(flags["GIANNA_GIVEN_GIRLY_ORAL_YET"] != undefined) output2(", She ate your pussy");
						if(flags["SIXTYNINED_GIANNA"] != undefined) output2(", 69’d with her");
						if(flags["FUCKED_GIANNA_VAGINALLY"] != undefined) output2(", Fucked her vagina");
						if(flags["GIANNA_CUMFLATION_DISABLED"] != undefined) output2(", Cumflation disabled");
					}
					// Timer
					if(flags["GIANNA_FUCK_TIMER"] != undefined) output2("\n<b>* Gianna, Time Since Last Fucked:</b> " + prettifyMinutes(flags["GIANNA_FUCK_TIMER"]));
					if(flags["GIANNA_X_ANNO_3SUM"] != undefined) output2("\n<b>* Gianna, Times Sexed in Threesome with Anno:</b> " + flags["GIANNA_X_ANNO_3SUM"]);
				}
				// Haley
				if(flags["MET_HALEY"] != undefined || flags["USED_MILKER"] != undefined)
				{
					output2("\n<b>* Haley:</b> Met her");
					if(flags["MET_HALEY"] != undefined) output2(", Sexed her");
					if(flags["FUCKED_BY_HALEY"] != undefined) output2(", Fucked by her");
					if(flags["USED_MILKER"] != undefined) output2("\n<b>* Haley, Times Used Taur-Milker:</b> " + flags["USED_MILKER"]);
					if(StatTracking.getStat("contests/haley milker losses") + StatTracking.getStat("contests/haley milker wins") > 0) output2("\n<b>* Haley, Milking Competition, Win/Loss Ratio:</b> " + StatTracking.getStat("contests/haley milker wins") + "/" + StatTracking.getStat("contests/haley milker losses") + ", of " + (StatTracking.getStat("contests/haley milker losses") + StatTracking.getStat("contests/haley milker wins")) + " games");
					if(StatTracking.getStat("haley milker/cum milked") > 0) output2("\n<b>* Haley, Milking Competition, Your Cum Milked:</b> " + mLs(Math.round(StatTracking.getStat("haley milker/cum milked"))));
					if(pc.hasStatusEffect("Won Haley's Credits")) output2("\n<b>* Haley, Milking Competition, Time Until Next Prize:</b> " + prettifyMinutes(pc.getStatusMinutes("Won Haley's Credits")));
				}
				// Millie milks!
				if(flags["MET_MILLIE"] != undefined)
				{
					output2("\n<b>* Millie:</b> Met her");
					if(flags["FUCKED_MILLIE"] != undefined) output2(", Sexed her");
					if(flags["TRIED_TREATMENT_LIGHT"] != undefined) output2(", Tried the Temporary Treatment");
					if(flags["MILLIE_LAST_ACTION"] != undefined) output2("\n<b>* Millie, Previous Action:</b> " + StringUtil.toTitleCase(flags["MILLIE_LAST_ACTION"]));
					if(flags["MILLIE_MILK_COUNT"] != undefined) output2("\n<b>* Millie, Times Milked By:</b> " + flags["MILLIE_MILK_COUNT"]);
				}
				// Fancy Yancy
				if(flags["MET_YANCY"] != undefined)
				{
					output2("\n<b>* Yancy:</b> Met him");
					if(flags["YANCY_SEXED"] != undefined) output2(", Sexed him");
					if(flags["YANCY_BUTTFUCKED_BY_PC"] != undefined) output2(", Fucked his ass");
					if(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] != undefined) output2("\n<b>* Yancy, Previous Action:</b> " + StringUtil.toTitleCase(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"]));
					if(flags["YANCY_MILKED_PC"] != undefined) output2("\n<b>* Yancy, Times Milked By:</b> " + flags["YANCY_MILKED_PC"]);
				}
				variousCount++;
			}
			// Miscreant Manor
			if(flags["MISCREANT_MANORED"] != undefined)
			{
				output2("\n<b><u>Miscreant Manor</u></b>");
				output2("\n<b>* Breeding Stocks, Times Used:</b> " + flags["MISCREANT_MANORED"]);
				variousCount++;
			}
			// Straps
			if(flags["MET_BUSKY"] != undefined)
			{
				output2("\n<b><u>Straps</u></b>");
				output2("\n<b>* Busky:</b> Met him");
				if(flags["BUSKY_AFFECTION"] != undefined) output2("\n<b>* Busky, Affection:</b> " + flags["BUSKY_AFFECTION"] + " %");
				if(flags["BUSKY_SEXED_COUNT"] != undefined) output2("\n<b>* Busky, Times Sexed:</b> " + flags["BUSKY_SEXED_COUNT"]);
				variousCount++;
			}
			// Ten Ton Gym
			if(flags["MET_QUENTON"] != undefined)
			{
				output2("\n<b><u>Ten Ton Gym</u></b>");
				output2("\n<b>* Quenton:</b> Met him");
				if(flags["SEXED_QUENTON"] != undefined) output2("\n<b>* Quenton, Times Sexed:</b> " + flags["SEXED_QUENTON"]);
				if(flags["MET_SHOWER_GIRLS"])
				{
					output2("\n<b>* Betsy and Victoria:</b> Met them");
					if(flags["SHOWER_SANDWICH"] != undefined) output2("\n<b>* Betsy and Victoria, Times Had Shower Sex With:</b> " + flags["SHOWER_SANDWICH"]);
					if(flags["TTGYM_BETSY_VICTORIA_SEXSWING"] != undefined) output2("\n<b>* Betsy and Victoria, Times Had Sex Using The Sex Swing:</b> " + flags["TTGYM_BETSY_VICTORIA_SEXSWING"]);
				}
				if(flags["MET_LOLA"] != undefined)
				{
					output2("\n<b>* Lola:</b> Met her");
					if(flags["SEXED_LOLA"] != undefined) output2("\n<b>* Lola, Times Sexed:</b> " + flags["SEXED_LOLA"]);
					if(flags["TTGYM_LOLA_POOL"] != undefined) output2("\n<b>* Lola, Times You Fucked Her Pussy (Pool):</b> " + flags["TTGYM_LOLA_POOL"]);
					if(flags["TTGYM_LOLA_PUSSY"] != undefined) output2("\n<b>* Lola, Times You Fucked Her Pussy (Home):</b> " + flags["TTGYM_LOLA_PUSSY"]);
					if(flags["TTGYM_LOLA_ANAL"] != undefined) output2("\n<b>* Lola, Times You Fucked Her Ass:</b> " + flags["TTGYM_LOLA_ANAL"]);
					if(flags["TTGYM_LOLA_HOTDOG"] != undefined) output2("\n<b>* Lola, Times You Hotdogged Her Ass:</b> " + flags["TTGYM_LOLA_HOTDOG"]);
					if(flags["TTGYM_LOLA_CUDDLE"] != undefined) output2("\n<b>* Lola, Times You Cuddled With Her:</b> " + flags["TTGYM_LOLA_CUDDLE"]);
				}
				if(flags["TTGYM_LOLA_SIMONE_HOME"] != undefined)
				{
					output2("\n<b>* Lola & Simone, Times You Had a Threesome:</b> " + flags["TTGYM_LOLA_SIMONE_HOME"]);
					if(flags["TTGYM_LOLA_SIMONE_S_FIN"] != undefined) output2("\n<b>* Lola & Simone, Times You Fingered Simone:</b> " + flags["TTGYM_LOLA_SIMONE_S_FIN"]);
					if(flags["TTGYM_LOLA_SIMONE_L_CUN"] != undefined) output2("\n<b>* Lola & Simone, Times You Licked Lola’s Pussy:</b> " + flags["TTGYM_LOLA_SIMONE_L_CUN"]);
					if(flags["TTGYM_LOLA_SIMONE_L_PUSSY"] != undefined) output2("\n<b>* Lola & Simone, Times You Fucked Lola’s Pussy:</b> " + flags["TTGYM_LOLA_SIMONE_L_PUSSY"]);
					if(flags["TTGYM_LOLA_SIMONE_S_PUSSY"] != undefined) output2("\n<b>* Lola & Simone, Times You Fucked Simone’s Pussy:</b> " + flags["TTGYM_LOLA_SIMONE_S_PUSSY"]);
					if(flags["TTGYM_LOLA_SIMONE_L_ASS"] != undefined) output2("\n<b>* Lola & Simone, Times You Fucked Lola’s Ass:</b> " + flags["TTGYM_LOLA_SIMONE_L_ASS"]);
					if(flags["TTGYM_LOLA_SIMONE_S_ASS"] != undefined) output2("\n<b>* Lola & Simone, Times You Fucked Simone’s Ass:</b> " + flags["TTGYM_LOLA_SIMONE_S_ASS"]);
					if(flags["TTGYM_LOLA_SIMONE_COCK_SFAL"] != undefined) output2("\n<b>* Lola & Simone, Times Simone Gave You a BJ:</b> " + flags["TTGYM_LOLA_SIMONE_COCK_SFAL"]);
					if(flags["TTGYM_LOLA_SIMONE_DP"] != undefined) output2("\n<b>* Lola & Simone, Times You DP’d Both Of Them:</b> " + flags["TTGYM_LOLA_SIMONE_DP"]);
					if(flags["TTGYM_LOLA_SIMONE_DBL_RIDE"] != undefined) output2("\n<b>* Lola & Simone, Times They Double Rode You:</b> " + flags["TTGYM_LOLA_SIMONE_DBL_RIDE"]);
					if(flags["TTGYM_LOLA_SIMONE_DBL_BJ"] != undefined) output2("\n<b>* Lola & Simone, Times They Gave You Double BJ :</b> " + flags["TTGYM_LOLA_SIMONE_DBL_BJ"]);
					if(flags["TTGYM_LOLA_SIMONE_PUSSY_LCUN"] != undefined) output2("\n<b>* Lola & Simone, Times Lola Licked Your Pussy:</b> " + flags["TTGYM_LOLA_SIMONE_PUSSY_LCUN"]);
					if(flags["TTGYM_LOLA_SIMONE_PUSSY_SCUN"] != undefined) output2("\n<b>* Lola & Simone, Times Simone Licked Your Pussy:</b> " + flags["TTGYM_LOLA_SIMONE_PUSSY_SCUN"]);
					if(flags["TTGYM_LOLA_SIMONE_PUSSY_HL"] != undefined) output2("\n<b>* Lola & Simone, Times Simone Fucked You With a Hardlight:</b> " + flags["TTGYM_LOLA_SIMONE_PUSSY_HL"]);
				}
				if(flags["MET_MIRRIN"] != undefined && !MailManager.isEntryUnlocked("mirrin_tavros")) writeMirrinLogEntry(); // see newTexas/mirrinPregpack.as
				if(flags["MET_SIMONE"] != undefined)
				{
					output2("\n<b>* Simone:</b> Met her");
					if(StatTracking.getStat("contests/simone challenge losses") + StatTracking.getStat("contests/simone challenge wins") > 0) output2("\n<b>* Simone, Weight Lift Challenge, Win/Loss Ratio:</b> " + StatTracking.getStat("contests/simone challenge wins") + "/" + StatTracking.getStat("contests/simone challenge losses") + ", of " + (StatTracking.getStat("contests/simone challenge losses") + StatTracking.getStat("contests/simone challenge wins")) + " games");
					if(flags["SEXED_SIMONE"] != undefined) output2("\n<b>* Simone, Times Sexed:</b> " + flags["SEXED_SIMONE"]);
					if(flags["TTGYM_SIMONE_ORAL_GIVE"] != undefined && flags["TTGYM_SIMONE_ORAL_GIVE"] > 0) output2("\n<b>* Simone, Times You Gave Her Oral:</b> " + flags["TTGYM_SIMONE_ORAL_GIVE"]);
					if(flags["TTGYM_SIMONE_ORAL"] != undefined && flags["TTGYM_SIMONE_ORAL"] > 0) output2("\n<b>* Simone, Times She Gave You Oral:</b> " + flags["TTGYM_SIMONE_ORAL"]);
					if(flags["TTGYM_SIMONE_DP_GYM"] != undefined && flags["TTGYM_SIMONE_DP_GYM"] > 0) output2("\n<b>* Simone, Times You DP’d Her (Gym):</b> " + flags["TTGYM_SIMONE_DP_GYM"]);
					if(flags["TTGYM_SIMONE_DP_HOME"] != undefined) output2("\n<b>* Simone, Times You DP’d Her (Home):</b> " + flags["TTGYM_SIMONE_DP_HOME"]);
					if(flags["TTGYM_SIMONE_FUCKED_PUSSY"] != undefined) output2("\n<b>* Simone, Times You Fucked Her Pussy:</b> " + flags["TTGYM_SIMONE_FUCKED_PUSSY"]);
					if(flags["TTGYM_SIMONE_MUTUAL_FAP"] != undefined) output2("\n<b>* Simone, Times You Dildoed Each Other:</b> " + flags["TTGYM_SIMONE_MUTUAL_FAP"]);
				}
				if(flags["WATCHED_LEE"] != undefined && flags["WATCHED_NICO"] != undefined) output2("\n<b>* Lee and Nico:</b> Watched them fuck");
				variousCount++;
			}
		}
		
		if(showID == "Mhen'ga" || showID == "All")
		{
			// Customs
			if(flags["MET_FLAHNE"] != undefined)
			{
				output2("\n<b><u>Mhen’ga Customs Office</u></b>");
				// Flahne da Rahn
				output2("\n<b>* Flahne:</b> Met her");
				if(flags["FLAHNE_EXHIBITIONISM_UNLOCKED"] != undefined) output2(", Into exhibitionism");
				if(flags["HUGGED_FLAHNE"] != undefined) output2(", Hugged her");
				if(flags["FLAHNE_TALKED_ABOUT_CUMSLUTPENNY"] != undefined) output2(", Talked about cum-slut Penny");
				if(pc.hasStatusEffect("Flahne_Extra_Pissed")) output2("\n<b>* Flahne, Interaction:</b> Extra pissed off for " + prettifyMinutes(pc.getStatusMinutes("Flahne_Extra_Pissed")));
				else if(flags["FLAHNE_PISSED"] > 0) output2("\n<b>* Flahne, Interaction:</b> Pissed off for " + flags["FLAHNE_PISSED"] + " hours");
				if(flags["FLAHNE_LIKE_OVIPOSITOR"] != undefined)
				{
					output2("\n<b>* Flahne, Ovipositor:</b>");
					if(flags["FLAHNE_LIKE_OVIPOSITOR"] < 1) output2(" Hidden");
					else if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output2(" Exposed");
					else output2(" <i>Unknown</i>");
				}
				if(flags["FLAHNE_BUBBLED"] != undefined) output2("\n<b>* Flahne, Times Given Cum Bubble:</b> " + flags["FLAHNE_BUBBLED"]);
				if(flags["FLAHNE_SEXED"] != undefined) output2("\n<b>* Flahne, Times Sexed:</b> " + flags["FLAHNE_SEXED"]);
				if(flags["FLAHNE_CSNAKED"] != undefined) output2("\n<b>* Flahne, Times She Fucked Your Tail Cunt:</b> " + flags["FLAHNE_CSNAKED"]);
				variousCount++;
			}
			// Scrapyard
			if(flags["SCRAPYARD_SEEN"] != undefined)
			{
				output2("\n<b><u>The Art of Scrapyard Maintenance</u></b>");
				output2("\n<b>* Artie:</b> Met him");
				if(flags["MET_GEOFF"] != undefined)
				{
					output2("\n<b>* Geoff:</b> Met him");
					if(flags["SEXED_GEOFF"] != undefined) output2(", Sexed him");
					if(flags["SEXED_GEOFF_MASC"] != undefined) 
					{
						output2(", Male-on-male sex");
						if(flags["GEOFF_FUCKED_DUDES_TWICE"] != undefined) output2(" more than once");
					}
					if(flags["GEOFF_TOPPED"] != undefined)
					output2(", Fucked his ass");
					if(flags["GEOFF_TOPPED"] >= 2) output2(" more than once");
				}
				variousCount++;
			}
			// Badass Mead Hall
			if(flags["MET_BURT"] != undefined || flags["KELLY_MET"] != undefined || flags["MET_SYRI"] != undefined || flags["KASE_INTRO"] != undefined || flags["ERIKA_MET"] != undefined || flags["ZILTWINS_MET"] != undefined || flags["THYVARA_MET"] != undefined)
			{
				output2("\n<b><u>Burt’s Badass Mead Hall</u></b>");
				// Burt and Company
				if(flags["MET_BURT"] != undefined)
				{
					output2("\n<b>* Burt:</b> Met him");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] != undefined) output2("\n<b>* Burt, Talk, Mead Hall Topics:</b>");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] >= 1) output2(" Three-Dee");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] == 2) output2(" and");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] > 2) output2(",");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] >= 2) output2(" patrons");
					if(flags["BURT_MEAD_HALL_DISCUSSIONS"] >= 3) output2(", Honey and other employees");
					if(flags["BURT_ZIL_TALK"] != undefined) output2("\n<b>* Burt, Talk, Zil Topics:</b>");
					if(flags["BURT_ZIL_TALK"] >= 1) output2(" The zil culture");
					if(flags["BURT_ZIL_TALK"] == 2) output2(" and");
					if(flags["BURT_ZIL_TALK"] > 2) output2(",");
					if(flags["BURT_ZIL_TALK"] >= 2) output2(" sex drive");
					if(flags["BURT_ZIL_TALK"] == 3) output2(" and");
					if(flags["BURT_ZIL_TALK"] > 3) output2(",");
					if(flags["BURT_ZIL_TALK"] >= 3) output2(" combat methods");
					if(flags["BURT_DRINKS_BOUGHT"] != undefined) output2("\n<b>* Burt, Drinks Bought Total:</b> " + flags["BURT_DRINKS_BOUGHT"]);
					if(flags["TIMES_FUCKED_BURT"] != undefined) output2("\n<b>* Burt, Times Sexed:</b> " + flags["TIMES_FUCKED_BURT"]);
					if(flags["TIMES_THREE_D_SURPRISE_SEXED"] != undefined) output2("\n<b>* Three-Dee, Times Surprise Sexed:</b> " + flags["TIMES_THREE_D_SURPRISE_SEXED"]);
				}
				//Kase the pyrite kittyboi 
				if(flags["KASE_INTRO"] != undefined)
				{
					output2("\n<b>* Kase:</b> Met him");
					if(flags["KASE_TIMER"]+(60*24*7) <= GetGameTimestamp() && flags["KASE_CREW"] == undefined) output2(", Left Mhen’ga");
					if(kaseIsRecruited())
					{
						output2(", Crew member");
						if(kaseIsCrew()) output2(" (Onboard Ship)");
						else output2(" (At Tavros Station)");
					}
					if(flags["KASE_HEALED"] == 1) output2(", Arm healed");
					if(flags["KASE_SEXED"] != undefined) output2("\n<b>* Kase, Times Sexed:</b> " + flags["KASE_SEXED"]);
					if(flags["KASE_3SUM_ANNO"] != undefined) output2("\n<b>* Kase, Times had threesome with Anno:</b> " + flags["KASE_3SUM_ANNO"]);
				}
				// Kelly Golden Honey Bunny Butts!
				if(flags["KELLY_MET"] != undefined && flags["KELLY_ENCOUNTERED_AT_THE_BAR"] != undefined)
				{
					output2("\n<b>* Kelly:</b>");
					if(hours >= 6 && hours < 17) output2(" At work");
					else output2(" Met her");
					if(flags["KELLY_CONFESSED"] != undefined) output2(", Confessed her affection");
					if(flags["KELLY_HAD_A_MEAL_SHARED"] != undefined) output2(", Shared a meal together");
					if(flags["KELLY_ATTRACTION"] != undefined) output2("\n<b>* Kelly, Attraction:</b> " + flags["KELLY_ATTRACTION"] + " %");
					if(flags["KELLY_SEXED"] != undefined) output2("\n<b>* Kelly, Times Sexed:</b> " + flags["KELLY_SEXED"]);
					if(flags["KELLY_BLOWJOBS_GIVEN"] != undefined) output2("\n<b>* Kelly, Times Given Her Blowjobs:</b> " + flags["KELLY_BLOWJOBS_GIVEN"]);
					if(flags["KELLY_HYPERPLAY_COUNT"] != undefined) output2("\n<b>* Kelly, Times Hyperplay:</b> " + flags["KELLY_HYPERPLAY_COUNT"]);
					if(flags["KELLY_HYPERBJ"] != undefined) output2("\n<b>* Kelly, Times Given Her Hyper Blowjobs:</b> " + flags["KELLY_HYPERBJ"]);
					if(flags["KELLY_HAD_SPECIAL_TAUR_DP"] != undefined) output2("\n<b>* Kelly, Times Had Tauric Double Penetrate:</b> " + flags["KELLY_HAD_SPECIAL_TAUR_DP"]);
					if(flags["KELLY_TIMES_DOUBLESTUFFED_THE_PC"] != undefined) output2("\n<b>* Kelly, Times Getting Double-Stuffed:</b> " + flags["KELLY_TIMES_DOUBLESTUFFED_THE_PC"]);
				}
				// Syributts!
				if(flags["MET_SYRI"] != undefined)
				{
					output2("\n<b>* Syri:</b>");
					if(flags["SYRI_TALKS"] != undefined) output2(" Friend");
					else output2(" Met her");
					if(flags["SYRI_SEEN_PCS_SHIP_CABIN"] != undefined) output2(", She’s seen your ship’s cabin");
					if(flags["ANNOxSYRI_WINCEST"] != undefined) output2(", Sexed her with Anno")
					if(flags["SYRI_MILOFUCK"] != undefined) output2(", Sexed Ziresh and her mother with Syri");
					if(syriRecruited())
					{
						output2(", Crew member");
						if(syriIsCrew()) output2(" (Onboard Ship)");
						else if(flags["SYRI_CREWMEMBER"] == 0) output2(" (At Mhen’ga)");
						else if(flags["SYRI_CREWMEMBER"] == 2) output2(" (At Uveto)");
					}
					if(flags["SYRIQUEST_POST_GAME_TALK_LOVE"] != undefined)
					{
						output2("\n<b>* Syri, Relationship:</b>");
						switch(flags["SYRIQUEST_POST_GAME_TALK_LOVE"])
						{
							case 1: output2(" Lovers"); break;
							case 2: output2(" Friends"); break;
							default: output2(" Strangers"); break;
						}
					}
					//if(flags["SEEN_SYRI_IN_THE_MORNING"] != undefined) output2("\n<b>* Syri, Times Seen Her in the Morning:</b> " + flags["SEEN_SYRI_IN_THE_MORNING"]);
					if(flags["BET_AGAINST_SYRI"] != undefined)
					{
						output2("\n<b>* Syri, Gaming:</b> Bet against her");
						if(flags["SYRI_WINBET_VAG"] != undefined) output2(", Insisted she fuck your vagina");
					}
					if(flags["TIMES_BET_YOURSELF_AGAINST_SYRI"] != undefined) output2("\n<b>* Syri, Gaming, Times Betting Yourself:</b> " + flags["TIMES_BET_YOURSELF_AGAINST_SYRI"]);
					var syriShootsWin:int = (flags["TIMES_WON_AGAINST_SYRI"] > 0 ? flags["TIMES_WON_AGAINST_SYRI"] : 0);
					var syriShootsLoss:int = (flags["TIMES_LOST_TO_SYRI"] > 0 ? flags["TIMES_LOST_TO_SYRI"] : 0);
					var syriShootsTotal:int = (syriShootsWin + syriShootsLoss);
					if(syriShootsTotal > 0) output2("\n<b>* Syri, Gaming, Win/Loss Ratio:</b> " + syriShootsWin + "/" + syriShootsLoss + ", of " + syriShootsTotal + " games");
					syriShootsWin = (flags["SYRI_PETPLAY_WINS"] > 0 ? flags["SYRI_PETPLAY_WINS"] : 0);
					syriShootsLoss = (flags["SYRI_PETPLAY_LOST"] > 0 ? flags["SYRI_PETPLAY_LOST"] : 0);
					syriShootsTotal = (syriShootsWin + syriShootsLoss);
					if(syriShootsTotal > 0) output2("\n<b>* Syri, Pet-Play, Win/Loss Ratio:</b> " + syriShootsWin + "/" + syriShootsLoss + ", of " + syriShootsTotal + " games");
					if(flags["FUCKED_SYRI_COUNT"] != undefined) output2("\n<b>* Syri, Times Sexed:</b> " + flags["FUCKED_SYRI_COUNT"]);
					if(flags["TIMES_BUTTFUCKED_BY_SYRI"] != undefined) output2("\n<b>* Syri, Times She Fucked Your Ass:</b> " + flags["TIMES_BUTTFUCKED_BY_SYRI"]);
					if(flags["SyriTailcocked"] != undefined) output2("\n<b>* Syri, Times You Used Your Tailcock on Her:</b> " + flags["SyriTailcocked"]);
				}
				if (flags["THYVARA_MET"] != undefined)
				{
					output2("\n<b>* Thyvara Rosanvond:</b> Met her");
					if (flags["THYVARA_PROGRESS"] != undefined)
					{
						if (flags["THYVARA_PROGRESS"] == 5) output2(", Lovers");
						else if (flags["THYVARA_PROGRESS"] == 4) output2(", Buddies");
					}
					if (flags["THYVARA_SEX_FUCK"] != undefined) output2("\n<b>* Thyvara Rosanvond, Times Fucked:</b> " + flags["THYVARA_SEX_FUCK"]);
					if (flags["THYVARA_SEX_69"] != undefined) output2("\n<b>* Thyvara Rosanvond, Times 69:</b> " + flags["THYVARA_SEX_69"]);
				}
				// Erika
				if(flags["ERIKA_MET"] != undefined)
				{
					output2("\n<b>* Erika:</b> Met her");
					if(flags["ERIKA_SEEN_NAKED"] != undefined) output2(", Seen her naked");
					if(flags["ERIKA_GIVEN_ANUSOFT"] != undefined) output2(", Gave her Anusoft");
					if(flags["ERIKA_SEXED"] != undefined)
					{
						output2("\n<b>* Erika, Sexual Organs:</b> " + listCharGenitals("ERIKA"));
						output2("\n<b>* Erika, Times Sexed:</b> " + flags["ERIKA_SEXED"]);
					}
				}
				//Tetra & Mica The Zil Twins
				if(flags["ZILTWINS_MET"] != undefined)
				{
					output2("\n<b>* Tetra & Mica:</b> Met them");
					if(flags["ZILTWINS_MET"]) output2(", Let Mica sample you");
					if(flags["ZILTWINS_MICA_TEASED"] != undefined) output2(", Saw Mica dance");
					if(flags["ZILTWINS_MICA_BUTTFUCKED"] != undefined) output2(", Fucked Mica");
					if(flags["ZILTWINS_TETRA_FUCKED"] != undefined) output2(", Fucked Tetra");
					if(flags["ZILTWINS_BOTH_FUCKED"] != undefined) output2(", Got spitroasted");
				}
				variousCount++;
			}
			// Crazy Carl!
			if(flags["MET_CARL"] != undefined)
			{
				output2("\n<b><u>Crazy Carl’s Crude Cylinder Collection Cache</u></b>");
				output2("\n<b>* Carl:</b> Met him");
				variousCount++;
			}
			// Nurse Joy-robot
			if(flags["MET_VKO"] != undefined)
			{
				output2("\n<b><u>Medical Office</u></b>");
				output2("\n<b>* V-Ko:</b> Met her");
				if(flags["GOT_VKO_STRESS_RELIEF"] != undefined) output2(", Got stress relief");
				if(flags["TIMES_ELECTROSTIMMED_BY_VKO"] != undefined) output2(", Got electro-stimulated");
				variousCount++;
			}
			// Thare Plantation
			if(flags["THARE_MANOR_ENTERED"] != undefined)
			{
				output2("\n<b><u>Thare Plantation</u></b>");
				output2("\n<b>* Professor Darnock:</b> Met him");
				output2("\n<b>* Able:</b> Met him");
				if(flags["ABLE_BATHS"] != undefined) output2("\n<b>* Able, Times Bathed By:</b> " + flags["ABLE_BATHS"]);
				if(flags["ABLE_BUTTSEXED"] != undefined) output2("\n<b>* Able, Times Fucked His Ass:</b> " + flags["ABLE_BUTTSEXED"]);
				if(flags["ABLE_LICKNFUCKED"] != undefined) output2("\n<b>* Able, Times Licked By and Rode Him:</b> " + flags["ABLE_LICKNFUCKED"]);
				if(flags["ABLE_BOTHWAYS"] != undefined) output2("\n<b>* Able, Times Rode and Buttfucked Him:</b> " + flags["ABLE_BOTHWAYS"]);
				variousCount++;
			}
			// Pennybutts
			if(flags["MET_PENNY"] != undefined)
			{
				output2("\n<b><u>U.G.C. Peacekeepers Office</u></b>");
				output2("\n<b>* Penny:</b> Met her");
				if(flags["PENNY_BADGER_BIMBO"] != undefined) output2(", Bimbofied");
				if(pennyRecruited())
				{
					output2(", Crew member");
					if(pennyIsCrew()) output2(" (Onboard Ship)");
				}
				if(flags["PENNY_IS_A_CUMSLUT"] != undefined)
				{
					output2("\n<b>* Penny, Visible Libido:</b>");
					if(flags["PENNY_HIDING_CUMSLUTTERY"] != undefined)
					{
						output2(" Hiding her");
						if(flags["SEEN_PENNY_HIDE_CUMSLUTTERY"] != undefined) output2(" obvious");
						output2(" cum-sluttery");
					}
					if(flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] != undefined)
					{
						output2(" Allowing others to watch her");
						if(flags["PENNY_BEEN_IN_WATCH_CUMSLUT_MODE_AND_BLOWN_IN_FRONT_OF_PC"] != undefined) output2(" exhibitionist");
						output2(" cum-sluttery");
					}
					if(flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] != undefined)
					{
						output2(" Having others join in sexing her as a");
						if(flags["SEEN_PENNY_BE_A_GANGBANG_SLUT"] != undefined) output2(" gangbanged");
						output2(" cum-slut");
					}
				}
				if(flags["PENNY_AFFECTION"] != undefined) output2("\n<b>* Penny, Affection:</b> " + flags["PENNY_AFFECTION"] + " %");
				if(flags["PENNY_FUTA_TALK"] != undefined) output2("\n<b>* Penny, Lust:</b> " + chars["PENNY"].lust());
				if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] != undefined) output2("\n<b>* Penny, Throbb:</b> Available for purchase");
				if(flags["PENNY_THROBB_USES"] != undefined) output2("\n<b>* Penny, Throbb, Times Used:</b> " + flags["PENNY_THROBB_USES"]);
				if(flags["SEXED_PENNY"] != undefined)
				{
					output2("\n<b>* Penny, Sexual Organs:</b> " + listCharGenitals("PENNY"));
					output2("\n<b>* Penny, Sexual History:</b> Sexed her");
					if(flags["TIMES_FROTTAGED_PENNY"] != undefined) output2(", Frottaged her");
					if(flags["TIMES_PENNY_PAWJOBBED"] != undefined) output2(", She gave a pawjob");
				}
				if(flags["PENNY_TIMES_ANAL_SEXED"] != undefined) output2("\n<b>* Penny, Times Fucked Her Ass:</b> " + flags["PENNY_TIMES_ANAL_SEXED"]);
				if(flags["PENNY_TIMES_OVER_DESK_FUCKED"] != undefined) output2("\n<b>* Penny, Times Fucked Her Over Desk:</b> " + flags["PENNY_TIMES_OVER_DESK_FUCKED"]);
				if(flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] != undefined) output2("\n<b>* Penny, Times Jacked Her Off With An Onahole:</b> " + flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"]);
				variousCount++;
			}
			// Tanis Bow Trainings
			if(flags["TANIS_APPROACHED"] != undefined)
			{
				output2("\n<b><u>U.G.C. Scout Authority</u></b>");
				output2("\n<b>* Tanis:</b> Met him");
				if(flags["TANIS_BOW_INTRO"] != undefined && flags["TANIS_BOW_TRAINING"] != undefined)
				{
					output2("\n<b>* Tanis, Bow Training Sessions Total:</b> " + flags["TANIS_BOW_TRAINING"]);
					if(flags["TANIS_BOW_TRAINING"] >= 12) output2(", Completed");
				}
				variousCount++;
			}
			// Xenogen Laboratory
			if(flags["MET_DR_HASWELL"] != undefined || flags["KELLY_MET"] != undefined || flags["SEEN_XENOGEN_PROTEST"] != undefined)
			{
				output2("\n<b><u>Xenogen Biotech Laboratory</u></b>");
				// Xenogen Go Home!
				if(flags["SEEN_XENOGEN_PROTEST"] != undefined) output2("\n<b>* Anti-Xenogen Protestors:</b> Seen");
				// Julian Haswell
				if(flags["MET_DR_HASWELL"] != undefined) output2("\n<b>* Dr. Haswell:</b> Met him");
				// Kelly!
				if(flags["KELLY_MET"] != undefined)
				{
					output2("\n<b>* Kelly:</b>");
					if(hours >= 6 && hours < 17) output2(" Met her");
					else output2(" At bar");
					if(flags["KELLY_SKYSAP_COLLECT"] != undefined)
					{
						output2("\n<b>* Kelly, Sky Sap, Containers Collected:</b> " + flags["KELLY_SKYSAP_COLLECT"]);
						if(flags["SYNTHSAP_UNLOCKED"] == undefined && pc.hasStatusEffect("SynthSap Research")) output2(" (Researching... " + prettifyMinutes(pc.getStatusMinutes("SynthSap Research")) + ")");
					}
				}
				variousCount++;
			}
			// Zil Village
			if(flags["PQ_RESOLUTION"] != undefined)
			{
				output2("\n<b><u>Zil Village</u></b>");
				output2("\n<b>* Quinn:</b> Met her");
				if(flags["QUINN_PREG_TIMER"] != undefined) output2("\n<b>* Quinn, Days Pregnant:</b> " + flags["QUINN_PREG_TIMER"]);
				if(flags["QUINN_TOTAL_KIDS"] > 0) output2("\n<b>* Quinn, Total Kids:</b> " + flags["QUINN_TOTAL_KIDS"]);
				if(flags["SEXED_QUINN"] != undefined) output2("\n<b>* Quinn, Times Sexed:</b> " + flags["SEXED_QUINN"]);
				if(flags["QUINN_EVERY_HOLED"] != undefined) output2("\n<b>* Quinn, Time Since Last Sexed in Every Hole:</b> " + prettifyMinutes(GetGameTimestamp() - flags["QUINN_EVERY_HOLED"]));
				if(flags["QUINN_KID_PLAYS"] != undefined) output2("\n<b>* " + quinnBabyName() + ", Times Played With:</b> " + flags["QUINN_KID_PLAYS"]);
				if(flags["QUINN_MAIDENS_MET"] != undefined) output2("\n<b>* Fetch and Carry:</b> Met them");
				if(flags["QUINN_MAIDENS_SEXED"] != undefined) output2("\n<b>* Fetch and Carry, Times Sexed:</b> " + flags["QUINN_MAIDENS_SEXED"]);
				if(flags["PQUEST_WATERFALLED"] != undefined)
				{
					output2("\n<b>* Kane:</b> Met him");
					//Post-Quest Kane
					if(kaneDominance() != -1 && flags["KANE_STATUS"] != undefined)
					{
						switch(flags["KANE_STATUS"])
						{
							case 1: output2(", Fighting for dominance"); break;
							case 2: output2(", He’s in charge"); break;
							case 3: output2(", Marked him"); break;
						}
					}
					if(kaneDominance() > 0) output2("\n<b>* Kane, Dominance:</b> " + formatFloat(kaneDominance(), 1) + " %");
				}
				variousCount++;
			}
			// Jungles
			if(flags["MET_CUNT_SNAKE"] != undefined || flags["ENCOUNTERED_MIMBRANE"] != undefined || flags["TIMES_MET_FEMZIL"] != undefined || flags["ENCOUNTERED_ZIL"] != undefined || flags["TIMES_MET_NALEEN"] != undefined || flags["TIMES_MET_MALE_NALEEN"] != undefined || flags["NALEEN_HERM_MET"] != undefined || flags["TIMES_MET_VENUS_PITCHER"] != undefined || flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"] != undefined || flags["MET_VANAE_MAIDEN"] != undefined || flags["MET_VANAE_HUNTRESS"] != undefined || flags["MET_KEROKORAS"] != undefined || flags["DRYAD_MET"] != undefined || flags["PRAI_MET"] != undefined)
			{
				output2("\n<b><u>Mhen’gan Jungles</u></b>");
				// Dryad
				if(flags["DRYAD_MET"] != undefined)
				{
					var dname:String = (amberRecruited() ? "Amber" : "Dryad");
					output2("\n<b>* " + dname + ":</b> Met her");
					if(amberRecruited())
					{
						output2(", Crew member");
						if(amberIsCrew()) output2(" (Onboard Ship)");
					}
					if(flags["AMBER_CURED"] == 1) output2(", Cured");
					if(amberInHeat()) output2(", In Heat");
					if(pc.statusEffectv1("Dryad Encounters") > 0) output2("\n<b>* " + dname + ", Times Encountered Today:</b> " + pc.statusEffectv1("Dryad Encounters"));
					if(flags["AMBER_DUMBFUCK"] != undefined) output2("\n<b>* " + dname + ", Dumbfuck Pills Given:</b> " + flags["AMBER_DUMBFUCK"]);
					if(flags["AMBER_EQUILICUM"] != undefined) output2("\n<b>* " + dname + ", Has Taken Equilicum</b>");
					if(flags["DRYAD_FUCKED"] != undefined) output2("\n<b>* " + dname + ", Times Sexed:</b> " + flags["DRYAD_FUCKED"]);
					if(flags["DRYAD_BLEWHER"] != undefined) output2("\n<b>* " + dname + ", Times You Sucked Her Dick:</b> " + flags["DRYAD_BLEWHER"]);
					if(flags["DRYAD_FACEFUCKED"] != undefined) output2("\n<b>* " + dname + ", Times She Sucked Your Dick:</b> " + flags["DRYAD_FACEFUCKED"]);
					if(flags["DRYAD_CUNHER"] != undefined) output2("\n<b>* " + dname + ", Times You Licked Her Pussy:</b> " + flags["DRYAD_CUNHER"]);
					if(flags["DRYAD_CUNYOU"] != undefined) output2("\n<b>* " + dname + ", Times She Licked Your Pussy:</b> " + flags["DRYAD_CUNYOU"]);
					if(flags["DRYAD_HERCUNT"] != undefined) output2("\n<b>* " + dname + ", Times You Fucked Her Pussy:</b> " + flags["DRYAD_HERCUNT"]);
					if(flags["DRYAD_MOUNTING"] != undefined) output2("\n<b>* " + dname + ", Times You Fucked Her Pussy Using Mounting Equipment:</b> " + flags["DRYAD_MOUNTING"]);
					if(flags["DRYAD_YOURCUNT"] != undefined) output2("\n<b>* " + dname + ", Times She Fucked Your Pussy:</b> " + flags["DRYAD_YOURCUNT"]);
					if(flags["DRYAD_ANALED"] != undefined) output2("\n<b>* " + dname + ", Times You Fucked Her Ass:</b> " + flags["DRYAD_ANALED"]);
					if(flags["DRYAD_ANALEDYOU"] != undefined) output2("\n<b>* " + dname + ", Times She Fucked Your Ass:</b> " + flags["DRYAD_ANALEDYOU"]);
					if(flags["DRYAD_DRAINED"] != undefined) output2("\n<b>* " + dname + ", Times You Drained Her:</b> " + flags["DRYAD_DRAINED"]);
				}
				//Prai Ellit
				if(flags["PRAI_MET"] != undefined)
				{
					if(flags["PRAI_WHO"] == undefined) output2("\n<b>* Stuck Kui-tan Girl:</b> Met her");
					else
					{
						output2("\n<b>* Prai:</b> Met her, Helped her");
						if(flags["PRAI_SEX"] != undefined) output2("\n<b>* Prai, Times Sexed:</b> " + flags["PRAI_SEX"]);
					}
				}
				//Yoma
				if(flags["YOMA_MET"] != undefined)
				{
					output2("\n<b>* Yoma:</b> Met him");
					if(flags["YOMA_DATE_PROGRESS"] != undefined)
					{
						output2(", Times Dated: ");
						if(flags["YOMA_RELATIONSHIP"] >= 6 ) output2("3");
						else if(flags["YOMA_RELATIONSHIP"] == 4 ) output2("2");
						else output2("2");
					}
					output2(", Relationship: ");
					if(flags["YOMA_RELATIONSHIP"] == undefined ) output2("Acquaintances");
					else if(flags["YOMA_RELATIONSHIP"] == 0 ) output2("Fuckbuddies");
					else if(flags["YOMA_RELATIONSHIP"] == 1 ) output2("Lovers");
					if(flags["YOMA_GAMES_PLAYED"] != undefined) output2("\n<b>* Yoma, Times You Played His RPG Game:</b> " + flags["YOMA_GAMES_PLAYED"]);
					if(flags["YOMA_TIMES_HUGGED"] != undefined) output2("\n<b>* Yoma, Times Hugged:</b> " + flags["YOMA_TIMES_HUGGED"]);
					if(flags["YOMA_TIMES_ORALED"] != undefined) output2("\n<b>* Yoma, Times He Oral Sexed You:</b> " + flags["YOMA_TIMES_ORALED"]);
					if(flags["YOMA_TIMES_EATEN_OUT"] != undefined) output2("\n<b>* Yoma, Times Licked Him Out:</b> " + flags["YOMA_TIMES_EATEN_OUT"]);
					if(flags["YOMA_TIMES_TRIBBED"] != undefined) output2("\n<b>* Yoma, Times Scissored With Him:</b> " + flags["YOMA_TIMES_TRIBBED"]);
					if(flags["YOMA_TIMES_FINGERED"] != undefined) output2("\n<b>* Yoma, Times Fingered Each Other:</b> " + flags["YOMA_TIMES_FINGERED"]);
					if(flags["YOMA_TIMES_VAGINAL"] != undefined) output2("\n<b>* Yoma, Times Fucked His Pussy With Your Dick:</b> " + flags["YOMA_TIMES_VAGINAL"]);
					if(flags["YOMA_TIMES_ANALED"] != undefined) output2("\n<b>* Yoma, Times Fucked His Ass With Your Dick:</b> " + flags["YOMA_TIMES_ANALED"]);
					if(flags["YOMA_TIMES_TAILFUCKED"] != undefined) output2("\n<b>* Yoma, Times Fucked Him With Your Tailcock:</b> " + flags["YOMA_TIMES_TAILFUCKED"]);
				}
				if(flags["MET_CUNT_SNAKE"] != undefined) output2("\n<b>* Cunt Snake, Times Encountered:</b> " + flags["MET_CUNT_SNAKE"]);
				if(flags["MET_KEROKORAS"] != undefined)
				{
					output2("\n<b>* Kerokoras, Times Encountered:</b> " + flags["MET_KEROKORAS"]);
					if(flags["KEROKORAS_PREG"] != undefined) output2("\n<b>* Kerokoras, Times Impregnated:</b> " + flags["KEROKORAS_PREG"]);
				}
				if(flags["ENCOUNTERED_MIMBRANE"] != undefined) output2("\n<b>* Mimbranes, Times Encountered:</b> " + flags["ENCOUNTERED_MIMBRANE"]);
				if(flags["TIMES_MET_NALEEN"] != undefined)
				{
					output2("\n<b>* Naleen Huntress, Times Encountered:</b> " + flags["TIMES_MET_NALEEN"]);
					if(flags["NALEEN_SNUGGLED"] != undefined) output2("\n<b>* Naleen Huntress, Times Snuggled With:</b> " + flags["NALEEN_SNUGGLED"]);
					if(totalNaleenSexCount() > 0) output2("\n<b>* Naleen Huntress, Times Sexed:</b> " + totalNaleenSexCount());
				}
				if(flags["TIMES_MET_MALE_NALEEN"] != undefined) output2("\n<b>* Male Naleen, Times Encountered:</b> " + flags["TIMES_MET_MALE_NALEEN"]);
				if(flags["NALEEN_HERM_MET"] != undefined) output2("\n<b>* Hermaphrodite Naleen, Times Encountered:</b> " + flags["NALEEN_HERM_MET"]);
				if(flags["MET_VANAE_MAIDEN"] != undefined)
				{
					output2("\n<b>* Vanae Maiden, Times Encountered:</b> " + flags["MET_VANAE_MAIDEN"]);
					if(StatTracking.getStat("characters/maiden vanae/cherrys popped") > 0) output2("\n<b>* Vanae Maiden, Total Deflowered:</b> " + StatTracking.getStat("characters/maiden vanae/cherrys popped"));
					if(flags["VANEA_MAIDEN_PREG"] != undefined) output2("\n<b>* Vanae Maiden, Times Impregnated:</b> " + flags["VANEA_MAIDEN_PREG"]);
				}
				if(flags["MET_VANAE_HUNTRESS"] != undefined)
				{
					output2("\n<b>* Vanae Huntress, Times Encountered:</b> " + flags["MET_VANAE_HUNTRESS"]);
					if(flags["VANAE_HUNTRESS_BRED"] != undefined) output2("\n<b>* Vanae Huntress, Times Bred By:</b> " + flags["VANAE_HUNTRESS_BRED"]);
					if(flags["VANEA_HUNTRESS_PREG"] != undefined) output2("\n<b>* Vanae Huntress, Times Impregnated:</b> " + flags["VANEA_HUNTRESS_PREG"]);
					if(flags["VANAE_MILKBATH_TIMES"] != undefined) output2("\n<b>* Vanae Huntress, Times Received Milkbath By:</b> " + flags["VANAE_MILKBATH_TIMES"]);
				}
				if(flags["TIMES_MET_VENUS_PITCHER"] != undefined) output2("\n<b>* Venus Pitcher, Times Encountered:</b> " + flags["TIMES_MET_VENUS_PITCHER"]);
				if(flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"] != undefined)
				{
					output2("\n<b>* Elder Venus Pitcher, Times Encountered:</b> " + flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"]);
					if(flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] != undefined) output2("\n<b>* Elder Venus Pitcher, Times Hypnotized By:</b> " + flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"]);
					if(venusSubmission() > 0) output2("\n<b>* Elder Venus Pitcher, Dominance:</b> " + formatFloat(venusSubmission(), 1) + " %");
				}
				if(flags["TIMES_MET_FEMZIL"] != undefined)
				{
					output2("\n<b>* Female Zil, Times Encountered:</b> " + flags["TIMES_MET_FEMZIL"]);
					if(flags["FZIL_PREG_TIMER"] != undefined) output2("\n<b>* Female Zil, Days Pregnant:</b> " + flags["FZIL_PREG_TIMER"]);
				}
				if(flags["ENCOUNTERED_ZIL"] != undefined)
				{
					output2("\n<b>* Male Zil, Times Encountered:</b> " + flags["ENCOUNTERED_ZIL"]);
					//if(flags["TIMES_LOST_TO_ZIL"] != undefined) output2("\n<b>* Male Zil, Combat, Times Lost To:</b> " + flags["TIMES_LOST_TO_ZIL"]);
					if(flags["TIMES_LOSS_SUCKED_ZIL_MALE"] != undefined) output2("\n<b>* Male Zil, Combat, Times Sucked His Cock Upon Losing:</b> " + flags["TIMES_LOSS_SUCKED_ZIL_MALE"]);
				}
				variousCount++;
			}
			// Resources
			if(flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] != undefined || flags["UTHRA HARVEST DAY"] != undefined || flags["FOUND_MANGO"] != undefined)
			{
				output2("\n<b><u>Mhen’gan Resources</u></b>");
				if(flags["FOUND_MANGO"] != undefined) output2("\n<b>* Mhen’gan Mango, Total Found:</b> " + flags["FOUND_MANGO"]);
				if(flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] != undefined) output2("\n<b>* Oxonium Deposit:</b> Found");
				if(flags["UTHRA HARVEST DAY"] != undefined) output2("\n<b>* Uthra Sap, Days Since Last Harvest:</b> " + (days - flags["UTHRA HARVEST DAY"]));
				
				variousCount++;
			}
			// Travel Points
			if(flags["SALVAGED VANAE CAMP"] != undefined)
			{
				output2("\n<b><u>Mhen’gan Travel Points</u></b>");
				// Abandoned Outpost
				if(flags["SALVAGED VANAE CAMP"] != undefined)
				{
					output2("\n<b>* Abandoned Xenogen Outpost:</b> Found");
					if(flags["CLEARED_XENOGEN_CAMP_BODIES"] != undefined) output2(", Cleared bodies");
					if(flags["SALVAGED VANAE CAMP"] >= 1) output2(", Looted camp");
					if(flags["SALVAGED VANAE CAMP"] >= 2) output2(", Salvaged transport vehicle");
				}
				variousCount++;
			}
		}
		
		if(showID == "Tarkus" || showID == "All")
		{
			// Hangar
			if(flags["MET_DOCKMISTRESS"] != undefined)
			{
				output2("\n<b><u>Hangar Bay</u></b>");
				output2("\n<b>* Dockmaster:</b> Met her");
				if(flags["DOCKMASTER_PREGNANT"] != undefined) output2("\n<b>* Dockmaster, Days Pregnant:</b> " + Math.floor((GetGameTimestamp() - flags["DOCKMASTER_PREGNANT"])/(60*24)));
				if(flags["DOCKMASTER_EGGOES"] != undefined) output2("\n<b>* Dockmaster, Times She Laid Eggs:</b> " + flags["DOCKMASTER_EGGOES"]);
				variousCount++;
			}
			// Arbetz Travel Agency
			if(flags["ARBETZ_ENTERED"] != undefined)
			{
				output2("\n<b><u>Arbetz Travel Agency</u></b>");
				output2("\n<b>* Status:</b>");
				if(hours >= 9 && hours < 21) output2(" Open");
				else output2(" Closed");
				if(pc.hasStatusEffect("Arbetz Busy Cooldown")) output2(", Busy today");
				if(flags["UNA_MET"] != undefined) output2("\n<b>* Una:</b> Met her");
				else output2("\n<b>* Gabilani Woman:</b> Seen her");
				if(flags["ARBETZ_SEX_ORAL"] != undefined) output2("\n<b>* Una, Times Oral Sexed Her:</b> " + flags["ARBETZ_SEX_ORAL"]);
				if(flags["ARBETZ_SEX_HATE_FUCK"] != undefined) output2("\n<b>* Una, Times Hate Fucked Her:</b> " + flags["ARBETZ_SEX_HATE_FUCK"]);
				if(flags["UNA_TALKED"] >= 4)
				{
					output2("\n<b>* Godi and Petr:</b> Met them");
					if(flags["ARBETZ_SEX_ONE_BOY"] != undefined) output2("\n<b>* Godi, Times Sexed:</b> " + flags["ARBETZ_SEX_ONE_BOY"]);
					if(flags["ARBETZ_SEX_TWO_BOYS"] != undefined) output2("\n<b>* Godi & Petr, Times Spitroasted By:</b> " + flags["ARBETZ_SEX_TWO_BOYS"]);
				}
				variousCount++;
			}
			// Bimbotorium
			if(flags["MET_DR_BADGER"] != undefined)
			{
				output2("\n<b><u>The Bimbotorium</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["DR_BADGER_BIMBOED_PC"] != undefined)
				{
					output2(" Accepted Bimbofication");
					if(silly) output2(", <i>Like, you’re a hero now!</i>");
				}
				else output2(" Refused Bimbofication");
				output2("\n<b>* Doctor Badger:</b>");
				if(drBadgerImprisioned()) output2(" Inactive, Arrested by the U.G.C.");
				else output2(" Active");
				if(chars["DRBADGER"].isBimbo()) output2(", Bimbofied");
				variousCount++;
			}
			// Colenso's
			if(flags["BEEN_TO_COLENSOS"] != undefined)
			{
				output2("\n<b><u>Colenso’s Junk</u></b>");
				output2("\n<b>* Colenso:</b> Met him");
				if(flags["ASKED_COLENSO_ABOUT_HIS_THEORIES"] != undefined) output2(", Asked about his theories");
				variousCount++;
			}
			// Doctor Lash
			if(flags["MET_DR_LASH"] != undefined)
			{
				output2("\n<b><u>Doctor Lash’s Office</u></b>");
				output2("\n<b>* Doctor Lash:</b> Met him");
				if(flags["LASHED_IMMUNITY"] != undefined) output2(", He upgraded your nanites");
				variousCount++;
			}
			// Aurora
			if(flags["MET_AURORA"] != undefined)
			{
				output2("\n<b><u>Mechanist’s Shop</u></b>")
				output2("\n<b>* Aurora:</b> Met her");
				// if(flags["TARKUS_DESTROYED"] != undefined && flags["DECK13_SHIELDS_ON"] != 1) output2(", <i>Whereabouts unknown</i>");
				// else
				// {
					if(flags["AURORA_SEEN_AFTER_SPLOSION"] != undefined) output2(", She remains as perky as ever");
					if(silly) output2(", <i>This bat is too fukken kawaii!</i>");
				// }
				variousCount++;
			}
			// The Mess!
			if(flags["SHEKKA_TALKED_THE_MESS"] != undefined || metBeth() || flags["MET_DEL"] != undefined || flags["EDAN_MET"] != undefined || flags["TESSA_MET"] != undefined || flags["MET_VERUSHA"] != undefined || flags["MET_ZEA"] != undefined || flags["HAS_ORDERED_FOOD_AT_THE_MESS"] != undefined)
			{
				output2("\n<b><u>The Mess</u></b>");
				// Rumors
				if(flags["SHEKKA_TALKED_THE_MESS"] != undefined) output2("\n<b>* Rumors, Shekka:</b> <i>She believes the catering company is abducting people.</i>");
				// Beth
				if(metBeth())
				{
					output2("\n<b>* Beth:</b> Met her");
					if(flags["CARVER_HANDJOBBED_U"] != undefined) output2(", She gave you a handjob");
					if(flags["CARVER_DEL_TALK"] != undefined)
					{
						output2("\n<b>* Beth, Talk, Delilah:</b>");
						switch(flags["CARVER_DEL_TALK"])
						{
							case 1: output2(" You prefer Delilah the way she is"); break;
							case 2: output2(" You support feminizing Delilah"); break;
							case 3: output2(" You prefer it if Delilah was free"); break;
						}
					}
					if(flags["CARVER_TARKUS_TALK"] != undefined)
					{
						output2("\n<b>* Beth, Talk, Indentured Servitude:</b>");
						switch(flags["CARVER_TARKUS_TALK"])
						{
							case 1: output2(" You think slavery is wrong"); break;
							case 0: output2(" You are indifferent about slavery"); break;
							case -1: output2(" You think slavery is fine"); break;
						}
					}
				}
				// Delilah
				if(flags["MET_DEL"] != undefined)
				{
					output2("\n<b>* Delilah:</b> Met her");
					if(MailManager.isEntryViewed("del_moved")) output2(" (Moved to Canadia Station)");
					if(flags["TOOK_DELILAHS_BUTTGINITY"] != undefined) output2(", Took her anal virginity");
					if(delilahSubmissiveness() > 0) output2("\n<b>* Delilah, Submissiveness Level:</b> " + delilahSubmissiveness());
					if(flags["TIMES_HAD_SEX_WITH_DELILAH_IN_SOME_WAY"] > 0) output2("\n<b>* Delilah, Times Sexed:</b> " + flags["TIMES_HAD_SEX_WITH_DELILAH_IN_SOME_WAY"]);
					if(flags["TIMES_ATE_DELILAH_OUT"] > 0) output2("\n<b>* Delilah, Times Sat on Her Face:</b> " + flags["TIMES_ATE_DELILAH_OUT"]);
					if(flags["DEL_TAIL_TRAINED"] != undefined) output2("\n<b>* Delilah, Times She Fucked Your Tail Cunt:</b> " + flags["DEL_TAIL_TRAINED"]);
				}
				// Edan
				if(flags["EDAN_MET"] != undefined)
				{
					output2("\n<b>* Edan:</b> Met him");
					if(flags["EDAN_FUCKED"] != undefined) output2("\n<b>* Edan, Times Sexed:</b> " + flags["EDAN_FUCKED"]);
				}
				// Tessa
				if(flags["TESSA_MET"] != undefined)
				{
					//output2("\n<b><u>Tessa, the White Woman</u></b>");
					output2("\n<b>* Tessa:</b> Met her");
					if(flags["TESSA_TRUST"] != undefined) output2("\n<b>* Tessa, Trust:</b> " + flags["TESSA_TRUST"] + " %");
					if(flags["TESSA_SENSEPLAY"] != undefined) output2("\n<b>* Tessa, Times Experienced Senseplay:</b> " + flags["TESSA_SENSEPLAY"]);
					if(flags["TESSA_FJ_MALE"] != undefined) output2("\n<b>* Tessa, Times Experienced Male Footjob:</b> " + flags["TESSA_FJ_MALE"]);
					if(flags["TESSA_FJ_FEMALE"] != undefined) output2("\n<b>* Tessa, Times Experienced Female Footjob:</b> " + flags["TESSA_FJ_FEMALE"]);
					if(flags["TESSA_GONEDOWN"] != undefined) output2("\n<b>* Tessa, Times You’ve Gone Down on Tessa:</b> " + flags["TESSA_GONEDOWN"]);
					if(flags["TESSA_BJS"] != undefined) output2("\n<b>* Tessa, Times She Sucked You Off:</b> " + flags["TESSA_BJS"]);
					if(flags["TESSA_LICKS"] != undefined) output2("\n<b>* Tessa, Times She Licked You Off :</b> " + flags["TESSA_LICKS"]);
					if(flags["TESSA_BREASTPLAY"] != undefined) output2("\n<b>* Tessa, Times She Played With Your Breasts:</b> " + flags["TESSA_BREASTPLAY"]);
					if(flags["TESSA_SHOWER"] != undefined) output2("\n<b>* Tessa, Times You Showered With Tessa:</b> " + flags["TESSA_SHOWER"]);
				}
				// Verusha
				if(flags["MET_VERUSHA"] != undefined)
				{
					output2("\n<b>* Verusha:</b> Met her");
					if(flags["VERUSHA_GROPED"] != undefined) output2(", Groped her");
					if(flags["SEXED_VERUSHA"] != undefined) output2("\n<b>* Verusha, Times Sexed:</b> " + flags["SEXED_VERUSHA"]);
					if(flags["VERUSHA_ORALED"] != undefined) output2("\n<b>* Verusha, Times You Sucked Her Cock:</b> " + flags["VERUSHA_ORALED"]);
				}
				// Tessa
				if(flags["MET_ZEA"] != undefined)
				{
					output2("\n<b>* Zea:</b> Met her");
				}
				// Unknown waitress
				if(flags["HAS_ORDERED_FOOD_AT_THE_MESS"] != undefined) output2("\n<b>* Waitress:</b> Ordered food from her, Food never received");
				
				variousCount++;
			}
			// Anno
			if(flags["ANNOS_SHOP_CLOSED"] != undefined || flags["MET_ANNO"] != undefined)
			{
				output2("\n<b><u>Steele Tech Outpost</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["ANNOS_SHOP_CLOSED"] != undefined) output2(" Closed");
				else output2(" Open");
				if(flags["MET_ANNO"] != undefined)
				{
					output2("\n<b>* Anno:</b> Met her");
					if(flags["ANNO_AWAY"] != undefined) output2(", Away");
					if(flags["ANNO_ASLEEP"] != undefined) output2(", Currently sleeping");
					if(!annoNotRecruited())
					{
						output2(", Crew member");
						// Follower stuff
						if(annoIsCrew()) output2(" (Onboard Ship)");
						else if(flags["ANNO_CREWMEMBER"] == 2) output2(" (At Tavros Station)");
					}
					if(!chars["ANNO"].isNude()) output2("\n<b>* Anno, Attire:</b> [anno.Gear]");
					if(flags["ANNOxKAEDE_INTRODUCED"] > 0) output2("\n<b>* Anno, Times Met with Kaede:</b> " + flags["ANNOxKAEDE_INTRODUCED"]);
					if(flags["ANNO_TRIBERATOR_USED"] != undefined || flags["ANNO_OWNS_LIGHT_STRAPON"] != undefined)
					{
						output2("\n<b>* Anno, Sex Toys:</b>");
						if(flags["ANNO_TRIBERATOR_USED"] != undefined) output2(" Vibrator");
						if(flags["ANNO_OWNS_LIGHT_STRAPON"] != undefined)
						{
							if(flags["ANNO_TRIBERATOR_USED"] != undefined) output2(",");
							output2(" Hardlight strap-on");
							if(flags["ANNO_STRAPON_MODS_ENABLED"] != undefined) output2(", Strap-on mods enabled");
						}
					}
					if(flags["ANNO_SEXED"] != undefined && flags["ANNO_SEXED"] > 0)
					{
						output2("\n<b>* Anno, Sexual History:</b> Sexed her");
						if(flags["ANNO_EVER_STRAPONED"] != undefined) output2(", Fucked her with a hardlight strap-on");
						if(flags["ANNOxSYRI_WINCEST"] != undefined) output2(", Sexed her with Syri");
						output2("\n<b>* Anno, Times Sexed:</b> " + flags["ANNO_SEXED"]);
						if(silly) output2("\n<b>* Anno, Times Sexed by Your Dad:</b> " + (flags["ANNO_SEXED"] + 1 + rand(20)) + " <i>(Approximation)</i>");
					}
					if(flags["ANNO_ANALSEXED"] != undefined) output2("\n<b>* Anno, Times Fucked Her Ass:</b> " + flags["ANNO_ANALSEXED"]);
					if(flags["ANNO_TRIBERATOR_USED"] != undefined) output2("\n<b>* Anno, Times Used Her Vibrator:</b> " + flags["ANNO_TRIBERATOR_USED"]);
					if(flags["ANNO_MAID_SEX"] != undefined) output2("\n<b>* Anno, Times Fucked Her in Maid Outfit:</b> " + flags["ANNO_MAID_SEX"]);
					if(flags["ANNO_X_ERRA_JOINED"] != undefined) output2("\n<b>* Anno, Times Sexed in Threesome with Erra:</b> " + flags["ANNO_X_ERRA_JOINED"]);
					if(flags["UVETO_HUSKAR_FOURSOME_MOUNTUP"] != undefined) output2("\n<b>* Anno, Times Mounted with Marina and Galina:</b> " + flags["UVETO_HUSKAR_FOURSOME_MOUNTUP"]);
					if(flags["UVETO_HUSKAR_FOURSOME_POUNDPUPPIES"] != undefined) output2("\n<b>* Anno, Times Pounded Both Marina and Galina:</b> " + flags["UVETO_HUSKAR_FOURSOME_POUNDPUPPIES"]);
					if(annoIsPet()) output2("\n<b>* Anno, Times Walked:</b> " + annoTimesWalked());
					if(flags["ANNO_FACESIT"] != undefined) output2("\n<b>* Anno, Times She Sat on Your Face:</b> " + flags["ANNO_FACESIT"]);
				}
				variousCount++;
			}
			// Nessa
			if(flags["MET_NESSA"] != undefined)
			{
				output2("\n<b><u>U.G.C. Scout Authority</u></b>");
				output2("\n<b>* Nessa:</b> Met her");
				if(nessaBellyRating() > 0) output2("\n<b>* Nessa, Belly Size Rating:</b> " + formatFloat(nessaBellyRating(), 3));
				variousCount++;
			}
			// Shekka
			if(flags["MET_SHEKKA"] != undefined)
			{
				output2("\n<b><u>Widget Warehouse</u></b>");
				output2("\n<b>* Shekka:</b> Met her");
				if(flags["SHEKKA_TALK_COOLDOWN"] != undefined && flags["SHEKKA_TALK_COOLDOWN"] != 0) output2(", Too busy to talk");
				if(flags["SEEN_SHEKKAS_SEXBOTS"] != undefined)
				{
					output2(", Seen her sexbots");
					if(flags["SEEN_SHEKKAS_SEXBOTS"] != undefined) output2(" and her <i>new</i> sexbots");
				}
				if(shekkaRecruited())
				{
					output2(", Crew member");
					if(shekkaIsCrew()) output2(" (Onboard Ship)");
				}
				if(StatTracking.getStat("contests/shekka sexoff losses") + StatTracking.getStat("contests/shekka sexoff wins") > 0) output2("\n<b>* Shekka, Robot Sex-Off, Win/Loss Ratio:</b> " + StatTracking.getStat("contests/shekka sexoff wins") + "/" + StatTracking.getStat("contests/shekka sexoff losses") + ", of " + (StatTracking.getStat("contests/shekka sexoff losses") + StatTracking.getStat("contests/shekka sexoff wins")) + " games");
				if(flags["SHEKKA_SPIT_ADDICTION"] > 0) output2("\n<b>* Shekka, Aphrodisiac Saliva Addiction Level:</b> " + flags["SHEKKA_SPIT_ADDICTION"] + " %");
				if(flags["TIMES_SEXED_SHEKKA"] != undefined) output2("\n<b>* Shekka, Sex Organs:</b> " + listCharGenitals("SHEKKA"));
				if(flags["TIMES_SEXED_SHEKKA"] != undefined) output2("\n<b>* Shekka, Times Sexed:</b> " + flags["TIMES_SEXED_SHEKKA"]);
				if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] != undefined) output2("\n<b>* Shekka, Times Fucked Her Tail-Vibrator:</b> " + flags["TIMES_TAILVIBED_WITH_SHEKKA"]);
				if(flags["TIMES_SHEKKA_KIRBUED"] != undefined) output2("\n<b>* Shekka, Times Fucked Her Inside a Hazmat Suit:</b> " + flags["TIMES_SHEKKA_KIRBUED"]);
				if(flags["SHEKKA_OVIED"] != undefined) output2("\n<b>* Shekka, Times Oviposited Eggs Into Her:</b> " + flags["SHEKKA_OVIED"]);
				variousCount++;
			}
			// Horace Decker
			if(flags["MET_UGC_TROOPER_AT_CHASMFALL"] != undefined)
			{
				output2("\n<b><u>Chasmfall</u></b>");
				output2("\n<b>* Sgt. Decker:</b> Met him");
				variousCount++;
			}
			// Bessbots
			if(flags["BESS_DISABLED"] != undefined || flags["BESS_IN_RUBBLE"] != undefined)
			{
				output2("\n<b><u>A Junk Pile</u></b>");
				if(flags["BESS_FULLY_CONFIGURED"] != undefined) output2("\n<b>* [bess.name]:</b>");
				else if(flags["MET_SEXBOTS_ON_TARKUS"] != undefined) output2("\n<b>* Abandoned Sexbot:</b>");
				else output2("\n<b>* Abandoned Robot:</b>");
				if(flags["TRIED_TO_GIVE_BESS_FREEDOM"] != undefined) output2(" Tried to free,");
				if(flags["BESS_DISABLED"] != undefined)
				{
					output2(" Inactive");
					if(flags["SOLD_BESS"] != undefined) output2(", Sold for 10000 credits");
					if(flags["BESS_GIVEN_TO_UGC"] != undefined) output2(", Handed over to the U.G.C.");
					if(flags["BESS_DUMPED_INTO_SPAAAAAAACE"] != undefined) output2(", Dumped into junk pile");
				}
				else if(flags["BESS_IN_RUBBLE"] == 0) output2(" <i>Taken by an insane man with a silver-painted penis...</i>");
				else if(flags["BESS_LOCATION"] == BESS_DISABLED)
				{
					if(flags["BESS_EVENT_27"] != undefined) output2(" Missing");
					else output2(" Away");
					if(flags["BESS_EVENT_25_SPINOFF"] != undefined) output2(", Left your crew");
					if(flags["SOLD_BESS"] != undefined) output2(", Sold for 10000 credits");
					output2(", <i>(No longer able to track data on [bess.Em].)</i>");
				}
				else
				{
					if(flags["BESS_EVENT_25_SPINOFF"] != undefined) output2(" Inactive, Confined in room");
					else if(flags["BESS_EVENT_27"] != undefined && flags["BESS_EVENT_28"] == undefined && (GetGameTimestamp() > flags["BESS_EVENT_27"] + (3.5 * 24 * 60))) output2(" <i>MISSING!</i>");
					else
					{
						output2(" Active");
						if(flags["BESS_FRIEND"] != undefined)output2(", Friend");
						if(flags["BESS_LOVER"] != undefined)output2(", Lover");
						if(flags["BESS_CUMDUMP"] != undefined) output2(", Cumdump");
						if(bessIsFollower())
						{
							if(flags["BESS_CREW_ROLE"] != undefined) output2(", " + StringUtil.upperCase(bessCrewRole()));
							else output2(", Own");
							if(bessIsCrew()) output2(" (Onboard Ship)");
							else if(flags["BESS_LOCATION"] == BESS_AT_TAVROS) output2(" (At Tavros Station)");
						}
					}
					if(!chars["BESS"].isNude())
					{
						output2("\n<b>* [bess.name], Attire:</b>");
						if(bessGlasses()) output2(" Pair of glasses,");
						output2(" [bess.Gear]");
					}
					if(bessKatana()) output2("\n<b>* [bess.name], Weapon:</b> Katana");
					if(flags["BESS_ACCESSORY_SETS"] != undefined || flags["BESS_DREAMS"] != undefined || flags["BESS_EVENT_28"] != undefined)
					{
						output2("\n<b>* [bess.name], Upgrades:</b> Installed");
						if(flags["BESS_ACCESSORY_SETS"] != undefined) output2(", Accessory set");
						if(flags["BESS_DREAMS"] != undefined) output2(", Dream");
						if(flags["BESS_EVENT_28"] != undefined) output2(", Taste-bud");
					}
					// Affection/Relationship
					if(flags["BESS_AFFECTION"] != undefined && flags["BESS_AFFECTION"] > 0) output2("\n<b>* [bess.name], Affection:</b> " + flags["BESS_AFFECTION"] + " %");
					output2("\n<b>* [bess.name], Relationship:</b>");
					if(flags["BESS_JUST_A_SEXBOT"] == 1) output2(" Sexbot");
					else if(flags["BESS_EVENT_19_REJECTION"] != undefined)
					{
						output2(" Rejected");
						if(flags["BESS_EVENT_19_REJECTION"] == 2) output2(", Seperated");
					}
					else if(flags["BESS_EVENT_21"] != undefined)
					{
						output2(" Lovers");
						if(flags["BESS_POLY"] == 0) output2(", Closed");
						if(flags["BESS_POLY"] == 1) output2(", Open");
						if(flags["BESS_POLY"] == 2) output2(", Polyamorous");
					}
					else if(flags["BESS_JUST_A_FRIEND"] == 1) output2(" Just a friend");
					else output2(" Normal");
					if(flags["BESS_JUST_A_SEXBOT"] == undefined) 
					{
						if(flags["BESS_EVENT_3_CHOICE"] == BESS_E3_MORE) output2(", Sex is optional");
						if(flags["BESS_EVENT_3_CHOICE"] == BESS_E3_PATH) output2(", Fully autonomous");
						if(flags["BESS_EVENT_7_APOLOGY_NEEDED"] != undefined) output2(", Needs apology");
					}
					if(flags["BESS_PC_NAME"] != undefined) output2("\n<b>* [bess.name], Relationship, [bess.HeShe] Calls You:</b> " + StringUtil.toTitleCase(flags["BESS_PC_NAME"]));
					if(flags["BESS_DATES"] != undefined && flags["BESS_DATES"] > 0) output2("\n<b>* [bess.name], Relationship, Times Dated:</b> " + flags["BESS_DATES"]);
					// Attachments/Customization
					if(flags["BESS_BOOBCHANGED"] != undefined && chars["BESS"].hasBreasts()) output2("\n<b>* [bess.name], Body, Breast Size:</b> " + StringUtil.toTitleCase(chars["BESS"].breastCup(0)) + "s");
					if(flags["BESS_CHANGED_CURVES"] != undefined)
					{
						output2("\n<b>* [bess.name], Body, Belly Size:</b> " + formatFloat(chars["BESS"].bellyRating(), 3));
						output2("\n<b>* [bess.name], Body, Hip Size:</b> " + formatFloat(chars["BESS"].hipRating(), 3));
						output2("\n<b>* [bess.name], Body, Posterior Size:</b> " + formatFloat(chars["BESS"].buttRating(), 3));
					}
					if(flags["BESS_BOOBCHANGED"] != undefined && chars["BESS"].hasNipples()) output2("\n<b>* [bess.name], Nipple Type:</b> " + GLOBAL.NIPPLE_TYPE_NAMES[chars["BESS"].breastRows[0].nippleType]);
					if(chars["BESS"].isLactating()) output2("\n<b>* [bess.name], Lactation:</b> Active");
					if(chars["BESS"].hasCock() || chars["BESS"].hasVagina() || flags["BESS_FUCKED"] != undefined)
					{
						if(chars["BESS"].hasCock()) output2("\n<b>* [bess.name], Cum Type:</b> " + GLOBAL.FLUID_TYPE_NAMES[chars["BESS"].cumType]);
						if(chars["BESS"].hasVagina()) output2("\n<b>* [bess.name], Girlcum Type:</b> " + GLOBAL.FLUID_TYPE_NAMES[chars["BESS"].girlCumType]);
						output2("\n<b>* [bess.name], Simulated Sex Organs:</b> " + listCharGenitals("BESS"));
					}
					// Sex-related
					if(flags["BESS_FUCKED"] != undefined)
					{
						if(flags["BESS_PC_SEX_NAME"] != undefined) output2("\n<b>* [bess.name], Preferred Sex Name, [bess.HeShe] Calls You:</b> " + StringUtil.toTitleCase(flags["BESS_PC_SEX_NAME"]));
						if(flags["BESS_SEX_NAME"] != undefined) output2("\n<b>* [bess.name], Preferred Sex Name, You Call [bess.Em]:</b> " + StringUtil.toTitleCase(flags["BESS_SEX_NAME"]));
						if(flags["BESS_SEX_ROLE"] != undefined)
						{
							output2("\n<b>* [bess.name], Sex Role Assumed:</b>");
							if(flags["BESS_SEX_ROLE"] == 0) output2(" Equal Partners");
							if(flags["BESS_SEX_ROLE"] == 1) output2(" Dominant");
							if(flags["BESS_SEX_ROLE"] == 2) output2(" Submissive");
						}
						if(flags["BESS_FUCKED"] > 0) output2("\n<b>* [bess.name], Times Sexed:</b> " + flags["BESS_FUCKED"]);
						if(flags["BESS_INTIMATE_FUCKED"] > 0) output2("\n<b>* [bess.name], Times Intimate Fucked:</b> " + flags["BESS_INTIMATE_FUCKED"]);
					}
				}
				variousCount++;
			}
			// Lane's Plane
			if(flags["MET_LANE"] != undefined)
			{
				output2("\n<b><u>Lane’s Plane</u></b>");
				output2("\n<b>* Lane:</b>");
				if(flags["LANE_DISABLED"] != undefined) output2(" Inactive");
				else output2(" Active");
				if(flags["LANE_HYPNOSIS_LEVEL"] != 0 && flags["LANE_HYPNOSIS_LEVEL"] != undefined) output2("\n<b>* Lane, Hypnosis Level:</b> " + flags["LANE_HYPNOSIS_LEVEL"]);
				if(flags["LANE_TIMES_HYPNOTISED"] > 0) output2("\n<b>* Lane, Times Hypnotized By:</b> " + flags["LANE_TIMES_HYPNOTISED"]);
				if(flags["LANE_MALE_SEXED"] > 0) output2("\n<b>* Lane, Times Sexed Him:</b> " + flags["LANE_MALE_SEXED"]);
				if(flags["LANE_FEMALE_SEXED"] > 0) output2("\n<b>* Lane, Times Sexed Her:</b> " + flags["LANE_FEMALE_SEXED"]);
				variousCount++;
			}
			// Wastes
			if(flags["MET_GRAY_GOO"] != undefined || flags["ENCOUNTERED_PARASITIC_LAPINARA"] != undefined || (flags["MET_FEMALE_RASKVEL"] != undefined || flags["MET_MALE_RASKVEL_GANG"] != undefined) || flags["MET_SEXBOT_FEMALE_ON_TARKUS"] != undefined || flags["MET_SEXBOT_MALE_ON_TARKUS"] != undefined || flags["MET_SYDIAN_MALE"] != undefined || flags["MET SYDIAN FEMALE"] != undefined || flags["SYDIAN_QUEEN_STAGE"] != undefined || flags["MET_LGBT"] != undefined || flags["ENCOUNTERED_SANDWORM"] != undefined)
			{
				output2("\n<b><u>The Wastes</u></b>");
				if(flags["MET_GRAY_GOO"] != undefined) output2("\n<b>* Gray Goo, Times Encountered:</b> " + flags["MET_GRAY_GOO"]);
				if(flags["ENCOUNTERED_PARASITIC_LAPINARA"] != undefined) output2("\n<b>* Female Parasitic Lapinara, Times Encountered:</b> " + flags["ENCOUNTERED_PARASITIC_LAPINARA"]);
				if(flags["MET_LGBT"] != undefined) output2("\n<b>* Luxury Gabilani Bipedal Transport, Times Encountered:</b> " + flags["MET_LGBT"]);
				if(flags["MET_FEMALE_RASKVEL"] != undefined)
				{
					output2("\n<b>* Female Raskvel, Times Encountered:</b> " + flags["MET_FEMALE_RASKVEL"]);
					if(flags["TIMES_RODE_RASKVEL_FACE"] != undefined) output2("\n<b>* Female Raskvel, Times Riding Her Face:</b> " + flags["TIMES_RODE_RASKVEL_FACE"]);
					if(flags["FEM_RASKVEL_MATING_PRESS"] != undefined) output2("\n<b>* Female Raskvel, Times Mating Press Fucked:</b> " + flags["FEM_RASKVEL_MATING_PRESS"]);
					if(flags["RASKVEL_PREG_TIMER"] != undefined) output2("\n<b>* Female Raskvel, Days Pregnant:</b> " + (5 - flags["RASKVEL_PREG_TIMER"]));
				}
				if(flags["MET_MALE_RASKVEL_GANG"] != undefined) output2("\n<b>* Male Raskvel Gang, Times Encountered:</b> " + flags["MET_MALE_RASKVEL_GANG"]);
				if(flags["ENCOUNTERED_SANDWORM"] != undefined)
				{
					output2("\n<b>* Sand Worm, Times Encountered:</b> " + flags["ENCOUNTERED_SANDWORM"]);
					switch(flags["ENABLE_SANDWORM"])
					{
						case undefined: output2(", Away"); break;
						case 1: output2(", Active (Uncommon)"); break;
						case 2: output2(", Active (Common)"); break;
					}
				}
				if(flags["MET_SEXBOT_FEMALE_ON_TARKUS"] != undefined) output2("\n<b>* Female Sexbots, Times Encountered:</b> " + flags["MET_SEXBOT_FEMALE_ON_TARKUS"]);
				if(flags["MET_SEXBOT_MALE_ON_TARKUS"] != undefined) output2("\n<b>* Male Sexbots, Times Encountered:</b> " + flags["MET_SEXBOT_MALE_ON_TARKUS"]);
				if(flags["MET SYDIAN FEMALE"] != undefined)
				{
					output2("\n<b>* Female Sydian, Times Encountered:</b> " + flags["MET SYDIAN FEMALE"]);
					if(flags["SYDIAN_FEMALE_PREG"] != undefined) output2("\n<b>* Female Sydian, Times Impregnated:</b> " + flags["SYDIAN_FEMALE_PREG"]);
				}
				if(flags["MET_SYDIAN_MALE"] != undefined)
				{
					output2("\n<b>* Male Sydian, Times Encountered:</b> " + flags["MET_SYDIAN_MALE"]);
					if(flags["TIMES_TAKEN_RUST_BRO_IN_COOCH"] != undefined) output2("\n<b>* Male Sydian, Times Cunt-Fucked By:</b> " + flags["TIMES_TAKEN_RUST_BRO_IN_COOCH"]);
				}
				if(flags["SYDIAN_QUEEN_STAGE"] != undefined)
				{
					output2("\n<b>* Sydian Queen, Your Servile Status:</b>");
					switch(flags["SYDIAN_QUEEN_STAGE"])
					{
						case 1: output2(" Willing"); break;
						case 2: output2(" Eager"); break;
						case 3: output2(" Devoted"); break;
						case 4: output2(" Reluctant"); break;
						case 5: output2(" Rejected Her"); break;
					}
					if(flags["RASKVEL_HAREM_SPITROAST"] != undefined) output2("\n<b>* Sydian Queen, Times Spitroasted By Harem :</b> " + flags["RASKVEL_HAREM_SPITROAST"]);
					if(flags["SYDIAN_QUEEN_LUBBIN"] != undefined) output2("\n<b>* Sydian Queen, Times Fucked:</b> " + flags["SYDIAN_QUEEN_LUBBIN"]);
				}
				variousCount++;
			}
			// Travel Points
			if(flags["TARKUS_TAXI_STOP_UNLOCKED"] != undefined)
			{
				output2("\n<b><u>Tarkus Travel Points</u></b>");
				// Artificial Platform
				if(flags["TARKUS_TAXI_STOP_UNLOCKED"] != undefined)
				{
					output2("\n<b>* Artificial Platform:</b> Found");
					if(flags["TARKUS_DESTROYED"] != undefined) output2(", Destroyed");
					else output2(", Fixed comm relay");
				}
				variousCount++;
			}
		}
		
		if(showID == "Myrellion" || showID == "All")
		{
			// DMXXX
			if(flags["DMZ_DICK_SIGNING"] != undefined)
			{
				output2("\n<b><u>D.M.Z.</u></b>");
				if(flags["DMZ_DICK_SIGNING"] != undefined)
				{
					output2("\n<b>* Excited Fangirl:</b> Met her");
					switch(flags["DMZ_DICK_SIGNING"])
					{
						case "tits": output2(", You signed her tits"); break;
						case "cock": output2(", You signed her cock"); break;
						case "none": output2(", You refused to sign her cock"); break;
						case "dosh": output2(", You accepted credits to sign her cock"); break;
					}
				}
				variousCount++;
			}
			// Embassy
			if(flags["MET_ARAKEI"] != undefined || flags["MET_CHARLES"] != undefined || flags["MET_JURO"] != undefined || flags["MET_LYRALLA"] != undefined || flags["MET_NEHZARA"] != undefined)
			{
				output2("\n<b><u>The Embassy</u></b>");
				// Ara Kei
				if(flags["MET_ARAKEI"] != undefined)
				{
					output2("\n<b>* Ara Kei:</b> Met [ara.him]");
					if(flags["ARAKEI_POLISHED_BOOTIES"] != undefined) output2(", Prostrated yourself to [ara.him]");
					else if(flags["ARAKEI_REFUSED_BOOTIES"] != undefined) output2(", Refused to prostrate yourself to [ara.him]");
					if(flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_FAILURE) output2(", <i>Whereabouts unknown</i>");
					if(flags["ARAKEI_CLOSED_OFF"] != undefined) output2("\n<b>* Ara Kei, Relationship:</b> No longer associating with you");
				}
				// Charles
				if(flags["MET_CHARLES"] != undefined)
				{
					output2("\n<b>* Charles:</b> Met him");
					if(flags["CHARLES_DISABLED_FIX"] != undefined) output2(", You no longer want Curdsonwhey from him");
					else if(flags["CHARLES_TALKED_FIX"] != undefined) output2(", Spoke of bothrioc addiction fix");
				}
				// Juro
				if(flags["MET_JURO"] != undefined) output2("\n<b>* Juro:</b> Met him");
				// Lyralla
				if(flags["MET_LYRALLA"] != undefined)
				{
					output2("\n<b>* Lyralla:</b> Met her");
					if(flags["LYRALLA_DISCUSSED_HER_QUEEN"] != undefined) output2(", Spoke of Queen Irellia");
					if(flags["LYRALLA_AND_JURO_RELATIONSHIP_HINTED_AT"] != undefined)
					{
						output2("\n<b>* Lyralla, Relationships:</b> Infatuated with Juro");
						if(flags["JURO_LYRALLA_CLOSET_SEEN"] != undefined) output2(", Seen her fucking Juro in the closet");
					}
				}
				// Nehzara
				if(flags["MET_NEHZARA"] != undefined)
				{
					output2("\n<b>* Nehzara:</b> Met her");
					if(flags["SEXED_NEHZARA"] != undefined) output2(", Sexed her");
					if(flags["NEHZ_PREGGO_RUB_HAPPENED"] != undefined) output2(", She rubbed your pregnant belly");
					if(flags["NEHZ_WARRIORS_HONOR_SCENE_HAPPENED"] != undefined) output2(", Proved her warrior’s honor");
					if(flags["NEHZARA_CLOSET_FUCKED"] != undefined) output2("\n<b>* Nehzara, Times Closet Fucked With:</b> " + flags["NEHZARA_CLOSET_FUCKED"]);
				}
				variousCount++;
			}
			// Golden Peaks Tavern
			if(flags["MET_EMBRY"] != undefined || flags["MET_LILIANA"] != undefined)
			{
				output2("\n<b><u>The Golden Peak</u></b>");
				// Embry
				if(flags["MET_EMBRY"] != undefined)
				{
					output2("\n<b>* [embry.name]:</b> Met her");
					if(flags["EMBRY_LOVERS_SCENE_HAPPENED"] != undefined && flags["CRUSHED_EMBRYS_HEART"] == undefined) output2(", She loves you");
					if(flags["SEEN_MONKEY_STRAPON"] != undefined) output2(", Seen her strap-on");
					if(!chars["EMBRY"].isNude())
					{
						output2("\n<b>* [embry.name], Attire:</b>");
						if(flags["EMBRY_GLASSES"] != undefined)
						{
							output2(" Pair of glasses");
							if(silly) output2(" <i>(Hnnnng!)</i>");
							output2(",");
						}
						output2(" [embry.Gear]");
					}
					if(flags["EMBRY_TALKED_ABOUT_TRANSITIONING"] != undefined)
					{
						output2("\n<b>* [embry.name], Current Balance:</b> " + chars["EMBRY"].credits + " credits");
						if(flags["EMBRY_TREATMENTS"] > 0)
						{
							output2("\n<b>* [embry.name], Transition Treatments:</b>");
							if(flags["EMBRY_TREATMENTS"] >= 1)
							{
								output2(" First");
								if(flags["DIDNT_WATCH_EMBRY_TF"] != undefined) output2(" (didn’t watch)");
								else output2(" (watched)");
							}
							if(flags["EMBRY_TREATMENTS"] >= 2) output2(", Second");
							if(flags["EMBRY_TREATMENTS"] >= 3) output2(", Third");
						}
					}
					if(flags["EMBRY_SPENT_TIME_WITH"] != undefined)
					{
						output2("\n<b>* [embry.name], Times Spent Together:</b> " + flags["EMBRY_SPENT_TIME_WITH"]);
						if(flags["EMBRY_SPENT_TIME_WITH"] >= 4) output2(", Completed");
					}
					if(flags["EMBRY_RELATIONSHIP"] != undefined)
					{
						output2("\n<b>* [embry.name], Relationship:</b>");
						if(flags["CRUSHED_EMBRYS_HEART"] != undefined) output2(" You’ve broken her heart");
						else
						{
							if(flags["EMBRY_RELATIONSHIP"] == 0) output2(" You’ve pissed her off");
							if(flags["EMBRY_RELATIONSHIP"] == 1) output2(" Normal");
							if(flags["EMBRY_RELATIONSHIP"] == 2) output2(" You’re her platonic friend");
							if(flags["EMBRY_RELATIONSHIP"] == 3)
							{
								if(flags["EMBRY_TREATMENTS"] >= 2) output2(" She is lovingly attached to you");
								else if(flags["EMBRY_TREATMENTS"] >= 1) output2(" She is intimate with you");
								else output2(" She is affectionate towards you");
							}
						}
						if(flags["EMBRY_LOVE_STYLE"] != undefined) output2("\n<b>* [embry.name], Relationship, Love Style:</b> " + StringUtil.toTitleCase(flags["EMBRY_LOVE_STYLE"]));
					}
					if(flags["SEXED_EMBRY"] != undefined)
					{
						output2("\n<b>* [embry.name], Sexual Organs:</b> " + listCharGenitals("EMBRY"));
						output2("\n<b>* [embry.name], Sexual History:</b> Sexed her");
						if(!chars["EMBRY"].vaginalVirgin) output2(", Fucked her pussy");
						if(flags["GOTTEN_TO_FUCK_EMBRYBUTT"] != undefined) output2(", Fucked her ass");
						if(flags["GOTTEN_AN_EMBRY_BJ"] != undefined) output2(", She sucked your dick");
						if(flags["GOTTEN_CUNNILINGUS_FROM_EMBRY"] != undefined) output2(", She ate your pussy");
						if(flags["GOTTEN_RIMMED_BY_EMBRY"] != undefined) output2(", She rimmed you");
						output2("\n<b>* [embry.name], Sexual Preference:</b>");
						if(flags["EMBRY_TOLD_YOU_LIKE_COCK"] != undefined) output2(" You like her cock");
						else if(flags["EMBRY_TOLD_YOU_DONT_LIKE_COCK"] != undefined) output2(" You dislike her cock");
						else output2(" You are neutral about her cock");
					}
				}
				// Liliana
				if(flags["MET_LILIANA"] != undefined)
				{
					output2("\n<b>* Liliana:</b> Met her");
					if(flags["LILIANA_SEEN_NAKKERS"] != undefined) output2(", Seen her naked");
					if(flags["LILIANA_NO_ARMS_ARE_COOL"] != undefined) output2(", Encouraged her to be the same");
					if(flags["LILIANA_ARMS"] != undefined) output2(", Encouraged her to get a new arm");
					if(hours >= 19) output2(", Able to cuddle");
					if(flags["LILIANA_TALKS"] >= 1)
					{
						output2("\n<b>* Liliana, Talks:</b> How she lost her arm");
						if(flags["LILIANA_TALKS"] >= 2) output2(", Why she’s afraid to replace it");
						if(flags["LILIANA_TALKS"] >= 3) output2(", Her infatuation with Dr. Anilla");
					}
					if(flags["LILIANA_ARMS"] != undefined)
					{
						output2("\n<b>* Liliana, Replacement Arm Type:</b>");
						if(flags["LILIANA_ARMS"] < 1) output2(" None");
						if(flags["LILIANA_ARMS"] == 1) output2(" Robotic");
						if(flags["LILIANA_ARMS"] == 2) output2(" Regenerated");
						if(flags["LILIANA_ARMS"] > 2) output2(" <i>Unknown</i>");
					}
					if(flags["LILIANA_HOLODONGED"] != undefined) output2("\n<b>Liliana, Times Fucked Her With Hardlight Strap-On:</b> " + flags["LILIANA_HOLODONGED"]);
				}
				variousCount++;
			}
			// KihaCorp Shop
			if(flags["SEEN_EMMY"] != undefined)
			{
				output2("\n<b><u>KihaCorp Shop</u></b>");
				// Emmy
				if(flags["MET_EMMY"] != undefined) output2("\n<b>* Emmy:</b> Met her");
				else if(flags["APPROACHED_EMMY"] != undefined) output2("\n<b>* Jackal Woman:</b> Met her");
				else output2("\n<b>* Jackal Woman:</b> Seen her");
				if(chars["EMMY"].hasStatusEffect("Massaging")) output2(", Being massaged");
				if(chars["EMMY"].hasStatusEffect("Slow Fucking")) output2(", Being slow fucked");
				if(flags["EMMY_BANNED"] != undefined || flags["EMMY_POLY"] != undefined || flags["EMMY_BF"] != undefined)
				{
					output2("\n<b>* Emmy, Relationship:</b>");
					if(flags["EMMY_BANNED"] != undefined) output2(" You’ve been banned by her");
					else if(flags["EMMY_POLY"] != undefined) output2(" You’ve both agreed to be polyamorous");
					else if(flags["EMMY_BF"] != undefined) output2(" You’re her [pc.boy]friend");
					else output2(" <i>Unknown</i>");
					if(flags["EMMY_CREW_REQUESTED"] != undefined) output2(", Asked her to join your crew");
				}
				if(flags["EMMY_ORALED"] != undefined) output2("\n<b>* Emmy, Times She Oral Sexed You:</b> " + flags["EMMY_ORALED"]);
				if(flags["EMMY_EATEN_OUT"] != undefined) output2("\n<b>* Emmy, Times Licked Her Out:</b> " + flags["EMMY_EATEN_OUT"]);
				if(flags["EMMY_FUCKED"] != undefined) output2("\n<b>* Emmy, Times Fucked Her Vagina:</b> " + flags["EMMY_FUCKED"]);
				if(flags["EMMY_PROSTATELIGHT"] != undefined) output2("\n<b>* Emmy, Times Anal Fucked Her With Hardlight Strap-On:</b> " + flags["EMMY_PROSTATELIGHT"]);
			}
			// Xenogen Biotech Office
			if(flags["MET_NEVRIE"] != undefined || flags["MET_MCALLISTER"] != undefined)
			{
				output2("\n<b><u>Xenogen Biotech Office</u></b>");
				// Byron McAllister
				if(flags["MET_MCALLISTER"] != undefined)
				{
					output2("\n<b>* Dr. McAllister:</b> Met him");
				}
				// Nevrie
				if(flags["MET_NEVRIE"] != undefined)
				{
					output2("\n<b>* Nevrie:</b> Met her");
					if(flags["FUCKED_NEVRIE"] != undefined) output2(", Sexed her");
					if(flags["NEVRIE_FIRST_DISCOUNT_DATE"] != undefined) output2("\n<b>* Nevrie, Days Since Last Store Discount:</b> " + (days - flags["NEVRIE_FIRST_DISCOUNT_DATE"]));
				}
				variousCount++;
			}
			// Streets of Gildenmere
			if(flags["MET_ORRYX"] != undefined || flags["LIRIEL_MET"] != undefined || flags["LAST_ANT_ORGY"] != undefined || flags["SEEN_ORANGE_MYR"] != undefined)
			{
				output2("\n<b><u>Gildenmere</u></b>");
				// Liriel, Martians
				if(flags["LIRIEL_MET"] != undefined)
				{
					output2("\n<b>* Liriel:</b> Met her");
					if(flags["LIRIEL_TALK_STAND"] != undefined) output2(", Talked about The Little Green Man stand");
					if(flags["LIRIEL_BUTTSEXED"] != undefined) output2("\n<b>* Liriel, Times She Fucked Your Ass:</b> " + flags["LIRIEL_BUTTSEXED"]);
					if(flags["LIRIEL_TITFUCKED"] != undefined) output2("\n<b>* Liriel, Times Titfucked:</b> " + flags["LIRIEL_TITFUCKED"]);
				}
				// Orryx, step right up ladies and gents!
				if(flags["MET_ORRYX"] != undefined)
				{
					if(flags["MET_ORRYX"] == -1) output2("\n<b>* Fuzzy Alien:</b> Invited to meet");
					else output2("\n<b>* Orryx:</b> Met him");
					if(flags["MET_ORRYX"] == 2) output2(", Agreed to supply him with Golden Honey");
					if(flags["ORRYX_SHIPPED_HONEY"] != undefined)
					{
						output2("\n<b>* Orryx, Honey Shipment Status:</b>");
						if(flags["ORRYX_SHIPPED_TODAY"] == undefined) output2(" None shipped today");
						else output2(" Shipped a load today");
					}
					if(flags["MET_ORRYX"] >= 2 && flags["ORRYX_REP"] != undefined) output2("\n<b>* Orryx, Reputation Level:</b> " + flags["ORRYX_REP"]);
				}
				// Ant Orgy!
				if(flags["LAST_ANT_ORGY"] != undefined)
				{
					output2("\n<b>* Horny Myr Soldiers:</b>");
					if(flags["LAST_ANT_ORGY"] == -1) output2(" Orgy avoided");
					if(flags["LAST_ANT_ORGY"] == 0) output2(" Orgy refused");
					if(flags["LAST_ANT_ORGY"] == 1) output2(" Orgy accepted");
					if(flags["LAST_ANT_ORGY"] == 2) output2(" Orgy failed to avoid");
					if(flags["ANT_ORGY_TIME"] != undefined) output2(", " + prettifyMinutes(GetGameTimestamp() - flags["ANT_ORGY_TIME"]) + " ago");
					if(flags["ANT_ORGY_COUNT"] != undefined) output2("\n<b>* Horny Myr Soldiers, Times Had Orgy With:</b> " + flags["ANT_ORGY_COUNT"]);
				}
				// Orange Myr Sighting
				if(flags["SEEN_ORANGE_MYR"] != undefined)
				{
					output2("\n<b>* Orange Myr Group:</b> Seen");
				}
				variousCount++;
			}
			// Gene's Mods
			if(flags["GENES_MODS_ENTERED"] != undefined)
			{
				output2("\n<b><u>Gene’s Mods</u></b>");
				if(flags["PURCHASED_GENES_GALO"] != undefined)
				{
					output2("\n<b>* Unique Sale:</b> GaloMax");
				}
				if(flags["GENE_TALKED_TO"] == undefined) output2("\n<b>* Fanfir Man:</b>");
				else output2("\n<b>* Gene:</b>");
				output2(" Met him");
				if(flags["GENE_BELLYRUBS_ENABLED"] != undefined) output2(", Rubbed his belly");
				if(flags["GENE_SUBMISSION_LEVEL"] != undefined && flags["GENE_TALKED_TO"] != undefined)
				{
					output2("\n<b>* Gene, Dominance Level:</b> ");
					if(flags["GENE_SUBMISSION_LEVEL"] == -1) output2("Refused his advances completely");
					else output2(geneSubmissionLevel() + "/10");
				}
				if(flags["GENE_FUCKED"] != undefined) output2("\n<b>* Gene, Times Sexed:</b> " + flags["GENE_FUCKED"]);
				if(flags["GENE_BLOWJOB"] != undefined) output2("\n<b>* Gene, Times Sucked His Cock:</b> " + flags["GENE_BLOWJOB"]);
				variousCount++;
			}
			// Vi-Ko
			if(flags["MET_VI"] != undefined)
			{
				output2("\n<b><u>Gildenmere Medical Hospital</u></b>");
				output2("\n<b>* Vi:</b> Met her");
				if(flags["VI_BIGBOOBS"] == 1) output2(", Breasts inflated");
				if(flags["HEALED_BY_VI"] != undefined) output2("\n<b>* Vi, Times Healed By:</b> " + flags["HEALED_BY_VI"]);
				if(flags["TREATED_BY_VI"] != undefined) output2("\n<b>* Vi, Times Treated By:</b> " + flags["TREATED_BY_VI"]);
				if(flags["VI_POTENCY_TEST"] != undefined) output2("\n<b>* Vi, Times Administered Potency Test:</b> " + flags["VI_POTENCY_TEST"]);
				if(flags["INFLATED_VI"] != undefined) output2("\n<b>* Vi, Times Inflated Breasts:</b> " + flags["INFLATED_VI"]);
				if(flags["VI_SEXED"] != undefined) output2("\n<b>* Vi, Times Sexed:</b> " + flags["VI_SEXED"]);
				if(flags["VI_TITFUCKED"] != undefined) output2("\n<b>* Vi, Times Titfucked:</b> " + flags["VI_TITFUCKED"]);
				variousCount++;
			}
			// The Honey Nozzle
			if(hasSeenNozzleShow() || flags["MET_DALLY"] != undefined || flags["MET_HEPANE"] != undefined)
			{
				output2("\n<b><u>The Honey Nozzle</u></b>");
				// Cabaret Shows
				if(flags["NOZZLE_SHOW_PARADISE"] != undefined) output2("\n<b>* Cabaret, “Of Paradise”, Times Watched:</b> " + flags["NOZZLE_SHOW_PARADISE"]);
				if(flags["NOZZLE_SHOW_SHRIKE"] != undefined) output2("\n<b>* Cabaret, “As You Shrike It”, Times Watched:</b> " + flags["NOZZLE_SHOW_SHRIKE"]);
				if(flags["NOZZLE_SHOW_QUARAMARTA"] != undefined) output2("\n<b>* Cabaret, “The Quaramarta”, Times Watched:</b> " + flags["NOZZLE_SHOW_QUARAMARTA"]);
				// Dallyyy
				if(flags["MET_DALLY"] != undefined)
				{
					output2("\n<b>* Dally:</b> Met him");
					if(flags["DALLY_TIPS"] != undefined) output2("\n<b>* Dally, Tip Balance:</b> " + flags["DALLY_TIPS"] + " credits");
					if(flags["DALLY_FAVORS"] != undefined) output2("\n<b>* Dally, Times Performed On Stage With Him:</b> " + flags["DALLY_FAVORS"]);
					if(flags["DALLY_NECTAR_DRANK"] != undefined) output2("\n<b>* Dally, Times Drank His Nectar:</b> " + flags["DALLY_NECTAR_DRANK"]);
					if(flags["CUNTTAILED_DALLY"] != undefined) output2("\n<b>* Dally, Times He Fucked Your Tail Cunt:</b> " + flags["CUNTTAILED_DALLY"]);
				}
				// Fazian
				if(hasSeenNozzleShow())
				{
					output2("\n<b>* Fazian:</b>");
					if(flags["APPROACHED_FAZIAN"] != undefined) output2(" Met him");
					else output2(" Seen him");
					if(flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_RESCUE) output2(", <i>At Kressia warehouse...</i>");
					else if
					(	(flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_OFFERING && flags["FAZIAN_QUEST_DELAY"] != undefined)
					||	InCollection(flags["FAZIAN_QUEST_STATE"], [FAZIAN_QUEST_STARTED, FAZIAN_QUEST_REJECTED, FAZIAN_QUEST_FAILED, FAZIAN_QUEST_INVESTIGATED, FAZIAN_QUEST_BRIBED])
					)	output2(", <i>Whereabouts unknown</i>");
					else if((hours > 15 && hours < 20) || (hours == 15 && minutes >= 30) || (hours == 20 && minutes <= 30)) output2(", Currently performing");
					if(flags["DANCE_SKILL_EDOTTO"] != undefined) output2("\n<b>* Fazian, Dance Lesson, Edotto Skill Level:</b> " + flags["DANCE_SKILL_EDOTTO"]);
					if(flags["DANCE_SKILL_SUNWALKER"] != undefined) output2("\n<b>* Fazian, Dance Lesson, Sunwalker Skill Level:</b> " + flags["DANCE_SKILL_SUNWALKER"]);
				}
				// Hepane
				if(flags["MET_HEPANE"] != undefined) output2("\n<b>* Hepane:</b> Met her");
				variousCount++;
			}
			// The Honeypot Stall
			if(flags["MET_ASENNIA"] != undefined)
			{
				output2("\n<b><u>The Honeypot Stall</u></b>");
				// Asennia
				output2("\n<b>* Asennia:</b> Met her");
				if(flags["ASENNIA_COCK_OFFERED"] != undefined) output2(", Offered your cock to her");
				variousCount++;
			}
			// Queen's Palace
			if(flags["MET_IRELLIA"] != undefined || flags["LYRALLA_DISCUSSED_HER_QUEEN"] != undefined)
			{
				output2("\n<b><u>The Queen’s Palace</u></b>");
				// Queen Irellia and all the queens!
				output2("\n<b>* Queen Irellia:</b>");
				if(flags["MET_IRELLIA"] != undefined && flags["IRELLIA_QUEST_STATUS"] != undefined)
				{
					output2(" Met her");
					if(flags["IRELLIA_QUEST_STATUS"] == -1) output2(", Refuses to interact");
					if(flags["IRELLIA_QUEST_STATUS"] >= 6)
					{
						if(flags["IRELLIA_TITTYSNACK_OFFER"] != undefined) output2(", She offered a titty-snack");
						if(flags["IRELLIA_SEX_COOLDOWN"] == 0 || flags["IRELLIA_SEX_COOLDOWN"] == undefined) output2(", Desires sex");
						if(flags["IRELLIA_DOUBLE_TEAM_EVER_DONE"] != undefined) output2("\n<b>* Queen Irellia, Times Double-Teamed Her:</b> " + flags["IRELLIA_DOUBLE_TEAM_EVER_DONE"]);
					}
					output2("\n<b>* Queen Marsail:</b> Met her");
					if(flags["IRELLIA_QUEST_STATUS"] == -1) output2(", Refuses to interact");
					output2("\n<b>* Queen Scalla:</b> Met her");
					if(flags["IRELLIA_QUEST_STATUS"] == -1) output2(", Refuses to interact");
					if(flags["MET_AURIN"] != undefined) output2("\n<b>* Aurin:</b> Met him, Fucked Irellia");
					if(flags["MET_ETHELN"] != undefined) output2("\n<b>* Etheln:</b> Met him, Fucked Irellia");
					if(flags["MET_ILODEN"] != undefined) output2("\n<b>* Iloden:</b> Met him, Fucked Irellia");
				}
				else if(flags["LYRALLA_DISCUSSED_HER_QUEEN"] != undefined) output2(" Know of her");
				variousCount++;
			}
			//The Entite
			if(flags["SEER_MET"] != undefined)
			{
				output2("\n<b><u>The Entite</u></b>");
				//The Seer
				output2("\n<b>* The Seer:</b> Met her... you think");
				if(flags["SEER_SEXED"] != undefined) output2("\n<b>* The Seer, Times Sexed:</b> " + flags["SEER_SEXED"]);
				variousCount++;
			}
			// Silken Serenity
			if(flags["MET_XANTHE"] != undefined)
			{
				output2("\n<b><u>Silken Serenity</u></b>");
				// Xanthe
				output2("\n<b>* Xanthe:</b> Met her");
				if(flags["MET_BUTCH"] != undefined) output2(", Met ‘Butch’");
				if(flags["SET_XANTHE_SEX"] != undefined) output2(", Changed her genitals");
				if(flags["XANTHE_MATED"] != undefined) output2(", Mated with her");
				if(flags["XANTHE_TALKED_ABOUT_HER_SEX"] != undefined)
				{
					output2("\n<b>* Xanthe, Genitals:</b> ");
					if(flags["XANTHE_FRONT_GENITAL"] == 0) output2(" Nothing on front");
					if(flags["XANTHE_FRONT_GENITAL"] == 1) output2(" Front penis");
					if(flags["XANTHE_FRONT_GENITAL"] == 2) output2(" Front vagina");
					if(flags["XANTHE_BACK_GENITAL"] == 0) output2(", Nothing on back");
					if(flags["XANTHE_BACK_GENITAL"] == 1) output2(", Back penis");
					if(flags["XANTHE_BACK_GENITAL"] == 2) output2(", Back vagina");
				}
				variousCount++;
			}
			// School Time!
			if(flags["THOLLUM_PASS_REQUESTED"] != undefined)
			{
				output2("\n<b><u>Thollum</u></b>");
				output2("\n<b>* Status:</b> ");
				if(pc.keyItemv1("Gildenmere Pass") >= 1) output2(" Allowed access");
				else output2(" <i>Ask Lyralla for an entrance pass.</i>");
				if(flags["THOLLUM_TOURED"] != undefined) output2(", Taken tour");
				if(flags["MUSHROOM_TRACKER"] != undefined && flags["MUSHROOM_TRACKER"] > 0) output2("\n<b>* Mushroom Garden, Fluids Collected:</b> " + mLs(flags["MUSHROOM_TRACKER"]));
				if(flags["MUSH_SEEN"] != undefined) output2("\n<b>* Mushroom Garden, Growth Level:</b> " + flags["MUSH_SEEN"]);
				// Yarasta
				if(flags["MET_YARASTA"] != undefined) output2("\n<b>* Yarasta:</b> Met her");
				if(flags["SEXED_YARASTA"] != undefined) output2("\n<b>* Yarasta, Times Sexed:</b> " + flags["SEXED_YARASTA"]);
				// Yummy TiTS
				if(flags["MET_GIALA"] != undefined) output2("\n<b>* Giala:</b> Met her");
				if(flags["SEXED_GIALA"] != undefined) output2("\n<b>* Giala, Times Sexed:</b> " + flags["SEXED_GIALA"]);
				variousCount++;
			}
			// Kressia, where all the gangstas chill
			if(flags["LIEVE_INVITE"] != undefined || flags["MET_LIEVE"] != undefined)
			{
				output2("\n<b><u>Kressia</u></b>");
				// Lieve
				if(flags["LIEVE_INVITE"] != undefined || flags["MET_LIEVE"] != undefined)
				{
					if(flags["MET_LIEVE"] != undefined)
					{
						output2("\n<b>* Lieve:</b> Met her");
						if(flags["LIEVE_TOWNTOUR"] != undefined) output2(", Took her tour");
						if(flags["LIEVE_VENOM_ENABLED"] != undefined) output2(", Venom enabled");
						if(flags["HAS_BEEN_MYR_VENOMED"] != undefined) output2(", She venom-fucked you");
						if(flags["LIEVE_HAREM_DICKFUCK"] != undefined) output2(", Dick-fucked her harem");
						if(flags["LIEVE_VENOM_USED"] != undefined) output2("\n<b>* Lieve, Times Used Venom:</b> " + flags["LIEVE_VENOM_USED"]);
						if(flags["FUCKED_LIEVE"] != undefined) output2("\n<b>* Lieve, Times Sexed:</b> " + flags["FUCKED_LIEVE"]);
						if(flags["FUCKED_LIEVE_SOLO"] != undefined) output2("\n<b>* Lieve, Times Fucked Her Solo:</b> " + flags["FUCKED_LIEVE_SOLO"]);
						if(flags["FUCKED_TRENCHWIVES"] != undefined) output2("\n<b>* Lieve, Times Fucked Her Trenchwives:</b> " + flags["FUCKED_TRENCHWIVES"]);
						if(flags["SIERVA_TALK"] != undefined)
						{
							output2("\n<b>* Mayren:</b> Met her");
							output2("\n<b>* Sierva:</b> Met her");
						}
					}
					else output2("\n<b>* Young Woman with Purple Hair:</b> Invited to meet");
				}
				variousCount++;
			}
			// Bath House
			if(flags["TALKED_ABOOT_BATH_HOUSE"] != undefined)
			{
				if(silly) output2("\n<b><u>Bathen Hausen</u></b>");
				else output2("\n<b><u>Bath House</u></b>");
				output2("\n<b>* Matron Oserre:</b> Met her");
				if(flags["OSERRE_BATHED"] != undefined) output2(", Bathed with her");
				if(flags["OSERRE_HARDLIGHTED"] != undefined) output2("\n<b>Matron Oserre, Times Fucked Her With Hardlight Strap-On:</b> " + flags["OSERRE_HARDLIGHTED"]);
				variousCount++;
			}
			// Renvraaa
			if(flags["MET_RENVRA"] != undefined)
			{
				output2("\n<b><u>Federation Supply and Trading Post</u></b>");
				output2("\n<b>* Renvra:</b> Met her");
				if(flags["RENVRA_SEXED"] != undefined) output2(", Sexed her");
				if(flags["MADE_RENVRA_BEG"] != undefined)
				{
					output2(", Made her beg");
					if(flags["MADE_RENVRA_BEG"] == 2) output2(" and denied her");
				}
				if(flags["RENVRA_RACE_TALK"] != undefined && flags["RENVRA_KIDS_TALK"] != undefined)
				{
					output2("\n<b>* Renvra, Egg Fertility:</b> " + formatFloat(chars["RENVRA"].cumQualityRaw, 1) + " %");
				}
				variousCount++;
			}
			// Sellera
			if(flags["MANOR_WARROOM_ENTERED"] != undefined || flags["MANOR_ADMINROOM_ENTERED"] != undefined)
			{
				output2("\n<b><u>Kressia Manor and Federation War Room</u></b>");
				output2("\n<b>* Sellera:</b> Met her");
				if(flags["SELLERA_SERVICED"] != undefined) output2(", Serviced Her");
				if(flags["SELLERA_GANGBANGED"] != undefined) output2(", Serviced Her Troops");
				if(flags["SELLERA_SEXED"] != undefined) output2(", Sexed Her");
				variousCount++;
			}
			// Anzhela
			if(flags["MET_ANZHELA"] != undefined)
			{
				output2("\n<b><u>Kressia Medical Hospital</u></b>");
				output2("\n<b>* Anzhela:</b> Met her");
				if(flags["ANZHELA_TREATED"] != undefined) output2("\n<b>* Anzhela, Times Checked You for First-Aid:</b> " + flags["ANZHELA_TREATED"]);
				if(flags["S_RELIEF_ANN"] != undefined && flags["S_RELIEF_ANN"] > 0) output2("\n<b>* Anzhela, Times Received Sexual Relief From:</b> " + flags["S_RELIEF_ANN"]);
				if(flags["ANZHELA_ANALED"] != undefined) output2("\n<b>* Anzhela, Times Fucked Her Ass:</b> " + flags["ANZHELA_ANALED"]);
				variousCount++;
			}
			// Survival Shop
			if(flags["MET_ANARRIE"] != undefined || flags["MET_SHIARE"] != undefined)
			{
				output2("\n<b><u>Kressia Survival Shop</u></b>");
				if(flags["DISCOUNT_SEXED_SURVIVAL_SHOP"] != undefined) output2("\n<b>* Sales, Times Given Sex Discount:</b> " + flags["DISCOUNT_SEXED_SURVIVAL_SHOP"]);
				// Annarie and Shiare
				if(flags["MET_ANARRIE"] != undefined)
				{
					output2("\n<b>* Annarie:</b> Met her");
					if(flags["FUCKED_ANARRIE"] != undefined) output2(", Sexed her");
					if(flags["ANARRIE_AMBUSH"] != undefined) output2("\n<b>* Annarie, Times Ambush Sexed Her:</b> " + flags["ANARRIE_AMBUSH"]);
				}
				if(flags["MET_SHIARE"] != undefined)
				{
					output2("\n<b>* Shiare:</b> Met her");
					if(flags["FUCKED_SHIARE"] != undefined) output2(", Sexed her");
					if(flags["MILKED_SHIARE"] != undefined) output2("\n<b>* Shiare, Times Milked Her:</b> " + flags["MILKED_SHIARE"]);
					if(flags["ANT_PANTIES_SHARED"] != undefined) output2("\n<b>* Shiare, Times Shared Hardlight Strap-On With:</b> " + flags["ANT_PANTIES_SHARED"]);
				}
				variousCount++;
			}
			// Merchant Queen
			if(flags["MET_MERCHANT_QUEEN"] != undefined)
			{
				output2("\n<b><u>Merchant Queen’s Shop</u></b>");
				if(silly) output2("\n<b>* Queen Fuzzlebottom:</b>");
				else output2("\n<b>* Merchant Queen:</b>");
				output2(" Met her");
				variousCount++;
			}
			// Like, Steph Irson, theee Galactic Huntress!
			/*
			if(flags["STEPH_WATCHED"] != undefined && flags["STEPH_WORK_CHOICE"] != undefined)
			{
				output2("\n<b><u>A Cavern</u></b>");
				output2("\n<b>* Steph Irson:</b> Encountered");
				output2("\n<b>* Steph Irson, Work Choice:</b>");
				if(flags["STEPH_WORK_CHOICE"] == STEPH_WORK_PORNSTAR) output2(" Galactic Pornstar");
				else if(flags["STEPH_WORK_CHOICE"] == STEPH_WORK_NEWNETWORK)
				{
					output2(" Find a new network");
					if(flags["STEPH_STEELE_SPONSOR"] != undefined) output2(", Steele Tech as sponsor");
				}
				else if(flags["STEPH_WORK_CHOICE"] == STEPH_WORK_DISCOURAGE) output2(" Discouraged from switching networks");
				else output2(" <i>Unknown</i>");
				variousCount++;
			}
			*/
			// Crab Lady
			if(flags["QUEEN_OF_THE_DEEP_ENCOUNTERED"] != undefined)
			{
				output2("\n<b><u>Deep Lake</u></b>");
				output2("\n<b>* Queen of the Deep Lake:</b> Encountered");
				if(pc.hasPregnancyOfType("DeepQueenPregnancy")) output2(", Impregnated by");
				if(StatTracking.getStat("pregnancy/queen of the deep eggs") > 0) output2(", Progenitor of race");
				variousCount++;
			}
			// Fungus Passage
			if(flags["SUCKED_FUNGUS"] != undefined || flags["FUNGUS_QUEEN_SAVED"] != undefined || flags["LET_FUNGUS_QUEEN_DIE"] != undefined)
			{
				output2("\n<b><u>Fungal Passage</u></b>");
				// Fungal Queen
				output2("\n<b>* Infected Myr Queen:</b> Encountered");
				if(flags["SUCKED_FUNGUS"] != undefined) output2(", Sucked her tits");
				if(flags["LET_FUNGUS_QUEEN_DIE"] != undefined) output2(", Abandoned her, Let her die");
				if(flags["FUNGUS_QUEEN_SAVED"] != undefined)
				{
					output2(", Saved her");
					// Rogue Robot
					output2("\n<b>* Rogue KihaCorp Deconstruction Unit:</b> Destroyed");
					// Resources
					output2("\n<b>* Resources:</b> Crystallized Sophinol claimed");
				}
				variousCount++;
			}
			// Village of the Goos
			if(flags["MET_CGOOS"] != undefined)
			{
				output2("\n<b><u>Ganraen Village</u></b>");
				output2("\n<b>* Village:</b> Visited, Imprisoned and freed from jail");
				output2("\n<b>* Issett:</b> Met her");
				if(flags["MET_CGOO_SHOPKEEP"] != undefined) output2("\n<b>* Ganraen Shopkeeper:</b> Met her");
				variousCount++;
			}
			// ReallyJustSpaceSavin
			if(flags["MET_SEIFYN"] != undefined)
			{
				output2("\n<b><u>Trading Post</u></b>");
				if(flags["MET_SEIFYN"] != undefined)
				{
					output2("\n<b>* Seifyn:</b> Met her");
					if(flags["SEIFYN_TAIVRA_TALK"] != undefined) output2(", Talked about Queen Taivra");
				}
				variousCount++;
			}
			// Taivra's Palace (Encounters)
			if(flags["FOUGHT_PRAETORIANS"] != undefined || flags["PLAT190 USED AS NYREA BRIBE"] != undefined || flags["CRYSTAL_GOO_GLORYHOLED"] != undefined || flags["CRYSTAL_GOO_DEFEAT"] != undefined || flags["LOOTED_TAIVRAS_BEDROOM"] != undefined || flags["PRINCESS_DEFEATED"] != undefined || flags["TOOK_PRINCESS_BUTTGINITY"] != undefined || metTaivra())
			{
				// Custom-Named Palace
				var palaceName:String = "Royal Nyrean";
				if(flags["KING_NYREA"] != undefined && pc.hasPerk("Nyrean Royal")) palaceName = pc.mf("King ", "Queen ") + possessive(pc.short);
				else if(metTaivra()) palaceName = "Queen Taivra’s";
				
				output2("\n<b><u>" + palaceName + " Palace</u></b>");
				// Gates
				if(flags["FOUGHT_PRAETORIANS"] != undefined || flags["PLAT190 USED AS NYREA BRIBE"] != undefined)
				{
					output2("\n<b>* Palace, Gates:</b>");
					if(nyreaDungeonGateOpen()) output2(" Open");
					else output2(" Closed");
				}
				// Spoils
				if(flags["NYREAN_SPOILS"] != undefined) output2("\n<b>* Palace, Last Received Royal Spoils:</b> " + prettifyMinutes(GetGameTimestamp() - flags["NYREAN_SPOILS"]) + " ago");
				// Chambers and Goo Incubator
				if(flags["CRYSTAL_GOO_GLORYHOLED"] != undefined || flags["CRYSTAL_GOO_DEFEAT"] != undefined || flags["LOOTED_TAIVRAS_BEDROOM"] != undefined)
				{
					output2("\n<b>* Palace, Queen’s Chamber:</b>");
					if(flags["CRYSTAL_GOO_GLORYHOLED"] != undefined)
					{
						output2(" Used gloryhole");
						if(flags["CRYSTAL_GOO_GLORYHOLED"] != 1) output2(" " + flags["CRYSTAL_GOO_GLORYHOLED"] + " times");
					}
					else output2(" Seen gloryhole");
					if(flags["CRYSTAL_GOO_DEFEAT"] == 1) output2(", Physically defeated Incubator Goo");
					if(flags["CRYSTAL_GOO_DEFEAT"] == 2) output2(", Lustfully defeated Incubator Goo");
					if(flags["CRYSTAL_GOO_DEFEAT"] == 3) output2(", Defeated and sexed Incubator Goo");
					if(flags["LOOTED_TAIVRAS_BEDROOM"] != undefined) output2(", Looted bedroom");
				}
				// Praetorian Guard
				if(flags["FOUGHT_PRAETORIANS"] != undefined || flags["PLAT190 USED AS NYREA BRIBE"] != undefined)
				{
					output2("\n<b>* Praetorian Guards:</b>");
					if(flags["PRAETORIAN_RESPAWN"] != undefined && (GetGameTimestamp() < flags["PRAETORIAN_RESPAWN"] + (12 * 60))) output2(" Away");
					else output2(" Active");
					if(flags["FOUGHT_PRAETORIANS"] != undefined) output2(", Fought them");
					if(flags["PLAT190 USED AS NYREA BRIBE"] != undefined) output2(", Bribed them with Platinum 190");
				}
				// Nyrean Princess
				if(flags["PRINCESS_DEFEATED"] != undefined || flags["TOOK_PRINCESS_BUTTGINITY"] != undefined)
				{
					output2("\n<b>* Nyrean Princess:</b> Met her");
					if(flags["PRINCESS_DEFEATED"] > 1 || flags["TOOK_PRINCESS_BUTTGINITY"] != undefined) output2(", Sexed her");
					if(flags["PRINCESS_DEFEATED"] == 2) output2(", You rode her ovipositor");
					if(flags["PRINCESS_DEFEATED"] == 3 || flags["TOOK_PRINCESS_BUTTGINITY"] != undefined) output2(", Took her anal virginity");
					if(flags["PRINCESS_DEFEATED"] == 4) output2(", She polished your penis");
					if(flags["PRINCESS_DEFEATED"] != undefined) output2(", Defeated her");
					if(9999 == 0) output2(" and freed harem");
				}
				// Taivra
				if(metTaivra())
				{
					output2("\n<b>* Queen Taivra:</b> Met her");
					if(flags["BEAT_TAIVRA_TIMESTAMP"] != undefined) output2(", Defeated her");
					if(flags["KILLED_TAIVRA"] != undefined) output2(", Killed her");
					if(flags["FUCKED_TAIVRA"] != undefined) output2(", Sexed her");
					if(flags["FUCKED_BY_TAIVRA"] != undefined) output2(", Fucked by her");
					if(flags["TAIVRA_FOOTJOBBED"] != undefined) output2(", Footjob by her");
					if(flags["TAIVRA_FERTILE"] != undefined)
					{
						output2("\n<b>* Queen Taivra, Fertility:</b>");
						if(taivraHasFertileEggs()) output2(" Has fertile eggs");
						else output2(" Normal");
						if(flags["TAIVRA_FERTILE"] > 0) output2("\n<b>* Queen Taivra, Last Fertilized Her:</b> " + prettifyMinutes(GetGameTimestamp() - flags["TAIVRA_FERTILE"]) + " ago");
					}
					if(flags["TAIVRA_CHAMBER_SEX"] != undefined) output2("\n<b>* Queen Taivra, Times Had Sex in Her Chambers:</b> " + flags["TAIVRA_CHAMBER_SEX"]);
					if(flags["TAIVRA_HAIRPULLED"] != undefined) output2("\n<b>* Queen Taivra, Times Pulled Her Hair During Hardlight Anal:</b> " + flags["TAIVRA_HAIRPULLED"]);
					if(flags["TAIVRA_THRONE_SEX"] != undefined) output2("\n<b>* Queen Taivra, Times Had Sex on Her Throne:</b> " + flags["TAIVRA_THRONE_SEX"]);
				}
				// Queensguard
				if(metTaivra())
				{
					if(flags["MET_CERRES"] == undefined) output2("\n<b>* Queensguard:</b>");
					else output2("\n<b>* Cerres:</b>");
					output2(" Met her");
					if(flags["QUEENSGUARD_STAB_TIME"] != undefined)
					{
						if(GetGameTimestamp() < flags["QUEENSGUARD_STAB_TIME"] + (12 * 60))
						{
							if(flags["FREED_DANE_FROM_TAIVRA"] != undefined) output2(", Defeated her, Injured by Dane");
							else output2(", Defeated and injured by Dane");
							output2(", Healing for " + prettifyMinutes(GetGameTimestamp() - flags["QUEENSGUARD_STAB_TIME"]));
						}
						else output2(", Healed from wounds");
					}
				}
				// Taivra's Betas
				if(flags["FUCKED_TAIVRAS_BETA"] > 0) output2("\n<b>* Taivra’s Egg-Stuffed Betas, Total Fucked:</b> " + flags["FUCKED_TAIVRAS_BETA"]);
				variousCount++;
			}
			// No Myr's Land
			if(flags["ENCOUNTERED_LANDMINES"] != undefined || flags["MET_ADULT_COCKVINE"] != undefined || flags["MET_COCKVINE_SEEDLING"] != undefined || flags["MET_GOLD_DESERTER"] != undefined || flags["MET_RED_DESERTER"] != undefined)
			{
				output2("\n<b><u>No Myr’s Land</u></b>");
				if(flags["ENCOUNTERED_LANDMINES"] != undefined)
				{
					output2("\n<b>* Landmines, Times Encountered:</b> " + flags["ENCOUNTERED_LANDMINES"]);
					if(flags["DISARMED_LANDMINES"] != undefined) output2("\n<b>* Landmines, Total Disarmed:</b> " + flags["DISARMED_LANDMINES"]);
				}
				if(flags["MET_ADULT_COCKVINE"] != undefined)
				{
					output2("\n<b>* Adult Cockvine, Times Encountered:</b> " + flags["MET_ADULT_COCKVINE"]);
					if(flags["FUCKED_ADULT_COCKVINE"] != undefined) output2("\n<b>* Adult Cockvine, Times Sexed:</b> " + flags["FUCKED_ADULT_COCKVINE"]);
				}
				if(flags["MET_COCKVINE_SEEDLING"] != undefined) output2("\n<b>* Cockvine Seedling, Times Encountered:</b> " + flags["MET_COCKVINE_SEEDLING"]);
				if(flags["MET_GOLD_DESERTER"] != undefined)
				{
					var goldMyrDeserterName:String = "Gold Myr Deserter";
					if(flags["KNOW_GOLD_MYR_NAME"] != undefined) goldMyrDeserterName = "Lys";
					output2("\n<b>* " + goldMyrDeserterName + "</b>");
					if(flags["GOLD_MYR_DESERTER_BEATEN"] != undefined && flags["GOLD_MYR_DESERTER_BEATEN"] >= 5 && flags["KNOW_GOLD_MYR_NAME"] != undefined) output2(" <b>(Non-hostile)</b>");
					output2("<b>, Times Encountered:</b> " + flags["MET_GOLD_DESERTER"]);
					if(flags["GAVE_LYS_FLOWER"] != undefined)
					{
						output2(", Gave her a flower");
						if(flags["GAVE_LYS_FLOWER"] != 1) output2(" " + flags["GAVE_LYS_FLOWER"] + " times");
					}
					else if(pc.hasItemByClass(VenusBloom) && flags["ENABLE_LYS_FLOWER"] != undefined) output2(", <i>Give her a flower!</i>");
					if(flags["GOLD_DILDOED"] != undefined) output2("\n<b>* " + goldMyrDeserterName + ", Times Used Dildo:</b> " + flags["GOLD_DILDOED"]);
				}
				if(flags["MET_RED_DESERTER"] != undefined)
				{
					var redMyrDeserterName:String = "Red Myr Deserter";
					if(flags["KNOW_RED_MYR_NAME"] != undefined) redMyrDeserterName = "Briha";
					output2("\n<b>* " + redMyrDeserterName + "</b>");
					if(flags["RED_MYR_DESERTER_BEATEN"] != undefined && flags["RED_MYR_DESERTER_BEATEN"] >= 5 && flags["KNOW_RED_MYR_NAME"] != undefined) output2(" <b>(Non-hostile)</b>");
					output2("<b>, Times Encountered:</b> " + flags["MET_RED_DESERTER"]);
					if(flags["BRIHA_INCUBATION_TIMER"] != undefined) output2("\n<b>* " + redMyrDeserterName + ", Days Pregnant:</b> " + flags["BRIHA_INCUBATION_TIMER"]);
					if(flags["RED_DILDOED"] != undefined) output2("\n<b>* " + redMyrDeserterName + ", Times Used Dildo:</b> " + flags["RED_DILDOED"]);
					if(flags["BRIHA_HARDLIGHT_STUFFED"] != undefined) output2("\n<b>* " + redMyrDeserterName + ", Times Fucked Her With Hardlight Strap-On:</b> " + flags["BRIHA_HARDLIGHT_STUFFED"]);
				}
				variousCount++;
			}
			// Wetraxxel Den
			if(flags["MET_WETRA_HOUND"] != undefined || flags["MET_WETRAXXEL_BRAWLER"] != undefined)
			{
				output2("\n<b><u>Wetraxxel Den</u></b>");
				if(flags["MET_WETRA_HOUND"] != undefined) output2("\n<b>* Wetra Hound, Times Encountered:</b> " + flags["MET_WETRA_HOUND"]);
				if(flags["MET_WETRAXXEL_BRAWLER"] != undefined)
				{
					output2("\n<b>* Wetraxxel, Times Encountered:</b> " + flags["MET_WETRAXXEL_BRAWLER"]);
					if(flags["WETRAXXEL_SUBMISSION"] != undefined)output2("\n<b>* Wetraxxel, Dominance Level:</b> " + flags["WETRAXXEL_SUBMISSION"] + "/10");
				}
				variousCount++;
			}
			// Deep Caverns
			if(flags["MET_FEIAN"] != undefined || flags["BOTHRIOC_PIDEMME_ENCOUNTERED"] != undefined || flags["BOTHRIOC_QUADOMME_ENCOUNTERED"] != undefined || flags["MET_GOO_KNIGHT"] != undefined || flags["MET_INFECTED_MYR_FEMALE"] != undefined || flags["MET_INFECTED_MYR_MALE"] != undefined || flags["MET_NYREA_ALPHA"] != undefined || flags["MET_NYREA_BETA"] != undefined || flags["CRYSTALGOO_T1_ENCOUNTERS"] != undefined || flags["CRYSTALGOO_T2_ENCOUNTERS"] != undefined )
			{
				output2("\n<b><u>The Deep Caverns</u></b>");
				if(flags["MET_FEIAN"] != undefined)
				{
					output2("\n<b>* Fei An Strozo:</b> Met her");
					if(flags["FEIAN_SEX"] == FEIAN_SEX_HERM) output2(", Has penis and vagina");
					else if(flags["FEIAN_SEX"] == FEIAN_SEX_MALE) output2(", Has penis");
					else if(flags["FEIAN_SEX"] == FEIAN_SEX_FEMALE) output2(", Has vagina");
					if(flags["JOIN_FEIAN_HAREM"] != undefined) output2(", You joined her harem");
				}
				if(flags["BOTHRIOC_PIDEMME_ENCOUNTERED"] != undefined)
				{
					output2("\n<b>* Bothrioc Pidemme, Times Encountered:</b> " + flags["BOTHRIOC_PIDEMME_ENCOUNTERED"]);
					if(flags["BOTHRIOC_PIDEMME_FUCKED"] != undefined) output2("\n<b>* Bothrioc Pidemme, Times Sexed:</b> " + flags["BOTHRIOC_PIDEMME_FUCKED"]);
				}
				if(flags["BOTHRIOC_QUADOMME_ENCOUNTERED"] != undefined)
				{
					output2("\n<b>* Bothrioc Quadomme, Times Encountered:</b> " + flags["BOTHRIOC_QUADOMME_ENCOUNTERED"]);
					if(flags["BOTHRIOC_QUADOMME_SEXED"] != undefined) output2("\n<b>* Bothrioc Quadomme, Times Sexed:</b> " + flags["BOTHRIOC_QUADOMME_SEXED"]);
				}
				if(flags["CRYSTALGOO_T1_ENCOUNTERS"] != undefined) output2("\n<b>* Ganrael Ambusher, Times Encountered:</b> " + flags["CRYSTALGOO_T1_ENCOUNTERS"]);
				if(flags["CRYSTALGOO_T2_ENCOUNTERS"] != undefined) output2("\n<b>* Ganrael Deadeye, Times Encountered:</b> " + flags["CRYSTALGOO_T2_ENCOUNTERS"]);
				if(flags["MET_GOO_KNIGHT"] != undefined) output2("\n<b>* Ganraen Knight, Times Encountered:</b> " + flags["MET_GOO_KNIGHT"]);
				if(flags["MET_INFECTED_MYR_FEMALE"] != undefined) output2("\n<b>* Female Infected Myr, Times Encountered:</b> " + flags["MET_INFECTED_MYR_FEMALE"]);
				if(flags["MET_INFECTED_MYR_MALE"] != undefined) output2("\n<b>* Male Infected Myr, Times Encountered:</b> " + flags["MET_INFECTED_MYR_MALE"]);
				if(flags["MET_NYREA_ALPHA"] != undefined) output2("\n<b>* Alpha Nyrean Huntress, Times Encountered:</b> " + flags["MET_NYREA_ALPHA"]);
				if(flags["MET_NYREA_BETA"] != undefined) output2("\n<b>* Beta Nyrean Huntress, Times Encountered:</b> " + flags["MET_NYREA_BETA"]);
				variousCount++;
			}
			// Travel Points
			if(flags["NO_ANTS_LAND_TAXI_UNLOCKED"] != undefined || flags["LOOTED_MYR_RIFLE"] != undefined || flags["DEEP_CAVES_TAXI_UNLOCKED"] != undefined)
			{
				output2("\n<b><u>Myrellion Travel Points</u></b>");
				// Radio Bunker
				if(flags["NO_ANTS_LAND_TAXI_UNLOCKED"] != undefined || flags["LOOTED_MYR_RIFLE"] != undefined)
				{
					output2("\n<b>* Radio Bunker:</b> Found");
					if(flags["NO_ANTS_LAND_TAXI_UNLOCKED"] != undefined) output2(", Repaired radio communications");
					if(flags["LOOTED_MYR_RIFLE"] == 1) output2(", Looted bunker");
				}
				// Crash Site
				if(flags["DEEP_CAVES_TAXI_UNLOCKED"] != undefined)
				{
					output2("\n<b>* Crash Site:</b> Found");
					if(flags["DEEP_CAVES_TAXI_UNLOCKED"] != undefined) output2(", Activated beacon");
				}
				variousCount++;
			}
		}
		
		if(showID == "Zheng Shi" || showID == "All")
		{
			if(flags["MET_URBOLG"] != undefined)
			{
				output2("\n<b><u>Hangar Bay</u></b>");
				output2("\n<b>* Urbolg:</b> Met him");
				if(flags["URBOLG_LOSSES"] != undefined) output2(", Defeated by him in combat");
				if(flags["URBOLG_LUSTED"] != undefined) output2(", Defeated him with lust");
				if(flags["SEXED_URBOLG"] != undefined) output2("\n<b>* Urbolg, Times Sexed:</b> " + flags["SEXED_URBOLG"]);
				if(flags["URBOLG_DOGGYED"] != undefined) output2("\n<b>* Urbolg, Times He Fucked You Doggy-style:</b> " + flags["URBOLG_DOGGYED"]);
				variousCount++;
			}
			if(flags["GOT_URBOLGS_SHIELD"] != undefined)
			{
				output2("\n<b><u>Artificer’s Office</u></b>");
				output2("\n<b>* Urbolg’s Safe:</b>");
				if(flags["GOT_URBOLGS_SHIELD"] >= 1) output2(" Found, Shield looted");
				else output2(" Know about it, <i>Lock combination is 7-8-9</i>");
				variousCount++;
			}
			if(flags["MAIKE_QUARTERS_UNLOCKED"] != undefined)
			{
				output2("\n<b><u>Maike’s Quarters</u></b>");
				output2("\n<b>* Status:</b>");
				switch(flags["MAIKE_QUARTERS_UNLOCKED"])
				{
					case 1: output2(" Unlocked by card"); break;
					case 2: output2(" Unlocked by hacking"); break;
					default: output2(" <i>Unknown</i>"); break;
				}
				if(flags["MET_TIVF"] != undefined) output2("\n<b>* Tivf:</b> Met him");
				variousCount++;
			}
			if(flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined || flags["AGROSH_WHUPPED"] != undefined)
			{
				output2("\n<b><u>Break Room</u></b>");
				output2("\n<b>* Agrosh:</b> Met him");
				if(flags["AGROSH_WHUPPED"] != undefined) output2(", Defeated him in combat");
				if(flags["ARDIA_WHACKED_OFF_AGROSH"] != undefined) output2(", Sexed him with Ardia");
				output2("\n<b>* Ardia:</b> Met her");
				if (immuneToArdia()) output2(", Became immune to her cum");
				if(flags["SEXED_ARDIA"] != undefined)
				{
					output2("\n<b>* Ardia, Sex Organs:</b> " + listCharGenitals("ARDIA"));
					output2("\n<b>* Ardia, Times Sexed:</b> " + flags["SEXED_ARDIA"]);
				}
				if(flags["ARDIA_BUTTLOVED"] != undefined) output2("\n<b>* Ardia, Times Fucked Her Ass:</b> " + flags["ARDIA_BUTTLOVED"]);
				if (ardiaDomLevel() > 0) output2("\n<b>* Ardia, Dominance Towards You:</b> " + ardiaDomLevel())
				variousCount++;
			}
			if(flags["ZHENG_SHI_JUMPSUITED"] != undefined)
			{
				output2("\n<b><u>Dead End</u></b>");
				output2("\n<b>* Jumpsuit:</b> Taken");
				variousCount++;
			}
			if(flags["ZHENG_SPACESUIT_TAKEN"] != undefined || flags["ZHENG_SPACEWALKED"] != undefined)
			{
				output2("\n<b><u>Emergency Airlock</u></b>");
				if(flags["ZHENG_SPACESUIT_TAKEN"] != undefined) output2("\n<b>* Spacesuit:</b> Taken");
				if(flags["ZHENG_SPACEWALKED"] != undefined) output2("\n<b>* Spacewalk:</b> Used");
				variousCount++;
			}
			if(maikeEncountered() || flags["MAIKE_SLAVES_RELEASED"] != undefined)
			{
				output2("\n<b><u>The Pit</u></b>");
				if(maikeEncountered()) output2("\n<b>* " + (flags["TIVF_MAIKE_TALK"] == 1 ? "Overseer Maike" : "Overseer") + ":</b> Met her");
				if(flags["MAIKE_SLAVES_RELEASED"] != undefined)
				{
					output2("\n<b>* Slaves:</b> Seen");
					switch(flags["MAIKE_SLAVES_RELEASED"])
					{
						case -1: output2(", Enslaved"); break;
						case 1: output2(", Released"); break;
						case 2: output2(", Freed, Inciting rebellion"); break;
						default: output2(" <i>Unknown</i>"); break;
					}
				}
				if(flags["MAIKE_HELMET_TAKEN"] != undefined) output2("\n<b>* Spacesuit Helmet:</b> Taken");
				variousCount++;
			}
			if(flags["MET_LORELEI"] != undefined || flags["BORED_JUMPER_JUMPED"] != undefined || flags["MINING_ROBOT_ENCOUNTERS"] != undefined || flags["ZHENG_SLAVE_SNEAK_DISABLED"] != undefined || flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined || flags["MET_ROZ"] != undefined || flags["MET_SLAVEBREAKERS"] != undefined)
			{
				output2("\n<b><u>Mineshaft</u></b>");
				// Lorelei
				if(flags["MET_LORELEI"] != undefined)
				{
					var loreleiName:String = chars["LORELEI"].short;
					output2("\n<b>* " + loreleiName + ":</b> Met her");
					if(flags["LORELEI_FOUGHT"] != undefined) output2(", Fought her");
					if(flags["LORELEI_BEATEN"] != undefined) output2(", Defeated her");
					if(flags["LORELEI_SEXED"] != undefined) output2("\n<b>* " + loreleiName + ", Times Sexed:</b> " + flags["LORELEI_SEXED"]);
				}
				// Jumper
				if(flags["BORED_JUMPER_JUMPED"] != undefined)
				{
					output2("\n<b>* Bored Jumper, Times Encountered:</b> " + flags["BORED_JUMPER_JUMPED"]);
					if(flags["BORED_JUMPER_CONSECUTIVE_LOSSES"] > 1) output2("\n<b>* Bored Jumper, Combat, Times You Consecutively Lost:</b> " + flags["BORED_JUMPER_CONSECUTIVE_LOSSES"]);
					if(flags["JUMPER_DOCKED"] != undefined) output2("\n<b>* Bored Jumper, Times Docked By:</b> " + flags["JUMPER_DOCKED"]);
					if(flags["BJUMPER_HORSE_TOTAL_KIDS"] != undefined) output2("\n<b>* Bored Jumper, Total Kids (gray):</b> " + flags["BJUMPER_HORSE_TOTAL_KIDS"]);
					if(flags["BJUMPER_DOG_TOTAL_KIDS"] != undefined) output2("\n<b>* Bored Jumper, Total Kids (white):</b> " + flags["BJUMPER_DOG_TOTAL_KIDS"]);
					if(flags["BJUMPER_CAT_TOTAL_KIDS"] != undefined) output2("\n<b>* Bored Jumper, Total Kids (creamy):</b> " + flags["BJUMPER_CAT_TOTAL_KIDS"]);
					if(flags["BJUMPER_TERRAN_TOTAL_KIDS"] != undefined) output2("\n<b>* Bored Jumper, Total Kids (brown):</b> " + flags["BJUMPER_TERRAN_TOTAL_KIDS"]);
					if(flags["BJUMPER_PREG_TIMER"] != undefined)
					{
						output2("\n<b>* Bored Jumper, Days Pregnant");
						if(flags["BJUMPER_PREG_TYPE"] != undefined) output2(" (" + boredJumperFurColor(flags["BJUMPER_PREG_TYPE"]) + ")");
						output2(":</b> " + flags["BJUMPER_PREG_TIMER"]);
					}
					
				}
				// Mining bot
				if(flags["MINING_ROBOT_ENCOUNTERS"] != undefined) output2("\n<b>* Mining Robot, Times Encountered:</b> " + flags["MINING_ROBOT_ENCOUNTERS"]);
				// Pleasure Slaves
				if(flags["ZHENG_SLAVE_SNEAK_DISABLED"] != undefined || flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined)
				{
					output2("\n<b>* Pleasure Slaves:</b> Encountered");
					if(flags["ZHENG_SLAVE_SNEAK_DISABLED"] != undefined) output2(", Ignored");
					if(flags["ZHENG_SHI_SLAVE_SNUCK"] != undefined) output2(", Blended in");
				}
				// Roz
				if(flags["MET_ROZ"] != undefined)
				{
					output2("\n<b>* Rozenn, Times Encountered:</b> " + flags["MET_ROZ"]);
					if(flags["ROZ_GOOFUKKED_WNO_DIK"] != undefined) output2("\n<b>* Rozenn, Times She Fucked You with Her Dick:</b> " + flags["ROZ_GOOFUKKED_WNO_DIK"]);
					if(flags["ROZ_INTERNAL_FUCKED"] != undefined) output2("\n<b>* Rozenn, Internal Fuck, Times Opted to Jack Her Out:</b> " + flags["ROZ_INTERNAL_FUCKED"]);
					if(flags["ROZ_INTERNAL_FUCKED_SUBMITTED"] != undefined) output2("\n<b>* Rozenn, Internal Fuck, Times Opted to Give Up:</b> " + flags["ROZ_INTERNAL_FUCKED_SUBMITTED"]);
				}
				// Slavebreaker
				if(flags["MET_SLAVEBREAKERS"] != undefined)
				{
					output2("\n<b>* Slavebreaker, Times Encountered:</b> " + flags["MET_SLAVEBREAKERS"]);
					if(flags["SLYVEREN_SUBMISSION"] != undefined) output2("\n<b>* Slavebreaker, Dominance:</b> " + formatFloat(slyverenSubmission(), 1) + " %");
					if(flags["SLYVEREN_SUCKLESUBMITTED"] != undefined) output2("\n<b>* Slavebreaker, Times Suckled You Into Submission:</b> " + flags["SLYVEREN_SUCKLESUBMITTED"]);
					if(flags["SLYVEREN_THROBB_FUCKED"] != undefined) output2("\n<b>* Slavebreaker, Times Throbb-Fucked By:</b> " + flags["SLYVEREN_THROBB_FUCKED"]);
					if(flags["SLYVEREN_WIN_FACEFUKT"] != undefined) output2("\n<b>* Slavebreaker, Times Face Fucked Her:</b> " + flags["SLYVEREN_WIN_FACEFUKT"]);
				}
				variousCount++;
			}
			if(flags["TOOK_FEDORA"] == 1 || flags["SNAKEBYTE_LOOTED"] == 1 || flags["FORGEHOUND_ENCOUNTERED"] != undefined || flags["MET_SECOP_MALE"] != undefined || flags["MET_SECOP_FEMALE"] != undefined || flags["RATS_ENABLED"] != undefined || flags["FIREPUP_ENCOUNTERS"] != undefined)
			{
				output2("\n<b><u>Foundry</u></b>");
				// Items looted
				if(flags["TOOK_FEDORA"] == 1) output2("\n<b>* Fedora:</b> Taken");
				if(flags["SNAKEBYTE_LOOTED"] == 1) output2("\n<b>* SnakeByte:</b> Looted");
				// Forgehound
				if(flags["FORGEHOUND_ENCOUNTERED"] != undefined)
				{
					output2("\n<b>* Forgehound, Times Encountered:</b> " + flags["FORGEHOUND_ENCOUNTERED"]);
					if(flags["FORGEHOUND_INSULTED"] != undefined) output2(", Insulted him");
					if(flags["FORGEHOUND_APOLIFUCKED"] != undefined) output2(", Sexed him as an apology");
					if(flags["FORGEHOUND_FACEFUCKED"] != undefined) output2("\n<b>* Forgehound, Times Face Fucked Him:</b> " + flags["FORGEHOUND_FACEFUCKED"]);
					if(flags["FORGEHOUND_PEGGED"] != undefined) output2("\n<b>* Forgehound, Times Ass Fucked Him:</b> " + flags["FORGEHOUND_PEGGED"]);
					if(flags["FORGEHOUND_MOUNTEDRUTTED"] != undefined) output2("\n<b>* Forgehound, Times Mounted Him:</b> " + flags["FORGEHOUND_MOUNTEDRUTTED"]);
					if(flags["FORGEHOUND_FISTED"] != undefined) output2("\n<b>* Forgehound, Times Fisted Him:</b> " + flags["FORGEHOUND_FISTED"]);
					if(flags["FORGEHOUND_BUKKAKED"] != undefined) output2("\n<b>* Forgehound, Times Ejaculated On Him:</b> " + flags["FORGEHOUND_BUKKAKED"]);
				}
				// Corona Flamer
				if(flags["FIREPUP_ENCOUNTERS"] != undefined) output2("\n<b>* Corona Lord Flamer, Times Encountered:</b> " + flags["FIREPUP_ENCOUNTERS"]);
				if(flags["FIREPUP_SEXED_ROUGH"] != undefined) output2(", Fucked Her Hard");
				if(flags["FIREPUP_PUNISHED"] != undefined)
				{
					output2("\n<b>* Corona Lord Flamer, Standing Orders:</b> ");
					if(flags["FIREPUP_PUNISHED"] == FIREPUP_KNEEL) output2("Get On Her Knees");
					else if(flags["FIREPUP_PUNISHED"] == FIREPUP_BEND) output2("Bend Over");
					else if(flags["FIREPUP_PUNISHED"] == FIREPUP_BUTT) output2("Offer Her Ass");
					else output2(" ERROR");
					if(!fireBitchPunishSceneAvailable()) output2(", <b>You Lack Appropriate Genitalia</b>");
				}
				// Cyberpunk SecOps
				if(flags["MET_SECOP_MALE"] != undefined) output2("\n<b>* Male Punk Security Operative, Times Encountered:</b> " + flags["MET_SECOP_MALE"]);
				if(flags["MET_SECOP_FEMALE"] != undefined) output2("\n<b>* Female Punk Security Operative, Times Encountered:</b> " + flags["MET_SECOP_FEMALE"]);
				variousCount++;
				// Rat's Raiders
				if(flags["RATS_ENABLED"] != undefined)
				{
					output2("\n<b>* Rat’s Raiders:</b> Tried to rob Urbolg");
					if(flags["RATCOUNTERS"] != undefined) output2(", Encountered");
					if(flags["RATS_RIDDEN"] != undefined) output2(", Used as a horse");
					if(ratsPCIsKnown()) output2("\n<b>* Rat’s Raiders, Attitude:</b> " + (ratsReadyToBefriend() ? "Accepting" : ["", "Dirty", "Subdued", "Yielding", "Befriended"][ratputation()]) + " (" + flags["RATPUTATION"] + ")");
					if(flags["RATS_OFFERED_SERVICE"] != undefined)
					{
						output2("\n* <b>Rat’s Raiders, Offered Oral:</b> Attempted " + flags["RATS_OFFERED_SERVICE"] + " times");
						if(flags["RAT_SERVICED"] != undefined) output2(", Succeded " + flags["RAT_SERVICED"] + " times");
					}
					if(flags["RATS_OFFERED_MILK"] != undefined)
					{
						output2("\n* <b>Rat’s Raiders, Offered Milk:</b> Attempted " + flags["RATS_OFFERED_MILK"] + " times");
						if(flags["RAT_MILKED"] != undefined) output2(", Succeded " + flags["RAT_MILKED"] + " times");
					}
					if(flags["RATS_SEXED"] != undefined)
					{
						output2("\n<b>* Rat’s Raiders, Times Sexed:</b> " + flags["RATS_SEXED"]);
						output2("\n<b>* Rat’s Raiders, Sex Acts Done</b>: ");
						var ratSex:Array = new Array();
						if(flags["RATS_TRIPLE_SERVICED"] != undefined) ratSex.push("Triple Blowjob");
						if(flags["RATS_POUNDED"] != undefined) ratSex.push("Doggystyle");
						if(flags["RATS_WINRIDDEN"] != undefined) ratSex.push("Riding");
						if(flags["RATS_SEXED_EAR"] != undefined) ratSex.push("Ear Sex");
						if(flags["RATS_SPANKED"] != undefined) ratSex.push("Spanking");
						if(flags["RATS_LOSS_SEXED"] != undefined) ratSex.push("Was Teased");
						if(flags["RATS_GANGBANGED"] != undefined) ratSex.push("Gangbang");
						if(flags["RATS_RIDDEN"] != undefined) ratSex.push("Was Abandoned With Jumper");
						if(flags["RATS_HARVESTED"] != undefined) ratSex.push("Was “Harvested”");
						output2(ratSex.join(", "));
					}
					if(flags["RATS_SEXED_EAR"] != undefined)
					{
						if(flags["RATS_SEXED_EAR_0"] != undefined)
						{
							output2("\n<b>* Rat’s Raiders, Pink Rodenian Ear Sex Count:</b> " + flags["RATS_SEXED_EAR_0"]);
							if(flags["RATS_SEXED_EAR_0"] < 5) output2(" (Unknown)");
							else if(flags["RATS_SEXED_EAR_0"] < 10 || !ratsPCIsGood()) output2(" (Appreciable)");
							else if(flags["RATS_SEXED_EAR_0"] < 15 || flags["RATS_EARMARK_0"] == undefined) output2(" (Earmarked)");
							else output2(" (Attached)");
						}
						if(flags["RATS_SEXED_EAR_1"] != undefined)
						{
							output2("\n<b>* Rat’s Raiders, White Rodenian Ear Sex Count:</b> " + flags["RATS_SEXED_EAR_1"]);
							if(flags["RATS_SEXED_EAR_1"] < 5) output2(" (Unknown)");
							else if(flags["RATS_SEXED_EAR_1"] < 10 || !ratsPCIsGood()) output2(" (Appreciable)");
							else if(flags["RATS_SEXED_EAR_1"] < 15 || flags["RATS_EARMARK_1"] == undefined) output2(" (Earmarked)");
							else output2(" (Attached)");
						}
					}
					if(flags["RAT_BOUNTY_STOLEN"] != undefined)
					{
						output2("\n<b>* Rat’s Raiders, Bounty Lost:</b> " + flags["RAT_BOUNTY_STOLEN"]);
						if(silly)
						{
							output2(" (With that, you could have");
							var ratItems:Array = new Array();
							if(flags["RAT_BOUNTY_STOLEN"] >= 7000000)
							{
								ratItems.push(" paid a therapist to determine how you lost this much money to three rodents over and over");
								ratItems.push(" bought some drugs that would help you understand how the rats took this much money");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 5000000)
							{
								ratItems.push(" taken over Tavros and then... THE UNIVERSE!");
								ratItems.push(" bought a series of concept art jpegs depicting ships in a virtual space-sim game");
								ratItems.push(" conquered earth with a genetically identical army of clones");
								ratItems.push(" bought some drugs that would help you understand how the rats took this much money");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 2600000)
							{
								ratItems.push(" bought an entire planet - well... maybe not");
								ratItems.push(" paid for your nursery staff");
								ratItems.push(" moved the raskvel broodmother off Tarkus");
								ratItems.push(" started your own line of unnecessary social media-enabled devices and services");
								ratItems.push(" bought some drugs that would help you understand how the rats took this much money");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 2100000)
							{
								ratItems.push(" bought an indie game development studio - only to lose it all again (Darn!)");
								ratItems.push(" bought a PC monitor that displays 69-hertz");
								ratItems.push(" bought some drugs that would help you understand how the rats took this much money");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 1600000)
							{
								ratItems.push(" bought a private army");
								ratItems.push(" bought a fleet of ships to begin a trade empire");
								ratItems.push(" bought some drugs that would help you understand how the rats took this much money");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 1300000)
							{
								ratItems.push(" bought your own luxury cruise liner");
								ratItems.push(" bought a private island somewhere nice");
								ratItems.push(" bought a new company");
								ratItems.push(" bought some drugs that would help you understand how the rats took this much money");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 690000)
							{
								ratItems.push(" gotten more storage on your ship");
								ratItems.push(" bought a sex bot with more sex scenes");
								ratItems.push(" bought a new game plus mode");
								ratItems.push(" bought some drugs that would help you understand how the rats took this much money");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 500000)
							{
								ratItems.push(" opened a TiTS-Coin Mining Station and made back all this money if the bubble didn’t pop");
								ratItems.push(" bought a new pair of eyes");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 240000)
							{
								ratItems.push(" bought one of Spacegate’s 60-terabyte SSDs");
								ratItems.push(" invested in your own small business with health benefits for a few employees");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 120000)
							{
								ratItems.push(" bought a brand new space ship");
								ratItems.push(" paid off your mortgage");
								ratItems.push(" bought a lot of emotes in Team Fortress 2");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 60000)
							{
								ratItems.push(" bought some shiny trinkets");
								ratItems.push(" bought a musician’s contract");
								ratItems.push(" paid for two months of TiTS development");
								ratItems.push(" bought Hand So back");
								ratItems.push(" bought a brand new Casstech Z14");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 30000)
							{
								ratItems.push(" bought a bodyguard");
								ratItems.push(" bought someone to keep you from losing this much money");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 15000)
							{
								ratItems.push(" bought a single outfit");
								ratItems.push(" bought a brand new car");
								ratItems.push(" bought a used Casstech Z14");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 6000)
							{
								ratItems.push(" bought a prostitute’s contract");
								ratItems.push(" bought the latest designer TFs");
								ratItems.push(" bought a brand new SCV");
								ratItems.push(" bought a lot of gift cards for ungrateful family members");
								ratItems.push(" bought a new cousin");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 3000)
							{
								ratItems.push(" bought some Ausar Treats");
								ratItems.push(" bought some DracoGuard");
								ratItems.push(" bought a robo-arm");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 400)
							{
								if(pc.hasHair()) ratItems.push(" gotten a haircut");
								ratItems.push(" bought some sterilex");
								if(pc.hasCock()) ratItems.push(" bought a Condensol pill");
								else if(pc.hasVagina()) ratItems.push(" bought a Mighty Tight pill");
								ratItems.push(" bought a supply of Easy Fit cream");
							}
							else if(flags["RAT_BOUNTY_STOLEN"] >= 10)
							{
								ratItems.push(" bought a beer");
								ratItems.push(" bought a sandwich");
							}
							if(ratItems.length == 0) output2(" bought... nothing? <i>How did you do this?</i>)");
							else if(flags["RAT_BOUNTY_STOLEN"] >= 10000000) output2(" have completed the game by hiring every merc on the frontier to bring you the probes and deal with your cousin)");
							else if(flags["RAT_BOUNTY_STOLEN"] >= 20000000) output2("... you could have just not lost this much money, you know?)");
							else output2(RandomInCollection(ratItems) + ")");
						}
					}
				}
			}
			if(flags["MET_OLYMPIA"] != undefined || flags["TEYAAL_DEFEATED"] != undefined)
			{
				output2("\n<b><u>Research & Development Lab</u></b>");
				output2("\n<b>* Ship Status:</b> " + (pirateResearchVesselStolen() ? "Stolen" : "Docked"));
				// Olympia
				if(flags["MET_OLYMPIA"] != undefined)
				{
					output2("\n<b>* Olympia:</b> Met her");
					if(olympiaRecruited())
					{
						output2(", Crew member");
						if(olympiaIsCrew()) output2(" (Onboard Ship)");
					}
					else if(flags["OLYMPIA_KILLED"] != undefined) output2(", Killed her");
					if(flags["OLYMPIA_SEXED"] != undefined) output2("\n<b>* Olympia, Times Sexed:</b> " + flags["OLYMPIA_SEXED"]);
				}
				// Dr. Teyaal
				if(flags["TEYAAL_DEFEATED"] != undefined)
				{
					output2("\n<b>* Dr. Teyaal:</b> Met her");
					if(flags["TEYAAL_DEFEATED"] >= 1) output2(", Defeated her");
					if(flags["TEYAAL_DEFEATED"] >= 2) output2(", She escaped");
				}
				variousCount++;
			}
			if(flags["SHOCK_HOPPER_DEFEATED"] != undefined)
			{
				output2("\n<b><u>Captain’s Quarters</u></b>");
				if(flags["JUMPER_LEADERSHIP_WINFUCKED"] != undefined)
				{
					output2("\n<b>* Jumper Leadership:</b> Won leadership through sex");
					if(flags["JUMPER_LEADERSHIP_LIKED_WINFUCK"] != undefined) output2(", They liked it");
				}
				// The DCL
				output2("\n<b>* The L.D.C.:</b> Met him");
				if(flags["LDC_FUCKED"] != undefined) output2(", Sexed him");
				if(flags["LDC_TOTAL_KIDS"] != undefined) output2("\n<b>* The L.D.C., Total Kids:</b> " + flags["LDC_TOTAL_KIDS"]);
				// Fight Bunny
				output2("\n<b>* Shock Hopper:</b> Met her");
				if(flags["SHOCK_HOPPER_FUCKED"] != undefined) output2(", Sexed her");
				if(flags["SHOCKHOPPER_TOTAL_KIDS"] != undefined) output2("\n<b>* Shock Hopper, Total Kids:</b> " + flags["SHOCKHOPPER_TOTAL_KIDS"]);
				// Slaves
				if(flags["JUMPER_SLAVES_FREED"] != undefined) output2("\n<b>* Slaves:</b> " + (flags["JUMPER_SLAVES_FREED"] == 1 ? "Freed" : "Ignored"));
				variousCount++;
			}
			// Casino Royale
			if(flags["MET_ROO"] != undefined)
			{
				output2("\n<b><u>Treasure Nova</u></b>");
				// Roo
				if(flags["MET_ROO"] != undefined)
				{
					output2("\n<b>* Roo:</b> Met her");
					if(flags["ROO_GAMES_PLAYED"] != undefined) output2("\n<b>* Roo, Times Played Blackjack With:</b> " + flags["ROO_GAMES_PLAYED"]);
				}
			}
			if(flags["MET_CHERRY"] != undefined)
			{
				output2("\n<b><u>Cherry’s Slut Wall</u></b>");
				output2("\n<b>* Cherry:</b> Met her");
				if(flags["WALLSLUTS_NOISY_RODENTS_WALNUTTED"] != undefined) output2("\n<b>* Walnut, Times Came in Eargina:</b> " + flags["WALLSLUTS_NOISY_RODENTS_WALNUTTED"]);
				if(flags["WALLSLUTS_NOISY_RODENTS_CHESTNUTTED"] != undefined) output2("\n<b>* Chestnut, Times Came in Eargina:</b> " + flags["WALLSLUTS_NOISY_RODENTS_CHESTNUTTED"]);
				if(flags["WALLSLUTS_NOISY_RODENTS_NUTTED_TS"] != undefined) wallSlutsNoisyRodentsReduceCum();
				if(flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"] != undefined) output2("\n<b>* Walnut, Cum in Boobwombs:</b> " + flags["WALLSLUTS_NOISY_RODENTS_WALNUT_CUM"]);
				if(flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"] != undefined) output2("\n<b>* Chestnut, Cum in Boobwombs:</b> " + flags["WALLSLUTS_NOISY_RODENTS_CHESTNUT_CUM"]);
				variousCount++;
			}
			// More Rec Dec?
			if(flags["MET_VULRIKS"] != undefined)
			{
				output2("\n<b><u>Recreational Deck:</u></b>");
				if(flags["MET_VULRIKS"] != undefined)
				{
					output2("\n<b>* Vulriks:</b> Met him");
					if(flags["VULRIKS_SEXED"] != undefined) output2(", Sexed him");
					if(flags["VULRIKS_SOLD"] != undefined) output2(", Has paid " + flags["VULRIKS_SOLD"] + " credits for your items");
				}
			}
		}
		
		if(showID == "Uveto" || showID == "All")
		{
			if(flags["MET_SYNPHIA"] != undefined)
			{
				output2("\n<b><u>Hangar Bay</u></b>");
				// Synphia
				if(flags["MET_SYNPHIA"] != undefined)
				{
					output2("\n<b>* Synphia:</b> Met her");
					if(flags["FUCKED_SYNPHIA"] != undefined) output2("\n<b>* Synphia, Times Sexed:</b> " + flags["FUCKED_SYNPHIA"]);
					if(flags["SYNPHIA_VENOMS"] != undefined) output2("\n<b>* Synphia, Times She Used Her Venom On You:</b> " + flags["SYNPHIA_VENOMS"]);
					if(flags["SYNPHIA_SUCKS"] != undefined) output2("\n<b>* Synphia, Times She Sucked Your Cock:</b> " + flags["SYNPHIA_SUCKS"]);
					//if(flags["SYNPHIA_HEADPOLISHES"] != undefined) output2("\n<b>* Synphia, Times She Sucked Your Cock :</b> " + flags["SYNPHIA_HEADPOLISHES"]);
					if(flags["SYNPHIA_DICKGASMS"] != undefined) output2("\n<b>* Synphia, Times She Orgasmed to Your Cock:</b> " + flags["SYNPHIA_DICKGASMS"]);
				}
				variousCount++;
			}
			// Uveto Station
			if(flags["UVETO_HUSKAR_FOURSOME"] != undefined)
			{
				output2("\n<b><u>Uveto Station</u></b>");
				// Twin huskar bimbo scientists!
				if(flags["UVETO_HUSKAR_FOURSOME"] != undefined)
				{
					output2("\n<b>* Marina and Galina:</b> Met them");
					if(flags["UVETO_HUSKAR_FOURSOME"] == -1) output2(", Not interested in them");
					if(flags["UVETO_HUSKAR_FOURSOME"] == 1) output2(", Sexed them");
				}
				variousCount++;
			}
			// Accu-Pitch
			if(flags["MET_BELLE"] != undefined)
			{
				output2("\n<b><u>Accu-Pitch Labs</u></b>");
				output2("\n<b>* Belle:</b> Met her");
				if(pc.hasKeyItem("Sub-Tuner Collar")) output2(", You’re her pet");
				if(flags["SUB_TUNERED"] != undefined) output2("\n<b>* Belle, Experiments, Trifecta, Total:</b> " + flags["SUB_TUNERED"]);
				if(flags["SUBTUNER_TENTACLES"] != undefined) output2("\n<b>* Belle, Experiments, Tentacles, Total:</b> " + flags["SUBTUNER_TENTACLES"]);
				if(flags["SUBTUNER_EXHIBITIONISM"] != undefined) output2("\n<b>* Belle, Experiments, Exhibitionism, Total:</b> " + flags["SUBTUNER_EXHIBITIONISM"]);
				if(flags["SUBTUNER_HYPNOED"] != undefined) output2("\n<b>* Belle, Experiments, Hypnotism, Total:</b> " + flags["SUBTUNER_HYPNOED"]);
				if(flags["MET_SAEC"] != undefined)
				{
					output2("\n<b>* Saec:</b> Met her");
					if(flags["SAEC_DATES"] != undefined) output2("\n<b>* Saec, Times Dated:</b> " + flags["SAEC_DATES"]);
					if(flags["SEXED_SAEC"] != undefined) output2("\n<b>* Saec, Times Sexed:</b> " + flags["SEXED_SAEC"]);
				}
				variousCount++;
			}
			// Carbonado
			if(flags["MET_CFS"] != undefined)
			{
				output2("\n<b><u>Carbonado</u></b>");
				if(flags["MET_CFS_GWEN"] != undefined) output2("\n<b>* Gwen:</b> Met her");
				if(flags["FUCKED_GWEN"] != undefined) output2(", Sexed her");
				if(flags["MET_CFS_EIMEAR"] != undefined) output2("\n<b>* Eimear:</b> Met her");
				if(flags["HUNGOUT_CFS"] != undefined)
				{
					output2("\n<b>* Gwen and Eimear:</b> Hung out with them");
					if(flags["HUNGOUT_CFS"] > 1) output2(" " + num2Text(flags["HUNGOUT_CFS"]) + " times");
				}
				variousCount++;
			}
			// Nerrasa
			if(flags["MET_NERRASA"] != undefined)
			{
				output2("\n<b><u>The Last Chance</u></b>");
				output2("\n<b>* Nerrasa:</b> Met her");
				if(flags["NERRASAS_PET"] != undefined) output2(", You’re her pet");
				if(flags["NERRASA_FUCKED"] != undefined) output2("\n<b>* Nerrasa, Times Sexed:</b> " + flags["NERRASA_FUCKED"]);
				variousCount++;
			}
			// Office of the Camarilla
			if(flags["MET_TLAKO"] != undefined || flags["MET_XOTCHI"] != undefined)
			{
				output2("\n<b><u>Office of the Camarilla</u></b>");
				if(flags["MET_TLAKO"] != undefined)
				{
					output2("\n<b>* Tlako:</b> Met her");
					if(flags["TLAKO_BASKETS"] != undefined)
					{
						output2(", Bought welcome basket from her");
						if(flags["TLAKO_BASKETS"] > 1) output2(" " + num2Text(flags["TLAKO_BASKETS"]) + " times");
					}
					if(flags["FLORKED_TLAKO"] != undefined) output2("\n<b>* Tlako, Times Florked:</b> " + flags["FLORKED_TLAKO"]);
				}
				if(flags["MET_XOTCHI"] != undefined)
				{
					output2("\n<b>* Xotchi Tzall:</b> Met her");
					if(xotchiIsMistress()) output2(", Mistress");
				}
				variousCount++;
			}
			// RhenWorld Offices
			if(flags["RHENWORLD_OFFICE_VISITED"] != undefined)
			{
				output2("\n<b><u>RhenWorld Offices</u></b>");
				if(9999 == 0) output2("\n<b>* Kyris:</b> Met her");
				else output2("\n<b>* Secretary:</b> Met her");
				if(flags["MET_RHENESUNNE"] != undefined)
				{
					output2("\n<b>* Anyxine Rhenesunne:</b> Met her");
				}
			}
			// Vava Groom
			if(flags["VAVA_GROOM_VISIT"] != undefined)
			{
				output2("\n<b><u>Vava Groom</u></b>");
				if(flags["VAVA_GROOM_ROLE"] != undefined)
				{
					output2("\n<b>* Services, Your Role:</b>");
					switch(flags["VAVA_GROOM_ROLE"])
					{
						case 0: output2(" Neither Pet nor Owner"); break;
						case 1: output2(" Owner"); break;
						case -1: output2(" Pet"); break;
						case -2: output2(" Both Pet and Owner"); break;
					}
				}
				if(flags["VAVA_GROOM_SPECIAL_PET"] != undefined) output2("\n<b>* Services, Your Special Pet:</b> " + (flags["VAVA_GROOM_SPECIAL_PET"] == "None" ? "None, <i>Owner-In-Waiting</i>" : flags["VAVA_GROOM_SPECIAL_PET"]));
				if(flags["VAVA_GROOM_SPECIAL_MASTER"] != undefined) output2("\n<b>* Services, Your Special Owner:</b> " + (flags["VAVA_GROOM_SPECIAL_MASTER"] == "None" ? "None, <i>Pet-In-Waiting</i>" : flags["VAVA_GROOM_SPECIAL_MASTER"]));
				//if(flags["VAVA_GROOM_ROLE"] < 0) output2("\n<b>* Services, Your Obedience:</b> " + vavaGroomPetLevel() + " %");
				if(flags["VAVA_GROOM_SERVICE_GROOMING"] != undefined) output2("\n<b>* Services, Grooming, Total:</b> " + flags["VAVA_GROOM_SERVICE_GROOMING"]);
				if(flags["VAVA_GROOM_SERVICE_OBEDIENCE_TRAINING"] != undefined) output2("\n<b>* Services, Obedience Training, Total:</b> " + flags["VAVA_GROOM_SERVICE_OBEDIENCE_TRAINING"]);
				if(flags["VAVA_GROOM_SERVICE_EROTIC_TRAINING"] != undefined) output2("\n<b>* Services, Erotic Training, Total:</b> " + flags["VAVA_GROOM_SERVICE_EROTIC_TRAINING"]);
				output2("\n<b>* Cruff:</b> Met him");
				output2("\n<b>* Estie:</b> Met her");
				variousCount++;
			}
			// Irestead
			if(flags["MET_ASTRA"] != undefined || flags["PIPPA_AFFECTION"] != undefined)
			{
				output2("\n<b><u>Irestead</u></b>");
				if(flags["MET_ASTRA"] != undefined)
				{
					output2("\n<b>* Astra:</b> Met her");
					if(flags["SHADE_OVI_ASTRA_RUN_IN"] != undefined) output2("\n<b>* Astra, Times Seen Shade Laying Eggs:</b> " + flags["SHADE_OVI_ASTRA_RUN_IN"]);
				}
				if(flags["PIPPA_AFFECTION"] != undefined)
				{
					output2("\n<b>* Pippa:</b> Met her");
					if(recruitedPippa()) 
					{
						output2(", Crew member");
						if(pippaOnShip()) output2(" (Onboard Ship)");
						else output2(" (Left on Uveto)");
					}
					else if(pippaRecruitTurnedDown()) output2(", Turned down request to join crew");
					output2("\n<b>* Pippa, Affection:</b> " + pippaAffection() + " %");
					if(pippaSexed(0) > 0)
					{
						var pippaTop:int = pippaDominance();
						
						output2("\n<b>* Pippa, Preferred Position:</b> ");
						if(pippaTop > 50) output2("Top");
						else if(pippaTop < 50) output2("Bottom");
						else output2("No Preference");
						
						var topBottomStrength:int = Math.abs(pippaTop - 50);
						
						if(topBottomStrength <= 17 && topBottomStrength > 0) output2(", Slight Preference");
						else if(topBottomStrength >= 33) output2(", Strong Preference");
					}
					if(pippaFed(0) > 0) output2("\n<b>* Pippa, Times You Fed Her:</b> " + pippaFed(0));
					if(pippaStandardMassagesGiven(0) > 0) output2("\n<b>* Pippa, Standard Massages Given to You:</b> " + pippaStandardMassagesGiven(0));
					if(pippaHappyEndingsGiven(0) > 0) output2("\n<b>* Pippa, Happy Endings Given to You:</b> " + pippaHappyEndingsGiven(0));
					if(pippaSpecialMassagesGiven(0) > 0) output2("\n<b>* Pippa, Nuru Massages Given to You:</b> " + pippaSpecialMassagesGiven(0));
					if(pippaSexed(0) > 0) output2("\n<b>* Pippa, Times Sexed:</b> " + pippaSexed(0));
				}
				variousCount++;
			}
			//SteeleTech Biomedical
			if(flags["MET_DR_LESSAU"] != undefined || metCynthia() || metWalt())
			{
				output2("\n<b><u>Steele Tech Biomedical Division</u></b>");
				if(flags["BIOMED_GANGBANGED"] != undefined) output2("\n<b>* Employees, Times Gangbanged:</b> " + flags["BIOMED_GANGBANGED"]);
				if(flags["MET_DR_LESSAU"] != undefined)
				{
					output2("\n<b>* Doctor Lessau:</b> Met Him");
					if(flags["DRLESSAU_SEXED"] != undefined) output2("\n<b>* Doctor Lessau, Times Sexed:</b> " + flags["DRLESSAU_SEXED"]);
				}
				if(metCynthia())
				{
					output2("\n<b>* Cynthia:</b> Met Her");
					if(flags["CYNTHIA_SEXED"] != undefined) output2("\n<b>* Cynthia, Times Sexed:</b> " + flags["CYNTHIA_SEXED"]);
				}
				if(metWalt())
				{
					output2("\n<b>* Walt:</b> Met Him");
					if(flags["WALT_SEXED"] != undefined) output2("\n<b>* Walt, Times Sexed:</b> " + flags["WALT_SEXED"]);
				}
			}
			// The Freezer
			if(flags["MET_HANA"] != undefined || flags["MET_JEROME"] != undefined ||flags["WILLOW_MET"] != undefined|| flags["MET_JERYNN"] != undefined || flags["NATALIE_MET"] != undefined || flags["BEA_TITLE"] != undefined || flags["CHRISSY_MET"] != undefined || flags["MET_CANDY"] != undefined)
			{
				output2("\n<b><u>The Freezer</u></b>");
				// Hanananana, hawt MILF
				if(flags["MET_HANA"] != undefined)
				{
					output2("\n<b>* Hana:</b> Met her");
					if(flags["FUCKED_HANA"] != undefined) output2("\n<b>* Hana, Times Sexed:</b> " + flags["FUCKED_HANA"]);
				}
				// Jerbears
				if(flags["MET_JEROME"] != undefined)
				{
					output2("\n<b>* Jerome:</b> Met him");
					if(flags["FUCKED_JEROME"] != undefined) output2("\n<b>* Jerome, Times Sexed:</b> " + flags["FUCKED_JEROME"]);
				}
				// Jerbooty
				if(flags["MET_JERYNN"] != undefined)
				{
					output2("\n<b>* Jerynn:</b> Met her");
					if(jerynnIsMistress()) output2(", Mistress");
					if(flags["JERYNN_HARNESS_GIFTED"] != undefined) output2(", Gave you a harness");
					if(jerynnPetstuffLevel() > 0) output2("\n<b>* Jerynn, Dominance Level:</b> " + jerynnPetstuffLevel() + "/" + jerynnPetstuffMax());
					if(flags["JERYNN_FUCKED"] != undefined) output2("\n<b>* Jerynn, Times Sexed:</b> " + flags["JERYNN_FUCKED"]);
				}
				// Natalie Irson
				if(flags["NATALIE_MET"] != undefined)
				{
					if(flags["NATALIE_MET"] == -2) output2("\n<b>* Miss Nobody:</b> Seen her");
					else output2("\n<b>* Natalie:</b> Met her");
					if(flags["NATALIE_TAMES_VARMINT"] != undefined) output2(", She helped you tame a wild varmint");
					else if(flags["NATALIE_TALK_MONSTERS"] != undefined && varmintIsWild())
					{
						output2(", She offered to help you with your varmint stowaway");
						if(flags["NATALIE_NEED_SILICONE"] != undefined)
						{
							if(!pc.hasItemByClass(Silicone)) output2(", <i>Find silicone!</i>");
							else output2(", Have silicone, <i>Return to her!</i>");
						}
					}
				}
				// Beatrice Reasner
				if(flags["BEA_TITLE"] != undefined)
				{
					output2("\n<b>* Beatrice Reasner:</b> Met her");
					output2("\n<b>* Beatrice Reasner, Title:</b> " + flags["BEA_TITLE"]);
					if(flags["BEA_RELATIONSHIP"] != undefined)
					{
						output2("\n<b>* Beatrice Reasner, Relationship:</b>");
						switch(flags["BEA_RELATIONSHIP"])
						{
							default: output2(" Strangers"); break;
							case 1: output2(" Friends"); break;
							case 2: output2(" Lovers"); break;
						}
					}
					if(flags["BEA_RESTS"] != undefined) output2("\n<b>* Beatrice Reasner, Times Rested with Her:</b> " + flags["BEA_RESTS"]);
					if(flags["BEA_SEXED"] != undefined) output2("\n<b>* Beatrice Reasner, Times Sexed:</b> " + flags["BEA_SEXED"]);
					if(flags["MET_BEA_HUBBY"] != undefined) output2("\n<b>* Traven Reasner:</b> Met him");
				}
				// Candy Rahn
				if(flags["MET_CANDY"] != undefined)
				{
					output2("\n<b>* Candy:</b> Met her");
				}
				// Chrissy
				if(flags["CHRISSY_MET"] != undefined)
				{
					output2("\n<b>* Chrissy:</b> Met her");
					if(flags["CHRISSY_SEXED"] != undefined) output2("\n<b>* Chrissy, Times Sexed:</b> " + flags["CHRISSY_SEXED"]);
					if(flags["CHRISSY_ANAL"] != undefined) output2("\n<b>* Chrissy, Times Fucked Her Butt:</b> " + flags["CHRISSY_ANAL"]);
					if(flags["CHRISSY_VAG"] != undefined) output2("\n<b>* Chrissy, Times Fucked Her Vagina:</b> " + flags["CHRISSY_VAG"]);
					if(flags["CHRISSY_RIDDEN"] != undefined) output2("\n<b>* Chrissy, Times You Rode Her Cock:</b> " + flags["CHRISSY_RIDDEN"]);
					if(flags["CHRISSY_GETFKD"] != undefined) output2("\n<b>* Chrissy, Times She Fucked You:</b> " + flags["CHRISSY_GETFKD"]);
				}
				// Willow
				if(flags["WILLOW_MET"] != undefined)
				{
					output2("\n<b>* Willow:</b> Met her");
					if(flags["WILLOW_AFFECTION"] != undefined) output2("\n<b>* Willow, Affection:</b> " + flags["WILLOW_AFFECTION"] + " %");
					if(flags["WILLOW_VAG_SEXED"] != undefined) output2("\n<b>* Willow, Times Fucked Her Vagina:</b> " + flags["WILLOW_VAG_SEXED"]);
					if(flags["WILLOW_BUTT_SEXED"] != undefined) output2("\n<b>* Willow, Times Fucked Her Butt:</b> " + flags["WILLOW_BUTT_SEXED"]);
					if(flags["WILLOW_DBLPEN"] != undefined) output2("\n<b>* Willow, Times Double Penetrated:</b> " + flags["WILLOW_DBLPEN"]);
					if(flags["WILLOW_DBLPEN_VAG"] != undefined) output2("\n<b>* Willow, Times Double Stuffed Her Vagina:</b> " + flags["WILLOW_DBLPEN_VAG"]);
					if(flags["WILLOW_TRPVAG"] != undefined) output2("\n<b>* Willow, Times Triple Stuffed Her Vagina:</b> " + flags["WILLOW_TRPVAG"]);
				}
				variousCount++;
			}
			// Nayna
			if(flags["MET_NAYNA"] != undefined)
			{
				output2("\n<b><u>Geological Survey</u></b>");
				output2("\n<b>* Nayna:</b> Met her");
				if(flags["NAYNA_PISSED"] != undefined) output2(", Pissed off");
				if(flags["NAYNA_HUGS"] != undefined) output2("\n<b>* Nayna, Times Hugged Her:</b> " + flags["NAYNA_HUGS"]);
				if(flags["NAYNA_BLOWN"] != undefined) output2("\n<b>* Nayna, Times Given Her Blowjobs:</b> " + flags["NAYNA_BLOWN"]);
				if(flags["NAYNA_FUCKED"] != undefined) output2("\n<b>* Nayna, Times Fucked Her Vagina:</b> " + flags["NAYNA_FUCKED"]);
				if(flags["NAYNA_FUCKED_PC_BUTT"] != undefined) output2("\n<b>* Nayna, Times She Fucked Your Ass:</b> " + flags["NAYNA_FUCKED_PC_BUTT"]);
				if(flags["NAYNA_HYPERDOCKED"] != undefined) output2("\n<b>* Nayna, Times She Docked Your Hyper-sized Dick:</b> " + flags["NAYNA_HYPERDOCKED"]);
				variousCount++;
			}
			// Sheriff's Office
			if(flags["UVETO_LUNA_RESCUES"] != undefined || flags["UVETO_JEROME_RESCUES"] != undefined || flags["UVETO_JERYNN_RESCUES"] != undefined)
			{
				output2("\n<b><u>Sheriff’s Office</u></b>");
				if(flags["UVETO_LUNA_RESCUES"] != undefined) output2("\n<b>* Luna, Times Rescued By:</b> " + flags["UVETO_LUNA_RESCUES"]);
				if(flags["UVETO_JEROME_RESCUES"] != undefined) output2("\n<b>* Jerome, Times Rescued By:</b> " + flags["UVETO_JEROME_RESCUES"]);
				if(flags["UVETO_JERYNN_RESCUES"] != undefined) output2("\n<b>* Jerynn, Times Rescued By:</b> " + flags["UVETO_JERYNN_RESCUES"]);
				variousCount++;
			}
			// Spinarran Silk & Steel
			if(flags["MET_KIRILA"] != undefined)
			{
				output2("\n<b><u>Spinarran Silk & Steel</u></b>");
				output2("\n<b>* Kirila:</b> Met her");
				variousCount++;
			}
			// U7 Stadium
			if(flags["TAUR_STADIUMED"] != undefined)
			{
				output2("\n<b><u>U7 Stadium</u></b>");
				if(flags["TAUR_STADIUM_WATCHED"] != undefined) output2("\n<b>* Races, Times Watched:</b> " + flags["TAUR_STADIUM_WATCHED"]);
				output2("\n<b>* Cashier:</b> Met her");
				if(flags["ROXY_MET"] != undefined)
				{
					output2("\n<b>* Roxy:</b> Met her");
					if(flags["ROXY_SEX"] >= 1 ) output2(", Lovers");
					output2("\n<b>* Roxy, Current Location:</b> " + roxyCurrentLocation());
					if(flags["ROXY_TALK_FETISH"] == 1)
					{
						output2("\n<b>* Roxy, Birth Control:</b> ");
						if(flags["ROXY_STERILEX"] == 1) output2("On");
						else output2("Off");
					}
					if(flags["ROXY_PREG_TIMER"] != undefined) output2("\n<b>* Roxy, Days Pregnant:</b> " + flags["ROXY_PREG_TIMER"]);
					if(flags["ROXY_TOTAL_KIDS"] != undefined) output2("\n<b>* Roxy, Total Kids:</b> " + flags["ROXY_TOTAL_KIDS"]);
					if(flags["ROXY_DOGGY_VAG"] != undefined) output2("\n<b>* Roxy, Times You Fucked Her Pussy Doggystyle:</b> " + flags["ROXY_DOGGY_VAG"]);
					if(flags["ROXY_DOGGY_ANAL"] != undefined) output2("\n<b>* Roxy, Times You Fucked Her Ass Doggystyle:</b> " + flags["ROXY_DOGGY_ANAL"]);
					if(flags["ROXY_DOGGY_DP"] != undefined) output2("\n<b>* Roxy, Times You DP’d Her Doggystyle:</b> " + flags["ROXY_DOGGY_DP"]);
					if(flags["ROXY_MISSIONARY"] != undefined) output2("\n<b>* Roxy, Times Had ‘Roxy Style’ Missionary:</b> " + flags["ROXY_MISSIONARY"]);
					if(flags["ROXY_COWGIRL_FIRST"] != undefined) output2("\n<b>* Roxy, Times You Came First During Cowgirl:</b> " + flags["ROXY_COWGIRL_FIRST"]);
					if(flags["ROXY_COWGIRL_HOLD"] != undefined) output2("\n<b>* Roxy, Times She Came First During Cowgirl:</b> " + flags["ROXY_COWGIRL_HOLD"]);
					if(flags["ROXY_BJ"] != undefined) output2("\n<b>* Roxy, Times She Gave You A BJ:</b> " + flags["ROXY_BJ"]);
					if(flags["ROXY_BREED"] != undefined) output2("\n<b>* Roxy, Times You Bred Her:</b> " + flags["ROXY_BREED"]);
					if(flags["ROXY_SPOON"] != undefined) output2("\n<b>* Roxy, Times You Fucked as the Big Spoon:</b> " + flags["ROXY_SPOON"]);
					if(flags["ROXY_RVS_COWGIRL"] != undefined) output2("\n<b>* Roxy, Times She Rode You Reverse Cowgirl:</b> " + flags["ROXY_RVS_COWGIRL"]);
				}
				variousCount++;
			}
			// Essyra Trading Post
			if(flags["MET_KAZRA_AND_LORRE"] != undefined)
			{
				output2("\n<b><u>Essyra Trading Post</u></b>");
				output2("\n<b>* Kazra and Lorre:</b> Met them");
				variousCount++;
			}
			// Ice Plains
			if(flags["MET_MYRNA"] != undefined || flags["MET_FEMKORGONNE"] != undefined || flags["MET_KORG_MALE"] != undefined || flags["MET_MILODAN_MALE"] != undefined || flags["FERTILITY_PRIESTESSES_FOUGHT"] != undefined || flags["MET_STORMGUARD"] != undefined || flags["UVIP_J46_SEARCHED"] != undefined || flags["MET_VARK"] != undefined || flags["MET_LURELING"] != undefined)
			{
				output2("\n<b><u>Ice Plains</u></b>");
				if(flags["MET_STORMGUARD"] != undefined)
				{
					var lancerName:String = (flags["MET_GEL_ZON"] == undefined ? "Stormguard Lancer" : "Gel Zon");
					var lancerSexed:int = (flags["SEXED_SG_MALE"] == undefined ? 0 : flags["SEXED_SG_MALE"]);
					output2("\n<b>* " + lancerName + ", Times Encountered:</b> " + flags["MET_STORMGUARD"]);
					if(flags["STORMGUARD_HONOR"] != undefined)
					{
						output2("\n<b>* " + lancerName + ", Respect Level:</b> " + flags["STORMGUARD_HONOR"]);
						switch(flags["STORMGUARD_HONOR"])
						{
							case 0: output2(", Inferior"); break;
							case 1: output2(", Equal"); break;
							case 2: output2(", Superior"); break;
							default: output2(", Respected"); break;
						}
					}
					if(flags["SPANKED_SG_COUNT"] != undefined)
					{
						lancerSexed -= flags["SPANKED_SG_COUNT"];
						output2("\n<b>* " + lancerName + ", Times Spanked:</b> " + flags["SPANKED_SG_COUNT"]);
					}
					if(lancerSexed > 0) output2("\n<b>* " + lancerName + ", Times Sexed:</b> " + lancerSexed);
				}
				if(flags["MET_MYRNA"] != undefined)
				{
					output2("\n<b>* Myrna:</b> Met her");
					if(flags["MYRNA_GIFT_COUNT"] != undefined) output2("\n<b>* Myrna, Presents Gifted:</b> " + flags["MYRNA_GIFT_COUNT"]);
					if(flags["SEXED_MYRNA"] != undefined) output2("\n<b>* Myrna, Times Sexed:</b> " + flags["SEXED_MYRNA"]);
				}
				if(flags["MET_FEMKORGONNE"] != undefined) output2("\n<b>* Female Korgonne, Times Encountered:</b> " + flags["MET_FEMKORGONNE"]);
				if(flags["MET_KORG_MALE"] != undefined) output2("\n<b>* Male Korgonne, Times Encountered:</b> " + flags["MET_KORG_MALE"]);
				if(flags["MET_MILODAN_MALE"] != undefined)
				{
					output2("\n<b>* Male Milodan, Times Encountered:</b> " + flags["MET_MILODAN_MALE"]);
					if(flags["MILO_MALE_CON_LOSSES"] > 1) output2("\n<b>* Male Milodan, Combat, Times You Consecutively Lost:</b> " + flags["MILO_MALE_CON_LOSSES"]);
				}
				if(flags["FERTILITY_PRIESTESSES_FOUGHT"] != undefined)
				{
					output2("\n<b>* Milodan Priestess, Times Encountered:</b> " + flags["FERTILITY_PRIESTESSES_FOUGHT"]);
					if(flags["FERTILITY_PRIESTESSES_FUCKED"] != undefined) output2("\n<b>* Milodan Priestess, Times Fucked Her Vagina:</b> " + flags["FERTILITY_PRIESTESSES_FUCKED"]);
				}
				if(flags["MET_LURELING"] != undefined)
				{
					output2("\n<b>* "+ StringUtil.upperCase(marionName()) +":</b> Encountered");
					if(flags["MET_LURELING"] >= 1) output2(", Entered the Den");
					if(flags["MET_LURELING"] >= 2) output2(", Encountered a Lureling");
					if(flags["MARIONS_FUCKED"] != undefined) output2("\n<b>* "+ StringUtil.upperCase(marionName()) +", Times Fucked:</b> " + flags["MARIONS_FUCKED"]);
					if(flags["LURELINGS_FOUGHT"] != undefined) output2("\n<b>* Lureling, Times Encountered:</b> " + flags["LURELINGS_FOUGHT"]);
				}
				// Abandoned Outpost
				if(flags["UVIP_J46_SEARCHED"] != undefined) output2("\n<b>* Abandoned Outpost:</b> Found, Looted camp");
				if(flags["MET_VARK"] != undefined)
				{
					output2("\n<b>* Vark:</b> Met him");
					if(varkGotCollar()) output2(", Got collar");
					if(flags["VARK_SEXED"] != undefined) output2("\n<b>* Vark, Times Sexed:</b> " + flags["VARK_SEXED"]);
				}
				variousCount++;
			}
			//Frostwyrm
			if(flags["MET_FROSTWYRM"] != undefined)
			{
				output2("\n<b><u>Frostwyrm</u></b>");
				if(flags["FROSTWYRM_EGGS"] != undefined) output2("\n<b>* Frostwyrm Lair, Eggs Nested, Total:</b> " + flags["FROSTWYRM_EGGS"]);
				if(flags["FROSTWYRM_YOUNG"] != undefined) output2("\n<b>* Frostwyrm Lair, Young Maturing, Total:</b> " + flags["FROSTWYRM_YOUNG"]);
				if(flags["FROSTWYRM_KIP_COUNT"] != undefined) output2("\n<b>* Frostwyrm Lair, Kips, Total:</b> " + flags["FROSTWYRM_KIP_COUNT"]);
				if(flags["MET_FROSTWYRM"] != undefined) output2("\n<b>* " + chars["FROSTWYRM"].short + ", Times Encountered:</b> " + flags["MET_FROSTWYRM"]);
				if(flags["FROSTWYRM_NOT_HOSTILE"] != undefined) output2(", Non-hostile");
				if(flags["FROSTWYRM_DISABLED"] != undefined) output2(", <i>Whereabouts unknown</i>");
				else if(flags["FROSTWYRMWARNING"] != undefined || flags["FROSTWYRMSLAIN"] != undefined)
				{
					output2("\n<b>* " + chars["FROSTWYRM"].short + ", Status:</b>");
					if(flags["FROSTWYRMWARNING"] != undefined) output2(" You were defeated by the Frostwyrm and warned never to return.");
					if(flags["FROSTWYRMSLAIN"] != undefined) output2(" You have slain the Frostwyrm!");
				}
				// Frostwyrm-waifu
				if(flags["FROSTWYRM_INCUBATION_TIMER"] != undefined) output2("\n<b>* [frostwyrm.name], Days Pregnant:</b> " + flags["FROSTWYRM_INCUBATION_TIMER"]);
				if(flags["FROSTWYRM_BELLY_RUB"] != undefined) output2("\n<b>* [frostwyrm.name], Times Gave Her Belly Rub:</b> " + flags["FROSTWYRM_BELLY_RUB"]);
				if(flags["FROSTWYRM_GOT_DICKED"] != undefined) output2("\n<b>* [frostwyrm.name], Times You Bred Her:</b> " + flags["FROSTWYRM_GOT_DICKED"]);
				if(flags["FROSTWYRM_DICKED_YOU"] != undefined) output2("\n<b>* [frostwyrm.name], Times Breeded by Her:</b> " + flags["FROSTWYRM_DICKED_YOU"]);
				if(flags["FROSTWYRM_ANAL_PITCH"] != undefined) output2("\n<b>* [frostwyrm.name], Times She Fucked Your Ass:</b> " + flags["FROSTWYRM_ANAL_PITCH"]);
				if(flags["FROSTWYRM_GAVE_BATH"] != undefined) output2("\n<b>* [frostwyrm.name], Times She Gave Tongue Bath:</b> " + flags["FROSTWYRM_GAVE_BATH"]);
				if(flags["FROSTWYRM_GOT_BLOWN"] != undefined) output2("\n<b>* [frostwyrm.name], Times You Gave Her Oral:</b> " + flags["FROSTWYRM_GOT_BLOWN"]);
				if(flags["FROSTWYRM_EATEN_OUT"] != undefined) output2("\n<b>* [frostwyrm.name], Times You Have Eaten Her Out:</b> " + flags["FROSTWYRM_EATEN_OUT"]);
				// Nykke 1
				if(flags["NYKKE_MET"] != undefined && flags["NYKKE_VERSION"] == 1)
				{
					if(flags["NYKKE_FUCK_HER_CUNT"] != undefined) output2("\n<b>* Nykke, Times You Fucked Her Vagina:</b> " + flags["NYKKE_FUCK_HER_CUNT"]);
					if(flags["NYKKE_FUCK_HER_ASS"] != undefined) output2("\n<b>* Nykke, Times You Fucked Her Ass:</b> " + flags["NYKKE_FUCK_HER_ASS"]);
					if(flags["NYKKE_FUCK_YOUR_CUNT"] != undefined) output2("\n<b>* Nykke, Times She Fucked Your Vagina:</b> " + flags["NYKKE_FUCK_YOUR_CUNT"]);
					if(flags["NYKKE_FUCK_YOUR_ASS"] != undefined) output2("\n<b>* Nykke, Times She Fucked Your Ass:</b> " + flags["NYKKE_FUCK_YOUR_ASS"]);
				}
				// Nykke 2.0
				if(flags["NYKKE_MET2"] != undefined && flags["NYKKE_VERSION"] != 1)
				{
					if(flags["NYKKE_SEX2"] != undefined) output2("\n<b>* Nykke, Times You Had Sex:</b> " + flags["NYKKE_SEX2"]);
					if(flags["NYKKE_FUCK_HER_CUNT2"] != undefined) output2("\n<b>* Nykke, Times You Fucked Her Vagina:</b> " + flags["NYKKE_FUCK_HER_CUNT2"]);
					if(flags["NYKKE_FUCK_HER_ASS2"] != undefined) output2("\n<b>* Nykke, Times You Fucked Her Ass:</b> " + flags["NYKKE_FUCK_HER_ASS2"]);
					if(flags["NYKKE_FUCK_YOUR_CUNT2"] != undefined) output2("\n<b>* Nykke, Times She Fucked Your Vagina:</b> " + flags["NYKKE_FUCK_YOUR_CUNT2"]);
					if(flags["NYKKE_FUCK_YOUR_ASS2"] != undefined) output2("\n<b>* Nykke, Times She Fucked Your Ass:</b> " + flags["NYKKE_FUCK_YOUR_ASS2"]);
				}
				variousCount++;
			}
			// Korg’ii Hold
			if(flags["ULA_SAVED"] != undefined || flags["ULA_LEAVE_TIMER"] != undefined) 
			{
				output2("\n<b><u>");
				if(flags["ULA_SAVED"] != undefined) output2("Korg’ii Hold");
				else if(flags["ULA_CAVE"] != undefined)
				{
					switch(flags["ULA_CAVE"])
					{
						case "UVIP R36": output2("Hidden Cave"); break;
						case "UVIP D22": output2("Snowbank Cave"); break;
						case "UVIP J18": output2("Ice-Hewn Cavern"); break;
						case "UVGR K20": output2("Small Hollow"); break;
					}
				}
				else output2("Cave");
				output2("</u></b>");
				if(flags["ULA_SAVED"] != undefined) output2("\n<b>* Secret Code:</b> <i>One “awoo” in top “sparklehole”, third from right.</i>");
				// Princess Ula
				var coldKorgiName:String = (flags["MET_ULA"] != undefined ? "Ula" : "Cold Korgonne");
				output2("\n<b>* " + coldKorgiName + ":</b> Met her");
				if(flags["ULA_SAVED"] != undefined)
				{
					switch(flags["ULA_SAVED"])
					{
						case 1: output2(", Gave her heat belt"); break;
						case 2: output2(", Gave her insulated coat"); break;
					}
					if(flags["ULA_STARTALK"] != undefined) output2(", Talked to her");
					if(flags["ULA_DEFLOWERED"] != undefined) output2(", Took her virginity");
					if(flags["ULA_PREG_TIMER"] != undefined) output2("\n<b>* " + coldKorgiName + ", Days Pregnant:</b> " + flags["ULA_PREG_TIMER"]);
					if(flags["ULA_TOTAL_KIDS"] > 0) output2("\n<b>* " + coldKorgiName + ", Total Kids:</b> " + flags["ULA_TOTAL_KIDS"]);
					if(flags["ULA_SEXED"] != undefined) output2("\n<b>* " + coldKorgiName + ", Times Sexed:</b> " + flags["ULA_SEXED"]);
					if(flags["ULA_RPED"] != undefined) output2("\n<b>* " + coldKorgiName + ", Times Roleplayed With:</b> " + flags["ULA_RPED"]);
				}
				else if((flags["ULA_LEAVE_TIMER"] + 60*24*2) <= GetGameTimestamp()) output2(", <i>Whereabouts unknown</i>");
				else output2(", <i>Is freezing!</i>");
				// Lund Funs
				if(flags["ULA_SAVED"] != undefined && flags["MET_LUND"] != undefined)
				{
					output2("\n<b>* Lund:</b> Met him");
					if(lundBroken()) output2(", Broken him");
					if(lundDommingPC()) output2(", Dominated by him");
					if(flags["LUND_BROKEN"] >= 1) output2(", Gave him thong");
					if(flags["LUND_ANUSOFT"] != undefined) output2(", Gave him Anusoft");
					if(flags["LUND_FUCKED_OFF"] != undefined) output2(", He is hostile, <i>Whereabouts unknown</i>");
					if(flags["SEXED_LUND"] != undefined) output2("\n<b>* Lund, Times Sexed:</b> " + flags["SEXED_LUND"]);
					if(flags["LUND_DICKED_DOWN"] != undefined) output2(", Dicked him down");
					if(flags["LUND_RIDE_HIMMED"] != undefined) output2("\n<b>* Lund, Times Rode Him:</b> " + flags["LUND_RIDE_HIMMED"]);
					if(flags["LUND_PB"] != undefined)
					{
						output2("\n<b>* Lund, Times Given Him Peanut Butter Cookies:</b> " + flags["LUND_PB"]);
						if(flags["LUND_PB_DISABLED"] != undefined) output2(", He doesn’t want anymore!");
					}
					variousCount++;
				}
				variousCount++;
			}
			// Earthshapers
			if(flags["MET_TUUVA"] != undefined)
			{
				output2("\n<b><u>Earthshapers</u></b>");
				output2("\n<b>* Tuuva:</b> Met her");
				if(flags["TUUVA_SAVED"] <= -1) output2(", Away");
				output2("\n<b>* Tuuva, Affection:</b> " + tuuvaAffection() + " %");
				if(!tuuvaLover())
				{
					if(tuuvaAffection() < 25) output2(", Strangers");
					else if(tuuvaAffection() < 75) output2(", Friends");
					else output2(", Close friends");
				}
				else output2(", Lovers");
				if(flags["TUUVA_COOKIES"] != undefined) output2("\n<b>* Tuuva, Times Given Her Peanut Butter Cookies:</b> " + flags["TUUVA_COOKIES"]);
				if(flags["SEXED_TUUVA"] != undefined)
				{
					output2("\n<b>* Tuuva, Sex Organs:</b> " + listCharGenitals("TUUVA"));
					output2("\n<b>* Tuuva, Times Sexed:</b> " + flags["SEXED_TUUVA"]);
				}
				variousCount++;
			}			
			// kiona's kiosk
			if(flags["KIONA_MET"] != undefined)
			{
				output2("\n<b><u>Kiona’s Kiosk</u></b>");
				output2("\n<b>* Kiona:</b> Met her");
				if(!kionaLovers())
				{
					if(flags["WARGII_PROGRESS"] == 3) output2(", Close friends");
					else if(kionaLuciniteQuestStage() >= 2) output2(", Friends");
					else if(kionaPiercingsUnlocked()) output2(", Outsider");
					else output2(", Distrusted Outsider");
				}
				else output2(", Lovers");
				if(flags["KIONA_SEX"] != undefined)
				{
					output2("\n<b>* Kiona, Times Sexed:</b> " + flags["KIONA_SEX"]);
				}
				if(kionaLuciniteQuestStage() > 0)
				{
					if(kionaLuciniteQuestStage() == 1) output2("\n<b>* Kiona, Lucinite Quest:</b> Accepted");
					else if(kionaLuciniteQuestStage() == 2) output2("\n<b>* Kiona, Lucinite Quest:</b> Completed");
					else if(kionaLuciniteQuestStage() == 3) output2("\n<b>* Kiona, Lucinite Quest:</b> Completed by Saving Wargii Hold");
				}
				if(flags["KIONA_KIRKITE"] != undefined) output2("\n<b>* Kiona, Kirkite Donated:</b> " + flags["KIONA_KIRKITE"]);
				if(flags["KIONA_LUCINITE"] != undefined) output2("\n<b>* Kiona, Lucinite Donated:</b> " + flags["KIONA_LUCINITE"]);
				if(flags["KIONA_PICARDINE"] != undefined) output2("\n<b>* Kiona, Picardine Donated:</b> " + flags["KIONA_PICARDINE"]);
				if(flags["KIONA_SATYRITE"] != undefined) output2("\n<b>* Kiona, Satyrite Donated:</b> " + flags["KIONA_SATYRITE"]);
				if(flags["KIONA_SAVICITE"] != undefined) output2("\n<b>* Kiona, Savicite Donated:</b> " + flags["KIONA_SAVICITE"]);
				if(flags["KIONA_CREDIT_AMOUNT"] != undefined) output2("\n<b>* Kiona, Store Credit:</b> " + flags["KIONA_CREDIT_AMOUNT"]);
				if(flags["KIONA_CREDIT_ONHAND"] != undefined) output2("\n<b>* Kiona, Credits On-hand:</b> " + flags["KIONA_CREDIT_ONHAND"]);
				variousCount++;
			}
			// Herbs & Happy
			if(flags["MET_NENNE"] != undefined)
			{
				output2("\n<b><u>Herbs & Happy</u></b>");
				output2("\n<b>* Nenne:</b> Met her");
				if(flags["NENNE_COOKIES"] != undefined) output2("\n<b>* Nenne, Times Given Her Peanut Butter Cookies:</b> " + flags["NENNE_COOKIES"]);
				if(flags["SEXED_NENNE"] != undefined) output2("\n<b>* Nenne, Times Sexed:</b> " + flags["SEXED_NENNE"]);
				variousCount++;
			}
			// The Warm Crusts
			if(flags["MET_HEIDRUN"] != undefined)
			{
				output2("\n<b><u>The Warm Crusts</u></b>");
				output2("\n<b>* Heidrun:</b> Met her");
				if(flags["SEXED_HEIDRUN"] != undefined) output2("\n<b>* Heidrun, Times Sexed:</b> " + flags["SEXED_HEIDRUN"]);
				variousCount++;
			}
			// Tamed Tamelings
			if(flags["MET_MAJA"] != undefined)
			{
				output2("\n<b><u>Tamed Tamelings</u></b>");
				if(flags["MAJA_RENTING"] != undefined)
				{
					output2("\n<b>* Currently Renting:</b> ");
					switch(flags["MAJA_RENTING"])
					{
						case "a kor’diiak bear leash": output2("Kor’diiak Bear"); break;
						case "a nog’wich leash": output2("Nog’wich"); break;
						case "a grunch leash": output2("Grunch"); break;
						case "a shoulder grunch leash": output2("Shoulder Grunch"); break;
						case "a miniature giant baby kor’diiak": output2("Miniature Giant Baby Kor’diiak"); break;
						default: output2("<i>Unknown beast!</i>"); break;
					}
				}
				output2("\n<b>* Maja:</b> Met her");
				if(flags["SEXED_MAJA"] != undefined) output2("\n<b>* Maja, Times Sexed:</b> " + flags["SEXED_MAJA"]);
				variousCount++;
			}
			if(flags["EITAN_PRISONER_NEGOTIATIONS"] != undefined)
			{
				output2("\n<b><u>Milodan Prisoners</u></b>");
				output2("\n<b>* Eitan:</b> Met him");
				if(flags["EITAN_PRISONER_NEGOTIATIONS"] > 10) output2(", Freed");
				switch (flags["EITAN_PRISONER_NEGOTIATIONS"])
				{
					case 1: case 2: output2(", Wants an exotic meal"); break;
					case 3: output2(", Wants a revealing outfit"); break;
					case 4: output2(", Wants alcohol"); break;
					case 5: output2(", Wants medicine and air"); break;
					case 6: output2(", Wants medicine, Ula allowed air"); break;
					case 7: output2(", Wants an undershirt"); break;
					case 8: case 9: output2(", Wants water"); break;
					case 10: output2(", Wants audience with Ula"); break;
				}
				if(eitanRecruited())
				{
					output2(", Crew member");
					if(eitanIsCrew()) output2(" (Onboard Ship)");
				}
			}
			// Krym
			if(flags["MET_KRYM"] != undefined)
			{
				output2("\n<b><u>Stormguard Campsite</u></b>");
				output2("\n<b>* Krymhilde:</b> Met her");
				if(flags["KRYM_KOMBAT_RESULT"] != undefined) output2(", Challenged her in a duel");
				if(flags["KRYM_RESPECT"] != undefined)
				{
					output2("\n<b>* Krymhilde, Respect Level:</b> " + flags["KRYM_RESPECT"]);
					switch(flags["KRYM_RESPECT"])
					{
						case 0: output2(", Inferior"); break;
						case 1: output2(", Equal"); break;
						case 2: output2(", Superior"); break;
						default: output2(", Respected"); break;
					}
				}
				variousCount++;
			}
			
			// Resources
			if(flags["9999"] != undefined)
			{
				output2("\n<b><u>Uvetan Resources</u></b>");
				if(flags["9999"] != undefined) output2("\n<b>* Oxonium Deposit:</b> Found");
				
				variousCount++;
			}
			// Travel Points
			if(flags["UVIP_R10_PROBE_ACTIVE"] != undefined)
			{
				output2("\n<b><u>Uvetan Travel Points</u></b>");
				// Crashed Probe
				if(flags["UVIP_R10_PROBE_ACTIVE"] != undefined)
				{
					output2("\n<b>* Crashed Probe:</b> Found, Reactivated");
				}
				variousCount++;
			}
		}
		
		if(showID == "Canadia" || showID == "All")
		{
			// Canadia Station
			if(9999 != 9999)
			{
				output2("\n<b><u>Canadia Station</u></b>");
				
				/* Nothing yet! */
				
				variousCount++;
			}
			// Kui Country Bar and Lodge
			if(flags["GLORYHOLE_MOUNTER"] > 0 || flags["GLORYHOLE_SERVER"] > 0 || flags["MET_KALLY"] != undefined || flags["MET_DEL_SHEMALE"] != undefined || flags["MET_MABBS"] != undefined || flags["MET_SYLVIE"] != undefined || flags["USHA_MET3"] != undefined || flags["MET_JESSE"] != undefined)
			{
				output2("\n<b><u>Kui Country Bar and Lodge</u></b>");
				// Gloryholes
				if(flags["GLORYHOLE_MOUNTER"] > 0) output2("\n<b>* Gloryholes, Times Used:</b> " + flags["GLORYHOLE_MOUNTER"]);
				if(flags["GLORYHOLE_SERVER"] > 0) output2("\n<b>* Gloryholes, Times Worked:</b> " + flags["GLORYHOLE_SERVER"]);
				// DCLilah
				if(flags["MET_DEL_SHEMALE"] != undefined)
				{
					output2("\n<b>* Delilah:</b> Met her");
					output2("\n<b>* Delilah, Sexual Organs:</b> " + listCharGenitals("DELILAH"));
					//if(flags["DEL_FACESAT"] > 0) output2("\n<b>* Delilah, Times She Ate You Out:</b> " + flags["DEL_FACESAT"]);
				}
				// Jesse
				if(flags["MET_JESSE"] != undefined)
				{
					output2("\n<b>* Jesse:</b> Met her");
					if(flags["JESSE_PC_TITLE"] != undefined) output2("\n<b>* Jesse, Preferred Name, She Calls You:</b> " + jessePCTitle());
					if(flags["JESSE_PC_TITLE_SEX"] != undefined) output2("\n<b>* Jesse, Preferred Sex Name, She Calls You:</b> " + jessePCTitleSex());
					if(flags["JESSE_TIMES_SEXED"] != undefined) output2("\n<b>* Jesse, Times Sexed:</b> " + flags["JESSE_TIMES_SEXED"]);
				}
				// Kally
				if(flags["MET_KALLY"] != undefined)
				{
					output2("\n<b>* Kally:</b>");
					if(kallyIsAway()) output2(" Away");
					else output2(" Active");
					if(flags["KIRO_MET_KALLY"] >= 4) output2(", Met her with Kiro");
					if(flags["KALLYS_SECRET_INGREDIENT"] != undefined) output2(", Know of her secret ingredient");
					if(kiroKallyThreesomeUnlockPoints() > 0) output2("\n<b>* Kally, Times Seen Her Sexually Interested in Kiro:</b> " + kiroKallyThreesomeUnlockPoints());
					if(drinkFromTapKally() > 0)
					{
						output2("\n<b>* Kally, Times Sucked Her Cock:</b> " + drinkFromTapKally());
						if(flags["KALLY_BIMBO_CUMCASCADE"] != undefined)
						{
							output2(", She gave you a cum-cascade");
							if(flags["KALLY_BIMBO_CUMCASCADE"] == 1 && drinkFromTapKally() > 1) output2(" once");
							if(flags["KALLY_BIMBO_CUMCASCADE"] == 2) output2(" twice");
							if(flags["KALLY_BIMBO_CUMCASCADE"] >= 3) output2(" " + flags["KALLY_BIMBO_CUMCASCADE"] + " times");
						}
						if(flags["KIRO_INTERRUPT_KALLYBEEJ"] != undefined)
						{
							output2(", Kiro interrupted");
							if(flags["KIRO_INTERRUPT_KALLYBEEJ"] == 1 && drinkFromTapKally() > 1) output2(" once");
							if(flags["KIRO_INTERRUPT_KALLYBEEJ"] == 2) output2(" twice");
							if(flags["KIRO_INTERRUPT_KALLYBEEJ"] >= 3) output2(" " + flags["KIRO_INTERRUPT_KALLYBEEJ"] + " times");
						}
					}
					if(flags["KALLY_BROED"] != undefined) output2("\n<b>* Kally, Times Licked Her Out:</b> " + flags["KALLY_BROED"]);
					if(flags["KIRO_KALLY_THREESOMES"] > 0) output2("\n<b>* Kally, Times Sexed in Threesome with Kiro:</b> " + flags["KIRO_KALLY_THREESOMES"]);
					if(flags["SISTER_MILK_ACT"] != undefined) output2("\n<b>* Kally, Times Cock-Milked with Kiro:</b> " + flags["SISTER_MILK_ACT"]);
				}
				// Mabbs
				if(flags["MET_MABBS"] != undefined)
				{
					output2("\n<b>* Mabbs:</b> Met her");
				}
				// Sylvie
				if(flags["MET_SYLVIE"] != undefined)
				{
					output2("\n<b>* Sylvie:</b> Met her");
					if(sylvieInBar()) output2(", Active (At bar)");
					else output2(", <i>Whereabo" + (silly ? "o" : "u") + "ts unknown</i>");
					if(sylvieInBar())
					{
						output2("\n<b>* Sylvie, Intoxication Status:</b>");
						switch(sylvieDrunkLevel())
						{
							case 0: output2(" Sober"); break;
							case 1: output2(" Buzzed"); break;
							case 2: output2(" Drunk"); break;
							case 3: output2(" Smashed"); break;
						}
					}
					if(flags["SEXED_SYLVIE"] > 0) output2("\n<b>* Sylvie, Times Sexed:</b> " + flags["SEXED_SYLVIE"]);
					if(flags["SYLVIE_CUFFNFUCK"] != undefined) output2("\n<b>* Sylvie, Times You Were Cuffed and Fucked by Her:</b> " + flags["SYLVIE_CUFFNFUCK"]);
					if(flags["SYLVIE_TAURMOUNT"] != undefined) output2("\n<b>* Sylvie, Times You Mounted Her:</b> " + flags["SYLVIE_TAURMOUNT"]);
					if(flags["CANADIA_TRIPLE_HORSED"] != undefined) output2("\n<b>* Sylvie, Times Gangbanged By with Kiro and Kally:</b> " + flags["CANADIA_TRIPLE_HORSED"]);
					if(flags["CANADIA_TRIPLE_HORSED_ANAL"] != undefined) output2("\n<b>* Sylvie, Times Anally Gangbanged By with Kiro and Kally:</b> " + flags["CANADIA_TRIPLE_HORSED_ANAL"]);
				}
				//Ushamee
				if(flags["USHA_MET3"] != undefined)
				{
					output2("\n<b>* Ushamee:</b> Met her");
					if(flags["USHA_DATE"] != undefined) output2(", Dated her");
					if(flags["USHA_SEXED"] != undefined)
					{
						output2("\n<b>* Ushamee, Times Sexed:</b> " + flags["USHA_SEXED"]);
						if(flags["USHA_BUMLOVE"] != undefined) output2("\n<b>* Ushamee, Times Fucked Her Bum:</b> " + flags["USHA_BUMLOVE"]);
						if(flags["USHA_ORAL"] != undefined) output2("\n<b>* Ushamee, Times Traded Oral:</b> " + flags["USHA_ORAL"]);
						if(flags["USHA_MOUNT"] != undefined) output2("\n<b>* Ushamee, Times Mounted Her:</b> " + flags["USHA_MOUNT"]);
					}
				}
				variousCount++;
			}
			// VR Lounge
			if(flags["MET_LUCA"] != undefined)
			{
				output2("\n<b><u>The Lotus Eater</u></b>");
				if(flags["VR_SIMMED"] > 0) output2("\n<b>* Services, Times Used Virtual Reality Simulator:</b> " + flags["VR_SIMMED"]);
				if(flags["LUCAS_MINDWASH"] == -1) output2("\n<b>* Services, Broken Visor:</b> <i>Refused to Use</i>");
				else if(flags["LUCAS_MINDWASH"] > 0) output2("\n<b>* Services, Times Used Broken Mindwash Visor:</b> " + flags["LUCAS_MINDWASH"]);
				output2("\n<b>* Luca:</b> Met her");
				if(flags["LUCA_SAFEWORD"] != undefined) output2(", Became her sub");
				if(flags["LUCA_SUBMISSION_ACCEPTABLE"] != undefined) output2(", Would accept addiction");
				if(flags["LUCA_SAFEWORD"] != undefined) output2("\n<b>* Luca, Your Submissiveness:</b> " + lucaSubmission() + "/100");
				variousCount++;
			}
			// Spunk Bunker
			if(flags["KIRO_KALLY_TEAM_MILKED"] != undefined || flags["VIXETTE_MOUTHGASMED"] != undefined || StatTracking.getStat("spunk bunker/cum milked") > 0)
			{
				output2("\n<b><u>Spunk Bunker</u></b>");
				if(flags["KIRO_KALLY_TEAM_MILKED"] != undefined) output2("\n<b>* Services, Times Cock-Milked with Kiro and Kally:</b> " + flags["KIRO_KALLY_TEAM_MILKED"]);
				if(StatTracking.getStat("spunk bunker/cum milked") > 0) output2("\n<b>* Services, Cock-Milker, Cum Milked:</b> " + mLs(Math.round(StatTracking.getStat("spunk bunker/cum milked"))));
				if(flags["VIXETTE_MOUTHGASMED"] != undefined) output2("\n<b>* Vixette, Times She Sucked Your Dick:</b> " + flags["VIXETTE_MOUTHGASMED"]);
				variousCount++;
			}
		}
		
		if(showID == "Gastigoth" || showID == "All")
		{
			// Gastigoth Station
			if(9999 != 9999)
			{
				output2("\n<b><u>Gastigoth Station</u></b>");
				
				/* Nothing yet! */
				
				variousCount++;
			}
			// Brandt
			if(flags["MET_BRANDT"] != undefined)
			{
				output2("\n<b><u>Security Checkpoint</u></b>");
				output2("\n<b>* Brandt:</b> Met her");
				if(flags["BRANDT_FLIRTED"] != undefined) output2(", Flirted with");
				if(flags["BRANDT_HATES_YOU"] != undefined) output2(", She despises you");
				if(flags["SEXED_BRANDT"] != undefined) output2("\n<b>* Brandt, Times Sexed:</b> " + flags["SEXED_BRANDT"]);
				if(flags["BRANDT_ANAL"] != undefined) output2("\n<b>* Brandt, Times Fucked Her Ass:</b> " + flags["BRANDT_ANAL"]);
				variousCount++;
			}
			// Warden
			if(flags["MET_KASMIRAN"] != undefined)
			{
				output2("\n<b><u>Visitors Lobby</u></b>");
				output2("\n<b>* Kasmiran:</b> Met her");
				variousCount++;
			}
			// Inmates
			if(flags["TAMTAM_PRISONED"] != undefined || flags["KASKA_PRISONED"] != undefined || flags["KHORGAN_PRISONED"] != undefined || flags["SAM_PRISONED"] != undefined || flags["LAH_PRISONED"] != undefined)
			{
				output2("\n<b><u>Inmate Visitations</u></b>");
				if(flags["TAMTAM_PRISONED"] != undefined) output2("\n<b>* Tam, Times Sexed:</b> " + flags["TAMTAM_PRISONED"]);
				if(flags["TAMTAM_GAST_PREG_TIMER"] != undefined) output2("\n<b>* Tam, Days Pregnant:</b> " + flags["TAMTAM_GAST_PREG_TIMER"]);
				if(flags["TAMTAM_TOTAL_KIDS"] > 0) output2("\n<b>* Tam, Total Kids:</b> " + flags["TAMTAM_TOTAL_KIDS"]);
				if(flags["KASKA_PRISONED"] != undefined) output2("\n<b>* Kaska, Times Sexed:</b> " + flags["KASKA_PRISONED"]);
				if(flags["KHORGAN_PRISONED"] != undefined) output2("\n<b>* Khorgan, Times Sexed:</b> " + flags["KHORGAN_PRISONED"]);
				if(flags["KHORGAN_GAST_PREG_TIMER"] != undefined) output2("\n<b>* Khorgan, Days Pregnant:</b> " + flags["KHORGAN_GAST_PREG_TIMER"]);
				if(flags["KHORGAN_TOTAL_KIDS"] > 0) output2("\n<b>* Khorgan, Total Kids:</b> " + flags["KHORGAN_TOTAL_KIDS"]);
				if(flags["SAM_PRISONED"] != undefined) output2("\n<b>* Sam, Times Sexed:</b> " + flags["SAM_PRISONED"]);
				if(flags["SAM_GAST_PREG_TIMER"] != undefined) output2("\n<b>* Sam, Days Pregnant:</b> " + flags["SAM_GAST_PREG_TIMER"]);
				if(flags["SAM_TOTAL_KIDS"] > 0) output2("\n<b>* Sam, Total Kids:</b> " + flags["SAM_TOTAL_KIDS"]);
				if(flags["LAH_PRISONED"] != undefined) output2("\n<b>* Lah, Times Sexed:</b> " + flags["LAH_PRISONED"]);
				if(flags["LAH_TOTAL_KIDS"] > 0) output2("\n<b>* Lah, Total Kids:</b> " + flags["LAH_TOTAL_KIDS"]);
				variousCount++;
			}
		}
		
		if(showID == "Breedwell" || showID == "All")
		{
			// Breedwell Incubation Centre
			if(flags["BREEDWELL_TIMES_BRED"] != undefined || flags["BREEDWELL_TIMES_DONATED"] != undefined)
			{
				output2("\n<b><u>Breedwell Incubation Centre</u></b>");
				if(flags["BREEDWELL_TIMES_BRED"] != undefined) output2("\n<b>* Services, Pod Lounge, Times Bred:</b> " + flags["BREEDWELL_TIMES_BRED"]);
				if(flags["BREEDWELL_TIMES_DONATED"] != undefined)
				{
					output2("\n<b>* Services, Sperm Donation Bay, Times Donated:</b> " + flags["BREEDWELL_TIMES_DONATED"]);
					if(flags["BREEDWELL_DONATION_LOCKED"] != undefined) output2(", Locked");
					else if(flags["BREEDWELL_DONATION_USED"] != undefined && (flags["BREEDWELL_DONATION_USED"] < days)) output2(", Last used " + ((days - flags["BREEDWELL_DONATION_USED"] == 1) ? "yesterday" : ((days - flags["BREEDWELL_DONATION_USED"]) + " days ago")));
					output2("\n<b>* Services, Sperm Donation Bay, Cum Milked:</b> " + mLs(Math.round(StatTracking.getStat("breedwell/cum milked"))));
				}
				variousCount++;
			}
			//breedwell premium contract info
			if(breedwellPremiumContractCount() > 0 || flags["BREEDWELL_PREM_POD_BAN"] == 1)
			{
				output2("\n<b><u>Premium Breeder Contracts</u></b>");
				if(flags["BREEDWELL_PREM_POD_BAN"] == 1) output2("\n<b>* Premium Breeder, Banned from Breeding Pods!</b>");
				if(flags["BREEDWELL_PREM_CON_BAN"] == 1) output2("\n<b>* Premium Breeder, Banned from Premium Breeder Contracts!</b>");
				output2("\n<b>* Premium Breeder, Number of Contracts Signed:</b> " + breedwellPremiumContractCount());
				if(flags["BREEDWELL_PREM_MISS_QUOTA"] >= 1) output2("\n<b>* Premium Breeder, Punishment for Missing Quota Pending!</b>");
				if(flags["BREEDWELL_PREM_BACKPAY"] >= 1) output2("\n<b>* Premium Breeder, Backpay Due:</b> " + flags["BREEDWELL_PREM_BACKPAY"]);
				if(breedwellPremiumUnderContract())
				{
					if(breedwellPremiumContractCount() > 1) output2("\n<b>* Premium Breeder, Current Contract: 180 Days</b>");
					else output2("\n<b>* Premium Breeder, Current Contract: 90 Days</b>");
					if(flags["BREEDWELL_PREM_DAY"] != undefined) output2("\n<b>* Premium Breeder, Day of Contract:</b> " + flags["BREEDWELL_PREM_DAY"]);
					if(flags["BREEDWELL_PREM_QUOTA"] != undefined) output2("\n<b>* Premium Breeder, Monthly Birth Quota:</b> " + flags["BREEDWELL_PREM_QUOTA"]);
					if(flags["BREEDWELL_PREM_KID_CNT"] != undefined) output2("\n<b>* Premium Breeder, Births (Current Month):</b> " + flags["BREEDWELL_PREM_KID_CNT"]);
					if(flags["BREEDWELL_PREM_SEX_CNT"] != undefined) output2("\n<b>* Premium Breeder, Subscribers Relieved (Current Month):</b> " + flags["BREEDWELL_PREM_SEX_CNT"]);
					if(flags["BREEDWELL_PREM_KID_CNT_CON"] != undefined) output2("\n<b>* Premium Breeder, Births (Current Contract):</b> " + flags["BREEDWELL_PREM_KID_CNT_CON"]);
					if(flags["BREEDWELL_PREM_SEX_CNT_CON"] != undefined) output2("\n<b>* Premium Breeder, Subscribers Relieved (Current Contract):</b> " + flags["BREEDWELL_PREM_SEX_CNT_CON"]);
				}
				if(flags["BREEDWELL_PREM_KID_CNT_TTL"] != undefined) output2("\n<b>* Premium Breeder, Births (Lifetime):</b> " + flags["BREEDWELL_PREM_KID_CNT_TTL"]);
				if(flags["BREEDWELL_PREM_SEX_CNT_TTL"] != undefined) output2("\n<b>* Premium Breeder, Subscribers Relieved (Lifetime):</b> " + flags["BREEDWELL_PREM_SEX_CNT_TTL"]);
				if(flags["BREEDWELL_PREM_TTL_PAY"] != undefined) output2("\n<b>* Premium Breeder, Earnings (Lifetime):</b> " + flags["BREEDWELL_PREM_TTL_PAY"]);
				if(flags["BREEDWELL_PREM_PUNK_CNT"] != undefined) output2("\n<b>* Premium Breeder, Times Punished for Keeping Babies:</b> " + flags["BREEDWELL_PREM_PUNK_CNT"]);
				if(flags["BREEDWELL_PREM_PUNQ_CNT"] != undefined) output2("\n<b>* Premium Breeder, Times Punished for Missing Quota:</b> " + flags["BREEDWELL_PREM_PUNQ_CNT"]);
				variousCount++;
			}
			// Quaelle
			if(flags["QUAELLE_MET"] != undefined)
			{
				output2("\n<b><u>Reception</u></b>");
				output2("\n<b>* Quaelle:</b> Met her");
				if(quaelleIsLover()) output2(", Lovers");
				if(quaellePregShutdown()) output2(", Sterile");
				if(quaelleInSnit()) output2(", In a Snit");
				if(quaelleHasLeft()) output2(", Has Left");
				if(flags["QUAELLE_HUGGED"] != undefined) output2("\n<b>* Quaelle, Times Hugged Her:</b> " + flags["QUAELLE_HUGGED"]);
				if(chars["QUAELLE"].hasCock() && chars["QUAELLE"].cumQ() > 0) output2("\n<b>* Quaelle, Virility:</b> " + Math.max((Math.round(chars["QUAELLE"].virility()*1000)/10), 0) + " %");
				if(flags["QUAELLE_SEXED"] != undefined) output2("\n<b>* Quaelle, Times Sexed:</b> " + flags["QUAELLE_SEXED"]);
				if(flags["QUAELLE_FUCK_CUNT_FRONT"] != undefined) output2("\n<b>* Quaelle, Times You Fucked Her Front Pussy:</b> " + flags["QUAELLE_FUCK_CUNT_FRONT"]);
				if(flags["QUAELLE_FUCK_CUNT_BACK"] != undefined) output2("\n<b>* Quaelle, Times You Fucked Her Back Pussy:</b> " + flags["QUAELLE_FUCK_CUNT_BACK"]);
				if(flags["QUAELLE_FUCK_CUNT_MORE"] != undefined) output2("\n<b>* Quaelle, Times You Went For More:</b> " + flags["QUAELLE_FUCK_CUNT_MORE"]);
				if(flags["QUAELLE_LICK_CUNT_FRONT"] != undefined) output2("\n<b>* Quaelle, Times You Licked Her Front Pussy:</b> " + flags["QUAELLE_LICK_CUNT_FRONT"]);
				if(flags["QUAELLE_LICK_CUNT_BACK"] != undefined) output2("\n<b>* Quaelle, Times You Licked Her Back Pussy:</b> " + flags["QUAELLE_LICK_CUNT_BACK"]);
				if(flags["QUAELLE_LICK_CLIT"] != undefined) output2("\n<b>* Quaelle, Times You Licked Her Pseudo-Clit:</b> " + flags["QUAELLE_LICK_CLIT"]);
				if(flags["QUAELLE_CATCH_CUNT"] != undefined) output2("\n<b>* Quaelle, Times She Fucked Your Pussy:</b> " + flags["QUAELLE_CATCH_CUNT"]);
				if(flags["QUAELLE_INCUBATION_TIMER_F"] != undefined) output2("\n<b>* Quaelle, Days Pregnant (Front):</b> " + flags["QUAELLE_INCUBATION_TIMER_F"]);
				if(flags["QUAELLE_INCUBATION_TIMER_B"] != undefined) output2("\n<b>* Quaelle, Days Pregnant (Back):</b> " + flags["QUAELLE_INCUBATION_TIMER_B"]);
				if(flags["QUAELLE_TOTAL_KIDS"] != undefined) output2("\n<b>* Quaelle, Total Kids:</b> " + flags["QUAELLE_TOTAL_KIDS"]);
				variousCount++;
			}
		}
		
		// Nothing recorded
		if(variousCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No encounter data has been logged");
			if(showID != "All") output2(" at this location");
			output2(".</i>");
		}
	}
	
	// Other/Misc Info
	if(showID == "Other" || showID == "All")
	{
		// Roaming Encounters
		output2("\n\n" + blockHeader("Roaming Encounters", false));
		var roamCount:int = 0;
		
		// Rival
		if(flags["RIVALCONFIGURED"] != undefined)
		{
			output2("\n<b>* [rival.name]:</b>");
			if(flags["COUSIN_EXECUTED"] != undefined) output2(" Inactive, Executed on Myrellion");
			else if(flags["COUSIN_EGGSLUT"] != undefined) output2(" Inactive, Enslaved as an eggslut on Myrellion");
			else if(flags["COUSIN_BEDWARMER"] != undefined) output2(" Inactive, Win-cest, Your personal sex slave");
			else
			{
				output2(" Active");
				if(flags["INSULTED_COUSIN_ON_MHENGA"] != undefined) output2(", Insulted [rival.em] on Mhen’ga");
			}
			roamCount++;
		}
		// Dane
		if(flags["MET_DANE"] != undefined)
		{
			output2("\n<b>* Dane:</b> Met him");
			if(flags["FOUGHT_DANE_ON_MHENGA"] != undefined) output2(", Fought him on Mhen’ga");
			if(flags["FREED_DANE_FROM_TAIVRA"] != undefined) output2(", Freed him on Myrellion");
			if(flags["DANE_PUNCHED"] != undefined) output2(", Seen him on Zhèng Shi");
			if(daneRecruited())
			{
				output2(", Crew member");
				if(daneIsCrew()) output2(" (Onboard Ship)");
			}
			if(daneSexedTotal())
			{
				output2("\n<b>* Dane, Sexual History:</b> Sexed him");
				if(flags["LOST_TO_DANE_ON_MHENGA"] != undefined || flags["DANE_BUTTFUCKED_U"] != undefined) output2(", He fucked your ass");
				if(flags["TAURFUCKED_DANE"] != undefined) output2(", Fucked him as a centaur");
				output2("\n<b>* Dane, Times Sexed:</b> " + daneSexedTotal());
			}
			roamCount++;
		}
		// Azra
		if(flags["MET_AZRA"] != undefined)
		{
			output2("\n<b>* Azra:</b> Met her");
			if(azraRecruited())
			{
				output2(", Crew member");
				if(azraIsCrew()) output2(" (Onboard Ship)");
				else if(flags["AZRA_ONBOARD"] == undefined) output2(" (At Mhen’ga)");
			}
			else if(flags["AZRA_DISABLED"] != undefined) output2(", <i>Whereabouts unknown</i>");
			if(flags["AZRA_CHOSE_PROFESSIONAL"] != undefined || flags["AZRA_BOYFRIEND"] != undefined)
			{
				output2("\n<b>* Azra, Relationship:</b>");
				if(flags["AZRA_BOYFRIEND"] == 1) output2(" You’re her [pc.boy]friend");
				else if(flags["AZRA_BOYFRIEND"] == -1) output2(" Fuck-buddies");
				else output2(" Professional");
			}
			if(flags["AZRA_KISSED"] != undefined) output2("\n<b>* Azra, Times Kissed:</b> " + flags["AZRA_KISSED"]);
			if(flags["AZRA_SEXED"] != undefined) output2("\n<b>* Azra, Times Sexed:</b> " + flags["AZRA_SEXED"]);
			roamCount++;
		}
		// Bianca
		if(flags["MET_BIANCA"] != undefined)
		{
			output2("\n<b>* Bianca:</b> Met her");
			/*
			if(flags["BIANCA_PLANET"] != undefined)
			{
				output2(" (At ");
				switch(flags["BIANCA_PLANET"])
				{
					case "mhen'ga": output2("Mhen’ga"); break;
					case "tarkus": output2("Tarkus"); break;
					case "myrellion": output2("Myrellion"); break;
					default: output2(StringUtil.toDisplayCase(flags["BIANCA_PLANET"])); break;
				}
				if(days - flags["BIANCA_LAST_DAY_MOVED"] > 0) output2(" for " + (days - flags["BIANCA_LAST_DAY_MOVED"]) + " days");
				output2(")");
			}
			if(flags["BIANCA_LOCATION"] != undefined) output2("\n<b>* Bianca, Last Known Location:</b> " + getPlanetName(flags["BIANCA_LOCATION"], true));
			output2("\n<b>* Bianca, Affection:</b> " + biancaFamiliarity() + " % (" + biancaFamiliarityMax() + " % Max)");
			*/
			if(flags["BIANCA_SEXED"] != undefined) output2("\n<b>* Bianca, Times Sexed:</b> " + flags["BIANCA_SEXED"]);
			roamCount++;
		}
		// Chaurmine
		if(flags["MET_CHAURMINE"] != undefined)
		{
			var chaurmineName:String = (flags["MET_CHAURMINE"] == -1 ? "Lizard Man" : "Chaurmine");
			
			//output2("\n<b><u>Steele Meets Steel</u></b>");
			output2("\n<b>* " + chaurmineName + ":</b>");
			if(flags["ABANDONED_CHAURMINE"] >= 3 || flags["CHAURMINE_LOVER"] == -1) output2(" <i>Whereabouts unknown</i>");
			else
			{
				output2(" Active");
				if(chaurmineOnUveto()) output2(" (On Uveto)");
				else if(chaurmineOnTarkus()) output2(" (On Tarkus)");
			}
			if(flags["ABANDONED_CHAURMINE"] != undefined)
			{
				output2(", Abandoned him");
				if(flags["ABANDONED_CHAURMINE"] == 2) output2(" twice");
				else if(flags["ABANDONED_CHAURMINE"] > 2) output2(" " + num2Text(flags["ABANDONED_CHAURMINE"]) + " times");
			}
			if(flags["CHAURMINE_HELPED"] != undefined) output2(", Helped him");
			if(flags["CHAURMINE_GUARDED"] != undefined) output2(", Guarded him");
			if(flags["MET_CHAURMINE"] >= 1)
			{
				output2("\n<b>* " + chaurmineName + ", Affection:</b> " + chaurmineRelationship() + " %");
				switch(flags["CHAURMINE_LOVER"])
				{
					case -1: output2(", Rejected"); break;
					case 0: output2(", Friends"); break;
					case 1: output2(", Lovers"); break;
				}
			}
			var chaurFightWin:int = (flags["CHAURMINE_WINS"] > 0 ? flags["CHAURMINE_WINS"] : 0);
			var chaurFightLoss:int = (flags["CHAURMINE_LOSSES"] > 0 ? flags["CHAURMINE_LOSSES"] : 0);
			var chaurmineFights:int = (chaurFightWin + chaurFightLoss);
			if(chaurmineFights > 0) output2("\n<b>* " + chaurmineName + ", Combat, Your Win/Loss Ratio:</b> " + chaurFightWin + "/" + chaurFightLoss + ", of " + chaurmineFights + " encounters");
			if(flags["SEXED_CHAURMINE"] > 0) output2("\n<b>* " + chaurmineName + ", Times Sexed Him:</b> " + flags["SEXED_CHAURMINE"]);
			roamCount++;
		}
		// Erra
		if(flags["MET_ERRA"] != undefined)
		{
			output2("\n<b>* Erra:</b> Met her");
			if(flags["ERRA_RELATIONSHIP_TALK"] != undefined)
			{
				output2("\n<b>* Erra, Relationship:</b>");
				if(erraLover()) output2(" Lovers");
				else if(flags["ERRA_HEARTBROKEN"] != undefined) output2(" Rejected, You’ve broken her heart");
				else output2(" Non-romantic");
				if(erraCollared()) output2(", She is your pet");
			}
			if(flags["ERRA_CUDDLED"] > 0) output2("\n<b>* Erra, Times Cuddled:</b> " + flags["ERRA_CUDDLED"]);
			if(flags["ERRA_SEXED"] > 0) output2("\n<b>* Erra, Times Sexed:</b> " + flags["ERRA_SEXED"]);
			if(flags["ERRA_PETTED"] > 0) output2("\n<b>* Erra, Times Petted:</b> " + flags["ERRA_PETTED"]);
			if(flags["ERRA_WALKIES"] > 0) output2("\n<b>* Erra, Times Walked:</b> " + flags["ERRA_WALKIES"]);
			roamCount++;
		}
		// Kaede
		if(hasMetKaede())
		{
			output2("\n<b>* Kaede:</b> Met her");
			if(flags["ANNOxKAEDE_INTRODUCED"] != undefined) output2(", Seen with Anno");
			var kaedePlanets:Array = [];
			if(flags["PUPPYSLUTMAS_2014"] != undefined) kaedePlanets.push("Ausaril");
			if(flags["KAEDE_MYRELLION_ENCOUNTER"] != undefined) kaedePlanets.push("Myrellion");
			if(flags["KAEDE_MET_ON_UVETO"] != undefined) kaedePlanets.push("Uveto");
			if(flags["KAEDE_CANADA_MET"] != undefined) kaedePlanets.push("Canadia");
			if(kaedePlanets.length > 0) output2("\n<b>* Kaede, Locations Encountered:</b> " + CompressToList(kaedePlanets, false));
			if(flags["KAEDE_EXHIBITIONISM"] != undefined) output2("\n<b>* Kaede, Exhibitionism:</b> " + flags["KAEDE_EXHIBITIONISM"] + "/100");
			if(flags["KAEDE_NT_ENCOUNTER"] != undefined)
			{
				output2("\n<b>* Kaede, New Texas Encounter:</b>");
				if(flags["HUNG_WITH_KAEDE_AFTER_MEETING_CASS"] != undefined) output2(" Hung out with her and Cass");
				else if(flags["SEXED_CASS"] != undefined)
				{
					output2(" Sexed Cass");
					if(flags["PUT_LOAD_IN_CASS"] != undefined) output2(" and came inside her");
				}
				else output2(" Met with her and Cass");
			}
			if(flags["KAEDE_FUCKED"] > 0) output2("\n<b>* Kaede, Times Sexed:</b> " + flags["KAEDE_FUCKED"]);
			roamCount++;
		}
		// Kara
		if(flags["MET_KARA"] != undefined)
		{
			output2("\n<b>* Kara:</b> Met her");
			if(flags["SEXED_KARA"] != undefined) output2(", Sexed her");
			if(flags["KQ2_KARA_SACRIFICE"] != undefined) output2(", Inactive");
			if(flags["KQ2_BETRAYED_KARA"] != undefined) output2(", <i>Whereabouts unknown</i>");
			roamCount++;
		}
		// Kattom
		if(flags["KATTOM_MOVE_CD"] != undefined)
		{
			var kattomName:String = (flags["MET_KATTOM"] == undefined ? "Short Kaithrit" : "Kattom Osgood");
			
			output2("\n<b>* " + kattomName + ":</b> " + (flags["MET_KATTOM"] == undefined ? "Seen" : "Met") + " him");
			if(flags["KATTOM_LOCATION"] != undefined && rooms[flags["KATTOM_LOCATION"]].hasFlag(GLOBAL.HAZARD)) output2("\n<b>* " + kattomName + ", Last Known Location:</b> " + getPlanetName(flags["KATTOM_LOCATION"], true) + " for " + prettifyMinutes(GetGameTimestamp() - flags["KATTOM_MOVE_CD"]));
			roamCount++;
		}
		// Kimber
		if(flags["MET_KIMBER"] != undefined)
		{
			output2("\n<b>* Kimber:</b> Met her");
			if(flags["KIMBER_FLIRTED_WITH"] != undefined) output2(", Flirted with her");
			if(flags["KIMBER_REJECTED_PARASITE"] != undefined) output2(", She rejected your parasites");
			var kimberItems:Array = [];
			if(flags["KIMBER_UTHRA_GIVEN"] != undefined) kimberItems.push("Uthra Sap");
			if(flags["KIMBER_CANDY_GIVEN"] != undefined) kimberItems.push("Nyrean Candy");
			if(flags["KIMBER_RUSKVEL_GIVEN"] != undefined) kimberItems.push("Ruskvel");
			if(flags["KIMBER_SKY_GIVEN"] != undefined) kimberItems.push("SkySap");
			if(flags["KIMBER_RATION_GIVEN"] != undefined) kimberItems.push("Zil Ration");
			if(kimberItems.length > 0) output2("\n<b>* Kimber, Items Given:</b> " + CompressToList(kimberItems, false));
			if(flags["KIMBER_SEXED"] > 0) output2("\n<b>* Kimber, Times Sexed:</b> " + flags["KIMBER_SEXED"]);
			if(flags["KIMBER_ON_TOP"] == 1) output2(", She topped you");
			roamCount++;
		}
		// Kirobutts!
		if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1 && flags["KIRO_BAR_MET"] != undefined)
		{
			output2("\n<b>* Kiro:</b>");
			if(flags["KIRO_DISABLED_MINUTES"] > 0) output2(" Away");
			else output2(" Active");
			if(kiroRecruited())
			{
				output2(", Crew member");
				if(kiroIsCrew()) output2(" (Onboard Ship)");
			}
			if(flags["KIRO_PHONE_EVENT"] != undefined)
			{
				output2("\n<b>* Kiro, Her Codex:</b> Found");
				switch(flags["KIRO_PHONE_EVENT"])
				{
					case 1: output2(", You sent her nudes for her"); break;
					case 2: output2(", You sent her nudes to Kally"); break;
				}
			}
			if(flags["KIRO_3SOME_REACTION"] != undefined)
			{
				output2("\n<b>* Kiro, Sexual Relationship with Kally:</b>");
				switch(flags["KIRO_3SOME_REACTION"])
				{
					case -1: output2(" You think it is bad"); break;
					case 0: output2(" Your opinion is neutral"); break;
					case 1: output2(" You think it is good"); break;
				}
			}
			output2("\n<b>* Kiro, Trust:</b> " + kiroTrust() + " %");
			if(flags["KIRO_DRINKING_CONTEST_RESULTS"] != undefined)
			{
				output2("\n<b>* Kiro, Drinking Contest, Last Result:</b>");
				if(flags["KIRO_DRINKING_CONTEST_RESULTS"] >= 0) output2(" Won against her");
				if(flags["KIRO_DRINKING_CONTEST_RESULTS"] == 0) output2(" Cheated against her");
				if(flags["KIRO_DRINKING_CONTEST_RESULTS"] < 0) output2(" Lost against her");
				if(StatTracking.getStat("contests/kiro drinkoff losses") + StatTracking.getStat("contests/kiro drinkoff wins") > 0) output2("\n<b>* Kiro, Drinking Contest, Win/Loss Ratio:</b> " + StatTracking.getStat("contests/kiro drinkoff wins") + "/" + StatTracking.getStat("contests/kiro drinkoff losses") + ", of " + (StatTracking.getStat("contests/kiro drinkoff losses") + StatTracking.getStat("contests/kiro drinkoff wins")) + " games");
			}
			output2("\n<b>* Kiro, Testicle Size:</b> " + prettifyLength(chars["KIRO"].ballDiameter()) + " across, " + prettifyLength(chars["KIRO"].ballSize()) + " around, each");
			if(kiroSexed())
			{
				output2("\n<b>* Kiro, Sexual Organs:</b> " + listCharGenitals("KIRO"));
				output2("\n<b>* Kiro, Sexual History:</b> Sexed her");
				if(flags["KIRO_X_SAEN_HAPPENED"] != undefined) output2(", Sexed her with Saendra");
				if(flags["KIRO_DEEPTHROATED_YOU"] != undefined) output2(", She deepthroated you");
				if(flags["KIRO_BALLJOBBED_YOU"] != undefined) output2(", She gave you a balljob");
				if(flags["PUMPED_KIRO_PUSSY"] != undefined) output2(", Pumped her pussy");
				if(flags["KIRO_VAG_FUCKED"] != undefined) output2("\n<b>* Kiro, Times Fucked Her Vagina:</b> " + flags["KIRO_VAG_FUCKED"]);
				if(flags["KIRO_FUCKED_PC"] != undefined) output2("\n<b>* Kiro, Times She Fucked You:</b> " + flags["KIRO_FUCKED_PC"]);
				if(flags["KIRO_ORGIED"] != undefined)
				{
					output2("\n<b>* Kiro, Times Had Orgy with You, Flahne, Miko, Mai and Mi’dee:</b> " + flags["KIRO_ORGIED"]);
					if(flags["KIRO_ORGY_DATE"] != undefined && ((flags["KIRO_ORGY_DATE"] + 2) < days)) output2(", Last was " + (days - flags["KIRO_ORGY_DATE"]) + " days ago");
				}
			}
			roamCount++;
		}
		// Krissy
		if(flags["KRISSY_INTRO_RESULT"] != undefined)
		{
			if(flags["MET_KRISSY"] != undefined || flags["KRISSY_INTRO_RESULT"] >= 0)
			{
				output2("\n<b>* Krissy:</b> Met her, Gave her ride to Canadia Station");
				switch(flags["KRISSY_INTRO_RESULT"])
				{
					case 1: output2(", Sexed her with Throbb"); break;
					case 2: output2(", Sexed her with Gush"); break;
					case 3: output2(", Sexed her with bondage play"); break;
				}
			}
			else output2("\n<b>* Reindeer Girl:</b> Met her, Ignored her request, <i>Whereabouts unknown</i>");
			roamCount++;
		}
		// Milly
		if(flags["MHENGA_PROBE_CASH_GOT"] != undefined)
		{
			output2("\n<b>* Milly:</b> Met her");
			if(flags["MILLY_FUCKED"] == 1) output2(", Sexed her");
			else if(flags["MILLY_FUCKED"] > 1) output2("\n<b>* Milly, Times Sexed:</b> " + flags["MILLY_FUCKED"]);
			roamCount++;
		}
		// Mitzi
		if(flags["MET_MITZI"] != undefined || flags["MITZI_DISABLED"] != undefined || flags["MITZI_GOODBAD"] != undefined)
		{
			output2("\n<b>* Mitzi:</b> Met her");
			if(flags["MITZI_GOODBAD"] != undefined) output2(", " + (flags["MITZI_GOODBAD"] < 1 ? "Bad" : "Good") + " fuck-toy");
			if(mitziRecruited())
			{
				output2(", Crew member");
				if(mitziIsCrew()) output2(" (Onboard Ship)");
				else output2(" (At Tavros Station)");
			}
			if(flags["MITZI_DISABLED"] != undefined) output2(", <i>Whereabouts unknown</i>");
			if(flags["MITZI_GUSHED"] != undefined) output2("\n<b>* Mitzi, Gush, Times Used:</b> " + flags["MITZI_GUSHED"]);
			if(flags["MITZI_SOAKED"] != undefined) output2("\n<b>* Mitzi, Soak, Times Used:</b> " + flags["MITZI_SOAKED"]);
			if(flags["MITZI_FUCKED"] != undefined) output2("\n<b>* Mitzi, Times Fucked Her Vagina:</b> " + flags["MITZI_FUCKED"]);
			if(flags["MITZI_CUNTLICKED_PC"] != undefined) output2("\n<b>* Mitzi, Times She Licked Your Vagina:</b> " + flags["MITZI_CUNTLICKED_PC"]);
			if(flags["MITZI_TITFUCKED"] != undefined) output2("\n<b>* Mitzi, Times Slowly Tit-Fucked Her:</b> " + flags["MITZI_TITFUCKED"]);
			if(flags["MITZI_CUNTNOSIS"] != undefined) output2("\n<b>* Mitzi, Times Sexed with Cuntnosis:</b> " + flags["MITZI_CUNTNOSIS"]);
			if(flags["MITZI_CELISE_TENTAFUCK"] != undefined) output2("\n<b>* Mitzi, Times Had Tentacle Sex with Celise:</b> " + flags["MITZI_CELISE_TENTAFUCK"]);
			if(flags["MITZI_CELISE_TENTAFUCK2"] != undefined) output2("\n<b>* Mitzi, Times Had Tentacle Sex with Celise and Reaha:</b> " + flags["MITZI_CELISE_TENTAFUCK2"]);
			if(flags["MITZI_SERA_TENTASOME"] != undefined) output2("\n<b>* Mitzi, Times Had Tentacle Sex with Celise, Reaha and Sera:</b> " + flags["MITZI_SERA_TENTASOME"]);
			roamCount++;
		}
		// BisonButts
		if(flags["ENCOUNTERED_FREEDOM_BEEF"] != undefined)
		{
			output2("\n<b>* Riley:</b> Met her");
			if(flags["FUCKED_FREEDOM_BEEF"] == 1)
			{
				if(flags["FUCKED_FREEDOM_BEEF_TAURIC"] != undefined) output2(", You mounted her");
				else if(flags["FUCKED_FREEDOM_BEEF_SNUSNU"] != undefined) output2(", She gave you Snu Snu");
				else if(flags["FUCKED_FREEDOM_BEEF_LESBOLICKS"] != undefined) output2(", She ate you out");
				else output2(", Sexed her");
			}
			else if(flags["FUCKED_FREEDOM_BEEF"] > 1)
			{
				output2("\n<b>* Riley, Times Sexed:</b> " + flags["FUCKED_FREEDOM_BEEF"]);
				if(flags["FUCKED_FREEDOM_BEEF_TAURIC"] != undefined) output2("\n<b>* Riley, Times You Mounted Her:</b> " + flags["FUCKED_FREEDOM_BEEF_TAURIC"]);
				if(flags["FUCKED_FREEDOM_BEEF_SNUSNU"] != undefined) output2("\n<b>* Riley, Times She Gave You Snu Snu:</b> " + flags["FUCKED_FREEDOM_BEEF_SNUSNU"]);
				if(flags["FUCKED_FREEDOM_BEEF_LESBOLICKS"] != undefined) output2("\n<b>* Riley, Times She Ate You Out:</b> " + flags["FUCKED_FREEDOM_BEEF_LESBOLICKS"]);
			}
			roamCount++;
		}
		// Saendra
		if(flags["FALL OF THE PHOENIX STATUS"] >= 1 || flags["SAEN MET AT THE BAR"] != undefined)
		{
			output2("\n<b>* Saendra:</b>");
			if(flags["SAENDRA_DISABLED"] == 1) output2(" Inactive");
			else if(flags["SAENDRA_XPACK1_CREDITTIME"] != undefined && GetGameTimestamp() < (flags["SAENDRA_XPACK1_CREDITTIME"] + (24 * 60))) output2(" Away");
			else output2(" Active");
			if(flags["SAEN MET AT THE BAR"] != undefined)
			{
				output2(", Met at Tavros");
				if(flags["SAENDRA_XPACK1_CREDITOFFER"] == 1) output2(", Offered credits to release the <i>Phoenix</i>");
				else if(flags["SAENDRA_XPACK1_CREDITOFFER"] == 2) output2(", Paid cost to release the <i>Phoenix</i>");
				else if(flags["SAENDRA OFFERED CREDITS"] != undefined) output2(", Offered credits to repair the <i>Phoenix</i>");
			}
			if(flags["SAEN MET AT THE BAR"] != undefined) output2("\n<b>* Saendra, Affection:</b> " + saendraAffection() + " % (" + flags["SAENDRA_MAX_AFFECTION"] + " % Max)");
			if(flags["SAENDRA TALKED ABOUT FUTA"] != undefined)
			{
				output2("\n<b>* Saendra, Futafication:</b>");
				if(flags["SAENDRA TALKED ABOUT FUTA"] == 1) output2(" Talked about once");
				else output2(" Talked about " + flags["SAENDRA TALKED ABOUT FUTA"] + " times");
				if(flags["SAENDRA GONNA GO GET A COCK"] == undefined && flags["SAENDRA OH GOD IM POOR"] != undefined)
				{
					if(pc.credits < 2000) output2(", Too poor to pay 2000 credits");
					else output2(", Have 2000 credits to pay");
				}
				if(flags["SAENDRA GONNA GO GET A COCK"] == 1) output2(", Paid for, Go to The Dark Chrysalis");
				if(flags["SAENDRA GONNA GO GET A COCK"] == 2) output2(", Paid for, Seen Sera, Meet her at the <i>Phoenix</i>");
				if(flags["SAENDRA GONNA GO GET A COCK"] == 3) output2(", Paid for, Seen Sera, Used drug, Completed");
			}
			if(flags["SAENDRA_FEED_MILK"] > 0) output2("\n<b>* Saendra, Times You Fed Her Your Breast Milk:</b> " + flags["SAENDRA_FEED_MILK"]);
			if(flags["SAENDRA TIMES SEXED"] != undefined || flags["KIRO_X_SAEN_HAPPENED"] != undefined)
			{
				output2("\n<b>* Saendra, Sexual Organs:</b> " + listCharGenitals("SAENDRA"));
				output2("\n<b>* Saendra, Sexual History:</b> Sexed her");
				if(flags["KIRO_X_SAEN_HAPPENED"] != undefined) output2(", Sexed her with Kiro");
				if(flags["SAENDRA TIMES SEXED"] > 1) output2("\n<b>* Saendra, Times Sexed:</b> " + flags["SAENDRA TIMES SEXED"]);
			}
			roamCount++;
		}
		// Shade
		if(flags["MET_KARA"] != undefined)
		{
			output2("\n<b>* Shade:</b> Met her");
			if(flags["SHADE_IS_YER_SIS"] != undefined) output2(", She is your half-sister");
			else if(flags["TOLD_SHADE_SHES_YER_SIS"] != undefined) output2(", " + (flags["TOLD_SHADE_SHES_YER_SIS"] < 0 ? "She’s secretly" : "Told her she’s") + " your half-sister");
			if(shadeIsLover()) output2(", She is your lover");
			if(flags["KQ2_SHADE_DEAD"] != undefined || flags["SHADE_DISABLED"] == 1) output2(", Inactive");
			else if(flags["SHADE_IS_HOSTILE"] != undefined) output2(", She is hostile, <i>Whereabouts unknown</i>");
			else if(shadeAtTheBar()) output2(", Active (On Myrellion)");
			else if(flags["SHADE_ON_UVETO"] != undefined)
			{
				output2(", Active (On Uveto");
				if(flags["SHADE_ON_UVETO"] > 1 || MailManager.isEntryViewed("letter_from_shade"))
				{
					if(shadeIsHome()) output2(", At Home");
					else output2(", At Bar");
				}
				output2(")");
			}
			if(flags["SHADE_GOT_HELP_WITH_LAYING"] != undefined)
			{
				output2("\n<b>* Shade, Tail Cunt:</b> Helped her with laying egg");
				if(flags["SHADE_INSEMINATION_COUNTER"] != undefined && flags["SHADE_INSEMINATION_COUNTER"] >= 20) output2(", Ready to lay another egg!");
			}
			if(flags["SHADE_TALKED_ABOUT_MODS"] != undefined)
			{
				if(chars["SHADE"].isLactating()) output2("\n<b>* Shade, Milk Type:</b> " + GLOBAL.FLUID_TYPE_NAMES[chars["SHADE"].milkType]);
			}
			if(flags["SEXED_SHADE"] != undefined) output2("\n<b>* Shade, Times Sexed:</b> " + flags["SEXED_SHADE"]);
			if(flags["SHADES_CUNTTAIL_FED"] != undefined) output2("\n<b>* Shade, Times Fed Her Tail Cunt:</b> " + flags["SHADES_CUNTTAIL_FED"]);
			if(flags["TAKEN_SHADES_HARDLIGHT"] != undefined) output2("\n<b>* Shade, Times Fucked by Her Hardlight Strap-on:</b> " + flags["TAKEN_SHADES_HARDLIGHT"]);
			if(flags["SHADE_BOOBWORSHIP"] != undefined) output2("\n<b>* Shade, Times Worshipped Her Boobs:</b> " + flags["SHADE_BOOBWORSHIP"]);
			roamCount++;
		}
		// Shizuya
		if(flags["SHIZZY_TRAP_ENCOUNTERED"] != undefined)
		{
			if(shizzyTrapAvailable()) output2("\n<b>* Distress Signal:</b> Encountered");
			else if(flags["SHIZZY_MET"] == undefined) output2("\n<b>* Distress Signal:</b> Dismissed");
			else 
			{
				output2("\n<b>* Shizuya:</b> Met her");
				if(flags["SHIZZY_SEXED"] != undefined) output2(", Sexed her");
				if(flags["SHIZZY_BEEN_ROUGH"] != undefined) output2(", Sexed you <i>hard</i>");
				if(flags["SHIZZY_OUTFIT_STATE"] != undefined){
					output2("\n<b>* Shizuya, Sparring:</b>");
					if(flags["SHIZZY_OUTFIT_STATE"] < 2) output2(" Sparred with her");
					else output2(" Beat her");
					if(flags["SHIZZY_OUTFIT_STATE"] == 4) output2(", Got prize");
				}
			}
			roamCount++;
		}
		// Zo'dee
		if(flags["MET_ZODEE"] != undefined)
		{
			output2("\n<b>* Zo’dee:</b> Met her");
			if(flags["ZODEE_GALOQUEST"] != undefined)
			{
				if(flags["ZODEE_GALOQUEST"] != 1) output2(" " + num2Text(flags["ZODEE_GALOQUEST"]) + " times");
				output2(", Gave you GaloMax");
			}
			if(flags["ZODEE_S2_CHOICE"] != undefined)
			{
				output2("\n<b>* Zo’dee, Second Encounter:</b>");
				if(flags["ZODEE_S2_CHOICE"] == -1) output2(" Refused to help her lay eggs");
				if(flags["ZODEE_S2_CHOICE"] == 0) output2(" Bought GaloMax from her");
				if(flags["ZODEE_S2_CHOICE"] == 1) output2(" Helped her lay eggs for GaloMax");
			}
			roamCount++;
		}
		
		// Nothing recorded
		if(roamCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No roaming encounter data has been logged.</i>");
		}
		
		// Team Building
		output2("\n\n" + blockHeader("Crew Team Building", false));
		var teamBuildingCount:int = 0;
		
		if(pippaYammiThreesomeCount(0) > 0)
		{
			output2("\n<b>* Pippa, Yammi, Times Sexed in Threesome:</b> " + pippaYammiThreesomeCount(0));
			teamBuildingCount++;
		}
		
		//Nothing recorded
		if(teamBuildingCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No team building activities have been logged.</i>");
		}
		
		// Misc: (Optional)
		output2("\n\n" + blockHeader("Miscellaneous", false));
		var miscCount:int = 0;
		
		// Resources, rare elements, etc.
		if(flags["OXONIUM_FOUND"] != undefined)
		{
			output2("\n<b><u>Resources</u></b>");
			// Oxonium
			if(flags["OXONIUM_FOUND"] != undefined) output2("\n<b>* Oxonium Deposits Found, Total:</b> " + flags["OXONIUM_FOUND"]);
			miscCount++;
		}
		// Super rare and weird TF items/sex toys - regular rare items/armor/weapons can be omitted
		if(flags["BUTTSLUTINATOR"] != undefined || flags["PURCHASED_AMAZONA"] != undefined || flags["OMNISUITED"] != undefined || flags["ORGASMENDER"] != undefined || flags["SYNTHSHEATH_ACQUIRED"] != undefined || flags["SYNTHSHEATH_TWO_FOUND"] != undefined || flags["LOOTED_COCKBOX"] != undefined || flags["ZODEE_GALOQUEST"] != undefined || flags["OMEGA_OILED"] != undefined || flags["MINDWASH_VISOR_INSTALLED"] != undefined || flags["BADGER_SILICONE_TANK_INSTALLED"] != undefined || (flags["STRANGE_EGG_SOLD"] != undefined || pc.hasItemByClass(StrangeEgg) || pc.hasItemInStorageByClass(StrangeEgg) || pc.hasPregnancyOfType("PsychicTentacles") || StatTracking.getStat("pregnancy/psychic tentacle beast birthed") > 0))
		{
			output2("\n<b><u>Suspicious Items</u></b>");
			// Buttslutinator Mark 2
			if(flags["BUTTSLUTINATOR"] != undefined)
			{
				output2("\n<b>* Buttslutinator Mark II, Times Used:</b> " + flags["BUTTSLUTINATOR"]);
			}
			// Amazona
			if(flags["PURCHASED_AMAZONA"] != undefined)
			{
				output2("\n<b>* JoyCo, Amazona Iced Tea:</b> Bought");
				if(flags["AMAZONA_DRINKS"] != undefined)
				{
					if(flags["AMAZONA_DRINKS"][0] == 1) output2(", Used once");
					else output2(", Used " + flags["AMAZONA_DRINKS"][0]+ " times");
					var amazonaFlavors:Array = [];
					if(flags["AMAZONA_DRINKS"][1] > 0) amazonaFlavors.push("Classic");
					if(flags["AMAZONA_DRINKS"][2] > 0) amazonaFlavors.push("Lite");
					if(flags["AMAZONA_DRINKS"][3] > 0) amazonaFlavors.push("Plus");
					if(flags["AMAZONA_DRINKS"][4] > 0) amazonaFlavors.push("Futazona");
					if(amazonaFlavors.length > 0) output2(", Tasted " + CompressToList(amazonaFlavors));
				}
				if(pc.hasStatusEffect("Amazona Uses")) output2("\n<b>* JoyCo, Amazona Iced Tea, Last Drink:</b> " + prettifyMinutes(1440 - pc.getStatusMinutes("Amazona Uses")) + " ago");
			}
			// Omnisuit
			if(flags["OMNISUITED"] != undefined)
			{
				output2("\n<b>* Omnisuit:</b> Acquired, Used");
			}
			// Orgasmender
			if(flags["ORGASMENDER"] != undefined)
			{
				output2("\n<b>* Orgasmender, Times Used:</b> " + flags["ORGASMENDER"]);
			}
			// Omega Oil
			if(flags["OMEGA_OILED"] != undefined)
			{
				output2("\n<b>* Omega Oil™, Times Used:</b> " + flags["OMEGA_OILED"]);
			}
			// SnakeByte
			if(flags["USED_SNAKEBYTE"] != undefined) output2("\n<b>* SnakeByte:</b> Used");
			// Big like Cock-Box!
			if(flags["LOOTED_COCKBOX"] != undefined)
			{
				output2("\n<b>* TamaniCorp, Dong Designer:</b>");
				if(flags["LOOTED_COCKBOX"] == 0) output2(" Found");
				else output2(" Taken");
				if(flags["DONG_DESIGNER_INSTALLED"] != undefined) output2(", Installed");
				if(flags["USED_DONG_DESIGNER"] == undefined) output2(", Unused");
				else output2(", Used");
				if(flags["DONG_DESIGNER_MALFUNCTIONED"] != undefined) output2(", Has malfunctioned");
				if(flags["DONG_DESIGNER_BACKWASHED"] != undefined) output2(", Has backwashed");
				if(flags["DONG_DESIGNER_FLOODED"] != undefined) output2(", Has flooded");
			}
			// GALO SENGAN
			if(flags["ZODEE_GALOQUEST"] != undefined)
			{
				output2("\n<b>* Xenogen Biotech, GaloMax Pill:</b> Acquired");
				if(flags["GALOMAX_DOSES"] != undefined) output2(", Used");
				if(flags["GALOMAX_DOSES"] > 1) output2(" " + flags["GALOMAX_DOSES"] + " times");
			}
			// Horse wieners
			if(flags["SYNTHSHEATH_ACQUIRED"] != undefined || flags["SYNTHSHEATH_TWO_FOUND"] != undefined)
			{
				if(!CodexManager.entryViewed("SynthSheath")) output2("\n<b>* ???, Equine Phallus Found, Total:</b> ");
				else output2("\n<b>* Xenogen Biotech, SynthSheath, Total Acquired:</b> ");
				var horseCocksTotal:int = 0;
				if(flags["SYNTHSHEATH_ACQUIRED"] != undefined) horseCocksTotal++;
				if(flags["SYNTHSHEATH_TWO_FOUND"] != undefined) horseCocksTotal += flags["SYNTHSHEATH_TWO_FOUND"];
				output2(String(horseCocksTotal));
				var horseCocksOwned:int = synthSheathsOwned();
				var horseCocksUsed:int = synthSheathsUsed();
				var horseCocksLost:int = synthSheathsLost();
				if(horseCocksOwned + horseCocksUsed + horseCocksLost > 0)
				{
					var horseCockList:Array = [];
					if(horseCocksOwned > 0) horseCockList.push("Own " + horseCocksOwned);
					if(horseCocksUsed > 0) horseCockList.push("Used " + horseCocksUsed);
					if(horseCocksLost > 0) horseCockList.push("Lost " + horseCocksLost);
					if(horseCockList.length > 0)
					{
						output2(" (");
						for(var hc:int = 0; hc < horseCockList.length; hc++)
						{
							if(hc != 0) output2(", ");
							output2(horseCockList[hc]);
						}
						output2(")");
					}
				}
			}
			// Mindwash!
			if(flags["MINDWASH_VISOR_INSTALLED"] != undefined)
			{
				output2("\n<b>* Mindwash Visor:</b> Installed");
				if(flags["BADGER_MINDWASH"] != undefined) output2("\n<b>* Mindwash Visor, Times Used:</b> " + flags["BADGER_MINDWASH"]);
				if(flags["CELISE_MINDWASHED"] != undefined) output2("\n<b>* Mindwash Visor, Times Used By Celise:</b> " + flags["CELISE_MINDWASHED"]);
				if(flags["SHEKKA_MINDWASHED"] != undefined) output2("\n<b>* Mindwash Visor, Times Used By Shekka:</b> " + flags["SHEKKA_MINDWASHED"]);
			}
			// Silicone Tank
			if(flags["BADGER_SILICONE_TANK_INSTALLED"] != undefined)
			{
				output2("\n<b>* Silicone Tank:</b>");
				if(flags["BADGER_SILICONE_TANK_INSTALLED"] == 1) output2(" Purchased from Doctor Badger, Installed");
				else if(flags["BADGER_SILICONE_TANK_INSTALLED"] == 2)
				{
					output2(" Purchased from Doctor Badger");
					if(pc.hasStatusEffect("Badger Silicone Carry Timer"))
					{
						output2(", <i>Pending...</i>");
						output2("\n<b>* Silicone Tank, Time Left:</b> " + prettifyMinutes(pc.getStatusMinutes("Badger Silicone Carry Timer")));
					}
					else output2(", <i>Ready for pick-up!</i>");
				}
				else output2(" Know about it, Purchase available from Doctor Badger");
			}
			// Psychic Tentacle Beast
			if(flags["STRANGE_EGG_SOLD"] != undefined || pc.hasItemByClass(StrangeEgg) || pc.hasItemInStorageByClass(StrangeEgg) || pc.hasPregnancyOfType("PsychicTentacles") || StatTracking.getStat("pregnancy/psychic tentacle beast birthed") > 0)
			{
				output2("\n<b>* UHS-1045 Egg:</b> Found");
				if(pc.hasItemByClass(StrangeEgg)) output2(", In inventory");
				if(pc.hasItemInStorageByClass(StrangeEgg)) output2(", In storage");
				if(pc.hasPregnancyOfType("PsychicTentacles") || StatTracking.getStat("pregnancy/psychic tentacle beast birthed") > 0)
				{
					output2(", Impregnated by");
					if(pc.hasPregnancyOfType("PsychicTentacles")) output2(", Carrying young");
					if(StatTracking.getStat("pregnancy/psychic tentacle beast birthed") > 0) output2(", Birthed young");
				}
				if(flags["STRANGE_EGG_SOLD"] != undefined) output2(", Sold to vendor");
				output2("\n<b>* UHS-1045 Egg, Advisory:</b> <i>Danger, handle with caution. A living egg can fetch a high price on the market.</i>");
			}
			miscCount++;
		}
		// Illegal items... Penny's gonna getcha!
		if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] != undefined || flags["PENNY_THROBB_USES"] != undefined || flags["TIMES_THROBB_USED"] != undefined || flags["ZEPHYR_THROBBED"] != undefined || flags["SLYVEREN_THROBB_FUCKED"] != undefined || flags["MITZI_BIMBO_TALK"] != undefined || flags["MITZI_FAV_DRUG"] != undefined || flags["SOAK_TIMES_USED"] != undefined || CodexManager.entryViewed("Dumbfuck") || CodexManager.entryViewed("Gush") || CodexManager.entryViewed("Soak") || CodexManager.entryViewed("Throbb") || CodexManager.entryViewed("The Treatment"))
		{
			output2("\n<b><u>Illegal Items</u></b>");
			// Dumbfuck
			if(flags["MITZI_BIMBO_TALK"] != undefined || CodexManager.entryViewed("Dumbfuck"))
			{
				output2("\n<b>* Dumbfuck:</b> Known");
				if(flags["TIMES_TAKEN_DUMBFUCK"] != undefined)
				{
					if(flags["TIMES_TAKEN_DUMBFUCK"] == 1) output2(", Used once");
					else output2(", Used " + flags["TIMES_TAKEN_DUMBFUCK"] + " times");
					if(flags["DUMBFUCK_SNEEZES"] != undefined)
					{
						output2(" with " + flags["DUMBFUCK_SNEEZES"] + " sneeze");
						if(flags["DUMBFUCK_SNEEZES"] != 1) output2("s");
						output2(" total");
					}
				}
			}
			// Gush
			if(flags["MITZI_FAV_DRUG"] != undefined || CodexManager.entryViewed("Gush"))
			{
				output2("\n<b>* Gush:</b> Known");
				if(flags["USED_GUSH"] != undefined) output2(", Used");
			}
			// Soak
			if(flags["MITZI_FAV_DRUG"] != undefined || flags["SOAK_TIMES_USED"] != undefined || CodexManager.entryViewed("Soak"))
			{
				output2("\n<b>* Soak:</b> Known");
				if(flags["SOAK_TIMES_USED"] != undefined)
				{
					if(flags["SOAK_TIMES_USED"] == 1) output2(", Used once");
					else output2(", Used " + flags["SOAK_TIMES_USED"] + " times");
				}
			}
			// Throbb
			if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] != undefined || flags["PENNY_THROBB_USES"] != undefined || flags["TIMES_THROBB_USED"] != undefined || flags["ZEPHYR_THROBBED"] != undefined || flags["SLYVEREN_THROBB_FUCKED"] != undefined || CodexManager.entryViewed("Throbb"))
			{
				output2("\n<b>* Throbb:</b> Known");
				if(flags["TIMES_THROBB_USED"] != undefined)
				{
					if(flags["TIMES_THROBB_USED"] == 1) output2(", Used once");
					else output2(", Used " + flags["TIMES_THROBB_USED"] + " times");
				}
			}
			// The Treatment
			if(CodexManager.entryViewed("The Treatment"))
			{
				output2("\n<b>* The Treatment:</b> Known");
				if(pc.hasStatusEffect("Treated")) output2(", Used");
			}
			miscCount++;
		}
		if(StatTracking.getStat("joyco/milk milked") + StatTracking.getStat("joyco/cum milked") > 0)
		{
			output2("\n<b><u>Contributions</u></b>");
			if(StatTracking.getStat("joyco/milk milked") > 0) output2("\n<b>* JoyCo, Milk Fluid Milked:</b> " + mLs(Math.round(StatTracking.getStat("joyco/milk milked"))));
			if(StatTracking.getStat("joyco/cum milked") > 0) output2("\n<b>* JoyCo, Cum Fluid Milked:</b> " + mLs(Math.round(StatTracking.getStat("joyco/cum milked"))));
		}
		// Sexploration: Porny Smuts
		if(flags["LETS_FAP_ARCHIVES"] != undefined || flags["STEPH_WATCHED"] != undefined)
		{
			output2("\n<b><u>Pornography</u></b>");
			// Atha's Adventures
			if(flags["LETS_FAP_ARCHIVES"] != undefined)
			{
				output2("\n<b>* Champeon, Atha’s Let’s Fap Series:</b> Donated");
				if(flags["CUMSTREAM_UNLOCKED"] != undefined) output2(", Geyser Tier");
				else if(flags["EARLY_LETS_FAPS"] != undefined) output2(", Hydrant Tier");
				else output2(", Faucet Tier");
				if(flags["LETS_FAP_RELEASE_TIMER"] != undefined)
				{
					var unlockLength:Number = (flags["EARLY_LETS_FAPS"] == undefined ? 10080 : 7200);
					output2(", Next video release");
					if(GetGameTimestamp() - flags["LETS_FAP_RELEASE_TIMER"] < unlockLength) output2(" ready after " + prettifyMinutes(unlockLength - (GetGameTimestamp() - flags["LETS_FAP_RELEASE_TIMER"])));
					else output2(" at 13:00");
				}
			}
			// Steph Irson Stats
			if(flags["STEPH_WATCHED"] != undefined)
			{
				output2("\n<b>* Steph Irson, Galactic Huntress:</b> Watched");
				var stephEps:Array = [];
				if(flags["STEPH_NYAN"] != undefined) stephEps.push("Naleen");
				if(flags["STEPH_GOOED"] != undefined) stephEps.push("Gray Goo");
				if(flags["STEPH_COWGIRL"] != undefined) stephEps.push("New Texas");
				if(flags["STEPH_COCKED"] != undefined) stephEps.push("Nyrea");
				if(flags["STEPH_DARGONED"] != undefined) stephEps.push("Korgonne");
				if(stephEps.length > 0) output2("\n<b>* Steph Irson, Episodes:</b> " + CompressToList(stephEps, false));
			}
			miscCount++;
		}
		// Sexploration: The Sex Toys
		if(flags["NIVAS_BIONAHOLE_USES"] != undefined || flags["SYRI_BIONAHOLE_USES"] != undefined || flags["TAMANI_HOLED"] != undefined || flags["GRAVCUFFS_USES"] != undefined || flags["HOVERHOLE_USES"] != undefined || flags["WULFE_PURCHASED"] != undefined || flags["SUKMASTRED"] != undefined || flags["BUBBLE_BUDDIED"] != undefined || flags["EGG_TRAINER_INSTALLED"] != undefined || pc.hasItemByClass(EggTrainer) || flags["SLEEP_FAPNEA_INSTALLED"] != undefined || pc.hasItemByClass(SleepFapnea))
		{
			output2("\n<b><u>Sex Toys</u></b>");
			// BionaHoles
			if(flags["NIVAS_BIONAHOLE_USES"] != undefined) output2("\n<b>* BionaHole, Nivas Oxonef, Times Used:</b> " + flags["NIVAS_BIONAHOLE_USES"]);
			if(flags["SYRI_BIONAHOLE_USES"] != undefined) output2("\n<b>* BionaHole, Syri, Times Used:</b> " + flags["SYRI_BIONAHOLE_USES"]);
			if(flags["TAMANI_HOLED"] != undefined) output2("\n<b>* BionaHole, Tamani, Times Used:</b> " + flags["TAMANI_HOLED"]);
			// Grav-Cuffs
			if(flags["GRAVCUFFS_USES"] != undefined) output2("\n<b>* Grav-Cuffs, Times Used:</b> " + flags["GRAVCUFFS_USES"]);
			// Hover Hole
			if(flags["HOVERHOLE_USES"] != undefined) output2("\n<b>* Hovering Pocket-Pussy, Times Used:</b> " + flags["HOVERHOLE_USES"]);
			// Sleep Fapnea Device
			if(flags["SLEEP_FAPNEA_INSTALLED"] != undefined || pc.hasItemByClass(SleepFapnea))
			{
				output2("\n<b>* JoyCo, Sleep Fapnea Machine:</b>");
				if(flags["SLEEP_FAPNEA_INSTALLED"] != undefined) output2(" Installed");
				else output2(" Acquired");
				if(flags["SLEEP_FAPNEA_ACTIVE"] != undefined)
				{
					output2(", Active");
					switch(flags["SLEEP_FAPNEA_ACTIVE"])
					{
						case 0: output2(", Chaste Mode"); break;
						case 1:
							output2(", Free Dreaming");
							if(flags["SLEEP_FAPNEA_REPEAT"] != undefined) output2(", Repeat On");
							break;
						case 2:
							output2(", Scripted Dreaming, Repeat On");
							if(pc.hasStatusEffect("Sleep Fapnea Dream")) output2(", “" + sleepFapneaDreamTitle(pc.statusEffectv1("Sleep Fapnea Dream")) + "”");
							break;
					}
				}
			}
			// Siegwulfe
			if(flags["WULFE_PURCHASED"] != undefined)
			{
				output2("\n<b>* Reaper Armaments, Siegwulfe:</b> Purchased");
				if(flags["WULFE_PURCHASED"] <= 1) { /* once */ }
				else if(flags["WULFE_PURCHASED"] == 2) output2(" twice");
				else output2(" " + flags["WULFE_PURCHASED"] + " times");
				if(hasSiegwulfe())
				{
					if(siegwulfeIsDom()) output2(", Mistress");
					else if(chars["WULFE"].isBimbo()) output2(", Tease drone");
					else output2(", Combat drone");
					output2(", Crew member");
					if(hasSiegwulfeOnSelf()) output2(" (Following you)" + (pc.accessory is SiegwulfeItem ? ", Active" : ", Idle"));
					else output2(" (Onboard Ship)");
					if(chars["WULFE"].isEggWulfe()) output2(", Ovilium Upgrade Installed");
				}
				if(siegwulfeIsDom()) output2("\n<b>* Reaper Armaments, Siegwulfe, Current Lust:</b> " + wulfe.lust());
				if(flags["WULFE_SEXED_SUCK"] != undefined) output2("\n<b>* Reaper Armaments, Siegwulfe, Times She Sucked Your Dick:</b> " + flags["WULFE_SEXED_SUCK"]);
				if(flags["WULFE_SEXED_ORAL"] != undefined) output2("\n<b>* Reaper Armaments, Siegwulfe, Times She Gave You Oral:</b> " + flags["WULFE_SEXED_ORAL"]);
				if(flags["WULFE_SEXED_FUCK"] != undefined) output2("\n<b>* Reaper Armaments, Siegwulfe, Times Fucked Her Vagina:</b> " + flags["WULFE_SEXED_FUCK"]);
				if(flags["WULFE_SEXED_VAG"] != undefined) output2("\n<b>* Reaper Armaments, Siegwulfe, Times Fucked Your Vagina:</b> " + flags["WULFE_SEXED_VAG"]);
				if(flags["WULFE_SEXED_ANAL"] != undefined) output2("\n<b>* Reaper Armaments, Siegwulfe, Times Fucked Your Ass:</b> " + flags["WULFE_SEXED_ANAL"]);
				if(flags["WULFE_REQUESTED_ORAL"] != undefined) output2("\n<b>* Reaper Armaments, Siegwulfe, Times Swapped Oral:</b> " + flags["WULFE_REQUESTED_ORAL"]);
				if(flags["WULFE_REQUESTED_COCK"] != undefined) output2("\n<b>* Reaper Armaments, Siegwulfe, Times Let You Fuck Her Vagina:</b> " + flags["WULFE_REQUESTED_COCK"]);
			}
			// SukMastr 2000
			if(flags["SUKMASTRED"] != undefined) output2("\n<b>* SukMastr 2000, Times Used:</b> " + flags["SUKMASTRED"]);
			// Bubble Buddy
			if(flags["BUBBLE_BUDDIED"] != undefined) output2("\n<b>* TamaniCorp, Bubble Buddy, Times Used:</b> " + flags["BUBBLE_BUDDIED"]);
			// Egg Trainer
			if(flags["EGG_TRAINER_INSTALLED"] != undefined || pc.hasItemByClass(EggTrainer))
			{
				output2("\n<b>* TamaniCorp, Egg Trainer:</b>");
				if(flags["EGG_TRAINER_INSTALLED"] != undefined) output2(" Installed");
				else output2(" Acquired");
				if(flags["EGG_TRAINING_TIMES"] != undefined)
				{
					output2(", Used");
					if(flags["EGG_TRAINING_TIMES"] > 1) output2(" " + flags["EGG_TRAINING_TIMES"] + " times");
				}
				if(flags["EGG_TRAINING"] != undefined) output2("\n<b>* TamaniCorp, Egg Trainer, Training Level:</b> " + flags["EGG_TRAINING"]);
				if(flags["CARRY_TRAINING_TIMES"] != undefined) output2("\n<b>* TamaniCorp, Egg Trainer, Times Carry Training:</b> " + flags["CARRY_TRAINING_TIMES"]);
				if(flags["EGG_TRAINING_OVALASTING"] != undefined) output2("\n<b>* TamaniCorp, Egg Trainer, Times Used Ovalasting:</b> " + flags["EGG_TRAINING_OVALASTING"]);
			}
			miscCount++;
		}
		
		// ExtraMeet
		if(flags["EXTRAMEET_DATE"] != undefined)
		{
			output2("\n<b><u>ExtraMeet</u></b>");
			output2("\n<b>* ExtraMeet, Number of Dates:</b> " + flags["EXTRAMEET_DATE"]);
			if(flags["EXTRAMEET_BAIL"] != undefined) output2("\n<b>* ExtraMeet, Times You Bailed on a Date:</b> " + flags["EXTRAMEET_BAIL"]);
			if(flags["EXTRAMEET_DOH"] != undefined) output2("\n<b>* ExtraMeet, Times Your Date Bailed on You:</b> " + flags["EXTRAMEET_DOH"]);
			if(flags["EXTRAMEET_SEX"] != undefined) output2("\n<b>* ExtraMeet, Times You had Sex on a Date:</b> " + flags["EXTRAMEET_SEX"]);
			if(flags["EXTRAMEET_BOOBS_GIVE"] != undefined) output2("\n<b>* ExtraMeet, Times You Sucked some Titties on a Date:</b> " + flags["EXTRAMEET_BOOBS_GIVE"]);
			if(flags["EXTRAMEET_BOOBS_RCVD"] != undefined) output2("\n<b>* ExtraMeet, Times Your Titties got Sucked on a Date:</b> " + flags["EXTRAMEET_BOOBS_RCVD"]);
			if(flags["EXTRAMEET_FAP_GIVE"] != undefined) output2("\n<b>* ExtraMeet, Times You Fingered or gave Hand Job on a Date:</b> " + flags["EXTRAMEET_FAP_GIVE"]);
			if(flags["EXTRAMEET_FAP_RCVD"] != undefined) output2("\n<b>* ExtraMeet, Times You were Fingered or given a Hand Job on a Date:</b> " + flags["EXTRAMEET_FAP_RCVD"]);
			if(flags["EXTRAMEET_ORAL_GIVE"] != undefined) output2("\n<b>* ExtraMeet, Times You gave Oral on a Date:</b> " + flags["EXTRAMEET_ORAL_GIVE"]);
			if(flags["EXTRAMEET_ORAL_RCVD"] != undefined) output2("\n<b>* ExtraMeet, Times You got Oral on a Date:</b> " + flags["EXTRAMEET_ORAL_RCVD"]);
			if(flags["EXTRAMEET_CUNT_GIVE"] != undefined) output2("\n<b>* ExtraMeet, Times You Fucked a Pussy on a Date:</b> " + flags["EXTRAMEET_CUNT_GIVE"]);
			if(flags["EXTRAMEET_CUNT_RCVD"] != undefined) output2("\n<b>* ExtraMeet, Times Your Pussy got Fucked on a Date:</b> " + flags["EXTRAMEET_CUNT_RCVD"]);
			if(flags["EXTRAMEET_ASS_GIVE"] != undefined) output2("\n<b>* ExtraMeet, Times You Fucked an Ass on a Date:</b> " + flags["EXTRAMEET_ASS_GIVE"]);
			if(flags["EXTRAMEET_ASS_RCVD"] != undefined) output2("\n<b>* ExtraMeet, Times Your Ass got Fucked on a Date:</b> " + flags["EXTRAMEET_ASS_RCVD"]);
			
			miscCount++;
		}
		// Nothing recorded
		if(miscCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No miscellaneous information has been logged.</i>");
		}
	}
	
	output2("\n\n");
}

public function showCharLipRating(charName:String = ""):String
{
	if(charName == "" || chars[charName] == null) return "<i>Data unknown</i>";
	
	var txt:String = "";
	var lipsize:int = chars[charName].lipRating();
	
	if(lipsize < 0) txt += "None";
	else if(lipsize <= 1) txt += "Pencil-thin";
	else if(lipsize <= 2) txt += "Supple";
	else if(lipsize <= 3) txt += "Plump";
	else if(lipsize <= 4) txt += "Luscious";
	else if(lipsize <= 5) txt += "Bee-stung";
	else if(lipsize <= 6) txt += "Fat";
	else if(lipsize <= 7) txt += "Bloated";
	else if(lipsize <= 8) txt += "Whorish";
	else txt += "Universe-distorting";
	
	if(lipsize > 9) txt += " (" + formatFloat(lipsize, 3) + ")";
	
	return txt;
}
public function listCharGenitals(charName:String = ""):String
{
	if(charName == "" || chars[charName] == null) return "<i>Data unknown</i>";
	
	var txt:String = "";
	
	if(chars[charName].hasCock())
	{
		if(txt != "") txt += ", ";
		if(chars[charName].cockVirgin) txt += "Virgin " + GLOBAL.TYPE_NAMES[chars[charName].cocks[0].cType].toLowerCase() + " cock";
		else txt += GLOBAL.TYPE_NAMES[chars[charName].cocks[0].cType] + " cock";
		if(chars[charName].hasSheath(0) || chars[charName].hasKnot(0))
		{
			txt += " (";
			if(chars[charName].hasSheath(0)) txt += "sheathed";
			if(chars[charName].hasSheath(0) && chars[charName].hasKnot(0)) txt += " and ";
			if(chars[charName].hasKnot(0)) txt += "knotted";
			txt += ")";
		}
		if(chars[charName].hasStatusEffect("Uniball")) txt += " with a uniball";
		else if(chars[charName].balls == 1) txt += " with a testicle";
		else if(chars[charName].balls > 1) txt += " with " + num2Text(chars[charName].balls) + " balls";
	}
	if(chars[charName].hasVagina())
	{
		if(txt != "") txt += ", ";
		if(chars[charName].vaginalVirgin) txt += "Virgin " + GLOBAL.TYPE_NAMES[chars[charName].vaginas[0].type].toLowerCase() + " vagina";
		else if(chars[charName].vaginas[0].hymen) txt += "Unbroken " + GLOBAL.TYPE_NAMES[chars[charName].vaginas[0].type].toLowerCase() + " vagina";
		else txt += GLOBAL.TYPE_NAMES[chars[charName].vaginas[0].type] + " vagina";
		if(chars[charName].vaginas[0].clits == 1) txt += " with a clit";
		else if(chars[charName].vaginas[0].clits > 1) txt += " with " + num2Text(chars[charName].vaginas[0].clits) + " clits";
	}
	if(txt != "") txt += ", ";
	if(chars[charName].analVirgin) txt += "Virgin asshole";
	else txt += "Asshole";
	
	return txt;
}
public function listCharPerks(charName:String = ""):String
{
	if(charName == "" || chars[charName] == null) return "<i>Data unknown</i>";
	
	var txt:String = "";
	
	for(var i:int = 0; i < chars[charName].perks.length; i++)
	{
		if(chars[charName].perks[i].storageName != "")
		{
			if(txt != "") txt += ", ";
			txt += chars[charName].perks[i].storageName;
		}
	}
	
	//if(txt == "") return ("<i>" + chars[charName].capitalA + chars[charName].short + " " + (!chars[charName].isPlural ? "has" : "have") + " no perks!</i>");
	if(txt == "") return "<i>None</i>";
	
	return txt;
}

