package classes.Ships.Actions 
{
	import classes.Ships.Actions.ShipAction;
	import classes.Ships.SpaceShip;
	import classes.Engine.Interfaces.*;
	import classes.Ships.StatusEffectPayload;
	import classes.Resources.StatusIcons;
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
			
			var se:StatusEffectPayload = new StatusEffectPayload(
				"Test Effect", 
				{ testValue: 1 }, 
				3, 
				StatusEffectPayload.DURATION_ROUNDS, 
				StatusIcons.Icon_RadioSignal, 
				true, 
				false,
				"ExampleOnRemove",
				"ExampleOnCreate",
				"ExampleOnRoundStart",
				"ExampleOnRoundEnd");
				
			target.AddStatusEffect(se);
		}
	}

}