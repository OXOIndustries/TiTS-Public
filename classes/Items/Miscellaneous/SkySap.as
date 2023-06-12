package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.author;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	
	public class SkySap extends ItemSlotClass
	{
		private var buff:String = "";
		
		//constructor
		public function SkySap()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.POTION;
			//Used on inventory buttons
			this.shortName = "SkySap";
			//Regular name
			this.longName = "bamboo container of sky sap";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bamboo container of sky sap";
			//Displayed on tooltips during mouseovers
			this.tooltip = "An organic canister with a sticky, cream-colored sap inside. This sap has been harvested from a vanae “Sky Tree.” It has a pleasant smell. While the Codex states it’s safe to drink, it seems like the sort of thing that might transform you if consumed.\n\n<b>Known to cause slight amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			//Information
			this.basePrice = 5;
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
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var changeLimit:int = 1;
			var pc:Creature = target;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			if(rand(3) == 0) changeLimit++;
			if(rand(3) == 0) changeLimit++;
			if(rand(3) == 0) changeLimit++;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				buff = "";
				author("JimThermic");
				
				kGAMECLASS.output("You take a deep breath and bring the bamboo-like container to your lips. The creamy liquid spills onto your tongue, and you’re surprised how thick and rich it is. For a while you roll it around on your tongue, savouring the taste, before you finally swallow it.");
				
				kGAMECLASS.processTime(2);
				target.taint(1);
				
				//Skin Change
				// Prerequsites: Non human skin, or human skin w'o a Vanae skin color.
				// Gives human skin with vanae skin color (See Color Notes section)
				// Medium chance of occurring.
				// Apply Vanae set color
				if(!hasVanaeSkinColor(pc) && changes < changeLimit && changes < changeLimit && rand(3) == 0)
				{
					outputB("\n\nAll across your body, you begin to shed your " + pc.skinNoun(false) + ". You watch on in amazement as clumps of " + pc.skinNoun(false) + " fall from your body. It doesn’t feel uncomfortable in the least - rather, it tickles! Replacing it is ");
					setSkinColorVanae(pc);
					outputB(pc.skinTone + " flesh, soft and supple like a newborn child.");
					outputB("\n\nYou run your hand along your freshly formed skin and shiver a little with delight. <b>You now have " + pc.skinTone + " skin!</b>");
					pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
					pc.clearSkinFlags();
					
					changes++;
				}
				
				//Change Markings
				// Prerequisites: Has vanae skin color, has existing markings
				// Apply set color (Marking color)
				if(!hasMatchingVanaeSkinAccentColor(pc) && pc.hasStatusEffect("Vanae Markings") && changes < changeLimit && rand(8) == 0)
				{
					outputB("\n\nThere is a tingling under your " + pc.skin() + ". Your " + pc.skinAccent + " markings glow and pulse, catching your attention.");
					pc.skinAccent = getVanaeAccentColor(pc);
					outputB(" Suddenly, they cloud and fade, becoming " + pc.skinAccent + " in color. You take a quick moment to look over yourself using your Codex. <b>You now have " + pc.skinAccent + " body markings!</b>");
					
					changes++;
				}

				//Add Markings
				// Prerequisites: No existing markings
				// If no markings, give markings.
				// Medium chance of occurring.
				// Apply set color (Marking color)
				if(!pc.hasAccentMarkings() && changes < changeLimit && rand(4) == 0)
				{
					pc.skinAccent = getVanaeAccentColor(pc);
					outputB("\n\nAcross your " + pc.skin() + ", " + pc.skinAccent + " markings suddenly begin to blossom and bloom. You watch in wonderment as the swiftly growing tattoo tree spreads across every inch of your body. It’s like dozens of fingers are tracing across your form and using your body as a living canvas.");
					outputB("\n\nWhen the sensations subside, you shiver a little and look at your reflection in your codex. Luminous lines now break up your " + pc.skin() + ". <b>You now have " + pc.skinAccent + " body markings!</b>");
					pc.createStatusEffect("Vanae Markings");
					
					changes++;
				}
				//Reflex Increase / Strength Decrease
				// Must not already have 50+ reflex and strength 0.
				// Reflex only increases to max 50.
				// Strength decreases to min 0.
				// Medium chance of occurring.
				//NOPE! FENCHANGE!
				//Reflex raised toward cap slowly. No higher than 50.
				if((pc.PQ() > 40 || pc.RQ() < 100) && changes < changeLimit && rand(3) == 0)
				{
					outputB("\n\nEvery single one of your muscles begin to throb and pulse. You gasp out loud as the strange sensation wracks your entire body. What is going on--?");
					outputB("\n\nWhen it finally subsides, you look down at your lower body. You’ve shed some muscle and every inch of you has become more lean and taut. <b>Your ");
					if(pc.PQ() > 40)
					{
						pc.physique(-1);
						outputB("physique has decreased");
						if(pc.RQ() < 100) outputB(", and your ");
					}
					if(pc.RQ() < 100)
					{
						outputB("reflexes have increased");
						pc.slowStatGain("reflexes",2);
					}
					outputB("!</b>");
					changes++;
				}
				//Vanae Tail 
				// Prerequisites: Must not have a tail. 
				// Medium chance of occurring.
				// Apply set color, if any
				// Gain Tail Trip attack
				if((pc.tailCount == 0 || pc.tailType != GLOBAL.TYPE_VANAE) && changes < changeLimit && rand(4) == 0)
				{
					if(target.tailTypeUnlocked(GLOBAL.TYPE_VANAE))
					{
						if(pc.tailCount == 1) outputB("\n\nYou hear a ‘whumph’ behind you, and realize that your " + pc.tailsDescript() + " has fallen off!");
						else if(pc.tailCount > 1) outputB("\n\nYou hear a ‘whumph’ behind you, and realize that your " + pc.tailsDescript() + " have fallen off!");
						outputB(" From just above your [pc.butt], a protrusion forms and snakes outwards. After growing a few metres out, it falls to the ground from its own weight.");
						outputB("\n\nWhen it finally stops growing, you tentatively wiggle it about. It seems to be a prehensile tail with octopus-like suckers on the bottom. It feels quite powerful, too, like you could knock someone over with a single sweep. <b>You now have a Vanae tail!</b>");
						pc.tailCount = 1;
						pc.tailType = GLOBAL.TYPE_VANAE;
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_LONG);
						pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						changes++;
					}
					else kGAMECLASS.output(target.tailTypeLockedMessage());
				}
				//Tentacle Hair
				// Prerequisites: Don't have tentacle hair. Can be bald.
				// If bald, gives hair of short length
				// Medium chance of occurring.
				// Apply set color, if any
				if((!pc.hasHair() || (pc.hairType != GLOBAL.HAIR_TYPE_TENTACLES && pc.hairStyle != "tentacle")) && changes < changeLimit && hasVanaeSkinColor(pc) && rand(4) == 0)
				{
					outputB("\n\nThere’s a tingling on your scalp and you reach up to touch it. ");
					if(pc.hasHair()) outputB("Suddenly, your " + pc.hairDescript() + " begins to fall out and fall to the ground around you! ");
					outputB("Something slides out of your scalp ");
					if(pc.hasHair()) outputB("in its place");
					outputB(", growing out at an incredible rate. Whatever it is, it feels kind of slippery.");

					// Transform hair here.
					pc.hairType = GLOBAL.HAIR_TYPE_TENTACLES;
					pc.hairStyle = "null";
					pc.hairColor = getVanaeAccentColor(pc);
					if(!pc.hasHair()) pc.hairLength = 2;

					outputB("\n\nRealization hits you as your new locks fall in front of your eyes - you’ve sprouted [pc.hairColor] tentacle hair! What’s even stranger is you can lift and move around each length as easily as your arms; they’re prehensile! Twisting them about, you realize they have little octopus-like suckers facing inward. <b>You now have [pc.hairColor] tentacle hair!</b>");
					changes++;
				}
				//Finned Ears 
				// Prerequisites: Don't have finned ears.
				// Medium chance of occurring .
				if(pc.earType != GLOBAL.TYPE_VANAE && rand(4) == 0 && changes < changeLimit)
				{
					outputB("\n\nA sharp sensation strikes the sides of your head and you instinctively clutch your ears. Beneath your palms you can feel them wriggling and shifting. What’s going on? When it stops, you run your fingers along them. There are strange new contours -- are your ears <i>finned</i> now?\n\nSomething else is different. The sound of your brushing fingers, while small, is very detailed and distinct. In fact, every noise around you is more audible; you’re being bombarded by a sea of sonorous sensations. This is going to take some getting used to. <b>You now have a pair of finned Vanae ears!</b>");
					pc.earType = GLOBAL.TYPE_VANAE;
					target.clearEarFlags();
					changes++;
				}
				//Femininity Increase, Masc Decrease, Lip Size Increase
				// Prerequisites: PC does not have max femininity, min masculinity & and pouty size lips or higher. // Medium chance of occurring 
				// Lip Size increase to Pouty size, max.
				// Fem increases each time used until 100. Masc decreases until 0.
				if(pc.femininity < pc.femininityMax() && changes < changeLimit && rand(4) == 0)
				{
					outputB("\n\nYour whole body begins to feel tantalizingly ticklish. Of everything, your lips and cheeks feel the most sensitive. You brush them lightly with your fingertips and shiver with delight. Every part of your body feels like an erogenous zone!\n\nAfter a while your skin stops pricking, and you check yourself over to see if anything’s changed. To your surprise, your lips have become softer and fuller, and your whole body, especially your face, has become softer and more feminine. <b>Your femininity has increased!</b>");
					pc.modFem(3);
					changes++;
				}
				//Lip Color change
				// Prerequisites: Have a vanae set color
				// Medium chance of occurring 
				if(hasVanaeSkinColor(pc) && pc.lipColor != getVanaeAccentColor(pc) && changes < changeLimit && rand(4) == 0)
				{
					outputB("\n\nIt feels as if someone is running a finger along your lips. After you stop shivering, you check them out. <b>Your lips are now [pc.lipColor]!</b>");
					pc.lipColor = getVanaeAccentColor(pc);
					changes++;
				}
				//Vanae Pussy Gain (Pussy)
				// Changes PC pussy type to Vanae
				// Must not be a vanae pussy type already
				// Medium chance of occurring 
				// Revirginates like Pussybloom.
				// Apply set color, if any.
				x = 0;
				y = 0;
				//Female TFs
				choices = new Array();
				for(x = 0; x < target.totalVaginas(); x++) {
					if(target.vaginas[x].type != GLOBAL.TYPE_VANAE && target.vaginaTypeUnlocked(x, GLOBAL.TYPE_VANAE)) choices[choices.length] = x;
				}
				if(choices.length == 0) x = -1;
				else x = choices[rand(choices.length)];
				//Change pussy type to vanae.
				if(x >= 0 && changes < changeLimit && rand(3) == 0 && hasVanaeSkinColor(pc)) {
					outputB("\n\nDeep in your lower abdomen, you feel a hot pooling sensation growing and coiling tight. You rub your belly, moaning as it steadily intensifies. Soon you’re on the ground touching between your [pc.thighs] and madly stroking your pussy.\n\nInside your slippery softness, you feel as if things are moving about and rearranging. Instead of being unpleasant, it instead feels as if your inner walls are being massaged and caressed. With a shrill cry, your [pc.hips] madly buck the air and you squirt a stream of [pc.girlCum] out from your pussy, violently climaxing all over the place. A thin sheen of sweat coats your [pc.skinFurScales] as you fall, utterly spent, on the surface below you. That - that was something else!\n\nNow that you’ve settled down, you explore your new vanae pussy with your fingertips. You can feel the little feelers inside designed for stroking and teasing cocks. A little further in, and you feel a slight obstruction - you’ve ");
					if(pc.vaginas[x].hymen) outputB("still got your");
					else {
						outputB("regrown your");
						pc.vaginas[x].hymen = true;
					}
					outputB(" hymen. <b>You now have a virgin, [pc.pussyColor] vanae pussy!</b>");
					pc.shiftVagina(x, GLOBAL.TYPE_VANAE);
					pc.vaginas[x].vaginaColor = getVanaeAccentColor(pc);
					changes++;
				}
				//Vanae Pussy Gain (No Pussy)
				// Must not already have a pussy
				// Medium chance of occurring 
				// Revirginates like Pussybloom.
				// Apply set color, if any.
				// Also gives double clit and squirter off the bat
				if(!pc.hasVagina() && changes < changeLimit && rand(4) == 0 && hasVanaeSkinColor(pc))
				{
					outputB("\n\nDeep in your lower abdomen, you feel a hot pooling sensation growing and coiling tight. You rub your belly, moaning as it steadily intensifies. Soon you’re on the ground touching between your [pc.thighs], stroking a place that is now becoming incredibly hot. It feels like you’re about to cum, but ");
					if(pc.hasCock()) outputB("not from your " + pc.cocksDescript());
					else outputB("not from your [pc.ass]");
					outputB("!");

					outputB("\n\nYou throw back your head and let out a shrill cry as glistening pussy petals emerge from your [pc.skinColor] mound. Your new womanhood blossoms like a flower, parting softly and exposing your slick wetness to the air. You feverishly fondle your warm, damp entrance, plunging your fingers inside and stirring about inside of your virgin pussy. It feels so good, is this what all women enjoy having...?\n\nWith a shrill cry, your [pc.hips] madly buck the air and you squirt a stream of [pc.girlCum] out from your new pussy, violently climaxing all over the place. A thin sheen of sweat coats your [pc.skinFurScales] as you fall, utterly spent, on the surface below you. That--that was something else. What would it feel like to have something in it, you wonder...?\n\nNow that you’ve settled down, you explore your new vanae pussy with your fingertips. You can feel the little feelers inside designed for stroking and teasing cocks. A little further in, and you feel a slight obstruction - you’ve definitely got a hymen - and it seems you’re a squirter to boot. Roaming a little higher, your digits brush two very sensitive clits. Oh--! Just brushing a finger between those sets your loins alight with pleasure. This is definitely going to be fun.");
					outputB("\n\n<b>You now have a virgin, [pc.pussyColor] vanae pussy and two clits - you’re also a squirter!</b>");
					pc.createVagina();
					pc.shiftVagina(0, GLOBAL.TYPE_VANAE);
					pc.vaginas[0].vaginaColor = getVanaeAccentColor(pc);
					pc.clitLength = 0.25;
					changes++;
				}
				//Double Clit Gain 
				//Must have a pussy
				//Must not already have two or more clits
				//Don't know how to handle this multiple pussies, multiple clits thing... might need to PM me if this needs to be changed.
				x = 0;
				y = 0;
				choices = new Array();
				for(x = 0; x < target.totalVaginas(); x++) {
					if(target.vaginas[x].type == GLOBAL.TYPE_VANAE && target.vaginas[x].clits < 2) choices[choices.length] = x;
				}
				if(choices.length == 0) x = -1;
				else x = choices[rand(choices.length)];
				
				if(x >= 0 && changes < changeLimit && rand(3) == 0 && hasVanaeSkinColor(pc)) {
					outputB("\n\nThe lips of [pc.onePussy] begins to ache, though not unpleasantly so. ");
					//Frontgenitals: 
					if(pc.genitalLocation() <= 1) outputB("You part your lower lips with your fingers, and seek out the source of the odd sensation. ");
					outputB("At the top of your folds, ");
					//AlreadyGotClit: 
					if(pc.vaginas[x].clits == 1) outputB("right near your [pc.clit], you feel a small secondary bud begin to form.");
					else outputB("you feel two buds begin to form.");
					//Frontgenitals: 
					if(pc.genitalLocation() <= 1) outputB(" You instinctively rub and massage it, trying to coax it to the surface.");

					outputB("\n\nWhen they finally emerge, you experience a swift, unexpected orgasm. You cry out and [pc.girlCum] ");
					if(!pc.isSquirter()) outputB("dribbles down you");
					else outputB("spurts out between your");
					outputB(" [pc.thighs]. When your orgasm subsides, you examine the changes to your [pc.vaginas " + x + "]. <b>You now have two clits!</b>");
					changes++;
					pc.libido(1);
					pc.orgasm();
					pc.vaginas[x].clits = 2;
				}
				//Pussy Color Change
				// PC has pussy
				// Pussy is not vanae color type
				// Change all pussy colors at once.
				x = 0;
				y = 0;
				choices = new Array();
				for(x = 0; x < target.totalVaginas(); x++) {
					//If have vanaecunt and color isn't right!
					if(target.vaginas[x].type == GLOBAL.TYPE_VANAE && target.vaginas[x].vaginaColor != getVanaeAccentColor(pc)) choices[choices.length] = x;
				}
				if(choices.length == 0) x = -1;
				else x = choices[rand(choices.length)];
				
				if(x >= 0 && changes < changeLimit && rand(3) == 0 && hasVanaeSkinColor(pc)) {
					outputB("\n\nBetween the juxt of your [pc.thighs], you feel as if someone is slowly running a finger up and down your slit");
					if(pc.totalVaginas() > 1) outputB("s");
					outputB(". Shivering with delight, you relax and enjoy the slow stroking sensations along your snatch");
					if(pc.totalVaginas() > 1) outputB("es");
					outputB(". When it dies away, you’re left a little bit frustrated, and you let out a disappointed whine.");

					outputB("\n\nChecking [pc.eachPussy], you realize ");
					if(pc.totalVaginas() == 1) outputB("it looks");
					else outputB("they look");
					outputB(" different from before. <b>Your ");
					if(pc.totalVaginas() == 1) outputB("vagina is");
					else outputB("vaginas are");
					for(x = 0; x<target.totalVaginas();x++)
					{
						pc.vaginas[x].vaginaColor = getVanaeAccentColor(pc);
					}
					outputB(" now " + pc.vaginas[0].vaginaColor + "!</b>");
					changes++;
					pc.changeLust(30);
					pc.slowStatGain("libido",2);
				}
				//Squirter
				// Must not already be a squirter
				// Must have a pussy
				if(!pc.isSquirter() && pc.hasVagina() && changes < changeLimit && rand(4) == 0 && pc.totalVaginas(GLOBAL.TYPE_VANAE) > 0)
				{
					outputB("\n\nYou feel a wet sensation running down your [pc.thighs] and a fiercely hot sensation seizing [pc.eachPussy]. It feels as if someone or something is stirring about and fucking your insides, yet your outer lips remain utterly unparted. You moan with delight and buck your [pc.hips] at the invisible intruder, quickly submitting to the superb sensations assaulting your helpless body.");
					outputB("\n\nWithin moments you’re cumming with soul-shattering intensity. Your [pc.girlCum] spurts wildly from between your thighs in wild, unrepentant streams. When you finally come to, your [pc.legOrLegs]");
					if(pc.legCount == 1) outputB(" is");
					else outputB(" are");
					outputB(" soaked in your girl juice. <b>You are now a squirter!</b>");
					for(x = 0; x<target.totalVaginas();x++)
					{
						if(pc.vaginas[x].wetnessRaw < 4) pc.vaginas[x].wetnessRaw = 4;
					}
					changes++;
				}
				//Add Breasts
				// Must not have breasts
				// Only increases flat to A's.
				if(pc.breastRows[0].breastRatingRaw < 1 && changes < changeLimit && rand(4) == 0)
				{
					outputB("\n\nA straining sensation - inch by inch - slowly spreads across the front of your chest. It feels as if something is growing underneath and stretching your [pc.skinFurScales]. Reaching up with both hands, the strange swelling presses into your palms, slowly filling them up with soft, supple flesh.");
					outputB("\n\nWhen you pull them away and look down, you see a pair of small but distinct breasts protruding from your chest. You cup and tease them, feeling a tingling sensation traveling through your distinctly feminine flesh. <b>You have grown a pair of A-cup breasts!</b>");
					pc.breastRows[0].breastRatingRaw = 1;
					changes++;
				}
				//Nipple color change
				// PC's nipples are not already a vanae color
				if(pc.nippleColor != getVanaeAccentColor(pc) && hasVanaeSkinColor(pc) && changes < changeLimit && rand(4) == 0)
				{
					outputB("\n\nYour nipples begin to stiffen and ache. You look down at them, just in time to see them shift to an entirely different hue. <b>Your nipples are now [pc.nippleColor]!</b>");
					changes++;
					pc.nippleColor = getVanaeAccentColor(pc);
				}
				//Vanae Milk Gain
				// PC must have A cup or larger breasts
				// PC must not already have Vanae milk
				// The PC begins to lactate (if not already doing so) and lactation type becomes Vanae_Maiden, Vanae_Huntress, or Vanae_Matron.
				if(pc.biggestTitSize() >= 1 && !InCollection(pc.milkType, GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK, GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK) && pc.vanaeScore() > 2 && changes < changeLimit && rand(4) == 0)
				{
					outputB("\n\nYou grab your [pc.breasts] and feel a churning, filling sensation inside of them. Your [pc.nipplesNoun] poke out through your fingertips, lewdly erect, and [pc.milk] begins to orgasmically spurt from your udders. You moan and milk your wildly spurting peaks, literally creaming yourself long and hard.");
					// Milk change here to Vanae_maiden, Vanae_Huntress, or Vanae_Matron milk.
					if(pc.hasVirginVagina() || (pc.hasHymen() && rand(3) != 0)) pc.milkType = GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK;
					else pc.milkType = GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK;
					if(pc.milkMultiplier < 80) pc.milkMultiplier = 80;
					if(pc.milkFullness < 50) pc.milkFullness = 50;
					outputB("\n\nDrowning in pleasure, you utterly cum out the contents of your [pc.breasts] until they’re emptied, and something new fills it instead. Fruity, [pc.milkColor] fluid flows out from between your fingers. Bringing your digits up, you lick some off. Just a little taste is enough to make you flush with arousal. Your breast milk is now filled with aphrodisiacs. <b>You now have [pc.milkColor] vanae breast milk!</b>");
					outputB("\n\nYou test out your newly filled udders by giving them a quick squeeze. From your [pc.nipples], a six foot stream of milk arcs out and splatters on the ground. <b>You’ve gained a Squirt Attack, when you have enough milk!</b>");
					//Gain squirt attack
					changes++;
					pc.changeLust(35);
				}
				//Eye Color Change
				// Eye color is not vanae type.
				if(pc.eyeColor != getVanaeAccentColor(pc) && changes < changeLimit && rand(4) == 0 && hasVanaeSkinColor(pc))
				{
					pc.eyeColor = getVanaeAccentColor(pc);
					outputB("\n\nYour vision goes a little fuzzy. A few seconds later, you regain your eyesight. When you check to see if there’s anything in them, you realize your eyes have changed color. <b>Your eyes are now [pc.eyeColor]!</b>");
				}
				//Dick Reduction / Loss
				// If PC has dicks, shrink. If smallest, remove.
				if(pc.hasCock() && changes < changeLimit && rand(4) == 0)
				{
					outputB("\n\nYou feel a tingling along " + pc.eachCock() + " and a slight withdrawal back into your " + pc.skinFurScales() + ". Looking down, you realize ");
					if(pc.smallestCockLength() >= 4) outputB("" + pc.eachCock() + " has reduced in size by an inch!");
					else outputB("your " + pc.cockDescript(pc.smallestCockIndex()) + " has disappeared!");
					outputB("<b>");
					if(pc.smallestCockLength() >= 4) 
					{
						outputB(" [pc.EachCock] has shrunk.");
						for(x = 0; x < pc.cockTotal(); x++)
						{
							pc.cocks[x].cLengthRaw--;
							if(pc.hasPerk("Mini"))
							{
								if(pc.cocks[x].cLengthRaw > 4) pc.cocks[x].cLengthRaw--;
								else pc.cocks[x].cLengthRaw = 3;
							}
						}
					}
					else
					{
						outputB(" You no longer have a " + pc.simpleCockNoun(pc.smallestCockIndex()));
						pc.removeCock(pc.smallestCockIndex(),1);
						// If no more dicks, then remove balls!
						if(!pc.hasCock() && pc.balls > 0)
						{
							outputB("!</b>");
							outputB("\n\nIn addition, the disappearance of your only manhood also seems to affect your [pc.sack]... With rhythmic pulses, the size of your package gradually diminishes until it vanishes completely!");
							outputB("<b>");
							if(pc.balls == 1) outputB(" Your single [pc.ballNoun] has disappeared");
							else outputB(" You no longer have [pc.ballsNoun]");
							pc.removeBalls();
							pc.resetCumProduction();
						}
						outputB("!");

					}
					outputB("</b>")
					changes++;
				}
				
				// One or more TF occurs
				if(changes > 0)
				{
					kGAMECLASS.output("\n\nIt doesn’t take long at all for your unique biology to respond. A swift tingling sensation spreads out across your [pc.skinFurScales]. You feel light headed, and your heart madly races within your chest. A hot flush runs through your body, and you strip off your [pc.gear].");
					kGAMECLASS.output(buff);
				}
				// else No TFs
				else kGAMECLASS.output("\n\nYou finish off the contents. Other than lighting up your tastebuds, nothing happens to you from consuming the sky sap.");
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " drinks the container to no effect.");
			}
			
			return false;
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
		protected function hasVanaeSkinColor(pc:Creature):Boolean
		{
			if(InCollection(pc.skinTone, "pale violet", "pale purple", "pale blue", "pale pink", "pale orange", "pale green", "pale", "pale gold")) return true;
			return false;
		}
		protected function outputB(arg:String):void
		{
			buff += arg;
		}
		protected function setSkinColorVanae(pc:Creature):void
		{
			var colors:Array = ["pale violet","pale purple","pale blue","pale pink","pale orange","pale green","pale","pale gold"];
			pc.skinTone = RandomInCollection(colors);
		}
		protected function getVanaeAccentColor(pc:Creature):String
		{
			switch(pc.skinTone)
			{
				case "pale violet":
					return "luminous violet";
					break;
				case "pale purple":
					return "luminous purple";
					break;
				case "pale blue":
					return "luminous blue";
					break;
				case "pale pink":
					return "luminous pink";
					break;
				case "pale orange":
					return "luminous orange";
					break;
				case "pale green":
					return "luminous green";
					break;
				case "pale":
					return "luminous silver";
					break;
				case "pale gold":
					return "glowing gold";
					break;
				default:
					return "luminous violet";
			}
			return "ERROR.";
		}
		
		protected function hasMatchingVanaeSkinAccentColor(pc:Creature):Boolean
		{
			if (pc.skinAccent == getVanaeAccentColor(pc)) return true;
			return false;
		}
	}
}
