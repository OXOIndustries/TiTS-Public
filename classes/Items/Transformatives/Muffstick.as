package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Ordinal;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.GameData.CodexManager;
	import classes.StringUtil;
	import classes.Items.Transformatives.FizzyFix;
	
	public class Muffstick extends ItemSlotClass
	{
		public function Muffstick()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "M.Stick";
			longName = "Muffstick";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a package containing a tube of Muffstick and a FizzyFix pill";
			tooltip = "Created after the surprising success of the Clippex, this recent and popular JoyCo product is designed to reshape one’s pussylips into looking like those of a mouth.\n\nThe product is stored within a small pink box labeled “Muffstick”, written above an oddly playful-looking JoyCo logo, with a kiss mark replacing its usual smile. It looks like a regular metallic tube of lipstick with a see through cork and a wheel at the bottom, used to twist out the micro-surgeon infused compound. Just above the main wheel is a secondary multi-hued one, used to decide which color one wants to dress their muff with. The lipstick is accompanied by a flat gray pill with a red crossed out tongue mark stamped on it and a pamphlet that gives both simple and detailed instructions on how to use the two items.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 4000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// Mouth vaginas - like lipples just on the vagina. 
			// Company: JoyCo
			// Location: Sera
			
			if(target is PlayerCharacter)
			{
				if(!CodexManager.entryUnlocked("Muffstick"))
				{
					clearOutput();
					kGAMECLASS.showName("\nMUFFSTICK");
					author("Shadefalcon");
					output("When you grasp the package, your codex beeps, informing you of extra detail on the item’s history. If you want to learn more about Muffstick before using it, it might be a good idea to.");
					output("\n\nAre you sure you want to continue to use the item?");
					CodexManager.unlockEntry("Muffstick");
					CodexManager.unlockEntry("FizzyFix");
					clearMenu();
					addButton(0, "Yes", useMenu, target);
					addButton(1, "No", rbgCancel, target);
					return true;
				}
				useMenu(target);
				return true;
			}
			else
			{
				clearOutput();
				output(target.capitalA + target.short + " uses the Muffstick tube but to no effect.");
			}
			return false;
		}
		
		private function rbgCancel(target:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nMUFFSTICK");
			author("Shadefalcon");
			
			output("You put the item back into your inventory.\n\n");
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new Muffstick()]);
			else
			{
				clearMenu();
				addButton(0, "Next", kGAMECLASS.useItemFunction);
			}
		}
		
		private function useMenu(target:Creature):void
		{
			if(!target.hasVagina())
			{
				clearOutput();
				kGAMECLASS.showName("\nMUFFSTICK");
				author("Shadefalcon");
				if(rand(2) == 0) output("If you are not mistaken, you’ll need to have a vagina before you can even think of changing it...");
				else output("If you recall correctly, you’ll need to have a vagina to be able to change it...");
				clearMenu();
				addButton(0, "Next", rbgCancel, target);
				return;
			}
			
			clearOutput();
			kGAMECLASS.showName("\nMUFFSTICK");
			author("Shadefalcon");
			
			// Consumption text:
			if(target.exhibitionism() >= 66)
			{
				if(!target.isCrotchExposed()) output("With your folds unaccessible and hidden from sight by your clothing, you remove your [pc.lowerGarments] and lay your [pc.crotch] bare for the whole universe to see. Rather than being afraid or embarrassed, you’re quite thrilled by the prospect of having bystanders discover you and witness the show that will soon begin.");
				else output("Despite your [pc.crotch] being laid bare, brazenly displayed for the whole universe to see, you feel no need to hide yourself. Rather than feeling afraid or embarrassed, you’re quite thrilled by the prospect of having bystanders discover you and witness the show that will soon begin.");
			}
			else
			{
				if(!target.isCrotchExposed()) output("You move to a secluded area where you won’t be seen or interrupted and take off your [pc.lowerGarments], giving you access to your [pc.vaginas].");
				else output("You move to a secluded area where you won’t be seen or interrupted and make sure that your chosen spot is isolated enough to avoid attracting attention should you emit any ‘sounds’.");
			}
			output("\n\nOpening the package, you take out the pamphlet and begin reading through it, finding a short step by step guide for each of the contained items. Afterwards, you remove a tube of Muffstick and FizzyFix pill from the box.");
			output("\n\nAs you stare down at your crotch, you realize that it won’t be easy to apply the lipstick correctly, let alone see the upcoming process. Getting a clear view of one’s own pussy is no simple task after all. Luckily, you’ve got the trusty Codex to help you out. By using its camera-display app, you’re able to see every little detail of your sexual equipment in ultra HD as you position the device a short distance away from you.");
			
			clearMenu();
			addButton(0, "Next", rbgSelColor, [target], "Choose Color", ("Choose a color of lipstick."));
			if(target.isBimbo()) addButton(5, "Like, Next!", rbgSelColor, [target, true], "*Choose Glitter*", ("Like, totally choose a better color of lipstick."));
		}
		private function rbgSelColor(arg:Array):void
		{
			var target:Creature = arg[0];
			var colorList:Array = [];
			var i:int = 0;
			var btnSlot:int = 0;
			
			clearOutput();
			kGAMECLASS.showName("CHOOSE\nCOLORS");
			author("Shadefalcon");
			
			// Second consumption text:
			output("You proceed by turning the Muffstick’s upper wheel a couple of times, allowing you to browse through the variations of colors you can dress your pussy lips with. Amongst the select colors you notice that one is labeled ‘Transparent’; according to the pamphlet, it will allow you to keep your vagina’s current color. Which color will you pick?");
			
			// Standard
			colorList.push(["red", "Red"]);
			colorList.push(["red-orange", "R.Orange"]);
			colorList.push(["orange", "Orange"]);
			colorList.push(["yellow-orange", "Y.Orange"]);
			colorList.push(["yellow", "Yellow"]);
			colorList.push(["yellow-green", "Y.Green"]);
			colorList.push(["green", "Green"]);
			colorList.push(["teal", "Teal"]);
			colorList.push(["cerulean", "Cerulean"]);
			colorList.push(["blue", "Blue"]);
			colorList.push(["indigo", "Indigo"]);
			colorList.push(["purple", "Purple"]);
			colorList.push(["lavender", "Lavender"]);
			colorList.push(["pink", "Pink"]);
			colorList.push(["rose", "Rose"]);
			colorList.push(["peach", "Peach"]);
			colorList.push(["brown", "Brown"]);
			colorList.push(["hazel", "Hazel"]);
			colorList.push(["white", "White"]);
			colorList.push(["black", "Black"]);
			
			// Gemstone
			colorList.push(["crimson", "Crimson"]);
			colorList.push(["garnet", "Garnet"]);
			colorList.push(["ruby", "Ruby"]);
			colorList.push(["citrine", "Citrine"]);
			colorList.push(["topaz", "Topaz"]);
			colorList.push(["amber", "Amber"]);
			colorList.push(["peridot", "Peridot"]);
			colorList.push(["emerald", "Emerald"]);
			colorList.push(["jade", "Jade"]);
			colorList.push(["turquoise", "Turquoise"]);
			colorList.push(["aquamarine", "Aquamarine"]);
			colorList.push(["lapis", "Lapis"]);
			colorList.push(["sapphire", "Sapphire"]);
			colorList.push(["violet", "Violet"]);
			colorList.push(["amethyst", "Amethyst"]);
			colorList.push(["opal", "Opal"]);
			colorList.push(["pearl", "Pearl"]);
			
			// Metallic
			colorList.push(["copper", "Copper"]);
			colorList.push(["silver", "Silver"]);
			colorList.push(["gold", "Gold"]);
			colorList.push(["platinum", "Platinum"]);
			colorList.push(["sable", "Sable"]);
			
			// None
			colorList.push(["null", "Transparent"]);
			
			// Bimbo variants
			if(arg.length > 1)
			{
				var bimboColors:Array = [];
				for(i = 0; i < colorList.length; i++)
				{
					if(colorList[i][0] == "null") bimboColors.push(["null", "Transparent"]);
					else bimboColors.push([("glittering " + colorList[i][0]), ("*" + colorList[i][1] + "*")]);
				}
				colorList = bimboColors;
			}
			
			kGAMECLASS.clearMenu();
			for(i = 0; i < colorList.length; i++)
			{
				if(colorList[i][0] == "null") addButton(btnSlot, colorList[i][1], vagMenu, [target, colorList[i][0]], "No Color Change", ("Keep your nether-lips the same color."));
				else addButton(btnSlot, colorList[i][1], vagMenu, [target, colorList[i][0]], StringUtil.toDisplayCase(colorList[i][0]), ("Change the color of your nether-lips to " + colorList[i][0] + "."));
				btnSlot++;
			}
		}
		
		private function vagMenu(arg:Array):void
		{
			var target:Creature = arg[0];
			var newColor:String = arg[1];
			var i:int = 0;
			var x:int = 0;
			
			// If vaginacount=1: Proceed to transformation text
			if(target.vaginas.length == 1)
			{
				rbgUse([target, newColor, 0]);
				return;
			}
			
			// If vaginacount>1: Proceed to third consumption text
			clearOutput();
			kGAMECLASS.showName("CHOOSE\nVAGINA");
			author("Shadefalcon");
			clearMenu();
			
			output("You have more than one vagina. Which one will you smear with the Muffstick?\n");
			
			for(i = 0; i < target.vaginas.length; i++)
			{
				output("\n<b>" + StringUtil.capitalize(num2Ordinal(i + 1)) + " Vagina:</b>");
				if(target.vaginas[i].vagooFlags.length > 0)
				{
					for(x = 0; x < target.vaginas[i].vagooFlags.length; x++)
					{
						output(" " + GLOBAL.FLAG_NAMES[target.vaginas[i].vagooFlags[x]] + ",");
					}
				}
				if(target.vaginas[i].vaginaColor != "") output(" " + StringUtil.toDisplayCase(target.vaginas[i].vaginaColor) + ",");
				output(" " + GLOBAL.TYPE_NAMES[target.vaginas[i].type]);
				
				addButton(i, ("Vagina " + (i + 1)), rbgUse, [target, newColor, i], (StringUtil.capitalize(num2Ordinal(i + 1)) + " Vagina"), ("Use this on your [pc.vagina " + i + "]."));
			}
		}
		
		private function rbgUse(arg:Array):void
		{
			var target:Creature = arg[0];
			var newColor:String = arg[1];
			var selVag:int = arg[2];
			
			clearOutput();
			kGAMECLASS.showName("\nMUFFSTICK");
			author("Shadefalcon");
			
			// Transformation text:
			
			// Mouthgina:
			// Requirements: Non-mouth pussy
			if(target.vaginas[selVag].type != GLOBAL.TYPE_MOUTHGINA)
			{
				output("After choosing the desired color");
				if(target.vaginas.length != 1) output(" and pussy");
				output(", you pop open the cork, twist the lipstick out from the tube and apply it as prescribed on the outer lips of your sex. The compound melts into them with every gentle stroke across the delicate folds.");
				output("\n\nSoon you’ve covered the entirety of the exterior, but still continue to smear away, like you’ve been instructed. The reason for doing so becomes apparent when the");
				if(newColor == "null") output(" transparent");
				else output(" " + newColor);
				output(" glisten starts spreading out, first coating the inner labia and then the rest of your orifice. After a short while, you use up the remainder of the Muffstick and watch the last layer thinning out.");
				output("\n\nYou get but a moment to admire the slutty makeup you’ve given your slit before your crotch suddenly feels like it’s been set on fire. Intense pleasure spreads throughout your honeypot, every inch of it now made several times more sensitive than a clit, forcing you to buck your hips in the air for relief. The combination of mind blowing pleasure and scorching heat simply becomes too much to bear, robbing you of your strength. As your [pc.legs] gradually give in, your motions slowly die down and you slump onto your back. After taking a moment to fetch your breath, you gather whatever energy you have left and prop yourself up on your elbows, directing your attention towards the Codex.");
				output("\n\nIt doesn’t take long before you see the outer lips puffing out, melting together with the inner ones and slowly forming an undeniably mouth-like entrance. And what a mouth it is - a pair of plump lips frozen in a seductive");
				if(target.vaginas[selVag].looseness() <= 3) output(" ‘O’");
				else output(", pouty");
				output(" expression, just begging to be touched and plunged into.");
				output("\n\n");
				if(target.vaginas[selVag].clits == 1) output("Meanwhile, your [pc.clit] gradually develops a whole new metallic sheen, before it suddenly splits off into two separate pleasure buttons that rearrange themselves into what looks like a set of studded piercings.");
				else if(target.vaginas[selVag].clits == 2) output("Meanwhile, both of your [pc.clits] gradually develop a whole new metallic sheen, making them look like a set of studded piercings.");
				else output("Meanwhile, all of your [pc.clits] gradually develop a whole new metallic sheen before they suddenly meld together and then split off into two separate pleasure buttons that rearrange themselves into what looks like a set of studded piercings.");
				output("\n\nIf you had any strength after suffering through all the pleasure and the scorching heat in your shifting pussy, you would most likely be all over them by now; instead you can only lick your lips in the anticipation of what you can do with them later on...");
				output("\n\nYou spend some time staring at this sensual display of your hot tongue dancing around your newly formed lips, grazing the polished clits every now and then - which feels absolutely <i>amazing</i> - before you realize that you’re able to watch yourself lick your own mouth. Or, to be more precise, witness an erogenous tongue lolling out and circling the oversensitive, swollen lips of your muff.");
				output("\n\nInitially quite shocked by this sudden change, you’re soon too busy losing yourself in the mind-blowing pleasure it brings to even care. You have full control of the seductive licker and find yourself moving it with the same ease and precision as the one upstairs, sliding it rapidly along the sensitive rims, going from one clit to another with reckless abandon.");
				output("\n\nAlready flushed and turned on from the heat inside your maw, the added sensations from the erogenous tongue and the oh-so arousing show the Codex treats you to serve as the tipping point. The climax washes over you like a tsunami of euphoria, flooding your entire system with orgasmic ecstasy. The strong current reaches out all the way to your brain, completely overloading it with wave after wave of unparalleled pleasure, leaving you a quivering, moaning mess, with eyes rolled upwards and a classic O-face expression.");
				output("\n\nStreams of [pc.girlcum] gush out from your mouthgina");
				if(target.hasCock())
				{
					output(" joined in by the");
					if(target.cumQ() >= 1000) output(" geysers");
					else if(target.cumQ() >= 100) output(" blasts");
					else output(" spurts");
					output(" of [pc.cum] spraying out of your cock" + (target.cocks.length == 1 ? "" : "s"));
				}
				output(", though luckily enough the");
				if(target.isSquirter(selVag)) output(" copious");
				output(" feminine juices only graze the codex, leaving some [pc.girlCumColor] spots on the screen.");
				if(target.hasCock())
				{
					output(" The [pc.cumNoun] however shoots unsurprisingly right where it was aimed, leaving some [pc.cumColor] marks on your torso and a bit on your face too.");
					if(kGAMECLASS.silly) output(" You shakingly raise your hand and try to wipe it off. No, not quite there, to your right... No, your other right... Wait, which mouth are your trying to clean, again?");
					if(target.cumQ() >= 1000) output(" The cum however splatters most of your upper body and face, covering you in the [pc.cumColor], sticky substance.");
				}
				output(" Completely spent");
				if(target.hasCock() && target.cumQ() >= 1000) output(" and spooge saturated");
				output(", you end up lying there, on the ground, spasming with electric jolts of pleasure, tongues drooling from");
				if(target.totalVaginas(GLOBAL.TYPE_MOUTHGINA) == 1) output(" both");
				else output(" all");
				output(" of your mouths as you daze off into pure orgasmic bliss.");
				output("\n\nYou come to a while later, feeling quite satisfied and refreshed, realizing that the sensitivity of your nether lips has returned to normal and the intense heat you felt in your loins has finally subsided.");
				output("\n\nNow, with your strength back and your lust sated, you’re finally able to fully explore your new mouth-gina.");
				output("\n\n<b>You’re left with an unmistakably mouth-like opening, with plump");
				if(newColor == "null") output(" [pc.vaginaColor " + selVag + "]");
				else output(" " + newColor);
				output(" lips, and a pair of clits that gleam like polished metal.</b> Experimentally, you start touching yourself, finding that your soft cushiony lips are as delicate as your inner ones used to be, if not more so. Feeling satisfied with inspecting the exterior, you allow a couple of fingers to slide past the pillowy cushions and into your hungry tunnel, <b>where an erogenous tongue has taken residence.</b> The ‘oral’ muscle turns out to be as sensitive as a clit, making you clamp down on your digits with the lightest stroke against it. You can’t help but chuckle a bit at the thought of your pussy gobbling them whole. To be honest, you feel like you could let your nethers swallow any wide, thick cock right then and there, or scissor the first lady you meet, just to test out the delightful feeling of some crotch on crotch action.");
				
				// ++ Lust
				target.changeLust(50);
				// increase libido by 3
				if(target.libido() < 50)
				{
					output("\n\nYou ponder whether or not those thoughts mean your libido has spiked a bit.");
					target.slowStatGain("libido", 3);
				}
				// turn vagina into mouthgina
				// make vagina slightly pumped
				// add tongue flag
				if(newColor == "null") newColor = target.vaginas[selVag].vaginaColor;
				target.shiftVagina(selVag, GLOBAL.TYPE_MOUTHGINA);
				target.vaginas[selVag].vaginaColor = newColor;
				target.vaginas[selVag].addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
				
				target.orgasm();
				if(target.hasCock() && target.cumQ() >= 1000) target.applyCumSoaked();
			}
			
			// Repeated uses:
			
			else if(target.vaginas[selVag].type == GLOBAL.TYPE_MOUTHGINA && target.vaginas[selVag].hasFlag(GLOBAL.FLAG_TONGUE) && newColor != "null" && (kGAMECLASS.flags["MUFFSTICK_COLORED"] == undefined || newColor != target.vaginas[selVag].vaginaColor))
			{
				// Change color first time:
				// Requirements: Mouth pussy, tongue flag
				if(kGAMECLASS.flags["MUFFSTICK_COLORED"] == undefined)
				{
					output("After choosing the desired color, you smear the Muffstick on the lips of your [pc.vagina " + selVag + "], finding the process a bit easier with a more mouth-like entrance. After you’ve prepared yourself for some intense heat and mind-numbing pleasure, you’re left a bit underwhelmed, if not disappointed, when the lips and insides only heat up briefly");
					if(newColor != target.vaginas[selVag].vaginaColor) output(" <b>before they change their pigmentation to " + newColor + "</b>.");
					else output("; however, the sensations soon fade away and nothing else seems to happen.");
					output("\n\nWas that it? You had hoped for some greater changes, like increased sensitivity");
					if(!target.vaginas[selVag].hasFlag(GLOBAL.FLAG_PUMPED)) output(" or more puffed out lips.");
					else output(" for instance.");
					output(" Reading through the pamphlet, more thoroughly this time, you realize the lipstick won’t be able to do anything else besides changing the lip color.");
					if(!target.vaginas[selVag].hasFlag(GLOBAL.FLAG_PUMPED)) output(" <b>There’s probably a way to pump them up even further, but it looks like this gene-mod has done all it can.</b>");
					else
					{
						if(newColor != target.vaginas[selVag].vaginaColor) output(" Well, at least the new makeup looks wonderful.");
						else output(" <b>With nothing else to modify, it seems like the Muffstick has done all it can for now, aside from palette swapping</b>.");
					}
					kGAMECLASS.flags["MUFFSTICK_COLORED"] = 1;
				}
				// Change color consecutive times:
				// Requirements: First color change scene done, Mouth pussy, tongue flag
				else
				{
					output("After choosing the desired color, you smear the Muffstick on the lips of your [pc.vaginaColor " + selVag + "] [pc.vaginaNoun " + selVag + "], finding it much easier now that you’ve done it a couple of times. You secretly hope to once again experience some intense heat and mind-numbing pleasure. Maybe even some increased sensitivity");
					if(!target.vaginas[selVag].hasFlag(GLOBAL.FLAG_PUMPED)) output(" or more plump cushions");
					output(", but unfortunately, your puffy lips and insides only heat up for a moment <b>before they change their pigmentation to " + newColor + "</b>.");
					if(!target.vaginas[selVag].hasFlag(GLOBAL.FLAG_PUMPED)) output(" There’s probably a way to pump them up even further, <b>but it looks like this gene-mod has done all it can.</b> So you simply shake the thought away and decide to admire your new makeup instead.");
					else output("\n\nAfter the transformation is over you’re content to simply admire your new makeup for a while.");
				}
				
				target.vaginas[selVag].vaginaColor = newColor;
			}
			// Tongue regrowth variant:
			// Requirements: Mouth pussy, no tongue flag
			else if(target.vaginas[selVag].type == GLOBAL.TYPE_MOUTHGINA && !target.vaginas[selVag].hasFlag(GLOBAL.FLAG_TONGUE))
			{
				output("After choosing the desired color, you smear the");
				if(newColor == "null") output(" clear");
				else output(" " + newColor);
				output(" layer of Muffstick on the outside of your [pc.vagina " + selVag + "]. You are treated once again to the pleasurable sensation of your lips and insides heating up, accompanied by a slight increase in sensitivity");
				if(newColor != "null") output(" before your lips change their pigmentation to " + newColor + ".");
				else output("; however, nothing else seems to happen.");
				output(" You briefly wonder if that’s the end of the transformation when you suddenly feel an intense warmth welling up inside your honeypot. Something hot and slippery is growing there, thrashing around and rubbing against your inner walls, causing you to shudder as it increasingly makes its presence known.");
				output("\n\nSoon, you can see a tongue peek out of your [pc.vagina " + selVag + "], and you don’t waste a single moment before you start mashing it against your nether lips. The experience is not nearly as mind-bogglingly intense as when you first got your mouth-shaped orifice, but you still find it incredibly enjoyable to feel the erogenous organ slide across the outside of your entrance.");
				output("\n\nEvery detail of this obscene act gets reflected through the Codex, treating you to a deliciously arousing show, making you wet enough to see [pc.girlCum] drip down from the tip of your tongue. It’s almost like you’re drooling at the sight of this lewd display, something you find yourself checking, wiping your upper mouth just in case. Finding no saliva - not like that would’ve stopped you anyway - you continue to relish the experience of what can only be described as an odd form of autocunnilingus.");
				output("\n\nYou get to enjoy the strange spectacle for a good long while, savoring every moment of this blissful reunion, before all too suddenly, your tongue cools down and retracts back into hiding. You’re left feeling a bit horny and slightly disappointed, but it’s reassuring to know the pussy-based licker is back to add to your pleasure whenever you feel like playing with yourself... or a brave enough partner.");
				
				// ++ Lust
				target.changeLust(50);
				// Add tongue flag
				target.vaginas[selVag].addFlag(GLOBAL.FLAG_TONGUE);
				if(newColor != "null") target.vaginas[selVag].vaginaColor = newColor;
			}
			// Dud text:
			// Requirements: First color change scene done, mouthpussy, tongue flag, no color change
			else
			{
				output("\n\nAfter choosing the desired color, you smear the Muffstick on the lips of your [pc.vagina " + selVag + "], finding it increasingly easier with a more mouth-like entrance. After you’ve prepared yourself for some intense heat and mind-numbing pleasure, you’re left thoroughly disappointed when the sensations fade away and nothing else seems to happen. <b>With nothing to modify, it seems like the Muffstick has done all it can for now.</b>");
			}
			
			// Add Fizzy Fix to the inventory
			output("\n\n");
			kGAMECLASS.itemScreen = kGAMECLASS.generalInventoryMenu;
			kGAMECLASS.lootScreen = kGAMECLASS.generalInventoryMenu;
			kGAMECLASS.useItemFunction = kGAMECLASS.generalInventoryMenu;
			kGAMECLASS.itemCollect([new FizzyFix()]);
			
			//clearMenu();
			//addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
	}
}

