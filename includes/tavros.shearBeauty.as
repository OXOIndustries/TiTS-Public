//AUTHOR - COUCH!

//Room Descriptions
//Added to room on Tavros outside the salon


//output("\n\nA neon sign displaying a pair of scissors sits next to a small store entrance with its doors propped open, allowing you a glimpse of the salon inside. The sign above the door labels it as Shear Beauty.");

public function showCeria():void
{
	showName("\nCERIA");
	showBust("CERIA");
}

//Salon
public function shearBeautyBonusFunc():Boolean
{
	author("Couch");
	output("Shear Beauty is a nicely kept hair salon, with white tile flooring and darker gray walls lined with shelves of hair care products and pictures of various fashion models. Currently the waiting lounge is empty, allowing you to go straight to the front counter if you please. Beyond it you can see three sets of salon chairs along the right wall, while along the left is what looks like a massage table with a privacy screen currently open. In the back you can see the entrance to what must be the employee break room.");
	output("\n\n");
	if(flags["MET_CERIA"] == undefined)
	{
		output("A well-tanned girl with sparkling pink hair accentuated by a pair of long, pointed ears is leaning at the counter, chewing bubblegum. Her ears hang a little low of horizontal, but twitch upward as she notices you.");
		//[Counter Girl] Go to Ceria Intro, replace this button with Ceria
		addButton(0,"Counter Girl",approachCeria);
	}
	else
	{
		output("Ceria is leaning at the counter, idly blowing and popping her bubblegum. Her ears twitch upward as she sees you, the elf girl pausing in her chewing to grin at you.");
		//[Ceria] Go to Ceria Main
		addButton(0,"Ceria",approachCeria);
	}
	return false;
}

//Meeting the Stylist
public function approachCeria():void
{
	clearOutput();
	showCeria();
	author("Couch");
	//Ceria Intro
	if(flags["MET_CERIA"] == undefined)
	{
		flags["MET_CERIA"] = 1;
		output("<i>“Welcome to Shear Beauty! I’m Ceria, I’ll be your stylist today. Here for a haircut, " + pc.mfn("Mister","Miss","") + "...?”</i>");
		if(pc.isBimbo()) output("\n\n<i>“It's like, [pc.name]. This place is super cute!”</i>");
		else if(pc.isBro()) output("\n\n<i>“[pc.name]. I'm jus' lookin'”</i>");
		else output("\n\n<i>“It’s [pc.name]. And maybe, just looking around right now.”</i>");

		output("\n\n<i>“Well, [pc.name], we do trimming, lengthening, coloring and styling here. We’ve also got products you can take home over here on the left.”</i> Ceria gestures towards the rows of bottles, conditioners, and medipens on display. <i>“Just let me know what you want, ‘kay?”</i>");

		//[Next] Go to Ceria Main
		processTime(2);
	}
	//Ceria Main
	else
	{
		output("<i>“Hey, [pc.name]. Here for some styling, or buying some hair care products to take home?”</i>");
		//PC has unlocked sex:
		if(9999 == 0) output(" Ceria leans forward with a playful grin to show a little bit more cleavage. <i>“Maybe something more fun?”</i>");
		processTime(1);
	}
	ceriaMenu();
}

public function ceriaMenu():void
{
	showCeria();
	clearMenu();
	addDisabledButton(0,"Shop","Shop","Sorry, this part of the store has been closed ever since an imp stole all the supplies!");
	addButton(1,"Styling",hairworkFromCeria,undefined,"Styling","Get your hair lengthened, cut, or dyed!");
	addDisabledButton(2,"Talk","Talk","Sorry, Cerise just doesn't feel like talking after that imp wrecked her stockroom.");
	addDisabledButton(3,"Appearance","Appearance","Cerise refuses to give you a good look until she recovers from her imp-based burglary and gets a chance to properly pretty herself up.");
	addDisabledButton(4,"Sex","Sex","Whoah, the girl had her store burgled by a little green dude with a horse-cock and you're trying to bump uglies now? Not cool!");
	addButton(14,"Leave",mainGameMenu);
}
/*
[Shop] Go to Ceria Shop
[Styling] Go to Hairwork
[Talk] Go to Ceria Talk
[Appearance] Go to Ceria Appearance
[Sex] Go to Sex Menu, gray out until Ceria Ears has been run
[Back] Exit dialogue
*/

//Buying Things For Later
//Ceria Shop
/* 9999 set up shop shit
output("\n\nCeria gestures to the shelf of hair care products on your left. <i>“Alright, grab whatever you want off the shelf and I’ll ring it up for you.”</i>");

output("\n\nYou let your eyes roam across the various shampoos and conditioners on sale. You also see a rack with several teardrop-shaped medipens in a variety of colors.");

output("\n\n{First time viewing: <i>“What are those?”</i> you ask, pointing towards the medipens.");

output("\n\n<i>“Oh, those are our Sylvanol-brand transformatives. I’ve gotten pretty into them myself. If you’re jealous of these-”</i> She gives you a wink as she twitches her lengthy ears. <i>“-you should give them a try. They’re an adjustable medipen, you just twist that dial near the top and they cycle between a few different settings.”</i>}");

output("\n\n{No items exist to be sold: Honestly nothing here looks all that appealing. Maybe they’ll restock with something worth the credits later on.}");

output("\n\n[Back] Go to Ceria Main");
*/

//Doing The Thing You’re Probably Here For
//Main Menu
//Hairwork
public function hairworkFromCeria():void
{
	clearOutput();
	showCeria();
	author("Couch");
	output("As soon as you tell her that you want your hair done, Ceria takes the bubblegum out of her mouth and tosses it out, putting on a professional air. Even her ears tilt backwards to emphasize themselves less.");
	output("\n\n<i>“Lengthening, cutting, coloring or styling?");
	if(!pc.hasHair()) output(" I mean, not that you have anything to work with, but I can fix that easy enough if you want.");
	if(pc.hasFur()) output(" I can also do a color job on that fur of yours.");
	output("”</i>");

	processTime(1);
	//[Lengthen] Go to Lengthen Options
	//[Cut] Go to Cut Options
	//[Hair Color] Go to Hair Color Options
	//[Style] Go to Style Options
	//[Fur Color] Go to Fur Color Options
	//[Back] Go to Ceria Main
	clearMenu();
	addButton(0,"Lengthen",lengthenHairChoices,undefined,"Lengthen","Get your hair lengthened.");

	addButton(14,"Back",approachCeria);
}

//Ceria Lengthens Your Hair
//Lengthen Options
public function lengthenHairChoices():void
{
	clearOutput();
	showCeria();
	author("Couch");
	output("<i>“Alright, what kind of length are you looking for? Remember I’ll have to redo your hairstyle after this if you’re not gonna just wear it loose. We charge by the inch, I’ll give you your total when you tell me what you want.”</i>");

	//[All below options go to Lengthen Confirmation, gray out options PC already exceeds or can’t afford]
	//[Short] 2
	//[Shoulders] 8
	//[Long] 13
	//[Back Length] tallness/2.6! if (hairLength < tallness / 2.5)
	//[Ass Length] tallness/2 if (hairLength < tallness / 1.7)
	//[Knee Length] tallness / 1.4
	//[Ankle Length] tallness - 1
	//[Back] Go to Hairwork
	processTime(1);
	clearMenu();
	if(pc.hairLength < 2) addButton(0,"Short",lengthenHairConfirmation,2);
	else addDisabledButton(0,"Short","Short","Your hair is already longer than that!");
	if(pc.hairLength < 8) addButton(1,"Shoulders",lengthenHairConfirmation,8);
	else addDisabledButton(1,"Shoulders","Shoulders","Your hair is already longer than that!");
	if(pc.hairLength < 13) addButton(2,"Long",lengthenHairConfirmation,13);
	else addDisabledButton(2,"Long","Long","Your hair is already longer than that!");
	if(pc.hairLength < pc.tallness/2.6) addButton(3,"Back Length",lengthenHairConfirmation,pc.tallness/2.6);
	else addDisabledButton(3,"Back Length","Back Length","Your hair is already longer than that!");
	if(pc.hairLength < pc.tallness/2) addButton(4,"Ass Length",lengthenHairConfirmation,pc.tallness/2);
	else addDisabledButton(4,"Ass Length","Ass Length","Your hair is already longer than that!");
	if(pc.hairLength < pc.tallness/1.4) addButton(5,"Knee Length",lengthenHairConfirmation,pc.tallness/1.4);
	else addDisabledButton(5,"Knee Length","Knee Length","Your hair is already longer than that!");
	if(pc.hairLength < pc.tallness - 1) addButton(6,"Ankle Length",lengthenHairConfirmation,(pc.tallness - 1));
	else addDisabledButton(6,"Ankle Length","Ankle Length","Your hair is already longer than that!");
	addButton(14,"Back",hairworkFromCeria);
}

//Lengthen Confirmation
public function lengthenHairConfirmation(hairInches:Number = 0):void
{
	clearOutput();
	showCeria();
	author("Couch");
	output("<i>“");
	if(hairInches == 2) output("Short and simple, huh?");
	else if(hairInches == 8) output("Shoulder-length, my kind of " + pc.mf("guy","girl") + ".");
	else if(hairInches == 13) output("Alright, long it is.");
	else if(hairInches == pc.tallness/2.6) output("Well, back length is certainly doable.");
	else if(hairInches == pc.tallness/2) output("You really do love it long, don’t you?");
	else output("Shit, really, that long? Alright, you’re the customer.");
	output("”</i> Ceria pulls out a piece of measuring tape, checking out your existing hair");
	if(!pc.hasHair()) output(", or lack thereof");
	output(". <i>“With how much you’ve already got, it’ll be ");
	var cost:Number = Math.round((hairInches - pc.hairLength) * 150);
	output(cost + " credits. That good with you?”</i>");
	processTime(2);
	clearMenu();
	if(pc.credits >= cost) addButton(0,"Okay",payTheLadyForLongHair,hairInches);
	else addDisabledButton(0,"Okay","Okay","You can't pay for that!");
	//[OK] Go to Lengthen Treatment
	//[Nevermind] Go to Ceria Main
	addButton(1,"Nevermind",approachCeria);
}

//Lengthen Treatment
public function payTheLadyForLongHair(hairInches:Number):void
{
	clearOutput();
	showCeria();
	author("Couch");
	var cost:Number = Math.round((hairInches - pc.hairLength) * 150);
	output("Ceria double-checks the length on her tape and taps her tablet a few times before plugging it into a dispenser which soon spits out a small container of a dull gray hair gel. The elven girl sits you down in one of the salon chairs and sets to work rubbing the gel into your scalp, not stopping until she’s used up the entire container’s worth. As she does, you can feel inch after inch of new hair spilling forth, growing out with every motion of Ceria’s fingers until finally it winds down to a stop. The stylist steps aside to wash her gloved hands clean of any lingering gel, allowing you time to admire your new look in the mirror. <b>Your hair is now " + num2Text(Math.round(hairInches)) + " inches long!!</b>");
	//[Next] Set [pc.hairstyle] to null and go to Ceria Main
	processTime(33);
	pc.hairLength = hairInches;
	//9999 pc.hairStyle = "null";
	pc.credits -= cost;
	clearMenu();
	addButton(0,"Next",approachCeria);
}

/*
output("\n\nCeria Does Your Haircut");
output("\n\nCut Options");
output("\n\n<i>“It’ll be 200 credits a trim, how short do you want it? Remember, I’ll have to restyle your hair after you cut it unless you just want it hanging loose.”</i>");

output("\n\n[All below options go to Cut Treatment, gray out options PC is already shorter than or can’t afford]");
output("\n\n[Short]");
output("\n\n[Shoulders]");
output("\n\n[Long]");
output("\n\n[Ass-Length]");
output("\n\n[Ankle-Length]");
output("\n\n[Back] Go to Ceria Hairwork");

output("\n\nCut Treatment");
output("\n\nCeria sits you down in one of the salon chairs, pulling out a simple razor and pair of scissors before setting to work cutting, shearing and trimming away at your hair. Her work is impeccable, and by the time she’s finished you’re left with a fresh, clean look. <b>Your hair is now {length}!</b>");
output("\n\n[Next] Set [pc.hairstyle] to null and go to Ceria Main");

output("\n\nCeria Does Your Hair Color");
output("\n\nHair Color Options");
output("\n\n<i>“Right, so are you looking for a vanilla color, something metallic? If you’re looking for something really exotic, we’ve got these new treatments that actually make your hair glow. Personally, I like metallics.”</i> Ceria reaches up to rub one of her own glittering pink locks between her fingers for emphasis. <i>“500 credits for a vanilla or metallic, 600 for one of the glowing ones.”</i>");

output("\n\n[Gray out options the PC can’t afford.]");
output("\n\n[Standard] Go to Standard Hair Color");
output("\n\n[Metallic] Go to Metallic Hair Color");
output("\n\n[Glowing] Go to Glowing Hair Color");
output("\n\n[Back] Go To Hairwork");

output("\n\nStandard Hair Color");
output("\n\nCeria pulls out a small tablet showing a color wheel and presents it to you. <i>“Alright, pick what looks good.”</i>");
output("\n\n[Buttons for Colors] Go to Hair Treatment");
output("\n\n[Back] Go to Hairwork");

output("\n\nMetallic Hair Color");
output("\n\nCeria pulls out a small tablet showing a color wheel and presents it to you. <i>“Alright, pick what looks good.”</i>");
output("\n\n[Buttons for Colors] Go to Hair Treatment");
output("\n\n[Back] Go to Hairwork");

output("\n\nGlowing Hair Color");
output("\n\nCeria pulls out a small tablet showing a color wheel and presents it to you. <i>“Alright, pick what looks good.”</i>");
output("\n\n[Buttons for Colors] Go to Hair Treatment");
output("\n\n[Back] Go to Hairwork");

output("\n\nHair Treatment");
output("\n\nOnce you’ve made your selection Ceria takes back the tablet, plugging it into a dispenser that soon spits out a small container of what looks like {color} hair gel.");

output("\n\n<i>“Alright, sit down and hold still while I work this in.”</i> After getting you into the salon chair, Ceria takes out a thick glob of the gel and starts rubbing it into your scalp. As she does, you can see your former hair color being overtaken by a new shade. Ceria doesn’t stop until she’s used up all of the gel, by which time your hair color has been completely replaced and your roots are left tingling, altered by the gel to make {color} your new natural hair color. <b>Your hair is now {color}!</b>");

output("\n\n[Next] Go to Ceria Main");

output("\n\nCeria Does Your Hairstyle");
output("\n\nStyle Options");
output("\n\n<i>“Okay, let me show you some of our styles.”</i> Ceria pulls out a small tablet and shows you several different pictures modeling various hairstyles. <i>“Just let me know what you’re interested in.”</i>");
output("\n\n[All options go to Style Confirmation]");
output("\n\n[Straight] Sets [pc.hairstyle] to null.");
output("\n\n[Ponytail]");
output("\n\n[Twintails]");
output("\n\n[Curls]");
output("\n\n[Braided]");
output("\n\n[Afro]");
output("\n\n[Mohawk]");
output("\n\n[Mullet]");
output("\n\n[Back] Go To Hairwork");

output("\n\nStyle Confirmation");
output("\n\n<i>“Okay, so you want your hair in {style}? That’ll be 1200 credits.”</i>");
output("\n\n[OK] Go to Styling");
output("\n\n[Nevermind] Go To Hairwork");

output("\n\nStyling");
output("\n\nCeria sits you down in one of the salon chairs and gets out her tools, setting to work on styling your hair. By the time she’s done, you’re the proud bearer of a brand-new look.");
output("\n\n[Next] Go To Ceria Main");

output("\n\nCeria Does Your Fur");
output("\n\nFur Color Options");
output("\n\n<i>“Fur, huh? Okay, these are pretty much the same options as hair. We’ve got like vanilla colors, metallics, glowy fur...pick whatever kind you want. Because it’s a full-body treatment, I’m gonna have to charge 1500 credits for a vanilla or metallic, 1800 for one of the glowy colors. Fur’s a lot of dye.”</i>");
output("\n\n[Standard] Go to Standard Fur Color");
output("\n\n[Metallic] Go to Metallic Fur Color");
output("\n\n[Glowing] Go to Glowing Fur Color");
output("\n\n[Back] Go To Hairwork");

output("\n\nStandard Fur Color");
output("\n\nCeria pulls out a small tablet showing a color wheel and presents it to you. <i>“Alright, pick what looks good.”</i>");
output("\n\n[Buttons for Colors] Go to Fur Treatment");
output("\n\n[Back] Go to Hairwork");

output("\n\nMetallic Fur Color");
output("\n\nCeria pulls out a small tablet showing a color wheel and presents it to you. <i>“Alright, pick what looks good.”</i>");
output("\n\n[Buttons for Colors] Go to Fur Treatment");
output("\n\n[Back] Go to Hairwork");

output("\n\nGlowing Fur Color");
output("\n\nCeria pulls out a small tablet showing a color wheel and presents it to you. <i>“Alright, pick what looks good.”</i>");
output("\n\n[Buttons for Colors] Go to Fur Treatment");
output("\n\n[Back] Go to Hairwork");

output("\n\nFur Treatment");
output("\n\nOnce you’ve made your selection Ceria takes back the tablet, plugging it into a dispenser that soon spits out a large tub of what looks like {color} hair gel.");

output("\n\n<i>“Alright, this is a little more complicated than doing your hair. This way, please.”</i> Ceria takes you past the counter to what looks like a massage table, drawing a curtain around it for privacy. <i>“I’m gonna need you to lie down here and strip.”</i>");

output("\n\nYou’re provided a moment of privacy and a small towel to put across your lap for modesty before the elf returns. Ceria allows herself a moment to take in your almost-nude body with a lascivious smile before recovering her professional composure. Reaching into the tub of hair gel, she takes out a thick glob and smears it across your chest before starting to work it into the [pc.skinFurScalesNoun], the gel gradually wicking away as your body absorbs it. Ceria doesn’t stop until she empties out the entire tub, leaving you tingling all over as the payload in the gel gets to work altering your fur all the way down to the roots. By the time she lets you up, you’ve got an all-new palette to your pelt. <b>Your fur is now {color}!</b>");
output("\n\n[Next] Go to Ceria Main");
