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
			type = GLOBAL.PILL;
			
			shortName = "SwtSweat";
			longName = "Sweet Sweat";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a jar of Sweet Sweat";
			
			tooltip = "This jar of ointment is clearly labeled as ‘Sweet Sweat,’ flanked with an illustration of a muscular bull flexing, much to the delight of less endowed bulls and doe-eyed cows. The back of the jar states that the ointment within will add additional pheromones to your sweat.\n\n<b>A warning on the back says that the effects are permanent.</b>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 10000;
			
			version = _latestVersion;
		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean {
			clearOutput();
			author("Altair Hayes");
			
			if (target is PlayerCharacter) {
				output("You take the ointment and slather it all over your");
				if (target.tone > 75) 
				{
					if(target.thickness > 60) output(" musclebound");
					else output(" well-defined");
				}
				output(" body, getting it in every nook and cranny, fantasizing about the musk you’ll be emitting.");
				//Anal sloots only
				if(target.hasPlumpAsshole() || target.ass.looseness() >= 3 || target.ass.wetness() >= 1)
				{
					output(" Your hands slide into your [pc.ass], spreading your cheeks apart as you slather some of the ointment onto your [pc.asshole] and slipping a finger inside, just to make sure you apply it where it’s needed.");
				}
				else output(" Your hands slide down to your [pc.ass], kneading globs of the ointment into your cheeks, making sure that those behind will enjoy your passing as much as those ahead.");
				output(" After finishing up down there, you scoop out another handful of the cream and give your [pc.fullChest] your full attention.");
				output("\n\nAs you apply the thick creamy ointment on your chest, you can’t help but rub your [pc.nipples] and feel up your [pc.chest]. The more you slather onto yourself, the more aroused you become. If this cream doesn’t work, at least it’s a good excuse to masturbate. Your eyes roll back a bit, and you involuntarily bite your bottom lip as you apply the cream to your crotch, the thick coldness almost melting onto your [pc.crotch]. It feels almost as if you were");
				if(target.hasCock()) output(" balls deep in a cunt");
				if(!target.hasCock()) {
					output(" given a massage by a very busty");
					if(target.isTreated()) output(" cow");
					else output(" woman");
				}
				output(".");
				
				output("\n\nThe now empty jar of cream says that the effects should occur next time you sweat, so you wrap up and head for the nearest shower, eager to indulge in your thicker musk.");
				
				if(!target.hasPerk("Pheromone Sweat"))
				{
					output("\n\n(<b>Perk Gained: Pheromone Sweat</b> - Pheromones boost tease attack and arousal while sweating.)");
					target.createPerk("Pheromone Sweat", 0, 0, 0, 0, "Slightly boosts tease attack and arousal while sweating.");
				}
				else output("\n\nBesides an arousal boost, not much happens afterwards--it seems you’ve got what this item has to offer already!");
				
				target.changeLust(30);
			//not the player	
			} else {
				kGAMECLASS.output(target.capitalA + target.short + " uses the ointment to no effect.");
			}
			return false;
		}
	}
}