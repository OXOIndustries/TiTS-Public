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
			kGAMECLASS.showName("\nREDUCTPRO");
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
				else
				{
					if (pc.nippleLengthRatio > 0.1)
						addButton(1, "Nipples", useReductProShrinkNipples, 0, "Nipples", "Apply the paste to your [pc.nipples].");
					else
						kGAMECLASS.addDisabledButton(1, "Nipples", "Nipples", "Your nipples are already as flat as they can be!");
				}
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
				output("\n\nIt looks like you only have the one...");
			else
			{
				output("\n\n<b><u>Total Rows:</u></b> " + pc.breastRows.length);
				//output("\n<b>Total Breast Count:</b> " + pc.totalBreasts());
				
				for (var x:int = 0; x < pc.breastRows.length; x++)
				{
					output("\n<b>" + StringUtil.capitalize(num2Ordinal(x + 1)) + " Row:</b> ");
					output(pc.breastRows[x].breasts + " ");
					if (pc.breastRows[x].breastRating() > 0) output(pc.breastCup(x));
					else output("flat pectoral");
					if (pc.breastRows[x].breasts > 1) output("s");

					// Valid boob row
					addButton(x, String("Row " + (x + 1)), useReductProShrinkBreasts, x);
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
			
			if (pc.isChestCovered()) output("You remove your [pc.chestCovers] to prepare. ");
			output("Unscrewing the cap, you squeeze the contents of ReductPro into your hand and apply the paste over your [pc.chest " + rowNum + "].");
			
			if (pc.biggestTitSize() <= 0)
			{
				output(" A slight tingle makes you shudder, but then the feeling passes as soon as it starts... Perhaps you are as flat as you're going to get?");				
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
				output(" It tingles as the selected flesh shrinks to a");
				if (nShrink < 2) output(" slightly");
				else if (nShrink > 2) output(" much");
				output(" smaller size!");
				
				pc.breastRows[rowNum].breastRatingRaw -= nShrink;
				if(pc.breastRows[rowNum].breastRatingRaw < 0) pc.breastRows[rowNum].breastRatingRaw = 0;
				
				// Critical shrink!
				if (pc.breastRows[rowNum].breastRatingRaw >= 1 && rand(4) == 0)
				{
					nShrink = 1 + rand(2);
					
					output("\n\n");
					if (kGAMECLASS.silly) output("<b>Critical shrinkage!</b> ");
					output("A sharp tingle informs you that the ReductPro isn't done yet! The pasty substance continues to act, stealing still more size from your dwindling chest!");
					pc.breastRows[rowNum].breastRatingRaw -= nShrink;
					if(pc.breastRows[rowNum].breastRatingRaw < 0) pc.breastRows[rowNum].breastRatingRaw = 0;
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
						output(" breasts are " + pc.breastCup(rowNum) + "s.");
					else
						output(" breasts are now flat pectorals.");
				}
				output("</b>");
				
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
			
			if (pc.isChestCovered()) output("You remove your [pc.chestCovers] to prepare. ");
			output("Unscrewing the cap, you squeeze the contents of ReductPro into your hand and apply the paste over your " + pc.allBreastsDescript() + ", covering them entirely.");


			if (pc.biggestTitSize() <= 0)
			{
				output(" A slight tingle makes you shudder, but then the feeling passes as soon as it starts... Perhaps you are as flat as you're going to get?");
				
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
				output(" A slight tingle draws your attention as they shrink to a");
				if (nShrink < 2)
					output(" slightly");
				else if (nShrink > 2)
					output(" much");
				output(" smaller size!");
				
				for (x = 0; x < pc.breastRows.length; x++)
				{
					pc.breastRows[x].breastRatingRaw -= nShrink;
					if(pc.breastRows[x].breastRatingRaw < 0) pc.breastRows[x].breastRatingRaw = 0;
				}
				
				// Critical shrink!
				if (pc.breastRows[pc.biggestTitRow()].breastRatingRaw > 0 && rand(4) == 0)
				{
					nShrink = 1 + rand(2);
					
					output(" No sooner than you adjust to the newer, more compact you, than the ReductPro continues to act, further reducing the size of your chest!");
					for (x = 0; x < pc.breastRows.length; x++)
					{
						pc.breastRows[x].breastRatingRaw -= nShrink;
						if(pc.breastRows[x].breastRatingRaw < 0) pc.breastRows[x].breastRatingRaw = 0;
					}
				}
				
				output("A minute later you confirm that <b>your");
				if (pc.breastRows[pc.biggestTitRow()].breastRating() > 0)
					output(" biggest breasts are now " + pc.breastCup(pc.biggestTitRow()) + "s.</b>");
				else
					output(" breasts are more or less gone</b>, in their place, flat pectorals remain.");
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
		
		/* Nipples (Single Row) - Brings up prompt on which row to shrink.
		//FEN NOTE: COMPLETELY CUT THIS BECAUSE THERE IS NO REASON TO SELECT A ROW. FUCKING... I EDITED THE TEXT BEFORE I REALIZED HOW FUCKTARDED THIS ALL WAS. KILL ME FUCKING NOW.


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
				output("\n\n<b>Total Rows:</b> " + pc.breastRows.length + " with " + num2Text(pc.nipplesPerBreast) + " nipple");
				if (pc.nipplesPerBreast != 1) output("s");
				output(" per breast.");

				for (var x:int = 0; x < pc.breastRows.length; x++)
				{
					output("\n<b>" + StringUtil.capitalize(num2Ordinal(x + 1)) + " Row:</b> " + GLOBAL.NIPPLE_TYPE_NAMES[pc.breastRows[x].nippleType] + " Nipples, " + Math.round(pc.nippleLength(x)*10)/10 + " inch");
					if (Math.round(pc.nippleLength(x)*10)/10) output("es");
					output(" long and " + Math.round(pc.nippleWidth(x)*10)/10 + " inch");
					if (Math.round(pc.nippleWidth(x)*10)/10) output("es");
					output(" wide.");

					// Valid nipple row
					addButton(x, String("Row " + (x + 1)), useReductProShrinkNipples, x);
				}
			}
			addButton(14, "Back", menuReductProOptions, true, "Nevermind", "Choose something else...");
			
			return;
		}*/
		
		// Nipples (rowNum: -1 is all, 0+ is a row)
		// Fen note: row selection is dumb and useless given how we do nipple size. Fuck you, game.
		private function useReductProShrinkNipples(rowNum:int = 0):void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			var x:int = 0;
			var nShrink:Number = Math.max((pc.nippleLengthRatio * 0.5) / pc.breastRows.length, 0.1);
			var bChanged:Boolean = false;
			
			if (pc.isChestCovered()) output("You remove your [pc.chestCovers] to prepare. ");
			output("Unscrewing the cap, you squeeze the contents of ReductPro into your hand and apply the paste over ");
			
			if(pc.totalNipples() == 1) output("your single [pc.nippleNoun] evenly.");
			else output(" every single [pc.nipplesNoun] evenly.");
			
			if (pc.nippleLengthRatio <= 0.1 || pc.hasFlatNipples())
			{
				output(" You shudder the resulting tingle for a short moment, but then the feeling passes as soon as it starts... Looks like your [pc.nipples] won't be getting any smaller...");
				useReductProDone(true);
				return;
			}
			
			// Shrink nipple size by 50% divided by the number of rows.
			if (pc.nippleLengthRatioUnlocked(pc.nippleLengthRatio - nShrink))
			{
				output(" You shudder as the coating causes your flesh to shrink.");
				pc.nippleLengthRatio -= nShrink;
				if (pc.nippleLengthRatio < 0.1) pc.nippleLengthRatio = 0.1;
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
										output(" The slit in your [pc.nippleNoun " + x + "] feels tighter, and as you reach your fingers to it, you can find no trace of it. <b>Your nipple is no longer fuckable!</b>");
									else
										output(" The slits in your [pc.nipplesNoun " + x + "] feel tighter, and as you reach your fingers to touch them, you can find no trace of the once-pliant entrances. <b>Your nipples are no longer fuckable!</b>");
									bChanged = true;
								}
								pc.breastRows[x].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
							}
							else if (pc.breastRows[x].nippleType == GLOBAL.NIPPLE_TYPE_DICK)
							{
								if (!bChanged)
								{
									if (pc.totalNipples() == 1)
										output(" Your [pc.nippleCock] slides out to full erection in protest before withdrawing back inside your body, shrinking down into nothing. You give your [pc.nipple " + x + "] an experimental pinch to confirm that you no longer have it. <b>You have lost your nipple-cock!</b>");
									else
										output(" Your [pc.nippleCocks] slide out to full erection in protest before withdrawing back inside your body, their tumescence dwindling to less than nothing. You give your [pc.nipples " + x + "] an experimental pinch to confirm that nothing remains. <b>You have lost your nipple-cocks!</b>");
									bChanged = true;
								}
								
								pc.breastRows[x].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
							}
						}
					}
				}
				// May get flat nipples!
				/* FEN NOTE: No, this will fuck with too much shit.
				else if (pc.nippleLengthRatio <= 0.2 && !pc.hasFlatNipples() && rand(2) == 0)
				{
					for (x = 0; x < pc.breastRows.length; x++)
					{
						if (pc.nippleTypeUnlocked(x, GLOBAL.NIPPLE_TYPE_FLAT))
						{
							if (!bChanged)
							{
								if (pc.totalNipples() == 1)
									output(" Rubbing the tip with your fingertips, you feel the nub getting smaller and smaller... until it completely disappears, leaving behind blank, pebbly surface <b>You now have a flat nipple!</b>");
								else
									output(" Rubbing your tips with your fingertips, you feel the nubs getting smaller and smaller... until they completely disappear, each leaving behind a flat, pebbly surface <b>You now have flat nipples!</b>");
								bChanged = true;
							}
							pc.breastRows[x].nippleType = GLOBAL.NIPPLE_TYPE_FLAT;
						}
					}
				}*/
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
			if (!pc.isCrotchExposed()) output(" open up your [pc.crotchCovers],");
			output(" unscrew the cap, squeeze the contents of ReductPro onto your fingers, and proceed to apply the paste to your [pc.vaginas].");
			
			//Reduce plump flags!
			if(pc.hasPlumpPussy())
			{
				output(" Right away, something happens. A shock of sudden tightness in your nethers demands your attention as your swollen netherlips slim down.");
				var pumpReported:Boolean = false;
				for(var y:int = 0; y < pc.totalVaginas(); y++)
				{
					if(pc.hasPlumpPussy(y))
					{
						pc.deflateVagina(y);
						if(!pumpReported)
						{
							if(pc.vaginas[y].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED)) output(" <b>Your [pc.vaginaNoun " + y + "] is less plump</b>, though only slightly so.")
							else output(" <b>Your [pc.vaginaNoun " + y + "] is no longer so quite so plump</b>.");
							pumpReported = true;
						}
					}
				}
				output("\n\nEverything is so delightfully sensitive afterward, you're tempted to use it again.");
				pc.libido(4);
				pc.taint(2);
				kGAMECLASS.flags["REDUCTPRO_USED_ON_VAGINA"] = 1;
				useReductProDone(true);
				return;
			}

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
				output("\n\nA clenching sensation deep in your [pc.vaginas] signals that the drug is working its magic.");
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
				output(" instantly tightened!</b> Phew! Nothing else seems to happen, aside from a residual flush and the knowledge that you can stuff whatever you want up there with no repurcussions at all. Horray, science!");
				pc.taint(2);
				pc.libido(4);
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
			
			if (!pc.isCrotchExposed()) output("Moving your clothing out of the way, y");
			else output("Y");
			output("ou unscrew the cap to carefully apply the paste to your " + pc.clitsDescript() + ". You'd hate to get any on your [pc.vaginas]. Burning heat envelops your hyper-sensitive organ");
			if(pc.totalClits() > 1) output("s");
			output(", signalling that something is about to happen.");
			var newClitLength:Number = Math.round((pc.clitLength / (1 + (0.7 / (Math.ceil(pc.totalClits()) / 2)))) * 100) / 100;
			if (pc.clitLength > 0 && pc.clitLengthUnlocked(newClitLength))
			{
				if (pc.totalClits() == 1)
					output("\n\nYour " + pc.clitDescript() + " shrinks rapidly, dwindling down to almost half its old size before it finishes absorbing the ReductPro.");
				else
					output("\n\nYour " + pc.clitsDescript() + " shrink rapidly, dwindling down to almost half their old size before they finishes absorbing the ReductPro.");
				pc.clitLength -= (Math.round((pc.clitLength / 3) * 100) / 100);
				if (pc.clitLength < 0)
					pc.clitLength = 0.01;
			
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
				
				for (x = 0; x < pc.cocks.length; x++)
				{
					output("\n<b>" + StringUtil.capitalize(num2Ordinal(x + 1)) + " Cock:</b> " + pc.accurateCockName(x));
					output("\n\tLength: " + formatFloat((pc.cocks[x] as CockClass).cLength(), 3) + " inch");
					if (pc.cocks[x].cLength() != 1) output("es");
					output("\n\tGirth: " + formatFloat((pc.cocks[x] as CockClass).thickness(), 3) + " inch");
					if (pc.cocks[x].thickness() != 1) output("es");
					
					// Valid cock
					addButton(x, String("Cock " + (x + 1)), useReductProShrinkCock, x);
				}
			}
			addButton(14, "Back", menuReductProOptions, true, "Nevermind", "Choose something else...");
			return;
		}
		//fen redux continue here
		// Cock (Single)
		private function useReductProShrinkCock(cockNum:int = 0):void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			clearOutput();
			kGAMECLASS.userInterface.author("Kitteh6660");
			
			output("You");
			if (!pc.isCrotchExposed()) output(" pull open your attire in order to");
			else output(" unscrew the cap in order to");
			output(" smear the repulsive smelling paste over your " + pc.cockDescript(cockNum) + ". It immediately begins to grow warm, almost uncomfortably so");
			if (pc.cocks[cockNum].cLength() > 3) output(", as it starts to shrink");
			output(".");
			
			// Too short!
			if (pc.cocks[cockNum].cLength() <= 3)
			{
				output(" The feeling is short-lived. You go flaccid after a second with no change in size... Perhaps <b>you've reached the minimum size this product allows?</b>");				
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
				output(" Small twitches ripple through the length of your diminishing phallus until");
				pc.cocks[cockNum].cLengthRaw -= nShrink;
				if (pc.cocks[cockNum].cLengthRaw < 3)
				{
					// ... down to a minimum of 3 inches.
					pc.cocks[cockNum].cLengthRaw = 3;
					output(" it halts around three inches in length");
				}
				else output(" one third of its mass has vanished");
				output(".</b>");
				
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
			if (!pc.isCrotchExposed()) output(" open up your [pc.crotchCovers] to");
			if(!pc.isErect()) output(" stroke all of your [pc.cocks] until they are brought to full erection. Next, you");
			output("squeeze the tube of ReductPro all over them, spreading the pasty substance evenly across your");
			if (pc.cocks.length == 2) output(" pair of");
			else output(" multitudinous");
			output(" manhoods.");
			
			// Too short!
			if (pc.longestCockLength() <= 3)
			{
				output("Pulsing shocks grow and grow... and fade to nothing. Perhaps <b>you're as small as this product can possibly make you.</b>");
				
				// Reduce libido by 1 down to 10.
				if (pc.libidoRaw > (pc.libidoMin() + 10))
				{
					output("\n\nEven though your cocks refuse to change, you can feel a slight reduction in the accompanying urges.");
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
					if (pc.cocks[x].cLengthRaw > 3 && pc.cockLengthUnlocked(x, pc.cocks[x].cLengthRaw - nShrink))
					{
						pc.cocks[x].cLengthRaw -= nShrink;
						if (pc.cocks[x].cLengthRaw < 3)
							pc.cocks[x].cLengthRaw = 3;
						iChanged++;
					}
				}
			}
			
			if (iChanged > 0)
			{
				output(" Shudders and twitches ripple through your [pc.cocks] as the chemical treatment works its magic, stealing your mass like a thief in the night.");
							
				// Reduce libido by 1 down to 10.
				if (pc.libidoRaw > (pc.libidoMin() + 10))
				{
					output("\n\nAs");
					if (iChanged == 1)
						output(" one of your cocks settles to its");
					else
						output(" your cocks settle to their");
					output(" new size, you feel your urges shrinking apace...");
					pc.libido(-1);
				}
			}
			else
			{
				output("\n\n" + pc.cockLengthLockedMessage());
				
				// Reduce libido by 1 down to 10.
				if (pc.libidoRaw > (pc.libidoMin() + 10))
				{
					output("\n\nEven though your cocks refuse to change, you can feel a slight reduction in the accompanying urges.");
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
			if (!pc.isCrotchExposed())
				output(" open up your [pc.crotchCovers],");
			output(" unscrew the cap");
			if(!pc.isCrotchExposed()) output(",");
			output(" and squeeze the contents of ReductPro onto your hand. The foul-smelling paste smears onto your " + pc.sackDescript() + " with ease.  It feels cool at first but rapidly warms to discomfort by the time you've finished applying it.");
			
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
				output(" You feel your scrotum shift, shrinking down along with your " + pc.ballsDescript() + ". Within a few seconds, the paste's shrinking power has been exhausted.");
				pc.ballSize(nSize, true);
			}
			else
			{
				output("\n\n" + pc.cockLengthLockedMessage());
			}
			
			// If ball size is 4 inches or less, 10% chance to remove Nuki Nuts perk.
			// Nuki Nuts perk removal, must not be a Kui-tan:
			/* FEN NOTE!: I cut this. You already lose the perk when your kui-tan score drops.
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
			}*/
			if (pc.hasPerk("'Nuki Nuts"))
			{
				// ... Adds status effect to prevent ball growth for 4 hours ...
				if (!pc.hasStatusEffect("No Grow") && rand(4) > 0)
				{
					output("\n\n");
					if (pc.cocks.length != 0)
						output("A small trickle of pre leaks from [pc.eachCock] as goosebumps travel up your back... ");
					output("You feel another change in your [pc.balls] and give yourself an experimental squeeze to little effect.");
					if (pc.balls == 1)
						output(" It");
					else
						output(" They");
					output(" seem subtly different. Could the ReductPro be temporarily suppressing your ability to swell up with excess seed?");
					
					pc.createStatusEffect("No Grow", 0, 0, 0, 0, false, "Blocked", "Expansion due to an overfull nutsack is currently prevented.", false, 240);
					
					useReductProDone();
					return;
				}
				/* FEN NOTE: Cutting this. Buncha needlessly complex shit piled ontop of an overly complex system
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
				}*/
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
			
			output("Standing straight, you unscrew the cap and squeeze the contents of ReductPro evenly onto your [pc.hips]. It feels cool at first but rapidly warms to an uncomfortable heat.");
			
			// Shrink hip rating by up to 4.
			var nShrink:Number = 1 + rand(4);
			if (pc.hipRating() < 8)
				Math.floor(nShrink /= 2);
			if (pc.hipRatingRaw >= nShrink && pc.hipRatingUnlocked(pc.hipRatingRaw - nShrink))
			{
				output(" You shudder as the changes begin to take effect...");
				output(" Your [pc.hips] visibly narrow by a");
				if (nShrink <= 1)
					output(" tiny");
				else if (nShrink <= 2)
					output(" small");
				else if (nShrink <= 3)
					output(" decent");
				else
					output(" great");
				output(" amount, making you wobble a bit and threaten to tip over.");
				
				pc.hipRating(-nShrink);
				
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
			
			output("You unscrew the cap, squeeze the contents of ReductPro onto your hand and smear the foul-smelling paste onto your " + pc.buttDescript() + ". It feels cool at first but rapidly warms to an uncomfortable level of heat.");
			
			// Shrink butt rating by up to 4.
			var nShrink:Number = 1 + rand(4);
			if (pc.buttRatingRaw < 8)
				Math.round(nShrink /= 2);
			if (pc.buttRatingRaw >= nShrink && pc.buttRatingUnlocked(pc.buttRatingRaw - nShrink) || rand(10) == 0)
			{
				output(" Your [pc.butts] begin to shrink by a");
				if (nShrink <= 1)
					output(" tiny");
				else if (nShrink <= 2)
					output(" small");
				else if (nShrink <= 3)
					output(" decent");
				else
					output(" great");
				output(" amount, making your [pc.hips] sway in response. You turn back and confirm that <b>your ass is smaller!</b>");
				
				pc.buttRating(-nShrink);
			}
			else
			{
				output("\n\n" + pc.buttRatingLockedMessage());
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
			
			output("You unscrew the cap and squeeze the contents of ReductPro evenly onto your [pc.belly]. It feels cool at first but rapidly warms to an uncomfortable level of heat.");
			
			// Shrink belly rating by up to 4.
			var nShrink:Number = 1 + rand(4);
			if (pc.bellyRatingRaw < 8)
				Math.round(nShrink /= 2)
			if (pc.bellyRatingRaw > 1)
			{
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
				output(" There is a rumbling warmth in your [pc.belly], and then... nothing. Hm, it seems ReductPro can't make your middle any smaller.");
				if (pc.bellyRating() > 0 && pc.isPregnant())
					output(" The extra mass on your belly must be maternal.");				
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
			{
				output("You already know what happens when this drug is applied to your vagina");
				if(pc.totalVaginas() > 1) output("s");
				output(", but you wonder if the same applies to your rectum... ");
			}
			output("You");
			if (!pc.isCrotchExposed())
				output(" open up your [pc.crotchCover],");
			output(" squeeze the contents of ReductPro onto your fingers");
			if (!pc.isCrotchExposed()) output(",");
			output(" and apply the foul-smelling paste onto your [pc.asshole], making sure to lather the rim nicely before injecting the rest inside yourself.");
			
			// Instantly reduces anal looseness by 1.
			if (pc.loosenessUnlocked(-1, pc.ass.loosenessRaw - 1) && pc.ass.loosenessRaw >= 2)
			{
				output(" Your sphincter throbs momentarily.");
				if (kGAMECLASS.flags["REDUCTPRO_USED_ON_ASSHOLE"] == undefined)
					output(" To your surprise");
				else
					output(" As expected");
				output(", <b>your anus has instantly tightened!</b>");
				
				pc.ass.loosenessRaw--;

				output("\n\nEverything is so delightfully sensitive afterward, you're tempted to use it again.");
				pc.libido(4);
				pc.taint(2);

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
				output("You doubt if the ReductPro is going to work on your [pc.hornsNoun]. Nevertheless, you squeeze out the contents and rub the paste all over your [pc.horns]. ");
			else
				output("You squeeze the contents of the ReductPro out onto your [pc.horns]. ");
			
			var newHornLength:Number = pc.hornLength - 1;
			if ((pc.hornLength > 0 && pc.hornLengthUnlocked(newHornLength)) || pc.hasStatusEffect("Horn Bumps"))
			{
				if (!pc.hasStatusEffect("Horn Bumps"))
				{
					// Not all horns are malleable--need to make special cases...
					if (pc.hornType == 0)
					{
						if(pc.horns == 1) output("It vibrates vigorously as if it doesn't belong on your head. The [pc.hornsNoun] rapidly vanish");
						else output("They vibrate vigorously as if they doesn't belong on your head. The [pc.hornsNoun] rapidly vanish");
						if (pc.horns != 1)
							output("es");
						output(", leaving your head bare of bony protrusions!");
						pc.hornLength = 0;
						pc.horns = 0;
						pc.hornType = 0;
					}
					else if (pc.hornType == GLOBAL.TYPE_DEMONIC)
					{
						output("Your demonic augmentations crackle and warp as the drug kicks in.");
						if (pc.horns > 2)
						{
							output(" You can feel them starting to decrease in");
							if (pc.horns <= 8)
								output(" size and");
							pc.horns -= 2;
							if (pc.horns < 2) pc.horns = 2;
							output(" number. When the transformation finally completes, you rub your hand along the side. <b>You now have " + num2Text(pc.horns) + " horns total.</b>");
						}
						else
						{
							output(" The two horns begin to shrink smaller and smaller, looking less and less threatening. <b>Your horns finally recede into your head, becoming small, barely visible bumps!</b>");
							pc.hornLength = 0;
							pc.horns = 0;
							pc.hornType = 0;
							pc.createStatusEffect("Horn Bumps");
						}
					}
					else if (pc.hornType == GLOBAL.TYPE_BOVINE)
					{
						output("A tingling sensation runs across the length of your bovine accouterments as the drug kicks in.");
						if (pc.hornLength >= 2)
						{
							pc.hornLength--;
							output(" You can feel your them receding slowly, losing an inch. <b>You now have a pair of " + num2Text(pc.hornLength) + "-inch horns.</b>");
						}
						else if (pc.hornLength > 0.5 && pc.hornLength <= 1)
						{
							output(" <b>You can feel your horns receding until they stop around around a half-inch in length.</b>");
							pc.hornLength = 0.5;
						}
						else
						{
							output(" Even with how tiny they are, the paste manages to make them shrink. <b>Your horns keep receding into your head until they become small, barely visible horn bumps!</b>");
							pc.hornLength = 0;
							pc.horns = 0;
							pc.hornType = 0;
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
							output(" draconic additions soften and vibrate quietly as the drug kicks in. The four horns merge into themselves, changing and rearranging their mass. As they solidify, <b>you are left with two, " + num2Text(pc.hornLength) + "-inch, reptilian horns.</b>");
						}
						else if (pc.hornLength > 1)
						{
							pc.hornLength--;
							output(" reptilian additions soften and vibrate quietly as the drug kicks in. You can feel your pair of horns sink one inch down into your skull. <b>You now have a pair of " + num2Text(pc.hornLength) + "-inch horns.</b>");
						}
						else
						{
							output(" horns soften and vibrate quietly as the drug kicks in. The pair shrink smaller and smaller, looking less and less reptilian. <b>Your horns finally recede into your head, becoming small, barely visible horn bumps!</b>");
							pc.hornLength = 0;
							pc.horns = 0;
							pc.hornType = 0;
							pc.createStatusEffect("Horn Bumps");
						}
					}
					else if (pc.hornType == GLOBAL.TYPE_DEER)
					{
						output("They begin to melt and shift, and the branches of each antler start to fuse with themselves.");
						if (pc.horns > 4)
						{
							pc.horns -= 2;
							if (pc.horns < 4)
								pc.horns == 4;
							output(" After a moment, <b>you find that your antlers have less prongs, giving you " + num2Text(pc.horns) + " antler points total.</b>");
						}
						else
						{
							output(" The " + num2Text(pc.horns) + " points quickly merge with one another to form two long horns. Examining yourself, you find that <b>your head posses a pair of six-inch horns, making you appear very much like a " + pc.mf("bull", "cow") + "!</b>");
							pc.hornLength = 6;
							pc.horns = 2;
							pc.hornType = GLOBAL.TYPE_BOVINE;
						}
					}
					else if (pc.hornType == GLOBAL.TYPE_GOAT)
					{
						output("Like a loose hose, you ram-like horns begin to unravel themselves, straightening out, while curving forward. When the morphing process is complete, you discover that <b>you now have a pair of dangerous, foot-long horns, making you appear very much like a bull!</b>");
						pc.hornLength = 12;
						pc.horns = 2;
						pc.hornType = GLOBAL.TYPE_BOVINE;
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
						pc.hornType = 0;
					}
				}
				else
				{
					output("\n\nThe small horn bumps on your head pulsate softly. As you rub them against your fingers, you can feel them smoothing out and fading away completely. <b>Your head is now bare of any horns!</b>");
					pc.hornLength = 0;
					pc.horns = 0;
					pc.hornType = 0;
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
			
			output("You decide not to use the cream and put the container back into its box.");
			
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
					output(", and decide to scan the item. The codex pulls up a research abstract that reveals the drug is completely safe to use although it’s quite potent");
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
