package classes.Items.Toys
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CodexManager;
	
	public class GravCuffs extends ItemSlotClass
	{
		//constructor
		public function GravCuffs()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SEXTOY;
			
			//Used on inventory buttons
			this.shortName = "G.Cuffs";
			
			//Regular name
			this.longName = "grav-cuffs";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a set of grav-cuffs";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "These special, levitating cuffs are mass-adjustable. Once attached to an individual, one can make the cuffs - and the cuffed individual - weigh as little or as much as they want. They’re also uni-directional, so you can use them to attach someone to a roof, wall, or any other surface.\n\nThese are premium edition cuffs, complete with a magni-lock feature for fastening different cuffs together, voice activation, and a vocal locking system. They’re made out of a special space-age alloy that is notoriously hard to break. Made by TamaniCorp: “Your pleasure is our pleasure!”";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1000;
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
			if (target is PlayerCharacter) 
			{
				CodexManager.unlockEntry("Grav Cuffs");
				kGAMECLASS.clearOutput();
				if(!target.canMasturbate() || target.lust() < 33)
				{
					kGAMECLASS.output("You’re not really in the mood to masturbate right now....");
				}
				else if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].planet == "PLANET: NEW TEXAS" && kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC) && target.exhibitionism() >= 33 && kGAMECLASS.flags["GRAVCUFFS_USES"] != undefined)
				{
					kGAMECLASS.cuffSelfRouter();
				}
				else
				{
					kGAMECLASS.output("You cannot use the grav-cuffs at this time!");
				}
			}
			else
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use the grav-cuffs.");
			}
			return true;
		}
	}
}
