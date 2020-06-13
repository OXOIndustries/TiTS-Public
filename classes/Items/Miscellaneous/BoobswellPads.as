package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StorageClass;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.Engine.Utility.num2Ordinal;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.rand;
	import classes.BreastRowClass;
	
	public class BoobswellPads extends ItemSlotClass
	{
		public function BoobswellPads()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 50;
			type = GLOBAL.PILL;
			
			shortName = "Boobswell P.";
			longName = "Boobswell pads";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a set of Boobswell pads";

			tooltip = "These slim, cup-shaped pads come with a handy adhesive that allows them to stick to the underside of the bust, or else be slipped stealthily into a bra. So long as these pads are worn, they will slowly massage and feed hormones and nanomachines into your breasts, causing them to increase in size over time. They only last 3 days, however, before they wear out.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 200;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			
			var x:int = 0;
			
			if(target is PlayerCharacter)
			{
				//First use
				author("Savin");
				if(target.hasStatusEffect("Boobswell Pads"))
				{
					if(target.bRows() == 1) 
					{
						output("You’re already wearing the pads. You’ll have to remove them before you put on another set.");
						if(!kGAMECLASS.infiniteItems()) quantity++;
						return false
					}
					else
					{
						output("You can only wear one set of pads at a time.");
						if(!kGAMECLASS.infiniteItems()) quantity++;
						return false
					}
				}
				else if(target.bRows() == 1)
				{
					useBoobPads();
				}
				else
				{
					output("You have more than one row of breasts. Which one will get the Boobswell pads?\n");
					output("\n<b><u>Breast Rows</u></b>");
					clearMenu();
					var swelledRows:Array = new Array();
					//Loop through statuses and find out which boobs are covered.
					for(x = 0; x < target.statusEffects.length; x++)
					{
						//Boobswell on!
						if(target.statusEffects[x].storageName == "Boobswell Pads")
						{
							//Add to the list of covered rows.
							swelledRows.push(target.statusEffects[x].value1);
						}
					}
					for(x = 0; x < target.bRows(); x++)
					{
						output("\n<b>* " + StringUtil.toDisplayCase(num2Ordinal(x+1)) + " Breast Row:</b> [pc.breastCupSize " + x + "]");
						//If it's already covered, disabled button
						if(swelledRows.lastIndexOf(x) >= 0) 
						{
							output(" - <b>ALREADY COVERED.</b>");
							addDisabledButton(x, num2Text(x+1), num2Text(x+1), "This row is already using Boobswell pads.");
						}
						else 
						{
							addButton(x, StringUtil.toDisplayCase(num2Ordinal(x+1)), multiBoobPadRouter, x, StringUtil.toDisplayCase(num2Ordinal(x+1) + " Breast Row"), "Place the pads on your " + num2Ordinal(x+1) + " row.");
						}
					}
					return true;
				}
			}
			else
			{
				output(target.capitalA + target.short + " uses the pads, but nothing happens.");
			}
			return false;
		}
		protected function multiBoobPadRouter(arg:int = 0):void
		{
			clearOutput();
			useBoobPads(arg);
			clearMenu();
			addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		protected function useBoobPads(arg:int = 0):void
		{
			var pc:Creature = kGAMECLASS.chars["PC"];
			//Use, PC has tits and wearing clothes
			if(pc.isChestGarbed() && pc.biggestTitSize() >= 1)
			{
				output("You pull the set of sticky, form-adhering pads out of their packaging");
				if(pc.armor.shortName != "") output(" and wiggle out of your [pc.armor]");
				output(". You quickly slip the pads into " + (pc.upperUndergarment.shortName != "" ? "place" : "your [pc.upperUndergarment]") + ", spending a moment adjusting them so they hug the undersides of your breasts just right. As you’re working, the pads begin gently vibrating, and quickly become ever so slightly moist as the cocktail of hormones and nanomachines leaks out of the pad and into your [pc.skinFurScales]. ");
			}
			//Use, PC has tits but isn’t wearing a top
			else if(pc.biggestTitSize() >= 1)
			{
				output("You pull the set of sticky, form-adhering pads out of their packaging and peel off the adhesive layer underneath them before slapping them onto the undersides of your [pc.breasts " + arg + "]. Once they’re secured, the pads begin gently vibrating, and quickly become ever so slightly moist as the cocktail of hormones and nanomachines leaks out of the pad and into your [pc.skinFurScales], making you go flush with sudden arousal.");
			}
			//Use, PC doesn’t have extant tits
			else
			{
				output("You pull the set of sticky, form-adhering pads out of their packaging and peel off the adhesive layer underneath them. A bit nervously, you slip the pads ");
				if(pc.isChestGarbed()) output("under your [pc.upperGarments] and ");
				output("onto your flat chest. You give a little gasp as the cold adhesive adheres to you, and again as the pads turn suddenly slightly... wet. As if they’re leaking something onto your skin, and makes you go flush with a combination of sudden arousal and chill.");
			}
			pc.changeLust(5);
			pc.createStatusEffect("Boobswell Pads",arg,0,0,0, false, "LustUp", "The applied Boobswell pads are slowly but steadily working to fill out your chest. You can remove them at any point via the “Remove Boobswell Pads” command in the “Masturbation” menu, but the pads will still be consumed. They’re one use only.", false, 4320,0xB793C4);
		}
		public static function updateEffect(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
		{
			// Failsafe!
			if (effect.value1 > (target.breastRows.length - 1))
			{
				if(target is PlayerCharacter) AddLogEvent("The Boobswell pads you had been wearing on your " + num2Ordinal(effect.value1 + 1) + " row of breasts disintegrate as the row is non-existent. <b>You’re no longer under the effects of the Boobswell Pads!</b>", "words", deltaT);
				target.removeStatusEffect("Boobswell Pads");
				return;
			}
			
			var targetRow:BreastRowClass = target.breastRows[effect.value1] as BreastRowClass;
			var originalRating:Number = Math.floor(targetRow.breastRating());
			
			target.lust(deltaT / 10);
			
			// Properly account for the fact that the pads could time out during this update tick
			targetRow.breastRatingRaw += (Math.min(effect.minutesLeft, deltaT) * 0.003); 
			
			var newRating:Number = Math.floor(targetRow.breastRating());
			
			if (doOut && (target is PlayerCharacter) && (newRating > originalRating && (newRating % 2 == 0 || newRating < 6)))
			{
				AddLogEvent("Thanks to the Boobswell pads you’re wearing, your chest is slowly but steadily filling out! <b>You figure that " + (target.bRows() == 1 ? "you " : "your "+ num2Ordinal(effect.value1 + 1) + " row of breasts ") + " could now fit into " + indefiniteArticle(target.breastCup(effect.value1, targetRow.breastRating())) + " bra!</b>", "passive", deltaT);
			}
		}
	}
}
