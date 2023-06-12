//Millie’s Milker

//Room Appearance Texts
public function millieBonusShitYouFuckface():Boolean
{
	//Not yet introduced
	if(flags["MET_MILLIE"] == undefined)
	{
		output("\n\nA cow-girl with unusually dark hair, black-painted lips, and punky, half-shaved head is lounging next to the milker. At the sight of you, she waves the pump’s cups back and forth, asking, <i>“Hey there, new [pc.guy]. ");
		//Very very milky
		if(pc.isLactating() && pc.milkFullness >= 90) output("Whoah, you’re pretty full there, huh? I can smell the milk you’re leaking! Get over here, and I’ll take care of you.”</i>");
		//isLactating()
		else if(pc.isLactating()) output("Ready for a milking? Come on over, I won’t bite... much.”</i>");
		//Cockwielders
		else if(pc.hasCock()) output("I’ve only got a breast-milker here, but if you need to let off some pressure, I could probably handle you.”</i> The scent of cherries floods the air as you spy a wet patch in the center of her crotch.");
		//No dick no lactating, but has boobs.
		else if(pc.biggestTitSize() >= 1)
		{
			output("You sure you’re in the right place?”</i> She wrinkles her nose. <i>“I don’t smell any milk on you, no matter how ");
			if(pc.biggestTitSize() <= 4) output("cute");
			else if(pc.biggestTitSize() <= 20) output("sexy");
			else output("huge");
			output(" your tits are. We could rectify that, if you want. Come on over.”</i>");
		}
		//No dick no lactating.
		else output("You sure you’re in the right place?”</i> She wrinkles her nose. <i>“I don’t smell any milk on you, and you definitely aren’t packing a dick.”</i> The cow-girl’s expression turns thoughtful. <i>“I’m not sure the pumps will do anything for you, but I’m sure I could find something fun for us to do. Come on over.”</i>");
		addButton(0,"Milker Girl",approachMillie);
	}
	//Met
	else
	{
		output("\n\nMillie is lounging in a chair with her legs demurely crossed, drawing on a tablet computer while harsh, jarring music plays in the background. She graces you with a smile before returning to her current drawing. The milker is right next to her, if you’d like to take advantage of it.");
		addButton(0,"Millie",approachMillie);
	}
	return false;
}
public function approachMillie():void
{
	clearOutput();
	showName("\nMILLIE");
	showBust("MILLIE");
	//First Time Greeting
	if(flags["MET_MILLIE"] == undefined)
	{
		flags["MET_MILLIE"] = 1;
		showImage("MillieGreeting");
		output("You step a little closer to the cow-girl, looking her over as you do so. She’s unusually tall for a New Texan female, probably a little over six feet with her horns pointing still higher. When combined with her half-shaved head, it gives quite the imposing visage. Her black lips menace you with a knowing smile. No matter how plush and inviting, their glossy finish seems to carry an air of impulsive superiority.");
		output("\n\nYou’d be a bit more awestruck if she weren’t wearing a pair of overalls that could double as a one-piece swimsuit, or if those same overalls weren’t straining to contain an out-of-this-world rack. She could probably pin a normal terran in her canyon-like cleavage");

		if(CodexManager.entryUnlocked("Raskvel")) output("... or two or three raskvel besides");
		output(" if she so desired, and she’s built just thick enough that she could probably collar any escapees just as easily. Her thighs, cushy as they are, still look strong enough to ");
		if(!silly) output("trap you there for an eternity of lovemaking");
		else output("crush a man’s head like a sparrow’s egg");
		output(". She looks like she knows it too.");

		output("\n\nThe buxom woman lets her grin spread until it transforms into a tooth-flashing expression of warmth and affection. You scarcely believe this friendly creature is the same girl you looked at a moment ago. She bats her eyelashes and explains in a voice that sounds like silk over polished silver, <i>“You made the right choice, coming over here. My name’s Millie. Now, who are you, and how am I going to take care of you?”</i>");

		//Bimbo
		if(pc.isBimbo())
		{
			output("\n\n<i>“My name’s [pc.name]. Can you like, ");
			if(pc.biggestTitSize() <= 7) output("give me big milky titties?");
			else output("make my big titties all milky and stuff?");
			output("”</i>");
		}
		//Bro
		else if(pc.isBro() && pc.hasCock())
		{
			output("\n\n<i>“Call me [pc.name].”</i> You roll your shoulders and smile back. <i>“I don’t think I’ll have much use for that milker, but I do have something else you can milk.”</i> You look her in the eyes, surprised to see something other than simpering deference. <i>“Though I guess it’d be polite to ask what you and your milker do exactly.”</i>");
		}
		//Nice
		else if(pc.isNice()) output("\n\n<i>“I’m [pc.name]. It’s nice to meet you, Millie.”</i> You shake her hand. <i>“What all can you do, exactly?”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("\n\n<i>“You can call me [pc.name] if you want. What all did you have in mind?”</i>");
		//Hard
		else output("\n\n<i>“[pc.name]. Now, what can you do for me, exactly?”</i> You look her way expectantly.");

		//Merge
		output("\n\nMillie looks you up and down, keen eyes taking in every inch of your figure. Her full lips part, gleaming in the overhead lights. <i>“Officially, I’m just a milking assistant - you know, here to make sure ");
		if(pc.isTreated() && pc.isBimbo() && pc.canLactate()) output("cows like you get the most fulfilling titty-draining possible.");
		else output("the other cows get their tits drained properly. A little companionship goes a long way on New Texas.");
		output(" And well, if a bull ");
		if(pc.isTreated() && pc.isBro() && pc.hasCock()) output("like you ");
		output("wanders in here, I can... take care of him too.”</i> She licks her lips, redoubling their shine, and her thighs ease apart. A damp patch is evident in the middle of the straining denim she wears. <i>“I’ve even got some enhancers for visitors who would like to try out what it’s like to be Treated without taking the plunge.”</i> She rolls her eyes. <i>“We could just talk, too.”</i> She tips her head indicating a nearby tablet. <i>“You listen to any music?”</i>");
		if(pc.hasCock()) output(" Her eyes flick back toward your crotch. <i>“Ever fuck while listening to metal?”</i>");
	}
	//Meeting Repeat
	else
	{
		showImage("MillieGreeting");
		output("Millie looks up at your approach, a mischievous twinkle in her eye as she sets her tablet aside. <i>“");
		//Base dialogue off last action
		//Nothing yet
		if(flags["MILLIE_LAST_ACTION"] == undefined) output("Finally going to have some fun with me?”</i> Her eyes twinkle mischievously while one of her hands idly caresses a denim-bulging nipple. <i>“I can’t wait.”</i>");
		//Milker
		else if(flags["MILLIE_LAST_ACTION"] == "Milker") output("Back for another milking?”</i> She waggles the milker cups at you, clinking their edges together teasingly.");
		//You fucked her
		else if(flags["MILLIE_LAST_ACTION"] == "Fucked") output("Needing a little relief?”</i> Her thighs open of their own volition as she talks. You don’t think she’s even aware of it.");
		//Got dosed with faux-treatment and is now treated
		else if(flags["MILLIE_LAST_ACTION"] == "Faux Treated" && pc.isTreated()) output("Oh, you went and did it, didn’t you? You smell like a real woman now!”</i>");
		//You got dosed with lactation-inducing drugs
		else if(flags["MILLIE_LAST_ACTION"] == "Faux Treated") output("Want another sample? After this one, you should just go get Treated for real. Milking will feel soooo much better.”</i>");
	}
	millieMenu();
}

public function millieMenu():void
{
	clearMenu();
	addButton(0,"Appearance",millieAppearance);
	if(pc.isLactating() && pc.biggestTitSize() >= 1)
	{
		addButton(1,"Get Milked",getMilkedWithMillie);
		addButton(2,"Milk Self",soloMilkingFromMillieAttempt);
	}
	else 
	{
		addDisabledButton(1,"Get Milked","Get Milked","You need breasts that are lactating in order to get milked.");
		addDisabledButton(2,"Milk Self","Milk Self","You need breasts that are lactating in order to milk yourself.");
	}
	if(!pc.isTreated()) addButton(3,"Faux Treat.",treatmentTryouts,undefined,"Faux Treatment","Experience a simulated, temporary version of the female Treatment that will induce lactation. Warning: may cause growth of breast tissue in males and unsexed individuals.");
	else addDisabledButton(3,"Faux Treat.","Faux Treatment","You’ve already taken the <i>actual</i> Treatment. No need to play with a pale imitation when you’re living the dream.")
	if(pc.lust() >= 33)
	{
		if(pc.hasCock())
		{
			if(pc.cockThatFits(1000) >= 0) addButton(4,"Fuck Millie",fuckMillie,undefined,"Fuck Millie","Get some phallic relief the old fashioned way.");
			else addDisabledButton(4,"Fuck Millie","Fuck Millie","You’re too big to safely penetrate the cow-girl.");
		}
		else addDisabledButton(4,"Fuck Millie","Fuck Millie","You need a penis in order to fuck Millie.");
	}
	else addDisabledButton(4,"Fuck Millie","Fuck Millie","You aren’t aroused enough to fuck Millie.");
	addButton(14,"Back",leaveMillieFirstTime);
}


//Leave First Time
public function leaveMillieFirstTime():void
{
	clearOutput();
	showName("\nMILLIE");
	showBust("MILLIE");
	output("<i>“On second thought, I have");
	if(pc.isBimbo()) output(", like,");
	output(" something better to do.”</i>");
	output("\n\nMillie rolls her eyes and sighs, picking up her tablet and a stylus. <i>“Suit yourself. I’ll be here if you change your mind.”</i>");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Appearance
public function millieAppearance():void
{
	clearOutput();
	showName("\nMILLIE");
	showBust("MILLIE");
	output("Millie is an oddity for a New Texan, both taller and thicker than most cows. She even has horns big enough enough for a bull, and her punky, half-shaved hairdo further serves to distinguish her from some of the more vapid members of her race. The unshorn portion hangs an inch past her shoulders, a sable cascade in stark contrast to her fair skin. Her eyes are an uncommonly dark, grayish-blue color and framed by expertly applied purple eyeshadow and what you assume to be mascara.");
	output("\n\nLike the rest of her Treated kin, Millie has a pair of plump, angel-bow lips, though she doesn’t leave them vacantly pursed as often as her sisters. More often, they’re kept in a knowing, almost cocky grin - the kind of expression that, when combined with her smoky glare, communicates a confident, self-assured sexuality. She winks when she catches you looking and licks her lips as if hungry for more.");
	output("\n\nHer neck is well-formed if slightly longer than average. Where it joins with her shoulders, dark spots start, dappling her shoulders like the spots of a actual bovine. They don’t continue an inch past her collarbone");
	if(flags["FUCKED_MILLIE"] == undefined) output(", at least not that you can see");
	output(", but their irregular pattern only seems to accent her exotic appeal.");
	output("\n\nShe wears a set of legless, denim coveralls, looking like a bizarre combination of farm-wear and a one-piece swimsuit. The crotch visibly dampens at the slightest sexual provocation, something Millie is all too happy to show off whenever it happens. Up top, it barely covers the areolae of her nipples. The pillowy tits have the fabric straining to contain them, and even then, they jiggle precariously at the slightest provocation.");
	output("\n\nLower still, Millie’s thick, strong-looking thighs carry the weight of her enormous teats with ease. She’s perfectly capable of pinning a lover in place if she so desires, and equally equipped to deliver a punishing kick to a would-be ");
	if(silly) output("jimmy ");
	output("rustler.");
	
	clearMenu();
	addButton(0,"Next",millieMenu);
}

//Solo Milking
public function soloMilkingFromMillieAttempt():void
{
	clearOutput();
	showName("\nMILLIE");
	showBust("MILLIE");
	output("You inform her that you’d like to use the milkers by yourself.");
	if(!pc.hasPerk("Mega Milk") && flags["MEGA_MILKED"] == undefined)
	{
		output("\n\nMillie laughs at that. <i>“Why come to the milk barn if you don’t want a pair of warm hands to massage you while you’re letting down? If you wanna pump your boobs by yourself, go get one of those JoyCo milkers.”</i> She rolls her eyes as if she just said something ridiculous. <i>“Now, you wanna have some fun or not?”</i>");
		processTime(1);
		clearMenu();
		addButton(0,"Push For It",soloMilkingUpgrade,undefined,"Push For It","Push for Millie to let you get a proper, private milking. Surely some of the girls in the other stalls are by themselves.");
		addButton(14,"Back",millieMenu);
	}
	else
	{	
		output("\n\nMillie laughs at that. <i>“No way. If I let you in there, you’ll push a bunch of random buttons again. Besides, my ass is still sore from the reaming Mr. Tee gave me.”</i> She rubs at her sore behind. <i>“Sure would’ve been nice if the Treatment had given my asshole the same tune-up as my vagina.”</i>");
		
		// Mega Milk hotfix
		if(pc.hasPerk("Mega Milk") && pc.perkv1("Mega Milk") < 40) pc.setStatusValue("Mega Milk", 1, 40);
		
		processTime(1);
		clearMenu();
		addButton(14,"Back",millieMenu);
	}
}

//Get Milked
public function getMilkedWithMillie():void
{
	clearOutput();
	showName("\nMILLIE");
	showBust("MILLIE");
	output("You ");
	if(pc.isBimbo()) output("cheerfully declare that you can’t wait to get your titties pumped. Yay!");
	else output("decide you’d like a milking.");

	output("\n\nMillie sets the cups aside and wraps her arms around you, smiling ");
	if(pc.tallness < 69) output("down ");
	else if(pc.tallness >= 77) output("up");
	output(" at you with a delighted expression. She ");
	if(pc.tallness < 64) output("sits you down on the nearby table");
	else output("uses her embrace to guide you to a nearby table");
	output(" before disengaging, her denim-tenting nipples dragging across your ");
	if(pc.isLactating() && pc.milkType == GLOBAL.FLUID_TYPE_MILK) output("milky ");
	output("chest in the process.");
	if(pc.isChestGarbed()) 
	{
		output(" Shaking her head, she grabs you by the [pc.upperGarment] and tugs. <i>“This’ll have to come off. Can’t get your boobs pumped if they’re all squished up in some kind of titty-prison. You should really consider letting the girls breathe a little.”</i>");
		output("\n\nYou slip out of your [pc.upperGarments] ");
		if(flags["MILLIE_MILK_COUNT"] != undefined) output("while your heart beats excitedly against your breastbone");
		else output("a little awkwardly at the command");
		output(".");
		if(pc.hasDickNipples()) output(" Her eyes widen a bit as your dicknipples peek from their hiding places. <i>“Sorry... let the boys breathe?”</i>");
		output(" You toss the equipment into the empty receptacle for clothing in the wall and ");
		if(flags["MILLIE_MILK_COUNT"] == undefined) output("nervously glance back at the buxom bovine.");
		else output("glance back at the buxom bovine, ready for your milking.");
	}
	output("\n\nMillie is openly ogling your [pc.fullChest], her eyes tracing figure eights over every sensuous");
	if(pc.milkFullness >= 90) output(", [pc.milkNoun]-packed");
	else output(", lactating");
	output(" curve. Her nipples have grown even more prominent, if such a thing is even possible. They look hard enough to cut two holes in the top of her too-tight overalls. She licks her lips, offering, <i>“Did you want to use the machines or would you rather I take care of you the old fashioned way? I’m feeling a little thirsty...”</i>");
	processTime(15);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Milkers",useTheMilkersMillie);
	addButton(1,"Feed Her",milliePersonallyDrainsYerTiTS,undefined,"Feed Her","Let Millie suck out all the pressure.");
	//[Milkers] [Feed Her]
}
//Milkers
public function useTheMilkersMillie():void
{
	clearOutput();
	showBust("MILLIE");
	showName("\nMILLIE");
	output("<i>“");
	if(pc.isBimbo()) output("Oooh, but the machines would make my titties cum soooo hard.");
	else if(pc.isNice()) output("The machines this time, please.");
	else output("Just put those cups on and flip the switch.");
	output("”</i>");

	output("\n\nMillie grabs you by a breast and swiftly seals one of the clear glass cups into place. There’s just enough passive suction in the machine’s idle state that it holds on without any assistance from the stacked bovine attendant.");
	//First time
	if(flags["MILLIE_MILK_COUNT"] == undefined)
	{
		output("\n\n<i>“One down!”</i> she proudly announces while twisting around for the next. <i>“Just wait till I turn the suction on");
		if(pc.isTreated()) output(" - you’re going to love it!");
		else output(", and you’ll feel sooo much better.");
		output(" There’s nothing quite like the feel of letting all that pressure get sucked out while you get to cum again and again.”</i> Millie presses the second pump into place, making your [pc.nipple] instantly harden from the gentle suction.");
		output("\n\n<i>“...cum?”</i> ");
		if(!pc.isBimbo()) output("Milking feels pretty good, but not THAT good.");
		else output("Gosh, are these machines that good?");

		output("\n\nThe cow-girl");
		if(pc.totalBreasts() > 2)
		{
			if(pc.totalBreasts() == 3) output(" places the other cup");
			else output(" places the other cups");
			output(" with practiced efficiency and");
		}
		output(" nods. <i>“I’m not just here to watch, goofy.”</i> Her hands squeeze your [pc.chest], gently massaging you until milk spills unimpeded from your juicing nipples. <i>“Besides, happy cows make the best milk, and I’m going to make you very </i>happy.”</i>");
		output("\n\nNot sure how react, you work your jaw, trying to come up with something to say.");
		output("\n\nMillie chooses that moment to flick the switch to the milkers, obliterating your reply.");
	}
	//Repeat
	else
	{
		output("\n\n<i>“Here we go again,”</i> she announces while twisting around for the next. <i>“I bet I can make you squirm even more than last time. Maybe you’ll even be a more productive cow!”</i>");
		output("\n\n");
		if(!pc.isBimbo()) output(" Part of you wants to protest her blasé declaration of bovinity, but you are sitting in a stall in a barn and getting hooked up to a milker.");
		else output(" Inwardly, you preen at her declaration. You’re going to be the bestest cow this side of New Texas!");

		output("\n\nMillie slips the second cup into place, rubbing around the seam until your nipple is stiff and aching for release. <i>“Yeaaaah... good [pc.boy]. Just relax, and I’ll make you feel </i>so<i> good.”</i>");
		if(pc.totalBreasts() > 2)
		{
			output(" The other cup");
			if(pc.totalBreasts() > 3) output("s are");
			else output(" is");
			output(" on before you know, gently tugging at your expanse of ready teats.");
		}
		output("\n\nYou nod, trying to come up with a good response while your attention is so focused on the wonderful tingles running through your tight nipples. Millie eliminates the need for a response by flicking the switch to the milkers.");
	}
	//Merge NEXT BUTTON!
	pc.changeLust(10);
	processTime(4);
	clearMenu();
	addButton(0,"Next",millieMilkersPartDues);
}

public function millieMilkersPartDues():void
{
	clearOutput();
	showName("\nMILLIE");
	showBust("MILLIE_NUDE");
	output("The nerves in your [pc.chest] and [pc.nipples] light with delight at being exposed to the pulsing vacuum of the breastpumps.");
	//Untreated
	if(!pc.isTreated())
	{
		output("\n\n");
		if(pc.milkFullness < 50) output("You don’t let down at first, but the milkers determined sucking slowly pulls out the first thick drops of [pc.milk]. Those droplets eventually grow to a trickle, then a downpour.");
		else if(pc.milkFullness < 80) output("You let down almost immediately, pouring out a few scarce droplets that rapidly transform into thin streams of [pc.milk].");
		else output("You gush out in thin streams at first, but they transform into thick rivers of [pc.milk] in no time at all, their passage eased by the milkers’ insistent suction.");
		output(" You watch the [pc.milkColor] fluid spatters off the sides of the clear tubes, sighing as the machines do their level best to ease the pressure in your chest. A quiet whir accompanies the mechanical attention. You let your head loll back and smile, for a moment forgetting the nearby cow-girl.");
		output("\n\nTen squeezing, gentle fingers bring her back to mind, one massaging your bosom and the other cradling your back as you’re lowered to a supine position on the table. You let her for now; if there’s an attendant here to pamper you, you might as well let her. Her hands are everywhere too, caressing your [pc.hips], gliding over the [pc.skinFurScales] of your [pc.belly], cupping the bottoms of your breasts. She massages them slowly and with care, filling you with warmth and relaxation.");
		output("\n\nAs more and more [pc.milk] is drawn from your increasingly tender nipples, Millie’s hands spend more and more time caressing your [pc.chest], rubbing and squeezing, spreading motes of desire through your supple flesh. She has you feeling like you’re melting one moment and full of erotic tension the next. Your [pc.legOrLegs] tremble");
		if(pc.legCount == 1) output("s");
		output(", and the flow of [pc.milk] redoubles. Exhaling hotly, the cow-girl nibbles around the outer edge of your ear, licking and kissing. Her hands give another furtive squeeze. You gush and moan in response");
		if(pc.hasCock()) output(", uncontrollably hard");
		else if(pc.hasVagina()) output(", so warm and wet down below");
		output(".");
		var tempCock:int = pc.cockThatFits(1000);
		//Dick
		if(pc.hasCock() && tempCock >= 0)
		{
			output("\n\nYou almost protest when she mounts you, but the moment is so quick, and her engulfing of ");
			if(pc.cockTotal() > 1) output("one");
			else output("your");
			output(" shaft so sudden, that the pleasure steals your voice. And now that she’s already atop you, what point is there in pushing her off? Millie’s pussy is equal parts squeezing vice and velvet sleeve, such a perfect fit that you can scarecly believe it wasn’t sculpted to your exact dimensions");
			if(pc.cockVolume(tempCock) >= 600) output(", even as it bulges her belly");
			output(". She slams her broad birthing hips down with table-rattling force, splattering pussy juice across the waterproofed surface.");
			pc.cockChange();
			output("\n\nMillie simultaneously squeezes your prick and your tits, and you can’t hold on any more. The scent of the buxom’s cows milk fills the air, dripping overtop of you. Her voice purrs long, low moans of pleasure. The sensations overwhelm your self-control, and you arch your back, cumming deep into the cow-girl’s dewy snatch, pumping fluids from both ends. One of her hands ");
			if(pc.hasHair() && pc.hairLength >= 1) output("grabs a fistful of your hair");
			else output("absently caresses your head");
			output(" as she herself climaxes, titanic breasts wobbling and squirting lines of cream across your machine-bound bosom.");
		}
		//Vagina
		else if(pc.hasVagina())
		{
			output("\n\nYou almost protest when her fingers slip into ");
			if(pc.totalVaginas() > 1) output("one of ");
			output("your moist juncture");
			if(pc.totalVaginas() > 1) output("s");
			output(", spreading your folds with effortless, probing strokes");
			if(pc.hasClit())
			{
				output(". Her thumb circles around the edge of your clitoral hood, and your hapless pleasure buzzer is helpless but to expose itself");
				if(pc.totalClits() > 1) output(", soon joined by its identical sister");
				if(pc.totalClits() > 2) output("s");
			}
			output(". You wriggle like a fish on a hook, sometimes trying to ease away from the wonderful sensations Millie’s probing fingertips incite, othertimes trying to ease them into just the right spot.");
			output("\n\nThe cow-girl climbs atop you, one hand still busy with [pc.oneVagina], and she leans in close, her face just above yours, her gray-blue eyes gazing deep into your own. The weight of her breasts nearly dislodges the pumps until she giggles and threads them through her cleavage. Then, bending around the hoses, she kisses you full on the lips, letting her tongue dance across your own until you finally push back, tasting the sweetness of her flavored lipgloss.");
			output("\n\nMillie breaks the kiss, still connected to you by an errant strand of saliva, her fingers still industrially wiggling, her heavy, milk-seeping nipples dragged up and down your emptying tits by the force of her rapid breathing. She twists those wonderful, [pc.girlCumNoun]-stained digits inside you, arching them");
			if(pc.hasClit()) output(" just so. Her thumb finally presses on [pc.oneClit]");
			output(" in just the right way, shaking just enough that it’s practically vibrating. Your abdomen clenches. Your [pc.legOrLegs] quiver");
			if(pc.legCount == 1) output("s");
			output(" on the table, and you cum. You cum like water pours from a shattered dam. You cum like an avalanche down a mountain.");
			output("\n\nYou cum so hard you lose all track of everything but the fireworks going off behind your eyelids and the gutteral love-sounds pouring out of your throat in one unbroken stream. Your body is but a quivering vessel for a cascade of bliss beyond reason or understanding. All you can do is hope to ride the ecstasy while every last drop of [pc.milk] is extracted from your [pc.fullChest], your body helplessly offering up every ounce in hopes of prolonging the physical reward.");
		}
		//Nothin’ butt net
		else
		{
			output("\n\nFinding nothing to fondle in your crotch, Millie climbs atop you. Somehow, the snaps on her overalls came undone, letting virtual wheelbarrows of creamy tit jiggle out to press against the underside of your chest. Milk oozes from her hard nipples in thin streams, soaking into your [pc.skinFurScales], but it’s hard to bothered by it. There’s no clothes to ruin, and it feels really good, in a sensuous, almost erotic way. Millie’s hands rub your shoulders fondly, the long half of her hair tickling your cheek as she kisses your forehead.");
			output("\n\n<i>“Relax,”</i> the buxom cow-girl orders, following it with a pleased-sounding giggle. <i>“Just cause you don’t have a thick, turgid... mmm... fun... rod down there - or a wet, welcoming twat....”</i> She shivers and tweaks one of her own nipples, scattering drops of white across the outside of the tubes. <i>“Mmm.... What I’m trying to say is, you can have tons of fun with just milky boobs and a pair of hands. Here, you grab mine.”</i> She guides your unresisting palms into place on the side of her pillowy chest. <i>“There. Give ‘em a squeeze. Don’t worry about being too rough.”</i>");
			output("\n\nThey’re surprisingly firm for their size, but there’s still enough give to make your fingers disappear when you knead the cow’s succulent breast-flesh. She returns the gesture, though not so crudely, instinctively understanding that your untreated tits won’t love a good, hard grope the ways hers do. Your [pc.milkNoun]-flow had been flagging, but the added caresses restore your productivity even while adding a warm, hazy glow to your thoughts. Cream splatters across you when Millie’s tits really start to let down. You take the warm milk-bath as a sign of a job well done and grope them a little more firmly.");
			output("\n\nMillie moos happily, but her hands keep up their erotic assault on your [pc.fullChest], squeezing here, rubbing there, finally caressing your [pc.belly] before sliding back up to obsess over your chest once more. Milk is getting everywhere. The table is slipperier than oil on water and getting wetter by the second. Millie leans back down into another kiss, letting you drown in the heat of the moment.");
			output("\n\nYour whole body is just as flushed and sensitive erotically charged as hers. Despite your obvious lack of genitalia and clenching, empty asshole, you feel infused with raw, untainted ecstasy. Your eyes close, and you lose yourself in it until a squirting boob-gasm takes you.");
		}
		output("\n\nAfter, you lay there, sweaty bodies entwined, cuddling while you let the milkers do their work... at least until Millie’s insatiable hands find their way back ");
		if(pc.hasCock()) output("to your slippery length, finding it slowly hardening once more");
		else output("to your drizzling tits");
		output(".");
	}
	//Treated:
	else
	{
		output("\n\nThe rest of the world fades away under the sheer intensity of it all, overwhelmed by the stimuli cascading over your overtaxed neurons. You feel like you could pick out every drop of [pc.milk] that’s welling up within you, sliding through your lactic ducts and into the milker in an excruciatingly pleasant way. You moo instinctively, too pleased to care. Besides, it feels right, and Millie is nodding approvingly as she wraps her hands around your ");
		if(pc.milkFullness < 50) output("leaking");
		else output("squirting");
		output(" bosom, squeezing your bust with just enough firmness to make you squirt without actually hurting you.");

		output("\n\nYour head lolls back, your mouth open and your eyes vacant, unseeing. The next moo is out before you even recognize your mouth moving. It’s easier not to worry about it and focus on the arousal surging through your body and the perfect pleasure of squirting [pc.milkNoun] into the tirelessly suckling machine.");
		if(pc.totalVaginas() > 0) 
		{
			output(" Your [pc.vaginas] become");
			if(pc.totalVaginas() == 1) output("s");
			output(" damp in seconds, but it’s a faraway concern.");
		}
		if(pc.hasCock())
		{
			output(" [pc.EachCock] is dangerously hard in seconds. It would only take a few gentle strokes to set you off down there, but you know that your boobs are going to bring you off regardless.");
			output(" Quite simply, you feel too good to even attempt to pleasure yourself further. The padded table feels nice as you slump onto your back");
			if(pc.isCrotchGarbed()) output(", letting Millie easily get you out of your [pc.lowerGarment]");
			output(".");
		}
		//Dick
		if(pc.hasCock())
		{
			output("\n\nYour peaceful, lactic paradise is abruptly interrupted by the appearance of the warmest, wettest, most wonderful sleeve wrapping around [pc.oneCock], squeezing and rippling around it, pumping you relentlessly. You feel like little more than [pc.cocks] and [pc.breasts], all being milked in equal measure. You register an orgasm from your [pc.cocks] by the way the ecstasy from your crotch overwhelms that from your breasts, not from any cogent awareness of a climax. Your [pc.cum] erupts. Your milk squirts. Your eyes close.");
			pc.cockChange();
			output("\n\nYou float in a sea of ecstasy, only aware of rhythmic suckling of your boobs, sloshing [pc.milk] inside the cups, and the sticky wetness you make by erupting into Millie’s cunt again and again.");
		}
		//Cooches
		else if(pc.hasVagina())
		{
			output("\n\nA forceful, slippery sensation intrudes on your lactic paradise, forcing the feelings of soaked fingers wriggling through sensitive folds to occupy your mind. Your body responds on autopilot, gushing yet more [pc.milkNoun] for an imaginary mate while your nerves are strummed into bliss-inducing chords. Millie has your hips wriggling up onto the cusp. She hooks them, pushing just the right spot inside");
			if(pc.hasClit()) output(" while her thumb comes to rest on your [pc.clit], and you cum.");
			else output(" that it forces you to cum.");
			output("\n\nIt isn’t the kind of quivering climax you’re used to, though. It’s a controlled demolition of your consciousness, set off by every sensitive place in your body in unison. The pleasure from your [pc.vaginas] rebounds off the wonderful release your tits are experiencing. Even your [pc.asshole] is clenching with every boneless jerk of your [pc.legOrLegs]. Someone is mooing, again and again, each louder than the one before. It sounds so wonderful and right - the perfect vocalization of what you need and feel distilled into a single, awesome sound.");
			output("\n\nComforted by your own vocalizations, you slip into a sea of ecstasy, only aware of the rhythmic suckling against your boobs, the [pc.milkNoun] sloshing against your [pc.nipples] inside the cups, and the skillful, powerful pistoning of those soaked digits sliding into your nethers.");
		}
		//Neither. Tiny baby PC.
		else
		{
			output("\n\nMillie’s hands are all over you, seasoning for the feast of pleasure your [pc.fullChest] are producing. They knead your pliant flesh like a skilled masseuse, eliminating tension wherever they find it, insulating you from the real world with a padded realm of pure pleasure. The feeling of her cushy form over your own barely registers, and the taste of her cherry flavor on your lips has your tongue lolling out, probing her silky depths in between grunting moos.");
			output("\n\nThere is nothing but her fingers, her taste, and the ever-present sensation of giving milk like a good little cow.");
		}
		pc.libido(1);
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",millieMilkingFinale);
}

//Next - post milking
public function millieMilkingFinale():void
{
	clearOutput();
	showName("\nMILLIE");
	showBust("MILLIE");
	//Untreated
	if(!pc.isTreated())
	{
		output("The shock of a still-sucking hose being eased off of your swollen nipple rouses you from your pleasant, post-orgasmic haze. ");
		if(pc.totalBreasts() > 2) output("A");
		else output("The");
		output(" second is pulled from you with a ‘pop’, waking you the rest of the way.");
		if(pc.totalBreasts() > 2) 
		{
			output(" You blink, bleary-eyed, watching her free you from the last tube");
			if(pc.totalBreasts() > 3) output("s");
			output(".");
		}
		else
		{
			output(" You blink, bleary-eyed.");
		}
		output(" Your chest is puffy and reddened, engorged beyond reasonable measure from the constant sucking.");
		output("\n\nMillie strokes you, gently, your body still slick from her milk and a little of your ");
		if(pc.milkType == GLOBAL.FLUID_TYPE_MILK) output("own");
		else output("[pc.milkNoun]");
		output(". Gasping, you squirm away, still far too sensitive after so much time hooked up to the machine. The cow stops, grabbing you a towel. <i>“Here, clean up.”</i>");
		output("\n\nYou wipe yourself up, avoiding your sore, completely emptied tits until last, giving them as long as possible to recover from the rough treatment. Still, when you finish, you’re clean, even if the stall smells like milk");
		if (pc.isLactating() && pc.milkType != GLOBAL.FLUID_TYPE_MILK) output(", [pc.milkNoun],");
		output(" and cherries - the source of the last the obvious damp patch that Millie’s denim has acquired.");
	}
	//Treated
	else
	{
		output("The shock of a still-sucking hose being eased off of your swollen nipple rouses you from your dreamy, pleasure-drunk state. ");
		if(pc.totalBreasts() > 2) output("A");
		else output("The");
		output(" second is pulled from you with a ‘pop’, further wakening you.");
		if(pc.totalBreasts() > 2) 
		{
			output(" Bleary-eyed, you watch her free you from the last tube");
			if(pc.totalBreasts() > 3) output("s");
			output(".");
		}
		else
		{
			output(" Bleary-eyed, you look down at yourself.");
		}
		output(" Your nipples look like proper teats now: huge and puffy, engorged beyond reasonable measure from all the sucking.");
		output("\n\nMillie strokes one like a miniature dick, and you gasp. The flesh there is still slick from your [pc.milk] and oh-so-sensitive after being pumped for who knows how long. You moo in quiet pleasure, noting that the raven-haired beauty has stained her overalls with her own creamy-smelling milk.");
		output("\n\nShe bends over you, pulling a strap to the side so that her leaking teat can pop out. You suckle it hungrily, replacing a few lost fluids over the course of a few minutes. Millie switches out, only feeding you enough to keep herself off the edge. The stall floods with the scent of cherries all the same, and by the time she helps you up, you note that her cheeks are flushed and her crotch is liberally dripping with excitement.");
		
		var ppMillie:PregnancyPlaceholder = new PregnancyPlaceholder();
		ppMillie.breastRows[0].breastRatingRaw = 40;
		ppMillie.milkMultiplier = 100;
		ppMillie.milkFullness = 100;
		pc.milkInMouth(ppMillie);
		
		//Temporary Treatment funtimes
		if(pc.hasStatusEffect("Temporary Treatment"))
		{
			output("\n\nYou almost jump her right there and then until she takes the headband off you, stunning you as your thoughts realign into their former patterns. Your jaw works as you try to make sense of the insane experience.");
			if(pc.breastRows[0].breastRating() < 3)
			{
				output(" And your breasts... wow.");
				if(pc.breastRows[0].breastRatingRaw < 1) output(" You still have them, and they’re plenty big.")
				else output(" They’re still bigger.");
				pc.breastRows[0].breastRatingRaw = 3;
				output(" You guess that part wasn’t as temporary as advertised.");
			}
			if(!pc.isLactating()) pc.boostLactation(4);
		}
	}
	//Merge
	output("\n\n<i>“Not bad, huh?”</i> Millie");
	if(pc.isChestGarbed()) output(" hands you back your top");
	else output(" gives your ass a confident swat");
	output(". <i>“Come back when you want some more.”</i>\n\nA holodisplay on the wall proudly broadcasts this session’s productivity: <b> ");
	var milkAmount:Number = pc.lactationQ(99);
	if(milkAmount < 1000 && pc.hasStatusEffect("Temporary Treatment")) milkAmount += 1500 + rand(500);

	milkAmount = Math.round(milkAmount);
	StatTracking.track("milkers/breast milker uses");
	StatTracking.track("milkers/milk milked", milkAmount);

	if(milkAmount > 1000) output(milkAmount/1000 + " Ls</b>")
	else output(milkAmount + " mLs</b>");

	processTime(65);
	
	flags["MILLIE_LAST_ACTION"] = "Milker";
	IncrementFlag("MILLIE_MILK_COUNT");

	//Faux Treatment!
	if(pc.hasStatusEffect("Temporary Treatment"))
	{
		flags["MILLIE_LAST_ACTION"] = "Faux Treated";
		pc.removeStatusEffect("Temporary Treatment");
	}
	
	pc.milked(pc.milkFullness);
	pc.boostLactation(1);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Fuck Millie
public function fuckMillie():void
{
	clearOutput();
	showName("\nMILLIE");
	showBust("MILLIE");
	flags["MILLIE_LAST_ACTION"] = "Fucked";
	//Clothed
	if(!pc.isNude())
	{
		output("You slip one hand into your [pc.lowerGarments] and nonchalantly give a downward tug, deliberately exposing the ");
		if(pc.cockTotal() == 1) output("[pc.sheath]");
		else
		{
			if(pc.totalSheaths() > 1) output("sheaths");
			else output("bases");
		}
		output(" of your [pc.cocks]. Millie’s eyes follow, almost hypnotized by the inexorable downward progress of your garments. You feel your length");
		if(pc.cockTotal() > 1) output("s");
		output(" bowing, desperate to lurch upward and yet trapped by the constricting mass of your downward-drifting equipment. Growing uncomfortable, you slip them the rest of the way down to let your [pc.cocks] free, pointed directly at the buxom cow-girl.");
	}
	//Nude
	else
	{
		output("You slip one hand down to your [pc.cocks] and nonchalantly give ");
		if(pc.cockTotal() > 1) output("the biggest");
		else output("it");
		output(" a few lazy strokes, all while looking the cow-girl in the eye. She breaks the matched gaze first, glancing down to watch you approach full firmness, an eager light in her eyes.");
	}
	//Merge
	output("\n\nThe dark-haired cow-woman ");
	if(pc.isNude()) output("bats your hand away");
	else output("uses a foot to kick your [pc.lowerGarments] aside");
	output(", then flicks the volume control on her tablet, filling the stall with harsh-sounding tunes. <i>“Yeah, you look like you need a good... thorough... milking.”</i> Her gray-blue eyes twinkle while her hand wraps you in a firm grip. <i>“This needs a more personal touch, don’t you agree?”</i>");

	pc.changeLust(10);
	processTime(5);
	//Give choice until yeah is taken.
	if(flags["FUCKED_MILLIE"] == undefined)
	{
		//[Yeaaaah] [No]
		clearMenu();
		addButton(0,"Yeaaah",yeahMillieLetsFuck);
		addButton(1,"No",cockTeaseMillie);
	}
	else
	{
		clearMenu();
		addButton(0,"Next",yeahMillieLetsFuck);
	}
}

//No
public function cockTeaseMillie():void
{
	clearOutput();
	showBust("MILLIE");
	showName("\nMILLIE");
	output("Millie laughs. <i>“If you thinking shoving your dick in a tittymilker is going to feel good, you’re dumber than little miss fuck’n’suck at the welcome desk.”</i> She releases your cock and wipes her hand on one of the many nearby towels, disappointment evident on her face. <i>“If I wasn’t on the job, I’d show you how I deal with teases.”</i> Millie swats your ass fairly hard. <i>“Git along now, and don’t go waggling that delicious prick at a girl unless you intend to let her take care of it.”</i>");
	output("\n\nThe frowning cow-girl pushes you to the door. <i>“Come back with a nicer attitude, and maybe we’ll have more fun next time.”</i>");
	//Pushed out to main room
	processTime(1);

	moveTo("511");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Yeaaaah
public function yeahMillieLetsFuck():void
{
	clearOutput();
	var x:int = pc.cockThatFits(1000);
	if(x < 0) x = pc.smallestCockIndex();
	showBust("MILLIE_NUDE");
	showName("\nMILLIE");
	output("<i>“Yeaaaah.”</i>");
	output("\n\nMillie gives you a rewarding tug and an affectionate squeeze down around your [pc.knotBiggest]. <i>“Atta [pc.boy]. Let’s get you up on the table.”</i>");
	output("\n\n");
	if(flags["FUCKED_MILLIE"] == undefined) output("Just what’s she planning?");
	else output("Oh, this again?");
	output(" Obligingly, you hop up onto the table’s waterproofed surface, regretfully leaving her supple palm behind.");

	output("\n\n<i>“Lie down. It’ll be easier that way.”</i> Millie’s hand finds your length once more, and she traces a slow line up your sensitive underside. <i>“");
	if(pc.isTreated() && pc.mf("m","") == "m") output("I know you’re a big, strong bull,");
	else output("I know you probably want to bend me over and pound my sweet pussy,");
	output(" but in my stall, I’m on top.”</i> Her other hand twists the fasteners on one side of her overalls, causing the left side of the straining denim to give, exposing a breast.");

	output("\n\nYou ease yourself back until you’re completely flat on the table’s surface");
	if(pc.tallness >= 84) output(", except for your dangling [pc.feet]. Height does have its disadvantages");
	output(". You blink your eyes closed rather than endure the harsh light for a second longer. Besides, if there’s one thing you can trust a cow-girl with, it’s properly worshipping a cock. Even a cow with a decided abnormal forcefulness to her.");

	output("\n\n");
	showImage("MillieGreetingNude");
	output("Millie picks up her stroking where she left off, though you can hear her other hand fiddling with the last clasp on her denim outfit. You can see it now with your minds eye, those nimble fingers struggling with a too-tight fastener, sending those gigantic boobs swaying and jostling against one another, giving her cleavage a sensuous wiggle. Springing open with an audible rustle of fabric, Millie’s outfit gives out. She doesn’t even have to stop jacking you off to get out of it. She goes right on stroking, treating your rod like a favored pet while wiggling the tight fabric down.");

	output("\n\nA bright, cherry-scented musk fills the air - Millie’s scent, you realize a moment before the pheromones hit you. And they do hit you hard, speeding your heartbeat, spurring fresh blood to pump into your [pc.cocks], making you harder and firmer than normal. Pre-cum is already beading at your tip");
	if(pc.cockTotal() > 1) output("s");
	output(", and the dutiful cow collects it all to smear back over your length");
	if(pc.cockTotal() > 1) output("s");
	if(pc.cockTotal() > 2) output(" in sequence");
	output(", making ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output(" shine with your own sex-juice.");

	output("\n\nYou try to relax, but it’s damned hard while your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is");
	else output("are");
	output(" tight and slippery and the air filled with a woman’s heated scent. Your body wants to thrust so badly, to plunge in and fuck the cow-girl until she’s a quivering puddle of insensate slut, but you try not to spoil the moment... for now. You aren’t sure how long you’ll be able to hold back.");

	output("\n\nMillie’s relentless stroking stirs your ardor to boiling, but she doesn’t keep you waiting long. Bending down, she lets go, but only so that she can lavish you with affectionate licks while climbing onto the table. It creaks and rattles from the extra weight but holds firm in spite of handling two bodies. The cow-girls’ breasts drag over your [pc.legOrLegs] hard, milk-seeping nipples pressing on your ");
	//Fur/Scales if has an appropriate leg flag/[pc.skinFurScales]
	if(pc.hasLegFlag(GLOBAL.FLAG_SCALED)) output("scales");
	else if(pc.hasLegFlag(GLOBAL.FLAG_FURRED)) output("fur");
	else output("[pc.skinFurScales]");
	output(". Her saliva-lubricated tongue bathes your [pc.cockHeadBiggest] in one last lick before breaking contact, leaving you spit-shined but anxious for more.");

	output("\n\n<i>“Awww, want some more?”</i> the leaking animal-girl asks while climbing up your body with a determined look in her eyes, breasts dragging across you the entire time. One of her slippery nipples even brushes against [pc.oneCock], staining it with a trail of white.");

	output("\n\nOf course you want more! <i>“Yes!”</i>");

	output("\n\n<i>“Too bad.”</i> Millie’s plush, angel-bow lips smirk. <i>“No more mouth-love for you.”</i> Her soft thighs settle over your [pc.hips]. <i>“No more handies.”</i> Her finger traces a line ");
	if(pc.biggestTitSize() < 1) output("down the middle of your chest");
	else output("between your [pc.fullChest]");
	output(".");
	
	output("\n\n");
	if(flags["FUCKED_MILLIE"] == undefined) output("No more? <i>“Wait... how?”</i>");
	else output("Oh, this again. You smile back at her. <i>“Of course.”</i>");

	output("\n\nThe confident cow affectionately rubs her index finger in a circle around your [pc.nipple]. <i>“Time for your milking.”</i> Her hips slide down, trapping your [pc.cocks] between her warm, Treatment-enhanced body and your own, her moist lips spreading her cherry scent all over");
	if(pc.cockTotal() == 1) output(" it");
	else output(" [pc.oneCock]");
	output(". Millie rocks back, smearing her copious, cherry-scented lubricant down to your ");
	if(pc.balls > 0) output("[pc.balls]");
	else output("[pc.sheathBiggest]");
	output(", then sliding herself back up to the tip. She pivots, leaning over you, those two gigantic breasts pressing down around your face while milk pools below the nape of your neck. ");
	if(pc.totalCocks() > 1 && pc.biggestCockVolume() > 1000) output("Shifting to a more appropriately sized member, ");
	output("Millie wriggles your [pc.cockHead " + x + "] into her sodden slit.");
	output("\n\n<i>“Blowjobs and machines are such a waste of good cum, [pc.name]. This is better. Don’t you agree?”</i>");
	output("\n\nYou’d be foolish not to, with the way her silken slit is slowly devouring inch after inch of your eagerly pulsing length");
	if(pc.cockTotal() > 1)
	{
		output(" and her sopping-wet exterior presses on your remaining phall");
		if(pc.cockTotal() == 2) output("us");
		else output("i");
	}
	output(". You grunt in the affirmative and grab hold of her by her jiggling asscheeks, pulling her to speed the penetration.");

	pc.cockChange();

	output("\n\nMillie’s eyebrows wrinkle as if she’s about to scold you, but when her prominent clitty rubs and presses down on your crotch, she’s all smiles again. The inside of her pussy is as warm and wet as you’d expect, so capable and elastic. Yet, the real treat is the way she moves the muscles inside, firmly squeezing you one moment and fluttering up the length of your shaft the next. A few seconds later, now that the cow-girl has started happily bouncing in your lap, her insides begin to rhythmically contract, squeezing your [pc.cockHead " + x + "] to press it against the most sensitive places within her as it slides in and out.");
	output("\n\nYou don’t have to do anything but hold onto her cushy bottom and try not to go insane from her skillful lovemaking. Your [pc.hips] do occasionally make the odd upward thrust, but Millie meets the errant motions with the weight of her full, curvaceous form, slamming you into the table with almost bruising force. Her eyes are half-vacant, fogged with pleasure, but the knowing quirk at the corners of her lips give away her intent; she isn’t getting fucked. She’s riding you, and if you push back, she’ll take you into the ground like a rebellious rodeo bull.");
	output("\n\nWell, when in New Texas, do as the Texans do. You tip your head to the side during one of her excited, upward bounces and open wide, capturing a cream-drizzling nipple on her cock-squeezing downstroke.");
	output("\n\nMillie gasps, <i>“Now you’re getting it! I take care of you.”</i> Her inner muscles ripple along your [pc.cock " + x + "] from stern to stem. <i>“And you can take care of me.”</i> The milk courses down your throat, sweet, warm, and filling. Moaning, the cow-girl’s loses her confident, domineering facade to the pleasure of having her most sensitive places attended to. Her rhythmic bucking degenerates into an off-beat crotch-pounding, and the free nipple is spraying milk ");
	if(pc.hasHair()) output("into your [pc.hair]");
	else output("all over your head");
	output(".");

	output("\n\n<i>“Fuck, I think I’m g-gonna...”</i> Millie pants, throwing her head back as her voice trails off. <i>“Moooo!”</i> She screams the animalistic sound, cascading milk from her swollen teats like twin waterfalls. The pressure in your mouth overwhelms your ability to swallow, blasting white out the corners of your mouth until you gurgle and let it go, letting her spray the rest of her lactic load across your neck and [pc.chest]. Inside her pussy, the muscles that were so pleasantly attending to your rod have gone wild. They squirm and wriggle, pulling and squeezing as if demanding you nut on the spot, doing their job with no input whatsoever from the cow-girl’s overloaded brain.");
	output("\n\nMillie’s eyes have rolled back, and her mouth hangs open with her tongue lolling out, a line of spit connecting her onyx lip to her chin. She moos about as often as she moans. Her body is obviously experiencing climax after climax, yet she shows no signs of slowing. Splattering cunt-juice across the table’s slickened, waterproof surface, she rides your [pc.cock " + x + "] like her life depends on it, squelching wetly while your pre is diluted by the rivers of fragrant girlspunk.");
	output("\n\nYou can feel your own pleasure rising to meet hers - how could you not? That perfect, bald pussy is making love to your rigid shaft");
	if(pc.cockTotal() > 1)
	{
		output(", the outside slobbering affection on your extra dick");
		if(pc.cockTotal() > 2) output("s");
	}
	output(". Millie is like a dick-pleasing machine stuck on full-throttle and gushing with extra lubricant. Somewhere along the line, you started moaning with her");
	if(pc.isTreated()) output(", even gracing her with an occasional, masculine moo. It felt like the right thing to do");
	output(". Her other nipple even found its way into your mouth, the lactation slow enough for you to keep up with once more.");

	output("\n\nPleased beyond all reasonable measure, you revel in the moment, feeling your [pc.cocks] surge");
	if(pc.balls > 1) output(" and your [pc.balls] tense");
	output(". You gurgle happily, suck down a mouthful of milk, and slather her nipple in an excited, feverish lick. Abandoning any semblance of self-control, you grab hold of her wide birthing hips and bury your ");
	if(pc.hasKnot(x)) output("bone to the knot, letting it expand inside her to tie you in place");
	else if(pc.hasCockFlag(GLOBAL.FLAG_FLARED) && pc.cocks[x].cLength() >= 7) 
	{
		output("flaring tip in ");
		if(pc.cocks[x].cLength() < 25) output("until it kisses the cow’s cervix");
		else output("as far as it will go");
	}
	else output("rigid dick in to the hilt");
	output(". Tension and pleasure war for your attention for an eternity, but the pleasure slowly melts through, replacing the tension with sublime, [pc.cumNoun]-pumping relief.");
	var cumQ:Number = pc.cumQ();
	output("\n\nMillie trembles atop you, the feeling of your [pc.cum] inside her triggering the mother of all climaxes. Her back arches");
	if(cumQ >= 600) output(" as her belly bloats");
	output(". Her voice trembles. Then, with an exhausted, pleased-sounding whimper, the cow-girl collapses atop you, her nipple pulling from your mouth");
	if(cumQ >= 1000) output(" while your exceedingly potent orgasm continues to flood her womb");
	output(".");
	if(cumQ >= 600)
	{
		output(" By the time you’re done, she looks ");
		if(cumQ < 800) output("five");
		else if(cumQ < 1200) output("six");
		else if(cumQ < 1600) output("seven");
		else if(cumQ < 2500) output("eight");
		else if(cumQ < 4000) output("nine");
		else output("ten");
		output(" months pregnant and growing.");
		if(pc.hasKnot(x)) output(" Your swollen knot trapped every single drop inside her.");
	}
	processTime(25);
	pc.orgasm();
	//Next
	clearMenu();
	addButton(0,"Next",millieFuckFinale,cumQ);
}

public function millieFuckFinale(cumQ:Number):void
{
	clearOutput();
	var x:int = pc.cockThatFits(1000);
	if(x < 0) x = pc.smallestCockIndex();
	showBust("MILLIE");
	showName("\nMILLIE");
	output("Millie recovers faster than you would have expected, popping her eyes open and smiling radiantly. <i>“See? Wouldn’t wanna waste any of this");
	
	if(cumQ >= 1200) output("... oh gosh, so much!”</i> She rubs her belly in awe.");
	else output(" cum.”</i>");
	output(" Her New Texan accent comes through much thicker than before you met, and her eyes are a little glassier than normal. You suppose it can be forgiven in light of the dozens of climaxes she just endured.");

	output("\n\nThe well-fucked cow ");
	//Knot:
	if(pc.hasKnot(x)) 
	{
		output("tries to get off of you, but the knot holds her firm. She gives up after a few tries and looks at you with an expression between annoyance and sublime pleasure. <i>“You’re just gonna pin all that cum in me till I get knocked up, ain’t ya?”</i>");
		output("\n\nYou nod, still reeling from the extreme pleasure your rigid prick provides.");
		output("\n\nMillie lays her head down");
		if(pc.tallness >= 84) output(" on your chest, kissing a nipple.");
		else if(pc.tallness >= 70) output(" next to you, kissing the back of your milk-soaked neck.");
		else output(" above your own, nuzzling against your milk-soaked head.");
		output(" <i>“That’s just fine by me. Maybe you’ll be the one to do it, too.”</i> Her voice is far away and dreamy.");
		output("\n\nYou enjoy the cuddling for another half hour until your knot finally returned to a reasonable size. Then, separating, the two of you wipe with conveniently placed towels and say your farewells, pointedly ignoring the fact that you both smell of cherries and [pc.cum].");
	}
	//Noknot
	else
	{
		output("eases off you carefully, shuddering a few times when she bumps you with the raw, sensitive parts of her anatomy. <i>“Mmm, that hit the spot.”</i> Her accent is thicker... much more noticeable than before your tryst, but you suppose a few dozen climaxes will do that to a girl. It’s a wonder she’s able to stand up at all with the way her thighs were trembling.");
		output("\n\nMillie tosses you a couple fluffy towels to wipe up with, already dabbing at the ");
		if(cumQ >= 500) output("gushing [pc.cumNoun] rushing from her slit");
		else output("excessive amounts of girlcum coating her thighs");
		output(". You join her in getting a cursory cleanup, ready to go in a few minutes. You at least look clean, even if you smell like you just fucked three-dozen cherry trees.");
	}
	processTime(4);
	flags["FUCKED_MILLIE"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Treatment-Light Milking
public function treatmentTryouts():void
{
	clearOutput();
	showBust("MILLIE_NUDE");
	showName("\nMILLIE");
	output("<i>“How about those enhancers?”</i>");
	output("\n\nMillie’s smile gets wider. <i>“You wanna see what it’s like to be Treated, huh?”</i>");
	output("\n\nYou nod a little ");
	if(flags["TRIED_TREATMENT_LIGHT"] != undefined) output("too eagerly, still fondly remembering the last time.");
	else output("hesitantly");
	output(".");

	output("\n\n<i>“Well you made the right choice. Here. Take two of these.”</i> She fishes two little pink pills out of a bottle. <i>“Don’t worry, they’re cherry flavored. You can just chew ‘em up.”</i>");
	output("\n\nYou ");
	if(flags["TRIED_TREATMENT_LIGHT"] == undefined) output("shrug and pop them on in");
	else output("gobble them down in a hurry");
	output(". They taste as sweet as promised, though the scent of fruit lingers in the air long after the fizzling, tingly pills have dissolved on your tongue. Millie smiles, slipping a headband over your forehead.");
	output("\n\n<i>“");
	if(flags["TRIED_TREATMENT_LIGHT"] == undefined) output("What’s that for?");
	else output("Oooh, tell me about the headband again!");
	output("”</i> Your tongue feels... thick, and kind of wiggly, but what’s really distracting you is ");

	if(!pc.isChestGarbed()) output("just how... well... noticeable your [pc.nipples] have gotten. You don’t have them covered up at all, but the air blowing over them is just so... so... distracting. They’re getting all perky too!");
	else output("just how scratchy the inside of your [pc.upperGarment] is against your [pc.nipples]. They’re like two little voices in the back of your head, begging you to rip your way out of that stuffy old top and give them a few squeezes.");

	if(!pc.isLactating()) output(" The strangest part is the building sense of... pressure. They feel full.");
	else output(" The strangest part is how they feel wayyy fuller than they did a moment ago, like you’re just gonna start squirting nonstop if Millie gives you a friendly squeeze.");
	output("\n\nMillie just laughs to herself. <i>“A few pills might make your nipples all juicy and sensitive for an hour, but they won’t have you thinking like the cow you could be.”</i> She thumbs at one of your seeping teats, giggling when you moan like a whore in heat. <i>“Well... they help anyway. Here. Try this.”</i>");
	output("\n\nShe pushes a button on a really big, heavy looking piece of machinery. You had assumed it was part of the milker itself, but... it’s like, something totally different. You bounce, watching your");
	if(pc.breastRows[0].breastRating() < 3) output(" suddenly-expanding");
	output(" boobs jiggle. Damn, your nipples feel sooo good. One of your hands is already rubbing in circles around one, spreading jolts of happiness through your body. Gosh, they’d feel so much better with someone sucking on them.");
	output("\n\n<i>“Uh, Millie, you’re gonna suck my tits, right?”</i>");
	if(pc.isChestGarbed()) output(" You drop your [pc.upperGarments] to the side, not noticing the receptacle that’s meant to hold them.");
	output(" The wobble of your drizzling mammaries nearly distracts you from the gorgeous cow you’re trying to talk to. Her boobs must feel amazing! You bite your [pc.lip] and try not to stare. But... why shouldn’t you stare? Those titties are awesome. You get flushed just thinking about them.");
	output("\n\nTreated girls must have so much fun! You resolve to take the Treatment as soon as the lovely girl on the other side of the stall takes care of your boobies");
	if(pc.hasVagina()) output(" and that nagging itch between your thighs");
	else if(pc.hasCock()) output(" and that rigid hardness down south");
	output(". Then you pinch your nipple for good luck and promptly forget.");
	output("\n\nMillie wraps her arms around you, squishing you boob to boob. <i>“It can be a little overwhelming, I know. Once you actually take the Treatment, you’ll have a lot more time to adjust to it.”</i>");
	output("\n\n<i>“Uhh...”</i> Her nipples are leaking all over you, coating your thoughts with slippery-sweet vibes. You close your mouth and wiggle back and forth, acknowledging the suggestion from your overheated teats with the automatic action. Everything feels so much better when you listen to your body. It knows exactly what to do, all you had to do was just stop thinking about it so much. You decide to put your lips to better use and kiss the cow-girl.");
	output("\n\nStarbursts of pleasure explode in your mouth, and you melt into Millie, suddenly realizing just how good it feels to play with a friend. Why worry about your own pleasure when you can make this amazing woman’s titties quake with joy, just like yours!");
	output("\n\nThe punky cow grabs your [pc.butt], and a tiny part of you whispers that things are getting out of hand. But then again, your cheeks are screaming about how good it feels to be fondled and lifted up into the air. Maybe they’d feel even better if she pulled them apart and slipped a finger in between. When they slip out to drop you on the table, you sigh with disappointment. <i>“Awww, don’t stop!”</i>");
	output("\n\nMillie lifts two of the milker’s cups up and clinks them together. <i>“I’m just getting started, you dumb cow. Damn, I’m glad I didn’t get this brainless.”</i>");
	output("\n\nYou cock your head to the side. Should you be offended? You’re pretty sure she said something mean about you, but you’re having a hard time caring. You guess you are acting pretty dumb, but that’s just cause you’re all happy and listening to your big, wet titties instead of trying to sound smart. That’s all! You pout at Millie, though whether from the irritation of squeezing all that cognition together or from having to wait this long for your boobs to get taken care, you aren’t sure.");
	output("\n\nHer next kiss makes it all better, brief as it may be. <i>“I’m sorry. Here, let me take care of you. The pumps will make it all better.”</i>");
	output("\n\nThe cold glass of one of the machine’s cups presses just south of one of your areolae, slowly climbing higher as the tube is levelled against one [pc.milkNoun]-filled mammary. Once the seal is completed, your [pc.nipple] expands, firming up from the constant, idle suction that holds the milker in place. You sigh dreamily");
	if(pc.legCount > 1) output(", and your [pc.legs] drift apart");
	output(". You could really go for a fuck right about now.");

	output("\n\nSeeing the lazy, slutty cast of your eyes, Millie graces you with a wink. <i>“We’ll have some fun once I turn on the milkers. I promise.”</i>");

	output("\n\nYou nod dreamily, batting your eyelashes and smiling in a way that could never be taken as anything other than a sexual invitation. <i>“Kay.”</i>");

	output("\n\nThe ");
	if(pc.totalBreasts() == 2) output("other");
	else output("second");
	output(" cup slips on, and you swoon, eyes rolling back in your head for a moment. Your [pc.chest] just feel so... so... yummy!");
	if(pc.totalBreasts() > 2)
	{
		output(" The other cup");
		if(pc.totalBreasts() > 3) output("s are");
		else output(" is");
		output(" on before you know it.");
	}
	output(" The knowledge that you’re sitting in a stall in a barn with plus-sized boob-suckers hanging off your chest hits you all at once. Fortunately, you’re so turned on that you fast forget your shame. Cows have tons of fun anyway, right? You look up at Millie, unsure.");
	output("\n\n<i>“Cows have fun, right?”</i>");
	output("\n\nThe horned attendant stops rubbing the damp, cherry-scented patch between her thighs. You love that smell.");
	output("\n\n<i>“Of course we do. Here, just relax and enjoy your milking.”</i> She presses a switch, turning the pumps on for their active milking cycle. <i>“Feel free to moo if the desire takes you.”</i>");
	pc.createStatusEffect("Temporary Treatment");
	pc.changeLust(35);
	processTime(5);
	clearMenu();
	flags["TRIED_TREATMENT_LIGHT"] = 1;
	addButton(0,"Next",millieMilkersPartDues);
}

public function milliePersonallyDrainsYerTiTS():void
{
	clearOutput();
	showBust("MILLIE_NUDE");
	showName("\nMILLIE");
	//Bimbo
	if(pc.isBimbo()) output("<i>“Like, suck it out yourself? For sure!”</i>");
	//Bro
	else if(pc.isBro()) output("<i>“Help yourself.”</i> You gesture magnanimously at your own pillowy bosom.");
	//Nice
	else if(pc.isNice()) output("<i>“Ohhh, you’d do that? Yes, please.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("<i>“So long as you don’t use your teeth, they’re all yours.”</i>");
	//Hard
	else output("<i>“Fine, but you’d better not use your teeth.”</i>");

	//Merge
	output("\n\nMillie licks her lacquered lips and practically pounces on you, lifting you up and bearing you to the table ");
	if(pc.tallness >= 70 || (pc.tallness >= 60 && pc.thickness >= 70)) output("with a considerable amount of effort");
	else output("under the weight of her curvy form");
	output(". After placing you down, she doesn’t remove her hands. They migrate to your top instead, each finding a slippery breast to fondle and caress. Her confident grip tightens around your nipples, and you groan, surprised by the cow-girl’s shameless groping of your ");
	if(pc.milkType == GLOBAL.FLUID_TYPE_MILK) output("milky");
	else output("liquid-stuffed");
	output(" assets.");
	output("\n\n<i>“Doesn’t this feel better than any old milker?”</i> the buxom cow suggests while idly tugging at your [pc.nipples] as if she were milking an actual bovine.");
	
	output("\n\nYou bite your [pc.lip], ");
	if(pc.isTreated() && pc.isBimbo()) output("awash with too much pleasure to manage an answer.");
	else output("not sure how to respond.");
	output(" ");
	if(pc.milkFullness < 50) output("She’s already squeezed the first few droplets of [pc.milk] from your increasingly sensitive teats");
	else if(pc.milkFullness < 80) output("She’s already getting her fingers wet with free-flowing [pc.milkNoun] from your increasingly sensitive teats");
	else output("She’s already soaked her fingers with all the [pc.milk] your increasingly sensitive teats are spraying out");
	output(" and doesn’t seem to be expecting any kind of response. Your breathing quickens the longer you endure her practiced, boob-draining ministrations. Arousal is welling up apace with your [pc.milk], and you squirm against the table while she works, flushing hot.");
	output("\n\nMillie is well aware of the effect she’s having on you, and continues to lavish your areolae in attention. <i>“There we go... got a nice flow going now, wouldn’t you say?”</i>");
	output("\n\nYou crane your head to look, watching with blushing cheeks while ");
	if(pc.lactationQ() >= 2000) output("cascades of [pc.milkColor] careen down the sides of your [pc.fullChest]");
	else if(pc.lactationQ() >= 1000) output("streams of [pc.milkColor] roll down the sides of your [pc.fullChest]");
	else output("droplet after droplet rolls down the sides of your [pc.fullChest]");
	output(". The cow-girl’s fingertips are soaked with the stuff, but she doesn’t seem to mind.");
	output("\n\n<i>“Yeah...”</i>");
	output("\n\nPulling one hand away, Millie licks her digits clean, making a show of it. She plunges her index finger into her lips and slowly drags it back out, leaving it clean of everything but a layer of gleaming saliva. She rolls a wide, bovine tongue to handle the middle one, dragging the slippery muscle across each side until she’s collected every drop of your [pc.milk] from her largest digit. Half-licking, half-sucking her thumb, the clearly excited milkmaid cleans the worst of your mess from her hand, oblivious to the wet patches her own well-endowed chest is leaving on her overalls.");
	output("\n\nThe cow looks down and giggles vapidly, her eyes a little glassy. <i>“Whoopsie! Looks like I’m getting a little milky too. Do you mind if I...?”</i> The statement trails off, but its clear from the way she’s holding her freshly cleaned hand at the snaps on her overalls just what she means.");
	output("\n\nMillie’s other hand has been busy this whole time, tugging and squeezing to keep you nice and drippy. It moves to an unoccupied breast while she awaits an answer, the motion the kind of thoughtless, practiced thing that only comes about as a result of hours upon hours of sordid milkings.");
	output("\n\nYou stifle a moan and try not to arch your back, denying your body’s desire to crush your teat into her palm. ");
	if(pc.isBimbo()) output("Cogent thoughts come hard at times like these - the pleasure is just too much, blowing your thoughts apart with surges of pleasant tingles and bright pink bubbles. Still, she’s expecting an answer, so you rack your overloaded cerebrum for an answer. <i>“Like, go ahead.”</i> You chew on your [pc.lip] excitedly. She’s gonna be all milky with you!");
	else output(" It’s hard to care at moments like these. Besides, she’s already got her hands all over your tits, what’s it gonna hurt if she pulls hers out too? You glance toward the straining fabric. The poor cow probably needs the release, honestly. <i>“Sure, go ahead.”</i>");
	output("\n\nMillie pops one of the catches on her top, releasing the weight of one of her breasts all at once. The fabric flings open, spraying you with a hail of sweet, New Texan cream. Some even lands in your mouth");
	if(pc.isBimbo()) output(", and it’s super tasty!");
	else output(", but rather than feeling disgust, you can only marvel at the delicious taste.");
	output(" No wonder they export so much of their milk! Your [pc.tongue] gathers some off your [pc.lips] while Millie releases the second half of her avalanche of boob. Those creamy mounds bounce for far longer than you would have thought, drizzling more milk while the stained ruins of her denim outfit slide down to her ankles.");
	output("\n\n<i>“Mmm, that’s better.”</i> Millie squeezes the underside of her left breast, hosing out a much thicker spray. <i>“Are you ready for the good part?”</i> She puts her other hand across you, on the other side of the table. <i>“Why am I even asking? Of course you are.”</i> She stops tugging your tit long enough to brace herself on the edge of the table and vaults up, landing with her thick thighs squeezing against your [pc.legOrLegs]. <i>“It takes a good sucking to empty out all the [pc.milkNoun].”</i> Her plush-looking lips break into a dazzling grin. <i>“I love this part.”</i>");
	output("\n\nBending over, Millie leans down to one of your [pc.nipples]. ");
	output("Her immense bust smushes against you");
	if(pc.bRows() > 1)
	{
		
		if(pc.bRows() == 2) output("r second breast row");
		else output("r bottom row of breasts");
	}
	output(", bulging out at the sides as rigid, milk-seeping nipples lubricate your [pc.skinFurScales]. She gasps from pleasure, her mouth gaped and tongue lolling. Gathering her wits, the slutty cow-gal, lowers herself down, not bothering to stop vocalizing her pleasure until your teat is firmly embedded in her mouth. The sounds of pleasure cut off, replaced by audible, diligent sucks. Her hands aren’t idle either - one cups the boob she’s sucking, and the other resumes milking ");
	if(pc.totalBreasts() > 2) output("a spare tit");
	else output("the other tit");
	output(".");
	//Treated girls should probably cum their little brains out.
	if(pc.isTreated() && pc.isBimbo())
	{
		output("\n\nThe feelings are overwhelmingly pleasant. The contact of her skin on ");
		if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN) output("yours");
		else output("your [pc.skinFurScales]");
		output(" is electric, enhanced by a coating of warm milk that may as well be the finest massage oil for how good it feels. And her mouth... her lips make your areola feel like a clit getting some world-class cunnilingus, all while erupting squirt after squirt of [pc.milk] thanks to her rhythmic sucking. Even your neglected ");
		if(pc.totalNipples() > 2) output("[pc.nipples] are");
		else output("[pc.nipple] is");
		output(" squirting like ");
		if(pc.totalNipples() == 2) output("a firehose");
		else output("firehoses");
		output(", sympathetically gushing. You arch your back, pressing more firmly into Millie’s mouth. She releases the underside of your tit and wraps that arm around underneath your torso, lifting you up off the table, holding you there while she swallows every fresh burst of [pc.milkNoun].");
		output("\n\nYou moo, something Millie rewards with a longer drag on your tit. Encouraged by this, you low once more, loud enough that it can probably be heard outside the stall, but what do you care? Your titties are like two jiggly bundles of nerves, feeding lines of bubbly, lactic happiness right into your brain. The longer she sucks, the stronger that ecstasy becomes. Grabbing the cow-girl by the horns, you throw your head back and cum, losing yourself in the pleasure of giving your [pc.milk].");
		output("\n\nAt some point, you feel the flow stop, but Millie just switches to another [pc.nipple], subjecting you to a whole new wave of blissful milking. The knowledge that it’s sucked out by another person makes the experience that much more pleasant, her happy swallows music to your ears.");
		output("\n\nYou lose track of time, conscious only of dazed-sounding moos and the sensation of expressing more [pc.milk] than you knew you could hold.");
		processTime(35);
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	//Untreated girls should probably just cum once.
	else
	{
		output("\n\nOhhh, now that’s the stuff. With nothing else to do, you grab one of her horns and run your fingers through the long half of her hair, wishing she could feel as nice as you are. You almost feel like you’re taking advantage of the poor girl, getting to enjoy to the feeling of her mouth coaxing out your [pc.milk] while she gets nothing back in return... well, besides getting to slip and slide over your body on a tide of her own alabaster moisture.");
		output("\n\nYou groan and squirm beneath her. On some planets, you could go pay for a massage... maybe a milking with a clinical machine if you really wanted it. Here? You’re getting your [pc.breasts] sucked for free by a big-breasted cow-slut that seems to have a sixth sense for just what’ll make your bust drip.");
		//Cocks
		if(pc.hasCock())
		{
			output("\n\nAnd your tits aren’t the only things dripping. Your [pc.cocks] have been pinned between two warm, milky bodies all this time, subjected to flesh sliding against flesh until ");
			if(pc.cockTotal() > 1) output("they’re");
			else output("it’s");
			output(" practically weeping strands of pre-cum. ");
			if(pc.longestCockLength() >= 14) output("The best part is that you’re long enough that you’ve penetrated Millie’s cleavage by getting hard - no special effort needed to bury yourself into the cow’s pillowy softness. ");
			output("You couldn’t hold back if you wanted to. Just lying here enduring the suckles would be enough, but you have to deal with her body rocking back and forth when she changes position, dragging her slippery tummy across you, heedless of how close you are to cumming.");
			output("\n\nLooking up at you from around a mouthful of boob, Millie smiles, winking as if to let you know that’s all right to let go - to unload into ");
			if(pc.longestCockLength() < 14) output("the underside of");
			else output("her");
			output(" milky cow-tits. She even goes so far as to slide up and down as far as she can without losing out on your [pc.milkFlavor] treasure, grinding against your throbbing hardness knowingly.");

			output("\n\nGroaning, you tighten your grip on her horns and jerk your [pc.hips] upward, suddenly overcome with passion and pleasure, erupting into her sensuous bosom. Your [pc.cocks] ");
			if(pc.cockTotal() == 1) output("isn’t");
			else output("aren’t");
			output(" the only thing");
			if(pc.cockTotal() > 1) output("s");
			output(" going off either; your [pc.nipples] are gushing harder than ever. Millie’s cheeks bulge obscenely before she manages to gulp down her mouthful, her other hand suddenly drowning waves of [pc.milkColor]. Holding on tight, you ride out the orgasm, kept warm and wet by Millie’s attention");
			if(pc.cumQ() >= 500) output(", drenching the table");
			if(pc.cumQ() >= 4000) output(" and floor");
			output(". Your eyes drift closed, exhausted");
			if(pc.cumQ() >= 5000) output(" to the sound of the drain choking on the waves of [pc.cum] you’re dumping out");
			output(".");
		}
		//Vagina
		else if(pc.hasVagina())
		{
			output("\n\nAnd your tits aren’t the only things dripping. You’re wet enough to feel it pooling under your [pc.butt]. Your [pc.vaginas] ");
			if(pc.totalVaginas() > 1) output("are");
			else output("is");
			output(" hungry. If Millie wasn’t blocking your access, you’d probably be three fingers deep and trying to see how much friction your thumb could generate on");
			if(pc.hasClit()) output(" [pc.oneClit]");
			else output(" your inner walls");
			output(". It’s not fair that your nipples are the only ones getting any love! You wriggle and squirm until Millie gets tired of it and pins you down, surprisingly strong for a cow-girl.");
			output("\n\nShe breaks the seal on your [pc.nipple] to say, <i>“Just settle and try and enjoy it,”</i> before returning to her eager nuzzling of your chest. It’s torture and ecstasy all mixed together, unfilled desire rubbing elbows with lactic bliss. Your [pc.legOrLegs] tremble");
			if(pc.legCount == 1) output("s");
			output(", awash in at all, your muscles twitching just to award your [pc.vaginas] the barest measure of friction. Just as you begin to fear that you’ll go mad from it all, your body caves in to what its red-hot, lactic pleasure-buzzers are demanding, setting off a full body, titty-quaking boobgasm.");
			output("\n\nIt goes on for what feels like a solid minute, and afterwards you’re too exhausted to move, lying there while Millie gleefully finishes harvesting your [pc.milk].");
		}
		//Neither
		else
		{
			output("\n\nYou want more. And not just more pleasure on your [pc.nipples]. No, you want more everywhere! You’d let her slip a finger in your [pc.asshole] if she wanted, just to intensify that whole-body pleasure-glow you’re experiencing. Moaning excitedly, you feel your [pc.legOrLegs] trembling against the table, pinned by Millie’s thighs. Your [pc.chest] are gushing harder than ever, despite feeling almost entirely emptied. Held captive by your body’s enjoyment, you let the pleasure take you. Your eyes roll back in rapture, then unconsciousness.");
		}
		processTime(35);
		pc.orgasm();
	}
	clearMenu();
	addButton(0,"Next",millieSucksTitsVol2);
}

public function millieSucksTitsVol2():void
{
	clearOutput();
	showName("\nMILLIE");
	showBust("MILLIE");
	//Bimbo Next!
	if(pc.isBimbo())
	{
		output("You come to while Millie is wiping you off with a fluffy towel. She’s wearing her overalls and a shit-eating grin, her own breasts noticeably reduced in size. The scent of sweet cream hangs heavy in the air, and there’s a sticky spot at the bottom of your [pc.belly] where she was sitting.");
		output("\n\nMillie helps you up and over to your things, but not before coaxing you into a nice, wet goodbye kiss. You giggle to yourself; it tastes just like [pc.milkNoun]. Cow-girls give the best kisses!");
		//Temporary Treatment funtimes
		if(pc.hasStatusEffect("Temporary Treatment"))
		{
			output("\n\nYou almost miss her taking the headband off you, stunning you as your thoughts realign into their former patterns. Your jaw works as you try to make sense of the insane experience.");
			if(pc.breastRows[0].breastRating() < 3)
			{
				output(" And your breasts... wow.");
				if(pc.breastRows[0].breastRatingRaw < 1) output(" You still have them, and they’re plenty big.")
				else output(" They’re still bigger.");
				pc.breastRows[0].breastRatingRaw = 3;
				output(" You guess that part wasn’t as temporary as advertised.");
			}
			if(!pc.isLactating()) pc.boostLactation(4);
		}
	}
	//Merge -> Next
	else
	{
		output("You come to while Millie is wiping you off with a fluffy towel. She’s wearing her overalls and a shit-eating grin, her own breasts noticeably reduced in size. The scent of sweet cream hangs heavy in the air, and there’s a sticky spot at the bottom of your [pc.belly] where she was sitting.");
		if(pc.hasCock() && pc.cumQ() >= 1500) output(" A pile of [pc.cumNoun]-stained towels has accumulated in the corner.");
		output("\n\nMillie helps you up and over to your things, but not before giving you a goodbye kiss to remember her by. Well, they sure are friendly here. You gather your gear and step away before she tries to pull you into something even lewder. You’re not sure ");
		if(pc.isTreated()) output("you have time for another go-round, no matter how much fun.");
		else output("your body could handle that right now.");
	}

	flags["MILLIE_LAST_ACTION"] = "Milker";

	//Faux Treatment!
	if(pc.hasStatusEffect("Temporary Treatment"))
	{
		flags["MILLIE_LAST_ACTION"] = "Faux Treated";
		pc.removeStatusEffect("Temporary Treatment");
	}
	processTime(24);
	
	pc.milked(pc.milkFullness);
	pc.boostLactation(1);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//CUSTOM OFFBEATR: 1 Female Lactation, Milking Mishap IE: Milking Machine won't shut off and leads to Orgasm
//Enubata
public function soloMilkingUpgrade():void
{
	clearOutput();
	showName("\nMILKING!");
	//Bimbo
	if(pc.isBimbo()) 
	{
		output("<i>“Come ooon! I can be a boob-milk girl too!”</i> ");
		if(pc.hairLength >= 6) output("You twirl a lock of your hair a little brainlessly");
		else output("You put on your best pout");
		output(" and add, <i>“Pleeeeease?”</i>");
	}
	//Else
	else
	{
		output("<i>“JoyCo milkers are nothing like this, and I’d like to have some privacy while I do it");
		if(pc.isNice()) output(", if that’s not too much to ask");
		output(".”</i>");
	}
	//mergebuns
	output("\n\nMillie looks at you hesitantly, chewing her lower lip back and forth while she mulls it over. Her brow knots, but then she begins to idly rub at a barrel-sized breast, quietly cooing while her thoughtful expression fades. <i>“Yah... sure. Whatever. I needed a break anyway. Maybe Yancy’s free. Just make sure you don’t touch uhm... anything I wouldn’t touch. That thing has a lot of functions that you might not like... at first.”</i> Millie giggles, grabs her tablet, and saunters out the stall door, leaving you with one last tip: <i>“Be sure to enjoy yourself! A moaning cow is a milky cow!”</i>");
	output("\n\n");
	if(pc.isTreated()) output("What’s she take you for, an amateur? Of course you’re going to moan - probably scream too. What treated girl wouldn’t?");
	else if(pc.isBimbo()) output("That sounds super double-dooper fun! You can’t wait to get hooked up to the machine and give it a try. Maybe you’ll even get cum from it!");
	else if(pc.exhibitionism() >= 66) output("At first, the idea offends your sensibilities, but the more you think about moaning like some kind of wanton, lust-drunk cow for anyone to hear, the more the idea appeals to you. Anyone could hear you and come looking for the source of the sound, and they’d find you all naked and helplessly aroused! The idea sends delightful shivers down your spine.");
	else output("As if. Well, if it feels that good, maybe, but you have no intention of sounding quite as whorish as the rest of the girls in this barn.");
	output(" First thing’s first: ");
	if(!pc.isChestExposed()) output("you’ve got to free these [pc.milkNoun]-laden puppies. You wiggle out of your [pc.upperGarments] anxiously.");
	else output("you’ve got to stop being distracted by the lewdness surrounding you and activate the machine, but it’s so hard!");
	output(" The air here is warm and humid, almost moist, and it tickles so pleasantly across your [pc.nipples], filthy pheromones and an aura of hedonistic pleasure.");
	output("\n\nYou [pc.walk] up to the machine");
	if(pc.biggestTitSize() >= 6) output(", moving carefully so as not to accidentally bump any buttons with your burdensome breasts or jutting teats");
	output(", looking over the buttons, gauges and knobs uncertainly. Most of them aren’t even labeled. The circular gauge is definitely there to report the PSI of something, and the big green button with a cartoonish cow-face will obviously begin the milking cycle. You go ahead and press it, listening to the gentle whir of the motor revving up, but how do you control the intensity? How do you turn it off?");
	output("\n\nThen you see it: a button <i>way</i> off to the side with a picture of a giant-sized milk-jug and the word “auto-e” printed below it. Perfect! An automatic milking is just what you need. You go ahead and slap it down, then reach for the quietly humming cups. They’re already faintly sucking, just waiting for you to hold them against a breast and allow them to seal around your [pc.nipples]. Grinning, you hold one up to your left breast and let it take hold, gasping when it forms a perfect seal and tugs the [pc.nipple] out");
	if(pc.hasInvertedNipples()) output(", popping it out of hiding");
	output(". You waste no time in putting the other in position");
	if(pc.totalNipples() > 2) 
	{
		output(", but you’re just getting started. You have more nipples that need milking! You find reserve tubes in a drawer and hook them up one after another, surrounding every potential milk-spout in its own, individually suckling chamber");
		if(pc.totalNipples() >= 6) output(". Never mind that you look like an actual cow with so many tubes hanging off of you");
	}
	output(".");
	//Spurty lactation levels
	if(pc.canMilkSquirt())
	{
		output("\n\n[pc.Milk] gushes out before you can even finish hooking yourself up. The relief is palpable; all that pressure venting out from you is dizzyingly wonderful, and you stagger back to lie down on a padded bench, lest you collapse, gushing fluid.");
		output("\n\nThe soft whir emanating from the device pitches up to a straining hum, and the vacuum pressure around your [pc.nipples] doubles, almost painfully so. This isn’t the relaxing milking you expected! Instead of getting to relax while your frothing fluids are harvested, you’re arching your back and struggling not to cry out. The machine, true to its thoughtless nature, mercilessly draws the [pc.milkNoun] from your body as if your free-flowing squirting wasn’t enough. Noisily, it pulses, lewdly slurping to quench an inexhaustible, robotic thirst.");
		output("\n\nYou whimper. There is an undeniable erotic thrill to being treated so roughly, but the pain rhythmically coursing through your tender [pc.nipplesNoun] more freely than your [pc.milkNoun] keeps you from truly enjoying yourself. The best you can do is tough it out. At this rate, you’ll be drained dry in no time. The primary storage tank is already sloshing, mostly filled.");
		output("\n\nGritting your teeth, you close your eyes and wait, almost relieved when your [pc.milkNoun]-flow slows to a less-enthusiastic trickle. Surely the auto function will shut off soon.");
		output("\n\nBut it doesn’t.");
		output("\n\nYour [pc.chest] ache");
		if(pc.biggestTitSize() < 1) output("s");
		output(". Your [pc.nipples] feel puffy and raw, beyond fully engorged and stretched out into an obscene parody of themselves. You squirt weakly, then subside to a slow dribble. The milker’s cups begin to clear now that your effusive output can drain away, but they do not slow. They suck, noisily, relentlessly, hungry for more than you could ever give.");
	}
	//Reluctant lactation levels
	else
	{
		output("\n\n[pc.Milk] doesn’t gush on out immediately, but once the gentle, rhythmic vacuum pressure begins in earnest, your body willingly dispenses its nutritious bounty for the sophisticated device. You stagger back to lie back on the bench, intent on enjoying a gradual, languid draining of your boobs.");
		output("\n\nYou don’t get to. The gentle whir of the machine gradually pitches up to an angry hum, ratcheting up the suction lockstep with the tone. [pc.Milk] sprays out of you faster than you would think possible, an act both painful and pleasurable. Your [pc.nipples] look obscenely distended under the rapacious onslaught, and they puff up bigger moment by moment. It’s uncomfortable as hell, yet more than a little arousing. You flush at the knowledge of how violently this machine is taking advantage of you, whimpering from something between pleasure and pain.");
		output("\n\nIt doesn’t stay that way for long. How could it when the milker is pumping you harder than you’ve ever been in your life? Squirming uncomfortably, you groan and whine, feeling your flow slow to a trickle. Your [pc.nipples] are reddish and irritated, but the damned machine is still tugging on you, demanding something you can no longer give. The fucking ‘auto’ mode isn’t turning off! If anything, it’s sucking even harder!");
		if(pc.isTreated() && pc.isBimbo()) output(" Maybe other cow-girls might like this sort of thing, but it’s rough even for them.");
		else output(" You don’t understand why the cow-girls here would put up with something like this.");
	}
	
	//[Next]
	pc.changeLust(5);
	
	processTime(10);
	
	pc.milked(100);
	
	clearMenu();
	addButton(0,"Next",soloMilkerFunTimesRaep);
}

public function soloMilkerFunTimesRaep():void
{
	clearOutput();
	showName("\nMILKING.EXE");
	output("You’ve had enough of this. Whoever designed the automatic mode was clearly a sadist, and you don’t have to put up with it any longer. You’re not sure that you can. Knowing full well that yanking them off will probably hurt even worse, you reach down and grab hold of the cups, determined to end this hellish experience as soon as possible, no matter the cost.");
	output("\n\nThen you see a button flashing on the milker’s console. It is clearly stamped with the word <i>“assistance.”</i> Perhaps pushing it will be a better solution. Staggering up onto your [pc.legOrLegs], you stumble closer and smack it with your fist");
	if(pc.PQ() >= 95) output(" hard enough to dent the stall door");
	else if(pc.PQ() >= 75) output(" hard enough to rattle the stall door");
	output(".");

	output("\n\nIt doesn’t stop. Damnit! Instead, a port on the top of the machine opens up, and six glittering, metallic armatures slither out, lined with transparent cabling full of bubbling pink liquid. Two of them grip you by the shoulder and bear you back onto the bench. Another pair ");
	if(pc.legCount > 2) output("attempt to ");
	output("restrain your [pc.legOrLegs]");
	if(pc.legCount > 2 || pc.hasLegFlag(GLOBAL.FLAG_AMORPHOUS)) output(" with varying levels of success");
	output(". Fighting the panic threatening to tear its way out of your chest, you try to squirm free.");
	output("\n\nIt’s no use. The metallic tentacles’ grip is implacable, backed up by writhing, segmented steel. One of them appears in front of you, the cold graspers around the edge stretched wide, giving it the appearance of a menacing alien flower. A bizarre, pointed tip extends outward from the center, and before you can ascertain its true purpose, it puffs a cloud of pink mist over your face.");
	output("\n\nYou’re too surprised to hold in your breath, let alone a reflexive gasp of surprise. It smells just as pink as it looks, almost floral but with a medicinal aftertaste that keeps it from being too pleasant. You try to hold your breath, but as soon as one cloud clears, it puffs out another. The strange gas is already in your lungs anyway, and with no chance at escape, you’re going to have to breathe regardless. Giving in, you take in another breath of the stuff and make a real, genuine effort to ascertain (and resist) its effects. Your [pc.chest] still hurt");
	if(pc.biggestTitSize() < 1) output("s");
	output(". You aren’t getting dizzy or even euphoric.");
	output("\n\nPuzzlingly, you seem immune to the effects of the rogue milker’s gas and find yourself relaxing into the soft padding beneath you. It really is quite comfortable. If you weren’t being so roughly manhandled, you might even find the experience enjoyable. And that strange aroma! It isn’t even that bad. You don’t know why you thought it had any sort of aftertaste. It definitely just smells like some kind of flower... mixed with icecream. And rainbows!");
	output("\n\n<i>“Subject sedation has reached acceptable levels. Beginning automatic enhancement protocols,”</i> announces a disembodied voice.");
	output("\n\nSo that’s what ‘e’ at the end of ‘auto-e’ stood for! You didn’t tell the machine to give you an automatic milking - you told it to give you an automatic enhancement. That makes sense, you suppose. You do remember ");
	if(pc.isBimbo()) output("hearing that empty boobs are happy boobs");
	else output("reading something about how being completely drained of milk would stimulate your body to make even more");
	output(". Oh! The gas is a sedative. It must be a pretty good one to leave you this clear-headed, and it does explain why the constant, noisy attempts to suck more [pc.milk] from your [pc.chest] are bothering you less and less. Your [pc.nipples] may be hugely swollen, but the suction is starting to feel good, and the edges of the glass tubes feel disturbingly like a lover’s lips now that they’ve had a chance to warm up.");
	output("\n\nYou moan");
	if(pc.exhibitionism() < 66 && !pc.isBimbo()) output(", then blush");
	else output(" shamelessly, hoping someone can hear you enjoying yourself");
	output(". The sixth tentacle appears alongside its vape-dispensing brother, fitted with a small nozzle - and a darker, almost purplish, payload. You don’t bother to react when it thrusts into your [pc.lipsChaste]. It’s not like you can do anything about it, not now when you’re finally starting to enjoy yourself. Your [pc.nipples] actually feel sort of great. Sure, you’re aware of how magnificently sore they’ve become, but that feeling seems almost disconnected from your perception, like you’re looking at a readout on a holo-display.");
	output("\n\nAnd without pain bothering you, the pleasure seems twice as strong, like you’ve got all this extra space freed up in your brain to think about how amazing it feels to have your [pc.nipples] tugged.");
	if(pc.hasCock() && pc.hasVagina()) output(" It’s a real shame the milker didn’t come with attachments for your [pc.cocks] and [pc.vaginas]. You’re hard as hell and wet besides, and a little attention down south would go a long way.");
	else if(pc.hasVagina())
	{
		output(" It’s a real shame the milker didn’t come with a dildo arm. It would feel amazing to have something pumping at your [pc.vaginas] at the same time. You’d probably cum right away.");
	}
	else if(pc.hasCock()) output(" It’s a real shame the milker didn’t come with a cock-pump. You’d love to see just how fast you could cum from this kind of stimulation, even though you’ll probably cum eventually anyway.");
	if(pc.hasVagina() && pc.isSquirter()) output(" The padding is already soaked with your freely-drooling [pc.girlCum], every bit as slick and wet as you are.");
	output(" You wish your hands were free so that you could touch yourself and make yourself feel even better, but with your shoulders and upper arms pinned, you can’t do much but futilely stroke your [pc.hips].");

	output("\n\nThen something grape-flavored splashes onto your [pc.tongue], demanding you either swallow or choke. It’s a pretty easy choice to make; you swallow. Drinking it down isn’t so bad, but the moment you do, the nozzle in your mouth squirts more in even faster, forcing you to guzzle down more. This stuff is stronger than the cloying, floral perfume you’ve gotten to breathe in these fast few minutes for sure. It makes your head dizzy and your [pc.skin] tingle, especially on your [pc.nipplesNoun], which, you are pleased to note, are beading [pc.milkNoun] once more.");
	output("\n\nYour head is swimming. Your tits are buzzing and starting to squirt. Your [pc.hips] are rolling and bucking. The whole of your body feels like it’s being cradled by the softly padded bench you’ve been confined to, and you are perfectly relaxed as your [pc.chest] bulge and wobble, expanding, growing, filling up with fresh [pc.milkNoun] to feed the insatiable milker. Gouts of white [pc.milkColor] spray out before long, and you moan into the feeding tube occupying your mouth, wishing you could cry out all the louder. Rainbows explode behind your eyes, and you cum");
	if(pc.hasCock()) output(", launching [pc.cum] over the metallic tentacles your quivering body");
	if(pc.hasVagina() && !pc.isSquirter()) output(", leaking [pc.girlCum] everywhere");
	else if(pc.hasVagina()) output(", spraying [pc.girlCum] all over the tentacles and the machine");
	output(".");
	output("\n\nPulling out of your mouth, the orally-obsessed tentacle sprays more violet goo across your [pc.face], and departs, leaving you with the happy pink cloud and the sound of your continuously-productive tits to keep you company. The aftershocks of your orgasm fade into a slow-climbing pleasure, carrying you back to the peak whether you want it or not. Your obscenely bloated [pc.nipplesNoun] sing their lusty song, timed to the tempo of the milker’s rhythmic whir, straining and squirting orgasmically. They sit at the forefront of your mind, blasting you with pleasure, and you cum again.");
	output("\n\nAnd again.");
	output("\n\n[pc.MilkNoun] splashes to the floor.");
	output("\n\nAnd the spaces between the ecstasy disappear, leaving you in the white-hot haze of one endless, milkgasm.");
	
	var i:int = 0
	
	var ppSoloMilker:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppSoloMilker.hasCock()) ppSoloMilker.createCock();
	ppSoloMilker.hairType = GLOBAL.HAIR_TYPE_GOO;
	ppSoloMilker.hairColor = "violet";
	ppSoloMilker.cumType = GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO;
	ppSoloMilker.breastRows[0].breasts = 1;
	ppSoloMilker.breastRows[0].breastRatingRaw = 48;
	ppSoloMilker.milkType = GLOBAL.FLUID_TYPE_SPECIAL_CUMGOO;
	ppSoloMilker.milkMultiplier = 100;
	ppSoloMilker.milkFullness = 100;
	
	for(i = 0; i < 16; i++)
	{
		pc.loadInMouth(ppSoloMilker);
		if(rand(4) == 0) pc.milkInMouth(ppSoloMilker);
	}
	
	var lacBoosted:Boolean = false;
	if(pc.milkMultiplier < 100) 
	{
		pc.milkMultiplier = 100;
		lacBoosted = true;
	}
	
	for(i = 0; i< pc.breastRows.length; i++)
	{
		pc.breastRows[i].breastRatingRaw++;
		if(pc.bRating(i) < 1)
		{
			while(pc.bRating(i) < 1)
			{
				pc.breastRows[i].breastRatingRaw++;
			}
		}
	}
	pc.nippleLengthRatio += 0.50;
	if(pc.nippleLengthRatio < 3) pc.nippleLengthRatio += 0.50;
	if(pc.nippleLengthRatio < 3) pc.nippleLengthRatio += 0.50;
	pc.nippleWidthRatio += 0.25;
	
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	processTime(100);
	pc.orgasm();
	
	pc.milked(100);
	
	clearMenu();
	addButton(0,"Next",millieSoloMilkerMishapEpilogue,lacBoosted);
}

public function millieSoloMilkerMishapEpilogue(lacBoosted:Boolean):void
{
	clearOutput();
	showName("\nMILLIE");
	showBust("MILLIE");
	output("<b>Some time later...</b>");
	output("\nCold water splashes over your body, jerking you to full wakefulness. You sputter and sit up, but more drenches you, forcing you to hold your arms to block the flow while you blink your bleary eyes.");
	output("\n\nStopping the stream of water, Millie scowls at you and tosses away the hose. <i>“I knew I shouldn’t have left you alone with the machine! You used up all the special milk goo!”</i> Shaking her horned head, she trots over, and examines your chest, guilelessly stroking flesh that feels a bit more full than it should. <i>“It looks like it worked pretty well though. You’re lucky I found you instead of one of the bulls, or you’d be getting a hell of a bill.”</i>");
	output("\n\nYou look down in shock. <b>Your [pc.chest] are bigger, but not so noticeably as your [pc.nipples].</b> All the sucking did a number on you, but <b>you feel like you could go for another milking right now.</b> <i>“Wh-what did that do to me?”</i> you ask");
	if(!pc.isTreated()) output(", incredulous.");
	else output(", wondering if the bulls will like you more now that you can milk like a fountain.");
	
	pc.shower();
	
	output("\n\n<i>“Oh right, you don’t know anything about that stuff, do you? There’s supposed to be a whole pamphlet about it, but the other cow-girls never read them, so we stopped stocking them.”</i> Millie shrugs noncommittally and explains, <i>“I forget what we’re supposed to call it, but you can think of it as a bottomless milk potion.”</i> Squeezing your boobs, the busty cow grins. <i>“Aside from the obvious benefits, you’ll never run dry for long. The moment your tits go empty, your body is gonna start filling ‘em right back up. You’ll be a real great cow now.”</i>");
	//Not treated/cow
	if(!pc.isTreated()) output("\n\nYou bite back on your reply and nod, climbing up onto wobbly [pc.legOrLegs] and grabbing your things.");
	//Treated!
	else output("\n\nAwesome! You bounce up onto your wobbly [pc.legOrLegs] and give Millie a big hug. It was worth all the discomfort. Now everyone will love you! You grab your things with a smile on your face and a sloshing in your chest.");
	//Merge
	//Perk notification <i>“Mega Milk”</i> - always produce milk as if you were 40% full.
	output("\n\n(<b>Perk Gained: Mega Milk</b> - You will always be able to produce milk as if you were at least 40% full, even if your breasts are empty.)");
	pc.createPerk("Mega Milk",40,0,0,0,"Allows you to instantly produce a good amount of milk, even when empty.");
	if(lacBoosted) output(" <b>And if you weren’t lactating very hard before, you are now.</b>");
	flags["MEGA_MILKED"] = 1;
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}