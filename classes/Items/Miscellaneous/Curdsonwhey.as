package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	
	public class Curdsonwhey extends ItemSlotClass
	{
		public function Curdsonwhey()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "Curdsonwhey";
			longName = "Curdsonwhey lozenge";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a Curdsonwhey lozenge";
			
			tooltip = "This medicine is based upon a traditional myr remedy, administered to counteract the hormones released by bothrioc impregnation. It appears as a rather unappetizing, large brown lozenge.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 300;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter)
			{
				output("You pop the lozenge into your mouth. Ugh! So bitter. With some effort you swallow, carrying the unpleasant flavor away from your taste buds and down to your gut.");
				output("\n\nNothing really <i>feels</i> different, but the unmistakable taste still lingers in the back of your throat....");
				
				if (kGAMECLASS.bothriocAddiction() < 100)
				{
					target.createStatusEffect("Curdsonwhey", 0, 0, 0, 0, false, "Pill", "You are currently under the effects of the Curdsonwhey lozenge.", false, 240);
				}
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " gobs the pill to no effect.");
			}
			return false;
		}
		
		public static function effectProc(target:Creature, initDuration:uint, targetDelta:uint):void
		{
			var addictionReduction:uint = 5 + rand(6);
			if (target.personality <= 20 && rand(2) == 0) addictionReduction += 1 + rand(2);
			
			var initAddiction:Number = kGAMECLASS.bothriocAddiction();
			
			// Reduce addiction based on rolls^, but clamp to 50 if addiction has gone above 50
			kGAMECLASS.bothriocAddiction((-1 * addictionReduction));
			
			// If addiction is present at all, chance for +Will
			if (kGAMECLASS.bothriocAddiction() > 0 && rand(2) == 0)
			{
				target.willpowerRaw += 1;
			}
			
			// Don't output if addiction didn't actually change
			if (kGAMECLASS.flags["BOTHRIOC_ADDICTION"] == undefined || initAddiction == kGAMECLASS.flags["BOTHRIOC_ADDICTION"]) return;
			
			// Calculate the time offset
			var deltaShift:uint = initDuration - targetDelta;
			
			if (kGAMECLASS.flags["BOTHRIOC_ADDICTION"] >= 50)
			{
				AddLogEvent(ParseText("You roll your [pc.tongue], trying to get rid of the bitter aftertaste in your mouth. You feel slightly more clear and cynical about the world around you. Fortunately, a soft core of calm and happiness remains, untouched by your current sourness. Perhaps that will always be with you, now."), "passive", deltaShift);
			}
			else if (kGAMECLASS.flags["BOTHRIOC_ADDICTION"] > 0)
			{
				AddLogEvent(ParseText("You roll your [pc.tongue], trying to get rid of the bitter aftertaste in your mouth. You feel slightly more cogent and aware of the world around you; however it’s not a particularly nice sensation. Cynicism and jadedness steals over you about your current set of goals."), "passive", deltaShift);
			}
			else
			{
				AddLogEvent("You spit, futilely attempting to rid yourself of the bitter taste in your mouth. Holy hell is this a rotten universe you’ve ended up in! At least you’re very clear about that and not deluding yourself about the intrinsic awfulness of everything, unlike some people you can think of.", "passive", deltaShift);
			}
		}
	}
}
