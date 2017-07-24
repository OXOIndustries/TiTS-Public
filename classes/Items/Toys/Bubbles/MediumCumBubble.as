package classes.Items.Toys.Bubbles
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.inCombat;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.applyDamage;
	import classes.Engine.Utility.rand;
	import classes.Items.Toys.Bubbles.HugeCumBubble;
	import classes.Items.Toys.Bubbles.LargeCumBubble;
	//import classes.Items.Toys.Bubbles.MediumCumBubble;
	import classes.Items.Toys.Bubbles.SmallCumBubble;
	
	public class MediumCumBubble extends ItemSlotClass
	{
		//constructor
		public function MediumCumBubble()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.POTION;
			
			//Used on inventory buttons
			this.shortName = "M.Bubble";
			
			//Regular name
			this.longName = "medium cum bubble";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a medium bubble of cum";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A palmable purple sphere, roughly the size of a grapefruit, filled with your cum. Some trait of the latex casing preserves the warmth and potency of its squishy contents. The rubbery casing is slightly elastic, but sufficient force or a sharp point should pop the bubble.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 0;
			baseDamage = new TypeCollection();
			baseDamage.tease.damageValue = 5;
			//baseDamage.addFlag(DamageFlag.EXPLOSIVE);
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);

			this.combatUsable = true;
			this.targetsSelf = false;
			requiresTarget = true;
			
			this.version = _latestVersion;
		}	
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(inCombat())
			{
				// Player used an item
				if (usingCreature == kGAMECLASS.pc) kGAMECLASS.playerUsedBubbleBuddyInCombat(target, usingCreature,this);
				// Enemy used an item on the PC
				else if (target == kGAMECLASS.pc && usingCreature != kGAMECLASS.pc)
				{
					/* NO TEXTS FOR NPC USAGE... YET
					if(inCombat()) kGAMECLASS.output("\n\n");
					else kGAMECLASS.clearOutput();
					npcUsed(target, usingCreature);*/
					throw new Error("How is someone other than the PC throwing a cum bubble? THIS SHIT BE BROKED!");
				}
				else throw new Error("Don’t know how we got here. Exception for debugging.");
				return false;
			}
			else
			{
				if (target == kGAMECLASS.pc) return kGAMECLASS.outOfCombatBubbleBuddyUse(this);
				else
				{
					kGAMECLASS.clearOutput();
					output(target.capitalA + target.short + " has no use for a cum bubble\n");
					output("\n");
				}
				return false;
			}
		}
	}
}
