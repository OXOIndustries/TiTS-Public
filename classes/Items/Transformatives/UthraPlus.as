package classes.Items.Transformatives
{	
	import classes.ItemSlotClass;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GLOBAL;
	import classes.Util.*;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.*;
	
	/* FUNCTIONS
	uthraAbort					Cancels use and replaces item in inventory
	uthraMenuMain				Allows you to choose where you want to apply it
	uthraMenuChest				Allows you to select which row of breasts to use it on
	uthraMenuPussy				Allows you to select which pussy to use it on
	uthraMenuCock				Allows you to select which cock to use it on
	uthraUseCock				Uses it on your male genitalia to reduce size and cum variables
	uthraUsePussy				Uses it on your female genitalia to reduce volume, clits and wetness
	uthraUseChest				Uses it on your breasts to reduce size and milk variables
	uthraUseButt				Uses it on your backside to reduce size, volume and wetness
	uthraUseBody				Uses it on your muscles to reduce tone (since it's a feature requested fairly often)
	
	Documentation: https://docs.google.com/document/d/1VXmbpRuwtT7DMrn6cFhami_LKuuZ0pIR_9nk9Mkub4o/edit?usp=sharing
	*/
	
	public class UthraPlus extends ItemSlotClass
	{		
		//constructor
		public function UthraPlus()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.DRUG;
			
			//Used on inventory buttons
			this.shortName = "Uthra+";
			
			//Regular name
			this.longName = "bottle of cream labeled ‘Uthra+’";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bottle of cream labeled ‘Uthra+’";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "An improvement upon the mutagenic properties of the Uthra sap, this nanogel has been created recently by Dr. Lessau to revert the potentially unwanted consequences of some mods. Notably, it can be used to reduce the size or fluid production of the treated tissues, with only a small degree of unpredictability.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2800;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
		
		
		//SAFETY CHECK
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				return uthraMenuMain(target);
				//return true;
			}
			else
			{
				clearOutput();
				output(target.capitalA + target.short + " uses the Uthra+ to no effect.");
			}
			return false;
		}
		
		
		//CHOOSE WHERE TO APPLY IT TO
		private function uthraMenuMain(target:Creature):Boolean
		{
			clearOutput();
			clearMenu();
			kGAMECLASS.showName("UTHRA\nPLUS");
			author("Violent Knight");
			
			output("The bottle’s packaging looks clean and discreet, with the product’s name and the Steele Tech biomed division’s logo on one side and the medical details on the other sides in very small letter. ");
			if( !target.isNude() ) output("You wiggle out of your [pc.gear], and wonder what part of your body you should apply the Uthra+ cream on...");
			else output("You wonder what part of your body you should apply the Uthra+ cream on...");
			
			if( (target.totalCocks() > 0) || (target.tailType == GLOBAL.TYPE_COCKVINE) ) addButton(0, "Cock", uthraMenuCock, target, "Male Genitalia", "Apply it on your male genitals.");
			else addDisabledButton(0,"Cock","Male Genitalia","The leaflet says you need to have a cock or tailcock if you want to use Uthra+ on your masculine reproductive system.");
			
			if( target.hasVagina() ) addButton(1, "Vagina", uthraMenuPussy, target, "Female Genitalia", "Apply it on your female genitals.");
			else addDisabledButton(1,"Vagina","Female Genitalia","The leaflet says you need to have a vagina if you want to use Uthra+ on your feminine reproductive system.");
			
			addButton(2, "Butt", uthraUseButt, target, "Backside", "Apply it on your buttocks.");
			
			if( target.bRows() > 0 ) addButton(3, "Chest", uthraMenuChest, target, "Chest", "Apply it on your breasts.");
			else addDisabledButton(0,"Chest","Chest","You need to have breasts if you want to use Uthra+ on them.");
			
			if( target.tone > 0 ) addButton(4, "Muscles", uthraUseBody, target, "Muscles", "Apply it on the more muscly parts of your body.");
			else addDisabledButton(0,"Muscles","Muscles","Your body is already too soft to benefit from this.");
			
			addButton(14,"Abort",uthraAbort);
			return true;
		}
		
		
		//CANCELS USE AND REPLACES ITEM IN INVENTORY
		private function uthraAbort():void
		{
			clearOutput();
			clearMenu();
			kGAMECLASS.showName("UTHRA\nPLUS");
			author("Violent Knight");
			
			output("You close the vial of Uthra+ and put it back into your pack.");
			if( !kGAMECLASS.infiniteItems() ) kGAMECLASS.itemCollect([new UthraPlus()]);
			else
			{
				clearMenu();
				addButton(0, "Next", kGAMECLASS.useItemFunction);
			}
			return;
		}
		
		
		//CHOOSE COCK
		private function uthraMenuCock(target:Creature):void
		{
			clearOutput();
			clearMenu();
			kGAMECLASS.showName("UTHRA\nPLUS");
			author("Violent Knight");
			var x:int = 0;
			
			// single cock
			if( target.totalCocks() < 2 ) uthraUseCock([target, 0]);
			
			// multiple cocks
			else
			{
				output("Which of your cocks will you apply the nanogel on?");			
				for (x = 0; x < target.totalCocks(); x++)
				{
					output("\n" + "<b>#" + (x+1) + ":</b> " + "[pc.cockNounComplex " + x + "] " + (x+1));
					addButton(x,"#" + (x+1),uthraUseCock,[target, x],"","");
				}
				addButton(14, "Back", uthraMenuMain, target);
			}
			return;
		}
		
		
		//CHOOSE VAGINA
		private function uthraMenuPussy(target:Creature):void
		{
			clearOutput();
			clearMenu();
			kGAMECLASS.showName("UTHRA\nPLUS");
			author("Violent Knight");
			var x:int = 0;
			
			// single vagina
			if( target.totalVaginas() < 2 ) uthraUsePussy([target, 0]);
			
			// multiple vaginas
			else
			{
				output("Which of your vaginas will you apply the nanogel on?");			
				for (x = 0; x < target.totalVaginas(); x++)
				{
					output("\n" + "<b>#" + (x+1) + ":</b> " + "[pc.vagina " + x + "] " + (x+1));
					addButton(x,"#" + (x+1),uthraUsePussy,[target, x],"","");
				}
				addButton(14, "Back", uthraMenuMain, target);
			}
			return;
		}
		
		
		//CHOOSE BREAST ROW
		private function uthraMenuChest(target:Creature):void
		{
			clearOutput();
			clearMenu();
			kGAMECLASS.showName("UTHRA\nPLUS");
			author("Violent Knight");
			var x:int = 0;
			
			// single row
			if( target.bRows() < 2 ) uthraUseChest([target, 0]);

			// multiple rows
			else
			{
				output("Which of your rows of breasts will you apply the nanogel on?");			
				for (x = 0; x < target.bRows(); x++)
				{
					output("\n" + "<b>#" + (x+1) + ":</b> " + "[pc.breastCupSize " + x + "]" + " [pc.breasts " + x + "]" + " with [pc.nipples " + x + "]");
					addButton(x,"#" + (x+1),uthraUseChest,[target, x],"");
				}
				addButton(14, "Back", uthraMenuMain, target);
			}
			return;
		}
		
		
		//USE IT ON YOUR MALE GENITALS
		private function uthraUseCock(arg:Array):void
		{
			clearOutput();
			clearMenu();
			kGAMECLASS.showName("UTHRA\nPLUS");
			author("Violent Knight");
			addButton(0,"Next",kGAMECLASS.useItemFunction);
			
			var target:Creature = arg[0];
			var x:int = arg[1];
			var change:int = rand(10);
			var change2:int = -1;
			if( change >= 5 )			//chance of extra transformation
			{
				change2 = rand(5);		//(0~4)
				change -= 5;			//(0~4)
			}
			var hasChanged:Boolean = false;
			
			//On-use text
			output("You apply the nanogel to your ");
			if( target.balls == 1 ) output("ball, ");
			else if( target.balls > 1 ) output("balls, ");
			if( target.totalCocks() > 0 ) output("cock ");
			else output("cock tail ");
			output("and prostate. It feels so cool it sends a shiver up your spine, but you force yourself to massage as best you can. Before long, a strange numbing sensation overtakes the affected regions, and a thin stream of something that looks like your [pc.cumNoun] starts to ooze out, so you suppose the nanogel must be doing something. Fortunately, the freezing sensation gradually subsides. ");
			
			//Cock size reduction
			if( (change == 0) || (change2 == 0) )
			{
				var cockChange:Number = 0;
				var cockSizeLimit:Number = 6;
				
				if( target.hasCock() && (target.totalCocks() > 0) && (target.cocks[x].cLengthRaw > cockSizeLimit) ) //Not applicable to cockvine tail
				{
					if( target.cocks[x].cLengthRaw > 10 ) cockChange = Math.round(target.cocks[x].cLengthRaw/4) + rand(6)/10;
					else cockChange = (0.5 + rand(6)/10);
					if( target.hasPerk("Mini") ) cockChange += (0.5 + rand(6)/10);
					target.cocks[x].cLengthRaw -= cockChange;
					output("\n\nYou start feeling very dizzy all of a sudden, and finding somewhere to lie down is all you can do before you pass out. While unconscious, you have a strange dream in which you use a pumpkin to masturbate furiously, but you don’t cum enough and the evil pumpkin goddess decides to punish you by shrinking your cock. So weird! ");
					output("<b>You wake up with a start, only to find that your [pc.cock " + x + "] has lost about " + cockChange.toFixed(2) + " inches of size. </b> ");
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Ball adjustments
			if( (change == 1) || (change2 == 1) )
			{
				var newBallSize:Number = 0;
				var ballSizeChange:Number = 0;
				var ballSizeLimit:Number = 0.6;
				
				//First try to remove uniball status (but not pouch!) at 1/3 chance
				if( (target.balls == 1) && (target.hasStatusEffect("Uniball")) && (rand(3) == 0) )
				{
					target.removeStatusEffect("Uniball");
					target.balls = 2;
					newBallSize = target.ballSizeRaw/2;
					if( newBallSize < ballSizeLimit ) newBallSize = ballSizeLimit;
					target.ballSizeRaw = newBallSize;
					output("\n\nSuddenly, you feel an electric-like tingling in your crotch. You look down alarmed only to see your [pc.balls] twitching wildly, almost as if it were alive! Thanks to the nanogel’s numbing effect, it’s not painful at all, so you just can’t help watching this bizarre spectacle. Eventually, your ball splits in two smaller ones that slowly settle into their newly expanded sack, and only then does it seem to calm down. <b>You find yourself with a pair of [pc.balls] in place of your single ball! </b>");
					hasChanged = true;
				}
			
				//Then try to normalize ball count at 1/3 chance
				else if( (target.balls > 2) && (rand(3) == 0) )
				{
					target.balls -= 1;
					output("\n\nSuddenly, you feel an electric-like tingling in your crotch. You look down alarmed only to see your [pc.balls] twitching wildly, almost as if they were alive! Thanks to the nanogel’s numbing effect, it’s not painful at all, so you just can’t help watching this bizarre spectacle. Eventually, your balls calm down, and you notice there’s one less than before. <b>You find yourself with a total of " + target.balls + " [pc.balls]! </b>");
					hasChanged = true;
				}
			
				//If neither of the above apply, reduce ball size
				else if( target.ballSizeRaw > ballSizeLimit )
				{
					ballSizeChange = (rand(4)+3)/10;
					if( (target.ballSizeRaw - ballSizeChange) < ballSizeLimit ) ballSizeChange = target.ballSizeRaw - ballSizeLimit;
					target.ballSizeRaw -= ballSizeChange;
					output("\n\nSuddenly, you feel an electric-like tingling in your crotch. You look down alarmed only to see your [pc.balls] twitching and contracting, becoming tighter and denser. You try not to remind yourself that this nanogel is based on the Uthra sap’s mutagens, but now it’s a tad too late to feel regret. You watch with a mixture of expectation and apprehension as your ball slowly shrinks in size over the next few minutes, until the transformation finally stops, allowing you to breathe a sigh of relief. ");
					if( target.balls == 1 ) output("<b>Your ball has lost about " + ballSizeChange + " inches of diameter. </b>");
					else output("<b>Your balls have each lost about " + ballSizeChange.toFixed(2) + " inches of diameter. </b>");
					hasChanged = true;
				}
				else change++;
			}
			
			//Decrease cum storage (doesn't actually require balls)
			if( (change == 2) || (change2 == 2) )
			{
				var cumStorageChange:Number = 0;
				var cumStorageOld:Number = target.ballEfficiency;
				var cumStorageLimit:Number = 3;
				
				if( target.ballEfficiency > cumStorageLimit )
				{
					if( target.ballEfficiency > 5 ) cumStorageChange = Math.round(target.ballEfficiency/3);
					else cumStorageChange = rand(2)+1;
					target.ballEfficiency -= cumStorageChange;
					if( target.ballEfficiency < cumStorageLimit ) target.ballEfficiency = cumStorageLimit;
					cumStorageChange = cumStorageOld - target.ballEfficiency;	//Used for output
					
					output("\n\nSuddenly, you feel a tightness inside your ");
					if( target.balls == 0 ) output("prostate, as if it’s contracting. ");
					if( target.balls > 0 ) output("prostate and balls, as if they’re contracting. ");
					output("Whatever is happening forces the [pc.cumNoun] out, and you orgasm on the spot. ");
					if( target.totalCocks() > 0 ) output("[pc.eachCock] fires incredibly long ropes without you even touching it! ");
					else output("Your tailcock twitches uncontrollably and fires incredibly long ropes in random directions without you even touching it! ");
					output("The orgasm is so overwhelming that you lose your bearings and almost blank out for a second, forcing you to hold on to something as you groan incoherently. When it finally stops, ");
					if( target.balls == 0 ) output("your prostate feels ");
					if( target.balls > 0 ) output("your prostate and balls feel ");
					output("so empty it hurts, but that’s a small price to pay for what you’ve just experienced. You wish you could have captured it on cam! ");
					output("<b>You have a vague feeling your body can store </b>");
					if( cumStorageChange > 2 ) output("<b>considerably less [pc.cumNoun] than before. </b>");
					if( cumStorageChange == 2 ) output("<b>somewhat less [pc.cumNoun] than before. </b>");
					if( (cumStorageChange > 0) && (cumStorageChange < 2) ) output("<b>slightly less [pc.cumNoun] than before. </b>");
					target.orgasm();
					hasChanged = true;
				}
				else change++;
			}
			
			//Decrease cum multiplier and virility
			if( (change == 3) || (change2 == 3) )
			{
				var cumMultiplierOld:Number = target.cumMultiplierRaw;
				var cumMultiplierChange:Number = 0;
				var cumMultiplierLimit:Number = 1;
				var cumQualityLimit:Number = 0.25;
				
				if( target.cumMultiplierRaw > cumMultiplierLimit )
				{
					if( target.cumMultiplierRaw > 5 ) cumMultiplierChange = Math.round(target.cumMultiplierRaw/3);
					else cumMultiplierChange = rand(2)+1;
					target.cumMultiplierRaw -= cumMultiplierChange;
					if( target.cumMultiplierRaw < cumMultiplierLimit ) target.cumMultiplierRaw = cumMultiplierLimit;
					cumMultiplierChange = cumMultiplierOld - target.cumMultiplierRaw;	//Used for output
					target.orgasm();

					output("\n\n ");
					if( target.totalCocks() > 0 ) output("[pc.eachCock] actually starts to feel kinda good, so you wrap your hand around [pc.oneCock] and give it a few tentative rubs. The pleasure intensifies disproportionately as your member engorges, it’s as if you were cumming nonstop, but not as overpowering as a real cumshot. ");
					else output("Your tailcock actually starts to feel kinda good, so you wrap your hand around it and give it a few tentative rubs. The pleasure intensifies disproportionately as your member engorges, it’s as if you were cumming nonstop, but not as overpowering as a real cumshot. ");
					if( target.balls == 0 ) output("Your prostate starts feeling very warm and excited all of a sudden, as if it were being teased relentlessly from the inside. ");
					if( target.balls == 1 ) output("Your prostate and ball start feeling very warm and excited all of a sudden, as if they were being teased relentlessly from the inside. ");
					if( target.balls > 1 ) output("Your prostate and balls start feeling very warm and excited all of a sudden, as if they were being teased relentlessly from the inside. ");
					output("At this point, you can’t prevent blissful sounds from escaping your throat, all you can do is continue to jerk off as your body pumps out this never-ending river of a load. Your drawn-out cumshot lasts for a good ten minutes, and by the end of it you feel like you’ve spent up half a lifetime’s worth of [pc.cumNoun], probably including some spermatogonial cells, whether you realize this or not. ");
					output("<b>You feel like your loads are going to be </b>");
					if ( cumMultiplierChange > 3 ) output("<b>considerably less messy than before. </b>");
					if ( cumMultiplierChange == 3 ) output("<b>fairly less messy than before. </b>");
					if ( cumMultiplierChange == 2 ) output("<b>somewhat less messy than before. </b>");
					if ( cumMultiplierChange < 2 ) output("<b>slightly less messy than before. </b>");
					target.orgasm();
				
					if( (target.cumQualityRaw > cumQualityLimit) && (rand(2) == 0) )
					{
						target.cumQualityRaw -= 0.15;
						if( target.hasPerk("Virile") || target.isTreated() ) target.cumQualityRaw += 0.05;
						if( target.cumQualityRaw < cumQualityLimit ) target.cumQualityRaw = cumQualityLimit;
						output("\n\nYou also feel slightly less virile, but that’s nothing other mods can’t fix. ");
					}
					hasChanged = true;
				}
				else change++;
			}
			
			//Decrease cum refractory rate
			if( (change == 4) || (change2 == 4) )
			{
				var refractoryOld:int = target.refractoryRate;
				var refractoryLimit:int = 1;
				var refractoryChange:Number = 0;
				
				var libidoOld:Number = target.libido();
				var libidoLimit:Number = 10;
				if( libidoLimit < target.libidoMin() ) libidoLimit = target.libidoMin();
				var libidoChange:Number = 0;
				
				if( target.refractoryRate > refractoryLimit )
				{
					if( target.refractoryRate > 5 ) refractoryChange = Math.round(target.refractoryRate/3);
					else refractoryChange = rand(2)+1;
					target.refractoryRate -= refractoryChange;
					if( target.refractoryRate < refractoryLimit ) target.refractoryRate = refractoryLimit;
					refractoryChange = refractoryOld - target.refractoryRate;	//Used for output
					
					if( target.libido() > libidoLimit )
					{
						libidoChange = rand(5)+1;
						if( (target.libido()-libidoChange) < libidoLimit ) libidoChange = target.libido() - libidoLimit;
						target.libido(-libidoChange);
						target.lust(-50);
					}
					
					output("\n\nWhen the nanogel’s effects are finally over, you feel kinda lazy, like you could really use a break, and your spent reproductive system totally agrees. Your balls feel totally empty and are barely making any effort to refill. You give your ");
					if( target.totalCocks() > 0 ) output("cock ");
					else output("tailcock ");
					output("a few tentative rubs, but it doesn’t feel like reacting just now. With a tired sigh, you decide it’s too much of a bother to worry about it. ");
					output("<b>Somehow, you know your body is now producing [pc.cumNoun] </b>");
					if( refractoryChange >= 4 ) output("<b>much slower than it used to. </b>");
					if( refractoryChange == 3 ) output("<b>moderately slower than it used to. </b>");
					if( refractoryChange == 2 ) output("<b>somewhat slower than it used to. </b>");
					if( (refractoryChange > 0) && (refractoryChange < 2) ) output("<b>slightly slower than it used to. </b>");
					if( libidoChange > 0 ) output("\n\nIt would seem your sex drive has waned a bit too. On the flip side that means you won’t be at the mercy of your partners so easily, and you can probably hold back your orgasm much longer, forcing them to cum before you. Or maybe you should try becoming a pleasure delayer. <b>Your libido has been slightly reduced. </b>");
					hasChanged = true;
				}
				else change++;
			}
			
			//Dud result
			if( hasChanged == false ) output("\n\nYou wait, and wait, and wait... and nothing else seems to really happen. Eventually, the numbness subsides. Maybe you got unlucky, or maybe there just isn’t much the nanogel can still do for you.");
			else
			{
				//Player information:
				output("\n\nYour codex establishes a connection with the Uthra+ nanomachines and displays the following message: ");
				output("\n\n<i>Cum multiplier: " + target.cumMultiplierRaw.toFixed(1) + " </i>");
				output("\n<i>Cum storage efficiency: " + target.ballEfficiency.toFixed(1) + " </i>");
				output("\n<i>Cum refractory rate: " + target.refractoryRate.toFixed(1) + " </i>");
				output("\n<i>Cum quality: " + (target.cumQualityRaw*100).toFixed(0) + "% </i>");
				output("\n\nYou’re not sure what those numbers mean exactly, but at least they give you a baseline. ");
			}
			
			//applyCumSoaked(target);
			//processTime(20+rand(6));
			
			return;
		} //End of uthraUseCock
		
		
		//USE IT ON YOUR FEMALE GENITALS
		private function uthraUsePussy(arg:Array):void
		{
			clearOutput();
			clearMenu();
			kGAMECLASS.showName("UTHRA\nPLUS");
			author("Violent Knight");
			addButton(0,"Next",kGAMECLASS.useItemFunction);
			
			var target:Creature = arg[0];
			var x:int = arg[1];
			var change:int = rand(10);	//chance of extra transformation
			var change2:int = -1;
			if( change >= 5 )
			{
				change2 = rand(5);		//(0~4)
				change -= 5;			//(0~4)
			}
			var hasChanged:Boolean = false;
			
			//On-use text
			output("You apply the nanogel to your [pc.pussy " + x + "], making sure to spread it over the labia, [pc.clits] and inner walls as best you can. It feels cool to the touch, sending a shiver up your spine, but before long the sensation is replaced by an unbearable hotness, like your pussy has turned into an angry furnace, its walls contracting and relaxing on their own. It’s definitely not comfortable, but it’s not unpleasant either. A thin stream of something that looks like your [pc.girlCumNoun] starts to ooze out, so you suppose the nanogel must be doing something.");
			
			//Eliminate one extra clit
			if( (change == 0) || (change2 == 0) )
			{
				if( target.vaginas[x].clits > 1 )
				{
					target.vaginas[x].clits -= 1;
					
					output("\n\nYour fingers go down to your clitoral region of their own volition. With how much your [pc.clits] are itching, you just can’t help it. ");
					if( target.vaginas[x].clits > 1 ) output("One of them, however, is itching far more than the others, so you focus your efforts on that one. ");
					output("Gently rubbing the region brings a soothing wave of relief, your unfocused eyes gaze upwards, and you continue to massage the region until the itching stops. As your wits return, you slowly realize something has gone missing. ");
					output("<b>A quick examination confirms it: you have one less clit than before. Well, it’s not a big loss, since the others are now feeling that much more sensitive to compensate.</b>");
					target.changeLust(50);
					hasChanged = true;
				}
				else change++;
			}
			
			//Reduce vagina’s bonus capacity
			if( (change == 1) || (change2 == 1) )
			{
				if(target.vaginas[x].bonusCapacity > 0 )
				{
					target.vaginas[x].bonusCapacity -= (10 + 10*rand(10));
					if( target.vaginas[x].bonusCapacity < 0 ) target.vaginas[x].bonusCapacity = 0;
					output("\n\nThe contractions in your burning canal intensify, but at the same time the region starts feeling very, very good. Your vagina is literally rubbing itself from the inside, and it’s turning out to be a unique and delightful experience! Intent on not wasting this rare chance, you reach for your [pc.pussy " + x + "] with both hands – one massages the labia and clitoral regions, while the other penetrates your folds. You feel both helpless and amazed at how much your squirming walls are clenching your fingers, and in this overly sensitive state, it doesn’t take long before you reach a mind-shattering orgasm that causes you to blank out for a moment, moaning in uncontained pleasure as the [pc.girlCumNoun] drenches your hand and thighs. ");
					if( target.hasCock() && ( target.totalCocks() > 0 ) ) output("[pc.eachCock] joins your pussy in a sympathetic orgasm, splashing [pc.cumNoun] everywhere. ");
					else if( target.tailType == GLOBAL.TYPE_COCKVINE ) output("You tailcock joins your pussy in a sympathetic orgasm, splashing [pc.cumNoun] everywhere. ");
					output("<b>After you come to your senses, you find that your [pc.pussy " + x + "] feels a bit less voluminous than before. </b>");
					target.orgasm();
					hasChanged = true;
				}
				else change++;
			}
			
			if( (change == 2) || (change2 == 2) )
			{
				if( target.vaginas[x].loosenessRaw > 1 )
				{
					target.vaginas[x].minLooseness -= 1;
					target.vaginas[x].loosenessRaw -= 1;
					if( target.vaginas[x].minLooseness < 1 ) target.vaginas[x].minLooseness = 1;
					if( target.vaginas[x].loosenessRaw < 1 ) target.vaginas[x].loosenessRaw = 1;
					
					output("\n\nYour [pc.pussy " + x + "] starts to squirm uncomfortably. The contractions last for a good ten minutes and then suddenly stop. When you’re sure all of the Uthra plus’ effects have subsided, you insert a probing finger inside. ");
					output("<b>To your surprise, you find that your entrance is somewhat tighter than it used to be. </b>");
					
					if( (target.vaginas[x].hymen == false) && (target.vaginas[x].loosenessRaw <= 2) && (rand(2) == 0) )
					{
						target.vaginas[x].hymen = true;
						output("\n\nYour probing suddenly stops when you reach a barrier. Wait, is that what you think it is? No doubt about it, your [pc.pussy " + x + "] has grown a new hymen! Purity may be old-fashioned, but you can already think of some exciting ways to lose your new ‘virginity’. ");
						output("<b>You are now a faux-virgin! </b>");
					}
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Reduce wetness
			if( (change == 3) || (change2 == 3) )
			{
				if( target.vaginas[x].wetnessRaw > 1 )
				{
					target.vaginas[x].wetnessRaw -= 1;
					if( target.vaginas[x].wetnessRaw < 1 ) target.vaginas[x].wetnessRaw = 1;
					output("\n\nYou’re about to get up when you feel something strange inside you. You press a finger into your [pc.pussy " + x + "] with some apprehension, only to find the passage is a bit rougher than expected. After thinking for a moment, you conclude that nothing much has changed, your inside is just not quite as slick as it used to be. ");
					output("<b>Your [pc.pussy " + x + "] has become slightly less lubricated. </b>");
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Reduce clit size and libido
			if( (change == 4) || (change2 == 4) )
			{
				var libidoOld:Number = target.libido();
				var libidoLimit:Number = 10;
				if( libidoLimit < target.libidoMin() ) libidoLimit = target.libidoMin();
				var libidoChange:Number = 0;
				
				if( ( target.totalClits() > 0 ) && ( target.clitLength > 0.25 ) )
				{
					target.clitLength -= 0.1;
					
					output("\n\nYour gaze wanders down, and you notice your [pc.clits] ");
					if( target.totalClits() > 1 ) output("are ");
					else output("is ");
					output("getting smaller. You try not to remind yourself that this nanogel is based on the Uthra tree’s mutagens, but now it’s a tad too late to feel regret. It takes a while for the change to finally finish. When it does, you touch the region and find that it doesn’t feel very responsive right now, but it’s probably just a temporary aftereffect of the numbing gel. ");
					output("<b>Your [pc.clits] </b>");
					if( target.totalClits() > 1 ) output("<b>have </b>");
					else output("<b>has </b>");
					output("<b>shrunk a little bit. </b>");
					
					if( target.libido() > libidoLimit )
					{
						libidoChange = rand(5)+1;
						if( (target.libido()-libidoChange) < libidoLimit ) libidoChange = target.libido() - libidoLimit;
						target.libido(-libidoChange);
						output("\n\nYour sex drive seems to have waned a bit too. Well, it’s not like it will prevent you from reaching orgasms. If anything, it means you won’t be at the mercy of your partners so easily, and you can probably hold back your orgasm much longer, forcing them to cum before you. Or maybe you could try becoming a pleasure delayer. ");
						output("<b>Your libido has diminished slightly.</b>");
						target.changeLust(-50);
					}
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Dud result
			if( hasChanged == false ) output("You wait, and wait, and wait... and nothing else seems to really happen. Eventually, the numbness subsides. Maybe you got unlucky, or maybe there just isn’t much the nanogel can still do for you.");
			else
			{
				//Player information:
				output("\n\nYour codex establishes a connection with the Uthra+ nanomachines and displays the following message: ");
				output("\n\n<i>Vagina’s extra capacity: " + target.vaginas[x].bonusCapacity.toFixed(0) + " </i>");
				output("\n<i>Vagina’s looseness rating: " + target.vaginas[x].loosenessRaw.toFixed(1) + " </i>");
				output("\n<i>Vagina’s wetness: " + target.vaginas[x].wetnessRaw.toFixed(1) + " </i>");
				output("\n\nYou’re not sure what those numbers mean exactly, but at least they give you a baseline. ");
			}
			
			//processTime(20+rand(6));
			//applyPussyDrenched(target);
			
			return;
		} //End of uthraUsePussy
		
		
		//USE IT ON YOUR BREASTS
		private function uthraUseChest(arg:Array):void
		{
			clearOutput();
			clearMenu();
			kGAMECLASS.showName("UTHRA\nPLUS");
			author("Violent Knight");
			addButton(0,"Next",kGAMECLASS.useItemFunction);
			
			var target:Creature = arg[0];
			var x:int = arg[1];
			var change:int = rand(8);	//chance of extra transformation
			var change2:int = -1;
			if( change >= 4 )
			{
				change2 = rand(4);		//(0~3)
				change -= 4;			//(0~3)
			}
			var hasChanged:Boolean = false;
			
			//On-use text
			output("You spread the nanogel over your chest, massaging the region thoroughly, just as the label instructs. It feels so cool that it sends a shiver up your spine, but you force yourself to continue. Before long, a strange, numbing feeling overtakes your breasts, and a thin, viscous stream of liquid starts to ooze out. Is it [pc.milkNoun]? You can’t be sure... You suppose the nanogel has started to do its thing, now all you can do is hope it will work as intended. ");
			
			//Reduce breast size
			if( (change == 0) || (change2 == 0) )
			{
				var breastLimit:int = 0;
			
				if( target.breastRows[x].breastRatingRaw >= breastLimit )
				{
					target.breastRows[x].breastRatingRaw -= (rand(3)+1);
					if( target.breastRows[x].breastRatingRaw < breastLimit ) target.breastRows[x].breastRatingRaw = breastLimit;
					output("\n\nAfter a while, the numbness subsides. Your gaze wanders down and you notice the volume on your chest has diminished somewhat. Well, this medicine is based on the Uthra sap’s mutagens, so you shouldn’t be surprised. ");
					output("<b>Your [pc.breasts " + x + "] have shrunk in size, settling on [pc.breastCupSize " + x + "]. </b>");
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Reduce milk storage
			if( (change == 1) || (change2 == 1) )
			{
				var milkStorageOld:Number = target.milkStorageMultiplier;
				var milkStorageChange:Number = 0;
				var milkStorageLimit:int = 1;
				
				if( target.isLactating() && (target.milkStorageMultiplier > milkStorageLimit) )
				{
					if( target.milkStorageMultiplier > 5 ) milkStorageChange = Math.round(target.milkStorageMultiplier/3);
					else milkStorageChange = rand(2)+1;
					target.milkStorageMultiplier -= milkStorageChange;
					if( target.milkStorageMultiplier < milkStorageLimit ) target.milkStorageMultiplier = milkStorageLimit;
					milkStorageChange = milkStorageOld - target.milkStorageMultiplier;
					
					target.milkFullness = Math.round(target.milkFullness/2) + 1;
					output("\n\nSuddenly, you feel a tightness inside your breasts, as if they’re contracting of their own volition. Whatever is happening forces the remaining [pc.milkNoun] out of you, causing your breasts to momentarily gush like geysers. All you can do is try to aim them in a generally harmless direction. When it finally stops, they feel very empty, but also very comfortable, as if their insides had been rearranged in a lighter configuration. With a touch, you confirm that they feel smoother, more pliable and tiny a bit perkier too! You can’t help but let out a content sigh. ");
					output("<b>Your body’s capacity to store [pc.milkNoun] has diminished. </b>");
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Reduce milk multiplier
			if( (change == 2) || (change2 == 2) )
			{
				var milkMultiplierOld:Number = target.milkMultiplier;
				var milkMultiplierChange:Number = 0;
				var milkMultiplierLimit:int = 1;

				if( target.isLactating() && target.milkMultiplier > milkMultiplierLimit )
				{
					if( target.milkMultiplier > 5 ) milkMultiplierChange = Math.round(target.milkMultiplier/3);
					else milkMultiplierChange = rand(2)+1;
					target.milkMultiplier -= milkMultiplierChange;
					if( target.milkMultiplier < milkMultiplierLimit ) target.milkMultiplier = milkMultiplierLimit;
					milkMultiplierChange = milkMultiplierOld - target.milkMultiplier;
					
					target.milkFullness = Math.round(target.milkFullness/2) + 1;
					output("\n\nTo your relief, the strange liquid is soon replaced by what is clearly your [pc.milkNoun], which leaks freely even though you’re applying no pressure. You decide to speed up the process by gently grabbing your breasts and giving them a good, slow massage. The numbness gradually subsides, replaced by a slight tingling that’s actually rather pleasant. The more [pc.milkNoun] comes out, the better it gets. You lose track of time draining your chest, until it stops leaking completely. You feel as if you’ve put out enough [pc.milkNoun] to feed a battalion, probably losing quite a few mammary glands in the process, whether you realize this or not. ");
					output("<b>You have a feeling your [pc.milkNoun] output has </b>");
					if ( milkMultiplierChange > 3 ) output("<b>diminished considerably. </b>");
					if ( milkMultiplierChange == 3 ) output("<b>diminished a fair bit. </b>");
					if ( milkMultiplierChange == 2 ) output("<b>diminished somewhat. </b>");
					if ( milkMultiplierChange < 2 ) output("<b>slightly diminished. </b>");
					target.changeLust(50);
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Reduce milk refractory rate
			if( (change == 3) || (change2 == 3) )
			{
				var milkRateOld:Number = target.milkRate;
				var milkRateChange:Number = 0;
				var milkRateLimit:int = 1;
				
				if( target.isLactating() && target.milkRate > milkRateLimit )
				{
					if( target.milkRate > 5 ) milkRateChange = Math.round(target.milkRate/3);
					else milkRateChange = rand(2)+1;
					target.milkRate -= milkRateChange;
					if( target.milkRate < milkRateLimit ) target.milkRate = milkRateLimit;
					milkRateChange = milkRateOld - target.milkRate;
					
					target.milkFullness = Math.round(target.milkFullness/2) + 1;
					output("\n\nWhen the nanogel’s effects are finally over, your breasts feel painfully spent, practically begging for some rest. You don’t have much energy left either, so you grab something to eat and plop down to rest for a few minutes, after which you touch your breasts and wonder if they are even trying to refill. Well, at least you won’t have to contend with that chest tightness so soon. ");
					output("<b>Your chest is refilling </b>");
					if( milkRateChange > 2 ) output("<b>much slower than it used to. </b>");
					if( milkRateChange == 2 ) output("<b>somewhat slower than it used to. </b>");
					if( milkRateChange < 2 ) output("<b>a little slower than it used to. </b>");
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Dud result
			if( hasChanged == false )
			{
				output("\n\nYou wait, and wait, and wait... and nothing else seems to really happen. Eventually, the numbness subsides. Maybe you got unlucky, or maybe there just isn’t much the nanogel can still do for you. ");
				output("<b>If you’re lactating, perhaps you should wait for your breasts to refill before trying again. </b>")
			}
			else
			{
				//Player information:
				output("\n\nYour codex establishes a connection with the Uthra+ nanomachines and displays the following message: ");
				output("\n\n<i>Breast productivity multiplier: " + target.milkMultiplier.toFixed(1) + " </i>");
				output("\n<i>Breast storage efficiency: " + target.milkStorageMultiplier.toFixed(1) + " </i>");
				output("\n<i>Breast refractory rate: " + target.milkRate.toFixed(1) + " </i>");
				output("\n<i>Breast size rating: [pc.breastCupSize " + x + "] </i>");
				output("\n\nYou’re not sure what those numbers mean exactly, but at least they give you a baseline. ");
			}
			
			//processTime(20+rand(6));
			
			return;
		} //End of uthraUseChest
		
		
		//USE IT ON YOUR BUTT
		private function uthraUseButt(target:Creature):void
		{
			clearOutput();
			clearMenu();
			kGAMECLASS.showName("UTHRA\nPLUS");
			author("Violent Knight");
			addButton(0,"Next",kGAMECLASS.useItemFunction);
			
			var change:int = rand(8);	//chance of extra transformation
			var change2:int = -1;
			if( change >= 4 )
			{
				change2 = rand(4);		//(0~3)
				change -= 4;			//(0~3)
			}
			var hasChanged:Boolean = false;
			
			//On-use text
			output("You spread the nanogel over your buttocks and rear entrance, then stick a finger inside and massage the canal thoroughly, just as the label instructs. The ointment feels numbingly cold, but before long the sensation starts to subside, and as it does, your [pc.butt] starts to contract and relax involuntarily. You suppose the nanogel has started to do its thing, now all you can do is hope and wait... ");
			
			//Reduce butt size
			if( (change == 0) || (change2 == 0) )
			{
				var oldButt:int = target.buttRatingRaw;
				
				if( target.buttRatingRaw > 0 )
				{
					var buttChange:int = rand(4)+1;
					target.buttRatingRaw -= buttChange;
					if( target.buttRatingRaw < 0 ) target.buttRatingRaw = 0;
					buttChange = oldButt - target.buttRatingRaw;
					
					output("\n\nFor some reason, the sensations are getting very good, as if your [pc.butt] was getting an expert massage! You grope it tentatively and notice your backside is getting leaner by the minute, but also more sensitive! ");
					output("<b>Your [pc.asshole] has lost </b>");
					if( buttChange >= 3 ) output("<b>a vast amount of size. </b>");
					if( buttChange == 2 ) output("<b>a substantial amount of size. </b>");
					if( buttChange < 2 ) output("<b>little bit of size. </b>");
					target.changeLust(50);
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Reduce butt's bonus capacity
			if( (change == 1) || (change2 == 1) )
			{
				if( target.ass.bonusCapacity > 0 )
				{
					target.ass.bonusCapacity -= (10 + 10*rand(10));
					if( target.ass.bonusCapacity < 0 ) target.ass.bonusCapacity = 0;
					output("\n\nAfter a couple of minutes, your rectal cavity starts to twitch and contract as well, slowly reconfiguring itself into a less voluminous passage. ");
					output("<b>When it’s all over, the inside of your [pc.butt] feels less roomy than before. </b>");
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Increase tightness and elasticity
			if( (change == 2) || (change2 == 2) )
			{
				if( target.ass.loosenessRaw > 1 )
				{
					var elasticityLimit:int = 3;
					if( target.hasPerk("Elasticity") ) elasticityLimit += 1;
					
					target.ass.minLooseness -= 1;
					target.ass.loosenessRaw -= 1;
					if( target.ass.minLooseness < 1 ) target.ass.minLooseness = 1;
					if( target.ass.loosenessRaw < 1 ) target.ass.loosenessRaw = 1;
					
					output("\n\nYour rear entrance starts to squirm uncomfortably. The contractions last for a good twenty minutes and stop suddenly. When you’re sure the Uthra plus’ effects are over, you insert a probing finger inside. ");
					output("<b>To your surprise, you find that your rear entrance is a bit tighter than before. </b>");
					
					if( target.elasticity < elasticityLimit )
					{
						target.elasticity += 0.5;
						if( target.elasticity > elasticityLimit ) target.elasticity = elasticityLimit;
						output("However, you can stretch it with little discomfort - looks the nanogel has also made you <b>more elastic!</b> ");
					}
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Reduce butt's wetness
			if( (change == 3) || (change2 == 3) )
			{
				if( target.ass.wetnessRaw > 0 )
				{
					target.ass.wetnessRaw -= 1;
					if( target.ass.wetnessRaw < 0 ) target.ass.wetnessRaw = 0;
					output("\n\nYou’re about to get up when you feel something is off with your [pc.butt]. You press a finger inside with some apprehension, only to find the passage is a bit rougher than expected. After probing for a moment, you conclude that nothing much has changed, it’s just that your inside is not quite as slick as it used to be. ");
					output("<b>Your [pc.butt] has become slightly less lubricated. </b>");
					
					hasChanged = true;
				}
				else change++;
			}
			
			//Dud result
			if( hasChanged == false ) output("\n\nYou wait, and wait, and wait... and nothing else seems to really happen. Eventually, the sensations subside. Maybe you got unlucky, or maybe there just isn’t much the nanogel can still do for you. ");
			else
			{
				//Player information:
				output("\n\nYour codex establishes a connection with the Uthra+ nanomachines and displays the following message: ");
				output("\n\n<i>Anal extra capacity: " + target.ass.bonusCapacity.toFixed(0) + " </i>");
				output("\n<i>Anal looseness rating: " + target.ass.loosenessRaw.toFixed(1) + " </i>");
				output("\n<i>Anal wetness: " + target.ass.wetnessRaw.toFixed(1) + " </i>");
				output("\n<i>Butt size rating: " + target.buttRatingRaw.toFixed(1) + " </i>");
				output("\n<i>Orifice elasticity: " + target.elasticity.toFixed(1) + " </i>");
				output("\n\nYou’re not sure what those numbers mean exactly, but at least they give you a baseline. ");
			}
			
			//processTime(20+rand(6));
			
			return;
		} //End of uthraUseButt
		
		
		//USE IT ON YOUR MUSCLES
		private function uthraUseBody(target:Creature):void
		{
			clearOutput();
			clearMenu();
			kGAMECLASS.showName("UTHRA\nPLUS");
			author("Violent Knight");
			addButton(0,"Next",kGAMECLASS.useItemFunction);
			
			var change:int = rand(4);
			
			//On-use text
			output("You spread the nanogel over your arms, abs and other muscly parts of your body, shivering as you give yourself a massage with the numbingly cold ointment. However, the sensation gradually shifts from very cold to intensely warm, causing you to sweat profusely for many minutes. When it’s finally over, you can’t help but go wash yourself at the nearest place available. ");
			
			if( target.tone > 0 )
			{
				target.tone -= (5 + 5*rand(6));
				if( target.tone < 0 ) target.tone = 0;
				output("<b>You notice you body has lost some of its hardness, looking smoother even though your strength is unaltered. </b>");
				
				if( target.thickness > 0 )
				{
					target.thickness -= (5 + 5*rand(6));
					if( target.thickness < 0 ) target.thickness = 0;
					output("<b>And it looks like you’ve shed some fat too! </b>");
				}
				
				//Player information:
				output("\n\nYour codex establishes a connection with the Uthra+ nanomachines and displays the following message: ");
				output("\n\n<i>Current tone rating: " + target.tone.toFixed(0) + " </i>");
				output("\n<i>Current thickness rating: " + target.thickness.toFixed(0) + " </i>");
				output("\n\nYou’re not sure what those numbers mean exactly, but at least they give you a baseline. ");
			}
			
			target.shower();
			//processTime(20+rand(6));
			
			return;
		}
		
		
	} //End of public class UthraPlus
} //EoF
