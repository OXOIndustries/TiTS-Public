//Mabbs LcKinnl
//By Fenoxo Fenbutt
//Mouse-girl, mouse, {rodenian}

public function mabbsBonus(button:int):void
{
	//Unmet
	if(flags["MET_MABBS"] == undefined) 
	{
		output("\n\nA pink " + mabbsRace() + " female is slouching in a booth by herself, bobbing her head to an unseen melody, complements of the over-sized earphones she wears.");
		addButton(button,"Mouse-Girl",approachMabbs);
	}
	else 
	{
		output("\n\nMabbs the mouse-girl is here, bobbing her head along with the beat in her headphones and eyeing the crowd.");
		addButton(button,"Mabbs",approachMabbs);
	}
}

public function mabbsRace():String
{
	var choices:Array = ["mouse-girl","mouse"];
	if(CodexManager.entryUnlocked("Rodenians")) choices.push("rodenian");
	return RandomInCollection(choices);
}

//Approach
public function approachMabbs():void
{
	clearOutput();
	showMabbs();
	if(flags["MET_MABBS"] == undefined)
	{
		//No Sylvie Intro
		if(flags["SYLVIE_MABBSED"] == undefined)
		{
			output("You sidle up to the table and put on your friendliest smile, <i>“");
			if(pc.isBimbo()) output("Hiya! You’re suuuuper cute!");
			else if(pc.isNice()) output("Hey there. So what brings you to Canadia Station?");
			else if(pc.isMischievous()) output("Heya. Glad to see I’m not the only one who thinks the music around here sounds like a bunch of ausar howling at the moon.");
			else output("Nice cans.”</i> You gesture at her earphones. <i>“Sup?");
			output("”</i>");
			output("\n\nThe " + mabbsRace() + " laconically tilts her head your way. <i>“Skizz off. I ain’t here to be eye candy for dumbshit spacers.”</i> She giggles at your displeasure, then straightens, expression a little more serious. <i>“Although... you look like you might be interested in the fun kinda mods. The kinda mods ol’ moose-tits over there doesn’t want me sellin’ anybody.”</i> She presses on her earphones, presumably to lower the volume. <i>“So I guess the real question is...”</i> She leans close, breath scented with spicy odor of illegal narcotics. <i>“...are you a cop?”</i> She presses a finger under your chin, rubbing it in small circles. <i>“You gotta tell me if you are.”</i>");
			//Bimbo
			if(pc.isBimbo()) output("\n\n<i>“No,”</i> you breathily exhale. Your [pc.lipsChaste] wind their way around her finger before she can pull it back, offering the promise of a night with naught but your mouth glued to her most sensitive places.");
			//Bro
			else if(pc.isBro()) output("\n\n<i>“Nope.”</i> You lean back and nonchalantly shrug. <i>“You a cop?”</i>");
			//Else
			else output("\n\nTelling her ‘no’ comes easily on account of it being the truth.");
			//Merge
			output("\n\nThe smirking rodent-girl’s green eyes twinkle knowingly. <i>“Then I’m gonna need a name, fuck-bait.”</i>");
			output("\n\nYou supply your own");
			if(pc.isBimbo()) output(" after she yanks her digit out of your maw, wiping it draw on a napkin");
			else output(", but only after she explicitly states that she isn’t a cop either");
			output(".");
		}
		//Sylvie setup
		else
		{
			output("You slyly sidle up to your table and give the pink-furred alien the slightest nod in greeting. <i>“Sylvie said you could hook me up?”</i>");
			output("\n\nThe " + mabbsRace() + " laconically tilts her head your way. <i>“Izzat so? Didn’t think ol’ Moose-tits approved of my sorta fun.”</i> She giggles to herself and presses a knob on the side of her headgear, presumably to lower the volume. <i>“‘Tween you and me, I think she’d rather dosed up on gush and strapped into a milker. But instead of doin’ what she wants, she’s always lecturin’ me and shovin’ her fat ass into my business.”</i> Her ears waft a breeze your way when she shakes her head. <i>“She isn’t the type to skeeze me over to pad her numbers though, so I guess that makes you legit by association.”</i>");
			//bimb
			if(pc.isBimbo())
			{
				output("\n\nYou nod so vigorously that ");
				if(!pc.isTaur()) output("you bounce in your seat");
				else output("your whole body bounces");
				output(".");
			}
			//Bro
			else if(pc.isBro()) output("\n\nYou nod expectantly.");
			//Nice
			else if(pc.isNice()) output("\n\n<i>“As legit as they come.”</i>");
			//Misch
			else if(pc.isMischievous()) output("\n\n<i>“I was legit on my own. Sylvie vouching for me is just icing on the cake.”</i>");
			//Hard
			else output("\n\n<i>“You guessed it.”</i>");
			//Merge
			output("\n\nThe smirking rodent-girl’s green eyes twinkle knowingly. <i>“Then I’m gonna need a name, space-bait.”</i>");
			output("\n\nYou ");
			if(pc.isBro() || pc.isAss()) output("begrudgingly ");
			else if(pc.isBimbo()) output("eagerly ");
			output("supply your own.");
		}
		//Merge 2 intro forks
		output("\n\n<i>“Mabbs.”</i> She stretches. <i>“Don’t worry. I didn’t lose my last name. You just don’t get to get it. Get it?”</i> There’s a sharp undercurrent to her playful banter.");
		output("\n\n");
		if(pc.IQ() < 40) output("You’re trying to catch up to her fast-paced, staccato ramblings when she plows on.");
		else output("<i>“Got it,”</i> you answer with a quick nod.");
		output("\n\n<i>“I don’t care what you call me so long as your credits come back as clean as my stock,”</i> Mabbs says. Her tail waves lazily behind her, a piercing twinkling softly. <i>“So what kind of fun you lookin’ for? You wanna Throbb or you wanna Gush? Maybe you want somethin’ else. So long as it’s chemical, I can probably hook ya up.”</i> She leans back and kicks a pair of pink, delicate-looking feet up onto the table. <i>“Stick to business, and we’ll get along great " + pc.mf("Mistah","Miss") + " Seal. Heh. This stuff’ll totally crack your seal, that’s for damned sure.”</i>");
		output("\n\nYou don’t see much point in correcting her.");
		flags["MET_MABBS"] = 1;
	}
	//Repeat Customer
	else
	{
		output("You situate yourself across from Mabbs and give her a friendly wave.");
		output("\n\nShe doesn’t notice you for a few seconds, and even then, she’s slow to turn down the volume on her earphones and actually address you. <i>“Oh... if it isn’t ");
		if(flags["MABBS_PURCHASES"] != undefined) output("my fav client, [pc.name] Seal. Need a refill on your prescription?”</i> Mabbs smiles keenly, suddenly excited by the thought. <i>“I got some good stuff if you got the creds.”</i>");
		else output(pc.mf("Mistah","Miss") + " Seal. You gonna actually buy shit this time, or you just here to skizz around and waste my time?”</i>");
	}
	processTime(3);
	clearMenu();
	mabbsMenu();
}
public function mabbsMenu():void
{
	clearMenu();
	addButton(0,"Buy",mabbsBuyMenu,undefined,"Buy","Buy some drugs.");
	addButton(1,"Sell",sellToMabbs,undefined,"Sell","See if she buys drugs too.");
	addButton(2,"Flirt",flirtWithMabbs,undefined,"Flirt","See if you can get into her mouse hole.");
	addButton(5,"Your Species",mabbsSpeciesTalk,undefined,"Your Species","Ask her about her species.");
	addButton(14,"Leave",leaveMabbsBehind);
}

//Species
public function mabbsSpeciesTalk():void
{
	clearOutput();
	showMabbs();
	output("You ask her what species she is");
	if(CodexManager.entryUnlocked("Rodenians")) output(", not 100% sure she’s a rodenian");
	output(".");
	output("\n\nMabbs squints at you. <i>“Rodenian, dummy. You see mouse-girls anywhere else? Didn’t think so. Go look it up on your computer if you wanna know more, ‘cause I ain’t here to blather on and on about my people. So buy something or get out of my face.”</i>");
	if(!CodexManager.entryUnlocked("Rodenians"))
	{
		output("\n\n<b>(‘Rodenian’ Codex entry unlocked!)</b>");
		CodexManager.unlockEntry("Rodenians");
	}
	processTime(2);
	mabbsMenu();
	addDisabledButton(5,"Your Species","Your Species","You’re discussing that right now.");
}

//Buy
public function mabbsBuyMenu():void
{
	clearOutput();
	showMabbs();
	var buyText:String = "You tell her you’d like to buy something.\n\nMabbs smirks. <i>“You and errybody else. So what’s it gonna be, you wanna squirt or you wanna spurt? Maybe you just wanna fuck around and make some mistakes with your daddy’s money?”</i>\n\nYou don’t let on how close she’s getting to the mark.\n\nThe smirking dealer pulls her pack up beside her and lets you have a peek. Inside is a cornucopia of illegal cocktails. <i>“What’re ya buyin’?”</i>";
	shopkeep = chars["MABBS"];
	chars["MABBS"].keeperBuy = buyText + "\n";
	shopkeepBackFunctor = mabbsPostShopping;
	
	CodexManager.unlockEntry("Gush");
	CodexManager.unlockEntry("Soak");
	CodexManager.unlockEntry("Throbb");
	
	buyItem();
}

public function mabbsPostShopping():void
{
	clearOutput();
	showMabbs();
	output("Mabbs discretely tucks her bag away. <i>“Jammin’. Got anything else ya need from me and my magic bag?”</i>");
	mabbsMenu();
}

//Sell
public function sellToMabbs():void
{
	clearOutput();
	showMabbs();
	output("You ask her if she’s buying.");
	output("\n\nMabbs reaches over and flicks your ear painfully. <i>“Don’t fuck with me, [pc.name]. You wanna sell product, do it somewhere else. This is my territory.”</i> She casts her eyes around the bar, and once assured that Sylvie isn’t looking her way, you see the tip of a very high-tech looking blaster peeking out from under her side of the table, held by a tightly coiled tail. <i>“So keep yer drugs to yourself, or skizz off. I don’t have time for this bullshit.”</i>");
	output("\n\nIt might be wise not to escalate the situation any further. You diplomatically nod and consider your options...");
	processTime(2);
	mabbsMenu();
	addDisabledButton(1,"Sell","Sell","Selling doesn’t seem like a great idea right now.");
}

//Flirt
public function flirtWithMabbs():void
{
	clearOutput();
	showMabbs();
	output("<i>“Nope.”</i> Mabbs shuts you down before you can even get an opening line out. <i>“Don’t waste my time.”</i> She runs a finger around the gentle curvature of her ear, grinning as your eyes follow along. <i>“This body is </i>mine<i>. Not yours. Not anybody else’s. And tween you, me, and everybody else in the quadrant, other people just get in the way. If you can’t handle that... well, Sylvie’ll put out if you pour enough booze in her.”</i> She cups her breasts");
	if(CodexManager.entryUnlocked("Rodenians")) output(" - unusually large for a rodenian -");
	output(" and uncaringly laughs. <i>“You wanna get me off, buy something so I have an excuse to roll out of here and experiment with my stock.”</i>");
	processTime(1);
	mabbsMenu();
	addDisabledButton(2,"Flirt","Flirt","Flirting didn’t work out very well.");
}

//Leave
public function leaveMabbsBehind():void
{
	clearOutput();
	showMabbs();
	output("You bid your farewell and make to leave.");
	output("\n\n<i>“C’ya, " + pc.mf("Mistah","Miss") + " Seal. Come my way whenever you got creds burnin’ a hole in your threads.”</i> Mabbs reaches up to her ear and cranks the volume back up.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}