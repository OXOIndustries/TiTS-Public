//Main info found in items -> Misc -> Treatment
/*
//"Treated" - Main, permanent status effect
v1 - boob size result
v2 - horn size result
v3 - lip size result
v4 - ball size result
Have a second status to store more shit.
//"The Treatment"
v1 - Gender settings.
0 - girl mode
1 - dude mode
2 - herm/neuter girlmode with male dick boosts.
3 - herm/neuter doublemode - all male and female procs.
4 - herm/neuter amazon - male perks + boob/lactation boosts.
5 - herm girlmode + double dick/cum boosts.
6 - herm girlmode + dick shrinking to almost nothing.
v2 special variants
v3 hour counter
//Special variants - girls with bigger horns (size 5)!
*/



public function treatmentHourProcs():void
{
	pc.addStatusValue("The Treatment",3,1);
	var treatedHours:int = pc.statusEffectv3("The Treatment");
	var x:int = 0;
	//Female Effects
	if(pc.statusEffectv1("The Treatment") == 0)
	{
		//Over Time Intelligence + Perks
		//Intelligence/Willpower Reductions to 25 statquotient every 2 hours for 2 days. (time remaining % 60 == 0) for 48 hours. Played even if stats are done dropping.
		if(treatedHours <= 48 && treatedHours % 2 == 0)
		{
			if(pc.hasPerk("Weak Mind"))
			{
				if(pc.IQ() > 25) pc.intelligence(-.5);
				if(pc.WQ() > 25) pc.willpower(-.5);
			}
			else
			{
				if(pc.IQ() > 25) pc.intelligence(-1);
				if(pc.WQ() > 25) pc.willpower(-1);
			}
			pc.libido(1);
		}
		//1
		if(treatedHours == 2)
		{
			eventBuffer += "\n\nYou catch yourself daydreaming about sunbathing at one of the fancy resorts Dad sometimes let you accompany him to. You cast it aside with a wistful shake of your head. Those were better times.";
		}
		//2
		else if(treatedHours == 4)
		{
			eventBuffer += "\n\nYou feel pretty good actually - nothing exceptional, just a general wellness. You stretch and smile. It's turning out to be a pretty good day!";
		}
		//3
		else if(treatedHours == 6)
		{
			eventBuffer += "\n\nFeeling a little hungry, you reach into your equipment and grab one of the cheap ration bars that came with your first ship. You're staring at an empty wrapper and burping before you know it. Where did the time go?";
		}
		//4
		else if(treatedHours == 8)
		{
			eventBuffer += "\n\nIt's been over eight hours since you took the treatment. Shouldn't it have done something by now?";
			if(pc.hasVagina())
			{
				if(!pc.isCrotchGarbed()) eventBuffer += " Glancing down, you look over your [pc.vaginas].";
				else eventBuffer += " Peeling open your [pc.underGarment], you take a look at your [pc.vaginas].";
				if(pc.totalVaginas() == 1) eventBuffer += " It doesn't";
				else eventBuffer += " They don't";
				eventBuffer += " look any different. Would touching yourself feel any better than before? Surely, it wouldn't hurt to test. For science.";
			}
			//Nopuss:
			else eventBuffer += " Glancing down, you find yourself wishing you had a pussy, just so you could watch the Treatment make it all sexy and wet.";
			//+5 lust
			pc.lust(5);
			pc.libido(1);
			//Libido +1
		}
		//5
		else if(treatedHours == 10)
		{
			eventBuffer += "\n\nYou wonder... what would Oggy's cock look like if it were straining his pants at the sight of you? Would it flush dark with blood and stretch the fabric taut? Would a dark smear appear at the tip, staining the fabric? You shake away the unusually strong fantasy and resolve to sneak glances below the waists of the males you meet. You might as well look at something, right?";
			//+7 lust
			pc.lust(7);
		}
		//6
		else if(treatedHours == 12)
		{
			eventBuffer += "\n\nWhile you have a moment to be introspective, you take stock of yourself (and munch on another ration bar). You don't feel any dumber yet, but focusing does seem to be a little trickier. There's so many things and people that you could be looking at. It's just such a nice day that focusing on boring stuff would be such a waste. Besides, the itch between your thighs is getting seriously intense.";
			if(!pc.hasVagina()) eventBuffer += " If only you had a proper pussy there.";
			//+5 lust
			pc.lust(5);
		}
		//7
		else if(treatedHours == 14)
		{
			eventBuffer += "\n\nYou spend a few moments running your hands over your [pc.chest] and down your [pc.belly], attempting to ignore the way your [pc.nipples] harden in an attempt to catch under your fingers. It feels REALLY good.";
			if(pc.hasHair() && pc.hairLength >= 10) eventBuffer += " Even the feel of your [pc.hair] on your shoulders is amazing.";
			if(pc.hasHair()) 
			{
				eventBuffer += " You run your hands through ";
				if(pc.hairLength >= 10) eventBuffer += "it";
				else eventBuffer += "your hair";
				eventBuffer += " and moan in rapture. It's like a minute of massaging compressed into a moment.";
			}
			else eventBuffer += " You run your hands over your head and moan in rapture. It's like a minute of petting compressed into a moment.";
			eventBuffer += " You could get used to this.";
			//+5 lust
			pc.lust(5);
			//Libido +1
			pc.libido(1);
		}
		//8
		else if(treatedHours == 16)
		{
			eventBuffer += "\n\nThis is turning out pretty nice. You run your hands across your chest, wondering how big you'll get before it has its way with you.";
			if(pc.biggestTitSize() >= 20) 
			{
				eventBuffer += " Can it really make you any bigger? A set like yours is already massive. Maybe it'll just make you ";
				if(pc.canLactate()) eventBuffer+= "extra ";
				eventBuffer += "milky.";
			}
			else eventBuffer += " Will you have a hard time walking with them?";
			eventBuffer += " More importantly, will the boys like them? You sigh dreamily.";
			//+2 lust.
			pc.lust(2);
			//Libido +1
			pc.libido(1);
		}
		//9
		else if(treatedHours == 18)
		{
			eventBuffer += "\n\nAfter blinking, the colors around you seem to almost pop into greater vibrancy. You gasp and marvel at them. How could such a change be possible? You look around yourself in awe, reveling in the odd, ocular sensation. What were you thinking about again?";
		}
		//10
		else if(treatedHours == 20)
		{
			eventBuffer += "\n\nYou eat another ration bar and burp. Just how many will you eat before the Treatment works its way out of your system?";
		}
		//11
		else if(treatedHours == 22)
		{
			if(pc.hasHair())
			{
				eventBuffer += "\n\nUgh! Your [pc.hair] is all wrong! Using the codex as a mirror, you spend a few minutes arranging it for maximum effect. It frames your face just so, and you purse your [pc.lips] invitingly. Yeah, that's better.";
			}
			//No Hair
			else eventBuffer += "\n\nUgh! You don't have any hair to accessorize with. Still, you could do something. You pull out your codex to use as a mirror and look over yourself. Maybe some cute earrings and some lip gloss would look on you. Pursed, inviting lips would complete the look.";
			//Libido +1
			pc.libido(1);
		}
		//12
		else if(treatedHours == 24)
		{
			eventBuffer += "\n\nYou catch one of your hands rubbing your [pc.chest] out of the blue. You probably shouldn't be walking around idly groping yourself, but it feels really good, you know? Using your other hand, you squeeze from both sides at once. A ragged moan slips from your lips, and you release yourself, contented for now. You'll need to spend some time with the girls later.";
			//+7 lust.
			pc.lust(7);
			//Libido +2
			pc.libido(2);
		}
		//13 - Pussies only
		else if(treatedHours == 26)
		{
			eventBuffer += "\n\nYou ";
			if(pc.legCount != 1) eventBuffer += "rub your thighs together";
			else eventBuffer += "wiggle uncomfortably";
			eventBuffer += ". There's this growing feeling of emptiness ";
			if(pc.legCount != 1) eventBuffer += "between them";
			else eventBuffer += "inside you";
			eventBuffer +=", like you're as hollow as one of those chocolate bunnies they eat on Terra in spring. Only... a nice, hard dick would really hit the spot - a really veiny, thick one. It would complete you.";
			if(pc.hasVagina()) eventBuffer += " Dribbles of arousal leak down your [pc.legOrLegs] as you mull it over.";
			eventBuffer += " Yeah... maybe a fuck break is in order.";
			//+8 lust or lust to 33, whichever is higher.
			if(pc.lust() + 8 < 33) pc.lust(33-pc.lust());
			else pc.lust(8);
			//Libido +2
			pc.libido(1);
		}
		//14
		else if(treatedHours == 28)
		{
			eventBuffer += "\n\nYou're definitely being changed by the Treatment - you're sure of it. Your surroundings are no longer simple objects and materials. They're a whole new set of sexual backdrops and tools. A chair could be used for oral, or a creative place to mount a hung stud. A spanner could be used as part of a slutty mechanic's costume, matched by crotchless coveralls. You put your hands on your waist and smile, arching your back and cocking your hip out to the side at the same time. The motion is automatic. What some might view as getting dumber, you're discovering is getting sexier.";
			eventBuffer += "\n\nWhy didn't you take the Treatment before? This is awesome!";
			//+9 lust
			pc.lust(9);
			//Gain Sexy Thinking - gives sexiness bonus equal to (100-IQ-25)/20 + (100-WQ-25)/20
			eventBuffer += "\n\n(<b>Perk Gained: Sexy Thinking</b> - Increases tease damage inversely to how high willpower and intelligence are.)";
	 		pc.createPerk("Sexy Thinking",0,0,0,0,"Boosts tease damage more the dumber and less willful you are.");
			//Libido to 30 or +5
			if(pc.libido() + 5 < 30) pc.libido(30-pc.libido());
			else pc.libido(3);
		}
		//15
		else if(treatedHours == 30)
		{
			eventBuffer += "\n\nThis time, when you find your hands on your [pc.chest], you let them play. You aren't masturbating, per-se, just letting your fingers play a little. Hot jolts of ecstasy emanate from your [pc.nipples], and that's just fine. By the time something else distracts you, your face is as flush as your teats are hard.";
			//lust +7
			pc.lust(7);
			//Libido to 35 or +5
			if(pc.libido() + 5 < 35) pc.libido(35-pc.libido());
			else pc.libido(4);
		}
		//16
		else if(treatedHours == 32)
		{
			eventBuffer += "\n\nYou're definitely not getting dumber. You're sure of it now. It's just that there's so many things to pay attention to, and focusing on one thing for longer than a few moments is sooo boring. You can still do things like math. Eleven times eleven is still 121, but what's the point? You could probably get a boy to do it for you, if you rubbed him the right way.";
		}
		//17
		else if(treatedHours == 34)
		{
			eventBuffer += "\n\nAside from feeling like a million bucks, you're sure that the Treatment is feeding you information. Not boring stuff like formulae, but sexy, useful stuff - like your head is filling up with technical specifications for every kind of reproductive organ and how best to make it pulse with pleasure. You're pretty confident that you could figure out the right way to wiggle to tease anyone or anything. There's this way you can wiggle your butt... well, ausar are cute, right?";
			//Gain Fuck Sense - libido for tease eval
			eventBuffer += "\n\n(<b>Perk Gained: Fuck Sense</b> - The Sense ability now relies on your libido rather than intelligence.)";
			pc.createPerk("Fuck Sense",15,0,0,0,"Allows your sense ability to base success off your libido instead of intelligence.");
			//Libido to 40 or +5
			pc.libido(4);
			pc.lust(5);
		}
		//18
		else if(treatedHours == 36)
		{
			eventBuffer += "\n\nYou rub your nipple and smile. With how good this feels, you should be whimpering on the floor in a puddle of your own ";
			if(pc.hasVagina()) eventBuffer += "[pc.girlCum]";
			else if(pc.hasCock()) eventBuffer += "[pc.cum]";
			else if(pc.isLactating()) eventBuffer += "[pc.milk]";
			else eventBuffer += "drool";
			eventBuffer += ", but... but you're not. You could probably take yourself to whole new heights of pleasure. Suddenly, regular orgasms seem like chopped liver, and you should be dining on caviar.";
			//Inhuman Desire +20 max lust.
			if(!pc.hasPerk("Inhuman Desire"))
			{
				eventBuffer += "\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 20.)";
				pc.createPerk("Inhuman Desire",20,0,0,0,"Increases maximum lust by 20.");
			}
			else
			{
				eventBuffer += "\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)";
				pc.addPerkValue("Inhuman Desire",1,20);
				pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			}
			//Libido to 50 or +5
			pc.libido(4);
			pc.lust(5);
		}
		//19
		else if(treatedHours == 38)
		{
			eventBuffer += "\n\nYou giggle, ";
			if(pc.hasHair() && pc.hairLength >= 4) eventBuffer += "twirling your [pc.hair]";
			else
			{
				eventBuffer += " and reach to twirl your hair before remembering you ";
				if(pc.hasHair()) eventBuffer += "don't have enough";
				else eventBuffer += "don't have any";
			}
			eventBuffer += ". Every laugh is accompanied by little bubbles of happiness in your head. You smile broadly. The good feelings are so contagious; you just have to share them!";
		}
		//20
		else if(treatedHours == 40)
		{
			eventBuffer += "\n\nYou look down at the Codex to check the time but stop yourself with a frown. Why did you set such an ugly background on it? It's all boring - not even something fun, like pink. You spend a few minutes browsing the extranet for a better one, eventually settling on something bright to match how cheery you're feeling.";
		}
		//21
		else if(treatedHours == 42)
		{
			eventBuffer += "\n\nYou're taken by a sudden fantasy - sitting at your SteeleTech office, panties around your ankles. Your latest acquisition is kneeling between your thighs, getting his reward for selling his company at such a low price. One of your guards is sprawled out on your desk, filling your mouth with his length while you jack off his cohorts; it pays to keep one's security happy after all.";
			//+11 lust
			pc.lust(11);
			//Libido to 60 or +5
			pc.libido(4);
		}
		//22
		else if(treatedHours == 44)
		{
			eventBuffer += "\n\nTalking isn't quite as easy as it used to be. There's so many different words and concepts and ways to arrange them that by the time you get halfway through a sentence you've forgotten what you were trying to talk about. It's way easier to just start talking with whatever words come to mind. Yeah, that'll work!";
			//Ditz Speech
			eventBuffer += "\n\n(<b>Gained Perk: Ditz Speech</b> - You will now sound like a total bimbo in scenes that support it.)";
			pc.createPerk("Ditz Speech",0,0,0,0,"Alters dialogue in certain scenes.");
		}
		//23
		else if(treatedHours == 46)
		{
			eventBuffer += "\n\nA welcome flush rolls across your [pc.skin] as you consider your body. Your nerve endings seem alight with potential pleasure, just waiting to be touched and set off. Every part of your body begs for your attention and hands to tend to it. You idly rub your arms, [pc.hips], and [pc.legOrLegs] before letting go, tingling hotly. It's all you can do to keep from touching yourself, but at the same time, you feel so good! Your overheated body can handle so much pleasure; it's amazing! You've got to take your enhanced form for a spin and try some sex, just to see how incredible your orgasms will be. Maybe a few times in a row...";
			//+5 lust
			pc.lust(5);
			//Inhuman Desire upgrade to +40.
			eventBuffer += "\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)";
			pc.addPerkValue("Inhuman Desire",1,20);
			pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			//Libido to 75 or +5
			pc.libido(4);
		}
		//24
		else if(treatedHours == 48)
		{
			eventBuffer += "\n\nIs the Treatment done messing with your head yet? It's gotta be, you figure. You're having way more fun and thinking about cocks and stuff. Willpower is way down though. And book smarts? They're kinda gross. All the stuff you read is still there, but it's way easier not to think about. Besides, if you ever need to learn something you can just get a guy to explain it to you while you suck his cock!";
			//Weak Mind - Intelligence and Will losses doubled.
			eventBuffer += "\n\n(<b>Gained Perk: Weak Mind</b> - All intelligence and willpower losses are doubled.)";
			pc.createPerk("Weak Mind",0,0,0,0,"Intelligence and willpower losses doubled.");
		}
		//==========================
		//MIND STUFF OVER. ON
		//TOOO BOOOOOBS
		//========================
		//Tits 
		//to predetermined max. Many small changes.
		if(treatedHours > 48 && pc.breastRows[0].breastRating() < pc.statusEffectv1("Treated") && treatedHours % 3 == 0)
		{
			//Flat chest -> .5 cup
			if(pc.breastRows[0].breastRatingRaw < .5)
			{
				eventBuffer += "\n\nYour chest feels strange. It's all puffy, and your [pc.nipples] are a little swollen. Weird.";
				pc.breastRows[0].breastRatingRaw += .5;
			}
			//.5 cup to A cup
			else if(pc.breastRows[0].breastRatingRaw < .5)
			{
				//clothed
				if(pc.isChestGarbed())
				{
					eventBuffer += "\n\nYou're noticing more and more that there's a little something extra in your [pc.upperGarment]. It's moved your center of gravity just far enough forward to make you feel a little awkward, and it makes your [pc.nipples] rub oh so noticeably against your gear. You pull your top open for a better look and gasp. <b>You've grown boobs.</b> They're still [pc.breastCupSize]s, really - barely tits at all. Of course they won't stay that way for long. How big are your new boobs gonna get?";
				}
				//Nakers
				else eventBuffer += "\n\nYou've been feeling clumsy all day, like something just isn't right with your body. It isn't until you glance down that the source of your awkwardness reveals itself - tits. <b>You've got pert little A-cups hanging off your chest!</b> They look adorable - just enough to give tiny jiggles when you jump. Best of all, your [pc.nipples] seem to have grown in both size and sensitivity along with them.";
				if(pc.bRows() > 1)
				{
					eventBuffer += " The extra row";
					if(pc.bRows() > 2) eventBuffer += "s below remain";
					eventBuffer += " below remains";
					eventBuffer += " unchanged. It looks like your top set are the only ones that are gonna get big and milky, but that'll be fine.";
				}
				pc.breastRows[0].breastRatingRaw = 1;
			}
			//A -> B
			else if(pc.breastRows[0].breastRatingRaw < 2)
			{
				eventBuffer += "\n\nYou idly squeeze your chest; just to check, you assure yourself. It seems a wise thing to do after taking the treatment. After all, how else are you supposed to chart your progress from teensy teats to titanic, milk-seeping tits? You cup and caress them like favored pets. Yup, they're definitely bigger. You squeeze again - definitely B-cups. They feel nice and warm in your hands.";
				pc.breastRows[0].breastRatingRaw++
			}
			//B-C
			else if(pc.breastRows[0].breastRatingRaw < 3)
			{
				eventBuffer += "\n\nWhenever you move, your [pc.chest] move along with you. That's no surprise. What does come as a shock is just how much they move - jiggling and shaking about whenever you twist or hop.";
				if(pc.isChestGarbed()) eventBuffer += " You pop open your top for a look.";
				else eventBuffer += " You look down.";
				eventBuffer += " Damn! When did you get tits like that? They're proper C-cups now - big enough to give your hands something perfectly cushy to squeeze on, which they're doing right now. It feels great, really. You sigh and let your bigger boobs go, looking at them one last time. Yeah, you're getting pretty sexy.";
				//+1 lust
				pc.lust(1);
				pc.breastRows[0].breastRatingRaw++
			}
			//C-D
			else if(pc.breastRows[0].breastRatingRaw < 4)
			{
				eventBuffer += "\n\nYou reach up to adjust your [pc.chest], a motion you find yourself doing more and more lately. There's nothing wrong with making sure your girls are sitting right. To your delight, your pleasing handfuls are... well, a little more hand-filling than before. You playfully squeeze and fondle them. There's not enough for your fingers to really sink into... yet. But you're on the Treatment now. Big, shuddering udders come with the package. You bounce yourself once more for good measure, imagining how you're going to end up, before letting go, a distant smile on your face.";
				pc.breastRows[0].breastRatingRaw++
				//+5 lust
				pc.lust(5);
			}
			//D->DD
			else if(pc.breastRows[0].breastRatingRaw < 5)
			{
				eventBuffer += "\n\nYour [pc.chest] feel so nice and warm";
				if(pc.isChestGarbed()) eventBuffer += " against your [pc.upperGarment]";
				eventBuffer += " that you just have to give it a friendly squeeze. Your index fingers settle on your [pc.nipples] while your palms attempt to cradle the burgeoning titflesh. It just doesn't work as well as it should; your boobs are bigger and squishier than the last time you held them. You've gotta be at least a DD-cup now. You bounce them in your palms, watching with a goofy smile. Definitely DD's.";
				pc.breastRows[0].breastRatingRaw++
				//+2 lust
				pc.lust(2);
			}
			//DD->big DD
			else if(pc.breastRows[0].breastRatingRaw < 6)
			{
				eventBuffer += "\n\nIt's one thing to consider the idea of getting bigger breasts from a powerful transformative cocktail. It's quite another to feel them pulling on you as they get heavier and heavier. You hold your hands up underneath them, weighing them. They're so warm and squishy that you can't help but give them a few playful bounces. Why, you're big enough that you're going to have DD-sized bras straining to keep up. You pinch a nipple gleefully. Soon you might even be an E!";
				pc.breastRows[0].breastRatingRaw++
				//+5 lust.
				pc.lust(5);
			}
			//big DD -> E
			else if(pc.breastRows[0].breastRatingRaw < 7)
			{
				eventBuffer += "\n\nYou give a squeal of surprise when you realize how big your boobies are getting. They're way more bouncy and squishy than before. If you got measured for a cheap bra, you'd definitely be an E-cup, but you don't think you need one.";
				if(pc.isChestGarbed()) eventBuffer += " Even with your [pc.upperGarments] peeled down,";
				else eventBuffer += " Even as naked as you are,";
				eventBuffer += " they sit high and proud, as if cradled by an imaginary corset. You play with them, bouncing them around. They aren't too firm or too soft. In short, they're perfect for a grope.";
				pc.breastRows[0].breastRatingRaw++
				//+2 lust
				pc.lust(2);
			}
			//E -> big E
			else if(pc.breastRows[0].breastRatingRaw < 8)
			{
				eventBuffer += "\n\nYou let your hand play across your [pc.nipple] during an idle moment, just to check if like, your sensitivity is getting crazy or anything. It feels so good, but more startling is how there seems to be a little extra behind the pleasantly pulsing pleasure-bud. Your tits were already nice and big.... You squeeze them for good measure... so nice and big. They're bigger now! The thought is slow coming while you grope yourself, but it comes all the same. You're on the upper end of an E-cup now. If they keep growing, you're going to have a very hard time finding your " + pc.feet() + ", but that'll be fine.";
				eventBuffer += "\n\nYou fondle your expanded chest. Everything's gonna be fine.";
				pc.breastRows[0].breastRatingRaw++
				pc.lust(2);
			}
			//big E -> EE
			else if(pc.breastRows[0].breastRatingRaw < 9)
			{
				eventBuffer += "\n\nYou look down, at first surprised and then pleased to see a little bit less of the ground than before. Your titties are still growing!";
				if(pc.isCrotchGarbed()) eventBuffer += " You yank down your [pc.upperGarments] in a rush to examine them.";
				eventBuffer += " They give so perfectly under your fingertips that you just <i>have</i> to really squeeze them, groping them like just like an overeager guy. You knead them, watching yourself do so with a lazy smile. Mmm, already an EE-cup from the Treatment, and you could still get even bigger. The idea of finding someone to give you a chest massage while you finish growing comes upon you out of nowhere, and you've gotta admit - it isn't a bad one.";
				pc.breastRows[0].breastRatingRaw++
				pc.lust(3);
			}
			//EE -> big EE
			else if(pc.breastRows[0].breastRatingRaw < 10)
			{
				eventBuffer += "\n\nYour [pc.chest] sway and bounce with every movement. There's no stopping that now, though. They've grown to the upper end of the EE-cup range, and you couldn't stop the weighty orbs from banging together in such an eye-catching way if you wanted to. Even if you wrapped them, you'd feel them shifting and rubbing against the inside of the fabric, dragging enlarged and sensitized nipples back and forth. You rub one and wonder if you should go jogging....";
				pc.breastRows[0].breastRatingRaw++
				pc.lust(4);
			}
			//big EE -> F
			else if(pc.breastRows[0].breastRatingRaw < 11)
			{
				eventBuffer += "\n\nLooking down, you smile. Your " + pc.feet() + " are totally gone from view.";
				if(pc.hasCock()) 
				{
					eventBuffer += " Heck, if your " + pc.cocksDescript() + " ";
					if(pc.cockTotal() == 1) eventBuffer += "was";
					else eventBuffer += "were";
					eventBuffer += " smaller, you wouldn't see ";
					if(pc.cockTotal() == 1) eventBuffer += "it";
					else eventBuffer += "them";
					eventBuffer += " either.";
				}
				eventBuffer += " The swelling of your bustline is truly a sight to behold. Besides, you can still see them if you bend forward a little bit, and you don't need to watch your " + pc.feet() + " or anything - not when you've got an ocean of pillowy flesh to look at. You've got big, sexy F-cups now.";
				pc.breastRows[0].breastRatingRaw++
				pc.lust(2);
			}
			//F -> big F
			else if(pc.breastRows[0].breastRatingRaw < 12)
			{
				eventBuffer += "\n\nYou start to adjust the girls again. They're easy to pose just right for the maximum amount of eye-catching wobble, but sometimes you've just gotta have an excuse to heft and weigh them. There's nothing wrong with being comfortable with your own body or how soft and squishy and warm and wet your jugs are getting. You sigh, rubbing fingers around your enhanced areolae as you squeeze your breasts. They didn't quit growing yet. You're sure of it. Tits like these barely fit into an F-cup. You briefly consider kissing them.";
				//+5 lust
				pc.lust(5);
				pc.breastRows[0].breastRatingRaw++
			}
			//big F -> FF
			else if(pc.breastRows[0].breastRatingRaw < 13)
			{
				eventBuffer += "\n\nYou stumble, setting off a small earthquake in your breasts. Giggling, you mentally categorize it as a class five boobquake and grab hold for stability, stilling your boobs with a supportive grope. There! You knead them a few times, weighing their mass. It feels plenty good, and, you figure, you've got a pretty head-turning rack now. An F-cup bra wouldn't fit you any more. Boobs like yours are a job for a double F... or a big, thick cock. These would be great for a titfuck, especially with how big and sensitive your nipples have gotten. They're like built-in handholds!";
				if(pc.bRows() > 1) eventBuffer += "\n\nYou run one hand across your neglected lower nipples. Maybe someday you can convince someone to make a treatment for " + pc.mf("boys","girls") + " with more than one meager row of tits.";
				//+3 lust
				pc.lust(3);
				pc.breastRows[0].breastRatingRaw++
			}
			//FF -> big FF
			else if(pc.breastRows[0].breastRatingRaw < 14)
			{
				eventBuffer += "\n\nEvery movement you make is accompanied by a matching bounce and jiggle. Your breasts are the kind that stay in almost constant motion when you move, drawing the eye of every sapient creature in sight. The thought of all those eyes on your [pc.chest] has them feeling fuzzy with heat and your [pc.nipples] growing hard. They're bigger too, which is great, you figure. They'll be even more eye-catching, and they can hold more [pc.milkNoun]";
				if(pc.canLactate()) eventBuffer += ", once you start lactating";
				eventBuffer += "!";
				if(pc.bRows() > 1)
				{
					eventBuffer += "\n\nIt's a shame that only your top row is getting so big and sexy, but at least your other [pc.nipples] are getting sensitive to match their big sisters up top.";
				}
				pc.lust(6);
				pc.breastRows[0].breastRatingRaw++
			}
			//big FF -> G
			else if(pc.breastRows[0].breastRatingRaw < 15)
			{
				eventBuffer += "\n\nYou run your hands across the curves of your swelling chest, admiring the feel of your [pc.skinFurScales] under your fingertips. You've gotten bigger again for sure. Now that you've swollen so large, each increase is packing more and more sensitive flesh onto your body, dragging your center of gravity kicking and screaming high and forward. You've got to shift your posture to handle G-cups like these, arching your back to keep them from toppling you forward, but that's fine, you figure. Doing so displays them that much more effectively.";
				//+2 lust
				pc.lust(2);
				pc.breastRows[0].breastRatingRaw++
			}
			//G -> big G
			else if(pc.breastRows[0].breastRatingRaw < 16)
			{
				eventBuffer += "\n\nYou look down, pleased to note that another inch of ground has disappeared from view, blocked by the sprawling spheres that adorn your chest like a ship's prow. Your boobs are even bigger than before, and so much more noticeable for the boys and girls (at least the ones that are into that sort of thing). You rub one, shivering in delight at the fizzing sparks of tactile pleasure. It'd feel so good to have a pair of lips sealed around a leaking nipple... and a big fat cock in between them. Big G-cups like yours deserve all the attention they can get.";
				//+5 lust.
				pc.lust(5);
				pc.breastRows[0].breastRatingRaw++
			}
			//big G -> GG
			else if(pc.breastRows[0].breastRatingRaw < 17)
			{
				eventBuffer += "\n\nA warm, tingly feeling spreads through your chest as your breasts expand";
				if(pc.isChestGarbed()) eventBuffer += ", straining against your [pc.upperGarment] as they go";
				else eventBuffer += ", shifting slightly as they go";
				eventBuffer += ". Your hands fly to them of their own accord, wrapping fingers around big, sensitive nipples and pressing palms into expanding undersides. This must be what it feels like to be in heaven: constant, sensitive pleasure, as your body becomes more and more perfect in every way. You look at them - the GG-cup behemoths stacked on top of you - and giggle. The Treatment isn't turning you into a slut, just making you hotter, sexier. You don't have to wrap these pillows around a dick, no matter how amazing it would feel.";
				if(pc.bRows() > 1) eventBuffer += "\n\nYou idly caress a lower nipple. It's just as sensitive as the ones up top, but unlucky enough not to get the sexy swelling your top rack is.";
				//+7 lust
				pc.lust(7);
				pc.breastRows[0].breastRatingRaw++
			}
			//GG -> big GG
			else if(pc.breastRows[0].breastRatingRaw < 18)
			{
				eventBuffer += "\n\nA sensation of sudden, sensitive firmness is the only warning you get before your boobs swell. Not that you needed the warning of course - the Codex gave you one of those a while back - but why would you care? Bigger tits are like better orgasms. Why wouldn't you want them? You rub your expanded assets, trying to gauge their new size for yourself, though it might look like you're just feeling yourself up to a passerby. You've got big GG's for sure. If you're lucky, you'll hit H-cups before this is over!";
				//+3 lust
				pc.lust(3);
				pc.breastRows[0].breastRatingRaw++
			}
			//big GG -> H
			else if(pc.breastRows[0].breastRatingRaw < 19)
			{
				eventBuffer += "\n\nYour hands are running slowly across your expanding chest in a kind of slow dance, sending little whispers of pink-hued pleasure into your brain. It's enough to keep a happy, ditzy smile on your face and your mind placid and calm. A simple tweak of a [pc.nipple] is enough to make your [pc.legOrLegs] wobble, and the idea of someone else doing the tweaking ";
				if(pc.hasVagina()) eventBuffer += "makes you positively drippy";
				else eventBuffer += "has you whimpering";
				eventBuffer += ". Best of all, you're slowly coming to realize that you've grown again. You finally have H-cups!";
				if(pc.bRows() > 1) eventBuffer += "\n\nIf only your other boobs got to grow too. Maybe you could put some boobswell pads on them?";
				//Lust+7
				pc.lust(7);
				pc.breastRows[0].breastRatingRaw++
			}
			//H -> big H
			else if(pc.breastRows[0].breastRatingRaw < 20)
			{
				eventBuffer += "\n\nYou keep checking your [pc.chest] for signs of growth. It's hard not to on the Treatment, knowing that at any moment you could cross the threshold to a whole new cup size and a whole new world of bigger, more sensitive boobies. This time, you're pretty sure that your fingers are sinking a little deeper into your assets. There's a little bit more weight in your palms. You're on the upper edge of an H-cup bra, and you wonder if the heifers on New Texas wear H-cups. It would be terrifically appropriate, you decide. There's nothing wrong with being called a cow when you're mostly boob.";
				pc.breastRows[0].breastRatingRaw++
			}
			//big H -> HH
			else if(pc.breastRows[0].breastRatingRaw < 21)
			{
				eventBuffer += "\n\nYou glance down, pleased to note that your view of the ground is even more obstructed than before. You don't need to see your " + pc.feet() + " anyway, and you can always pull your boobs out to the side if you need to see past them. As a bonus, that would give you a chance to squeeze and rub at the well-rounded melons. They're so rounded and shapely; how could anyone ignore a perfect, HH-cup rack like yours? You arch your back, displaying them like solar panels that exist solely to soak up attention.";
				if(pc.bRows() > 1)
				{
					eventBuffer += "\n\nMaybe you could get your other row";
					if(pc.bRows() > 2) eventBuffer += "s";
					eventBuffer += " dosed with something so they don't get forgotten. You could probably titfuck like, three guys at once then.";
				}
				//+3 lust
				pc.lust(3);
				pc.breastRows[0].breastRatingRaw++
			}
			//HH -> big HH
			else if(pc.breastRows[0].breastRatingRaw < 22)
			{
				eventBuffer += "\n\nYou lean back, feeling the weight of your feminine mounds flattening them slightly against your chest, and rub your hands across them in slow circles, giving them a little massage. They've earned it after all, working so hard to swell up all big and sexy, being so sensitive and pleasant to feel. Your [pc.nipples] are like little dispensers that release pink clouds of happiness on contact. Giggling, you admire them, realizing they've gotten even bigger. You'll barely fit in an HH-cup bra anymore.";
				//+6 lust
				pc.lust(6);
				pc.breastRows[0].breastRatingRaw++
			}
			//big HH -> HHH
			else if(pc.breastRows[0].breastRatingRaw < 23)
			{
				eventBuffer += "\n\nClosing your eyes, you cop a feel at your bosom. It perfectly deforms around your questing fingertips, swallowing them almost wholly into itself. Each perfectly-shaped boob quivers against the other, pressed into a line of cleavage long enough to make a kui-tan cream her pants. You play with them";
				if(pc.hasVagina()) eventBuffer += " until you feel more than a little sticky yourself";
				else eventBuffer += ", feeling a little unfilled yourself. If only you had someone to come fuck your [pc.ass] right now";
				eventBuffer += ". There's no doubt in your mind: you're a triple-H girl now.";
				eventBuffer += "\n\nYou don't even try to stop a contented 'moo' from escaping your mouth. It feels right.";
				pc.lust(3);
				pc.breastRows[0].breastRatingRaw++
			}
			/*HHH -> big HHH
			else if(pc.breastRows[0].breastRatingRaw < 24)
			{
				eventBuffer += "\n\nYou wrap your arms around your [pc.chest], squeezing them together. Your breasts have gotten so big and well... fuckable lately. You squeeze tighter, making them bulge out slightly, and giggle. Huge tits can serve so many purposes! They can get you attention from guys and girls, or they can hold milk.... One of your hands starts tugging a nipple, reminding you of another important fact about big, treated boobs: they can feel really, really good. You're already bigger than some of the girls on New Texas, almost past HHH-cups. How big can you get?";
				//+5 lust
				pc.lust(5);
				pc.breastRows[0].breastRatingRaw++
			}*/
			//big HHH -> I
			else if(pc.breastRows[0].breastRatingRaw < 24)
			{
				eventBuffer += "\n\nWarmth burns through the nerves of your chest, heating your jiggling mounds to an incredibly pleasant simmer as they begin to swell. You grab them, mooing and moaning in equal parts, feeling them bulge out between your fingertips, marvelling at the weight of your expanding feminine flesh. Your tits are definitely I-cups now. The tingling heat fades, replaced by a desire for physical contact. You give them that and more. Your hands fly across your chest, mauling your boobs for what feels like hours. It isn't until you cum from the incessant stimulation that your hands fall away";
				if(pc.cumQ() >= 100 || pc.wettestVaginalWetness() >= 3 || (pc.isLactating() && pc.lactationQ() >= 200)) eventBuffer += ", leaving you sitting in a puddle of your own fluids and panting.";
				//orgasm!
				pc.orgasm();
				pc.breastRows[0].breastRatingRaw++
			}
			//I -> big I
			else if(pc.breastRows[0].breastRatingRaw < 25)
			{
				eventBuffer += "\n\nA little extra wobble in your chest is all the notification you need to give yourself a quick grab n' squeeze. As expected, your tits are a little bigger than before. An I-cup bra would barely contain them! You sit there, petting them, hoping that it'll encourage further growth. There's no point in stopping when you're this close to moving up a whole bra size, is there?";
				pc.breastRows[0].breastRatingRaw++
			}
			//big I -> II
			else if(pc.breastRows[0].breastRatingRaw < 26)
			{
				eventBuffer += "\n\nTeetering forward and nearly losing your balance is all the reminder you need to give your rack some much needed attention. Unashamedly whipping them out, you take hold of your growing tits and weigh them. It isn't a very precise method of measuring growth, but it feels wonderful. You spend a few moments playing with them, squishing them together, and even bouncing them in place before you come to a decision. You have II-cup boobs for sure.";
				//+2
				pc.lust(2);
				pc.breastRows[0].breastRatingRaw++
			}
			//II -> big II
			else if(pc.breastRows[0].breastRatingRaw < 27)
			{
				eventBuffer += "\n\nYour chest has been supremely weighty for a while, but it seems a little heavier than before. You'd better check, just in case it got bigger... and more fuckable. Imagining it's a dick sliding between your expanding knockers, you snake a hand through your cleavage, wrapping the crook of your arm around the bottom of it. It feels good, of course. Handling your breasts is an exercise in excitement for sure, but you do your best to keep your wits about you. It's important to know how big your boobs are, after all. How else will you be able to brag about being almost too big for an II-cup bra?";
				//+7 lust
				pc.lust(7);
				pc.breastRows[0].breastRatingRaw++
			}
			//big II -> J
			else if(pc.breastRows[0].breastRatingRaw < 28)
			{
				eventBuffer += "\n\nEvery movement sends quakes of happy feelings through your mountainous melons, the feminine orbs entirely too delighted to bounce and jiggle for the whole world to see. And you can't blame them either. They're big, delicious tits. They deserve to be grabbed and squeezed and pulled until you're whimpering and drooling all over them... just like now. You moo quietly under your breath and pull your hands away, trying not to cum. You're pretty sure they're at least J-cups by now, but it's a far less pressing concern than the needy itch between your ";
				if(pc.hasVagina()) eventBuffer += "[pc.thighs]";
				else eventBuffer += "cheeks";
				eventBuffer += ".";
				if(pc.breastRows.length > 1) eventBuffer += "\n\nIf you the Treatment worked on more than one row, you could probably be having a wonderful titgasm by now.";
				//+33 lust
				pc.lust(33);
				pc.breastRows[0].breastRatingRaw++
			}
			//J -> big J
			else if(pc.breastRows[0].breastRatingRaw < 29)
			{
				eventBuffer += "\n\nLooking down, you barely suppress a giggle. Your titties are just so gosh darned big! They're all wobbly and completely obscure your " + pc.feet() + "; why, you're pretty sure that without some serious effort you won't be able to make out your own groin. It's a good thing your fingers already know just where to go, but you're pretty sure they'd be manhandling these delicious knockers. You start squeezing them together, letting your eyes drift closed, imagining that strong, calloused fingers are doing the work. Having such big J-cups is nice.";
				//+10 lust
				pc.lust(10);
				pc.breastRows[0].breastRatingRaw++
			}
			//big J -> JJ
			else if(pc.breastRows[0].breastRatingRaw < 30)
			{
				eventBuffer += "\n\nOoooh! A throaty moan rips through the air around you as you feel something come over your tits. It feels like a wave of tingling is hitting you. Your [pc.nipples] instantly ";
				if(pc.hasFuckableNipples() || pc.isLactating()) eventBuffer += "leak in noticeable streams";
				else if(!pc.hasFuckableNipples() && pc.breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_FLAT && pc.breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_INVERTED && pc.breastRows[0].nippleType != GLOBAL.NIPPLE_TYPE_LIPPLES) eventBuffer += "tent out to their full size";
				else eventBuffer += "become sensitive and pebbly";
				eventBuffer += ", and the flesh around them is flushed and expanding. You hold on for dear life, rubbing your chest enthusiastically and occasionally interrupting your moans with fervent, eager moos. You wish you had someone to milk you and fuck you all at the same time!";
				eventBuffer += "\n\nStill tugging your nipples, you writhe on the ground";
				if(pc.isLactating()) eventBuffer += ", leaking fluids everywhere";
				eventBuffer += " as you climax again and again, cumming to the feeling of your breasts expanding to JJ-cups. You never want it to stop. If your life became nothing more than breast-obsessed orgasmed chained on the heels of the last, you could die happy. You're sure of it.";
				eventBuffer += "\n\nComing down from that high takes more than a few minutes and brings with regret in no small measure. There's a sense of finality in your expanded breasts. The Treatment has done all that it can to them; you aren't going to get any bigger. You guess that you'll be fine with these. They're bigger than most unaugmented New Texans, and you could always go get some boobswell pads from the store if you really wanted to stand out.";
				eventBuffer += "\n\nIt would be... nice to have bigger breasts than anyone else. Your teats glow with approval.";
				//3 cums! Ah ah ah! /thecount.
				pc.orgasm();
				pc.orgasm();
				pc.orgasm();
				pc.breastRows[0].breastRatingRaw++
			}
			//Done before max:
			if(pc.breastRows[0].breastRating() >= pc.statusEffectv1("Treated") && !pc.hasStatusEffect("Boobgrow Done Notice"))
			{
				eventBuffer += "\n\nThere's a kind of quivering finality about the movements of your breasts as you walk. They don't seem as constantly warm or well... active as before. The Treatment must be done working its magic on them, but at least they're still big, sexy, and oh so fun to touch. Just the idea of fondling yourself has your [pc.skin] flushing hotly.";
				pc.createStatusEffect("Boobgrow Done Notice",0,0,0,0,true,"","",false,10080);
			}
		}
		//Lips 
		//Max size stored in v3
		//Raise femininity to max, then add lipRating as needed.
		//Final lip rating = 4 to 6.
		if(pc.statusEffectv3("Treated") > pc.lipRating() && (treatedHours == 121 || treatedHours == 130 || treatedHours == 140 || treatedHours == 150 || treatedHours == 160 || treatedHours == 168))
		{
			//sub 25 to -> 26 Femininity
			if(pc.femininity < 25)
			{
				eventBuffer += "\n\nYou reach to scratch an itch on your jaw and find that it feels a little differently than before. Concerned, you pull out your Codex, using the camera function as a mirror. Your face <i>does</i> look different. A little softer somehow. Your features are getting less rugged, but you concede that you look a little more pretty, in a mannish way.";
				pc.femininity = 26;
			}
			//sub 50 to 51 Femininity
			else if(pc.femininity < 50)
			{
				eventBuffer += "\n\nYour [pc.lips] feel a little dry, and when you lick them, you discover that they feel a little fuller than before. You pull out your Codex's camera function for another look. It confirms your worry. Your lips are bigger, and your face looks far more feminine than before. The Treatment has given you a fairly androgynous face. You could probably pass as either gender, if you wanted.";
				pc.femininity = 51;
			}
			//sub 75 to 76 femininity
			else if(pc.femininity < 75)
			{
				eventBuffer += "\n\nYou wipe a bead of sweat from your brow, then jerk in surprise at how smooth your [pc.skin] felt. It didn't use to feel that way! Hastily pulling out your Codex, you use it to examine your face. What you see shocks you. There's a pretty face with lips that are noticeably fuller than before. <b>You're actually... pretty.</b> More than that, you might even be beautiful. The confused-looking girl in the Codex purses her lips thoughtfully; you're not sure you'll ever get used to this.";
				pc.femininity = 76;
			}
			//sub 100 to 100 femininity
			else if(pc.femininity < 100)
			{
				eventBuffer += "\n\nYou chew on a wonderfully full lip while thinking, then stop, surprised by the fullness of it. Is the Treatment making your lips bigger? You pull out the Codex to check, looking at your reflection. It is, but that's not all. Your whole face has been refined. Your cheekbones are perfectly placed. Your eyebrows arch perfectly. Even your nose is cute. Your visage is the epitome of feminine beauty. Wow. You'll have lovers lining up for a chance with you!";
				pc.femininity = 100;
			}
			//0 to 1 mod.
			else if(pc.lipMod < 1)
			{
				eventBuffer += "\n\nWhile looking at your stunning features in a mirror, you discover a delightful change. Your juicy lips have swollen still larger, giving you a bee-stung look. Your voluptuous mouth is just begging to be kissed. Wondering how it would feel, you find yourself delightfully tingly.";
				pc.lipMod = 1;
				pc.lust(1);
			}
			//1 to 2 mod.
			else
			{
				eventBuffer += "\n\nYou purse your [pc.lips] in front of your Codex, just to look at them. To your surprise, they're even bigger than before. You lick them, making them shine. They're almost... hypnotic. You purse your dazzling kissers, then smile. These lips are gorgeous. You could probably make guys rip holes in their pants, just by talking to them.";
				pc.lipMod = 2;
			}
		}
		//Lubrication Gains
		//Wetness to 3
		if(pc.hasVagina() && pc.driestVaginalWetness() < 3 && (treatedHours == 25 || treatedHours == 50 || treatedHours == 74))
		{
			//not lubricated at all
			if(pc.driestVaginalWetness() <= 0)
			{
				//Singlepuss
				if(pc.totalVaginas() == 1)
				{
					eventBuffer += "\n\nYou suddenly feel... wet, ";
					if(pc.legCount > 1) eventBuffer += "between the [pc.legs]";
					else eventBuffer += "in your crotch";
					eventBuffer += ". You didn't pee yourself - you're sure of it. Gingerly dipping a fingertip inside your feminine crevice, you discover a pleasing slipperiness. You're lubricating! This will make sex soooo much more pleasant.";
				}
				//Multipuss but only 1 changed
				else if(cuntsBelowWetnessThreshold(1) == 1)
				{
					eventBuffer += "\n\nYour dry pussy - the one that didn't self-lubricate - suddenly feels decidedly... <i>moist.</i> You thrill at the discovery. Now all your vaginas are just as fuckable!";
				}
				//Multipuss multiple changed
				else
				{
					eventBuffer += "\n\nAll at once, you feel moist all over your crotch. The strange sensation won't go away, leaving you with nothing to do but press a pair of fingertips inside yourself, just to check. It's slippery and wet - ";
					if(pc.totalVaginas() == 2) eventBuffer += "both";
					else eventBuffer += "all of";
					eventBuffer += " your holes. You whimper. How are you supposed to keep your";
					if(pc.legCount > 1) eventBuffer += " [pc.legs] closed";
					else eventBuffer += " sex away";
					eventBuffer += " when you're getting so fuckable?";
				}
				//+5 lust for all
				pc.lust(5);
				setMinimumWetness(1);
			}
			//1 -> 2 Lubiness
			if(pc.driestVaginalWetness() <= 1)
			{
				//Singlepuss
				if(pc.totalVaginas()) eventBuffer += "\n\nWhenever you get thinking too hard about what the Treatment is doing to your body, you find yourself getting wet, and not just wet, but slick enough that trickles of it can run down your thighs when you get all hot and bothered. It'll be way easier to handle insertions from dildos... or big dicks... or anything really.";
				//Multipuss but only 1 changed
				else if(cuntsBelowWetnessThreshold(2) == 1)
				{
					eventBuffer += "\n\nOooh, you feel a long overdue change in [pc.oneVagina]. It's palpably wetter, just like its sister";
					if(pc.totalVaginas() > 2) eventBuffer += "s";
					eventBuffer += ". You ";
					if(pc.isCrotchGarbed()) eventBuffer += "reach into your [pc.lowerGarment] and ";
					eventBuffer += "ease a finger inside, delighting in the hot slipperiness that you find. You're practically as wet as an ausar now. Your body is practically begging for something to try out the improved entrance. You resolve to properly finger yourself as soon as humanly possible.";
				}
				//Multipuss multiple changed
				else
				{
					eventBuffer += "\n\nA sudden pang of warmth and wetness assaults your crotch, dropping you to your hands and [pc.knees]. You're getting so gloriously wet! You can practically smell the lubricant your body is making from your multiple honeypots, like you've got " + num2Text(pc.totalVaginas()) + " horny ausar living in your crotch.";
				}
				//+10 lust
				pc.lust(10);
				setMinimumWetness(2);
			}
			//2 -> 3 Lubiness
			else
			{
				//Singlepuss
				if(pc.totalVaginas() == 1)
				{
					eventBuffer += "\n\nOut of nowhere, your [pc.vagina] alights with abrupt excitement, simmering and bubbling with arousal until thin streams of [pc.girlCum] run unopposed down your [pc.legOrLegs]. You stare in fascination at the sensuous sight, feeling like you're half-girl, half-river. If you had a boyfriend handy, he could slip right in with no trouble at all!";
				}
				//Multipuss but only 1 changed
				else if(cuntsBelowWetnessThreshold(3) == 1)
				{
					eventBuffer += "\n\nOut of nowhere, [pc.oneVagina] alights with abrupt excitement, simmering and bubbling with arousal until thin streams of [pc.girlCum] are running unopposed down your [pc.legOrLegs]. Finally, you're slippery all over. You feel like a brain attached to a multitude of slippery, wet holes, each signalling their readiness with fragrant arousal.";
				}
				//Multipuss multiple changed
				else eventBuffer += "\n\nOut of nowhere, your [pc.vaginas] alight with abrupt excitement, simmering and bubbling with arousal until thin streams of [pc.girlCum] cascade down your [pc.legOrLegs]. You stare in fascination at the unquestionably sexual sight, feeling like you're little more than a woman attached to a wellspring of lust. A boy with nice, thick cocks could just slide them all right into you!";
				//+15 lust
				pc.lust(15);
				setMinimumWetness(3);
			}
		}
		//Lactation
		//boostLactation(1); every hour starting on day 3. until 100 is reached.
		if(treatedHours >= 73 && pc.milkMultiplier < 100)
		{
			pc.boostLactation(2);
			if(treatedHours > 100) pc.boostLactation(1);
			if(treatedHours > 120) pc.boostLactation(1);
			if(treatedHours > 130) pc.boostLactation(1);
			if(treatedHours > 140) pc.boostLactation(1);
			//Failsafe: Treated girls always max out lactation.
			if(treatedHours > 150 && pc.milkMultiplier < 100) 
			{
				pc.milkMultiplier = 100;
				pc.createStatusEffect("Pending Gain MilkMultiplier Note: 100");
			}
		}
		//lactation almost never stops. If combined with Milky perk, never stops. Ever.
		//Once 100 milkMultiplier is reached, unlock the Treated Milk perk.
		if(pc.milkMultiplier >= 100 && treatedHours >= 78 && !pc.hasPerk("Treated Milk"))
		{
			eventBuffer += "\n\nYou grow increasingly aware of how productive and wonderful your [pc.breasts] are. The Treatment has given you the ability to produce so much!";
			if(pc.milkType == GLOBAL.FLUID_TYPE_MILK) eventBuffer += " You squeeze a droplet onto a finger and try it, just to sample it. It tastes exactly like the freshest, most delicious milk you've ever tasted - way better than normal. No wonder New Texas is able to export so much milk; Texan cow-milk is amazing!";
			//Perk Unlocked: Treated Milk - Your milk tastes delicious, and milk production takes much longer to slow. The only way you'd stop producing is if you made a conscious effort to keep your roving hands off your milky nipples.
			eventBuffer += "\n\n(<b>Perk Gained: Treated Milk</b> - Your milk tastes delicious, and milk production takes much longer to slow. The only way you'd stop producing is if you made a conscious effort to keep your roving hands off your milky nipples.)";
	 		pc.createPerk("Treated Milk",0,0,0,0,"Any milk you lactate tastes better, and you are less likely to stop lactating.");
	 	}
		//Milk capacity gains
		if(pc.milkStorageMultiplier < 3 && pc.hasPerk("Treated Milk") && pc.canLactate() && rand(8) == 0)
		{
			//1->1.5
			if(pc.milkStorageMultiplier <= 1)
			{
				eventBuffer += "\n\nBy now you've gotten used to having a chest that feels like it's full of sloshing, delicious cream, but, out of the blue, that feeling diminishes. You weren't even milking yourself; you just feel like you can hold <i>more</i>. You rub your breasts curiously. Could the Treatment be making your body even better at storing up fluid? Rubbing your moistened teats, you wonder if your next milking will be that much more voluminous.";
				pc.milkStorageMultiplier = 1.5;
			}
			//1.5->2
			else if(pc.milkStorageMultiplier <= 1.5)
			{
				eventBuffer += "\n\nA wave of warmth washes over your [pc.chest], and in its wake you're left feeling oddly... emptied. How odd. Hefting a tit in one hand, you squeeze it, delighted to see that [pc.milk] still comes out. The only conclusion you can come to is that the Treatment has somehow made your breasts... better - able to hold and give more [pc.milkNoun]. A sensation of rightness accompanies that thought. Of course! It only makes sense that your body would change itself in order to experience even longer, more exciting milkings.";
				pc.milkStorageMultiplier = 2;
			}
			//2->2.5
			else if(pc.milkStorageMultiplier <= 2)
			{
				eventBuffer += "\n\nYour attention is drawn to your chest out of the blue - not that unusual given your current state. You giggle, smooshing your boobs against one another, enjoying the feel of your lactating jugs bouncing and sloshing together like two energetic best friends. You're getting better at it too - the whole milk giving thing. Just when you think you're starting to get too full, it's like your boobs find even more room for [pc.milkNoun]. You briefly imagine your tits rearranging their furniture to add another fridge, giggling all the while.";
				pc.milkStorageMultiplier = 2.5;
			}
			//2.5->3
			else if(pc.milkStorageMultiplier <= 2.5)
			{
				eventBuffer += "\n\nYour chest wobbles under the weight of its own unrestrained lactic prowess. Your body is so good at making milk that you find yourself wondering if your time would be better spent hooked up to a pump than hopping around the galaxy on a vainglorious quest for riches. Hefting the wonderful weight of your all too efficient mammaries, you smile, somehow knowing you could give a dairy cow a run for her money.";
				pc.milkStorageMultiplier = 3;
			}
		}
		//Elasticity + bonus capacity to make sure the girl can handle roughly 24" by 4.5" poles.
		//Change it silently. Leave notification status effect that triggers off the next time cuntchange is called. Followup message:
		if(pc.elasticity < 3.5 && treatedHours >= 155)
		{
			pc.elasticity = 3.5;
			if(pc.hasVagina())
			{
				for(var cuntCount:int = 0; cuntCount < pc.totalVaginas(); cuntCount++)
				{
					if(pc.vaginas[cuntCount].bonusCapacity < 150) pc.vaginas[cuntCount].bonusCapacity  = 150;
				}
			}
			else 
			{
				if(pc.ass.bonusCapacity < 150) pc.ass.bonusCapacity = 150;
			}
			//pc.createStatusEffect("Treatment Elasticity Report Q'ed");
			pc.createStatusEffect("Treatment Elasticity Report Needed");
		}
		//Horn Grow 2 Nubs
		if((pc.horns == 0 || (pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT) || pc.hornLength < pc.statusEffectv2("Treated")) && (treatedHours >= 82 && rand(6) == 0))
		{
			//Existing horns transform into lil bull nubs.
			if(pc.horns > 0 && (pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT))
			{
				eventBuffer += "\n\nThere is a crackling, rustling sound coming from above you. You look up, but nothing is there. Instead, you hear the same sound from behind you. This time, you twist around to try and identify the source, but to no avail. A minute later a piece of horn bounces off your nose on the way to the ground.\n\n<b>Your horns are breaking apart!</b> Dazedly, you feel at the crumbling totems, feeling them come apart in your fingers. Chalky dust clings to your hand, but more importantly, two little nubs remain on your head. They're small and pointed, like little cow horns.";
				pc.horns = 2;
				pc.hornLength = .5;
				pc.hornType = GLOBAL.TYPE_BOVINE;
			}
			//Starting
			else if(pc.horns == 0 && !pc.hasStatusEffect("Horn Bumps"))
			{
				eventBuffer += "\n\nUgh. Your head itches! Reaching up to take a scratch, you wince when you come across a painful bump on your forehead. A quick check with the Codex confirms that it's red and irritated, though you haven't seen a head form on the zit yet. You've never had such prominent acne before, and there's a matching lump on the either side. Maybe something stung you? It could always be a pair of bug bites. Gross.";
				pc.createStatusEffect("Horn Bumps");
			}
			//Breaking Skin
			else if(pc.horns == 0)
			{
				eventBuffer += "\n\nThe pain from those irritating red bumps on your forehead is getting worse and worse with each passing moment, matched by a sudden desire to scratch madly at them until you flay the skin away. You resist as long as you can, but the need to tend to the maddening itch overwhelms your subpar self-control. Besides, if something itches, why not scratch it?";
				eventBuffer += "\n\nTo your horror, your first scratch peels away a patch of offending skin, but with it comes a sense of relief. Helpless to stop yourself, you scratch and scratch until the desire is completely gone - and a pile of discarded skin has built up before your " + pc.feet() + ".";
				eventBuffer += "\n\nWhat have you done to yourself!? Pulling out your Codex, you use the camera to check.";
				eventBuffer += "\n\nYou tumble onto your [pc.butt] in shock. You... y-you're... <b>you've got the cutest pair of horns growing out of your forehead!</b> They're small little nubs at the moment - adorable really, but they do a great job telling everyone about your bovine proclivities.";
				pc.hornType = GLOBAL.TYPE_BOVINE;
				pc.removeStatusEffect("Horn Bumps");
				pc.horns = 2;
				pc.hornLength = .5;
			}
			//nubs -> 1" horns
			else if(pc.hornLength < 1)
			{
				eventBuffer +="\n\nFor the past few minutes, a nasty little headache has been brewing. You squeeze your eyes closed, flexing your jaw in an effort to deal with it, when it abruptly fades, vanishing in the span of a second.";
				eventBuffer += "\n\nYou gingerly prod yourself; just what kind of headache was that? You get your answer when your fingers find what your nubs have become: full blown horns. They stick at least a full inch out from your [pc.skinFurScales], coming to two proud points, though their tips are rounded enough that you doubt you could do any real injury with them. They're mostly there for ornamentation, you figure, like a pair of earrings for your forehead.";
				pc.hornLength = 1;
			}
			//1" horns to 2" horns
			else if(pc.hornLength < 2)
			{
				eventBuffer += "\n\nA wave of discomfort strikes just behind your forehead, growing worse by the second. There's really only one thing it can be - your horns getting bigger! You whip out your Codex, wincing from the sudden motion, and flick it on, getting yourself a ticket to your own horny transformation show. You giggle to yourself and watch.";
				eventBuffer += "\n\nYour formerly one-inch horns have already pushed a little further out, perhaps a quarter inch. The longer they get, the wider their bases are becoming, and they're growing fast enough now that you can actually see them slowly sliding out, revealing bit after bit of gleaming white ivory.";
				if(pc.hasHair() && pc.hairLength >= 2) eventBuffer += " You brush your bangs to one side, hooking them around one of the horns in the cutest way.";
				eventBuffer += " The process is fascinating enough for you to forget your earlier discomfort. You watch, spellbound, as your horns continue to expand, growing ever more prominent on your face until they stop at around two inches long.";
				eventBuffer += "\n\nEveryone will know you're a New Texas " + pc.mf("boy","girl") + " now";
				if(pc.biggestTitSize() >= 15) eventBuffer += ", as if the tits weren't an obvious enough sign";
				eventBuffer += ".";
				pc.hornLength = 2;
			}
			//2" horns to 3" horns
			else if(pc.hornLength < 3)
			{
				eventBuffer += "\n\nYour jaw clenches, a low growl escaping your throat entirely uncontrollably. There's a powerful shifting and sliding going on in your skull. It leaves you seeing stars with your eyes half-crossed. There's blessedly little pain, but when it passes, you're very aware of additional weight tugging on your head. Your horns have grown: they're now three inches of gleaming white bovine beauty. You resolve to polish them at the first opportunity, maybe even buy some jewelry for them once you're sure they're done growing.";
				pc.hornLength = 3;
			}
			//3" horns to 4" horns - prolly gonna reuse some of this for guys.
			else if(pc.hornLength < 4)
			{
				eventBuffer += "\n\nYour eyes suddenly cross, and you drop yourself to the ground, lest you run into something or worse. The rumbling sense of movement is working on your skull once more, like giant boulders rolling around the inside of your head. It doesn't hurt, but it is very disconcerting, making it next to impossible to think.";
				eventBuffer += "\n\nYou grunt and groan, feeling the sensation slide <i>outside</i> of your head as your horns expand, growing thicker and heavier.";
				if(pc.statusEffectv1("The Treatment") == 0) eventBuffer += " The Treatment isn't supposed to give you such large horns. You frown as they finish growing; the Texans will probably call you a milk-bull or something equally degrading.";
				else eventBuffer += "You sigh in satisfaction once they stop growing. Now these are respectable horns!";
				pc.hornLength = 4;
			}
			//4" horsn to 5" horns - MAX LADIES CAN GET.
			else if(pc.hornLength < 5)
			{
				eventBuffer += "\n\nYou feel a sense of... potential building within your head, expanding until it changes from a kind of nebulous energy into an unstoppable pressure. You feel your horns giving under the weight of it all, slowly sliding forward, expanding outward, growing heavier by the moment. You wrap your hands around them, feeling the change against your palms. When it's all over, you're left holding two big, strong five-inch horns.";
				pc.hornLength = 5;
			}
		}
		//tail-converts existing to cowtail
		//cunt/cocktails prevent this!
		if(!pc.hasCuntTail() && !pc.hasCockTail() && pc.tailType != GLOBAL.TYPE_BOVINE && treatedHours == 97 && rand(10) != 0)
		{
			//No tail
			if(pc.tailCount == 0)
			{
				eventBuffer += "\n\nYou go to scratch at a spot above your [pc.butt] that's been bothering you for a few hours, and jerk when you hit something that wasn't there before - something rounded and fluffy. Pressing back carefully, you ease your fingers around the growth, discovering its furred texture and cords of muscle. The oddest part is feeling the fingers pressing on you through the fur. There's no doubt about it - <b>you have a tail.</b>\n\nIt's a fairly long tail with a cute little poof on the end, just like a cow's.";
				pc.tailCount = 1;
			}
			//Multitail
			else if(pc.tailCount > 1)
			{
				//Multi - short
				if(pc.tailCount == 1 && !pc.hasTailFlag(GLOBAL.FLAG_LONG))
				{
					eventBuffer += "\n\nYour [pc.tails] brush against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had [pc.tails], now you've got gently-swaying, bovine tails, complete with fuzzy puffs at the tips.";
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) eventBuffer += " A fine layer of [pc.furColor] fur covers each one.";
					eventBuffer += " You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.";
				}
				//Multi - long
				else
				{
					eventBuffer += "\n\nYour [pc.tails] feel increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremities alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find.";
					eventBuffer += "\n\n" + upperCase(num2Text(pc.tailCount)) + " gently swinging, bovine tails hang behind you. The tips are poofing up, just as you'd expect";
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) eventBuffer += ", and a coat of fine fur is growing out over their lengths";
					eventBuffer += ". In seconds, the warmth fades, leaving you with new, bovine butt ornaments. You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.";
				}
			}
			//Single - short
			else if(pc.tailCount == 1 && !pc.hasTailFlag(GLOBAL.FLAG_LONG))
			{
				eventBuffer += "\n\nYour tail brushes against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had a [pc.tail], now you've got a gently-swaying, bovine tail, complete with a fuzzy puff at the tip.";
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) eventBuffer += " A fine layer of [pc.furColor] fur covers the whole thing.";
				eventBuffer += " You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.";
			}
			//Single - long
			else
			{
				eventBuffer += "\n\nYour [pc.tail] feels increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremity alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find.";
				eventBuffer += "\n\nA gently swinging, bovine tail hangs behind you. The tip is poofing up, just as you'd expect";
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) eventBuffer += ", and a coat of fine fur is growing out over its length";
				eventBuffer += ". In seconds, the warmth fades, leaving you with a new, bovine butt appendage. You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.";
			}
			pc.clearTailFlags();
			pc.tailType = GLOBAL.TYPE_BOVINE;
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		}
		//Cow ears (maybe)
		if(pc.earType != GLOBAL.TYPE_BOVINE && treatedHours == 137 && rand(10) == 0)
		{
			eventBuffer += "\n\nYou go to scratch at one of your " + pc.earsDescript() + ", only to find it differently shaped - and in a new location - than before. Gingerly feeling it, you discover that your aural organs are soft and leathery, with a fine coat of [pc.furColor] across their outer edges. You can still hear just fine; you're just listening through a pair of floppy cow-ears now. Briefly, you consider how good it would feel to have someone scratch them.";
			pc.earType = GLOBAL.TYPE_BOVINE;
		}
		//Hooves (Rarish) - requires biped minimum. No change for goo/nagaPCs
		if(pc.legType != GLOBAL.TYPE_BOVINE && treatedHours == 145 && rand(10) <= 1)
		{
			if(pc.hasLegFlag(GLOBAL.FLAG_HOOVES))
			{
				eventBuffer += "\n\nYou stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. It’s then that you spot way your " + pc.feet() + " are shifting and changing. They look like they’re staying as hooves, but they’re a little more of a brown-black color, with a split down the middle. They look like the kind of hooves a cow would have. Well, there are worse things than having a matched set of transformations. <b>You resolve to enjoy your new cow hooves.</b>";
			}
			else
			{
				eventBuffer += "\n\nYou stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. You see why when you glance to your " + pc.feet() + ". They're malformed, twisting and narrowing before your eyes. They're pulling their disparate parts together into one unified mass, almost cylindrical in shape";
				if(!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE))
				{
					eventBuffer += ", and the change isn’t limited to below the ankle either. Your calves are reshaping, placing what used to be your ankle far above your blackening feet";
				}
				else eventBuffer += ", and they begin to blacken, moment by moment";
				eventBuffer += ".\n\nThey split in half, right down the middle, growing harder by the moment, dulling your sense of touch. You dully rub them, confused at first. Realization hits you like a ton of bricks - you have hooves! Just like a cow, you've got hooves to clop around on while you walk. Most people don't get hooves from the Treatment. It looks like you were one of the lucky ones. " + pc.mf("The cow-girls are gonna be all over you!","The bull-boys are going to love the look!");
			}
			pc.clearLegFlags();
			pc.legType = GLOBAL.TYPE_BOVINE;
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_HOOVES);
		}
		//Clit Expanding
		if(pc.clitLength < .75 && (treatedHours == 113 || treatedHours == 127))
		{
			if(treatedHours == 113)
			{
				//Small clits gro - clothed
				if(pc.isCrotchGarbed())
				{
					eventBuffer += "\n\nWith every movement you make, you become increasingly aware of your [pc.clits] rubbing against your [pc.lowerGarment]. It’s impossible to ignore the constant, distracting friction on your nub";
					if(pc.totalClits() > 1) eventBuffer += "s";
					eventBuffer += ", feeding your arousal fresh fuel. You huff in annoyance and yank the offending garments down, eyeballing [pc.oneClit] to see why it’s gotten so gosh darn sensitive.";
				}
				//Small clits gro - unclothed
				else
				{
					eventBuffer += "\n\nWith every movement you make, you find your " + possessive(pc.vaginasDescript()) + " [pc.clits] rubbing on your netherlips as if constantly aroused and swollen. It’s a nagging, constant sensation of friction on your nub";
					if(pc.totalClits() > 1) eventBuffer += "s";
					eventBuffer += ", feeding your arousal fresh fuel. You huff in annoyance and bend over for a closer look, eyeing [pc.oneClit] to see why it’s so sensitive now.";
				}
				//Merge
				eventBuffer += "\n\n<b>Your clit is like a big, pink gumball!</b> Even when it isn’t stimulated, it’ll probably stick out of its hood. It must be three quarters of an inch long at full size. You’ll just have to get used to having such a big, easily stimulated buzzer.";
				pc.clitLength = 0.75;
			}
			//Big clit exhibitionism - not a TF, just a fun message.
			else
			{
				eventBuffer += "\n\nYou wonder if the best way to handle your enlarged clit";
				if(pc.totalClits() > 1) eventBuffer += "s";
				eventBuffer += " would just be to leave ";
				if(pc.totalClits() == 1) eventBuffer += "it";
				else eventBuffer += "them";
				eventBuffer += " out and open to the air. Most of the frontier worlds don’t have laws against public nudity; some even encourage it! You wouldn’t have the constant rubbing to worry about, and you could bask in the lusty gazes of onlookers, maybe even seduce one into a quick romp!";
			}
		}
		//Defattening
		if(pc.thickness > 60 && treatedHours == 65)
		{
			//High thickness trims in.
			//Ogre -> Curvy cowgal
			if(pc.tone > 59)
			{
				eventBuffer += "\n\nHour by hour, the imposing girth and size of your body has been narrowing into a more svelte, feminine shape. Sure, some parts of you have stayed the same - your hips, for example, but your shoulders aren’t nearly as broad, and your arms are no longer as visibly muscular. You still feel just as strong; you’ve just taken on a more womanly look.";
				//Thickness to 60.
				pc.thickness = 60;
				//Tone to 59.
				pc.tone = 59;
			}
			//High thickness and high fat trims in.
			//Fatty -> Curvy Cowgal
			else
			{
				eventBuffer += "\n\nAll the excess weight you’ve carried around has been melting off hour by hour. You aren’t exactly a little stick of a girl - not by a longshot. You’ve still got plush curves that just beg to be squeezed and handled. It’s just that noone with half a brain would call you fat now, though the term curvy might be apt.";
				//Thickness to 60
				pc.thickness = 60;
			}
		}
		//Hip widening towards 7-11.
		if(pc.hipRating() < 7 && rand(20) == 0 && treatedHours > 55)
		{
			//Sub 3 to 3
			if(pc.hipRatingRaw < 3)
			{
				eventBuffer += "\n\nYou look yourself over, discovering that your hips have widened, giving you a more feminine look.";
				pc.hipRatingRaw = 3;
			}
			//Not so smallish Sub 6 to 6
			else if(pc.hipRatingRaw < 6)
			{
				eventBuffer += "\n\nWhoah! Your hips have gotten wider. Nobody is going to mistake you for a boy when you can swivel these back and forth. You sashay them around a few times, just to try it out.";
				pc.hipRatingRaw = 6;
			}
			//Biggish (Sub max to max)
			else
			{
				pc.hipRatingRaw += 1 + rand(5);
				eventBuffer += "\n\nMoving around, you’re pleased to discover a little extra wiggle in you walk. Your [pc.butt] sways hypnotically as you go, automatically borne on a sinuous back and forth motion by your expanding [pc.hips]. You wonder if anyone will notice.";
			}
		}
		//Bigger Booty Towards 7-12.
		if(pc.buttRatingRaw < 7 && rand(24) == 0 && treatedHours > 49)
		{
			if(pc.isCrotchGarbed()) eventBuffer += "\n\nAn increase in the tightness of your [pc.lowerGarments] gradually comes to your attention, forcing you to shift and adjust them.";
			else eventBuffer += "\n\nA slight shift in your balance gradually makes itself known to you, and you twist to regard your changing form, expecting to find a bigger butt.";
			eventBuffer += " Sure enough, your ass has swollen up with an influx of fresh new flesh, pushing it out into a quite squeezable, bubbly butt. The urge to shake it comes over you, but you fight it off, for now. There will be plenty of time for that sort of thing later. Not too much later, but later.";
			pc.buttRatingRaw = 7 + rand(6);
		}
	}
	//REGULAR DUDEMOAD
	else if(pc.statusEffectv1("The Treatment") == 1)
	{
		//48 Hours of Mental Changes: slowStatGain of 2 libido an hour.
		//+Confidence
		//+Increased Enjoyment of Physical Tasks
		//+Libido (of course)
		//+Craving for vaginal fluid
		pc.slowStatGain("libido",2);
		if(treatedHours == 2)
		{
			eventBuffer += "\n\nWell, you’ve taken the Treatment and you don’t really feel any different yet. You would’ve thought that after an hour or two you’d be daydreaming about the silken slit between a busty cow-gal’s thighs, but... nope. You sigh and return to your previous business, hoping something happens soon.";
		}
		else if(treatedHours == 4)
		{
			eventBuffer += "\n\nYou idly munch on a ration bar, struck by an unexpected pang of hunger. One moment, you’re moving along just fine, the next, you need to eat like nobody’s business. Good thing your ship was stocked full of them. You wouldn’t want to starve out here just because your body is stocking up on calories for a little ";
			if(!pc.hasCock()) eventBuffer += "muscle-building";
			else eventBuffer += "dick-swelling";
			eventBuffer += ".";
			if(pc.hasCock()) eventBuffer += " You pull open your bottoms and eyeball your " + pc.cocksDescript() + ". Still the same. Damn.";
		}
		else if(treatedHours == 6)
		{
			eventBuffer += "\n\nYou belch loudly, not remembering your manners until it’s too late to do anything about. A sheepish look around you is all you manage before your shame melts away. It was just a burp. It’s a totally normal thing to do, particularly after eating another ration bar. You belch again, enjoying the way it rumbles out of your chest a little more strongly than you anticipated. You’ve got nothing to be ashamed of.";
		}
		else if(treatedHours == 8)
		{
			eventBuffer += "\n\nRubbing your chin, you consider the evidence stacking up around you in the form of empty wrappers. The Treatment is definitely doing something to you, though it’s still way too soon for it to be ";
			if(pc.hasCock()) eventBuffer += "giving you a sperm-dripping bull-cock";
			else eventBuffer += "changing your body";
			eventBuffer += ". You have been thinking about sex a little more than normal over these past few hours";
			if(pc.hasCock()) eventBuffer += ", and " + pc.eachCock() + " in engorges in anticipation of a little attention";
			eventBuffer += ". Not that there’s anything wrong with thinking about sex, you suppose. It’s not exactly a new thing, and it probably has nothing to do with the Treatment.";
			pc.lust(2);
		}
		else if(treatedHours == 10)
		{
			eventBuffer += "\n\nYou find yourself smiling more and more, and not in the silly, stupid, giggly way that the bimbos back on New Texas do. No, it’s just an easy, friendly grin - the kind that lets people know you’ve probably got a few good stories to tell over beers and a campfire. It’s the kind of grin that could get a girl to climb into your lap for a heavy make-out session, and that thought just makes you smile all the harder.";
			pc.lust(4);
		}
		else if(treatedHours == 12)
		{
			eventBuffer += "\n\nYou have so much energy lately. You could jog in place or drop and work through twenty pushups right now if you didn’t have other stuff to do. Maybe you ought to start working out soon. With all the food you’re consuming, it might be a good idea to burn some of the excess calories off before they go to your waistline. You’re going to need to be hot enough to pick up some cuties soon, what with how your libido is supposed to spike.";
			pc.lust(4);
			if(pc.hasCock()) 
			{
				eventBuffer += "\n\nYou pointedly adjust your " + pc.cocksDescript() + ", finding ";
				if(pc.cockTotal() == 1) eventBuffer += "it";
				else eventBuffer += "them";
				eventBuffer += " to be entirely too rigid at this exact moment.";
				if(pc.lust() >= 80) 
				{
					eventBuffer += " You’re either going to need to give ";
					if(pc.cockTotal() > 1) eventBuffer += "them ";
					else eventBuffer += "it ";
					eventBuffer += "some attention, or find a slippery girl in need of a good reaming soon.";
				}
				else eventBuffer += " You give yourself a comforting squeeze and move on, revelling in the sensuous warmth that infuses you.";

			}
		}
		else if(treatedHours == 14)
		{
			eventBuffer += "\n\nYou frown. It’s already been the better part of a day and you’re no closer to being a ";
			if(pc.hasCock()) eventBuffer += "hung bull";
			else eventBuffer += "chiseled adonis";
			eventBuffer += " than you were back when you took the Treatment.";
			if(pc.hasCock()) 
			{
				eventBuffer += " Is it too much to ask for your " + pc.cocksDescript() + " to swell up huge and hard when you want it to? You’re fucking horny, and ";
				if(pc.biggestCockLength() >= 12) eventBuffer += "though " + pc.eachCock() + " is already huge, you could be bigger! Imagine the gaped holes you’d leave behind!";
				else eventBuffer += "you’re not even ready to properly gape any cunts yet.";
			}
			eventBuffer += " Growling, you scratch your crotch and sigh.";
			pc.lust(5);
		}
		else if(treatedHours == 16)
		{
			eventBuffer += "\n\nYou decide to do a few pushups out of the blue. Despite your mind telling you that they should be a piece of cake, they’re way harder than your brain expected. You muscle through them anyhow, building up a sheen of sweat in the process. In the aftermath of the activity, you reflect on just how satisfying that felt. In its own way, it was almost as good as sex.";
			eventBuffer += "\n\nOf course, nothing would feel as right a solid, bed-breaking fuck right about now.";
			pc.lust(6);
		}
		else if(treatedHours == 18)
		{
			eventBuffer += "\n\nYou spend a few minutes looking at yourself in the screen of your Codex and wonder if there’s anything you should change or do differently. A little grooming would go a long way towards making the ladies’ panties damp and clingy. Unbidden, a perfectly realized vision of a pair of white, cottony ones comes to mind, perfectly molded to a very aroused looking slit. You lick your lips and dismiss the image. You’re sure you’ll see that sort of thing plenty soon enough.";
			pc.lust(8);
		}
		else if(treatedHours == 20)
		{
			eventBuffer += "\n\nSomething occurs to you. You’re getting more confident. You’re sure of it. If you walked into a bar on the wrong planet, you’d look everyone you met in the eye without thinking twice about it. Best case scenario, you’d pick yourself up a punky honey. Worst case scenario, you get to lay out a few toughs.";
			eventBuffer += "\n\n...You hope that muscle growth starts before you wind up getting yourself in over your head.";
		}
		else if(treatedHours == 22)
		{
			eventBuffer += "\n\nIn a slow moment, you let yourself daydream, imagining just how things will be once you knock some sense into your cousin and claim your birthright. You’ll have a grand capital ship, staffed with the buxom women of all colors and species. [rival.name] will be there, handing out towels on the nude pool deck, forbidden from touching any of your girls. When you aren’t relaxing, you’ll sit in your captain’s chair, signing important documents while the girls tend to the needs";
			if(pc.legCount > 1) eventBuffer += " between your [pc.legs].";
			else eventBuffer += " of your sex.";
			eventBuffer += "\n\nThere’s nothing wrong with a little daydreaming, after all.";
			pc.lust(25);
		}
		else if(treatedHours == 24)
		{
			eventBuffer += "\n\nOne day under the Treatment, and you’re already finding yourself imagining every woman you see with bigger, milkier, pregnant boobs. It’s hard not to, really. They’ve got all these organs whose sole purpose is to be filled with life, and their bodies get so sexy from it. It’s almost like it’s your duty to seed as many as possible. And in another day or two, you’ll probably be big and strong enough that they’ll just throw themselves into your arms. That easy grin comes back to your face, and you don’t expect it to ever leave.";
			pc.lust(10);
		}
		else if(treatedHours == 26)
		{
			eventBuffer += "\n\nYou crack your neck and roll your shoulders. There’s a lot to get done, and you’re the only " + pc.mf("guy","gal") + " that can do it. If you can manage to get your dick taken care of in the process, more power to you.";
			pc.lust(2);
		}
		else if(treatedHours == 28)
		{
			eventBuffer += "\n\nYou grunt while looking at your Codex. When did you put such a cruddy color scheme on this thing? It looks like something a kid would have on their computer, not the type of thing you’d put on a serious business machine with a surprising amount of processing power. You click through the settings and pick a scheme that befits the serious nature of your quest. Now, back to work.";
		}
		else if(treatedHours == 30)
		{
			eventBuffer += "\n\nStars above, there is a serious ";
			if(pc.hasCock())
			{
				if(pc.isCrotchGarbed()) eventBuffer += "tightness in your [pc.lowerGarment]. You take a look inside and find yourself more hard than you’ve been in a while, and just dribbling pre-cum all over the inside of your equipment. You let it snap closed and sigh. Either you’ve got to find a partner fast, or it’s time to vent some of the pressure building in your " + pc.ballsDescript() + ". One way or the other, you’re due to blow a load.";
				else 
				{
					eventBuffer += "hardness in your groin. You take a look down and find yourself more hard than you’ve been in a while, dribbling pre-cum down your length";
					if(pc.cockTotal() > 1) eventBuffer += "s";
					eventBuffer += ". Either it’s time to find a partner or time to jack off. Either way, you need to blow a load.";
				}
			}
			else eventBuffer += "ache of desire welling up within you. If only had a dick, you could just reach down and tug yourself to an easy, messy orgasm. Maybe you could even splatter a layer of baby-making cream across a cute slut’s face. She’d love it. As it is, you’re going to have to settle for getting off some other way - anything to burn through this lusty haze.";
			pc.lust(pc.lustMax());
		}
		else if(treatedHours == 32)
		{
			eventBuffer += "\n\nYou examine yourself and sigh, ticking through a mental list of the changes you’ve noticed so far. You’re a lot more confident. That’s a plus. And you’re hornier. A lot hornier. You can’t really doubt that now, even if your boosted libido feels as normal and right as fresh apple pie. You file that away as a plus too. The extra lust and the extra demands it places on you don’t distract you from what needs to be done as much as you thought they would. Also, you’re pretty sure you’re really starting to enjoy physical work. Just lifting a heavy weight up and down for an hour would be a pretty great way to spend an afternoon.";
			eventBuffer += "\n\nWhat about downsides? You rack your brain. Well, you’ve got to get off more for sure, but that’s not really a downside. You wouldn’t be able to keep a treated girl sated if you weren’t getting so randy. Is there anything else? You shake your head. Nothing is coming to mind. This Treatment is working out pretty great.";
			pc.lust(2);

		}
		else if(treatedHours == 34)
		{
			eventBuffer += "\n\nYou idly wonder how hard it would be to fit some gym equipment onto your ship so that you can stay in shape on the road. It’d be an entertaining diversion from the monotony of waiting for light drive to carry you to the next jump gate.";
			if(celiseIsCrew()) eventBuffer += " Celise could even service you while you go at it.";
			else eventBuffer += " Maybe you can find someone willing to service you while you go at it.";
		}
		else if(treatedHours == 36)
		{
			//Cock
			if(pc.hasCock())
			{
				eventBuffer += "\n\nYou growl in dissatisfaction. You can’t seem to quell the rioting heat in your loins or the way it keeps your " + pc.cocksDescript() + " so iron-hard with thoughts of near-constant sex. Even your [pc.nipples] are ";
				if(pc.hasDickNipples()) eventBuffer += "jutting out of their sheaths, ready to be thrust inside something";
				else if(pc.isLactating() || pc.hasFuckableNipples()) eventBuffer += "leaking";
				else if(pc.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FLAT || pc.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_INVERTED) eventBuffer += "hard";
				else if(pc.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES) eventBuffer += "pursed and drooling";
				else eventBuffer += "pebbly and sensitive";
				eventBuffer += ". You briefly consider forcing yourself upon the next person you meet but immediately discard the thought. Why would you stoop to something so... so... uncivilized when there’s plenty of willing partners out there?";
			}
			//Pussah
			else if(pc.hasVagina())
			{
				eventBuffer += "\n\nYou growl in dissatisfaction. You can’t seem to quell the rioting heat in your loins or the constant dripping. [pc.EachClit] is achingly hard, like a bullet on a hair-trigger. The weirdest part is that you don’t really crave penetration - at least not your own. No, you want to push yourself against someone soft and yielding, really grind your weeping slit";
				if(pc.totalVaginas() > 1) eventBuffer += "s";
				eventBuffer += " against them until you’re both covered in sweat and sexual effluvia, panting breathily with you on top.";
			}
			//Nothing
			else
			{
				eventBuffer += "\n\nYou growl in dissatisfaction. You can’t seem to quell the feeling of building eroticism or odd desires. Playing with your [pc.asshole] or [pc.nipples] just won’t be enough for you anymore. You want to <i>penetrate</i>, not be penetrated. If only had a dick, this would be so much easier... a nice, hard, throbbing prick to bury into your partners. You look at your fingers and smile. They’re no cock, but you bet you can make some cutie howl in delight if you use them right.";
			}
			//Merge
			eventBuffer += "\n\nBesides, the real takeaway is just how hot and horny you’re able to get without going off. You’re able to sit there fantasizing about a beauty so busty that her milk-stained top is about to tear off her tits well past the point where you’d have to masturbate before. You suppose you’re getting better at it - being aroused that is. You could walk around ";
			if(pc.hasCock()) eventBuffer += "with a pant-straining stiffy for hours";
			else if(pc.hasVagina()) eventBuffer += "with soaked panties";
			else eventBuffer += "with overwhelming desire";
			eventBuffer += " and still wait a few hours to find just the right playmate. It must be an effect of the treatment, turning you into some combination of a rutting bull and sexual god. Either seems fine.";
			//Inhuman Desire +20 max lust.
			if(!pc.hasPerk("Inhuman Desire"))
			{
				eventBuffer += "\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 20.)";
				pc.createPerk("Inhuman Desire",20,0,0,0,"Increases maximum lust by 20.");
			}
			else
			{
				eventBuffer += "\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)";
				pc.addPerkValue("Inhuman Desire",1,20);
				pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			}
			pc.lust(20);

		}
		else if(treatedHours == 38)
		{
			eventBuffer += "\n\nYou crack your knuckles a few times, admiring the rich sound, powerful sound it makes. You can’t be far from getting your real rewards for taking the Treatment - muscles";
			if(pc.hasCock()) eventBuffer += ", a bigger dick";
			if(pc.balls > 1) eventBuffer += ", bigger balls";
			eventBuffer += ", potent pheromones, and badass horns. A cocky smile graces your features. This should be fun.";
		}
		else if(treatedHours == 42)
		{
			eventBuffer += "\n\nThere’s little doubt that your preferences have been changing these past two days, but you decide to really put things to the test by using your Codex to access some of the more... sexual sites on the extranet. You don’t really do so with the intention of masturbating. It’s just idle curiosity over how your tastes are changing.";
			eventBuffer += "\n\nYou browse through the categories one by one, starting with things like galotian oil-porn and ausars in heat, then working your way across the xxx-rated mélange into ultraporn, the realm of gene-modded sexual parodies. The things you liked before are all still pretty awesome, but it’s like someone went and turned things like lactation, cow-girls, and pregnancy into the universe’s fetishes. Seeing a leaky tit onscreen makes your mouth water.";
			eventBuffer += "\n\nHell, even squirting orgasms look way more exciting that before. Your tongue feels chapped and dry, and you have the distinct desire to ram it into the gushing onscreen hole.";
			pc.lust(13);
		}
		else if(treatedHours == 44)
		{
			//Cocks
			if(pc.hasCock())
			{
				eventBuffer += "\n\nYou find yourself just kind of idly rubbing at " + pc.oneCock() + " whenever you have a spare moment. At first, you’d stop yourself whenever it happened, but more and more, you don’t see the logic in stopping. It feels really good to have a little friction on your length, and if it keeps your body churning up a fresh load faster, who are you to complain? Your ";
				if(pc.hasVirginCock()) eventBuffer += "next";
				else eventBuffer += "first";
				eventBuffer += " lay is going to thank you for being so ready for her, you’re sure of it.";
				eventBuffer += "\n\nIt doesn’t even distract you that much, really. Dealing with arousal is an automatic thing for you now. Pre-soaked undies? You’re pretty sure you’d have no problem ignoring the sticky, moist feeling. Adjusting the fit of clothing to deal with your rigid length? Your hand is there anyway. It might as well keep you comfortable. And you can still sit there browsing the extranet with your other hand, or buying supplies... or grabbing a tit. Whatever really.";
				eventBuffer += "\n\nThe important takeaway is that you’re so much better at being rock-hard than ever before. Before, when you were less awesome, you might’ve been desperate to climax, masturbating furiously. Now? You’ve learned to control it, to ride the tide of sexual desire like a cowboy on his steed. It’s empowering.";
			}
			//Cooches!
			else if(pc.hasVagina())
			{
				eventBuffer += "\n\nYou find yourself just kind of idly rubbing at [pc.oneClit] whenever you have a spare moment. At first, you’d stop yourself and blush, but more and more, you don’t see the logic in stopping. Your clit is there. It’s hard and wants touched. So you touch it. What’s the big deal? You aren’t masturbating, just keeping yourself ready is all. Why, everyone should be pleased that you’re keeping yourself so sexually ready all the time. Your lucky ";
				if(pc.hasVirginCock()) eventBuffer += "first";
				else eventBuffer += "next";
				eventBuffer += " partner will be the one to reap the rewards of slippery-sweet sex, after all.";
				eventBuffer += "\n\nYou don’t even really get distracted by it that much, really. The arousal burns like a pleasant heat in the back of your brain, spiking whenever your digits probe a particularly sensitive bundle of nerves, leaving the rest of your mind to do whatever mundane work it needs to do. You could probably file your taxes while a cute little faux-cow boy-toy kneels";
				if(pc.legCount > 1) eventBuffer += " between your [pc.legOrLegs]";
				else eventBuffer += " at your crotch";
				eventBuffer += ", putting a nice, wide bovine tongue to use, provided you had breaks for mind-shattering orgasms every now and again.";
				eventBuffer += "\n\nThe important takeaway is that you’re fucking amazing at being aroused now. Stimulation that would’ve morphed you into a mewling ball only makes you hotter and more capable of pleasure. It’ll take so much more teasing to bring you to the brink than ever before, but that just means you get to have bigger orgasms when you do. It’s win-win.";
			}
			//No Cooch!
			else
			{
				eventBuffer += "\n\nYou find yourself just kind of oddly clenching and unclenching your [pc.asshole]. Whenever you do, pleasant flashes of desire run through your body, slithering up your spine to wrap your brain in their sensuous warmth. Before taking the treatment, you’d be so turned on that you would probably be down on the ground, trying to stuff four fingers inside yourself. Now you can ride the arousal like your own personal steed, directing it but never denying it.";
				eventBuffer += "\n\nYou can only theorize that your brain is getting better and better at dealing with pleasure. The Treatment is making you more capable than ever before, even without normal genitalia. Why would anyone ever refuse such a gift?";
			}
			//All:
			//Inhuman Desire++
			//Inhuman Desire upgrade to +40.
			eventBuffer += "\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)";
			pc.addPerkValue("Inhuman Desire",1,20);
			pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			pc.lust(13);

		}
		else if(treatedHours == 46)
		{
			eventBuffer += "\n\nYou catch yourself using fewer and fewer words to communicate as the days go by, not because using them is hard or anything, but because they seem pointless. Can’t they see how you feel from the set of your jaw or the tenseness of your shoulders? Can’t they read arousal in the flush of your [pc.skin] or the smell of your pheromones? There’s no point getting fancy with it when you can just state what you mean plainly and simply.";
			eventBuffer += "\n\nAll the big words are just a distraction.";
			//Brute Speech Unlock!
			eventBuffer += "\n\n(<b>Gained Perk: Brute Speech</b> - You will now sound like more like a reticent brute in scenes that support it.)";
			pc.createPerk("Brute Speech",0,0,0,0,"Alters dialogue in certain scenes.");

		}
		else if(treatedHours == 48)
		{
			eventBuffer += "\n\nYou check your Codex’s chrono. It’s been 48 hours since your Treatment injection. That wasn’t that bad. You had worried that it would change who you were on the inside, but that didn’t happen, did it? You’re bigger, more confident, and ready to do some exercise as your muscles swell. And you’re hornier too, of course, but that goes without saying.";
			if(pc.hasCock())
			{
				eventBuffer += " You could probably break a board in half with your dick";
				if(pc.cockTotal() > 1) eventBuffer += "s; they're that hard.";
				else eventBuffer += "; it’s that hard.";
			}
			eventBuffer += " Underneath your more terse exterior and desire to fuck a big-boobed submissive, you’re still the same [pc.name] Steele.";
			eventBuffer += "\n\nA better [pc.name] Steele.";
		}
		//Bigger Balls (egg to apple sized)
		//INCREASE BALLS TO 9.4 - 12.5 ballSize() = Almost 3" to almost 4" diameter
		if(pc.balls > 0 && !pc.hasStatusEffect("Ballgrow Done Notice") && (treatedHours == 49 || treatedHours == 80 || treatedHours == 90 || treatedHours == 110 || treatedHours == 130 || treatedHours == 150))
		{
			//Goodbye trap pouch
			if(pc.hasStatusEffect("Uniball"))
			{
				eventBuffer += "\n\nYou manage to make your swaying sack smack against your [pc.thigh] in the most painful way. It almost doubles you over. How could that have happened? You had such a tight, compact pouch for your " + pc.ballsDescript() + ". Once the pain clears, you grab hold of yourself and sigh. Your almost vacuum-tight pouch is gone. In its place you’ve got a very normal, masculine-looking nutsack.";
				pc.removeStatusEffect("Uniball");
				//Remove pouch
				//pc.lust(-10);
				pc.lust(-10);
			}
			//Hit max - notify and disable ball TFs till treatedment is over
			else if(pc.ballSizeRaw >= pc.statusEffectv4("Treated"))
			{
				eventBuffer += "\n\nA fateful tingle runs from one side of your [pc.sack] to the other, drawing your attention to the " + pc.ballsDescript() + " within. They don’t look to have gotten any bigger this time. In fact, they’re probably done growing now. Well, ";
				if(pc.balls == 1) eventBuffer += "it’s";
				else eventBuffer += "they’re";
				eventBuffer += " at least as big as ";
				if(pc.ballDiameter() >= 3) {
					if(pc.balls == 1) eventBuffer += "an apple";
					else eventBuffer += "apples";
				}
				else
				{
					if(pc.balls == 1) eventBuffer += "a large egg";
					else eventBuffer += "large eggs";
				}
				eventBuffer += " now. You’ll just have to get used to walking with a little bit more swinging down there.";
				pc.createStatusEffect("Ballgrow Done Notice",0,0,0,0,true,"","",false,10080);
			}
			//Up to 3
			else if(pc.ballSizeRaw < 3)
			{
				eventBuffer += "\n\nYou feel a sort of effervescent heat pooling down in your loins, all warm and bubbly, like champagne inside you. It’s most concentrated in your " + pc.ballsDescript() + ", which you are very aware of pressing on the [pc.skinFurScales] of your [pc.thighs] through your [pc.sack].";
				if(pc.isCrotchGarbed()) eventBuffer += " You yank open your [pc.lowerGarment] for a look.";
				if(pc.balls == 1) eventBuffer += " It’s";
				else eventBuffer += " They’re";
				eventBuffer += "... bigger than before. Bigger by a pretty good margin. You’ve got ";
				if(pc.balls == 1) eventBuffer += "a ";
				eventBuffer += "pretty decent-sized nut";
				if(pc.balls > 1) eventBuffer += "s";
				eventBuffer += " now. You roll ";
				if(pc.balls == 1) eventBuffer += "it ";
				else eventBuffer += "them ";
				eventBuffer += "in your palm, imagining the sheer virility contained within. From what you read, this is only the beginning. ";
				if(pc.balls == 1) eventBuffer += "It";
				else eventBuffer += "They";
				eventBuffer += " won’t be done growing just yet.";
				pc.ballSizeRaw = 3;
			}
			//To 5
			else if(pc.ballSizeRaw < 5)
			{
				eventBuffer += "\n\nA pleasant, swaying weightiness accompanies your every stride, a potent reminder of your masculinity just a few inches below your crotch. And you think it’s getting heavier. Pausing with a grin the size of old Texas on your face, you reach down and cradle your " + pc.ballsDescript() + ". ";
				if(pc.balls == 1) eventBuffer += "It’s ";
				else eventBuffer += "They’re ";
				eventBuffer += "warm and so pleasantly sensitive. You can almost swear you feel ";
				if(pc.balls == 1) eventBuffer += "it";
				else eventBuffer += "them";
				eventBuffer += " puffing up and expanding in order to hold even bigger, juicier loads.";
				pc.ballSizeRaw = 5;
			}
			//To 7
			else if(pc.ballSizeRaw < 7)
			{
				eventBuffer += "\n\nAs you move about, you become very aware of a certain extra size in your crotch, pressing against your [pc.thighs] whenever you step too hastily. The sensation isn’t entirely unpleasant, as a matter of fact, the swaying feels kind of pleasant. Still, you stop to investigate, if for no other reason than to have a sense of just how big your growing cum-factor";
				if(pc.balls == 1) eventBuffer += "y is";
				else eventBuffer += "ies are";
				eventBuffer += " getting on the Treatment.";
				if(pc.isCrotchGarbed()) eventBuffer += " You just have to pull your [pc.lowerGarments] open first. You don’t even bother to see if anyone is looking.";
				if(pc.balls == 1) eventBuffer += " It’s";
				else eventBuffer += " They’re";
				eventBuffer += " definitely bigger - over two inches across now for sure.";
				if(pc.balls == 1) eventBuffer += "\n\nA nut";
				else eventBuffer += "\n\nNuts";
				eventBuffer += " like ";
				if(pc.balls == 1) eventBuffer += "this";
				else eventBuffer += "these";
				eventBuffer += " might fit in with some of the most well-endowed terran naturals, but ";
				if(pc.balls == 1) eventBuffer += "it";
				else eventBuffer += "they";
				eventBuffer += "’d also look right at home on a large farm animal. You give yourself a comforting squeeze, hoping to encourage more growth.";
				pc.ballSizeRaw = 7;
			}
			//To 9
			else if(pc.ballSizeRaw < 9)
			{
				eventBuffer += "\n\nThe sensation of heat and warmth throbbing through your " + pc.ballsDescript() + " is increasingly common, hour to hour, as ";
				if(pc.balls == 1) eventBuffer += "it";
				else eventBuffer += "they";
				eventBuffer += " swell";
				if(pc.balls == 1) eventBuffer += "s";
				eventBuffer += " up with ever-greater amounts of virility. Why, you’re pretty sure ";
				if(pc.balls == 1) eventBuffer += "it’s";
				else eventBuffer += "they’re";
				eventBuffer += " closing in on three inches across at the moment, to say nothing of ";
				if(pc.balls == 1) eventBuffer += "its";
				else eventBuffer += "their";
				eventBuffer += " burgeoning circumference. What’s more important is of course the result of all that growing - all the spunk you’re churning up in ";
				if(pc.balls > 1) eventBuffer += "those cum factories";
				else eventBuffer += "that cum factory";
				eventBuffer += ", brewing up nice and thick for a randy twat.";
				pc.ballSizeRaw = 9;
			}
			//To 11
			else if(pc.ballSizeRaw < 11)
			{
				//Multinutt
				if(pc.balls > 1)
				{
					eventBuffer += "\n\nYou heft your expanding [pc.sack] in one hand, barely able to contain the orbs that practically glow with warmth. They’re bigger now, unsurprisingly. The best part is just how good they feel, rolling around in your palm, pressed against one another. It’s enough to draw a pleased sigh from your normally reserved throat. They’re probably each three and a half inches wide or more. You probably cum like a racehorse now. Heck, you probably cum harder and longer. Your nuts give an appreciative wobble of agreement. You ought to give these guys a try once you’ve made sure they’re totally full.";
				}
				//Singlenutt
				else eventBuffer += "\n\nYou heft your expanding [pc.sack] in one hand, feeling it fill your palm. It practically glows with its own, inner warmth. It’s bigger now, too. The best part is just how good it feels, rolling around in your palm, pressed against your fingers. It’s enough to draw a pleased sigh from your normally reserved throat. It’s probably each three and a half inches wide or more. You probably cum like a racehorse now. Heck, you probably cum harder and longer. Your nut gives an appreciative wobble of agreement. You ought to give this guy a try once you’ve made sure he’s totally full.";
				pc.ballSizeRaw = 11;
			}
			//To 12.5
			else if(pc.ballSizeRaw < 12.5)
			{
				//Multi
				if(pc.balls > 1)
				{
					eventBuffer += "\n\nThere’s no hiding the way your [pc.sack] sways about, certainly not now that the Treatment has blown up your nuts like balloons, only these are filled with the weight of virile, cum-pumping flesh. They’re on the edge of four inches wide - as big as apples - and sensitive to boot. It’s like the bigger they get, the more sensitive they’re becoming, but that can’t be right. Can it?\n\nGrunting, you decide it doesn’t really matter one way or the other. If you’re able to get off from a honey slowly fondling and licking the things, what do the hows and whys matter? Grinning now, you wonder if you’ll be able to get someone to give them a nice, long tongue-bath. You could sit there and look down a busily bobbing head as you’re brought to the peak, then watch your [pc.cum] rain down over her hair. As big as you are, you’ll probably paint her [pc.cumColor].\n\nThere’s no getting around it. <b>You have big, Treatment-bloated balls as big as any bull is likely to get without a crazy mutation occurring.</b>";
				}
				//Single
				else eventBuffer += "\n\nThere’s no hiding the way your [pc.sack] sways about, certainly not now that the Treatment has blown up your nut like a balloon, only this one is filled with the weight of virile, cum-pumping flesh. It’s on the edge of four inches wide - as big as an apple - and sensitive to boot. It’s like the bigger it gets, the more sensitive it’s becoming, but that can’t be right. Can it?\n\nGrunting, you decide it doesn’t really matter one way or the other. If you’re able to get off from a honey slowly fondling and licking the thing, what do the hows and whys matter? Grinning now, you wonder if you’ll be able to get someone to give you a nice, long tongue-bath. You could sit there and look down a busily bobbing head as you’re brought to the peak, then watch your [pc.cum] rain down over her hair. As big as you are, you’ll probably paint her [pc.cumColor].\n\nThere’s no getting around it. <b>You have a big, Treatment-bloated ball as big as any bull is likely to get without a crazy mutation occurring.</b>";
				pc.ballSizeRaw = 12.5;
			}
		}
		//Taller
		//If shorter than 8’, grow 1-3” per day.
		if(pc.tallness < 96 && (treatedHours == 72 || treatedHours == 96 || treatedHours == 120 || treatedHours == 144 || treatedHours == 168))
		{
			pc.tallness += 1 + rand(3);
			//first time only
			if(!pc.hasStatusEffect("Treatment Height Boosted"))
			{
				pc.createStatusEffect("Treatment Height Boosted",0,0,0,0,true,"","",false,10080);
				eventBuffer += "\n\nA kind of all-over ache has been bothering you off and on all day. It’s a deep pain, below the skin and muscles; you figure it’s your very bones. You were expecting to get taller. This must be what they mean by ‘growing pains’. A quick measurement confirms it. You’re [pc.height] tall now.";
			}
			//Less than 6’
			else if(pc.tallness < 72)
			{
				//Below 5’5”? Add +3”
				if(pc.tallness < 65) pc.tallness += 3;
				//1
				if(rand(2) == 0) eventBuffer += "\n\nThe ground seems a little further away than before. At first, you think it’s your head playing tricks on you, but when you whack your head on something that you should have passed harmlessly underneath, you have to admit it. You’re getting taller. Pretty soon, nobody is going to call you short!";
				//2
				else eventBuffer += "\n\nYou stop to measure yourself with a cocky smile. There’s nothing like getting bigger and stronger to make you feel like a million creds. The Codex beeps, informing you that you’re [pc.height] tall. Now that’s more like it!";
			}
			//Less than 7’
			else if(pc.tallness < 84)
			{
				//1
				if(rand(3) == 0) eventBuffer += "\n\nYour back abruptly pops. It doesn’t hurt or anything, but you twist and stretch to limber up, feeling it pop a few more times in different places. The ever-present dull ache of growing bones underlies it all, promising that you’re still getting bigger and taller. Right now, you’re [pc.height] tall.";
				//2
				else if(rand(2) == 0) eventBuffer += "\n\nThings that used to pass right on by your head are getting closer and closer these days. Sometimes you even have to duck to avoid them. The ground seems farther away with every passing minute, a constant reminder of your Treatment-enhanced physique.";
				//3
				else eventBuffer += "\n\nYou snap out the Codex for a quick check on your amplified tallness. It beeps, displaying your new height on screen. You’re [pc.height] tall now. If this keeps up, you’re going to wind up taller than most normal terrans. And New Texans? Well... maybe you’ll catch up to the taller bulls.";
			}
			//Less than 7’6”
			else if(pc.tallness < 90)
			{
				//1
				if(rand(3) == 0) 
				{
					eventBuffer += "\n\nYou’re definitely still growing in spite of being well past the seven foot threshold. You could pass for average on New Texas right now, if you wanted to stick around there. Elsewhere, you must look awful tall.";
					if(CodexManager.entryUnlocked("Raskvel")) eventBuffer += " Heck, the raskvel on Tarkus will probably think you a giant.";
				}
				//2
				else if(rand(2) == 0) eventBuffer += "\n\nYou stretch your arms out high over your head and arch your back, working your sore joints. It’s one thing to revel in your added stature. It’s quite another to suffer from the constant aches and pains that come with your expanding physique. You do a quick measurement. You’re [pc.height] tall now.";
				//3
				else eventBuffer += "\n\nYour smile broadens while you look around. Your viewpoint is still rising, slowly but surely. Though it isn’t fast enough to be truly perceptible, you still find yourself taking note of your increasing height every few hours. Right now, you’re up to [pc.height] tall.";
			}
			//Less than 8”
			else
			{
				//1
				if(rand(3) == 0) eventBuffer += "\n\nThere’s no hiding the way the Treatment is changing you. You’re definitely taller than you were yesterday - at least an inch, maybe more. With your augmented stature comes a boost to confidence; nobody is going to mess with a huge " + pc.mf("guy","gal") + " like you.";
				//2
				else if(rand(2) == 0) eventBuffer += "\n\nMore and more, you have to duck to keep from whacking your head of objects of all shapes and sizes. It’s quite onerous to always have to duck and cower all the time, but at least everyone is always looking up to you. You’re [pc.height] tall now.";
			}
			//It’s over - hit dat cap or day 6.5
			if(treatedHours == 168 || pc.tallness >= 96)
			{
				eventBuffer += "\n\nThe familiar, dull ache to which you have grown accustomed diminishes moment by moment. You frown when it vanishes entirely; the Treatment won’t be making you any taller. You’ll have to settle for being [pc.height] tall.";
			}
		}
		//Muscle Gain
		//+slowStatGain physique
		if(pc.tone < 100 && (treatedHours == 55 || treatedHours == 74 || treatedHours == 85 || treatedHours == 93 || treatedHours == 115 || treatedHours == 135))
		{
			pc.slowStatGain("physique",1);
			//0 to 10 tone
			if(pc.tone < 10)
			{
				eventBuffer += "\n\nYou flex one of your arms and smile when you see a little muscle there. It isn’t much, but it’s a start. In fact... you drop to the ground and do a few push-ups, just to get your blood flowing.";
				pc.tone = 10;
			}
			//10 to 20
			else if(pc.tone < 20)
			{
				eventBuffer += "\n\nYour arms, chest... all of you, really.... You’re looking a little less squeezably soft. Of course, you’re still a long way from well-defined muscles, but you’re not quite the creampuff you used to be either.";
				pc.tone = 20;
			}
			//20 - 30
			else if(pc.tone < 30)
			{
				eventBuffer += "\n\nYou feel... solid. On a whim, you do a couple push-ups and crunches, just to see how many you can do. They almost get easier the more you do them, but that can’t be right... can it? Whatever. You’re finally starting to fill out and pack on some muscle.";
				pc.tone = 30;
			}
			//30 - 40
			else if(pc.tone < 40)
			{
				eventBuffer += "\n\nYou’re tightening up in some places and swelling up in others, even if your overall broadness remains unchanged. Still, you no longer look like a soft, easy target. You’re starting to show a little muscle in places without flexing, but not much yet. You comfort yourself with the knowledge that a few hours racking weights ought to finish the job.";
				pc.tone = 40;
			}
			//40 - 50
			else if(pc.tone < 50)
			{
				eventBuffer += "\n\nYou go ahead and flex one more time, just for fun. There’s something delightful about watching your form swell with latent power. You could probably do a few pull-ups without breaking a sweat if you had a bar around.";
				pc.tone = 50;
			}
			//50 - 60
			else if(pc.tone < 60)
			{
				eventBuffer += "\n\nYou admire yourself in your Codex’s screen. The body of the " + pc.mf("guy","girl") + " in the screen is starting to look pretty good. Muscles are making themselves known all over. If you keep it up, you might even get a pretty nice looking six pack.";
				pc.tone = 60;
			}
			//60 - 70
			else if(pc.tone < 70)
			{
				eventBuffer += "\n\nYou pick up a rock and toss it around, anything to keep your hands busy and blow off some of this excess energy. No matter how active you are, you always seem to have more fuel in your tank, and despite the glistening sheen of sweat that you break out in, your expanding muscles don’t seem to mind in the slightest.";
				pc.tone = 70;
			}
			//70 - 80
			else if(pc.tone < 80)
			{
				eventBuffer += "\n\nEveryday tasks that once seemed exhausting or tiring are getting easier by the hour. Long walks? Piece of cake. Hefting some cargo? Not something a little elbow grease can’t take care of. You’re breaking out in muscle all over, and it feels good.";
				pc.tone = 80;
			}
			//80 - 90
			else if(pc.tone < 90)
			{
				eventBuffer += "\n\nYou do a few one-handed pushups, watching your muscles ripple under your [pc.skinFurScales] with a smile on your face. The physical exertion is calming. It helps you think and plan. When you stop, you’re covered in a light sheen of sweat that only makes your muscles stand out that much more clearly.";
				pc.tone = 90;
			}
			//90-100
			else
			{
				eventBuffer += "\n\nYou look at yourself in your Codex’s screen and marvel at the chiseled adonis looking back at you. There isn’t a single part of your body that doesn’t display the unbridled physical power you have lurking just under the surface. You can’t imagine getting any more muscular than you already are, but that’s fine. Chicks dig it.";
				pc.tone = 100;
			}
		}
		//Bigger Dick (+2 to 8 inches normally)
		//At least one expansion regardless of max. EVERYBODY gets a bigger dick.
		if(pc.hasCock() && pc.statusEffectv3("Treated") > 0 && (treatedHours == 51 || treatedHours == 60 || treatedHours == 66 || treatedHours == 83 || treatedHours == 100 || treatedHours == 125))
		{
			//Cock Bonus 0-2
			//pc.setStatusValue("Treated",3,2 + rand(7));
			//First growth. Always 2”.
			if(treatedHours == 51)
			{
				//Pants on!
				if(pc.isCrotchGarbed())
				{
					eventBuffer += "\n\nYou feel a growing tightness in your [pc.lowerGarment] that’s anything but comfortable. It’s the kind of tightness that demands your attention - the kind that happens when you’re sporting a hard-on that could chop wood. You shift your " + pc.cocksDescript() + " around a few times before giving up and pulling ";
					if(pc.cockTotal() == 1) eventBuffer += "it";
					else eventBuffer += "them";
					eventBuffer += " out.";
					eventBuffer += "\n\nAs expected, you’re as rigid as a titanium girder, but that doesn’t entirely explain your predicament. You’re longer too, by at least an inch, and proportionally thicker. In disbelief over your good fortune, you slowly stroke " + pc.oneCock() + ", feeling it firm and plump up even bigger in your palm. The " + pc.cockHead() + " slips past your fingers and abruptly ejaculates, growing all the while. You furiously beat your meat throughout, not stopping until you’re standing in a puddle of your own goo";
					if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) eventBuffer += " and trying to play it off nonchalantly. Hopefully noone will care";
					eventBuffer += ".";
					
					eventBuffer += "\n\nYour prong";
					if(pc.cockTotal() > 1) eventBuffer += "s are";
					else eventBuffer += " is";
					eventBuffer += " at least two inches longer than before you took the Treatment and likely to get even bigger before it’s all over. You’ll just have to be careful that your " + pc.cocksDescript() + " don’t rip your [pc.lowerGarments] off the next time you get hard.";
				}
				//Pants Off!
				else
				{
					eventBuffer += "\n\nYour " + pc.cocksDescript() + " ";
					if(pc.cockTotal() == 1) eventBuffer += "is";
					else eventBuffer += "are";
					eventBuffer += " getting awfully uncomfortable all of a sudden. You grab " + pc.oneCock() + " and give it a little squeeze just to make sure everything is alright. It feels as hard as a titanium girder and somehow... tight. There’s not really any other word to describe it; it’s almost like your dick is getting too big for the " + pc.cocks[0].cockColor + " skin it’s wrapped in. You rub it a few times, just enjoying the friction while you’ve already got it in hand, feeling it thickening by the second.";
					eventBuffer += "\n\nWait, weren’t you already at full mast? You look down in awe, watching your " + pc.cockHead() + " slip through your fingers.";
					if(pc.hasSheath(0)) eventBuffer += " You swear you can even see the fresh length pouring out of your sheath, as if there’s just an infinite supply of dick down there to push out.";
					eventBuffer += " Bullets of pre roll across your knuckles as you squeeze them out, watching your dick";
					if(pc.cockTotal() > 1) eventBuffer += "s";
					eventBuffer += " lengthen the whole time.";

					eventBuffer += "\n\nYour heartbeat hammers at your eardrums faster and faster. Your breath comes quicker. You couldn’t stop yourself if you wanted to, and you don’t. You don’t ever want this moment to stop. You " + pc.cockHead() + " lurches, and you’re cumming, spraying a puddle of [pc.cum] all over the ground in front of you";
					if (InPublicSpace()) eventBuffer += " to the dismay of the onlookers";
					eventBuffer += ". Jacking for all you’re worth, you milk every drop from your growing dick. It isn’t until it’s all over that the magnitude of what just happened sinks in.";
					eventBuffer += "\n\nThe Treatment made your " + pc.cocksDescript() + " grow bigger - a full two inches bigger, by your measurements. It might not be done either. There’s still a pleasant, lingering tingle in your groin, and it’s not the normal post-orgasmic one.";
					if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC)) eventBuffer += " You should probably move on before someone takes issue with the lewd display.";
				}
				//orgasm, +2 dicklength for everybody across the board.
				pc.orgasm();
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 2;
					else pc.cocks[x].cLengthRaw += 3;
				}
				pc.addStatusValue("Treated",3,-2);
			}
			//Repeat 1
			else if(treatedHours == 60)
			{
				eventBuffer += "\n\nYou grin when you realize how heavy the swaying length";
				if(pc.cockTotal() > 1) eventBuffer += "s";
				if(pc.legCount > 1) eventBuffer += " between your [pc.legs]";
				else eventBuffer += " dangling from your crotch";
				if(pc.cockTotal() == 1) eventBuffer += " has";
				else eventBuffer += " have";
				eventBuffer += " become.";
				if(pc.isCrotchGarbed()) eventBuffer += " You yank open your [pc.lowerGarment] check it out.";
				else eventBuffer += " You figure a little self-examination won’t hurt.";
				eventBuffer += " Grabbing hold of " + pc.oneCock() + ", you decide that you’ll be sure not to get as excited as last time. Better to save the [pc.cumNoun] for someone who really wants it. Easy does it.";

				if(pc.lust() < 70) eventBuffer += "\n\nYou stroke cautiously until you reach your full size, then try to eyeball a measurement.";
				else eventBuffer += "\n\nYou stroke a few times just to make sure you’ve reached your full size, but as horny as you are, you probably didn’t even have to touch the thing.";
				eventBuffer += " Damn, it’s at least an inch longer.";
				if(pc.cockTotal() > 1) 
				{
					if(pc.cockTotal() == 2) eventBuffer += " The other one is bigger too";
					else eventBuffer += "The other ones are bigger too";
					eventBuffer += ", though growing faster to catch up to the main event.";
					eventBuffer += " You pump a few more times, savoring the warmth and heat that it brings to your body, then release yourself with a sigh.";
				}
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
					else pc.cocks[x].cLengthRaw += 2;
				}
				pc.addStatusValue("Treated",3,-1);
				pc.lust(5);
			}
			//Repeat 2
			else if(treatedHours == 66)
			{
				eventBuffer += "\n\nFuck yes, your " + pc.cocksDescript() + " ";
				if(pc.cockTotal() == 1) eventBuffer += "is";
				else eventBuffer += "are";
				eventBuffer += " still growing. There’s no way you were this big a few hours ago.";
				if(pc.isCrotchGarbed()) eventBuffer += " The bulge in your [pc.lowerGarments] is getting more and more noticeable, but that’s just fine, you figure. Maybe you’ll get to catch a girl giving it a look. The image of a blushing, nervous smile makes your " + pc.cocksDescript() + " jump.";
				else 
				{
					eventBuffer += " The dangling length";
					if(pc.cockTotal() > 1) eventBuffer += "s";
					eventBuffer += " of meat sway";
					if(pc.cockTotal() == 1) eventBuffer += "s";
					eventBuffer += " heavily with every step. You wonder if you’ll catch anyone checking you out during your travels. The thought of a few giggling cow-girls sneaking glances at your crotch as you walk has you doing a lot less dangling and a lot more jutting straight forward. You’ll have to be careful turning corners.";	
				}
				//+20 lust
				pc.lust(20);
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
					else pc.cocks[x].cLengthRaw += 2;
				}
				pc.addStatusValue("Treated",3,-1);
			}
			//Repeat 3
			else if(treatedHours == 83)
			{
				//Pants!
				if(pc.isCrotchGarbed())
				{
					eventBuffer += "\n\nYour can barely fit in your [pc.lowerGarments] anymore. Even soft, your " + pc.cocksDescript() + " ";
					if(pc.cockTotal() == 1) eventBuffer += "is";
					else eventBuffer += "are";
					eventBuffer += " straining against the equipped restraints, feeling trapped no matter how elastic ";
					if(pc.cockTotal() == 1) eventBuffer += "its";
					else eventBuffer += "their";
					eventBuffer += " confinement. It wouldn’t be so bad if you weren’t spending so much time turned on and ready to blow. You’ve gotta be at least an inch longer now";
					if(pc.cockTotal() == 2) eventBuffer += ", and your other wang is even longer, trying to catch up";
					else if(pc.cockTotal() > 2) eventBuffer += ", and your other wangs have grown even more, still trying to catch up";
					eventBuffer += ".";
				}
				//NoPantz
				else
				{
					eventBuffer += "\n\nYou can barely go ten minutes without having to stop and appreciate your expanding manhood";
					if(pc.cockTotal() > 1) eventBuffer += "s";
					eventBuffer += ". It’s one thing to read in clinical detail about how your penis might get bigger. It’s another to hold it in your hand, feeling it snake out to new lengths, surging on tides of artificially-created hormones and busy microsurgeons. A part of you wishes this could go on forever, even if it meant immobilizing yourself under the weight of your own phall";
					if(pc.cockTotal() > 1) eventBuffer += "i";
					else eventBuffer += "us";
					eventBuffer += ".";
					eventBuffer += "\n\nBy your estimate, you’re about an inch longer than you were at your last measurement";
					if(pc.cockTotal() == 2) eventBuffer += ", and your spare dick is catching up fast";
					else if(pc.cockTotal() > 2) eventBuffer += ", and your spare dicks are catching up fast";
					eventBuffer += ".";
				}
				//+10 lust
				pc.lust(10);
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
					else pc.cocks[x].cLengthRaw += 2;
				}
				pc.addStatusValue("Treated",3,-1);
			}
			//Repeat 4
			else if(treatedHours == 100)
			{
				eventBuffer += "\n\nYour " + pc.cocksDescript() + " surge";
				if(pc.cockTotal() == 1) eventBuffer += "s";
				eventBuffer += " forward out of the blue";
				if(pc.armor.shortName != "") eventBuffer += ", snaking down the inside of your [pc.armor]";
				else eventBuffer += ", threatening to tear your [pc.underGarment] from your frame";
				eventBuffer += ", gorging on ";
				if(pc.cockTotal() == 1) eventBuffer += "its";
				else eventBuffer += "their";
				eventBuffer += " own tumescent potential until you feel more dick than [pc.man]. There’s no resisting it. All you can do is ride the waves of bliss as you shoot [pc.cumVisc] ropes of [pc.cumNoun]";
				if(pc.isCrotchGarbed()) eventBuffer += " down the inside of your [pc.lowerGarment], moaning all the while.";
				else eventBuffer += " across the ground in front of you, moaning all the while.";
				eventBuffer += "\n\nWhen it’s all over, you realize that you’re at least an inch longer, maybe more.";
				//Cum!
				pc.orgasm();
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
					else pc.cocks[x].cLengthRaw += 2;
				}
				pc.addStatusValue("Treated",3,-1);
			}
			//Repeat 5
			else if(treatedHours == 125)
			{
				eventBuffer += "\n\nYou’re sure you’ve been growing all day, but you want more. Grabbing hold of " + pc.oneCock() + ", you sit there, idly tugging at it, enjoying the play of your elastic flesh as it lengthens in response to your ministrations. All the pulling has you hard in the span of a few minutes, rendering the tugging pretty pointless. Of course, you’re even bigger than the last time you took stock of yourself.";
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
					else pc.cocks[x].cLengthRaw += 2;
				}
				pc.addStatusValue("Treated",3,-1);
				eventBuffer += "\n\nYour " + pc.cockDescript(pc.biggestCockIndex()) + " is a proud " + num2Text(Math.round(pc.biggestCockLength())) + " inches now";
				if(pc.cockTotal() == 2) eventBuffer += ", and your other isn’t far behind";
				else if(pc.cockTotal() > 2) eventBuffer += ", and your others aren’t far behind";
				eventBuffer += ".";
				pc.lust(10);
			}
			//Repeat 6
			else
			{
				eventBuffer += "\n\nYour " + pc.cocksDescript() + " ";
				if(pc.cockTotal() == 1) eventBuffer += "is";
				else eventBuffer += "are";
				eventBuffer += " swinging wider and wider these days, a fact that warms your breast with no small amount of pride. Even now, without you bothering ";
				if(pc.cockTotal() == 1) eventBuffer += "it";
				else eventBuffer += "them";
				eventBuffer += ", you can feel the pleasant buzz of hormones marinating your dick";
				if(pc.cockTotal() > 1) eventBuffer += "s";
				eventBuffer += ", telling your cells to build inch after inch of new, cunt-filling dick. Speaking of gaining inches - you’ve probably added another. No matter how many times you discover your heightened manhood, it never gets old.";
				pc.lust(3);
				for(x = 0; x < pc.totalCocks(); x++)
				{
					if(x == pc.biggestCockIndex()) pc.cocks[x].cLengthRaw += 1;
					else pc.cocks[x].cLengthRaw += 2;
				}
				pc.addStatusValue("Treated",3,-1);
			}
			//It’s over!
			if(pc.statusEffectv3("Treated") <= 0)
			{
				eventBuffer += "The lingering tingle and buzz that has highlighted the constant expansion of your " + pc.cocksDescript() + " fades away. <b>Your manhood";
				if(pc.cockTotal() > 1) eventBuffer += "s";
				eventBuffer += " won’t be getting any bigger, at least not from the treatment.</b>";
			}
		}
		//Animal Dicks: Horse, Dog, Cat, maybe one with multiple type qualities
		//80% chance of animal type conversion. Of that 80%, 50% of the time it’s forced on all members.
		if(pc.hasCock() && treatedHours == 105 && rand(10) <= 7)
		{
			//Pick type to change to.
			var chosenDickType:int = rand(5);
			//Convert to proper values
			switch(chosenDickType)
			{
				case 0:
				case 1:
					chosenDickType = GLOBAL.TYPE_EQUINE;
					break;
				case 2:
				case 3:
					chosenDickType = GLOBAL.TYPE_CANINE;
					break;
				case 4:
					chosenDickType = GLOBAL.TYPE_FELINE;
					break;
			}
			var changeAllDicks:Boolean = false;
			
			//Points to the chosen cock.
			var targetDick:int = 0;

			//This will go true if everything is already the appropriate type.
			var unchanged:Boolean = false;

			//Set the dick that's getting TFed.
			if(pc.cockTotal() == 1) targetDick = 0;
			else
			{
				targetDick = -1;
				//Loop through
				for(x = 0; x < pc.cockTotal(); x++)
				{
					//First appropriate dick gets picked.
					if(targetDick == -1 && chosenDickType != pc.cocks[x].cType) targetDick = x;
					//Turn on alldickTF if more than 1 need 50% of the time.
					if(x != targetDick && targetDick >= 0 && chosenDickType != pc.cocks[x].cType && rand(2) == 0) changeAllDicks = true;
				}
				//If failed, set target to 0. Will get caught in cleanup and "unchanged" set to true to disable TF
				if(targetDick == -1) targetDick = 0;
			}
			//DISABLE IF EVERYTHING IS ALREADY THE RIGHT TYPE
			if(pc.cocks[targetDick].cType == chosenDickType) unchanged = true;
			if(!unchanged)
			{
				//Hoarse Cawk
				if(chosenDickType == GLOBAL.TYPE_EQUINE)
				{
					//Single cock transform!
					if(!changeAllDicks)
					{
						eventBuffer += "\n\nFeeling a little light-headed, you find yourself a seat just in time to notice ";
						if(!pc.hasSheath(targetDick))
						{
							eventBuffer += "an odd pinching feeling coming from your " + pc.cockDescript(targetDick) + ". Obviously concerned, you ";
							if(pc.isCrotchGarbed()) eventBuffer += "remove your [pc.lowerGarments] for a better look";
							else eventBuffer += "take a look";
							eventBuffer += ". Something weird is happening - right around the base, the " + pc.cocks[targetDick].cockColor + " skin is bunching up into folds";
							if(pc.cocks[targetDick].cockColor != "black") eventBuffer += " and darkening to an almost glossy black";
							eventBuffer += ". There’s little to no pain, but your prick does seem to be slowly vanishing into the thickly folded skin with every passing second. Never mind that it’s thickening as it withdraws, your cock is vanishing into some kind of musky-smelling sheath!\n\n";
						}
						else 
						{
							eventBuffer += "your " + pc.cockDescript(targetDick) + " vanishing entirely into your ";
							if(pc.cocks[targetDick].cockColor != "black") eventBuffer += "rapidly darkening ";
							eventBuffer += "sheath! ";
						}
						eventBuffer += "You probe the still-sensitive bundle of flesh with a fingertip and nearly moan in delight when you come in contact with a ";
						if(pc.cocks[targetDick].hasFlag(GLOBAL.FLAG_BLUNT)) eventBuffer += "newly-";
						eventBuffer += "blunted and extraordinarily sensitive head. The ";
						var tempColor:String = "mottled";
						if(rand(2) == 0) tempColor = "black";
						eventBuffer += tempColor + " length reacts by lurching out, surging into your fingers like an animal seeking attention, and it feels too good not to indulge it. You wrap your hand around the equine length and stroke, feeling it expand in the palm of your hand.";
						var nubbed:Boolean = false;
						if(rand(4) == 0) nubbed = true;
						if(nubbed) eventBuffer += " Sensitive nubs cover the whole of it, but you don’t have time to consider the strange mutation or how good it feels.";
						eventBuffer += " Droplets of your [pc.cum] roll out of your flaring head one after another, filling the air with the telltale scent of your own ecstasy.";

						eventBuffer += "\n\nLooking down, you realize you’re holding a rigid, cum-drooling horse-cock that’s bigger than your old dick ever was in your hand and cum, finally shooting the long lances of [pc.cumNoun] that you’ve felt coming since your oddly powerful erection.";
						var knotted:Boolean = false;
						if(rand(4) == 0) knotted = true;
						if(knotted) eventBuffer += " Each spurt comes bigger and thicker than the one behind it, and when your hand slides down to squeeze a newly-formed, canine knot, your mind buckles.";
						eventBuffer += " You fall back, splattering yourself with your [pc.cumColor] love again and again. Your cockhead has flared cartoonishly wide; you battle with an urge to whinny in delight as the eruptions coat your [pc.chest].";
						eventBuffer += "\n\nThe orgasm does eventually end, leaving a residual euphoria and a thorough layer of [pc.cum] in its wake.";
						if(knotted) eventBuffer += " The knot doesn’t shrink down for at least five minutes after. Had you been balls-deep in a bitch, she would’ve had to sit there and let you fill her.";
						eventBuffer += " <b>You’ll need to get used to having a ";
						if(knotted) eventBuffer += "knotted ";
						if(knotted && nubbed) eventBuffer += "and ";
						if(nubbed) eventBuffer += "nubby ";
						eventBuffer += "horse-cock.</b>";

						//+5 inches. increase cum volume and such slightly.
						pc.cocks[targetDick].cLength(5);
						pc.shiftCock(targetDick, chosenDickType);
						if(tempColor != "mottled")
						{
							if(rand(2) == 0) pc.cocks[targetDick].cockColor = "black";
							else pc.cocks[targetDick].cockColor = "pink";
						}
						else pc.cocks[targetDick].cockColor = "mottled pink and black";
						if(knotted) 
						{
							pc.cocks[targetDick].addFlag(GLOBAL.FLAG_KNOTTED);
							pc.cocks[targetDick].knotMultiplier = 1.5;
						}
						if(nubbed) pc.cocks[targetDick].addFlag(GLOBAL.FLAG_NUBBY);
						//Cum
						pc.orgasm();
						pc.boostCum(3);
					}
					//Dubstep+ cawk transform!
					else
					{
						eventBuffer += "\n\nFeeling more than a little light-headed, you drop to the ground before your [pc.legOrLegs] do";
						if(pc.legCount == 1) eventBuffer += "es";
						eventBuffer += ". A strange pinching feeling is overwhelming your " + pc.cocksDescript() + ". You ";
						if(pc.isCrotchGarbed()) eventBuffer += "pull your [pc.lowerGarments] down for a look";
						else eventBuffer += "look down";
						eventBuffer += ", discovering with some shock that your phalli are withdrawing ";
						if(pc.hasSheath(targetDick) && pc.totalSheaths() > 1) eventBuffer += "completely into their sheaths until you can’t even make out their " + pc.cockHeads() + ".";
						else 
						{
							eventBuffer += "into themselves, leaving the " + pc.cocks[targetDick].cockColor + " skin to bunch up around their bases. As you watch, the flesh darkens to a glistening black. You can practically taste the muskiness pouring off the mutating dickskin. No matter when you do, they vanish into what can only be described as rather equine-looking sheaths.";
						}
						eventBuffer += "\n\nYou can’t just sit here watching and waiting, and without a degree of unearned confidence, you gingerly probe your fingers around the cockholes, eventually sticking your pinky into the biggest one. It hits what feels like a flat, blunt-tipped member, shooting lightning bolts of pleasure up your spine. Between the sensitive, hidden meat and the fact that your sheaths themselves are still very responsive, you find your heartbeat speeding and something shifting within you.";
						eventBuffer += "\n\n" + upperCase(pc.eachCock()) + " surges out of its sheath in unison with its identically ";
						var tempColor2:String = "mottled";
						if(rand(2) == 0) tempColor = "black";
						eventBuffer += tempColor2 + " brothers, getting thicker, longer, and veinier by the minute. You can almost taste the pheromones pouring off your lengthened rods, and while you enjoy it, you bet it would have the cow-girls mewling in delight. You grab hold of the swelling dicks, one in each hand, and stroke, feeling the extra inches pour out of your sheaths. ";
						var nubby:Boolean = false;
						if(rand(4) == 0) nubby = true;
						if(nubby) eventBuffer += "Strangely, you feel sensitive bumps welling up under your fingertips, but they feel too good to worry about, regardless of how out of place they are on your equine rods. ";
						eventBuffer += "You’re getting longer and harder than you were before, and the pleasure mounts and mounts, threatening to send you past a precipice that has your flaring tips nearly doubling in size.";
						eventBuffer += "\n\nThere’s no containing the rampant, almost feral pleasure that overwhelms you. All you can do is lie back and hump at your own hands, suddenly erupting ";
						if(pc.cockTotal() == 2) eventBuffer += "twin";
						else eventBuffer += "into a multitude of";
						eventBuffer += " fountains of [pc.cumNoun]. Lances of the [pc.cumVisc] thrust through the air before splattering all over your [pc.chest] and body.";
						var knotty:Boolean = false;
						if(rand(4) == 0) knotty = true;
						if(knotty) eventBuffer += " Each spurt comes bigger and thicker than the one behind it, and when your hand slides down to squeeze a newly-formed, canine knot, your mind buckles.";
						else eventBuffer += " The goo falls thicker and thicker while you heedlessly pump, all the while fighting with an urge to whinny in delight.";
						eventBuffer += "\n\nThe orgasm does eventually end, leaving a residual euphoria and a thorough layer of [pc.cum] in its wake.";
						if(knotty) eventBuffer += " The knots don’t shrink down for at least five minutes after. Had you been balls-deep in a bitch, she would’ve had to sit there and let you fill her.";
						eventBuffer += " <b>You’ll need to get used to having a ";
						if(knotty) eventBuffer += "knotted";
						if(knotty && nubby) eventBuffer += ", ";
						else if(knotty) eventBuffer += " ";
						if(nubby) eventBuffer += "nubby ";
						eventBuffer += "horse-cock.</b>";

						//+5 inches. increase cum volume and such slightly.
						for(x = 0; x < pc.cockTotal(); x++)
						{
							//TFable dick!
							if(pc.cocks[x].cType != chosenDickType)
							{
								//+5 inches. increase cum volume and such slightly.
								pc.cocks[x].cLength(5);
								pc.shiftCock(x, chosenDickType);
								if(tempColor2 != "mottled")
								{
									if(rand(2) == 0) pc.cocks[x].cockColor = "black";
									else pc.cocks[x].cockColor = "pink";
								}
								else pc.cocks[x].cockColor = "mottled pink and black";
								if(knotty) 
								{
									pc.cocks[x].addFlag(GLOBAL.FLAG_KNOTTED);
									pc.cocks[x].knotMultiplier = 1.5;
								}
								if(nubby) pc.cocks[x].addFlag(GLOBAL.FLAG_NUBBY);
							}
						}
						//Cum
						pc.orgasm();
						pc.boostCum(3);
					}
				}
				//Dawg Cawk
				else if(chosenDickType == GLOBAL.TYPE_CANINE)
				{
					//Single
					if(!changeAllDicks)
					{
						eventBuffer += "\n\nYour " + pc.cockDescript(targetDick) + " shifts, pulling up against your crotch. You wince at the abrupt change, wondering if something has gone wrong, fearing that you’ll wind up as one of the effeminate faux-cows";
						if(pc.isCrotchGarbed()) eventBuffer += " even while you pull your equipment off for a better look";
						else eventBuffer += " even while you peer down for a better look";
						eventBuffer += ". It doesn’t feel like it’s shrinking, but it is ";
						if(pc.hasSheath(targetDick)) eventBuffer += "pulling further and further into its sheath. Eventually, it vanishes entirely, hidden from view.";
						else eventBuffer += "pulling into your crotch somehow, leaving your " + pc.cocks[targetDick].cockColor + " skin to bunch up around the base. Fur breaks out over the strange pubic mound, taking the place of the hair that once dwelt there. Meanwhile, your " + pc.cockDescript(targetDick) + " continues its vanishing game, eventually disappearing entirely into what can only be a fuzzy sheath.";

						eventBuffer += "\n\nYou feel strangely warm all over from the odd change sweeping through your body, but the heat is primarily concentrated in your loins, where <i>something</i> is happening to your dick. You can’t just sit here and wait. You’ve got to figure out what’s happening to you, even if it means sticking a finger in after. Here goes....";

						eventBuffer += "\n\nYour probing digit slips right in, finding the interior to be warmer than you expected, almost hot. It’s a little slick too, like the whole of it is covered in a thin sheen of sweat. You feel around in there, breathing faster and faster from the inexpert stimulation, until you hit the pointed tip of what can only be your prick.";
						if(!pc.cocks[targetDick].hasFlag(GLOBAL.FLAG_TAPERED)) eventBuffer += " Wait... pointed tip? Your cock wasn’t <i>that</i> angular.";
						eventBuffer += " The sensation of friction between your finger and genital is almost more than you can bear. You fall back, panting noisily and rubbing all the harder.";

						eventBuffer += "\n\nYou can’t keep it up, though. Your bright red length is pushing your naughty digit out of your sheath, revealing its new shape to you in all its glory. <b>You have a bright red, pointed dog-dick, complete with a slight bulge at the base from your uninflated knot.</b> The sensation of the air blowing across it is almost too much to bear. Your hand wraps around it, at first to shield it from errant breezes, and then to stroke it, pumping furiously, feeding more and more pleasure to your expanding bitch-breaker.";
						eventBuffer += "\n\nYou howl, a blissful, wonderful sound of triumph, announcing that you’ve hit your peak even before it. The bulge at the base of your canine prick expands, and you just <i>have</i> to wrap your hand around it, to feel something warm squeeze against it. It’s all too much. The pulsing, animalistic bliss overwhelms you, and you abruptly erupt, launching rope after rope of [pc.cum] across your [pc.chest]";
						if(pc.cocks[targetDick].cLength() < 18) eventBuffer += " and [pc.belly]";
						else eventBuffer += " and [pc.face]";
						eventBuffer += ". The climax drags on and on. Even when you go dry, you’re still pulsating in your grip, your rock-solid knot holding an imaginary cow-girl in place while she fountains milk along with you.";
						eventBuffer += "The orgasm eventually ends, leaving you with a slowly-receding dick that would look at home on ";
						if(pc.originalRace != "half-ausar") eventBuffer += "a big dog";
						else eventBuffer += "an ausar";
						eventBuffer += ".";
						//orgasm
						pc.orgasm();
						pc.shiftCock(targetDick, chosenDickType);
						pc.boostCum(3);
					}
					//Multi!
					else
					{
						eventBuffer += "\n\nYou double over a feeling that can only be described as... diminishment traverses your crotch from one side to the other, centered over your " + pc.cocksDescript() + ". Terrified that something might have gone wrong - that you might be shrinking and turning into a faux-cow, you stagger back";
						if(pc.isCrotchGarbed()) eventBuffer += ", reaching into your [pc.lowerGarment] with shaking hands";
						else eventBuffer += ", looking down with probing eyes";
						eventBuffer += ". ";
						if(pc.totalSheaths() <= 1) eventBuffer += "The strangest thing is happening. Your " + pc.cocksDescript() + " are each shrinking... and yet not. They feel more like they’re pulling back into your body, and the skin is bunching up around the base of each one, sprouting a fine layer of fur as it thickens. You gasp. Your dicks aren’t getting smaller - they’re retracting into sheaths! Canine cocksheaths!";
						else eventBuffer += "Thankfully, your members are merely retracting into their sheaths, pulling back until they’ve almost entirely vanished. More importantly, the sheaths themselves are covered in a layer of rich, [pc.furColor] fur, appearing canine in nature.";

						eventBuffer += "\n\nWith this new development firmly in your mind, you sink to the ground, sitting ";
						if(!pc.isTaur()) eventBuffer += "on your [pc.butt]";
						else eventBuffer += "on your haunches";
						eventBuffer += " to watch the developing drama down south. It actually feels kind of... good. There’s a kind of sensual warmth to it. A whole-body flush spreads through your form while your " + pc.cocksDescript() + " finish their descent into hiding. You groan and slide your hands down to your sheaths, rubbing them affectionately, enjoying the sensation of playing with new nerves. You realize something is happening within you: your " + pc.cocksDescript() + " are changing into something else. They bulge against the inside of your sensitive folds in the most pleasant way. Just what are they changing into?";
						eventBuffer += "\n\nThey answer your question a moment later by thrusting up out of your sheaths, bright-red and pointed, narrow tips visibly quivering as more sensitive dickflesh emerges. You whimper; it sounds almost like a pant to your ears. They feel so good, and they’re so slick and hot. They almost glow to your eyes, bundles of red erotic energy just waiting to be touched, squeezed, and explosively released. Your hands are trembling and sweating, barely controlled. You aren’t sure that you could stop yourself from jacking off if you wanted to.";
						eventBuffer += "\n\nThe decision is taken out of your hands when, with violent lurches and soft-sounding pops, glistening knots emerge. The rounded bulges are trembling with unchecked need. They grow by the second, surging with the intensity of their building load. ";
						var nubtacular:Boolean = false;
						if(rand(4) == 0) nubtacular = true;
						if(nubtacular) eventBuffer += "Small nubs grow out of the surfaces of your " + pc.cocksDescript() + " before your eyes, but the ever-increasing pressure keeps your attention focused on your impending eruption over any concerns about the shapes of your new features. ";
						eventBuffer += "You feel so pent up, like you haven’t cum in days. The knots grow ever larger, and you whine, humping the air. That pressure is almost overwhelming, blasting every thought out of your head except for one: how badly you need to release.";
						eventBuffer += "\n\nAlmost doubling in size, your knots expand once more, the sensation so hellishly pleasurable that you lose all control. Your muscles quiver. Your hips lock. Arching your back, you erupt like a geyser, spewing ropes of [pc.cum] into the air with such force that they look like a [pc.cumColor] web. A moment later, they fall down across you, but you’re already launching more up to replace them, painting yourself with layer after layer of glistening [pc.cumNoun], cumming to the feeling of your knots being so swollen. You can only imagine how good they would feel trapped in tight channels, pouring your virile energy into them with womb-filling fury.";
						eventBuffer += "\n\nThe comedown happens an indeterminate amount of time later. You have memories of seemingly unending pleasure, and you’re panting like you’ve just run a marathon. Also, you’re lying in the biggest puddle of [pc.cum] you’ve ever produced. A look at the Codex tells you that you’ve been here for the better part of a half-hour. Doing your best to clean yourself off, you find yourself smiling all the same. Tools like this are going to be extra effective at breeding bitches";
						if(nubtacular) eventBuffer += ", extra nubs or not";
						eventBuffer += ".";

						for(x = 0; x < pc.cockTotal(); x++)
						{
							//TFable dick!
							if(pc.cocks[x].cType != chosenDickType)
							{
								pc.shiftCock(x, chosenDickType);
								if(nubtacular) pc.cocks[x].addFlag(GLOBAL.FLAG_NUBBY);
							}
						}
						//Cum
						pc.orgasm();
						pc.boostCum(3);
					}
				}
				//Cat Cawk - Fuck this, not doing it nau
				else
				{
					//Single Catcock TF
					if(!changeAllDicks)
					{
						eventBuffer += "\n\nYour " + pc.cockDescript(targetDick) + " becomes distressingly hard in an instant";
						if(pc.isCrotchGarbed()) eventBuffer += ", threatening to shred your [pc.lowerGarments] no matter how sturdy the construction. It’s like walking around with an ill-fitting titanium bar in your pants. You pull the offending equipment out of the way, and the relief is so palpable you could swim in it";
						else eventBuffer += ", jutting out from your crotch like some kind of rigid, cybernetically attached lever. You aren’t sure you’d be able to stand having an erection this strong trapped within any kind of clothing";
						eventBuffer += ". It grows harder by the second. A small part of you wonders if you’re somehow going to explode.";
						//Not yet spined
						if(!pc.cocks[targetDick].hasFlag(GLOBAL.FLAG_NUBBY))
						{
							eventBuffer += "\n\nThe pent-up pressure fades, leaving heat, lust, and cosmetic additions to your cock. Tiny bumps are rising up out of your sensitive, " + pc.cocks[targetDick].cockColor + " flesh. At first, they’re small enough that you wouldn’t have noticed them without holding your member in your hand. But as your heart beats and the overwhelming tightness recedes, they grow bigger, transforming into fleshy, texture-rich nodules. Just feeling your fingertips playing across them has you swooning and leaking from the tip. You can only imagine what they’ll do to a pussy or an asshole. It’ll be a sensory overload they won’t soon forget.";
						}
						//Already spined
						else eventBuffer += "\n\nThe pent-up pressure fades as quickly as it appeared, bringing with it waves of lust and a strange quivering from the nubs that cover your " + pc.cockDescript(targetDick) + ". They wiggle, pulsating bigger for a moment before receding. You don’t have time to question the odd development as the rising tide of desire compels you to wrap a hand around the quivering length and tug, stroking the sensitive haft until droplets of pre-cum are spilling from the tip almost nonstop.";
						//CHANGE PLACES... errr shapes
						eventBuffer += "\n\nYou jaw opens, and you release a throaty roar of satisfaction, pumping your transforming prick for all you’re worth. It changes inside your palm. The shape twists. The veins vanish. The only constant is the all-consuming enjoyment that it provides - the way it makes your synapses dance in ecstasy. The tip fattens and then narrows between your fingertips, coming to something approximating a tip. Luckily, those wonderful nubs hang on through it all, even when your dick’s transformation seems to be coming to a close, bringing with it final surges of electric, dazzling pleasure.";
						eventBuffer += "\n\nGrunting, you thrust into your palm. Those grunts transform into feral, powerful roars of triumph, and orgasm washes through you, transforming your body to a fiery volcano. Ropes of licentious release erupt from you, chased by even bigger geysers of your seed. You pump widely, clenching powerful internal muscles to drive yet more [pc.cum] from your undoubtedly feline member. The urge to clamp your jaw around your mate’s neck overwhelms you - if only you had a female here, impaled on your spurting cat-cock! The thought sends fresh squirts of [pc.cumColor] out to fall on the ground, and your eyelids roll back, your mind overloaded.";
						eventBuffer += "\n\nComing down, you find yourself still stroking your softening cat-cock. Having a big, fat animal-dick like this makes you feel like some kind of alpha male. You pat the shrinking thing affectionately, and resolve to live up to the predatory image it conjures in your mind. You don’t want a harem of mewling cow-girls. You want a pride. The stars can be your savanna, and you’ll be its lord.";
						pc.orgasm();
						pc.shiftCock(targetDick, chosenDickType);
						pc.boostCum(3);
					}
					//Multicock!
					else
					{
						eventBuffer += "\n\nIn an instant, your " + pc.cocksDescript() + " become distressingly hard, ";
						if(pc.isCrotchGarbed()) eventBuffer += "threatening to shred your [pc.lowerGarments] no matter how sturdy the construction. It’s like walking around with ill-fitting titanium bars stuffed into your pants. You pull the offending equipment out of the way, and the relief is so palpable that you could fill a pool with it";
						else eventBuffer += "jutting out from your crotch like levers from a perverse control panel. You aren’t sure you’d be able to stand having erections like this trapped within any kind of clothing. For once, nudity pays off";
						eventBuffer += ". They’re getting harder by the second, still. A part of you wonders if they’re going to pump up till they burst, overwhelmed by some kind of incredible, internal pressure.";
						//No spines
						if(pc.cocks[targetDick].hasFlag(GLOBAL.FLAG_NUBBY))
						{
							eventBuffer += "\n\nStrangely, the strain begins to fade almost as soon as it arrived, replaced by a rampant, unrestrained heat. The change from discomfort to a balmy arousal is almost instantaneous, and with it comes another unfamiliar sensation: little nubs pressing against your palm. You aren’t sure when you grabbed hold of " + pc.oneCock() + " and started stroking, but you can feel the surface of your shaft morphing beneath your fingertips, sprouting tiny, textured nubs across its entire surface. You wouldn’t have noticed if you weren’t squeezing yourself so, at least not at first. Those little nubs are getting more prominent. After a few pumps, they’re big enough to be seen with the naked eye. You ooze pre-cum, imagining the way your newly-textured cock will overwhelm your mates with ecstasy. Wait... mates?";
						}
						//Spined already
						else eventBuffer += "\n\nStrangely, the strain begins to fade almost as soon as it arrives. The nubs that cover your cocks wiggle, twitching wildly, even swelling up for a few short moments. Luckily, they return to their normal size a moment later. You sigh with relief, unsure what you would have done had they gotten any larger. Now that the discomfort is gone, you’re aware of another sensation emanating from your genitalia: lust. Not just normal lust either. The kind of lust that compels you to wrap both hands around your lengths and stroke. The kind of lust you couldn’t say no to even if you had an iron will and a lifetime of self-discipline to call upon. Pre dribbles out of your tips in thin streams already. Just how horny are you?";
						//Lets TF this bitch
						eventBuffer += "\n\nYou jack of harder, stroking two handed, each palm sliding across a pre-cum lubricated length. Releasing a throaty roar of satisfaction, you thrust your hips forward, burying the ";
						if(pc.cockTotal() > 2) eventBuffer += "lucky ";
						eventBuffer += "twin lengths into your hands. At the same time, you become aware of something else.... They’re changing in your very grips, twisting and reshaping against your slickened palms. The nubs don’t change, but just about everything else does. One second, your shafts feel like they’re swelling up like balloons. The next, your " + pc.cockHeads() + " are fat and prominent, a little squishy and almost spongy. Then, they’re narrowing to tapered points. Your pricks are transforming by the second, and you can do naught but continue to stroke them, compelled by infinitely erotic, transformative energies.";
						eventBuffer += "\n\nThere’s no stopping you now. The pleasure rises higher and higher, taking you further and further away from the mundane world. Your head is in the clouds even as your hands are bound to the pulsating, slowly-solidifying lengths below. Your cocks are almost finished changing, and releasing larger and larger waves of bliss to push you beyond conscious thought. Their tips are narrow and pointed, the shafts thick, each nub jolting your ecstatic mind with red-hot, rutting desire.";
						if(pc.balls > 1) eventBuffer += " Your " + pc.ballsDescript() + " clench, and y";
						else eventBuffer += " Y";
						eventBuffer += "our rods thicken, urethras flooding with soon to be expelled goo. One thought surfaces a moment before you explode: you have thick, feline dicks, like an immense, powerful lion.";
						eventBuffer += "\n\n[pc.Cum] surges, obliterating any attempt at reason, leaving you roaring and spurting, erupting long lances of ";
						if(pc.cumType == GLOBAL.FLUID_TYPE_CUM) eventBuffer += "leonine jism";
						else eventBuffer += "relief";
						eventBuffer += " into a puddle on the ground. The pleasure is incandescent, burning away any worry or concern, leaving only deep-seated satisfaction in its wake and the desire to find a group of willing females to sate your rut again and again. The ribbons of [pc.cum] seem almost unending, the continuous bliss beyond your capacity to endure. Your eyes roll back, and consciousness fades to the feeling of your hands stroking one quivering tool after another.";
						eventBuffer += "\n\nWhen you awake, you’re still standing there with both your hands wrapped around your softening dicks, somehow. You let go and stretch, totally sated for once. But, just when you’re planning to";
						if(pc.isCrotchGarbed()) eventBuffer += " pull your gear back up and";
						eventBuffer += " get back to business as usual, you give your lion-like phalli an appraising look and remember your desire for a harem... no, a pride. You’ll have to find a few cuties to sate you soon, maybe even some that’ll love the feel of you biting at their neck while you take them.";
						for(x = 0; x < pc.cockTotal(); x++)
						{
							//TFable dick!
							if(pc.cocks[x].cType != chosenDickType)
							{
								pc.shiftCock(x, chosenDickType);
							}
						}
						//Cum
						pc.orgasm();
						pc.boostCum(3);
					}
				}
			}
		}
		//Cum Volume & Minimum CumQ
		if(treatedHours == 63 && pc.hasCock() && pc.maxCum() < 1000)
		{
			//Try and hit at least 1L if PC is below dat.
			//Balls
			if(pc.balls > 0)
			{
				eventBuffer += "\n\nYou feel the inside of your [pc.sack] clench and release. The feeling repeats two or three times in quick succession, each time leaving you feeling a little heavier... a little denser, like your " + pc.ballsDescript() + " ";
				if(pc.balls > 1) eventBuffer += "are";
				else eventBuffer += "is";
				eventBuffer += " somehow becoming even more capable. You’ll probably have bigger, messier orgasms with ";
				if(pc.balls == 1) eventBuffer += "a nut like this";
				else eventBuffer += "nuts like these";
				eventBuffer += ".";
			}
			//No Balls
			else
			{
				eventBuffer += "\n\nYou feel a twinge deep inside you. It happens two or three more times in quick succession. Then, just as you’re trying to figure out what’s happening, a few drops of [pc.cum] drool out the end of " + pc.oneCock() + ". Is your body somehow retooling itself to produce more ejaculate? You can only imagine what’s going on with your prostate and seminal vesicles right now.";
			}
			pc.boostCum(5);
			if(pc.maxCum() < 1000) pc.boostCum(5);
			if(pc.maxCum() < 1000) pc.boostCum(5);
			if(pc.maxCum() < 1000) pc.boostCum(5);
			if(pc.maxCum() < 1000) pc.boostCum(5);
			if(pc.maxCum() < 1000) pc.boostCum(5);
		}
		//Refractory Megaboost & Cum Quality
		if(pc.hasCock() && (treatedHours == 69 || treatedHours == 77 || treatedHours == 157))
		{
			//RefractoryRate to 10
			if(pc.refractoryRate < 10)
			{
				eventBuffer += "\n\nOne thing that you’re increasingly aware of is just how fast your " + pc.ballsDescript() + " feel";
				if(pc.balls <= 1) eventBuffer += "s like it’s";
				else eventBuffer += " like they’re";
				eventBuffer += " filling up with new seed. You don’t really spend any time trying to measure your new production, but you’re definitely filling up way faster than before. You smile, doubting you’ll ever leave a hole unfilled again.";
				pc.refractoryRate = 10;
			}
			//RefractoryRate to 25
			else if(pc.refractoryRate < 25)
			{
				eventBuffer += "\n\nWincing, you realize that you feel... fuller than you should. Like your body has gone into overtime, producing sperm in record quantities. This could come in handy....";
				pc.refractoryRate = 25;
			}
			//RefractoryRate to 50! & minimum cumQ of 15
			else if(pc.refractoryRate < 50)
			{
				eventBuffer += "\n\nThere’s no doubt about it. Your " + pc.ballsDescript() + " ";
				if(pc.balls <= 1) eventBuffer += "is";
				else eventBuffer += "are";
				eventBuffer += " filling up far faster than before, flooding with more and more unspent virility by the second. You could probably fuck a line of fifty girls and still not go dry by the last orgasm, not that you mind. At least the ubiquitous milking stalls and offers of blowjobs on New Texas make sense now. It could get quite uncomfortable without a regular release.";
				pc.refractoryRate = 50;
			}
		}
		//Cum Quality to 2.
		if(treatedHours == 133 && pc.hasCock() && pc.cumQualityRaw < 2)
		{
			eventBuffer += "\n\nThe Codex chirps, startling you. <i>“Alert: user virility levels have exceeded human norms. Sensors estimate a sperm density of over double terran standard. Use of contraceptives is recommended.”</i> What the.... Is this thing set up to monitor you that closely? Why the hell would it have an alert for that but not for you having emissions that could rival a horse? You sigh, resigned to the fact that you’re going to have pregnant partners if you want to have any real fun.";
			pc.cumQualityRaw = 2;
		}
		//PHEROMONES! Tease bonus!
		if(!pc.hasPerk("Pheromone Cloud") && pc.hasCock() && treatedHours == 138)
		{
			eventBuffer += "\n\nOut of the blue, you catch a whiff of yourself, and... you smell pretty good, actually. You’d put your aroma somewhere between a woodsmoke, sweat, and a clean, almost nutty fragrance. Your body odor is undoubtedly getting thick with pheromones to better signal your intentions and desires. Luckily, they don’t seem to turn you on like they’re supposed to do others. Maybe you’re immune to your own. Then again, your nose seems a lot more sensitive. You could probably pick out individuals by their smell alone. Heck, you can identify your own penis";
			if(pc.cockTotal() > 1) eventBuffer += "es";
			eventBuffer += " by the unique musk that underlays your own odor.";
			//Perk Unlocked: Pheromone Cloud - You are surrounded by a cloud of pleasant-smelling pheromones that increase the success rate and arousing potential of your tease attacks.
			eventBuffer += "\n\n(<b>Perk Gained: Pheromone Cloud</b> - Pheromones boost tease attack and arousal.)";
	 		pc.createPerk("Pheromone Cloud",0,0,0,0,"Boosts tease attack and arousal.");
	 	}
	 	//Horns
	 	//5 to 8”
	 	//Horn Grow 2 Nubs
		if((pc.horns == 0 || (pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT) || pc.hornLength < pc.statusEffectv2("Treated")) && (treatedHours >= 82 && rand(8) == 0 && treatedHours % 2 == 0))
		{
			//Existing horns transform into lil bull nubs.
			if(pc.horns > 0 && pc.hornType != GLOBAL.TYPE_BOVINE && pc.hornType != GLOBAL.TYPE_GOAT)
			{
				eventBuffer += "\n\nThere is a crackling, rustling sound coming from above you. You look up, but nothing is there. Instead, you hear the same sound from behind you. This time, you twist around to try and identify the source, but to no avail. A minute later a piece of horn bounces off your nose on the way to the ground.\n\n<b>Your horns are breaking apart!</b> Dazedly, you feel at the crumbling totems, feeling them come apart in your fingers. Chalky dust clings to your hand, but more importantly, two little nubs remain on your head. They're small and pointed, like little cow horns.";
				pc.horns = 2;
				pc.hornLength = .5;
				pc.hornType = GLOBAL.TYPE_BOVINE;
			}
			//Starting
			else if(pc.horns == 0 && !pc.hasStatusEffect("Horn Bumps"))
			{
				eventBuffer += "\n\nUgh. Your head itches! Reaching up to take a scratch, you wince when you come across a painful bump on your forehead. A quick check with the Codex confirms that it's red and irritated, though you haven't seen a head form on the zit yet. You've never had such prominent acne before, and there's a matching lump on the either side. Maybe something stung you? It could always be a pair of bug bites. Gross.";
				pc.createStatusEffect("Horn Bumps");
			}
			//Breaking Skin
			else if(pc.horns == 0)
			{
				eventBuffer += "\n\nThe pain from those irritating red bumps on your forehead is getting worse and worse with each passing moment, matched by a sudden desire to scratch madly at them until you flay the skin away. You resist as long as you can, but the need to tend to the maddening itch overwhelms your subpar self-control. Besides, if something itches, why not scratch it?";
				eventBuffer += "\n\nTo your horror, your first scratch peels away a patch of offending skin, but with it comes a sense of relief. Helpless to stop yourself, you scratch and scratch until the desire is completely gone - and a pile of discarded skin has built up before your " + pc.feet() + ".";
				eventBuffer += "\n\nWhat have you done to yourself!? Pulling out your Codex, you use the camera to check.";
				eventBuffer += "\n\nYou cup your chin and smile, regarding what you see with delight. <b>Your horns are coming in!</b> They’re only little nubs at the moment, but there’s no way they’re done growing. You’ll probably have an impressive rack when all is said and done, all the better to attract girls with nice squishy racks of their own.";
				pc.hornType = GLOBAL.TYPE_BOVINE;
				pc.removeStatusEffect("Horn Bumps");
				pc.horns = 2;
				pc.hornLength = .5;
			}
			//nubs -> 1" horns
			else if(pc.hornLength < 1)
			{
				eventBuffer +="\n\nFor the past few minutes, a nasty little headache has been brewing. You squeeze your eyes closed, flexing your jaw in an effort to deal with it, when it abruptly fades, vanishing in the span of a second.";
				eventBuffer += "\n\nYou aggressively prod yourself, trying to find the source of the fleeting pain; just what kind of headache was that? You get your answer when your fingers find what your nubs have become: full blown horns. They stick at least a full inch out from your [pc.skinFurScales], coming to two proud points, though their tips are rounded enough that you doubt you could do any real injury with them just yet. You’ll have to sharpen them up a little once they finish coming in, maybe even get them capped with ornamental steel.";
				pc.hornLength = 1;	
			}
			//1" horns to 2" horns
			else if(pc.hornLength < 2)
			{
				eventBuffer += "\n\nA wave of discomfort strikes just behind your forehead, growing worse by the second. There's really only one thing it can be - your horns are getting bigger! You whip out your Codex, wincing from the sudden motion, and flick it on, getting yourself a ticket to watch your own burgeoning masculinity.";
				eventBuffer += "\n\nYour formerly one-inch horns have already pushed a little further out, perhaps a quarter inch. The longer they get, the wider their bases are becoming, and they're growing fast enough now that you can actually see them slowly sliding out, revealing bit after bit of gleaming white ivory. The process is fascinating enough for you to forget your earlier discomfort. You watch, spellbound, as your horns continue to expand, growing ever more prominent on your face until they stop at around two inches long.";
				eventBuffer += "\n\nNow this is more like it. A little bigger, and you’ll almost look like a respectable " + pc.mf("bull","breeder") + ".";
				pc.hornLength = 2;
			}
			//2" horns to 3" horns
			else if(pc.hornLength < 3)
			{
				eventBuffer += "\n\nYour jaw clenches, a low growl escaping your throat entirely uncontrollably. There's a powerful shifting and sliding going on in your skull. It leaves you seeing stars with your eyes half-crossed. There's blessedly little pain, but when it passes, you're very aware of additional weight tugging on your head. Your horns have grown: they're now three inches of gleaming white, bovine awesomeness. You resolve to polish them at the first opportunity, maybe even get some ornamental studs for them.";
				pc.hornLength = 3;
			}
			//3" horns to 4" horns - prolly gonna reuse some of this for guys.
			else if(pc.hornLength < 4)
			{
				eventBuffer += "\n\nYour eyes suddenly cross, and you drop yourself to the ground, lest you run into something or worse. The rumbling sense of movement is working on your skull once more, like giant boulders rolling around the inside of your head. It doesn't hurt, but it is very disconcerting, making it next to impossible to think.";
				eventBuffer += "\n\nYou grunt and groan, feeling the sensation slide <i>outside</i> of your head as your horns expand, growing thicker and heavier. You sigh in satisfaction once they stop growing. Now these are respectable horns! If they stop here, you won’t mind too badly.";
				pc.hornLength = 4;
			}
			//4" horsn to 5" horns - MAX LADIES CAN GET.
			else if(pc.hornLength < 5)
			{
				eventBuffer += "\n\nYou feel a sense of... potential building within your head, expanding until it changes from a kind of nebulous energy into an unstoppable pressure. You feel your horns giving under the weight of it all, slowly sliding forward, expanding outward, growing heavier by the moment. You wrap your hands around them, feeling the change against your palms. When it's all over, you're left holding two big, strong five-inch horns. Nice.";
				pc.hornLength = 5;
			}
			//5” to six” horns
			else if(pc.hornLength < 6)
			{
				eventBuffer += "\n\nHere it comes! You wince at the onset of tightness in your forehead, increasingly familiar as your horns continue their trek toward their full size. It doesn’t even hurt that bad this time; it just feels like a strange, tight tingling as your horns add another inch to their already impressive length. When the sensation fades, <b>you admire your six-inch long horns.</b> Not too shabby. Any longer and you’ll have to be careful with them when going through doorways.";
				pc.hornLength = 6;
			}
			//6” -> 7”
			else if(pc.hornLength < 7)
			{
				eventBuffer += "\n\nYou grunt as the familiar feeling of horn growth sets in. Grabbing hold of the curved, steer-like protrusions, you give them a tug, easing more gleaming ivory into the air. The more horn you grow, the wider their stance and the more threatening you become. You could probably just tip your head an inch forward, snort, and send half the galaxy running. The thought makes you smile almost as much as the idea of a cow-girl squeezing them like handlebars while you give her a few good licks.";
				pc.hornLength = 7;
			}
			//7” -> 8”
			else if(pc.hornLength < 8)
			{
				eventBuffer += "\n\nYou wince at the headache as it returns. The familiar ache that’s right behind your forehead can only mean one thing: your horns are about to grow again. But they’re already so big! You watch in disbelief as an extra inch";
				if(rand(3) == 0) 
				{
					eventBuffer += "... no two extra inches pour";
					pc.hornLength++;
				}
				else eventBuffer += " pours";
				eventBuffer += " into your view. You must look so imposing. These are bigger than just about any bull’s on New Texas. <b>You have big, ";
				if(pc.hornLength >= 8) eventBuffer += "nine";
				else eventBuffer += "eight";
				eventBuffer += "-inch long horns.</b> Nobody will want to mess with you now.";
				pc.hornLength++;
			}
		}
		//Quad Balls (Uncommon)
		if(treatedHours == 155 && pc.balls > 0 && pc.balls < 4 && rand(10) == 0)
		{
			eventBuffer += "\n\nYour [pc.sack] sways heavily, more than ever before, the skin stretched taut. It gets your attention without even trying, really.";
			//One nut no new PG
			if(pc.balls == 1) eventBuffer += " Your " + pc.ballsDescript() + " is huge, easily four times its old size and probably still growing. You heft it, curiously, feeling around its bulk to try and identify just what’s going on. There are seams in its surface in a number of places, splitting it into four quadrants, and the longer you poke and prod at them, the more obvious they become. You let go in shock, afraid you’ve somehow damaged your one super-nut, but it doesn’t stop the seams from growing deeper, their edges more rounded.\n\nIndeed, your ball is slowly dividing now. There’s no hiding it. That one big sphere is splitting into four smaller ones, each about the same size as your original testicle. One breaks away first, and the others follow, splitting into unique testes. All four settle at the bottom of your [pc.sack] after a moment. <b>You’ll just have to get used to having four nuts</b> and be careful not to sit on them.";
			//Two nuts no new PG
			else if(pc.balls == 2) eventBuffer += " Your " + pc.ballsDescript() + " are huge, easily double their old size and probably still growing. You heft them curiously, feeling around their bulk to try and understand just what’s going on with your genitals. There are seams in their surfaces, dividing them in half. How... why do your nuts have <i>seams</i>? Letting go in shock, afraid you’ve somehow damaged your swelling nuts, you watch with a mounting sense of trepidation.\n\nThey’re definitely dividing, you realize. Those two seams are getting deeper and deeper, the edges more rounded by the second, curving until it looks less like a pair of meganuts and more like two pairs of conjoined testes. Even then, they look like they could come apart at any second, and they do, just a moment later. You wince, expecting pain, but it doesn’t hurt at all. You simply gain an awareness of having four balls, each as big as your original two were. <b>You’ll just have to get used to having four nuts crammed into your sack.</b>";
			//Triballs
			else if(pc.balls == 3)
			{
				eventBuffer += " One of your " + pc.ballsDescript() + " is huge, easily double its old size and probably still growing. You heft it, curiously, feeling around its bulk to try and identify just what’s going on without bothering the other two. There’s a seam in its surface across the middle, dividing it in half, and the longer you poke and prod at it, the more obvious it becomes. You let go in shock, afraid you’ve somehow damaged your growing super-nut, but it doesn’t stop the seam from growing deeper, the edges more rounded.\n\nIndeed, your ball is slowly dividing now. There’s no hiding it. That one big sphere is splitting into two smaller ones, each about the same size as your unmodified testicles. They round further and then divide, splitting into unique testes. The new twins settle in at the bottom of your [pc.sack] alongside their brothers a moment later. <b>You’ll just have to get used to having four nuts</b> and be careful not to sit on them.";
			}
			pc.balls = 4;
		}
		//(Ram Horns!)
		if(pc.horns == 2 && pc.hornType == GLOBAL.TYPE_BOVINE && pc.hornLength < 10 && treatedHours == 127 && rand(6) == 0)
		{
			eventBuffer += "\n\nYou feel the familiar tightness of your horns growing once more, but this time it doesn’t stop at simple pain. It intensifies into a flaring, twisting agony, like two screws boring into your skull. You double over, grabbing at the bony protrusions in horror in time to feel them twisting through your hands, angling your bovine horns back toward your own ears as inch after inch of fresh growth pushes through your fingers, slick with some kind of fluid as if fresh-birthed.\n\nThis goes on for minutes, but to you, it feels like hours of torture. No amount of willpower or machismo helps you deal with it. All you can do is curl into a ball and feel your horns twisting and changing, losing their bovine nature as they become something... else.\n\nThe pain fades without warning, and the growth goes with it just as suddenly. Shocked, you rise up, unaware of just when you fell to the ground, awed by the magnitude of just what happened. You pull out your Codex with a shaking hand and flick it on, more anxious to see the result of your transformation than you care to admit.\n\n<b>Two curled ram horns twist back over your ears</b>, giving you an appearance that seems both regal and playful, like the satyrs of old terran myths. You smile as you take it all in. It was almost worth the pain to get a pair like this.";
			pc.hornType = GLOBAL.TYPE_GOAT;
			pc.hornLength = 11;
			pc.horns = 2;
		}
		//Tail
		//Just tweak femtail stuff
		//cunt/cocktails prevent this!
		if(!pc.hasCuntTail() && !pc.hasCockTail() && pc.tailType != GLOBAL.TYPE_BOVINE && treatedHours == 98 && rand(10) != 0)
		{
			//No tail
			if(pc.tailCount == 0)
			{
				eventBuffer += "\n\nYou go to scratch at a spot above your [pc.butt] that's been bothering you for a few hours, and jerk when you hit something that wasn't there before - something rounded and fluffy. Pressing back carefully, you ease your fingers around the growth, discovering its furred texture and cords of muscle. The oddest part is feeling the fingers pressing on you through the fur. There's no doubt about it - <b>you have a tail.</b>\n\nIt's a fairly long tail with a gnarly little poof on the end, just like a cow's.";
				pc.tailCount = 1;
			}
			//Multitail
			else if(pc.tailCount > 1)
			{
				//Multi - short
				if(pc.tailCount == 1 && !pc.hasTailFlag(GLOBAL.FLAG_LONG))
				{
					eventBuffer += "\n\nYour [pc.tails] brush against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had [pc.tails], now you've got gently-swaying, bovine tails, complete with fuzzy puffs at the tips.";
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) eventBuffer += " A fine layer of [pc.furColor] fur covers each one.";
					eventBuffer += " You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.";
				}
				//Multi - long
				else
				{
					eventBuffer += "\n\nYour [pc.tails] feel increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremities alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find.";
					eventBuffer += "\n\n" + upperCase(num2Text(pc.tailCount)) + " gently swinging, bovine tails hang behind you. The tips are poofing up, just as you'd expect";
					if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) eventBuffer += ", and a coat of fine fur is growing out over their lengths";
					eventBuffer += ". In seconds, the warmth fades, leaving you with new, bovine butt ornaments. You can make them swing on command but little else. The best control you can manage is to make them curl up to swat at your butt, and that takes some serious flexing. At least they look good.";
				}
			}
			//Single - short
			else if(pc.tailCount == 1 && !pc.hasTailFlag(GLOBAL.FLAG_LONG))
			{
				eventBuffer += "\n\nYour tail brushes against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had a [pc.tail], now you've got a gently-swaying, bovine tail, complete with a fuzzy puff at the tip.";
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) eventBuffer += " A fine layer of [pc.furColor] fur covers the whole thing.";
				eventBuffer += " You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.";
			}
			//Single - long
			else
			{
				eventBuffer += "\n\nYour [pc.tail] feels increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, a calefaction that seems ready to set your posterior extremity alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find.";
				eventBuffer += "\n\nA gently swinging, bovine tail hangs behind you. The tip is poofing up, just as you'd expect";
				if(!pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) eventBuffer += ", and a coat of fine fur is growing out over its length";
				eventBuffer += ". In seconds, the warmth fades, leaving you with a new, bovine butt appendage. You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.";
			}
			pc.clearTailFlags();
			pc.tailType = GLOBAL.TYPE_BOVINE;
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
		}
		//Cow ears (maybe)
		if(pc.earType != GLOBAL.TYPE_BOVINE && treatedHours == 141 && rand(10) == 0)
		{
			eventBuffer += "\n\nYou go to scratch at one of your " + pc.earsDescript() + ", only to find it differently shaped - and in a new location - than before. Gingerly feeling it, you discover that your aural organs are soft and leathery, with a fine coat of [pc.furColor] across their outer edges. You can still hear just fine; you're just listening through a pair of floppy cow-ears now. Briefly, you consider how good it would feel to have someone scratch them.";
			pc.earType = GLOBAL.TYPE_BOVINE;
		}
		//Hooves (Rarish) - requires biped minimum. No change for goo/nagaPCs
		if(pc.legType != GLOBAL.TYPE_BOVINE && treatedHours == 165 && rand(10) <= 1)
		{
			if(pc.hasLegFlag(GLOBAL.FLAG_HOOVES))
			{
				eventBuffer += "\n\nYou stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. It’s then that you spot way your " + pc.feet() + " are shifting and changing. They look like they’re staying as hooves, but they’re a little more of a brown-black color, with a split down the middle. They look like the kind of hooves a bull would have. Well, there are worse things than having a matched set of transformations. <b>You resolve to enjoy your new bull hooves.</b>";
			}
			else
			{
				eventBuffer += "\n\nYou stumble over your own " + pc.feet() + ", sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. You see why when you glance to your " + pc.feet() + ". They're malformed, twisting and narrowing before your eyes. They're pulling their disparate parts together into one unified mass, almost cylindrical in shape";
				if(!pc.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE))
				{
					eventBuffer += ", and the change isn’t limited to below the ankle either. Your calves are reshaping, placing what used to be your ankle far above your blackening feet";
				}
				else eventBuffer += ", and they begin to blacken, moment by moment";
				eventBuffer += ".\n\nThey split in half, right down the middle, growing harder by the moment, dulling your sense of touch. You dully rub them, confused at first. Realization hits you like a ton of bricks - you have hooves! Just like a bull, you've got hooves to clop around on while you walk. Most people don't get hooves from the Treatment. It looks like you were one of the lucky ones. " + pc.mf("The cow-girls are gonna be all over you!","The bull-boys are going to love the look!");
			}
			pc.clearLegFlags();
			pc.legType = GLOBAL.TYPE_BOVINE;
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_HOOVES);
		}
	}
}

public function cuntsBelowWetnessThreshold(threshold:Number = 0):Number
{
	if(!pc.hasVagina()) return 0;

	var counter:int = 0;
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[0].wetness() < threshold) counter++;
	}
	return counter;
}
public function setMinimumWetness(arg:int = 0):void
{
	if(!pc.hasVagina()) return;

	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[0].wetness() < arg) pc.vaginas[0].wetnessRaw = arg;
	}
	return;
}

public function treatedVagNote(butt:Boolean = false):void
{
	if(!butt && pc.hasVagina())
	{
		eventBuffer += "\n\nWeird. It felt really, really easy to slip something inside [pc.oneVagina]. Concerned, you decide a little vaginal exploration is in order. You press one finger at first, then another into your [pc.vagina], discovering that the third is almost as easy to add as the first two. Impressively coordinated muscles squeeze and caress your digits, but don't impede the insertion of more in the slightest. As a matter of fact, once your fourth finger is inside, the muscles gradually pull your hand in to the wrist.\n\nThere's no getting around it, the Treatment has retooled [pc.eachVagina] into an elastic, powerfully coordinated pleasure palace. You doubt you'll even run into someone \"too big\" for you again.";
	}
	else
	{
		eventBuffer += "\n\nWeird. It felt really, really easy to slip something inside your [pc.asshole]. Concerned, you decide a little rectal exploration is in order. You press one finger at first, then another into your ring, discovering that the third is almost as easy to add as the first two. Impressively coordinated muscles squeeze and caress your digits, but don't impede the insertion of more in the slightest. As a matter of fact, once your fourth finger is inside, the muscles gradually pull your hand in to the wrist.\n\nThere's no getting around it, the Treatment has retooled your butt into an elastic, powerfully coordinated pleasure palace. You doubt you'll even run into someone \"too big\" for you again.";
	}
	pc.removeStatusEffect("Treatment Elasticity Report Needed");
	pc.removeStatusEffect("Treatment Elasticity Report Q'ed");
}