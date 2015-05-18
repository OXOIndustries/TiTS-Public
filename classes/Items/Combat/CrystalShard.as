package classes.Items.Combat 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CrystalShard extends ItemSlotClass
	{
		public function CrystalShard() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.POTION;
			
			//Used on inventory buttons
			this.shortName = "Crystal S.";
			
			//Regular name
			this.longName = "crystal shard";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a shard of crystallized goo";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A chemically-treated shard of crystallized goo from a ganrael. When shattered, the shard will cover the user with goo that will rapidly recrystallize, granting a defensive boost for several hours.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = true;
			this.targetsSelf = true;

			this.version = _latestVersion;
		}	
		//Boosts Defense by +3 for 2-4 hours. Grants 25% Mirrored to armor for duration.
		override public function useFunction(targetCreature:Creature, usingCreature:Creature = null):Boolean
		{
			if (targetCreature.hasStatusEffect("Crystal Coated"))
			{
				if (targetCreature == kGAMECLASS.pc)
				{
					kGAMECLASS.clearOutput();
					kGAMECLASS.output("Any more crystals and you'd be lucky to move, let alone fight.\n");
				}
				if(!kGAMECLASS.infiniteItems()) quantity++;
				return false;
			}
			else
			{
				// Player used an item
				if (targetCreature == kGAMECLASS.pc)
				{
					kGAMECLASS.clearOutput();
					playerUsed(targetCreature, usingCreature);
				}
				// Enemy used an item on the PC
				else if (targetCreature != kGAMECLASS.pc && usingCreature != kGAMECLASS.pc)
				{
					kGAMECLASS.output("\n");
					npcUsed(targetCreature, usingCreature);
				}
				else
				{
					throw new Error("Don't know how we got here. Exception for debugging.");
				}
			}			
			return false;
		}
		
		public function playerUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			kGAMECLASS.output("You hold the crystal aloft and break it apart, coating yourself with a splash of liquid goo. It clings to your body, rapidly recrystallizing into a glittering, rock-hard plates!\n");
			//{Restores moderate HP}
			targetCreature.createStatusEffect("Crystal Coated",2,0,0,0,false,"Icon_DefUp","Defense is raised by 4 points thanks to a coating of rock-hard crystals!",false,1200);
		}
		
		public function npcUsed(targetCreature:Creature, usingCreature:Creature):void
		{
			kGAMECLASS.output(usingCreature.capitalA + usingCreature.short + " breaks open a crystal shard, soaking " + usingCreature.mfn("him","her","it") + "self in a greenish goo that rapidly hardens into crystal! You'll have a hard time hurting " + usingCreature.mfn("him","her","it") + "!");
			//{Restores moderate HP}
			targetCreature.createStatusEffect("Crystal Coated",2,0,0,0,false,"Icon_DefUp","Defense is raised by 4 points thanks to a coating of rock-hard crystals!",true,0);
		}
	}
}