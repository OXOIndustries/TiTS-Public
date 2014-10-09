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

function treatmentHourProcs():void
{
	pc.addStatusValue("The Treatment",3,1);
	var treatedHours:int = pc.statusEffectv3("The Treatment")
	//Female Effects
	if(pc.statusEffectv1("The Treatment") == 0)
	{
		//Over Time Intelligence + Perks
		//Intelligence/Willpower Reductions to 25 statquotient every 2 hours for 2 days. (time remaining % 60 == 0) for 48 hours. Played even if stats are done dropping.
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
				else eventBuffer += "Peeling open your [pc.underGarment], you take a look at your [pc.vaginas].";
				if(pc.totalVaginas() == 1) eventBuffer += " It doesn't";
				else eventBuffer += " They don't");
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
			if(pc.hasVagina()) eventBuffer += " Dribbles of arousal leak down your [pc.legs] as you mull it over.";
			eventBuffer += " Yeah... maybe a fuck break is in order.";
			//+8 lust or lust to 33, whichever is higher.
			if(pc.lust() + 8 < 33) pc.lust(33-pc.lust());
			else pc.lust(8);
			//Libido +2
			pc.libido(2);
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
	 		pc.createPerk("Sexy Thinking",0,0,0,0,"Increases maximum lust by 15.");
			//Libido to 30 or +5
			if(pc.libido() + 5 < 30) pc.libido(30-pc.libido());
			else pc.libido(5);
		}
		//15
		else if(treatedHours == 30)
		{
			eventBuffer += "\n\nThis time, when you find your hands on your [pc.chest], you let them play. You aren't masturbating, per-se, just letting your fingers play a little. Hot jolts of ecstasy emanate from your [pc.nipples], and that's just fine. By the time something else distracts you, your face is as flush as your teats are hard.";
			//lust +7
			pc.lust(7);
			//Libido to 35 or +5
			if(pc.libido() + 5 < 35) pc.libido(35-pc.libido());
			else pc.libido(5);
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
			pc.libido(5);
			pc.lust(5);
		}
		//18
		else if(treatedHours == 36)
		{
			eventBuffer += "\n\nYou rub your nipple and smile. With how good this feels, you should be whimpering on the floor in a puddle of your own [pc.girlCum], but... but you're not. You could probably take yourself to whole new heights of pleasure. Suddenly, regular orgasms seem like chopped liver, and you should be dining on caviar.";
			//Inhuman Desire +20 max lust.
			if(pc.hasPerk("Inhuman Desire"))
			{
				eventBuffer += "\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 20.)";
				pc.createPerk("Inhuman Desire",15,0,0,0,"Increases maximum lust by 20.");
			}
			else
			{
				eventBuffer += "\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)";
				pc.addPerkValue("Inhuman Desire",1,20);
				pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			}
			//Libido to 50 or +5
			pc.libido(5);
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
			pc.libido(5);
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
			eventBuffer += "\n\nA welcome flush rolls across your [pc.skin] as you consider your body. Your nerve endings seem alight with potential pleasure, just waiting to be touched and set off. Every part of your body begs for your attention and hands to tend to it. You idly rub your arms, [pc.hips], and [pc.legs] before letting go, tingling hotly. It's all you can do to keep from touching yourself, but at the same time, you feel so good! Your overheated body can handle so much pleasure; it's amazing! You've got to take your enhanced form for a spin and try some sex, just to see how incredible your orgasms will be. Maybe a few times in a row...";
			//+5 lust
			pc.lust(5);
			//Inhuman Desire upgrade to +40.
			eventBuffer += "\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)";
			pc.addPerkValue("Inhuman Desire",1,20);
			pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
			//Libido to 75 or +5
			pc.libido(5);
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
		if(treatedHours > 48 && pc.breastRows[0].breastRating() < pc.statusEffectv1("Treated") && treatedHours % 3)
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
				eventBuffer += "\n\nYou let your hand play across your [pc.nipple] during an idle moment, just to check if like, your sensitivity is getting crazy or anything. It feels so good, but more startling is how there seems to be a little extra behind the pleasantly pulsing pleasure-bud. Your tits were already nice and big.... You squeeze them for good measure... so nice and big. They're bigger now! The thought is slow coming while you grope yourself, but it comes all the same. You're on the upper end of an E-cup now. If they keep growing, you're going to have a very hard time finding your [pc.feet], but that'll be fine.";
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
				eventBuffer += "\n\nLooking down, you smile. Your [pc.feet] are totally gone from view.";
				if(pc.hasCock()) 
				{
					eventBuffer += " Heck, if your [pc.cocks] ";
					if(pc.cockTotal() == 1) eventBuffer += "was";
					else eventBuffer += "were";
					eventBuffer += " smaller, you wouldn't see ";
					if(pc.cockTotal() == 1) eventBuffer += "it";
					else eventBuffer += "them";
					eventBuffer += " either.";
				}
				eventBuffer += " The swelling of your bustline is truly a sight to behold. Besides, you can still see them if you bend forward a little bit, and you don't need to watch your [pc.feet] or anything - not when you've got an ocean of pillowy flesh to look at. You've got big, sexy F-cups now.";
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
				eventBuffer += "\n\nYour hands are running slowly across your expanding chest in a kind of slow dance, sending little whispers of pink-hued pleasure into your brain. It's enough to keep a happy, ditzy smile on your face and your mind placid and calm. A simple tweak of a [pc.nipple] is enough to make your [pc.legs] wobble, and the idea of someone else doing the tweaking ";
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
				eventBuffer += "\n\nYou glance down, pleased to note that your view of the ground is even more obstructed than before. You don't need to see your [pc.feet] anyway, and you can always pull your boobs out to the side if you need to see past them. As a bonus, that would give you a chance to squeeze and rub at the well-rounded melons. They're so rounded and shapely; how could anyone ignore a perfect, HH-cup rack like yours? You arch your back, displaying them like solar panels that exist solely to soak up attention.";
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
			//HHH -> big HHH
			else if(pc.breastRows[0].breastRatingRaw < 24)
			{
				eventBuffer += "\n\nYou wrap your arms around your [pc.chest], squeezing them together. Your breasts have gotten so big and well... fuckable lately. You squeeze tighter, making them bulge out slightly, and giggle. Huge tits can serve so many purposes! They can get you attention from guys and girls, or they can hold milk.... One of your hands starts tugging a nipple, reminding you of another important fact about big, treated boobs: they can feel really, really good. You're already bigger than some of the girls on New Texas, almost past HHH-cups. How big can you get?";
				//+5 lust
				pc.lust(5);
				pc.breastRows[0].breastRatingRaw++
			}
			//big HHH -> I
			else if(pc.breastRows[0].breastRatingRaw < 25)
			{
				eventBuffer += "\n\nWarmth burns through the nerves of your chest, heating your jiggling mounds to an incredibly pleasant simmer as they begin to swell. You grab them, mooing and moaning in equal parts, feeling them bulge out between your fingertips, marvelling at the weight of your expanding feminine flesh. Your tits are definitely I-cups now. The tingling heat fades, replaced by a desire for physical contact. You give them that and more. Your hands fly across your chest, mauling your boobs for what feels like hours. It isn't until you cum from the incessant stimulation that your hands fall away";
				if(pc.cumQ() >= 100 || pc.wettestVaginalWetness() >= 3 || (pc.isLactating() && pc.lactationQ() >= 200)) eventBuffer += ", leaving you sitting in a puddle of your own fluids and panting.";
				//orgasm!
				pc.orgasm();
				pc.breastRows[0].breastRatingRaw++
			}
			//I -> big I
			else if(pc.breastRows[0].breastRatingRaw < 26)
			{
				eventBuffer += "\n\nA little extra wobble in your chest is all the notification you need to give yourself a quick grab n' squeeze. As expected, your tits are a little bigger than before. An I-cup bra would barely contain them! You sit there, petting them, hoping that it'll encourage further growth. There's no point in stopping when you're this close to moving up a whole bra size, is there?";
				pc.breastRows[0].breastRatingRaw++
			}
			//big I -> II
			else if(pc.breastRows[0].breastRatingRaw < 27)
			{
				eventBuffer += "\n\nTeetering forward and nearly losing your balance is all the reminder you need to give your rack some much needed attention. Unashamedly whipping them out, you take hold of your growing tits and weigh them. It isn't a very precise method of measuring growth, but it feels wonderful. You spend a few moments playing with them, squishing them together, and even bouncing them in place before you come to a decision. You have II-cup boobs for sure.";
				//+2
				pc.lust(2);
				pc.breastRows[0].breastRatingRaw++
			}
			//II -> big II
			else if(pc.breastRows[0].breastRatingRaw < 28)
			{
				eventBuffer += "\n\nYour chest has been supremely weighty for a while, but it seems a little heavier than before. You'd better check, just in case it got bigger... and more fuckable. Imagining it's a dick sliding between your expanding knockers, you snake a hand through your cleavage, wrapping the crook of your arm around the bottom of it. It feels good, of course. Handling your breasts is an exercise in excitement for sure, but you do your best to keep your wits about you. It's important to know how big your boobs are, after all. How else will you be able to brag about being almost too big for an II-cup bra?";
				//+7 lust
				pc.lust(7);
				pc.breastRows[0].breastRatingRaw++
			}
			//big II -> J
			else if(pc.breastRows[0].breastRatingRaw < 29)
			{
				eventBuffer += "\n\nEvery movement sends quakes of happy feelings through your mountainous melons, the feminine orbs entirely too delighted to bounce and jiggle for the whole world to see. And you can't blame them either. They're big, delicious tits. They deserve to be grabbed and squeezed and pulled until you're whimpering and drooling all over them... just like now. You moo quietly under your breath and pull your hands away, trying not to cum. You're pretty sure they're at least J-cups by now, but it's a far less pressing concern than the needy itch between your ";
				if(pc.hasVagina()) eventBuffer += "[pc.thighs]";
				else eventBuffer += "cheeks";
				eventBuffer += ".";
				if(pc.bRows > 1) eventBuffer += "\n\nIf you the Treatment worked on more than one row, you could probably be having a wonderful titgasm by now.";
				//+33 lust
				pc.lust(33);
				pc.breastRows[0].breastRatingRaw++
			}
			//J -> big J
			else if(pc.breastRows[0].breastRatingRaw < 30)
			{
				eventBuffer += "\n\nLooking down, you barely suppress a giggle. Your titties are just so gosh darned big! They're all wobbly and completely obscure your [pc.feet]; why, you're pretty sure that without some serious effort you won't be able to make out your own groin. It's a good thing your fingers already know just where to go, but you're pretty sure they'd be manhandling these delicious knockers. You start squeezing them together, letting your eyes drift closed, imagining that strong, calloused fingers are doing the work. Having such big J-cups is nice.";
				//+10 lust
				pc.lust(10);
				pc.breastRows[0].breastRatingRaw++
			}
			//big J -> JJ
			else if(pc.breastRows[0].breastRatingRaw < 31)
			{
				eventBuffer += "\n\nOoooh! A throaty moan rips through the air around you as you feel something come over your tits. It feels like a wave of tingling is hitting you. Your [pc.nipples] instantly ";
				if(pc.hasFuckableNipples() || pc.isLactating()) eventBuffer += "leak in noticeable streams";
				else if(!pc.hasFuckableNipples() && pc.breastRows[0].nippleType != NIPPLE_TYPE_FLAT && pc.breastRows[0].nippleType != NIPPLE_TYPE_INVERTED && pc.breastRows[0].nippleType != NIPPLE_TYPE_LIPPLES) eventBuffer += "tent out to their full size";
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
				pc.createStatusEffect("Boobgrow Done Notice",0,0,0,0,false,"","",true,10080);
			}
		}
		//Lips 
		//Max size stored in v3
		//Raise femininity to max, then add lipRating as needed.
		//Final lip rating = 4 to 6.
		if(pc.statusEffectv3("Treated") > pc.lipRating() && (treatedHours == 121 || treatedHours == 130 || treatedHours == 140 || treatedHours == 150 treatedHours == 160 treatedHours == 168))
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
					eventBuffer += " your holes. You whimper. How are you supposed to keep your legs closed when you're getting so fuckable?";
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
					eventBuffer += "\n\nOut of nowhere, your [pc.vagina] alights with abrupt excitement, simmering and bubbling with arousal until thin streams of [pc.girlCum] run unopposed down your [pc.legs]. You stare in fascination at the sensuous sight, feeling like you're half-girl, half-river. If you had a boyfriend handy, he could slip right in with no trouble at all!";
				}
				//Multipuss but only 1 changed
				else if(cuntsBelowWetnessThreshold(3) == 1)
				{
					eventBuffer += "\n\nOut of nowhere, [pc.oneVagina] alights with abrupt excitement, simmering and bubbling with arousal until thin streams of [pc.girlCum] are running unopposed down your [pc.legs]. Finally, you're slippery all over. You feel like a brain attached to a multitude of slippery, wet holes, each signalling their readiness with fragrant arousal.";
				}
				//Multipuss multiple changed
				else eventBuffer += "\n\nOut of nowhere, your [pc.vaginas] alight with abrupt excitement, simmering and bubbling with arousal until thin streams of [pc.girlCum] cascade down your [pc.legs]. You stare in fascination at the unquestionably sexual sight, feeling like you're little more than a woman attached to a wellspring of lust. A boy with nice, thick cocks could just slide them all right into you!";
				//+15 lust
				pc.lust(15);
				setMinimumWetness(3);
			}
		}
		//Lactation
		//boostLactation(1); every hour starting on day 3. until 100 is reached.
		if(treatedHours >= 73 && pc.milkMultiplier < 100)
		{
			pc.boostLactation(1);
			if(treatedHours > 100) pc.boostLactation(1);
			if(treatedHours > 120) pc.boostLactation(1);
			if(treatedHours > 130) pc.boostLactation(1);
			if(treatedHours > 140) pc.boostLactation(1);
			//Failsafe: Treated girls always max out lactation.
			if(treatedHours > 150 && pc.milkMultiplier < 100) 
			{
				pc.milkMultiplier = 100;
				createStatusEffect("Pending Gain MilkMultiplier Note: 100");
			}
		}
		//lactation almost never stops. If combined with Milky perk, never stops. Ever.
		//Once 100 milkMultiplier is reached, unlock the Treated Milk perk.
		if()
	You grow increasingly aware of how productive and wonderful your [pc.breasts] are. The Treatment has given you the ability to produce so much!{ You squeeze a droplet onto a finger and try it, just to sample it. It tastes exactly like the freshest, most delicious milk you've ever tasted - way better than normal. No wonder New Texas is able to export so much milk; Texan cow-milk is amazing!}
	Perk Unlocked: Treated Milk - Your milk tastes delicious, and milk production takes much longer to slow. The only way you'd stop producing is if you made a conscious effort to keep your roving hands off your milky nipples.

//Milk capacity gains
	//1->1.5
	By now you've gotten used to having a chest that feels like it's full of sloshing, delicious cream, but, out of the blue, that feeling diminishes. You weren't even milking yourself; you just feel like you can hold <i>more</i>. You rub your breasts curiously. Could the Treatment be making your body even better at storing up fluid? Rubbing your moistened teats, you wonder if your next milking will be that much more voluminous.
	//1.5->2
	A wave of warmth washes over your [pc.chest], and in its wake you're left feeling oddly... emptied. How odd. Hefting a tit in one hand, you squeeze it, delighted to see that [pc.milk] still comes out. The only conclusion you can come to is that the Treatment has someone made your breasts... better - able to hold and give more [pc.milkNoun]. A sensation of rightness accompanies that thought. Of course! It only makes sense that your body would change itself in order to experience even longer, more exciting milkings.
	//2->2.5
	Your attention is drawn to your chest out of the blue - not that unusual given your current state. You giggle, smooshing your boobs against one another, enjoying the feel of your lactating jugs bouncing and sloshing together like two energetic best friends. You're getting better at it too - the whole milk giving thing. Just when you think you're starting to get too full, it's like your boobs find even more room for [pc.milkNoun]. You briefly imagine your tits rearranging their furniture to add another fridge, giggling all the while.
	//2.5->3
	Your chest wobbles under the weight of its own unrestrained lactic prowess. Your body is so good at making milk that you find yourself wondering if your time would be better spent hooked up to a pump than hopping around the galaxy on a vainglorious quest for riches. Hefting the wonderful weight of your all too efficient mammaries, you smile, somehow knowing you could give a dairy cow a run for her money.

//Elasticity + bonus capacity to make sure the girl can handle roughly 24" by 4.5" poles.
//Change it silently. Leave notification status effect that triggers off the next time cuntchange is called. Followup message:
	Weird. It felt really, really easy to slip something inside [pc.oneVagina]. Concerned, you decide a little vaginal exploration is in order. You press one finger at first, then another into your [pc.vagina], discovering that the third is almost as easy to add as the first two. Impressively coordinated muscles squeeze and caress your digits, but don't impede the insertion of more in the slightest. As a matter of fact, once your fourth finger is inside, the muscles gradually pull your hand in to the wrist.
	There's no getting around it, the Treatment has retooled [pc.eachVagina] into an elastic, powerfully coordinated pleasure palace. You doubt you'll even run into someone "too big" for you again.

Horn Grow 2 Nubs
//Starting
	Ugh. Your head itches! Reaching up to take a scratch, you wince when you come across a painful bump on your forehead. A quick check with the Codex confirms that it's red and irritated, though you haven't seen a head form on the zit yet. You've never had such prominent acne before, and there's a matching lump on the either side. Maybe something stung you? It could always be a pair of bug bites. Gross.

	//Add a line to appearance?
	Your forehead is red and irritated in two different places. The upraised bumps stand out quite visibly.

//Breaking Skin
	The pain from those irritating red bumps on your forehead is getting worse and worse with each passing moment, matched by a sudden desire to scratch madly at them until you flay the skin away. You resist as long as you can, but the need to tend to the maddening itch overwhelms your subpar self-control. Besides, if something itches, why not scratch it?
	To your horror, your first scratch peels away a patch of offending skin, but with it comes a sense of relief. Helpless to stop yourself, you scratch and scratch until the desire is completely gone - and a pile of discarded skin has built up before your [pc.feet].
	What have you done to yourself!? Pulling out your Codex, you use the camera to check.
	You tumble onto your [pc.butt] in shock. You... y-you're... <b>you've got the cutest pair of horns growing out of your forehead!</b> They're small little nubs at the moment - adorable really, but they do a great job telling everyone about your bovine proclivities.

//nubs -> 1" horns
	For the past few minutes, a nasty little headache has been brewing. You squeeze your eyes closed, flexing your jaw in an effort to deal with it, when it abruptly fades, vanishing in the span of a second.
	You gingerly prod yourself; just what kind of headache was that? You get your answer when your fingers find what your nubs have become: full blown horns. They stick at least a full inch out from your [pc.skinFurScales], coming to two proud points, though their tips are rounded enough that you doubt you could do any real injury with them. They're mostly there for ornamentation, you figure, like a pair of earrings for your forehead.

//1" horns to 2" horns
	A wave of discomfort strikes just behind your forehead, growing worse by the second. There's really only one thing it can be - your horns getting bigger! You whip out your Codex, wincing from the sudden motion, and flick it on, getting yourself a ticket to your own horny transformation show. You giggle to yourself and watch.
	Your formerly one-inch horns have already pushed a little further out, perhaps a quarter inch. The longer they get, the wider their bases are becoming, and they're growing fast enough now that you can actually see them slowly sliding out, revealing bit after bit of gleaming white ivory.{ You brush your bangs to one side, hooking them around one of the horns in the cutest way.} The process is fascinating enough for you to forget your earlier discomfort. You watch, spellbound, as your horns continue to expand, growing ever more prominent on your face until they stop at around two inches long.
	Everyone will know you're a New Texas " + pc.mf("boy","girl") + " now{, as if the tits weren't an obvious enough sign}.

//2" horns to 3" horns
	Your jaw clenches, a low growl escaping your throat entirely uncontrollably. There's a powerful shifting and sliding going on in your skull. It leaves you seeing stars with your eyes half-crossed. There's blessedly little pain, but when it passes, you're very aware of additional weight tugging on your head. Your horns have grown: they're now three inches of gleaming white bovine beauty. You resolve to polish them at the first opportunity, maybe even buy some jewelry for them once you're sure they're done growing.

//3" horns to 4" horns - prolly gonna reuse some of this for guys.
	Your eyes suddenly cross, and you drop yourself to the ground, lest you run into something or worse. The rumbling sense of movement is working on your skull once more, like giant boulders rolling around the inside of your head. It doesn't hurt, but it is very disconcerting, making it next to impossible to think.
You grunt and groan, feeling the sensation slide <i>outside</i> of your head as your horns expand, growing thicker and heavier.{ The Treatment isn't supposed to give you such large horns. You frown as they finish growing; the Texans will probably call you a milk-bull or something equally degrading./You sigh in satisfaction once they stop growing. Now these are respectable horns!}

//4" horsn to 5" horns - MAX LADIES CAN GET.
	You feel a sense of... potential building within your head, expanding until it changes from a kind of nebulous energy into an unstoppable pressure. You feel your horns giving under the weight of it all, slowly sliding forward, expanding outward, growing heavier by the moment. You wrap your hands around them, feeling the change against your palms. When it's all over, you're left holding two big, strong five-inch horns.
	
tail-converts existing to cowtail
//cunt/cocktails prevent this!
	//Single - short
		//Furless
		Your tail brushes against your [pc.leg] as you walk. Wait - your [pc.leg]? When did.... You twist around, staring down in shock. Where once you had a [pc.tail], now you've got a gently-swaying, bovine tail, complete with a fuzzy puff at the tip.{ A fine layer of [pc.furColor] fur covers the whole thing.} You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.
	//Single - long
		Your [pc.tail] feels increasingly warm, moment to moment, and not from the ambient temperature either. The heat is internal, an interior calefaction that seems ready to set your posterior extremity alight with incredible energy. You twist around, concerned at first, but you smile lazily at what you find.
		A lazily swinging, bovine tail hangs behind you. The tip is poofing up, just as you'd expect{, and a coat of fine fur is growing out over its length}. In seconds, the warmth fades, leaving you with a new, bovine butt appendage. You can make it swing on command but little else. The best control you can manage is to make it curl up to swat at your butt, and that takes some serious flexing. At least it looks good.
Cow ears (maybe)
	You go to scratch at one of your [pc.ears], only to find it differently shaped - and in a new location - than before. Gingerly feeling it, you discover that your aural organs are soft and leathery, with a fine coat of [pc.furColor] across their outer edges. You can still hear just fine; you're just listening through a pair of floppy cow-ears now. Briefly, you consider how good it would feel to have someone scratch them.
Hooves (Rarish) - requires biped minimum. No change for goo/nagaPCs
	You stumble over your own [pc.feet], sprawling on the ground with all the grace of a drunken penguin. Groaning in pain, you roll over, trying to figure out just what went wrong. You see why when you glance to your [pc.feet]. They're malformed, twisting and narrowing before your eyes. They're pulling their disparate parts together into one unified mass, almost cylindrical in shape{, and the change isn’t limited to below the ankle either. Your calves are reshaping, placing what used to be your ankle far above your blackening feet/, and they begin to blacken, moment by moment}.
	They split in half, right down the middle, growing harder by the moment, dulling your sense of touch. You dully rub them, confused at first. Realization hits you like a ton of bricks - you have hooves! Just like a cow, you've got hooves to clop around on while you walk. Most people don't get hooves from the Treatment. It looks like you were one of the lucky ones. {The cow-girls are gonna be all over you!/The bull-boys are going to love the look!}

'
function cuntsBelowWetnessThreshold(threshold:Number = 0):Number
{
	if(!pc.hasVagina()) return 0;

	var counter:int = 0;
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[0].wetness() < threshold) counter++;
	}
	return counter;
}
function setMinimumWetness(arg:int = 0):void
{
	if(!pc.hasVagina()) return;

	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[0].wetness() < arg) pc.vaginas[0].wetnessRaw = arg;
	}
	return counter;
}