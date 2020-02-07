package classes.Items.Transformatives {
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	
	public class Motherhusk extends ItemSlotClass {
		public function Motherhusk() {
			this._latestVersion = 1;
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			this.shortName = "Mthrhusk";
			this.longName = "motherhusk";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a motherhusk";
			
			this.tooltip = "This small, cylindrical plant... fungus... or whatever, looks like a ring of thickened bark. Bits and pieces of it flake off at your touch, releasing small puffs of what you assume are spores into the atmosphere. According to a casual extranet search, crushing it and inhaling the spores should improve the speed of one’s pregnancies, assuming a little libido-regulation damage isn’t a big deal.\n\n<b>Known to cause high amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1000;
			
			this.version = this._latestVersion;
		}
		//Slutshroom Menu

		//Alt Tarkus: - Slutshrooms (+moderate libido, moderate fertility, +wet if fertile enough) ? 
		//smallish, pink-colored mushroom

		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean {
			clearOutput();
			if(kGAMECLASS.silly) author("Squirtnoxo");
			else author("Fenoxo");
			if ((target is PlayerCharacter)) {
				var pc:Creature = target;
				if (!pc.hasVagina())
				{
					output(" <b>It’s a real shame it does absolutely nothing.</b>");
					return false;
				}
				pc.taint(5);
				
				output("Here goes nothing! You squeeze your fist around the motherhusk, feeling it crumble away, then raise your hand up to your face. Upon opening your palm, a cloud of cloying, purple-tinted vapor spools out into the air. You suck in a huge breath before it can blow away, wincing at how it seems to warm your windpipe.");
				//Pregspeed -> 1.5x
				if(pc.pregnancyIncubationBonusMotherRaw < 1.5)
				{
					output("\n\nAfter a second, you feel a twinge in your [pc.belly]. You expected the changes to feel... more invasive.");
					pc.pregnancyIncubationBonusMotherRaw = 1.5;
				}
				//Pregspeed -> 2x
				else if(pc.pregnancyIncubationBonusMotherRaw < 2)
				{
					output("\n\nA shock of sudden sensation races up your spine as your ovaries... <i>awaken</i>. One moment, you’re standing there, feeling normal. The next, you’re getting a constant stream of data from those lovely little organs, communicating just how full of eggs they are. If you focus, you can even sort of get a sense when the next one is going to release.");
					pc.pregnancyIncubationBonusMotherRaw = 2;
				}
				//Pregspeed -> 2.5x
				else if(pc.pregnancyIncubationBonusMotherRaw < 2.5)
				{
					output("\n\nYou feel your ovaries quiver and clench, tight and hot with potential. That warmth spreads toward your center, curling along your fallopian tubes and into ");
					if(pc.totalVaginas() == 1) output("a ");
					output("womb");
					if(pc.totalVaginas() > 1) output("s");
					output(" vibrating in anticipation of pushing out babies at a faster rate. The sensation is so powerful that it leaves you breathless and a little randy.");
					pc.pregnancyIncubationBonusMotherRaw = 2.5;
					pc.changeLust(10);
				}
				//Pregspeed -> 3x
				else if(pc.pregnancyIncubationBonusMotherRaw < 3)
				{
					output("\n\nYou cough out a cloud of half-absorbed spores when your womb");
					if(pc.totalVaginas() > 1) output("s");
					output(" shudder");
					if(pc.totalVaginas() == 1) output("s");
					output(", palpably thickening inside you, the better to put out babies at a moment’s notice.");
					pc.pregnancyIncubationBonusMotherRaw = 3;
				}
				//Pregspeed -> 4x
				else if(pc.pregnancyIncubationBonusMotherRaw < 4)
				{
					output("\n\nA pleasant glow flutters out of your [pc.belly] to give your cheeks the radiant glow of an expectant mother");
					if(!pc.isPregnant()) output(", even without the associated pregnancy.");
					else output(", enhancing the look you already bear.");
					output(" A codex scan reports that your endocrine system is adapting to the spores beautifully, growing whole new groups of cells in order to change your hormonal state the second a drop of sperm touches [pc.oneVagina].");
					pc.pregnancyIncubationBonusMotherRaw = 4;
				}
				//Pregspeed -> 5x
				else if(pc.pregnancyIncubationBonusMotherRaw < 5)
				{
					output("\n\nA shockwave jiggles your [pc.belly] as your ovaries plump. It’s a strange sensation, tightness and heat building until it snaps into pleasing, capable warmth a second later.");
					pc.pregnancyIncubationBonusMotherRaw = 5;
				}
				//Pregspeed -> 6x
				else if(pc.pregnancyIncubationBonusMotherRaw < 6)
				{
					output("\n\nYou suddenly pant, unable to get enough oxygen. Your [pc.belly] squeezes tight, womb");
					if(pc.totalVaginas() > 1) output("s");
					output(" firing demanding signals into your brain, demanding ");
					if(pc.isPregnant()) output("even more babies");
					else output("a baby");
					output(". It passes after a second, but the lingering desire to be knocked up remains.");
					pc.pregnancyIncubationBonusMotherRaw = 6;
				}
				//Pregspeed -> 7x
				else if(pc.pregnancyIncubationBonusMotherRaw < 7)
				{
					output("\n\nYou shudder as the connection between your brain and your overies deepens, flooding you with new feelings and desires, wanting the warm embrace of a flood of cum, the heady endorphin high of being absolutely engorged with new life. ");
					if(!pc.isFullyWombPregnant()) output("Maybe... you should go get knocked up, right now.");
					else if(pc.totalVaginas() < 3) output("Maybe you should grow another vagina... so you can get even more knocked up.");
					else output("Maybe you should lie down in your belly, contented by how absurdly knocked-up you are.");
					pc.pregnancyIncubationBonusMotherRaw = 7;
				}
				//Maxed out - no effects!
				else
				{
					output("\n\nNothing happens except for a slight passing dizziness. Maybe you’re already the perfect breeder? ...Or maybe you’ll need something stronger if you want to have babies even faster.");
					return false;
				}
				//Libido gain - only if pregspeed boost
				pc.slowStatGain("libido",15);
				//Low lib:
				if(pc.libido() < 20) output("\n\nThe aftermath leaves you a little aroused, evidenced by your increased moistness.");
				//Lowmed lib:
				else if(pc.libido() < 40) 
				{
					output("\n\nYou wipe a bead of sweat from your brow and try not to think about how good it would feel to have someone get you pregnant");
					if(pc.isFullyWombPregnant()) output(" after you birth your current youngling");
					output(".");
				}
				//Med
				else if(pc.libido() < 60)
				{
					output("\n\nA wistful smile sneaks onto your features as you idly daydream about all the different ways you could get knocked up. The idea of being pinned beneath a virile, heaving brute is certainly appealing...");
				}
				//Med/High
				else if(pc.libido() < 80)
				{
					output("\n\nYou pull your hands away from your crotch after your fourth or fifth daydream about all the different ways you could get knocked up: broad-shouldered New Texans tag-teaming you, big dicked kui-tan hermaphrodites knotting you to force every drop into your womb, or even a funnel stuffed up your cunt as dozens of horny aliens jack off to create a mystery-daddy slurry.");
				}
				//High
				else
				{
					output("\n\nYou wiggle your fingers around in [pc.oneVagina] until you’re as aroused as possible, your mind filled with perverted thoughts of being strapped down and knocked up again and again, basically just ");
					if(pc.totalVaginas() == 1) output("a ");
					output("womb");
					if(pc.totalVaginas() > 1) output("s");
					output(" with legs and ");
					if(pc.totalVaginas() == 1) output("a pussy");
					else output("pussies");
					output(" that needs to be constantly creampied... It isn’t until you orgasm that you realize you ought not to be idly diddling yourself. Whoops!");
					pc.orgasm();
				}
				if(pc.libido() < 80) pc.changeLust(15);
			}
			else {	
				output(target.capitalA + target.short + " consumes the motherhusk to no effect.");
			}
			return false;
		}
	}
}