package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Engine.Utility.indefiniteArticle;
	
	public class Pussybloom extends ItemSlotClass
	{
		
		//constructor
		public function Pussybloom()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "Pussybloom";
			
			//Regular name
			this.longName = "Pussybloom pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Pussybloom pill";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Originally intended as a feminine enhancer, it was discovered to cause non-females to permanently grow a vagina of their own. In light of this, the product was rebranded by Xenogen Biotech, repriced, and sold as an effective way of gaining or changing sex. It is still seen as the most effective and safest way to become a woman or hermaphrodite despite its high price tag.\n\nWomen still gain advantage from it, if they can afford it. The microsurgeon and chemical cocktail packed into the pink pill is quite effective at increasing the capacity of a given orifice, making inter-species breeding a snap. Increases in fertility are a known and documented side effect.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 8000;
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
			var choices:Array = new Array();
			var pc:Creature = target;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.output("You swallow the pink pill. As small as it is, it goes down easy.");
				var TFed:Boolean = false;
				//Growgina
				if(!pc.hasVagina())
				{
					TFed = true;
					kGAMECLASS.output("\n\nYour body reacts immediately. Sweat beads on your suddenly overheated brow. Your heart is pounding, and the air seems obscenely humid. Groaning in discomfort, you press your moist palms against your [pc.belly], feeling your body temperature rise even higher. Swaying uncertainly, you sink to the ground, confused and uncomfortable.");
					kGAMECLASS.output("\n\nThen, you feel it - an unmistakable, pleasant wetness. It isn’t your seemingly omnipresent sweat either, but something else, something altogether slipperier. New-grown nerves revel in your new, slickened state, unveiling a whole new palette of exquisite feelings, revealing a fleshy, sensitive crease ");
					if(pc.balls == 0 && !pc.hasCock()) kGAMECLASS.output("in your crotch");
					else if(pc.balls > 0) kGAMECLASS.output("just behind your [pc.balls]");
					else kGAMECLASS.output("just underneath your [pc.cocks]");
					kGAMECLASS.output(". Gingerly, you probe your blossoming vagina. It rewards you with an answering burst of hot, wet ecstasy.");

					kGAMECLASS.output("\n\nFeeling much better, you gingerly remove your [pc.girlCum]-soaked digits from yourself and give the feminine addition a serious look. <b>");

					pc.createVagina();
					pc.setNewVaginaValues(0);
					pc.clitLength = .25;
					pc.vaginas[0].hymen = true;
					
					switch(pc.vaginas[0].type)
					{
						case GLOBAL.TYPE_EQUINE:
							kGAMECLASS.output("You’ve got ");
							if(pc.vaginaColor(0) == "black") kGAMECLASS.output("a dusky, black");
							else kGAMECLASS.output(indefiniteArticle(pc.vaginaColor(0)));
							kGAMECLASS.output(" horse-pussy.");
							break;
						case GLOBAL.TYPE_NAGA:
							kGAMECLASS.output("You’ve got a slim, " + pc.vaginaColor(0) + "-hued snake-pussy.");
							break;
						case GLOBAL.TYPE_BEE:
							kGAMECLASS.output("You’ve got ");
							if(pc.vaginaColor(0) == "black") kGAMECLASS.output("a dusky, black");
							else kGAMECLASS.output(indefiniteArticle(pc.vaginaColor(0)));
							kGAMECLASS.output(" zil-pussy.");
							break;
						case GLOBAL.TYPE_LEITHAN:
							kGAMECLASS.output("You’ve got ");
							if(pc.vaginaColor(0) == "black") kGAMECLASS.output("a dusky, black");
							else kGAMECLASS.output(indefiniteArticle(pc.vaginaColor(0)));
							kGAMECLASS.output(" leithan pussy.");
							break;
						case GLOBAL.TYPE_VANAE:
							kGAMECLASS.output("You’ve got a virginal, " + pc.vaginaColor(0) + " vanae pussy.");
							break;
						case GLOBAL.TYPE_KUITAN:
							kGAMECLASS.output("You’ve got ");
							if(pc.vaginaColor(0) == "black") kGAMECLASS.output("a dusky, black");
							else kGAMECLASS.output(indefiniteArticle(pc.vaginaColor(0)));
							kGAMECLASS.output(" ‘nuki-pussy.");
							break;
						case GLOBAL.TYPE_GRYVAIN:
							kGAMECLASS.output("You’ve got " + indefiniteArticle(pc.vaginaColor(0)) + ", multi-clitted gryvain pussy.");
							break;
						case GLOBAL.TYPE_LAPINARA:
							kGAMECLASS.output("You’ve got " + indefiniteArticle(pc.vaginaColor(0)) + " lapinara pussy.");
							break;
						case GLOBAL.TYPE_CANINE:
							kGAMECLASS.output("You’ve got " + indefiniteArticle(pc.vaginaColor(0)) + " canine-pussy.");
							break;
						case GLOBAL.TYPE_VULPINE:
							kGAMECLASS.output("You’ve got " + indefiniteArticle(pc.vaginaColor(0)) + " vulpine pussy.");
							break;
						case GLOBAL.TYPE_FELINE:
							kGAMECLASS.output("You’ve got " + indefiniteArticle(pc.vaginaColor(0)) + " feline pussy.");
							break;
						case GLOBAL.TYPE_GABILANI:
							kGAMECLASS.output("You’ve got a muscular, " + pc.vaginaColor(0) + " goblin pussy.");
							break;
						case GLOBAL.TYPE_FLOWER:
							kGAMECLASS.output("You’ve got a beautiful, " + pc.vaginaColor(0) + " orchid pussy.");
							break;
						case GLOBAL.TYPE_SIREN:
							kGAMECLASS.output("You’ve got a tentacled, " + pc.vaginaColor(0) + " alien pussy.");
							break;
						case GLOBAL.TYPE_SYNTHETIC:
							kGAMECLASS.output("You’ve got a robotic, " + pc.vaginaColor(0) + "-colored synthetic pussy.");
							break;
						default:
							kGAMECLASS.output("You’ve got a pretty, " + pc.vaginaColor(0) + " pussy");
							if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY)) kGAMECLASS.output(" made of goo");
							kGAMECLASS.output(".");
							break;
					}
					pc.orgasm();
					kGAMECLASS.output("</b> You’ll have to spend some quality time with it soon.");
				}
				else if(pc.hasVagina())
				{
					var x:int = rand(pc.totalVaginas());
					//Hymen restoration
					if(!pc.vaginas[x].hymen)
					{
						kGAMECLASS.output("\n\nAt first, you don’t feel any different. But then, as you check yourself over, you become aware of a slightly <i>different</i> feeling in your [pc.vagina " + x + "]. A little careful probing around reveals what’s changed - <b>you’ve regrown your hymen</b>! You might not be a virgin anymore, but you’ve got the body of one!");
						pc.vaginas[x].hymen = true;
						TFed = true;
					}
					//BonusCapacity++
					if(pc.vaginas[x].bonusCapacity < 500)
					{
						TFed = true;
						kGAMECLASS.output("\n\nYour [pc.vagina " + x + "] warms over the span of a few moments. It’s a kind of mild, painless heat that reminds you vaguely of the time you went to the sauna as a youth. Leaning back, you ");
						if(pc.legCount > 1) kGAMECLASS.output("spread your [pc.legs]");
						else kGAMECLASS.output("stretch out your [pc.leg]");
						kGAMECLASS.output(" and close your eyes, enjoying the pleasant sensations emanating from your crotch. You could sit like this all day, letting expensive microsurgeons tweak your feminine flesh to perfection.");
						kGAMECLASS.output(" All the heat has you feeling a little frisky. You dip a couple fingers into your slick junction, just to test it out");
						
						pc.vaginas[x].bonusCapacity += 100;
						
						if(pc.vaginalCapacity() > 400) kGAMECLASS.output(" before graduating to your fist");
						if(pc.vaginalCapacity() > 600) kGAMECLASS.output(" and forearm");
						kGAMECLASS.output(", finding yourself filling past your usual limits with ease.");
						if(pc.vaginas[x].looseness() <= 4) kGAMECLASS.output(" You still squeeze just as tight around your self-induced invasion, but you’re able to get more in before it becomes uncomfortable.");
						kGAMECLASS.output(" <b>Your ");
						if(x == 0) kGAMECLASS.output("first");
						else if(x == 1) kGAMECLASS.output("second");
						else kGAMECLASS.output("third");
						kGAMECLASS.output(" vagina has become more capacious!</b>");
					}
				}
				//Fertility gain +TF
				if(pc.fertility() < 1.5 && TFed)
				{
					pc.fertilityRaw += .03;
					kGAMECLASS.output("\n\nYou’re probably a little more fertile too.");
				}
				//Fertility gain - no TF
				else if(pc.fertility() < 1.5)
				{
					kGAMECLASS.output("\n\nYou don’t feel any different, but you’ve probably gotten slightly more fertile. There’s gotta be a cheaper way to supercharge a womb, though.");
					pc.fertilityRaw += .03;
				}
				//Nothing
				else if(!TFed)
				{
					kGAMECLASS.output("\n\nNo matter how long you wait, nothing happens. What a waste of credits.");
				}
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " consumes the pill to no effect.");
			}
			return false;
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
	}
}
