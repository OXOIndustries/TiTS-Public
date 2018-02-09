package classes.Items.Miscellaneous
{
	import classes.Characters.PlayerCharacter;
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.*;
	import classes.GLOBAL;
	import classes.GameData.CodexManager;
	import classes.GameData.TooltipManager;
	import classes.ItemSlotClass;
	import classes.StringUtil;
	import classes.kGAMECLASS;
	
	public class ReductPro extends ItemSlotClass
	{
		//constructor
		public function ReductPro()
		{
			this._latestVersion = 1;
			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "ReductPro";
			//Regular name
			this.longName = "container labeled 'ReductPro'";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a package containing a single container labeled “ReductPro”";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is a colorfully-packaged box featuring some holovid sales girl.";
			if (kGAMECLASS.silly)
				this.tooltip += " <i>Hi, Milly Bayes here with new ReductPro! Got a dick that’s two sizes too big? Too much junk in your trunk? Are you suffering from weight gain, bloating, aching and groaning? Well now J’ejune Pharmaceutical has the cure: ReductPro!\n\nReductPro uses powerful fast-acting agents based on a combination of ancient alchemical practices and amazing scientific research to the provide targeted relief you can rely on!\n\nReductPro. Apply directly to the desired area, and in seconds you’ll see immediate results with no long-term side effects! Don’t put up with your weight! Cut your mass down to size, with ReductPro!</i>";
			else
				this.tooltip += " White lettering informs you that this paste is designed to help you lose weight and get rid of oversized body parts.";
			this.tooltip += "\n\nA warning states: <i>INTENDED FOR TOPICAL USE ONLY, AVOID SENSITIVE AREAS!</i> Below this, in much smaller text, is a long string of minor potential side effects. Within the colorful packaging is a dull gray tube of paste.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			//Information
			this.basePrice = 2000;
			
			this.version = this._latestVersion;
		}
		
		protected function rand(max:Number):Number
		{
			return int(Math.random() * max);
		}
		
		//ReductPro: The Reducto of TiTS!
		// Usage Menu:
		private function menuReductProOptions(clearText:Boolean = false):void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			
			if (clearText)
				clearOutput();
			else
				output("\n\n");
			kGAMECLASS.showName("\nReductPro");
			output("You ponder over how to use ReductPro. Which body part will you shrink?");
			
			// Build menu:
			clearMenu();
			
			// 0 - Breasts (Single Row)
			// 5 - Breasts (All)
			if (pc.hasBreasts())
			{
				if (pc.totalBreasts() == 1)
					addButton(0, "Breast", useReductProShrinkBreasts, 0, "Breast", "Apply the paste to your [pc.breast].");
				else if (pc.breastRows.length > 1)
					addButton(0, "Breasts", useReductProShrinkBreastsMenu, undefined, "Breasts (Single Row)", "Apply the paste to your [pc.breasts].");
				else
					addButton(0, "Breasts", useReductProShrinkBreasts, 0, "Breasts", "Apply the paste to your [pc.breasts].");
				
				if (pc.breastRows.length > 1)
					addButton(5, "BreastAll", useReductProShrinkBreastsAll, undefined, "Breasts (All)", "Apply the paste to your [pc.fullChest].");
					//else kGAMECLASS.addDisabledButton(5, "BreastAll", "Breasts (All)", "You need multiple rows of breasts for that!");
			}
			else
			{
				kGAMECLASS.addDisabledButton(0, "Breasts", "Breasts", "You need breasts for that!");
				if (pc.breastRows.length > 1)
					kGAMECLASS.addDisabledButton(5, "BreastAll", "BreastAll", "You need breasts for that!");
			}
			
			// 1 - Nipples
			// 6 - Nipples (All)
			if (pc.hasNipples())
			{
				if (pc.totalNipples() == 1)
				{
					if (pc.nippleLengthRatio > 0.1)
						addButton(1, "Nipple", useReductProShrinkNipples, 0, "Nipple", "Apply the paste to your [pc.nipple].");
					else
						kGAMECLASS.addDisabledButton(1, "Nipple", "Nipple", "Your nipple is already as flat as it can be!");
				}
				else if (pc.breastRows.length > 1)
				{
					if (pc.nippleLengthRatio > 0.1)
						addButton(1, "Nipples", useReductProShrinkNipplesMenu, -1, "Nipples (Single Row)", "Apply the paste to a row of your [pc.nipples].");
					else
						kGAMECLASS.addDisabledButton(1, "Nipples", "Nipples (Single Row)", "Your nipples are already as flat as they can be!");
				}
				else
				{
					if (pc.nippleLengthRatio > 0.1)
						addButton(1, "Nipples", useReductProShrinkNipples, 0, "Nipples", "Apply the paste to your [pc.nipples].");
					else
						kGAMECLASS.addDisabledButton(1, "Nipples", "Nipples", "Your nipples are already as flat as they can be!");
				}
				
				if (pc.breastRows.length > 1)
				{
					if (pc.nippleLengthRatio > 0.1)
						addButton(6, "NipplesAll", useReductProShrinkNipples, -1, "Nipples (All)", "Apply the paste to your [pc.nipples].");
					else
						kGAMECLASS.addDisabledButton(6, "NipplesAll", "Nipples (All)", "Your nipples are already as small as they can be!");
				}
					//else kGAMECLASS.addDisabledButton(6, "NipplesAll", "Nipples (All)", "You need multiple rows of nipples for that!");
			}
			else
				kGAMECLASS.addDisabledButton(1, "Nipples", "Nipples", "You need nipples for that!");
			
			// 10 - Vagina
			// 11 - Clit(s)
			if (pc.hasVagina())
			{
				if (pc.gapestVaginaLooseness() >= 2)
				{
					if (pc.totalVaginas() == 1)
						addButton(10, "Vagina", useReductProShrinkVagina, undefined, "Vagina", "Apply the paste to your [pc.vagina].");
					else
						addButton(7, "Vaginas", useReductProShrinkVagina, undefined, "Vaginas", "Apply the paste to [pc.eachVagina].");
				}
				else if (pc.totalVaginas() == 1)
					kGAMECLASS.addDisabledButton(10, "Vagina", "Vagina", "Your vagina is as tight as it can be!");
				else
					kGAMECLASS.addDisabledButton(10, "Vaginas", "Vaginas", "Your vaginas are as tight as they can be!");
				
				if (pc.totalClits() > 0)
				{
					if (pc.totalClits() == 1)
					{
						if (pc.clitLength > 0.1)
							addButton(11, "Clit", useReductProShrinkClits, undefined, "Clit", "Apply the paste to your [pc.clit].");
						else
							kGAMECLASS.addDisabledButton(11, "Clit", "Clit", "Your clit is already as small as it can be!");
					}
					else
					{
						if (pc.clitLength > 0.1)
							addButton(11, "Clits", useReductProShrinkClits, undefined, "Clits", "Apply the paste to [pc.eachClit].");
						else
							kGAMECLASS.addDisabledButton(11, "Clits", "Clits", "Your clits are already as small as they can be!");
					}
				}
				else
					kGAMECLASS.addDisabledButton(11, "Clit", "Clit", "You need a clitoris for that!");
			}
			else
				kGAMECLASS.addDisabledButton(10, "Vagina", "Vagina", "You need a vagina for that!");
			
			// 2 - Cocks (Single)
			// 7 - Cocks (All)
			if (pc.hasCock())
			{
				if (pc.totalCocks() == 1)
				{
					if (pc.cocks[0].cLength() > 3)
						addButton(2, "Cock", useReductProShrinkCock, 0, "Cock", "Apply the paste to your [pc.cock].");
					else
						kGAMECLASS.addDisabledButton(2, "Cock", "Cock", "Your cock is as short as it can be!");
				}
				else
				{
					if (pc.longestCockLength() > 3)
						addButton(2, "Cock", useReductProShrinkCockMenu, undefined, "Cock (Single)", "Apply the paste to [pc.oneCock].");
					else
						kGAMECLASS.addDisabledButton(2, "Cock", "Cock (Single)", "All of your cocks are as short as they can be!");
				}
				
				if (pc.cocks.length > 1)
				{
					if (pc.longestCockLength() > 3)
						addButton(7, "All Cocks", useReductProShrinkCockAll, undefined, "Cocks (All)", "Apply the paste to [pc.eachCock].");
					else
						kGAMECLASS.addDisabledButton(7, "All Cocks", "Cocks (All)", "All of your cocks are as short as they can be!");
				}
					//else if(pc.longestCockLength() > 3) kGAMECLASS.addDisabledButton(7, "All Cocks", "Cocks (All)", "You need multiple cocks for that!");
			}
			else
				kGAMECLASS.addDisabledButton(2, "Cock", "Cock", "You need a cock for that!");
			// 12 - Balls
			if (pc.balls > 0 && pc.ballDiameter() >= 0.7)
			{
				if (pc.balls == 1)
					addButton(12, "Testicle", useReductProShrinkBalls, undefined, "Testicle", "Apply the paste to your [pc.balls].");
				else if (pc.hasStatusEffect("Uniball"))
					addButton(12, "Uniball", useReductProShrinkBalls, undefined, "Uniball", "Apply the paste to your [pc.balls].");
				else
					addButton(12, "Balls", useReductProShrinkBalls, undefined, "Balls", "Apply the paste to your [pc.balls].");
			}
			else if (pc.balls > 0)
			{
				if (pc.balls == 1)
					kGAMECLASS.addDisabledButton(12, "Testicle", "Testicle", "Your [pc.ballNoun] is as small is it can be!");
				else if (pc.hasStatusEffect("Uniball"))
					kGAMECLASS.addDisabledButton(12, "Uniball", "Uniball", "Your [pc.ballsNoun] are as small as they can be!");
				else
					kGAMECLASS.addDisabledButton(12, "Balls", "Balls", "Your [pc.ballsNoun] are as small as they can be!");
			}
			else
				kGAMECLASS.addDisabledButton(12, "Balls", "Balls", "You need balls for that!");
			
			// 3 - Hips
			if (pc.hipRatingRaw > 0)
				addButton(3, "Hips", useReductProShrinkHips, undefined, "Hips", "Apply the paste to your [pc.hips].");
			else
				kGAMECLASS.addDisabledButton(3, "Hips", "Hips", "Your hips are as narrow as they can be!");
			// 8 - Butt
			if (pc.buttRatingRaw > 0)
				addButton(8, "Butt", useReductProShrinkButt, undefined, "Butt", "Apply the paste to your [pc.butts].");
			else
				kGAMECLASS.addDisabledButton(8, "Butt", "Butt", "Your ass cheeks are as small as they can be!");
			// 4 - Belly
			if (pc.bellyRatingRaw > 0)
				addButton(4, "Belly", useReductProShrinkBelly, undefined, "Belly", "Apply the paste to your [pc.belly].");
			else
				kGAMECLASS.addDisabledButton(4, "Belly", "Belly", "Your belly is as flat as it can be!");
			
			// 13 - Anus
			if (!pc.ass.loosenessRaw >= 2)
				addButton(13, "Anus", useReductProShrinkAnus, undefined, "Anus", "Apply the paste to your [pc.asshole].");
			else
				kGAMECLASS.addDisabledButton(13, "Anus", "Anus", "Your asshole is as tight as it can be!");
			// 9 - Horns
			if (pc.hasHorns())
			{
				if (pc.horns == 1)
					addButton(9, StringUtil.capitalize(pc.hornsNoun()), useReductProShrinkHorns, undefined, StringUtil.capitalize(pc.hornsNoun()), "Apply the paste to your [pc.horn].");
				else
					addButton(9, StringUtil.capitalize(pc.hornsNoun()), useReductProShrinkHorns, undefined, StringUtil.capitalize(pc.hornsNoun()), "Apply the paste to [pc.eachHorn].");
			}
			else
				kGAMECLASS.addDisabledButton(9, "Horns", "Horns", "You need horns for that!");
			// 14 - Back
			addButton(14, "Back", menuReductProQuit, undefined, "Nevermind", "Put the container back in your inventory.");
			
			return;
		}
		
		// Breasts (Single Row) - Brings up prompt on which row to shrink.
		private function useReductProShrinkBreastsMenu():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			output("Which row of breasts will you shrink?");
			
			// Generate text and buttons:
			clearMenu();
			if (pc.breastRows.length <= 0)
				output("\n\nIt looks like you don't have any extra rows...");
			else
			{
				output("\n\n<b>Total Rows:</b> " + pc.breastRows.length);
				output("\n<b>Total Breast Count:</b> " + pc.totalBreasts());
				
				var x:int = 0;
				var y:int = 0;
				var z:int = 0;
				
				for (x = 0; x < pc.breastRows.length; x++)
				{
					y = x + Math.floor(x / 14);
					z = 15 * (Math.floor(x / 14)) - 1;
					
					output("\n\n<b>" + StringUtil.capitalize(num2Ordinal(x + 1)) + " Row:</b>");
					output("\nCount: " + pc.breastRows[x].breasts);
					if (pc.breastRows[x].breastRating() > 0)
					{
						output("\nSize: " + pc.breastCup());
						if (pc.breastRows[x].breasts != 1)
							output("s");
					}
					else
						output("\nSize: Flat");
					
					// Valid boob row
					addButton(y, String("Row " + (x + 1)), useReductProShrinkBreasts, x);
					// Nah...
					if (x == z)
						addButton(x, "Back", menuReductProOptions, true, "Nevermind", "Choose something else...");
				}
			}
			addButton(14, "Back", menuReductProOptions, true, "Nevermind", "Choose something else...");
			
			return;
		}
		
		// Breasts (Single Row)
		private function useReductProShrinkBreasts(rowNum:int = 0):void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			if (pc.isChestCovered())
				output("Preparing yourself, you remove your [pc.upperGarments]. ");
			output("You unscrew the cap and squeeze the contents of ReductPro on your hand and apply the paste over your [pc.chest " + rowNum + "].");
			
			if (pc.biggestTitSize() <= 0)
			{
				output("\n\nYou shudder as");
				if (pc.breastRows.length > 1)
					output(" a single row of");
				output(" your [pc.breasts " + rowNum + "] tingle");
				if (pc.breastsPerRow(rowNum) == 1)
					output("s");
				output(" for a short moment, but then the feeling passes as soon as it starts... Perhaps you are as flat as you're going to get?");
				
				useReductProDone(true);
				return;
			}
			
			var nShrink:Number = 0;
			
			// Shrink breast size by up to 4 cup sizes, depending on your breast size. Critical shrink shrinks 1-2 additional cup size.
			nShrink += 1 + rand(2);
			// Larger than big EE-cups
			if (pc.breastRows[rowNum].breastRatingRaw > 10)
				nShrink += 1;
			// Larger than big H-cups
			if (pc.breastRows[rowNum].breastRatingRaw > 20)
				nShrink += 1;
			// Safety
			if (nShrink > pc.breastRows[rowNum].breastRatingRaw)
				nShrink = pc.breastRows[rowNum].breastRatingRaw;
			
			if (pc.breastRatingUnlocked(rowNum, (pc.breastRows[rowNum].breastRatingRaw - nShrink)))
			{
				output("\n\nYou shudder as");
				if (pc.breastRows.length > 1)
					output(" a single row of");
				output(" your [pc.breasts " + rowNum + "] shrink to a");
				if (nShrink < 2)
					output(" slightly");
				else if (nShrink > 2)
					output(" much");
				output(" smaller size!");
				
				pc.breastRows[rowNum].breastRatingRaw -= nShrink;
				
				// Critical shrink!
				if (pc.breastRows[rowNum].breastRatingRaw > 0 && rand(4) == 0)
				{
					nShrink = 1 + rand(2);
					
					output("\n\n");
					if (kGAMECLASS.silly)
						output("<b>Critical shrinkage!</b> ");
					output("The pasty substance continues to manifest, shrinking your [pc.breasts " + rowNum + "] by another");
					if (nShrink != 1)
						output(" " + num2Text(nShrink) + " cups!");
					else
						output(" cup!");
					
					pc.breastRows[rowNum].breastRatingRaw -= nShrink;
				}
				
				output("\n\nOnce the substance has been fully absorbed, <b>you confirm that your");
				if (pc.breastRows.length > 1)
					output(" " + num2Ordinal(rowNum + 1) + " row of");
				if (pc.breastsPerRow(rowNum) == 1)
				{
					if (pc.breastRows[rowNum].breastRating() > 0)
						output(" tit is now at " + indefiniteArticle(pc.breastCup(rowNum)) + ".");
					else
						output(" tit is now flat.");
				}
				else
				{
					if (pc.breastRows[rowNum].breastRating() > 0)
						output(" tits are now at " + pc.breastCup(rowNum) + "s.");
					else
						output(" tits are now flat.");
				}
				output("</b>");
				
				if (pc.isBimbo())
					output(" <i>Aw, this is no time for me to lose my tits!</i>");
				
				// Done!
				useReductProDone();
				return;
			}
			else
			{
				output("\n\n" + pc.breastRatingLockedMessage());
				useReductProDone(true);
				return;
			}
		}
		
		// Breasts (All)
		private function useReductProShrinkBreastsAll(rowNum:int = 0):void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			if (pc.isChestCovered())
				output("Preparing yourself, you remove your [pc.upperGarments]. ");
			output("You unscrew the cap and squeeze the contents of ReductPro onto your hand, and smear the foul-smelling ointment all over your " + pc.allBreastsDescript() + ", covering them entirely as the paste begins to get absorbed into your " + pc.skin() + ".");
			
			if (pc.biggestTitSize() <= 0)
			{
				output("\n\nYou shudder as your [pc.breasts] tingle for a short moment, but then the feeling passes as soon as it starts... Perhaps you are as flat as you're going to get?");
				
				useReductProDone(true);
				return;
			}
			
			var nShrink:Number = 0;
			var x:int = 0;
			
			// Shrink breast size by 1-4 cup sizes, depending on your breast size.
			nShrink += 1 + rand(4);
			// If 2 rows, shrink by 2 cup sizes.
			if (pc.breastRows.length == 2)
				nShrink = 2;
			// If 3+, shrink by 1-2 cup sizes.
			if (pc.breastRows.length >= 3)
				nShrink = 1 + rand(2);
			// Safety
			if (nShrink > pc.breastRows[pc.biggestTitRow()].breastRatingRaw)
				nShrink = pc.breastRows[pc.biggestTitRow()].breastRatingRaw;
			
			if (pc.breastRatingUnlocked(pc.biggestTitRow(), (pc.breastRows[pc.biggestTitRow()].breastRatingRaw - nShrink)) || rand(10) == 0)
			{
				output("\n\nYou shudder as your [pc.chestFull] shrink to a");
				if (nShrink < 2)
					output(" slightly");
				else if (nShrink > 2)
					output(" much");
				output(" smaller size!");
				
				for (x = 0; x < pc.breastRows.length; x++)
				{
					pc.breastRows[x].breastRatingRaw -= nShrink;
				}
				
				// Critical shrink!
				if (pc.breastRows[pc.biggestTitRow()].breastRatingRaw > 0 && rand(4) == 0)
				{
					nShrink = 1 + rand(2);
					
					output("\n\n");
					if (kGAMECLASS.silly)
						output("<b>Critical shrinkage!</b> ");
					output("The pasty substance continues to manifest, shrinking your [pc.breasts] by another");
					if (nShrink != 1)
						output(" " + num2Text(nShrink) + " cups!");
					else
						output(" cup!");
					
					for (x = 0; x < pc.breastRows.length; x++)
					{
						pc.breastRows[x].breastRatingRaw -= nShrink;
					}
				}
				
				output("\n\nOnce the substance has been fully absorbed, <b>you confirm that your");
				if (pc.breastRows[pc.biggestTitRow()].breastRating() > 0)
					output(" tits are now at " + pc.breastCup(pc.biggestTitRow()) + "s.");
				else
					output(" tits are now flat.");
				output("</b>");
				
				if (pc.isBimbo())
					output(" <i>Oopsies, my boobies!</i>");
				
				// Done!
				useReductProDone();
				return;
			}
			else
			{
				output("\n\n" + pc.breastRatingLockedMessage());
				useReductProDone(true);
				return;
			}
		}
		
		// Nipples (Single Row) - Brings up prompt on which row to shrink.
		private function useReductProShrinkNipplesMenu():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			output("Which row of nipples will you shrink?");
			
			// Generate text and buttons:
			clearMenu();
			if (pc.breastRows.length <= 0)
				output("\n\nIt looks like you don't have any extra rows...");
			else
			{
				output("\n\n<b>Total Rows:</b> " + pc.breastRows.length);
				output("\n<b>Nipple Count:</b> " + pc.nipplesPerBreast + " nipple");
				if (pc.nipplesPerBreast != 1)
					output("s");
				output(" per breast");
				output("\n<b>Total:</b> " + pc.totalNipples());
				
				var x:int = 0;
				var y:int = 0;
				var z:int = 0;
				
				for (x = 0; x < pc.breastRows.length; x++)
				{
					y = x + Math.floor(x / 14);
					z = 15 * (Math.floor(x / 14)) - 1;
					
					output("\n\n<b>" + StringUtil.capitalize(num2Ordinal(x + 1)) + " Row:</b>");
					output("\nType: " + GLOBAL.NIPPLE_TYPE_NAMES[pc.breastRows[x].nippleType]);
					if (pc.breastRows[x].nippleType == GLOBAL.NIPPLE_TYPE_DICK)
						output(", " + GLOBAL.TYPE_NAMES[pc.dickNippleType]);
					output("\nNipple Length: " + pc.nippleLength(x) + " inch");
					if (pc.nippleLength(x) != 1)
						output("es");
					output("\nAreola Size: " + pc.nippleWidth(x) + " inch");
					if (pc.nippleWidth(x) != 1)
						output("es");
					
					// Valid nipple row
					addButton(y, String("Row " + (x + 1)), useReductProShrinkNipples, x);
					// Nah...
					if (x == z)
						addButton(x, "Back", menuReductProOptions, true, "Nevermind", "Choose something else...");
				}
			}
			addButton(14, "Back", menuReductProOptions, true, "Nevermind", "Choose something else...");
			
			return;
		}
		
		// Nipples (rowNum: -1 is all, 0+ is a row)
		private function useReductProShrinkNipples(rowNum:int = 0):void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			var x:int = 0;
			var nShrink:Number = Math.max((pc.nippleLengthRatio * 0.5) / pc.breastRows.length, 0.1);
			var bChanged:Boolean = false;
			
			if (pc.isChestCovered())
				output("Preparing yourself, you remove your [pc.upperGarments]. ");
			output("You unscrew the cap and squeeze the contents of ReductPro on your hand and you begin to apply them to");
			
			if (rowNum >= 0)
			{
				if (pc.breastRows.length > 1)
					output(" a single row of");
				output(" your nipple");
				if (pc.nipplesPerBreast * pc.breastRows[rowNum].breasts != 1)
					output("s");
				output(" evenly.");
			}
			else
			{
				if (pc.breastRows.length == 2)
					output(" both rows of");
				else if (pc.breastRows.length > 1)
					output(" all rows of");
				output(" your nipple");
				if (pc.breastRows.length > 1 || pc.totalBreasts() != 1)
					output("s");
				output(" evenly.");
			}
			
			if (pc.nippleLengthRatio <= 0.1 || pc.hasFlatNipples())
			{
				output("\n\nYou shudder as your [pc.nipples " + rowNum + "] tingle");
				if (pc.totalNipples() == 1)
					output("s");
				output(" for a short moment, but then the feeling passes as soon as it starts... Looks like your [pc.nipples] won't be getting any smaller...");
				
				if (pc.isBimbo())
					output(" <i>That's right--it only makes sense if my nips were bigger, like... like all suckable and stuff!</i>");
				
				useReductProDone(true);
				return;
			}
			
			// Shrink nipple size by 50% divided by the number of rows.
			if (pc.nippleLengthRatioUnlocked(pc.nippleLengthRatio - nShrink))
			{
				if (rowNum >= 0)
				{
					output("\n\n");
					if (pc.nipplesPerBreast * pc.breastRows[rowNum].breasts == 1)
						output("You shudder as your [pc.nipple " + rowNum + "] shrinks until it has lost a fraction of its old size.");
					else
						output("Instead of affecting the row you've applied the drug to, the paste's effect seems to spread to all of your nipples... You shudder as your [pc.nipples " + rowNum + "] shrink until they have lost a fraction of their old size.");
					
					pc.nippleLengthRatio -= nShrink;
					if (pc.nippleLengthRatio < 0.1)
						pc.nippleLengthRatio = 0.1;
					
					// May lose nipplecunts and nipplecocks if you ReductPro them enough.
					if ((pc.breastRows[rowNum].fuckable() || pc.breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_DICK) && rand(5) == 0)
					{
						if (pc.nippleTypeUnlocked(rowNum, GLOBAL.NIPPLE_TYPE_NORMAL))
						{
							if (pc.breastRows[rowNum].fuckable())
							{
								if (pc.breastsPerRow(rowNum) == 1 && pc.nipplesPerBreast == 1)
									output("\n\nThe slit in your [pc.nipple " + rowNum + "] feels tighter and as you reach your fingers to it, you can find no traces of the slit. <b>Your nipple is no longer fuckable!</b>");
								else
									output("\n\nThe slit in your [pc.nipples " + rowNum + "] feel tighter and as you reach your fingers to them, you can find no traces of the slit. <b>Your nipples are no longer fuckable!</b>");
								
								pc.breastRows[rowNum].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
							}
							else if (pc.breastRows[rowNum].nippleType == GLOBAL.NIPPLE_TYPE_DICK)
							{
								if (pc.breastsPerRow(rowNum) == 1 && pc.nipplesPerBreast == 1)
									output("\n\nYour [pc.nippleCock] slides out of your [pc.nipple] to full erection before the remaining ReductPro start to manifest and your [pc.nippleCock] shrinks back to nothing. You give your [pc.nipple " + rowNum + "] an experimental pinch to confirm that you no longer have it. <b>You have lost your nipplecock!</b>");
								else
									output("\n\nYour [pc.nippleCocks] slide out of your [pc.nipples] to full erection before the remaining ReductPro start to manifest and your [pc.nippleCocks] shrink back to nothing. You give your [pc.nipples " + rowNum + "] an experimental pinch to confirm that you no longer have them. <b>You have lost your nipplecocks!</b>");
								
								pc.breastRows[rowNum].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
								
								if (pc.isBimbo())
									output(" <i>Aww, but I like my yummy cocks...</i>");
							}
						}
						else
						{
							output("\n\n" + pc.nippleTypeLockedMessage());
						}
					}
					// May get flat nipples!
					else if (pc.nippleLengthRatio <= 0.2 && pc.breastRows[rowNum].nippleType != GLOBAL.NIPPLE_TYPE_FLAT && rand(2) == 0)
					{
						if (pc.nippleTypeUnlocked(rowNum, GLOBAL.NIPPLE_TYPE_FLAT))
						{
							if (pc.breastsPerRow(rowNum) == 1 && pc.nipplesPerBreast == 1)
								output("\n\nRubbing your [pc.nipple " + rowNum + "] with your fingertips, you feel the nub getting smaller and smaller... until it completely disappears, leaving behind a tipless, pebbly surface <b>You now have a flat nipple!</b>");
							else
								output("\n\n\n\nRubbing your [pc.nipples " + rowNum + "] with your fingertips, you feel the nubs getting smaller and smaller... until they completely disappear, each leaving behind a tipless, pebbly surface <b>You now have flat nipples!</b>");
							
							pc.breastRows[rowNum].nippleType = GLOBAL.NIPPLE_TYPE_FLAT;
							
							if (pc.isBimbo())
								output(" <i>Like, what happened to my nips?!</i>");
						}
						else
						{
							output("\n\n" + pc.nippleTypeLockedMessage());
						}
					}
				}
				else
				{
					if (pc.totalNipples() == 1)
						output("\n\nYou shudder as your [pc.nipple] shrinks until it has lost a fraction of its old size.");
					else
						output("\n\nYou shudder as your [pc.nipples] shrink until they have lost a fraction of their old size.");
					
					pc.nippleLengthRatio -= nShrink;
					if (pc.nippleLengthRatio < 0.1)
						pc.nippleLengthRatio = 0.1;
					
					// May remove fuckable status of your nipples as well as your nipplecocks.
					if ((pc.hasFuckableNipples() || pc.hasDickNipples()) && rand(5) == 0)
					{
						for (x = 0; x < pc.breastRows.length; x++)
						{
							if (pc.nippleTypeUnlocked(x, GLOBAL.NIPPLE_TYPE_NORMAL))
							{
								if (pc.breastRows[x].fuckable())
								{
									if (!bChanged)
									{
										if (pc.totalNipples() == 1)
											output("\n\nThe slit in your [pc.nipple " + x + "] feels tighter and as you reach your fingers to it, you can find no traces of the slit. <b>Your nipple is no longer fuckable!</b>");
										else
											output("\n\nThe slit in your [pc.nipples " + x + "] feel tighter and as you reach your fingers to them, you can find no traces of the slit. <b>Your nipples are no longer fuckable!</b>");
										bChanged = true;
									}
									
									pc.breastRows[x].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
								}
								else if (pc.breastRows[x].nippleType == GLOBAL.NIPPLE_TYPE_DICK)
								{
									if (!bChanged)
									{
										if (pc.totalNipples() == 1)
											output("\n\nYour [pc.nippleCock] slides out of your [pc.nipple] to full erection before the remaining ReductPro start to manifest and your [pc.nippleCock] shrinks back to nothing. You give your [pc.nipple " + x + "] an experimental pinch to confirm that you no longer have it. <b>You have lost your nipplecock!</b>");
										else
											output("\n\nYour [pc.nippleCocks] slide out of your [pc.nipples] to full erection before the remaining ReductPro start to manifest and your [pc.nippleCocks] shrink back to nothing. You give your [pc.nipples " + x + "] an experimental pinch to confirm that you no longer have them. <b>You have lost your nipplecocks!</b>");
										bChanged = true;
									}
									
									pc.breastRows[x].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
								}
							}
						}
					}
					// May get flat nipples!
					else if (pc.nippleLengthRatio <= 0.2 && !pc.hasFlatNipples() && rand(2) == 0)
					{
						for (x = 0; x < pc.breastRows.length; x++)
						{
							if (pc.nippleTypeUnlocked(x, GLOBAL.NIPPLE_TYPE_FLAT))
							{
								if (!bChanged)
								{
									if (pc.totalNipples() == 1)
										output("\n\nRubbing your [pc.nipple " + x + "] with your fingertips, you feel the nub getting smaller and smaller... until it completely disappears, leaving behind a tipless, pebbly surface <b>You now have a flat nipple!</b>");
									else
										output("\n\n\n\nRubbing your [pc.nipples " + x + "] with your fingertips, you feel the nubs getting smaller and smaller... until they completely disappear, each leaving behind a tipless, pebbly surface <b>You now have flat nipples!</b>");
									bChanged = true;
								}
								
								pc.breastRows[x].nippleType = GLOBAL.NIPPLE_TYPE_FLAT;
							}
						}
					}
				}
				// Done!
				useReductProDone();
				return;
			}
			else
			{
				output("\n\n" + pc.nippleLengthRatioLockedMessage());
				useReductProDone(true);
				return;
			}
		}
		
		// Vagina(s)
		private function useReductProShrinkVagina():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			var x:int = 0;
			var iTightestVagina:int = 0;
			var iChanged:int = 0;
			
			if (kGAMECLASS.flags["REDUCTPRO_USED_ON_VAGINA"] == undefined && kGAMECLASS.flags["REDUCTPRO_USED_ON_ASSHOLE"] == undefined)
				output("Even though the paste is intended for topical use, you are curious to see what it will do internally. Only one way to find out, right? ");
			else if (kGAMECLASS.flags["REDUCTPRO_USED_ON_VAGINA"] == undefined)
				output("You've already tried this out on your ass, but you wonder what will happen when you get your lady parts involved... ");
			output("You");
			if (pc.isCrotchGarbed())
				output(" open up your [pc.lowerGarments],");
			output(" unscrew the cap, squeeze the contents of ReductPro onto your fingers, and proceed to apply the foul-smelling paste inside your [pc.vaginas].");
			
			// Instantly reduces vaginal looseness by 1.
			if (pc.loosenessUnlocked(iTightestVagina, pc.vaginas[iTightestVagina].loosenessRaw - 1))
			{
				for (x = 0; x < pc.vaginas.length; x++)
				{
					if (pc.vaginas[x].looseness() >= 2 && pc.loosenessUnlocked(x, pc.vaginas[x].loosenessRaw - 1))
					{
						pc.vaginas[x].loosenessRaw--;
						iChanged++;
					}
				}
			}
			
			if (iChanged > 0)
			{
				output("\n\nA clenching reflex and tingling feeling within your [pc.vaginas] is a sign that the drug is working its magic.");
				if (kGAMECLASS.flags["REDUCTPRO_USED_ON_VAGINA"] == undefined)
					output(" To your surprise");
				else
					output(" As expected");
				output(", <b>");
				if (pc.vaginas.length > 1 && iChanged == 1)
					output("one of ");
				output("your vagina");
				if (pc.vaginas.length == 1)
					output(" has");
				else
					output("s have");
				output(" instantly tightened!</b>");
				
				if (pc.isBimbo())
					output(" <i>Ooh, any tighter and I won't be able to fit all those yummy cocks!</i>");
				
				kGAMECLASS.flags["REDUCTPRO_USED_ON_VAGINA"] = 1;
				
				// Done!
				useReductProDone();
				return;
			}
			else
			{
				output("\n\n" + pc.loosenessLockedMessage());
				useReductProDone(true);
				return;
			}
		}
		
		// Clit(s)
		private function useReductProShrinkClits():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			output("You");
			if (pc.isCrotchGarbed())
				output(" open up your [pc.lowerGarments],");
			output(" unscrew the cap, carefully apply the paste to your " + pc.clitDescript() + ", being very careful to avoid getting it on your " + pc.vaginaDescript(0) + ".  It burns with heat as it begins to make its effects known...");
			var newClitLength:Number = Math.round((pc.clitLength / (1 + (0.7 / (Math.ceil(pc.totalClits()) / 2)))) * 100) / 100;
			if (pc.clitLength > 0 && pc.clitLengthUnlocked(newClitLength))
			{
				if (pc.totalClits() == 1)
					output("\n\nYour " + pc.clitDescript() + " shrinks rapidly, dwindling down to almost half its old size before it finishes absorbing the paste.");
				else
					output("\n\nYour " + pc.clitDescript() + " shrink rapidly, dwindling down to almost half their old size before it finishes absorbing the paste.");
				pc.clitLength -= (Math.round((pc.clitLength / 3) * 100) / 100);
				if (pc.clitLength < 0)
					pc.clitLength = 0.01;
				
				if (pc.isBimbo())
					output(" <i>Not my happy button!</i>");
				
				// Done!
				useReductProDone();
				return;
			}
			else
			{
				output("\n\n" + pc.clitLengthLockedMessage());
				useReductProDone(true);
				return;
			}
		}
		
		// Cocks (Single) - Brings up prompt on which row to shrink.
		private function useReductProShrinkCockMenu():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			output("Which cock will you shrink?");
			
			// Generate text and buttons:
			clearMenu();
			if (pc.cocks.length <= 0)
				output("\n\nIt looks like you don't have any cocks to shrink...");
			else
			{
				output("\n\n<b>Total Cocks:</b> " + pc.cockTotal());
				
				var x:int = 0;
				var y:int = 0;
				var z:int = 0;
				
				for (x = 0; x < pc.cocks.length; x++)
				{
					y = x + Math.floor(x / 14);
					z = 15 * (Math.floor(x / 14)) - 1;
					
					output("\n\n<b>" + StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock:</b>");
					output("\nLength: " + formatFloat((pc.cocks[x] as CockClass).cLength(), 3) + " inch");
					if (pc.cocks[x].cLength() != 1)
						output("es");
					output("\nGirth: " + formatFloat((pc.cocks[x] as CockClass).thickness(), 3) + " inch");
					if (pc.cocks[x].thickness() != 1)
						output("es");
					
					// Valid cock
					addButton(y, String("Cock " + (x + 1)), useReductProShrinkCock, x);
					// Nah...
					if (x == z)
						addButton(x, "Back", menuReductProOptions, true, "Nevermind", "Choose something else...");
				}
			}
			addButton(14, "Back", menuReductProOptions, true, "Nevermind", "Choose something else...");
			
			return;
		}
		
		// Cock (Single)
		private function useReductProShrinkCock(cockNum:int = 0):void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			output("You");
			if (pc.isCrotchGarbed())
				output(" open up your [pc.lowerGarments],");
			output(" unscrew the cap and smear the repulsive smelling paste over your " + pc.cockDescript(cockNum) + ". It immediately begins to grow warm, almost uncomfortably so, as your " + pc.cockDescript(cockNum) + " begins to shrink.");
			
			// Too short!
			if (pc.cocks[cockNum].cLength() <= 3)
			{
				output("\n\nYou shudder as your [pc.cock " + cockNum + "] pulses for a short moment, but then the feeling passes and it soon goes flaccid... Perhaps your little pecker is as small as it's going to get?");
				
				// Reduce libido by 1 down to 10.
				if (pc.libidoRaw > (pc.libidoMin() + 10))
				{
					output("\n\nEven though your cock refuses to change, you can feel a small part of your urgency for lust fade...");
					pc.libido(-1);
				}
				
				useReductProDone();
				return;
			}
			
			// Shrink cock size by 33%...
			var nShrink:Number = (Math.round((pc.cocks[cockNum].cLengthRaw / 3) * 100) / 100);
			
			if (pc.cockLengthUnlocked(cockNum, (pc.cocks[cockNum].cLengthRaw - nShrink)))
			{
				output("\n\nYour " + pc.cockDescript(cockNum) + " twitches as it shrinks, disappearing steadily into your " + (pc.hasSheath() ? "sheath" : "crotch"));
				pc.cocks[cockNum].cLengthRaw -= nShrink;
				if (pc.cocks[cockNum].cLengthRaw < 3)
				{
					// ... down to a minimum of 3 inches.
					pc.cocks[cockNum].cLengthRaw = 3;
					output(" to about three inches in length");
				}
				else
					output(" until it has lost a third of its old size");
				output(".</b>");
				
				if (pc.isBro())
					output(" <i>Damn, I gotta be more careful... I'll need this if I'm gonna fuck all the bitches!</i>");
				
				// Reduce libido by 1 down to 10.
				if (pc.libidoRaw > (pc.libidoMin() + 10))
				{
					output("\n\nAs your [pc.cock " + cockNum + "] settles to its new size, you feel a part of your urgency for lust fade with it...");
					pc.libido(-1);
				}
			}
			else
			{
				output("\n\n" + pc.cockLengthLockedMessage() + " Hmm...");
				
				// Reduce libido by 1 down to 10.
				if (pc.libidoRaw > (pc.libidoMin() + 10))
				{
					output("\n\nEven though your [pc.cock " + cockNum + "] refuses to change, you can feel a small part of your urgency for lust fade...");
					pc.libido(-1);
				}
			}
			
			// Done!
			useReductProDone();
			return;
		}
		
		// Cocks (All)
		private function useReductProShrinkCockAll():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			var x:int = 0;
			var iSmallestCock:int = pc.smallestCockIndex();
			var iChanged:int = 0;
			
			output("You");
			if (pc.isCrotchGarbed())
				output(" open up your [pc.lowerGarments],");
			output(" unscrew the cap and stroke all of your [pc.cocks] until they are brought to full erection. Next, you squeeze the tube of ReductPro all over them, spreading the pasty substance evenly across your");
			if (pc.cocks.length == 2)
				output(" pair");
			else
				output(" entire set");
			output(" of manhoods.");
			
			// Too short!
			if (pc.longestCockLength() <= 3)
			{
				output("\n\nYou shudder as your cocks pulse for a short moment, but then the feeling passes and they soon go flaccid... Perhaps your peckers are as small as they're going to get?");
				
				// Reduce libido by 1 down to 10.
				if (pc.libidoRaw > (pc.libidoMin() + 10))
				{
					output("\n\nEven though your cocks refuse to change, you can feel a small part of your urgency for lust fade...");
					pc.libido(-1);
				}
				
				useReductProDone();
				return;
			}
			
			// Shrink cock size by 33%...
			var nShrink:Number = (Math.round((pc.cocks[iSmallestCock].cLengthRaw / 3) * 100) / 100);
			
			// Instantly reduces vaginal looseness by 1.
			if (pc.cockLengthUnlocked(iSmallestCock, pc.cocks[iSmallestCock].cLengthRaw - nShrink) || rand(10) == 0)
			{
				for (x = 0; x < pc.cocks.length; x++)
				{
					if (pc.cocks[x].cLengthRaw() > 3 && pc.cockLengthUnlocked(x, pc.cocks[x].cLengthRaw - nShrink))
					{
						pc.cocks[x].cLengthRaw -= nShrink;
						if (pc.cocks[x].cLengthRaw() < 3)
							pc.cocks[x].cLengthRaw = 3;
						iChanged++;
					}
				}
			}
			
			if (iChanged > 0)
			{
				output("\n\nYou shudder as your [pc.cocks] shrink until they have lost a fraction of their old size.");
				
				if (pc.isBro())
					output(" <i>Totally </i>not<i> what I wanted to do, man...</i>");
				
				// Reduce libido by 1 down to 10.
				if (pc.libidoRaw > (pc.libidoMin() + 10))
				{
					output("\n\nAs");
					if (iChanged == 1)
						output(" one of your cocks settles to its");
					else
						output(" your cocks settle to their");
					output(" new size, you feel a part of your urgency for lust fade with it...");
					pc.libido(-1);
				}
			}
			else
			{
				output("\n\n" + pc.cockLengthLockedMessage());
				
				// Reduce libido by 1 down to 10.
				if (pc.libidoRaw > (pc.libidoMin() + 10))
				{
					output("\n\nEven though your cocks refuse to change, you can feel a small part of your urgency for lust fade...");
					pc.libido(-1);
				}
			}
			
			// Done!
			useReductProDone();
			return;
		}
		
		// Balls
		private function useReductProShrinkBalls():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			output("You");
			if (pc.isCrotchGarbed())
				output(" open up your [pc.lowerGarments],");
			output(" unscrew the cap, squeeze the contents of ReductPro onto your hand, and smear the foul-smelling paste onto your " + pc.sackDescript() + ".  It feels cool at first but rapidly warms to an uncomfortable level of heat.");
			
			// Shrink ball size by up to 50%, depending on the size and how many of balls you have.
			var nReduce:Number = 1.00;
			if (pc.ballDiameter() < 1)
				nReduce -= 0.25;
			if (pc.ballDiameter() > 1)
				nReduce += 0.10;
			if (pc.ballDiameter() > 2)
				nReduce += 0.10;
			if (pc.ballDiameter() > 3)
				nReduce += 0.10;
			if (pc.ballDiameter() > 4)
				nReduce += 0.10;
			if (pc.ballDiameter() > 5)
				nReduce += 0.10;
			if (pc.balls == 1)
				nReduce -= 0.25;
			if (pc.balls >= 2)
				nReduce += 0.25;
			if (pc.balls >= 4)
				nReduce += 0.25;
			if (nReduce < 1.1)
				nReduce = 1.1;
			if (nReduce > 2)
				nReduce = 2;
			var sizeDec:Number = pc.ballSizeRaw - (pc.ballSizeRaw / nReduce);
			if (sizeDec < 0.2)
				sizeDec = 0.2;
			var nSize:Number = (Math.round((pc.ballSizeRaw - sizeDec) * 100) / 100);
			
			if (nSize >= 1 && pc.ballSizeUnlocked(nSize))
			{
				output("\n\nYou feel your scrotum shift, shrinking down along with your " + pc.ballsDescript() + ". Within a few seconds the paste has been totally absorbed and the shrinking stops.");
				pc.ballSize(nSize, true);
				
				if (pc.isBro())
					output(" <i>Ah man, come on now! Seriously?</i>");
				
				// Reduce libido by 1 down to 15.
				if (pc.libidoRaw > (pc.libidoMin() + 15))
				{
					output("\n\nAs your");
					if (pc.balls == 1)
						output(" ball shrinks to its");
					else
						output(" balls shrink to their");
					output(" new size, you feel a little bit of your libido fade as well...");
					pc.libido(-1);
				}
			}
			else
			{
				output("\n\n" + pc.cockLengthLockedMessage());
				
				// Reduce libido by 1 down to 10.
				if (pc.libidoRaw > (pc.libidoMin() + 10))
				{
					output("\n\nEven though your [pc.sack] remains unchanged, you can feel a small part of your libido fade...");
					pc.libido(-1);
				}
			}
			
			// If ball size is 4 inches or less, 10% chance to remove Nuki Nuts perk.
			// Nuki Nuts perk removal, must not be a Kui-tan:
			if (pc.ballSizeRaw <= 4 && pc.hasPerk("'Nuki Nuts") && pc.race() != "kui-tan" && rand(10) == 0)
			{
				output("\n\n");
				if (pc.cocks.length != 0)
					output("A small trickle of pre leaks from [pc.eachCock] as goosebumps travel up your back... ");
				output("You feel another change inside your [pc.sack] and give your [pc.balls] an experimental squeeze to find out that");
				if (pc.balls == 1)
					output(" it no longer grows");
				else
					output(" they no longer grow");
				output(" even if you’re feeling very pent-up. <b>(Perk Lost: Nuki Nuts!)</b>");
				
				pc.removePerk("'Nuki Nuts");
				if (pc.hasStatusEffect("Slow Grow")) pc.removeStatusEffect("Slow Grow");
				if (pc.hasStatusEffect("No Grow")) pc.removeStatusEffect("No Grow");						
			}
			else if (pc.hasPerk("'Nuki Nuts"))
			{
				// ... Adds status effect to prevent ball growth for 4 hours ...
				if (!pc.hasStatusEffect("No Grow") && rand(4) > 0)
				{
					output("\n\n");
					if (pc.cocks.length != 0)
						output("A small trickle of pre leaks from [pc.eachCock] as goosebumps travel up your back... ");
					output("You feel another change in your [pc.balls] and give your [pc.balls] an experimental squeeze to find out that");
					if (pc.balls == 1)
						output(" it");
					else
						output(" they");
					output(" won’t grow for a while. Could it be a temporary relief? <b>Your balls will not grow for four hours.</b>");
					
					pc.createStatusEffect("No Grow", 0, 0, 0, 0, false, "Blocked", "Expansion due to an overfull nutsack is currently prevented.", false, 240);
					
					useReductProDone();
					return;
				}
				// ... OR slow down ball growth by 10% multiplicatively and rounded...
				if (!pc.hasStatusEffect("Slow Grow"))
				{
					output("\n\n");
					if (pc.cocks.length != 0)
						output("A small trickle of pre leaks from [pc.eachCock] as goosebumps travel up your back... ");
					output("You feel another change in your [pc.sack] and give your [pc.balls] an experimental squeeze to find out that");
					if (pc.balls == 1)
						output(" it appears");
					else
						output(" they appear");
					output(" to be growing slower than normal. Looks like you can go a bit longer without having the weight of your [pc.ballsNoun] drag you down. <b>Your balls will now expand at a slower rate.</b>");
					
					pc.createStatusEffect("Slow Grow", 0.90, 0, 0, 0, true, "", "", false, 0);
				}
				// ... Down to a minimum of 1%.
				else if (pc.statusEffectv1("Slow Grow") > 0.1)
				{
					output("\n\n");
					if (pc.cocks.length != 0)
						output("A small trickle of pre leaks from [pc.eachCock] as goosebumps travel up your back... ");
					output("You feel another change inside your [pc.sack] and give your [pc.balls] an experimental squeeze to find out that");
					
					// by further 10%
					pc.addStatusValue("Slow Grow", 1, -Math.max(Math.round(pc.statusEffectv1("Slow Grow") * 0.1 * 100) / 100, 0.04));
					
					// min 1%
					if (pc.statusEffectv1("Slow Grow") < 0.01)
					{
						pc.setStatusValue("Slow Grow", 1, 0.01);
						
						if (pc.balls == 1)
							output(" it appears");
						else
							output(" they appear");
						output(" to be growing the slowest they've ever been. You doubt the weight of your [pc.ballsNoun] will be much of an issue for a long while. <b>Your balls will now expand at the slowest rate possible.</b>")
					}
					else
					{
						if (pc.balls == 1)
							output(" it appears");
						else
							output(" they appear");
						output(" to be growing much slower than normal. You can probably go around longer without being worried about the weight of your [pc.ballsNoun] dragging you down. <b>Your balls will expand at an even slower rate.</b>")
					}
				}
			}
			useReductProDone();
			return;
		}
		
		// Hips
		private function useReductProShrinkHips():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			output("Standing straight, you");
			if (pc.isCrotchGarbed())
				output(" open up your [pc.lowerGarments] to ready yourself for the application. Next, you");
			output(" unscrew the cap, squeeze the contents of ReductPro and smear them evenly onto your [pc.hips]. It feels cool at first but rapidly warms to an uncomfortable level of heat.");
			
			// Shrink hip rating by up to 4.
			var nShrink:Number = 1 + rand(4);
			if (pc.hipRating() < 8)
				Math.floor(nShrink /= 2);
			if (pc.hipRatingRaw >= nShrink && pc.hipRatingUnlocked(pc.hipRatingRaw - nShrink))
			{
				output("\n\nYou shudder as the changes begin to take effect...");
				output(" Your [pc.hips] visibly narrow by a");
				if (nShrink <= 1)
					output(" tiny");
				else if (nShrink <= 2)
					output(" small");
				else if (nShrink <= 3)
					output(" decent");
				else
					output(" great");
				output(" amount, making your [pc.legOrLegs] wobble a bit while trying to remain upright. <b>You feel lighter thanks to the shrinkage of your hips.</b>");
				
				pc.hipRating(-nShrink);
				
				if (pc.isBimbo())
					output(" <i>But that's, like, my money maker!</i>");
				
				useReductProDone();
				return;
			}
			else
			{
				output("\n\n" + pc.hipRatingLockedMessage());
				
				useReductProDone(true);
				return;
			}
		}
		
		// Butt
		private function useReductProShrinkButt():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			output("You");
			if (pc.isCrotchGarbed())
				output(" open up your [pc.lowerGarments], ");
			output(" unscrew the cap, squeeze the contents of ReductPro onto your hand and smear the foul-smelling paste onto your " + pc.buttDescript() + ". It feels cool at first but rapidly warms to an uncomfortable level of heat.");
			
			// Shrink butt rating by up to 4.
			var nShrink:Number = 1 + rand(4);
			if (pc.buttRatingRaw < 8)
				Math.round(nShrink /= 2);
			if (pc.buttRatingRaw >= nShrink && pc.buttRatingUnlocked(pc.buttRatingRaw - nShrink) || rand(10) == 0)
			{
				output("\n\nSuddenly, You shudder as the changes take place...");
				output(" Your [pc.butts] begin to shrink by a");
				if (nShrink <= 1)
					output(" tiny");
				else if (nShrink <= 2)
					output(" small");
				else if (nShrink <= 3)
					output(" decent");
				else
					output(" great");
				output(" amount, making your [pc.hips] sway in response. You turn back and confirm that <b>your ass has reduced to a smaller size.</b>");
				
				pc.buttRating(-nShrink);
				
				if (pc.isBimbo())
					output(" <i>Oh no, not my booty!</i>");
				else if (pc.buttRating() <= 8)
					output(" You feel like a dragging weight has been lifted off your behind.");
				else
					output(" It's not much, but it is noticeable.");
				
				// Reduce libido by 1 down to 20.
				if (pc.libidoRaw > (pc.libidoMin() + 20))
				{
					output("\n\nYou cup your smaller [pc.butts] and feel a soft tingle with a little bit of clarity returning to you. It seems your shrinking derrière has taken a piece of libido with it...");
					pc.libido(-1);
				}
			}
			else
			{
				output("\n\n" + pc.buttRatingLockedMessage());
				
				// Reduce libido by 1 down to 20.
				if (pc.libidoRaw > (pc.libidoMin() + 20))
				{
					output("\n\nOdd... Even though your [pc.butt] remains unchanged, you can feel a small part of your libido fade...");
					pc.libido(-1);
				}
			}
			
			// Done!
			useReductProDone();
			return;
		}
		
		// Belly
		private function useReductProShrinkBelly():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			output("You");
			if (pc.isChestCovered())
				output(" open up your [pc.upperGarments], ");
			output(" unscrew the cap and squeeze the contents of ReductPro and rub them evenly onto your [pc.belly]. It feels cool at first but rapidly warms to an uncomfortable level of heat.");
			
			// Shrink belly rating by up to 4.
			var nShrink:Number = 1 + rand(4);
			if (pc.bellyRatingRaw < 8)
				Math.round(nShrink /= 2)
			if (pc.bellyRatingRaw > 1)
			{
				output("\n\nAlmost instantaneously, you shudder as the changes take place...");
				output(" Your belly");
				if (pc.isPregnant())
					output(" pulses");
				else
					output(" gurgles");
				output(" softly as you rub your hands across the surface, feeling the microsurgeons reshape your mid-section. Your [pc.belly] calms as it gradually loses a");
				if (nShrink <= 1)
					output(" tiny");
				else if (nShrink <= 2)
					output(" small");
				else if (nShrink <= 3)
					output(" decent");
				else
					output(" great");
				output(" amount of mass. When it is finally finished, you give a relieved sigh. <b>Your stomach is now flatter.</b>");
				
				pc.bellyRatingRaw -= nShrink;
				if (pc.bellyRatingRaw < 0)
					pc.bellyRatingRaw = 0;
				
				useReductProDone();
				return;
			}
			else
			{
				output("\n\nThere is a rumbling warmth in your [pc.belly], and then... nothing. Hm, it seems that whatever change was about to happen had quickly dissipated.");
				if (pc.bellyRating() > 0 && pc.isPregnant())
					output(" The extra mass on the your belly must be maternal.");
				else
					output(" Your stomach must be too flat to shrink anymore.");
				
				useReductProDone(true);
				return;
			}
		}
		
		// Anus
		private function useReductProShrinkAnus():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			if (kGAMECLASS.flags["REDUCTPRO_USED_ON_VAGINA"] == undefined && kGAMECLASS.flags["REDUCTPRO_USED_ON_ASSHOLE"] == undefined)
				output("Even though the paste is intended for topical use, you are curious to see what it will do internally. Only one way to find out, right? ");
			else if (kGAMECLASS.flags["REDUCTPRO_USED_ON_ASSHOLE"] == undefined)
				output("You already know what happens when this drug is applied to your cooch, but you wonder if the same applies to your rectum... ");
			output("You");
			if (pc.isCrotchGarbed())
				output(" open up your [pc.lowerGarments],");
			output(" unscrew the cap, squeeze the contents of ReductPro onto your fingers, and apply the foul-smelling paste onto your [pc.asshole], making sure to lather the rim nicely before injecting the rest inside yourself.");
			
			// Instantly reduces anal looseness by 1.
			if (pc.loosenessUnlocked(-1, pc.ass.loosenessRaw - 1))
			{
				output("\n\nYour sphincter throbs momentarily, giving you a sign that the drug is actually working.");
				if (kGAMECLASS.flags["REDUCTPRO_USED_ON_ASSHOLE"] == undefined)
					output(" To your surprise");
				else
					output(" As expected");
				output(", <b>your anus has instantly tightened!</b>");
				
				pc.ass.loosenessRaw--;
				
				kGAMECLASS.flags["REDUCTPRO_USED_ON_ASSHOLE"] = 1;
				
				// Done!
				useReductProDone();
				return;
			}
			else
			{
				output("\n\n" + pc.loosenessLockedMessage());
				useReductProDone(true);
				return;
			}
		}
		
		// Horns
		private function useReductProShrinkHorns():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			if (kGAMECLASS.flags["REDUCTPRO_USED_ON_HORNS"] == undefined)
				output("You doubt if the ReductPro is going to work on your [pc.hornsNoun] but you proceed to unscrew the cap, squeeze out the contents and rub the paste all over your [pc.horns] anyway.");
			else
				output("You unscrew the cap, squeeze out the contents of the ReductPro and rub the paste all over your [pc.horns].");
			
			var newHornLength:Number = pc.hornLength - 1;
			if ((pc.hornLength > 0 && pc.hornLengthUnlocked(newHornLength)) || pc.hasStatusEffect("Horn Bumps"))
			{
				output("\n\n");
				if (kGAMECLASS.flags["REDUCTPRO_USED_ON_HORNS"] == undefined)
					output("It works much to your surprise! ");
				
				if (!pc.hasStatusEffect("Horn Bumps"))
				{
					// Not all horns are malleable--need to make special cases...
					if (pc.hornType == 0)
					{
						output("[pc.EachHorn] vibrates vigorously, as if it is something that does not belong on your head... And so it seems, </b>the [pc.hornsNoun] rapidly vanish");
						if (pc.horns != 1)
							output("es");
						output(", leaving your head void of any kind of horns!");
						pc.hornLength = 0;
						pc.horns = 0;
						pc.hornType == 0;
					}
					else if (pc.hornType == GLOBAL.TYPE_DEMONIC)
					{
						output("Your demonic-looking horns crackle and warp as the drug kicks in.");
						if (pc.horns > 2)
						{
							output(" As this happens, you can feel your horns starting to decrase in");
							if (pc.horns <= 8)
								output(" size and");
							pc.horns -= 2;
							if (pc.horns < 2)
								pc.horns == 2;
							output(" number. When the transformation finally completes, you rub your hand alongside each horn. <b>You now have " + num2Text(pc.horns) + " horns total.</b>");
						}
						else
						{
							output(" The two horns begin to shrink smaller and smaller, looking less and less threatening. <b>Your horns finally recede into your head, becoming small, barely visible horn bumps!</b>");
							pc.hornLength = 0;
							pc.horns = 0;
							pc.hornType == 0;
							pc.createStatusEffect("Horn Bumps");
						}
					}
					else if (pc.hornType == GLOBAL.TYPE_BOVINE)
					{
						output("A tingling sensation runs across the length of your bovine horns as the drug kicks in.");
						if (pc.hornLength >= 2)
						{
							pc.hornLength--;
							output(" You can feel your pair of horns receding by one inch. <b>You now have a pair of " + num2Text(pc.hornLength) + "-inch horns.</b>");
						}
						else if (pc.hornLength > 0.5 && pc.hornLength <= 1)
						{
							output(" <b>You can feel your pair of horns receding until they stop to about half-an-inch.</b>");
							if (pc.isBimbo())
								output(" <i>Cute!</i>");
							pc.hornLength = 0.5;
						}
						else
						{
							output(" Even with how tiny they are, the paste is pretty effective, causing your calf-like horns to shrink. <b>Your horns keep receding into your head until they become small, barely visible horn bumps!</b>");
							pc.hornLength = 0;
							pc.horns = 0;
							pc.hornType == 0;
							pc.createStatusEffect("Horn Bumps");
						}
					}
					else if (pc.hornType == GLOBAL.TYPE_LIZAN)
					{
						output("Your");
						if (pc.horns != 2)
						{
							pc.horns = 2;
							pc.hornLength = 15;
							output(" draconic horns soften and vibrate quietly as the drug kicks in. The four horns begin to merge into themselves, changing and rearranging the total mass. As the mass solidifies, <b>you are left with two, " + num2Text(pc.hornLength) + "-inch, reptilian horns.</b>");
						}
						else if (pc.hornLength > 1)
						{
							pc.hornLength--;
							output(" reptilian horns soften and vibrate quietly as the drug kicks in. You can feel your pair of horns receding by one inch. <b>You now have a pair of " + num2Text(pc.hornLength) + "-inch horns.</b>");
						}
						else
						{
							output(" horns soften and vibrate quietly as the drug kicks in. The pair begin to shrink smaller and smaller, looking less and less reptilian. <b>Your horns finally recede into your head, becoming small, barely visible horn bumps!</b>");
							pc.hornLength = 0;
							pc.horns = 0;
							pc.hornType == 0;
							pc.createStatusEffect("Horn Bumps");
						}
					}
					else if (pc.hornType == GLOBAL.TYPE_DEER)
					{
						output("Your pair of deer-like antlers begin to melt and shift, and the branches of each start to fuse with themselves.");
						if (pc.horns > 4)
						{
							pc.horns -= 2;
							if (pc.horns < 4)
								pc.horns == 4;
							output(" After a moment to quickly solidify, <b>you find that your antlers have less prongs, giving you " + num2Text(pc.horns) + " antler points total.</b>");
						}
						else
						{
							output(" The " + num2Text(pc.horns) + " antler points quickly merge with one another to form two long horns. Examining yourself, you find that <b>your head posses a pair of six-inch horns, making you appear very much like a " + pc.mf("bull", "cow") + "!</b>");
							pc.hornLength = 6;
							pc.horns = 2;
							pc.hornType == GLOBAL.TYPE_BOVINE;
						}
					}
					else if (pc.hornType == GLOBAL.TYPE_GOAT)
					{
						output(" Like a loose hose, you ram-like horns begin to unravel themselves, straightening out, while curving forward. When the morphing process is complete, you discover that <b>you now have a pair of dangerous, foot-long horns, making you appear very much like a bull!</b>");
						pc.hornLength = 12;
						pc.horns = 2;
						pc.hornType == GLOBAL.TYPE_BOVINE;
					}
					else if (pc.hornLength > 1)
					{
						// Shrink horns by 1 inch.
						output("A tingling sensation runs across the length of your [pc.hornsNoun] as the drug activates. <b>You can feel your [pc.hornsNoun] receding by one inch.</b>");
						pc.hornLength--;
					}
					else
					{
						output("As the drug activates, you run your fingers over your very small and rapidly shrinking [pc.hornsNoun]. [EachHorn] diminishes in size until there is nothing left. <b>You have lost your [pc.hornsNoun]!</b>");
						pc.hornLength = 0;
						pc.horns = 0;
						pc.hornType == 0;
					}
				}
				else
				{
					output("\n\nThe small horn bumps on your head pulsate softly. As you rub them against your fingers, you can feel them smoothing out and fading away completly. <b>Your head is now bare of any horns!</b>");
					pc.hornLength = 0;
					pc.horns = 0;
					pc.hornType == 0;
					pc.removeStatusEffect("Horn Bumps");
				}
				output("\n\nAfter the feeling subsides, you close the empty container and throw it away, washing your hands afterward.");
			}
			else
			{
				output("\n\n" + pc.hornLengthLockedMessage());
				output("\n\nRubbing your [pc.hornsNoun], you sigh in disappointment and throw out the empty container, washing your hands afterward.");
			}
			
			kGAMECLASS.flags["REDUCTPRO_USED_ON_HORNS"] = 1;
			if (kGAMECLASS.flags["TIMES_REDUCTPRO_USED"] == undefined)
				kGAMECLASS.flags["TIMES_REDUCTPRO_USED"] = 1;
			else
				kGAMECLASS.flags["TIMES_REDUCTPRO_USED"]++;
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.mainGameMenu);
			
			return;
		}
		
		private function useReductProDone(failed:Boolean = false):void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			output("\n\n");
			if (!failed)
				output("Recovering from the sensation, you close the empty container and throw it away");
			else
				output("You sigh in disappointment and throw out the empty container");
			output(", washing your hands afterward");
			if (!pc.isNude())
				output(", and redressing your gear");
			output(".");
			
			if (kGAMECLASS.flags["TIMES_REDUCTPRO_USED"] == undefined)
				kGAMECLASS.flags["TIMES_REDUCTPRO_USED"] = 1;
			else
				kGAMECLASS.flags["TIMES_REDUCTPRO_USED"]++;
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.mainGameMenu);
			kGAMECLASS.itemConsume(this);
			return;
		}
		
		private function menuReductProQuit():void
		{
			clearOutput();
			var pc:PlayerCharacter = kGAMECLASS.pc;
			
			output("You decide not to use the cream and put the container back into its box and into your inventory.");
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.mainGameMenu);
			return;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			if (target is PlayerCharacter)
			{
				var firstTime:Boolean = false;
				if (kGAMECLASS.flags["TIMES_USED_REDUCTPRO"] == undefined)
					firstTime = true;
				
				// Usage Menu:
				output("You open the colourfully-packaged box");
				if (firstTime)
					output(",");
				else
					output(" and");
				output(" pull the paste container out of the box");
				if (firstTime)
				{
					output(" and decide to scan the item. The codex pulls up a research abstract that reveals the drug is completely safe to use although it’s quite potent");
					if (CodexManager.entryViewed("Simii"))
						output(", even capable of affecting the Simii");
					if (target.originalRace == "half kui-tan" || target.race() == "half kui-tan" || target.race() == "kui-tan" || CodexManager.entryViewed("Kui-Tan"))
						output(". ReductPro is proven to curb the testicular growth in Kui-tan");
					output("."); //As the article on it ends, your codex beeps and informs you this drug was invented by a rat-eared doctor known as Professor Azul. He is reputed to be the galaxies’ greatest alchemist in some pharmacy circles.
				}
				else
					output(".");
				
				// Question
				menuReductProOptions();
				if (!kGAMECLASS.infiniteItems())
					quantity++;
				return true;
			}
			//Not the player!
			else
			{
				output(target.capitalA + target.short + " opens the container and applies the paste to [target.hisHer]self, but to no effect.");
			}
			return false;
		}
	}
}
