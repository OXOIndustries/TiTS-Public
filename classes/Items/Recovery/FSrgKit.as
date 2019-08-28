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
	import classes.Engine.Interfaces.clearOutput;
	import classes.Engine.Combat.inCombat;
	import classes.UIComponents.UIStyleSettings;
	
	public class FSrgKit extends ItemSlotClass
	{
		//constructor
		public function FSrgKit()
		{
			this._latestVersion = 1;
			
			this.quantity = 3;
			this.stackSize = 3;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "FldSrgKit";
			
			//Regular name
			this.longName = "Field Surgeon's Kit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a kit of medical spray";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This handy kit comes pre-packaged with three cans of regelatin spray. Once applied to a wound, the gel is absorbed straight away and reconstitutes the damaged tissue by melding into the patient’s body. Flesh knitting rapidly is not a painless process without unwanted secondary effects, which is why it’s best used on light injuries and not gaping wounds.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 300;

			this.combatUsable = true;
			this.targetsSelf = true;

			this.version = _latestVersion;
		}

		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			//Stolen from HealingPoultice.as
			if (target.hasStatusEffect("Healed"))
			{
				if(!kGAMECLASS.infiniteItems()) quantity++;
				if (target == kGAMECLASS.pc)
				{
					kGAMECLASS.clearOutput();
					kGAMECLASS.output("Using supplements to heal yourself will only work once per fight. No body can handle the metabolic strain of downing multiple regenerative items in such quick succession.");
				}
				else
				{
					if(inCombat()) kGAMECLASS.output("\n\n");
					else kGAMECLASS.clearOutput();
					kGAMECLASS.output(target.capitalA + target.short + " has already healed during this fight! Doing so again would be more than ill-advised!");
				}
				return false;
			}
			clearOutput();
			if (quantity == 3) output("You pop free one of the magnetically sealed tubes in your surgeon’s kit and spray every last drop of it on " + (target is PlayerCharacter ? "your wounds, already feeling the sting of working medicine." : target.getCombatName() + "’s wounds.") + " You hope it works fast.");
			else if (quantity == 2) output("You pull out the second of the metallic cans sealed in your kit and apply every last bit of silvery healing goo to " + (target is PlayerCharacter ? "your wounds. You already feel the needles and pins of treatment, n" : target.getCombatName() + "’s wounds. N") + "ow all you can do is hope it makes a difference.");
			else output("You toss your surgeon’s kit away after pulling out the last featureless chrome can. You methodically apply the contents to all of " + (target is PlayerCharacter ? "your wounds and sigh hard at the cool touch and discomfort that follows. You feel better, but i" : target.getCombatName() + "’s wounds. I") + "t will take a while longer for it to work.");

			var healing:int;
			if (inCombat())
			{
				healing = 10;
				target.createStatusEffect("Healed", 0, 0, 0, 0, true, "", "", true, 0);
				target.createStatusEffect("Healing Spray",0,0,0,0,false,"Icon_Drug_Pill_Heal","The healing spray is knitting your wounds!",true,0,UIStyleSettings.gHPColour);
			}
			else healing = 55;

			healing = Math.min(target.HPMax() - target.HP(), healing);
			if (healing > 0)
			{
				target.HP(healing);
				output(" (<b>H: +<span class='hp'>" + healing + "</span></b>)");
			}
			return false;
		}
	}
}
