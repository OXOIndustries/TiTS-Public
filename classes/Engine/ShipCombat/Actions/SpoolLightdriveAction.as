package classes.Engine.ShipCombat.Actions 
{
	import classes.Engine.ShipCombat.ShipAction;
	import classes.Ships.SpaceShip;
	import classes.Engine.Interfaces.*;
	import classes.Ships.StatusEffectPayload;
	import classes.Resources.StatusIcons;
	import classes.GameData.CombatManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SpoolLightdriveAction extends ShipAction
	{
		public function SpoolLightdriveAction() 
		{
			UniqueName = "Flee";
			ButtonName = "Flee";
			TooltipTitle = "Flee";
			TooltipBody = "Flee";
			RequiresTarget = false;
		}
		
		override public function IsAvailable(usingShip:SpaceShip):Boolean
		{
			return true;
		}
	
		override public function Implementor(user:SpaceShip, target:SpaceShip, playerGroup:Array, hostileGroup:Array):void
		{
			output("You smash the emergency spool-up button on your control console, an inrush of capacitor current kicking the ever-present background thrum inside your ship up a notch or two, power rapidly being funneled to the Lightdrive Engines. It'll take a couple of seconds to reach critical power....");
			user.AddStatusEffect(new StatusEffectPayload(
				"Lightdrive Spooling",
				{
					chargedInRound: CombatManager.getRoundCount() + 2
				},
				-1, 
				StatusEffectPayload.DURATION_PERM, 
				StatusIcons.Constrict,
				true,
				false));
		}
		
	}

}