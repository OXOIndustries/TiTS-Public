package classes.Items.Decorations
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
	
	public class KallyPoster extends ItemSlotClass
	{
		public function KallyPoster()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			this.shortName = "Postr:Kally";
			this.longName = "kally poster";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a poster of Kally, encouraging viewers to work at her bar";
			
			this.tooltip = "Using this item will install the poster as a decoration on your ship.\n\nAccording to the signatures on the back, the lines were drawn by Tsuda and the colors by Tisinrei. Sweet!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 100;
			
			this.version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("The poster will now appear onboard your ship. It can be taken down by accessing the Items->Unequip->Decorations menu.");
				kGAMECLASS.flags["KALLY_POSTER_HUNG"] = 1;
			}
			else
			{
				kGAMECLASS.output("Nope.");
			}
			return false;
		}
	}
}
