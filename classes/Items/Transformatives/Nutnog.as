//[DOES]
//Upon consumption with non eggnog cum:
//If has male genitalia change the fluid type to EGGNOG.


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
	
	public class Nutnog extends ItemSlotClass {
		//constructor
		public function Nutnog() {
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "Nutnog";
			longName = "pint of Nutnog";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pint of mod known as Nutnog";
			tooltip = "A small picture on the side of the glass, just below the name, shows a bull and a cow, both wearing the same attire: Santa hats and fuzzy Santa coats, neither of which do much to hide their bodies. With a mug in one hand and the bull’s cock in the other, the cow-girl seems to be milking his throbbing length for what looks like to be eggnog.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 3500;
			
			this.addFlag(GLOBAL.ITEM_FLAG_ALCOHOLIC);
			
			version = _latestVersion;
		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean {
			clearOutput();
			author("Altair Hayes");
			
			if (target is PlayerCharacter) {
				output("You pop off the cap and chug the dairy product, the cool, sweet liquid pouring past your tongue. As you chug the fluid, you fail to swallow all of it; a couple streams spill out of your mouth, down your chin, and over your [pc.chest]. Once the final drops of the mod spill down your throat, you start to feel a growing warmth grow in your body as the microsurgeons begin to do their work.");
				
				target.imbibeAlcohol(10);
				
				//check if target has cock and not yet eggnog cum
				if (target.hasCock() && target.cumType != GLOBAL.FLUID_TYPE_EGGNOG) {
					//try apply eggnog cum
					if (target.cumTypeUnlocked(GLOBAL.FLUID_TYPE_EGGNOG)) {
						target.cumType = GLOBAL.FLUID_TYPE_EGGNOG;
						output("\n\nBiting your tongue, you suppress a groan as your prostate swells and pulses from the mod. You try to resist, but your primal instinct overtakes your willpower. Your hands fly to your crotch and begin to pump your [pc.cocks]. As soon as your hands come in contact with your burning loins, you shudder from the sensitivity. Your breathing gets shallower, and the edge of your vision begins to darken. In a wave of pleasure, you let yourself collapse onto the floor with your rump up in the air, one hand stroking your [pc.biggestCock], your other in a fist, slamming the ground. Eventually the floodgates open, and your cock ejects ropes of [pc.cumColor] splendor until the floor beneath you is covered in your noggy cum.");
						output("\n\nWhen you come to your senses, the haze of your orgasm has faded to a pleasant glow, though you’re still breathing quite hard from the effort. The floor beneath you is coated in a thick sheen of your fragrant jizz. You sample the fragrant seed, intrigued by its jolly, holiday scent. <b>Your ejaculate tastes just like eggnog!</b>");
						kGAMECLASS.processTime(10);
						target.orgasm();
					} else output("\n\n" + target.cumTypeLockedMessage());
				//just a nice drink	
				} else {
					output("\n\nThe warmth lasts for a second before dissipating.");
					if(!target.hasCock()) output(" You should probably have a penis if you’re expecting anything else other than a tasty drink.");
					else if(target.cumType == GLOBAL.FLUID_TYPE_EGGNOG) output(" You already have eggnog flavored cum, so nothing else happens.");
				}
			//not the player	
			} else {
				kGAMECLASS.output(target.capitalA + target.short + " uses the Nutnog to no effect.");
			}
			return false;
		}
	}
}