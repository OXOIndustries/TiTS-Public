package classes
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	import flash.net.FileReference;
	import flash.net.SharedObject;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import classes.RoomClass;

	//Build the bottom drawer
	public class TiTS extends MovieClip
	{
		// Smoosh all the included stuff into the TiTS class
		// this is a HORRIBLE way of architecting the system, but it's better then not
		// using classes at all (but only barely)
		include "../includes/appearance.as";
		include "../includes/celise.as";
		include "../includes/combat.as";
		include "../includes/creation.as";
		include "../includes/data.as";
		include "../includes/engine.as";
		include "../includes/game.as";
		include "../includes/masturbation.as";
		include "../includes/NPCTemplates.as";
		// include "../includes/saves.as";

		public function CoC()
		{

			// shove the variables declared in the included files into the TiTS constructor
			// because they're set-up procedurally (BLEURRRGGGHHHH)
			include "../includes/variables.as";
			include "../includes/weaponVariables.as";
			include "../includes/input.as";

			include "../includes/rooms.as";

			var buttonDrawer:bottomButtonDrawer = new bottomButtonDrawer;
			addChild(buttonDrawer);
			buttonDrawer.x = 0;
			buttonDrawer.y = 800;

			//Build the buttons
			var buttons:Array = new Array();
			var buttonData:Array = new Array();
			var buttonPage:int = 1;
			initializeButtons();

			//Build left sidebar
			var leftSideBar:leftBar = new leftBar;
			leftSideBar.x = 0;
			leftSideBar.y = 0;
			addChild(leftSideBar);
			//Fading out Perks and Level Up Buttons
			var fadeOut = new ColorTransform();
			fadeOut.color = 0x333E52;
			var titsPurple = new ColorTransform();
			titsPurple.color = 0x84449B;
			var titsBlue = new ColorTransform();
			titsBlue.color = 0x333E52;
			var titsWhite = new ColorTransform();
			titsWhite.color = 0xFFFFFF;

			leftSideBar.levelUpButton.plusses.transform.colorTransform = fadeOut;
			leftSideBar.perksButton.star.transform.colorTransform = fadeOut;


			var monsterHP:statBarBig = new statBarBig();
			var monsterLust:statBarBig = new statBarBig();
			var monsterEnergy:statBarBig = new statBarBig();
			addChild(monsterHP);
			addChild(monsterLust);
			addChild(monsterEnergy);
			monsterHP.x = 10;
			monsterHP.y = 237;
			monsterLust.x = 10;
			monsterLust.y = 278;
			monsterEnergy.x = 10;
			monsterEnergy.y = 319;
			monsterHP.background.x = -150;
			monsterHP.bar.width = 30;
			monsterHP.values.text = "10";
			monsterLust.masks.labels.text = "LUST";
			monsterLust.values.text = "25";
			monsterLust.background.x = -1 * (1 - 25 / 100) * 180;
			monsterLust.bar.width = (25 / 100) * 180;
			monsterLust.highBad = true;
			monsterEnergy.masks.labels.text = "ENERGY";
			monsterEnergy.values.text = "100";
			monsterHP.visible = false;
			monsterLust.visible = false;
			monsterEnergy.visible = false;
			var monsterLevel:statBarSmall = new statBarSmall();
			var monsterRace:statBarSmall = new statBarSmall();
			var monsterSex:statBarSmall = new statBarSmall();
			addChild(monsterLevel);
			addChild(monsterRace);
			addChild(monsterSex);
			monsterLevel.x = 10;
			monsterLevel.y = 363;
			monsterRace.x = 10;
			monsterRace.y = 392;
			monsterSex.x = 10;
			monsterSex.y = 421;
			setupStatBar(monsterLevel,"LEVEL",5);
			setupStatBar(monsterRace,"RACE","Galotian");
			setupStatBar(monsterSex,"SEX","Unknown");
			monsterLevel.visible = false;
			monsterSex.visible = false;
			monsterRace.visible = false;
			leftBarClear();

			//Build the right sidebar
			var rightSidebar:rightBar = new rightBar;
			addChild(rightSidebar);
			rightSidebar.nameText.text = "Penis";
			rightSidebar.x = 1000;
			rightSidebar.y = 0;
			var playerHP:statBarBig = new statBarBig();
			var playerLust:statBarBig = new statBarBig();
			var playerEnergy:statBarBig = new statBarBig();
			addChild(playerHP);
			addChild(playerLust);
			addChild(playerEnergy);
			playerHP.x = 1010;
			playerHP.y = 65;
			playerLust.x = 1010;
			playerLust.y = 106;
			playerEnergy.x = 1010;
			playerEnergy.y = 147;
			playerHP.background.x = -150;
			playerHP.bar.width = 30;
			playerHP.values.text = "10";
			playerLust.masks.labels.text = "LUST";
			playerLust.values.text = "25";
			playerLust.background.x = -1 * (1 - 25 / 100) * 180;
			playerLust.bar.width = (25 / 100) * 180;
			playerLust.highBad = true;
			playerEnergy.masks.labels.text = "ENERGY";
			playerEnergy.values.text = "100";
			var buttonPagePrev:leftButton = new leftButton;
			addChild(buttonPagePrev);
			buttonPagePrev.x = 1000;
			buttonPagePrev.y = 750;
			buttonPagePrev.alpha = .3;
			var buttonPageNext:rightButton = new rightButton;
			addChild(buttonPageNext);
			buttonPageNext.x = 1100;
			buttonPageNext.y = 750;
			buttonPageNext.alpha = .3;
			var pagePrev:leftButton = new leftButton;
			addChild(pagePrev);
			pagePrev.x = 010;
			pagePrev.y = 750;
			pagePrev.alpha = .3;
			var pageNext:rightButton = new rightButton;
			addChild(pageNext);
			pageNext.x = 110;
			pageNext.y = 750;
			pageNext.alpha = .3;
			var playerLevel:statBarSmall = new statBarSmall();
			var playerXP:statBarSmall = new statBarSmall();
			var playerCredits:statBarSmall = new statBarSmall();
			playerLevel.x = 1010;
			playerLevel.y = 415;
			playerLevel.masks.labels.text = "LEVEL";
			playerLevel.bar.visible = false;
			playerLevel.background.x = -180;
			playerLevel.values.text = "5";
			playerXP.x = 1010;
			playerXP.y = 444;
			playerXP.masks.labels.text = "XP";
			playerXP.bar.width = (50 / 500) * 180;
			playerXP.background.x =  -1 * (1 - 50 / 500) * 180;
			playerXP.values.text = "50 / 1000";
			playerCredits.x = 1010;
			playerCredits.y = 473;
			playerCredits.masks.labels.text = "CREDITS";
			playerCredits.bar.visible = false;
			playerCredits.background.x =  -180;
			playerCredits.values.text = "Over 9000";
			addChild(playerLevel);
			addChild(playerXP);
			addChild(playerCredits);
			var playerPhysique:statBarSmall = new statBarSmall();
			var playerReflexes:statBarSmall = new statBarSmall();
			var playerAim:statBarSmall = new statBarSmall();
			var playerIntelligence:statBarSmall = new statBarSmall();
			var playerWillpower:statBarSmall = new statBarSmall();
			var playerLibido:statBarSmall = new statBarSmall();
			addChild(playerPhysique);
			addChild(playerReflexes);
			addChild(playerAim);
			addChild(playerIntelligence);
			addChild(playerWillpower);
			addChild(playerLibido);
			playerPhysique.x = 1010;
			playerPhysique.y = 214;
			playerReflexes.x = 1010;
			playerReflexes.y = 243;
			playerAim.x = 1010;
			playerAim.y = 272;
			playerIntelligence.x = 1010;
			playerIntelligence.y = 301;
			playerWillpower.x = 1010;
			playerWillpower.y = 330;
			playerLibido.x = 1010;
			playerLibido.y = 359;
			setupStatBar(playerPhysique,"PHYSIQUE",50,100);
			setupStatBar(playerReflexes,"REFLEXES",30,100);
			setupStatBar(playerAim,"AIM",30,100);
			setupStatBar(playerIntelligence,"INTELLIGENCE",90,100);
			setupStatBar(playerWillpower,"WILLPOWER",5,100);
			setupStatBar(playerLibido,"LIBIDO",97,100);
			hidePCStats();


			//Set up the main text field
			var format1:TextFormat = new TextFormat();
			format1.size = 18;
			format1.color = 0xFFFFFF;
			format1.tabStops = [35];
			var mainFont:Font3 = new Font3;
			format1.font = mainFont.fontName;
			var mainTextField:TextField = new TextField();
			prepTextField(mainTextField);
			mainTextField.text = "Trails in Tainted Space booting up...\nLoading horsecocks...\nSpreading vaginas...\nLubricating anuses...\nPlacing traps...\n\n...my body is ready.";
			//Set up backup text field
			var mainTextField2:TextField = new TextField();
			prepTextField(mainTextField2);
			function prepTextField(arg:TextField):void {
				arg.border = false;
				arg.text = "Placeholder";
				arg.background = false;
				arg.multiline = true;
				arg.wordWrap = true;
				arg.border = false;
				arg.x = 211;
				arg.y = 5;
				arg.height = 630;
				arg.width = 760;
				arg.setTextFormat(format1);
				arg.defaultTextFormat = format1;
				addChild(arg);
				arg.visible = false;
			}

			//Set up standard input box!
			var input:TextField = new TextField();
			input.width = 250;
			input.height = 25;
			input.backgroundColor = 0xFFFFFF;
			input.border = true;
			input.borderColor = 0xFFFFFF;

			input.type = TextFieldType.INPUT;
			input.setTextFormat(format1);
			input.defaultTextFormat = format1;


			//SCROLLBAR!
			var upScrollButton:arrow = new arrow();
			upScrollButton.x = mainTextField.x + mainTextField.width;
			upScrollButton.y = mainTextField.y
			var downScrollButton:arrow = new arrow();
			downScrollButton.x = mainTextField.x + mainTextField.width + downScrollButton.width;
			downScrollButton.y = mainTextField.y + mainTextField.height;
			downScrollButton.rotation = 180;
			var scrollBar:bar = new bar();
			scrollBar.x = mainTextField.x + mainTextField.width;
			scrollBar.y = mainTextField.y + upScrollButton.height;
			scrollBar.height = 50;
			var scrollBG:bar = new bar();
			scrollBG.x = mainTextField.x + mainTextField.width;
			scrollBG.y = mainTextField.y + upScrollButton.height;
			scrollBG.height = mainTextField.height - upScrollButton.height - downScrollButton.height;
			scrollBG.transform.colorTransform = fadeOut;
			addChild(scrollBG);
			addChild(scrollBar);
			addChild(upScrollButton);
			addChild(downScrollButton);
			//Since downscroll starts clickable...
			downScrollButton.buttonMode = true;

			clearMenu();
			addButton(0,"Horsecock",horsecock);
			addButton(14,"CLEAR!",clearOutput);
			addButton(16,"2Horse4Me",horsecock);

			//4. MAIN MENU STUFF
			var mainMenuButtons:Array = new Array();
			var titleDisplay:titsLogo = new titsLogo();
			var warningBackground:warningBG = new warningBG();
			var creditText:TextField = new TextField();
			var warningText:TextField = new TextField();
			var websiteDisplay:TextField = new TextField();
			var titleFormat:TextFormat = new TextFormat();
			var myGlow:GlowFilter = new GlowFilter();
			myGlow.color = 0x84449B;
			myGlow.alpha = 1;
			myGlow.blurX = 10;
			myGlow.blurY = 10;
			myGlow.strength = 5;

			//Credit Text
			creditText.border = false;
			creditText.background = false;
			creditText.multiline = true;
			creditText.wordWrap = true;
			creditText.border = false;
			creditText.x = 210;
			creditText.y = 305;
			creditText.height = 77;
			creditText.width = 780;
			//Website Text
			websiteDisplay.border = false;
			websiteDisplay.htmlText = "http://www.trialsInTaintedSpace.com";
			websiteDisplay.background = false;
			websiteDisplay.multiline = true;
			websiteDisplay.wordWrap = true;
			websiteDisplay.border = false;
			websiteDisplay.x = 210;
			websiteDisplay.y = 475;
			websiteDisplay.height = 25;
			websiteDisplay.width = 780;
			//Warning Text
			warningText.border = false;

			warningText.background = false;
			warningText.multiline = true;
			warningText.wordWrap = true;
			warningText.border = false;
			warningText.x = 305;
			warningText.y = 390;
			warningText.height = 75;
			warningText.width = 655;
			//Set the formats
			titleFormat.size = 18;
			titleFormat.color = 0xFFFFFF;
			titleFormat.tabStops = [35];
			titleFormat.font = mainFont.fontName;
			titleFormat.align = TextFormatAlign.CENTER;
			creditText.setTextFormat(titleFormat);
			creditText.defaultTextFormat = titleFormat;
			warningText.setTextFormat(titleFormat);
			warningText.defaultTextFormat = titleFormat;
			websiteDisplay.setTextFormat(titleFormat);
			websiteDisplay.defaultTextFormat = titleFormat;

			titleDisplay.x = 368;
			titleDisplay.y = 142;

			//Add warning display
			warningBackground.x = 210;
			warningBackground.y = 380;
			addChild(titleDisplay);
			addChild(warningBackground);
			addChild(creditText);
			addChild(warningText);
			addChild(websiteDisplay);
			websiteDisplay.visible = false;
			creditText.visible = false;
			warningText.visible = false;
			titleDisplay.visible = false;
			websiteDisplay.visible = false;
			warningBackground.visible = false;

			initializeMainMenu();
			this.addFrameScript( 0, this.mainMenu );
			//mainMenu();
		}

		function horsecock():void {
			clearOutput();
			output("You reach down into the trashcan, unclasp the collar and slip it on.  You tighten it till it fits snugly against your skin, but isn't otherwise uncomfortable.  With a satisfying <b>click</b>, the clasp snaps shut, so you know there's no going back.  Urta's mouth drops as she watches you do this, completely at a loss for words.  Her cock, on the other hand, hardens, knowing just what to do.\n\nYou sink to your knees and then onto your hands in front of her, brazenly displaying your submission to the vixen goddess before you.  She leans back slightly, stunned by this action.  It takes her a minute to recover and pick her jaw up off the floor.  You dutifully wait, silently, until Urta issues a command.  She seems to sense this and clears her throat, clearly embarrassed and nervous. <i>\"Oh, um, good girl,\"</i> she murmurs, patting your head.  You rub your face into her palm, which brings a smile to Urta's face.\n\n<i>\"Well, since the girl at the store said this was a dog collar... you're going to be an obedient little puppy, aren't you pet?\"</i> Urta asks.  You bark an affirmative response. <i>\"And that makes me your Owner, doesn't it?\"</i>  You bark again.  Urta's smile widens, and the dick between her legs twitches happily.  Your foxy lover stands up and gives you a once-over, her stocking-clad legs walking circles around you.  You remain stock still until you feel one soft, furry paw press up against your covered groin.\n\n<i>\"You're a good little doggy, right?\"</i> Urta leans down and whispers in your ear from behind.  You nod and bark happily again.  <i>\"You don't look like a good doggy to me,\"</i> she murmurs, leaning back up and pressing that paw into your groin once more, slightly more insistent.  You find yourself growing wetter at the touch, but you can't help but wonder about her words.  What else is there to being a good dog?\n\n<i>\"Your clothes, pet,\"</i> your Owner says, catching your puzzled look.  <i>\"Good doggies don't wear anything but their collars.  Oh, of course!</i>\"  You start to stand and take off your comfortable clothes, but Urta places a hand on your shoulder.  <i>\"Stay on all fours, pet,\"</i> she warns, and you suddenly realize she's holding a rolled up copy of the Tel'Adre Times in her other hand.  You gulp, slightly scared but even more turned on at how she's taking charge.\n\n\You struggle out of your comfortable armor.  It takes a good minute of work, but then you sit on your hands and knees, bare naked except for the collar, in front of Urta.  You feel so vulnerable like this, like you're baring your soul to someone, but somehow it's OK because it's Urta, someone who started as a friend, bared her own soul to you, and became your lover.");
			leftSideBar.sceneBy.text = "Third Games";
		}

		//Build the main 15 buttons!
		function initializeButtons():void {
			var temp = 0;
			//X and Y values for our buttons.
			var ex:int = 52;
			var why:int = 650;
			var texts:String = "Random#: ";
			while (temp < 60) {
				buttonData[temp] = new purpleButton;
				temp++;
			}
			temp = 0;
			while (temp < 15) {
				//Adjust for new rows
				if(temp % 5 == 0 && temp > 0) {
					ex -= 790;
					why += 50;
				}
				//Add on from previous button value.
				ex += 158;
				
				if (temp == 6 || temp == 10 || temp == 11 || temp == 12) {
					buttons[temp] = new purpleButton;
				}
				else {
					buttons[temp] = new blueButton;
				}
				addChild(buttons[temp]);
				buttons[temp].caption.htmlText = texts + String(Math.round(Math.random()*10));
				buttons[temp].x = ex;
				buttons[temp].y = why;
				buttons[temp].mouseChildren = false;
				//Add hotkey tags as appropriate.
				switch(temp) {
					case 0:
						buttons[temp].hotkey.text = "1";
						break;
					case 1:
						buttons[temp].hotkey.text = "2";
						break;
					case 2:
						buttons[temp].hotkey.text = "3";
						break;
					case 3:
						buttons[temp].hotkey.text = "4";
						break;
					case 4:
						buttons[temp].hotkey.text = "5";
						break;
					case 5:
						buttons[temp].hotkey.text = "Q";
						break;
					case 6:
						buttons[temp].hotkey.text = "W";
						break;
					case 7:
						buttons[temp].hotkey.text = "E";
						break;
					case 8:
						buttons[temp].hotkey.text = "R";
						break;
					case 9:
						buttons[temp].hotkey.text = "T";
						break;
					case 10:
						buttons[temp].hotkey.text = "A";
						break;
					case 11:
						buttons[temp].hotkey.text = "S";
						break;
					case 12:
						buttons[temp].hotkey.text = "D";
						break;
					case 13:
						buttons[temp].hotkey.text = "F";
						break;
					case 14:
						buttons[temp].hotkey.text = "G";
						break;
				}
				temp++;
			}
		}
	}
}