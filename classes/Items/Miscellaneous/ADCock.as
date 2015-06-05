package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ADCock extends ItemSlotClass
	{
		//constructor
		public function ADCock()
		{
			this._latestVersion = 2;
			this.hasRandomProperties = true;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "A.D.Cock";
			
			//Regular name
			this.longName = "synth-phallus - dragon";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a KihaCorp-branded synth-phallus modelled after a mythological dragon's";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "KihaCorp’s popular companion droid line has numerous accessories and addons available for purchase across the galaxy. Some of the most popular are the hot-swappable genitals they’re equipped with, in particular variant phalli and vaginas.\n\nThis one is a hefty, brightly colored wang with a shaft that's a psychedelic mix of blues and purples. Fundamentally reptilian in shape, the tapered crown is covered with animatable tendrils for maximum pleasure. The synth-phallus measures about ten inches when fully inflated, but retracts down into a compact sheath when not. It includes its own silicone reservoir and pumps to minimize impact on the android’s body shape during erections.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 15000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}	
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(!kGAMECLASS.infiniteItems()) quantity++;
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.clearOutput();
				if(kGAMECLASS.silly) kGAMECLASS.output("Professor Oak: ");
				kGAMECLASS.output("You cannot use this now.");
			}
			else {
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use this.");
			}
			return true;
		}
		
		public function UpgradeVersion1(d:Object):void
		{
			delete d.bonusResistances;
			delete d.bonusLustVuln;
			delete d.damage;
			delete d.damageType;
		}
	}
}
