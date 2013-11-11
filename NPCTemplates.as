function initializeNPCs():void {
	characters[CELISE] = new creature();
	celise = characters[CELISE];
	celise.short = "Celise";
	celise.originalRace = "galotian";
	celise.a = "";
	celise.capitalA = "";
	celise.long = "A three foot high, oblong ball of goo jiggles and wobbles across from you, its surface somehow holding back the liquid weight inside even though it appears no more solid than the rest of it. Atop the mound of viridian goop is the torso of a ultrapornstar goddess. Pendulous breasts hang from the front of her glittering chest, obscuring everything above her navel with gooey boob. Her eyes glitter with a predatory mirth, slightly darker in hue than the rest of her, a color matched by her plump, wet-looking lips. You need to defeat her if you ever want to lay claim to Dad’s fortune and make him proud!";
	celise.customDodge = "The goo twists a portion of its body out of the way of the attack, moving in a way that would be fatal for any vertebrate.";
	celise.customBlock = "Your attack sinks into the goo, the wound vanishing almost instantly as her surface recloses.";
	celise.plural = false;
	celise.lustVuln = 1;
	celise.meleeWeapon.attackVerb = "slap";
	celise.meleeWeapon.longName = "gooey psuedopod";
	celise.armor.longName = "gooey coverings";
	celise.armor.defense = 50;
	celise.physiqueRaw = 3;
	celise.reflexesRaw = 1;
	celise.aimRaw = 1;
	celise.intelligenceRaw = 1;
	celise.willpowerRaw = 1;
	celise.libidoRaw = 100;
	celise.HPMod = 100;
	celise.shieldsRaw = 0;
	celise.HPRaw = celise.HPMax();
	celise.energyRaw = 100;
	celise.lustRaw = 85;
	celise.resistances = new Array(0,0,0,0,0,0,0,0);
	celise.XP = 50;
	celise.level = 1;
	celise.credits = 0;
	
	celise.femininity = 90;
	celise.eyeType = 0;
	celise.eyeColor = "green";
	celise.tallness = 49;
	celise.thickness = 60;
	celise.tone = 50;
	celise.hairColor = "green";
    celise.scaleColor = "green";
	celise.furColor = "green";
	celise.hairLength = 12;
	celise.hairType = 0;
	celise.beardLength = 0;
	celise.beardStyle = 0;
	celise.skinType = GOO;
	celise.skinTone = "green";
	celise.skinFlags = new Array(SQUISHY,LUBRICATED,AMORPHOUS);
	celise.faceType = 0;
	celise.faceFlags = new Array();
	celise.tongueType = 0;
	celise.lipMod = 1;
	celise.earType = 0;
	celise.antennae = 0;
	celise.antennaeType = 0;
	celise.horns = 0;
	celise.hornType = 0;
	celise.armType = 0;
	celise.gills = false;
	celise.wingType = 0;
	celise.legType = GOOEY;
	celise.legCount = 1;
	celise.legFlags = new Array(AMORPHOUS);
	//0 - Waist
	//1 - Middle of a long tail. Defaults to waist on bipeds.
	//2 - Between last legs or at end of long tail.
	//3 - On underside of a tail, used for driders and the like, maybe?
	celise.genitalSpot = 0;
	celise.tailType = 0;
	celise.tailCount = 0;
	celise.tailFlags = new Array();
	//Used to set cunt or dick type for cunt/dick tails!
	celise.tailGenitalArg = 0;
	//tailGenital:
	//0 - none.
	//1 - cock
	//2 - vagina
	celise.tailGenital = 0;
	//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
	celise.tailVenom = 0;
	//Tail recharge determines how fast venom/webs comes back per hour.
	celise.tailRecharge = 5;
	//hipRating
	//0 - boyish
	//2 - slender
	//4 - average
	//6 - noticable/ample
	//10 - curvy//flaring
	//15 - child-bearing/fertile
	//20 - inhumanly wide
	celise.hipRating = 15;
	//buttRating
	//0 - buttless
	//2 - tight
	//4 - average
	//6 - noticable
	//8 - large
	//10 - jiggly
	//13 - expansive
	//16 - huge
	//20 - inconceivably large/big/huge etc
	celise.buttRating = 10;
	//No dicks here!
	celise.cocks = new Array();
	//balls
	celise.balls = 0;
	celise.cumMultiplier = 50;
	//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
	celise.cumQuality = 1;
	celise.cumType = CUM;
	celise.ballSize = 24;
	celise.ballFullness = 100;
	//How many "normal" orgams worth of jizz your balls can hold.
	celise.ballEfficiency = 400;
	//Scales from 0 (never produce more) to infinity.
	celise.refractoryRate = 9999;
	celise.minutesSinceCum = 9000;
	celise.timesCum = 5674;
	celise.cockVirgin = false;
	celise.vaginalVirgin = false;
	celise.analVirgin = false;
	celise.vaginas = new Array();
	celise.createVagina();
	celise.vaginas[0].hymen = false;
	celise.vaginas[0].clits = 1;
	celise.vaginas[0].wetness = 5;
	celise.vaginas[0].looseness = 1;
	celise.vaginas[0].bonusCapacity = 10;
	//Goo is hyper friendly!
	celise.elasticity = 100;
	//Fertility is a % out of 100. 
	celise.fertility = 1;
	celise.clitLength = .5;
	celise.pregnancyMultiplier = 1;
	
	celise.breastRows[0].breastRating = 14;
	celise.nippleColor = "deep emerald";
	celise.milkMultiplier = 0;
	celise.milkType = MILK;
	//The rate at which you produce milk. Scales from 0 to INFINITY.
	celise.milkRate = 1;
	celise.ass.wetness = 5;
	
	//Rival!
	characters[RIVAL] = new creature();
	rival = characters[RIVAL];
	rival.short = "Jack/Jill";
	rival.originalRace = "human";
	rival.a = "";
	rival.capitalA = "";
	rival.long = "";
	rival.customDodge = "";
	rival.customBlock = "";
	rival.plural = false;
	rival.lustVuln = 1;
	rival.meleeWeapon.attackVerb = "punch";
	rival.meleeWeapon.longName = "fist";
	rival.armor.longName = "A-type personal defense suit";
	rival.armor.defense = 50;
	rival.physiqueRaw = 3;
	rival.reflexesRaw = 3;
	rival.aimRaw = 3;
	rival.intelligenceRaw = 3;
	rival.willpowerRaw = 3;
	rival.libidoRaw = 30;
	rival.HPMod = 20;
	rival.shieldsRaw = 0;
	rival.HPRaw = rival.HPMax();
	rival.energyRaw = 100;
	rival.lustRaw = 25;
	rival.resistances = new Array(1,1,1,1,1,1,1,1);
	rival.XP = 50;
	rival.level = 1;
	rival.credits = 1000;
	
	rival.femininity = 50;
	rival.eyeType = 0;
	rival.eyeColor = pc.eyeColor;
	rival.tallness = 65;
	rival.thickness = 50;
	rival.tone = 50;
	rival.hairColor = pc.hairColor;
    rival.scaleColor = pc.scaleColor;
	rival.furColor = pc.furColor;
	rival.hairLength = 12;
	rival.hairType = 0;
	rival.beardLength = 0;
	rival.beardStyle = 0;
	rival.skinType = SKIN;
	rival.skinTone = pc.skinTone;
	rival.skinFlags = new Array();
	rival.faceType = 0;
	rival.faceFlags = new Array();
	rival.tongueType = 0;
	rival.lipMod = 0;
	rival.earType = 0;
	rival.antennae = 0;
	rival.antennaeType = 0;
	rival.horns = 0;
	rival.hornType = 0;
	rival.armType = 0;
	rival.gills = false;
	rival.wingType = 0;
	rival.legType = HUMAN;
	rival.legCount = 2;
	rival.legFlags = new Array(PLANTIGRADE);
	//0 - Waist
	//1 - Middle of a long tail. Defaults to waist on bipeds.
	//2 - Between last legs or at end of long tail.
	//3 - On underside of a tail, used for driders and the like, maybe?
	rival.genitalSpot = 0;
	rival.tailType = 0;
	rival.tailCount = 0;
	rival.tailFlags = new Array();
	//Used to set cunt or dick type for cunt/dick tails!
	rival.tailGenitalArg = 0;
	//tailGenital:
	//0 - none.
	//1 - cock
	//2 - vagina
	rival.tailGenital = 0;
	//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
	rival.tailVenom = 0;
	//Tail recharge determines how fast venom/webs comes back per hour.
	rival.tailRecharge = 5;
	//hipRating
	//0 - boyish
	//2 - slender
	//4 - average
	//6 - noticable/ample
	//10 - curvy//flaring
	//15 - child-bearing/fertile
	//20 - inhumanly wide
	rival.hipRating = 4;
	//buttRating
	//0 - buttless
	//2 - tight
	//4 - average
	//6 - noticable
	//8 - large
	//10 - jiggly
	//13 - expansive
	//16 - huge
	//20 - inconceivably large/big/huge etc
	rival.buttRating = 4;
	//No dicks here!
	rival.cocks = new Array();
	//balls
	rival.balls = 0;
	rival.cumMultiplier = pc.cumMultiplier;
	//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
	rival.cumQuality = 1;
	rival.cumType = CUM;
	rival.ballSize = pc.ballSize;
	rival.ballFullness = pc.ballFullness;
	//How many "normal" orgams worth of jizz your balls can hold.
	rival.ballEfficiency = pc.ballFullness;
	//Scales from 0 (never produce more) to infinity.
	rival.refractoryRate = pc.refractoryRate;
	rival.minutesSinceCum = pc.minutesSinceCum;
	rival.timesCum = 55;
	
	//Goo is hyper friendly!
	rival.elasticity = 1;
	//Fertility is a % out of 100. 
	rival.fertility = 5;
	rival.clitLength = .5;
	rival.pregnancyMultiplier = 1;
	
	rival.breastRows[0].breastRating = 0;
	rival.nippleColor = pc.nippleColor;
	rival.milkMultiplier = 0;
	rival.milkType = MILK;
	//The rate at which you produce milk. Scales from 0 to INFINITY.
	rival.milkRate = 0;
	rival.ass.wetness = 0;
	
	
	characters[GEOFF] = new creature();
	geoff = characters[GEOFF];
	geoff.short = "Geoff";
	geoff.originalRace = "human";
	geoff.a = "";
	geoff.capitalA = "";
	geoff.long = "";
	geoff.customDodge = "";
	geoff.customBlock = "";
	geoff.plural = false;
	geoff.lustVuln = 1;
	geoff.meleeWeapon.attackVerb = "punch";
	geoff.meleeWeapon.longName = "fist";
	geoff.armor.longName = "comfortable clothes";
	geoff.armor.defense = 50;
	geoff.physiqueRaw = 3;
	geoff.reflexesRaw = 3;
	geoff.aimRaw = 3;
	geoff.intelligenceRaw = 3;
	geoff.willpowerRaw = 3;
	geoff.libidoRaw = 30;
	geoff.HPMod = 20;
	geoff.shieldsRaw = 0;
	geoff.HPRaw = geoff.HPMax();
	geoff.energyRaw = 100;
	geoff.lustRaw = 25;
	geoff.resistances = new Array(1,1,1,1,1,1,1,1);
	geoff.XP = 50;
	geoff.level = 1;
	geoff.credits = 1000;
	
	geoff.inventory[0] = clone(items[0]);
	geoff.inventory[1] = clone(items[1]);
	geoff.inventory[2] = clone(items[2]);
	geoff.typesBought[geoff.typesBought.length] = ALL;
	geoff.sellMarkup = 1.3;
	geoff.buyMarkdown = .25;
	geoff.keeperSell = "<i>“You have items ready to be spiritually appraised and elevated, then?”</i>  Artie rubs his hands in anticipation as you approach his crate. <i>“Let’s see what you have and what they are, ahem, worth.”</i>\n";
	geoff.keeperBuy = "Geoff smiles at you as you carefully make your way over to him.\n\n<i>“Hey, [pc.name].  Looking to buy something?”</i>";
	geoff.keeperGreeting = "Artie nods at you as you enter the scrap yard hut, smiling peacefully as he closes his eyes and goes back to meditating over a large diode. Geoff is busy working on something in the back.";
	
	geoff.femininity = 20;
	geoff.eyeType = 0;
	geoff.eyeColor = "brown";
	geoff.tallness = 78;
	geoff.thickness = 20;
	geoff.tone = 70;
	geoff.hairColor = "brown";
    geoff.scaleColor = pc.scaleColor;
	geoff.furColor = pc.furColor;
	geoff.hairLength = 12;
	geoff.hairType = 0;
	geoff.beardLength = 0;
	geoff.beardStyle = 0;
	geoff.skinType = SKIN;
	geoff.skinTone = pc.skinTone;
	geoff.skinFlags = new Array();
	geoff.faceType = 0;
	geoff.faceFlags = new Array();
	geoff.tongueType = 0;
	geoff.lipMod = 0;
	geoff.earType = 0;
	geoff.antennae = 0;
	geoff.antennaeType = 0;
	geoff.horns = 0;
	geoff.hornType = 0;
	geoff.armType = 0;
	geoff.gills = false;
	geoff.wingType = 0;
	geoff.legType = HUMAN;
	geoff.legCount = 2;
	geoff.legFlags = new Array(PLANTIGRADE);
	//0 - Waist
	//1 - Middle of a long tail. Defaults to waist on bipeds.
	//2 - Between last legs or at end of long tail.
	//3 - On underside of a tail, used for driders and the like, maybe?
	geoff.genitalSpot = 0;
	geoff.tailType = 0;
	geoff.tailCount = 0;
	geoff.tailFlags = new Array();
	//Used to set cunt or dick type for cunt/dick tails!
	geoff.tailGenitalArg = 0;
	//tailGenital:
	//0 - none.
	//1 - cock
	//2 - vagina
	geoff.tailGenital = 0;
	//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
	geoff.tailVenom = 0;
	//Tail recharge determines how fast venom/webs comes back per hour.
	geoff.tailRecharge = 5;
	//hipRating
	//0 - boyish
	//2 - slender
	//4 - average
	//6 - noticable/ample
	//10 - curvy//flaring
	//15 - child-bearing/fertile
	//20 - inhumanly wide
	geoff.hipRating = 4;
	//buttRating
	//0 - buttless
	//2 - tight
	//4 - average
	//6 - noticable
	//8 - large
	//10 - jiggly
	//13 - expansive
	//16 - huge
	//20 - inconceivably large/big/huge etc
	geoff.buttRating = 4;
	//No dicks here!
	geoff.cocks = new Array();
	geoff.createCock();
	geoff.cocks[0].cLength = 6;
	geoff.cocks[0].cThickness = 1.75;
	//balls
	geoff.balls = 2;
	geoff.cumMultiplier = 3;
	//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
	geoff.cumQuality = 1;
	geoff.cumType = CUM;
	geoff.ballSize = pc.ballSize;
	geoff.ballFullness = 10;
	//How many "normal" orgams worth of jizz your balls can hold.
	geoff.ballEfficiency = 10;
	//Scales from 0 (never produce more) to infinity.
	geoff.refractoryRate = 1;
	geoff.minutesSinceCum = 3650;
	geoff.timesCum = 55;
	
	//Goo is hyper friendly!
	geoff.elasticity = 1;
	//Fertility is a % out of 100. 
	geoff.fertility = 5;
	geoff.clitLength = .5;
	geoff.pregnancyMultiplier = 1;
	
	geoff.breastRows[0].breastRating = 0;
	geoff.nippleColor = "brown";
	geoff.milkMultiplier = 0;
	geoff.milkType = MILK;
	//The rate at which you produce milk. Scales from 0 to INFINITY.
	geoff.milkRate = 0;
	geoff.ass.wetness = 0;	
}