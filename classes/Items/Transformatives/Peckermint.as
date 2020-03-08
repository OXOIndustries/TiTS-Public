//[DOES]
//Upon Consumption with non peppermint candy cum:
//If has male genitalia change the fluid type to PEPPERMINT CANDY.
//Upon Consumption with peppermint candy cum:
//If has male genitalia change the color of all cocks to CANDY CANE.
//Effectively, you require 2 of them to get the full candy cane cock.

//[NOTE]
//Cock color will revert to default when cock type changes again. Could be
//changed but then you need an item just to get rid of it, which seems 
//like an overkill.

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
	
	public class Peckermint extends ItemSlotClass {
		//constructor
		public function Peckermint() {
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "Peckermint";
			longName = "peckermint candy cock";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a foot long candy cane shaped like a penis";
			tooltip = "Red and white stripes wrap around the head of this candy phallus, down to the shaft, and eventually swirl beneath the balls. A small tag tied to the head gives a small summary of the mod’s purpose: <i>“Looking to fill someone with the Yuletide spirit? Look no further! Take one Peckermint for hot, sticky, peppermint candy flavored cum. Take two for a candy cane colored cock!”</i>";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 1750;
			
			version = _latestVersion;
		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean {
			clearOutput();
			author("Altair Hayes");
			
			if (target is PlayerCharacter) {
				
				output("You slowly peel the thin plastic off of the candy cane colored cock. The peppermint pecker rests in your hand, a good 12 inches long. You slowly lift it to your [pc.lipsChaste], giving the head a nice long lick. A tickle of peppermint runs down your tongue. You grin to yourself before plunging the whole confectionary cock into your mouth.");
				output("\n\nEventually, your saliva breaks through the thin candy of the head, and a gooey, sticky, deep red liquid pools into your mouth. The sweet, pepperminty liquid runs down your throat as you slurp and suck on the cock-shaped candy. Eventually the last drops of the peppermint liquid stop flowing; you must have drank all of it already.");
				output("\n\nYou rapidly reduce it to a mere six inches of length, and then a one inch stub with a pair of balls connected to it soon after. You pop the rest of the candy into your mouth, sucking on the sticky, sweet sack as you ponder how this is going to feel. But to your surprise, the balls collapse like egg shells once you prod them with your tongue. As it turns out, they must have been filled with the same red fluid as the rest of the cock. You chuckle lightly. You sucked the candyman’s balls dry.");
				
				var i:int = 0;
				var candyCocks:Array = [];
				if (target.hasCock())
				{
					for(i = 0; i < target.cocks.length; i++)
					{
						if(target.cocks[i].cockColor != "red and white") candyCocks.push(i);
					}
				}
				
				//check if target has cock and not yet peppermint cum
				if (target.hasCock() && target.cumType != GLOBAL.FLUID_TYPE_PEPPERMINT) {
					//try apply peppermint cum
					if (target.cumTypeUnlocked(GLOBAL.FLUID_TYPE_PEPPERMINT)) {
						//set cum to peppermint
						target.cumType = GLOBAL.FLUID_TYPE_PEPPERMINT;
						output("\n\nNow that you’ve consumed the cock, you await a sign that something has occurred. But for a while, nothing happens. Needing some sort of confirmation, you take matters into your own hands.");
						output("\n\nYou grip [pc.biggestCock], slowly pumping at it, having it rise to full mast as you await the telltale sign that the mod worked. You begin masturbating, not out of pleasure, but out of obligation to make sure your money was not wasted on overpriced candy. Soon, your member is throbbing and pulsing, dribbling pre.");
						output("\n\nThe telltale feeling of pressure builds up in your groin, your cock dribbling more and more pre. But something catches your nose, the eager fluid is emitting a minty scent. Within a few moments, you blow your load, an aroma of mint filling the air around you.");
						output("\n\nSlowly your cock stops spraying your load, and you sample the seed still on your hand. <b>It tastes just like the goo from the Peckermint!</b> You gladly clean up, before heading out on your way, your [pc.balls] churning with yuletide spirit.");
						kGAMECLASS.processTime(15);
						target.orgasm();
					} else output("\n\n" + target.cumTypeLockedMessage());
				//if player has cock and peppermint cum == second dose
				} else if (target.hasCock() && target.cumType == GLOBAL.FLUID_TYPE_PEPPERMINT && candyCocks.length > 0){
					var c:int = candyCocks[rand(candyCocks.length)];
					
					output("\n\nAfter fully consuming the thick, long candy cock, you find yourself craving more. You start to pump your already growing [pc.cocks]. Your hands wrap around");
					if (target.cLength(c) >= target.biggestCockLength()) output(" your largest member");
					else output(" your shaft");
					output(" and begin to pump the familiar minty liquid out of your throbbing length.");
						
					output("\n\nA small trickle of your pre-cum drools out of your length and you");
					if(target.canAutoFellate(c)) output(" bend over, taking your [pc.cockHead " + c + "] into your willing mouth, your tongue flicking against your cum slit, lapping up your peppermint spunk");
					else output(" run your finger down the head, collecting the thin drop of peppermint cum off your cock, and into your mouth");
					output(".");
						
					output("\n\nYou begin you pump your cock faster and faster, closing your eyes in pleasure as you bring yourself closer to orgasm with each pump of your hands.");
					output("\n\nPrior to orgasm, you");
					if(target.canAutoFellate(c)) output(" take your cock out of your mouth and watch it");
					else output(" watch your cock");
					output(" throb and pulse in anticipation of your load. As soon as the first rope of cum flies out of the tip, its head starts to change color, going from [pc.cockColor " + c + "] to a mixture of red and white, swirling around your length. With each rope of cum released from your length, another chunk of your cock turns to a candy cane color.");
						
					output("\n\nSoon, your [pc.cock " + c + "] is dribbling the last of its load, and <b>its length is fully striped red and white from head to");
					if (target.hasSheath(c)) output(" sheath");
					else output(" base");
					if (target.cocks.length > 1) output(", along with " + (target.cocks.length == 2 ? "your other cock" : "the rest of your cocks"));
					output("</b>.");
					
					//color those cocks - will return to normal upon cock type change, as color
					//will be over written in that case
					for (i = 0; i < target.cocks.length; i++) {
						target.cocks[i].cockColor = "red and white";
					}
					
					output(" You happily clean yourself up and get on your way, your [pc.cocks] full of Yuletide spirit.");
					
					kGAMECLASS.processTime(8);
					target.orgasm();
				}
				
				target.changeEnergy(5);
				
			//not the player	
			} else {
				kGAMECLASS.output(target.capitalA + target.short + " uses the candy to no effect.");
			}
			return false;
		}
	}
}