package classes.GameData.Pregnancy.Handlers 
{
	import classes.GameData.Pregnancy.BasePregnancyHandler;
	import classes.Creature;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GameData.StatTracking;
	import classes.GLOBAL;
	import classes.StorageClass;
	import classes.Engine.Utility.rand;
	import classes.Engine.Interfaces.ParseText;
	import classes.Engine.Map.InRoomWithFlag;
	import classes.Engine.Utility.getPlanetName;
	import classes.Engine.Utility.IncrementFlag;
	import classes.GameData.ChildManager;
	import classes.GameData.CodexManager;
	import classes.GameData.Pregnancy.Child;
	import classes.GameData.Pregnancy.UniqueChild;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Util.RandomInCollection;
	/*
  WARNING: This pregnancyhandler is much more complicated than usual.  So for fucks sake do not use it to learn how pregnancyhandlers work or as a starting template unless you want to learn how to 
  make up to 3 pregnancies worth of kids possibly be born at the same time, plus have a shit ton of variation in the pregnancy blurbs
  
New Flags:
	LAQUINE_PREGHAND_MULTIBIRTH //number of extra wombs to add into birth scene, undefined = single birth, 0 indicates all multi births processed and can go to birth scene
	LAQUINE_PREGHAND_HEAT_SEX // if set to 1, 100% preg chance
	LAQUINE_PREGHAND_TAUR_SEX // if set to 1, sets kid min to 32 and max to 36
	LAQUINE_PREGHAND_MUSKY //track musky phermones from all laquine sources, used as counter of potential temp sources
	
*/
	
	public class LaquinePregnancyHandler extends BasePregnancyHandler
	{
		public function LaquinePregnancyHandler() 
		{
			_handlesType = "LaquinePregnancy";
			_basePregnancyIncubationTime = (60 * 24 * 182); // 182 days
			_basePregnancyChance = 1;
			_alwaysImpregnate = false;
			_ignoreInfertility = false;
			_ignoreFatherInfertility = false;
			_ignoreMotherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = false;
			_pregnancyQuantityMinimum = 2;
			_pregnancyQuantityMaximum = 8;
			_definedAverageLoadSize = 2400;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_LAPINE;
			_childMaturationMultiplier = 1.0;
			
			_childGenderWeights.Male = 33;
			_childGenderWeights.Female = 33;
			_childGenderWeights.Intersex = 34;
			
			_onSuccessfulImpregnation = laquineSuccessfulImpregnation;
			_onDurationEnd = laquineOnDurationEnd;
			
			var bonusText:String = "";	
			var bonusText2:String = "";		
			var bonusText3:String = "";		
			var test:Boolean = true;
			
			
			for(var i:int = 0; i <= 182; i += 1)
			{
				// Preg Texts
				// Each line activates once during range
				
				// 14 days
				if(i == 14)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("A disturbing internal gurgle makes you wince and gag aloud. You can hear it from outside, some sort of gastral burble. Your throat seizes and bile seeps up your esophagus, singing your flesh with the acidic heat of positively foul tasting belly fluid. <i>Blech!</i>  Fortunately, the contents of your stomach aren't revealed today. It was just… a spasm. That's not normal, is it? Hopefully you haven't caught anything…", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .2, true);
					}, true);
				}
				// 31 days
				else if(i == 31)
				{					
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						var bonusText31:String = ""; var bonusText312:String = "";
						if (!InRoomWithFlag(GLOBAL.HAZARD)) bonusText31 = ", right in front of a few people. They are quick to help you clean up and give you some water, though it provides exiguous comfort";
						if (getPlanetName().toLowerCase() == "new texas") bonusText312 = " just about made you the most pleasant person on New Texas";
						else bonusText312 = " made you the most pleasant person outside New Texas";
						AddLogEvent("Another internal upheaval. Fuck, where's the nearest trash bin? You could look past a foul toilet… Nothing for it: you lose your meal this time" + bonusText31 + ".\n\nThe mood swings have been getting worse. When you stubbed your toe a few days ago you could have hurt someone with scant provocation, only to revert to a pseudo-cathartic state of mind that" + bonusText312 + ". When you look down, your stomach is still bloated, blocking the view of your crotch and the ground.\n\nIt's swollen, and all too upset.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .3, true);
					}, true);
				}
				// 37 days
				else if(i == 37)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("You're hungry, but after recent events you're a little too hesitant to eat. You've found it easier to stomach salads, fruits, and vegetables. Grains too, but meat… hell, even one calorie of the wrong food group has wreaked havoc on your system. Just <i>thinking</i> about proper nutrition has been awful. Sleeping, too, has been a real issue. Waking up in the middle of the night is bad enough, but doing so just to groan off another insufferable ache or sweat cold bullets makes it worse.\n\nThe rapid growth of your belly is too obvious to ignore. You reach for your codex, braced for it to tell you what you already know is true: <b>You are pregnant.</b> A few more mechanical chirps and whirs tell you <i>what</i> it is, at least: <b>a laquine</b>. Or several, rather. It presents no count, only the knowledge that you're going to be the " + kGAMECLASS.pc.mf("male bearer","mother") + " of a bunny litter.\n\n<i>Oomph.</i> If there's one thing rabbits can do, it's kick...", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .4, true);
					}, true);
				}
				// 46 days
				else if(i == 46)
				{					
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						var bonusText46:String = "";
						if (getPlanetName().toLowerCase() == "new texas" || getPlanetName().toLowerCase() == "mhen'ga") bonusText46 = " Even the grass looks edible and refreshing...";
						else if (getPlanetName().toLowerCase() == "tavros station") bonusText46 = " The fake grass here on Tavros looks like a refreshing treat...";
						else if (getPlanetName().toLowerCase() == "canadia station") bonusText46 = " Those fake plants lining some of the halls look tasty...";
						else bonusText46 = " A wide open plain of healthy grass sounds like a refreshing treat...";
						AddLogEvent("When you figured out what your body agreed with - and what the life inside your inflated tummy agreed with - you've been able to sleep a lot better. After several weeks of adjustment, and all the pain that came with it, you've got a much more positive and bubbly outlook. There are things you're enjoying that you've hardly enjoyed before!" + bonusText46 + "\n\nYou could get down on your knees right now and start munching...\n\n<i>No!</i> You shake your head. That's not a normal thought, but for however many rabbits are growing inside you, their natural needs and wants sure are an immutable signal, one your mind is constantly drawn to receiving. Irrational as you've sometimes been, at least it's getting a bit easier.\n\n<i>Thump…</i> There's a soft kick that doubles you over- Oh geez, that's starting already…!", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .5, true);
					}, true);
				}
				// 53 days
				else if(i == 53)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("It's hard to believe how gravid you've become so fast, how quickly new life stirs inside your rounding and unconcealable belly. To your great relief, whatever's growing in there remains calm. It's a rare occurrence that they kick. You're not too worried though, and you feel like one of the harder moments has come and gone. All you've done lately is find reasons to be optimistic, happy, and strangely enough, horny.\n\nIs that really how you should be feeling? You've been drinking a lot of water these days, and it's done very little to cool your inner heat. Sometimes you wonder if the way you feel is natural. Well, maybe it's 'natural' when carrying alien offspring.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .5, true);
					}, true);
				}
				// 60 days
				else if(i == 60)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.libido(2);
						var bonusText60:String = ""; var bonusText602:String = "";
						if (kGAMECLASS.pc.isBimbo()) bonusText60 = "super-";
						if (kGAMECLASS.pc.hasTits()) bonusText602 = " Honestly, there's a delightful pulsation in your [pc.breasts] lately, and you can feel them getting bigger. Seems like you might start dribbling some [pc.milkNoun] soon! Not to mention, t";
						else bonusText602 = " T";
						AddLogEvent("You squeak, gasp, moan, everything makes you inhale exquisitely.\n\nEvery time you touch something, you feel far more sensitive than before. This effect increases imperceptibly with the passage of time. Should your [pc.skinFurScales] really feel like this? Just from pregnancy? And what's that smell? Maybe you should be more thorough next time you shower. Whatever's happening to your body, you're starting to think it'd be worth seeing a doctor at this point.\n\nBut then… that'd just get in the way of how good you feel. Unless it was a really handsome guy with a big dick and " + bonusText60 + "full balls to plug your cunt with." + bonusText602 + "here's just this feeling that nothing in this universe is wrong at all. Doing away with this niceness would be a crime!", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .5, true);
					}, true);
				}
				// 70 days
				else if(i == 70)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						var bonusText70:String = "";
						if (CodexManager.entryUnlocked("Saurmorians")) bonusText70 = "saurmorian";
						else bonusText70 = "lizard man";
						AddLogEvent("Your tummy fattens and grows, and it's apparent you've entered the next stage of pregnancy -- the stage at which someone this obscenely swollen and drowned in maternal hormones should be staying at home and resting. Your [pc.chestNoun] tightens and your distended stomach has become ridiculously sensitive. The little wobbles when you move around somehow get you just slightly more turned on than before.\n\nThe kicks and the taps make you feel excessively lightheaded. That belly rub you got from that scary looking but really kindly " + bonusText70 + " the other day was amazing, too. Possessive and wanting, <i>but amazing.</i>", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .5, true);
					}, true);
				}
				// 85 days
				else if(i == 85)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.libido(6);
						if (kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] == undefined)
						{
							if (kGAMECLASS.pc.hasPerk("Musky Pheromones")) kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] = 2;
							else
							{
								kGAMECLASS.pc.createPerk("Musky Pheromones", 0, 0, 0, 0, "Grants a +5 musk bonus to tease attacks.");
								kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] = 1;
							}
						}
						else kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] += 1;
						var bonusText85:String = ""; var bonusText852:String = ""; var bonusText853:String = ""; var bonusText854:String = "";
						if (kGAMECLASS.pc.vaginaTotal() > 1) bonusText85 = " You have the capacity for it, too!";
						if (kGAMECLASS.pc.findEmptyPregnancySlot(1) >= 0)
						{
							bonusText852 = " It's such a shame that you've got space in the cradle lacking in rabbit-eared occupant, but maybe you can fix that?";
							bonusText853 = " Fuuuck, it's so hard letting 'em all pass by. If you saw a laquine right now, you'd be all over his or her dick, begging like the horny hare-bearer you are!";
						}
						else
						{
							bonusText852 = " Those cradles are full, sadly, but you'll be ready when you can fill 'em again.";
							bonusText853 = " Too bad you've got no extra room, but that'll pass soon. As on Terra, so in the galaxy at large: Fuck like a rabbit, breed like one!";
						}
						if (InRoomWithFlag(GLOBAL.HAZARD)) bonusText854 = " Maybe you should sit down and just take care of that…?";
						else bonusText854 = " There's a skip in your heart when you realize people have been staring, expecting a lot more from the show.";
						AddLogEvent("The sensitivity is becoming a little too much to deal with. More often than not, you can't help but want to masturbate from the slightest brush against your [pc.skinFurScalesNoun].\n\nYou sense your pheromone signature changing to something a little muskier than normal. It's not your scent, yet it is. And you can't get used to it; this is what you've been smelling! Every libidinous inhalation is spicy with a hint of sweetness. <i>It's pure laquine scent.</i>\n\nThe rampant essence of hypersexual bunny billows from your [pc.pussies] on constant output, announcing your readiness to breed a few more rutting rabbits if only another virile mate would come to claim you." + bonusText85 + bonusText852 +"\n\nEven if they're not a laquine, you can't help but giggle that every hunk and herm you pass are pitching tents in your wake." + bonusText853 + "\n\nYou realize that you've got one set of [pc.fingers] in [pc.eachVagina] and the other rubbing your belly, all while you gaze vacantly to the heavens." + bonusText854, "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
					}, true);
				}
				// 97 days
				else if(i == 97)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						var bonusText97:String = ""; var bonusText972:String = ""; var bonusText973:String = "";
						if (InRoomWithFlag(GLOBAL.HAZARD))
						{
							bonusText97 = " People have lined up just to be close to you, to make you smile and laugh with a few more tummy rubs.\n\nHow badly you wanted to jump on any bulgy, throbbing dick in the crowd was readily apparent.";
							if (kGAMECLASS.pc.hasTits())
							{
								bonusText972 = " as they sup the [pc.milkNoun] from your [pc.breasts]";
								if (kGAMECLASS.pc.isChestExposed()) bonusText973 = "You cream yourself a bit, feeling a rush of [pc.milkNoun] puddle at your [pc.footOrFeet].";
								else bonusText973 = "You cream yourself a bit, feeling a rush of [pc.milkNoun] stain your [pc.chestCovers].";
							}
							else bonusText972 = "while they fuck you full of a dozen more of their kind.";

						}
						else
						{
							bonusText97 = " People line up just to be close to you, to make you smile and laugh with a few more tummy rubs.\n\nHow badly you want to jump on any bulgy, throbbing dick in the crowd is readily apparent.";
							if (kGAMECLASS.pc.hasTits())
							{
								bonusText972 = " as they sup the [pc.milkNoun] from your <b>now lactating boobs.</b>";
								if (kGAMECLASS.pc.isChestExposed()) bonusText973 = "You're not sure which wet spots are bigger: the ones in the pants of your admirers or the ones puddling around your [pc.footOrFeet].";
								else bonusText973 = "You're not sure which wet spots are bigger: the ones in the pants of your admirers or the ones under your [pc.chestCovers].";
							}
							else bonusText972 = " while they fuck you full of a dozen more of their kind.";
						}

						AddLogEvent("<i>Sniff.</i> Your breaths are so crisp and unobstructed, like you've just gotten over a cold. It's like that every day. And what you smell every day is your own potent aroma. You can't believe you have such a mouthwatering scent. You can't believe that everywhere you go, everyone else is feeling as hotly flushed as you. You could never hope to hide your belly, and you wouldn't want to." + bonusText97 + " You're in some semi-permanent heat; you want to find someone to care for you in every way and fulfill your unending sexual desires. You want someone to hug you to sleep every night, whispering promises of wild nights" + bonusText972 + "\n\n" + bonusText973 + " You feel fuller by the minute, <i>craving more of… this!</i> All you can do for now, however, is rub your tummy longingly...", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if (kGAMECLASS.pc.hasTits())
						{
							if(kGAMECLASS.pc.milkMultiplier < 10) kGAMECLASS.pc.milkMultiplier = 10;
							if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
							kGAMECLASS.pc.milkFullness += 15;
							if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
						}
					}, true);
				}
				// 110 days
				else if(i == 110)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						var bonusText110:String = "";
						if (kGAMECLASS.pc.isBimbo() && kGAMECLASS.pc.hasTits()) bonusText110 = "\n\nYou couldn't help yourself back then either, you took a cutie boy off to the side and shared some of your [pc.milkVisc] treat with him. You're producing so much that all it does is drip and dribble like a faucet left running, why let it go to waste? Hopefully you'll find more people to share with! You could even become a rental mommy!";
						AddLogEvent("Lately you've been so caught up in yourself and not the floppy-eared munchkins inching closer to birth day-by-day. Upping your intake of hearty greens was a necessary measure to keep up with their insatiable appetite. You could stand to spend a little more time in bed considering how bulked up you've gotten, but then you wouldn't get to share your contagious elation with the rest of the galaxy!\n\nPregnancy started off on the wrong foot, but that's the price you pay for the awe-inspiring empathy you now possess. Euphoria orbits you like a tidally-locked moon, sealing out everything else so that you carry these thoughts as well as you carry your children. \n\nAll you think about is sex, about what your kids might look like, and about how you might experience it <i>all over again.</i> You say hello to everyone who passes you by, and naturally, they greet you back with a little touch and pinch." + bonusText110, "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if (kGAMECLASS.pc.hasTits())
						{
							if(kGAMECLASS.pc.milkMultiplier < 10) kGAMECLASS.pc.milkMultiplier = 10;
							if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
							kGAMECLASS.pc.milkFullness += 15;
							if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
						}
					}, true);
				}
				// 125 days
				else if(i == 125)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.libido(2);
						var bonusText125:String = "";
						if (kGAMECLASS.pc.hasTits()) bonusText125 = " Your [pc.breasts] are lactating greater amounts of [pc.milkNoun], so much that even a maternity bra would be inadequate.";
						AddLogEvent("The tautness of your belly, the sheer weight you're carrying around now is shaking you from your oft perverse reveries. You waddle more than walk now, encumbered by the many laquine babies you carry." + bonusText125 + " Simple pleasures keep you going… like the lovely attentions of others.\n\nYou've gotten a little used to your new musky pheromones. You're a fecund figure that exists only to draw mates into [pc.hisHer] vaginal folds, to seed life again and again. Your libido has certainly spiked in the time that's passed, perhaps permanently so.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .1, true);
						if (kGAMECLASS.pc.hasTits())
						{
							if(kGAMECLASS.pc.milkMultiplier < 10) kGAMECLASS.pc.milkMultiplier = 10;
							if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
							kGAMECLASS.pc.milkFullness += 15;
							if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
						}
					}, true);
				}
				// 136 days
				else if(i == 136)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						AddLogEvent("<i>Kick, kick, tap.</i> Breathing becomes difficult, maybe too hard. You've had to lean on things and people alike to avoid buckling under the weight of your baby bump. The growing litter is beating you from the inside like you owe them something. Guess you'll have to double your portions in these last few weeks. Laquines sure come to term really fast!\n\nGosh, you've never felt happier. You've busied yourself fantasizing about laquines this and fuckbunnies that, thinking about how you'll handle a bunny's dick in the future in ways that'll make it cum extra hard. You haven't seen any floppy-eared breeders around the last few days. You know they'd come running, your fuckscent carries for miles. Maybe light years. You walking around a planet now is a hazard. You can't imagine anyone getting a damn thing done in the places you've been.\n\nNothing but fuck, anyway.", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if (kGAMECLASS.pc.hasTits())
						{
							if(kGAMECLASS.pc.milkMultiplier < 10) kGAMECLASS.pc.milkMultiplier = 10;
							if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
							kGAMECLASS.pc.milkFullness += 15;
							if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
						}
					}, true);
				}
				// 148 days
				else if(i == 148)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						for (var i:int = 0; i < kGAMECLASS.pc.vaginaTotal(); i++) kGAMECLASS.pc.vaginas[i].wetness(1);
						var bonusText148:String = "";
						if (kGAMECLASS.pc.vaginaTotal() > 1) bonusText148 = " They certainly smell a lot stronger than before you began carrying a litter.";
						else bonusText148 = " It certainly smells a lot stronger than before you began carrying a litter.";
						AddLogEvent("Your [pc.pussies] have gotten a little wetter." + bonusText148 + " When you walk around now it's like you're hauling around your own blast furnace, and instead of steam it's billowing your ripe and ready scent. Trying to get around is close to impossible; it's tiring and exhausting. You're a pumpkin or watermelon on legs; your muscles and knees are no match for the constantly bucking children so very close to term.\n\nThe other day you met a doctor, a really handsome guy. He gave you a little check up with the biggest boner you've seen in a while. Too bad he turned down a little fun. Admiring his self-control only made you hornier, made you hump him a little. He suggested you get some water and plenty of it, mentioning that your babies are nearing their birth. It was hysterical when you wandered into the local watering hole. A few faint sniffs and very deep whiffs led to a lot of knocking tables!\n\nThe bartender had trouble pouring you a drink. Not that it helped much. The searing heat in your loins seems inextinguishable now. On some level it unnerves you, but on the other, you can't wait until another spunk-tsunami is crashing against your cum-hungry nerves...", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if (kGAMECLASS.pc.hasTits())
						{
							if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
							if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
							kGAMECLASS.pc.milkFullness += 15;
							if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
						}
					}, true);
				}
				// 164 days
				else if(i == 164)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						if (kGAMECLASS.pc.hasTits())
						{
							for (var i:int = 0; i < kGAMECLASS.pc.breastRows.length; i++)
							{
								if (kGAMECLASS.pc.breastRows[i].breastRating() > 0 && kGAMECLASS.pc.breastRows[i].breastRating() < 13) kGAMECLASS.pc.breastRows[i].breastRating(2);
								else if (kGAMECLASS.pc.breastRows[i].breastRating() > 0 && kGAMECLASS.pc.breastRows[i].breastRating() < 14) kGAMECLASS.pc.breastRows[i].breastRating(1);
							}
						}
						var bonusText164:String = ""; var bonusText1642:String = ""; var bonusText1643:String = "";
						if (kGAMECLASS.pc.hasTits()) bonusText164 = " Your [pc.breasts] have grown larger, too, swelling closer to the appearance of a truly maternal creature.";
						if (kGAMECLASS.pc.isSquirter()) bonusText1642 = "squirt";
						else bonusText1642 = "dribble";
						if (kGAMECLASS.pc.isCrotchExposed()) bonusText1643 = "across the ground.";
						else bonusText1643 = "into your [pc.lowerUndergarment].";
						AddLogEvent("This late in your pregnancy your belly has grown just a few more inches. The significant burden you now bear makes you nervous. You couldn't hope to climb or run, and you're on the verge of being hospitalized for your own good. Maybe if that happened you'd get fucks on demand. You haven't had a straight thought for weeks. All you think about is sex, sex, sex! You want to fuck more than most. There's no doubt this is what a fertile laquine must feel like. You can only drool at the mere thought: you're tasting divinity. This is how a floppy-eared broodmother feels like on a daily basis, pumping out loads of kids with her ripe, matronly body.\n\n" + bonusText164 + " Your body is just so damn sensitive that even a blast of wind makes [pc.girlCumNoun] " + bonusText1642 + " " + bonusText1643 + " How many kids are you going to have? Will you be able to feed them enough? These thoughts and more go through one [pc.ear] and out the other. The end of your pregnancy is approaching. Just a few more weeks...", "passive");
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if (kGAMECLASS.pc.hasTits())
						{
							if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
							if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
							kGAMECLASS.pc.milkFullness += 15;
							if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
						}
					}, true);
				}
				// Progressive changes with no text:
				else if(i > 148)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if (kGAMECLASS.pc.hasTits())
						{
							if(kGAMECLASS.pc.milkMultiplier < 25) kGAMECLASS.pc.milkMultiplier = 25;
							if(kGAMECLASS.pc.milkFullness < 50) kGAMECLASS.pc.milkFullness = 50;
							kGAMECLASS.pc.milkFullness += 15;
							if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
						}
					}, true);
				}
				else if(i > 97)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .05, true);
						if (kGAMECLASS.pc.hasTits())
						{
							if(kGAMECLASS.pc.milkMultiplier < 10) kGAMECLASS.pc.milkMultiplier = 10;
							if(kGAMECLASS.pc.milkFullness < 25) kGAMECLASS.pc.milkFullness = 25;
							kGAMECLASS.pc.milkFullness += 15;
							if (kGAMECLASS.pc.milkRate < 10) kGAMECLASS.pc.milkRate = 10;
						}
					}, true);
				}
				else if(i > 70)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .1, true);
					}, true);
				}
				else if(i > 53)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .2, true);
					}, true);
				}
				else if(i > 46)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .45, true);
					}, true);
				}
				else if(i > 37)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .35, true);
					}, true);
				}
				else if(i > 31)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .2, true);
					}, true);
				}
				else if(i > 14)
				{
					addStageProgression(_basePregnancyIncubationTime - (i * 24 * 60), function(pregSlot:int):void {
						kGAMECLASS.pc.addPregnancyBellyMod(pregSlot, .1, true);
					}, true);
				}
				else
				{
				  //nothing
				}
			}
		}
		
		public static function laquineSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			BasePregnancyHandler.defaultOnSuccessfulImpregnation(father, mother, pregSlot, thisPtr, undefined);
		}
		
		public static function laquineOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];		

				// Baby count check (just in case)
				var babies:int = mother.pregnancyData[pregSlot].pregnancyQuantity;
				var belly:int = mother.pregnancyData[pregSlot].pregnancyBellyRatingContribution;
				var babyGender:int = rand(3);
				
				ChildManager.addChild(
				Child.NewChildWeights(
					thisPtr.pregnancyChildRace,
					thisPtr.childMaturationMultiplier,
					pData.pregnancyQuantity,
					thisPtr.childGenderWeights
					)
				);
				
				//if the multibirth flag is not set check if it should be
				if (kGAMECLASS.flags["LAQUINE_PREGHAND_MULTIBIRTH"] == undefined)
				{
					if (pregSlot != 0 && mother.pregnancyData[0].pregnancyType == thisPtr.handlesType)
					{
						if (mother.pregnancyData[0].pregnancyIncubation <= 1440)
						{
							mother.pregnancyData[0].pregnancyIncubation = 0;
							IncrementFlag("LAQUINE_PREGHAND_MULTIBIRTH");
						}
					}
					if (pregSlot != 1 && mother.pregnancyData[1].pregnancyType == thisPtr.handlesType)
					{
						if (mother.pregnancyData[1].pregnancyIncubation <= 1440)
						{
							mother.pregnancyData[1].pregnancyIncubation = 0;
							IncrementFlag("LAQUINE_PREGHAND_MULTIBIRTH");
						}
					}
					if (pregSlot != 2 && mother.pregnancyData[2].pregnancyType == thisPtr.handlesType)
					{
						if (mother.pregnancyData[2].pregnancyIncubation <= 1440)
						{
							mother.pregnancyData[2].pregnancyIncubation = 0;
							IncrementFlag("LAQUINE_PREGHAND_MULTIBIRTH");
						}
					}
				}
				else
				{
					//if we are in here the multibirth flag is set and we have processed one of the extra wombs, reduce the flag by one to indicate such
					kGAMECLASS.flags["LAQUINE_PREGHAND_MULTIBIRTH"] -= 1;
				}
				//create status effects unique to each womb so they can be used together if needed
				if (pregSlot == 0) mother.createStatusEffect("Laquine Pregnancy Ends 0", babies, belly, pregSlot, babyGender, true);
				if (pregSlot == 1) mother.createStatusEffect("Laquine Pregnancy Ends 1", babies, belly, pregSlot, babyGender, true);
				if (pregSlot == 2) mother.createStatusEffect("Laquine Pregnancy Ends 2", babies, belly, pregSlot, babyGender, true);
				//if this is a single womb birth or we have processed all the extra wombs, we can trigger the birth scene
				if (kGAMECLASS.flags["LAQUINE_PREGHAND_MULTIBIRTH"] == undefined || kGAMECLASS.flags["LAQUINE_PREGHAND_MULTIBIRTH"] == 0) kGAMECLASS.eventQueue.push(kGAMECLASS.laquinePregnancyEnds);
				//clean up all the preg variables and flags each time
				LaquinePregnancyHandler.laquineCleanupData(mother, pregSlot, thisPtr);
		}
		public static function laquineCleanupData(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;			

			StatTracking.track("pregnancy/laquine births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);			
			
			pData.reset();
			
			if (kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] != undefined)
			{
				kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] -= 1;
				if (kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] < 1)
				{
					kGAMECLASS.pc.removePerk("Musky Pheromones");
					kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] = undefined;
				}
			}		
		}
		
		override public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBornTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot] as PregnancyData;
			
			var c:Child = Child.NewChildWeights(
				pregnancyChildRace,
				childMaturationMultiplier,
				pData.pregnancyQuantity,
				childGenderWeights
			);
			c.BornTimestamp = useBornTimestamp;
			
			ChildManager.addChild(c);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;			

			StatTracking.track("pregnancy/laquine births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total births", pData.pregnancyQuantity);
			StatTracking.track("pregnancy/total day care", pData.pregnancyQuantity);					
			
			pData.reset();	
			
			if (kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] != undefined)
			{
				kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] -= 1;
				if (kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] < 1)
				{
					kGAMECLASS.pc.removePerk("Musky Pheromones");
					kGAMECLASS.flags["LAQUINE_PREGHAND_MUSKY"] = undefined;
				}
			}		

			return c;
		}		
		
		override public function tryKnockUp(father:Creature, mother:Creature, pregSlot:int):Boolean
		{
			// Abort if there's an existing pregnancy of this type and multipreg of this type is disabled
			if (_allowMultiplePregnancies == false && mother.isPregnant())
			{
				return false;
			}
			
			if (pregSlot <= 2 && !this.canImpregnateVagina) return false;
			if (pregSlot == 3 && !this.canImpregnateButt) return false;
			
			// This may need to be reworked depending on a discussion about the actual handling of cunttail preggers
			if (pregSlot == 4)
			{
				if(this.canFertilizeEggs)
				{
					// Egg fertilization
					if (mother.hasTailOvipositor())
					{
						if (this.alwaysImpregnate || mother.fertility() > Math.floor(Math.random() * this.basePregnancyChance))
						{
							mother.fertilizeEggs("tail");
							return true;
						}
					}
				}
				return false;
			}
			
			var wasSuccessful:Boolean = false;
			
			if (kGAMECLASS.flags["LAQUINE_PREGHAND_HEAT_SEX"] == 1) _alwaysImpregnate = true;
			
			if (kGAMECLASS.flags["LAQUINE_PREGHAND_TAUR_SEX"] == 1)
			{
				_pregnancyQuantityMinimum = 30;
				_pregnancyQuantityMaximum = 36;
			}
			//turn off heat sex which makes preg chance 100% and taur sex which increases kid count
			kGAMECLASS.flags["LAQUINE_PREGHAND_HEAT_SEX"] = undefined;
			kGAMECLASS.flags["LAQUINE_PREGHAND_TAUR_SEX"] = undefined;
			
			if (_onTryImpregnate != null)
			{
				if (debugTrace) trace("Calling onTryImpregnate handler");
				wasSuccessful = _onTryImpregnate(father, mother, pregSlot, this);
			}
			else
			{
				throw new Error("BasePregnancyHandler for type " + _handlesType + " doesn't have a defined onTryImpregnate event handler.");
			}
			
			if (_onSuccessfulImpregnation != null)
			{
				if (wasSuccessful)
				{
					if (debugTrace) trace("Calling onSuccessfulImpregnation handler");
					_onSuccessfulImpregnation(father, mother, pregSlot, this);
					
					if (_onSuccessfulImpregnationOutput != null) 
					{
						if (debugTrace) trace("Calling onSuccessfulImpregnationOutput handler");
						_onSuccessfulImpregnationOutput(father, mother, this);
					}
					
					return wasSuccessful;
				}
			}
			else
			{
				throw new Error("BasePregnancyHandler for type " + _handlesType + " doesn't have a defined onSuccessfulImpregnation event handler.");
			}
			
			if (_onFailedImpregnation != null)
			{
				if (!wasSuccessful)
				{
					if (debugTrace) trace("Calling onFailedImpregnation handler");
					_onFailedImpregnation(father, mother, pregSlot, this);
					
					if (_onFailedImpregnationOutput != null)
					{
						if (debugTrace) trace("Calling onFailedImpregnationOutput handler");
						_onFailedImpregnationOutput(father, mother, this);
					}
					
					return wasSuccessful;
				}
			}
			else
			{
				throw new Error("BasePregnancyHandler for type " + _handlesType + " doesn't have a defined onFailedImpregnation event handler.");
			}
			
			return false;
		}
	}

}

