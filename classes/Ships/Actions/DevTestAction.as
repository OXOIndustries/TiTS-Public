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
			var se:StatusEffectPayload = target.GetStatusEffect("Test Effect");
			if (se == null)
			{
				output(user.Name + " has used a test action!");
				
				se = new StatusEffectPayload(
					"Test Effect", 
					{ testValue: 1 }, 
					3, 
					StatusEffectPayload.DURATION_ROUNDS, 
					"Icon_RadioSignal", 
					true, 
					false,
					"ExampleOnRemove",
					"ExampleOnCreate",
					"ExampleOnRoundStart",
					"ExampleOnRoundEnd");
				se.TooltipHeader = "A Test Effect";
				se.TooltipBody = "This effect is created by a test action that is used to test ship combat output order.";
				
				target.AddStatusEffect(se);
			}
			else
			{
				output(user.Name + " reapplied the effect from the test action!");
				se.Duration = 3;
			}
		}
	}

}