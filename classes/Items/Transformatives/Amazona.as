package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.rand;
	import classes.StorageClass;
	
	public class Amazona extends ItemSlotClass
	{
		public function Amazona()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Amazona";
			longName = "Amazona Iced Tea";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a can of Amazona Iced Tea";
			tooltip = "";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "";
			
			basePrice = 3000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				output("You drink the can to no effect.");
			}
			else
			{
				output(target.capitalA + target.short + " drinks the can to no effect.");
			}
			return false;
		}
		
		/*
		
		Amazona Iced Tea
		By QuestyRobo
		
		Summary
		•	Amazona Iced Tea is a TF item produced by JoyCo that focuses on turning the user into a large, fit, and to varying degrees, busty amazon.
		•	Comes in four flavors; Classic, Lite, Plus, and Futazona
		•	Is distributed by your local JoyCo™ Vending Machine
		
		*/
		
		public static function amazonaEffects(target:Creature, canType:String = "none"):void
		{
			if(canType == "futazona")
			{
				futazonaEffects(target);
				return;
			}
			
			clearOutput();
			kGAMECLASS.showName("AMAZONA\nICED TEA");
			author("QuestyRobo");
			
			switch(canType)
			{
				case "classic":
					if(timeDrinkAmazona("classic") <= 0)
					{
						output("You pop open the pull-tab with a satisfying click, letting out an aroma of " + (kGAMECLASS.silly ? "... pussy juice and fruit? Well, what were you expecting from a name like that?" : "sweet grapefruit.") + " You take a swig of the drink and the flavor hits you like a freighter.");
						if(kGAMECLASS.silly)
						{
							output(" The combination works almost too well,");
							if(InCollection(target.girlCumType, [GLOBAL.FLUID_TYPE_FRUIT_CUM, GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM])) output(" as you’d hope, it’s just as, if not more sweet than your own juices.");
							else output(" it’s like you’re eating out some sort of plant woman, and you can’t get enough!");
						}
						else output(" It tastes like the sweetest, freshest, most succulent grapefruit you’ve ever had!");
						output(" By the time you get over the taste, the can is empty. A few seconds of nothing passes, making you think that it might have been a dud. Just when you start considering filing a complaint, a delightful surge of power goes through your body. You crush the can in your hand and toss it aside as you feel your body change.");
					}
					else output("Bottoms up! You pop open the can and start chugging the contents. You know by this point there’s no way you’d stop yourself from downing the whole thing anyway. You crush the can and toss it aside, eagerly awaiting your next dose of growth.");
					break;
				case "lite":
					if(timeDrinkAmazona("lite") <= 0)
					{
						output("You pop open the pull-tab with a satisfying click, letting out an aroma of sweet lime. You take a swig of the drink and the flavor hits you like a freighter.");
						if(kGAMECLASS.silly) output(" The name seemed weird to you at first, but now you realize that this stuff is so good that it should be a crime!");
						output(" A thick, sweet lime flavor washes over your mouth, bathing your taste buds in bliss. Unfortunately the can is small, and you finish it quickly. You crush the can and toss it aside in disappointment, only to be reminded of your real reason for paying 3000 credits for a can of iced tea a short while later, when delightful shudders surge through your body, signaling the start of the changes.");
					}
					else output("For how much you paid for this, you really wish they gave you more. You realize that the drink itself isn’t really the point, but still. You chug down the can in a second, savoring the brief blast of flavor before discarding it as the changes start.");
					break;
				case "plus":
					if(timeDrinkAmazona("plus") <= 0)
					{
						output("You twist off the cap to little excitement. A cursory sniff yields only a faint hint of watermelon. You take a small sip and reel back from the shock. Sweet shit this stuff is strong! The shock of it makes you reflexively want to spit it out, but it’s so good that you can’t pry your lips from the bottle. You feel like a " + target.mf("man", "woman") + " possessed, chugging down the concoction with barely a thought as to why. When the bottle finally runs dry it feels like your sense of time is off by a few seconds, like you passed out briefly. You hazily collect your bearings, until a sudden tightness spreads across your body, signaling that the drink is starting to take effect.");
					}
					else output("You twist off the cap, holding yourself back from just chugging the whole thing right there and then. You sit down, making sure to brace yourself for what’s about to come, and take a sip. As before, your senses return a few seconds later, leaving you hazed and confused. You stare down at the empty bottle for a second, wondering if drinking all of this... whatever it is, is bad for your health. Before you can finish that though, a wave of tightness washes over your body, signaling the start of the changes.");
					break;
			}
			
			tfEffects(target, canType, 4);
			energyGain(target);
			perkGain(target);
			
			drinkAmazona(target, canType);
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
		public static function futazonaEffects(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("FUTAZONA\nICED TEA");
			author("QuestyRobo");
			
			output("A small dial sits on the lid of the thermos, currently set to <i>OFF</i>. It has three other options; Classic, Lite, and Plus, and instructions saying to pick an option and press down on the dial before opening.");
			output("\n\nWhich option do you choose?");
			
			clearMenu();
			addButton(0, "Classic", futazonaUse, [target, "classic"]);
			addButton(1, "Lite", futazonaUse, [target, "lite"]);
			addButton(2, "Plus", futazonaUse, [target, "plus"]);
			addButton(14, "Nevermind", futazonaCancel, target);
			return;
		}
		public static function futazonaUse(arg:Array):void
		{
			var target:Creature = arg[0];
			var canType:String = arg[1];
			
			clearOutput();
			kGAMECLASS.showName("FUTAZONA\nICED TEA");
			author("QuestyRobo");
			
			output("You set it to your desired option and press down. A small clicking noise comes from the cap, and a few seconds later it beeps, signaling that it’s ready to be opened. You twist the cap open and are greeted with the calming scent of hazelnuts. You take a deep sniff of the contents, taking in the nutty aroma and catching a bit of sweetness in there too; must be the honey. You take a sip, the flavor seemingly soaking into every one of your taste buds.");
			// taken one of the other Amazonas:
			if(timeDrinkAmazona() - timeDrinkAmazona("futazona") > 0)
			{
				output(" Unlike the other flavor");
				if
				(	(timeDrinkAmazona("classic") > 0 && timeDrinkAmazona("lite") > 0)
				||	(timeDrinkAmazona("lite") > 0 && timeDrinkAmazona("plus") > 0)
				||	(timeDrinkAmazona("plus") > 0 && timeDrinkAmazona("classic") > 0)
				) output("s");
				output(" you tried, there’s no strong compulsion forcing you to keep drinking. Instead you just calmly sit and drink, all of your problems fading away into the sweet, nutty concoction.");
			}
			else output(" You sit back and just drink, letting the sweet, nutty concoction sweep away all of your troubles.");
			output(" Your whole body feels warm, despite the coldness of the drink. A tingling sensation breaks out all over you as the transformatives once held within go to work on your body.");
			
			tfEffects(target, canType, 3);
			tfFutazonaEffects(target, canType, 2);
			energyGain(target);
			perkGain(target);
			
			drinkAmazona(target, "futazona");
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.useItemFunction);
			return;
		}
		public static function futazonaCancel(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("AMAZONA\nICED TEA");
			author("QuestyRobo");
			
			output("You decide not to open the thermos right now, and stow it away.\n\n");
			
			if (!kGAMECLASS.infiniteItems())
			{
				kGAMECLASS.itemCollect([new Futazona()]);
			}
			else
			{
				clearMenu();
				addButton(0,"Next",kGAMECLASS.useItemFunction);
			}
		}
		
		// Overdose status effect timer and flag counter
		public static function drinkAmazona(target:Creature, canType:String):void
		{
			if(kGAMECLASS.flags["AMAZONA_DRINKS"] == undefined) kGAMECLASS.flags["AMAZONA_DRINKS"] = [0, 0, 0, 0, 0];
			
			target.createStatusEffect("Amazona Uses", 0, 0, 0, 0, true, "", "", false, 0);
			// v1: classic drinks
			// v2: lite drinks
			// v3: plus drinks
			// v4: futazona drinks
			switch(canType)
			{
				case "classic":
					target.addStatusValue("Amazona Uses", 1, 1);
					kGAMECLASS.flags["AMAZONA_DRINKS"][1] += 1;
					break;
				case "lite":
					target.addStatusValue("Amazona Uses", 2, 1);
					kGAMECLASS.flags["AMAZONA_DRINKS"][2] += 1;
					break;
				case "plus":
					target.addStatusValue("Amazona Uses", 3, 1);
					kGAMECLASS.flags["AMAZONA_DRINKS"][3] += 1;
					break;
				case "futazona":
					target.addStatusValue("Amazona Uses", 4, 1);
					kGAMECLASS.flags["AMAZONA_DRINKS"][4] += 1;
					break;
			}
			// per 24 hours
			target.setStatusMinutes("Amazona Uses", 1440);
			// Total drinks
			kGAMECLASS.flags["AMAZONA_DRINKS"][0] += 1;
		}
		// Overdose status effect counter
		public static function amazonaDrinks(target:Creature):Number
		{
			var statusDrinks:StorageClass = target.getStatusEffect("Amazona Uses");
			if(statusDrinks == null) return 0;
			return (statusDrinks.value1 + statusDrinks.value2 + statusDrinks.value3 + statusDrinks.value4);
		}
		public static function timeDrinkAmazona(canType:String = "all"):Number
		{
			if(kGAMECLASS.flags["AMAZONA_DRINKS"] == undefined) return 0;
			
			var nTotal:Number = kGAMECLASS.flags["AMAZONA_DRINKS"][0];
			
			// Flavors drank
			switch(canType)
			{
				case "classic": nTotal = kGAMECLASS.flags["AMAZONA_DRINKS"][1]; break;
				case "lite": nTotal = kGAMECLASS.flags["AMAZONA_DRINKS"][2]; break;
				case "plus": nTotal = kGAMECLASS.flags["AMAZONA_DRINKS"][3]; break;
				case "futazona": nTotal = kGAMECLASS.flags["AMAZONA_DRINKS"][4]; break;
			}
			
			return nTotal;
		}
		
		// Transformations
		// Non Futazona items trigger up to 4 at a time, Futazona triggers up to 5, three from the generic pool, and 2 from its own. Futazona will always trigger 2 TFs from its own pool.
		// All versions are female oriented. All raise femininity to at least 80, all grow a vagina if the pc doesn’t have one.
		public static function tfEffects(target:Creature, canType:String, totalTFs:int = 4):void
		{
			var changes:int = 0;
			var select:int = 0;
			var TFList:Array = [];
			var x:int = 0;
			
			// Femininity change
			if(target.femininity < 80)
			{
				var femUp:int = 5;
				if(target.femininityUnlocked(target.femininity + femUp))
				{
					output(target.modFem(femUp));
				}
				else output("\n\n" + target.femininityLockedMessage());
			}
			// Vagina growth
			// Counted separately from the other triggers, always triggers if the pc doesn’t have a vagina.
			if(!target.hasVagina())
			{
				if(target.createVaginaUnlocked())
				{
					output("\n\nYou feel a sudden pressure building at your crotch. You dip a hand down to the afflicted area, massaging it to try and ease the tension. It’s much warmer than usual, and strangely damp. You think about going to a hospital when the pressure suddenly spikes. Something explodes out of the area you were rubbing, and you find yourself cumming uncontrollably on the spot. Your hand continues its work, but instead of massaging bare skin, <b>your fingers are now knuckle deep in your brand new vagina!</b>");
					output("\n\nYou yank your fingers out, your new orifice still tingling in newborn desire. You make a mental promise to give it a good filling, as you go back to what you were doing.");
					
					target.lust(100);
					target.createVagina();
					target.setNewVaginaValues(0);
					target.orgasm();
				}
				else output("\n\n" + target.createVaginaLockedMessage());
			}
			
			var tallnessMax:Number = 0;
			var tallnessNew:Number = 0;
			var toneMax:Number = 0;
			var toneNew:Number = 0;
			var breastSizeMin:Number = 0;
			var breastSizeMax:Number = 0;
			var breastSizeNew:Number = 0;
			var hipSizeMin:Number = 0;
			var hipSizeMax:Number = 0;
			var hipSizeNew:Number = 0;
			var buttSizeMin:Number = 0;
			var buttSizeMax:Number = 0;
			var buttSizeNew:Number = 0;
			var thicknessMin:Number = 0;
			var thicknessMax:Number = 0;
			var thicknessNew:Number = 0;
			var vIdx:int = 0;
			var wetnessMax:Number = 0;
			var capacityMax:Number = 0;
			var fertilityMax:Number = 0;
			
			// Get item TF limits
			switch(canType)
			{
				// Classic raises the pc’s tallness up to 96, breast size to 15, hip rating up to 10, tone up to 100, and butt rating up to 12, while maintaining (raising if below, lowering if above) thickness at 50. Classic also raises vaginal wetness up to 6, capacity bonus up to 200, and fertility up to 4
				case "classic":
					tallnessMax = 96;
					//breastSizeMin = 15;
					breastSizeMax = 15;
					//hipSizeMin = 10;
					hipSizeMax = 10;
					//buttSizeMin = 12;
					buttSizeMax = 12;
					toneMax = 100;
					thicknessMin = 50;
					thicknessMax = 50;
					wetnessMax = 6;
					capacityMax = 200;
					fertilityMax = 4;
					break;
				// Lite raises the pc’s tallness up to 84, maintains breast size to 5, hip rating to 6, butt rating to 8, thickness to 25, and raises tone up to 75. Lite also raises vaginal wetness up to 4, capacity bonus up to 100, and fertility up to 2
				case "lite":
					tallnessMax = 84;
					breastSizeMin = 5;
					breastSizeMax = 5;
					hipSizeMin = 6;
					hipSizeMax = 6;
					buttSizeMin = 8;
					buttSizeMax = 8;
					toneMax = 75;
					thicknessMin = 25;
					thicknessMax = 25;
					wetnessMax = 4;
					capacityMax = 100;
					fertilityMax = 2;
					break;
				// Plus raises the pc’s tallness up to 120, breast size up to 24, hip rating up to 15, butt rating up to 16, thickness up to 75, and tone up to 100. Plus also raises vaginal wetness up to 8, capacity bonus up to 500, and fertility up to 8
				case "plus":
					tallnessMax = 120;
					breastSizeMax = 24;
					hipSizeMax = 15;
					buttSizeMax = 16;
					toneMax = 100;
					thicknessMax = 75;
					wetnessMax = 8;
					capacityMax = 500;
					fertilityMax = 8;
					break;
			}
			
			// Growing
			if(breastSizeMax != 0 && target.breastRows[0].breastRatingRaw < breastSizeMax) TFList.push(1);
			if(tallnessMax != 0 && target.tallness < tallnessMax) TFList.push(2);
			if(toneMax != 0 && target.tone < toneMax) TFList.push(3);
			if(thicknessMax != 0 && target.thickness < thicknessMax) TFList.push(4);
			if(hipSizeMax != 0 && target.hipRatingRaw < hipSizeMax) TFList.push(5);
			if(buttSizeMax != 0 && target.buttRatingRaw < buttSizeMax) TFList.push(6);
			// All vagina-based TFs have a lower priority compared to the others.
			if(target.hasVagina())
			{
				if(wetnessMax != 0 && target.driestVaginalWetness(true) < wetnessMax && rand(4) == 0) TFList.push(7);
				if(capacityMax != 0 && target.vaginas[target.smallestVaginaIndex()].bonusCapacity < capacityMax && rand(4) == 0) TFList.push(8);
				if(fertilityMax != 0 && target.fertility() > 0 && target.fertilityRaw < fertilityMax && rand(4) == 0) TFList.push(9);
			}
			// Shrinking
			if(breastSizeMin != 0 && target.breastRows[0].breastRatingRaw > breastSizeMin) TFList.push(10);
			if(hipSizeMin != 0 && target.hipRatingRaw > hipSizeMin) TFList.push(11);
			if(buttSizeMin != 0 && target.buttRatingRaw > buttSizeMin) TFList.push(12);
			if(thicknessMin != 0 && target.thickness > thicknessMin) TFList.push(13);
			
			if(TFList.length <= 0)
			{
				output("\n\nYou wait and wait, but nothing in particular happens... Looks like you’re as amazonian as you can get with this drink!");
				return;
			}
			
			while(TFList.length > 0 && totalTFs > 0)
			{
				x = rand(TFList.length);
				select = TFList[x];
				TFList.splice(x,1);
				
				if(select == 0)
				{
					output("\n\nYou wait and wait, but nothing in particular happens... Looks like the drink was a dud!");
				}
				// Breast growth
				// Lite grows by 1-3 rankings, Classic by 2-4, Plus by 3-5
				if(select == 1)
				{
					var bustUp:int = 1 + rand(3);
					if(canType == "classic") bustUp += 1;
					if(canType == "plus") bustUp += 2;
					breastSizeNew = target.breastRows[0].breastRatingRaw + bustUp;
					if(breastSizeMax != 0 && breastSizeNew > breastSizeMax) breastSizeNew = breastSizeMax;
					if(target.breastRatingUnlocked(0, breastSizeNew))
					{
						output("\n\nA delicious heat washes over your [pc.chest], turning your [pc.nipples] diamond hard. You reach");
						if(!target.isChestExposed()) output(" into your [pc.upperGarment],");
						else output(" for your chest,");
						output(" grabbing and kneading at your flesh in order to enhance the sensations. There’s a strange pressure pushing back at your hands, and when you look down, you see your tit-flesh expanding, pushing back against you. You revel in the sensations of your growing breasts as you continue to grope yourself, stopping just shy of giving yourself a boobgasm. You pry your hands off and allow yourself to just sit and admire how your newly enhanced bosom");
						if(!target.isChestExposed()) output(" stretches your [pc.upperGarments]");
						else output("hangs from your bare form");
						output(".");
						
						target.breastRows[0].breastRatingRaw = breastSizeNew;
						target.lust(10);
					}
					else output("\n\n" + target.breastRatingLockedMessage());
				}
				// Tallness increase
				// Lite grows by 2-3, Classic by 3-4, Plus by 4-5
				if(select == 2)
				{
					var heightUp:int = 2 + rand(2);
					if(canType == "classic") heightUp += 1;
					if(canType == "plus") heightUp += 2;
					tallnessNew = target.tallness + heightUp;
					if(tallnessMax != 0 && tallnessNew > tallnessMax) tallnessNew = tallnessMax;
					if(target.tallnessUnlocked(tallnessNew))
					{
						output("\n\nA sudden wave of nausea overtakes you, making you feel very dizzy. You balance yourself against a nearby wall, staring downward as you wait for the sickening feeling to pass. You’re so lightheaded that it seems like the ground is getting further away from you; was that a bad batch, or are you having some kind of allergic reaction? The sickness fades after a few seconds, but the feeling of being higher up does not. Confused, you stand back up straight and find that you have actually grown a few inches taller!");
						
						target.tallness = tallnessNew;
					}
					else output("\n\n" + target.tallnessLockedMessage());
				}
				// Tone increase
				// Lite grows by 3-5, Classic by 4-6, Plus by 5-7
				if(select == 3)
				{
					var buffUp:int = 3 + rand(3);
					if(canType == "classic") buffUp += 1;
					if(canType == "plus") buffUp += 2;
					toneNew = target.tone + buffUp;
					if(toneMax != 0 && toneNew > toneMax) toneNew = toneMax;
					if(target.toneUnlocked(toneNew))
					{
						output("\n\nYour muscles are filled with a sense of power; each move is almost sensual in how good it feels. You throw out a few jabs and kicks, just to feel your muscles work and stretch. A sublime tightness takes hold of you, molding and smoothing away any fat or imperfections, slowly giving you the adonis-like figure promised on the label. The feeling stops, leaving you satisfied and noticeably more toned.");
						
						target.tone = toneNew;
						target.lust(5);
						
						if(target.tone >= 50) output(" Damn, looking ripped!");
					}
					else output("\n\n" + target.toneLockedMessage());
				}
				// Getting down with the thickness (Thickness increase)
				// Lite grows by 1-2, Classic by 2-3, Plus by 4-5
				if(select == 4)
				{
					var bulkUp:int = 1 + rand(2);
					if(canType == "classic") bulkUp += 1;
					if(canType == "plus") bulkUp += 3;
					thicknessNew = target.thickness + bulkUp;
					if(thicknessMax != 0 && thicknessNew > thicknessMax) thicknessNew = thicknessMax;
					if(target.thicknessUnlocked(thicknessNew))
					{
						output("\n\nYour body feels delightfully plush all of a sudden. You close your eyes and take a minute just to bask in the feeling, only snapping out of your relaxed stupor when you feel a weight settle on yourself. You open your eyes and see that your body has widened");
						if(canType == "lite" || canType == "classic") output(" slightly");
						if(canType == "plus") output(" considerably");
						output(". The plush feeling rises to a fever pitch as you explore your newly broadened frame, but where ever your hands roam the feeling soon dissipates. You stop groping yourself before you go too far, still feeling small tingles of arousal as your body comes down off of it’s transformative high.");
						
						target.thickness = thicknessNew;
						target.lust(10);
						
						if(target.thickness >= 50) output(" Damn, getting pretty " + (kGAMECLASS.silly ? "thicc" : "built") + ".");
					}
					else output("\n\n" + target.thicknessLockedMessage());
				}
				// Hip expansion
				// Lite grows by 1, Classic by 2, Plus by 3
				if(select == 5)
				{
					var hipUp:int = 1;
					if(canType == "classic") hipUp += 1;
					if(canType == "plus") hipUp += 2;
					hipSizeNew = target.hipRatingRaw + hipUp;
					if(hipSizeMax != 0 && hipSizeNew > hipSizeMax) hipSizeNew = hipSizeMax;
					if(target.hipRatingUnlocked(hipSizeNew))
					{
						output("\n\nYour legs feel very heavy all of a sudden; you look down to see your hips widening, pushing your stance wider to make room. The growth stops almost as soon as it began. Huh, a little underwhelming, but at least you’ve got some more curves.");
						
						target.hipRatingRaw = hipSizeNew;
					}
					else output("\n\n" + target.hipRatingLockedMessage());
				}
				// Ass expansion
				// Lite grows by 1, Classic by 2, Plus by 3
				if(select == 6)
				{
					var bootyUp:int = 1;
					if(canType == "classic") bootyUp += 1;
					if(canType == "plus") bootyUp += 2;
					buttSizeNew = target.buttRatingRaw + bootyUp;
					if(buttSizeMax != 0 && buttSizeNew > buttSizeMax) buttSizeNew = buttSizeMax;
					if(target.buttRatingUnlocked(buttSizeNew))
					{
						output("\n\nA heaviness sets over your [pc.ass], and you know exactly what that means. You reach around and grab your heiny, just in time to feel it fill out. It grows in your hands,");
						if(!target.isAssExposed()) output(" stretching out your [pc.lowerGarments] as it fills out.");
						else output(" hanging heavier with each passing second.");
						output(" The growth stops after a few seconds, leaving you holding ordinary, non-growing assflesh. You give your newly embiggened cheeks a light slap as you get on your way.");
						
						target.buttRatingRaw = buttSizeNew;
						target.lust(5);
					}
					else output("\n\n" + target.buttRatingLockedMessage());
				}
				// Wetness increase
				// Increases by 1
				if(select == 7)
				{
					vIdx = target.driestVaginaIndex(true);
					if(target.wetnessUnlocked(vIdx, target.vaginas[vIdx].wetnessRaw + 1))
					{
						output("\n\nYou feel an unnatural dampness in your [pc.pussy " + vIdx + "]; you");
						if(target.exhibitionism() < 33) output(" find a quiet corner and");
						output(" reach down to see what happened. Indeed, you feel an abnormal amount of [pc.girlCum] leaking out of you. Try as you might, you cannot seem to stem the tide. Looks like things are going to be a bit more moist from now on.");
						
						target.vaginas[vIdx].wetnessRaw += 1;
						
						if(target.isSquirter()) output(" You should really think about getting waterproof panties.");
					}
					else output("\n\n" + target.wetnessLockedMessage());
				}
				// Capacity increase
				// Increases by 10
				if(select == 8)
				{
					vIdx = target.smallestVaginaIndex();
					
					output("\n\nA strange tingling wells up in your [pc.pussy " + vIdx + "], stopping almost as soon as it started. You make sure");
					if(target.exhibitionism() < 66) output(" no one");
					else output(" someone");
					output(" is looking, and dip a finger into your honeypot. You find nothing out of the ordinary, until you start to press against your inner-walls. They stretch out a good bit further than you’ve ever felt them; they’re definitely more pliant now.");
					
					target.vaginas[vIdx].bonusCapacity += 1;
				}
				// Fertility
				// Increases by 1
				// Does not trigger if pc is sterile
				if(select == 9)
				{
					output("\n\nYou feel a small rumbling deep in your gut; reaching a hand down to your stomach reveals nothing, it seems to be coming from further down. Moving your hand further South, you eventually reach the area around your womb, at which point the rumbling turns into a full-body shudder before dissipating. A strange feeling washes over your womb, some sense of fullness or potency that wasn’t there before; it feels like your reproductive organs are working just a bit harder now.");
					
					target.fertilityRaw += 1;
				}
				// Breast shrinking
				// Decreases by 2-4 for Lite
				if(select == 10)
				{
					var bustDown:int = 1;
					if(canType == "lite") bustDown += 1 + rand(3);
					breastSizeNew = target.breastRows[0].breastRatingRaw - bustDown;
					if(breastSizeMin != 0 && breastSizeNew < breastSizeMin) breastSizeNew = breastSizeMin;
					if(breastSizeNew < 1) breastSizeNew = 1;
					if(target.breastRatingUnlocked(0, breastSizeNew))
					{
						output("\n\nYou feel a stirring in your bosom. You reach to check what’s wrong and are surprised when your [pc.breasts] seem to retreat from your hands, growing smaller by the second. When it’s done, you’re left with a much less impressive bust; on the plus side it’s much easier to run with all of that weight off your chest.");
						
						target.breastRows[0].breastRatingRaw = breastSizeNew;
					}
					else output("\n\n" + target.breastRatingLockedMessage());
				}
				// Hip shrinking
				// Decreases by 1-2 for Lite
				if(select == 11)
				{
					var hipDown:int = 1;
					if(canType == "lite") hipDown += rand(2);
					hipSizeNew = target.hipRatingRaw - hipDown;
					if(hipSizeMin != 0 && hipSizeNew < hipSizeMin) hipSizeNew = hipSizeMin;
					if(hipSizeNew < 0) hipSizeNew = 0;
					if(target.hipRatingUnlocked(hipSizeNew))
					{
						output("\n\nYour stride feels narrower than it was just a few seconds ago. Looking down, your [pc.hips] seem to have thinned quite considerably.");
						
						target.hipRatingRaw = hipSizeNew;
					}
					else output("\n\n" + target.hipRatingLockedMessage());
				}
				// Ass shrinkage
				// Decreases by 1-2 for Lite
				if(select == 12)
				{
					var bootyDown:int = 1;
					if(canType == "classic") bootyDown += rand(2);
					buttSizeNew = target.buttRatingRaw - bootyDown;
					if(buttSizeMin != 0 && buttSizeNew < buttSizeMin) buttSizeNew = buttSizeMin;
					if(buttSizeNew < 0) buttSizeNew = 0;
					if(target.buttRatingUnlocked(buttSizeNew))
					{
						output("\n\nYour [pc.ass] is tingling; a few soft pats reveal that, indeed, there’s less cushion back there for the pushin’.");
						
						target.buttRatingRaw = buttSizeNew;
					}
					else output("\n\n" + target.buttRatingLockedMessage());
				}
				// Gettin’ rid of the thickness (thickness decrease)
				// Decreases by 1-3 for Classic, 3-5 for Lite
				if(select == 13)
				{
					var thinUp:int = 1 + rand(3);
					if(canType == "lite") thinUp += 2;
					thicknessNew = target.thickness + thinUp;
					if(thicknessMin != 0 && thicknessNew < thicknessMin) thicknessNew = thicknessMin;
					if(thicknessNew < 0) thicknessNew = 0;
					if(target.thicknessUnlocked(thicknessNew))
					{
						output("\n\nYou feel a sudden sense of lightness, like you could break out into a sprint and be carried along by an afternoon breeze. Looking yourself over, you see your whole frame shrinking, toning down into the kind of lean body that most athletes would have wet dreams about.");
						
						target.thickness = thicknessNew;
					}
					else output("\n\n" + target.thicknessLockedMessage());
				}
				
				totalTFs--;
			}
		}
		public static function tfFutazonaEffects(target:Creature, canType:String, totalTFs:int = 2):void
		{
			// Penis and ball growth
			// Will always trigger if the pc has a vagina and no dick
			// Does not count against the TF count
			// Grows a penis that is appropriate for your current race (dog for Ausar, cat for Kaithrit, etc)
			// Lite gives a thickness ratio of 0.9, Classic gives 1, Plus gives 1.1
			if(target.hasVagina() && !target.hasCock())
			{
				if(target.createCockUnlocked())
				{
					output("\n\nYou suddenly double over, racked with a dull pain that seems to be creeping all over your body. You fight through it to regain your balance, only to be knocked flat on your ass when it suddenly rushes down to your crotch.");
					if(!target.isCrotchExposed()) output(" You tear off your [pc.lowerGarments] frantically, the confinement only exacerbating the pain.");
					else output(" You thank the stars that you’re wearing nothing down there that could potentially obscure what’s happening.");
					output(" The pain rises to a peak before suddenly shifting. You can’t place it at first, your crotch feels like a white hot ball of over-stimulated nerves; almost unsure of what it should be experiencing. Eventually the sensation settles, and only one word comes to your mind: pleasure. White hot pleasure that seizes every neuron in your brain and demands that they all pay attention.");
					output("\n\nYou knead at the afflicted area. It feels better than masturbating ever has, and the feeling only seems to be getting stronger. As the sensation progresses you notice that you’re touching more flesh than usual; indeed the area appears to be swelling. You panic, wondering what this strange growth is, but are unable to pry your hands away. You’re a passenger in your own body as the swelling gets worse and worse, until it stops.");
					
					target.lust(100);
					target.createCock();
					target.setNewCockValues(0);
					if(target.hasPerk("Hung")) target.cocks[0].cLengthRaw *= 1.25;
					if(target.hasPerk("Mini")) target.cocks[0].cLengthRaw *= 0.75;
					switch(canType)
					{
						case "lite": target.cocks[0].cThicknessRatioRaw *= 0.9; break;
						case "classic": target.cocks[0].cThicknessRatioRaw *= 1; break;
						case "plus": target.cocks[0].cThicknessRatioRaw *= 1.1; break;
					}
					
					output("\n\nAs it stops it also goes numb, allowing you to pull your body back from the edge of mindless pleasure. You sit and observe the growth, beet red and undulating heavily. You start to think about rushing to a hospital, when blinding pleasure overtakes you once again. The growth bursts forward with amazing speed, quickly forming into a thinner, more phallic shape. Pressure builds as it takes on its final metamorphosis, defining into the recognizable shape of a " + Math.floor(target.cLength(0)) + "-inch [pc.cock]. You stroke your newborn shaft, desperately seeking release");
					if(target.balls >= 2) output("... and boy does it come.");
					else
					{
						output(", but something’s missing. That ‘something’ quickly becomes apparent as another bulge of flesh settles under it, quickly forming into a defined sack with two bloated");
						
						target.balls = 2;
						if(target.ballSizeRaw < 3)
						{
							target.ballSizeRaw = 3;
							if(target.hasPerk("Bulgy")) target.ballSizeRaw += 2;
						}
						if(target.ballDiameter() <= 1) output(", but average sized");
						output(" testes.");
					}
					output("\n\nYou cum and cum, your [pc.vaginas] eagerly joining " + (target.vaginas.length == 1 ? "its" : "their") + " newborn brother in celebration. You paint yourself white, your new cock erupting like a sprinkler, until your balls feel delightfully drained. You groan and rise to your feet, too blissfully sated to care about the messy state you’re in; you can shower later.");
					if(!target.isCrotchExposed()) output(" You find your discarded clothing and put it back on, with no shortage of issues thanks to your new addition.");
					
					target.orgasm();
					target.orgasm();
					kGAMECLASS.applyCumSoaked(target);
				}
				else output("\n\n" + target.createCockLockedMessage());
			}
			
			var cIdx:int = 0;
			var cockLengthMax:Number = 0;
			var ballSizeMax:Number = 0;
			var refractoryMax:Number = 0;
			
			// Get item TF limits
			switch(canType)
			{
				// Futazona allows you to pick from any of the above effects, and also adds a penis and/or balls. Penis goes up to 10 inches for Lite, 14 for Classic, and 18 for Plus(add 2 inches to each max for Hung). Balls go up to 5 for Lite, 10 for Classic, and 15 for Plus(add 3 inches to each max for Bulgy). Refractory rate goes up to 15 for Lite, 30 for Classic, and 45 for Plus.
				case "classic":
					cockLengthMax = 14;
					ballSizeMax = 10;
					refractoryMax = 30;
					break;
				case "lite":
					cockLengthMax = 10;
					ballSizeMax = 5;
					refractoryMax = 15;
					break;
				case "plus":
					cockLengthMax = 18;
					ballSizeMax = 15;
					refractoryMax = 45;
					break;
			}
			
			if(target.hasCock())
			{
				var totalCocks:int = target.cocks.length;
				// Penis growth
				// Increases by 2 inches each dose
				cIdx = target.shortestCockIndex();
				if(cockLengthMax != 0 && target.cocks[cIdx].cLengthRaw < cockLengthMax)
				{
					if(target.cockLengthUnlocked(cIdx, target.cocks[cIdx].cLengthRaw + 2))
					{
						output("\n\nYou feel a tightness in your [pc.cocks], like " + (totalCocks == 1 ? "it’s" : "they are") + " an overly plump");
						if(totalCocks == 2) output(" pair of");
						output(" sausage");
						if(totalCocks != 1) output("s");
						output(" ready to pop out of " + (totalCocks == 1 ? "its" : "their") + " skin.");
						if(!target.isCrotchExposed()) output(" You pull off your [pc.lowerGarments] and your iron rod{s} pop out with such force that " + (totalCocks == 1 ? "it" : "they") + " smack you in the gut.");
						else output(" Strangely, it doesn’t seem like you’re fully erect yet; your dong" + (totalCocks == 1 ? " is" : "s are") + " still quite soft and floppy. A cursory touch quickly changes that, a simple brush along a vein causes a surge of blood to rush into " + (totalCocks == 1 ? "it" : "them") + ", shooting " + (totalCocks == 1 ? "it" : "them") + " to full erectness so fast that " + (totalCocks == 1 ? "it" : "they") + " smack you right in the gut.");
						output("\n\nYou reel back from the impact, quickly grabbing hold of your overly energetic [pc.cocks]. It already feels like there’s a lot more cockmeat there for you to grab, and there’s still more to come. By the time it stops you’ve got about two more inches to your name.");
						
						target.cocks[cIdx].cLengthRaw += 2;
						target.lust(25);
					}
					else output("\n\n" + target.cockLengthLockedMessage());
					
					// Hung bonus
					// Triggers when you max out dick size for the version that you used (you reach 10 inches using Lite, etc)
					// Increases by 2
					if(target.hasPerk("Hung"))
					{
						if(target.cockLengthUnlocked(cIdx, target.cocks[cIdx].cLengthRaw + 2))
						{
							output("\n\nYou start to put your [pc.cocks] away, but it is a little hard with how... well, how hard " + (totalCocks == 1 ? "it is" : "they are") + ". Suddenly a new wave of tightness overtakes " + (totalCocks == 1 ? "it" : "them") + ", sending you tumbling to the ground as the sensation catches you off-guard. Your hand");
							if(totalCocks != 1) output("s");
							output(" move on " + (totalCocks == 1 ? "it" : "their") + " own, caught up in the overwhelming sensation of growth. Your shaft");
							if(totalCocks != 1) output("s");
							output(" grow with renewed vigor, spreading your fingers apart as " + (totalCocks == 1 ? "it sprouts" : "they sprout") + " out of you, getting fatter and longer by the second. You cum just as " + (totalCocks == 1 ? "it finishes" : "they finish") + ", painting yourself [pc.cumColor] with the copious release.");
							output("\n\nYou get up with a groan, taking stock of what just happened. Your [pc.cocks] " + (totalCocks == 1 ? "is" : "are") + " still iron hard, and seem");
							if(totalCocks == 1) output("s");
							output(" to have grown another two inches.");
							if(!target.isCrotchExposed()) output(" You shove them back into your [pc.underGarments], having more important things to do than jerk off all day, as nice as that would be.");
							else output(" You sigh at your erect state; a lack of pants is going to make getting around a bit awkward for the next few minutes.");
							
							target.cocks[cIdx].cLengthRaw += 2;
							target.lust(100);
							target.orgasm();
							kGAMECLASS.applyCumSoaked(target);
						}
						else output("\n\n" + target.cockLengthLockedMessage());
					}
				}
				// Ball growth
				// Increases by 2
				if(ballSizeMax != 0 && target.balls > 0 && target.ballSizeRaw < ballSizeMax)
				{
					output("\n\nThere’s a pleasant throbbing in your [pc.sack], like a constant, weak orgasm. You reach down and knead at it");
					if(!target.isCrotchExposed()) output(" through your [pc.lowerGarments]");
					output(", enhancing the pleasant sensations, until your " + (target.balls == 1 ? "teste starts" : "testes start") + " pulsing rapidly. The sensation only make you squeeze harder, letting you feel how " + (target.balls == 1 ? "it seems" : "they seem") + " to grow slightly with each pulse. Your [pc.cocks] " + ( totalCocks == 1 ? "is" : "are") + " rock hard, spraying streams of pre-cum in time with the pulsations. By the time the growth stops, your [pc.balls] " + (target.balls == 1 ? "has" : "have") + " become considerably larger, and your crotch is covered in a thick layer of pre.");
					
					target.ballSizeRaw += 2;
					target.lust(25);
					
					// Bulgy bonus
					// Triggers the same way as the Hung bonus
					// Increases by 3
					if(target.hasPerk("Bulgy"))
					{
						output("\n\nJust when you think it’s over your [pc.balls] " + (target.balls == 1 ? "starts" : "start") + " to shudder once again, growing with frightening speed. You cum on the spot from the sensation, firing off massive gouts of [pc.cum]; but no amount of release seems to drain your constantly swelling testes as they gorge themselves on mutagen. As the growth stops, so too does your orgasm, and with plenty of [pc.cumNoun] left in your newly enhanced sack. You groan and reach down to relieve yourself, but decency kicks you in the teeth and tells you that you’ve made enough of a mess already. You’ll just have to do it after you get cleaned up, or maybe while you’re cleaning up?");
						
						target.ballSizeRaw += 3;
						target.lust(100);
						target.orgasm();
						kGAMECLASS.applyCumSoaked(target);
						target.ballFullness = 100;
					}
				}
				// Refractory rate
				// Increases by 5
				// Low trigger chance
				if(refractoryMax != 0 && target.refractoryRate < refractoryMax && rand(4) == 0)
				{
					output("\n\nYou feel something in your [pc.balls], a sort of increased potency. You can’t be sure, but something is giving you the feeling that your sperm factories just ramped up production.");
					
					target.refractoryRate += 5;
				}
			}
		}
		public static function energyGain(target:Creature):void
		{
			if(target.energyRaw >= target.energyMax()) return;
			// Energy recovery
			// Recovers 50 energy
			// Small lust gain
			// Not counted as a transformation
			output("\n\nA surge of energy rushes through your body, revitalizing every strand of muscle. Damn, you feel like you could run a marathon, and still have the energy to drain some hung stud dry!");
			
			target.energy(50);
			target.lust(5);
		}
		public static function perkGain(target:Creature):void
		{
			if(9999 == 9999 || target.hasPheromones() || amazonaDrinks(target) < 7) return;
			
			// Perk
			if(!target.hasPerk("Jungle Queen Scent"))
			{
				output("\n\n9999");
				
				// Name: Jungle Queen Scent
				// Description: You smell like a mighty queen of the jungle. Boosts tease attacks.
				// Functions like Pheromone Cloud
				output("\n\n(<b>Perk Gained: Jungle Queen Scent</b> - Your body emits pheromones that give you a distinctively commanding scent.)");
				target.createPerk("Jungle Queen Scent", 0, 0, 0, 0, "You smell like a mighty queen of the jungle. Boosts tease attacks.");
			}
		}
	}
}

