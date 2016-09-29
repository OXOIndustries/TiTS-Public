//[ALWAYS DOES]
//Simple transformation, giving the PC a Pheromone Sweat perk; if the player has 
//the Sweat status effect makes the Pc radiate lust damage in battle, only 50% as effective 
//as pheromone cloud though, and stacks with pheromone cloud as well.

package classes.Items.Transformatives {
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	
	public class SweetSweat extends ItemSlotClass {
		//constructor
		public function SweetSweat() {
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.DRUG;
			
			shortName = "SwtSweat";
			longName = "Sweet Sweat";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a jar of Sweet Sweat";
			
			tooltip = " A jar of ointment labeled ‘Sweet Sweat’ with an illustration of a muscular treated bull flexing as multiple less muscular bulls fawn and swoon at his feet. The back of the jar states that the ointment within will add additional pheromones to your sweat.\n\n<b>A warning on the back says that the effects are permanent.</b>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 3500;
			
			version = _latestVersion;
		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean {
			clearOutput();
			author("Altair Hayes");
			
			if (target is PlayerCharacter) {
				output("You take the ointment and slather it all over your");
				if (target.tone > 75) output(" musclebound");
				output(" body, getting it in every nook and cranny, fantasizing about the musk you'll be emitting. Your hands slide into your [pc.ass], spreading your cheeks apart as you slather some of the ointment onto your [pc.asshole] slipping a finger into it, just to make sure you apply it where it's needed. After finishing up down there, you scoop out another handful of the cream and give your [pc.fullChest] your full attention.");
				output("\n\nAs you apply the thick creamy ointment on your chest you can't help but rub your nipples and feel up your [pc.chest] The more you slather yourself the more aroused you become, if this cream doesn't work at least it's a good excuse to masturbate. Your eyes roll back a bit and involuntarily bite your bottom lip as you apply the cream to your crotch, the cold thick cream almost melting onto your [pc.crotch], feeling as if you were");
				if(target.hasCock()) output(" balls deep in a cunt");
				if(!target.hasCock()) {
					output(" given a massage by a very busty");
					if(target.isTreated()) output(" cow");
					else output(" woman");
				}
				output(".");
				
				output("\n\nFor a moment you consider using the rest as lube, but that would have to wait for now. The now empty jar of cream says that the effects should occur next time you sweat, so you wrap up and head for the nearest shower, eager to indulge in your thicker musk.");
				
				target.lust(30);
				target.createPerk("Pheromone Sweat", 0, 0, 0, 0, "Slightly boosts tease attack and arousal.");
				
			//not the player	
			} else {
				kGAMECLASS.output(target.capitalA + target.short + " uses the ointment to no effect.");
			}
			return false;
		}
	}
}