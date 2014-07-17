package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Chocolac extends ItemSlotClass
	{
		//constructor
		public function Chocolac()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Chocolac";
			//Regular name
			this.longName = "chocolac";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a jar of chocolac";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This creamy brown jar's label depicts a pastoral field of darkly colored bovines on one side; on the other, the bovines are more humanoid in shape: buxom human girls toting massive mammaries and buckets of what could only be chocolate milk. One of them is smiling invitingly at you, a speech bubble informing you that this one-use cream is sure to turn your own natural lactation into a delicious, thick chocolate milk.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1300;
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
				kGAMECLASS.output("You pull the bottle of ChocoLac cream out of your pack, staring at the dark, chocolatey label and the cavalcade of busty girls on display, all arranged just right to keep them work-safe. Clever positioning, indeed. You slowly shrug out of your [pc.gear], leaving your [pc.chest] bare, your [pc.nipples] already stiffening at the thought of your new lactic bounty. With a grin of anticipation, you twist the cap off of the bottle and scoop a bit of the nanomachine-laced cream out onto your fingers. It feels almost like ice cream, cool and creamy to the touch, practically rolling into a ball as you scoop it out of the jar. You shudder slightly as you bring the cold cream to your bare [pc.chest], smearing it across your [pc.skin]. God damn, that's cold. You struggle to spread the cream across your breasts, but eventually manage to smear the whole jar across your chest, leaving you looking mud-covered.");
				//Milk TF (Already Lactating)
				if(target.canLactate() && target.milkType != GLOBAL.FLUID_TYPE_CHOCOLATE_MILK)
				{
					kGAMECLASS.output("\n\nYou bite your [pc.lip], groaning as your bosom swells and contracts while the nanomachines work their magic, rewriting your body to their own microscopic ends. Instinctively, your hands wander up your body, cupping your [pc.chest] and giving the teats atop them a little squeeze. Instantly, your over-full bosom lets loose a flood of sweet cream: a few first, straggling white drops are quickly chased out by a rich, brown flow. Your whole body shivers in nearly-orgasmic pleasure as the first drops of chocolate milk roll out of you, your fingers working along the lengths of your [pc.nipples] until both your breasts are working at full force, unleashing a torrent of chocolate to pool on the ground.");
					kGAMECLASS.output("\n\nYou only just suppress a low, guttural ");
					if(target.bovineScore() < 1) kGAMECLASS.output("moan");
					else kGAMECLASS.output("moo");
					kGAMECLASS.output(" as your back arches, your instinctive pleasure overwhelming your senses as your hands go on autopilot, tugging and squeezing your teats until your [pc.knees] are quaking. Finally, with a gasp of bliss, you let yourself collapse onto all fours like a proper dairy cow, gushing your lactic lust onto the ground until your hands are completely soaked, washing away the cream from your teats as they work you to nearly orgasmic heights of ecstasy.");
					if(target.hasCock() || target.hasVagina())
					{
						kGAMECLASS.output(" You try not to notice the ");
						if(target.hasCock()) kGAMECLASS.output("sudden turgidness of your [pc.cocks].");
						else kGAMECLASS.output("the flush of wetness down your thighs as [pc.eachVagina] drools its excitement.");
					}
					kGAMECLASS.output("\n\nSlowly, the feeling of fullness drains from your [pc.chest], leaving you panting and gasping for breath, barely cognizant enough to realize how sodden you've made yourself. So much chocolate milk! You shudder in delight at the sight of your new productivity, and can't possibly stop yourself from licking a few drops off your hands. Delicious! <b>It looks like you now lactate a sweet chocolate milk!</b>");
					//{+ MilkVol}
					if(target.milkStorageMultiplier < 3) target.milkStorageMultiplier += .5;
					target.milkType = GLOBAL.FLUID_TYPE_CHOCOLATE_MILK;
					//Flag as milked
					target.milked();
				}
				//Milk TF (Not Lactating)
				else if(target.milkType != GLOBAL.FLUID_TYPE_CHOCOLATE_MILK && !target.canLactate() && target.biggestTitSize() >= 4 && rand(2) == 0)
				{
					kGAMECLASS.output("\n\nYou quickly feel nanomachines activating, their tell-tale tingle reaching through your skin and entering your bloodstream. A gasp escapes your lips as your [pc.chest] suddenly becomes much more sensitive, able to feel every gust of air passing by. Slowly, a tightness begins to form in your chest, and you can <i>feel</i> your [pc.chest] expanding, your breasts swelling as they're suddenly kicked into overdrive. You nearly double over as the pressure mounts in your chest, your hormones going wild as they're suddenly urged to produce.");
					if(target.milkStorageMultiplier < 3) target.milkStorageMultiplier += .5;
					//target.milkType = GLOBAL.FLUID_TYPE_CHOCOLATE_MILK;
					target.milkMultiplier = 70;
					//Flag as milked
					target.milked();
				}
				//No Effect 
				else
				{
					kGAMECLASS.output("\n\nYou wait for several minutes, occasionally scratching at your ");
					if(target.milkType != GLOBAL.FLUID_TYPE_CHOCOLATE_MILK || !target.canLactate()) kGAMECLASS.output("milkless ");
					else kGAMECLASS.output("already chocolate-drooling ");
					kGAMECLASS.output("teats, waiting for... something. Anything, really. Eventually, you sigh and grab something to wipe the dud cream off with. <b>Looks like you ");
					if(target.milkType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) kGAMECLASS.output("already have the full effect of the drug</b>.");
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

