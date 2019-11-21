package classes.Items.Recovery
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.addButton;
	import classes.Engine.Interfaces.clearMenu;
	import classes.Engine.Interfaces.clearOutput;
	import classes.Engine.Interfaces.mainGameMenu;
	
	public class DoctorsBag extends ItemSlotClass
	{
		//constructor
		public function DoctorsBag()
		{
			this._latestVersion = 1;

			this.quantity = 2;
			this.stackSize = 2;
			this.type = GLOBAL.PILL;

			//Used on inventory buttons
			this.shortName = "DctrBag";

			//Regular name
			this.longName = "Doctor's Bag";

			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));

			//Longass shit, not sure what used for yet.
			this.description = "a bag filled with medical supplies";

			//Displayed on tooltips during mouseovers
			this.tooltip = "This briefcase-sized black leather bag is magnetically locked by two clasps at the top. Chief among its contents are a variety of fast-acting supplements that increase the user’s metabolism and their natural regeneration. Loaded next to those are bandages, rolls of gauze, medipens packed with painkilling injections, and a can of silvery medigel. This is a common assortment to be found on anyone training to be a nurse, or in someone’s medicine cabinet if they’re expecting more than the common cold.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);

			this.attackVerb = "";

			//Information
			this.basePrice = 600;
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);

			this.version = _latestVersion;
		}

		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearMenu();
			clearOutput();
			author("William");
			if (!(target is PlayerCharacter))
			{
				output("This item should not be used on NPCs.");
				return false;
			}
			if (!kGAMECLASS.canRest())
			{
				output("This place is too dangerous for you to kick back and rest, let alone wait for some fancy meds to kick in.");
				if (kGAMECLASS.silly) output(" Fly away, nerd!");
				return false;
			}
			// Text When PC Uses it
			// pc At 100% HP
			if (target.HPQ() >= 100)
			{
				output("It’d be a bit silly to use medicine when you’re perfectly fine.");
				return false;
			}

			// pc At 0% - 49% HP
			if (target.HPQ() < 50)
			{
				output("You just about collapse under the weight of your sustained injuries,");
				if (target.hasArmor()) output(" carefully peeling off your [pc.armor], and inspect");
				else output(" inspecting");
				output(" yourself for wounds and bruises after setting out the bag’s contents.");
				output("\n\nWasting no time, you inject yourself with two painkillers and gulp down the provided pills, then turn your attention to two sucking wounds on your chest and abdomen. Thanks to the painkillers, you barely wince when you spray half the can of medigel on both wounds and soak up the blood with the supplied gauze. After discarding three squares of the fabric, you get them cleaned up enough to bandage.");
				output("\n\nYou turn your attention to the less painful cuts and scrapes, then spritz what’s left of the regelatin on them before using the last of the gauze to wipe it away. With your [pc.skinFurScalesNoun] healing and your body’s regeneration beating double time, you regard your bruises with some annoyance.");
				output("\n\nYou’re going to have to rest for your body to work its magic. The question then becomes: for how long can you wait?");
			}
			// pc At 50% - 99% HP
			else
			{
				output("You sit your weary self down and pop open the doctor’s bag you’ve been carrying around for just this occasion. You empty the contents in front of you and organize them into the order you will use them. First, a small bottle containing six colorful pills, some marked and some not. You take them all at once, and with a swig of water from your canteen they go down easily.");
				output("\n\nYou then");
				if (target.hasArmor()) output(" remove your [pc.armor] next and");
				output(" inspect yourself for any injuries. Fortunately you’re not in terribly bad shape. You’ve only got a few injuries worth griping over. The rest are superficial. You take one of the medipens and press it to your neck, not even feeling its payload penetrate your [pc.skinFurScalesNoun]. Discarding the tool, you reach for the gauze and regelatin, spraying your deeper wounds before wiping the blood away. You then use up the last of the gel spray on your smaller cuts, making very methodical applications.");
				output("\n\nWithin seconds, your wounds begin to close and you feel a deep urge to rest. While you’re feeling better already, the effects won’t truly manifest unless you give it time to work.");
			}

			addButton(0, "1 Hours", healAndRest, {pc:target, hoursRested:1});
			addButton(1, "2 Hours", healAndRest, {pc:target, hoursRested:2});
			addButton(2, "3 Hours", healAndRest, {pc:target, hoursRested:3});
			addButton(3, "4 Hours", healAndRest, {pc:target, hoursRested:4});
			addButton(14, "Nevermind", kGAMECLASS.generalInventoryMenu);
			return true;
		}

		public function healAndRest(args:Object):void
		{
			args.pc.destroyItemByClass(DoctorsBag);
			args.pc.createStatusEffect("Using Doctor's Bag", args.hoursRested);
			if (args.hoursRested >= 4) kGAMECLASS.rest();
			else kGAMECLASS.wait(args.hoursRested*60);
		}
	}
}
