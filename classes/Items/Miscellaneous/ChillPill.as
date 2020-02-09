package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.GameData.CodexManager;
	import classes.Engine.Interfaces.*;

	public class ChillPill extends ItemSlotClass
	{
		public function ChillPill()
		{
			_latestVersion = 1;
			quantity = 1;
			stackSize = 5;
			type = GLOBAL.PILL;
			
			shortName = "ChillPill";
			longName = "Chill Pill";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a box containing a single “Chill Pill”";
			
			tooltip = "This box contains a single dose of “Chill Pill”, a beige tablet designed to reduce libido. The packaging is poor quality - done in an eye-searing green, and decorated with seemingly irrelevant clipart.\n\n<b>Disclaimer:</b> This item is ineffective for individuals suffering high levels of genetic taint. <i>You could probably check your Codex to see if that applies to you.</i>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 2000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			/************************************
			* Effects:
			* - Reduce lust by 15
			* - Remove all heat/rut-like statuses (includes fuck fever)
			* - Reduce libido based on Steele's current libido (chart below)
			*   - >=71  : -15
			*   - 41-70 : -10
			*   - 21-40 : -5
			*   - 11-20 : -3
			*   - 4-10  : -1
			*   - <=3   : No change
			************************************/
			
			kGAMECLASS.clearOutput();
			author("toritoritori");
			
			if (target is PlayerCharacter)
			{
				// Just to make sure it got unlocked
				CodexManager.unlockEntry("Chill Pill");
				
				var pc:Creature = target;
				var l:int = pc.libidoRaw;
				
				output("The beige pill is an awkward size to swallow, and for a moment it almost feels like it’s gotten stuck in your throat. You find yourself wishing desperately for a drink of water, but before you can finish the thought, the pill has already dissolved, leaving behind only a bitter aftertaste.");
				
				// Reduce lust
				var lust:Number = pc.lust();
				pc.changeLust(-15);
				if(lust > pc.lust()) output("\n\nYou take a deep breath and realize that you feel a lot calmer. If nothing else, this pill has certainly made you less aroused.");
				
				var inHeat:Boolean = pc.inHeat();
				var inRut:Boolean = pc.inRut();
				var inAnalHeat:Boolean = pc.inAnalHeat();
				
				// Remove heat/rut/fuck fever
				if (inHeat || inRut || inAnalHeat) {
					output("\n\nThe inescapable warmth in");
					// IF the player has all three status effects, use commas instead of "and"
					if (inRut && inHeat && inAnalHeat) {
						output(" your [pc.cocksLight], [pc.vaginasLight], and asshole");
					} else {
						if (inRut) output(" your [pc.cocksLight]");
						// IF player is in rut AND in heat
						if (inRut && inHeat) output(inAnalHeat ? "," : " and");
						if (inHeat) output(" your [pc.vaginasLight]");
						// IF player is EITHER in rut OR in heat AND has "Fuck Fever"
						if ((inRut || inHeat) && inAnalHeat) output(" and");
						if (inAnalHeat) output(" your [pc.asshole]");
					}
					output(" also vanishes, and you no longer feel the overpowering need to");
					if (inRut) output(" breed");
					// IF player is in rut AND has is EITHER in heat OR has "Fuck Fever"
					if (inRut && (inHeat || inAnalHeat)) output(" and to");
					if (inHeat || inAnalHeat) output(" be bred");
					output(". ");
					output("Your");
					if (inRut) output(" rut");
					// IF player is in rut AND has is EITHER in heat OR has "Fuck Fever"
					if (inRut && (inHeat || inAnalHeat)) output(" and");
					if (inHeat || inAnalHeat) output(" heat");
					output(" has ended.");
					
					if (inRut) pc.clearRut();
					if (inHeat) pc.clearHeat();
					if (inAnalHeat) pc.clearAnalHeat();
				}
				
				var libidoReduced:Boolean = false;
				// Reduce libido
				if (l > 3) {
					var nMinus:Number = 0;
					if (l >= 71) nMinus = 15;
					else if (l >= 41) nMinus = 10;
					else if (l >= 21) nMinus = 5;
					else if (l >= 11) nMinus = 3;
					else if (l >= 4) nMinus = 1;
					
					if((pc.libidoRaw - nMinus) < pc.libidoMin()) nMinus = pc.libidoRaw - pc.libidoMin();
					
					if(nMinus > 0)
					{
						output("\n\nIn fact, now that you think about it, there’s a sense of permanence in the reduction of your lust. You know the arousal will come back eventually, but you have a hunch that it’ll take longer than it used to. <b>Your libido has dropped.</b>");
						pc.libido(-1 * nMinus);
						libidoReduced = true;
					}
				}
				
				if(!libidoReduced) {
					output("\n\nNothing else happens. You wait a couple more minutes to be sure, but the drug continues to have absolutely no effect. If you had to guess, you’d say that this medication just can’t bring your libido any lower than it already is.");
				}
			}
			else
			{
				output(target.short + " consumes the pill to no effect.");
			}
			return false;
		}
	}
}