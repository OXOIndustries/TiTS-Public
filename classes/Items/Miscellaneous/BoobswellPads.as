package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class BoobswellPads extends ItemSlotClass
	{
		
		//constructor
		public function BoobswellPads()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 50;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "Boobswell P.";
			
			//Regular name
			this.longName = "boobswell pads";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a set of boobswell pads";

			//Displayed on tooltips during mouseovers
			this.tooltip = "These slim, cup-shaped pads come with a handy adhesive that allows them to stick to the underside of the bust, or else be slipped stealthily into a bra. So long as these pads are worn, they will slowly massage and feed hormones and nanomachines into your breasts, causing them to increase in size over time. They only last a week, however, before they wear out.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 200;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var x:int = 0;
			var y:Number = 0;
			var choices:Array = new Array();
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//First use
				kGAMECLASS.author("Savin");
				if(target.hasStatusEffect("Boobswell Pads"))
				{
					if(target.bRows() == 1) 
					{
						kGAMECLASS.output("You're already wearing the pads. You'll have to remove them before you put on another set.");
						if(!kGAMECLASS.debug) quantity++;
						return false
					}
					else
					{
						kGAMECLASS.output("You can only wear one set of pads at a time.");
						if(!kGAMECLASS.debug) quantity++;
						return false
					}
				}
				else if(target.bRows() == 1)
				{
					useBoobPads();
				}
				else
				{
					kGAMECLASS.output("You have more than one row of breasts. Which one will get the boobswell pads?\n");
					kGAMECLASS.clearMenu();
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
						//If it's already covered, disabled button
						if(swelledRows.lastIndexOf(x) >= 0) 
						{
							kGAMECLASS.addDisabledButton(x,kGAMECLASS.num2Text(x+1),kGAMECLASS.num2Text(x+1),"This row is already using boobswell pads.");
							kGAMECLASS.output("\n" + (x+1) + ": [pc.breastCupSize " + x + "] - <b>ALREADY COVERED.</b>");
						}
						else 
						{
							kGAMECLASS.addButton(x,kGAMECLASS.num2Text(x+1),multiBoobPadRouter,x,kGAMECLASS.num2Text(x+1),"Place the pads on this row.");
							kGAMECLASS.output("\n" + (x+1) + ": [pc.breastCupSize " + x + "]");
						}
					}
					return true;
				}
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " uses the pads, but nothing happens.");
			}
			return false;
		}
		protected function multiBoobPadRouter(arg:int = 0):void
		{
			kGAMECLASS.clearOutput();
			useBoobPads(arg);
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		protected function useBoobPads(arg:int = 0):void
		{
			var pc:Creature = kGAMECLASS.chars["PC"];
			//Use, PC has tits and wearing clothes
			if(pc.isChestGarbed() && pc.biggestTitSize() >= 1)
			{
				kGAMECLASS.output("You pull the set of sticky, form-adhering pads out of their packaging");
				if(pc.armor.shortName != "") kGAMECLASS.output(" and wiggle out of your [pc.armor]");
				kGAMECLASS.output(". You quickly slip the pads into your [pc.upperUndergarment], spending a moment adjusting them so they hug the undersides of your breasts just right. As you’re working, the pads begin gently vibrating, and quickly become ever so slightly moist as the cocktail of hormones and nanomachines leaks out of the pad and into your [pc.skinFurScales]. ");
			}
			//Use, PC has tits but isn’t wearing a top
			else if(pc.biggestTitSize() >= 1)
			{
				kGAMECLASS.output("You pull the set of sticky, form-adhering pads out of their packaging and peel off the adhesive layer underneath them before slapping them onto the undersides of your [pc.breasts " + arg + "]. Once they’re secured, the pads begin gently vibrating, and quickly become ever so slightly moist as the cocktail of hormones and nanomachines leaks out of the pad and into your [pc.skinFurScales], making you go flush with sudden arousal.");
			}
			//Use, PC doesn’t have extant tits
			else
			{
				kGAMECLASS.output("You pull the set of sticky, form-adhering pads out of their packaging and peel off the adhesive layer underneath them. A bit nervously, you slip the pads ");
				if(pc.isChestGarbed()) kGAMECLASS.output("under your [pc.upperGarments] and ");
				kGAMECLASS.output("onto your flat chest. You give a little gasp as the cold adhesive adheres to you, and again as the pads turn suddenly slightly... wet. As if they’re leaking something onto your skin, and makes you go flush with a combination of sudden arousal and chill.");
			}
			pc.lust(5);
			pc.createStatusEffect("Boobswell Pads",arg,0,0,0, false, "LustUp", "The applied boobswell pads are slowly but steadily working to fill out your chest. You can remove them at any point via the \"Remove Swell\" command in the \"Masturbation\" menu, but the pads will still be consumed. They're one use only.", false, 4320);
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
	}
}
