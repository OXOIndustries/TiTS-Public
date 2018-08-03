import classes.Items.Upgrades.ExpandedBackpackII;

public function uvetoApproachNerrasaFirstTime():void
{
	clearOutput();
	showBust("NERRASA");
	showName("THE LAST\nCHANCE");
	author("Savin");

	flags["MET_NERRASA"] = 1;

	output("You approach the caramel ausar behind the counter, coughing to get her attention. She grunts with annoyance and drops her fifty pound weight on the counter with a resounding <i>thump</i>. She rolls her shoulders and looks");
	if (pc.tallness > 76) output(" up");
	else if (pc.tallness < 50) output(" down over the side of the counter");
	output(" at you, giving you an alarming view of her brilliantly bright orange eyes. They almost seem to glow!");
	
	output("\n\n<i>“Sup,”</i> she says, halfway between a growl and a fraternal greeting. <i>“See something you want?”</i>");
	
	output("\n\nYou can’t tell if she’s talking about the shop, or her sleek, muscular body. A pair of large breasts rise and fall evenly beneath her skin-hugging tank top, revealing their tops and sides through the loose fabric, tantalizing you with bronzed, glistening flesh. Her eyes, though, are all fire - not the welcoming warmth of your typical friendly ausar.");
	
	output("\n\nAfter a long moment of silence, you realize that you’d better say something. Or better yet, buy something.");
	
	output("\n\nSince you haven’t had the opportunity to look through her inventory proper yet, you decide to lead off with your name");
	if (pc.isNice() || pc.isBimbo()) output(" and a smile");
	output(".");
	
	output("\n\n<i>“[pc.name], huh?”</i> the muscular ausar echoes, chewing on her lower lip for a moment. <i>“Nerrasa. If you’re going down to the surface, I recommend either a psych eval or a heat belt. That or put on a hundred pounds of fur and blubber like a native. Got pills for that, actually.”</i>");
	
	output("\n\nDoesn’t sound like she much cares for the local ausar, by that attitude.");
	
	output("\n\nNerrasa shrugs noncommittally. <i>“Used to be one. Now I’m not. Look, you gonna buy something, or are you waiting for an invitation to fuck?”</i>");

	uvetoNerrasaMenu();
}

public function uvetoApproachNerrasaRepeat():void
{
	clearOutput();
	showBust("NERRASA");
	showName("\nNERRASA");
	author("Savin");

	if (flags["NERRASAS_PET"] == undefined)
	{
		output("<i>“Sup, [pc.name],”</i> Nerrasa says as you approach. <i>“Wanna buy something?");
		if (flags["NERRASA_FUCKED"] != undefined) output("Or are you ready to get broken in some more, huh?");
		output("”</i>");
	}
	else
	{
		output("<i>“Welcome back, "+ pc.mf("boy", "girl") +",”</i> Nerrasa coos as you approach, reaching across the counter to " + (pc.hasHair() ? "stroke your hair" : "pats your head") + ". <i>“Ready for your walkies? Or did you just wanna buy something?”</i>");
	}

	uvetoNerrasaMenu();
}

public function uvetoNerrasaMenu():void
{
	clearMenu();

	addButton(0, "Buy", uvetoNerrasaBuy);

	addButton(14, "Leave", mainGameMenu);
}

public function uvetoNerrasaBuy():void
{
	if(pc.level >= 4)
	{
		if(!chars["NERRASA"].hasItemByClass(Frostfire)) chars["NERRASA"].inventory.push(new Frostfire());
	}
	else chars["NERRASA"].destroyItemByClass(Frostfire, -1);
	
	if(pc.level >= 7)
	{
		if(!chars["NERRASA"].hasItemByClass(HardlightDagger)) chars["NERRASA"].inventory.push(new HardlightDagger());
	}
	else chars["NERRASA"].destroyItemByClass(HardlightDagger, -1);
	if(pc.level >= 8)
	{
		if(!chars["NERRASA"].hasItemByClass(HardlightBow)) chars["NERRASA"].inventory.push(new HardlightBow());
	}
	else chars["NERRASA"].destroyItemByClass(HardlightBow, -1);
	
	if(canBuySiegwulfe())
	{
		if(!chars["NERRASA"].hasItemByClass(SiegwulfeItem)) chars["NERRASA"].inventory.push(new SiegwulfeItem());
	}
	else chars["NERRASA"].destroyItemByClass(SiegwulfeItem, -1);
	
	if(pc.statusEffectv1("Backpack Upgrade") < 10)
	{
		if(!chars["NERRASA"].hasItemByClass(ExpandedBackpackII)) chars["NERRASA"].inventory.push(new ExpandedBackpackII());
	}
	else chars["NERRASA"].destroyItemByClass(ExpandedBackpackII, -1);

	shopkeep = nerrasa;
	buyItem();
}