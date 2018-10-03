import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.GameData.CombatManager;
import flash.events.Event;
import classes.GameData.MailManager;
import classes.Cheats;
import classes.Items.Transformatives.GaloMax;

public function nameOfDestinyChoice():void
{
	clearOutput();
	showName("FATED\nNAME!");
	output("The chosen name is one that hangs heavy under the weight of destiny. Should you embrace your destiny, you may discover just how little Victor’s science may mean. Certain choices may be invalidated. You may find yourself a woman instead of a man, or a race unlike any other in the known galaxy.\n\n<b>Do you embrace the path the fates have spooled out before you or resign yourself to mediocrity?</b>");
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
	var i:int = 0;
	switch (short)
	{
		case "pwink":
			if(!TF) break;
			pc.upperUndergarment = new PlainUndershirt();
			pc.lowerUndergarment = new PlainBriefs();
			pc.legCount = 2;
			pc.earType = GLOBAL.TYPE_SYLVAN;
			pc.earLength = 2;
			pc.tallness = 60;
			pc.femininity = 40;
			pc.faceType = GLOBAL.TYPE_HUMAN;
			pc.clearFaceFlags();
			pc.armType = GLOBAL.TYPE_HUMAN;
			pc.skinTone = "neon pink";
			pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
			if(!pc.hasCock()) pc.createCock();
			pc.cocks[0].cLengthRaw = 12;
			pc.cocks[0].cockColor = "bright pink";
			pc.cocks[0].cType = GLOBAL.TYPE_HUMAN;
			pc.cocks[0].clearFlags();
			pc.cocks[0].addFlag(GLOBAL.FLAG_FORESKINNED);
			//Moderate cum boost
			pc.boostCum(10);
			pc.balls = 2;
			pc.ballSizeRaw = 10;
			//Flat chest
			pc.breastRows[0].breastRatingRaw = 0;
			pc.nippleColor = "bright pink";
			pc.eyeColor = "yellow";
			pc.eyeType = GLOBAL.TYPE_FELINE; //slit pupils yooo
			pc.hairColor = "light pink";
			pc.lipColor = "red";
			pc.hairLength = 4;
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_LIZAN;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.legType = GLOBAL.TYPE_DEER;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_HOOVES);
			pc.tongueType = GLOBAL.TYPE_DEMONIC;
			pc.clearTongueFlags();
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			//pc.tongueColor = "pink";
			pc.hipRatingRaw = 12;
			pc.buttRatingRaw = 12;
			pc.wingType = 0;
			pc.wingCount = 0;
			pc.horns = 2;
			pc.hornType = GLOBAL.TYPE_DEMONIC;
			pc.hornLength = 3;
			pc.ass.vaginaColor = "cyan";
			pc.inventory.push(new GaloMax());
			pc.inventory[0].quantity = 5;
			pc.aim(1);
			pc.willpower(1);
			pc.reflexes(1);
			pc.intelligence(1);
			pc.credits = 6900;
			pc.tone = 25;
			pc.thickness = 66;
			pc.removeVaginas();
			break;
		case "archie":
			if(!TF) break;
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
			if(!TF) break;
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
			bonusTexts = "Good thing Victor’s scientists made you to be the perfect heir. So long as you aren’t distracted by your ability to experience inhuman amounts of pleasure, you’ll do just fine! ...Now, what to do with all this silicone?";
			var siliconeBoners:ItemSlotClass = new Silicone();
			siliconeBoners.quantity = 10;
			pc.inventory.push(siliconeBoners);
			break;
		case "galthus":
			if(!TF) break;
			if(!pc.hasCock()) pc.createCock();
			pc.cocks[0].cLengthRaw = 11;
			pc.cocks[0].cThicknessRatioRaw = 1.3;
			pc.cumMultiplierRaw = 150;
			pc.ballEfficiency = 400;
			pc.intelligence(2);
			pc.reflexes(2);
			pc.aim(2);
			if(pc.tallness < (6*12+3)) pc.tallness = 6*12 + 3;
			if(pc.thickness > 40) pc.thickness = 40;
			pc.eyeColor = "black";
			pc.eyeType = GLOBAL.TYPE_BEE;
			pc.earType = GLOBAL.TYPE_DRIDER;
			pc.credits += 2000;
			bonusTexts = "You were born a bit different than expected, but from differences come strength... and a very productive set of genitals.";
			break;
		case "legojohn":
			if(!TF) break;
			pc.tallness = 12*5+11;
			pc.tone = 80;
			pc.thickness = 25;
			pc.faceType = GLOBAL.TYPE_SHARK;
			pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
			pc.scaleColor = "gray";
			pc.hairLength = pc.tallness/2;
			pc.hairColor = "blue";
			pc.earType = GLOBAL.TYPE_CANINE;
			pc.wingType = GLOBAL.TYPE_SHARK;
			pc.wingCount = 1;
			pc.hipRatingRaw = 7;
			pc.buttRatingRaw = 5;
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_SHARK;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.legType = GLOBAL.TYPE_CANINE;
			pc.legCount = 2;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_FURRED);
			pc.addLegFlag(GLOBAL.FLAG_PAWS);
			pc.breastRows[0].breastRatingRaw = 8;
			pc.boostLactation(100);

			if(!pc.hasCock()) pc.createCock();
			if(pc.cockTotal() < 2) pc.createCock();
			pc.shiftCock(0,GLOBAL.TYPE_CANINE);
			pc.shiftCock(1,GLOBAL.TYPE_CANINE);
			pc.cocks[0].knotMultiplier = 1.333333;
			pc.cocks[0].cLengthRaw = 19.5;
			pc.cocks[0].cThicknessRatioRaw = 1.230769230769231;
			pc.cocks[1].knotMultiplier = 1.333333;
			pc.cocks[1].cLengthRaw = 20;
			pc.cocks[1].cThicknessRatioRaw = 1.5;

			if(!pc.hasVagina()) pc.createVagina();
			pc.vaginas[0].wetnessRaw = 2;
			pc.clitLength = 0.3;
			bonusTexts = "Despite a curious blend of canine and shark genes finding their way into your genome, you are still Victor Steele’s heir - but one with two big-ass dog-dicks and a desire to use them.";
			break;
		//Fetysh - Female, max fertility, the perks that increase pregnancy speed (I believe Marae's, Fera's and the brood mother one). Other perks I'll enjoy getting during leveling. As for character specifics, short, about 4'11", 95lbs, tentacle hair, blue-black skin, spaded tail, normal hands/feet. Virginal cunt/ass to start with and C-cup breasts. (Can those resist most normal forms of shrinking? Not all if you could, sort of like the bimbo body that keeps them at a minimum size)
		case "fetysh":
			if(!TF) break;
			if(!pc.hasVagina()) pc.createVagina();
			pc.vaginas[0].wetnessRaw = 2;
			pc.fertilityRaw = 10;
			pc.removePerk("Infertile");
			pc.pregnancyIncubationBonusMotherRaw = 10;
			pc.pregnancyMultiplierRaw += 1;
			bonusTexts = "You’ve always been ridiculously fertile. The doctors warned you at a young age. Just a glance at the wrong alien and you’ll blow up with babies! But that’s not new.";
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
			if(!TF) break;
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
			pc.shiftCock(0, GLOBAL.TYPE_ANEMONE);
			pc.cocks[0].cLengthRaw = 12;
			pc.cocks[0].addFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
			pc.cocks[0].addFlag(GLOBAL.FLAG_STINGER_TIPPED);
			pc.cocks[0].addFlag(GLOBAL.FLAG_STINGER_BASED);
			pc.balls = 0;
			pc.clitLength = 0.7;
			bonusTexts = "You’ve always been a big-dicked, dragon-like hermaphrodite.";
			break;
		//Name: KosMos
		//Appearance: 5'8" Female Gynoid (Female Android) with light skin, red eyes, ass-length blue hair. Built-in high heels. B-cup breasts. One Vagina, one ass.
		//Perks: Nanoparticle Body: Damage reduction.
		//X-Buster: Special attack. (Opens abdomen to release beam lances at enemy.)
		case "kosmos":
			if(!TF) break;
			pc.skinTone = "light";
			pc.eyeColor = "red";
			pc.hairLength = pc.tallness / 2 + 1;
			pc.legType = GLOBAL.TYPE_SUCCUBUS;
			if(pc.breastRows[0].breastRatingRaw < 2) pc.breastRows[0].breastRatingRaw = 2;
			if(!pc.hasVagina()) pc.createVagina();
			pc.createStatusEffect("Perfect Simulant",0,0,0,0,false,"Icon_Gears_Three","You were created by the scientists at Steele Tech to be the perfect heir, and as such, your maximum capabilities exceed even those of the luckiest terrans. You walk, talk, breathe, and eat, just like any living creature, even simulating DNA to allow you to emulate the effects of transformative items on true organics.",false,0);
			bonusTexts = "Good thing Victor’s scientists made you to be the perfect heir. So long as you aren’t distracted by your ability to experience inhuman amounts of pleasure, you’ll do just fine!";
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
			if(!TF) break;
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
			if(!TF) break;
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
			pc.removePerk("Infertile");
			pc.cumQualityRaw = 3;
			if(pc.femininity < 70) pc.femininity = 70;
			bonusTexts += "You’ve always had an amazing physique, and the best of both genders - the better to colonize new worlds with your young.";
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
			if(!TF) break;
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
			pc.balls = 2;
			if(pc.ballSizeRaw < 8) pc.ballSizeRaw = 8;
			if(pc.breastRows[0].breastRatingRaw > 0) pc.breastRows[0].breastRatingRaw = 0;
			
			pc.faceType = GLOBAL.TYPE_SIMII;
			pc.clearFaceFlags();
			pc.earType = GLOBAL.TYPE_SIMII;
			pc.armType = GLOBAL.TYPE_SIMII;
			pc.clearArmFlags();
			pc.addArmFlag(GLOBAL.FLAG_FURRED);
			pc.legType = GLOBAL.TYPE_SIMII;
			pc.legCount = 2;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_FLUFFY);
			pc.addLegFlag(GLOBAL.FLAG_FURRED);
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_SIMII;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.shiftCock(0,GLOBAL.TYPE_SIMII);
			
			bonusTexts += "You’ve always been a bit of a monkey. Nothing wrong with that.";
			//bonusTexts += " (Note: Monkey parts aren’t properly supported at the time of coding this character. If this changes down the road, please feel free to log a bug report, and we’ll get this PC updated.)";
			break;
		/*Anon All available shark transformations.
		Hermaphrodite with normal vagina, normal 8" penis, 2 E cup breasts.
		6'2" tall, max femininity.
		All else same as a standard starting character.*/
		case "anon":
			if(!TF) break;
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
			bonusTexts += "You’ve always been a bit of an aquatic terror, haven’t you?";
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
			if(!TF) break;
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
			pc.shiftCock(0, GLOBAL.TYPE_TENTACLE);
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
			flags["GALOMAX_DOSES"] = 5;
			if(pc.elasticity < (pc.hasPerk("Elasticity") ? 4 : 3)) pc.elasticity = (pc.hasPerk("Elasticity") ? 4 : 3);
			for(i = 0; i < pc.totalCocks(); i++)
			{
				if(!pc.hasCockFlag(GLOBAL.FLAG_GOOEY,i)) pc.cocks[i].addFlag(GLOBAL.FLAG_GOOEY);
				pc.cocks[i].cockColor = pc.hairColor;
			}
			for(i = 0; i < pc.totalVaginas(); i++)
			{
				if(!pc.vaginas[i].hasFlag(GLOBAL.FLAG_GOOEY)) pc.vaginas[i].addFlag(GLOBAL.FLAG_GOOEY);
				pc.vaginas[i].vaginaColor = pc.hairColor;
			}
			pc.createStatusEffect("Gel Body");
			bonusTexts = " You’ve always been a sexy goo-girl!";
			break;
		/*Skeith Straud I can't seem to get any confirmation, I pledged on March 19 at 11:15 AM, if I do qualify for the char, here is the description, if I don't, my apologies for wasting your time.
		
		I would like a five foot, nine inch tall Hermaphrodite Dragon-morph, the whole package, tongue, face/ear-fins, feet and tail. If a color scheme is possible, neon-fucking-green on her front, belly and mandible, the rest is black, if scheme isn't part of the deal, an outright green. A single (you guessed it) draconic penis, seven inches long and one and a half thick. Two breasts, C-cup. (if I'm not pushing things, could I have two nipples on each?) A very wet vagina ('cause I'm sure cloaca isn't an option) with a four inch clitoris. And only because I'm never lucky enough to get it, I would like her to have a self lubricating anus. Even with all that, this is the most outlandish request, if it works like that at all, I would like her tail to be about as long as she is tall. If it isn't doable, feel free to mock me publicly.*/
		
		case "skeith":
		case "skeith straud":
			if(!TF) break;
			pc.tallness = 69;
			pc.legType = GLOBAL.TYPE_DRACONIC;
			pc.faceType = GLOBAL.TYPE_DRACONIC;
			pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
			pc.earType = GLOBAL.TYPE_DRACONIC;
			pc.tongueType = GLOBAL.TYPE_DRACONIC;
			pc.tailType = GLOBAL.TYPE_DRACONIC;
			pc.tailCount = 1;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.clearTongueFlags();
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			pc.scaleColor = "black";
			pc.skinTone = "neon green";
			if(!pc.hasCock()) pc.createCock();
			pc.cocks[0].cockColor = "neon green";
			pc.cocks[0].cLengthRaw = 7;
			if(!pc.hasVagina()) pc.createVagina();
			pc.vaginas[0].wetnessRaw = 4;
			pc.breastRows[0].breastRatingRaw = 3;
			pc.clitLength = 4;
			pc.nipplesPerBreast = 2;
			pc.ass.wetnessRaw = 2;
			bonusTexts = "You’ve always been a draconic hermaphrodite with lots of neon-green accents!";
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
		case "niva":
			if(!TF) break;
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
			pc.removePerk("Infertile");
			pc.libidoRaw = 50;
			break;
		//Skyhusky I would like a tall husky girl to play, Haha. Vague! <3
		case "skyhusky":
			if(!TF) break;
			if(pc.hasVagina())
			{
				for(i = 0; i < pc.vaginas.length; i++)
				{
					pc.shiftVagina(i, GLOBAL.TYPE_CANINE);
				}
			}
			if(pc.hasCock()) 
			{
				for(i = 0; i < pc.cocks.length; i++)
				{
					pc.shiftCock(i, GLOBAL.TYPE_CANINE);
					pc.cocks[i].cockColor = "red";
					pc.cocks[i].knotMultiplier = 1.5;
				}
			}
			pc.armType = GLOBAL.TYPE_CANINE;
			pc.clearArmFlags();
			pc.addArmFlag(GLOBAL.FLAG_FURRED);
			pc.addArmFlag(GLOBAL.FLAG_FLUFFY);
			pc.legType = GLOBAL.TYPE_CANINE;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_FURRED);
			pc.addLegFlag(GLOBAL.FLAG_FLUFFY);
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_CANINE;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
			pc.addTailFlag(GLOBAL.FLAG_FURRED);
			pc.clearSkinFlags();
			pc.addSkinFlag(GLOBAL.FLAG_FLUFFY);
			pc.createPerk("Regal Mane", GLOBAL.FLAG_FURRED, 0, 0, 0, "You have an impressive mane bordering your neck.");
			pc.furColor = "white";
			pc.hairColor = "white";
			if(pc.tallness < 72) pc.tallness = 72;
			if(pc.femininity < 70) pc.femininity = 70;
			bonusTexts = "You’ve always been a tall husky girl, just waiting to play!";
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
			if(!TF) break;
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
			if(!TF) break;
			pc.createBreastRow();
			pc.createBreastRow();
			pc.breastRows[0].breastRatingRaw = 18;
			pc.breastRows[1].breastRatingRaw = 18;
			pc.breastRows[2].breastRatingRaw = 18;
			if(!pc.hasCock()) pc.createCock();
			pc.createCock();
			pc.createCock();
			pc.shiftCock(0, GLOBAL.TYPE_DRACONIC);
			pc.cocks[0].cLengthRaw = 105;
			pc.cocks[0].cockColor = "black";
			pc.shiftCock(1, GLOBAL.TYPE_DRACONIC);
			pc.cocks[1].cLengthRaw = 105;
			pc.cocks[1].cockColor = "black";
			pc.shiftCock(2, GLOBAL.TYPE_DRACONIC);
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
			pc.removeHorns();
			pc.horns = 2;
			pc.hornLength = 12;
			pc.hornType = GLOBAL.TYPE_DRACONIC;
			pc.eyeColor = "red";
			pc.wingType = GLOBAL.TYPE_DRACONIC;
			pc.wingCount = 2;
			pc.buttRatingRaw = 7;
			pc.hipRatingRaw = 6;
			pc.tailType = GLOBAL.TYPE_DRACONIC;
			pc.tailCount = 1;
			pc.legCount = 2;
			pc.legType = GLOBAL.TYPE_DRACONIC;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_SCALED);
			bonusTexts = "You’ve always been an exceptionally endowed dragoness.";
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
			if(!TF) break;
			if(!pc.hasCock()) pc.createCock();
			if(!pc.hasVagina()) pc.createVagina();
			pc.tallness = 75;
			pc.breastRows[0].breastRatingRaw = 22;
			pc.shiftCock(0, GLOBAL.TYPE_EQUINE);
			pc.cocks[0].cLengthRaw = 20;
			pc.balls = 2;
			pc.ballSizeRaw = 35;
			pc.eyeColor = "purple";
			pc.cumMultiplierRaw = 30;
			pc.ballEfficiency = 90;
			break;
		/*Name: Dawn
		Eyes: Blue
		Hair: Blonde (shoulder length)
		Genitals: pussy and 12" dick (human)
		Breasts: DD
		Height: 5'4"*/
		case "dawn":
			if(!TF) break;
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
			if(!TF) break;
			pc.femininity = 50;
			pc.removeCocks();
			pc.removeVaginas();
			bonusTexts = "You’ve always been a neuter. Life’s easier that way.";
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
			if(!TF) break;
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
			pc.addArmFlag(GLOBAL.FLAG_PAWS);
			pc.tailType = GLOBAL.TYPE_CANINE;
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
			if(!TF) break;
			pc.tallness = 77;
			pc.scaleColor = "blue";
			if(!pc.hasCock()) pc.createCock();
			if(!pc.hasVagina()) pc.createVagina();
			pc.faceType = GLOBAL.TYPE_DRACONIC;
			pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
			pc.legType = GLOBAL.TYPE_DRACONIC;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_SCALED);
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_DRACONIC;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_SCALED);
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.armType = GLOBAL.TYPE_DRACONIC;
			pc.clearArmFlags();
			pc.addArmFlag(GLOBAL.FLAG_SCALED);
			pc.clitLength = 0.5;
			pc.balls = 2;
			pc.ballSizeRaw = 3.5;
			pc.breastRows[0].breastRatingRaw = 3;
			pc.shiftCock(0, GLOBAL.TYPE_DRACONIC);
			pc.cocks[0].cLengthRaw = 20;
			pc.cumMultiplierRaw = 40;
			pc.ballEfficiency = 150;
			break;
		/*Alexia, Female, normal genitals, Futa Optional, D cup breast, Kind, Pansexual, piercings and Tattooes, Not a total slut. (Space Pirate with a strict moral code, if possible) =), jelvegaa@hotmail.com*/
		case "alexia":
			if(!TF) break;
			if(!pc.hasVagina()) pc.createVagina();
			pc.breastRows[0].breastRatingRaw = 4;
			break;
		/*Name: Brenda Reynolds
		Age: 35
		Species: Pig/Boar
		Gender: Female
		Height: 6 Ft 5 Inches
		Weight: 410 lbs.
		Breast Size: 44DD On First (Top) Row
		Breast Orientation: Ten Total Breasts/Five Rows Of Two/Get One Cup Size Smaller In Size As You Go Down
		Genitalia Type: Anthro Vagina, Human In Appearance, Plumper Lips/Labia Than Average. Two Inch Clitoris
		Temperament: Confrontational. Prone To Immense Mood Swings And Possible Violence
		Enjoys - Being Pregnant
		Loathes - Domineering Men
		If I have left anything you needed for the custom character out, please let me know (assuming I even made the cut to get one)!*/
		case "brenda":
			if(!TF) break;
			pc.tallness = 77;
			pc.thickness = 100;
			pc.breastRows[0].breastRatingRaw = 5;
			pc.createBreastRow();
			pc.createBreastRow();
			pc.createBreastRow();
			pc.createBreastRow();
			pc.breastRows[1].breastRatingRaw = 4;
			pc.breastRows[2].breastRatingRaw = 3;
			pc.breastRows[3].breastRatingRaw = 2;
			pc.breastRows[4].breastRatingRaw = 1;
			if(!pc.hasVagina()) pc.createVagina();
			pc.clitLength = 2;
			if(pc.femininity < 70) pc.femininity = 70;
			
			pc.faceType = GLOBAL.TYPE_SWINE;
			pc.clearFaceFlags();
			pc.earType = GLOBAL.TYPE_SWINE;
			pc.legCount = 2;
			pc.legType = GLOBAL.TYPE_SWINE;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_HOOVES);
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_SWINE;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_CORKSCREWED);
			pc.shiftVagina(0,GLOBAL.TYPE_SWINE);
			pc.inflateVagina(0);
			break;
		/*Warkonst Height: 1,75m
		Hair: Short, Black
		Sex: Futa with 35cm Horse cock and 15cm clit
		Breasts: NN-Cup 10cm nipples
		Body: Average
		Skin Color: Demonic Red
		Gift: Lots of Jizz
		Bat Wings
		2 Demon Horns
		Horn protruding from heels
		Succubus Tail
		Snake Tongue*/
		case "warkonst":
			if(!TF) break;
			pc.hairColor = "black";
			pc.hairLength = 1;
			if(!pc.hasCock()) pc.createCock();
			pc.shiftCock(0,GLOBAL.TYPE_EQUINE);
			pc.cocks[0].cLengthRaw = 13.7;
			pc.clitLength = 6;
			pc.breastRows[0].breastRatingRaw = 49;
			pc.skinTone = "red";
			pc.cumMultiplierRaw = 40;
			pc.ballEfficiency = 150;
			pc.horns = 2;
			pc.hornType = GLOBAL.TYPE_DEMONIC;
			pc.hornLength = 3;
			pc.legType = GLOBAL.TYPE_SUCCUBUS;
			pc.legCount = 2;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_HEELS);
			pc.tailType = GLOBAL.TYPE_DEMONIC;
			pc.tailCount = 1;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			if(pc.femininity < 80) pc.femininity = 80;
			pc.wingType = GLOBAL.TYPE_DEMONIC;
			pc.wingCount = 2;
			pc.tongueType = GLOBAL.TYPE_NAGA;
			pc.clearTongueFlags();
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			break;
		/*Sablecaballero Human futanari with curvy body, red long hair, DD breasts, human dick, and all pregnancy/cum production perks.*/
		case "sablecaballero":
			if(!TF) break;
			if(!pc.hasCock()) pc.createCock();
			if(!pc.hasVagina()) pc.createVagina();
			pc.hairLength = 12;
			pc.hairColor = "red";
			if(pc.femininity < 70) pc.femininity = 70;
			pc.breastRows[0].breastRatingRaw = 5;
			pc.cumMultiplierRaw = 10;
			pc.ballEfficiency = 30;
			pc.removePerk("Infertile");
			pc.pregnancyIncubationBonusMotherRaw = 3;
			pc.hipRatingRaw = 7;
			pc.buttRatingRaw = 6;
			break;
		/*Name: Hikari
		Female, no penis, normal (virgin) vagina, one row of A-cup breasts
		4'0", low muscle definition
		High INT, high SPD, very high fertility rating
		Pale skin, elfin ears, otherwise human appearance
		If we're allowed to request things that don't exist (with no guarantee, of course,) maybe some perk or tf that sends her into heat periodically? Otherwise, maybe just starting with some coal (or TiTS equivalent heat-inducing item.)*/
		case "hikari":
			if(!TF) break;
			if(pc.hasCock()) pc.removeCock(0);
			if(!pc.hasVagina()) pc.createVagina();
			if(pc.femininity < 70) pc.femininity = 70;
			pc.breastRows[0].breastRatingRaw = 1;
			pc.tallness = 48;
			pc.intelligence(5);
			pc.reflexes(5);
			pc.aim(5);
			pc.earType = GLOBAL.TYPE_SYLVAN;
			pc.earLength = 4+rand(5);
			pc.tone = 30;
			pc.skinTone = "fair";
			
			// Cycle every 7 days
			pc.createHeatPerk(7);
			break;
		/*Thanyl Feline, snow-leopard with lynx colouration including ear-tufts if possible, 189 cm tall, lithe and feminine build, ass-length silky blonde hair, red eyes and silver-rimmed rectangular glasses.
		16 cm long penis, 5 cm thick, humanoid, pink and uncut.
		Ping-pong ball-sized testicles in a white-furred sac.
		Uncountable number of red, semi-translucent tentacles extendible from anywhere.
		Perks: Equivalent of sadist and masochist; openings instantly tighten back up to virginal after sex; equivalent of whispered; equivalent of double attack.*/
		case "thanyl":
			if(!TF) break;
			pc.earType = GLOBAL.TYPE_FELINE;
			pc.faceType = GLOBAL.TYPE_FELINE;
			pc.armType = GLOBAL.TYPE_FELINE;
			pc.clearArmFlags();
			pc.addArmFlag(GLOBAL.FLAG_FURRED);
			pc.legType = GLOBAL.TYPE_FELINE;
			pc.legCount = 2;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_FURRED);
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.tailType = GLOBAL.TYPE_FELINE;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_FURRED);
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.tallness = 74;
			pc.thickness = 20;
			pc.tone = 50;
			pc.hairLength = 38;
			pc.hairColor = "blonde";
			pc.furColor = "white";
			pc.eyeColor = "red";
			if(pc.femininity < 70) pc.femininity = 70;
			if(!pc.hasCock()) pc.createCock();
			pc.cocks[0].cLengthRaw = 6.2;
			pc.cocks[0].addFlag(GLOBAL.FLAG_FORESKINNED);
			pc.ballSizeRaw = 4.5;
			pc.balls = 2;
			break;
		/*Trypticon2008 6 foot 2 inches. medium long red hair. slender but not skinny. Her skin and face are like from Neytiri in Avatar. Flexible enough to self felate her. 2 hidden retractable tentacle on her back (stomach height) that can extend to 2 meters and are 5cm thick. Both have a penis like phallus and the end and are dripping with a slimy lubricant. (can be used for self insertion/pleasure). She has a tail just above her butt that is 1 meter in lenght and is 5 cm at the base and 3cm at the tip what has a phallus shape. Tentacles/tail can impregnate others but not her self.*/
		case "trypticon":
			if(!TF) break;
			pc.tallness = 74;
			pc.hairLength = 6;
			pc.hairColor = "red";
			pc.thickness = 37;
			pc.hairType = GLOBAL.HAIR_TYPE_TENTACLES;
			pc.clearTailFlags();
			pc.tailType = GLOBAL.TYPE_COCKVINE;
			pc.tailCount = 1;
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.tailGenital = GLOBAL.TAIL_GENITAL_COCK;
			pc.tailGenitalArg = GLOBAL.TYPE_HUMAN;
			break;
		/*Name is Dina. Female, 8 ft 7 in, Four rows of breasts, Top DD, 2nd C, 3rd B, Lower A, 0.5 inch nipples all around, lactating. Blue scales, shark face, shark tail, dragon legs, 1 ft dragon horns, dragon tongue, shoulder length silver hair. dragon ears, large dragon wings, flared thighs, large butt, thin body, good muscle definition. Dragon breath. 2.5 inch clit, constantly wet vagina.*/
		case "dina":
			if(!TF) break;
			if(!pc.hasVagina()) pc.createVagina();
			if(pc.femininity < 70) pc.femininity = 70;
			pc.tallness = 103;
			pc.createBreastRow();
			pc.createBreastRow();
			pc.createBreastRow();
			pc.breastRows[0].breastRatingRaw = 5;
			pc.breastRows[1].breastRatingRaw = 3;
			pc.breastRows[2].breastRatingRaw = 2;
			pc.breastRows[3].breastRatingRaw = 1;
			pc.milkFullness = 100;
			pc.milkStorageMultiplier = 2;
			pc.milkMultiplier = 100;
			pc.scaleColor = "blue";
			pc.faceType = GLOBAL.TYPE_SHARK;
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_SHARK;
			pc.legType = GLOBAL.TYPE_DRACONIC;
			pc.hornType = GLOBAL.TYPE_DRACONIC;
			pc.horns = 2;
			pc.hornLength = 12;
			pc.tongueType = GLOBAL.TYPE_DRACONIC;
			pc.clearTongueFlags();
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			pc.hairLength = 10;
			pc.hairColor = "silver";
			pc.earType = GLOBAL.TYPE_DRACONIC;
			pc.wingType = GLOBAL.TYPE_DRACONIC;
			pc.wingCount = 2;
			pc.hipRatingRaw = 9;
			pc.buttRatingRaw = 9;
			pc.thickness = 25;
			pc.tone = 70;
			pc.clitLength = 2.5;
			pc.vaginas[0].wetnessRaw = 4;
			break;
		/*Ayreo Greywolf 5ft6 silver blue (yeah it is a real fur color) longfurred fox/wolf (kinda scruffy looking) His posture is pretty relaxed but also with the kinda that he has no time for nonsense. All and All he is pretty average, although a bit of a heavy frame, he appears to be in decent shape but not body builder status. Clothed he wears his naval uniform proudly as a commander should, setting the example for his crew to follow. Nude, you can defiantly note his longer fur, it almost hides his sheath completely. again pretty average, if not slightly thicker hung for a fox, his sheath is a bit thicker than what would be comfortable on a fox, must be his wolf heritage. His balls are pretty average for a wolf, neatly hidden mostly by his long fur. his tail is almost fitting for a germansheppard, if not slightly more bushy, making a nice little cross between fox and wolf and at almost 3 ft long behind him. He carries it proudly behind him, it swishes to and fro depending on his mood and there are those stressful times that his fur may bristle out and it looks like a bottle brush. Like a fox he does have that white tip at the end highlighted with a black ring. His paws , hands and feet have those nice dark furred boots that you would find on a fox.*/
		case "ayreo":
			if(!TF) break;
			pc.tallness = 66;
			pc.furColor = "silver-blue";
			pc.thickness = 66;
			pc.tone = 66;
			//Naval commander uniform?
			if(!pc.hasCock()) pc.createCock();
			pc.shiftCock(0,GLOBAL.TYPE_CANINE);
			pc.balls = 2;
			if(pc.ballSizeRaw < 3.4) pc.ballSizeRaw = 3.4;
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_VULPINE;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FURRED);
			pc.legType = GLOBAL.TYPE_VULPINE;
			pc.legCount = 2;
			pc.armType = GLOBAL.TYPE_LUPINE;
			pc.clearArmFlags();
			pc.addArmFlag(GLOBAL.FLAG_LONG);
			pc.addArmFlag(GLOBAL.FLAG_FURRED);
			pc.addArmFlag(GLOBAL.FLAG_PAWS);
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_LONG);
			pc.addLegFlag(GLOBAL.FLAG_FURRED);
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_PAWS);
			break;
		/*Peppercotton Oviposter, High Fertility, Normal Height (Five Seven), 2 Breasts ( D Cup), 1 Vagina, 1 Butt, */
		case "peppercotton":
			if(!TF) break;
			pc.fertilityRaw = 4;
			pc.removePerk("Infertile");
			if(!pc.hasCock()) pc.createCock();
			if(!pc.cocks[0].hasFlag(GLOBAL.FLAG_OVIPOSITOR)) pc.cocks[0].addFlag(GLOBAL.FLAG_OVIPOSITOR);
			pc.tallness = 67;
			pc.breastRows[0].breastRatingRaw = 4;
			if(!pc.hasVagina()) pc.createVagina();
			break;
		/*Name: Gakre
		Basic attributes: 7'6" tall; slim build; 65% masculine; long blue hair; 3 rows of man-chest with 0.2" nipples; 3" quad-balls.
		Dragon TFs: Face; 2 4" horns; Large wings; Legs; Silver scales; 12" penis.
		Fox TFs: Ears; 9 Tails; 8" penis.
		Demon TF: Tongue.
		Perks: Messy Orgasms; Scholar (History); Dragonfire; Elven Bounty; Enlightened Nine-tails; Fera's Boon - Alpha; Pilgrim's Bounty.
		Item: Spellblade or something similar.*/
		case "gakre":
			if(!TF) break;
			pc.tallness = 88;
			pc.thickness = 33;
			pc.femininity = 35;
			pc.hairLength = 14;
			pc.hairColor = "blue";
			pc.createBreastRow();
			pc.createBreastRow();
			pc.ballSizeRaw = 10;
			pc.balls = 4;
			pc.faceType = GLOBAL.TYPE_DRACONIC;
			pc.horns = 2;
			pc.hornType = GLOBAL.TYPE_DRACONIC;
			pc.hornLength = 4;
			pc.wingType = GLOBAL.TYPE_DRACONIC;
			pc.wingCount = 2;
			pc.legType = GLOBAL.TYPE_DRACONIC;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_SCALED);
			pc.scaleColor = "silver";
			if(!pc.hasCock()) pc.createCock();
			pc.shiftCock(0,GLOBAL.TYPE_DRACONIC);
			pc.cocks[0].cLengthRaw = 12;
			pc.earType = GLOBAL.TYPE_VULPINE;
			pc.tailType = GLOBAL.TYPE_VULPINE;
			pc.tailCount = 9;
			pc.cocks[0].cLengthRaw = 8;
			pc.shiftCock(1,GLOBAL.TYPE_VULPINE);
			pc.tongueType = GLOBAL.TYPE_DEMONIC;
			pc.clearTongueFlags();
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			break;
		/*Name: Stephanie
		Height: 5' 2"
		Body Type: Curvy Redhead w/Light colored skin
		Breasts: DD with 1" nipplecunts
		Genitals: Tight Vagina with 2" clitoris
		Perks (Closest Equivalent): Wet Pussy, Big Tits, Big Clit, Fertility, Smart, Evade, Regeneration*/
		case "stephanie":
			if(!TF) break;
			pc.tallness = 62;
			pc.hairColor = "red";
			pc.skinTone = "light";
			pc.thickness = 65;
			pc.tone = 40;
			pc.hipRatingRaw = 8;
			pc.buttRatingRaw = 8;
			pc.breastRows[0].breastRatingRaw = 5;
			pc.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_FUCKABLE;
			pc.clitLength = 2;
			if(!pc.hasVagina()) pc.createVagina();
			pc.vaginas[0].wetnessRaw = 3;
			break;
		/*Decievedtadpole I suppose I'll go with my preferred character from CoC. Full human around 6ft 5, full masculinity, flat chest, 16 inch package with quad testes. Definitely more smart than strong, so a high intelligence. This is more just for convenience and not wasting my time having to get my character the way I like him.*/
		case "decievedtadpole":
			if(!TF) break;
			pc.tallness = 77;
			pc.femininity = 0;
			pc.breastRows[0].breastRatingRaw = 0;
			if(!pc.hasCock()) pc.createCock();
			pc.cocks[0].cLengthRaw = 16;
			pc.balls = 4;
			pc.ballSizeRaw = 8;
			pc.intelligenceRaw = 5;
			break;
		/*Name: Junker
		Physical Description:
		Dog everything (head, brown fur, tail, ears, etc.), except:
		medium-long blonde hair
		bipedal hooved legs
		2x 2"x12" horsedicks
		4x 2" balls
		Perkswise, idc, whatever makes sense for a starting character. Nothing OP needed.*/
		case "junker":
			if(!TF) break;
			if(!pc.hasCock()) pc.createCock();
			pc.createCock();
			pc.shiftCock(0,GLOBAL.TYPE_EQUINE);
			pc.shiftCock(1,GLOBAL.TYPE_EQUINE);
			pc.cocks[0].cLengthRaw = 12;
			pc.cocks[1].cLengthRaw = 12;
			pc.balls = 4;
			pc.ballSizeRaw = 7;
			pc.armType = GLOBAL.TYPE_CANINE;
			pc.clearArmFlags();
			pc.addArmFlag(GLOBAL.FLAG_FURRED);
			pc.legType = GLOBAL.TYPE_EQUINE;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_FURRED);
			pc.addLegFlag(GLOBAL.FLAG_HOOVES);
			pc.tailCount = 1;
			pc.tailType = GLOBAL.TYPE_CANINE;
			pc.clearTailFlags();
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_FURRED);
			pc.earType = GLOBAL.TYPE_CANINE;
			pc.faceType = GLOBAL.TYPE_CANINE;
			pc.hairLength = 6;
			pc.hairColor = "blonde";
			pc.skinType = GLOBAL.SKIN_TYPE_FUR;
			break;
		/*Calvin Snowden You are a 7 foot 0 inch tall human, with a somewhat lithe body and a fair amount of definition. You are currently wearing comfortable clothes and using your fists as a weapon. Your face is human in shape and structure, with albino skin. A set of razor-sharp, retractable shark-teeth fill your mouth and gives your visage a slightly angular appearance. It has a well-defined jawline and a fairly masculine profile. Your shaggy, midnight black hair looks good on you, accentuating your features well. A slowly undulating tongue occasionally slips from between your lips. It hangs nearly two feet long when you let the whole thing slide out, though you can retract it to appear normal. A quartet of prominent horns has broken through your skin. The back pair are longer, and curve back along your head. The front pair protrude forward demonically.

		You have a humanoid shape with the usual torso, arms, hands, and fingers. You have slightly-flared hips that match your trim, lithe body, and your muscular, toned rump molds closely against your form. Your lithe legs are capped with flexible clawed feet. Sharp black nails grow where once you had toe-nails, giving you fantastic grip.

		You have two flat breasts, each supporting one 0.2-inch chained nipple.

		Your cloth-shrouded, cursed cock is 9 inches long and two inches wide. The crown is ringed with a circle of rubbery protrusions that grow larger as you get more aroused. The entire thing is shiny and covered with tiny, sensitive nodules that leave no doubt about its demonic origins. Every now and again a slimy worm coated in spunk slips partway out of your nubby shaft, tasting the air like a snake's tongue.
		A scrotum with two baseball-sized balls swings heavily beneath your demonic cock. You estimate each of them to be about two inches across.

		You have one virgin asshole, placed between your tight, toned butt-cheeks where it belongs.

		A solitary gold eyebrow-ring adorns your eyebrow, looking very stylish.
		Your ears are pierced with onyx ear-stud.
		Shining on your lip, a gold lip-stud is plainly visible.
		Though not visible, you can plainly feel your ruby tongue-stud secured in your tongue.
		Your nipples are pierced with fertite nipple-chain.
		Looking positively perverse, a fertite jacob's ladder adorns your pierced, infernal prick.*/
		case "calvin":
			if(!TF) break;
			pc.tallness = 84;
			pc.thickness = 25;
			pc.tone = 70;
			pc.skinTone = "albino";
			pc.faceType = GLOBAL.TYPE_SHARK;
			pc.femininity = 30;
			pc.hairLength = 3;
			pc.hairColor = "midnight black";
			pc.tongueType = GLOBAL.TYPE_SNAKE;
			pc.clearTongueFlags();
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			pc.removeHorns();
			pc.horns = 4;
			pc.hornType = GLOBAL.TYPE_DEMONIC;
			pc.hornLength = 4;
			pc.hipRatingRaw = 3;
			pc.buttRatingRaw = 3;
			pc.legType = GLOBAL.TYPE_DEMONIC;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.breastRows[0].breastRatingRaw = 0;
			if(!pc.hasCock()) pc.createCock();
			pc.shiftCock(0, GLOBAL.TYPE_DEMONIC);
			pc.cocks[0].cLengthRaw = 9;
			pc.ballSizeRaw = 6;
			break;
		//Zjeranos/Deagroth's self made special character.
		case "saerina":
			if(!TF) break;
			pc.armor = new MilitaryUniform();
			pc.meleeWeapon = new CavalrySaber();
			pc.hairColor = "red";
			pc.hairLength = 30;
			pc.tallness = 73;
			pc.tone = 80;
			pc.thickness = 25;
			pc.femininity = 100;
			pc.buttRatingRaw = 3;
			pc.hipRatingRaw = 3;	
			pc.createBreastRow();
			pc.breastRows[0].breastRatingRaw = 4;
			if(!pc.hasCock()) pc.createCock();
			if(pc.cockTotal() < 2) pc.createCock();
			pc.shiftCock(0, GLOBAL.TYPE_DEMONIC);
			pc.cocks[0].cLengthRaw = 13.5;
			pc.cocks[0].cThicknessRatioRaw = 1.3;
			pc.cocks[0].knotMultiplier = 1.5;
			pc.cocks[0].cockColor = "crimson";
			pc.cocks[0].addFlag(GLOBAL.FLAG_PREHENSILE);
			pc.cocks[0].addFlag(GLOBAL.FLAG_LUBRICATED);
			pc.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			pc.cocks[0].addFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
			pc.shiftCock(1, GLOBAL.TYPE_DEMONIC);
			pc.cocks[1].cLengthRaw = 13.5;
			pc.cocks[1].cThicknessRatioRaw = 1.3;
			pc.cocks[1].cockColor = "crimson";
			pc.cocks[1].knotMultiplier = 1.5;
			pc.cocks[1].addFlag(GLOBAL.FLAG_PREHENSILE);
			pc.cocks[1].addFlag(GLOBAL.FLAG_LUBRICATED);
			pc.cocks[1].addFlag(GLOBAL.FLAG_TAPERED);
			pc.cocks[1].addFlag(GLOBAL.FLAG_APHRODISIAC_LACED);		
			pc.balls = 0;
			pc.ballSizeRaw = 20;
			pc.cumMultiplierRaw = 150;
			pc.ballEfficiency = 400;
			pc.refractoryRate = 100;if(!pc.hasVagina()) pc.createVagina();
			pc.shiftVagina(0, GLOBAL.TYPE_SUULA);
			pc.vaginas[0].wetnessRaw = 2;
			pc.scaleColor = "black";
			pc.eyeColor = "glowing red";
			pc.eyeType = GLOBAL.TYPE_DEMONIC;
			pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
			pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
			pc.skinTone = "fair";
			pc.faceType = GLOBAL.TYPE_HUMAN;
			pc.addFaceFlag(GLOBAL.FLAG_SMOOTH);
			pc.earType = GLOBAL.TYPE_DEMONIC;
			pc.earLength = 6;
			pc.tongueType = GLOBAL.TYPE_DEMONIC;
			pc.clearTongueFlags();
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			pc.removeHorns();
			pc.horns = 2;
			pc.hornLength = 12;
			pc.hornType = GLOBAL.TYPE_GRYVAIN;
			pc.eyeColor = "red";
			pc.armType = GLOBAL.TYPE_HUMAN;
			pc.clearArmFlags();
			pc.addArmFlag(GLOBAL.FLAG_SMOOTH);
			pc.wingType = GLOBAL.TYPE_DRACONIC;
			pc.wingCount = 2;
			pc.tailType = GLOBAL.TYPE_DEMONIC;
			pc.clearTailFlags();
			pc.tailCount = 1;
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.addTailFlag(GLOBAL.FLAG_SMOOTH);
			pc.legCount = 2;
			pc.legType = GLOBAL.TYPE_DEMONIC;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_SMOOTH);
			pc.createStatusEffect("Genital Slit",0,0,0,0);
			pc.createStatusEffect("Vanae Markings");
			pc.skinAccent = "glowing red";
		//The 'true' at the end of the Perfect Simulant status effect is where I think the flag goes to have it hidden, if not then please set it where it needs to go or let me know.
			pc.createStatusEffect("Perfect Simulant",0,0,0,0,true,"Icon_Gears_Three","You were created by the scientists at Steele Tech to be the perfect heir, and as such, your maximum capabilities exceed even those of the luckiest terrans. You walk, talk, breathe, and eat, just like any living creature, even simulating DNA to allow you to emulate the effects of transformative items on true organics.",false,0);
			bonusTexts = "None of the doctors or scientists could ever figure out what went ‘wrong’ with you, it was as if some supernatural force meddled with you. Nor could they ever explain the your ‘past life’ memories, but you’re certain you’ve always been this way.";
			break;
		case "":
			if(!TF) break;
			
			break;
		case "":
			if(!TF) break;
			
			break;
		case "":
			if(!TF) break;
			
			break;
		case "":
			if(!TF) break;
			
			break;
		default:
			if(!TF) return false;
			break;
	}
	if(TF)
	{
		clearOutput();
		showName("\n????");
		output("Reality seems to warp, but then, things are as they always have been, aren’t they? You look over your [pc.chest], [pc.crotch]. Yup, everything is fine.");
		if(bonusTexts != "") output(" " + bonusTexts);
		resetBabyValues();
		clearMenu();
		addButton(0,"Next",fatedPCOptionsFinisher);
	}
	//If "default" is hit, return false. Seemed the laziest way to do it.
	return true;
}