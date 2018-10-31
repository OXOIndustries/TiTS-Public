package classes.Ships 
{
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipEffectFunctionLibrary 
	{
		public function ShipEffectFunctionLibrary() 
		{
			
		}
		
		public static function ExampleOnCreate(se:StatusEffectPayload, ship:SpaceShip):void
		{
			output("\n\nExampleOnCreate called for " + se.Name + " on " + ship.Name);
		}
		public static function ExampleOnRemove(se:StatusEffectPayload, ship:SpaceShip):void
		{
			output("\n\nExampleOnRemove called for " + se.Name + " on " + ship.Name);
		}
		public static function ExampleOnRoundStart(se:StatusEffectPayload, ship:SpaceShip):void
		{
			output("ExampleOnRoundStart called for " + se.Name + " on " + ship.Name + "\n\n");
		}
		public static function ExampleOnRoundEnd(se:StatusEffectPayload, ship:SpaceShip):void
		{
			output("\n\nExampleOnRoundEnd called for " + se.Name + " on " + ship.Name);
		}
		
	}

}