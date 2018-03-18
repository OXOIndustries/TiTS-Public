package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.GameData.CombatAttacks;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.StringUtil;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Utility.*;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class ShoulderGrunchLeash extends ItemSlotClass
	{
		public function ShoulderGrunchLeash() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ACCESSORY;
			
			shortName = "SG.Leash";
			
			longName = "shoulder grunch leash";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a shoulder grunch leash";
			
			tooltip = "This leash leads back to the small, shoulder-mounted acid-spitter you rented from Maja. So long as you equip it in your accessory slot, it will do what it can to assist you in combat, even if its idea of assitance is vomiting acid everywhere.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "null";
			
			basePrice = 3000;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			droneAttack = grunchAttack;
			
			//addFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE);
			addFlag(GLOBAL.ITEM_FLAG_INTERNAL_POWER);
			
			version = _latestVersion;
		}
		public function grunchAttack(attacker:Creature, target:Creature):void
		{
			if(rand(2) == 0)
			{
				if (attacker is PlayerCharacter) output("Your");
				else output(StringUtil.capitalize(possessive(attacker.getCombatName()), false));
				output(" tiny grunch rears back before spraying acid on ");
				if (target is PlayerCharacter) output("you");
				else output(target.getCombatName());
				output(".");
				applyDamage(new TypeCollection( { corrosive: 25 } ), attacker, target, "minimal");
				if(!target.hasStatusEffect("Sundered")) 
				{
					if(kGAMECLASS.silly) output(" <b>Such Sunder! Wow!</b>");
					else output(" <b>This sunders " + target.getCombatName() + ".</b>");
					CombatAttacks.applySunder(target, 4);
				}
			}
			else output("The grunch whips its head around and belches, brewing up another vat of acid.")
		}
	}
}
