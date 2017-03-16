package classes.Ships 
{
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
			trace("ExampleOnCreate called for", se.Name, "on", ship.Name);
		}
		public static function ExampleOnRemove(se:StatusEffectPayload, ship:SpaceShip):void
		{
			trace("ExampleOnRemove called for", se.Name, "on", ship.Name);
		}
		
	}

}