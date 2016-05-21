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
	
	public class Pussyblossom extends ItemSlotClass
	{
		
		//constructor
		public function Pussyblossom()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "Pussyblossom";
			
			//Regular name
			this.longName = "Pussyblossom pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Pussyblossom pill";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "After the success of Pussybloom, Xenogen developed an enhanced version that would cause growth of additional vaginas, though usually no more than three. The extra R&D came with a cost, and while Pussyblossom is more potent than its cousin, it’s also far more expensive.\n\nThese purple pills come in packets covered in warnings about growing additional genitals, fertility increases, and disclaimers about pregnancy.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 14000;
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
				kGAMECLASS.output("You swallow the purple pill. As small as it is, it goes down easy.");
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
					pc.clitLength = .25;
					pc.vaginas[0].hymen = true;
					var pcRace:String = pc.race();
					if(InCollection(pcRace, "horse-morph", "part horse-morph", "laquine", "centaur", "horse-taur", target.mlpRace()))
					{
						pc.shiftVagina(0, GLOBAL.TYPE_EQUINE);
						kGAMECLASS.output("You’ve got ");
						if(pc.vaginaColor(0) == "black") kGAMECLASS.output("a dusky, black");
						else kGAMECLASS.output(indefiniteArticle(pc.vaginaColor(0)));
						kGAMECLASS.output(" horse-pussy.");
					}
					else if(InCollection(pcRace, "naleen", "naga"))
					{
						pc.shiftVagina(0, GLOBAL.TYPE_NAGA);
						kGAMECLASS.output("You’ve got a slim, " + pc.vaginaColor(0) + "-hued snake-pussy.");
					}
					else if(pcRace == "zil")
					{
						pc.shiftVagina(0, GLOBAL.TYPE_BEE);
						kGAMECLASS.output("You’ve got ");
						if(pc.vaginaColor(0) == "black") kGAMECLASS.output("a dusky, black");
						else kGAMECLASS.output(indefiniteArticle(pc.vaginaColor(0)));
						kGAMECLASS.output(" zil-pussy.");
					}
					else if (InCollection(pcRace, "leithan", "half-leithan"))
					{
						pc.shiftVagina(0, GLOBAL.TYPE_LEITHAN);
						kGAMECLASS.output("You’ve got ");
						if(pc.vaginaColor(0) == "black") kGAMECLASS.output("a dusky, black");
						else kGAMECLASS.output(indefiniteArticle(pc.vaginaColor(0)));
						kGAMECLASS.output(" leithan pussy.");
					}
					else if (pcRace == "vanae-morph")
					{
						pc.shiftVagina(0, GLOBAL.TYPE_VANAE);
						kGAMECLASS.output("You’ve got a virginal, " + pc.vaginaColor(0) + " vanae pussy.");
					}
					else if (InCollection(pcRace, "kui-tan", "half kui-tan"))
					{
						pc.shiftVagina(0, GLOBAL.TYPE_KUITAN);
						kGAMECLASS.output("You’ve got ");
						if(pc.vaginaColor(0) == "black") kGAMECLASS.output("a dusky, black");
						else kGAMECLASS.output(indefiniteArticle(pc.vaginaColor(0)));
						kGAMECLASS.output(" ‘nuki-pussy.");
					}
					else if (InCollection(pcRace, "gryvain", "half-gryvain"))
					{
						pc.shiftVagina(0, GLOBAL.TYPE_GRYVAIN);
						kGAMECLASS.output("You’ve got " + indefiniteArticle(pc.vaginaColor(0)) + ", multi-clitted gryvain pussy.");
					}
					else if (pcRace == "lapinara")
					{
						pc.shiftVagina(0, GLOBAL.TYPE_LAPINARA);
						kGAMECLASS.output("You’ve got " + indefiniteArticle(pc.vaginaColor(0)) + " lapinara pussy.");
					}
					else if (pcRace == "canine-morph")
					{
						pc.shiftVagina(0, GLOBAL.TYPE_CANINE);
						kGAMECLASS.output("You’ve got " + indefiniteArticle(pc.vaginaColor(0)) + " canine-pussy.");
					}
					else if (InCollection(pcRace, "gabilani", "goblin"))
					{
						pc.shiftVagina(0, GLOBAL.TYPE_GABILANI);
						kGAMECLASS.output("You’ve got a muscular, " + pc.vaginaColor(0) + " goblin pussy.");
					}
					/*
					else if (InCollection(pcRace, "siren", "anemone"))
					{
						pc.shiftVagina(0, GLOBAL.TYPE_SIREN);
						kGAMECLASS.output("You’ve got a tentacled, " + pc.vaginaColor(0) + " alien pussy.");
					}
					else if (InCollection(pcRace, "synthetic", "robot", "companion droid"))
					{
						pc.shiftVagina(0, GLOBAL.TYPE_SYNTHETIC);
						kGAMECLASS.output("You’ve got a robotic, " + pc.vaginaColor(0) + "-colored synthetic pussy.");
					}
					*/
					else
					{
						if(pc.skinType == GLOBAL.SKIN_TYPE_GOO)
						{
							pc.vaginas[0].addFlag(GLOBAL.FLAG_GOOEY);
							pc.vaginas[0].vaginaColor = pc.skinTone;
						}
						kGAMECLASS.output("You’ve got a pretty, " + pc.vaginaColor(0) + " pussy");
						if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_GOOEY)) kGAMECLASS.output(" made of goo");
						kGAMECLASS.output(".");
					}
					pc.orgasm();
					kGAMECLASS.output("</b> You’ll have to spend some quality time with it soon.");
				}
				else if(pc.hasVagina())
				{
					var x:int = rand(pc.totalVaginas());
					//Grow a new puss, yall
					//Grow a second gooch
					if(pc.totalVaginas() == 1)
					{
						TFed = true;
						kGAMECLASS.output("\n\nThe room is warming up by the second. In fact, it’s getting quite hot. You fan yourself for a while before you realize that it isn’t the ambient temperature that’s the problem - it’s you! You’re burning up! You press the back of your hand to your forehead and nearly collapse from the effects of the fever. The warning label on the pills mentioned momentarily heightened temperature, but you didn’t expect this!\n\nIt isn’t all discomfort though. The heat in your [pc.vagina " + x + "] is far more pleasant, and powerful, than elsewhere. As a matter of fact, you’re finding it far easier to forget about the rest of you with each passing moment. Your entrance is getting hotter and wetter by the second, and it takes every ounce of willpower you have not to try to plug it with your fingers on the spot. It’s unbearable!\n\nYou whimper with need, grinding your [pc.thighs] together as a river of [pc.girlCum] pours from your baking-hot slit. It feels better than ever, you’ve got two sets of squishy, engorged lips grinding against one another. Giving up on holding back, you reach down and rub your palm across your mound, feeling a second ");
						if(pc.totalClits() > 1) kGAMECLASS.output("set of ");
						kGAMECLASS.output("[pc.clits] but too overwhelmed with static bursts of ecstasy to understand.");
						kGAMECLASS.output("\n\nA pair of doubled orgasms washes over you, stripping away the budding knowledge of this transformation and leaving you with nothing to focus on but quivering folds and spasming tunnels. You lie there, quaking, fingers rammed into twinned boxes for what feels like hours.\n\nIt isn’t until a few minutes later that you manage to pull your [pc.girlCumNoun]-soaked digits free and discover that <b>you now have two identical vaginas.</b>");
						pc.createVagina();
						pc.copyVagina(1,0);
						pc.orgasm();
						pc.orgasm();
					}
					//Grow a third hotpocket
					else if(pc.totalVaginas() < 3)
					{
						TFed = true;
						kGAMECLASS.output("Violent spasms of ecstasy overwhelm you from out of nowhere, doubling you over before carrying you to the ground. The pleasure is erupting from your doubled pussies like lava from a pair of volcanic peaks, ");
						if(pc.wettestVaginalWetness() < 3) kGAMECLASS.output("leaking out in thin streams");
						else if(pc.wettestVaginalWetness() < 4) kGAMECLASS.output("gushing out in thick streams");
						else 
						{
							kGAMECLASS.output("spraying ");
							if(pc.isCrotchGarbed()) kGAMECLASS.output("into your [pc.lowerGarment]");
							else kGAMECLASS.output("everywhere");
						}
						kGAMECLASS.output(".");
						kGAMECLASS.output("\n\nYou don’t stop to think; you thrust your hands down, stuffing fingers in both your holes at once, reveling in the multiplied pleasure that your blessed body provides. It feels hotter and wetter than ever. You lose yourself in the raw ecstasy, a passenger adrift on currents of electric, red-hot lust. Never mind that you can never seem to fill the rising ache of desire within you. Never mind that you feel empty even when you’re eight fingers deep.");
						kGAMECLASS.output("\n\nThen, your thumb brushes an extra clit, shocking you from your ardor-induced haze. There’s another [pc.vagina " + x + "] there, positioned perfectly for you to rub with your thumbs. Thrusting your [pc.hips], you bring yourself off in a triple-bang orgasm. You writhe and squirm, lost in fantasies of being filled with pulsating, cum-drizzling tentacles.\n\n<b>You’ve got three vaginas now.</b> Maybe sometime you’ll find the perfect mate... or three... to deal with them.");
						pc.createVagina();
						pc.copyVagina(2,x);
						pc.orgasm();
						pc.orgasm();
						pc.orgasm();
					}
					//Hymen restoration
					else if(!pc.vaginas[x].hymen)
					{
						kGAMECLASS.output("\n\nAt first, you don’t feel any different. But then, as you check yourself over, you become aware of a slightly <i>different</i> feeling in your [pc.vagina " + x + "]. A little careful probing around reveals what’s changed - <b>you’ve regrown your hymen</b>! You might not be a virgin anymore, but you’ve got the body of one!");
						pc.vaginas[x].hymen = true;
						TFed = true;
					}
					//BonusCapacity++
					else if(pc.vaginas[x].bonusCapacity < 500)
					{
						TFed = true;
						kGAMECLASS.output("\n\nYour [pc.vagina " + x + "] warms over the span of a few moments. It’s a kind of mild, painless, heat that reminds you vaguely of the time you went to the sauna as a youth. Leaning back, you ");
						if(pc.legCount > 1) kGAMECLASS.output("spread your [pc.legs]");
						else kGAMECLASS.output("stretch out your [pc.leg]");
						kGAMECLASS.output(" and close your eyes, enjoying the pleasant sensations emanating from your crotch. You could sit like this all day, letting expensive microsurgeons tweak your feminine flesh to perfection.");
						kGAMECLASS.output("All the heat has you feeling a little frisky. You dip a couple fingers into your slick junction, just to test it out");
						if(pc.vaginalCapacity() > 400) kGAMECLASS.output(" before graduating to your fist");
						if(pc.vaginalCapacity() > 600) kGAMECLASS.output(" and forearm");
						kGAMECLASS.output(", finding yourself filling past your usual limits with ease.");
						if(pc.vaginas[x].looseness() <= 4) kGAMECLASS.output(" You still squeeze just as tight around your self-induced invasion, but you’re able to get more in before it becomes uncomfortable.");
						kGAMECLASS.output(" <b>Your ");
						if(x == 0) kGAMECLASS.output("first");
						else if(x == 1) kGAMECLASS.output("second");
						else kGAMECLASS.output("third");
						kGAMECLASS.output(" vagina has become more capacious!</b>");
						pc.vaginas[x].bonusCapacity += 100;
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
