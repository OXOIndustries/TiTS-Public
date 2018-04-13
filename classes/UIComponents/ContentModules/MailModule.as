package classes.UIComponents.ContentModules 
{
	import classes.UIComponents.ContentModule;
	import fl.controls.UIScrollBar;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	import classes.UIComponents.ContentModuleComponents.MailTree;
	import classes.GameData.MailManager;
	import classes.kGAMECLASS;
	import classes.Engine.Interfaces.*;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MailModule extends ContentModule
	{
		private var _mailText:TextField;
		private var _scrollBar:UIScrollBar;
		private var _mailTree:MailTree;
		
		public function get htmlText():String { return _mailText.htmlText; }
		public function set htmlText(v:String):void { _mailText.htmlText = v; }
		
		public function MailModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = false;
			fullButtonTrayEnabled = false;
			_moduleName = "MailDisplay";
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			Build();
			BuildTree();
		}
		
		private function Build():void
		{
			_mailText = new TextField();
			_mailText.border = false;
			_mailText.background = false;
			_mailText.multiline = true;
			_mailText.wordWrap = true;
			_mailText.embedFonts = true;
			_mailText.antiAliasType = AntiAliasType.ADVANCED;
			_mailText.x = 5;
			_mailText.y = 5;
			_mailText.height = 735;
			_mailText.width = 474;
			_mailText.styleSheet = UIStyleSettings.gMainTextCSSStyleSheet;
			_mailText.name = _moduleName+"text";
			_mailText.htmlText = "<span class='words'><p>Syncing smutbuffer... preparing waifusbase... reticulating horsecocks... DONE\n\n> I am mailbox. Please insert dragon dongs.</p></span>";
			addChild(_mailText);
			
			_mailText.addEventListener(Event.SCROLL, updateScrollBar);
			
			_scrollBar = new UIScrollBar();
			_scrollBar.direction = "vertical";
			_scrollBar.setSize(_mailText.width, _mailText.height + 5);
			_scrollBar.move(_mailText.x + _mailText.width, 0);
			addChild(_scrollBar);
			_scrollBar.scrollTarget = _mailText;
		}
		
		private function updateScrollBar(e:Event):void
		{
			_scrollBar.update();
		}
		
		private function BuildTree():void
		{
			_mailTree = new MailTree();
			_mailTree.x = _mailText.x + _mailText.width + 21;
			addChild(_mailTree);
		}
		
		public override function hiddenFromStage():void
		{
			_mailTree.hiddenFromStage();
		}
		
		public function update():void
		{
			_mailTree.update();
		}
		
		public function displayFor(key:String):void
		{
			MailManager.readEntry(key, kGAMECLASS.GetGameTimestamp());
			var entry:Object = MailManager.getEntry(key);
			
			_mailText.htmlText = "<span class='words'><p>";
			_mailText.htmlText += "<b>From:</b> " + entry.FromCache + " &lt;" + entry.FromAddressCache + "&gt;\n";
			_mailText.htmlText += "<b>To:</b> " + entry.ToCache + " &lt;" + entry.ToAddressCache + "&gt;\n";
			_mailText.htmlText += "<b>Subject:</b> " + entry.SubjectCache + "\n\n";
			_mailText.htmlText += entry.ContentCache;
			_mailText.htmlText += "</p></span>";
			update();
			
			kGAMECLASS.updateMailStatus();
			
			clearGhostMenu();
			if(kGAMECLASS.SpamEmailKeys.indexOf(key) != -1) addGhostButton(0, "Delete", deleteFor, key);
			
			//IDK Savin wants a menu inside the email for this stuff
			if(key == "sam_preg2" && kGAMECLASS.flags["SAM_PREG_EMAIL_CUSTOM"] == undefined && kGAMECLASS.flags["SAM_GAST_PREG_TIMER"] >= 60)
			{
				kGAMECLASS.flags["SAM_PREG_EMAIL_CUSTOM"] = 1;
				addGhostButton(0, "Natural", gastigothPregEmail2Natural, "Sam", "Natural", "Keep your child" + (kGAMECLASS.flags["SAM_NUM_BABIES"] > 1 ? "ren" : "") + " natural.");
				addGhostButton(1, "Safe Edits", gastigothPregEmail2Safe, "Sam", "Safe Edits", "Make the minimum edits necessary to help the criminal-born child" + (kGAMECLASS.flags["SAM_NUM_BABIES"] > 1 ? "ren be productive members" : " be a productive member") + " of society.");
				addGhostButton(2, "Custom Job", gastigothPregEmail2Custom, "Sam", "Custom Job", "Go all in with the editing, making " + (kGAMECLASS.flags["SAM_NUM_BABIES"] > 1 ? "perfect children" : "a perfect child") + ".");
				return;
			} 
			else if(key == "khorgan_preg2" && kGAMECLASS.flags["KHORGAN_PREG_EMAIL_CUSTOM"] == undefined && kGAMECLASS.flags["KHORGAN_GAST_PREG_TIMER"] >= 50)
			{
				kGAMECLASS.flags["KHORGAN_PREG_EMAIL_CUSTOM"] = 1;
				addGhostButton(0, "Natural", gastigothPregEmail2Natural, "Khorgan", "Natural", "Keep your child" + (kGAMECLASS.flags["KHORGAN_NUM_BABIES"] > 1 ? "ren" : "") + " natural.");
				addGhostButton(1, "Safe Edits", gastigothPregEmail2Safe, "Khorgan", "Safe Edits", "Make the minimum edits necessary to help the criminal-born child" + (kGAMECLASS.flags["KHORGAN_NUM_BABIES"] > 1 ? "ren be productive members" : " be a productive member") + " of society.");
				addGhostButton(2, "Custom Job", gastigothPregEmail2Custom, "Khorgan", "Custom Job", "Go all in with the editing, making " + (kGAMECLASS.flags["KHORGAN_NUM_BABIES"] > 1 ? "perfect children" : "a perfect child") + ".");
				return;
			} 
			else if(key == "tamtam_preg2" && kGAMECLASS.flags["TAMTAM_PREG_EMAIL_CUSTOM"] == undefined && kGAMECLASS.flags["TAMTAM_GAST_PREG_TIMER"] >= 80)
			{
				kGAMECLASS.flags["TAMTAM_PREG_EMAIL_CUSTOM"] = 1;
				addGhostButton(0, "Natural", gastigothPregEmail2Natural, "Tam-Tam", "Natural", "Keep your child" + (kGAMECLASS.flags["TAMTAM_NUM_BABIES"] > 1 ? "ren" : "") + " natural.");
				addGhostButton(1, "Safe Edits", gastigothPregEmail2Safe, "Tam-Tam", "Safe Edits", "Make the minimum edits necessary to help the criminal-born child" + (kGAMECLASS.flags["TAMTAM_NUM_BABIES"] > 1 ? "ren be productive members" : " be a productive member") + " of society.");
				addGhostButton(2, "Custom Job", gastigothPregEmail2Custom, "Tam-Tam", "Custom Job", "Go all in with the editing, making " + (kGAMECLASS.flags["TAMTAM_NUM_BABIES"] > 1 ? "perfect children" : "a perfect child") + ".");
				return;
			}
			
			
			addGhostButton(4, "Back", kGAMECLASS.showMails);
		}
		
		public function deleteFor(key:String):void
		{
			var entry:Object = MailManager.getEntry(key);
			
			_mailText.htmlText = "<span class='words'><p>";
			_mailText.htmlText += "<b>From:</b> " + entry.FromCache + " &lt;" + entry.FromAddressCache + "&gt;\n";
			_mailText.htmlText += "<b>To:</b> " + entry.ToCache + " &lt;" + entry.ToAddressCache + "&gt;\n";
			_mailText.htmlText += "<b>Subject:</b> " + entry.SubjectCache + "\n\n";
			_mailText.htmlText += "\n<i>Message deleted.</i>\n\n";
			_mailText.htmlText += "</p></span>";
			
			MailManager.clearEntry(key);
			update();
			kGAMECLASS.updateMailStatus();
			clearGhostMenu();
			addGhostButton(0, "Next", kGAMECLASS.showMails);
		}
		
		//I don't wanna put this shit here but I think I gotta
		public function gastigothPregEmail2Natural(prisonerName:String):void
		{
			var plural:Boolean = ((prisonerName == "Tam-Tam" && kGAMECLASS.flags["TAMTAM_NUM_BABIES"] > 1)
							||(prisonerName == "Khorgan" && kGAMECLASS.flags["KHORGAN_NUM_BABIES"] > 1)
							||(prisonerName == "Sam" && kGAMECLASS.flags["SAM_NUM_BABIES"] > 1));
			
			_mailText.htmlText = "";
			if(kGAMECLASS.pc.isAss() || kGAMECLASS.pc.isBro()) _mailText.htmlText += "Yeah fuck that. You toss the email into your junk folder, determined to let your kid" + (plural ? "s" : "") + " grow up to be whoever they’re gonna be. If there’s something wrong, you’ll be there to fix it like a man.";
			else _mailText.htmlText += "You mull the question over for a while before writing Dr. Kramer back, expressing your desire to let your child" + (plural ? "ren" : "") + " be born naturally, without any genetic manipulation. You’ll give your child" + (plural ? "ren" : "") + " a chance to become whoever they <i>want</i> to be, without some the scientific pre-destination planned out for them.";
			
			if(prisonerName == "Tam-Tam") kGAMECLASS.flags["TAMTAM_BABY_GENES"] = 1;
			else if(prisonerName == "Khorgan") kGAMECLASS.flags["KHORGAN_BABY_GENES"] = 1;
			else if(prisonerName == "Sam") kGAMECLASS.flags["SAM_BABY_GENES"] = 1;
			
			kGAMECLASS.updateMailStatus();
			clearGhostMenu();
			addGhostButton(0, "Next", kGAMECLASS.showMails);
		}

		public function gastigothPregEmail2Safe(prisonerName:String):void
		{
			var plural:Boolean = ((prisonerName == "Tam-Tam" && kGAMECLASS.flags["TAMTAM_NUM_BABIES"] > 1)
							||(prisonerName == "Khorgan" && kGAMECLASS.flags["KHORGAN_NUM_BABIES"] > 1)
							||(prisonerName == "Sam" && kGAMECLASS.flags["SAM_NUM_BABIES"] > 1));
			
			_mailText.htmlText = "";
			_mailText.htmlText += "After some thought and a few read-throughs of the report, you write the doctor back telling him to make a few minor corrections -- safeguards against criminal and psychotic behavior, fixing any genetic abnormalities that could negatively affect your child" + (plural ? "ren" : "") + " in the future. You want to give your spawn the best start in life possible, but you make sure nothing in the changes you request is going to act like some sort of scientific predestination, like what your father did to you.";

			if(prisonerName == "Tam-Tam") kGAMECLASS.flags["TAMTAM_BABY_GENES"] = 2;
			else if(prisonerName == "Khorgan") kGAMECLASS.flags["KHORGAN_BABY_GENES"] = 2;
			else if(prisonerName == "Sam") kGAMECLASS.flags["SAM_BABY_GENES"] = 2;

			kGAMECLASS.updateMailStatus();
			clearGhostMenu();
			addGhostButton(0, "Next", kGAMECLASS.showMails);
		}

		public function gastigothPregEmail2Custom(prisonerName:String):void
		{
			var plural:Boolean = ((prisonerName == "Tam-Tam" && kGAMECLASS.flags["TAMTAM_NUM_BABIES"] > 1)
							||(prisonerName == "Khorgan" && kGAMECLASS.flags["KHORGAN_NUM_BABIES"] > 1)
							||(prisonerName == "Sam" && kGAMECLASS.flags["SAM_NUM_BABIES"] > 1));
			
			_mailText.htmlText = "";
			_mailText.htmlText += "What’s good enough for you is good enough for your spawn... and almost certainly better, with you at the helm. You spend the better part of an hour rigorously going through the report and filling out the forms attached with it, identifying every little potential deficiency and outlining improvements in every facet of your child" + (plural ? "ren" : "") + "’s physiology. Your spawn will be the perfect heir, the ideal Steele.";
			_mailText.htmlText += "\n\nOnce you’ve painstakingly redesigned your child" + (plural ? "ren" : "") + ", you reply to Dr. Kramer’s email with all the attached forms, commenting on any point you think might be unclear. Satisfied, you send off your reply and sit back, smiling to yourself. It’s going to be hard waiting until your child" + (plural ? "ren are" : " is") + " born!";
			
			if(prisonerName == "Tam-Tam") kGAMECLASS.flags["TAMTAM_BABY_GENES"] = 3;
			else if(prisonerName == "Khorgan") kGAMECLASS.flags["KHORGAN_BABY_GENES"] = 3;
			else if(prisonerName == "Sam") kGAMECLASS.flags["SAM_BABY_GENES"] = 3;
			
			kGAMECLASS.updateMailStatus();
			clearGhostMenu();
			addGhostButton(0, "Next", kGAMECLASS.showMails);
		}
		
	}
}
