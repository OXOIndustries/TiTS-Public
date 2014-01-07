package classes.Items
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import flash.net.registerClassAlias;
	
	public class ChangeMe extends ItemSlotClass
	{
		// This is a static initializer, it's run *ONCE* per class definition, the first time it is referenced ANYWHERE in the code
		{
			registerClassAlias("ChangeMe", ChangeMe);
		}
		//constructor
		public function ChangeMe()
		{
			
		}
	}
}