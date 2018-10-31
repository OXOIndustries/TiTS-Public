package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.VaginaClass;
	
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.num2Ordinal;
	import classes.Engine.Utility.formatFloat;
	
	public class EasyFit extends ItemSlotClass
	{
		
		//constructor
		public function EasyFit()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "EasyFit";
			
			//Regular name
			this.longName = "jar of Easy Fit cream";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a jar of Easy Fit cream";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Designed as an alternative for human-sized races entering into relationships with much larger alien species such as leithans and heavy modified humanoids, such as New Texans. This jar of cream will apply a permanent elasticizing effect to an orifice, and will promote increased wetness when aroused. Can be used anally or vaginally.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 30;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				
				if (target.hasVagina())
				{
					// show menu
					output("Where would you like to apply the cream?");
					
					clearMenu();
					
					for (var i:int = 0; i < target.vaginas.length; i++)
					{
						if (target.vaginas.length > 1)
						{
							output("\n\n" + StringUtil.capitalize(num2Ordinal(i + 1)) + " vagina - ");
							addButton(i, String("Vagina " + (i + 1)), ItemTargetChoice, [target, i]);
						}
						else
						{
							output("\n\nVagina:");
							addButton(i, "Vagina", ItemTargetChoice, [target, i]);
						}
						
						output("\nLooseness: " + formatFloat((target.vaginas[i] as VaginaClass).loosenessRaw, 3));
						output("\nBonus Capacity: " + formatFloat((target.vaginas[i] as VaginaClass).bonusCapacity, 3));
						output("\nWetness: " + formatFloat((target.vaginas[i] as VaginaClass).wetnessRaw, 3));
					}
					
					if (target.vaginas.length > 0)
					{
						output("\n\nButthole:");
						output("\nLooseness: " + formatFloat(target.ass.loosenessRaw, 3));
						output("\nBonus Capacity: " + formatFloat(target.ass.bonusCapacity, 3));
						output("\nWetness: " + formatFloat(target.ass.wetnessRaw, 3));
					}
					
					addButton((i+1), "Butthole", ItemTargetChoice, [target, 3]);
					
					return true;
				}
				else
				{
					ItemTargetChoice([target, 3]);
					return false;
				}
				
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " applies the cream but to no effect!");
			}
			return false;
		}
		
		public static function ItemTargetChoice(args:Array):void
		{
			var target:Creature = args[0];
			var holeIdx:int = args[1];
			
			clearOutput();
			
			// idx 3 == butt
			var targetHole:VaginaClass;
			
			if (holeIdx != 3) targetHole = target.vaginas[holeIdx];
			else targetHole = target.ass;
			
			output("You pop the top off of your jar of Easy Fit");
			if (!target.isNude()) output(" and wiggle out of your [pc.gear], getting access to your orifice of choice");
			output(". You smear the thick, wet cream onto your hand, rubbing it into your [pc.skinFurScales] before angling it down towards");
			if (holeIdx != 3 && target.vaginas.length > 1) output(" one of");
			output(" your");
			if (holeIdx != 3)
			{
				output(" cunt");
				if (target.vaginas.length > 1) output("s");
			}
			else output(" asshole");
			output(". You reach down and awkwardly start to massage the white cream into your hole. You slip a couple of fingers into it, shuddering with the cold wetness as you smear the thick cream across the insides of your");
			if (holeIdx != 3) output(" pussy");
			else output(" butt");
			output(".");

			output("\n\nA hint of arousal starts to burn under your skin as you finger yourself, and your body starts to change ever so slightly to accommodate bigger and thicker insertions. By the time you’re done, you feel considerably more... open... than before. Your");
			if (holeIdx != 3) output(" [pc.cunt " + holeIdx + "]");
			else output(" [pc.asshole]");
			output(" is positively agape now, open and inviting for the next time you get your hands on a big, thick cock.");
			
			if (targetHole.wetnessRaw < 2) targetHole.wetnessRaw += 1;
			else if (targetHole.wetnessRaw < 4) targetHole.wetnessRaw += 0.25;
			
			if (targetHole.loosenessRaw < 2) targetHole.loosenessRaw += 1;
			else if (targetHole.loosenessRaw < 3) targetHole.loosenessRaw += 0.2;
			
			if (targetHole.bonusCapacity < 500) targetHole.bonusCapacity += 40;
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.mainGameMenu);
		}
	}
}
