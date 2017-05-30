package classes.Engine.ShipCombat.Actions 
{
	import classes.Engine.ShipCombat.ShipAction;
	import classes.Ships.SpaceShip;
	import classes.Engine.Interfaces.*;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class DevTestAction extends ShipAction
	{
		public function DevTestAction() 
		{
			UniqueName = "Test";
			ButtonName = "Test";
			TooltipTitle = "Test Action";
			TooltipBody = "A testing action purely to confirm the gadget/action system is functional.";
			RequiresTarget = false;
		}	
		
		override public function IsAvailable(usingShip:SpaceShip):Boolean
		{
			return true;
		}
		
		override public function Implementor(user:SpaceShip, target:SpaceShip, playerGroup:Array, hostileGroup:Array):void
		{
			output(user.Name + " has used a test action!");
		}
	}

}