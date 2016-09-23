/* Alternate Item Tooltips for Awesomes. */

public function altTooltip(itemName:String = "none"):String
{
	var tooltip:String = "";
	
	switch(itemName)
	{
		// Consumables
		case "KerokorasVenom":
			tooltip += "A vial of ";
			if(silly) tooltip += "k";
			else tooltip += "c";
			tooltip += "oncentrated kerokoras venom. The liquid sloshes around as you move the bottle, and smells like sweet syrup. The volatile chemistry of the kerokoras will probably affect your body. Given your nanomachine laced immune system, you imagine it’ll have you looking like them in no time.";
			break;
		case "MhengaMango":
			tooltip += "This tropical jungle fruit is native to the wilds of Mhen’ga. It is known for being extremely ripe and sweet, even long after falling from the tree.";
			if(silly) tooltip += "\n\nFor some reason, you find the mango to be completely <i>irresistible</i>....";
			break;
		case "MightyTight":
			tooltip += "This is a colorfully-packaged box featuring some holovid sales girl.";
			if(!silly) tooltip += " Equally colorful lettering informs you that this is an after-sex drug which tightens vaginas and asses that have gotten stretched out by too much attention or excessively hung playmates.";
			else tooltip += "\n\n<i>“Hi, Milly Bayes here with Mighty Tight! Gotten knotted one too many times? Stopped by New Texas and ran with the bulls? Do you feel like you’re just worn out down there? J’ejune Pharmaceutical has your back with Mighty Tight! Mighty Tight is guaranteed to tighten your cooch, leaving you fresh and ready to party some more! Not only that, Mighty Tight works on asses too! Put the squeeze on your playmates with Mighty Tight!”</i>";
			tooltip += "\n\nBelow this, in much smaller text, is a warning informing you <b>not to take Mighty Tight more than twice every four hours</b>. It also lists off a long string of minor potential side effects. Within the colorful packaging is a dull pink pill.";
			break;
		case "Sterilex":
			tooltip += "This is a colorfully-packaged box featuring some holovid sales girl.";
			if(!silly) tooltip += " Equally colorful lettering informs you that this is a powerful one-use contraceptive which is guaranteed to prevent pregnancy without impacting sexual performance.";
			else tooltip += "\n\n<i>“Hi, Milly Bayes here with new Sterilex! Getting ready for an orgy? Making sure your night on the town doesn’t turn sour? Just not ready to start a family with that special someone? Well now J’ejune Pharmaceutical is there for you with Sterilex! Sterilex’s powerful fast-acting agents provide you with twenty-four full hours of protection for any and all of your sexual organs, with no long-term hazards to your fertility! Don’t rely on condoms or other pills! Get protection you can trust, with Sterilex!”</i>";
			tooltip += "\n\nBelow this, in much smaller text, is a warning informing you <b>not to take Sterilex more than once within twenty-four hours</b>. It also lists off a long string of minor potential side effects. Within the colorful packaging is a dull gray pill.";
			break;
		case "SumaCream":
		case "SumaCreamWhite":
		case "SumaCreamBlack":
			tooltip += "This ‘beauty cream’ is actually a small";
			if(itemName == "SumaCreamWhite") tooltip += " ivory";
			if(itemName == "SumaCreamBlack") tooltip += " onyx";
			tooltip += " bead, roughly the size of a pearl. The exterior is a flexible plastic that protects the cream inside from getting everywhere.";
			if(!CodexManager.entryViewed("Suma Cream")) tooltip += "\n\n<i>(Be sure to check your codex for more information.)</i>";
			break;
		
		// Accessories
		case "Siegwulfe":
			if(chars["WULFE"].isBimbo()) tooltip += "A sleek chrome security droid standing on a powerfully-built tauric body and carrying the upper torso of a curvaceous, sexy gynoid with a coating of sun-kissed synth-skin starting at her inhumanly-wide hips, up past a pair of gigantic breasts, and to a whorish face half-hidden under a polysteel visor.";
			else tooltip += "A sleek chrome security droid standing on a powerfully-built tauric body and carrying the upper torso of a slender, sexy gynoid with a coating of milk-pale synth-skin starting at her broad hips, up past a pair of palmable breasts, and to a chiseled face half-hidden under a polysteel visor.";
			tooltip += " The Siegwulfe is a high-class personal security and assistant drone meant to accompany affluent individuals like you absolutely everywhere -- from the boardroom to the bedroom.";
			break;
		case "VarmintLeash":
			tooltip += "This bright pink leash connects you to " + (varmintIsTame() ? "your varmint buddy" : "a tamed varmint") + " through a wireless signal and some high-tech motors in the collar, allowing you to control how far " + (varmintIsTame() ? "your friend" : "it") + " wanders from you, and hold it back if need be, without getting a pesky REAL leash in the way like some kind of neanderthal.";
			break;
		
		// Apparel
		case "ButlerCostume":
			tooltip += "This is a highly fetishized butler outfit. It consists of a waistcoat and a smart white shirt with the front cut out, white pasties for the wearer’s nipples, a black bow tie,";
			if(pc.isBiped()) tooltip += ", a tight pair of black trousers with the seat cut out";
			tooltip += ", and a white thong.";
			break;
		case "SchoolgirlCostume":
			tooltip += "This is a highly fetishized western school girl outfit. It consists of a thin, clinging white blouse, a frilly pair of white panties with the word “SLUT” emblazoned in pink on the seat";
			if(pc.isBiped()) tooltip += ", knee-high socks and plimsolls";
			tooltip += ", and a short plaid skirt one size too small for you.";
			break;
	}
	
	return tooltip;
}
