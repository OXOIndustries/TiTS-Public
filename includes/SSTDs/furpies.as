/*Furpies Simplex H/C/D
That’s Horse, Cat, and Dog, for those wondering.
Author: Fenpai Finally Noticed Meoxo

Notes:
Created by Dr. Badger to be spread extensively. 95% of all infections are asymptomatic, effectively creating “seeders” who don’t know what they’re doing to their partners.
Dormant infections activate after a period of five to ten years with the planned goal of creating the “furpocalypse.”
Virtually eliminated in the core, absolutely rampant on new rush worlds.
Symptoms:
Anyone with body fur is immune.
[Day 2] Temporary genital swelling (+lust, + small libido)
[Day 3] Codex Identifies
[Day 4] Fursluttiness kicks in (extra lust damage from fur-having foes)
[Day 6] Sprout ears (+2 lib)
[Day 7] One genital changes (+5 lib)
[Day 8] Legs & arms change
[Day 9] Tail!
[Day 10] Furry (+5 lib)
[Day 12] THE SNOUTENING (+3 lib)
IT’S OVER*/

//Max time: 17280
//Count each day proc as it triggers in v4.
//v2 = 1 for FURSLOOTINESS

public function furpiesProcsGoooo(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
{
	var textBuff:String = "";
	var x:int = 0;
	var y:int = 0;
	
	var targetType:Number = 0;
	if(effect.storageName == "Furpies Simplex H") targetType = GLOBAL.TYPE_EQUINE;
	else if(effect.storageName == "Furpies Simplex C") targetType = GLOBAL.TYPE_FELINE;
	else if(effect.storageName == "Furpies Simplex D") targetType = GLOBAL.TYPE_CANINE;

	//Day 2 - Temporary Genital Swelling
	if(effect.value4 < 2 && effect.minutesLeft < (17280 - 2*24*60))
	{
		effect.value4 = 2;
		if(pc.hasFur())
		{
			textBuff += "A rapid, hacking cough afflicts you out of nowhere, leaving you hacking and retching until you expel a ball of viscous looking green slime. Looks like you caught some kind of infection that your body rejected...";
			pc.removeStatusEffect("Undetected Furpies", true);
		}
		//Only boy parts
		else if(pc.hasCock() && !pc.hasVagina())
		{
			textBuff += ParseText("You have to keep reaching down and adjusting yourself. Your [pc.cocks] feel");
			if(pc.cockTotal() == 1) textBuff += "s";
			textBuff += " bigger than normal, ";
			if(pc.isCrotchExposed()) 
			{
				textBuff += "like ";
				if(pc.cockTotal() == 1) textBuff += "it’s";
				else textBuff += "they’re";
				textBuff += " halfway hard even when you’re not turned on.";
			}
			else textBuff += "like you’ve been letting a dominatrix tease you for hours";
			textBuff += ". The fattened sausage";
			if(pc.cockTotal() > 1) textBuff += "s";
			textBuff += " definitely feel";
			if(pc.cockTotal() == 1) textBuff += "s";
			textBuff += " more sensitive. A gentle breeze would make your heart flutter and your dick";
			if(pc.cockTotal() > 1) textBuff += "s";
			textBuff += " surge. Maybe you were exposed to something out on the frontier?";
			pc.lust(5);
		}
		//Only lady parts
		else if(pc.hasVagina() && !pc.hasCock())
		{
			textBuff += "You feel strangely engorged... down there";
			if(pc.legCount > 1) textBuff += ParseText(", between your [pc.legs]");
			textBuff += ". Your folds are absolutely suffused with blood, puffed up into miniature pussy pillows. It’s distracting. Every step, every movement has you aware of the inexplicable state of your vaginas";
			if(pc.totalVaginas() > 1) textBuff += "s";
			textBuff += ParseText(". A gentle breeze across your [pc.clits] would make you dripping wet and ready to go. Maybe you were exposed to something out on the frontier?");
			pc.lust(5);
		}
		//Herms master race
		else if(pc.isHerm())
		{
			textBuff += ParseText("You cannot get comfortable. There’s a bizarre heat between your [pc.thighs] that rears its ugly head every time you start to forget about it. Worse, your body seems primed to respond to it. Your [pc.cocks] ");
			if(pc.cockTotal() == 1) textBuff += "is";
			else textBuff += "are";
			textBuff += " exceptionally tumescent today, so engorged that ";
			if(!pc.isCrotchExposed()) textBuff += ParseText("your [pc.crotchCovers] don’t seem to fit quite right");
			else
			{
				if(pc.cockTotal() == 1) textBuff += "it";
				else textBuff += "they";
				textBuff += " look like ";
				if(pc.cockTotal() == 1) textBuff += "it";
				else textBuff += "they";
				textBuff += " were stung by a bee";
				if(CodexManager.entryUnlocked("Zil")) textBuff += "... or a zil";
			}
			textBuff += ParseText(". And your [pc.vaginas] ");
			if(pc.totalVaginas() == 1) textBuff += "is";
			else textBuff += "are";
			textBuff += " just as bad! Your swollen netherlips grind against one another with every step, squishing and teasing your brain with shocks of pleasure, to say nothing of your rigid clit";
			if(pc.totalClits() == 1) textBuff += "ty";
			else textBuff += "ties";
			textBuff += ". The whole mess ";
			if(pc.legCount > 1) textBuff += ParseText("between your [pc.legs]");
			else textBuff += "below your waist";
			textBuff += " looks primed to fuck at a moment’s notice. Maybe something you were exposed to on the frontier is affecting you?";
			pc.lust(8);
		}
		//Neuters stoopid face
		else
		{
			textBuff += "A rapid, hacking cough afflicts you out of nowhere, leaving you hacking and retching until you expel a ball of viscous looking green slime. Looks like you caught some kind of infection that your body rejected...";
			pc.removeStatusEffect("Undetected Furpies", true);
		}
	}
	//[Day 3] Codex Identifies
	else if(effect.value4 < 3 && effect.minutesLeft < (17280 - 3*24*60))
	{
		effect.value4 = 3;
		textBuff += "<i>BEEP!</i> An irritating tone from your Codex interrupts your thoughts. <i>“Alert! Infection detected! Preliminary scans identify a variant of Furpies Simplex ";
		
		CodexManager.unlockEntry("Furpies");
		
		if(rand(3) == 0) 
		{
			textBuff += "H";
			effect.storageName = "Furpies Simplex H";
			effect.iconName = "Icon_Horse";
			effect.tooltip = "You’ve been infected with Furpies Simplex H! If left untreated, it will slowly transform you into a furry horse-person (probably). Consult your Codex for more information.";
		}
		else if(rand(2) == 0) 
		{
			textBuff += "C";
			effect.storageName = "Furpies Simplex C";
			effect.iconName = "Icon_Dog_Paw";
			effect.tooltip = "You’ve been infected with Furpies Simplex C! If left untreated, it will slowly transform you into a furry cat-person (probably). Consult your Codex for more information.";
		}
		else 
		{
			textBuff += "D";
			effect.storageName = "Furpies Simplex D";
			effect.iconName = "Icon_Dog_Paw";
			effect.tooltip = "You’ve been infected with Furpies Simplex D! If left untreated, it will slowly transform you into a furry dog-person (probably). Consult your Codex for more information.";
		}
		textBuff += " in your bloodstream, an artificial pathogen developed by Doctor Badger. Your enhanced immune system should prevent contagious infection, but removal will require the assistance of a medical installation.”</i>";
		textBuff += "\n\nShit.";
		textBuff += "\n\n<i>“Symptoms include: arousal, persistent arousal, growth of body hair, reduced inhibitions, transformation of genitalia, and acquisition of animal features. Furpies usually runs its course in a little under two weeks. <b>Prompt treatment is recommended to avoid unwanted transformations.</b>”</i>";
		textBuff += "\n\nBetter find a doctor if you don’t want to grow some fur.";

		//Change from hidden status to perm status.
		effect.value1 = 0;
		effect.value2 = 0;
		effect.value3 = 0;
		effect.value4 = 3;
		effect.hidden = false;
		effect.combatOnly = false;
		effect.minutesLeft = (17280 - 3*24*60);
		effect.iconShade = 0xFF69B4;
	}
	//[Day 4] Fursluttiness kicks in (extra lust damage from fur-having foes)
	else if(effect.value4 < 4 && effect.minutesLeft < (17280 - 4*24*60))
	{
		effect.value4 = 4;
		
		//Has limb fur
		if(pc.hasPartFur("arm") || pc.hasPartFur("leg"))
		{
			textBuff += "The fur on your ";
			if(pc.hasPartFur("arm")) textBuff += "arms";
			else textBuff += "legs";
			textBuff += " is so wonderfully soft. You keep catching yourself petting it, not because it feels good to be petted (it does), but because it feels better to run your fingers through the silky fibers. There’s something intriguing and exciting about bunching up the soft fluff between your knuckles. You can only imagine how good it’d feel to fuck somebody with a full coat of it. <b>Fur suddenly seems a lot more arousing. You’ll have to be more careful when fighting furries!</b>";
		}
		//No limb fur
		else
		{
			var furPets:Array = [];
			//Fuck Penny/Kiro/Nayna/Kelly/Emmy
			if(flags["SEXED_PENNY"] != undefined) furPets.push("Penny");
			if(kiroSexed()) furPets.push("Kiro");
			if(flags["NAYNA_BLOWN"] != undefined) furPets.push("Nayna");
			if(flags["KELLY_SEXED"] != undefined) furPets.push("Kelly");
			if(flags["EMMY_FUCKED"] != undefined) furPets.push("Emmy");
			if(furPets.length > 0)
			{
				textBuff += "Thoughts of your last encounter with " + furPets[rand(furPets.length)] + " keep surfacing, not their sexual appeal or personality... their fur. You remember the texture between your fingers, the way it would bunch up when you gave it a squeeze. You fantasize about its silken caress against your cheek and find yourself briefly wondering how it would feel to rub against them with your own fur. Just two naked, furry sluts petting each other for hours... Whoa! <b>Fur suddenly seems a lot more arousing. You’d better be careful around fur-clad foes.</b>";
			}
			//No furry waifu
			else
			{
				textBuff += "Knowing that <b>you have Furpies</b> leaves you wondering: what would it feel like to have fur all over your body? Would it feel good, to be covered from head to toe in a silky coat? Would your sexual partners like it? Would they pet you and let you pet them? Would their fur be so thick that you could lose your fingers in it, moaning as you... whoah... Wait a second. <b>Fur suddenly seems very sexual. You’d better be careful when fighting furry foes!</b>";
			}
		}
		pc.lust(4);
		pc.libido(1);
		effect.value2 = 1;
	}
	//[Day 6] Sprout ears (+2 lib)
	else if(effect.value4 < 6 && effect.minutesLeft < (17280 - 6*24*60))
	{
		effect.value4 = 6;
		if(pc.earType != targetType && pc.earTypeUnlocked(targetType))
		{
			pc.libido(2);
			//Furpies H
			if(targetType == GLOBAL.TYPE_EQUINE)
			{
				if (pc.earType == GLOBAL.TYPE_HUMAN) textBuff += "Your ears tug painfully on your face as they begin shifting, moving upwards to the top of your head and transforming into a upright animalistic ears.";
				else if (pc.earType == GLOBAL.TYPE_CANINE) textBuff += "Your ears change shape, morphing into from their doglike shape into taller, equine ears! The bigger size ought to afford you better hearing, even if you bang them into things from time to time.";
				else textBuff += ParseText("Your [pc.ears] shudder and shift. For a moment, you go deaf. Sound returns after a few seconds as they continue changing shape, perching themselves atop your head and then stretching higher into teardrop-shaped, equine ears!");
				textBuff += "<b> You now have horse ears.</b>";
				pc.earType = GLOBAL.TYPE_EQUINE;
				pc.clearEarFlags();
				pc.addEarFlag(GLOBAL.FLAG_FURRED);
				pc.addEarFlag(GLOBAL.FLAG_TAPERED);
			}
			//Furpies C
			else if(targetType == GLOBAL.TYPE_FELINE)
			{
				textBuff += ParseText("All sound vanishes in an instant. You clap your hands to your [pc.ears], wondering if you’ve gone deaf, but they come up against nothing! Your ears have vanished! Just as you start considering learning a form of sign language or finding a back alley geneticist, the sounds you were hearing before come back with an oddly directional twist. You feel around the sides and top of your head to quickly find your new ears. They’re triangular and perched atop your head, swiveling this way and that to help you easily identify the source of any noise. <b>You’ve grown cat-like ears!</b>");
				pc.earType = GLOBAL.TYPE_FELINE;
				pc.clearEarFlags();
				pc.addEarFlag(GLOBAL.FLAG_FURRED);
				pc.addEarFlag(GLOBAL.FLAG_TAPERED);
			}
			//Furpies D
			else if(targetType == GLOBAL.TYPE_CANINE)
			{
				textBuff += ParseText("Your [pc.ears] begin to itch uncontrollably. You desperately try to scratch at them, but the itch spreads and grows... as do your ears! Your ears twist and morph, growing a thin layer of " + pc.furColor + " fur as they reshape into a pair of perky points, towering over your head. You experimentally move them, feeling them perk and flop at your command. And you can hear so much better than before, every slight creak and rustle around you is so clear now! <b>You now have canine-style ears, like some kind of dog or wolf!</b>");
				pc.earType = GLOBAL.TYPE_CANINE;
				pc.clearEarFlags();
				pc.addEarFlag(GLOBAL.FLAG_FURRED);
				pc.addEarFlag(GLOBAL.FLAG_TAPERED);
			}
		}
	}
	//[Day 7] One genital changes (+5 lib)
	else if(effect.value4 < 7 && effect.minutesLeft < (17280 - 7*24*60))
	{
		effect.value4 = 7;
		var doDix:Boolean = (pc.totalCocks() > pc.totalCocks(targetType));
		var doPussy:Boolean = (pc.totalVaginas() > pc.totalVaginas(targetType));
		//No cat pussy, I’m afraid.
		if(targetType == GLOBAL.TYPE_FELINE) doPussy = false;

		if(doDix && doPussy)
		{
			if(rand(2) == 0) doPussy = false;
			else doDix = false;
		}
		if(doDix)
		{
			if(pc.cockTypeUnlocked(0, targetType))
			{
				//1 ween to horse
				if(targetType == GLOBAL.TYPE_EQUINE)
				{
					var horsedix:Array = [];
					for(y = 0; y < pc.cockTotal(); y++)
					{
						if(pc.cocks[y].cType != GLOBAL.TYPE_EQUINE) horsedix.push(y);
					}
					x = horsedix[rand(horsedix.length)];
					textBuff += "Out of nowhere you get the biggest, bulgiest boner.";
					if(!pc.isCrotchExposed()) textBuff += ParseText(" It threatens to rip right through your [pc.crotchCover]. You let it out before it does any damage.");
					textBuff += " It’s so swollen, the flesh ballooning beyond what you thought was your maximum size, and it’s still getting bigger, straining against its normal shape.";
					if(!pc.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT)) textBuff += " The tip shudders then inflates outward, every trembling shift of phallic flesh bringing with it a pulse of hellish pleasure, flattening as you gain a tremendously thick, blunt head.";
					if(!pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) textBuff += " Next a wave of ecstatic delight congeals around the rim of your chubby crown, causing more blood to flow to whole new places. Your prickhead is getting thicker and thicker, until it flares wider than the shaft below.";
					//KnotBGone:
					if(pc.hasKnot(x)) textBuff += ParseText(" It’s so hot and tight that you almost miss the sight of your [pc.knot " + x + "] vanishing into the veiny girth of an increasingly equine-appearing member.");
					if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) textBuff += " Your foreskin is peeled back by the excessive tumescence, sliding down the shaft until it gathers around the very base. Over time, it darkens to a dusky black that clings tight to your shaft, revealing that <b>you’ve grown a brand new sheath from your foreskin.</b>";
					else textBuff += " The skin around the base pulls tight, gathering together around your shifting cock until the folds have piled up into a lewd-looking bunch of skin. The texture and color shifts to a glossy, supple black, revealing that <b>you’ve grown a brand new sheath.</b>";
					textBuff += ParseText("\n\nYou thrust your [pc.hips] in the empty air as the transformation continues, new urges radiating up your spine and into your brain, filling your mind with images of bent-over furries, their tails twitching as their lush slits drool in excitement. High pitched voices squeak in delirious desire as you stroke yourself. Ribbons of pre-cum spill out with ease, slicking your strokes as you hump your hand, imagining yourself fucking a fur-covered slut so hard that you can see your flaring cock-tip through her silk-tufted belly.");
					textBuff += "\n\nWhen you climax, what feels like gallons upon gallons of musky horse-cream spurt from <b>your new horse-cock</b>. You aren’t sure why a disease would do this sort of thing to you. All you know is that <b>your dick got ";
					if(pc.cocks[x].cLength() < 14) textBuff += "so much ";
					textBuff += "bigger when it changed species.</b> The raw, bestial weight hangs heavy on your mind and your body, even as it retreats into its snug sheath. You have the feeling these new urges aren’t going to go away... that you’re going to be fantasizing about fur-covered buns for some time to come.";
					pc.libido(5);
					pc.shiftCock(x,GLOBAL.TYPE_EQUINE);
					if(pc.cocks[x].cLength() < 14) pc.cocks[x].cLength(3+rand(3));
					if(pc.hasPerk("Hung")) pc.cocks[x].cLength(2);
					if(pc.hasPerk("Mini")) pc.cocks[x].cLength(-2);
					pc.orgasm();
				}
				//1 ween to dog
				else if(targetType == GLOBAL.TYPE_CANINE)
				{
					var dogDix:Array = [];
					for(y = 0; y < pc.cockTotal(); y++)
					{
						if(pc.cocks[y].cType != GLOBAL.TYPE_CANINE) dogDix.push(y);
					}
					x = dogDix[rand(dogDix.length)];
					textBuff += ParseText("A sudden rush of arousal hits you as you feel your [pc.cock " + x + "] quickly ");
					if(!pc.isCrotchExposed()) textBuff += ParseText("pitching a tent in your [pc.lowerGarments]");
					else textBuff += ParseText("growing erect between your [pc.legs]");
					textBuff += ". A strange itch moves across your dick as its surface becomes hotter. The microsurgeons are really going wild down there!";
					//Cock not Tapered:
					if(!pc.hasCockFlag(GLOBAL.FLAG_TAPERED,x)) textBuff += ParseText(" The [pc.cockHead " + x + "] twists and turns into a new shape, eventually settling into a tapered tip.");
					if (!pc.hasKnot(x)) textBuff += " You can feel the heat rising more intensely near the base of your shaft, new veins and spongy flesh forming and twisting into a new knot, already swollen because of your arousal.";
					if(!pc.hasSheath(x)) 
					{
						textBuff += " The skin behind your knot begins to bunch up and curl";
						if(pc.hasFur() || pc.hasFeathers() || pc.hasScales()) textBuff += ParseText(", [pc.skinFurScales] growing on this new surface");
						textBuff += ", before finally twisting into a new sheath.";
					}
					textBuff += " The surface of your cock seems a bit more raw than it was before, with thin, dark veins visible all around it. Once the Furpies have done with their work, your arousal quickly dies off, and <b>your new canine dick quickly recedes into its new protective sheath.</b>";
					pc.libido(5);
					pc.shiftCock(x,GLOBAL.TYPE_CANINE);
				}
				//1 ween to cat
				else if(targetType == GLOBAL.TYPE_FELINE)
				{
					var catDix:Array = [];
					for(y = 0; y < pc.cockTotal(); y++)
					{
						if(pc.cocks[y].cType != GLOBAL.TYPE_FELINE) catDix.push(y);
					}
					x = catDix[rand(catDix.length)];
					textBuff += ParseText("Oh... oh! A potent orgasm overwhelms you from nowhere. Your [pc.legOrLegs] ");
					if(pc.legCount == 1) textBuff += "is";
					else textBuff += "are";
					textBuff += ParseText(" jello, dropping you to the ground. Spurts of [pc.cum] spray out of [pc.oneCock] that flexes strangely, pulling into itself then throbbing out. Its very shape seems to twist from one ejaculation to the next. Every jet of [pc.cumNoun] is met with a shift to its surface. The pleasure builds higher, and before your eyes you see a dozens of nubby “barbs” appear on the surface, sort of like a kaithrit’s or feline’s.");
					textBuff += "\n\nGrabbing hold, you stroke the now alien member, pumping the last few squirts from your body. The prick between your fingers seems completely foreign to you, feline in the extreme. <b>Furpies has given you a cat-penis!</b>";
					pc.libido(5);
					pc.shiftCock(x,GLOBAL.TYPE_FELINE);
					pc.orgasm();
				}
			}
		}
		//Do a pussy.
		else if(doPussy)
		{
			if(pc.vaginaTypeUnlocked(0, targetType))
			{
				//1 cunt to horse
				if(targetType == GLOBAL.TYPE_EQUINE)
				{
					var horsecunts:Array = [];
					for(y = 0; y < pc.totalVaginas(); y++)
					{
						if(pc.vaginas[y].type != GLOBAL.TYPE_EQUINE) horsecunts.push(y);
					}
					x = horsecunts[rand(horsecunts.length)];
					textBuff += "A twinge ";
					
					if(pc.legCount > 1) textBuff += ParseText("between your [pc.legs]");
					else textBuff += "below the waist";
					textBuff += ParseText(" swiftly yanks your attention to your [pc.vagina " + x + "]. Prickly tingles tickle their way across it, then inside, swiftly giving way to a insistent heat and unforgiving pressure. You feel like the exterior of your feminine genitalia is being massaged. Every inch of surface area experiences the same undulating kneading. At the same time, your increasingly engorged cunt is pushing back, taking up more and more space. With a whimper of aroused agony, ");
					if(!pc.isCrotchExposed()) textBuff += ParseText("you tear open your [pc.crotchCover]");
					else textBuff += "stare down";
					textBuff += ParseText(" and discover that your [pc.vaginaNoun " + x + "] has changed shape!");
					textBuff += "\n\nIn its place, <b>you’ve developed an equine vagina, complete with lips so large and plush that they look to have been recently pumped.</b>";
					pc.lust(10);
					pc.libido(5);
					pc.shiftVagina(x,GLOBAL.TYPE_EQUINE);
					pc.vaginas[x].addFlag(GLOBAL.FLAG_PUMPED);
				}
				//1 cunt to dog
				else if(targetType == GLOBAL.TYPE_CANINE)
				{
					var dogCunts:Array = [];
					for(y = 0; y < pc.totalVaginas(); y++)
					{
						if(pc.vaginas[y].type != GLOBAL.TYPE_CANINE) dogCunts.push(y);
					}
					x = dogCunts[rand(dogCunts.length)];
					textBuff += ParseText("An unexpected heat erupts in your [pc.vagina " + x + "] followed by a overwhelming wave of arousal. You move your hand ");
					//PC is garbed:
					if(!pc.isCrotchExposed()) textBuff += ParseText("into your [pc.lowerGarment]");
					else if(pc.legCount > 1) textBuff += ParseText("between your [pc.legs]");
					else textBuff += ParseText("between your [pc.thighs]");
					textBuff += " and find them completely drenched with the copious amount of fluids that drip from your vagina. Your lips are swelling obscenely around your fingers, puffing up deliciously as you grow more aroused. Then, all at once, your arousal dies off as the transformation ends just as abruptly as it started, leaving you needy, denied a well deserved orgasm, with wet and now much muskier fingers. <b>You now have a canine vagina that swells during arousal!</b>";
					pc.libido(5);
					pc.shiftVagina(x,GLOBAL.TYPE_CANINE);
				}
			}
		}
	}
	//[Day 8] Legs & arms change
	else if(effect.value4 < 8 && effect.minutesLeft < (17280 - 8*24*60))
	{
		effect.value4 = 8;
		var legged:Boolean = false;
		//Legs (requires non-furred legs):
		if(!pc.hasLegFlag(GLOBAL.FLAG_FURRED) && InCollection(targetType, [GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE]))
		{
			if(pc.legType != targetType && pc.legTypeUnlocked(targetType) && pc.legCountUnlocked(2))
			{
				legged = true;
				textBuff += "You feel feverish. The flush of heat is so dizzying that you collapse. Or maybe your " + pc.leg() + " ";
				if(pc.legCount == 1) textBuff += "isn’t";
				else textBuff += "aren’t";
				textBuff += " working right. You don’t feel much from the waist down, just a sort of rubbery numbness. Your muscles won’t answer your commands either. The strength is gone from ";
				if(pc.legCount == 1) textBuff += "it";
				else textBuff += "them";
				textBuff += ". You struggle up onto your elbows, swaying back and forth, just in time to see your lower limb";
				if(pc.legCount > 1) textBuff += "s";
				textBuff += " flowing like water into a new shape.";
			
				if(pc.legCount == 1) 
				{
					textBuff += ParseText("\n\nFirst, your [pc.leg] splits in half down the middle, shaping itself into two leg-shaped lengths.");
					pc.legCount = 2;
				}
				//Horse legs
				if(targetType == GLOBAL.TYPE_EQUINE)
				{
					textBuff += ParseText("\n\nInstead of feet or even paws, your develop shining black hooves. Your ankle is placed partway up your leg, the knee a little further above. You can hear bones cracking as the horse-like structure solidifies, and you’re silently thankful that you can’t feel a thing. Finally, a layer of horse-like hair erupts from your [pc.thighs] down, completing <b>your new equine legs.</b>");
					if(pc.isTaur()) textBuff += " The rest of your lower body matches them, leaving you looking like a centaur.";
					pc.legType = GLOBAL.TYPE_EQUINE;
					pc.clearLegFlags();
					pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
					pc.addLegFlag(GLOBAL.FLAG_HOOVES);
					pc.addLegFlag(GLOBAL.FLAG_FURRED);
				}
				//Doggo legs
				else if(targetType == GLOBAL.TYPE_CANINE)
				{
					textBuff += "\n\nStrangely shaped digits sit at the end of your morphing limbs, stubby and fat. Your ankles climb higher up your leg as the shape of your feet resolves into something that’s clearly meant to be a paw - only it looks completely alien without fur. Little pads dot the underside as short black claws appear from the tips. A thick coat of fur sprouts from the solidifying skin as the transformation completes, <b>leaving you with dog-like paws instead of feet.</b>";
					if(pc.isTaur()) textBuff += " The rest of your tauric lower half changes to match: <b>you’re a dog-taur!</b>";
					pc.legType = targetType;
					pc.clearLegFlags();
					pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
					pc.addLegFlag(GLOBAL.FLAG_PAWS);
					pc.addLegFlag(GLOBAL.FLAG_FURRED);
				}
				//Kitty legs
				else if(targetType == GLOBAL.TYPE_FELINE)
				{
					textBuff += "\n\nStrangely shaped digits sit at the end of your morphing limbs, stubby and fat. Your ankles climb higher up your leg as the shape of your feet resolves into something that’s clearly meant to be a paw - only it looks completely alien without fur. Cute little pads push their way out of the underside as sharp claws emerge from your toes. A thick coat of fur sprouts from the solidifying skin as the transformation completes, <b>leaving you with cat-like paws instead of feet.</b>";
					if(pc.isTaur()) textBuff += " The rest of your tauric lower half changes to match: <b>you’re a cat-taur now!</b>";
					pc.legType = targetType;
					pc.clearLegFlags();
					pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
					pc.addLegFlag(GLOBAL.FLAG_PAWS);
					pc.addLegFlag(GLOBAL.FLAG_FURRED);
				}
			}
		}
		//Arms not-furred
		if(!pc.hasArmFlag(GLOBAL.FLAG_FURRED) && InCollection(targetType, [GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE]))
		{
			if(pc.armType != targetType && pc.armTypeUnlocked(targetType))
			{
				if(legged)
				{
					textBuff += "\n\nYour arms give out, dumping you flat on your back.";
				}
				else textBuff += "Your arms go limp at your sides.";
				textBuff += ParseText(" Prickles race up and down them, making your heart race. Just as you begin to panic, fur erupts from your [pc.skin]. Lovely, oh so pretty fur! It cascades from your shoulders down your elbows all the way to your fingertips, so fluffy eye-catching.");

				//horse arms
				if(targetType == GLOBAL.TYPE_EQUINE)
				{
					textBuff += "\n\nAs feeling returns, you reach over to pet yourself, only to discover that your nails have spread over most of your fingertip, turning a rich, shiny black. They’re like little hooves for your hands! <b>You guess you have the horse version of arms now...</b>";
					pc.armType = GLOBAL.TYPE_EQUINE;
					pc.clearArmFlags();
					pc.addArmFlag(GLOBAL.FLAG_FURRED);
				}
				//Doggo arms
				else if(targetType == GLOBAL.TYPE_CANINE)
				{
					textBuff += "\n\nAs feeling returns, you reach over to pet yourself, only to discover that your hands have tiny dog-claws now, and you even have some pads on the underside of your fingers. You spend the next few minutes poking yourself just to try them out. <b>You have anthropomorphic dog arms now!</b>";
					pc.armType = targetType;
					pc.clearArmFlags();
					pc.addArmFlag(GLOBAL.FLAG_FURRED);
				}
				//Kitty arms
				else if(targetType == GLOBAL.TYPE_FELINE)
				{
					textBuff += "\n\nAs feeling returns, you reach over to pet yourself, only to discover that your hands have sharp claws now, perfect for helping you get into cans of tuna! There’s even have some pads on the underside of your fingers, in case you have to land on all fours, like a proper kitty. You spend the next few minutes playing with <b>your anthropomorphic, feline arms.</b>";
					pc.armType = targetType;
					pc.clearArmFlags();
					pc.addArmFlag(GLOBAL.FLAG_FURRED);
				}
			}
		}
	}
	//[Day 9] Tail!
	else if(effect.value4 < 9 && effect.minutesLeft < (17280 - 9*24*60))
	{
		effect.value4 = 9;
		if (pc.tailType != targetType && pc.tailTypeUnlocked(targetType) && pc.tailCountUnlocked(1))
		{
			//Horse
			if(targetType == GLOBAL.TYPE_EQUINE)
			{
				if(pc.tailType == 0) textBuff += "There is a sudden tickling on your ass, and you notice you have sprouted a long, shiny horsetail of the same " + pc.hairColor + " color as your hair.";
				//if bee/spider-butt.
				else if (InCollection(pc.tailType, [GLOBAL.TYPE_ARACHNID, GLOBAL.TYPE_BEE, GLOBAL.TYPE_MYR]))
				{
					textBuff += "Your " + pc.tailsDescript() + " bunch";
					if(pc.tailCount == 1) textBuff += "es";
					textBuff += " up as ";
					if(pc.tailCount == 1) textBuff += "it begins";
					else textBuff += "they begin";
					textBuff += " shrinking, exoskeleton flaking off like a snake sheds its skin. ";
					if(pc.tailCount == 1) textBuff += "It bunches";
					else textBuff += "They bunch";
					textBuff += " up until ";
					if(pc.tailCount == 1) textBuff += "it is";
					else textBuff += "they are";
					textBuff += " as small as a tennis ball, then explode";
					if(pc.tailCount == 1) textBuff += "s";
					textBuff += " outwards, growing into an animalistic, vaguely-tail shaped appendage. Moments later, it explodes into filaments of pain, dividing into hundreds of strands and turning into a shiny horsetail.";
				}
				//if other animal tail
				else {
					textBuff += "Pain lances up your " + pc.assholeDescript() + " as your " + pc.tailsDescript() + " shift";
					if(pc.tailCount == 1) textBuff += "s";
					textBuff += " and morph";
					textBuff += "s";
					textBuff += " disgustingly. With one last wave of pain, ";
					if(pc.tailCount == 1) textBuff += "it splits";
					else textBuff += "they split";
					textBuff += " into hundreds of tiny filaments, transforming into a horsetail.";
				}
				textBuff += " <b>You now have a horse-tail.</b>", false;
				pc.tailCount = 1;
				pc.tailType = GLOBAL.TYPE_EQUINE;
				pc.clearTailFlags();
				pc.addTailFlag(GLOBAL.FLAG_LONG);
				pc.addTailFlag(GLOBAL.FLAG_FLOPPY);
			}
			//Doggo
			else if(targetType == GLOBAL.TYPE_CANINE)
			{
				if(pc.tailCount > 0)
				{
					//PC has >1 tail:
					if(pc.tailCount > 1) textBuff += ParseText("All of your [pc.tails] feel");
					else textBuff += ParseText("Your [pc.tails] feels");
					textBuff += " odd, a shiver crawling back and forth through ";
					if(pc.tailCount > 1) textBuff += "them";
					else textBuff += "it";
					textBuff += ". Looking behind you, you can see its shape slowly changing, ";
					//Tail is Furred:
					if(pc.hasTailFlag(GLOBAL.FLAG_FURRED)) textBuff += "the fur becoming closer to that of a canine";
					else if(pc.hasTailFlag(GLOBAL.FLAG_SCALED) || pc.hasTailFlag(GLOBAL.FLAG_FEATHERED) || pc.hasTailFlag(GLOBAL.FLAG_CHITINOUS))
					{
						textBuff += "its ";
						if(pc.hasTailFlag(GLOBAL.FLAG_SCALED)) textBuff += "scales";
						else if(pc.hasTailFlag(GLOBAL.FLAG_FEATHERED)) textBuff += "feathers";
						else textBuff += "chitin";
						textBuff += " falling off as a thick coat of fur grows underneath";
					}
					else textBuff += "the skin itching as a thick coat of fur grows on it";
					textBuff += ". Eventually the transformation ends and you see <b>your new canine tail happily wagging behind you.</b>";
				}
				else
				{
					textBuff += "You feel a painful pinch right on the tip of your tailbone and instinctively reach for it, finding a small bump that wasn’t there earlier. ";
					if(!pc.isAssExposed()) textBuff += ParseText("You pull down your [pc.lowerGarments] to take a better look at it. ");
					textBuff += ParseText("The bump grows larger, slowly and painfully extending your spine with new flesh and bone into a long, naked tail. The growth pains are quickly replaced by an intense itch all around your new tail as new fine hairs sprout from your [pc.skinColor] [pc.skinNoun]. They become thicker, covering it in a beautiful coat of fur. You enthusiastically wiggle <b>your [pc.furColor] canine tail back and forth.</b>");
				}
				pc.tailCount = 1;
				pc.tailType = GLOBAL.TYPE_CANINE;
				pc.clearTailFlags();
				pc.addTailFlag(GLOBAL.FLAG_LONG);
				pc.addTailFlag(GLOBAL.FLAG_FURRED);
				pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
			}
			//Cat
			else if(targetType == GLOBAL.TYPE_FELINE)
			{
				textBuff += ParseText("You feel a mounting pressure on your backside, culminating in what feels like a knot forming just over your [pc.butt]. You give a yelp as the knot bursts, and suddenly flesh is spilling out behind you, forming into a slender tendril. After a moment of combined panic and ecstasy, you realize the squirming mass of flesh is coalescing into a tail. It starts to sprout a thin layer of fur, a fuzzy coating");
				textBuff += ParseText(". You give it a little flex, and find that it curls about your [pc.leg] with prehensile grace. Yep, <b>you’ve definitely got a cat’s tail now.</b>");
				pc.tailCount = 1;
				pc.tailType = GLOBAL.TYPE_FELINE;
				pc.clearTailFlags();
				pc.addTailFlag(GLOBAL.FLAG_LONG);
				pc.addTailFlag(GLOBAL.FLAG_FURRED);
				if(pc.hasSkinFlag(GLOBAL.FLAG_FLUFFY)) pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
				pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			}
		}
	}
	//[Day 10] Furry (+5 lib)
	else if(effect.value4 < 10 && effect.minutesLeft < (17280 - 10*24*60))
	{
		effect.value4 = 10;
		if(pc.skinType != GLOBAL.SKIN_TYPE_FUR && pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
		{
			//Scales drop off
			if(pc.hasScales()) textBuff += ParseText("‘Tink’. One of your scales drops to the ground. It isn’t alone. Others are coming loose. Just touching them causes a handful to break free. Soon they’re dropping off you in a rain of expired armor, baring your [pc.skinNoun] to the whole world.\n\n");
			//Chitin drops off
			if(pc.hasChitin()) textBuff += ParseText("‘Crack!’ A fissure opens up on one of your chitin plates, followed by dozens of smaller cracks that spiderweb across your biological armor in seconds. You feel a sense of building pressure, then the entire mass pops apart, showering the ground below in bits of chitin and exposing your [pc.skinNoun] to the world.\n\n");
			//Feathers fall out
			if(pc.hasFeathers()) textBuff += ParseText("Feathers painlessly pop off your body, fluttering in small spirals toward the ground. You’re molting! ...Only there’s nothing to indicate that new feathers are growing in. As more and more of your plumage flees your form, you’re left with nothing but naked [pc.skin] in its place.\n\n");
			//Sprout fuuuuurrrrr!
			textBuff += "Stars, you itch all over! You scratch at the troublesome tingles, but nothing seems to help - not until tiny hairs sprout all over your body. They’re everywhere, and so thick that you’re not just getting hairy... you’re getting <b>furry</b>. The more your coat fills in, the less it itches, and the more you’re free to admire your flaxen majesty, stroking yourself all over and all but purring in delight.";
			textBuff += "\n\nYour form looks so much better covered from head to toe in silky fur! So much more refined and attractive. You spin, your hands stroking every inch of your body. Just think of all the sex you can get, looking like this, all the cute furry aliens you can bang";
			if(silly) textBuff += " and yiff to your heart’s content";
			textBuff += ". A murr of satisfaction slips out of your throat before you can stop yourself, but why bother? <b>You’re so sexy and furry!</b> It’s fiiiine. You’re fine.";

			pc.skinType = GLOBAL.SKIN_TYPE_FUR;
			pc.clearSkinFlags();
			pc.addSkinFlag(GLOBAL.FLAG_FURRED);
			pc.libido(5);
		}
	}
	//[Day 12] THE SNOUTENING (+3 lib)
	else if(effect.value4 < 12 && effect.minutesLeft < (17280 - 11*24*60))
	{
		effect.value4 = 12;
		if(pc.faceType != targetType && pc.faceTypeUnlocked(targetType))
		{
			textBuff += ParseText("It’s finally happening! Your snout is coming in! It starts with a sneeze and a sense of building tension. You can feel your bones flexing beneath your skin, your sinuses squeezing and reshaping to make room for a muzzle-toting mouth. You lick your [pc.lipsChaste] as they crack from being stretched across a growing orifice, feeling your tongue lengthening to keep up. You pull up your Codex at the last moment, snapping a half-dozen shots of your changing face in progress.");
			textBuff += "\n\nIt’s beautiful. You’re beautiful, with <b>your shining facial fur and ";
			if(targetType == GLOBAL.TYPE_EQUINE) textBuff += "lengthy equine muzzle";
			else if(targetType == GLOBAL.TYPE_CANINE) textBuff += "pleasantly shaped canine muzzle";
			else if(targetType == GLOBAL.TYPE_FELINE) textBuff += "short, feline muzzle";
			textBuff += "</b>. Maybe it’s the furpies talking, but you wish you could fuck yourself. Animalistic instincts surge through you, demanding you obey your biological compulsion to mate, to breed to and spread. Maybe you can find a sexy mate out there";
			if(flags["SEXED_PENNY"] != undefined) textBuff += ", like Penny. Stars, Penny is such a perfect mate, with her fluffy tail and slutty vixen-mouth..";
			textBuff += ".";
			textBuff += "\n\n<b>Furpies is pretty much done with you, but until you get the viruses removed from your system, you’re going to remain easy for furry foes to victimize you...</b>";
			pc.libido(3);
			pc.faceType = targetType;
			pc.clearFaceFlags();
			if(targetType == GLOBAL.TYPE_EQUINE) pc.addFaceFlag(GLOBAL.FLAG_LONG);
			pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
			pc.addFaceFlag(GLOBAL.FLAG_FURRED);
		}
	}
	if (textBuff.length > 0)
	{
		AddLogEvent(textBuff, "passive", maxEffectLength);
	}
}

