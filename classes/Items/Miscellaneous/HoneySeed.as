package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class HoneySeed extends ItemSlotClass
	{
		
		//constructor
		public function HoneySeed()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Honeyseed";
			//Regular name
			this.longName = "honeyseed";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a suppository labelled 'honeyseed'";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A brand new Xenogen product released thanks to your... contributions, Honeyseed is a localized transformation that affects male semen production, rewriting the body to produce a sweet, thick honey. The first release of the new product comes in a handy, one-use <b>suppository</b> form.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 500;
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
				//{Effect: If the PC has a cock, changes cumType to Honey.}
				kGAMECLASS.output("You take out the oversized yellow pill from your pack, staring at the large HONEYSEED label on its side, name superimposed over a field of vibrant honeycombs. With a deep breath to steady yourself, you shimmy out of your [pc.gear] and lower yourself to the ground, lifting your [pc.legs] to get a good angle on your own [pc.asshole]. You briefly think that some medical professional should be doing this when you buy the damn thing, but brush the thought from your mind as you reach down to your tightly clenched hole, pressing the rounded head of the thick pill to your dark star.");
				kGAMECLASS.output(" Here goes. You bite your lip and press in, ");
				if(target.ass.looseness() >= 5) kGAMECLASS.output("the yellow pill easily slipping through the gaping hole of your ruined asshole");
				else if(target.ass.looseness() >= 3) kGAMECLASS.output("the yellow pill only catching a moment on your well-stretched hole");
				else kGAMECLASS.output("pushing hard against the clenched ring of your sphincter");
				kGAMECLASS.output(". You gasp as the Honeyseed suppository slides into you, a tiny knot of pressure in your anus that lasts only for a few moments before the auto-release in the capsule triggers, and the nanomachines inside are released into your body.");
			
				//Cum TF
				if(target.cumType != GLOBAL.FLUID_TYPE_HONEY && target.hasCock())
				{
					kGAMECLASS.output("\n\nYou have only to wait a few moments before a sudden tightness clenches in your [pc.balls], making your [pc.cocks] jump to attention. You grimace as the sensation intensifies, making you nearly double over as the Honeydew's changes wrack your body, altering the very fabric of your being, radiating out from the [pc.balls] to your manhood. You grab ");
					if(target.cockTotal() > 1) kGAMECLASS.output("one of your rods");
					else kGAMECLASS.output("your [pc.cock]");
					kGAMECLASS.output(", instinctively stroking the rapidly hardening shaft as you feel... something... coming. Your breath quickens, turgid shaft quaking with effort as you pump your prick, working up what must be a load of cum, but immeasurably thicker than your previous spunk.");
					kGAMECLASS.output("\n\nWith a cry of pleasure, your [pc.hips] buck into your hand, ramming out a thick streak of amber spooge that spatters across your thighs and crotch, glazing your groin in a creamy yellow. Your back arches instinctively, thrusting your crotch out as you continue to fap and cum, spraying yourself in sweet cock-nectar for what seems like an eternity, until all that pressure in your [pc.balls] finally fades away.");
					kGAMECLASS.output("\n\n<b>It looks like you'll be cumming honey from here on out.</b>");
					target.orgasm();
					kGAMECLASS.output("\n\nPanting and gasping for breath, your orgasmic transformation leaves you plastered in spooge and smelling like a beehive.");
					target.cumType = GLOBAL.FLUID_TYPE_HONEY;
				}
				//No Effect (You Already do the Thing!)
				else
				{
					kGAMECLASS.output("\n\nYou wait for several minutes, occasionally scratching at your slightly sore ass, trying to ignore the faint tingle in your loins as you find yourself waiting for... something. Anything, really. Eventually, you sigh and grab your gear, realizing this is probably a dud. <b>Looks like you ");
					if(target.cumType == GLOBAL.FLUID_TYPE_HONEY) kGAMECLASS.output("already have the full effect of the drug");
					else kGAMECLASS.output("might not have the right bodyparts for this thing to change");
					kGAMECLASS.output("</b>.");
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the suppository to no effect.");
			}
			return false;
		}
	}
}

