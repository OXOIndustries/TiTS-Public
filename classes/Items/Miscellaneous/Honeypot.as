package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	
	public class Honeypot extends ItemSlotClass
	{
		
		//constructor
		public function Honeypot()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Honeypot";
			//Regular name
			this.longName = "Honeypot";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a vaginal insertable labeled ‘Honeypot’";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A brand new Xenogen product released thanks to your... contributions, Honeypot is a localized transformation that affects vaginal secretions, rewriting the body to produce a sweet, thick honey. The first release of the new product comes in a handy, single-use <b>insertable</b> form.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
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
				author("n666");
				//Usage text:
				// Effect: If pc has a Vagina, changes girlCum to Honey.
				if(target.hasVagina())
				{
					kGAMECLASS.output("You take out the egg shaped yellow pill from your pack. Its package shows the large Honeypot label, the last ‘o’ is replaced by a pair of puffy, black, honey-dripping labia. You look for a nearby seat");
					if(target.isCrotchGarbed()) kGAMECLASS.output(" before carefully peeling away your [pc.lowerGarments] to easily access your [pc.vaginas]");
					else kGAMECLASS.output(" before inspecting your crotch.");
					kGAMECLASS.output(".");
					if(!target.vaginalVirgin) kGAMECLASS.output(" It can’t possibly compare to anything you’ve taken before.");
					else kGAMECLASS.output(" It can’t be that bad. You hope so, anyway. You’ve haven’t ever forced much inside there before.");
					kGAMECLASS.output("\n\n");
					if(target.totalVaginas() > 1) kGAMECLASS.output("Your fingers slowly move the ovoid transformative across your multitude of lips before finally settling on a lucky pair. It isn’t supposed to matter which entrance takes it. ");
					kGAMECLASS.output("You push it in. ");
					if(target.vaginas[0].looseness() >= 4) kGAMECLASS.output("It is hardly noticeable in your gaping caverns, the gentle fizzing sensation fading away as fast as it starts. ");
					else if(target.vaginas[0].looseness() >= 2) kGAMECLASS.output("The pill is slowly fading away inside your explored snatch. ");
					else kGAMECLASS.output("You can clearly feel the vaginal pill dissolve inside your tight vagina. ");
					kGAMECLASS.output("You guess the nanomachines were released right where they need to be.");

					//GirlCum TF
					if(target.girlCumType != GLOBAL.FLUID_TYPE_HONEY)
					{
						kGAMECLASS.output("\n\nYou only have to wait a few moments before a heat radiates from your loins. Eager to grant yourself some release, you let your fingers wander. They find their way to your labia and caress your [pc.clits], dipping back to rubbing your insides with great care. The heat fades away but your lust remains, so you continue with your play.");
						kGAMECLASS.output("\n\nWhen your fluids begin to flow, your nostrils are greeted by a sweet scent, and your fingers can feel a sticky thick sap dripping from your [pc.vaginas]. Holding up an amber-stained digit, you tentatively lick it. <b>[pc.EachVagina] is secreting honey!</b>");
						target.changeLust(20+rand(10));
						target.girlCumType = GLOBAL.FLUID_TYPE_HONEY;
					}
					//No Effect (your honeypot is already leaking honey)
					else
					{
						kGAMECLASS.output("\n\nYou wait for several minutes, occasionally touching the honey dripping slit, waiting for... something. Anything, really. Eventually, you sigh and pout. <b>It looks like you already have the full effect of the drug.</b>");
					}
				}
				else
				{
					if(!kGAMECLASS.infiniteItems()) quantity++;
					kGAMECLASS.output("You briefly hold the egg-shaped pill in your hand before pocketing it once more. You need a vagina to put it in before you can use it.");
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

