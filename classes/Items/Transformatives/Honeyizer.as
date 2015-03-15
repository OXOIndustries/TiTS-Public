package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.Items.Miscellaneous.Honeydew;
	import classes.StringUtil;
	
	public class Honeyizer extends ItemSlotClass
	{
		
		//constructor
		public function Honeyizer()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "H-izer";
			//Regular name
			this.longName = "jar of honeyizer";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a jar of honeyizer";
			//Displayed on tooltips during mouseovers
			this.tooltip = "An experimental Xenogen treatment trial that can mod your lactating to sticky and congealed but oh-so-sweet nectar, like a myr. Strangely, the box has a picture of a busty bee-girl instead of an ant or something. Has this even been legally tested? Only way to find out is to put it in your mouth!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 600;
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
			
			this.version = this._latestVersion;
		}
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Usage text:
				//Using Honeydew
				//{Effect: If the PC is lactating, it changes the lactation type to Honey. If the PC is not currently lactating but has a large bust (F+ cup?), then there is a chance that a honey lactation will be induced. Side effects! >:3 }
				kGAMECLASS.output("You take out the jar from your pack");
				kGAMECLASS.output(". The crudely-glued on label falls off a moment later, revealing the real deal just below");
				kGAMECLASS.output(". The large label on the side proclaims the name \"Honeydew\" in large, yellow letters over a field of honeycombs. Several buxom Zil females, barely modest thanks to their positions, are showing around the label under the directions to apply the cream onto the bosom for best effect. Alright, that makes sense, you suppose. You shrug out of your [pc.upperGarments], leaving yourself bare-chested before you twist the top off of the cream jar and smear some across your fingers. Oh, that's cold! You try and suppress a shiver as you bring your hands up to your [pc.chest], spreading a bit across yourself.");
				kGAMECLASS.output("\n\nAs your fingers work their way up toward your [pc.nipples], you quickly break down into a shudder and a moan. Your nipples stiffen at the touch, and you can feel your skin tingling as the nanomachine-laden cream starts to work, the microscopic machines penetrating your skin and entering your bloodstream, right where they're needed.");
				//Milk TF (Already Lactating)
				if(target.canLactate() && target.milkType != GLOBAL.FLUID_TYPE_HONEY)
				{
					kGAMECLASS.output("\n\nSuddenly, you feel a heart-pounding pressure building up in your [pc.chest], swelling inside the mounds of your bosom. You clutch at your chest, fingers working entirely by instinct as your motherly fluids are altered by a surge of gene-mods rushing through your system. You roll yourself onto all fours, squeezing and tugging at your teats until with a gasp you feel yourself start to bead with sweet cream - except it isn't. You bring a hand up to your face and see your fingers glazed with thick, sweet-smelling honey, sticking between your digits in a viscous web.");
					kGAMECLASS.output("\n\nYou can't stop to think about it for long: the need in your [pc.nipples] is far too much to be ignored for more than a moment. Your hands return to your tits, working them as you always do, milking yourself of the thick, flowing yellow honey demanding release. You're panting and moaning before long, kneeling in a puddle of sticky honey as your breasts finally begin to calm down, settling into their new, fuller norm.");
					kGAMECLASS.output("\n\n<b>You now lactate honey!</b>");
					//{+ MilkVol}
					if(target.milkStorageMultiplier < 3) target.milkStorageMultiplier += .5;
					target.milkType = GLOBAL.FLUID_TYPE_HONEY;
					//Flag as milked
					target.milked();
				}
				//Milk TF (Not Lactating)
				else if(target.milkType != GLOBAL.FLUID_TYPE_HONEY && !target.canLactate() && target.biggestTitSize() >= 4 && rand(2) == 0)
				{
					kGAMECLASS.output("\n\nSuddenly, you feel a heart-pounding pressure building up in your [pc.chest], swelling inside the mounds of your bosom. Oh, God, what is that!? You clutch at your chest, fingers working entirely by instinct as a surge of gene-mods rushes through your system, targeting your breasts! You roll yourself onto all fours, your mind going into automatic, spurred on by some instinct hidden in your ample chest. You're quickly squeezing and tugging at your teats until with a gasp, you feel yourself start to... to lactate! You bring a hand up to your face, and see your fingers glazed with thick, sweet-smelling honey,sticking between your digits in a viscous web.");
					kGAMECLASS.output("\n\nYou can't stop to think about it for long: the need in your [pc.nipples] is far too much to be ignored for more than a moment. Your hands return to your tits, working them as you always do, milking yourself of the thick, flowing yellow honey demanding release. You're panting and moaning before long, kneeling in a puddle of sticky honey as your breasts finally begin to calm down, settling into their new norm. <b>It looks like you're lactating now... and honey at that!</b>");
					if(target.milkStorageMultiplier < 3) target.milkStorageMultiplier += .5;
					target.milkType = GLOBAL.FLUID_TYPE_HONEY;
					target.milkMultiplier = 70;
					//Flag as milked
					target.milked();
				}
				//No Effect 
				else
				{
					kGAMECLASS.output("\n\nYou wait for several minutes, occasionally scratching at your ");
					if(target.milkType != GLOBAL.FLUID_TYPE_HONEY || !target.canLactate()) kGAMECLASS.output("milkless ");
					else kGAMECLASS.output("already honey-drooling ");
					kGAMECLASS.output("teats, waiting for... something. Anything, really. Eventually, you sigh and grab something to wipe the dud cream off with. <b>Looks like you ");
					if(target.milkType == GLOBAL.FLUID_TYPE_HONEY) kGAMECLASS.output("already have the full effect of the drug</b>.");
					else kGAMECLASS.output("might need to be lactating already for this mutagen to work</b>.");
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the cream to no effect.");
			}
			return false;
		}
	}
}

