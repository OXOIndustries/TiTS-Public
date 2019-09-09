package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.getPlanetName;
	import classes.Engine.Utility.IncrementFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class SumaCream extends ItemSlotClass
	{
		public function SumaCream()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 12;
			type = GLOBAL.PILL;
			
			shortName = "Suma";
			longName = "Suma Cream capsule";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a Suma Cream capsule";
			
			tooltip = "[altTooltip SumaCream]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 800;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.output("You use the pill to no effect.");
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the pill to no effect.");
			}
			return false;
		}
		
		public static function sumaEffects(target:Creature, pillColor:String = "none"):void
		{
			clearOutput();
			kGAMECLASS.showName("SUMA\nCREAM");
			author("Adjatha");
			
			var pc:Creature = target;
			
			// Non-Balled PCs
			if(pc.balls <= 0)
			{
				kGAMECLASS.output("You look at the cream-filled sphere and contemplate giving it a try despite not having");
				if(pc.hasCock()) kGAMECLASS.output(" any balls");
				else kGAMECLASS.output(" any cock or balls");
				kGAMECLASS.output(". Eh, better not to take the chance, you decide. Best case scenario, you’d just be wasting it. Worst case, you might end up with some pretty bizarre body swelling, like testicles on your chin! Shuddering, you drop the bead back into your pocket.");
				kGAMECLASS.output("\n\n");
				
				kGAMECLASS.processTime(1);
				
				if (!kGAMECLASS.infiniteItems())
				{
					switch (pillColor)
					{
						case "white": kGAMECLASS.itemCollect([new SumaCreamWhite()]); break;
						case "black": kGAMECLASS.itemCollect([new SumaCreamBlack()]); break;
					}
				}
				
				clearMenu();
				addButton(0, "Next", kGAMECLASS.useItemFunction);
				return;
			}
			// Taur characters
			else if(pc.isTaur() && pc.genitalLocation() >= 2)
			{
				kGAMECLASS.output("Flexing the tiny ball of cream between your fingers, you take a moment to think about your situation. The cream has to be spread onto your");
				if(pc.balls == 1) kGAMECLASS.output(" testicle");
				else kGAMECLASS.output(" balls");
				kGAMECLASS.output(" to get the full effect, but given the size of your lower body, actually reaching your [pc.balls] is nearly impossible. You squeeze out the balm and try rubbing it onto the [pc.skinFurScales] of your pelvis and are rewarded with a very slight tingling sensation. Well, at least you got something out if it!");
				
				kGAMECLASS.processTime(3 + rand(3));
				// {removes monoball, increases testicle circumference by 1”}
				pc.lust(20);
				//pc.removeStatusEffect("Uniball");
				/*
				if(pc.balls < 2) pc.balls = 2;
				if(pc.ballSizeRaw < 30)
				{
					pc.ballSizeRaw++;
					if(pc.hasPerk("Bulgy")) pc.ballSizeRaw++;
				}
				*/
				
				clearMenu();
				addButton(0, "Next", kGAMECLASS.useItemFunction);
				return;
			}
			// Monoball or co cock
			else if(pc.balls < 2 || !pc.hasCock())
			{
				kGAMECLASS.output("Flexing the tiny ball of cream between your fingers, you recall that the cream has to be spread onto your");
				if(pc.balls == 1) kGAMECLASS.output(" testicle");
				else kGAMECLASS.output(" sack");
				kGAMECLASS.output(" in order to work. You squeeze out the balm and try rubbing it onto the [pc.skinFurScales] of your pelvis and are rewarded with a very slight tingling sensation.");
				if(pc.balls < 2) kGAMECLASS.output(" Oddly enough, you feel a cramped sensation - not from the slow tingle of the minor growth, but from something else growing within your male pouch. Your [pc.sack] tightens, then relaxes and expands as a new testicular orb grows in. It seems this cosmetic cream needs you to have at least a pair to enjoy its full effect!");
				else if(pc.ballSizeRaw < 30) kGAMECLASS.output(" Your testicles swell a small amount, but not much happens afterwards. Another tingle hits the region above your sack and instantly dissipates. Hm, it seems this cosmetic cream needs you to have at least one cock to enjoy its full effect!");
				else kGAMECLASS.output("... and nothing happens afterwards. Another tingle hits the region above your sack and instantly dissipates. It seems this cosmetic cream needs you to have at least one cock to enjoy its full effect!");
				
				kGAMECLASS.processTime(3 + rand(3));
				
				pc.lust(20);
				//pc.removeStatusEffect("Uniball");
				if(pc.balls < 2) pc.balls = 2;
				if(pc.ballSizeRaw < 30)
				{
					pc.ballSizeRaw++;
					if(pc.hasPerk("Bulgy")) pc.ballSizeRaw++;
				}
				
				clearMenu();
				addButton(0, "Next", kGAMECLASS.useItemFunction);
				return;
			}
			// Grow, grow, grow!
			else
			{
				// First Time
				if(kGAMECLASS.flags["SUMA_CREAM_USES"] == undefined)
				{
					kGAMECLASS.output("Rolling the small bead around in your palm, you begin to wonder if this thing is safe. Sure, J’ejune is a massive corporation, but their stuff tends to be have unforeseen side effects. For all you know, it may produce spontaneous bone wiggles in one out of a hundred users. Well, what’s life without risk, you sigh. Clutching the " + pillColor + " pearl between your thumb and forefinger,");
					if(pc.isCrotchExposed()) kGAMECLASS.output(" you rub a palm against the naked heft of your [pc.balls].");
					else kGAMECLASS.output(" you open your [pc.clothes] just enough to expose your [pc.balls] to the open air.");
					kGAMECLASS.output(" Lowering the capsule to the surface of your sack, you squeeze the plastic covering until it deforms enough to breach the surface. Cream oozes from the pellet, and somewhat tentatively you begin to rub it into the pliant [pc.skinFurScales] of your sack.");
				}
				// Repeat
				else
				{
					kGAMECLASS.output("Pulling another Suma Cream capsule out, you lower the bead");
					if(pc.isCrotchExposed()) kGAMECLASS.output(" to your crotch");
					else kGAMECLASS.output(" under your [pc.clothes]");
					kGAMECLASS.output(" and pinch the pearl till its thick discharge drips down onto your [pc.balls]. Rubbing with your fingertips, you work the cold goo in until you can feel a slight heaviness forming in your gut.");
				}
				IncrementFlag("SUMA_CREAM_USES");
				kGAMECLASS.processTime(5);
				
				// Kui-tan Hotfix/Workaround
				if(pc.hasPerk("'Nuki Nuts") && pc.weightQ("testicle") >= 100 && pc.heightRatio("testicle") >= (40/60))
				{
					author("");
					
					kGAMECLASS.output("\n\nSomething strange happens as your body trembles and vibrates with an unfamiliar pressure... You feel your sack shrink slightly underneath you... Wait, that’s not supposed to happen is it? Could your kui-tan genes be preventing you from growing any larger?");
					
					pc.ballSizeRaw = (pc.tallness * (40/60) * Math.PI) - pc.ballSizeMod - (1 + rand(6));
					if(pc.ballSizeRaw < 3) pc.ballSizeRaw = 3;
					kGAMECLASS.processTime(1);
					
					kGAMECLASS.output("\n\nAs if answering your question, your body is immediately struck with the feeling of orgasm! Strangely enough, nothing comes of it--not from your [pc.cocks], nothing. What--");
					kGAMECLASS.output("\n\nAnother wave hits you. And another. <i>And another!</i> <b>What the Void is going on?!</b>");
					kGAMECLASS.output("\n\nUnable to stall the simultaneous, rapid-fire not-orgasms, you let the feelings surge through you and hope that your microsurgeons are able to fix whatever you ended up doing to yourself; to which you quickly feel the results of... The shrinking sensation you had earlier is now replaced by an increased bloating--in your nuts, that is.");
					
					pc.ballFullness = 100;
					kGAMECLASS.processTime(1);
					
					kGAMECLASS.output("\n\nWave after overlapping wave, you shudder as your testicles inflate and expand to maximum fullness with each progressive rush, filling with what you know is your seed, your fat sack hanging freely into the open air");
					if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC)) kGAMECLASS.output(" for everyone to see");
					kGAMECLASS.output(". After several minutes, and what feels to be a hundred blank-gasms later, your balls have stopped their complaining and have become");
					
					pc.ballFullness += 100;
					for(var j:int = 0; j < 10; j++)
					{
						if(rand(2) == 0)
						{
							if(pillColor == "white") pc.ballFullness += 100;
							if(pillColor == "black") pc.ballFullness += 300;
						}
					}
					pc.lust(200);
					kGAMECLASS.processTime(20);
					
					if(pc.ballSize() < 36 * Math.PI) kGAMECLASS.output(" rather large.");
					else if(pc.ballSize() <= pc.tallness * (40/60) * Math.PI) kGAMECLASS.output(" ridiculously oversized!");
					else if(pc.ballSize() <= pc.tallness * Math.PI) kGAMECLASS.output(" as big as your are tall!");
					else if(pc.ballSize() < 360 * Math.PI) kGAMECLASS.output(" bigger than you are!");
					else kGAMECLASS.output(" bigger than a house!");
					kGAMECLASS.output("\n\nThe feeling of expansion and having your talented balls convert the extra testicular mass into [pc.cumNoun] volume has set your arousal on fire...");
					if(kGAMECLASS.silly) kGAMECLASS.output(" Well, at least it wasn’t bone wiggles...");
					else kGAMECLASS.output(" You’ve got to take care of this!");
					
					clearMenu();
					addButton(0, "Next", kGAMECLASS.useItemFunction);
					return;
				}
				// Bad End
				// {if players use White Cream while at 90” circumference or larger balls, or if players use Black cream while at 81” circumference or larger balls}
				else if(((pillColor == "white" && pc.ballSizeRaw >= 90) || (pillColor == "black" && pc.ballSizeRaw >= 81)) && pc.weightQ("testicle") >= 100 && pc.heightRatio("testicle") >= (40/60))
				{
					kGAMECLASS.showName("\nUH-OH!");
					kGAMECLASS.output("\n\nYour body trembles and vibrates with an unfamiliar pressure. Your heart races and your mouth waters as moist tears brim at the periphery of your [pc.eyes]. Something’s wrong, that much is obvious. A bad reaction or a bad batch of Suma Cream? As panic starts rising in your [pc.chest], an equally intense pressure builds in your [pc.balls], your [pc.cocks] throbbing with what promises to be the most intense orgasm you’ve ever experienced.");
					kGAMECLASS.output("\n\nYou could rush to get help, or ride it out and go for broke. Just how much do you want big balls?");
					// [Get Help] [Let em Grow]
					clearMenu();
					addButton(0, "Get Help", SumaCream.sumaBadEnd, "help");
					addButton(1, "Let em Grow", SumaCream.sumaBadEnd, "grow");
					return;
				}
				// Normal
				else
				{
					kGAMECLASS.output("\n\n");
					switch (pillColor)
					{
						// White Cream Transformation Effects
						case "white":
							// Small Nuts (less than 12” circumference)
							if(pc.ballSizeRaw < 12)
							{
								kGAMECLASS.output("As the cream settles into your [pc.balls], a cold numbness spreads through your lower body. Your [pc.crotch] seems to be throbbing, but you can’t feel a thing. A nervous tightness slowly wraps around your chest, air coming in short, labored breaths as tiny prickles of sensation creep along the back of your neck. Is it working?");
								kGAMECLASS.output("\n\nYou cup a palm at crotch level and try to feel out the heft of your scrotum. Despite your fears, you’re gratified when you find that indeed, bit by bit, your pouch does seem to be expanding. The tightness eases, spreading sweet relief through your body. Stress and exhaustion fades from you as if your body is being massaged by the waves of cold radiating through your body.");
								kGAMECLASS.output("\n\nYou try to move, but nearly fall over, finding that your [pc.legOrLegs]");
								if(pc.legCount == 1) kGAMECLASS.output(" has");
								else kGAMECLASS.output(" have");
								kGAMECLASS.output(" also gone numb as if frozen in place. Well, that’d probably be why you couldn’t feel the balm working - you can’t feel anything below your waist. Looks like you may be here for a while. Another annoying side effect brought to you by the fine folks at J’ejune Pharmaceuticals.");
								
								// {remove monoball, testicles increase by 3 inch circumference and 1 hour passes.}
								kGAMECLASS.processTime(50 + rand(11));
								//if(pc.balls < 2) pc.balls = 2;
								//pc.removeStatusEffect("Uniball");
								pc.ballSizeRaw += 3;
								if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 1;
								pc.lust(20);
							}
							// Large Nuts (13”-35” circumference)
							else if(pc.ballSizeRaw < 40)
							{
								kGAMECLASS.output("When the cream is sufficiently spread across the sizable surface of your [pc.balls], you let the beauty product do its work. A wave of nauseating numbness creeps up your crotch, but fades quickly, leaving an intense heat. Your breath is nearly squeezed from your chest as your [pc.groin] is inflamed with an unbearable warmth. Is the cream working, or is this some kind of side effect?");
								kGAMECLASS.output("\n\nThe heat compresses itself, pulling the warmth of your body firmly into your [pc.cocksLight]. The flesh of your member");
								if(pc.cockTotal() != 1) kGAMECLASS.output("s");
								kGAMECLASS.output(" swell");
								if(pc.cockTotal() == 1) kGAMECLASS.output("s");
								kGAMECLASS.output(" to turgid stiffness in moments, beads of pre-cum bubbling to the surface as the fire in your veins struggle to find some outlet. Pressing the palm of your hand against the tender, throbbing [pc.skinFurScales], you wince with the effort of trying to hold back while you find somewhere to cleanly dispose of your load. Despite your efforts, the [pc.cumColor] seeping from your [pc.cockHeads] cannot be stalled and [pc.cumVisc] blobs of [pc.cumNoun] begin spurting");
								if(pc.isCrotchExposed()) kGAMECLASS.output(" against your [pc.skinFurScales].");
								else kGAMECLASS.output(" inside your [pc.lowerGarment].");
								kGAMECLASS.output("\n\nWhen the heat finally fades, you’re left gasping, sweat rolling down your [pc.skinFurScales]. That was more intense than you were expecting for a beauty cream. Glancing down, you can tell at once that the balm did its job - your nuts are appreciably bigger, the taut globes seemingly begging for more.");
								
								// {Remove monoball, testicles increase by 6 inch circumference, libido increases by 1-3, and the player’s lust is reset}
								kGAMECLASS.processTime(20 + rand(11));
								//if(pc.balls < 2) pc.balls = 2;
								//pc.removeStatusEffect("Uniball");
								pc.ballSizeRaw += 6;
								if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 2;
								pc.orgasm();
							}
							// XXXL Nuts (40”+ circumference)
							else
							{
								kGAMECLASS.output("There’s hardly enough salve to cover much more than a small fraction of your hefty pouch, but you’re gratified to find that it seems to be working all the same. A shiver of cold snakes down your spine before a flash of heat flickers in your chest. Both fade quickly, allowing you to fully appreciate the sensation swimming within your [pc.balls].");
								if(pc.isCrotchExposed()) kGAMECLASS.output(" You have a clear view of your bloated orbs as they expand before your eyes, gaining mass like sponges soaking up water.");
								else kGAMECLASS.output(" Your [pc.lowerGarments] visibly bulge as your sack expands, liquid weight squishing against your clothing. Quickly scurrying to a semi-private nook, you drop your [pc.lowerGarments] to let your monsters grow without restraint.");
								kGAMECLASS.output("\n\nYour balls bloat, fattening with each passing second as if ballooning from raw lust. The seemingly insignificant blob of beauty cream seems to have sent your body into overdrive as your swollen sack plumps with mounting speed. Vision blurring from the gurgling weight of your expansion, your [pc.chest] heaves with the needful gravity building between your [pc.thighs]. Your [pc.cocks] stiffen");
								if(pc.cockTotal() == 1) kGAMECLASS.output("s");
								kGAMECLASS.output(" with covetous empathy. Though unaffected by the balm’s influence, your member");
								if(pc.cockTotal() != 1) kGAMECLASS.output("s");
								kGAMECLASS.output(" reach");
								if(pc.cockTotal() == 1) kGAMECLASS.output(" its");
								else kGAMECLASS.output(" their");
								kGAMECLASS.output(" full mast in record time, eager to put your expanding balls to the test.");
								kGAMECLASS.output("\n\nAs your pouch gains inch after inch, you just can’t help but stroke your [pc.cocks], the [pc.cockHeads] dilating as your billowing load audibly churns within you. Running a hand nervously over your [pc.hair], you buck your [pc.hips] in time with your pumps. The noisome slapping of your [pc.balls] against the [pc.skinFurScales] of your thighs is just loud enough to drown out the moaning gasps that thoughtlessly slip from your trembling [pc.lips].");
								kGAMECLASS.output("\n\nAs your orgasm builds to the point of inevitable release, you slide both hands to the weighty surface of your bloating balls. Fingers massaging and caressing your monumental cum-factories, the climax hits you like a kick in the chest. Gouts of [pc.cumColor] spoo arc up from your [pc.cocks], filling the air with your [pc.cumVisc] seed. Your testes lurch in your grip, their surface writhing with the rapture of production. Ropey strands splatter around you, some even splashing against your");
								if(pc.isChestExposed()) kGAMECLASS.output(" [pc.chest]");
								else kGAMECLASS.output(" [pc.upperGarment]");
								kGAMECLASS.output(" and across the flushed [pc.skinFurScales] of your face.");
								kGAMECLASS.output("\n\nWhen, finally, your load is spent, you take stock of your endowments. Empty Void, that’s a lot of growth! Somebody at J’ejune apparently didn’t bother trying their product on a test subject who already had massive testicles. With orbs like these, you’re likely to be mistaken for a series of small moons. At this size, you might want to think hard before trying another Suma Cream.");
								if(!pc.isCrotchExposed()) kGAMECLASS.output(" It takes quite a bit of time, but you barely manage to squeeze back into your [pc.lowerGarments], the bulge of your sack so obvious that it’s almost not worth the effort.");
								
								// {remove monoball, testicles increase by 15 inch circumference, libido increases by 5, cum multiplier increases by 1, and the player’s lust is reset}
								kGAMECLASS.processTime(30 + rand(11));
								//if(pc.balls < 2) pc.balls = 2;
								//pc.removeStatusEffect("Uniball");
								pc.ballSizeRaw += 15;
								if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 5;
								pc.cumMultiplierRaw++;
								pc.slowStatGain("libido", 5);
								pc.orgasm();
							}
							break;
						
						// Black Cream Transformation Effects
						case "black":
							
							kGAMECLASS.output("The greasy black cream sinks into your [pc.skinFurScales] with alarming speed, lost so quickly you almost wonder if there was anything in the capsule at all. A loud gurgling from your gut seems to confirm that the salve is hard at work, and you find a private nook to wait out the effects of the cream. You");
							if(!pc.isCrotchExposed()) kGAMECLASS.output(" slide out of your [pc.lowerGarments] and");
							kGAMECLASS.output(" are a little perplexed to see your [pc.balls] haven’t changed at all yet. Your sack certainly feels heavier, the cold weight of your balls sending tendrils of arousal through your veins and up into your brain.");
							kGAMECLASS.output("\n\nWith deep, hot breaths, you begin massaging the seemingly unresponsive spheres between your [pc.thighs].");
							if(pc.hasBreasts()) kGAMECLASS.output(" The [pc.nipples] atop your [pc.breasts] stiffen, inflamed by a blossoming heat within your breast.");
							if(pc.hasVagina()) kGAMECLASS.output(" The [pc.pussy] just below your balls fights back the icy chill of your numbed pouch with a torrid lust that draws fat drops of nectar from your sultry depths.");
							kGAMECLASS.output(" Whatever sensitivity your [pc.balls] may have lost seems to have migrated into your [pc.cocksLight]. Even reaching down to lightly touch the [pc.cockHeadBiggest] of your [pc.cockBiggest] is enough to bring a shuddering bliss rippling through your body so close to a climax that your [pc.hips] thrust into empty air.");
							kGAMECLASS.output("\n\nWith a gulp, you wrap your fingers around the mass of your [pc.cockBiggest] and immediately orgasm. A spout of [pc.cumVisc] cum shoots from the tender tip and with it, a small portion of the numbness fades. Your [pc.balls] swell before your eyes, growing with every arcing rope of [pc.cumColor] jizz that pumps from your body. Using both hands now, you eagerly seize your [pc.cocks] with renewed fervor, stroking the hyper-sensitive flesh to milk fresh gouts of [pc.cum], your testes ballooning with every clenching jet.");
							
							// {testicles increase by 25 inch circumference, libido increases by 5, cum multiplier increases by 2, and the player’s lust is reset}
							kGAMECLASS.processTime(45 + rand(11));
							//if(pc.balls < 2) pc.balls = 2;
							//pc.removeStatusEffect("Uniball");
							
							pc.cumMultiplierRaw += 2;
							pc.slowStatGain("libido", 5);
							for(var i:int = 0; i < 5; i++)
							{
								pc.ballSizeRaw += 5;
								if(rand(5) == 0) pc.ballSizeRaw += 5;
								if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 1 + rand(3);
								pc.orgasm();
							}
							
							kGAMECLASS.output("\n\nYou get light-headed from the volume of your rolling climax, wringing each thrilling [pc.cumGem] load from your [pc.groin] with dazed delight. Only when your [pc.cocks] seem");
							if(pc.cockTotal() == 1) kGAMECLASS.output("s");
							kGAMECLASS.output(" to finally come up empty, do you take stock of yourself. Head still swimming, you glance about, idly noticing the dripping [pc.cum] pooling on the [pc.skinFurScales] of your lower body. You turn your attention to the Suma Creamed sack below your [pc.cocksLight] and faintly raise an eyebrow in amazement. The orgasm-activated growth of the black cream seems to have inflated your balls to colossal levels. Your [pc.balls] throb with the bloated mass of their swollen enlargement.");
							if(!pc.hasPerk("'Nuki Nuts")) kGAMECLASS.output(" And unlike kui-tan testes, these don’t shrink back down.");
							else kGAMECLASS.output(" You’re not sure how long it’s going to take to get these monsters back down!");
							kGAMECLASS.output("\n\n");
							if(pc.isCrotchExposed()) kGAMECLASS.output("Standing up");
							else kGAMECLASS.output("Barely squeezing back into your [pc.lowerGarments]");
							kGAMECLASS.output(", you take a deep breath to steady yourself. As tempting as it may be, you can’t just sit around playing with your massive balls forever!");
							
							break;
					}
					
					clearMenu();
					addButton(0, "Next", kGAMECLASS.useItemFunction);
					return;
				}
			}
		}

		// Overload Bad End
		public static function sumaBadEnd(response:String = "none"):void
		{
			clearOutput();
			author("Adjatha");
			
			var pc:Creature = kGAMECLASS.pc;
			
			switch (response)
			{
				// [Get Help]
				case "help":
					kGAMECLASS.showName("MEDICAL\nATTENTION");
					kGAMECLASS.output("No orgasm is worth this kind of a risk, you decide, and as quickly as your [pc.balls] will allow, you rush to the nearest medical facility. The Nursedroid on hand runs a quick diagnostic, but the source of your mounting anxiety is plainly focused on the swelling growth focused on your over-creamed testicles. The droid spits out some gibberish about a cascading interaction between the Suma Cream and your microsurgeon-boosted immune system. Whatever the issue is, you tell the medic to take care of it.");
					kGAMECLASS.output("\n\nYou’re put under for the operation and when you awaken, your mouth has a coppery tang in it and your head feels stuffed with ausar fluff. Your muscles are sluggish and unresponsive from the anaesthesia. <i>“Mirror,”</i> you mutter, weakly.");
					kGAMECLASS.output("\n\nThe nursedroid at your side affects an apologetic tone. <i>“" + pc.mf("Sir", "Madam") + ", you must understand - the nerves were completely saturated...”</i> You cut her off before she can launch into a torrent of medical jargon.");
					kGAMECLASS.output("\n\n<i>“Mirror!”</i> you demand with surprising heat as your body gradually regains feeling. The physician hands you a small square of silvered glass and you wrap strengthening fingers around it to investigate your body. A groan rises from your chest as you see that your testicles are gone.");
					kGAMECLASS.output("\n\n<i>“This isn’t Terra,”</i> the droid whines, <i>“look at what I have to work with...”</i> you cut her off again by slamming the mirror down on a nearby tray, the mirror shattering. Pulling yourself unsteadily to your feet, you stagger off the operating table and weakly step away.");
					kGAMECLASS.output("\n\nYour best efforts to give yourself huge, thick balls ended with nothing but smooth skin below your [pc.cocksLight]. It’s so ridiculous, you can’t help but laugh.");
					
					kGAMECLASS.processTime((11 * 60) + rand(60));
					
					// {player loses their balls, lust resets to 0, energy drops to 1. They are moved to the nearest nursedroid or, if a droid is not on the current world, back to their ship.}
					
					pc.removeBalls();
					pc.lust(0, true);
					if(pc.energy() > 1) pc.energy(-(pc.energy() - 1));
					
					kGAMECLASS.currentLocation = kGAMECLASS.nearestMedicalCenter("SHIP INTERIOR");
					kGAMECLASS.generateMap();
					
					clearMenu();
					addButton(0, "Next", kGAMECLASS.mainGameMenu);
					break;
				// [Let em Grow]
				case "grow":
					kGAMECLASS.showName("SIDE\nEFFECTS");
					kGAMECLASS.output("You’re not one to run off at a little body morphing. With a defiant jut of your jaw, you find a private retreat and remove your [pc.gear] to better enjoy the show. For once, the Suma Cream isn’t accompanied by any unusual side effects. The balm simply swells your [pc.balls], exactly as it’s supposed to. Delighted by the turgid inflation, you casually stroke your [pc.cocks], getting off as much on the show as on your gleeful pumping strokes.");
					if(pc.hasBreasts()) kGAMECLASS.output(" You give your [pc.nipples] a pinch, tweaking your [pc.breasts] enough to add fresh heat to the rapture of your tingling [pc.skinFurScales].");
					kGAMECLASS.output("\n\nYour swollen spheres have already gained two inches and are still growing as your first orgasm begins building in your gut. Using both hands to squeeze your [pc.cockBiggest] to its sweltering climax, you rock your [pc.hips], bloated balls slapping your [pc.thighs] as your body tenses. The orgasm hits and you clench your eyes in rapture as your muscles spasm and clench, fingertips prickling with the intensity of your feverish release.");
					kGAMECLASS.output("\n\nYou stand, trembling for a moment before you notice something’s off. You open your eyes, mid-release and find that nothing is actually coming out of your [pc.cockHeadBiggest]. The distended tip twitches and throbs in the throes of ecstasy, but there is no cum! You blink, trying to focus through the orgasm and glance down. Your balls have gained another four inches, the orbs hanging heavily and yet still churning. You’ve heard of shooting blanks, but this is absurd.");
					kGAMECLASS.output("\n\nFiguring the first take was just the latest in J’ejune’s weird side effects, you resolve to keep pumping until that [pc.cumColor] spunk finds its way out of your inflating body. Wrapping your fingers around the swollen cumvein of your tender member");
					if(pc.cockTotal() != 1) kGAMECLASS.output("s");
					kGAMECLASS.output(", you renew your masturbation, reaching another");
					if(pc.hasToes()) kGAMECLASS.output(" toe curling");
					else if(pc.isNaga()) kGAMECLASS.output(" tail curling");
					kGAMECLASS.output(" climax and yet there is no release. Your too-tender nuts billow out across the ground, so large that they obscure the entirety of your lower body and yet they still refuse to surrender their precious seed.");
					
					kGAMECLASS.processTime(15 + rand(8));
					if(pc.ballDiameter() < pc.tallness/2) pc.ballSizeRaw = ((pc.tallness/2) * Math.PI);
					pc.ballSizeRaw += 30;
					if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 10;
					pc.lust(50);
					// [Next]
					clearMenu();
					addButton(0, "Next", sumaBadEnd, "growing");
					break;
				case "growing":
					kGAMECLASS.showName("SIDE\nEFFECTS");
					kGAMECLASS.output("Frustration mixed with a lingering lust drives you onward, even past the normal point of exhaustion. A half dozen false peaks leave you spent, sweating, and sore. But, despite all this, no [pc.cumVisc] spoo is forthcoming. Your balls continue their unchecked growth, now beginning to ache from the pent-up gallons. The wobbling flesh boulders have swept you off the ground, your [pc.legOrLegs] and [pc.butt] resting atop the pliant [pc.skinFurScales] of your tremendous testes.");
					kGAMECLASS.output("\n\nThe weight of your body against your balls should, by all rights, leave you in agony, but they’re far too massive to be inconvenienced by something as slight as your [pc.height] frame. The pressure actually feels more pleasurable than it ought to and you find that squirming atop your titanic balls is enough to provoke another phantom orgasm, even without touching your [pc.cocks]. It’s just as well, you’re too tired to keep pumping. Surrendering to the cascade of juiceless spasms that accompany your impotent peaks, time seems to lose all meaning. Minutes, hours pass while you writhe atop an ever expanding pouch as large now as a speeder.");
					kGAMECLASS.output("\n\nYour mind wanders amid the lusty haze that threatens to obliterate your capacity for higher thought and a vague idea floats into your head. Reaching an arm down, you snake your fingers around to your [pc.pussyOrAsshole]. You’ve been so focused on your [pc.cocks] and tapping the glutted bounty of your over-fattened sack, that you’d nearly forgotten the rest of your body entirely! Fingertips dancing around fleshy inlet to your inner depths, you waste no time before inserting one finger and then another. The too-tense pressure of your globes eases off for a moment as fresh bliss weaves up your spine.");
					kGAMECLASS.output("\n\nWith the pressure removed, your long-delayed discharge finally peaks. The sore girth of your [pc.cocks] flood");
					if(pc.cockTotal() != 1) kGAMECLASS.output("s");
					kGAMECLASS.output(" with the soothing, [pc.cumVisc] cum that geysers from your enfeebled frame. Jets of [pc.cumColor] slime lance into the air and showers down like the venting of a freshly tapped derrick. Thick globs of [pc.cumGem] glaze your [pc.skinFurScales] with a dripping, glistening veneer more suited to an Ultra Porn star than to a corporate " + pc.mf("heir", "heiress") + ". You’re far too blissed out to care, however, and simply enjoy the torrential orgasm, layer by layer buried under the slimy avalanche of your unchecked release. Equally unbridled, your balls continue their catastrophic growth, swelling yet further at the fountaining climax rather than deflating. The growth overtakes the pile of your stripped [pc.gear], rolling over your CODEX and cracking the small tablet beneath you with a muffled snap that completely fails to register through your smothering serenity.");
					
					kGAMECLASS.processTime(30 + rand(16));
					if(pc.ballDiameter() < pc.tallness) pc.ballSizeRaw = (pc.tallness * Math.PI);
					pc.ballSizeRaw += 12;
					if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 4;
					pc.lust(50);
					// [Next]
					clearMenu();
					addButton(0, "Next", sumaBadEnd, "bad end");
					break;
				case "bad end":
					kGAMECLASS.currentLocation = "GAME OVER";
					kGAMECLASS.generateMap();
					kGAMECLASS.showLocationName();
					
					kGAMECLASS.showName("CREAM\nFILLED!");
					kGAMECLASS.output("When someone finally does come for you, you’re too far gone. Every slight touch brings on another orgasm, and every climax swells your balls to ever larger sizes. Steele Tech brings in everything they can to help, but nothing seems to alter your oversaturated, cream-filled body. Estrobloom and Tittyblossom shrink your monumental balls only slightly before they swell back up again, your [pc.cocks] spouting out thick gallons of [pc.cum]. Exotic solutions like Uthra sap is imported from the galactic rim, but nothing can hinder your over-productive bounty. Reluctantly, the decision comes down: you’re in no state to take over Steele Tech.");
					kGAMECLASS.output("\n\nYour cousin sends a sympathetic though obviously gloating message, assuring you that you’ll be very well provided for. You can even help your father’s company, the note assures you. For one, Steele Tech has a very good case against J’ejune Pharmaceuticals. The lawyers think they can get so much that the suit should put the beauty products mogul under for good. So at least you’ll have some measure of justice.");
					kGAMECLASS.output("\n\nPlus, the note goes on, the limitless spunk factories that immobilize you will be helpful in providing a steady stream of raw genetic material. Other companies like Xenogen will pay top dollar for such plentiful samples and maybe - one day - they’ll reverse engineer something to fix your condition. In the meantime, a special ship-sized cockmilker is in production, just for you.");
					kGAMECLASS.output("\n\nYou feel like you should be more upset than you are, but honestly, you’re really looking forward to that milker. The thought of endless gallons being pumped out of your room-sized testes is enough to send you into another lusty haze.");
					
					kGAMECLASS.days += 20 + rand(11);
					kGAMECLASS.hours = rand(24);
					kGAMECLASS.processTime(rand(60));
					pc.ballSizeRaw += ((360 * Math.PI) + rand(240));
					if(pc.hasPerk("Bulgy")) pc.ballSizeRaw *= 1.25;
					pc.createStatusEffect("Endowment Immobilized", 0,0,0,0,false,"Icon_Poison", "Your endowments prevent you from moving.", false, 0);
					pc.lust(50);
					
					// [GAME OVER]
					kGAMECLASS.badEnd();
					break;
			}
		}
	}
}

