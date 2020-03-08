package classes.Items.Transformatives {
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	
	public class SlutShroom extends ItemSlotClass {
		public function SlutShroom() {
			this._latestVersion = 1;
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			this.shortName = "Slutshroom";
			this.longName = "slutshroom";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a pink-colored mushroom, colloquially known as a slutshroom";
			
			this.tooltip = "This pink-colored mushroom is purported by locals to turn the imbiber into a total slut. It also purportedly increases vaginal secretions significantly.\n\n<b>Known to cause high amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1000;
			
			this.version = this._latestVersion;
		}
		//Slutshroom Menu

		//Alt Tarkus: - Slutshrooms (+moderate libido, moderate fertility, +wet if fertile enough) ? 
		//smallish, pink-colored mushroom

		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean {
			clearOutput();
			if(kGAMECLASS.silly) author("Squirtnoxo");
			else author("Fenoxo");
			if ((target is PlayerCharacter)) {
				var pc:Creature = target;
				output("You pop the mushroom into your mouth. It has an unpleasant, metallic taste that makes you want to spit it out - so you do the sensible thing and gulp it down before you have to endure its offensive flavor any longer.");
				if (!pc.hasVagina())
				{
					output(" <b>It’s a real shame it does absolutely nothing.</b>");
					return false;
				}
				pc.taint(5);
				var gotWetter:Boolean = false;
				//Wetness buff. Chooses at random until all pussies are 5.
				var pussies:Array = [];
				for(var x:int = 0; x < pc.totalVaginas(); x++)
				{
					if(pc.vaginas[x].wetness() < 5) pussies.push(x);
				}
				//Any need wetboost
				if(pussies.length > 0)
				{
					gotWetter = true;
					var selPussy:Number = pussies[rand(pussies.length)];
					//No wetness to 1.
					if(pc.vaginas[selPussy].wetness() < 1)
					{
						output("\n\nYou feel warmth seeping down from your stomach into your [pc.vaginaNoun] in no time at all. It isn’t a sexual heat, but it is one that leaves you feeling a little different. Walking around is more comfortable, now that the slit between your legs isn’t so dried out.");
					}
					//Wetness to 2
					else if(pc.vaginas[selPussy].wetness() < 2)
					{
						output("\n\nYou feel warmth spreading out of your stomach, dripping through your body and into your [pc.vaginaNoun] where it can take root. It isn’t a particularly sexual experience, but when you discover the increased slickness allows your lips to slide against one another with your steps, you feel your heart beat a little faster.");
					}
					//Wetness to 3 
					else if(pc.vaginas[selPussy].wetness() < 3) output("\n\nYou feel your stomach growing hot, radiating warmth everywhere but downward most of all. Tendrils of it slip into your womb. You can sense it, somehow, your womb heating up, spreading the change further south and into your [pc.vaginaNoun]. A second later, you’re wet and ready, like your sopping delta is twice as turned on as the rest of you.<b> You’re getting to be a pretty wet [pc.boyGirl].</b>");
					//Wetness to 4
					else if(pc.vaginas[selPussy].wetness() < 4) 
					{
						output("\n\nHeat bubbles up inside your tummy, but it doesn’t stay there. It trickles in rivulets of warmth all the way down... down... into your [pc.vaginaNoun], and then it does you the favor of melting away the floodgates that hold you back from squirting like a firehose when you cum.");
						if(!pc.isCrotchExposed()) output(" Dribbles of [pc.girlCum] leak into your [pc.lowerGarment].");
						else output(" Dribbles of [pc.girlCum] stream down your legs.");
						output(" <b>You’re now a squirter!</b>");
						pc.applyPussyDrenched();
					}
					//Wetness to 5
					else 
					{
						output("\n\nA sudden flare of warmth bubbles up in your gut the moment you finish swallowing. It’s not uncomfortable, but it is hot enough to make you sweat. You feel a little woozy, and your heartbeat speeds faster and faster. Meanwhile, your [pc.vaginaNoun] flushes. You aren’t getting any hornier, but the inexplicable torrent of [pc.girlCum] running down your thighs tells you the rest of your body feels otherwise. Then it hits you, an orgasm from nowhere. Cascades of [pc.girlCumNoun] spray out from your soaking-wet cunt, absolutely drenching your ");
						if(!pc.isCrotchExposed()) output("[pc.lowerGarments]");
						else output("[pc.legs]");
						output(" in scent of horny puss and leaving you weak in the knees.");
						output("\n\nThere’s way more juice than you’re used to. <b>You suppose you’re a heavy squirter, now.</b>");
						pc.orgasm();
						pc.boostGirlCum(5);
						pc.applyPussyDrenched();
					}
					pc.vaginas[selPussy].wetness(1);
					//Still have another puss at a lower level.
					if(pussies.length > 1)
					{
						var stillLower:Boolean = false;
						for(x = 0; x < pc.totalVaginas(); x++)
						{
							if(pc.vaginas[x].wetness() < pc.vaginas[selPussy].wetness()) stillLower = true;
						}
						//Lowest puss win!
						if(!stillLower)
						{
							output("\n\nYou smile when you realize your driest your vagina ");
							if(pc.vaginas[selPussy].wetness() >= pc.driestVaginalWetness()) output("has been brought up to the");
							else output("is a little closer to matching the");
							output(" syrupy-slick standards of ");
							if(pc.totalVaginas() > 2) output("the rest of your cunts");
							else output("your other cunt");
							output(".");
						}
						else
						{
							output("\n\nThe effects are strangely specific. Your other vagina");
							if(pc.vaginas.length > 2) output("s");
							output(" didn’t experience any such change, leaving part of you significantly juicier than the rest. Maybe you should take a few more, and hope things even out.");
						}
					}
				}
				//Libido gain. Can’t combo with wetter squirter
				//Doubled all libido gains for wetness gains :3
				if(pc.libido() < pc.libidoMax() && ((gotWetter && pc.libido() < 75) || (!gotWetter && rand(4) == 0)))
				{
					//Sub 25 + 2
					if(pc.libido() < 25)
					{
						//Got wetter:
						if(gotWetter)
						{
							if(rand(3) == 0) output("\n\nNot that you feel like you need to, but sex would definitely feel better with the added moisture down below.");
							else if(rand(2) == 0) output("\n\nYou touch yourself with a finger, purely to get a better feel for how the slutshroom changed you. It’s nice... in a pulse-quickening way. You stop yourself before you wind up jilling off.");
							else output("\n\nAfterward, you keep thinking back to your newly moistened vagina, not because your libido is picking up but because its a natural reaction to having part of your body change so drastically.");
							pc.changeLust(10);
						}
						//Max wet but not lewd enough - +4
						else
						{
							if(rand(2) == 0) output("\n\nOooh, that feels weird! A wave of vertigo washes over you, and you stagger around a bit until you catch yourself on something. Nothing seems different down below, not even when you rub a little, just to check. Must have been a bad mushroom.");
							else 
							{
								output("\n\nThere’s a pulse of warmth in your belly, but instead of leaking into your [pc.vaginas], it lingers in your core, spreading slowly into your chest. Your heart beats faster, and your [pc.skin] flushes");
								if(pc.hasFur() || pc.hasScales() || pc.hasFeathers() || pc.hasChitin()) output(" under the [pc.skinFurScalesNoun]");
								output(". Weird. Wasn’t this supposed to make your [pc.vaginas] wetter? You reach down and rub yourself until trickles of moisture run down your [pc.thighs]. Nothing different about that! Though you could really go for a nice masturbation session right about now...");
							}
							pc.changeLust(10);
							pc.libido(4);
						}
						pc.slowStatGain("libido",6);
					}
					//Sub 50 + 2
					else if(pc.libido() < 50)
					{
						//Got wetter
						if(gotWetter)
						{
							if(rand(2) == 0) 
							{
								output("\n\nMaybe having a little more sex wouldn’t be a bad thing. You could probably get fucked right now. Just rub some of your newly enhanced pussyjuice on ");
								if(kGAMECLASS.flags["AZRA_SEXED"] != undefined) output("a kaithrit’s nose, and he’d be pinning you to the wall. Kitties love cream...");
								else output("Azra’s nose, and she’d be pinning you to the wall...");
							}
							else
							{
								output("\n\nHow amazing! One second, you’re eating a little mushroom, the next you’re trying not to soak yourself in sex-juice. Will ausar be able to smell it?");
								if(kGAMECLASS.flags["MET_SYRI"] != undefined) output(" What if the next time you see Syri she can smell how wet you’re getting? She’d probably fuck you over an arcade machine until you got pregnant.");
								else output(" What if the next time you run into one, they’re compelled to take you by your fragrant cunt. It probably wouldn’t even be rape. You want to feel the knot squish around inside your emboldened channel.");
							}
							pc.changeLust(10);
						}
						//Knot wetter - +3
						else
						{
							if(rand(2) == 0) 
							{
								output("\n\nIt digests with a warm sort of glowy feeling in your stomach, leaving you rubbing your [pc.belly] and waiting for the effects. You hiccup while you’re waiting for the effects to manifest, and the ");
								if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.INDOOR)) output("walls");
								else output("horizon");
								output(" <i>wiggles</i>, making you giggle. Colors are more resplendent, the fabric of the universe bleeding through on the edges, woven together on the empathic strands which connect all beings. Something is happening to you, but no matter how many fingers you stuff inside yourself, you don’t feel any wetter.");
								output("\n\nThe experience leaves you feeling a greater sense of connection to your fellow sapients, underscored by the knowledge that all anyone wants is a little love. You should share yours a little more often.");
							}
							//Alt:
							else
							{
								output("\n\nIt feels warm and gooey inside you, the mutagenic mushroom seeping into your bloodstream to make you better, sexier. You shake your head as your lust builds, getting you nice and wet - though not any more so than normal. Should you like getting sexier? Your fingers dive into [pc.oneVagina], just to make sure the mushrooms are working. It seems like a pretty good idea, getting wet and ready. Everybody wants to fuck the [pc.boyGirl] with the dripping-wet cooze.");
								output("\n\nAfter a long, satisfying session of fingerplay, imagining all the hotties that’ll line up for a shot at you once you become the " + pc.mf("king","queen") + " of squirting, you have the good sense to blush in shame. That was certainly an exceptionally lewd thought, and you didn’t even get any wetter for the trouble! Could the mushrooms have done something else?");
							}
							pc.changeLust(10);
							pc.libido(3);
						}
						pc.slowStatGain("libido",6);
					}
					//Sub 75 + 1
					else if(pc.libido() < 75)
					{
						//Wetter
						if(gotWetter) 
						{
							if(rand(2) == 0) output("\n\nYou briefly ponder getting a big, fat dildo, just to challenge your newly lubricated vagina. You could measure how hard it is to stuff inside, then eat another mushroom and try again to feel the difference! After a few more minutes fantasizing about floppy, fake penises, you shelf the troublesome thoughts and sigh wistfully. Real dick would be more fun.");
							else output("\n\nCoreward values would frown on someone giving themselves a juicier snatch, but who are they to judge? If you want to leak girl-cum like a hot piece of fuckmeat, that’s your business. Yours and your future lovers’.");
						}
						//Notwetter
						else
						{
							if(rand(2) == 0)
							{
								output("\n\nNothing especially notable happens. You feel a little queasy and sit down, but there’s no sudden gush of [pc.girlCumNoun], no explosion of pleasure. It’s a little disappointing. You had figured this mushroom would give you a cunt-drenching, pussy-pleasing experience, not a mild stomach upset and a few minutes to think about it. You press your hand to [pc.oneVagina], just to balance out the discomfort with pleasure, spending the time until you feel okay once more gently fondling yourself.");
								output("\n\nMust have been a dud.");
							}
							else
							{
								output("\n\nStrange, tingling heat spreads from your stomach and into your limbs. It leaves you feeling light as a feather, almost like you’re floating as you move around. It also makes you feel hot... and aroused, sweaty and ready to fuck. Your pussy isn’t getting wetter, the rest of your body is! You briefly consider grabbing the nearest fuckable partner and pulling them into bed, just to feel another body slipping and sliding against your own. It’d feel so good to grind yourself against another warm body.");
								output("\n\nThe exotic high leaves you winded and residually lusty. That mushroom definitely did something to your head. Maybe finding a one night stand would make you feel better about it?");
							}
						}
						pc.slowStatGain("libido",8);
						pc.changeLust(10);
					}
					//Else + .5
					//Notwetter only:
					else
					{
						if(rand(2) == 0)
						{
							output("\n\nIt doesn’t do anything, though you do sneeze a second later, your vision going wobbly. That was weird. You sneeze again, and for a brief second, the world seems seems strangely moist, hiding secret pussies and turgid, cocks leaking ethereal goo. You giggle at the absurdity of it and reach for the nearest one, amazed at how it feels exactly like your [pc.vaginas]: wet and hot in all the right ways.");
							output("\n\nBeneath all the serious situations and troubling news, there’s an erotic undercurrent to the universe. You couldn’t see it before. It was beyond your perception, but you see it now. Life is a canvas of places to fuck, a menagerie of exotic positions and genitalia just waiting to be sampled. Whole dimensions of spent spunk bubble in parallel dimensions while leaky, girlish pussies leave indelible stains upon reality itself. You sneeze again, rubbing harder, giggling when the landscape bukkakes itself, every square inch covered in cum and dribbling pussy-juice.");
							output("\n\nA few minutes later, you come to. Most of your fingers are lodged in a sore-feeling vagina, like you just spent the night taking a bareback pounding from a big-dicked ausar. It might be slutty, but it’d be fun. And right now, that seems like the most important thing in the universe.");
							if(pc.isCrotchExposed()) output(" You’re glad you had the good sense to keep your crotch exposed, like it’s supposed to be.");
							else if(pc.sexiness() < 5) output(" Maybe you should change into something sexier.");
							else output(" You’re glad you’re dressed for the occasion.");
						}
						//Alt:
						else
						{
							output("\n\nWhy wait for it to take effect? You drop to the floor");
							if(pc.legCount > 1)
							{
								output(" and briskly spread your [pc.legs]");
								if(!pc.isCrotchExposed()) output(" and equipment");
							}
							else
							{
								output(" and briskly fold your [pc.legs]");
								if(!pc.isCrotchExposed()) output(" and equipment");
							}
							output(" out of the way. Your [pc.vaginas] look");
							if(pc.totalVaginas() == 1) output("s");
							output(" fucking hot. You’re already horny. Were you when you started? You shrug, and put it at the back of your mind. You decided that you’re going to masturbate; of course you’re horny. You should be. There’s a hot, slutty little hole right in front of you that’s aching to be stuffed.");
							output("\n\nFucking yourself is easy. Just like getting fucked. You pump your fingers in and out, switching hands to lick the fragrant juices into your mouth. Pussy tastes so good. It’s no wonder you’re trying to get even wetter. No wonder you find yourself daydreaming of eating out " + pc.mf("","other ") + " girls and cumming from the taste alone. The thoughts are depraved and whorish, obscene even. You whimper as you start to climax, realizing that it doesn’t matter what anyone else believes, not when it gets you off this hard.");
							output("\n\nWhores have the right idea.");
						}
						pc.orgasm();
						pc.slowStatGain("libido",10);
					}
				}
				//Wetter squirter - Reqs wetness 5 on all cunts and libido >= 66
				else if(!gotWetter)
				{
					var oldLust:Number = pc.lustRaw;
					//Get max girlcum amount:
					pc.lustRaw = 100;
					var wetnessAmount:Number = pc.girlCumQ();
					pc.lustRaw = oldLust;
					//Sub 2k
					if(wetnessAmount < 2000) 
					{
						output("\n\nYou wonder what the mushroom is doing to you as you feel your stomach fill with heat. Will that warmth, dripping into your [pc.vaginas] drop by drop, make you squirt gallons? The thought alone has you leaking more and more [pc.girlCum], and though nothing else seems to happen, you feel a sense that something is different, like your next orgasm will be even wetter.");
						pc.changeLust(5);
					}
					//Sub 5k
					else if(wetnessAmount < 5000)
					{
						output("\n\nYou’re a squirting mess. You know it. Your lovers know, and the mushroom filling your body with heat and lust knows it. You ");
						if(!pc.isCrotchExposed()) output("strip off your [pc.crotchCovers]");
						else output("lean over");
						output(" for a better look, watching your sopping wet slit");
						if(pc.totalVaginas() > 1) output("s");
						output(", drip more and more. It’s beautiful... and hot. So hot that you feel an orgasm coming just from watching yourself leak. You wish you had something inside ");
						if(pc.totalVaginas() > 1) output("them");
						else output("it");
						output(", something to let squirt around when orgasm hits. [pc.GirlCum] sprays out at that thought, cascading everywhere, drenching the ground below.");
						output("\n\nYou feel like a sponge being wrung out, like a balloon full of sexual lubricant being unplugged to vent its contents in passionate squirts. Collapsing into your own [pc.girlCum], you pant heavily. It seems like there’s more there than usual.<b> A depraved grin spreads over your features at the knowledge that you’re turning yourself into a sopping-wet slut.</b>");
						pc.orgasm();
					}
					//Sub 10k
					else if(wetnessAmount < 10000)
					{
						output("\n\nYou feel bubbling, effervescent heat radiate out from your stomach the second the mushroom lands inside. It’s like you just swallowed gallons of some other girl’s pussy-juice, and now you get to lie back and let it warm you from the inside... only it’s slipping down, down and further down into your crotch.");
						output("\n\nYou cum explosively. [pc.GirlCum] squirts out of in forking streamers");
						if(!pc.isCrotchExposed()) output(", battering the inside of your [pc.crotchCovers] until it has you soaked from the waist down, basting in your own juices.");
						else output(", coursing over your [pc.thighs] and soaking the ground, forming erotically-infused puddles of your blissful condensation.");
						output(" There’s more than there should be. The mushrooms must be doing their job, making you the wettest, sloppiest slut this side of the core.");
						//:3
						pc.applyPussyDrenched();
						pc.boostGirlCum(15);
						pc.orgasm();
					}
					//Sub 50k
					else if(wetnessAmount < 50000)
					{
						output("\n\nThe reaction is instantaneous. You go from swallowing to cumming in the time it takes the mushroom to hit your stomach. There’s something magical about these little fungi, to bring you so much pleasure. Torrents of [pc.girlCum] spray out of you like water from a firehouse. Climaxes like these could drown a galotian or bathe a harem of big-dicked boy-toys until the only thing anyone can smell is the glorious scent of one well-pleased pussy.");
						output("\n\nThe best part? That you’re sure this one was the wettest, sloppiest orgasm yet.");
						//:3
						pc.applyPussyDrenched();
						pc.boostGirlCum(25);
						pc.orgasm();
					}
					//Sub 100k
					else if(wetnessAmount < 100000)
					{
						output("\n\nYour [pc.vaginas] ");
						if(pc.totalVaginas() == 1) output("is");
						else output("are");
						output(" already leaking by the time you start to swallow the mushroom. You can’t help it. [pc.GirlCum] and you are practically synonymous by this point. You’ve ");
						if(kGAMECLASS.flags["SLUTSHROOMS_EATEN"] != undefined) output("taken so many mushrooms");
						else output("modded yourself so heavily");
						output(" that you sometimes let loose a little micro-squirt from having a particularly erotic thought, and your orgasms feel like dams breaking in the middle of a hurricane.");
						output("\n\nJust thinking about how absolutely, cock-drenchingly slutty your [pc.vaginas] ");
						if(pc.totalVaginas() == 1) output("has");
						else output("have");
						output(" become is enough to push you over the edge, or maybe that’s the slutshroom kicking into action. Whatever the case, you lose complete control over your [pc.legs] and spill onto the ground, your [pc.vaginas] dilated by the river of [pc.girlCum] flooding out. There’s too much to measure, as you lie in an inch-deep puddle of your own sexual release, but you bet there was more than last time. It’s kind of hard to keep track while your [pc.clits] ");
						if(pc.totalClits() == 1) output("is");
						else output("are");
						output(" getting blasted by the pressurized flow");
						if(pc.totalVaginas() > 1) output("s");
						output(" leaving your body.");
						pc.orgasm();
						//:3
						pc.applyPussyDrenched();
						pc.boostGirlCum(50);
					}
					//100k+
					else
					{
						output("\n\nOrgasm comes knocking like a power-armored SWAT team breaking through a plywood door. [pc.GirlCum] explodes out of you in pulsating, gushing waterfalls. You tumble backward");
						if(pc.hasLegs()) output(", [pc.legs] spread wide and quivering");
						output(", unloading a steaming torrent of feminine pleasure ");
						if(!pc.isCrotchExposed()) output("all over the inside of your [pc.crotchCovers]");
						else output("all over everything in a ten-foot arc");
						output(". Your body, once ");
						if(pc.originalRace != "human") output("mostly ");
						output("terran, seems more like a [pc.girlCumNoun] brewery than something befitting of a galactic adventurer, and it feels far too good to mind.");
						output("\n\nThe explosive pleasure intensifies from its own symptoms, the high-pressure flows stimulating the tingling nerves of your passage into making you cum even harder. [pc.EachClit] vibrates against the sputtering fluid jets, shooting bolts of soaking-wet ecstasy into your increasingly overwhelmed brain.");
						if(pc.isBimbo()) 
						{
							output(" You’d totes be on the edge of blacking out if you weren’t all bimbified");
							if(pc.isTreated()) output(" by the Treatment");
							output(". Instead you get to ruminate on how great it feels to be this wired-up for sex. If only you had someone fucking you right now, somebody you can drench in the proof of your bliss...");
						}
						else output(" You all but black out from the pleasure. Your body twitches and writhes, but your mind slips into a sort of passive hibernation, swept along on the currents of [pc.girlCum] coursing out of you.");

						output("\n\nWhen you ");
						if(pc.isBimbo()) output("calm down");
						else output("wake up");
						output(" and blink the girlspunk out of your eyes, you’re laying in a puddle of your own slutty creation and absolutely loving it. The scent is ripe and thick in the air, pheromonal and needy, letting every male in a ten mile radius know that there’s a horny female around with a cunt wet enough to accept a dozen dicks at once.");
						output("\n\nWas that more than usual? There’s too much to tell. You’ll just have to assume you’re getting wetter. <b>You’ve reached the point where you produce so much that further improvements in wetness are almost imperceptible.</b>");
						pc.orgasm();
						pc.applyPussyDrenched();
					}
					pc.boostGirlCum(15);
				}
			}
			else {	
				output(target.capitalA + target.short + " consumes the slutshroom to no effect.");
			}
			return false;
		}
	}
}