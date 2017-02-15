package classes.Items.Miscellaneous
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.Engine.Utility.num2Ordinal;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.StorageClass;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.AddLogEvent;
	
	public class Priapin extends ItemSlotClass
	{
		public function Priapin()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.DRUG;
			
			shortName = "Priapin";
			longName = "Priapin medipen";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a blue-colored medipen loaded with Priapin";
			
			tooltip = "A refinement on the side effect-plagued Throbb and Semen’s Friend lines, Priapin offers users a short term boost to their male libido, fertility and erectile function. Particularly popular among hermaphrodites seeking to increase their chances of inseminating partners without necessarily increasing their female fertility.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 1200;
			
			version = _latestVersion;
		}
		
		public function useEffect(target:Creature):void
		{
			if(target.hasStatusEffect("Priapin"))
			{
				target.setStatusMinutes("Priapin", 1440);
				return;
			}
			// Add "Priapin" SE for 24 hours
			// Remove "Firing Blanks" perk for 24 hours ( virility() )
			// v1: Increase cum quality by 1 " " ( cumQuality() )
			// v2: Increase cum quantity by 1 " " ( cumMultiplier() )
			// v3: Increase libido x 1.75 " " ( libido() )
			// v4: Increase lust floor by 30 " " ( lustMin() )
			target.createStatusEffect("Priapin", 1, 1, 1.75, 30, false, "Icon_DrugVial", ((target is PlayerCharacter ? "Your m" : "M") + "asculine virility has been piqued temporarily."), false, 1440, 0xB793C4);
		}
		
		public static function effectEnds(maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
		{
			if (target is PlayerCharacter)
			{
				AddLogEvent("The overwhelming, bulging urge you’ve been feeling over the last day or so is slowly ebbing away. Although it’s been fun, it’s something of a relief to stop wanting to bend over every single person you meet.", "passive", maxEffectLength);
			}
		}

		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Nonesuch");
			kGAMECLASS.showName("\nPRIAPIN");
			
			if(target is PlayerCharacter)
			{
				// Use
				if(!target.hasCock())
				{
					kGAMECLASS.output("It is probably not a good idea to take this without a penis first...");
					if(!kGAMECLASS.infiniteItems()) quantity++;
					return false;
				}
				
				kGAMECLASS.output("You take the medipen out of its packaging and press it to your arm. It releases its payload into your veins with a small hiss. Woof! Hot liquid arousal sinks into your [pc.groin], settling itself heavily in " + (target.balls > 0 ? "your [pc.balls]" : "[pc.eachCock]") + ". An instant spring of masculine urge unfurls its leaves in your mind, flickering giddy light over your every thought. Somebody nearby with a tight and willing hole definitely needs to find out about you.");
				
				useEffect(target);
				
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the Priapin medipen to no effect.");
			}
			return false;
		}
	}
}

