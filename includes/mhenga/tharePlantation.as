/* Thare Plantation */

public function tharePlantationManor():Boolean
{
	// Clear navigation
	return true;
}

public function showDarnock(withAble:Boolean = false):void 
{
	if(!withAble) showBust("DARNOCK");
	else showBust("DARNOCK", "ABLE");
	showName("PROF.\nDARNOCK");
}

public function showAble(nude:Boolean = false):void 
{
	if(!nude) showBust("ABLE");
	else showBust("ABLE_NUDE");
	showName("\nABLE");
}

// Intros
public function tharePlantationManorApproach(response:String = "none"):void 
{
	clearOutput();
	author("Nonesuch");
	
	var fullTime:int = ((hours * 60) + minutes);
	
	switch (response)
	{
		case "speaker":
			// Time is 22:31-06:59:
			if(fullTime < (7 * 60) || fullTime >= ((22 * 60) + 30))
			{
				output("You press the button on the comms unit. Nobody responds. That probably isn’t a major shock given the time of day, however it does mean you’re going to have to either rest here or brave the jungle night.");
				
				processTime(2);
				
				clearMenu();
				addButton(0, "Next", mainGameMenu);
			}
			// Time is 07:00-22:30:
			else
			{
				showBust("ABLE", "DARNOCK");
				
				output("You press the button on the comms unit. There’s no response. You’re debating pressing it again when an approaching thrum of huge insect wings draws your attention. From the manor grounds a male zil flies, dipping out of the air to land elegantly behind the gate.");
				output("\n\n<i>“Welcome to Thare Plantation,”</i> he says, slowly and clearly. You realize he’s speaking in Galactic Standard rather than his own tongue, and is doing so with pride. He is dressed in white servant robes that are pretty tight on him. <i>“Do you have an appointment?”</i>");
				output("\n\n");
				if(pc.isNice()) output("<i>“No,”</i> you reply. <i>“Just interested as to what’s going on here.”</i>");
				else if(pc.isMischievous()) output("<i>“Yep,”</i> you reply. <i>“Got a package here for a...”</i> You examine the invisible box in your hands. <i>“Dr. Livingstone?”</i>");
				else output("<i>“Obviously not,”</i> you deadpan.");
				output("\n\n<i>“I will have to check with the master,”</i> the zil replies, after a slow blink. <i>“If you would be so kind as to wait--”</i>");
				output("\n\n<i>“Oh, let them in, Able!”</i> A genial-looking, stocky white-haired man dressed in pale khaki has come down the steps of the manor and is striding down the drive. <i>“A lost, lone traveler in from the wilds, and you’re demanding to see their credentials? Come inside, my young friend!”</i>");
				output("\n\nThe gate slides silently open, and you find your hand enveloped by the walnut grip of the smiling old human.");
				output("\n\n<i>“Professor Shep Darnock, director and chief researcher of Thare Plantation, for my sins,”</i> he says in his well-pronounced, affable tone. <i>“Who do I have the pleasure of?”</i>");
				output("\n\n<i>“[pc.name] Steele,”</i> you say.");
				output("\n\n<i>“Steele?”</i> Darnock replies softly, laying his other hand on your arm. <i>“Not </i>the<i> [pc.name] Steele? My word. My giddy aunt. I had heard you were out on the frontier, but... to think you were going to make this fine young " + pc.mf("gentleman", "lady") + " </i>wait<i> Able, you terrible boy!”</i>");
				output("\n\nThe hand claps on your shoulder and you find yourself being led up the immaculate gravel drive towards the manor.");
				output("\n\n<i>“");
				// Time is 07:01-10:59:
				if(fullTime >= (7 * 60) && fullTime < (11 * 60)) output("We shall have a spot of breakfast on the terrace, and then we’ll get you cleaned up and rested, should you require it. A " + pc.mf("gentleman", "lady") + " of good breeding, left to </i>wait!<i>");
				// Time is 11:00-15:59:
				else if(fullTime >= (11 * 60) && fullTime < (16 * 60)) output("You’re just in time for a spot of tiffin on the terrace. You can tell me all about your adventures there, and then we’ll get you cleaned up and rested, should you require it. A " + pc.mf("gentleman", "lady") + " of good breeding, left to </i>wait!<i>");
				// Time is 16:00-22:29:
				else output("We shall have some supper on the terrace, and then we’ll get you cleaned up and rested, should you require it. A " + pc.mf("gentleman", "lady") + " of good breeding, left to </i>wait!<i>");
				output("”</i>");
				
				flags["THARE_MANOR_ENTERED"] = 1;
				
				processTime(8);
				
				clearMenu();
				addButton(0, "Next", tharePlantationManorApproach, "intro");
			}
			break;
		case "intro":
			//Move PC to Thare Manor square
			move("THARE MANOR");
			
			showDarnock(true);
			
			output("You are led through a hall of synth-marble to a sheltered, elevated terrace at the back of the manor. It overlooks more fields - with workers and agri-bots dotted through them - and the green wall of the jungle beyond.");
			output("\n\n<i>“Please, take a seat, " + pc.mf("Master", "Miss") + " Steele,”</i> smiles Darnock, indicating the illuminated polymer table and leaning back into a leather armchair himself. <i>“Able here will be assigned to you - he will attend to your every need.”</i>");
			output("\n\nThe zil certainly does, to an almost embarrassing degree. The honeyed smell of his pheromones coils into your nostrils as he sets out your cutlery. He’s barely pulled out your chair and fanned out your napkin for you when a generously sized meal for two arrives, borne on china by unsmiling kaithrit similarly dressed in tight, white servant robes emblazoned with the Snugglé logo.");
			output("\n\nThe food is... interesting. You really aren’t sure about the salty pear-like things, but once you get used to it, the orange fungi that tastes like herbed ham is actually quite nice. Darnock watches you tuck in with lively, smiling eyes.");
			output("\n\n<i>“So, what brings you to our little paradise?”</i> he asks. <i>“Looking to follow in your father’s footsteps, I imagine.”</i>");
			// Probe not secured:
			if(flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] == undefined && flags["WHUPPED_DANES_ASS_ON_MHENGA"] == undefined && flags["LOST_TO_DANE_ON_MHENGA"] == undefined)
			{
				output("\n\n<i>“Something like that,”</i> you reply cautiously. <i>“I don’t suppose you saw or heard anything falling out of the sky around here recently?”</i>");
				output("\n\nThe professor’s weathered brow crinkles in thought.");
				output("\n\n<i>“Do you know, there was a terrific bang to the east of here a couple of weeks ago,”</i> he offers slowly. <i>“I put it down to those naughty vanae savages causing more mischief for Xenogen, but perhaps--? You </i>must<i> be careful if you venture further south and east though, [pc.name]. The tree maidens are beasts.”</i>");
			}
			// Probe secured:
			else
			{
				output("\n\n<i>“I just like visiting Mhen’ga,”</i> you reply easily.");
				output("\n\n<i>“Isn’t it a spectacular place!”</i> The professor leans forward eagerly. <i>“A veritable Garden of Eden, filled with such living wonders to discover and explore. Just being here is treat enough - being able to conduct the research I am, and guide the souls under my tutelage: a dream come true.”</i>");
				output("\n\nHe sighs happily, looking out over the lush fields.");
			}
			output("\n\nYou ponder what to ask him in turn.");
				
			processTime(20 + rand(16));
			
			// Restore 25% Energy, + Lust
			pc.energy(pc.energyMax()/4);
			pc.changeLust(5 + rand (6));
			
			// [Appearance] [Me] [Plantation] [Zil] [Workers] [Finish]
			thareManorMenu();
			break;
		case "enter":
			// Time is 22:31-06:59:
			if(fullTime < (7 * 60) || fullTime >= ((22 * 60) + 30))
			{
				output("You press the button on the comms unit. Nobody responds. That probably isn’t a major shock given the time of day, however it does mean you’re going to have to either rest here or brave the jungle night.");
				
				processTime(2);
				
				clearMenu();
				addButton(0, "Next", mainGameMenu);
			}
			// Time is 07:00-22:30:
			else
			{
				move("THARE MANOR");
				showLocationName();
				
				showBust("DARNOCK", "ABLE");
				
				output("You press the button on the comms unit, and a moment later the thrum of approaching zil wings comes from the manor. Able" + pc.mf(" bows politely", " smiles at you shyly") + " as he opens the gate for you.");
				
				if(flags["THARE_MANOR_ENTERED"] >= 3 || (flags["PQ_REWARDS_TIMESTAMP"] != undefined && (GetGameTimestamp() - flags["PQ_REWARDS_TIMESTAMP"]) >= 7200))
				{
					thareManorPQApproach();
					return;
				}
				
				output("\n\n<i>“Our young friend returns!”</i> beams Professor Darnock, coming down the steps as you approach the palatial grandeur of the manor. <i>“Come, come. I shall have some");
				if(fullTime >= (7 * 60) && fullTime < (11 * 60)) output(" breakfast");
				else if(fullTime >= (11 * 60) && fullTime < (16 * 60)) output(" tiffin");
				else output(" supper");
				output(" rung up out on the terrace.”</i>");
				
				thareManorMeal(false);
			}
			break;
	}
}
public function thareManorMeal(newPage:Boolean = true):void 
{
	if(newPage)
	{
		clearOutput();
		author("Nonesuch");
		showDarnock(true);
	}
	else output("\n\n");
	
	output("You are led through a hall of synth-marble to the sheltered, elevated terrace at the back of the manor. You look out over the lush, manicured fields as a strange but satisfying meal is laid out in front of you.");
	output("\n\n<i>“Able is assigned to you, as ever, " + pc.mf("Master", "Miss") + " Steele,”</i> smiles Darnock, leaning back into his favourite leather armchair. Honeyed pheromones slip easily into your lungs as the zil fans out your napkin. <i>“Make any demand of him that crosses your mind. Now - what have you been getting up to, since we last spoke?”</i>");
	output("\n\nYou give him some heavily edited accounts of your recent adventures as you eat, pondering as you do if there’s anything you want to direct at the affable old aristocrat.");
	
	processTime(20 + rand(16));
	
	// Restore 25% Energy, + Lust
	pc.energy(pc.energyMax()/4);
	pc.changeLust(5 + rand (6));
	
	// [Appearance] [Me] [Plantation] [Zil] [Workers] [Finish]
	thareManorMenu();
}

public function thareManorMenu(done:Boolean = false):void 
{
	clearMenu();
	if(!done)
	{
		addButton(0, "Appearance", thareManorResponse, "appearance");
		addButton(1, "Me", thareManorResponse, "me", "Me", "Ask how he knows your father.");
		addButton(2, "Plantation", thareManorResponse, "plantation", "Plantation", "Ask him what this plantation is all about.");
		addButton(3, "Zil", thareManorResponse, "zil", "Zil", "Ask why there only seems to be one zil working here.");
		if(flags["THARE_MANOR_ENTERED"] >= 2) addButton(4, "Workers", thareManorResponse, "workers", "Workers", "Ask where the workers come from.");
		if(flags["THARE_MANOR_ENTERED"] >= 3 && flags["PQ_SECURED_LAH"] == 2) addButton(9, "Lah?", thareManorResponse, "lah", "Lah?", "Ask what’s happened with the ausar firebrand since you captured him.");
		addButton(14, "Finish", thareManorResponse, "finish", "Finish", "Finish the meal and conversation.");
	}
	else
	{
		// Remove any temporary effects.
		pc.removeStatusEffect("Thare Manor Bath");
		pc.removeStatusEffect("Thare Manor Temp Value");
		
		addButton(0, "Next", move, "THARE FIELDS");
	}
}

// Talk
public function thareManorResponse(response:String = "none"):void 
{
	clearOutput();
	author("Nonesuch");
	
	switch (response)
	{
		case "appearance":
			showDarnock();
			
			output("Professor Shep Darnock is a 5\' 10\" male human who looks to be in his late middle age, which probably means he’s a couple of centuries old at least. Dressed in a plain cotton safari suit, he has a genial, interested expression seemingly carved onto his square, beardless face. He is quite beefy and has tough walnut skin that speaks of a privileged lifetime spent mostly outdoors. His white hair is thick but well-groomed. There is no indication of any outlandish gene modification upon him, except for the sort that would eliminate such irritations as liver spots, back pain and glasses.");
			output("\n\nIn appearance and mannerism, he is exactly the sort of person that since the dawn of civilization is to be found in the upper echelons of human society, and perhaps always will be.");
			
			break;
		case "me":
			showDarnock();
			
			output("<i>“So you knew my father?”</i> you lead.");
			output("\n\n<i>“I knew of him,”</i> Darnock corrects with a small smile. <i>“In the circles I move in, and working for Snugglé, it was difficult </i>not<i> to know of dear Victor, and Steele Tech. I met him once or twice at soirees, and he was exactly as you’d imagine - generous and terribly flamboyant. He had to be introduced to me each time, because of course each time he was something completely different! Forever experimenting with the latest gene-mods, that was Victor.");
			// PC different from starting race:
			if(pc.race() != pc.originalRace) output("”</i> He nods knowingly at you. <i>“I can see you’re already staunchly carrying that particular family torch, as well.");
			output(" Yes! He truly embodied the spirit of entrepreneurialism. A paragon of humanity’s progress amongst the stars, for many. Many!”</i>");
			output("\n\nThere’s a meaningful pause.");
			output("\n\n<i>“But you weren’t friends?”</i> you prod.");
			output("\n\n<i>“Well,”</i> Darnock grimaces, <i>“We, ah, had our differences. Same circles but not the same inner circles, d’you see? He was such a </i>libertine<i>, whereas I...”</i> he gestures behind you. Turning, you see a large, wooden letter “O” hanging on the wall.");
			output("\n\n<i>“I feel a sense of duty about what we humans are doing out here on the frontier,”</i> the professor goes on, nestling back into his armchair. <i>“Which reaches beyond profit margins and indulging oneself. Revealing the universal light and compassion of the One to newly discovered native species - that is a hard, but truly just and beautiful goal. But that is my own path,”</i> he smiles at you, <i>“and you have yours. Your father advanced humanity’s profile through his own efforts, and that furthers the goal of the One. That is how I think of it.”</i>");
			
			processTime(5);
			
			addDisabledButton(1, "Me");
			break;
		case "plantation":
			showDarnock();
			
			output("<i>“What exactly are you doing here?”</i> you ask.");
			output("\n\n<i>“Research that could well culminate in what you sit down at breakfast to in the near future, dear [pc.boy]!”</i> Darnock exults, evidently delighted you’ve asked this question. <i>“I’m sure you know of Snugglé - they had a hand in producing most of the things you ate over the past week, most likely. A planet with such an embarrassment of floral riches as Mhen’ga is of huge interest to such a company - we are here testing a range of native plants’ suitability to mass produce. The meal you are in the process of demolishing is merely a taster of the fruits of our labor so far.”</i>");
			output("\n\nHe waves excitedly at the serried crops beyond the veranda.");
			output("\n\n<i>“Out there we grow every type of plant that has so far been discovered to be non-toxic and edible within this planet’s immense biome - and of course, there are many, many still to be discovered. So many tests that have to be run before a specimen can even be provisionally put forward as a potential crop, though; how does it react in a farmed environment? Will it flourish in another planet’s soil? What are its effects on other plants around it? Is something that is edible to a human poisonous to a leithan? We test that, and many other things, in the east wing of the manor.”</i>");
			output("\n\n<i>“And how are things going?”</i> you say, toying with some green mush that tastes a bit like hummus.");
			output("\n\n<i>“Very well,”</i> replies the old human enthusiastically. <i>“We’ve identified 17 contenders for crop status already. Maybe only 2 or 3 of them are truly ideal but even so - that’s remarkable for a newly discovered planet. So much so Snugglé have expressed serious interest into turning Mhen’ga into an agri-world. Whether that can happen is dependent on other factors, though.”</i> He sighs, twisting his water glass around and around.");
			output("\n\n<i>“Rather less encouraging factors.”</i>");
			
			processTime(4);
			IncrementFlag("PLANTATION_PLANTATION_TALK");
			addDisabledButton(2, "Plantation");
			break;
		case "zil":
			showDarnock(true);
			
			output("<i>“I’ve only seen one zil since I’ve been here,”</i> you observe, watching Able elegantly pour you more water. <i>“Why is that?”</i>");
			output("\n\n<i>“Ah. Nail on head, " + pc.mf("Master", "Miss") + " Steele. Nail. On. Head. Why indeed?”</i> ruminates Darnock, looking out over the fields at the khaki-clad workers, picking their way through the rows of crops.");
			output("\n\n<i>“My original plan, when I began overseeing construction of Thare, was to use purely native labor. Snugglé encourages that, you know - organically source your workforce, get them involved and used to your structures before any shrill sandal-wearers muddle them up with talk of unions and tribunals and so on. I believed in that from a personal perspective, as it would have provided me with an ideal opportunity to reach out to these savage innocents, talk to them about their salvation. The link between hard, honest work and holy Oneness - you can only teach that through practice.”</i>");
			output("\n\nHe sighs and gazes at the softly illuminated tablecloth.");
			output("\n\n<i>“Pure naivety on my part. Pure naivety! As a rule, the natives of Mhen’ga - be they winged, serpentine or tentacled - do not take readily to the virtues of honest labor and modesty. They are a feckless and lazy bunch, and would rather wallow in their own aboriginal ignorance, sleeping and rutting their short lives away. Only a very few zil have the correct mindset and have seen the light - like good, kind Able here. I gave him a name appropriate for an early son of this dawning world.”</i>");
			output("\n\nThe slim wasp-boy blushes almost orange and looks anywhere but the table. The background scent of sweet pheromones steps up a little.");
			// Intelligence > 50%:
			if(pc.IQ() > 50) output(" You debate asking after Kane, but decide that might not be a good idea.");
			output("\n\n<i>“I would like to chase more rigorous tactics with them, but alas, the current planetary administration has chosen to shackle us with suffocating rule and regulation. Make no mistake though, my young friend,”</i> the professor growls, determination steeling his pale blue eyes, <i>“it is a situation that will change. The zil and their fellows will be brought into the present millennium. Whether it be mercifully through the kind light of the One God, or brutally by uncaring market forces, that is their own choice to make.”</i>");
			
			processTime(4);
			IncrementFlag("PLANTATION_ZIL_TALK");
			pc.changeLust(2 + rand (2));
			
			// Unlocks “Workers” option
			if(flags["THARE_MANOR_ENTERED"] < 2)
			{
				flags["THARE_MANOR_ENTERED"] = 2;
				addButton(4, "Workers", thareManorResponse, "workers", "Workers", "Ask where the workers come from.");
			}
			addDisabledButton(3, "Zil");
			break;
		case "workers":
			showDarnock();
			
			output("<i>“So if you were unable to persuade almost any zil to work for you...”</i> you say, looking out over the fields, <i>“...it must have been quite difficult to find people willing to bust their asses way out here, on a hostile, newly-discovered planet?”</i>");
			output("\n\n<i>“They didn’t get a choice, dear [pc.name],”</i> says Darnock, considering the distant workers with a fond, paternal smile. <i>“And they must understand their posting not as an imposition, but a grand opportunity: to prove they are capable of obedience and a hard, honest day’s work to future employers. Snugglé works closely with the U.G.C. legal system to secure laborers for out-of-the-way installations like this, where locals cannot be sourced for whatever reason. It’s a win-win for all concerned: the burden on our over-taxed prisons is eased, Snugglé gets access to near-free labor, and the prisoners themselves receive valuable experience and a commendation on their CV for when they are released.”</i>");
			output("\n\nThe professor gets up and strolls over to the terrace, water glass in hand.");
			output("\n\n<i>“The security concerns are trifling - we barely need the turrets you saw coming in, at least not where the workforce are concerned. The jungle is several times more effective than any wall or fence in deterring prospective runaways. And, of course - what is the next best audience for proselytizing, after native savages? Fertile soil for the One, " + pc.mf("Master", "Miss") + " Steele. Fertile soil!”</i>");
			
			processTime(3);
			IncrementFlag("PLANTATION_WORKERS_TALK");
			
			addDisabledButton(4, "Workers");
			break;
		case "lah":
			showDarnock();
			
			output("<i>“Ah,”</i> says Darnock, dabbing his lips with his napkin, looking rather discomfited by your question. <i>“Yes. Well, that was all rather unfortunate. As I said before and after you brought Remi back into the fold, it was very much my intention to keep him on here at Thare, bend every effort towards reforming him. He is not stupid, or evil, in my estimation - just horribly misguided. Think of the good he could do if his relentless energies and intelligence was turned to higher purpose!”</i>");
			output("\n\n<i>“However. The U.G.C. legal system did not see eye to eye with me on the matter, once I’d filed my report. They take a very thin view of prisoners who not only attempt escape at minimum security facilities, but then incite violent revolt against it. So he was taken off my hands and moved to an, ahem, decidedly not minimum security facility. Many years added on to his sentence as well, of course.”</i>");
			output("\n\nThe white-haired human broods, swirling around the water in his glass.");
			output("\n\n<i>“I suppose it has set an example to all the other inmates. You cannot have the carrot of redemption without the stick of harsher punishment. But I must say the whole affair has made me rather gloomy, and set our mission here in a starker light. I regard Lah as my own failure, and that sacrifice makes it all the more imperative that Mhen’ga be brought into the light!”</i>");
			
			processTime(3);
			
			if(flags["LAH_TO_GASTIGOTH"] == undefined)
			{
				if(flags["PQ_PEACE_TIMESTAMP"] != undefined) flags["LAH_TO_GASTIGOTH"] = flags["PQ_PEACE_TIMESTAMP"];
				else if(flags["PQ_TRIBE_WREKT_TIMER"] != undefined) flags["LAH_TO_GASTIGOTH"] = flags["PQ_TRIBE_WREKT_TIMER"];
				else flags["LAH_TO_GASTIGOTH"] = GetGameTimestamp();
			}
			
			addDisabledButton(9, "Lah?");
			break;
		case "finish":
			showDarnock(true);
			
			output("You push your plate away (it’s immediately whisked from the table by Able) and thank the professor for his hospitality.");
			output("\n\n<i>“Not at all " + pc.mf("Master", "Miss") + " Steele!”</i> beams Darnock. <i>“It’s a pleasure to host such storied company. You must drop by whenever you are in the neighborhood - come to see this place as a home away from home.”</i> He pauses. <i>“I imagine after a hard");
			if(hours >= 6 && hours < 18) output(" day");
			else output(" night");
			output(" in the jungle and a big meal you’re feeling rather dozy. Why don’t we have Able show you to a bath and room?”</i>");
			
			processTime(3);
			
			// [Yes] [No]
			clearMenu();
			addButton(0, "Yes", thareManorResponse, "finish yes", "Yes", "Have the zil show you to a room - and maybe see what else he’s got to offer.");
			addButton(1, "No", thareManorResponse, "finish no", "No", "Time to hit the road.");
			break;
		case "finish no":
			showDarnock(true);
			
			output("You make your excuses.");
			output("\n\n<i>“Of course! Of course,”</i> sighs the old human. <i>“Just like your father, you must hare off into the great unknown at the first opportunity. Until next time, [pc.name] Steele!”</i>");
			
			processTime(2);
			pc.createStatusEffect("Thare Manor Visit", 0, 0, 0, 0, true, "", "", false, 30);
			IncrementFlag("PLANTATION_MEALS");
			
			// Move PC to Thare Plantation square
			thareManorMenu(true);
			break;
		case "finish yes":
			showAble();
			showName("GUEST\nROOM");
			
			output("You follow a supple, white-clad rump, a pair of wings the size of hoverboards and the scent of deep honey back out into the marble hall and up a grand staircase. Able leads you into a plush guest room, heavy on dark wood and lace. A large, claw-footed tub catches your eye in the adjoining washroom. Insects dance beyond the tall duraflex windows.");
			output("\n\n<i>“Can I be of service in any way, [pc.Master]?”</i> murmurs the wasp twink, arms behind his back and gazing at you with half-lidded eyes and a soft smile. The smell of sweet pheromones is more intense in here than it was out on the airy veranda.");
			output("\n\nDo zil <i>ever</i> stop thinking about sex?");
			
			processTime(2);
			IncrementFlag("PLANTATION_MEALS");
			// + Lust
			pc.changeLust(10 + rand (11));
			
			// [Appearance] [Bath] [Fuck] [Sleep]
			thareAbleMenu();
			break;
	}
}

public function getAblePregContainer():PregnancyPlaceholder
{
	var ppAble:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppAble.hasCock()) ppAble.createCock();
	ppAble.shiftCock(0, GLOBAL.TYPE_BEE);
	ppAble.cocks[0].cLengthRaw = 5;
	ppAble.cocks[0].cThicknessRatioRaw = 2;
	ppAble.cocks[0].flaccidMultiplier = 0.20;
	ppAble.elasticity = 1.25;
	ppAble.balls = 2;
	ppAble.ballSizeRaw = 1;
	ppAble.createStatusEffect("Uniball");
	ppAble.cumType = GLOBAL.FLUID_TYPE_HONEY;
	return ppAble;
}

public function thareAbleMenu(menu:String = "intro"):void 
{
	clearMenu();
	
	var sleepTooltip:String = "good night’s sleep";
	if(hours >= 6 && hours < 18) sleepTooltip = "siesta";
	
	switch (menu)
	{
		case "intro":
		case "finish":
			addButton(0, "Appearance", thareAbleResponse, "appearance");
			if(menu != "finish") addButton(1, "Bath", thareAbleResponse, "bath", "Bath", "Take a bath and maybe talk to the zil a little as you do.");
			else addDisabledButton(1, "Bath");
			if(pc.lust() >= 33) addButton(2, "Fuck", thareAbleMenu, "sex", "Fuck", "Yes. He can be of service.");
			else addDisabledButton(2, "Fuck", "Fuck", "You are not aroused enough to do this!");
			addButton(9, "Sleep", thareAbleResponse, "sleep", "Sleep", "You’re bagged after the jungle trek and meal. No time for anything but a " + sleepTooltip + ".");
			break;
		case "talk":
			addButton(0, "Him", thareAbleResponse, "him", "Him", "Ask how he came to work at the plantation.");
			if(flags["ABLE_TALKED"] != undefined) addButton(1, "Thare", thareAbleResponse, "thare", "Thare", "Ask where the name comes from.");
			addButton(14, "Finish", thareAbleResponse, "finish", "Finish", "Finish washing up.");
			break;
		case "sex":
			// [Buttfuck] [Lick n Ride] [Fuck n Ride]
			if(pc.hasCock() && pc.smallestCockVolume() <= getAblePregContainer().analCapacity()) addButton(0, "Buttfuck", thareSexResponse, "buttfuck", "Buttfuck", "Put the subby zil’s ass to the use it was made for.");
			else addDisabledButton(0, "Buttfuck", "Buttfuck", "You need a non-gigantic cock to do this.");
			if(pc.hasVagina()) addButton(1, "Lick n Ride", thareSexResponse, "lick n ride", "Lick and Ride", "Get licked, then give the zil boy a ride.");
			else addDisabledButton(1, "Lick n Ride", "Lick and Ride", "You need a pussy for this.");
			if(pc.hasCock() && pc.smallestCockVolume() <= getAblePregContainer().analCapacity() && pc.hasVagina()) addButton(2, "Fuck n Ride", thareSexResponse, "fuck n ride", "Fuck and Ride", "Do the zil up the butt, then let him mount you.");
			else addDisabledButton(2, "Fuck n Ride", "Fuck and Ride", "You need a reasonably-sized cock and pussy to do this.");
			addButton(9, "Sleep", thareAbleResponse, "sleep", "Sleep", "You’re bagged after the jungle trek and meal. No time for anything but a " + sleepTooltip + ".");
			break;
		case "sleep":
			// If time 07:01-17:59, + 4 hours, health + energy = 100%
			if(hours >= 6 && hours < 18) addButton(0, "Next", thareAbleResponse, "siesta");
			//If time 18:00-22:30, set time to 08:00 next morning, health + energy = 100%
			else addButton(0, "Next", thareAbleResponse, "stay night");
			break;
	}
}

public function ableSexed():Boolean 
{
	if(flags["ABLE_BUTTSEXED"] != undefined) return true;
	if(flags["ABLE_LICKNFUCKED"] != undefined) return true;
	if(flags["ABLE_BOTHWAYS"] != undefined) return true;
	
	return false;
}

// Room Business
public function thareAbleResponse(response:String = "none"):void 
{
	clearOutput();
	author("Nonesuch");
	
	switch (response)
	{
		case "appearance":
			showAble();
			
			output("Able is a 5\' 6\" zil male. His black carapace is dressed in white servant robes, tight trousers overlaid by a long, belted smock, emblazoned on the breast, like every other Thare worker’s clothes, with the Snugglé logo. He is perhaps slighter than the zil average, with narrow, girly shoulders. What little meat there is to be found on his lean, supple frame is concentrated on his backside, a heart-shape which subtly blossoms out and stretches the fabric of his tight costume in a pleasing manner. His golden face mimics that shape; a cute, pointed chin which curves out to accommodate his black eyes, delicate cheekbones and short, straight nose. His fuzzy pseudo-hair is combed primly back. When he talks, it’s difficult for your eyes not to be drawn to the wag of his brilliant yellow tube-tongue.");
			if(ableSexed()) output(" Beneath the carapace between his thighs is exactly what you’d expect to be; a five-inch foreskinned zil dick which smells far better than it has any right to.");
			
			break;
		case "bath":
			showAble();
			showName("GUEST\nROOM");
			
			output("The bath is a frightfully old-fashioned affair that doesn’t simply displace water into the deep, ceramic vessel, so you have to turn the taps and wait a few minutes for it to fill. Able mixes in some foam and then stands by with a towel as you discard your [pc.gear].");
			if(!pc.isNude())
			{
				// Not naked, exhibitionist:
				if(pc.exhibitionism() >= 66) output(" You give him a small show as you do it, throwing your garments away with little flicks and wiggles, exhaling slowly as you bare more and more of your [pc.skinFurScales].");
				// Not naked, not exhibitionist:
				else output(" You feel fleetingly uncomfortable doing this in front of the manservant");
			}
			// If fucked/had bath before:
			if(ableSexed() || flags["ABLE_BATHS"] != undefined) output(" - but that is swiftly followed by the thought that he’s seen it all before.");
			// If else:
			else output(" - but then the first thought of what zil are like in the wild makes such an attitude laughable.");
			output(" You sink your bare [pc.skinFurScalesNoun] into the steaming hot water with a pleased sigh, feeling the little aches and knots of stress picked up from slogging through an alien wilderness slipping off you.");
			output("\n\n<i>“You look like you needed that,”</i> murmurs Able. He sounds genuinely happy <i>you’re</i> happy.");
			
			processTime(5 + rand(6));
			
			pc.createStatusEffect("Thare Manor Bath");
			
			// [Him] [Thare] [Finish]
			thareAbleMenu("talk");
			break;
		case "him":
			showAble();
			
			output("<i>“Why are you here, Able?”</i> you ask, as you massage gel into your");
			if(pc.isBald()) output(" scalp");
			else output(" [pc.hair]");
			output(". <i>“Doesn’t seem like the zil are sold on the professor’s gig as a whole.”</i>");
			output("\n\n<i>“Before Mr. Darnock came, I was a zil amongst other zil. Happy but ignorant,”</i> replies Able in his calm, measured voice. <i>“I lived amongst the trees and within the moment, prey to the serpent-lions and evil sirens of the deep forest. Now, I have a name and a profession that I enjoy. I have gained perspective my fellows cannot. My sir is right - the coming of people with great knowledge from the stars means we must cast aside our ignorance and connect with them, learn from them. Otherwise we risk annihilation.”</i> ");
			output("\n\n<i>“And so far,”</i> he goes on in a harder tone, <i>“only Mr. Darnock’s company has reached out to us. Not the people of the place you call Esbeth, who imprison us or drive us away with their giant white stings; not those who call themselves the Zen jinn, who covet the sirens’ dark secrets and kill any that stand in their way; and not the terrible black wings, who stalk this land now, spiriting our folk away.”</i>");
			output("\n\n<i>“So why haven’t more zil taken him up on his offer?”</i> you say, looking over the tub’s rim at him.");
			output("\n\n<i>“Um. I’m not </i>typical<i> of zil. I don’t think Mr. Darnock understands this,”</i> the slim zil says, shuffling his carapace-covered feet. <i>“For most zil, contests of physicality and sexuality are thrilling, and practically demanded when encountering a stranger. The struggles reveal the strengths and weaknesses of each party. Only after the struggle and resulting sexual relief do they consider trade or diplomacy. For an outsider, it would be even harder. Naleen and Vanae are poor conversationalists; why should your people be any different? That’s why the others you see in the vault will lead off with an assault. I never liked that, because I preferred submitting straight away. It just feels so much better, you know? So I was happy to take orders from sir. My brothers and sisters though... for them it was a non-starter, because Mr. Darnock refused to act as expected.”</i>");
			
			processTime(3);
			
			// Unlocks "Thare"
			if(flags["ABLE_TALKED"] == undefined)
			{
				flags["ABLE_TALKED"] = 1;
				addButton(1, "Thare", thareAbleResponse, "thare", "Thare", "Ask where the name comes from.");
			}
			addDisabledButton(0, "Him");
			break;
		case "thare":
			showAble();
			
			output("<i>“Thare,”</i> you say, scrubbing your [pc.legOrLegs]. <i>“Strange name. And according to you the zil don’t go in for naming stuff in the first place. Where does it come from?”</i>");
			output("\n\n<i>“Well, that’s sort of it,”</i> chuckles Able quietly. <i>“When Mr. Darnock first found this place, he rounded on the nearest group of zil and asked ‘What do you call it?’ and they replied ‘I dunno, it’s just there.’ He misheard, and so... He knows now of course, but the signs and maps all bear the name, and I think sir has grown to like it.”</i>");
			output("\n\n<i>“What was here before?”</i>");
			output("\n\n<i>“A natural clearing claimed by a rival clan,”</i> replies Able, looking at his feet. <i>“They always come back here every few years to reap its bounty, then leave to allow it to regrow. That is the other reason why many zil do not wish to work with Mr. Darnock.”</i>");
			
			processTime(2);
			
			addDisabledButton(1, "Thare");
			break;
		case "finish":
			showAble();
			showName("GUEST\nROOM");
			
			output("You allow yourself a few more minutes of luxuriating in the steamy, opaque water before rising out, gladly accepting the fluffy towel Able hands you. Once you make it clear you’d sooner dry yourself, he goes back to his position by the bedroom door. Massaging your hot, damp form, you eye his supple flesh tightening the fabric of his uniform as he goes.");
			
			processTime(5 + rand(3));
			
			pc.shower();
			IncrementFlag("ABLE_BATHS");
			
			// [Fuck] [Sleep]
			thareAbleMenu("finish");
			break;
		case "sleep":
			showAble();
			showName("GUEST\nROOM");
			
			output("<i>“Thank you,”</i> you yawn, <i>“but that will be all.”</i>");
			output("\n\nAble bows and leaves silently. You");
			// If no bath:
			if(!pc.hasStatusEffect("Thare Manor Bath")) output(" undress and");
			else pc.removeStatusEffect("Thare Manor Bath");
			output(" sink into the overstuffed bed, falling into a deep sleep within seconds.");
			
			processTime(1 + rand(2));
			
			// Next
			thareAbleMenu("sleep");
			break;
		// If PC does not stay night
		case "siesta":
			showDarnock(true);
			showLocationName();
			
			output("You awaken a few hours later feeling thoroughly refreshed, if slightly fuzzy about the time of day. You take your time getting out of bed and dressing yourself, slightly reluctant to leave the plush opulence of the mansion for the muggy hostility of the Mhen’gan jungle. Darnock sees you off at the door, all smiles.");
			output("\n\n<i>“The best of luck on your adventures, " + pc.mf("Sir", "Miss") + " Steele!”</i> he jollies. <i>“Do drop in again if you’re ever in the area.”</i>");
			
			// If time 07:01-17:59, + 4 hours, health + energy = 100%
			processTime((4 * 60) + rand(16));
			sleepHeal();
			
			// Next
			thareManorMenu(true);
			break;
		// If PC does stay night
		case "stay night":
			showDarnock(true);
			showLocationName();
			
			output("You awaken the next morning feeling thoroughly refreshed. You take your time getting out of bed and dressing yourself, slightly reluctant to leave the plush opulence of the mansion for the muggy hostility of the Mhen’gan jungle. Darnock sees you off at the door, all smiles.");
			output("\n\n<i>“The best of luck on your adventures, " + pc.mf("Sir", "Miss") + " Steele!”</i> he jollies. <i>“Do drop in again if you’re ever in the area.”</i>");
			
			// If time 18:00-22:30, set time to 08:00 next morning, health + energy = 100%
			processTime(((24 - hours + 7) * 60) + (60 - minutes));
			eventBufferXP();
			sleepHeal();
			
			// Next
			thareManorMenu(true);
			break;
	}
}

// Sexings
public function thareSexResponse(response:String = "none"):void 
{
	clearOutput();
	author("Nonesuch");
	
	var ppAble:PregnancyPlaceholder = getAblePregContainer();
	
	var randCock:Array = [];
	var randCunt:Array = [];
	var x:int = -1;
	var y:int = -1;
	var z:int = -1;
	var i:int = 0;
	var fromBoth:Boolean = (pc.statusEffectv4("Thare Manor Temp Value") != 0);
	var cuntStretched:Boolean = false;
	
	switch (response)
	{
		case "buttfuck":
			showAble(true);
			
			var useCuntTail:Boolean = pc.hasTailCunt();
			randCock = [];
			for(i = 0; i < pc.cocks.length; i++)
			{
				if(pc.cockVolume(i) <= ppAble.analCapacity()) randCock.push(i);
			}
			if(randCock.length > 0) x = randCock[rand(randCock.length)];
			if(x == -1) x = pc.smallestCockIndex();
			
			if(!pc.hasStatusEffect("Thare Manor Bath")) output("You smirk back at him and [pc.move] to the bed, unfastening your [pc.gear] as you do.");
			else
			{
				output("You");
				if(pc.hasLegs()) output(" pad");
				else output(" slide");
				output(" after Able, letting your towel drop audibly to the floor to make him turn and drink in your naked form.");
			}
			output(" You");
			if(!pc.isNaga()) output(" clamber");
			else output(" slither");
			output(" onto the overstuffed bed, enjoying the plush give of it against your hands and [pc.butt] as you turn over and consider the supple bodied zil servant at length. His own smile has been replaced with a slightly vacant expression as his black insect eyes travel up and down your body. The smell of honeyed pheromones is becoming cloying, causing heat to rise up to your [pc.skinFurScales], making you feel tender and tensed up with lust. It requires only for you to lounge back and lasciviously slide a finger up the length of your [pc.cock " + x + "] a single time for it to become burningly, readily erect.");
			output("\n\n<i>“Come here, sissy boy,”</i> you murmur, <i>“and get ready to eat some pillow.”</i>");
			output("\n\nAble ducks his head submissively, but his thin fingers are eager as he peels off his neat smock and trousers and climbs his gleaming black boy-whore body onto the squashy mattress with you. Silently and without instruction he retracts the carapace around his chest, sliding the hard chitin to the side so that you can drink in the subtle ripples of his lean yellow under-front - quite sensitive, by the way he tenses up and inhales sharply, wings twitching when you brush across a small, black nipple, almost instantly becoming erect to your touch.");
			output("\n\nThe carapace across his groin seems to retract of his own volition, his fat, five-inch foreskinned zil prick seemingly unwilling to be caged up any longer - he sighs breathily as it pops into view. Instantly the pheromone hum becomes far stronger, stepping up from a sultry background perfume to a heavy, heady atmosphere, making your lust-driven actions unstoppable, instinctive. Your breath comes hot and hard as you push into the zil, bumping your [pc.chest] into his flat front as you grip his shoulder and turn his pert face and chest around, exposing the flawless curve of his back and the round swell of his rump.");
			output("\n\nIt seems to be the only part of Able that isn’t thin and understated - a nice soft black apple shape, perfect for squeezing around a [pc.cock " + x + "]. A pity his carapace prevents you from properly pinching it. Although... you slide your hand up his warm abdomen, holding him comfortingly as you spear between his cheeks with your fingers and carefully spread his tar anus, nestled between the barest valley of soft flesh. He clutches handfuls of the sheets as you push into his tight warmth, testing him.");
			
			pc.cockChange();
			
			// First:
			if(flags["ABLE_BUTTSEXED"] == undefined && flags["ABLE_BOTHWAYS"] == undefined)
			{
				output("\n\n<i>“You must have done this before?”</i> you breathe. <i>“Ass like this, on a boy like you, must have.”</i>");
				output("\n\n<i>“Yes " + pc.mf("sir", "ma’am") + ",”</i> he says thickly. <i>“But not with... star people. Please... ah... be gentle.”</i>");
			}
			// Repeat:
			else
			{
				output("\n\n<i>“Not so bad getting it from a star person, is it?”</i> you whisper teasingly.");
				output("\n\n<i>“No " + pc.mf("sir", "ma’am") + ",”</i> he replies. The blend of trepidation and excitement in his breathy tones has your pulse thudding even harder in your temple. <i>“But please... ah... be gentle...”</i>");
			}
			// {merge}
			output("\n\nYou grip Able’s armored shoulders and push your [pc.cockHead " + x + "] against his black rose, opening the way with your bulging hardness with slow, gradual pushes of your [pc.hips], waiting for the zil servant to stop tensing up each time before introducing a little more of your [pc.cock " + x + "] into his colon. A groan is forced past your [pc.lips] as you sink into him properly; he’s wonderfully, sweat-inducingly tight, and it’s all you can do to keep a grip on your urge and not fuck that warm clench for all you are worth. But slow and steady wins the race... and you’ve got all the time in the world to thoroughly enjoy this honeyed room service.");
			// Small-average cock:
			if(pc.cocks[x].cLength() <= 8)
			{
				output("\n\nWith a few sensual pushes, you are able to mire yourself up to the veined wick in his ass, your");
				if(pc.balls <= 0) output(" [pc.hips]");
				else output(" [pc.balls]");
				output(" pressing delightfully into warm carapace.");
				output("\n\n<i>“I-is that good for you, " + pc.mf("master", "ma’am") + "?”</i> the slim zil stutters, his wings twitching a little. You answer him by affectionately running your hand through his fuzzy spine hair, turning that into a firm push of his head into the sheets as you draw your [pc.cock " + x + "] almost all the way out and firmly slot it back home.");
			}
			// Big cock:
			else
			{
				output("\n\n<i>“F-fuck,”</i> moans the zil, as you stretch him wide with more and more of your thick monster-dick, inch after inch disappearing past his sphincter. He’s only got himself to blame, as far as your lust-sodden mind is concerned: first getting you all worked up with his honeyed scent, jouncing around that tight bum of his, and then presenting himself for your service... you’re absolutely determined to get as much of your [pc.cock " + x + "] into his sweet squeeze as possible. You grunt with deep satisfaction when your");
				if(pc.balls <= 0) output(" [pc.hips]");
				else output(" [pc.balls]");
				output(" press delightfully into warm carapace,");
				if(!pc.hasKnot()) output(" almost all of your");
				else output(" all but the fist-like knot of your");
				output(" massive bottom-bitch taming stick mired in his ass.");
				output("\n\n<i>“S-sorry for swearing,”</i> Able manages, looking over his shoulder with wide, solemn eyes. <i>“That was vulgar of me... I hope this is good for you, " + pc.mf("master", "ma’am") + "?”</i> You answer him by affectionately running your hand through his fuzzy spine hair, turning it into a firm push of his head into the sheets as you draw your [pc.cock " + x + "] almost all the way out and then firmly slot every inch back home.");
			}
			// {merge}
			output("\n\nYou go at him gently to begin with, withdrawing and then spearing into him deep with gradual thrusts of your [pc.hips], luxuriating in jet boy pussy clasping every inch of your [pc.cock " + x + "] at the same time as ensuring he gets entirely used to the motion.");
			// High cum quantity:
			if(pc.cumQ() > 4000) output(" The zil is tight enough to force a steady drizzle of pre out of your incredibly juiced-up cock - a taster of the several liters of [pc.cum] you very much intend to reward his fine ass service with - and your passage is oiled more and more by your own arousal as you steadily pump him.");
			output(" Able gasps, muffled by the pillows as you hold him still and bend into him demandingly; his stubby erection jumps, oozing golden syrup and properly catching your attention for the first time.");
			// Cunt-tail:
			if(useCuntTail)
			{
				output("\n\nYou haven’t been able to separate the competing fronds of your physical arousal, so intense has it been since you began to wallow in Able’s pheromones, but the sight of his juicy sugar-prick leaking everywhere makes the lust of your [pc.cuntTail] jump forwards so insistently you actually shudder and gasp. Almost without input it slithers between the zil’s armored thighs and fastens itself on his black sting.");
				output("\n\n<i>“Oh moon, shade and sun, what is that?!”</i> the zil cries out, and then moans as you push your [pc.cock " + x + "] well past his clenching sphincter, forcing more honey-seed out of him and into the hungry, kneading maw of your tail-cunt.");
				output("\n\n<i>“");
				if(flags["ABLE_BUTTSEXED"] != undefined) output("You weren’t going to swear again");
				else output("No swearing");
				output(",”</i> you chide him, giving him a hard swat on the upturned backside. <i>“And don’t worry about that. It’s something you’re going to enjoy - a lot.”</i>");
				output("\n\n<i>“S-sorry...”</i> His next gasp blends with your own exhilarated groan as another thrust of your [pc.hips] forces his cock to rub along the wet, sensitive walls of your [pc.cuntTail].");
			}
			// If else:
			else
			{
				output("\n\nThe opportunity to tease the sensitive, submissive zil some more is far too good to pass up. You slide your hand between his slim, armored thighs and catch hold of his hot prick. His apprehensive murmur turns into a full-throated gasp when you begin to firmly jerk him, at the same time as firmly meeting his cute, upturned ass with your [pc.hips]. Honey oozes and spurts freely from the tip of his cock, bulging and flexing up in your kneading grip. The syrupy smell saturating your nostrils compels you to swiftly change hands, bringing your fingers to your mouth so you can suck them clean.");
			}
			// {merge}
			output("\n\nThe sweet, horny taste of bee-seed");
			if(!useCuntTail) output(" tingles on your [pc.lips]");
			else output(" trickles down your the throat of your tail, seeming to light up every nerve as it goes down");
			output(" and suddenly the urge becomes altogether too much.");
			if(!useCuntTail) output(" You grip Able’s shoulder firmly with one hand, the other feverishly pulling at his prick,");
			else output(" You grip Able’s shoulders firmly");
			output(" and pile drive into his tight, obsidian tunnel with everything you’ve got, your");
			if(pc.balls <= 0) output(" hips");
			else output(" [pc.balls]");
			output(" beating out a compulsive rhythm against his shiny, chitinous cheeks as you reach inside his warm clench with your [pc.cock " + x + "] again and again. The gritted gasps and muffled moans you draw out of the servile zil only compel you to screw him harder and harder, losing yourself in the glorious pulse of pushing deep into boy pussy with bestial abandon.");
			output("\n\nAble’s stubby prick twitches and seizes up repeatedly in your");
			if(!useCuntTail) output(" hand");
			else output(" [pc.cuntTail]");
			output(", dribbling thick honey almost freely. It’s impossible, from either the clench and writhe of his supple body or from his gasps, to tell if you make him properly orgasm or if you’ve pushed him into a state of persistent arousal, enjoying it almost as if it were a pussy you were pounding; he’s profoundly satisfying to fuck, whatever the case.");
			output("\n\nOrgasm seizes up your whole body and you allow it to overwhelm you, throwing your head back, holding onto the zil’s shiny hips and thrusting every inch of your [pc.cock " + x + "] into his ass and unloading gloriously,");
			if(pc.balls > 0) output(" your [pc.balls] tightening up before");
			output(" surging your pent up heat deep into him with one hard thrust after another, gasping and growling your delight at the sensation of immense release.");
			// Low output:
			if(pc.cumQ() < 500)
			{
				output("\n\nYou hold him firmly on your pulsating cock, determined to bury every last drop of your [pc.cum] inside the lithe butt boy. You withdraw slowly when you’re finally done, savoring the slide of his cum-slicked tunnel down your throbbing cock, and the small dribble of [pc.cumColor] that follows you out and down his black thigh when it does flop out.");
			}
			// High output:
			else
			{
				output("\n\nThose pheromones of his have pushed your");
				if(pc.hasStatusEffect("Blue Balls")) output(" over-stuffed balls");
				else output(" jizz production");
				output(" into overdrive, making you cum like an out-of-control hose. At least it’s mired in something perfectly designed to contain it. Able exhales hard as you pack his intestines with [pc.cum], then cries out as you keep going, swelling his svelte stomach out with your thick, [pc.cumFlavor] seed. Good - the waif-like zil looks like he needs better nutrition, and no better way to receive it, to your mind. You hold him firmly on your pulsating cock until cum begins to spurt back out of his hole, at which point you pull out and spray the last of your gratuitous payload up the arch of his back.");
			}
			// {merge}
			output("\n\nAble sinuously curls himself up on the bed and turns to look at you, waiting for his pretty yellow chest to steady slightly before speaking.");
			output("\n\n<i>“I- I hope you enjoyed me, " + pc.mf("sir", "ma’am") + ",”</i> he says, antennae twitching.");
			// High output:
			if(pc.cumQ() >= 1000) output(" He holds his swollen belly and groans slightly before going on. <i>“If you’ll just wait one moment - " + pc.mf("sir", "ma’am") + " seems to have packed me completely full of " + pc.mf("sir", "ma’am") + "’s cum. I will change the sheets directly, but first I must...”</i> He gets up and knock-knees his way to the bathroom, doing his best not to leave a trail of [pc.cum] behind him, your fond laughter following him all the way.");
			// Low output:
			else output(" <i>“I will change the sheets directly - just give me one moment.”</i> You grin as you watch him knock-knee his way to the bathroom.");
			output("\n\nHe absolutely insists on changing the sheets, so it’s into the smell of fresh linen rather than horny bee sugar you eventually sink yourself into a few minutes later. Able gives you a shy smile as he turns off the lights and departs. You are asleep within moments.");
			
			processTime(30 + rand(11));
			
			if(useCuntTail)
			{
				for (i = 0; i < 6; i++)
				{
					pc.loadInCuntTail(ppAble);
				}
			}
			else
			{
				//pc.loadInMouth(ppAble);
			}
			pc.orgasm();
			IncrementFlag("ABLE_BUTTSEXED");
			
			// Next
			thareAbleMenu("sleep");
			break;
		case "lick n ride":
			showAble(true);
			
			randCunt = [];
			for(i = 0; i < pc.vaginas.length; i++)
			{
				if(pc.vaginalCapacity(i) >= ppAble.cockVolume(0)) randCunt.push(i);
			}
			if(randCunt.length > 0) x = randCunt[rand(randCunt.length)];
			if(x == -1) x = pc.biggestVaginaIndex();
			
			randCunt = [];
			if(pc.totalVaginas() > 1)
			{
				for(i = 0; i < pc.vaginas.length; i++)
				{
					if(i != x) randCunt.push(i);
				}
				y = randCunt[rand(randCunt.length)];
			}
			
			if(!pc.hasStatusEffect("Thare Manor Bath")) output("You smirk back at him and [pc.move] to the bed, unfastening your [pc.gear] as you do.");
			else
			{
				output("You");
				if(pc.hasLegs()) output(" pad");
				else output(" slide");
				output(" after Able, letting your towel drop audibly to the floor to make him turn and drink in your naked form.");
			}
			output("You");
			if(!pc.isNaga()) output(" clamber");
			else output(" slither");
			output(" onto the overstuffed bed, enjoying the plush give of it against your hands and [pc.butt] as you turn over and consider the supple bodied zil servant at length. His own smile has been replaced with a slightly vacant expression as his black insect eyes travel up and down your body. The smell of honeyed pheromones is becoming cloying, causing heat to rise up to your [pc.skinFurScales], making you feel tender and tensed up with lust.");
			output("\n\nYou lounge back, spreading your [pc.hips] with apparent carelessness as you gaze at him, exposing the [pc.cuntColor " + x + "] of your [pc.vagina " + x + "] to the open air.");
			output("\n\n<i>“See anything that interests you, boy?”</i> you ask with husky archness.");
			output("\n\nAble keeps his eyes submissively to the floor, but trips over to the king-sized bed and climbs his lithe, tight form on with barely concealed enthusiasm. He slides his thin, carapace-covered fingers along your thigh, excitement tightening his fresh young features as he takes in the moist, fragrant treat you’ve deigned to present him with. You’re slightly worried that he’s forgotten to breathe - perhaps you have to order him to do that? You stifle a");
			if(pc.isBimbo()) output(" giggle");
			else output(" laugh");
			output(" and revive your serene, imperious attitude.");
			output("\n\n<i>“Lick, boy. Then... if you’ve been");
			if(!pc.isBimbo()) output(" sufficiently");
			else output(", like,");
			output(" pleasing to me... we might see about");
			if(!ableSexed()) output(" whatever you’ve got beneath that armor");
			else output(" that pent-up little erection of yours");
			output(".”</i>");
			output("\n\n<i>“Yes " + pc.mf("sir", "ma’am") + ",”</i> says Able, with an appropriate blend of meekness and avidity.");
			output("\n\nWhen the zil opens his small, cute mouth next, it’s to let his brilliant yellow tube tongue spiral all the way out. He curls his nimble hands around your [pc.hips] and lets it trail along the sensitive flesh of your inner thigh, his hot breath spreading itself over your [pc.vagina " + x + "]. The syrupy smell of his pheromones is high in your nose, combining with the steadiness of his actions to build your arousal almost unbearably, your pussy");
			if(!pc.isSquirter(x)) output(" beading");
			else output(" dribbling");
			output(" [pc.girlCum] freely whilst the sucking dart of his tongue is still tracing your outer lips. You feel a deep desire to grab the teasing little fuck boy by the hair-spikes and force his head between your legs... but no. That’s not becoming of a visiting aristocrat such as yourself. Not yet.");
			output("\n\nInstead, you hum your approval when Able does finally move inwards, lapping delicately at the soft innards of your [pc.vagina " + x + "], circling around your hole first one way then the other with worshipful movements until it is lush and wide, before sliding his thin, dexterous muscle slowly inside. Your [pc.thighs] clench up and your pussy drizzles [pc.girlCum] in delighted response.");
			
			var wetList:Array = [];
			var wetSelect:int = 0;
			
			if(InCollection(pc.girlCumType, [GLOBAL.FLUID_TYPE_HONEY, GLOBAL.FLUID_TYPE_NECTAR]))
				wetList.push(1);
			if(InCollection(pc.girlCumType, [GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, GLOBAL.FLUID_TYPE_STRAWBERRY_MILK, GLOBAL.FLUID_TYPE_CHOCOLATE_CUM, GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK, GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK, GLOBAL.FLUID_TYPE_VANAE_CUM, GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT, GLOBAL.FLUID_TYPE_FRUIT_CUM, GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM]))
				wetList.push(2);
			if(pc.isSquirter(x) && pc.girlCumQ() >= 1000)
				wetList.push(3);
			
			if(wetList.length > 0) wetSelect = wetList[rand(wetList.length)];
			
			// If PC girlcum = honey:
			if(wetSelect == 1)
			{
				output("\n\n<i>“Honey!”</i> he says, head shooting up in surprise. His yellow tongue roams his lips, tasting the golden fluid daubed there in wonder. <i>“Just like our women. H-how is that possible?”</i>");
				output("\n\n<i>“The wonder of our star knowledge,”</i> you reply dryly. <i>“Do get back to what you were doing, little boy. You can have as much as you like...”</i>");
			}
			// If PC girlcum = chocolate OR fruit:
			else if(wetSelect == 2)
			{
				output("\n\n<i>“Sweet,”</i> he decides a moment later, head rising up as he smacks his lips contemplatively. His lower face is daubed in [pc.girlCumColor] fluid. <i>“Not like our women, but... similar.”</i> He grins suddenly. <i>“Wonderful.”</i>");
				output("\n\n<i>“Yes, wonderful,”</i> you laugh with a shake of the head. <i>“Do get back to what you were doing, little boy. You can have as much as you like...”</i>");
			}
			// If else, PC girlcum high:
			else if(wetSelect == 3)
			{
				output("\n\n<i>“Whugh!”</i> he splutters, head jerking back a bit. He looks up to you solemnly, the bottom half of his face absolutely dripping with [pc.girlCumColor] fluid. <i>“S-sorry about that " + pc.mf("sir", "ma’am") + ", but you are... you seem quite... voluble.”</i>");
				output("\n\n<i>“I mark my territory,”</i> you reply breezily. <i>“And frisky little boys of mine often get thirsty. Get back to it.”</i>");
				output("\n\nThe zil servant tries to remain as proper as possible, but you can tell by the fierce orange blush on his china-bone cheeks, a series of rapid blinks and a tightening of his grip around your thighs that he rather likes this explanation.");
			}
			// If else:
			else
			{
				output("\n\n<i>“Different to our women,”</i> he states, face rising up and lips smacking contemplatively, smeared in [pc.girlCumColor] fluid. He grins suddenly. <i>“Nice, though.”</i>");
				output("\n\n<i>“So glad you approve,”</i> you laugh with a shake of the head. <i>“Do get back to what you were doing, little boy. You can have as much as you like...”</i>");
			}
			// {merge}
			output("\n\nHe buries his face between your open thighs eagerly, nose rubbing against your mound as he spears his long, sweet-adoring tongue into you deep, finding and stroking at the most sensitive spots of your tunnel with its darting, dragging tip. The zil servant is motivated both by an obvious desire to please you and by a thirst for the juices you drip so liberally when he fans your arousal; eyes closed, he gorges on your lurid flower as avidly as any nectar-drunk bumblebee. Your [pc.vagina " + x + "] quivers around his searching, flicking tongue, pure ecstasy pulsing through you when he finds and caresses that particularly tender zone an inch and a half inside from your entrance, making you arch your back and grip handfuls of the sheets; you’re more than happy to reward that kind of attention with a steady");
			if(!pc.isSquirter(x)) output(" drip");
			else output(" dribble");
			output(" of [pc.girlCum] delivered directly into his shifting mouth.");
			// If 1 < Vagina:
			if(y != -1) output(" With one hand he slowly traces and fingers your [pc.vagina " + y + "], ensuring that it gets some of the same treatment and your burgeoning lust is bumped up to even greater heights.");
			output("\n\nHe reaches his tongue all the way up to delicately touch at your cervix, before dragging the sucking tip down your wet walls, finishing by flicking at your [pc.clit " + x + "] furiously. That’s too much. You clench your [pc.thighs] around his head fiercely and orgasm to it, making sure that wonderful, worshipful mouth goes absolutely nowhere as you seize up again and again with intense pleasure, smearing his face liberally with your <i>“nectar”</i>. Only when the shimmering ecstasy of it has receded do you release him.");
			output("\n\nYou gaze down at the black-and-yellow boy panting for breath around your [pc.legOrLegs] half-lidded, letting distant contentment shine on your face. Still relaxing in your glow, it takes you a short while to appreciate he’s still wearing his tight servant outfit, and the smell of honeyed lust is still as strong as it ever was.");
			output("\n\n<i>“Take it off,”</i> you order softly, sitting up so your [pc.thigh] brushes against his damp face. Not quite sure where to put his eyes, Able does so, providing you with a strip-tease which is all the more enjoyable for the fumbling, blushing embarrassment it’s carried out with. He bares his slim, supple frame, clad in its gleaming black armor. He gasps slightly as the carapace shelling his chest and groin then peels back, as if forced open by his own overwhelming arousal, revealing first his flat, milquetoast chest with its tiny black nipples erect like miniature railing spikes, then his stubby, jet five inch boy dick, with those unbearably tight and needy trap balls all male zil have primly tucked away underneath. He leans his slim black glove-hands back on the sheets with his erection pointing eagerly in the air, gazing at you timidly, the very picture of sexual submissiveness.");
			output("\n\nYou are feeling lush and sensuous from the oral you just received, and the sight of the tight-bodied zil - combining with the sudden rush of heady lust that ensues when he peels back his groin armor and reveals the source of his pheromone musk - make your next series of actions completely irresistible.");
			output("\n\nWithin thirty seconds you have him pinned down by the elbows, biting your [pc.lips] as you rut him senseless, [pc.butt] planted firmly on his pelvis, bed creaking briskly beneath you. You ride your [pc.vagina " + x + "] up his smooth, chubby erection again and again, jerking him into your slick walls energetically, spurred on by the overwhelming smell of deep, oozing honey.");
			
			if(((pc.vaginalCapacity(x) * 0.5) < ppAble.cockVolume(0)) || pc.isVagTight(x)) cuntStretched = true;
			pc.cuntChange(x, ppAble.cockVolume(0));
			
			output(" Able gasps and arches his back to this treatment, cute nipples on his flat under-chest crying out for the occasional pinch, his squirming sending delicious quakes through your wet sex.");
			// Big pussy:
			if(!cuntStretched) output("\n\nTruth be told the little guy is lost in your man-eating cunt, his earnest five inches not at all able to fill you up - but the oral you made him give you first has made you wonderfully sensitized, each touch of his thickness against your walls sending delightful buzzes into your core, and you’re quite happy to tighten your thighs around his thin waist and work him ruthlessly hard.");
			// Small pussy:
			else output("\n\nWith the galaxy so full of assholes with ludicrously sized schlongs, it’s nice to be able to enjoy a nicely sized dick for once. Able’s earnest five inches plugs your petite pussy up quite nicely, and the oral you made him give you first has made you wonderfully sensitized. You exhale hard as his spasmodic thickness sends delightful buzzes rifling into your core, wonderful to tighten your muscles around and work ruthlessly hard.");
			// {merge}
			output("\n\nThe overload of pheromones humming through your veins precludes sitting back and luxuriating in the tender bee boy you’ve got trapped beneath you; instead you have to hump him harder and harder in a feedback of furious arousal. Able cries out as you clutch his arms and cock tightly, your");
			if(pc.hasBreasts()) output(" [pc.chest] bouncing up and down,");
			output(" lungs exhaling deeply, sweat beading on your brow as you rollercoaster into another, even bigger orgasm, pleasure coiling and coruscating through your soaked sex, more and more of it forced out using the hard, chubby obstruction mired in the middle of it.");
			// High femcum output:
			if(pc.girlCumQ() >= 2000) output(" There really is no end to your juices when you’re this aroused, and you’re happy to soak not just Able’s face but also his waist and flat tummy in [pc.femCum].");
			output("\n\nYou come down slowly, [pc.skin] prickling. You open your [pc.eyes] to notice that Able is gazing up at you pleadingly. It takes a moment for you to drink in the fact that, despite what must be an intense desire to do so, he hasn’t orgasmed.");
			output("\n\n<i>“I-if you don’t want me to--”</i> he whispers. <i>“" + pc.mf("Sir", "Ma’am") + "...”</i>");
			
			processTime(20 + rand(11));
			
			pc.orgasm();
			pc.orgasm();
			IncrementFlag("ABLE_LICKNFUCKED");
			pc.createStatusEffect("Thare Manor Temp Value", x, y, z, 0, true, "", "", false, 60);
			
			// [Let Him] [Deny]
			clearMenu();
			addButton(0, "Let Him", thareSexResponse, "let him");
			addButton(1, "Deny", thareSexResponse, "deny");
			break;
		case "fuck n ride":
			showAble(true);
			
			randCunt = [];
			for(i = 0; i < pc.vaginas.length; i++)
			{
				if(pc.vaginalCapacity(i) >= ppAble.cockVolume(0)) randCunt.push(i);
			}
			if(randCunt.length > 0) x = randCunt[rand(randCunt.length)];
			if(x == -1) x = pc.biggestVaginaIndex();
			
			randCock = [];
			for(i = 0; i < pc.cocks.length; i++)
			{
				if(pc.cockVolume(i) <= ppAble.analCapacity()) randCock.push(i);
			}
			if(randCock.length > 0) z = randCock[rand(randCock.length)];
			if(z == -1) z = pc.smallestCockIndex();
			
			if(!pc.hasStatusEffect("Thare Manor Bath")) output("You smirk back at him and [pc.move] to the bed, unfastening your [pc.gear] as you do.");
			else
			{
				output("You");
				if(pc.hasLegs()) output(" pad");
				else output(" slide");
				output(" after Able, letting your towel drop audibly to the floor to make him turn and drink in your naked form.");
			}
			output("You");
			if(!pc.isNaga()) output(" clamber");
			else output(" slither");
			output(" onto the overstuffed bed, enjoying the plush give of it against your hands and [pc.butt] as you turn over and consider the supple bodied zil servant at length. His own smile has been replaced with a slightly vacant expression as his black insect eyes travel up and down your body. The smell of honeyed pheromones is becoming cloying, causing heat to rise up to your [pc.skinFurScales], making you feel tender and tensed up with lust.");
			output("\n\nYou quite fancy the idea of letting an energetic zil boy go at you - but you also feel he should be shown his place first. And there’s only one, extremely satisfying way of doing that. You lounge back and lasciviously slide a hand up the length of your [pc.cock " + z + "]. In the heady atmosphere the zil is generating, it requires only that to become burningly, readily erect.");
			output("\n\n<i>“Take it off, boy,”</i> you murmur. <i>“And come up here.”</i>");
			output("\n\nAble ducks his head submissively, but his thin fingers are eager as he peels off his neat smock and trousers and climbs his gleaming black boy-whore body onto the squashy mattress with you. A single, meaningful glance downwards at your bulgingly erect cock is all the instruction the zil needs. You sigh blissfully as he straddles your waist, runs his thin, smooth fingers down your erection as he raises himself above it, positioning himself so that your [pc.cockHead " + z + "] is nestled between his cute, round buttocks. You teasingly jerk your [pc.hips], burrowing your erection inwards towards his black star, making him gasp quietly, wings twitching.");
			
			pc.cockChange();
			
			output(" Seemingly in response, the carapace around his chest retracts with a pencil-like snap, sliding the hard chitin to the side so that you can drink in the subtle ripples of his lean yellow under-front.");
			
			// First:
			if(flags["ABLE_BUTTSEXED"] == undefined && flags["ABLE_BOTHWAYS"] == undefined)
			{
				output("\n\n<i>“You must have done this before?”</i> you breathe. <i>“Ass like that, on a boy like you, must have.”</i>");
				output("\n\n<i>“Yes " + pc.mf("sir", "ma’am") + ",”</i> he says thickly. <i>“But not with... star people. Please... ah... be gentle.”</i>");
			}
			// Repeat:
			else
			{
				output("\n\n<i>“Getting used to taking it from star people, aren’t we?”</i> you grin at him wolfishly.");
				output("\n\n<i>“I - I guess so, " + pc.mf("sir", "ma’am") + ",”</i> he replies. He grins back with shy, shaky lust, wings fluttering. <i>“It is nice the way we do it...”</i>");
			}
			// {merge}
			output("\n\nYou grip Able’s slim, glossy thighs and force him slowly downwards, spreading first his butt-cheeks and then the soft anus buried at the center of all that austere armour with your [pc.cockHead " + z + "]. He tenses up nervously every few seconds, so you go as slow as your over-burdened arousal will allow you, insistently pressuring your [pc.cock " + z + "] upwards into his tight, warm resistance. Inch after inch of your bulging dick-meat disappears inexorably into the wasp boy’s pert, warm fuck-hole, a wonderful process made all the more delicious by the litany of small gasps and groans that tumble out of his small, open mouth as it goes on.");
			output("\n\nAfter");
			if(pc.cocks[z].cLength() <= 8)
			{
				output(" you’ve holstered every inch of your cock in his snug tunnel");
				if(pc.balls > 0) output(", [pc.balls] nestled gratifyingly against his candy-apple backside");
			}
			else output(" you’ve holstered as much of your cock into him as is possible");
			output(", you spread your [pc.hips] so that you can gently but firmly fuck him, bouncing his light weight on your lap, the delightful texture of boy pussy sliding up and down your bulging, tender [pc.cock " + z + "].");
			output("\n\n<i>“I-is this alright for " + pc.mf("sir", "ma’am") + "?”</i> the zil servant whispers, arching his back reactively as you dig into him particularly deep. <i>“If it’s - if it’s too tough - I could - p-perhaps I could put it in my mouth--”</i> You stick your thumb into that sweet, silly little hole instead, make him look you in the [pc.eyes] as you quicken your rhythm, riding his round, shiny ass up and down on your [pc.thighs], the shift and squeeze of his tunnel around your straining rod and the swimming buzz of sweet pheromones combining into an unstoppable orgasm.");
			output("\n\nYou clench his slim armored frame with one hand and hiss in sensual delight as release grips your whole frame, thrusting your straining cock into Able so that you can unload one wonderful gush of [pc.cum] after another deep inside him. After the first juicy pulse you open your eyes and lock them with the zil’s pupil-less black orbs, thumb still firmly rammed within his silky cheek, making sure he knows exactly who is pumping his ass full of thick, warm seed. Thin fingers plastered to your shoulders, he jerks, twitches and exhales hard to each demanding thrust of your [pc.hips]; but his tube-tongue libidinously wraps itself around and sucks at your digit as well, intoxicated lust beaming off his pretty-boy features.");
			output("\n\nWith a final sigh of deepest satisfaction, you wring what feels like the last drop of [pc.cum] in your");
			if(pc.balls > 0) output(" [pc.balls]");
			else output(" [pc.cock " + z + "]");
			output(" into the slim wasp-boy receptacle, and gradually withdraw your softening dong from his disgracefully abused hole, a fair amount of it following you out. [pc.SkinNounSimple] tingling enjoyably, you rest naked against the cornucopia of pillows arranged on the headboard, considering the black-armored morsel lying at your [pc.feet] panting for his breath with luxuriant ease.");
			
			processTime(20 + rand(11));
			
			pc.orgasm();
			pc.createStatusEffect("Thare Manor Temp Value", x, y, z, 1, true, "", "", false, 60);
			
			// [pb]
			clearMenu()
			addButton(0, "Next", thareSexResponse, "both ways");
			break;
		case "both ways":
			showAble(true);
			
			x = pc.statusEffectv1("Thare Manor Temp Value");
			if(x == -1) x = pc.biggestVaginaIndex();
			z = pc.statusEffectv3("Thare Manor Temp Value");
			if(z == -1) z = pc.smallestCockIndex();
			
			output("The smell of oozing, saccharine lust is as strong as it ever was - it’s not as if your rough buttfucking of the poor boy did much to stem the flow - and, with another wooden-sounding crack, the armor around Able’s groin slides back apparently of its own will, revealing the source of the smell. His chubby, gleaming jet-black cock springs upwards, so impatiently erect it bats off his washboard stomach, a tiny bead of honey-seed at its foreskinned tip. You can’t help but coo slightly as the pheromone intoxication heightens, your [pc.nipples]");
			if(InCollection(pc.breastRows[0].nippleType, [GLOBAL.NIPPLE_TYPE_FUCKABLE, GLOBAL.NIPPLE_TYPE_LIPPLES])) output(" wetting");
			else if(pc.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_FLAT) output(" pulsing");
			else if(pc.breastRows[0].nippleType == GLOBAL.NIPPLE_TYPE_TENTACLED) output(" stirring awake");
			else output(" hardening");
			output(" and [pc.eachVagina] widening eagerly. Lying on his side, Able blushes orange when he realizes where you’re staring; he closes his compact, boyish thighs, pupil-less eyes anywhere but your face, antennae twitching apprehensively.");
			output("\n\n<i>“S-sorry,”</i> he whispers, gingerly touching his backside. <i>“When " + pc.mf("sir", "ma’am") + " uses me, it’s difficult not to get - but I must control myself better. I must--”</i> he trails off in a buzzing, blissful susurration when you reach down and brush over his cute, eager prick with");
			if(pc.tallness <= 60)
			{
				if(pc.legCount == 1) output(" your");
				else output(" a");
				output(" [pc.foot]");
			}
			else output(" your [pc.legOrLegs]");
			output(".");
			output("\n\n<i>“You aren’t done yet, boy,”</i> you murmur. Under his unblinking gaze, you flop your [pc.cock " + z + "] back, spread your [pc.thighs] and present him with the sight of your gleaming-wet [pc.vagina " + x + "]. <i>“Since I did you the privilege of a good, hard dicking, I think perhaps you can do the same for me, hmm?”</i>");
			output("\n\nAble’s thin, smooth fingers are hesitant as they slide up your [pc.belly] towards your [pc.chest], but the nectar-drunken lust you can see tightening up his frame and making his delicate yellow chest tremble with excitement spurs him on. The fervor and concentration with which he traces your [pc.femcum]-dripping opening with his chitin-gloved digits and flicks at your [pc.nipples] with his long, thin tongue makes you");
			if(pc.isBimbo()) output(" giggle");
			else output(" guffaw");
			output(" - but the intense blush this causes to break out over his china-bone features makes you regret that a bit. You change tact, and offer him purred encouragement when he does something that sends flutters of pleasure through you, like stroking at your [pc.clit] until it bulges well out of its hood, or");
			if(!pc.hasFuckableNipples()) output(" pulling at your [pc.nipple] with hungry drags of his lips");
			else output(" darting his dexterous tongue between the folds of your [pc.nipple], lapping at your boob’s tender insides");
			output(".");
			output("\n\nThat does the trick. Forgetting his nervousness, the slim zil-boy grips your [pc.butt] with the austere armor of his hands and thrusts his fervid cock past the lips and into the sweltering insides of your pussy with one single, enthusiastic movement.");
			
			if(((pc.vaginalCapacity(x) * 0.5) < ppAble.cockVolume(0)) || pc.isVagTight(x)) cuntStretched = true;
			pc.cuntChange(x, ppAble.cockVolume(0));
			
			output(" The fug of zil pheromones sweetly swamping your senses, as well as the dart of his hands and tongue over the most sensitive points of your body has made [pc.eachVagina] incredibly needy, enflamed by the urgent sex it was so recently left out of and desperate to be filled. You clench up with profound satisfaction around Able’s smooth, chubby erection and grab his cute, round butt, urging him on.");
			output("\n\nThe zil pumps into you energetically, his gasping little exhalations puffing over your face as his warm, hard chest rubs over your [pc.chest], his tight sugar-cock dragging over your sensitive walls until you are");
			if(!pc.isSquirter(x)) output(" beading");
			else output(" gushing");
			output(" [pc.femcum] freely around it.");
			// Large capacity:
			if(!cuntStretched) output(" Of course his cute sissy prick can in no way gorge your massive breeding bay to satisfaction, but the little guy deserves credit for the way he jackhammers his slim hips into you with all his boyish energy. He moans breathily, wings twitching, when you flex your [pc.hips] and tighten up around him, trapping him within you and clenching up around his hot cock wetly; you slyly, lovingly slide a hand through his black, fuzzy hair, urging him on.");
			// Small capacity:
			else output(" His cute sissy prick is perfectly designed to plumb your tight cunt, and its incessant friction sends first shivers and then thrills of pure sensation tingling up your spine, making you squeal with pleasure, grasp his ass hard and squeeze your [pc.hips] around him, urging him on.");
			output("\n\nEventually driven to frenzy by the feel and heft of you around his chubby, tender little prick, the impassioned zil manservant athletically heaves your [pc.thighs] upwards");
			if(pc.hasLegs()) output(" so your [pc.feet] are dangling in the air");
			output(" and then fucks you as hard as his slim frame will allow, ramming his hard, hot five inches into your honeypot again and again. Your [pc.vagina " + x + "] quivers and then clenches up in orgasm, pulses of gratification seizing up your muscles made all the more intense by the way Able continues to mold his tight, perky body into yours and drives into your sex, forcing gasps and squeals of delight past your [pc.lips]. This is definitely the best way to screw a pet boy, it dreamily occurs to you - dick him hard first, show him exactly how it’s done, before letting him go to town on you, your cum still leaking out of his asshole.");
			output("\n\nIt’s only when you’ve writhed out the last of your orgasm that you realize that Able himself hasn’t cum, despite the intense heat and desire clear to see on his face. He holds your [pc.thighs] and looks at you with solemn black eyes, still mired deep in your throbbing [pc.vagina " + x + "].");
			output("\n\n<i>“I-if you don’t want me to--”</i> he whispers. <i>“" + pc.mf("Sir", "Ma’am") + "...”</i>");
			
			processTime(20 + rand(11));
			
			pc.orgasm();
			IncrementFlag("ABLE_BOTHWAYS");
			
			// [Let Him] [Deny]
			clearMenu();
			addButton(0, "Let Him", thareSexResponse, "let him");
			addButton(1, "Deny", thareSexResponse, "deny");
			break;
		case "let him":
			showAble(true);
			
			x = pc.statusEffectv1("Thare Manor Temp Value");
			if(x == -1) x = pc.biggestVaginaIndex();
			
			output("<i>“Go on then,”</i> you whisper. <i>“");
			if(rand(2) == 0) output("Since you’ve been");
			else output("For being");
			output(" such a good boy. Cum.”</i> You synchronize your words with a slow, firm thrust of your [pc.hips], savoring his cute little tool within you.");
			output("\n\nThe effect is immediate - you feel Able’s slender muscles tense up, his black-gloved");
			if(!fromBoth) output(" forearms shoot up to grasp the air");
			else output(" hands tighten on your [pc.skinFurScales]");
			output(", and he gasps as he fills your [pc.vagina " + x + "] up with thick honey-seed after half a dozen obviously ecstatic pulses. It oozes back out of you, golden streamers");
			if(!fromBoth) output(" crawling their way down his waist");
			else output(" spurting down your inner thighs");
			output(" and onto the duvet. He looks");
			if(!fromBoth) output(" up");
			output(" at you with such adoration when he finally relaxes and sinks back");
			if(!fromBoth) output(" down");
			else output(" onto his side that");
			output(" you have to laugh. For deigning to let him cum his");
			if(fromBoth) output(" little");
			output(" brains out, you’ve elevated yourself to an even higher status in his mind than you were before.");
			output("\n\n<i>“" + pc.mf("Master", "Queen") + ",”</i> he breathes.");
			output("\n\n<i>“Yes, quite,”</i> you snicker, rolling off of him and finally enjoying the post-coital haze and the sweet warmth rolling out of your slackened pussy. <i>“Glad you enjoyed yourself, my little drone.”</i>");
			output("\n\nHe absolutely insists on changing the sheets, so it’s into the smell of fresh linen rather than horny bee sugar you eventually sink yourself into a few minutes later. Able gives you a shy smile as he turns off the lights and departs. You are asleep within moments.");
			
			processTime(5 + rand(6));
			for (i = 0; i < 6; i++)
			{
				pc.loadInCunt(ppAble, x);
			}
			pc.removeStatusEffect("Thare Manor Temp Value");
			
			// Next
			thareAbleMenu("sleep");
			break;
		case "deny":
			showAble(true);
			
			output("You");
			if(!fromBoth) output(" stroke your cheek as you examine");
			else output(" reach up and stroke his cheek, examining");
			output(" the adorable little sub with a big smirk. You roll your [pc.hips] as you do so, teasing his prick as you do. He inhales and exhales shakily, obviously controlling himself with great effort.");
			output("\n\n<i>“Hmm. Not today, I don’t think,”</i> you say at last breezily,");
			if(!fromBoth) output(" rising off of him and pooling onto the overstuffed mattress leisurely. <i>“Don’t want servants getting lazy and spoiled with too many orgasms");
			else output(" disengaging from him and rolling on to one side on the overstuffed mattress with leisured ease. <i>“Don’t want you getting lazy and spoiled");
			output(", do we?”</i>");
			output("\n\n<i>“O-of course not, " + pc.mf("sir", "ma’am") + ",”</i> Able replies. The stare he gives down to his desperately erect penis is sad, but when he turns his gaze back to you the expression on his heart-shaped face is one of awed intoxication. <i>“I must remain ready for your service at a moment’s notice.”</i>");
			output("\n\n<i>“Which means no jerking off in your quarters,”</i> you warn coolly.");
			output("\n\n<i>“I wouldn’t dream of it, mistress...”</i> he moans, closing his eyes, practically tasting your delicious cruelty.");
			output("\n\nHe absolutely insists on changing the sheets, so it’s into the smell of fresh linen rather than horny bee sugar you eventually sink yourself into a few minutes later. Able gives you a shy smile as he turns off the lights and departs. You are asleep within moments.");
			
			processTime(5 + rand(6));
			pc.removeStatusEffect("Thare Manor Temp Value");
			
			// Next
			thareAbleMenu("sleep");
			break;
	}
}

