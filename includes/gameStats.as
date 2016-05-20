/* Stat Screen Stuff */

// Modular Stats screen button menu
public function statsScreenMenu(currentFunc:Function):Boolean
{
	var showID:String = flags["TOGGLE_MENU_STATS"];
	
	// Personal
	if(showID == "Personal") addDisabledGhostButton(0, "Personal");
	else addGhostButton(0, "Personal", currentFunc, "Personal", "Personal Statistics", "Show information about yourself.");
	// Other
	if(showID == "Other") addDisabledGhostButton(1, "Other");
	else addGhostButton(1, "Other", currentFunc, "Other", "Other Statistics", "Show your other statistics.");
	// Encounters
	addGhostButton(2, "Encounters", displayEncounterLog, flags["TOGGLE_MENU_LOG"], "Encounters", "Show the encounters and other miscellaneous information.");
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
		output2("\n<b>* Occupation: </b>" + GLOBAL.CLASS_NAMES[pc.characterClass]);
		if(flags["PC_UPBRINGING"] != undefined) output2("\n<b>* Upbringing: </b>" + GLOBAL.UPBRINGING_NAMES[flags["PC_UPBRINGING"]]);
		if(pc.affinity != "none") output2("\n<b>* Affinity: </b>" + StringUtil.toTitleCase(pc.affinity));
		if(pc.originalRace != pc.race())
		{
			output2("\n<b>* Initial Race: </b>" + StringUtil.toTitleCase(pc.originalRace));
			output2("\n<b>* Current Race: </b>" + StringUtil.toTitleCase(pc.race()));
		}
		else output2("\n<b>* Race: </b>" + StringUtil.toTitleCase(pc.originalRace));
		output2("\n<b>* Height: </b>" + prettifyLength(pc.tallness));
		output2("\n<b>* Weight: </b>" + prettifyWeight(pc.fullBodyWeight()));
		output2("\n<b>* Sex: </b>");
		if(pc.hasCock() && !pc.hasVagina()) output2("Male");
		else if(!pc.hasCock() && pc.hasVagina()) output2("Female");
		else if(pc.hasCock() && pc.hasVagina()) output2("Hermaphrodite");
		else output2("Sexless");
		if(pc.hasStatusEffect("Force Fem Gender")) output2("\n<b>* Gender Preference:</b> Female");
		else if(pc.hasStatusEffect("Force Male Gender")) output2("\n<b>* Gender Preference:</b> Male");
		else output2("\n<b>* Gender Alignment: </b>" + pc.mfn("Male","Female",pc.mf("Androgynous, Male Pronouns","Androgynous, Female Pronouns")));
		output2("\n<b>* " + (pc.femininity >= 50 ? "Femininity" : "Masculinity") + ": </b>" + Math.abs(Math.round((pc.femininity - 50) * 2)) + " %");
		output2("\n<b>* Personality Score: </b>" + Math.round(pc.personality));
		if(pc.isNice()) output2(", Kind");
		if(pc.isMischievous()) output2(", Mischievous");
		if(pc.isAss()) output2(", Hard");
		if(pc.isBimbo()) output2(", Ditz");
		if(pc.isBro()) output2(", Brute");
		output2("\n<b>* Alcohol Tolerance: </b>" + pc.tolerance() + "/100");
		output2("\n<b>* Exhibitionism: </b>" + formatFloat(pc.exhibitionism(), 1) + "/100");
		output2("\n<b>* Carry Threshold: </b>" + prettifyWeight(pc.bodyStrength()));
		//if(pc.weightQ("full") > 0) output2(" (" + pc.weightQ("full") + " %)");
		// Head
		output2("\n<b><u>Head</u></b>");
		output2("\n<b>* Face: </b>" + GLOBAL.TYPE_NAMES[pc.faceType]);
		if(pc.faceFlags.length > 0)
		{
			for(i = 0; i < pc.faceFlags.length; i++)
			{
				output2(", " + GLOBAL.FLAG_NAMES[pc.faceFlags[i]]);
			}
		}
		if(pc.hasBeard())
		{
			output2("\n<b>* Beard, Length:</b>");
			if(pc.beardLength > 0.125)
			{
				output2(" " + prettifyLength(pc.beardLength));
				if(pc.beardStyle != 0) output2("\n<b>* Beard, Style: </b>" + StringUtil.toDisplayCase(pc.beardStyles()));
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
				if(pc.hairStyle != "null") output2("\n<b>* Hair, Style: </b>" + StringUtil.toDisplayCase(pc.hairStyle));
			}
			else output2(" Shaved");
		}
		else if(pc.skinType == GLOBAL.SKIN_TYPE_FUR) output2(" Fur");
		else output2(" None");
		if(pc.hasAntennae()) output2("\n<b>* Antennae:</b> " + pc.antennae + ", " + GLOBAL.TYPE_NAMES[pc.antennaeType]);
		output2("\n<b>* Ears:</b>");
		if(pc.hasLongEars()) output2(" " + prettifyLength(pc.earLength) + ",");
		output2(" " + GLOBAL.TYPE_NAMES[pc.earType]);
		if(pc.earsPierced != 0) output2("\n<b>* Ear Piercing: </b>" + pc.earsPierced + " " + StringUtil.toDisplayCase(pc.earsPShort));
		output2("\n<b>* Eyes:</b>");
		if(pc.eyeColor != "") output2(" " + StringUtil.toDisplayCase(pc.eyeColor) + ",");
		output2(" " + GLOBAL.TYPE_NAMES[pc.eyeType]);
		if(pc.eyebrowPierced != 0) output2("\n<b>* Eyebrow Piercing: </b>" + pc.eyebrowPierced + " " + StringUtil.toDisplayCase(pc.eyebrowPShort));
		if(pc.nosePierced != 0) output2("\n<b>* Nose Piercing: </b>" + pc.nosePierced + " " + StringUtil.toDisplayCase(pc.nosePShort));
		output2("\n<b>* Lips:</b>");
		var lipsize:int = pc.lipRating();
		if(lipsize <= 1) output2(" Pencil-thin");
		else if(lipsize <= 2) output2(" Supple");
		else if(lipsize <= 3) output2(" Plump");
		else if(lipsize <= 4) output2(" Luscious");
		else if(lipsize <= 5) output2(" Bee-stung");
		else if(lipsize <= 6) output2(" Fat");
		else if(lipsize <= 7) output2(" Bloated");
		else if(lipsize <= 8) output2(" Whorish");
		else output2(" Universe-distorting");
		if(pc.lipColor != "") output2(", " + StringUtil.toDisplayCase(pc.lipColor));
		if(pc.lipPierced != 0 || flags["MIMBRANE_FACE_APPEARANCE"] == 1 || flags["MIMBRANE_FACE_APPEARANCE"] == 2)
		{
			output2("\n<b>* Lip Accent:</b>");
			if(flags["MIMBRANE_FACE_APPEARANCE"] == 1) output2(" Beauty Marks");
			if(flags["MIMBRANE_FACE_APPEARANCE"] == 2) output2(" Pair of Piercings");
			if(pc.lipPierced != 0)
			{
				if(flags["MIMBRANE_FACE_APPEARANCE"] == 1 || flags["MIMBRANE_FACE_APPEARANCE"] == 2) output2(",");
				output2(" " + pc.lipPierced + " " + StringUtil.toDisplayCase(pc.lipPShort));
			}
		}
		output2("\n<b>* Tongue:</b>");
		if(pc.tongueFlags.length > 0)
		{
			for(i = 0; i < pc.tongueFlags.length; i++)
			{
				output2(" " + GLOBAL.FLAG_NAMES[pc.tongueFlags[i]] + ",");
			}
		}
		output2(" " + GLOBAL.TYPE_NAMES[pc.tongueType]);
		if(pc.tonguePierced != 0) output2("\n<b>* Tongue Piercing: </b>" + pc.tonguePierced + " " + StringUtil.toDisplayCase(pc.tonguePShort));
		if(pc.hasHorns())
		{
			output2("\n<b>* [pc.HornsNoun]:</b>");
			if(pc.hasStatusEffect("Horn Bumps")) output2(" Horn Bumps");
			else
			{
				if(pc.hornType == GLOBAL.TYPE_DEER) output2(" 2, " + prettifyLength(pc.hornLength) + ", " + GLOBAL.TYPE_NAMES[pc.hornType] + ", " + pc.horns + " Points");
				else 
				{
					output2(" " + pc.horns + ",");
					if(pc.hornLength > 0) output2(" " + prettifyLength(pc.hornLength));
					output2(" " + GLOBAL.TYPE_NAMES[pc.hornType]);
				}
			}
		}
		// Body
		output2("\n<b><u>Body</u></b>");
		output2("\n<b>* Tone: </b>" + pc.tone + "/" + pc.toneMax());
		output2("\n<b>* Thickness: </b>" + pc.thickness + "/" + pc.thicknessMax());
		output2("\n<b>* Skin:</b>");
		if(pc.skinFlags.length > 0)
		{
			for(i = 0; i < pc.skinFlags.length; i++)
			{
				output2(" " + GLOBAL.FLAG_NAMES[pc.skinFlags[i]] + ",");
			}
		}
		output2(" " + GLOBAL.SKIN_TYPE_NAMES[pc.skinType]);
		output2("\n<b>* Skin Tone: </b>" + StringUtil.toDisplayCase(pc.skinTone));
		if(pc.hasStatusEffect("Vanae Markings")) output2(", " + StringUtil.toDisplayCase(pc.skinAccent) + " Markings");
		if(pc.hasFur() || pc.hasLegFur() || pc.hasArmFlag(GLOBAL.FLAG_FURRED) || pc.hasTailFlag(GLOBAL.FLAG_FURRED)) output2("\n<b>* Fur Color: </b>" + StringUtil.toDisplayCase(pc.furColor));
		if(pc.hasScales() || pc.hasLegFlag(GLOBAL.FLAG_SCALED) || pc.hasArmFlag(GLOBAL.FLAG_SCALED) || pc.hasTailFlag(GLOBAL.FLAG_SCALED)) output2("\n<b>* Scale Color: </b>" + StringUtil.toDisplayCase(pc.scaleColor));
		if(pc.chitinColor() != "null") output2("\n<b>* Chitin Color: </b>" + StringUtil.toDisplayCase(pc.chitinColor()));
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
			output2(" " + GLOBAL.TYPE_NAMES[pc.tailType]);
		}
		if(pc.hasTailCock() || pc.hasTailCunt())
		{
			output2("\n<b>* Tail, Genital Type: </b>");
			if(pc.tailGenitalColor != "") output2(StringUtil.toDisplayCase(pc.tailGenitalColor) + ", ");
			output2(GLOBAL.TYPE_NAMES[pc.tailGenitalArg]);
			if(pc.hasTailCock()) output2(", " + GLOBAL.TAIL_GENTIAL_TYPE_NAMES[1]);
			if(pc.hasTailCunt()) output2(", " + GLOBAL.TAIL_GENTIAL_TYPE_NAMES[2]);
			if(pc.hasTailCock()) output2("\n<b>* Tail, Genital Volume: </b>" + prettifyVolume(pc.tailCockVolume()));
			if(pc.hasTailCunt()) output2("\n<b>* Tail, Genital Capacity: </b>" + prettifyVolume(pc.tailCuntCapacity()));
		}
		if(pc.hasGenitals())
		{
			output2("\n<b>* Genital Elasticity: </b>" + formatFloat(pc.elasticity, 3));
			output2("\n<b>* Genital Location: </b>" + GLOBAL.GENITAL_SPOT_NAMES[pc.genitalLocation()]);
			if(pc.hasStatusEffect("Genital Slit")) output2(", Genital Slit");
		}
		
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
				output2("\n<b>* Breasts, Weight: </b>" + prettifyWeight(pc.bodyPartWeight("breast")) + ", total");
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
				if(pc.nipplesPierced != 0) output2("\n<b>* Nipple Piercing: </b>" + pc.nipplesPierced + " " + StringUtil.toDisplayCase(pc.nipplesPShort));
			}
			// Lactation
			if(pc.canLactate())
			{
				output2("\n<b><u>Lactation</u></b>");
				output2("\n<b>* Milk, Type: </b>" + GLOBAL.FLUID_TYPE_NAMES[pc.milkType]);
				output2("\n<b>* Milk, Capacity: </b>" + formatFloat(pc.milkFullness, 1) + " %");
				output2("\n<b>* Milk, Current: </b>" + Math.round(pc.milkFullness/100 * pc.milkCapacity()) + " mLs");;
				output2("\n<b>* Milk, Max: </b>" + pc.milkCapacity() + " mLs");
				output2("\n<b>* Milk, Production Training: </b>" + formatFloat(pc.milkMultiplier, 1) + " %");
				output2("\n<b>* Milk, Production Bonus: </b>" + Math.round(pc.milkRate*100)/10 + " %");
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
					output2("\n<b>* Breast, Count: </b>" + pc.breastRows[x].breasts);
					if(pc.breastRows[x].breastRating() > 0)
					{
						output2("\n<b>* Breast, Size: </b>" + StringUtil.toTitleCase(pc.breastCup(x)));
						if(pc.breastRows[x].breasts != 1) output2("s");
						if(pc.breastRows[x].breastRating() >= 200) output2(" (" + formatFloat(pc.breastRows[x].breastRating(), 3) + ")");
						if(pc.breastRows[x].breastRatingHoneypotMod != 0) output2("\n<b>* Breast, Honeypot Size Rating: </b>" + formatFloat(pc.breastRows[x].breastRatingHoneypotMod, 3));
						if(pc.breastRows[x].breastRatingLactationMod != 0) output2("\n<b>* Breast, Lactation Size Rating: </b>" + formatFloat(pc.breastRows[x].breastRatingLactationMod, 3));
						output2("\n<b>* Breast Row, Weight: </b>" + prettifyWeight(pc.bodyPartWeight("breast", x)));
						if(pc.weightQ("breast", x) > 0) output2(" (" + pc.weightQ("breast", x) + " %)");
					}
					output2("\n<b>* Nipple, Type: </b>" + " " + GLOBAL.NIPPLE_TYPE_NAMES[pc.breastRows[x].nippleType]);
					if(pc.breastRows[x].fuckable()) output2(", Fuckable");
					if(pc.breastRows[x].nippleType == GLOBAL.NIPPLE_TYPE_DICK) output2("\n<b>* Nipple, Genital Type: </b>" + GLOBAL.TYPE_NAMES[pc.dickNippleType]);
					if(pc.breastRows[x].nippleType != GLOBAL.NIPPLE_TYPE_FUCKABLE && pc.breastRows[x].nippleType != GLOBAL.NIPPLE_TYPE_FLAT && pc.breastRows[x].nippleType != GLOBAL.NIPPLE_TYPE_INVERTED)
					{
						if(pc.breastRows[x].nippleType == GLOBAL.NIPPLE_TYPE_DICK)
						{
							output2("\n<b>* Nipple, Length, Flaccid: </b>" + prettifyLength(pc.nippleLength(0)));
							output2("\n<b>* Nipple, Length, Erect: </b>" + prettifyLength(pc.nippleLength(0) * pc.dickNippleMultiplier));
						}
						else output2("\n<b>* Nipple, Length: </b>" + prettifyLength(pc.nippleLength(x)));
						if(pc.breastRows[x].breasts != 1) output2(" each");
					}
					output2("\n<b>* Areola, Size: </b>" + prettifyLength(pc.nippleWidth(x)));
					if(pc.breastRows[x].breasts != 1) output2(" each");
				}
			}
		}
		
		// Genitals
		if(pc.hasCock() || pc.balls != 0)
		{
			output2("\n<b><u>Male Organs</u></b>");
			output2("\n<b>* Total Count:</b>");
			if(pc.cocks.length > 0)
			{
				output2(" " + pc.cocks.length + " Penis");
				if(pc.cocks.length != 1) output2("es");
			}
			if(pc.balls <= 0)
			{
				output2(", Prostate");
				output2("\n<b>* Prostate, Volume: </b>" + prettifyVolume(pc.ballVolume(), 1));
				output2("\n<b>* Prostate, Weight: </b>" + prettifyWeight(pc.bodyPartWeight("testicle")));
				if(pc.weightQ("testicle") > 0) output2(" (" + pc.weightQ("testicle") + " %)");
			}
			else if(pc.balls > 0)
			{
				if(pc.cocks.length > 0) output2(",");
				output2(" " + pc.balls + " Testicle");
				if(pc.balls != 1) output2("s");
				if(pc.hasStatusEffect("Uniball")) output2(", Uniball");
				if(pc.statusEffectv4("Vanae Markings") > 0) output2(", " + StringUtil.toDisplayCase(pc.skinAccent) + " Markings");
				output2("\n<b>* Testicle, Size: </b>" + prettifyLength(pc.ballDiameter()) + " across, " + prettifyLength(pc.ballSize()) + " around");
				if(pc.balls != 1) output2(", each");
				output2("\n<b>* Testicle, Volume: </b>" + prettifyVolume(pc.ballVolume(), 1));
				if(pc.balls != 1) output2(", each");
				output2("\n<b>* Testicle, Weight: </b>" + prettifyWeight(pc.bodyPartWeight("testicle")));
				if(pc.balls != 1) output2(", total");
				if(pc.weightQ("testicle") > 0) output2(" (" + pc.weightQ("testicle") + " %)");
			}
			output2("\n<b>* Penis, Virginity:</b>");
			if(pc.cockVirgin) output2(" Virgin");
			else output2(" Taken");
			if(pc.cocks.length > 1)
			{
				output2("\n<b>* Penis, Weight: </b>" + prettifyWeight(pc.bodyPartWeight("penis")));
				if(pc.cocks.length > 1) output2(", total");
				if(pc.weightQ("penis") > 0) output2(" (" + pc.weightQ("penis") + " %)");
			}
			// Cum Stats
			output2("\n<b>* Cum, Type: </b>" + GLOBAL.FLUID_TYPE_NAMES[pc.cumType]);
			output2("\n<b>* Cum, Capacity:</b>");
			if(pc.ballSizeRaw > 0 && pc.perkv1("'Nuki Nuts") > 0) output2(" " + formatFloat(pc.ballFullness + ((pc.perkv1("'Nuki Nuts")/pc.ballSizeRaw) * 100), 1) + " %");
			else output2(" " + formatFloat(pc.ballFullness, 1) + " %");
			output2("\n<b>* Cum, Current Internal: </b>" + pc.currentCum() + " mLs");
			output2("\n<b>* Cum, Probable Ejaculation: </b> " + pc.cumQ() + " mLs");
			output2("\n<b>* Cum, Max: </b>" + pc.maxCum() + " mLs");
			output2("\n<b>* Refractory Rate: </b>" + Math.round(pc.refractoryRate*1000)/10 + " %");
			if(pc.virility() <= 0) output2("\n<b>* Virility:</b> Infertile");
			else
			{
				output2("\n<b>* Virility: </b>" + Math.round(pc.virility()*1000)/10 + " %");
				output2("\n<b>* Virility, Speed Modifier: </b>" + Math.round(pc.pregnancyIncubationBonusFather()*1000)/10 + " %");
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
					output2("\n<b>* Length, Flaccid: </b>" + prettifyLength(pc.cLengthFlaccid(x)));
					output2("\n<b>* Length, Current: </b>" + prettifyLength(pc.cLengthFlaccid(x, true)));
					output2("\n<b>* Length, Erect: </b>" + prettifyLength(pc.cLength(x)));
					output2("\n<b>* Thickness: </b>" + prettifyLength(pc.cThickness(x)));
					if(pc.hasKnot(x)) output2("\n<b>* Knot Thickness: </b>" + prettifyLength(pc.knotThickness(x)));
					if(pc.cockVolume(x, false) != pc.cockVolume(x))
					{
						output2("\n<b>* Volume, Physical: </b>" + prettifyVolume(pc.cockVolume(x, false)));
						output2("\n<b>* Volume, Effective: </b>" + prettifyVolume(pc.cockVolume(x)));
					}
					else output2("\n<b>* Volume: </b>" + prettifyVolume(pc.cockVolume(x)));
					output2("\n<b>* Capacity: </b>" + prettifyVolume(pc.cockCapacity(x)));
					output2("\n<b>* Weight: </b>" + prettifyWeight(pc.bodyPartWeight("penis", x)));
					if(pc.weightQ("penis", x) > 0) output2(" (" + pc.weightQ("penis", x) + " %)");
					if(pc.cocks[x].pierced != 0) output2("\n<b>* Piercing: </b>" + pc.cocks[x].pierced + " " + StringUtil.toDisplayCase(pc.cocks[x].pShort));
					if(pc.cocks[x].sock != "") output2("\n<b>* Sock: </b>" + StringUtil.toDisplayCase(pc.cocks[x].sock));
				}
			}
		}
		if(pc.hasVagina())
		{
			output2("\n<b><u>Female Organs</u></b>");
			output2("\n<b>* Total Count:</b>");
			if(pc.vaginas.length != 0)
			{
				output2(" " + pc.vaginas.length + " Vagina");
				if(pc.vaginas.length != 1) output2("s");
			}
			if(pc.totalClits() > 0)
			{
				if(pc.vaginas.length != 0) output2(",");
				output2(" " + pc.totalClits() +" Clit");
				if(pc.totalClits() != 1) output2("s");
				if(pc.clitLength != 0) output2("\n<b>* Clitoris, Length: </b>" + prettifyLength(pc.clitLength));
				if(pc.totalClits() != 1) output2(", each");
				if(pc.vaginas.length > 1)
				{
					output2("\n<b>* Clitoris, Weight: </b>" + prettifyWeight(pc.bodyPartWeight("clitoris")));
					if(pc.totalClits() != 1) output2(", total");
					if(pc.weightQ("clitoris") > 0) output2(" (" + pc.weightQ("clitoris") + " %)");
				}
			}
			output2("\n<b>* Vagina, Virginity:</b>");
			if(pc.vaginalVirgin) output2(" Virgin");
			else output2(" Taken");
			// Girlcum Stats
			output2("\n<b>* Girlcum, Type: </b>" + GLOBAL.FLUID_TYPE_NAMES[pc.girlCumType]);
			output2("\n<b>* Girlcum, Probable Ejaculation: </b> " + pc.girlCumQ() + " mLs");
			// Fertility
			if(pc.fertility() <= 0) output2("\n<b>* Fertility:</b> Infertile");
			else
			{
				output2("\n<b>* Fertility: </b>" + Math.round(pc.fertility()*1000)/10 + " %");
				output2("\n<b>* Fertility, Speed Modifier: </b>" + Math.round(pc.pregnancyIncubationBonusMother()*1000)/10 + " %");
				output2("\n<b>* Fertility, Quantity Bonus: </b>" + Math.round(pc.pregnancyMultiplier()));
				if(pc.hasStatusEffect("Venus Pitcher Seed Residue")) output2("\n<b>* Fertility, Venus Pitcher Seed Residue, Time Left: </b>" + prettifyMinutes(pc.getStatusMinutes("Venus Pitcher Seed Residue")));
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
					if(pc.vaginas[x].bonusCapacity == 0) output2("\n<b>* Capacity: </b>" + prettifyVolume(pc.vaginalCapacity(x)));
					else
					{
						output2("\n<b>* Capacity, Bonus: </b>" + prettifyVolume(pc.vaginas[x].bonusCapacity));
						output2("\n<b>* Capacity, Effective: </b>" + prettifyVolume(pc.vaginalCapacity(x)));
					}
					output2("\n<b>* Looseness Level: </b>" + formatFloat(pc.vaginas[x].looseness(), 3));
					output2("\n<b>* Wetness Level: </b>" + formatFloat(pc.vaginas[x].wetness(), 3));
					if(pc.vaginas[x].wetness() >= 4) output2(", Squirter");
					if(pc.vaginas[x].clits > 0)
					{
						output2("\n<b>* Clitoris: </b>" + pc.vaginas[x].clits);
						output2("\n<b>* Clitoris, Weight: </b>" + prettifyWeight(pc.bodyPartWeight("clitoris", x)));
						if(pc.vaginas[x].clits != 1) output2(", total");
						if(pc.weightQ("clitoris", x) > 0) output2(" (" + pc.weightQ("clitoris", x) + " %)");
					}
					if(pc.vaginas[x].clitPierced != 0) output2("\n<b>* Clit Piercing: </b>" + pc.vaginas[x].clitPierced + " " + StringUtil.toDisplayCase(pc.vaginas[x].clitPShort));
					if(pc.vaginas[x].labiaPierced != 0) output2("\n<b>* Labia Piercing: </b>" + pc.vaginas[x].labiaPierced + " " + StringUtil.toDisplayCase(pc.vaginas[x].labiaPShort));
				}
			}
		}
		if(pc.hasOvipositor())
		{
			output2("\n<b><u>Ovipositor Organs</u></b>");
			output2("\n<b>* Total Count: </b>" + pc.totalOvipositors());
			if(pc.statusEffectv1("Nyrea Eggs") > 0) output2("\n<b>* Fertility, Nyrean Eggs, Total: </b>" + pc.statusEffectv1("Nyrea Eggs"));
		}
		
		// Belly
		output2("\n<b><u>Belly</u></b>");
		if(pc.isPregnant()) output2("\n<b>* Belly, Size Rating, Total:</b>");
		else output2("\n<b>* Belly, Size Rating:</b>");
		output2(" " + formatFloat(pc.bellyRating(), 3));
		output2("\n<b>* Belly, Weight: </b>" + prettifyWeight(pc.bodyPartWeight("belly")));
		if(pc.weightQ("belly") > 0) output2(" (" + pc.weightQ("belly") + " %)");
		if(pc.statusEffectv1("Orally-Filled") > 0) output2("\n<b>* Cumflation, Oral: </b>" + GLOBAL.FLUID_TYPE_NAMES[pc.statusEffectv3("Orally-Filled")] + ", " + Math.round(pc.statusEffectv1("Orally-Filled")) + " mLs");
		if(pc.statusEffectv1("Anally-Filled") > 0) output2("\n<b>* Cumflation, Anal: </b>" + GLOBAL.FLUID_TYPE_NAMES[pc.statusEffectv3("Anally-Filled")] + ", " + Math.round(pc.statusEffectv1("Anally-Filled")) + " mLs");
		if(pc.statusEffectv1("Vaginally-Filled") > 0) output2("\n<b>* Cumflation, Vaginal: </b>" + GLOBAL.FLUID_TYPE_NAMES[pc.statusEffectv3("Vaginally-Filled")] + ", " + Math.round(pc.statusEffectv1("Vaginally-Filled")) + " mLs");
		if(pc.isPregnant())
		{
			output2("\n<b>* Active Pregnancies, Total: </b>" + pc.totalPregnancies());
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
					output2("\n<b>* Belly, Size Rating: </b>" + formatFloat(pData.pregnancyBellyRatingContribution, 3));
					output2("\n<b>* Pregnancy, Type:</b>");
					if(pData.pregnancyType == "HumanPregnancy") output2(" Human");
					else if(pData.pregnancyType == "VenusPitcherSeedCarrier") output2(" Venus Pitcher, Seed");
					else if(pData.pregnancyType == "VenusPitcherFertilizedSeedCarrier") output2(" Venus Pitcher, Seed, Fertilized");
					else if(pData.pregnancyType == "NyreaEggPregnancy") output2(" Nyrean Huntress, Eggs");
					else if(pData.pregnancyType == "RoyalEggPregnancy") output2(" Royal Nyrea, Eggs");
					else if(pData.pregnancyType == "RenvraEggPregnancy") output2(" Renvra, Eggs");
					else if(pData.pregnancyType == "RenvraFullPregnancy") output2(" Renvra");
					else if(pData.pregnancyType == "CockvinePregnancy") output2(" Cockvine");
					else if(pData.pregnancyType == "DeepQueenPregnancy") output2(" Water Queen");
					else if(pData.pregnancyType == "OviliumEggPregnancy") output2(" Ovilium, Eggs");
					else if(pData.pregnancyType == "EggTrainerCarryTraining") output2(" Egg Trainer, Eggs");
					else if(pData.pregnancyType == "EggTrainerFauxPreg") output2(" Egg Trainer");
					else if(pData.pregnancyType == "PsychicTentacles") output2(" Psychic Tentacle Beast");
					else if(pData.pregnancyType == "SydianPregnancy") output2(" Sydian");
					else output2(" <i>Unknown</i>");
					if(pData.pregnancyIncubation > -1)
					{
						var pIncubation:int = pData.pregnancyIncubation;
						var pIncubationMulti:Number = pData.pregnancyIncubationMulti;
						output2("\n<b>* Pregnancy, Gestation Time: </b>" + prettifyMinutes(Math.floor(pIncubation * (1 / pIncubationMulti))));
						if(pIncubationMulti != 1) output2("\n<b>* Pregnancy, Incubation Speed Modifier: </b>" + Math.round(pIncubationMulti * 1000)/10 + " %");
					}
					if(pData.pregnancyQuantity > 0)
					{
						var pChildType:int = PregnancyManager.getPregnancyChildType(pc, x);
						output2("\n<b>* Pregnancy,");
						if(pChildType == GLOBAL.CHILD_TYPE_SEED) output2(" Seedling");
						else if(pChildType == GLOBAL.CHILD_TYPE_EGGS) output2(" Egg");
						else output2(" Offspring");
						output2(" Count: </b>" + pData.pregnancyQuantity);
					}
				}
			}
		}
		
		// Ass
		output2("\n<b><u>Ass</u></b>");
		output2("\n<b>* Hip, Size Rating: </b>" + formatFloat(pc.hipRating(), 3));
		output2("\n<b>* Butt, Size Rating: </b>" + formatFloat(pc.buttRating(), 3));
		output2("\n<b>* Butt, Weight: </b>" + prettifyWeight(pc.bodyPartWeight("butt")));
		if(pc.weightQ("butt") > 0) output2(" (" + pc.weightQ("butt") + " %)");
		output2("\n<b>* Anus:</b> 1, Asshole");
		output2("\n<b>* Anus, Virginity:</b>");
		if(pc.analVirgin) output2(" Virgin");
		else output2(" Taken");
		if(pc.ass.bonusCapacity == 0) output2("\n<b>* Anus, Capacity: </b>" + prettifyVolume(pc.analCapacity()));
		else
		{
			output2("\n<b>* Anus, Capacity, Bonus: </b>" + prettifyVolume(pc.ass.bonusCapacity));
			output2("\n<b>* Anus, Capacity, Effective: </b>" + prettifyVolume(pc.analCapacity()));
		}
		output2("\n<b>* Anus, Looseness Level: </b>" + formatFloat(pc.ass.looseness(), 3));
		output2("\n<b>* Anus, Wetness Level: </b>" + formatFloat(pc.ass.wetness(), 3));
		
		// Sexuality
		output2("\n<b><u>Sexuality</u></b>");
		output2("\n<b>* Orgasms, Total: </b>" + StatTracking.getStat("sex/player/orgasms"));
		if(pc.sexualPreferences._sexPrefs.length > 0)
		{
			for(i = 0; i < GLOBAL.MAX_SEXPREF_VALUE; i++)
			{
				if(pc.sexualPreferences.getPref(i) != 0)
				{
					output2("\n<b>* Preferences, " + StringUtil.toDisplayCase(GLOBAL.SEXPREF_DESCRIPTORS[i]) + ":</b>");
					if(pc.sexualPreferences.getPref(i) >= GLOBAL.REALLY_LIKES_SEXPREF - 0.33335) output2(" Really likes!");
					else if(pc.sexualPreferences.getPref(i) >= GLOBAL.KINDA_LIKES_SEXPREF - 0.29165) output2(" Kinda likes!");
					else if(pc.sexualPreferences.getPref(i) >= GLOBAL.KINDA_DISLIKES_SEXPREF - 0.125) output2(" Dislikes!");
					else if(pc.sexualPreferences.getPref(i) >= GLOBAL.REALLY_DISLIKES_SEXPREF - 0.5) output2(" Dislikes a lot!");
					else output2(" <i>Unknown</i>");
				}
			}
		}
	}
	
	// Other
	if(showID == "Other" || showID == "All")
	{
		//======CORE STATISTICS=====//
		output2("\n\n" + blockHeader("Core Statistics", false));
		output2("\n<b><u>Active Stats</u></b>");
		output2("\n<b>* " + StringUtil.capitalize(pc.shieldDisplayName) + ": </b>" + "0/" + pc.shieldsRaw + "/" + pc.shieldsMax());
		output2("\n<b>* HP: </b>" + "0/" + pc.HP() + "/" + pc.HPMax());
		output2("\n<b>* Lust: </b>" + pc.lustMin() + "/" + pc.lust() + "/" + pc.lustMax());
		output2("\n<b>* Energy: </b>" + pc.energyMin() + "/" + pc.energy() + "/" + pc.energyMax());
		output2("\n<b><u>Passive Stats</u></b>");
		output2("\n<b>* Physique: </b>" + "0/" + pc.physique() + "/" + pc.physiqueMax());
		if(pc.physiqueMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.physiqueMod, 3)) + ")");
		output2("\n<b>* Reflexes: </b>" + "0/" + pc.reflexes() + "/" + pc.reflexesMax());
		if(pc.reflexesMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.reflexesMod, 3)) + ")");
		output2("\n<b>* Aim: </b>" + "0/" + pc.aim() + "/" + pc.aimMax());
		if(pc.aimMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.aimMod, 3)) + ")");
		output2("\n<b>* Intelligence: </b>" + "0/" + pc.intelligence() + "/" + pc.intelligenceMax());
		if(pc.intelligenceMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.intelligenceMod, 3)) + ")");
		output2("\n<b>* Willpower: </b>" + "0/" + pc.willpower() + "/" + pc.willpowerMax());
		if(pc.willpowerMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.willpowerMod, 3)) + ")");
		output2("\n<b>* Libido: </b>" + pc.libidoMin() + "/" + pc.libido() + "/" + pc.libidoMax());
		if(pc.libidoMod != 0) output2(" (" + StringUtil.printPlusMinus(formatFloat(pc.libidoMod, 3)) + ")");
		
		//======COMBAT STATISTICS=====//
		output2("\n\n" + blockHeader("Combat Statistics", false));
		// Physical Combat
		output2("\n<b><u>Physical Combat</u></b>");
		output2("\n<b>* Accuracy Bonus, Melee: </b>" + pc.attack(true) + " %");
		output2("\n<b>* Accuracy Bonus, Ranged: </b>" + pc.attack(false) + " %");
		output2("\n<b>* Critical Chance, Melee: </b>" + pc.critBonus(true) + " %");
		output2("\n<b>* Critical Chance, Ranged: </b>" + pc.critBonus(false) + " %");
		output2("\n<b>* Defense, Armor: </b>" + pc.defense());
		output2("\n<b>* Defense, Shields: </b>" + pc.shieldDefense());
		output2("\n<b>* Evasion Bonus: </b>" + pc.evasion() + " %");
		output2("\n<b>* Fortification: </b>" + pc.fortification());
		// Melee
		if(pc.meleeDamage().unresistable_hp.damageValue != 0)
			output2("\n<b>* Melee Damage, HP: </b>" + pc.meleeDamage().unresistable_hp.damageValue);
		if(pc.meleeDamage().kinetic.damageValue != 0)
			output2("\n<b>* Melee Damage, Kinetic: </b>" + pc.meleeDamage().kinetic.damageValue);
		if(pc.meleeDamage().electric.damageValue != 0)
			output2("\n<b>* Melee Damage, Electric: </b>" + pc.meleeDamage().electric.damageValue);
		if(pc.meleeDamage().burning.damageValue != 0)
			output2("\n<b>* Melee Damage, Burning: </b>" + pc.meleeDamage().burning.damageValue);
		if(pc.meleeDamage().freezing.damageValue != 0)
			output2("\n<b>* Melee Damage, Freezing: </b>" + pc.meleeDamage().freezing.damageValue);
		if(pc.meleeDamage().corrosive.damageValue != 0)
			output2("\n<b>* Melee Damage, Corrosive: </b>" + pc.meleeDamage().corrosive.damageValue);
		if(pc.meleeDamage().poison.damageValue != 0)
			output2("\n<b>* Melee Damage, Poison: </b>" + pc.meleeDamage().poison.damageValue);
		// Ranged
		if(pc.rangedDamage().unresistable_hp.damageValue != 0)
			output2("\n<b>* Ranged Damage, HP: </b>" + pc.rangedDamage().unresistable_hp.damageValue);
		if(pc.rangedDamage().kinetic.damageValue != 0)
			output2("\n<b>* Ranged Damage, Kinetic: </b>" + pc.rangedDamage().kinetic.damageValue);
		if(pc.rangedDamage().electric.damageValue != 0)
			output2("\n<b>* Ranged Damage, Electric: </b>" + pc.rangedDamage().electric.damageValue);
		if(pc.rangedDamage().burning.damageValue != 0)
			output2("\n<b>* Ranged Damage, Burning: </b>" + pc.rangedDamage().burning.damageValue);
		if(pc.rangedDamage().freezing.damageValue != 0)
			output2("\n<b>* Ranged Damage, Freezing: </b>" + pc.rangedDamage().freezing.damageValue);
		if(pc.rangedDamage().corrosive.damageValue != 0)
			output2("\n<b>* Ranged Damage, Corrosive: </b>" + pc.rangedDamage().corrosive.damageValue);
		if(pc.rangedDamage().poison.damageValue != 0)
			output2("\n<b>* Ranged Damage, Poison: </b>" + pc.rangedDamage().poison.damageValue);
		// Resist
		if((pc.getShieldResistances().unresistable_hp.resistanceValue + pc.getHPResistances().unresistable_hp.resistanceValue) != 0)
			output2("\n<b>* Resistance, HP: </b>" + (pc.getShieldResistances().unresistable_hp.resistanceValue + pc.getHPResistances().unresistable_hp.resistanceValue) + " %");
		if((pc.getShieldResistances().kinetic.resistanceValue + pc.getHPResistances().kinetic.resistanceValue) != 0)
			output2("\n<b>* Resistance, Kinetic: </b>" + (pc.getShieldResistances().kinetic.resistanceValue + pc.getHPResistances().kinetic.resistanceValue) + " %");
		if((pc.getShieldResistances().electric.resistanceValue + pc.getHPResistances().electric.resistanceValue) != 0)
			output2("\n<b>* Resistance, Electric: </b>" + (pc.getShieldResistances().electric.resistanceValue + pc.getHPResistances().electric.resistanceValue) + " %");
		if((pc.getShieldResistances().burning.resistanceValue + pc.getHPResistances().burning.resistanceValue) != 0)
			output2("\n<b>* Resistance, Burning: </b>" + (pc.getShieldResistances().burning.resistanceValue + pc.getHPResistances().burning.resistanceValue) + " %");
		if((pc.getShieldResistances().freezing.resistanceValue + pc.getHPResistances().freezing.resistanceValue) != 0)
			output2("\n<b>* Resistance, Freezing: </b>" + (pc.getShieldResistances().freezing.resistanceValue + pc.getHPResistances().freezing.resistanceValue) + " %");
		if((pc.getShieldResistances().corrosive.resistanceValue + pc.getHPResistances().corrosive.resistanceValue) != 0)
			output2("\n<b>* Resistance, Corrosive: </b>" + (pc.getShieldResistances().corrosive.resistanceValue + pc.getHPResistances().corrosive.resistanceValue) + " %");
		if((pc.getShieldResistances().poison.resistanceValue + pc.getHPResistances().poison.resistanceValue) != 0)
			output2("\n<b>* Resistance, Poison: </b>" + (pc.getShieldResistances().poison.resistanceValue + pc.getHPResistances().poison.resistanceValue) + " %");
		// Sexual Combat
		output2("\n<b><u>Sexual Combat</u></b>");
		// Melee
		if(pc.meleeDamage().unresistable_lust.damageValue != 0)
			output2("\n<b>* Melee Damage, Lust: </b>" + pc.meleeDamage().unresistable_lust.damageValue);
		if(pc.meleeDamage().psionic.damageValue != 0)
			output2("\n<b>* Melee Damage, Psionic: </b>" + pc.meleeDamage().psionic.damageValue);
		if(pc.meleeDamage().drug.damageValue != 0)
			output2("\n<b>* Melee Damage, Drug: </b>" + pc.meleeDamage().drug.damageValue);
		if(pc.meleeDamage().pheromone.damageValue != 0)
			output2("\n<b>* Melee Damage, Pheromone: </b>" + pc.meleeDamage().pheromone.damageValue);
		if(pc.meleeDamage().tease.damageValue != 0)
			output2("\n<b>* Melee Damage, Tease: </b>" + pc.meleeDamage().tease.damageValue);
		// Ranged
		if(pc.rangedDamage().unresistable_lust.damageValue != 0)
			output2("\n<b>* Ranged Damage, Lust: </b>" + pc.rangedDamage().unresistable_lust.damageValue);
		if(pc.rangedDamage().psionic.damageValue != 0)
			output2("\n<b>* Ranged Damage, Psionic: </b>" + pc.rangedDamage().psionic.damageValue);
		if(pc.rangedDamage().drug.damageValue != 0)
			output2("\n<b>* Ranged Damage, Drug: </b>" + pc.rangedDamage().drug.damageValue);
		if(pc.rangedDamage().pheromone.damageValue != 0)
			output2("\n<b>* Ranged Damage, Pheromone: </b>" + pc.rangedDamage().pheromone.damageValue);
		if(pc.rangedDamage().tease.damageValue != 0)
			output2("\n<b>* Ranged Damage, Tease: </b>" + pc.rangedDamage().tease.damageValue);
		// Resist
		if(pc.getLustResistances().unresistable_lust.resistanceValue != 0)
			output2("\n<b>* Resistance, Lust: </b>" + pc.getLustResistances().unresistable_lust.resistanceValue + " %");
		if(pc.getLustResistances().psionic.resistanceValue != 0)
			output2("\n<b>* Resistance, Psionic: </b>" + pc.getLustResistances().psionic.resistanceValue + " %");
		if(pc.getLustResistances().drug.resistanceValue != 0)
			output2("\n<b>* Resistance, Drug: </b>" + pc.getLustResistances().drug.resistanceValue + " %");
		if(pc.getLustResistances().pheromone.resistanceValue != 0)
			output2("\n<b>* Resistance, Pheromone: </b>" + pc.getLustResistances().pheromone.resistanceValue + " %");
		if(pc.getLustResistances().tease.resistanceValue != 0)
			output2("\n<b>* Resistance, Tease: </b>" + pc.getLustResistances().tease.resistanceValue + " %");
		// Sexy Stuff
		output2("\n<b>* Sexiness: </b>" + pc.sexiness());
		var teases:Array = [-1, -1, -1, -1];
		if(flags["TIMES_BUTT_TEASED"] != undefined) teases[0] = flags["TIMES_BUTT_TEASED"];
		if(flags["TIMES_CHEST_TEASED"] != undefined) teases[1] = flags["TIMES_CHEST_TEASED"];
		if(flags["TIMES_CROTCH_TEASED"] != undefined) teases[2] = flags["TIMES_CROTCH_TEASED"];
		if(flags["TIMES_HIPS_TEASED"] != undefined) teases[3] = flags["TIMES_HIPS_TEASED"];
		for(i = 0; i < teases.length; i++)
		{
			if(teases[i] > 100) teases[i] = 100;
		}
		if(teases[0] >= 0) output2("\n<b>* Tease Skill, Ass: </b>" + teases[0] + "/100");
		if(teases[1] >= 0) output2("\n<b>* Tease Skill, Chest: </b>" + teases[1] + "/100");
		if(teases[2] >= 0) output2("\n<b>* Tease Skill, Crotch: </b>" + teases[2] + "/100");
		if(teases[3] >= 0) output2("\n<b>* Tease Skill, Hips: </b>" + teases[3] + "/100");
		// Performance
		output2("\n<b><u>Combat Performance</u></b>");
		output2("\n<b>* Combat, Losses: </b>" + StatTracking.getStat("combat/losses"));
		output2("\n<b>* Combat, Victories: </b>" + StatTracking.getStat("combat/wins"));
		if(flags["TIMES_BUTT_TEASED"] != undefined) output2("\n<b>* Tease, Times Used Ass: </b>" + flags["TIMES_BUTT_TEASED"]);
		if(flags["TIMES_CHEST_TEASED"] != undefined) output2("\n<b>* Tease, Times Used Chest: </b>" + flags["TIMES_CHEST_TEASED"]);
		if(flags["TIMES_CROTCH_TEASED"] != undefined) output2("\n<b>* Tease, Times Used Crotch: </b>" + flags["TIMES_CROTCH_TEASED"]);
		if(flags["TIMES_HIPS_TEASED"] != undefined) output2("\n<b>* Tease, Times Used Hips: </b>" + flags["TIMES_HIPS_TEASED"]);
		
		//======NPC STATISTICS=====//
		
		/*
		output2("\n\n" + blockHeader("Interpersonal Statistics", false));
		
		Moved all these to their respective sections under "Encounters"!
		
		*/
		
		//=====GENERAL STATS=====//
		output2("\n\n" + blockHeader("General Statistics", false));
		// Crew
		output2("\n<b><u>Crew</u></b>");
		output2("\n<b>* Total Recruited: </b>" + crewRecruited(true));
		output2("\n<b>* Total Onboard: </b>" + crew(true, true));
		// Traveling
		output2("\n<b><u>Travel</u></b>");
		output2("\n<b>* Time Spent Moving From Room to Room: </b>" + prettifyMinutes(StatTracking.getStat("movement/time travelled")));
		output2("\n<b>* Time Spent Flying: </b>" + prettifyMinutes(StatTracking.getStat("movement/time flown")));
		// Sleeping partner
		var sleepingPartner:String = "";
		if(flags["CREWMEMBER_SLEEP_WITH"] == undefined) sleepingPartner = "";
		else if(flags["CREWMEMBER_SLEEP_WITH"] == "BESS") sleepingPartner = "[bess.name]";
		else sleepingPartner = StringUtil.toTitleCase(flags["CREWMEMBER_SLEEP_WITH"].toLowerCase());
		// Virgin booties claimed
		var totalVirginitiesTaken:Number = 0;
		if(StatTracking.getStat("characters/maiden vanae/cherrys popped") > 0) totalVirginitiesTaken += StatTracking.getStat("characters/maiden vanae/cherrys popped");
		if(!chars["ANNO"].analVirgin) totalVirginitiesTaken++;
		if(!chars["EMBRY"].analVirgin) totalVirginitiesTaken++;
		if(!chars["EMBRY"].cockVirgin) totalVirginitiesTaken++;
		if(!chars["EMBRY"].vaginalVirgin) totalVirginitiesTaken++;
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
		if(!ainaIsVirgin()) totalVirginitiesTaken++;
		if(sleepingPartner != "" || totalVirginitiesTaken > 0)
		{
			output2("\n<b><u>Sexploration</u></b>");
			if(sleepingPartner != "") output2("\n<b>* Sleeping With: </b>" + sleepingPartner);
			if(totalVirginitiesTaken > 0) output2("\n<b>* Virginities Claimed: </b>" + totalVirginitiesTaken);
		}
		
		//Births header!
		var totalOffspring:Number = StatTracking.getStat("pregnancy/total births");
		var totalProduce:Number = 0;
		totalProduce += StatTracking.getStat("pregnancy/ovilium eggs laid");
		totalProduce += StatTracking.getStat("pregnancy/egg trainer eggs laid");
		totalProduce += StatTracking.getStat("pregnancy/unfertilized venus pitcher seeds");
		if((totalOffspring + totalProduce) > 0)
		{
			output2("\n\n" + blockHeader("Reproduction Statistics", false));
			if(totalOffspring)
			{
				output2("\n<b><u>Offspring</u></b>");
				output2("\n<b>* Total: </b>" + totalOffspring);
				// Mother
				if(StatTracking.getStat("pregnancy/cockvine seedlings birthed") > 0)
					output2("\n<b>* Births, Cockvines: </b>" + StatTracking.getStat("pregnancy/cockvine seedlings birthed"));
				if(StatTracking.getStat("pregnancy/cockvine seedlings captured") > 0)
					output2("\n<b>* Births, Cockvines, Captured: </b>" + StatTracking.getStat("pregnancy/cockvine seedlings captured"));
				var nyreanEggs:Number = 0;
				if(StatTracking.getStat("pregnancy/nyrea eggs") > 0)
				{
					nyreanEggs += StatTracking.getStat("pregnancy/nyrea eggs");
					output2("\n<b>* Births, Nyrean Eggs, Huntress: </b>" + StatTracking.getStat("pregnancy/nyrea eggs"));
				}
				if(StatTracking.getStat("pregnancy/renvra eggs") > 0)
				{
					nyreanEggs += StatTracking.getStat("pregnancy/renvra eggs");
					output2("\n<b>* Births, Nyrean Eggs, Renvra: </b>" + StatTracking.getStat("pregnancy/renvra eggs"));
				}
				if(StatTracking.getStat("pregnancy/royal nyrea eggs") > 0)
				{
					nyreanEggs += StatTracking.getStat("pregnancy/royal nyrea eggs");
					output2("\n<b>* Births, Nyrean Eggs, Royal: </b>" + StatTracking.getStat("pregnancy/royal nyrea eggs"));
				}
				if(nyreanEggs > 0)
					output2("\n<b>* Births, Nyrean Eggs, Total: </b>" + nyreanEggs);
				if(StatTracking.getStat("pregnancy/psychic tentacle beast birthed") > 0)
					output2("\n<b>* Births, Psychic Tentacle Beasts: </b>" + StatTracking.getStat("pregnancy/psychic tentacle beast birthed"));
				if(StatTracking.getStat("pregnancy/renvra kids") > 0)
					output2("\n<b>* Births, Renvra’s Children: </b>" + StatTracking.getStat("pregnancy/renvra kids"));
				if(StatTracking.getStat("pregnancy/sydian births") > 0)
					output2("\n<b>* Births, Sydian Young: </b>" + StatTracking.getStat("pregnancy/sydian births"));
				if(StatTracking.getStat("pregnancy/venus pitcher seeds") > 0)
					output2("\n<b>* Births, Venus Pitcher Seeds, Total: </b>" + StatTracking.getStat("pregnancy/venus pitcher seeds"));
				if(StatTracking.getStat("pregnancy/venus pitcher seeds") > 0)
					output2("\n<b>* Births, Venus Pitcher Seeds, Planted: </b>" + (StatTracking.getStat("pregnancy/venus pitcher seeds") - StatTracking.getStat("pregnancy/fertilized venus pitcher seeds/day care") - StatTracking.getStat("pregnancy/unfertilized venus pitcher seeds")));
				if(StatTracking.getStat("pregnancy/fertilized venus pitcher seeds/day care") > 0)
					output2("\n<b>* Births, Venus Pitcher Seeds @ Daycare: </b>" + StatTracking.getStat("pregnancy/fertilized venus pitcher seeds/day care"));
				if(StatTracking.getStat("pregnancy/queen of the deep eggs") > 0)
					output2("\n<b>* Births, Water Queen Young: </b>" + StatTracking.getStat("pregnancy/queen of the deep eggs"));
				// Father
				if(StatTracking.getStat("pregnancy/briha kids") > 0)
				{
					output2("\n<b>* Fathered, Briha’s Children:</b>");
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
						if(unnamedBrihaKids > 0) output2(",");
					}
					if(unnamedBrihaKids < StatTracking.getStat("pregnancy/briha kids"))
					{
						output2(" and " + num2Text(unnamedBrihaKids) + " other");
						if(unnamedBrihaKids != 1) output2("s");
					}
					else output2(" " + unnamedBrihaKids);
				}
				if(StatTracking.getStat("pregnancy/briha sons") > 0)
					output2("\n<b>* Fathered, Briha’s Sons: </b>" + StatTracking.getStat("pregnancy/briha sons"));
				if(StatTracking.getStat("pregnancy/briha daughters") > 0)
					output2("\n<b>* Fathered, Briha’s Daughters: </b>" + StatTracking.getStat("pregnancy/briha daughters"));
				if(StatTracking.getStat("pregnancy/raskvel sired/total") > 0)
					output2("\n<b>* Fathered, Raskvel Eggs: </b>" + StatTracking.getStat("pregnancy/raskvel sired/total"));
				if(StatTracking.getStat("pregnancy/raskvel sired/day care") > 0)
					output2("\n<b>* Fathered, Raskvel @ Daycare: </b>" + StatTracking.getStat("pregnancy/raskvel sired/day care"));
				if(StatTracking.getStat("pregnancy/zil callgirl kids") > 0)
					output2("\n<b>* Fathered, Zil Call Girl Children: </b>" + StatTracking.getStat("pregnancy/zil callgirl kids"));
			}
			if(totalProduce)
			{
				output2("\n<b><u>Produce</u></b>");
				output2("\n<b>* Total: </b>" + totalProduce);
				if(StatTracking.getStat("pregnancy/ovilium eggs laid") > 0)
					output2("\n<b>* Births, Ovilium Eggs, Total: </b>" + StatTracking.getStat("pregnancy/ovilium eggs laid"));
				if(StatTracking.getStat("pregnancy/egg trainer eggs laid") > 0)
					output2("\n<b>* Births, TamaniCorp Egg Trainer Eggs, Total: </b>" + StatTracking.getStat("pregnancy/egg trainer eggs laid"));
				if(StatTracking.getStat("pregnancy/unfertilized venus pitcher seeds") > 0)
					output2("\n<b>* Births, Venus Pitcher Seeds, Unfertilized: </b>" + StatTracking.getStat("pregnancy/unfertilized venus pitcher seeds"));
			}
		}
		
		//======PARASITE STATISTICS=====//
		//Parasites!
		output2("\n\n" + blockHeader("Parasite Statistics", false));
		var bHasParasites:Boolean = false;
		
		// Cockvines
		if(pc.tailType == GLOBAL.TYPE_COCKVINE && pc.tailCount > 0)
		{
			output2("\n<b><u>Cockvine</u></b>");
			if(pc.tailType == GLOBAL.TYPE_COCKVINE && pc.tailCount > 0) output2("\n<b>* Attached, Type: </b>" + GLOBAL.TYPE_NAMES[pc.tailGenitalArg]);
			bHasParasites = true;
		}
		// Cunt Snakes
		if((pc.tailType == GLOBAL.TYPE_CUNTSNAKE && pc.tailCount > 0) || flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined || flags["TIMES_FED_CUNT_SNAKE"] != undefined || (flags["CUNT_TAIL_PREGNANT_TIMER"] != undefined && flags["CUNT_TAIL_PREGNANT_TIMER"] > 0) || flags["CUNT_SNAKES_HELPED_TO_INFEST"] != undefined || flags["CUNT_SNAKE_EGGS_FAXED_HOME"] != undefined)
		{
			output2("\n<b><u>Cunt Snake</u></b>");
			if(pc.tailType == GLOBAL.TYPE_CUNTSNAKE && pc.tailCount > 0) output2("\n<b>* Attached, Type: </b>" + GLOBAL.TYPE_NAMES[pc.tailGenitalArg]);
			
			if(flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined) output2("\n<b>* Feeding, Current: </b>" + flags["DAYS_SINCE_FED_CUNT_TAIL"] + " days since last fed");
			if(flags["TIMES_FED_CUNT_SNAKE"] != undefined) output2("\n<b>* Feeding, Total: </b>" + flags["TIMES_FED_CUNT_SNAKE"] + " times");
			
			if(flags["CUNT_TAIL_PREGNANT_TIMER"] != undefined && flags["CUNT_TAIL_PREGNANT_TIMER"] > 0) output2("\n<b>* Pregnancy, Gestation Time: </b>" + prettifyMinutes(flags["CUNT_TAIL_PREGNANT_TIMER"]) + " until birth");
			
			if(flags["CUNT_SNAKE_EGGS_FAXED_HOME"] != undefined && flags["CUNT_SNAKE_EGGS_FAXED_HOME"] > 0) output2("\n<b>* Reproduction, Eggs in Hatchery: </b>" + flags["CUNT_SNAKE_EGGS_FAXED_HOME"]);
			if(flags["CUNT_SNAKES_HELPED_TO_INFEST"] != undefined || flags["CUNT_SNAKE_EGGS_FAXED_HOME"] != undefined)
			{
				output2("\n<b>* Reproduction, Eggs Laid Total: </b>");
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
			if(attachedMimbranes() > 0) output2("\n<b>* Attached, Total: </b>" + attachedMimbranes());
			
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
			
			if(mimSumReproductionCounter > 0) output2("\n<b>* Reproduction, Current Total: </b>" + mimSumReproductionCounter + " times");
			if(mimSumRepNoteCounter > 0) output2("\n<b>* Reproduction, Total Noticed: </b>" + mimSumRepNoteCounter + " times");
			
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

// Prettify Volume!
// amount: pounds
// printMeters: -1 is pounds, 0 is both pounds and grams, 1 is grams only
public function prettifyWeight(amount:Number, printMeters:int = -1):String
{
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
		amount *= 453.592;
		if(amount < 1000) retStr += formatFloat(amount, 3) + " g";
		else retStr += formatFloat((amount / 1000), 3) + " kg";
		if(printMeters == 0) retStr += ")";
	}
	return retStr;
}

// Prettify Volume!
// amount: cubic inches
// printMeters: -1 is inches, 0 is both inches and meters, 1 is meters only
public function prettifyVolume(amount:Number, printMeters:int = -1):String
{
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
		retStr += formatFloat((amount * 16.387064), 3) + " mLs";
		if(printMeters == 0) retStr += ")";
	}
	return retStr;
}

// Prettify Lengths!
// amount: inch length
// printMeters: -2 is inches only, -1 is feet and inches, 0 is both inches and meters, 1 is meters only
public function prettifyLength(amount:Number, printMeters:int = -1):String
{
	var retStr:String = "";
	if(printMeters < 1)
	{
		// Prettified over an inch
		if(amount >= 1 && printMeters != -2)
		{
			// Feet
			if(amount >= 12) retStr += Math.floor(amount / 12) + "\'";
			// Inches
			if(amount % 12 > 0)
			{
				if(Math.floor(amount % 12) > 0) retStr += " " + Math.floor(amount % 12);
				// Fractional stuff, proper maffs format! (to the nearest 1/16th inch)
				var fraction:Number = formatFloat((amount - Math.floor(amount)), 4);
				if(fraction >= 0.0125)
				{
					var num:String = "";
					var den:String = "";
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
					// Build fractions
					if(den != "") retStr += " <sup>" + num + "</sup>/<sub>" + den + "</sub>";
				}
				else if(fraction > 0.01) retStr += " 0";
				retStr += "\"";
			}
		}
		// Less than an inch get decimal format
		else retStr += formatFloat(amount, 3) + " in";
	}
	// Prettified meters
	if(printMeters > -1)
	{
		if(printMeters == 0) retStr += " (";
		retStr += formatFloat((amount * 0.0254), 3) + " m";
		if(printMeters == 0) retStr += ")";
	}
	return retStr;
}

// Prettify Minutes!
public function prettifyMinutes(minutes:Number):String
{
	var buffer:String = "";
	var hours:Number = 0;
	var days:Number = 0;
	//Days
	if(minutes > 1440) 
	{
		days = Math.floor(minutes/1440);
		minutes -= 1440 * days;
	}
	//Hourz
	if(minutes > 60)
	{
		hours = Math.floor(minutes/60);
		minutes -= 60 * hours;
	}
	if(days > 0) 
	{
		buffer += days + " day";
		if(days > 1) buffer += "s";
	}
	if(hours > 0 || days > 0) 
	{
		if(days > 0) buffer += " ";
		buffer += hours + " hour"
		if(hours != 1) buffer += "s";
	}
	if(buffer != "") buffer += " ";
	buffer += minutes + " minute";
	if(minutes != 1) buffer += "s";
	return buffer;
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
	if(flags["UNLOCKED_JUNKYARD_PLANET"] != undefined)
	{
		if(showID == "Tarkus") { output2(header("<u>Tarkus</u>", false)); addDisabledGhostButton(2, "Tarkus"); }
		else addGhostButton(2, "Tarkus", currentFunc, "Tarkus");
	}
	// Myrellion
	if(flags["PLANET_3_UNLOCKED"] != undefined)
	{
		if(showID == "Myrellion") { output2(header("<u>Myrellion</u>", false)); addDisabledGhostButton(3, "Myrellion"); }
		else addGhostButton(3, "Myrellion", currentFunc, "Myrellion");
	}
	// New Texas
	if(flags["NEW_TEXAS_COORDINATES_GAINED"] != undefined)
	{
		if(showID == "New Texas") { output2(header("<u>New Texas</u>", false)); addDisabledGhostButton(5, "New Texas"); }
		else addGhostButton(5, "New Texas", currentFunc, "New Texas");
	}
	// Poe A
	if(flags["HOLIDAY_OWEEN_ACTIVATED"] != undefined)
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
			// Scout
			if(flags["MET_FLAHNE"] != undefined)
			{
				output2("\n<b>* Scout Transport:</b> Esbeth");
				if(flags["SALVAGED VANAE CAMP"] >= 2) output2(", Xenogen Camp");
			}
			mainCount++;
		}
		// Tarkus
		if(flags["UNLOCKED_JUNKYARD_PLANET"] != undefined && (showID == "Tarkus" || showID == "All"))
		{
			output2("\n<b><u>Tarkus</u></b>");
			output2("\n<b>* Status:</b>");
			if(flags["PLANET_3_UNLOCKED"] != undefined) output2(" Coordinates received");
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
			if(flags["GAVE_SHEKKA_PROBE"] != undefined) output2(", Gave probe to Shekka");
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
				if(flags["TARKUS_BOMB_TIMER"] != undefined && flags["TARKUS_BOMB_TIMER"] > 0) output2("\n<b>* Time-Bomb Countdown: </b>" + prettifyMinutes(flags["TARKUS_BOMB_TIMER"]));
			}
			mainCount++;
		}
		// Myrellion
		if(flags["PLANET_3_UNLOCKED"] != undefined && (showID == "Myrellion" || showID == "All"))
		{
			output2("\n<b><u>Myrellion</u></b>");
			output2("\n<b>* Status:</b>");
			if(nyreaDungeonFinished() || (flags["KQ2_MYRELLION_STATE"] == 1 && MailManager.isEntryUnlocked("danemyrellioncoords"))) output2(" Coordinates received");
			else output2(" <i>In progress...</i>");
			if(!reclaimedProbeMyrellion() && flags["KQ2_MYRELLION_STATE"] != 1)
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
				output2("\n<b>* Royal Nyrean Palace:</b>");
				if(nyreaDungeonFinished())
				{
					if(flags["BEAT_TAIVRA_TIMESTAMP"] != undefined)
					{
						if(flags["KILLED_TAIVRA"] != undefined) output2(" Executed Taivra,");
						else output2(" Spared Taivra,");
					}
					if(flags["KING_NYREA"] != undefined) output2(" Succeeded the throne as " + pc.mf("king","queen") + ",");
					output2(" Completed");
				}
				else output2(" <i>In progress...</i>");
				if(flags["TAIVRA_DEAL_UNLOCKED"] != undefined || flags["OFFERED_TAIVRA_AN_ALLIANCE"] != undefined)
				{
					// Taivra
					output2("\n<b>* Royal Nyrean Palace, Queen Taivra:</b>");
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
					output2("\n<b>* Royal Nyrean Palace, [rival.name]:</b> Seen");
					if(flags["TAIVRA_RIVAL_TALK"] != undefined) output2(", Spoke of [rival.himHer]");
					if(flags["RIVAL_GOT_MYR_COORDS_FIRST"] != undefined) output2(", [rival.HeShe] got coordinates first");
					if(flags["COUSIN_EGGSLUT"] != undefined || flags["COUSIN_BEDWARMER"] != undefined) output2(", Enslaved");
					if(flags["COUSIN_EXECUTED"] != undefined) output2(", Executed");
					// Dane
					output2("\n<b>* Royal Nyrean Palace, Dane:</b> Seen");
					if(flags["FREED_DANE_FROM_TAIVRA"] != undefined) output2(", Freed him from Taivra");
					if(flags["QUEENSGUARD_STAB_TIME"] != undefined || flags["KILLED_TAIVRA"] != undefined) output2(", Escaped with [rival.name]");
				}
			}
			mainCount++;
		}
		// Nothing recorded
		if(mainCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No data from your main mission has been logged</i>");
			if(showID != "All") output2("<i> at this location</i>");
			output2("<i>.</i>");
		}
		
		// Side quests:
		var sideCount:Number = 0;
		output2("\n\n" + blockHeader("Side Missions", false));
		
		if(showID == "Tavros" || showID == "All")
		{
			// Sera: Disco 3000
			if(flags["SERA_PARTY_INVITE"] != undefined)
			{
				output2("\n<b><u>Disco 3000</u></b>");
				output2("\n<b>* Status:</b> Invited");
				if(flags["SERA_PARTY_INVITE"] == 1) output2(", Attending");
				if(flags["SERA_PARTY_DATE"] != undefined) output2(", Attended");
				if(flags["SERA_PARTY_INVITE"] >= 3) output2(", Completed");
				if(flags["SERA_PARTY_INVITE"] >= 4) output2(", On payroll");
				if(flags["SERA_PARTY_STAGE1"] != undefined) output2("\n<b>* Selected Costume:</b> " + StringUtil.toDisplayCase(flags["SERA_PARTY_STAGE1"]));
				if(flags["SERA_PARTY_ATTIRE"] != undefined) output2("\n<b>* Sera, Attire:</b> " + StringUtil.toDisplayCase(flags["SERA_PARTY_ATTIRE"]));
				output2("\n<b>* Sera, Influence Score:</b> " + seraInfluence());
				if(flags["SERA_SALARY_PAID"] != undefined && flags["SERA_SALARY_DATE"] != undefined) output2("\n<b>* Time Since Last Salary Payment: </b>" + prettifyMinutes(GetGameTimestamp() - flags["SERA_SALARY_DATE"]));
				
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
				output2("\n<b>* Status: </b>");
				if(pc.hasStatusEffect("The Treatment")) output2("Undergoing Treatment");
				else if(pc.hasStatusEffect("Temporary Treatment")) output2("Undergoing temporary Treatment");
				else if(pc.hasStatusEffect("Treated")) output2(" Treated");
				else output2(" Untreated");
				if(pc.hasStatusEffect("The Treatment"))
				{
					output2("\n<b>* Current Effects:</b>");
					if(pc.statusEffectv1("The Treatment") == 0) output2(" Feminine, Cow");
					else if(pc.statusEffectv1("The Treatment") == 1) output2(" Maculine, Stud");
					else if(pc.statusEffectv1("The Treatment") == 2) output2(" Feminine, Stud");
					else if(pc.statusEffectv1("The Treatment") == 3) output2(" Unisex, Cow and Stud");
					else if(pc.statusEffectv1("The Treatment") == 4) output2(" Maculine, Amazonian");
					else if(pc.statusEffectv1("The Treatment") == 5) output2(" Feminine, Double Stud");
					else if(pc.statusEffectv1("The Treatment") == 6) output2(" Feminine, Undersized");
					// Timer stuff
					var treatedMinutes:Number = 10080 - pc.getStatusMinutes("The Treatment");
					output2("\n<b>* Duration: </b>" + prettifyMinutes(treatedMinutes));
				}
				sideCount++;
			}
			// Varmint Wranglin'
			if(flags["MET_CAMERON"] != undefined)
			{
				output2("\n<b><u>Varmint Wranglin’</u></b>");
				output2("\n<b>* Varmints Captured, Total: </b>");
				if(flags["VARMINTS_CAUGHT"] != undefined) output2(flags["VARMINTS_CAUGHT"]);
				else output2("<i>In progress...</i>");
				// Silicone stuff!
				var siliconeTotal:int = 0;
				if(flags["TAKEN_SILICONE_538"] != undefined) siliconeTotal++;
				if(flags["TAKEN_SILICONE_552"] != undefined) siliconeTotal++;
				if(flags["TAKEN_SILICONE_556"] != undefined) siliconeTotal++;
				if(flags["TAKEN_SILICONE_564"] != undefined) siliconeTotal++;
				if(siliconeTotal > 0) output2("\n<b>* Silicone Collected: </b>" + siliconeTotal);
				if(siliconeTotal >= 4) output2(", Completed");
				sideCount++;
			}
		}

		if(showID == "Mhen'ga" || showID == "All")
		{
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
			// Penny's Zil Problem
			if(flags["MET_PENNY"] != undefined)
			{
				output2("\n<b><u>Penny’s Zil Problem</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["ZIL_PROBLEM_DEALT_WITH"] != undefined) output2(" Completed");
				else output2(" <i>In progress...</i>");
				sideCount++;
			}
			// Zil Capture
			if(flags["ACCEPTED_JULIANS_ZIL_CAPTURE_MISSION"] != undefined)
			{
				output2("\n<b><u>Zil Capture</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["FIRST_CAPTURED_ZIL_REPORTED_ON"] != undefined && flags["SECOND_CAPTURED_ZIL_REPORTED_ON"] != undefined) output2(" Completed");
				else if(flags["JULIANS_QUEST_DISABLED"] != undefined) output2(" Disabled");
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
			// Dr. Badger's Job
			if(flags["BADGER_QUEST"] != undefined)
			{
				if(flags["BADGER_QUEST"] >= 0 && flags["DR_BADGER_TURNED_IN"] == undefined) output2("\n<b><u>Doctor Badger’s Job Offer</u></b>");
				else output2("\n<b><u>Doctor Badger’s Big Mistake</u></b>");
				// Bimbo Raygun
				output2("\n<b>* Status:</b>");
				if(flags["DR_BADGER_TURNED_IN"] != undefined) output2(" Reported Dr. Badger, Completed");
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
					if(flags["DECK13_SAMPLES_TAKEN"] != undefined) output2("\n<b>* Deck 13, Gray Goo Samples Taken: </b>" + flags["DECK13_SAMPLES_TAKEN"]);
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
				output2("\n<b>* Sexbots Scanned: </b>");
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
			// Lane's Illegal Activity
			if(flags["MET_LANE"] != undefined)
			{
				output2("\n<b><u>Lane’s Plane</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["LANE_FULLY_HYPNOTISED_FOREVER"] == undefined)
				{
					if(flags["LANE_DETOX_COUNTER"] != undefined) output2(" Detoxifying");
					else if(flags["LANE_FULLY_HYPNOTISED"] != undefined && flags["LANE_DISABLED"] == undefined)
					{
						output2(" Fully Hypnotized");
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
				if(flags["LANE_DETOX_COUNTER"] != undefined) output2("\n<b>* Hypnotism Detoxification Duration: </b>" + prettifyMinutes(flags["LANE_DETOX_COUNTER"]));
				output2("\n<b>* Lane:</b>");
				if(flags["LANE_DISABLED"] != undefined) output2(" Inactive");
				else output2(" Active");
				if(flags["LANE_HYPNOSIS_LEVEL"] != 0 && flags["LANE_HYPNOSIS_LEVEL"] != undefined) output2("\n<b>* Lane, Hypnosis Level: </b>" + flags["LANE_HYPNOSIS_LEVEL"]);
				if(flags["LANE_TIMES_HYPNOTISED"] > 0) output2("\n<b>* Lane, Times Hypnotized By: </b>" + flags["LANE_TIMES_HYPNOTISED"]);
				if(flags["LANE_MALE_SEXED"] > 0) output2("\n<b>* Lane, Times Sexed Him: </b>" + flags["LANE_MALE_SEXED"]);
				if(flags["LANE_FEMALE_SEXED"] > 0) output2("\n<b>* Lane, Times Sexed Her: </b>" + flags["LANE_FEMALE_SEXED"]);
				sideCount++;
			}
		}
		
		if(showID == "Myrellion" || showID == "All")
		{
			// The Great Ant World War
			if(flags["MET_JURO"] != undefined)
			{
				output2("\n<b><u>War in Myrellion</u></b>");
				output2("\n<b>* Status:</b>");
				if(9999 == 0) output2(" ???");
				else output2(" <i>In progress... STILL IN DEVELOPMENT</i>");
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
					if(!pc.hasItem(new VenusBloom())) output2(", <i>Find her a flower!</i>");
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
					else output2(", Gave her a gemstone");
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
				output2("\n<b><u>Faz Quest</u></b>");
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
						break
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
				}
				if
				(	(flags["FAZIAN_QUEST_STATE"] != FAZIAN_QUEST_OFFERING && flags["FAZIAN_QUEST_STATE"] != FAZIAN_QUEST_REJECTED)
				&&	(flags["FAZIAN_QUEST_SUCCESSES"] != undefined && flags["FAZIAN_QUEST_FAILURES"] != undefined)
				)
					output2("\n<b>* Clues, Lead/Dead-End Ratio: </b>" + flags["FAZIAN_QUEST_SUCCESSES"] + "/" + flags["FAZIAN_QUEST_FAILURES"] + ", of " + (flags["FAZIAN_QUEST_SUCCESSES"] + flags["FAZIAN_QUEST_FAILURES"]) + " clues");
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
			if(flags["BEEN_TO_MYRELLION_BAR"] != undefined && flags["MET_KARA"] != undefined)
			{
				output2("\n<b><u>KaraQuest</u></b>");
				output2("\n<b>* Status:</b>");
				if(flags["LET_SHADE_AND_KARA_DUKE_IT_OUT"] != undefined) output2(" Ignored Kara and Shade");
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
					if(flags["KQ2_KARA_SNIPAH_KILLS"] != undefined) output2("\n<b>* Kara, Enemies Sniped: </b>" + flags["KQ2_KARA_SNIPAH_KILLS"]);
					// Nuke 'em, Rico!
					if(flags["KQ2_NUKE_STARTED"] != undefined)
					{
						output2("\n<b>* Pirate Base, Nuke:</b>");
						if(flags["KQ2_NUKE_EXPLODED"] != undefined) output2(" Activated, Detonated, Destroyed Myrellion");
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
						output2("\n<b>* Pirate Base, Dr.Khan:</b> Met him, Defeated him");
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
						output2("\n<b>* Research, Duration: </b>" + prettifyMinutes(GetGameTimestamp() - flags["MCALLISTER_MYR_HYBRIDITY_START"]));
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
						output2("\n<b>* Venom Addiction Level: </b>" + flags["VENOM_ADDICTION"] + " %");
					}
					else output2("\n<b>* Venom Dosage Level: </b>" + flags["VENOM_PROGRESS"] + " %");
				}
				else
				{
					output2(" Tried");
					if(flags["VENOM_PROGRESS"] != undefined && flags["VENOM_PROGRESS"] <= 0) output2(", Cured");
				}
				if(sexedMyrVenom()) output2("\n<b>* Doses, Sex-related: </b>" + flags["SEXED_MYR_VENOM"]);
				if(drankMyrVenom()) output2("\n<b>* Doses, Drink-related: </b>" + flags["DRANK_MYR_VENOM"]);
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
				else if(9999 == 0) output2(" Completed");
				else output2(" <i>In progress...</i>");
				if(flags["NAYNA_DRONES_TURNED_IN"] != undefined) output2("\n<b>* Weather Drones Turned In: </b>" + flags["NAYNA_DRONES_TURNED_IN"]);
				sideCount++;
			}
		}
		
		if(showID == "Ausaril" || showID == "All")
		{
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
					if(flags["HOLIDAY_OWEEN_PURCHASE"] != undefined) output2(" Purchased " + indefiniteArticle(flags["HOLIDAY_OWEEN_PURCHASE"]) + " from Holiday, Celebrated at the party,");
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
			output2("\n* <i>No side mission data has been logged</i>");
			if(showID != "All") output2("<i> at this location</i>");
			output2("<i>.</i>");
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
				if(flags["SAENDRA_XPACK1_TIMER"] != undefined) output2("\n<b>* Time Left to Respond: </b>" + prettifyMinutes((flags["SAENDRA_XPACK1_TIMER"] + (6 * 60)) - GetGameTimestamp()));
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
				if(flags["SAENDRA_XPACK1_TIMER"] != undefined) output2("\n<b>* Time Left to Rescue Hostage: </b>" + prettifyMinutes((flags["SAENDRA_XPACK1_TIMER"] + (7 * 24 * 60)) - GetGameTimestamp()));
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
				if(flags["ZIL_CALLGIRL_SEXED"] != undefined && flags["ZIL_CALLGIRL_SEXED"] > 0) output2("\n<b>* Call Girl, Times Sexed: </b>" + zilCallGirlSexed());
			}
			
			if(flags["SAENDRA_XPACK1_CALLGIRLSTATE"] != undefined)
			{
				output2("\n<b>* Call Girl:</b> Met her");
				if(flags["SAENDRA_XPACK1_CALLGIRLSTATE"] >= 2) output2(", Paid her for sex");
			}
			if(flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] != undefined)
			{
				output2("\n<b>* Pirate, Merc Guard:</b>");
				if(flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] == 0) output2(" Active");
				if(flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] == 1) output2(" Defeated him using call girl");
				if(flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] == 2) output2(" Defeated him using Saendra’s tits!");
				if(flags["SAENDRA_XPACK1_RESCUE_SHOTGUARD_STATE"] == 3) output2(" Defeated him in combat");
			}
			if(flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] != undefined)
			{
				output2("\n<b>* Pirate, Techie Guard:</b>");
				if(flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == 0) output2(" Active");
				if(flags["SAENDRA_XPACK1_RESCUE_TECHGUARD_STATE"] == 1) output2(" Defeated her using call girl");
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
		if(9999 == 0)
		{
			output2("\n<b><u>The Kashima Incident</u></b>");
			output2("\n<b>* Status:</b>");
			if(9999 == 0)
			{
				output2(" Completed");
			}
			else output2(" <i>In progress...</i>");
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
			if(flags["ICEQUEEN COMPLETE"] == -1) output2(" Ignored message");
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
				output2("\n<b><u>Tavros Station Hangar</u></b>");
				// Slimeyface
				if(flags["RECRUITED_CELISE"] > 0)
				{
					output2("\n<b>* Celise:</b> Met her");
					if(flags["GIGACELISE"] == 1)output2(", Gigaform");
					output2(", Crew member");
					if(celiseIsCrew()) output2(" (Onboard Ship)");
					else if(flags["CELISE_ONBOARD"] == undefined) output2(" (At Tavros Station)");
					if(flags["BUBBLED_CELISE"] != undefined) output2("\n<b>* Celise, Times Given Cum Bubble: </b>" + flags["BUBBLED_CELISE"]);
					if(flags["TIMES_CELISE_IN_BALLS"] != undefined)
					{
						output2("\n<b>* Celise, Times She’s Stimulated</b>");
						if(silly) output2("<b> Your Internal Testicular Fortitude</b>");
						else output2("<b> the Inside of Your Balls</b>");
						output2("<b>: </b>" + flags["TIMES_CELISE_IN_BALLS"]);
					}
					if(flags["LACTATION_FED_CELISE"] != undefined) output2("\n<b>* Celise, Times Breast-Fed Her: </b>" + flags["LACTATION_FED_CELISE"]);
					if(flags["KIRO_CELISE_3SOME"] != undefined) output2("\n<b>* Celise, Times Sexed with Kiro: </b>" + flags["KIRO_CELISE_3SOME"]);
					if(flags["CELISE_ROOMBA_GOO"] != undefined) output2("\n<b>* Celise, Times Seen Cleaning Ship: </b>" + flags["CELISE_ROOMBA_GOO"]);
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
			// Anon's Bar!
			if(flags["MET_ALEX"] != undefined || flags["SEEN_SELLESY"] != undefined || flags["APPROACHED_SHELLY"] != undefined)
			{
				output2("\n<b><u>Anon’s Bar and Board</u></b>");
				// Alex
				if(flags["MET_ALEX"] != undefined)
				{
					if(flags["FUCKED_ALEX"] != undefined || flags["LAST_MINUTE_ALEX_BACK_OUT"] != undefined) output2("\n<b>* Alex:</b>");
					else output2("\n<b>* Pretty Boy:</b>");
					output2(" Met him");
					if(flags["LAST_MINUTE_ALEX_BACK_OUT"] != undefined) output2(", Bailed on him");
					if(flags["FUCKED_ALEX"] != undefined) output2("\n<b>* Alex, Times Sexed: </b>" + flags["FUCKED_ALEX"]);
				}
				// Sellesy
				if(flags["SEEN_SELLESY"] != undefined)
				{
					if(flags["MET_SELLESY"] != undefined) output2("\n<b>* Sellesy:</b> Met her");
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
					if(flags["ASSISTED_SHELLY_WITH_LAYING"] != undefined) output2("\n<b>* Shelly, Times Assisted Her Egg Laying: </b>" + flags["ASSISTED_SHELLY_WITH_LAYING"]);
					if(flags["ASSISTED_SHELLY_WITH_INTENSE_LAYING"] != undefined) output2("\n<b>* Shelly, Intense Egg Laying Sessions, Total: </b>" + flags["ASSISTED_SHELLY_WITH_INTENSE_LAYING"]);
				}
				variousCount++;
			}
			// Beth's Busty Broads
			if(flags["TALK_TO_LADY_1ST"] != undefined || flags["BETHS_TIMES_WHORED"] != undefined || flags["BETHS_OVIR_SEEN"] != undefined || flags["OVIR_TEASED"] != undefined || flags["MET_VAANDE"] != undefined)
			{
				output2("\n<b><u>Beth’s Busty Broads</u></b>");
				// Turn Tricks
				if(flags["BETHS_TIMES_WHORED"] != undefined)
				{
					output2("\n<b>* Brothel, Times Whored: </b>" + flags["BETHS_TIMES_WHORED"]);
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
					if(reahaRecruited())
					{
						output2(", Crew member");
						// Reaha Expansion
						if(reahaIsCrew()) output2(" (Onboard Ship)");
						else if(flags["REAHA_IS_CREW"] == 2) output2(" (At Tavros Station)");
						else if(flags["REAHA_IS_CREW"] == 3) output2(" (At New Texas)");
						output2("\n<b>* Reaha, Confidence: </b>" + reahaConfidence() + " %");
						if(flags["REAHA_MILKMODS_UNLOCKED"] != undefined)
						{
							//output2("\n<b>* Reaha, Milk Produced: </b>" + chars["REAHA"].milkQ() + " mLs");
							output2("\n<b>* Reaha, Milk Type: </b>" + GLOBAL.FLUID_TYPE_NAMES[chars["REAHA"].milkType]);
							if(flags["REAHA_MILK_CHANGED"] != undefined) output2("\n<b>* Reaha, Milk Type, Times Changed: </b>" + flags["REAHA_MILK_CHANGED"]);
						}
						if(flags["REAHA_TALK_ADDICTION_CURE"] != undefined)
						{
							output2("\n<b>* Reaha, Patch Addiction: </b>" + reahaAddiction() + " %");
							if(flags["REAHA_ADDICTION_CURED"] != undefined) output2(", Cured");
							else output2(", Ongoing");
						}
						if(reahaFree() && flags["REAHA_LAST_DOMMY_FUCK"] != undefined) output2("\n<b>* Reaha, Days Since Last Dommy Fuck Attempt: </b>" + (days - flags["REAHA_LAST_DOMMY_FUCK"]));
					}
				}
				// Ovir Gurrrl
				if(flags["BETHS_OVIR_SEEN"] != undefined || flags["OVIR_TEASED"] != undefined)
				{
					var bethsOvirGirl:String = "Ovir Girl";
					if(knowBethsOvir()) bethsOvirGirl = "Ovir ‘Girl’";
					output2("\n<b>* " + bethsOvirGirl + ":</b> Seen her");
					if(flags["ASKED_AFTER_THE_GIRLS"] != undefined && (hours == 18 || hours == 19 || hours == 21 || hours == 22 || hours == 24 || hours == 1 || hours == 3 || hours == 4)) output2(", Currently performing");
					if(flags["OVIR_TEASED"] != undefined) output2("\n<b>* " + bethsOvirGirl + ", Times Teased: </b>" + flags["OVIR_TEASED"]);
				}
				// Terensha
				if(flags["MET_TERENSHA"] != undefined)
				{
					output2("\n<b>* Terensha:</b> Met her");
					if(terenshaIsDancing()) output2(", Currently performing");
					if(flags["RENSA_FUCKED"] != undefined) output2("\n<b>* Terensha, Times Sexed: </b>" + flags["RENSA_FUCKED"]);
				}
				// Vaande
				if(flags["MET_VAANDE"] != undefined)
				{
					output2("\n<b>* Vaande:</b> Met her");
					if(flags["ASKED_AFTER_THE_GIRLS"] != undefined && (hours == 10 || hours == 13 || hours == 16)) output2(", Currently performing");
					if(flags["VAANDE_BUBBLED"] != undefined) output2("\n<b>* Vaande, Times Given Cum Bubble: </b>" + flags["VAANDE_BUBBLED"]);
					if(flags["SEXED_VAANDE"] != undefined) output2("\n<b>* Vaande, Times Sexed: </b>" + flags["SEXED_VAANDE"]);
				}
				variousCount++;
			}
			// Serabutts
			if(flags["MET_SERA"] != undefined)
			{
				output2("\n<b><u>The Dark Chrysalis</u></b>");
				output2("\n<b>* Sera:</b> Met her");
				if(flags["SERA_NO_SEX"] == 1) output2(", Pissed off at you indefinitely");
				if(flags["SERA_TRIPLE_X_RATED"] >= 4) output2(", Mistress");
				else
				{
					if(flags["SERA_TALKED_ABOUT_BEING_PISSED_OFF"] == undefined) output2(", Pissed off");
					else output2(", Vented her frustrations");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output2("\n<b>* Sera, Tail Length: </b>" + prettifyLength(36 + seraInchGain()));
				if(fuckedSeraBefore())
				{
					output2("\n<b>* Sera, Times Sexed: </b>" + timesFuckedSera());
					if(flags["TIMES_RODE_BY_SERA"] > 0) output2("\n<b>* Sera, Times She Rode You: </b>" + flags["TIMES_RODE_BY_SERA"]);
					if(flags["SERA_STUCK_IT_ALL_IN_BUTT"] > 0) output2("\n<b>* Sera, Times She Stuffed Your Ass with Dicks: </b>" + flags["SERA_STUCK_IT_ALL_IN_BUTT"]);
					if(flags["SERA FUCKED PCS TAILCUNT"] > 0) output2("\n<b>* Sera, Times She Fucked Your Tail Cunt: </b>" + flags["SERA FUCKED PCS TAILCUNT"]);
					if(flags["SERA_URETHRA_TAILFUCKS"] > 0) output2("\n<b>* Sera, Times She Tail-Fucked Your Urethra: </b>" + flags["SERA_URETHRA_TAILFUCKS"]);
					if(flags["SERA_EXHIBITION_BLOWJOB"] != undefined) output2("\n<b>* Sera, Times She Gave You a Public Blowjob: </b>" + flags["SERA_EXHIBITION_BLOWJOB"]);
					if(flags["SERA_IN_JARDI_THREESOME"] != undefined) output2("\n<b>* Sera, Times Sexed in Threesome with Jardi: </b>" + flags["SERA_IN_JARDI_THREESOME"]);
					if(flags["SERA_FACE_RIDE_TRAINING"] != undefined) output2("\n<b>* Sera, Times She Rode Your Face: </b>" + flags["SERA_FACE_RIDE_TRAINING"]);
					if(flags["SERA_INCH_STEALING_SEX"] > 0) output2("\n<b>* Sera, Times She Absorbed Your Length: </b>" + flags["SERA_INCH_STEALING_SEX"]);
					if(flags["SERA_INCH_STEALING_HELP"] > 0) output2("\n<b>* Sera, Times You Untangled Her Tail Cock: </b>" + flags["SERA_INCH_STEALING_HELP"]);
				}
				//if(pc.hasStatusEffect("Sera Credit Debt")) output2("\n<b>* Sera, Credit Debt: </b>" + pc.statusEffectv1("Sera Credit Debt") + " credits");
				if(flags["PURCHASED_SERAS_GALO"] != undefined || flags["SAENDRA GONNA GO GET A COCK"] >= 2)
				{
					output2("\n<b>* Sera, Unique Sale:</b>");
					if(flags["PURCHASED_SERAS_GALO"] != undefined) output2(" GaloMax");
					if(flags["SAENDRA GONNA GO GET A COCK"] >= 2)
					{
						if(flags["PURCHASED_SERAS_GALO"] != undefined) output2(",");
						output2(" Saendra’s penis growth drug");
						if(flags["SAEN_X_SERA_THREESOME"] > 0) output2(" (with threesome discount)");
					}
				}
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
					output2("\n<b>* Jade, Nipple Type: </b>" + GLOBAL.NIPPLE_TYPE_NAMES[chars["JADE"].breastRows[0].nippleType]);
				}
				if(flags["GOTTEN_INTIMATE_WITH_JADE"] != undefined) output2("\n<b>* Jade, Times Sexed: </b>" + flags["GOTTEN_INTIMATE_WITH_JADE"]);
				if(flags["TITFUCKED_JADE"] != undefined) output2("\n<b>* Jade, Times Titfucked: </b>" + flags["TITFUCKED_JADE"]);
				if(flags["TIMES_SAT_ON_JADES_FACE"] != undefined) output2("\n<b>* Jade, Times Sat on Her Face: </b>" + flags["TIMES_SAT_ON_JADES_FACE"]);
				variousCount++;
			}
			// Inessassassa
			if(flags["MET_INESSA"] != undefined)
			{
				output2("\n<b><u>Happy Tails</u></b>");
				output2("\n<b>* Inessa:</b> Met her");
				if(flags["INESSA_BELTED"] != undefined) output2(", Trapped in chastity belt");
				if(flags["INESSA_BEING_DOMMED"] != undefined) output2(", You’ve accepted her submission");
				else if(flags["INESSA_SHOT_DOWN"] != undefined) output2(", You’ve refused her submission");
				if(flags["INESSA_BDSM_SETTING"] != undefined) output2("\n<b>* Inessa, Your BDSM Role: </b>" + StringUtil.capitalize(flags["INESSA_BDSM_SETTING"]));
				if(flags["INESSA_BJED"] != undefined || flags["INESSA_TITTYSQUIRT"] != undefined || flags["INESSA_HJ"] != undefined || flags["INESSA_FACE_STRAPPED"] != undefined)
				{
					output2("\n<b>* Inessa, Sexual History:</b> Sexed her");
					if(flags["INESSA_BJED"] != undefined) output2(", Gave you a blowjob");
					if(flags["INESSA_TITTYSQUIRT"] != undefined) output2(", She squirted you");
					if(flags["INESSA_HJ"] != undefined) output2("\n<b>* Inessa, Times She’s Given You a Handjob: </b>" + flags["INESSA_HJ"]);
					if(flags["INESSA_FACE_STRAPPED"] != undefined) output2("\n<b>* Inessa, Times She’s Used Her Face Strap-On: </b>" + flags["INESSA_FACE_STRAPPED"]);
				}
				variousCount++;
			}
			// Alissiness
			if(flags["MET_ALICE"] != undefined)
			{
				output2("\n<b><u>Mi Amour</u></b>");
				output2("\n<b>* Aliss:</b> Met her");
				if(flags["TALKED_TO_ALIIS_ABOUT_LIBIDO"] != undefined) output2("\n<b>* Aliss, Lust: </b>" + chars["ALISS"].lust());
				if(flags["TIMES_SEXED_ALISS"] != undefined) output2("\n<b>* Aliss, Times Sexed: </b>" + flags["TIMES_SEXED_ALISS"]);
				if(flags["ANNO_OWNS_LIGHT_STRAPON"] != undefined)
				{
					output2("\n<b>* Aliss, Unique Sale:</b> Anno’s hardlight strap-on");
				}
				variousCount++;
			}
			// Shear Beauty!
			if(flags["MET_CERIA"] != undefined)
			{
				output2("\n<b><u>Shear Beauty</u></b>");
				output2("\n<b>* Ceria:</b> Met her");
				if(flags["EATEN_CERIA_OUT"] != undefined) output2(", Ate her pussy");
				if(flags["CERIA_MOUTH_FLOOD"] != undefined) output2(", Flooded her mouth with semen");
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
					output2("\n<b>* Lerris, Items Given: </b>" + flags["LERRIS_ITEMS_GIVEN"]);
					if(flags["LERRIS_BOVINIUMED"] != undefined) output2(", Given Bovinium");
					output2("\n<b>* Lerris, Breast Size: </b>" + StringUtil.toTitleCase(chars["LERRIS"].breastCup(0)) + "s");
					//output2("\n<b>* Lerris, Hip Size: </b>" + formatFloat(chars["LERRIS"].hipRating(), 3));
					//output2("\n<b>* Lerris, Butt Size: </b>" + formatFloat(chars["LERRIS"].buttRating(), 3));
					if(chars["LERRIS"].isLactating()) output2("\n<b>* Lerris, Milk Type: </b>" + GLOBAL.FLUID_TYPE_NAMES[chars["LERRIS"].milkType]);
				}
				if(flags["FUCKED_LERRIS"] != undefined)
				{
					output2("\n<b>* Lerris, Sexual Organs: </b>");
					if(chars["LERRIS"].hasCock())
					{
						if(chars["LERRIS"].cockVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["LERRIS"].cocks[0].cType].toLowerCase() + " cock");
						else output2(GLOBAL.TYPE_NAMES[chars["LERRIS"].cocks[0].cType] + " cock");
						if(chars["LERRIS"].hasSheath(0) || chars["LERRIS"].hasKnot(0))
						{
							output2(" (");
							if(chars["LERRIS"].hasSheath(0)) output2("sheathed");
							if(chars["LERRIS"].hasSheath(0) && chars["LERRIS"].hasKnot(0)) output2(" and ");
							if(chars["LERRIS"].hasKnot(0)) output2("knotted");
							output2(")");
						}
						if(chars["LERRIS"].hasStatusEffect("Uniball")) output2(" with a uniball");
						else if(chars["LERRIS"].balls == 1) output2(" with a testicle");
						else if(chars["LERRIS"].balls > 1) output2(" with " + num2Text(chars["LERRIS"].balls) + " balls");
					}
					if(chars["LERRIS"].hasVagina())
					{
						if(chars["LERRIS"].hasCock()) output2(", ");
						if(chars["LERRIS"].vaginalVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["LERRIS"].vaginas[0].type].toLowerCase() + " vagina");
						else output2(GLOBAL.TYPE_NAMES[chars["LERRIS"].vaginas[0].type] + " vagina");
						if(chars["LERRIS"].vaginas[0].clits == 1) output2(" with a clit");
						else if(chars["LERRIS"].vaginas[0].clits > 1) output2(" with " + num2Text(chars["LERRIS"].vaginas[0].clits) + " clits");
					}
					if(chars["LERRIS"].hasCock() || chars["LERRIS"].hasVagina()) output2(", ");
					if(chars["LERRIS"].analVirgin) output2("Virgin asshole");
					else output2("Asshole");
				}
				if(flags["SUCKLED_LERRIS"] != undefined) output2("\n<b>* Lerris, Times Suckled: </b>" + flags["SUCKLED_LERRIS"]);
				if(flags["FUCKED_LERRIS"] != undefined) output2("\n<b>* Lerris, Times Sexed: </b>" + flags["FUCKED_LERRIS"]);
				variousCount++;
			}
			// Residential Deck Stuff!
			if(flags["AINA_DAY_MET"] != undefined || flags["SEEN_FYN"] == true || flags["MET_SEMITH"] == true)
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
						if(flags["AINA_SEXED"] > 0) output2("\n<b>* Aina, Times Sexed: </b>" + flags["AINA_SEXED"]);
						if(flags["AINA_SEXED_WITH_TOY"] > 0) output2("\n<b>* Aina, Times Fucked with Anal Wand: </b>" + flags["AINA_SEXED_WITH_TOY"]);
					}
				}
				// Fyn
				if(flags["SEEN_FYN"] == true)
				{
					if(flags["MET_FYN"] == undefined) output2("\n<b>* Shirtless Man:</b> Seen him");
					else
					{
						output2("\n<b>* Fyn:</b> Met him");
						if(flags["FYN_SEXED"] > 0) output2("\n<b>* Fyn, Times Sexed: </b>" + flags["FYN_SEXED"]);
					}
				}
				// Semith
				if(flags["MET_SEMITH"] == true)
				{
					output2("\n<b>* Semith:</b> Met him");
					if(flags["SEMITH_SEXED"] > 0) output2("\n<b>* Semith, Times Sexed: </b>" + flags["SEMITH_SEXED"]);
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
				if(flags["NEW_TEXAS_GANGBANGED"] != undefined) output2("\n<b>* Alpha Bull-Men, Times Gangbanged By: </b>" + flags["NEW_TEXAS_GANGBANGED"]);
				if(flags["TEXAS_GRAVCUFFS_COWORGY"] != undefined) output2("\n<b>* Curvy Cowgirls, Times Gangbanged By: </b>" + flags["TEXAS_GRAVCUFFS_COWORGY"]);
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
					if(flags["SEXED_BIG_T"] != undefined) output2("\n<b>* Big T, Times Sexed: </b>" + flags["SEXED_BIG_T"]);
				}
				// Like, Ellie and stuff!
				if(flags["MET_ELLIE"] != undefined)
				{
					output2("\n<b>* Ellie:</b> Met her");
					if(flags["SUCKED_ELLIES_TITS"] != undefined) output2(", Sucked her tits");
					if(flags["ELLIE_EMBARASSED_LIL_DICK_FUCK"] != undefined) output2(", Fucked her with an embarrassingly small dick for her size");
					if(flags["NEPH_AFFECTION"] != undefined) output2("\n<b>* Ellie, Affection: </b>" + flags["NEPH_AFFECTION"] + " %");
					if(flags["ELLIE_SEXED"] != undefined) output2("\n<b>* Ellie, Times Sexed: </b>" + flags["ELLIE_SEXED"]);
				}
				// BBQ, Mmmm...
				if(flags["MET_HERMAN"] != undefined)
				{
					output2("\n<b>* Herman:</b> Met him");
					if(flags["HERMAN_SPECIAL_ORDER"] != undefined) output2("\n<b>* Herman, Times Requested “Special Order”: </b>" + flags["HERMAN_SPECIAL_ORDER"]);
				}
				// Zephyrbutts
				if(flags["MET_ZEPHYR"] != undefined)
				{
					output2("\n<b>* Zephyr:</b> Met her");
					if(flags["ZEPHYR_PISSED"] != undefined) output2(", Pissed off");
					if(flags["SEXED_ZEPHYR"] != undefined) output2(", Sexed her");
					if(flags["ZEPHYR_FUCKED_PC"] != undefined) output2(", She fucked you");
				}
				variousCount++;
			}
			// The Fields
			if(flags["MET_CAMERON"] != undefined || flags["MET_VARMINT"] != undefined || varmintIsCrew())
			{
				output2("\n<b><u>The Fields</u></b>");
				if(flags["MET_CAMERON"] != undefined)
				{
					output2("\n<b>* Cameron:</b> Met him");
					if(flags["SEXED_CAMERON"] != undefined) output2("\n<b>* Cameron, Times Sexed: </b>" + flags["SEXED_CAMERON"]);
				}
				if(flags["MET_VARMINT"] != undefined) output2("\n<b>* Varmint, Times Encountered: </b>" + flags["MET_VARMINT"]);
				if(varmintIsCrew())
				{
					if(varmintIsTame())
					{
						output2("\n<b>* Pet Varmint:</b> Crew member");
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
				var flavorsTotal:int = 0;
				if(flags["HAD_GEWINFRUIT"] != undefined) flavorsTotal++;
				if(flags["HAD_YOKTO"] != undefined) flavorsTotal++;
				if(flags["HAD_BLITZABERRY"] != undefined) flavorsTotal++;
				if(flags["HAD_STRAWBERRY"] != undefined) flavorsTotal++;
				if(flags["HAD_JUMBIJUMBI"] != undefined) flavorsTotal++;
				if(flags["HAD_DARGINUT"] != undefined) flavorsTotal++;
				if(flags["HAD_CHOCOLATE"] != undefined) flavorsTotal++;
				if(flags["HAD_FLAMEBERKS"] != undefined) flavorsTotal++;
				output2("\n<b>* Number of Flavors Tasted: </b>" + flavorsTotal);
				if(silly && flavorsTotal >= 8) output2(", <i>Yum!</i>");
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
				if(flags["SEXED_YAMMI"] != undefined) output2("\n<b>* Yammi, Times Sexed: </b>" + flags["SEXED_YAMMI"]);
				if(flags["ANALED_YAMMI"] != undefined) output2("\n<b>* Yammi, Times Fucked Her Ass: </b>" + flags["ANALED_YAMMI"]);
				// Reaha special
				if(flags["REAHA_ICE_CREAM_DAYS"] != undefined) output2("\n<b>* Reaha, Days Since Last Had Ice Cream With: </b>" + (days - flags["REAHA_ICE_CREAM_DAYS"]));
				if(flags["REAHA_ICE_CREAM_TIMES"] != undefined) output2("\n<b>* Reaha, Times Had Ice Cream With: </b>" + flags["REAHA_ICE_CREAM_TIMES"]);
				variousCount++;
			}
			// Milk Barn, where all the cows stay at!
			if(flags["BRYNN_AUTOENTER"] != undefined || flags["MET_GIANNA"] != undefined || flags["MET_MILLIE"] != undefined || flags["MET_YANCY"] != undefined || flags["GOBBLES_SEXYTIMES_STARTED"] != undefined || StatTracking.getStat("milkers/breast milker uses") > 0 || StatTracking.getStat("milkers/prostate milker uses") > 0)
			{
				output2("\n<b><u>Milk Barn</u></b>");
				// Milkers
				if(StatTracking.getStat("milkers/breast milker uses") > 0)
				{
					output2("\n<b>* Milker, Breast, Times Used: </b>" + StatTracking.getStat("milkers/breast milker uses"));
					output2("\n<b>* Milker, Breast, Fluid Milked: </b>" + StatTracking.getStat("milkers/milk milked") + " mL");
				}
				if(StatTracking.getStat("milkers/prostate milker uses") > 0)
				{
					output2("\n<b>* Milker, Prostate, Times Used: </b>" + StatTracking.getStat("milkers/prostate milker uses"));
					output2("\n<b>* Milker, Prostate, Cum Milked: </b>" + StatTracking.getStat("milkers/cum milked") + " mL");
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
						output2("\n<b>* Gianna, Body, Breast Size: </b>" + StringUtil.toTitleCase(chars["GIANNA"].breastCup(0)) + "s");
						output2("\n<b>* Gianna, Body, Posterior Size: </b>" + formatFloat(chars["GIANNA"].buttRating(), 3));
						output2("\n<b>* Gianna, Body, Lip Size:</b>");
						var giannaLipsize:int = chars["GIANNA"].lipRating();
						if(giannaLipsize <= 1) output2(" Pencil-thin");
						else if(giannaLipsize <= 2) output2(" Supple");
						else if(giannaLipsize <= 3) output2(" Plump");
						else if(giannaLipsize <= 4) output2(" Luscious");
						else if(giannaLipsize <= 5) output2(" Bee-stung");
						else if(giannaLipsize <= 6) output2(" Fat");
						else if(giannaLipsize <= 7) output2(" Bloated");
						else if(giannaLipsize <= 8) output2(" Whorish");
						else output2(" Universe-distorting");
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
					if(flags["GIANNA_ABOUT_HER_TALK_RESULT"] == 1)
					{
						output2("\n<b>* Gianna, Personality: </b>" + giannaPersonality());
						if(giannaPersonality() >= 100) output2(", Hyper Positive");
						else if(giannaPersonality() > 80) output2(", Positive");
						else if(giannaPersonality() > 60) output2(", Slightly Positive");
						else if(giannaPersonality() >= 40) output2(", Generic");
						else if(giannaPersonality() >= 20) output2(", Slightly Negative");
						else if(giannaPersonality() > 0) output2(", Negative");
						else output2(", Very Negative");
					}
					// Attachments
					if(flags["GIANNA_BODY_TALK_RESULT"] != undefined)
					{
						output2("\n<b>* Gianna, Simulated Sex Organs: </b>");
						if(chars["GIANNA"].hasCock())
						{
							if(chars["GIANNA"].cockVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["GIANNA"].cocks[0].cType].toLowerCase() + " cock");
							else output2(GLOBAL.TYPE_NAMES[chars["GIANNA"].cocks[0].cType] + " cock");
							if(chars["GIANNA"].hasSheath(0) || chars["GIANNA"].hasKnot(0))
							{
								output2(" (");
								if(chars["GIANNA"].hasSheath(0)) output2("sheathed");
								if(chars["GIANNA"].hasSheath(0) && chars["GIANNA"].hasKnot(0)) output2(" and ");
								if(chars["GIANNA"].hasKnot(0)) output2("knotted");
								output2(")");
							}
							if(chars["GIANNA"].hasStatusEffect("Uniball")) output2(" with a uniball");
							else if(chars["GIANNA"].balls == 1) output2(" with a testicle");
							else if(chars["GIANNA"].balls > 1) output2(" with " + num2Text(chars["GIANNA"].balls) + " balls");
						}
						if(chars["GIANNA"].hasVagina())
						{
							if(chars["GIANNA"].hasCock()) output2(", ");
							if(chars["GIANNA"].vaginalVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["GIANNA"].vaginas[0].type].toLowerCase() + " vagina");
							else output2(GLOBAL.TYPE_NAMES[chars["GIANNA"].vaginas[0].type] + " vagina");
							if(chars["GIANNA"].vaginas[0].clits == 1) output2(" with a clit");
							else if(chars["GIANNA"].vaginas[0].clits > 1) output2(" with " + num2Text(chars["GIANNA"].vaginas[0].clits) + " clits");
						}
						if(chars["GIANNA"].hasCock() || chars["GIANNA"].hasVagina()) output2(", ");
						if(chars["GIANNA"].analVirgin) output2("Virgin asshole");
						else output2("Asshole");
					}
					// Sex stuff
					if(flags["GIANNA_STALL_SEEN"] != undefined || flags["GIANNA_TITFUCKS"] != undefined || flags["GIANNA_GIVEN_GIRLY_ORAL_YET"] != undefined || flags["SIXTYNINED_GIANNA"] != undefined || flags["FUCKED_GIANNA_VAGINALLY"] != undefined || flags["GIANNA_CUMFLATION_DISABLED"] != undefined)
					{
						output2("\n<b>* Gianna, Sexual History:</b> Sexed her");
						if(flags["GIANNA_STALL_SEEN"] != undefined) output2(", Fucked in stall");
						if(flags["GIANNA_TITFUCKS"] != undefined) output2(", Titfucked her");
						if(flags["GIANNA_GIVEN_GIRLY_ORAL_YET"] != undefined) output2(", She ate your pussy");
						if(flags["SIXTYNINED_GIANNA"] != undefined) output2(", 69'd with her");
						if(flags["FUCKED_GIANNA_VAGINALLY"] != undefined) output2(", Fucked her vagina");
						if(flags["GIANNA_CUMFLATION_DISABLED"] != undefined) output2(", Cumflation disabled");
					}
					// Timer
					if(flags["GIANNA_FUCK_TIMER"] != undefined) output2("\n<b>* Gianna, Time Since Last Fucked: </b>" + prettifyMinutes(flags["GIANNA_FUCK_TIMER"]));
				}
				// Millie milks!
				if(flags["MET_MILLIE"] != undefined)
				{
					output2("\n<b>* Millie:</b> Met her");
					if(flags["FUCKED_MILLIE"] != undefined) output2(", Sexed her");
					if(flags["TRIED_TREATMENT_LIGHT"] != undefined) output2(", Tried the Temporary Treatment");
					if(flags["MILLIE_LAST_ACTION"] != undefined) output2("\n<b>* Millie, Previous Action: </b>" + StringUtil.toTitleCase(flags["MILLIE_LAST_ACTION"]));
					if(flags["MILLIE_MILK_COUNT"] != undefined) output2("\n<b>* Millie, Times Milked By: </b>" + flags["MILLIE_MILK_COUNT"]);
				}
				// Fancy Yancy
				if(flags["MET_YANCY"] != undefined)
				{
					output2("\n<b>* Yancy:</b> Met him");
					if(flags["YANCY_SEXED"] != undefined) output2(", Sexed him");
					if(flags["YANCY_BUTTFUCKED_BY_PC"] != undefined) output2(", Fucked his ass");
					if(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] != undefined) output2("\n<b>* Yancy, Previous Action: </b>" + StringUtil.toTitleCase(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"]));
					if(flags["YANCY_MILKED_PC"] != undefined) output2("\n<b>* Yancy, Times Milked By: </b>" + flags["YANCY_MILKED_PC"]);
				}
				variousCount++;
			}
			// Ten Ton Gym
			if(flags["MET_QUENTON"] != undefined)
			{
				output2("\n<b><u>Ten Ton Gym</u></b>");
				output2("\n<b>* Quenton:</b> Met him");
				if(flags["SEXED_QUENTON"] != undefined) output2("\n<b>* Quenton, Times Sexed: </b>" + flags["SEXED_QUENTON"]);
				if(flags["MET_SHOWER_GIRLS"])
				{
					output2("\n<b>* Betsy and Victoria:</b> Met them");
					if(flags["SHOWER_SANDWICH"] != undefined) output2("\n<b>* Betsy and Victoria, Times Had Shower Sex With: </b>" + flags["SHOWER_SANDWICH"]);
				}
				if(flags["MET_LOLA"])
				{
					output2("\n<b>* Lola:</b> Met her");
					if(flags["SEXED_LOLA"] != undefined) output2("\n<b>* Lola, Times Sexed: </b>" + flags["SEXED_LOLA"]);
				}
				if(flags["MET_SIMONE"])
				{
					output2("\n<b>* Simone:</b> Met her");
					if(StatTracking.getStat("contests/simone challenge losses") + StatTracking.getStat("contests/simone challenge wins") > 0) output2("\n<b>* Simone, Weight Lift Challenge, Win/Loss Ratio: </b>" + StatTracking.getStat("contests/simone challenge wins") + "/" + StatTracking.getStat("contests/simone challenge losses") + ", of " + (StatTracking.getStat("contests/simone challenge losses") + StatTracking.getStat("contests/simone challenge wins")) + " games");
					if(flags["SEXED_SIMONE"] != undefined) output2("\n<b>* Simone, Times Sexed: </b>" + flags["SEXED_SIMONE"]);
				}
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
				if(flags["FLAHNE_BUBBLED"] != undefined) output2("\n<b>* Flahne, Times Given Cum Bubble: </b>" + flags["FLAHNE_BUBBLED"]);
				if(flags["FLAHNE_SEXED"] != undefined) output2("\n<b>* Flahne, Times Sexed: </b>" + flags["FLAHNE_SEXED"]);
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
			if(flags["MET_BURT"] != undefined || flags["KELLY_MET"] != undefined || flags["MET_SYRI"] != undefined)
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
					if(flags["BURT_DRINKS_BOUGHT"] != undefined) output2("\n<b>* Burt, Drinks Bought Total: </b>" + flags["BURT_DRINKS_BOUGHT"]);
					if(flags["TIMES_FUCKED_BURT"] != undefined) output2("\n<b>* Burt, Times Sexed: </b>" + flags["TIMES_FUCKED_BURT"]);
					if(flags["TIMES_THREE_D_SURPRISE_SEXED"] != undefined) output2("\n<b>* Three-Dee, Times Surprise Sexed: </b>" + flags["TIMES_THREE_D_SURPRISE_SEXED"]);
				}
				// Kelly Golden Honey Bunny Butts!
				if(flags["KELLY_MET"] != undefined && flags["KELLY_ENCOUNTERED_AT_THE_BAR"] != undefined)
				{
					output2("\n<b>* Kelly:</b>");
					if(hours >= 6 && hours < 17) output2(" At work");
					else output2(" Met her");
					if(flags["KELLY_CONFESSED"] != undefined) output2(", Confessed her affection");
					if(flags["KELLY_HAD_A_MEAL_SHARED"] != undefined) output2(", Shared a meal together");
					if(flags["KELLY_ATTRACTION"] != undefined) output2("\n<b>* Kelly, Attraction: </b>" + flags["KELLY_ATTRACTION"] + " %");
					if(flags["KELLY_SEXED"] != undefined) output2("\n<b>* Kelly, Times Sexed: </b>" + flags["KELLY_SEXED"]);
					if(flags["KELLY_BLOWJOBS_GIVEN"] != undefined) output2("\n<b>* Kelly, Times Given Her Blowjobs: </b>" + flags["KELLY_BLOWJOBS_GIVEN"]);
					if(flags["KELLY_HYPERPLAY_COUNT"] != undefined) output2("\n<b>* Kelly, Times Hyperplay: </b>" + flags["KELLY_HYPERPLAY_COUNT"]);
					if(flags["KELLY_HAD_SPECIAL_TAUR_DP"] != undefined) output2("\n<b>* Kelly, Times Had Tauric Double Penetrate: </b>" + flags["KELLY_HAD_SPECIAL_TAUR_DP"]);
					if(flags["KELLY_TIMES_DOUBLESTUFFED_THE_PC"] != undefined) output2("\n<b>* Kelly, Times Getting Double-Stuffed: </b>" + flags["KELLY_TIMES_DOUBLESTUFFED_THE_PC"]);
				}
				// Syributts!
				if(flags["MET_SYRI"] != undefined)
				{
					output2("\n<b>* Syri:</b>");
					if(flags["SYRI_TALKS"] != undefined) output2(" Friend");
					else output2(" Met her");
					if(flags["SYRI_SEEN_PCS_SHIP_CABIN"] != undefined) output2(", She’s seen your ship’s cabin");
					if(flags["ANNOxSYRI_WINCEST"] != undefined) output2(", Sexed her with Anno")
					if(9999 == 0)
					{
						output2(", Crew member");
						if(syriIsCrew()) output2(" (Onboard Ship)");
					}
					if(flags["BET_AGAINST_SYRI"] != undefined)
					{
						output2("\n<b>* Syri, Gaming:</b> Bet against her");
						if(flags["SYRI_WINBET_VAG"] != undefined) output2(", Insisted she fuck your vagina");
					}
					if(flags["TIMES_BET_YOURSELF_AGAINST_SYRI"] != undefined) output2("\n<b>* Syri, Gaming, Times Betting Yourself: </b>" + flags["TIMES_BET_YOURSELF_AGAINST_SYRI"]);
					if(flags["TIMES_WON_AGAINST_SYRI"] != undefined || flags["TIMES_LOST_TO_SYRI"] != undefined) output2("\n<b>* Syri, Gaming, Win/Loss Ratio: </b>" + flags["TIMES_WON_AGAINST_SYRI"] + "/" + flags["TIMES_LOST_TO_SYRI"] + ", of " + (flags["TIMES_WON_AGAINST_SYRI"] + flags["TIMES_LOST_TO_SYRI"]) + " games");
					if(flags["FUCKED_SYRI_COUNT"] != undefined) output2("\n<b>* Syri, Times Sexed: </b>" + flags["FUCKED_SYRI_COUNT"]);
					if(flags["TIMES_BUTTFUCKED_BY_SYRI"] != undefined) output2("\n<b>* Syri, Times She Fucked Your Ass: </b>" + flags["TIMES_BUTTFUCKED_BY_SYRI"]);
					if(flags["SEEN_SYRI_IN_THE_MORNING"] != undefined) output2("\n<b>* Syri, Times Seen Her in the Morning: </b>" + flags["SEEN_SYRI_IN_THE_MORNING"]);
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
				if(flags["ABLE_BATHS"] != undefined) output2("\n<b>* Able, Times Bathed By: </b>" + flags["ABLE_BATHS"]);
				if(flags["ABLE_BUTTSEXED"] != undefined) output2("\n<b>* Able, Times Buttfucked Him: </b>" + flags["ABLE_BUTTSEXED"]);
				if(flags["ABLE_LICKNFUCKED"] != undefined) output2("\n<b>* Able, Times Licked By and Rode Him: </b>" + flags["ABLE_LICKNFUCKED"]);
				if(flags["ABLE_BOTHWAYS"] != undefined) output2("\n<b>* Able, Times Rode and Buttfucked Him: </b>" + flags["ABLE_BOTHWAYS"]);
				variousCount++;
			}
			// Pennybutts
			if(flags["MET_PENNY"] != undefined)
			{
				output2("\n<b><u>U.G.C. Peacekeepers Office</u></b>");
				output2("\n<b>* Penny:</b> Met her");
				if(flags["PENNY_BADGER_BIMBO"] != undefined) output2(", Bimbofied");
				if(flags["PENNY_IS_A_CUMSLUT"] != undefined)
				{
					if(flags["PENNY_HIDING_CUMSLUTTERY"] != undefined)
					{
						output2(", Hiding her");
						if(flags["SEEN_PENNY_HIDE_CUMSLUTTERY"] != undefined) output2(" obvious");
						output2(" cum-sluttery");
					}
					if(flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] != undefined)
					{
						output2(", Allowing others to watch her");
						if(flags["PENNY_BEEN_IN_WATCH_CUMSLUT_MODE_AND_BLOWN_IN_FRONT_OF_PC"] != undefined) output2(" exhibitionist");
						output2(" cum-sluttery");
					}
					if(flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] != undefined)
					{
						output2(", Having others join in sexing her as a");
						if(flags["SEEN_PENNY_BE_A_GANGBANG_SLUT"] != undefined) output2(" gangbanged");
						output2(" cum-slut");
					}
				}
				if(flags["PENNY_AFFECTION"] != undefined) output2("\n<b>* Penny, Affection: </b>" + flags["PENNY_AFFECTION"] + " %");
				if(flags["PENNY_FUTA_TALK"] != undefined) output2("\n<b>* Penny, Lust: </b>" + chars["PENNY"].lust());
				if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] != undefined) output2("\n<b>* Penny, Throbb:</b> Available for purchase");
				if(flags["PENNY_THROBB_USES"] != undefined) output2("\n<b>* Penny, Throbb, Times Used: </b>" + flags["PENNY_THROBB_USES"]);
				if(flags["SEXED_PENNY"] != undefined)
				{
					output2("\n<b>* Penny, Sexual Organs: </b>");
					if(chars["PENNY"].hasCock())
					{
						if(chars["PENNY"].cockVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["PENNY"].cocks[0].cType].toLowerCase() + " cock");
						else output2(GLOBAL.TYPE_NAMES[chars["PENNY"].cocks[0].cType] + " cock");
						if(chars["PENNY"].hasSheath(0) || chars["PENNY"].hasKnot(0))
						{
							output2(" (");
							if(chars["PENNY"].hasSheath(0)) output2("sheathed");
							if(chars["PENNY"].hasSheath(0) && chars["PENNY"].hasKnot(0)) output2(" and ");
							if(chars["PENNY"].hasKnot(0)) output2("knotted");
							output2(")");
						}
						if(chars["PENNY"].hasStatusEffect("Uniball")) output2(" with a uniball");
						else if(chars["PENNY"].balls == 1) output2(" with a testicle");
						else if(chars["PENNY"].balls > 1) output2(" with " + num2Text(chars["PENNY"].balls) + " balls");
					}
					if(chars["PENNY"].hasVagina())
					{
						if(chars["PENNY"].hasCock()) output2(", ");
						if(chars["PENNY"].vaginalVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["PENNY"].vaginas[0].type].toLowerCase() + " vagina");
						else output2(GLOBAL.TYPE_NAMES[chars["PENNY"].vaginas[0].type] + " vagina");
						if(chars["PENNY"].vaginas[0].clits == 1) output2(" with a clit");
						else if(chars["PENNY"].vaginas[0].clits > 1) output2(" with " + num2Text(chars["PENNY"].vaginas[0].clits) + " clits");
					}
					if(chars["PENNY"].hasCock() || chars["PENNY"].hasVagina()) output2(", ");
					if(chars["PENNY"].analVirgin) output2("Virgin asshole");
					else output2("Asshole");
					output2("\n<b>* Penny, Sexual History:</b> Sexed her");
					if(flags["TIMES_FROTTAGED_PENNY"] != undefined) output2(", Frottaged her");
					if(flags["TIMES_PENNY_PAWJOBBED"] != undefined) output2(", She gave a pawjob");
				}
				if(flags["PENNY_TIMES_ANAL_SEXED"] != undefined) output2("\n<b>* Penny, Times Fucked Her Ass: </b>" + flags["PENNY_TIMES_ANAL_SEXED"]);
				if(flags["PENNY_TIMES_OVER_DESK_FUCKED"] != undefined) output2("\n<b>* Penny, Times Fucked Her Over Desk: </b>" + flags["PENNY_TIMES_OVER_DESK_FUCKED"]);
				if(flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"] != undefined) output2("\n<b>* Penny, Times Jacked Her Off With An Onahole: </b>" + flags["TIMES_JACKED_PENNY_OFF_WITH_ONAHOLE"]);
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
			if(flags["MET_DR_HASWELL"] != undefined || flags["KELLY_MET"] != undefined)
			{
				output2("\n<b><u>Xenogen Biotech Laboratory</u></b>");
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
						output2("\n<b>* Kelly, Sky Sap, Containers Collected: </b>" + flags["KELLY_SKYSAP_COLLECT"]);
						if(flags["SYNTHSAP_UNLOCKED"] == undefined && pc.hasStatusEffect("SynthSap Research")) output2(" (Researching... " + prettifyMinutes(pc.getStatusMinutes("SynthSap Research")) + ")");
					}
				}
				variousCount++;
			}
			// Jungles
			if(flags["MET_CUNT_SNAKE"] != undefined || flags["ENCOUNTERED_MIMBRANE"] != undefined || flags["TIMES_MET_FEMZIL"] != undefined || flags["ENCOUNTERED_ZIL"] != undefined || flags["TIMES_MET_NALEEN"] != undefined || flags["TIMES_MET_MALE_NALEEN"] != undefined || flags["TIMES_MET_VENUS_PITCHER"] != undefined || flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"] != undefined || flags["MET_VANAE_MAIDEN"] != undefined || flags["MET_VANAE_HUNTRESS"] != undefined || flags["MET_KEROKORAS"] != undefined || flags["DRYAD_MET"] != undefined)
			{
				output2("\n<b><u>Mhen’gan Jungles</u></b>");
				// Dryad
				if(flags["DRYAD_MET"] != undefined)
				{
					output2("\n<b>* Dryad:</b> Met her");
					if(flags["DRYAD_FUCKED"] != undefined) output2("\n<b>* Dryad, Times Sexed: </b>" + flags["DRYAD_FUCKED"]);
				}
				if(flags["MET_CUNT_SNAKE"] != undefined) output2("\n<b>* Cunt Snake, Times Encountered: </b>" + flags["MET_CUNT_SNAKE"]);
				if(flags["MET_KEROKORAS"] != undefined) output2("\n<b>* Kerokoras, Times Encountered: </b>" + flags["MET_KEROKORAS"]);
				if(flags["ENCOUNTERED_MIMBRANE"] != undefined) output2("\n<b>* Mimbranes, Times Encountered: </b>" + flags["ENCOUNTERED_MIMBRANE"]);
				if(flags["TIMES_MET_NALEEN"] != undefined)
				{
					output2("\n<b>* Naleen Huntress, Times Encountered: </b>" + flags["TIMES_MET_NALEEN"]);
					if(flags["NALEEN_SNUGGLED"] != undefined) output2("\n<b>* Naleen Huntress, Times Snuggled With: </b>" + flags["NALEEN_SNUGGLED"]);
					if(flags["TIMES_WINSEXED_NALEEN"] != undefined || flags["TIMES_LOSS_DOMMED_BY_NALEEN"] != undefined) output2("\n<b>* Naleen Huntress, Times Sexed: </b>" + totalNaleenSexCount());
				}
				if(flags["TIMES_MET_MALE_NALEEN"] != undefined) output2("\n<b>* Male Naleen, Times Encountered: </b>" + flags["TIMES_MET_MALE_NALEEN"]);
				if(flags["MET_VANAE_MAIDEN"] != undefined)
				{
					output2("\n<b>* Vanae Maiden, Times Encountered: </b>" + flags["MET_VANAE_MAIDEN"]);
					if(StatTracking.getStat("characters/maiden vanae/cherrys popped") > 0) output2("\n<b>Vanae Maiden, Total Deflowered: </b>" + StatTracking.getStat("characters/maiden vanae/cherrys popped"));
				}
				if(flags["MET_VANAE_HUNTRESS"] != undefined)
				{
					output2("\n<b>* Vanae Huntress, Times Encountered: </b>" + flags["MET_VANAE_HUNTRESS"]);
					if(flags["VANAE_HUNTRESS_BRED"] != undefined) output2("\n<b>* Vanae Huntress, Times Bred By: </b>" + flags["VANAE_HUNTRESS_BRED"]);
					if(flags["VANAE_MILKBATH_TIMES"] != undefined) output2("\n<b>* Vanae Huntress, Times Received Milkbath By: </b>" + flags["VANAE_MILKBATH_TIMES"]);
				}
				if(flags["TIMES_MET_VENUS_PITCHER"] != undefined) output2("\n<b>* Venus Pitcher, Times Encountered: </b>" + flags["TIMES_MET_VENUS_PITCHER"]);
				if(flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"] != undefined)
				{
					output2("\n<b>* Elder Venus Pitcher, Times Encountered: </b>" + flags["TIMES_VENUS_PITCHER_ELDER_ENCOUNTERED"]);
					if(flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] != undefined) output2("\n<b>* Elder Venus Pitcher, Times Hypnotized By: </b>" + flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"]);
					if(venusSubmission() > 0) output2("\n<b>* Elder Venus Pitcher, Submission: </b>" + formatFloat(venusSubmission(), 1) + " %");
				}
				if(flags["TIMES_MET_FEMZIL"] != undefined) output2("\n<b>* Female Zil, Times Encountered: </b>" + flags["TIMES_MET_FEMZIL"]);
				if(flags["ENCOUNTERED_ZIL"] != undefined)
				{
					output2("\n<b>* Male Zil, Times Encountered: </b>" + flags["ENCOUNTERED_ZIL"]);
					//if(flags["TIMES_LOST_TO_ZIL"] != undefined) output2("\n<b>* Male Zil, Combat, Times Lost To: </b>" + flags["TIMES_LOST_TO_ZIL"]);
					if(flags["TIMES_LOSS_SUCKED_ZIL_MALE"] != undefined) output2("\n<b>* Male Zil, Combat, Times Sucked His Cock Upon Losing: </b>" + flags["TIMES_LOSS_SUCKED_ZIL_MALE"]);
				}
				variousCount++;
			}
			// Resources
			if(flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] != undefined || flags["UTHRA HARVEST DAY"] != undefined || flags["FOUND_MANGO"] != undefined)
			{
				output2("\n<b><u>Mhen’gan Resources</u></b>");
				if(flags["FOUND_MANGO"] != undefined) output2("\n<b>* Mhen’gan Mango, Times Found: </b>" + flags["FOUND_MANGO"]);
				if(flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] != undefined) output2("\n<b>* Oxonium Deposit: </b> Found");
				if(flags["UTHRA HARVEST DAY"] != undefined) output2("\n<b>* Uthra Sap, Days Since Last Harvest: </b>" + (days - flags["UTHRA HARVEST DAY"]));
				
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
				if(flags["ARBETZ_SEX_ORAL"] != undefined) output2("\n<b>* Una, Times Oral Sexed Her: </b>" + flags["ARBETZ_SEX_ORAL"]);
				if(flags["ARBETZ_SEX_HATE_FUCK"] != undefined) output2("\n<b>* Una, Times Hate Fucked Her: </b>" + flags["ARBETZ_SEX_HATE_FUCK"]);
				if(flags["UNA_TALKED"] >= 4)
				{
					output2("\n<b>* Godi & Petr:</b> Met them");
					if(flags["ARBETZ_SEX_ONE_BOY"] != undefined) output2("\n<b>* Godi, Times Sexed: </b>" + flags["ARBETZ_SEX_ONE_BOY"]);
					if(flags["ARBETZ_SEX_TWO_BOYS"] != undefined) output2("\n<b>* Godi & Petr, Times Spitroasted By: </b>" + flags["ARBETZ_SEX_TWO_BOYS"]);
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
				if(flags["DR_BADGER_TURNED_IN"] != undefined) output2(" Inactive, Arrested by the U.G.C.");
				else output2(" Active");
				if(flags["BADGER_QUEST"] <= -3) output2(", Bimbofied");
				variousCount++;
			}
			// Colenso's
			if(flags["ASKED_COLENSO_ABOUT_HIS_THEORIES"] != undefined)
			{
				output2("\n<b><u>Colenso’s Junk</u></b>");
				output2("\n<b>* Colenso:</b> Met him, Asked about his theories");
				variousCount++;
			}
			// Doctor Lash
			if(flags["MET_DR_LASH"] != undefined)
			{
				output2("\n<b><u>Doctor Lash’s Office</u></b>");
				output2("\n<b>* Doctor Lash:</b> Met him");
				variousCount++;
			}
			// Aurora
			if(flags["MET_AURORA"] != undefined)
			{
				output2("\n<b><u>Mechanist’s Shop</u></b>")
				output2("\n<b>* Aurora:</b> Met her");
				if(flags["TARKUS_DESTROYED"] != undefined && flags["DECK13_SHIELDS_ON"] != 1) output2(", <i>Whereabouts unknown</i>");
				else
				{
					if(flags["AURORA_SEEN_AFTER_SPLOSION"] != undefined) output2(", She remains as perky as ever");
					if(silly) output2(", <i>This bat is too fukken kawaii!</i>");
				}
				variousCount++;
			}
			// The Mess!
			if(flags["SHEKKA_TALKED_THE_MESS"] != undefined || metBeth() || flags["MET_DEL"] != undefined || flags["HAS_ORDERED_FOOD_AT_THE_MESS"] != undefined)
			{
				output2("\n<b><u>The Mess</u></b>");
				// Rumors
				if(flags["SHEKKA_TALKED_THE_MESS"] != undefined) output2("\n<b>* Rumors, Shekka:</b> <i>She believes the catering company is abducting people.</i>");
				// Beth
				if(metBeth()) output2("\n<b>* Beth:</b> Met her");
				// Delilah
				if(flags["MET_DEL"] != undefined)
				{
					output2("\n<b>* Delilah:</b> Met her");
					if(flags["TOOK_DELILAHS_BUTTGINITY"] != undefined) output2(", Took her anal virginity");
					if(flags["TIMES_HAD_SEX_WITH_DELILAH_IN_SOME_WAY"] > 0) output2("\n<b>* Delilah, Times Sexed: </b>" + flags["TIMES_HAD_SEX_WITH_DELILAH_IN_SOME_WAY"]);
					if(flags["TIMES_ATE_DELILAH_OUT"] > 0) output2("\n<b>* Delilah, Times Sat on Her Face: </b>" + flags["TIMES_ATE_DELILAH_OUT"]);
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
					if(flags["ANNO_ASLEEP"] != undefined) output2(", Currently sleeping");
					if(!annoNotRecruited())
					{
						output2(", Crew member");
						// Follower stuff
						if(annoIsCrew()) output2(" (Onboard Ship)");
						else if(flags["ANNO_CREWMEMBER"] == 2) output2(" (At Tavros Station)");
					}
					if(!chars["ANNO"].isNude()) output2("\n<b>* Anno, Attire:</b> [anno.Gear]");
					if(flags["ANNOxKAEDE_INTRODUCED"] != undefined) output2("\n<b>* Anno, Times Met with Kaede: </b>" + flags["ANNOxKAEDE_INTRODUCED"]);
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
						output2("\n<b>* Anno, Times Sexed: </b>" + flags["ANNO_SEXED"]);
						if(silly) output2("\n<b>* Anno, Times Sexed by Your Dad: </b>" + (flags["ANNO_SEXED"] + 1 + rand(20)) + " <i>(Approximation)</i>");
					}
					if(flags["ANNO_ANALSEXED"] != undefined) output2("\n<b>* Anno, Times Fucked Her Ass: </b>" + flags["ANNO_ANALSEXED"]);
					if(flags["ANNO_TRIBERATOR_USED"] != undefined) output2("\n<b>* Anno, Times Used Her Vibrator: </b>" + flags["ANNO_TRIBERATOR_USED"]);
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
				if(StatTracking.getStat("contests/shekka sexoff losses") + StatTracking.getStat("contests/shekka sexoff wins") > 0) output2("\n<b>* Shekka, Robot Sex-Off, Win/Loss Ratio: </b>" + StatTracking.getStat("contests/shekka sexoff wins") + "/" + StatTracking.getStat("contests/shekka sexoff losses") + ", of " + (StatTracking.getStat("contests/shekka sexoff losses") + StatTracking.getStat("contests/shekka sexoff wins")) + " games");
				if(flags["TIMES_SEXED_SHEKKA"] != undefined) output2("\n<b>* Shekka, Times Sexed: </b>" + flags["TIMES_SEXED_SHEKKA"]);
				if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] != undefined) output2("\n<b>* Shekka, Times Fucked Her Tail-Vibrator: </b>" + flags["TIMES_TAILVIBED_WITH_SHEKKA"]);
				if(flags["TIMES_SHEKKA_KIRBUED"] != undefined) output2("\n<b>* Shekka, Times Fucked Her Inside a Hazmat Suit: </b>" + flags["TIMES_SHEKKA_KIRBUED"]);
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
					if(flags["BESS_AFFECTION"] != undefined && flags["BESS_AFFECTION"] > 0) output2("\n<b>* [bess.name], Affection: </b>" + flags["BESS_AFFECTION"] + " %");
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
					if(flags["BESS_PC_NAME"] != undefined) output2("\n<b>* [bess.name], Relationship, [bess.HeShe] Calls You: </b>" + StringUtil.toTitleCase(flags["BESS_PC_NAME"]));
					if(flags["BESS_DATES"] != undefined && flags["BESS_DATES"] > 0) output2("\n<b>* [bess.name], Relationship, Times Dated: </b>" + flags["BESS_DATES"]);
					// Attachments/Customization
					if(flags["BESS_BOOBCHANGED"] != undefined && chars["BESS"].hasBreasts()) output2("\n<b>* [bess.name], Body, Breast Size: </b>" + StringUtil.toTitleCase(chars["BESS"].breastCup(0)) + "s");
					if(flags["BESS_CHANGED_CURVES"] != undefined)
					{
						output2("\n<b>* [bess.name], Body, Belly Size: </b>" + formatFloat(chars["BESS"].bellyRating(), 3));
						output2("\n<b>* [bess.name], Body, Hip Size: </b>" + formatFloat(chars["BESS"].hipRating(), 3));
						output2("\n<b>* [bess.name], Body, Posterior Size: </b>" + formatFloat(chars["BESS"].buttRating(), 3));
					}
					if(flags["BESS_BOOBCHANGED"] != undefined && chars["BESS"].hasNipples()) output2("\n<b>* [bess.name], Nipple Type: </b>" + GLOBAL.NIPPLE_TYPE_NAMES[chars["BESS"].breastRows[0].nippleType]);
					if(chars["BESS"].isLactating()) output2("\n<b>* [bess.name], Lactation:</b> Active");
					if(chars["BESS"].hasCock() || chars["BESS"].hasVagina() || flags["BESS_FUCKED"] != undefined)
					{
						if(chars["BESS"].hasCock()) output2("\n<b>* [bess.name], Cum Type: </b>" + GLOBAL.FLUID_TYPE_NAMES[chars["BESS"].cumType]);
						if(chars["BESS"].hasVagina()) output2("\n<b>* [bess.name], Girlcum Type: </b>" + GLOBAL.FLUID_TYPE_NAMES[chars["BESS"].girlCumType]);
						output2("\n<b>* [bess.name], Simulated Sex Organs: </b>");
						if(chars["BESS"].hasCock())
						{
							if(chars["BESS"].cockVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["BESS"].cocks[0].cType].toLowerCase() + " cock");
							else output2(GLOBAL.TYPE_NAMES[chars["BESS"].cocks[0].cType] + " cock");
							if(chars["BESS"].hasSheath(0) || chars["BESS"].hasKnot(0))
							{
								output2(" (");
								if(chars["BESS"].hasSheath(0)) output2("sheathed");
								if(chars["BESS"].hasSheath(0) && chars["BESS"].hasKnot(0)) output2(" and ");
								if(chars["BESS"].hasKnot(0)) output2("knotted");
								output2(")");
							}
							if(chars["BESS"].hasStatusEffect("Uniball")) output2(" with a uniball");
							else if(chars["BESS"].balls == 1) output2(" with a testicle");
							else if(chars["BESS"].balls > 1) output2(" with " + num2Text(chars["BESS"].balls) + " balls");
						}
						if(chars["BESS"].hasVagina())
						{
							if(chars["BESS"].hasCock()) output2(", ");
							if(chars["BESS"].vaginalVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["BESS"].vaginas[0].type].toLowerCase() + " vagina");
							else output2(GLOBAL.TYPE_NAMES[chars["BESS"].vaginas[0].type] + " vagina");
							if(chars["BESS"].vaginas[0].clits == 1) output2(" with a clit");
							else if(chars["BESS"].vaginas[0].clits > 1) output2(" with " + num2Text(chars["BESS"].vaginas[0].clits) + " clits");
						}
						if(chars["BESS"].hasCock() || chars["BESS"].hasVagina()) output2(", ");
						if(chars["BESS"].analVirgin) output2("Virgin asshole");
						else output2("Asshole");
					}
					// Sex-related
					if(flags["BESS_FUCKED"] != undefined)
					{
						if(flags["BESS_PC_SEX_NAME"] != undefined) output2("\n<b>* [bess.name], Preferred Sex Name, [bess.HeShe] Calls You: </b>" + StringUtil.toTitleCase(flags["BESS_PC_SEX_NAME"]));
						if(flags["BESS_SEX_NAME"] != undefined) output2("\n<b>* [bess.name], Preferred Sex Name, You Call [bess.Em]: </b>" + StringUtil.toTitleCase(flags["BESS_SEX_NAME"]));
						if(flags["BESS_SEX_ROLE"] != undefined)
						{
							output2("\n<b>* [bess.name], Sex Role Assumed:</b>");
							if(flags["BESS_SEX_ROLE"] == 0) output2(" Equal Partners");
							if(flags["BESS_SEX_ROLE"] == 1) output2(" Dominant");
							if(flags["BESS_SEX_ROLE"] == 2) output2(" Submissive");
						}
						if(flags["BESS_FUCKED"] > 0) output2("\n<b>* [bess.name], Times Sexed: </b>" + flags["BESS_FUCKED"]);
						if(flags["BESS_INTIMATE_FUCKED"] > 0) output2("\n<b>* [bess.name], Times Intimate Fucked: </b>" + flags["BESS_INTIMATE_FUCKED"]);
					}
				}
				variousCount++;
			}
			// Wastes
			if(flags["MET_GRAY_GOO"] != undefined || flags["ENCOUNTERED_PARASITIC_LAPINARA"] != undefined || (flags["MET_FEMALE_RASKVEL"] != undefined || flags["MET_MALE_RASKVEL_GANG"] != undefined) || flags["MET_SEXBOT_FEMALE_ON_TARKUS"] != undefined || flags["MET_SEXBOT_MALE_ON_TARKUS"] != undefined || flags["MET_SYDIAN_MALE"] != undefined || flags["MET SYDIAN FEMALE"] != undefined)
			{
				output2("\n<b><u>The Wastes</u></b>");
				if(flags["MET_GRAY_GOO"] != undefined) output2("\n<b>* Gray Goo, Times Encountered: </b>" + flags["MET_GRAY_GOO"]);
				if(flags["ENCOUNTERED_PARASITIC_LAPINARA"] != undefined) output2("\n<b>* Female Parasitic Lapinara, Times Encountered: </b>" + flags["ENCOUNTERED_PARASITIC_LAPINARA"]);
				if(flags["MET_FEMALE_RASKVEL"] != undefined)
				{
					output2("\n<b>* Female Raskvel, Times Encountered: </b>" + flags["MET_FEMALE_RASKVEL"]);
					if(flags["TIMES_RODE_RASKVEL_FACE"] != undefined) output2("\n<b>* Female Raskvel, Times Riding Her Face: </b>" + flags["TIMES_RODE_RASKVEL_FACE"]);
				}
				if(flags["MET_MALE_RASKVEL_GANG"] != undefined) output2("\n<b>* Male Raskvel Gang, Times Encountered: </b>" + flags["MET_MALE_RASKVEL_GANG"]);
				if(flags["MET_SEXBOT_FEMALE_ON_TARKUS"] != undefined) output2("\n<b>* Female Sexbots, Times Encountered: </b>" + flags["MET_SEXBOT_FEMALE_ON_TARKUS"]);
				if(flags["MET_SEXBOT_MALE_ON_TARKUS"] != undefined) output2("\n<b>* Male Sexbots, Times Encountered: </b>" + flags["MET_SEXBOT_MALE_ON_TARKUS"]);
				if(flags["MET SYDIAN FEMALE"] != undefined) output2("\n<b>* Female Sydian, Times Encountered: </b>" + flags["MET SYDIAN FEMALE"]);
				if(flags["MET_SYDIAN_MALE"] != undefined)
				{
					output2("\n<b>* Male Sydian, Times Encountered: </b>" + flags["MET_SYDIAN_MALE"]);
					if(flags["TIMES_TAKEN_RUST_BRO_IN_COOCH"] != undefined) output2("\n<b>* Male Sydian, Times Cunt-Fucked By: </b>" + flags["TIMES_TAKEN_RUST_BRO_IN_COOCH"]);
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
			// Embassy
			if(flags["MET_JURO"] != undefined || flags["MET_LYRALLA"] != undefined || flags["MET_NEHZARA"] != undefined)
			{
				output2("\n<b><u>The Embassy</u></b>");
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
					if(flags["NEHZARA_CLOSET_FUCKED"] != undefined) output2("\n<b>* Nehzara, Times Closet Fucked With: </b>" + flags["NEHZARA_CLOSET_FUCKED"]);
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
						output2("\n<b>* [embry.name], Current Balance: </b>" + chars["EMBRY"].credits + " credits");
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
						output2("\n<b>* [embry.name], Times Spent Together: </b>" + flags["EMBRY_SPENT_TIME_WITH"]);
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
						if(flags["EMBRY_LOVE_STYLE"] != undefined) output2("\n<b>* [embry.name], Relationship, Love Style: </b>" + StringUtil.toTitleCase(flags["EMBRY_LOVE_STYLE"]));
					}
					if(flags["SEXED_EMBRY"] != undefined)
					{
						output2("\n<b>* [embry.name], Sexual Organs: </b>");
						if(chars["EMBRY"].hasCock())
						{
							if(chars["EMBRY"].cockVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["EMBRY"].cocks[0].cType].toLowerCase() + " cock");
							else output2(GLOBAL.TYPE_NAMES[chars["EMBRY"].cocks[0].cType] + " cock");
							if(chars["EMBRY"].hasSheath(0) || chars["EMBRY"].hasKnot(0))
							{
								output2(" (");
								if(chars["EMBRY"].hasSheath(0)) output2("sheathed");
								if(chars["EMBRY"].hasSheath(0) && chars["EMBRY"].hasKnot(0)) output2(" and ");
								if(chars["EMBRY"].hasKnot(0)) output2("knotted");
								output2(")");
							}
							if(chars["EMBRY"].hasStatusEffect("Uniball")) output2(" with a uniball");
							else if(chars["EMBRY"].balls == 1) output2(" with a testicle");
							else if(chars["EMBRY"].balls > 1) output2(" with " + num2Text(chars["EMBRY"].balls) + " balls");
						}
						if(chars["EMBRY"].hasVagina())
						{
							if(chars["EMBRY"].hasCock()) output2(", ");
							if(chars["EMBRY"].vaginalVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["EMBRY"].vaginas[0].type].toLowerCase() + " vagina");
							else output2(GLOBAL.TYPE_NAMES[chars["EMBRY"].vaginas[0].type] + " vagina");
							if(chars["EMBRY"].vaginas[0].clits == 1) output2(" with a clit");
							else if(chars["EMBRY"].vaginas[0].clits > 1) output2(" with " + num2Text(chars["EMBRY"].vaginas[0].clits) + " clits");
						}
						if(chars["EMBRY"].hasCock() || chars["EMBRY"].hasVagina()) output2(", ");
						if(chars["EMBRY"].analVirgin) output2("Virgin asshole");
						else output2("Asshole");
						output2("\n<b>* [embry.name], Sexual History:</b> Sexed her");
						if(flags["EMBRY_VAGINAL_SEX_UNLOCKED"] != undefined) output2(", Fucked her pussy");
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
				if(flags["EMMY_ORALED"] != undefined) output2("\n<b>* Emmy, Times She Oral Sexed You: </b>" + flags["EMMY_ORALED"]);
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
			if(flags["MET_ORRYX"] != undefined || flags["LIRIEL_MET"] != undefined || flags["LAST_ANT_ORGY"] != undefined)
			{
				output2("\n<b><u>Gildenmere</u></b>");
				// Liriel, Martians
				if(flags["LIRIEL_MET"] != undefined)
				{
					output2("\n<b>* Liriel:</b> Met her");
					if(flags["LIRIEL_TALK_STAND"] != undefined) output2(", Talked about The Little Green Man stand");
					if(flags["LIRIEL_BUTTSEXED"] != undefined) output2("\n<b>* Liriel, Times She Fucked Your Ass: </b>" + flags["LIRIEL_BUTTSEXED"]);
					if(flags["LIRIEL_TITFUCKED"] != undefined) output2("\n<b>* Liriel, Times Titfucked: </b>" + flags["LIRIEL_TITFUCKED"]);
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
					if(flags["MET_ORRYX"] >= 2 && flags["ORRYX_REP"] != undefined) output2("\n<b>* Orryx, Reputation Level: </b>" + flags["ORRYX_REP"]);
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
					if(flags["ANT_ORGY_COUNT"] != undefined) output2("\n<b>* Horny Myr Soldiers, Times Had Orgy With: </b>" + flags["ANT_ORGY_COUNT"]);
				}
				variousCount++;
			}
			// Gene's Mods
			if(flags["GENES_MODS_ENTERED"] != undefined)
			{
				output2("\n<b><u>Gene’s Mods</u></b>");
				if(flags["GENE_TALKED_TO"] == undefined) output2("\n<b>* Fanfir Man:</b>");
				else output2("\n<b>* Gene:</b>");
				output2(" Met him");
				if(flags["GENE_BELLYRUBS_ENABLED"] != undefined) output2(", Rubbed his belly");
				if(flags["GENE_SUBMISSION_LEVEL"] != undefined)
				{
					output2("\n<b>* Gene, Submission Level: </b>");
					if(flags["GENE_SUBMISSION_LEVEL"] == -1) output2("Refused his advances completely");
					else output2(flags["GENE_SUBMISSION_LEVEL"] + "/10");
				}
				if(flags["GENE_FUCKED"] != undefined) output2("\n<b>* Gene, Times Sexed: </b>" + flags["GENE_FUCKED"]);
				if(flags["GENE_BLOWJOB"] != undefined) output2("\n<b>* Gene, Times Sucked His Cock: </b>" + flags["GENE_BLOWJOB"]);
				if(flags["PURCHASED_GENES_GALO"] != undefined)
				{
					output2("\n<b>* Gene, Unique Sale:</b> GaloMax");
				}
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
				if(flags["NOZZLE_SHOW_PARADISE"] != undefined) output2("\n<b>* Cabaret, “Of Paradise”, Times Watched: </b>" + flags["NOZZLE_SHOW_PARADISE"]);
				if(flags["NOZZLE_SHOW_SHRIKE"] != undefined) output2("\n<b>* Cabaret, “As You Shrike It”, Times Watched: </b>" + flags["NOZZLE_SHOW_SHRIKE"]);
				if(flags["NOZZLE_SHOW_QUARAMARTA"] != undefined) output2("\n<b>* Cabaret, “The Quaramarta”, Times Watched: </b>" + flags["NOZZLE_SHOW_QUARAMARTA"]);
				// Dallyyy
				if(flags["MET_DALLY"] != undefined)
				{
					output2("\n<b>* Dally:</b> Met him");
					if(flags["DALLY_TIPS"] != undefined) output2("\n<b>* Dally, Tip Balance: </b>" + flags["DALLY_TIPS"] + " credits");
					if(flags["DALLY_FAVORS"] != undefined) output2("\n<b>* Dally, Times Performed On Stage With Him: </b>" + flags["DALLY_FAVORS"]);
					if(flags["DALLY_NECTAR_DRANK"] != undefined) output2("\n<b>* Dally, Times Drank His Nectar: </b>" + flags["DALLY_NECTAR_DRANK"]);
					if(flags["CUNTTAILED_DALLY"] != undefined) output2("\n<b>* Dally, Times He Fucked Your Tail Cunt: </b>" + flags["CUNTTAILED_DALLY"]);
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
					if(flags["DANCE_SKILL_EDOTTO"] != undefined) output2("\n<b>* Fazian, Dance Lesson, Edotto Skill Level: </b>" + flags["DANCE_SKILL_EDOTTO"]);
					if(flags["DANCE_SKILL_SUNWALKER"] != undefined) output2("\n<b>* Fazian, Dance Lesson, Sunwalker Skill Level: </b>" + flags["DANCE_SKILL_SUNWALKER"]);
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
						if(flags["IRELLIA_DOUBLE_TEAM_EVER_DONE"] != undefined) output2("\n<b>* Queen Irellia, Times Double-Teamed Her: </b>" + flags["IRELLIA_DOUBLE_TEAM_EVER_DONE"]);
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
				if(flags["MUSHROOM_TRACKER"] != undefined && flags["MUSHROOM_TRACKER"] > 0) output2("\n<b>* Mushroom Garden, Fluids Collected: </b>" + flags["MUSHROOM_TRACKER"] + " mLs");
				// Yarasta
				if(flags["MET_YARASTA"] != undefined) output2("\n<b>* Yarasta:</b> Met her");
				if(flags["SEXED_YARASTA"] != undefined) output2("\n<b>* Yarasta, Times Sexed: </b>" + flags["SEXED_YARASTA"]);
				// Yummy TiTS
				if(flags["MET_GIALA"] != undefined) output2("\n<b>* Giala:</b> Met her");
				if(flags["SEXED_GIALA"] != undefined) output2("\n<b>* Giala, Times Sexed: </b>" + flags["SEXED_GIALA"]);
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
						if(flags["LIEVE_VENOM_USED"] != undefined) output2("\n<b>* Lieve, Times Used Venom: </b>" + flags["LIEVE_VENOM_USED"]);
						if(flags["FUCKED_LIEVE"] != undefined) output2("\n<b>* Lieve, Times Sexed: </b>" + flags["FUCKED_LIEVE"]);
						if(flags["FUCKED_LIEVE_SOLO"] != undefined) output2("\n<b>* Lieve, Times Fucked Her Solo: </b>" + flags["FUCKED_LIEVE_SOLO"]);
						if(flags["FUCKED_TRENCHWIVES"] != undefined) output2("\n<b>* Lieve, Times Fucked Her Trenchwives: </b>" + flags["FUCKED_TRENCHWIVES"]);
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
					output2("\n<b>* Renvra, Egg Fertility: </b>" + formatFloat(chars["RENVRA"].cumQualityRaw, 1) + " %");
				}
				variousCount++;
			}
			// Sellera
			if(flags["MANOR_WARROOM_ENTERED"] != undefined || flags["MANOR_ADMINROOM_ENTERED"] != undefined)
			{
				output2("\n<b><u>Kressia Manor and Federation War Room</u></b>");
				output2("\n<b>* Sellera:</b> Met her");
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
				// Annarie and Shiare
				if(flags["MET_ANARRIE"] != undefined)
				{
					output2("\n<b>* Annarie:</b> Met her");
					if(flags["FUCKED_ANARRIE"] != undefined) output2(", Sexed her");
				}
				if(flags["MET_SHIARE"] != undefined)
				{
					output2("\n<b>* Shiare:</b> Met her");
					if(flags["FUCKED_SHIARE"] != undefined) output2(", Sexed her");
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
				if(flags["NYREAN_SPOILS"] != undefined) output2("\n<b>* Palace, Last Received Royal Spoils: </b>" + prettifyMinutes(GetGameTimestamp() - flags["NYREAN_SPOILS"]) + " ago");
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
					if(flags["FUCKED_TAIVRA"] != undefined) output2(", Sexed her");
					if(flags["FUCKED_BY_TAIVRA"] != undefined) output2(", Fucked by her");
					if(flags["TAIVRA_FOOTJOBBED"] != undefined) output2(", Footjob by her");
					if(flags["TAIVRA_FERTILE"] != undefined)
					{
						output2("\n<b>* Queen Taivra, Fertility:</b>");
						if(taivraHasFertileEggs()) output2(" Has fertile eggs");
						else output2(" Normal");
						output2("\n<b>* Queen Taivra, Last Fertilized Her: </b>" + prettifyMinutes(GetGameTimestamp() - flags["TAIVRA_FERTILE"]) + " ago");
					}
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
				variousCount++;
			}
			// No Myr's Land
			if(flags["ENCOUNTERED_LANDMINES"] != undefined || flags["MET_ADULT_COCKVINE"] != undefined || flags["MET_COCKVINE_SEEDLING"] != undefined || flags["MET_GOLD_DESERTER"] != undefined || flags["MET_RED_DESERTER"] != undefined)
			{
				output2("\n<b><u>No Myr’s Land</u></b>");
				if(flags["ENCOUNTERED_LANDMINES"] != undefined)
				{
					output2("\n<b>* Landmines, Times Encountered: </b>" + flags["ENCOUNTERED_LANDMINES"]);
					if(flags["DISARMED_LANDMINES"] != undefined) output2("\n<b>* Landmines, Total Disarmed: </b>" + flags["DISARMED_LANDMINES"]);
				}
				if(flags["MET_ADULT_COCKVINE"] != undefined)
				{
					output2("\n<b>* Adult Cockvine, Times Encountered: </b>" + flags["MET_ADULT_COCKVINE"]);
					if(flags["FUCKED_ADULT_COCKVINE"] != undefined) output2("\n<b>* Adult Cockvine, Times Sexed: </b>" + flags["FUCKED_ADULT_COCKVINE"]);
				}
				if(flags["MET_COCKVINE_SEEDLING"] != undefined) output2("\n<b>* Cockvine Seedling, Times Encountered: </b>" + flags["MET_COCKVINE_SEEDLING"]);
				if(flags["MET_GOLD_DESERTER"] != undefined)
				{
					var goldMyrDeserterName:String = "Gold Myr Deserter";
					if(flags["KNOW_GOLD_MYR_NAME"] != undefined) goldMyrDeserterName = "Lys";
					output2("\n<b>* " + goldMyrDeserterName + "</b>");
					if(flags["GOLD_MYR_DESERTER_BEATEN"] != undefined && flags["GOLD_MYR_DESERTER_BEATEN"] >= 5) output2(" <b>(Non-hostile)</b>");
					output2("<b>, Times Encountered: </b>" + flags["MET_GOLD_DESERTER"]);
					if(flags["GAVE_LYS_FLOWER"] != undefined)
					{
						output2(", Gave her a flower");
						if(flags["GAVE_LYS_FLOWER"] != 1) output2(" " + flags["GAVE_LYS_FLOWER"] + " times");
					}
					else if(pc.hasItem(new VenusBloom()) && flags["ENABLE_LYS_FLOWER"] != undefined) output2(", <i>Give her a flower!</i>");
					if(flags["GOLD_DILDOED"] != undefined) output2("\n<b>* " + goldMyrDeserterName + ", Times Used Dildo: </b>" + flags["GOLD_DILDOED"]);
				}
				if(flags["MET_RED_DESERTER"] != undefined)
				{
					var redMyrDeserterName:String = "Red Myr Deserter";
					if(flags["KNOW_GOLD_MYR_NAME"] != undefined) redMyrDeserterName = "Briha";
					output2("\n<b>* " + redMyrDeserterName + "</b>");
					if(flags["RED_MYR_DESERTER_BEATEN"] != undefined && flags["RED_MYR_DESERTER_BEATEN"] >= 5) output2(" <b>(Non-hostile)</b>");
					output2("<b>, Times Encountered: </b>" + flags["MET_RED_DESERTER"]);
					if(flags["RED_DILDOED"] != undefined) output2("\n<b>* " + redMyrDeserterName + ", Times Used Dildo: </b>" + flags["RED_DILDOED"]);
				}
				variousCount++;
			}
			// Wetraxxel Den
			if(flags["MET_WETRA_HOUND"] != undefined || flags["MET_WETRAXXEL_BRAWLER"] != undefined)
			{
				output2("\n<b><u>Wetraxxel Den</u></b>");
				if(flags["MET_WETRA_HOUND"] != undefined) output2("\n<b>* Wetra Hound, Times Encountered: </b>" + flags["MET_WETRA_HOUND"]);
				if(flags["MET_WETRAXXEL_BRAWLER"] != undefined)
				{
					output2("\n<b>* Wetraxxel, Times Encountered: </b>" + flags["MET_WETRAXXEL_BRAWLER"]);
					if(flags["WETRAXXEL_SUBMISSION"] != undefined)output2("\n<b>* Wetraxxel, Submission Level: </b>" + flags["WETRAXXEL_SUBMISSION"] + "/10");
				}
				variousCount++;
			}
			// Deep Caverns
			if(flags["MET_GOO_KNIGHT"] != undefined || flags["MET_INFECTED_MYR_FEMALE"] != undefined || flags["MET_INFECTED_MYR_MALE"] != undefined || flags["MET_NYREA_ALPHA"] != undefined || flags["MET_NYREA_BETA"] != undefined || flags["CRYSTALGOO_T1_ENCOUNTERS"] != undefined || flags["CRYSTALGOO_T2_ENCOUNTERS"] != undefined )
			{
				output2("\n<b><u>The Deep Caverns</u></b>");
				if(flags["CRYSTALGOO_T1_ENCOUNTERS"] != undefined) output2("\n<b>* Ganrael Ambusher, Times Encountered: </b>" + flags["CRYSTALGOO_T1_ENCOUNTERS"]);
				if(flags["CRYSTALGOO_T2_ENCOUNTERS"] != undefined) output2("\n<b>* Ganrael Deadeye, Times Encountered: </b>" + flags["CRYSTALGOO_T2_ENCOUNTERS"]);
				if(flags["MET_GOO_KNIGHT"] != undefined) output2("\n<b>* Ganraen Knight, Times Encountered: </b>" + flags["MET_GOO_KNIGHT"]);
				if(flags["MET_INFECTED_MYR_FEMALE"] != undefined) output2("\n<b>* Female Infected Myr, Times Encountered: </b>" + flags["MET_INFECTED_MYR_FEMALE"]);
				if(flags["MET_INFECTED_MYR_MALE"] != undefined) output2("\n<b>* Male Infected Myr, Times Encountered: </b>" + flags["MET_INFECTED_MYR_MALE"]);
				if(flags["MET_NYREA_ALPHA"] != undefined) output2("\n<b>* Alpha Nyrean Huntress, Times Encountered: </b>" + flags["MET_NYREA_ALPHA"]);
				if(flags["MET_NYREA_BETA"] != undefined) output2("\n<b>* Beta Nyrean Huntress, Times Encountered: </b>" + flags["MET_NYREA_BETA"]);
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
		
		if(showID == "Uveto" || showID == "All")
		{
			// Nayna
			if(flags["MET_NAYNA"] != undefined)
			{
				output2("\n<b><u>Geological Survey</u></b>");
				output2("\n<b>* Nayna:</b> Met her");
				if(flags["NAYNA_PISSED"] != undefined) output2(", Pissed off");
				if(flags["NAYNA_HUGS"] != undefined) output2("\n<b>* Nayna, Times Hugged Her: </b>" + flags["NAYNA_HUGS"]);
				if(flags["NAYNA_BLOWN"] != undefined) output2("\n<b>* Nayna, Times Given Her Blowjobs: </b>" + flags["NAYNA_BLOWN"]);
				if(flags["NAYNA_FUCKED"] != undefined) output2("\n<b>* Nayna, Times Fucked Her Vagina: </b>" + flags["NAYNA_FUCKED"]);
				variousCount++;
			}
			// Nerrasa
			if(flags["MET_NERRASA"] != undefined)
			{
				output2("\n<b><u>Last Chance</u></b>");
				output2("\n<b>* Nerrasa:</b> Met her");
				if(flags["NERRASAS_PET"] != undefined) output2(", You’re her pet");
				if(flags["NERRASA_FUCKED"] != undefined) output2("\n<b>* Nerrasa, Times Sexed: </b>" + flags["NERRASA_FUCKED"]);
				variousCount++;
			}
			// Sheriff's Office
			if(flags["UVETO_LUNA_RESCUES"] != undefined || flags["UVETO_JEROME_RESCUES"] != undefined || flags["UVETO_JERYNN_RESCUES"] != undefined)
			{
				output2("\n<b><u>Sheriff’s Office</u></b>");
				if(flags["UVETO_LUNA_RESCUES"] != undefined) output2("\n<b>* Luna, Times Rescued By: </b>" + flags["UVETO_LUNA_RESCUES"]);
				if(flags["UVETO_JEROME_RESCUES"] != undefined) output2("\n<b>* Jerome, Times Rescued By: </b>" + flags["UVETO_JEROME_RESCUES"]);
				if(flags["UVETO_JERYNN_RESCUES"] != undefined) output2("\n<b>* Jerynn, Times Rescued By: </b>" + flags["UVETO_JERYNN_RESCUES"]);
				variousCount++;
			}
			// Ice Plains
			if(flags["9999"] != undefined || flags["9999"] != undefined || flags["UVIP_J46_SEARCHED"] != undefined)
			{
				output2("\n<b><u>Ice Plains</u></b>");
				if(flags["9999"] != undefined) output2("\n<b>* Korgonne, Times Encountered: </b>" + flags["9999"]);
				if(flags["9999"] != undefined) output2("\n<b>* Stormguard Lancer, Times Encountered: </b>" + flags["9999"]);
				// Abandoned Outpost
				if(flags["UVIP_J46_SEARCHED"] != undefined) output2("\n<b>* Abandoned Outpost:</b> Found, Looted camp");
				variousCount++;
			}
			// Resources
			if(flags["9999"] != undefined)
			{
				output2("\n<b><u>Uvetan Resources</u></b>");
				if(flags["9999"] != undefined) output2("\n<b>* Oxonium Deposit: </b> Found");
				
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
		
		// Nothing recorded
		if(variousCount == 0)
		{
			output2("\n<b><u>Not Available</u></b>");
			output2("\n* <i>No encounter data has been logged</i>");
			if(showID != "All") output2("<i> at this location</i>");
			output2("<i>.</i>");
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
			if(9999 == 0)
			{
				output2(", Crew member");
				if(daneIsCrew()) output2(" (Onboard Ship)");
			}
			if(flags["LOST_TO_DANE_ON_MHENGA"] != undefined || flags["TAURFUCKED_DANE"] != undefined)
			{
				output2("\n<b>* Dane, Sexual History:</b> Sexed him");
				if(flags["LOST_TO_DANE_ON_MHENGA"] != undefined) output2(", He fucked your ass");
				if(flags["TAURFUCKED_DANE"] != undefined) output2(", Fucked him as a centaur");
			}
			roamCount++;
		}
		// Kaede
		if(hasMetKaede())
		{
			output2("\n<b>* Kaede:</b> Met her");
			if(flags["ANNOxKAEDE_INTRODUCED"] != undefined) output2(", Seen with Anno");
			if(flags["PUPPYSLUTMAS_2014"] != undefined) output2(", Seen on Ausaril");
			if(flags["KAEDE_MYRELLION_ENCOUNTER"] != undefined) output2(", Seen on Myrellion");
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
			if(flags["KAEDE_FUCKED"] != undefined) output2("\n<b>* Kaede, Times Sexed: </b>" + flags["KAEDE_FUCKED"]);
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
		// Kirobutts!
		if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1 && flags["KIRO_BAR_MET"] != undefined)
		{
			output2("\n<b>* Kiro:</b>");
			if(flags["KIRO_DISABLED_MINUTES"] > 0) output2(" Away");
			else output2(" Active");
			output2("\n<b>* Kiro, Trust: </b>" + kiroTrust() + " %");
			if(flags["KIRO_DRINKING_CONTEST_RESULTS"] != undefined)
			{
				output2("\n<b>* Kiro, Drinking Contest, Last Result:</b>");
				if(flags["KIRO_DRINKING_CONTEST_RESULTS"] >= 0) output2(" Won against her");
				if(flags["KIRO_DRINKING_CONTEST_RESULTS"] == 0) output2(" Cheated against her");
				if(flags["KIRO_DRINKING_CONTEST_RESULTS"] < 0) output2(" Lost against her");
				if(StatTracking.getStat("contests/kiro drinkoff losses") + StatTracking.getStat("contests/kiro drinkoff wins") > 0) output2("\n<b>* Kiro, Drinking Contest, Win/Loss Ratio: </b>" + StatTracking.getStat("contests/kiro drinkoff wins") + "/" + StatTracking.getStat("contests/kiro drinkoff losses") + ", of " + (StatTracking.getStat("contests/kiro drinkoff losses") + StatTracking.getStat("contests/kiro drinkoff wins")) + " games");
			}
			output2("\n<b>* Kiro, Testicle Size: </b>" + prettifyLength(chars["KIRO"].ballDiameter()) + " across, " + prettifyLength(chars["KIRO"].ballSize()) + " around, each");
			if(flags["KIRO_FUCKED_DURING_RESCUE"] != undefined || flags["KIRO_DEEPTHROATED_YOU"] != undefined || flags["KIRO_BALLJOBBED_YOU"] != undefined || flags["KIRO_X_SAEN_HAPPENED"] != undefined || flags["PUMPED_KIRO_PUSSY"] != undefined || flags["KIRO_ORGIED"] != undefined)
			{
				output2("\n<b>* Kiro, Sexual Organs: </b>");
				if(chars["KIRO"].hasCock())
				{
					if(chars["KIRO"].cockVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["KIRO"].cocks[0].cType].toLowerCase() + " cock");
					else output2(GLOBAL.TYPE_NAMES[chars["KIRO"].cocks[0].cType] + " cock");
					if(chars["KIRO"].hasSheath(0) || chars["KIRO"].hasKnot(0))
					{
						output2(" (");
						if(chars["KIRO"].hasSheath(0)) output2("sheathed");
						if(chars["KIRO"].hasSheath(0) && chars["KIRO"].hasKnot(0)) output2(" and ");
						if(chars["KIRO"].hasKnot(0)) output2("knotted");
						output2(")");
					}
					if(chars["KIRO"].hasStatusEffect("Uniball")) output2(" with a uniball");
					else if(chars["KIRO"].balls == 1) output2(" with a testicle");
					else if(chars["KIRO"].balls > 1) output2(" with " + num2Text(chars["KIRO"].balls) + " balls");
				}
				if(chars["KIRO"].hasVagina())
				{
					if(chars["KIRO"].hasCock()) output2(", ");
					if(chars["KIRO"].vaginalVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["KIRO"].vaginas[0].type].toLowerCase() + " vagina");
					else output2(GLOBAL.TYPE_NAMES[chars["KIRO"].vaginas[0].type] + " vagina");
					if(chars["KIRO"].vaginas[0].clits == 1) output2(" with a clit");
					else if(chars["KIRO"].vaginas[0].clits > 1) output2(" with " + num2Text(chars["KIRO"].vaginas[0].clits) + " clits");
				}
				if(chars["KIRO"].hasCock() || chars["KIRO"].hasVagina()) output2(", ");
				if(chars["KIRO"].analVirgin) output2("Virgin asshole");
				else output2("Asshole");
				output2("\n<b>* Kiro, Sexual History:</b> Sexed her");
				if(flags["KIRO_X_SAEN_HAPPENED"] != undefined) output2(", Sexed her with Saendra");
				if(flags["KIRO_DEEPTHROATED_YOU"] != undefined) output2(", She deepthroated you");
				if(flags["KIRO_BALLJOBBED_YOU"] != undefined) output2(", She gave you a balljob");
				if(flags["PUMPED_KIRO_PUSSY"] != undefined) output2(", Pumped her pussy");
				if(flags["KIRO_ORGIED"] != undefined)
				{
					output2("\n<b>* Kiro, Times Had Orgy with You, Flahne, Miko, Mai and Mi’dee: </b>" + flags["KIRO_ORGIED"]);
					if(flags["KIRO_ORGY_DATE"] != undefined && ((flags["KIRO_ORGY_DATE"] + 2) < days)) output2(", Last was " + (days - flags["KIRO_ORGY_DATE"]) + " days ago");
				}
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
			if(flags["SAEN MET AT THE BAR"] != undefined) output2("\n<b>* Saendra, Affection: </b>" + saendraAffection() + " % (" + flags["SAENDRA_MAX_AFFECTION"] + " % Max)");
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
			if(flags["SAENDRA TIMES SEXED"] != undefined)
			{
				output2("\n<b>* Saendra, Sexual Organs: </b>");
				if(chars["SAENDRA"].hasCock())
				{
					if(chars["SAENDRA"].cockVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["SAENDRA"].cocks[0].cType].toLowerCase() + " cock");
					else output2(GLOBAL.TYPE_NAMES[chars["SAENDRA"].cocks[0].cType] + " cock");
					if(chars["SAENDRA"].hasSheath(0) || chars["SAENDRA"].hasKnot(0))
					{
						output2(" (");
						if(chars["SAENDRA"].hasSheath(0)) output2("sheathed");
						if(chars["SAENDRA"].hasSheath(0) && chars["SAENDRA"].hasKnot(0)) output2(" and ");
						if(chars["SAENDRA"].hasKnot(0)) output2("knotted");
						output2(")");
					}
					if(chars["SAENDRA"].hasStatusEffect("Uniball")) output2(" with a uniball");
					else if(chars["SAENDRA"].balls == 1) output2(" with a testicle");
					else if(chars["SAENDRA"].balls > 1) output2(" with " + num2Text(chars["SAENDRA"].balls) + " balls");
				}
				if(chars["SAENDRA"].hasVagina())
				{
					if(chars["SAENDRA"].hasCock()) output2(", ");
					if(chars["SAENDRA"].vaginalVirgin) output2("Virgin " + GLOBAL.TYPE_NAMES[chars["SAENDRA"].vaginas[0].type].toLowerCase() + " vagina");
					else output2(GLOBAL.TYPE_NAMES[chars["SAENDRA"].vaginas[0].type] + " vagina");
					if(chars["SAENDRA"].vaginas[0].clits == 1) output2(" with a clit");
					else if(chars["SAENDRA"].vaginas[0].clits > 1) output2(" with " + num2Text(chars["SAENDRA"].vaginas[0].clits) + " clits");
				}
				if(chars["SAENDRA"].hasCock() || chars["SAENDRA"].hasVagina()) output2(", ");
				if(chars["SAENDRA"].analVirgin) output2("Virgin asshole");
				else output2("Asshole");
				output2("\n<b>* Saendra, Sexual History:</b> Sexed her");
				if(flags["KIRO_X_SAEN_HAPPENED"] != undefined) output2(", Sexed her with Kiro");
				output2("\n<b>* Saendra, Times Sexed: </b>" + flags["SAENDRA TIMES SEXED"]);
			}
			roamCount++;
		}
		// Shade
		if(flags["MET_KARA"] != undefined)
		{
			output2("\n<b>* Shade:</b> Met her");
			if(flags["TOLD_SHADE_SHES_YER_SIS"] != undefined) output2(", Told her she’s your sister");
			if(flags["KQ2_SHADE_DEAD"] != undefined || flags["SHADE_DISABLED"] == 1) output2(", Inactive");
			else if(shadeAtTheBar()) output2(", Active (On Myrellion)");
			else if(flags["SHADE_ON_UVETO"] != undefined) output2(", Active (On Uveto)");
			if(flags["SHADE_GOT_HELP_WITH_LAYING"] != undefined)
			{
				output2("\n<b>* Shade, Tail Cunt:</b> Helped her with laying egg");
				if(flags["SHADE_INSEMINATION_COUNTER"] != undefined && flags["SHADE_INSEMINATION_COUNTER"] >= 20) output2(", Ready to lay another egg!");
			}
			if(flags["SHADE_TALKED_ABOUT_MODS"] != undefined)
			{
				if(chars["SHADE"].isLactating()) output2("\n<b>* Shade, Milk Type: </b>" + GLOBAL.FLUID_TYPE_NAMES[chars["SHADE"].milkType]);
			}
			if(flags["SEXED_SHADE"] != undefined) output2("\n<b>* Shade, Times Sexed: </b>" + flags["SEXED_SHADE"]);
			if(flags["TAKEN_SHADES_HARDLIGHT"] != undefined) output2("\n<b>* Shade, Times Fucked by Her Hardlight Strap-on: </b>" + flags["TAKEN_SHADES_HARDLIGHT"]);
			if(flags["SHADE_BOOBWORSHIP"] != undefined) output2("\n<b>* Shade, Times Worshipped Her Boobs: </b>" + flags["SHADE_BOOBWORSHIP"]);
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
		
		// Misc: (Optional)
		output2("\n\n" + blockHeader("Miscellaneous", false));
		var miscCount:int = 0;
		
		// Resources, rare elements, etc.
		if(flags["OXONIUM_FOUND"] != undefined)
		{
			output2("\n<b><u>Resources</u></b>");
			// Oxonium
			if(flags["OXONIUM_FOUND"] != undefined) output2("\n<b>* Oxonium Deposits Found, Total: </b>" + flags["OXONIUM_FOUND"]);
			miscCount++;
		}
		// Super rare and weird TF items/sex toys - regular rare items/armor/weapons can be omitted
		if(flags["BUTTSLUTINATOR"] != undefined || flags["SYNTHSHEATH_ACQUIRED"] != undefined || flags["SYNTHSHEATH_TWO_FOUND"] != undefined || flags["LOOTED_COCKBOX"] != undefined || flags["ZODEE_GALOQUEST"] != undefined)
		{
			output2("\n<b><u>Suspicious Items</u></b>");
			// Buttslutinator Mark 2
			if(flags["BUTTSLUTINATOR"] != undefined)
			{
				output2("\n<b>* Buttslutinator Mark II, Times Used:</b> " + flags["BUTTSLUTINATOR"]);
			}
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
				if(!CodexManager.entryViewed("SynthSheath")) output2("\n<b>* ???, Equine Phallus Found, Total: </b>");
				else output2("\n<b>* Xenogen Biotech, SynthSheath, Total Found: </b>");
				var horseCocksTotal:int = 0;
				if(flags["SYNTHSHEATH_ACQUIRED"] != undefined) horseCocksTotal++;
				if(flags["SYNTHSHEATH_TWO_FOUND"] != undefined) horseCocksTotal++;
				output2(String(horseCocksTotal));
			}
			miscCount++;
		}
		// Illegal items... Penny's gonna getcha!
		if(CodexManager.entryViewed("Dumbfuck") || CodexManager.entryViewed("Gush") || CodexManager.entryViewed("The Treatment") || flags["PENNY_THROBB_PURCHASE_UNLOCKED"] != undefined || flags["PENNY_THROBB_USES"] != undefined || flags["TIMES_THROBB_USED"] != undefined)
		{
			output2("\n<b><u>Illegal Items</u></b>");
			// Dumbfuck
			if(CodexManager.entryViewed("Dumbfuck"))
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
			if(CodexManager.entryViewed("Gush"))
			{
				output2("\n<b>* Gush:</b> Known");
				if(flags["USED_GUSH"] != undefined) output2(", Used");
			}
			// Throbb
			if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] != undefined || flags["PENNY_THROBB_USES"] != undefined || flags["TIMES_THROBB_USED"] != undefined)
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
		// Sexploration: Porny Smuts
		if(flags["LETS_FAP_ARCHIVES"] != undefined)
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
					var unlockLength:Number = 10080;
					if(flags["EARLY_LETS_FAPS"] != undefined) unlockLength = 7200;
					output2(", Next video release");
					if(GetGameTimestamp() - flags["LETS_FAP_RELEASE_TIMER"] < unlockLength) output2(" ready after " + prettifyMinutes(unlockLength - (GetGameTimestamp() - flags["LETS_FAP_RELEASE_TIMER"])));
					else output2(" at 13:00");
				}
			}
			miscCount++;
		}
		// Sexploration: The Sex Toys
		if(flags["NIVAS_BIONAHOLE_USES"] != undefined || flags["SYRI_BIONAHOLE_USES"] != undefined || flags["TAMANI_HOLED"] != undefined || flags["GRAVCUFFS_USES"] != undefined || flags["HOVERHOLE_USES"] != undefined || flags["BUBBLE_BUDDIED"] != undefined || flags["EGG_TRAINER_INSTALLED"] != undefined || pc.hasItem(new EggTrainer()))
		{
			output2("\n<b><u>Sex Toys</u></b>");
			// BionaHoles
			if(flags["NIVAS_BIONAHOLE_USES"] != undefined) output2("\n<b>* BionaHole, Nivas Oxonef, Times Used: </b>" + flags["NIVAS_BIONAHOLE_USES"]);
			if(flags["SYRI_BIONAHOLE_USES"] != undefined) output2("\n<b>* BionaHole, Syri, Times Used: </b>" + flags["SYRI_BIONAHOLE_USES"]);
			if(flags["TAMANI_HOLED"] != undefined) output2("\n<b>* BionaHole, Tamani, Times Used: </b>" + flags["TAMANI_HOLED"]);
			// Grav-Cuffs
			if(flags["GRAVCUFFS_USES"] != undefined) output2("\n<b>* Grav-Cuffs, Times Used: </b>" + flags["GRAVCUFFS_USES"]);
			// Hover Hole
			if(flags["HOVERHOLE_USES"] != undefined) output2("\n<b>* Hovering Pocket-Pussy, Times Used: </b>" + flags["HOVERHOLE_USES"]);
			// Bubble Buddy
			if(flags["BUBBLE_BUDDIED"] != undefined) output2("\n<b>* TamaniCorp, Bubble Buddy, Times Used: </b>" + flags["BUBBLE_BUDDIED"]);
			// Egg Trainer
			if(flags["EGG_TRAINER_INSTALLED"] != undefined || pc.hasItem(new EggTrainer()))
			{
				output2("\n<b>* TamaniCorp, Egg Trainer:</b>");
				if(flags["EGG_TRAINER_INSTALLED"] != undefined) output2(" Installed");
				else output2(" Acquired");
				if(flags["EGG_TRAINING_TIMES"] != undefined)
				{
					output2(", Used");
					if(flags["EGG_TRAINING_TIMES"] > 1) output2(" " + flags["EGG_TRAINING_TIMES"] + " times");
				}
				if(flags["EGG_TRAINING"] != undefined) output2("\n<b>* TamaniCorp, Egg Trainer, Training Level: </b>" + flags["EGG_TRAINING"]);
				if(flags["CARRY_TRAINING_TIMES"] != undefined) output2("\n<b>* TamaniCorp, Egg Trainer, Times Carry Training: </b>" + flags["CARRY_TRAINING_TIMES"]);
			}
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

