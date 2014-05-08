package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Goovolver extends ItemSlotClass
	{
		//constructor
		public function Goovolver()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Goovolver";
			
			//Regular name
			this.longName = "MK.VII Goovolver";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a goo-launching revolver";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "JoyCo’s premiere less-than-lethal self-defense weapon, the Mk. VII Goovolver is a compact, brightly-colored gun loaded with bulky capsules. When fired, the weapon launches a small ‘rocket’ capsule at a target, shattering harmlessly on impact but releasing a small Galotian hybrid species. The freshly delivered creature will sexually stimulate the target until submission occurs.\n\nA small label on the side of the barrel indicates that the Galotians are not harmed by the process.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			
			//Information
			this.basePrice = 4280;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.NO_TYPE;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);

			this.version = _latestVersion;
		}
		
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
		
		protected function randomString(... args):String
		{
			return args[rand(args.length)];
		}
		
		public function randGooColour():String
		{
			return randomString("green","cerulean","blue","emerald","teal","crimson","red","pink","purple","violet","yellow","silver","copper","gold","amber","orange","rose","lavender","peach");
		}
	}
}