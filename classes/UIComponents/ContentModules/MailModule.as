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
			
			//IDK Savin wants a menu inside the email system for this stuff
			if(key == "sam_preg2" && kGAMECLASS.flags["SAM_PREG_EMAIL_CUSTOM"] == undefined)
			{
				kGAMECLASS.flags["SAM_PREG_EMAIL_CUSTOM"] = 1;
				addGhostButton(0, "Natural", gastigothPregEmail2Natural, "Sam", "Natural", "Keep your child" + (kGAMECLASS.flags["SAM_NUM_BABIES"] > 1 ? "ren" : "") + " natural.");
				addGhostButton(1, "Safe Edits", gastigothPregEmail2Safe, "Sam", "Safe Edits", "Make the minimum edits necessary to help the criminal-born child" + (kGAMECLASS.flags["SAM_NUM_BABIES"] > 1 ? "ren be productive members" : " be a productive member") + " of society.");
				addGhostButton(2, "Custom Job", gastigothPregEmail2Custom, "Sam", "Custom Job", "Go all in with the editing, making " + (kGAMECLASS.flags["SAM_NUM_BABIES"] > 1 ? "perfect children" : "a perect child") + ".");
				return;
			} 
			else if(key == "khorgan_preg2" && kGAMECLASS.flags["KHORGAN_PREG_EMAIL_CUSTOM"] == undefined)
			{
				kGAMECLASS.flags["KHORGAN_PREG_EMAIL_CUSTOM"] = 1;
				addGhostButton(0, "Natural", gastigothPregEmail2Natural, "Khorgan", "Natural", "Keep your child" + (kGAMECLASS.flags["KHORGAN_NUM_BABIES"] > 1 ? "ren" : "") + " natural.");
				addGhostButton(1, "Safe Edits", gastigothPregEmail2Safe, "Khorgan", "Safe Edits", "Make the minimum edits necessary to help the criminal-born child" + (kGAMECLASS.flags["KHORGAN_NUM_BABIES"] > 1 ? "ren be productive members" : " be a productive member") + " of society.");
				addGhostButton(2, "Custom Job", gastigothPregEmail2Custom, "Khorgan", "Custom Job", "Go all in with the editing, making " + (kGAMECLASS.flags["KHORGAN_NUM_BABIES"] > 1 ? "perfect children" : "a perect child") + ".");
				return;
			} 
			else if(key == "tamtam_preg2" && kGAMECLASS.flags["TAMTAM_PREG_EMAIL_CUSTOM"] == undefined)
			{
				kGAMECLASS.flags["TAMTAM_PREG_EMAIL_CUSTOM"] = 1;
				addGhostButton(0, "Natural", gastigothPregEmail2Natural, "Tam-Tam", "Natural", "Keep your child" + (kGAMECLASS.flags["TAMTAM_NUM_BABIES"] > 1 ? "ren" : "") + " natural.");
				addGhostButton(1, "Safe Edits", gastigothPregEmail2Safe, "Tam-Tam", "Safe Edits", "Make the minimum edits necessary to help the criminal-born child" + (kGAMECLASS.flags["TAMTAM_NUM_BABIES"] > 1 ? "ren be productive members" : " be a productive member") + " of society.");
				addGhostButton(2, "Custom Job", gastigothPregEmail2Custom, "Tam-Tam", "Custom Job", "Go all in with the editing, making " + (kGAMECLASS.flags["TAMTAM_NUM_BABIES"] > 1 ? "perfect children" : "a perect child") + ".");
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
			kGAMECLASS.updateMailStatus();
			clearGhostMenu();
			addGhostButton(0, "Next", kGAMECLASS.showMails);
		}
		
		public function gastigothPregEmail2Natural(prisonerName:String):void
		{
			_mailText.htmlText += "\n\n";
			_mailText.htmlText += "\n\n";
			_mailText.htmlText += "\n\n";
			_mailText.htmlText += "\n\n";
			_mailText.htmlText += "\n\n";
			_mailText.htmlText += "\n\n";
			_mailText.htmlText += "\n\n";
			_mailText.htmlText += "\n\n";
			
			kGAMECLASS.updateMailStatus();
			clearGhostMenu();
			addGhostButton(0, "Next", kGAMECLASS.showMails);
		}

		public function gastigothPregEmail2Safe(prisonerName:String):void
		{
			
			
			
			
			
			
			
			
			
		}

		public function gastigothPregEmail2Custom(prisonerName:String):void
		{
			
			
			
			
			
			
			
			
			
		}
		
	}
}
