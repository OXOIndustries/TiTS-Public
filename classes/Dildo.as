package classes {
	import classes.CockClass;
	import classes.ItemSlotClass;
	import classes.Characters.PlayerCharacter;

	public class Dildo extends ItemSlotClass {
	
		//Constructor
		public function Dildo() {
			itemFlags = [GLOBAL.NOT_CONSUMED_BY_DEFAULT];
			material = "plastic";
		}
		public var material:String = "silicone";
		public var timesUsed:Number = 0;
		public var cumQ:Number = 0;

		public function cock():CockClass
		{
			return new CockClass();
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				if(!target.canMasturbate() || target.lust() < 33)
				{
					kGAMECLASS.output("You’re not really in the mood to masturbate right now....");
				}
				else if(!target.hasVagina())
				{
					kGAMECLASS.output("You don’t have the proper genitals to use this!");
				}
				else if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.NOFAP))
				{
					kGAMECLASS.output("Masturbating here would be impossible.");
				}
				else if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL))
				{
					kGAMECLASS.output("Public masturbation is illegal here. Trying to masturbate would almost certainly land you in jail.");
				}
				else if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC) && target.exhibitionism() < 33 && target.libido() < 70)
				{
					kGAMECLASS.output("You cannot use the dildo at this time!");
				}
				else
				{
					//dildo call here:
					//Have Carl hold onto the dildo so the scene can grab it.
					//YES IT IS A GIANT HACK.
					//NO I DON'T CARE.
					if(kGAMECLASS.chars["CARL"].hasStatusEffect("DILDO"))
					{
						kGAMECLASS.chars["CARL"].inventory.splice((kGAMECLASS.chars["CARL"].inventory.length-1), 1);
						kGAMECLASS.chars["CARL"].removeStatusEffect("DILDO");
					}
					kGAMECLASS.chars["CARL"].createStatusEffect("DILDO");
					kGAMECLASS.chars["CARL"].inventory.push(this);
					
					kGAMECLASS.vaginaRouter([kGAMECLASS.useDildoOnPussy,cock().volume(),1,0]);
				}
			}
			else
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use the dildo.");
			}
			return true;
		}
	}
}