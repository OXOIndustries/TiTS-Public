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
			type = GLOBAL.DRUG;
			
			shortName = "Nutnog";
			longName = "pint of Nutnog";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pint of an eggnog cum mod named Nutnog";
			tooltip = "A glass pint of what is labeled as ‘Nugnog’. A small picture under the name shows a bull and a cow, both wearing the same attire. A santa hat and a santa coat, neither of which are being covered very well. With a mug in one hand, and the bull's cock in the other, milking his throbbing length for what seems to be eggnog.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 3500;
			
			version = _latestVersion;
		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean {
			clearOutput();
			author("Altair Hayes");
			
			if (target is PlayerCharacter) {
				output("You pop off the cap and chug the dairy product, the cool, sweet liquid pouring past your tongue. As you chug the fluid, you fail to swallow all of it, a couple streams spill out of your mouth and down your chin and [pc.breasts]. Once the final drops of the mod spill down your throat, you start to feel a growing warmth grow in your body as the nanobots begin to do their work.");
				
				//check if target has cock and not yet eggnog cum
				if (target.hasCock() && target.cumType != GLOBAL.FLUID_TYPE_EGGNOG) {
					//try apply eggnog cum
					if (target.cumTypeUnlocked(GLOBAL.FLUID_TYPE_EGGNOG)) {
						target.cumType = GLOBAL.FLUID_TYPE_EGGNOG;
						output("\n\nBiting your tongue, you suppress a groan, as your prostate swells and pulses from the mod. You try to resist, but your primal instinct overtakes your willpower as your hands fly to your crotch and begin to pump your [pc.cocks]. As soon as your hands come in contact with your, [pc.cocks] you shudder from the sensitivity, your breathing gets shallower and the edge of your vision begins to darken. In a wave of pleasure, you let yourself collapse onto the floor, your rump up in the air, one hand stroking your [pc.biggestCock], your other in a fist, slamming the ground. Eventually the floodgates open, your cock ejecting ropes of [pc.cumColor] splendor until the floor beneath you is covered in your cum.");
						output("\n\nEventually, you come to your senses, the haze of your orgasm fading, leaving you panting and gasping for breath. The floor beneath you now coated in a thick sheen of your jizz, you sample your seed. <b>It tastes just like eggnog!</b>");
					} else output("\n\n" + target.cumTypeLockedMessage());
				//just a nice drink	
				} else {
					output("\n\nThe warmth lasts for a second, before dissipating.");
					if (target.cumType != GLOBAL.FLUID_TYPE_EGGNOG) output(" You already have eggnog flavored cum, so nothing else happens.");
					if(!target.hasCock()) output(" You should probably have a penis if you're expecting anything else other than a tasty drink.");
				}
				
			//not the player	
			} else {
				kGAMECLASS.output(target.capitalA + target.short + " uses the Nutnog to no effect.");
			}
			return false;
		}
	}
}