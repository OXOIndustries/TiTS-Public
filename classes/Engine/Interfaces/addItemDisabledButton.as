package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author Gedan
	 */
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.Creature;

	public function addItemDisabledButton(slot:int, item:ItemSlotClass, ttHeader:String = null, ttBody:String = null, seller:Creature = null, buyer:Creature = null):void
	{
		kGAMECLASS.addItemDisabledButton(slot, item, ttHeader, ttBody, seller, buyer);
	}

}