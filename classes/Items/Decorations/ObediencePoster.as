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
	
	public class ObediencePoster extends ItemSlotClass
	{
		public function ObediencePoster()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			this.shortName = "Poster:Ob";
			this.longName = "obedience poster";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a holo-poster depicting two happy slaves";
			
			this.tooltip = "Using this item will install the holo-poster as a decoration on your ship.\n\nAccording to the signatures on the projector, this art was made by DCLZexon. Sweet!";
			
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
				kGAMECLASS.flags["KQ_POSTER_HUNG"] = 1;
			}
			else
			{
				kGAMECLASS.output("Nope.");
			}
			return false;
		}
	}
}
