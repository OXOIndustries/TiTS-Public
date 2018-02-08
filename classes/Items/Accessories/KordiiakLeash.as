package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.StringUtil;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Utility.*;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class KordiiakLeash extends ItemSlotClass
	{
		public function KordiiakLeash() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ACCESSORY;
			
			shortName = "K.Leash";
			
			longName = "kor’diiak bear leash";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a kor’diiak bear leash";
			
			tooltip = "This leash leads back to the fearsome kor’diiak bear you rented from Maja in Korg’ii Hold. So long as you equip it in your accessory slot, you will ride it, reducing travel time and the chance of encountering hostile creatures in Uveto’s wilds. It may also assist you in combat... from time to time.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "null";
			
			basePrice = 8000;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			droneAttack = kordiiakAttack;
			
			addFlag(GLOBAL.ITEM_FLAG_UNDROPPABLE);
			addFlag(GLOBAL.ITEM_FLAG_INTERNAL_POWER);
			
			version = _latestVersion;
		}
		public function kordiiakAttack(attacker:Creature, target:Creature):void
		{
			if(getPlanetName() == "Uveto VII")
			{
				if(rand(3) == 0)
				{
					if (attacker is PlayerCharacter) output("Your");
					else output(StringUtil.capitalize(possessive(attacker.getCombatName()), false));
					output(" kor’diiak roars in sudden agitation, biting ");
					if (target is PlayerCharacter) output("you");
					else output(target.getCombatName());
					output(".");
					applyDamage(new TypeCollection( { kinetic: 35 } ), attacker, target, "minimal");
				}
				else output("Your kor’diiak looks bored.");
			}
			else
			{
				output("Your kor’diiak sighs heavily, panting and confused by the strange locale.");
			}
		}
	}
}
