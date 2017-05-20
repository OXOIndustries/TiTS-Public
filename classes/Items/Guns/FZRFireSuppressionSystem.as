package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	
	public class FZRFireSuppressionSystem extends ItemSlotClass
	{
		// FZR Fire Suppression System (Level 6 or 7, Maybe 8)
		// by HugsAlright
		// Vendor: Anno or Shekka?
		public function FZRFireSuppressionSystem()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.RANGED_WEAPON;
			
			shortName = "FZR FSS";
			longName = "FZR Fire Suppression System";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a FZR Fire Suppression System";
			
			tooltip = "Usually found on starships for fighting fires in zero-grav situations, the FZR Fire Suppression System fires a spread of cooling chemicals used to suppress blazes on space stations or ships. Despite its intended use, this tool has often been used as a makeshift freezing weapon. With its large spread, it’s unlikely you’ll miss your target with an FZR in hand, though its large size and cumbersome back-mounted chemical pack may slow you down more than a fair bit.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "shoot";
			attackNoun = "blast";
			
			basePrice = 20000;
			
			baseDamage = new TypeCollection();
			baseDamage.freezing.damageValue = 22;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			
			attack = 10;
			critBonus = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			evasion = -10;
			fortification = 0;
			
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			version = _latestVersion;
			
			/*
			Deep Freeze: 
			// Consecutive attacks with this weapon have a chance to apply a “Deep Freeze” debuff to an enemy, greatly lowering their evasiveness and increasing their vulnerability to crushing attacks.
			// [Deep Freeze] Your enemy has been all but frozen by your attacks, lowering their evasiveness and increasing their vulnerability to your crushing attacks.
			*/
			
			attackImplementor = CombatAttacks.FZRAttackImpl;
		}
	}
}