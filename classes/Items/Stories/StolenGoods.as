﻿package classes.Items.Stories
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.inCombat;
	import classes.GameData.CodexManager;
	
	public class StolenGoods extends ItemSlotClass
	{
		public function StolenGoods()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.GADGET;
			
			this.shortName = "Story:Goods";
			this.longName = "code for “Stolen Goods”";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a story download code for “Stolen Goods”";
			
			this.tooltip = "Using this item will add the story “Stolen Goods” to your Codex’s fiction section.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 100;
			
			this.version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				if(CodexManager.entryUnlocked("Stolen Goods")) kGAMECLASS.output("You realize that you already have this story and toss out the useless code.");
				else
				{
					kGAMECLASS.output("You scan the code with your Codex, unlocking “Stolen Goods” in your Codex’s fiction section.");
					CodexManager.unlockEntry("Stolen Goods");
				}
			}
			else
			{
				kGAMECLASS.output("Nope.");
			}
			return false;
		}
	}
}
