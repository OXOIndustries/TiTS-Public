import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.GameData.CombatManager;
import flash.events.Event;
import classes.GameData.MailManager;
import classes.Cheats;

public function nameOfDestinyChoice():void
{
	clearOutput();
	showName("FATED\nNAME!");
	output("The chosen name is one that hangs heavy under the weight of destiny. Should you embrace your destiny, you may discover just how little Victor's science may mean. Certain choices may be invalidated. You may find yourself a woman instead of a man, or a race unlike any other in the known galaxy.\n\n<b>Do you embrace the path the fates have spooled out before you or resign yourself to mediocrity?</b>");
	addButton(0,"Accept Fate",customPCCheck,true)
	addButton(1,"Deny Fate",fatedPCOptionsFinisher);
}

public function fatedPCOptionsFinisher():void
{
	tutorialSkipOption();
	pc.maxOutHP();
}

//Return true if the PC is customed up.
public function customPCCheck(TF:Boolean = false):Boolean
{
	var short:String = pc.short.toLowerCase();
	var bonusTexts:String = "";
	switch (short)
	{
		case "archie":
			pc.breastRows[0].breastRatingRaw = 4;
			if(!pc.hasCock()) pc.createCock();
			pc.shiftCock(0,GLOBAL.TYPE_CANINE);
			if(pc.cocks[0].cLength() < 10) pc.cocks[0].cLengthRaw = 10;
			pc.hairLength = 3;
			pc.hairColor = "blue";
			if(pc.femininity < 80) pc.femininity = 80;
			if(pc.thickness < 70) pc.thickness = 70;
			if(pc.tone > 60) pc.tone = 60;
			if(pc.buttRatingRaw < 6) pc.buttRatingRaw = 6;
			if(pc.hipRatingRaw < 6) pc.hipRatingRaw = 6;
			break;
		//Naoki, dickgirl(shemale), human dong, balls, boobs, Not sure if this is relevant at all, but it'd be a manufactured person/synthetic, but otherwise humanoid, Distinctive, but simple facial stripe
		case "naoki":
			if(!pc.hasCock()) pc.createCock();
			pc.shiftCock(0,GLOBAL.TYPE_HUMAN);
			pc.cocks[0].cockColor = "black";
			pc.nippleColor = "black";
			pc.hairColor = "white";
			if(pc.balls < 2) pc.balls = 2;
			if(pc.ballSizeRaw < 10) pc.ballSizeRaw = 10;
			if(pc.breastRows[0].breastRatingRaw < 5) pc.breastRows[0].breastRatingRaw = 5;
			pc.skinTone = "purple and white";
			pc.createStatusEffect("Perfect Simulant",0,0,0,0,false,"Icon_Gears_Three","You were created by the scientists at Steele Tech to be the perfect heir, and as such, your maximum capabilities exceed even those of the luckiest terrans. You walk, talk, breathe, and eat, just like any living creature, even simulating DNA to allow you to emulate the effects of transformative items on true organics.",false,0);
			pc.createStatusEffect("Naoki Stripe");
			bonusTexts = " Good thing Victor's scientists made you to be the perfect heir. So long as you aren't distracted by your ability to experience inhuman amounts of pleasure, you'll do just fine! ...Now, what to do with all this silicone?";
			var siliconeBoners:ItemSlotClass = new Silicone();
			siliconeBoners.quantity = 10;
			pc.inventory.push(siliconeBoners);
			break;
		//Fetysh - Female, max fertility, the perks that increase pregnancy speed (I believe Marae's, Fera's and the brood mother one). Other perks I'll enjoy getting during leveling. As for character specifics, short, about 4'11", 95lbs, tentacle hair, blue-black skin, spaded tail, normal hands/feet. Virginal cunt/ass to start with and C-cup breasts. (Can those resist most normal forms of shrinking? Not all if you could, sort of like the bimbo body that keeps them at a minimum size)
		case "fetysh":
			if(!pc.hasVagina()) pc.createVagina();
			pc.vaginas[0].wetnessRaw = 2;
			pc.fertilityRaw = 10;
			pc.pregnancyIncubationBonusMotherRaw = 10;
			bonusTexts = "You've always been ridiculously fertile. The doctors warned you at a young age. Just a glance at the wrong alien and you'll blow up with babies! But that's not new.";
			pc.tallness = 59;
			pc.thickness = 30;
			pc.hairType = GLOBAL.HAIR_TYPE_TENTACLES;
			pc.skinTone = "indigo";
			pc.tailType = GLOBAL.TYPE_DEMONIC;
			pc.tailCount = 1;
			if(pc.breastRows[0].breastRatingRaw < 3) pc.breastRows[0].breastRatingRaw = 3;
			break;
		/*Name: Yui
		Gender: Hermaphrodite
		Height: 8 ft.
		Hip Size: 7 (waspish)
		Butt Size: 8 (Substantial)
		Body Thickness: 30
		Muscle: 70
		Femininity: 80
		Skin Tone: Light
		Skin Type: Scales/Plates (Draconic)(Blue with pink edges)
		Face Type: Human
		Tongue Type: Draconic
		Ear Type: Human
		Horn Type: None
		Lower Body: Human (Save for scales covering the legs and the tops of her feet)
		Tail Type: Draconic
		Wing Type: Draconic (Full size)
		Hair Color: White with light pink tips
		Hair Length: 96 inches (8ft)(Straight)
		Genitals: 1x Vagina (Virgin, Squirter)
		1x Penis (Anemone)(12 in. long x 1.5 in. thick)
		No Visible Testicles (internal testis?)
		Base cum production equal to a pair of 2 in. testicles
		0.7 in. clit
		1x Asshole (Virgin)

		Perks:
		- Regeneration
		- Messy Orgasms
		- Resolute
		- Double Attack
		- Agility
		- Evade
		- Androgyny
		- Tank
		- Precision
		- Tactician*/
		case "yui":
			pc.tallness = 96;
			pc.hipRatingRaw = 7;
			pc.buttRatingRaw = 8;
			pc.tone = 70;
			pc.femininity = 80;
			pc.skinTone = "light";
			pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
			pc.scaleColor = "blue";
			pc.tongueType = GLOBAL.TYPE_DRACONIC;
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_DRACONIC;
			pc.hairColor = "white";
			pc.hairLength = 96;
			if(!pc.hasVagina()) pc.createVagina();
			pc.vaginas[0].wetnessRaw = 5;
			if(!pc.hasCock()) pc.createCock();
			pc.cocks[0].cType = GLOBAL.TYPE_ANEMONE;
			pc.cocks[0].cLengthRaw = 12;
			pc.cocks[0].addFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
			pc.cocks[0].addFlag(GLOBAL.FLAG_STINGER_TIPPED);
			pc.cocks[0].addFlag(GLOBAL.FLAG_STINGER_BASED);
			pc.balls = 0;
			pc.clitLength = 0.7;
			bonusTexts = "You've always been a big-dicked, dragon-like hermaphrodite.";
			break;
		//Name: KosMos
		//Appearance: 5'8" Female Gynoid (Female Android) with light skin, red eyes, ass-length blue hair. Built-in high heels. B-cup breasts. One Vagina, one ass.
		//Perks: Nanoparticle Body: Damage reduction.
		//X-Buster: Special attack. (Opens abdomen to release beam lances at enemy.)
		case "kosmos":
			pc.skinTone = "light";
			pc.eyeColor = "red";
			pc.hairLength = pc.tallness / 2 + 1;
			pc.legType = GLOBAL.TYPE_SUCCUBUS;
			if(pc.breastRows[0].breastRatingRaw < 2) pc.breastRows[0].breastRatingRaw = 2;
			if(!pc.hasVagina()) pc.createVagina();
			pc.createStatusEffect("Perfect Simulant",0,0,0,0,false,"Icon_Gears_Three","You were created by the scientists at Steele Tech to be the perfect heir, and as such, your maximum capabilities exceed even those of the luckiest terrans. You walk, talk, breathe, and eat, just like any living creature, even simulating DNA to allow you to emulate the effects of transformative items on true organics.",false,0);
			bonusTexts = "Good thing Victor's scientists made you to be the perfect heir. So long as you aren't distracted by your ability to experience inhuman amounts of pleasure, you'll do just fine!";
			break;
		/*Name: Sennil Kharnish
		Gender: Woman
		Build: Slender
		Complexion: Light
		Hair: White
		Breast size: Huge
		Breasts: 2
		Dicks (Priority over Vagina): 1
		Vaginas: 1
		Trait: Smart
		Profession: Alchemist / Scientist*/
		case "sennil":
		case "sennil kharnish":
			pc.thickness = 25;
			pc.skinTone = "light";
			pc.hairColor = "white";
			pc.breastRows[0].breastRatingRaw = 20+rand(20);
			if(!pc.hasCock()) pc.createCock();
			if(!pc.hasVagina()) pc.createVagina();
			pc.intelligence(pc.intelligenceMax());
			if(pc.femininity < 70) pc.femininity = 70;
			bonusTexts += "You always had breasts almost as large as you are intelligent!";
			break;
		/*Danime91 I'd like the concept behind my character to be a kind of genetically enhanced super-soldier/first-wave colonist. So she would be taller than average, like 6.5 ft, with high strength and toughness stats and pretty buff (about middle of the way between average and max muscles). Breasts at C-cup. Have her be a futa with balls as well as a vag, because if there's one thing colonists on an unsettled hostile world need, it's redundancy. Increased fertility and virility perks, if they are still going to be around in this game. Other than that, if TiTS is going to be anything like CoC, I'm pretty sure I can make my character however I want her to be through the course of the game.*/
		case "danime":
		case "danime91":
			pc.tallness = 78;
			pc.physique(pc.physiqueMax());
			pc.reflexes(pc.reflexesMax());
			pc.tone = 75;
			if(pc.breastRows[0].breastRatingRaw < 3) pc.breastRows[0].breastRatingRaw = 3;
			if(pc.balls < 0) 
			{
				pc.balls = 2;
				pc.ballSizeRaw = 4;
			}
			if(!pc.hasCock()) pc.createCock();
			if(!pc.hasVagina()) pc.createVagina();
			if(pc.fertilityRaw < 1.5) pc.fertilityRaw = 1.5;
			pc.cumQualityRaw = 3;
			if(pc.femininity < 70) pc.femininity = 70;
			bonusTexts += "You've always had an amazing physique, and the best of both genders - the better to colonate new worlds with your young.";
			break;
		/*Name : Kaeln
		Gender : male
		Height : 5ft6

		Appearance :
		simian-like, with a short fur recovering the body except the face, hands and feet and a long and prehensile tail and feet. The head is at midway between a human's and a monkey's. Overall, the body is masculine looking and slightly muscled

		Coloration :
		dark-brown fur, with a light-brown patch going from the neck to the groin; chestnut eyes; underneath the fur, the skin is tanned

		Hair-style :
		Mid-lengh hair, going to the shoulders, from the same colour as the fur

		Clothes :
		an open jacket for the top, accompanying large pants for the bottom; Kaeln wears a fundoshi for underwares. He also wears a few trinkets at his wrists, ankles and neck

		The things that count (;-p) :
		he has a rather well-endowed human-like cock (10 inches in lengh, 2 inches wild) and larger than average balls
		He has two flat breasts with one nipple each */
		case "kaeln":
			//Would set legs/tail/feet, but Simii parts are not presently set up for PC.
			pc.tallness = 66;
			if(pc.femininity > 40) pc.femininity = 40;
			if(pc.hasVagina()) pc.removeVagina();
			if(!pc.hasCock()) pc.createCock();
			if(pc.tone < 70) pc.tone = 70;
			pc.skinType = GLOBAL.SKIN_TYPE_FUR;
			pc.furColor = "light brown";
			pc.eyeColor = "chestnut";
			pc.skinTone = "tanned";
			pc.hairLength = 13;
			pc.hairColor = pc.furColor;
			pc.cocks[0].cLengthRaw = 10;
			if(pc.ballSizeRaw < 8) pc.ballSizeRaw = 8;
			if(pc.breastRows[0].breastRatingRaw > 0) pc.breastRows[0].breastRatingRaw = 0;
			bonusTexts += "You've always been a bit of a monkey. Nothing wrong with that. (Note: Monkey parts aren't properly supported at the time of coding this character. If this changes down the road, please feel free to log a bug report, and we'll get this PC updated.)";
			break;
		/*Anon All available shark transformations.
		Hermaphrodite with normal vagina, normal 8" penis, 2 E cup breasts.
		6'2" tall, max femininity.
		All else same as a standard starting character.*/
		case "anon":
			pc.faceType = GLOBAL.TYPE_SHARK;
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_SHARK;
			if(!pc.hasVagina()) pc.createVagina();
			if(!pc.hasCock()) pc.createCock();
			pc.cocks[0].cLengthRaw = 8;
			pc.breastRows[0].breastRatingRaw = 7;
			pc.tallness = 74;
			pc.gills = true;
			pc.skinTone = "blue";
			pc.femininity = 100;
			bonusTexts += "You've always been a bit of an aquatic terror, haven't you?";
			break;
		/*Tia Height: Maximum
		Build: Curvy
		Gender: Herm
		Body Type: Goo Girl
		Eyes: Aquamarine
		Skin: Sapphire
		Hair: Aquamarine, Ass Length, Goo
		Femininity: Maximum
		Tongue: Elongated (Demonic I think in CoC terms)
		Breasts: Large J Cup
		Nipples: 2" Fuckable
		Lactation: 1 Litre.
		Penis: 24" x 3" Goocock (suggestion that it can shrink to fit smaller orifices more comfortably, if the rest of your body is made of slime, why the hell not have a slime penis, if not this concept then Tentacle)
		Vagina: Permanent Maximum Tightness, Capacity and Wetness
		Clit: None (If you make dicks replacing clits an option, else 1")
		Ass: Permanent Maximum Tightness & Capacity
		Legs: Goo Girl

		Background Perks: Big Breasts, Whoring.*/
		case "tia":
			pc.thickness = 65;
			pc.tone = 30;
			if(pc.buttRatingRaw < 6) pc.buttRatingRaw = 6;
			if(pc.hipRatingRaw < 6) pc.hipRatingRaw = 6;
			pc.eyeColor = "aquamarine";
			pc.skinTone = "sapphire";
			pc.hairColor = "aquamarine";
			pc.hairLength = pc.tallness / 2 + 1;
			pc.hairType = GLOBAL.HAIR_TYPE_GOO;
			pc.femininity = 100;
			pc.tongueType = GLOBAL.TYPE_DRACONIC;
			pc.breastRows[0].breastRatingRaw = 29;
			pc.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_FUCKABLE;
			if(!pc.hasCock()) pc.createCock();
			pc.cocks[0].cType = GLOBAL.TYPE_TENTACLE;
			pc.cocks[0].cLengthRaw = 24;
			if(!pc.hasVagina()) pc.createVagina();
			pc.vaginas[0].loosenessRaw = 1;
			pc.vaginas[0].wetnessRaw = 5;
			pc.vaginas[0].bonusCapacity = 200;
			pc.ass.bonusCapacity = 200;
			pc.clitLength = 1;
			pc.milkFullness = 55;
			pc.milkStorageMultiplier = 10;
			pc.milkMultiplier = 100;

			/* GOO SHIT */
			pc.skinType = GLOBAL.SKIN_TYPE_GOO;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_AMORPHOUS);
			pc.addSkinFlag(GLOBAL.FLAG_LUBRICATED);
			pc.legType = GLOBAL.TYPE_GOOEY;
			pc.legCount = 1;
			pc.genitalSpot = 0;
			//Set v1 of Gel Body to 1. Better than piling on more wasted status effects.
			pc.addStatusValue("Gel Body",1,1);
			pc.createStatusEffect("Goo Vent");
			pc.createStatusEffect("Goo Crotch");
			flags["GALOMAX_DOSES"] == 5;
			if(pc.elasticity < 3) pc.elasticity = 3;
			var x:int = 0;
			for(x = 0; x < pc.totalCocks(); x++)
			{
				if(!pc.hasCockFlag(GLOBAL.FLAG_GOOEY,x)) pc.cocks[x].addFlag(GLOBAL.FLAG_GOOEY);
				pc.cocks[x].cockColor = pc.hairColor;
			}
			for(x = 0; x < pc.totalVaginas(); x++)
			{
				if(!pc.vaginas[x].hasFlag(GLOBAL.FLAG_GOOEY)) pc.vaginas[x].addFlag(GLOBAL.FLAG_GOOEY);
				pc.vaginas[x].vaginaColor = pc.hairColor;
			}
			pc.createStatusEffect("Gel Body");
			bonusTexts = " You've always been a sexy goo-girl!";
			break;
		/*Skeith Straud I can't seem to get any confirmation, I pledged on March 19 at 11:15 AM, if I do qualify for the char, here is the description, if I don't, my apologies for wasting your time.
		
		I would like a five foot, nine inch tall Hermaphrodite Dragon-morph, the whole package, tongue, face/ear-fins, feet and tail. If a color scheme is possible, neon-fucking-green on her front, belly and mandible, the rest is black, if scheme isn't part of the deal, an outright green. A single (you guessed it) draconic penis, seven inches long and one and a half thick. Two breasts, C-cup. (if I'm not pushing things, could I have two nipples on each?) A very wet vagina ('cause I'm sure cloaca isn't an option) with a four inch clitoris. And only because I'm never lucky enough to get it, I would like her to have a self lubricating anus. Even with all that, this is the most outlandish request, if it works like that at all, I would like her tail to be about as long as she is tall. If it isn't doable, feel free to mock me publicly.*/
		
		case "skeith":
		case "skeith straud":
			pc.tallness = 69;
			pc.legType = GLOBAL.TYPE_DRACONIC;
			pc.faceType = GLOBAL.TYPE_DRACONIC;
			pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
			pc.earType = GLOBAL.TYPE_DRACONIC;
			pc.tongueType = GLOBAL.TYPE_DRACONIC;
			pc.tailType = GLOBAL.TYPE_DRACONIC;
			pc.tailCount = 1;
			pc.clearTongueFlags();
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			pc.scaleColor = "black";
			pc.skinTone = "neon green";
			if(!pc.hasCock()) pc.createCock();
			pc.cocks[0].cockColor = "neon green";
			pc.cocks[0].cLengthRaw = 7;
			if(!pc.hasVagina()) pc.createVagina();
			pc.vaginas[0].vaginalWetnessRaw = 4;
			pc.breastRows[0].breastRatingRaw = 3;
			pc.clitLength = 4;
			pc.nipplesPerBreast = 2;
			pc.ass.wetnessRaw = 2;
			bonusTexts = "You've always been a draconic hermaphrodite with lots of neon-green accents!";
			break;
		/*Nivâ My character should be a human female without any transformation. She has red shoulder long hair which is bond i a ponytail. She also has olive skin, a curvy body, D-cup breasts and an normal ass. She has a red gem belly button piercing and also red gem earrings. Her main atribute is close combat, so she needs a lot of strength and speed. Her weapons are 2 blades. They are nano blades which she activate with her will power. The nanites are in her whole body. When she fights the blades come out and cover her hands. The nanites also cover parts of her body like an secound skin. You could say she is the space Witchblade.( Here a reference pic http://www.1zoom.net/Anime/wallpaper/98382/z565.1/ )

		Her body armor should be skin tight. The legs have highheel boots to her ass. The ass is bare with no armor. Just her privat zone is covered. Her body armor is like in the picture, a free belly button and armor over her breasts and left/right side. Her arms are covered with the blades and also some armor around her neck. It is like a posture collar but also over her shoulder.

		When the nanites are active her face has also the marks like in the picture and her eyes looks the same.
		Are the nanites inactive she has blue eyes. The nanites then form skin tight bracelets with a green gem in it, above her hands.
		The whole armor and the blades are silver like the bracelets.
		Her secound atribute is a high recovery. The nanites repair every damage to her body.
		The other atributes are high sensitivity, fertility, lust, libido and corruption.
		She is an mercenary and fights for money or sex.
		Sometimes her inner corruption takes over and then she berserks. This could happen in fight or in bed.

		I hope this is not to much for a single character and also sorry for my bad english. It´s not my native language.*/
		case "nivâ":
			pc.hairColor = "red";
			pc.hairLength = 10;
			pc.skinTone = "olive";
			pc.tone = 40;
			pc.thickness = 65;
			if(pc.buttRatingRaw < 6) pc.buttRatingRaw = 6;
			if(pc.hipRatingRaw < 6) pc.hipRatingRaw = 6;
			if(pc.breastRows[0].breastRatingRaw < 4) pc.breastRows[0].breastRatingRaw = 4;
			pc.physique(10);
			pc.reflexes(10);
			pc.armor = new ArmstrongSuitViolet();
			pc.fertilityRaw = 1.5;
			pc.libidoRaw = 50;
			break;
		//Skyhusky I would like a tall husky girl to play, Haha. Vague! <3
		case "skyhusky":
			if(pc.hasVagina()) pc.vaginas[0].type = GLOBAL.TYPE_CANINE;
			if(pc.hasCock()) 
			{
				pc.cocks[0].cType = GLOBAL.TYPE_CANINE;
				pc.cocks[0].cockColor = "red";
				pc.cocks[0].knotMultiplier = 1.5;
			}
			pc.armType = GLOBAL.TYPE_CANINE;
			pc.clearArmFlags();
			pc.addArmFlag(GLOBAL.FLAG_FURRED);
			pc.legType = GLOBAL.TYPE_CANINE;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_FURRED);
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_CANINE;
			pc.skinType = GLOBAL.SKIN_TYPE_FUR;
			pc.furColor = "white";
			pc.hairColor = "white";
			if(pc.tallness < 72) pc.tallness = 72;
			if(pc.femininity < 70) pc.femininity = 70;
			bonusTexts = "You've always been a tall husky girl, just waiting to play!";
			break;
		/*Kad'Rick A Viking. Because my pseudo mean warlord in old viking and mostly because i like Norse mythology.
		Appearance :
		A 6 foot 5 inch tall human, with average thickness and perfectly defined muscles.
		red-hair and red-beard
		13 inches long and 2 inches wide cock.
		Items :
		If possible a hammer
		Perks :
		Fighter, Regeneration, Resolute, Strong Back and Tank
		Keep up the good work.
		Don' t hesitate to contact me if you have questions.*/
		case "kad'rick":
		case "kad":
			pc.tone = 100;
			pc.thickness = 50;
			pc.tallness = 77;
			if(!pc.hasCock()) pc.createCock();
			pc.cocks[0].cLengthRaw = 13;
			pc.meleeWeapon = new RocketHammer();
			pc.physique(5);
			break;
		/*Glavior 11 foot 0 inch tall dragon-morph, with a fit, somewhat thin body, you are covered from head to toe in red shield-shaped scales, and, rippling muscles all over. Your face is reptilian. It looks like a predatory lizard's, at first glance, but with an unusual array of spikes along the under-jaw. It gives you a regal but fierce visage. Opening your mouth reveals several rows of dagger-like sharp teeth. The fearsome visage is decorated by your scales. It has a jaw-droppingly feminine shape. And you have a pair of rounded protrusions with small holes on the sides of your head serve as your ears. Bony fins sprout behind them. Your mouth contains a thick, fleshy tongue that, if you so desire, can telescope to a distance of about four feet. It has sufficient manual dexterity that you can use it almost like a third arm. Two pairs of horns, roughly a foot long, sprout from the sides of your head. They sweep back elegantly giving you a majestic but fearsome look, you have Prideful, fierce eyes, with slit pupils and burning red-ish orange irises, glitter even in the darkness.

		You have a humanoid shape with the usual torso, arms, hands, and fingers. Magnificent wings sprout from your shoulders. When unfurled they stretch further than your arm span, and a single beat of them is all you need to set out toward the sky. They look a bit like bat's wings, but the membranes are covered in fine, delicate scales and a wicked talon juts from the end of each bone. Your body is a curvy thing, not rough like some reptilian creature, but rounded and almost soft-looking, with a taut belly and a perfect hourglass figure. your girly hips are as eye-catching as the shapely handful that graces your posterior, giving you a sexy and graceful strut. And that same delightful butt of yours just begs to be touched, soft enough to jiggle only slightly and yet firm enough to not trouble the your balance. A thin, scaly, prehensile reptilian tail, almost as long as you are tall, swings behind you like a living bullwhip. Its tip menaces with spikes of bone, meant to deliver painful blows. Two human-like legs grow down from your girly hips, sheathed in scales and ending in clawed feet. There are three long toes on the front, and a small hind-claw on the back.

		You have three rows of breasts, the topmost pair starting at your chest.
		--Your uppermost rack houses two basketball-sized tits with one 0.5-inch pronounced cherry-like nub each. They are also covered in fine scales excepting your areolas. And they could easily fill a big GG-cup bra.
		--The second row holds two cushiony tits with one 0.5-inch nipple each. They are also covered in fine scales excepting your areolas. And they could easily fill a big GG-cup bra.
		--Your third row of breasts contains two tits with one 0.5-inch nipple each. They are also covered in fine scales excepting your areolas. And they could easily fill a big GG-cup bra.

		Where a penis would normally be located, you have instead grown a bundle of ready, segmented shafts!
		-One of your monstrously thick, dragon-like dicks is 105 inches long and 2.5 inches thick. With its tapered tip, there are few holes you wouldn't be able to get into. It has a strange, knot-like bulb at its base, but doesn't usually flare during arousal as a dog's knot would.
		-Another of your freakish, pointed pricks is 105 inches long and 2.5 inches thick. With its tapered tip, there are few holes you wouldn't be able to get into. It has a strange, knot-like bulb at its base, but doesn't usually flare during arousal as a dog's knot would.
		-Your next inhumanly distended, scaly shaft is 105 inches long and 2.5 inches in diameter. With its tapered tip, there are few holes you wouldn't be able to get into. It has a strange, knot-like bulb at its base, but doesn't usually flare during arousal as a dog's knot would.
		-Your next unusual endowment is 17 inches long and 2 inches wide. With its tapered tip, there are few holes you wouldn't be able to get into. It has a strange, knot-like bulb at its base, but doesn't usually flare during arousal as a dog's knot would.
		A scaley sack hugs your four basketball-sized nuts tightly against your body. You estimate each of them to be about ten inches across.

		The scales in-between your legs are particularly smooth and fine, and part just enough to reveal the insides of your slick virgin pussy; soft, inviting and moist. Your slick virgin pussy has a 0.2-inch clit and an intact hymen.

		You have a virgin anus, placed between your soft yet firm ass-cheeks where it belongs.*/
		case "glavior":
			pc.createBreastRow();
			pc.createBreastRow();
			pc.breastRows[0].breastRatingRaw = 18;
			pc.breastRows[1].breastRatingRaw = 18;
			pc.breastRows[2].breastRatingRaw = 18;
			if(!pc.hasCock()) pc.createCock();
			pc.createCock();
			pc.createCock();
			pc.cocks[0].cType = GLOBAL.TYPE_DRACONIC;
			pc.cocks[0].cLengthRaw = 105;
			pc.cocks[0].cockColor = "black";
			pc.cocks[1].cType = GLOBAL.TYPE_DRACONIC;
			pc.cocks[1].cLengthRaw = 105;
			pc.cocks[1].cockColor = "black";
			pc.cocks[2].cType = GLOBAL.TYPE_DRACONIC;
			pc.cocks[2].cLengthRaw = 17;
			pc.cocks[2].cockColor = "black";
			pc.balls = 4;
			pc.ballSizeRaw = 18;
			if(!pc.hasVagina()) pc.createVagina();
			pc.vaginas[0].wetnessRaw = 3;
			pc.tallness = 132;
			pc.tone = 70;
			pc.thickness = 30;
			pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
			pc.scaleColor = "red";
			pc.faceType = GLOBAL.TYPE_DRACONIC;
			pc.femininity = 100;
			pc.earType = GLOBAL.TYPE_DRACONIC;
			pc.tongueType = GLOBAL.TYPE_DRACONIC;
			pc.clearTongueFlags();
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			pc.horns = 2;
			pc.hornLength = 12;
			pc.hornType = GLOBAL.TYPE_DRACONIC;
			pc.eyeColor = "red";
			pc.wingType = GLOBAL.TYPE_DRACONIC;
			pc.buttRatingRaw = 7;
			pc.hipRatingRaw = 6;
			pc.tailType = GLOBAL.TYPE_DRACONIC;
			pc.tailCount = 1;
			pc.legCount = 2;
			pc.legType = GLOBAL.TYPE_DRACONIC;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_SCALED);
			bonusTexts = "You've always been an exceptionally endowed dragoness.";
			break;
		/*All bovine features with a feminine appearance,
		Name: Daisy
		Gender: Herm
		Height: 6ft 3in
		Breasts: HH cup
		Penis: Equine, 20L x 3W
		Balls: 2, 10 Inch

		If applicable:
		Eye colour: Purple
		Cum + Milk multiplier: Just put a big number please xD*/
		case "daisy":
			if(!pc.hasCock()) pc.createCock();
			if(!pc.hasVagina()) pc.createVagina();
			pc.tallness = 75;
			pc.breastRows[0].breastRatingRaw = 22;
			pc.cocks[0].cType = GLOBAL.TYPE_EQUINE;
			pc.cocks[0].cLengthRaw = 20;
			pc.balls = 2;
			pc.ballSizeRaw = 35;
			pc.eyeColor = "purple";
			pc.cumMultiplierRaw = 30;
			pc.ballEfficiency = 90;
			break;
		/*Name: Dawn
		Eyes: Blue
		Hair: Blond (shoulder length)
		Genitals: pussy and 12" dick (human)
		Breasts: DD
		Height: 5'4"*/
		case "dawn":
			pc.eyeColor = "blue";
			pc.hairColor = "blonde";
			pc.hairLength = 13;
			if(!pc.hasCock()) pc.createCock();
			if(!pc.hasVagina()) pc.createVagina();
			pc.cocks[0].cLengthRaw = 12;
			pc.breastRows[0].breastRatingRaw = 4;
			pc.tallness = 64;
			break;
		//Name: Rope
		//Neuter (no genitals)
		//50-50 masculine-feminine.
		//Everything else as normal
		case "rope":
			pc.femininity = 50;
			pc.removeCocks();
			pc.removeVaginas();
			bonusTexts = "You've always been a neuter. Life's easier that way.";
			break;
		/*Dacraun 6 ft 7
		approximately 20 inch long black as empty space hair (@_@)
		Muscular (But not gigantic thick)
		Quite light skin tone, but covered in fur (Which is as black as the hair.)
		Dog face *woof* ;D
		"Normal" tongue, I suppose?
		Dog Ears
		PAWS *_____*
		Doggy tail. (cute ;D)

		One 22 inch long 2.5 inch thick Dog Pingas with a knot going 2.2 times the normal thickness (How accurate o.o)

		And I suppose That'll do, though it would be lovely if you would write it down more as "Wolfish features" ;D*/
		case "dacraun":
			pc.tallness = 79;
			pc.hairLength = 20;
			pc.hairColor = "black";
			pc.tone = 75;
			pc.faceType = GLOBAL.TYPE_CANINE;
			pc.skinType = GLOBAL.SKIN_TYPE_FUR;
			pc.furColor = "black";
			pc.skinTone = "light";
			pc.earType = GLOBAL.TYPE_CANINE;
			pc.armType = GLOBAL.TYPE_CANINE;
			pc.clearArmFlags();
			pc.addArmFlag(GLOBAL.FLAG_FURRED);
			pc.tailType = GLOBAL.TYPE_DRACONIC;
			pc.tailCount = 1;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_FURRED);
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			if(!pc.hasCock()) pc.createCock();
			pc.cocks[0].cLengthRaw = 22;
			pc.cocks[0].knotMultiplier = 2.2;
			break;
		/*Takibi Name: Taki

		Physical: 6' 5", Herm, Dragon morph(if possible because a dragon type species would be awesome), C cup breasts single set, 20 inch length 2.5 inch width dick, clit and nipples at 0.5 inch, 2 testes at 1 inch across.

		Possible perks: higher than normal cum production(you know, higher than whatever would be considered normal for this one)

		According To Offbeatr, I pledged the amount just a few days shy of 2 months ago. If that is within the time frame, then I have included the character information below. Not sure if you wanted a name as well or just the detailed "mini-overview" but I have included everything, short of her background, below.*/
		case "taki":
			pc.tallness = 77;
			if(!pc.hasCock()) pc.createCock();
			if(!pc.hasVagina()) pc.createVagina();
						
			break;
		case "":
			
			break;
		case "":
			
			break;
		case "":
			
			break;
		case "":
			
			break;
		case "":
			
			break;
		case "":
			
			break;
		case "":
			
			break;
		case "":
			
			break;
		case "":
			
			break;
		case "":
			
			break;
		default:
			if(!TF) return false;
			break;
	}
	if(TF)
	{
		clearOutput();
		showName("\n????");
		output("Reality seems to warp, but then, things are as they always have been, aren't they? You look over your [pc.chest], [pc.crotch]. Yup, everything is fine.");
		if(bonusTexts != "") output(" " + bonusTexts);
		clearMenu();
		addButton(0,"Next",fatedPCOptionsFinisher);
	}
	//If "default" is hit, return false. Seemed the laziest way to do it.
	return true;
}