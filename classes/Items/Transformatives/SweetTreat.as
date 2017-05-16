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
	
	public class SweetTreat extends ItemSlotClass
	{
		public function SweetTreat()
		{
			_latestVersion = 1;
			quantity = 1;
			stackSize = 5;
			type = GLOBAL.PILL;
			
			shortName = "SwtTreat";
			longName = "Sweet Treat";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a doughy, bite sized Sweet Treat";
			tooltip = "Wrapped up in delicate paper, the Sweet Treat oozes sugary goodness, the glazing slowly flowing but never quite managing to drip off its pastry home. Just looking at it makes your mouth water.\n\nA small text box lists it as a genital fluid transformation mod.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 600;
			
			version = _latestVersion;
		}
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			author("Ketra");
			kGAMECLASS.showName("SWEET\nTREAT");
			
			/*
			Sweet Treats is a simple TF which will change Steele’s cum into a sugary glaze/icing fluid. In texture it is similar to substances such as honey and syrup. The taste, unsurprisingly, will be sweet, but with a more plain flavor compared to honey for example. The cum does not cause diabetes/obesity/any other negative health effects because of space magic (real explanation is the cum isn't actually sugar, it's more akin to an artificial sweetener with an altered texture).
			*/
			
			// Vendor: Sera, until Candy Shop implementation
			
			var pc:Creature = target;
			
			if (target is PlayerCharacter)
			{
				output("Unwrapping the packaging, the Sweet Treat looks like any other sugary pastry: golden brown where the dough isn’t covered by the creamy white icing. You lift the morsel to your mouth and take a bite, the soft but crisp pastry delivering a surge of sweet, sticky fluid that flows across the area of your tongue.");
				output("\n\n");
				
				// Effects on consumption – Guaranteed:
				var choices:Array = [];
				var select:int = -1;
				
				// PC has cock and no vagina: Change male cum type to sugar
				if (target.hasCock() && target.cumType != GLOBAL.FLUID_TYPE_SUGAR) choices.push(1);
				// PC has a vagina and no cock: Change girlcum type to sugar
				if (target.hasVagina() && target.girlCumType != GLOBAL.FLUID_TYPE_SUGAR) choices.push(0);
				// PC has cock and vagina:
				// On first use - 50% chance of either of the preceding events occurring.
				// On second use - 100% chance of other event occurring.
				if (choices.length > 0) select = choices[rand(choices.length)];
				
				switch(select)
				{
					case 1:
						output("As you devour the treat, you feel a tingling sensation spreading swiftly through your abdomen");
						if (target.balls > 0) output(", encompassing your [pc.balls] before concentrating in");
						else output(" before continuing down towards");
						output(" your prostate, the Sweet Treat transforming its internal workings into reservoirs for your own personal sugary fluids. The sensation soon passes, your");
						if (target.balls == 1) output(" testicle");
						else if (target.balls > 0) output(" nuts");
						else output(" gland");
						output(" providing a sample of your new flavor from [pc.eachCock]. <b>You now have liquid sugar cum!</b>");
						
						target.cumType = GLOBAL.FLUID_TYPE_SUGAR;
						break;
					case 0:
						output("As you devour the treat, you feel a tingling sensation spreading swiftly through your abdomen before continuing down towards your pelvis, the Sweet Treat transforming the internal workings of your most feminine parts into reservoirs for your own personal sugary fluids. The sensation soon passes, [pc.eachVagina] providing a sample of your new flavor. <b>You now have liquid sugar girlcum!</b>");
						
						target.girlCumType = GLOBAL.FLUID_TYPE_SUGAR;
						break;
					default:
						output("Despite the decadent flavor and the bodily transformations promised on the packaging, you feel no different.");
						// PC has both cum types as sugar: No effect
						if(target.girlCumType == GLOBAL.FLUID_TYPE_SUGAR && target.cumType == GLOBAL.FLUID_TYPE_SUGAR) output(" <b>You already cum sugar!</b>");
						// PC has no vagina or cock: No effect
						else if(pc.isSexless()) output(" <b>You probably need some form of genitalia for the treat to have any effect!</b>");
						// No other effects
						else output(" This one must have been a dud!");
						break;
				}
				
				return false;
			}
			else
			{
				output(target.capitalA + target.short + " eats the Sweet Treat, but to no effect.");
			}
			return false;
		}
	}
}


