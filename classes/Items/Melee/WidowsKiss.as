package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class WidowsKiss extends ItemSlotClass
	{
		public function WidowsKiss()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.MELEE_WEAPON;
			
			shortName = "WidowsKiss";
			longName = "Widow’s Kiss";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "the Widow’s Kiss";
			tooltip = "Said to have been wielded by Shar Lot Ebb, the first and only bothrioc ruler of ancient Karachnarum, the blade of this viciously sharp, obsidian rapier appears to be made from bothrioc chitin. It has a small tuft of bluish fiber hanging from the pommel, and an organic jag near the hilt forms a nest-like guard around the handle. Using it gives you a strangely unstoppable, ravishing aura, your every move seemingly brilliantly, beautifully calculated. Lethally sexy.";
			
			attackVerb = "thrust";
			attackNoun = "thrust";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 3200;
			
			baseDamage.kinetic.damageValue = 17;
			baseDamage.tease.damageValue = 6;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 3;
			critBonus = 5;
			evasion = 5;
			fortification = 0;

			version = _latestVersion;
		}
	}
}