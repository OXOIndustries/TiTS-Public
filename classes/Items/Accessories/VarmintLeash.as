package classes.Items.Accessories 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.StringUtil;
	import classes.GameData.CombatAttacks;
	
	public class VarmintLeash extends ItemSlotClass
	{
		
		
		public function VarmintLeash() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ACCESSORY;
			
			shortName = "Pink Leash";
			
			longName = "varmint leash";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pink varmint leash";
			
			tooltip = "[altTooltip VarmintLeash]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "null";
			
			basePrice = 50;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			droneAttack = CombatAttacks.TamedVarmintAttack;
			
			version = _latestVersion;
		}
		
		override public function onEquip(targetCreature:Creature):void
		{
			if(kGAMECLASS.varmintIsTame())
			{
				targetCreature.createStatusEffect("Varmint Buddy", 0, 0, 0, 0, false, "Radio", "The pink wireless leash you hold will ensure that your varmint companion stays close by, joining alongside you in battle if necessary.", false, 0);
			}
		}
		
		override public function onRemove(targetCreature:Creature):void
		{
			targetCreature.removeStatusEffect("Varmint Buddy");
		}
	}
}
