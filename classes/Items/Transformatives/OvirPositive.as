package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Utility.rand;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;

	public class OvirPositive extends ItemSlotClass
	{
		public function OvirPositive()
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 5;
			this.type = GLOBAL.PILL;

			shortName = "Ovir+";
			longName = "Ovir Positive";

			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));

			description = "a medipen labelled as containing ‘Ovir Positive’";

			tooltip = "Ovir Positive is the perfect treatment for those who want to be ovir, but don't want to worry about pesky things like pills. Contained in this medipen are thousands of gene-altering microsurgeons with extended program buffers. Whether you're an ausar, rahn or anything in between, you'll come out with a whole new look on life. An ovir look.";

			TooltipManager.addTooltip(shortName, tooltip);

			basePrice = 32150;

			this.version = _latestVersion;
		}

		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();

			if (!(target is PlayerCharacter))
			{
				output(target.capitalA + target.short + " uses it to no effect.");
				return false;
			}

			//Taking pill
			output("You hold the tip of the medipen against your [pc.skinFurScales] and hit the activator. A subtle hiss is all the device gives you by way of a confirmation of its success...");

			OvirAce.ApplyTFs(target, true);

			return false;
		}
	}
}