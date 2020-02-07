package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GLOBAL;
	import classes.Util.*;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.*;

	/**
	 * Feline transformative.
	 * 
	 * Have 2 layers of effects. At first, basic layer it is cosmetic transformative, granting "little kitty" appearance, lean and androgynous.
	 * 
	 * Second layer is "legacy code" from another transformative used as base. It is only accessible with improper bypass of nanobots safety protocols with not-actually-compatible control device. It grants cat-taur body, but much more practical than most tauric forms, with workarounds for most drawbacks of taur body. Based on chakat, but not exactly.
	 * 
	 * Legacy body features (some can be lore-only, it is not original transformative after all):
	 *   Quadripedal taur with semi-prehensile forelegs (technically, forelegs should be considered plantigrade with extra joint, but this would be overcomplication). Pawpads (on all 6 limbs) are soft and sensitive, but very tough.
	 *   All are herms (for more effecient reproduction) with internal balls and genital slit (for protection of vulnerable organs).
	 *   Very, very flexible - not exactly at snake level, but can rival any other mammal (mostly lore feat, but makes possible to wave away some "how the fuck taur can do this").
	 *   Neat musclemass and tone balance - they are strong, but they are first of all sentients, so physique was considered secondary stat for them during development.
	 *   Long and prehensile tongue (one more limb? handy!).
	 *   Long and prehensile tail (same reason).
	 *   Note about lactation: they are mammals by all means, but leaking precious nutrients all the time is barely a viable survival strategy. Also, having extra useless weight on chest is not very practical too. They have naturally flat chest unless lactating, and their lactation is easily induced just by prolonged enough nipples stimulation, so anyone can feed a baby when have to, and quickly subsides (not hardlocked though, player can grow breasts by any other way). Possible option - lactation is vanae-like, permanent, but without need to be milked regulary.
	 *   Lifespan 150-200 years without modern medicine, but this is purposive flaw to stimulate maintaining high technological level, since their lifespan with proper medicine is essentially unlimited, especially with help of cybernetic surgery, which can  improve "autonomous time" up to millenias.
	 *   Designed to be totally fine without clothes in most but harshest environments, so they have predisposition to nudism, but not to exhibitionism, nakedness itself just doesn't matter for them.
	 *   Have no hair, only fur on head.
	 * 
	 * Neural system specifics (mostly lore only):
	 *   Special racial feature: Mental Equilibrium. This is one of the "frontier species", and, as well as other of type, has it's attempt to create more stable community.
	 *   Very friendly (unless abused - they are far from being pacificts).
	 *   Highly resistant to drugs and poisons, including mind-affecting (maybe even to point of rejecting bimbofication drugs which would work for other races).
	 *   Have semi-electrical nervous system rather than fully chemical, so their reflexes are on par with ones of syntethics.
	 * 
	 * Possible gameplay effects:
	 *   Can't have personality score above 60 (being assholes without good reason is nearly physically painful for them).
	 *   Libido gain/loss bonus/penalty pushing towards 30 (friendly in all ways, but not to the point when it becomes problem).
	 *   Imbibing alcohol restores their energy without getting drunk (though would requre branch for all related scenes, but this could be not only one alcohol immune race).
	 *   Bonus to chemical-based lust damage resistance (pheromones and drugs), penalty to tease damage resistance, being damaged by foe reduces lust notably and grants stacking tease resistance until combat end (have hard times resisting pure teasers, but being physically attacked turns off greatly).
	 *   Exhibitionism is hardlocked on "don't care" as long as genitals have specific configuration.
	 *   Perk idea: Natural Armor. Can be shared with other races with tough natural defence. Resistance bonus to thermal damage (freeze/burn). Immune to effects of moderately harsh climate (on level with natives), and their pelts are unlikely to be damaged by minor enveiromental hazards (like Mhen'ga's spiked weeds).
	 *   Perk idea: Flexibility. Pretty much self explaining. Possibly scene variants. Possibly minor bonus to avoid attacks. Can be shared with other races, like Naleen.
	 *
	 * @author Etis
	 */
	public class Catnip extends ItemSlotClass
	{
		private var counter:int = 0;
		private var options:Array = [];
		
		public function Catnip(dataObject:Object=null)
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Catnip";
			//Regular name
			this.longName = "dose of catnip";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a medipen loaded with “Catnip”";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A new-gen designer transformative, featuring the new level of efficiency and consistency. Based on old frontier colonization species project, it causes the user to gain sleek, flexible and very animalistic feline form without any known side effects. No actual catnip included.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2000;
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
			counter = 0;
			options = [];
			clearOutput();
			if(target is PlayerCharacter) {
				output("Pressing the activation stud is all it will take. You hold the tip against your arm and brace yourself, pushing the button.");
				if (kGAMECLASS.flags["CATNIP_USED"] == undefined) {
					output(" A quiet-sounding ‘snick’ hits your ears, but nothing else. Did it even work? You look where pen touched your skin. There’s a tiny red mark and nothing else. The pen’s label displays the word ‘inactive’ in bold red text. It must have a built-in painkiller. Suddenly, your codex beeps responding to the connection request from injected nanobots.");
					
					output("\n\n<i>“Detected feedback-compatible Biosign Monitor device. Aborting automated route. Debug mode activated. The system is awaiting input. Please select a specific route or confirm default settings. Please note: targeted route is less effective than automated since it forces an override of the optimization algorithm.”</i>");
					
					kGAMECLASS.flags["CATNIP_USED"] = 1;
				}
				output("\n\n");
				routeMenu(target);
				return true;
			}
			//Not player!
			else
			{
				output(target.capitalA + target.short + " injects the Catnip to no effect.");
			}
			return false;
		}
		
		
		public function routeMenu(target:Creature, force:Boolean = false):void
		{
			author("Etis");
			
			var buttons:int = 1;
			var buffer:String = "";
			
			clearMenu();
			
			counter = 0;
			options = [];
			
			output("<u><b>Status report:</b></u>");
			
			if (!force) addButton(13, "Override", function():* { clearOutput(); routeMenu(target, true); }, null, "Override", "Enable override mode. The system would attempt to execute route without checking its availability.\nWarning: this menu is for authorized personnel only.\nWarning: bypassing of safety protocols is not advised, those functions are called unsafe for a reason.");
			else {
				output(" Status scan is bypassed.");
				addButton(13, "Safe", function():* { clearOutput(); routeMenu(target, false); }, null, "Safe", "Enable safe mode. The system would check route availability before executing it.");
			}
			
			addButton(14, "Abort", kGAMECLASS.generalInventoryMenu);
			
			buffer += "\nMinor body functions: ";
			if (routeGeneralAvailable(target) || force) {
				buffer += "<b>Route available</b>.";
				addButton(buttons++, "Minor", routeGeneral, target, "Minor", "Set of minor changes in body complexion.");
				options.push(routeGeneral);
			}
			else buffer += "Route blocked.";
			
			buffer += "\nEars: ";
			if (routeEarsAvailable(target) || force) {
				buffer += "<b>Route available</b>.";
				addButton(buttons++, "Ears", routeEars, target, "Ears", "Concentrate on ears.");
				options.push(routeEars);
			}
			else buffer += "Route blocked.";
			
			buffer += "\nTail: ";
			if (routeTailAvailable(target) || force) {
				buffer += ("<b>Route available</b>.");
				addButton(buttons++, "Tail", routeTail, target, "Tail", "Concentrate on tail.");
				options.push(routeTail);
			}
			else buffer += ("Route blocked.");
			
			buffer += ("\nGenitals: ");
			if (routeGenitalsAvailable(target) || force) {
				buffer += ("<b>Route available</b>.");
				addButton(buttons++, "Genitals", routeGenitals, target, "Genitals", "Concentrate on breasts and genitals.");
				options.push(routeGenitals);
			}
			else buffer += ("Route blocked.");
			
			buffer += ("\nEyes: ");
			if (routeEyesAvailable(target) || force) {
				buffer += ("<b>Route available</b>.");
				addButton(buttons++, "Eyes", routeEyes, target, "Eyes", "Concentrate on eyes.");
				if(target.hasTail(GLOBAL.TYPE_FELINE))
					options.push(routeEyes);
			}
			else buffer += ("Route blocked.");
			
			buffer += ("\nArms: ");
			if (routeArmsAvailable(target) || force) {
				buffer += ("<b>Route available</b>.");
				addButton(buttons++, "Arms", routeArms, target, "Arms", "Concentrate on arms.");
				if(target.hasTail(GLOBAL.TYPE_FELINE) && target.earType == GLOBAL.TYPE_FELINE)
					options.push(routeArms);
			}
			else buffer += ("Route blocked.");
			
			buffer += ("\nSkin: ");
			if (routeSkinAvailable(target) || force) {
				buffer += ("<b>Route available</b>.");
				addButton(buttons++, "Skin", routeSkin, target, "Skin", "Concentrate on skin.");
				if(target.hasTail(GLOBAL.TYPE_FELINE) && target.earType == GLOBAL.TYPE_FELINE)
					options.push(routeSkin);
			}
			else buffer += ("Route blocked.");
			
			buffer += ("\nLegs: ");
			if (routeLegsAvailable(target) && (target.legCount <= 2 && target.legCountUnlocked(2) || target.legCount >= 3 && target.legCountUnlocked(4) || target.legCount >= 5 && target.legCountUnlocked(6)) || force) {
				buffer += ("<b>Route available</b>.");
				if (target.legCount <= 2 && (target.legCount == 2 || target.legCountUnlocked(2)) || force)
				{
					addButton(buttons++, "Legs", routeLegs, target, "Legs", "Concentrate on legs.");
					if(target.armType == GLOBAL.TYPE_FELINE)
						options.push(routeLegs);
				}
				else
				{
					buffer += (" Please note, tauric stances are legacy and not included into default route.");
					if (target.legCount == 2 || target.legCountUnlocked(2))
					{
						addButton(buttons++, "2 Legs", routeLegs, target, "Two Legs", "Concentrate on legs. Default bipedal humanoid stance route.");
						if(target.armType == GLOBAL.TYPE_FELINE)
							options.push(routeLegs);
					}
					if(target.legCount == 4 || target.legCountUnlocked(4))
						addButton(buttons++, "4 Legs", routeLegs4, target, "Four Legs", "Concentrate on legs. Legacy quadripedal tauric stance route.");
					if(target.legCount >= 5 && (target.legCount == 6 || target.legCountUnlocked(6)))
						addButton(buttons++, "6 Legs", routeLegs6, target, "Six Legs", "Concentrate on legs. Hexapedal version of legacy tauric stance route.");
				}
			}
			else buffer += ("Route blocked.");
			
			buffer += ("\nFace: ");
			if (routeFaceAvailable(target) || force) {
				buffer += ("<b>Route available</b>.");
				addButton(buttons++, "Face", routeFace, target, "Face", "Concentrate on face.");
				if(target.skinType == GLOBAL.SKIN_TYPE_FUR && target.earType == GLOBAL.TYPE_FELINE && target.eyeType == GLOBAL.TYPE_FELINE)
					options.push(routeFace);
			}
			else buffer += ("Route blocked.");
			
			if (options.length > 0)
				addButton(0, "Default", routeDefault, target, "Default Route", "Let it detect and execute most efficient route.");
				
			if (!force) output(buffer);
		}
		
		private function routeGeneralAvailable(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			
			// should get rid of facial hair also
			if (target.thickness > 20 && target.thicknessUnlocked(target.thickness - 10)) changes++;
			if (Math.round(target.femininity) != 50 && target.femininityUnlocked(Math.round(target.femininity) + (target.femininity > 50 ? -1 : 1))) changes++;
			
			if (Math.round(target.femininity) == 50 && !target.hasPerk("Androgyny")) changes++;
			
			var buttLimit:Number = 2;
			if (target.hasVagina()) buttLimit = 4;
			if (target.buttRating() > buttLimit && target.buttRatingUnlocked(target.buttRating() - 1)) changes++;
			
			var hipLimit:Number = 2;
			if (target.hasVagina()) hipLimit = 4;
			if (target.hipRating() > hipLimit && target.hipRatingUnlocked(target.hipRating() - 1)) changes++;
			
			if (target.elasticity < (target.hasPerk("Elasticity") ? 4 : 3)) changes++;
			if (target.ass.minLooseness > 1) changes++;
			
			return changes > 0;
		}
		
		private function routeGeneral(target:Creature, usingCreature:Creature = null):void
		{
			if(counter <= 1) clearOutput();
			output("Executing route: body complexion.");
			var changes:int = 0;
			
			// decrease thicknes
			if (target.thickness >= 20 && modThickness(target, 20, 10, false))
			{
				output("\n\nSomething is shifting inside you, and you suddenly feel you can move with less effort. <b>It looks like you lose some weight!</b> ");
				changes++;
				
				// increase definition as side effect only
				if (target.tone <= 65 && modTone(target, 65, 10, false))
				{
					output("It doesn’t look like your muscles are affected, though - if anything, they are even more defined now.");
				}
			}
			
			var hipLimit:Number = 2;
			if (target.hasVagina()) hipLimit = 3;
			if (target.hipRating() > hipLimit && target.hipRatingUnlocked(target.hipRating() - 1))
			{
				output("\n\nA sudden tightness overtakes your midsection. A searing pain flashes through you, as though your bones themselves were changing. Your hips reshape themselves, becoming more slender, leaving you <b>a little less curvy.</b>");
				if (target.hipRating() >= hipLimit + 9 && target.hipRatingUnlocked(target.hipRating() - 1)) target.hipRating( -1);
				if (target.hipRating() >= hipLimit + 6 && target.hipRatingUnlocked(target.hipRating() - 1)) target.hipRating( -1);
				if (target.hipRating() >= hipLimit + 4 && target.hipRatingUnlocked(target.hipRating() - 1)) target.hipRating( -1);
				if (target.hipRatingUnlocked(target.hipRating() - 1)) target.hipRating( -1);
				changes++;
			}
			
			var buttLimit:Number = 2;
			if (target.hasVagina()) buttLimit = 3;
			if (target.buttRating() > buttLimit && target.buttRatingUnlocked(target.buttRating() - 1))
			{
				output("\n\nYour butt all of a sudden feels tight, as though you were wearing a pair of pants two sizes too small. You wince and grip your buttocks, and feel it losing mass under your hand. After a moment, you’re left with a much <b>smaller, less curvy butt.</b>");
				if (target.buttRating() >= buttLimit + 9 && target.buttRatingUnlocked(target.buttRating() - 1)) target.buttRating( -1);
				if (target.buttRating() >= buttLimit + 6 && target.buttRatingUnlocked(target.buttRating() - 1)) target.buttRating( -1);
				if (target.buttRating() >= buttLimit + 4 && target.buttRatingUnlocked(target.buttRating() - 1)) target.buttRating( -1);
				if (target.buttRatingUnlocked(target.buttRating() - 1)) target.buttRating( -1);
				changes++;
			}
			
			if (modFem(target, 50, 15, false))
			{
				output("\n\nYou feel a slight change in your facial structure. When they finish, <b>your gender traits are less pronounced</b>!");
				changes++;
			}
			
			// target is thin, animalistic lips with high overall feminity, because thick lips on animalistic muzzle are grotesque
			if (target.lipRating() > 0 && target.lipModUnlocked(target.lipMod - 1))
			{
				output("\n\nYou feel your [pc.lips] pucker reflexively, relaxing only to feel thinner and less pouty than before. <b>Your lips are less pronounced.</b>");
				changes++;
				target.lipMod--;
				if (target.lipRating() > 2 && target.lipModUnlocked(target.lipMod - 1)) target.lipMod--;
			}
			
			// hit cap and still going up! changed this one to work differently from CoC, it unties face description from femininity stat, so you can use femininity to change gender aligment without having feminine face - you can't really recognize gender from animalistic muzzle!
			if (Math.round(target.femininity) == 50 && target.lipRating() <= 0 && !target.hasPerk("Androgyny")) {
				output("\n\nYour [pc.face] is now very confusing — it would work on either a male or a female. And, according to your Codex, your microsurgeons are now attuned to keep it so.");
				target.createPerk("Androgyny", 0, 0, 0, 0, "Your face is always androgynous.");
				output("\n\n(<b>Perk Gained: Androgyny</b>)");
			}
			
			//elasticity+
			var elasticityLimit:Number = target.hasPerk("Elasticity") ? 4 : 3;
			if (target.elasticity < elasticityLimit)
			{
				output("\n\nYou shudder violently as waves of pleasure suddenly shoot up in your [pc.vagOrAss]. You guide your fingers inside, finding that <b>you can stretch your insides more than ever before without discomfort</b> despite unaltered tightness.");
				target.changeLust(10 + rand(5));
				target.elasticity += 1;
				if (target.elasticity > elasticityLimit) target.elasticity = elasticityLimit;
				changes++;
			}
			
			// ass looseness-
			else if(target.ass.minLooseness > 1 || target.ass.wetnessRaw > 1) // no function for ass lock?
			{
				output("\n\nYou feel a rumbling in your gut and a strange half-pleasure sensation spreading up from your [pc.asshole]. <b>After giving your backdoor an experimental poke, your find it ");
				
				kGAMECLASS.clearList();
				if (target.ass.minLooseness > 1) {
					kGAMECLASS.addToList("notably tighter")
					target.ass.minLooseness--;
					if (target.ass.minLooseness < 1) target.ass.minLooseness = 1;
					if (target.ass.looseness() > target.ass.minLooseness) target.ass.looseness(target.ass.minLooseness, true);
				}
				if (target.ass.wetnessRaw > 1) {
					kGAMECLASS.addToList("significantly less lubricated")
					target.ass.wetnessRaw--;
					if (target.ass.wetnessRaw < 1) target.ass.wetnessRaw = 1;
				}
				output(kGAMECLASS.formatList() + "</b> than it was before!");
				
				target.changeLust(10+rand(4));
				changes++;
			}
			
			// perks!
			if(target.hasTail(GLOBAL.TYPE_FELINE) && target.legType == GLOBAL.TYPE_FELINE && target.armType == GLOBAL.TYPE_FELINE && target.earType == GLOBAL.TYPE_FELINE && !target.hasPerk("Flexibility"))
			{
				output("\n\nYou feel something odd in your joints. After some experimental stretching you’ve found yourself able to fold in entirely unnatural ways - you can effortlessly touch the base of your tail with your nose, folding both forward and backward alike! You already have kinky ideas of putting this into some use.");
				output("\n\n(<b>Perk Gained: Flexibility</b> - You can bend and stretch more than most other creatures.)");
				target.createPerk("Flexibility", 0, 0, 0, 0, "You can bend and stretch more easily than normal.");
				target.changeLust(20+rand(10));
				changes++;
			}
			
			afterTF(target);
		}
		
		private function routeGenitalsAvailable(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			
			var maxSize:Number = 4; // big dicks aren't really what cats are about
			if (target.isTaur()) maxSize += 8; // unless we are talking about cat-taurs, ofc
			if (target.hasPerk("Hung")) maxSize *= 1.5; // 6/18
			if (target.hasPerk("Mini")) maxSize *= 0.75; // 3/9
			
			// Get a feline dick and change it's size towards target
			for(var x:int = 0; x < target.cockTotal(); x++)
				if (
					(
						(
							target.cocks[x].cType != GLOBAL.TYPE_FELINE
							|| !target.hasCockFlag(GLOBAL.FLAG_TAPERED, x)
							|| !target.hasCockFlag(GLOBAL.FLAG_SHEATHED, x)
							|| !target.hasCockFlag(GLOBAL.FLAG_NUBBY, x)
						)
						&& target.cockTypeUnlocked(x, GLOBAL.TYPE_FELINE)
					)
					|| (target.cocks[x].cLength() != maxSize && target.cockLengthUnlocked(x, maxSize))
				) changes++;
			
			for (x = 0; x < target.totalVaginas(); x++)
				if (/*target.vaginas[x].vaginaColor != "pink" ||*/ 
					target.vaginas[x].minLooseness > 1 && target.loosenessUnlocked(x, target.vaginas[x].minLooseness - 1)
					|| target.vaginas[x].wetnessRaw > 1 && target.wetnessUnlocked(x, target.vaginas[x].wetnessRaw - 1)
					) changes++;
				else if(target.vaginas[x].type != GLOBAL.TYPE_FELINE && target.vaginaTypeUnlocked(x, GLOBAL.TYPE_FELINE)) changes++;
			
			//Ball shrinkage to 1.5 inch
			var limit:Number = 1.5;
			if (target.hasPerk("Bulgy")) limit = 2.5;
			if (target.isTaur()) limit += 6;
			if (target.balls > 0 && target.ballSizeRaw > limit) changes++;
			// uniball if small balls
			if (!target.hasStatusEffect("Uniball") && target.balls > 0 && target.ballSizeRaw <= limit) changes++;
			
			maxSize = target.hasVagina() ? 2 : 0;
			if (target.canLactate() && maxSize < 1) maxSize = 1; // for milky pervs leave at least A-cups
			
			for (x = 0; x < target.breastRows.length; x++) {
				if (target.breastRows[x].breastRatingRaw > maxSize && target.breastRatingUnlocked(x, maxSize)) changes++;
				if (target.breastRows[x].nippleType != GLOBAL.NIPPLE_TYPE_INVERTED && target.nippleTypeUnlocked(x, GLOBAL.NIPPLE_TYPE_INVERTED)) changes++
			}
			
			return changes > 0;
		}
		
		private function routeGenitals(target:Creature, usingCreature:Creature = null):void
		{
			if(counter <= 1) clearOutput();
			output("Executing route: genitals.");
			var changes:int = 0;
			
			//Feminine TFs
			for(var x:int = 0; x < target.totalVaginas(); x++)
			{
				if(target.vaginas[x].vaginaColor != "pink" || target.vaginas[x].type != GLOBAL.TYPE_FELINE && target.vaginaTypeUnlocked(x, GLOBAL.TYPE_FELINE))
				{
					output("\n\nA tickling, teasing sensation flutters across your nether-lips");
					if(target.totalVaginas() > 1)
					{
						output(" - ");
						if(target.totalVaginas() == 2) output("both sets");
						else output("every single set of them");
					}
					output(", leaving you intensely aware of your movements.");
					if (target.genitalSpot == 2) {
						output(" You use your Codex to check what’s happening");
					}
					else {
						output(" You peek down there to see what’s going on");
						if (!target.isCrotchExposed()) output(", taking special care to move your [pc.lowerGarments] out of the way");
					}
					output(". Your <b>[pc.vagina " + x + "] is now ");
					
					if (target.vaginas[x].type != GLOBAL.TYPE_FELINE && target.vaginaTypeUnlocked(x, GLOBAL.TYPE_FELINE)) {
						output("small, pink, almost featureless hole with vestigial labia");
						if (target.hasFur()) output(", barely visible under your " + target.skinFurScales(true));
					}
					else if (target.vaginas[x].vaginaColor != "pink")
						output("pink")
					output("</b>!");
					
					if (target.vaginas[x].type != GLOBAL.TYPE_FELINE && target.vaginaTypeUnlocked(x, GLOBAL.TYPE_FELINE)) {
						target.shiftVagina(x, GLOBAL.TYPE_FELINE);
					}
					target.vaginas[x].vaginaColor = "pink";
					changes++;
				}
				
				// tighten to 1 and dry up to 2
				if (target.vaginas[x].minLooseness > 1 && target.loosenessUnlocked(x, target.vaginas[x].minLooseness - 1) || target.vaginas[x].wetnessRaw > 2 && target.wetnessUnlocked(x, target.vaginas[x].wetnessRaw - 1))
				{
					output("\n\nYou feel a strange pleasure sensation spreading up from your [pc.vagina " + x + "]. <b>After giving your muff an experimental poke, you find it ");
					
					kGAMECLASS.clearList();
					if (target.vaginas[x].minLooseness > 1 && target.loosenessUnlocked(x, target.vaginas[x].minLooseness - 1)) {
						kGAMECLASS.addToList("much tighter")
						target.vaginas[x].minLooseness--;
						if (target.vaginas[x].minLooseness < 1) target.vaginas[x].minLooseness = 1;
						if (target.looseness(x) > target.vaginas[x].minLooseness) target.vaginas[x].looseness(target.vaginas[x].minLooseness, true);
					}
					if (target.vaginas[x].wetnessRaw > 1 && target.wetnessUnlocked(x, target.vaginas[x].wetnessRaw - 1)) {
						kGAMECLASS.addToList("significantly less wet")
						target.vaginas[x].wetnessRaw--;
						if (target.vaginas[x].wetnessRaw < 1) target.vaginas[x].wetnessRaw = 1;
					}
					output(kGAMECLASS.formatList() + "</b> than it was before!");
					
					target.changeLust(10 + rand(4));
					changes++;
				}
				
				if (changes > 0) break; // only change one vagina per dose
			}
			
			var maxSize:int = target.hasVagina() ? 2 : 0;
			if (target.canLactate() && maxSize < 1) maxSize = 1; // for milky pervs leave at least A-cups
			//if (target.isTaur() && target.isHerm()) maxSize += 2; // chakat legacy, disabled, since not actually lore friendly - my version is quite flat
			
			//Breasts down to B-cup/flats, and, unlike Nepeta, you won't get any - this is animalistic TF, and animals, unlike that freaky homos, normally are flat unless lactating
			if(target.breastRows.length > 0 && target.breastRows[0].breastRatingRaw > maxSize && target.breastRatingUnlocked(0, maxSize))
			{
				var tittyDrop:int = 1 + rand(target.breastRows[0].breastRatingRaw / 5 + 1) + target.breastRows[0].breastRatingRaw / 5;
				if (tittyDrop > target.breastRows[0].breastRatingRaw - maxSize) tittyDrop = target.breastRows[0].breastRatingRaw - maxSize;
				
				if (target.breastRatingUnlocked(0, target.breastRows[0].breastRatingRaw - tittyDrop))
				{
					output("\n\nTipping backward, you flail your arms frantically to keep your balance. Once you right, you realize what happened; <b>your [pc.chest] have lost a bit of weight, dropping you down to " );
					target.breastRows[0].breastRatingRaw -= tittyDrop;
					output((target.breastRows[0].breastRating(0) > 0 ? target.breastCup(0) : "flats") + ". </b>");
					changes++;
					//Other rows, go!
					var bonusRowsTFed:int = 0;
					for(x = 1; x < target.bRows(); x++)
					{
						if(target.breastRows[x].breastRatingRaw > maxSize)
						{
							//Figure out how much dat row will change!
							tittyDrop = 1 + rand(target.breastRows[x].breastRatingRaw / 5 + 1) + target.breastRows[x].breastRatingRaw / 5;
							if (tittyDrop > target.breastRows[x].breastRatingRaw - maxSize) tittyDrop = target.breastRows[x].breastRatingRaw - maxSize;
							
							//If that row is unlocked!
							if (target.breastRatingUnlocked(x, target.breastRows[x].breastRatingRaw - tittyDrop))
							{
								bonusRowsTFed++;
								target.breastRows[x].breastRatingRaw -= tittyDrop;
								if (target.breastRows[x].breastRatingRaw > target.breastRows[x - 1].breastRatingRaw) target.breastRows[x].breastRatingRaw = target.breastRows[x - 1].breastRatingRaw;
							}
						}
					}
					if(bonusRowsTFed == 1) output(" Your other row of breasts shrinks a bit as well.");
					else if(bonusRowsTFed > 1) output(" Your other breasts shrink a bit as well.");
				}
			}
			
			// inverted nipples
			var nipLocked:Boolean = false;
			var nipChanged:Boolean = false;
			for (x = 0; x < target.breastRows.length; x++) {
				
				if (target.breastRows[x].nippleType != GLOBAL.NIPPLE_TYPE_INVERTED) {
					if (target.nippleTypeUnlocked(x, GLOBAL.NIPPLE_TYPE_INVERTED)) {
						nipChanged = true;
						target.breastRows[x].nippleType = GLOBAL.NIPPLE_TYPE_INVERTED;
					} else nipLocked = true;
				}
			}
			if(nipChanged) {
				output("\n\nAn unpleasant twinge of nerves brings your attention to your nipples.");
				if(!target.isChestExposed())
					output(" You quickly undress to investigate...");
				output(" They go numb as a slick goo engulfs them. A few tingles replace the feeling, and you reflexively wipe the gunk away to reveal that your nipples are gone, but you find what look like pinched holes in their place. Momentary panic subsides when a bit of rubbing has them poking out. <b>Your nipples are now inverted!</b>");
				if(nipLocked) output(" At least, part of them are.");
				changes++;
			}
			else if(nipLocked) output("\n\n" + target.nippleTypeLockedMessage());
			
			//Masculine TFs
			//Get a feline dick
			maxSize = 4; // big dicks aren't really what cats are about
			if (target.isTaur()) maxSize += 8; // unless we are talking about cat-taurs, ofc... who am I kidding, foot long is considered small here
			if (target.hasPerk("Hung")) maxSize *= 1.5; // 6/18... okay, at least something not to be embarassed with...
			if (target.hasPerk("Mini")) maxSize *= 0.75; // 3/9... well, fetish for someone too, right?
			
			for(x = 0; x < target.cockTotal(); x++)
			{
				// if type is not feline or lacks flags try major tf
				if(target.cocks[x].cType != GLOBAL.TYPE_FELINE || !target.hasCockFlag(GLOBAL.FLAG_TAPERED, x) || !target.hasCockFlag(GLOBAL.FLAG_SHEATHED, x) || !target.hasCockFlag(GLOBAL.FLAG_NUBBY, x))
				{
					if (target.cockTypeUnlocked(x, GLOBAL.TYPE_FELINE))
					{
						output("\n\nYour [pc.cock " + x + "] throbs suddenly ");
						if (target.hasCockFlag(GLOBAL.FLAG_SHEATHED, x)) output("in it’s sheath");
						else if (target.hasStatusEffect("Genital Slit")) output("in it’s slit");
						else if (!target.isCrotchExposed()) output("beneath your [pc.lowerGarments]");
						else if(target.legCount == 1) output("on your [pc.leg]");
						else output("between your [pc.legs]");
						output(" and begins to transform, drooling a river of pre from its engorged slit. You double over in a sick twist of pain and pleasure");
						if(target.cocks[x].cockColor != "pink")
							output(" as the flesh of your cock shifts color to a pink hue");
						if(!target.hasCockFlag(GLOBAL.FLAG_TAPERED, x)) output(", the skin melding strangely into a long, pointed shape, until the tip is barely wide enough to accommodate your urethra");
						output(".");
						
						if(!target.hasCockFlag(GLOBAL.FLAG_NUBBY, x))
							output(" Barbs begin to sprout from its flesh, if you can call them barbs - despite the wicked look, they are not sharp enough to actually bruise. They start out thick around the base and shrink towards the tip. The smallest are barely visible. They are angled towards you, so pulling out now should be even more intense than pushing in.");
						
						//if cock was more than max size:
						if(target.cockLengthUnlocked(x, maxSize)) {
							if(target.cocks[x].cLengthRaw > maxSize) {
								output(" Your prick shrinks. Well, big dicks aren’t really what cats are known for, and you are quite sure that added stimulation from your barbs can easily make up for it.");
								target.cocks[x].cLengthRaw = Math.round(target.cocks[x].cLengthRaw - Math.min(target.cocks[x].cLength() - maxSize, target.cocks[x].cLengthRaw / 5 + 1 + rand(target.cocks[x].cLengthRaw / 5 + 2)));
							}
							else if(target.cocks[x].cLengthRaw < maxSize) {
								output(" Your prick grows longer! Looks like it was small even for a cat...");
								target.cocks[x].cLengthRaw = Math.round(target.cocks[x].cLengthRaw + Math.min(maxSize - target.cocks[x].cLength(), target.cocks[x].cLengthRaw / 5 + 1 + rand(target.cocks[x].cLengthRaw / 5 + 2)));
							}
							
							output(" It settles on a new length of <b>" + num2Text(int(target.cocks[x].cLength())) + " inches</b>.");
						}
						
						if (!target.hasCockFlag(GLOBAL.FLAG_SHEATHED, x) && !target.hasStatusEffect("Genital Slit"))
							output(" Finally, a sheath begins forming around your cock’s base, tightening and pulling your cock inside its depths.");
						
						output("\n\nYou spend a few moments collecting yourself, cleaning the spunk off your <b>" + (target.cocks[x].cType != GLOBAL.TYPE_FELINE ? "new" : "improved") + " kitty pecker</b>.");
						target.changeLust(20 + rand(20));
						changes++;
						// target.shiftCock(x,GLOBAL.TYPE_FELINE); // not using it since it default function is for kaithrits
						target.cocks[x].cType = GLOBAL.TYPE_FELINE;
						target.cocks[x].cockColor = "pink";
						target.cocks[x].knotMultiplier = 1;
						target.cocks[x].cockFlags = [GLOBAL.FLAG_NUBBY, GLOBAL.FLAG_TAPERED, GLOBAL.FLAG_SHEATHED];
						break; // only one major cock TF for dose
					} else {
						output(target.cockTypeLockedMessage());
					}
				}
				// if already right type try only size change
				else if(target.cockLengthUnlocked(x, maxSize) && target.cocks[x].cLength() != maxSize)
				{
					output("\n\nYour [pc.cock " + x + "] tingles, making your groin feel a little lighter. ");
					
					if(target.cocks[x].cLengthRaw > maxSize) {
						output("It <b>dwindles in size</b>, shrinking to its new length of <b>");
						target.cocks[x].cLengthRaw = Math.round(target.cocks[x].cLengthRaw - Math.min(target.cocks[x].cLength() - maxSize, target.cocks[x].cLengthRaw / 5 + 1 + rand(target.cocks[x].cLengthRaw / 5 + 2)));
						output(num2Text(int(target.cocks[x].cLength())) + "</b> inches. Well, big dicks aren’t really what cats are known for");
						if(target.hasCockFlag(GLOBAL.FLAG_NUBBY, x)) output(", and you are quite sure that added stimulation from your barbs can easily make up for it");
						output(".");
					}
					else if(target.cocks[x].cLengthRaw < maxSize) {
						output(" Your prick <b>grows longer</b>, extending to its new size of <b>");
						target.cocks[x].cLengthRaw = Math.round(target.cocks[x].cLengthRaw + Math.min(maxSize - target.cocks[x].cLength(), target.cocks[x].cLengthRaw / 5 + 1 + rand(target.cocks[x].cLengthRaw / 5 + 2)));
						output(num2Text(int(target.cocks[x].cLength())) + "</b> inches. It looks like it was small even for a cat...");
					}
					changes++;
					target.changeLust(10 + rand(5));
				}
			}
			
			//Ball shrinkage to 1.5 inch
			var limit:Number = 1.5;
			if (target.hasPerk("Bulgy")) limit = 2.5;
			if (target.isTaur()) limit += 6;
			if (target.balls > 0 && target.ballSizeRaw > limit)
			{
				var newSize:Number = target.ballSizeRaw;
				newSize -= Math.min(target.ballSizeRaw - limit, formatFloat((target.ballSizeRaw - limit) / 10 + 1 + rand(2), 2));
				if (newSize < limit) newSize = limit;
				
				if (target.ballSizeUnlocked(newSize))
				{
					output("\n\nSomething pinches your [pc.balls] through your [pc.sack], but you can’t seem to see anything that could possibly be hurting you down there. That riddle is solved when ");
					if(target.balls > 1) output("they start");
					else output("it starts");
					output(" to diminish before your very eyes, losing mass while your [pc.sack] ");
					
					if(target.hasStatusEffect("Uniball"))
					{
						output("keeps tight around ");
						if(target.balls == 1) output("it");
						else output("them");
					}
					else
					{
						output("keeps pace with ");
						if(target.balls == 1) output("it");
						else output("them");
					}
					if (target.hasStatusEffect("Uniball")) output(" like a vacuum-sealed bag");
					target.ballSizeRaw = newSize;
					if (target.ballDiameter() > 1) output(". <b>You’ve got " + target.ballsDescript(false, true) + " now.</b>");
					else output(". <b>Your balls are relatively small now.</b>");
					
					changes++;
				}
				else if (!target.ballSizeUnlocked(newSize))
				{
					output(target.ballSizeLockedMessage());
				}
			}
			else if(!target.hasStatusEffect("Uniball") && target.balls > 0)
			{
				output("\n\nYou gasp and bunch your fists as what feels like a soft vice clamps down on your balls, pushing them upwards and inwards. It’s not painful exactly but whatever is happening to them is intense enough for sweat to stand out on your brow. When the sensation dissipates somewhat, you slide a hand downstairs uncertainly. <b>You’ve grown a tight-fitting pouch</b> which holds your [pc.balls] up to the back of your thighs.");
				target.changeLust(10);
				target.createStatusEffect("Uniball", 0, 0, 0, 0, true, "", "", false, 0);
				changes++;
			}
			
			// Chakat surprise, can only happen when you overdose with safety off.
			if (changes == 0)
			{
				output(" Exception: Route has no targets available. Requesting instructions from the monitor... Exception: protocol not supported. Fallback route found, executing...");
				
				var surprise:Boolean = false;
				if (!target.hasCock() && target.createCockUnlocked())
				{
					output("\n\nA swollen lump of flesh appears ");
					if(target.balls > 0) output("right above your [pc.sack]");
					else if(target.hasVagina()) output("right above your [pc.vaginas]");
					else output("in the center of your crotch");
					output(". It feels achy and a little painful but very, very sensitive, and it’s getting bigger with alarming rapidity. The little knot is sticking an inch out past your [pc.skinFurScales], turning glossy and red as it does. You touch its tip and moan, assaulted by a pleasure you barely understand, watching the bulge stretch out another inch in eager response. In seconds, you’re rubbing and fondling it, coaxing more and more length from your crotch until ");
					target.createCock();
					target.shiftCock(0, GLOBAL.TYPE_FELINE);
					target.cocks[0].cLengthRaw = 12;
					if (target.hasPerk("Hung")) target.cocks[0].cLengthRaw *= 1.5;
					if (target.hasPerk("Mini")) target.cocks[0].cLengthRaw *= 0.75;
					output("<b>your [pc.hand] is wrapped around a " + num2Text(int(target.cocks[0].cLength())) + "-inch long [pc.cockNounSimple 0].</b>");
					changes++;
					surprise = true;
				}
				
				// since it is "legacy code" of species designed for frontier, can't allow vilnerable organs to dangle free, especially since taurs can't quite defend themselves from behind
				// change anatomy to internal without harming production
				if (target.balls > 0 && target.ballsUnlocked(0))
				{
					output("\n\nA flash of sickening sensation ripples through your [pc.sack], and you can feel the skin pulling upward. The discomfort rises as you close your eyes and realize with some trepidation that your testicle");
					if (target.balls > 1) output("s are");
					else output(" is");
					output(" retreating upward, pulling into your body.");
					
					if (target.balls > 1) output(" They shift");
					else output(" It shifts");
					output(" around, your internal anatomy rearranging to fit your new... configuration. Your testicle");
					if (target.balls > 1) output("s settle");
					else output(" settles");
					output(" in somewhere just above your dick, and all that’s left beneath is a smooth patch of [pc.skinFurScales]. No one would ever know you had balls.");
					
					target.makeBallsInternal();
					
					changes++;
					surprise = true;
				}
				
				if (!target.hasVagina() && target.createVaginaUnlocked())
				{
					output("\n\nSweat beads on your suddenly overheated brow. Your heart is pounding, and the air seems obscenely humid. Groaning in discomfort, you press your moist palms against your [pc.belly], feeling your body temperature rise even higher. Swaying uncertainly, you sink to the ground, confused and uncomfortable.");
					output("\n\nThen, you feel it - an unmistakable, pleasant wetness. It isn’t your seemingly omnipresent sweat either, but something else, something altogether slipperier. New-grown nerves revel in your new, slickened state, unveiling a whole new palette of exquisite feelings, revealing a fleshy, sensitive crease ");
					if(target.balls > 0) output("just behind your [pc.balls]");
					else if (target.hasCock()) output("just underneath your [pc.cocks]");
					else output("in your crotch");
					output(". Gingerly, you probe your blossoming vagina. It rewards you with an answering burst of hot, wet ecstasy.");
					output("\n\nFeeling much better, you gingerly remove your [pc.girlCumNoun]-soaked digits from yourself and give the feminine addition a serious look.");
					
					target.createVagina();
					target.shiftVagina(0, GLOBAL.TYPE_FELINE);
					target.clitLength = .25;
					target.vaginas[0].vaginaColor = "pink";
					target.vaginas[0].bonusCapacity = 100; // and don't forget that elasticity gains
					target.vaginas[0].hymen = false; // this is designed species, no useless, bad design shit here - comes all ready!
					output(" <b>You’ve got a pretty, pink little pussy. </b> You’ll have to spend some quality time with it soon.");
					
					changes++;
					surprise = true;
				}
				
				// since it is "legacy code" of species designed for frontier, gotta get good protection for vulnerable organs!
				if (target.balls == 0 && target.hasGenitals() && !target.hasStatusEffect("Genital Slit"))
				{
					output("\n\nAn odd sensation overtakes you. Your entire body shivers, as flesh is rippling around your [pc.crotch], forming a new... slit? After some experiments with internal muscles, you’ve found that you can pull your genitals in and push them out at will.");
					if(target.hasCock() && target.hasFullSheaths()) output(" Strangely enough, you still have an animalistic sheath, that of a reptile.");
					output(" Skin of your new folds are surprisingly taut when your genitals are retracted - looks like you have some decent protection against low blows from now on!");
					output(" <b>Your genitals are now hidden inside a protective slit.</b>");
					target.createStatusEffect("Genital Slit");
					changes++;
					surprise = true;
				}
				
				if(surprise) output("\n\nWhat the hell? Looks like bypassing safety is not always a good idea... Well, this isn’t the worst thing which can happen. At least this surprise is not really unpleasant.");
			}
			
			afterTF(target);
		}
		
		private function routeTailAvailable(target:Creature, usingCreature:Creature = null):Boolean
		{
			return !target.hasTail(GLOBAL.TYPE_FELINE) && (target.tailTypeUnlocked(GLOBAL.TYPE_FELINE) || target.hasParasiteTail()); 
		}
		
		private function routeTail(target:Creature, usingCreature:Creature = null):void
		{
			if(counter <= 1) clearOutput();
			output("Executing route: tail.");
			var changes:int = 0;
			
			//Grow feline tail. One tail, since this is not exactly Kaithrit TF. But will keep second Kaithrit tail, if you already have it.
			if(!target.hasTail(GLOBAL.TYPE_FELINE))
			{
				if (target.tailTypeUnlocked(GLOBAL.TYPE_FELINE) || target.hasParasiteTail())
				{
					// If PC had a tail before:
					if(target.tailCount == 1) output("\n\nYou feel something itching on your [pc.tail]. Twisting around, you watch in a mix of horror and excitement as [pc.furColor] bristles, the beginnings of a thin coat of fur, sprout up across the length of your reforming posterior appendage. It starts curling and twisting as the change completes, leaving you with a <b>feline tail.</b>");
					//Multitails
					else if(target.tailCount > 1) output("\n\nYour [pc.tails] knot together, torturing you with brief convulsions. A kind of numb heat spreads through them, forcing you to twist about for a visual inspection. They’re merging together into a single, narrow entity. The flesh crawls eerily, as it assumes its new shape. Hairs sprout out of it while you watch, thickening into a coat of [pc.furColor] fur. <b>Your [pc.tails] have combined into a single feline tail.</b>");
					// If PC is tailless peasant:
					else
					{
						output("\n\nOuch! A knot of discomfort forms just above your [pc.butt] as if it had suffered a nasty sting or bite, but no such injury occurred. You twist for a look at it");
						if(!target.isAssExposed()) output(", peeling back your [pc.underGarments]");
						output(". There’s a raised, irritated lump there, and it’s getting bigger. Wiggling slightly, it extends as new bones form within it, gently wagging as it lengthens. You’re growing a tail! Fine hairs sprout on its [pc.skin], giving it a distinctly feline cast. When it finishes growing, it’s long enough to begin curling and twisting vigorously; <b>you’ve obviously gained a feline tail.</b>");
					}
					
					var hasTailCock:Boolean = target.hasTailCock();
					var hasTailCunt:Boolean = target.hasTailCunt();
					
					target.clearTailFlags();
					if (hasTailCock)
					{
						target.tailGenitalColor = "pink";
						target.tailGenitalArg = GLOBAL.TYPE_FELINE;
						target.tailGenital = GLOBAL.TAIL_GENITAL_COCK;
						target.addTailFlag(GLOBAL.FLAG_TAILCOCK); // that's a hell load of flags...
						if (hasTailCunt) target.addTailFlag(GLOBAL.FLAG_TAILCUNT); // Since I have no real idea how combo version should work, I also don't know how to fork it properly, so let's silently apply flag
						target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						target.addTailFlag(GLOBAL.FLAG_NUBBY); // not really sure how it should be actually handled
						target.addTailFlag(GLOBAL.FLAG_TAPERED);
						target.addTailFlag(GLOBAL.FLAG_SHEATHED);
						output(" The tip of your tail feels strange. After some probing, you’ve found your tail genitalia still present, but totally unnoticeable under a furry sheath when not aroused.");
						if(target.hasParasiteTail()) output(" And much less prone to act by itself as well.");
					}
					else if (hasTailCunt)
					{
						target.tailGenitalColor = "pink";
						target.tailGenitalArg = GLOBAL.TYPE_FELINE;
						target.tailGenital = GLOBAL.TAIL_GENITAL_VAGINA;
						target.addTailFlag(GLOBAL.FLAG_TAILCUNT);
						target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
						target.addTailFlag(GLOBAL.FLAG_SHEATHED);
						output(" The tip of your tail feels strange. After some probing, you’ve found your tail genitalia still present, but totally unnoticeable when not aroused.");
						if(target.hasParasiteTail()) output(" And much less prone to act by itself as well.");
					}
					
					kGAMECLASS.flags["CUNT_TAIL_PREGNANT_TIMER"] = undefined;
					kGAMECLASS.flags["DAYS_SINCE_FED_CUNT_TAIL"] = undefined;
					
					target.tailCount = 1;
					target.tailType = GLOBAL.TYPE_FELINE;
					target.addTailFlag(GLOBAL.FLAG_LONG);
					target.addTailFlag(GLOBAL.FLAG_FURRED);
					if (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY)) target.addTailFlag(GLOBAL.FLAG_FLUFFY);
					target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
					changes++;
				}
				else output(target.tailTypeLockedMessage());
			}
			
			if (changes == 0 && target.hasTail(GLOBAL.TYPE_FELINE) && !target.hasTailFlag(GLOBAL.FLAG_PREHENSILE))
			{
				output(" Exception: Route has no targets available. Requesting instructions from the monitor... Exception: protocol not supported. Fallback route found, executing...");
				
				output("\n\nYour [pc.tails] suddenly start" + (target.tailCount > 1 ? "" : "s") + " curling and twisting, growing even longer and notably thicker. <b>Your [pc.tails] " + (target.tailCount > 1 ? "are" : "is") + " now prehensile.</b>");
				
				target.addTailFlag(GLOBAL.FLAG_LONG); // just in case
				target.addTailFlag(GLOBAL.FLAG_PREHENSILE);
				if (target.hasSkinFlag(GLOBAL.FLAG_FLUFFY)) target.addTailFlag(GLOBAL.FLAG_FLUFFY);
				changes++;
				
				output("\n\nIt looks like bypassing safety can be a good idea sometimes! Your appendage" + (target.tailCount > 1 ? "s are" : " is") + " definitely better now.");
			}
			
			afterTF(target);
		}
		
		private function routeEarsAvailable(target:Creature, usingCreature:Creature = null):Boolean
		{
			return target.earType != GLOBAL.TYPE_FELINE && target.earTypeUnlocked(GLOBAL.TYPE_FELINE);
		}
		
		private function routeEars(target:Creature, usingCreature:Creature = null):void
		{
			if(counter <= 1) clearOutput();
			output("Executing route: ears.");
			var changes:int = 0;
			
			//Grow cat ears!
			if(target.earType != GLOBAL.TYPE_FELINE)
			{
				if (target.earTypeUnlocked(GLOBAL.TYPE_FELINE))
				{
					if (InCollection(target.earType, [GLOBAL.TYPE_HUMAN, GLOBAL.TYPE_HUMANMASKED, GLOBAL.TYPE_SYLVAN]))
						output("\n\nThe skin on the sides of your [pc.face] stretches painfully as your ears migrate upwards, towards the top of your head. ");
					else output("\n\n");
					
					output("Your ears begin to tingle. You reach up with one hand and gently rub them. Your ears twist and morph, growing a thin layer of " + target.furColor + " fur as they reshape into a pair of points, towering over your head. You experimentally move them, feeling them swivel about at your command. And you can hear so much better than before, every slight creak and rustle around you is so clear now! <b>You now have feline ears!</b>");
					target.earType = GLOBAL.TYPE_FELINE;
					target.clearEarFlags();
					target.addEarFlag(GLOBAL.FLAG_TAPERED);
					target.addEarFlag(GLOBAL.FLAG_FURRED);
					changes++;
				}
				else output(target.earTypeLockedMessage());
			}
			
			afterTF(target);
		}
		
		private function routeArmsAvailable(target:Creature, usingCreature:Creature = null):Boolean
		{
			return target.armType != GLOBAL.TYPE_FELINE && target.armTypeUnlocked(GLOBAL.TYPE_FELINE) || target.armType == GLOBAL.TYPE_FELINE && !target.hasArmFlag(GLOBAL.FLAG_FURRED);
		}
		
		private function routeArms(target:Creature, usingCreature:Creature = null):void
		{
			if(counter <= 1) clearOutput();
			output("Executing route: arms.");
			var changes:int = 0;
			
			//Change arm type to furred. Only after tail and ears.
			if(target.armType != GLOBAL.TYPE_FELINE)
			{
				if (target.armTypeUnlocked(GLOBAL.TYPE_FELINE))
				{
					output("\n\n")
					if(!target.hasFur() && !target.hasArmFlag(GLOBAL.FLAG_FURRED)) output("You feel a powerful itch spread across your arms. You clutch at them, scratching violently as your hair grows and thickens, spreading out into a dark mat across your [pc.skin]. Within a few minutes, your arms are utterly covered in a thick, silky-smooth " + target.furColor + " fur! ");
					output("You ball a hand into a fist, only to feel the softest little pads pressing into your palm. Opening your digits, you marvel at the appearance of small, [pc.skinTone] pads on the tips of your fingers. A larger one stretches across the top of your palm. They’re soft, sensitive and might feel pretty good in certain... tender areas. <b>You’ve got paw-like feline arms, complete with retractable claws and padded palms!</b>");
					// actually, would be nice to have different color for pawpads... use nipple colors, maybe?
					target.armType = GLOBAL.TYPE_FELINE;
					target.clearArmFlags();
					target.addArmFlag(GLOBAL.FLAG_FURRED);
					target.addArmFlag(GLOBAL.FLAG_PAWS);
					changes++;
				}
				else output(target.armTypeLockedMessage());
			}
			else if (target.armType == GLOBAL.TYPE_FELINE)
			{
				if(!target.hasArmFlag(GLOBAL.FLAG_FURRED)) {
					output("\n\nYou feel a powerful itch spread across your arms. You clutch at them, scratching violently as your hair grows and thickens, spreading out into a dark mat across your [pc.skin]. Within a few minutes, <b>your arms are utterly covered in a thick, silky-smooth " + target.furColor + " fur!</b> ");
					target.addArmFlag(GLOBAL.FLAG_FURRED);
					changes++;
				}
				if(!target.hasArmFlag(GLOBAL.FLAG_PAWS)) {
					output("\n\nOpening your digits, you marvel at the appearance of small, [pc.skinTone] pads on the tips of your fingers. A larger one stretches across the top of your palm. They’re soft, sensitive and might feel pretty good in certain... tender areas. <b>You’ve got paw-like, padded feline arms!</b>");
					target.addArmFlag(GLOBAL.FLAG_PAWS);
					changes++;
				}
			}
			
			afterTF(target);
		}
		
		private function routeLegsAvailable(target:Creature, usingCreature:Creature = null):Boolean
		{
			return target.legType != GLOBAL.TYPE_FELINE && target.legTypeUnlocked(GLOBAL.TYPE_FELINE) || target.armType == GLOBAL.TYPE_FELINE && (!target.hasLegFlag(GLOBAL.FLAG_FURRED) || !target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) || !target.hasLegFlag(GLOBAL.FLAG_PAWS));
		}
		
		private function routeLegs4(target:Creature, usingCreature:Creature = null, count:int = 2):void
		{
			routeLegs(target, usingCreature, 4);
		}
		
		private function routeLegs6(target:Creature, usingCreature:Creature = null, count:int = 2):void
		{
			routeLegs(target, usingCreature, 6);
		}
		
		private function routeLegs(target:Creature, usingCreature:Creature = null, count:int = 2):void
		{
			if(counter <= 1) clearOutput();
			output("Executing route: legs.");
			var changes:int = 0;
			
			// Change leg-type to furred feline, can retain tauric form
			if(target.legType != GLOBAL.TYPE_FELINE)
			{
				if (target.legTypeUnlocked(GLOBAL.TYPE_FELINE))
				{
					if (!target.hasLegFlag(GLOBAL.FLAG_FURRED) && !target.hasFur()) output("\n\nYou feel a powerful itch spread across your [pc.legs]. You clutch at them, scratching violently as your hair grows and thickens, spreading out into a [pc.furColor] mat across your [pc.skin]. Within a few minutes, your legs are utterly covered in a thick, silky-smooth [pc.furColor] fur! ");
					
					if(target.legCount < 2) // naga can be only changed to biped
					{
						output("\n\nYour [pc.leg] wobbles then fold, dropping you onto your [pc.butt]. It thrashes wildly around, uncontrolled and spasmatic. Something inside is changing, and you’re helpless to do anything but clench your fists and hold on for the ride. A seam appears in your [pc.leg] a moment before it divides into <b>two leg-like shapes.</b>");
						target.legCount = 2;
					}
					// More than biped? change to cat-taur/chakat, fix non-even leg count.
					else if (target.legCount > 2)
					{
						output("\n\nTwitching wildly, your [pc.legs] give out, dumping you to the floor in a heap of uncoordinated, splayed limbs. They shudder wildly as they reform, starting at your waist and spreading down. Their bones melt like butter as they flow into new shapes.");
						
						if (target.legCount > 4 && count == 4) // shorten to "normal" taur body option
						{
							output(" The front four do anyway. <b>Your body shortens up behind them, becoming more traditionally tauric in shape and size.</b>");
							target.legCount = 4;
						}
						else if (target.legCount > 6 && count == 6) // 6 legs is enough. Really.
						{
							output(" The front six do anyway. <b>Your body shortens up behind them, becoming more traditionally tauric in shape and size.</b>");
							target.legCount = 6;
						}
						else if ((target.legCount / 2) != Math.round(target.legCount / 2)) // 3/5 legs? I have no idea what the hell it can be.
						{
							target.legCount = count;
							output(" <b>Your body now has an even count of legs, becoming more traditionally tauric in shape and size.</b>");
						}
						else if(target.legCount != count)
						{
							target.legCount = 2;
							output(" You feel your bones and organs changing place, steadily mutating until it no longer resembles the body of a beast, but a human. Your extra legs are absorbed, drawing into your vanishing lower body until <b>you have a bipedal humanoid figure</b>.");
						}
					}
					else output("\n\nYou drop to the ground as your [pc.legs] go boneless. The jarring impact is enough to make you wince, but of far more concern is what’s happening below your bruised bottom. Your [pc.legs] are changing!");
					
					output("\n\nYour joints feel very odd, and your soles reform into padded paws with toes tipped by sharp-looking claws. It’ll take a little bit of practice to get used to walking with these. After few steps you’ve found pads of your new paws incredibly sensitive, almost like your tongue - even just feeling ground texture under you is exquisite. <b>You’ve got digitigrade feline legs, complete with soft paw pads and retractable claws!</b>");
					
					target.legType = GLOBAL.TYPE_FELINE;
					target.clearLegFlags();
					target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
					target.addLegFlag(GLOBAL.FLAG_PAWS);
					target.addLegFlag(GLOBAL.FLAG_FURRED);
					
					if (target.legCount >= 4 && target.genitalSpot != 2) {
						if(target.hasGenitals()) output("\n\nAfter taking a moment to get used to your new body, you notice that your genitals now reside between the hind legs of your [pc.lowerBody].");
						target.genitalSpot = 2;
					}
					else if (target.genitalSpot != 0) {
						if(target.hasGenitals()) output("\n\nAfter taking a moment to get used to your new body, you notice that your genitals now reside below your waist, between your [pc.thighs].");
						target.genitalSpot = 0;
					}
					
					changes++;
				}
				else output(target.legTypeLockedMessage());
			}
			else if (target.armType == GLOBAL.TYPE_FELINE && (!target.hasLegFlag(GLOBAL.FLAG_FURRED) || !target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) || !target.hasLegFlag(GLOBAL.FLAG_PAWS)))
			{
				if (!target.hasLegFlag(GLOBAL.FLAG_FURRED) && !target.hasFur()) output("\n\nYou feel a powerful itch spread across your [pc.legs]. You clutch at them, scratching violently as your hair grows and thickens, spreading out into a [pc.furColor] mat across your [pc.skin]. Within a few minutes, your legs are utterly covered in a thick, silky-smooth [pc.furColor] fur! ");
				if (!target.hasLegFlag(GLOBAL.FLAG_PAWS) || !target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE)) output("\n\nYour joints feel very odd, and your soles reform into padded paws with toes tipped by sharp-looking claws. It’ll take a little bit of practice to get used to walking with these. <b>You’ve got digitigrade feline legs, complete with soft paw pads and retractable claws!</b>");
				target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
				target.addLegFlag(GLOBAL.FLAG_PAWS);
				target.addLegFlag(GLOBAL.FLAG_FURRED);
				changes++;
			}
			
			// override and overuse - change bipedal body to quadripedal tauric
			if (changes == 0 && target.legType == GLOBAL.TYPE_FELINE && target.hasLegFlag(GLOBAL.FLAG_DIGITIGRADE) && target.legCount == 2 && target.legCountUnlocked(4))
			{
				output(" Exception: Route has no targets available. Requesting instructions from the monitor... Exception: protocol not supported. Fallback route found, executing...");
				
				output("\n\nTerror overtakes you as you feel your backbone snap. It doesn’t stop, as you feel your spine lengthens, growing with new flesh from your backside as the bones of your legs flex and twist. Muscle groups shift and rearrange themselves as the change completes. <b>You now have tauric lower half!</b>");
				
				target.legCount = 4;
				if (!target.hasLegFlag(GLOBAL.FLAG_PREHENSILE)) target.addLegFlag(GLOBAL.FLAG_PREHENSILE);
				
				if (target.genitalSpot != 2) {
					if(target.hasGenitals()) output(" After taking a moment to get used to your new body, you notice that your genitals now reside between the hind legs of your [pc.lowerBody].");
					target.genitalSpot = 2;
				}
				
				if (target.ass.bonusCapacity < 200) target.ass.bonusCapacity = 200; // Leithans have 500
				for(var x:int = 0; x < target.totalVaginas(); x++)
					if(target.vaginas[x].bonusCapacity < 200) target.vaginas[x].bonusCapacity = 200;
				
				output("\n\nYour forelegs aren’t just legs - while not exactly prehensile, your toes are quite long and nimble, providing you with a fair portion of manual-like dexterity.");
				output("\n\nThat part of your body between pairs of your legs is not overly long, so you can sit on your butt comfortably while ‘standing’ on your forelegs.");
				if (target.hasTail() && target.hasTailFlag(GLOBAL.FLAG_LONG)) output(" You can’t help but smile seeing your [pc.tails] instinctively wrapping your forelegs in adorably animalistic fashion while in such position.");
				output("\n\nThe joint point of your humanoid and tauric parts is very flexible, as well as your spine generally - you can effortlessly reach any part of your body... And not just with your hands, by the way.");
				changes++;
				
				output("\n\nLooks like bypassing safety is not always a good idea... Well, at least you are not reduced to a puddle of goo, right?");
			}
			
			afterTF(target);
		}
		
		private function routeEyesAvailable(target:Creature, usingCreature:Creature = null):Boolean
		{
			return target.eyeType != GLOBAL.TYPE_FELINE && target.eyeTypeUnlocked(GLOBAL.TYPE_FELINE);
		}
		
		private function routeEyes(target:Creature, usingCreature:Creature = null):void
		{
			if(counter <= 1) clearOutput();
			output("Executing route: eyes.");
			var changes:int = 0;
			
			// Feline eyes! Need ears.
			if(target.eyeType != GLOBAL.TYPE_FELINE)
			{
				if (target.eyeTypeUnlocked(GLOBAL.TYPE_FELINE))
				{
					var catEyeColors:/*String*/Array = ["emerald", "turquoise", "green", "amber", "citrine", "yellow", "orange", "copper", "amethyst", "violet", "aquamarine", "blue", "crimson", "garnet", "gold"];
					if (!InCollection(target.eyeColor, catEyeColors))
					{
						var color:String = RandomInCollection(catEyeColors);
						if (target.eyeColorUnlocked(color)) target.eyeColor = color;
					}
					
					output("\n\nYour [pc.eyes] start to water, and no matter how much you blink, your vision just grows fuzzier and fuzzier for several moments before seeming to become incredibly clear and bright all of a sudden. You pull your Codex out and check your reflection: <b>a pair of [pc.eyeColor] cat-eyes stare back at you, slitted and brilliantly bright!</b>");
					target.eyeType = GLOBAL.TYPE_FELINE;
					changes++;
				}
				else output(target.eyeTypeLockedMessage());
			}
			
			afterTF(target);
		}
		
		private function routeSkinAvailable(target:Creature, usingCreature:Creature = null):Boolean
		{
			return target.skinType != GLOBAL.SKIN_TYPE_FUR && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR);
		}
		
		private function routeSkin(target:Creature, usingCreature:Creature = null):void
		{
			if(counter <= 1) clearOutput();
			output("Executing route: skin.");
			var changes:int = 0;
			
			//Grow fur
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
			{
				var catFurColors:/*String*/Array = ["hazel", "chocolate", "auburn", "caramel", "orange", "sandy brown", "golden", "black", "jet black", "dark gray", "gray", "light gray", "silver gray", "white", "orange and white", "brown and white", "black and white", "gray and white"];
				if (!InCollection(target.furColor, catFurColors))
				{
					var color:String = RandomInCollection(catFurColors);
					if (target.furColorUnlocked(color)) target.furColor = color;
				}
				
				//From scales
				if(target.skinType == GLOBAL.SKIN_TYPE_SCALES)
				{
					output("\n\nYou idly scratch at a loose scale, feeling it come loose under your fingers, but the one alongside it is also loose now. You flick it off just before you become aware that the sensation is spreading; scales are dropping like rain now, even without you touching them. Underneath, a lush carpet is springing up from your [pc.skin].");
				}
				else if(target.skinType == GLOBAL.SKIN_TYPE_FEATHERS)
				{
					output("\n\nYou idly scratch at a loose feather, feeling it come loose under your fingers, but the one alongside it is also loose now. You flick it off just before you become aware that the sensation is spreading; feathers are dropping like rain now, even without you touching them. Underneath, a lush carpet is springing up from your [pc.skin].");
				}
				//From skin
				else
				{
					output("\n\nYou idly scratch at your arm but find yourself catching on something. Looking closer, you see a single hair growing from a normally hairless part of your body. A second later, another pops out alongside it... then another, and another... and another. They’re everywhere! Tiny hairs are surfacing all across your body, thickening into a layer of fur before your eyes.");
				}
				target.skinType = GLOBAL.SKIN_TYPE_FUR;
				target.clearSkinFlags();
				if (rand(3) == 0) target.addSkinFlag(GLOBAL.FLAG_FLUFFY);
				changes++;
				output(" <b>You’re growing " + target.skinFurScales(true, true) + ".</b> You pet yourself,");
				if(target.felineScore() < 5) output(" almost");
				output(" purring from the suddenly pleasant sensation.");
			}
			
			afterTF(target);
		}
		
		private function routeFaceAvailable(target:Creature, usingCreature:Creature = null):Boolean
		{
			return target.faceType != GLOBAL.TYPE_FELINE && target.faceTypeUnlocked(GLOBAL.TYPE_FELINE) 
			|| target.tongueType != GLOBAL.TYPE_FELINE && target.tongueTypeUnlocked(GLOBAL.TYPE_FELINE)
			|| target.faceType == GLOBAL.TYPE_FELINE && !target.hasFaceFlag(GLOBAL.FLAG_MUZZLED);
		}
		
		private function routeFace(target:Creature, usingCreature:Creature = null):void
		{
			if(counter <= 1) clearOutput();
			output("Executing route: face.");
			var changes:int = 0;
			
			// feline muzzle
			if(target.faceType != GLOBAL.TYPE_FELINE && target.faceTypeUnlocked(GLOBAL.TYPE_FELINE))
			{
				output("\n\nYou suddenly feel your facial flesh and bones melting and rearranging, reforming into something... different. You check your appearance with your codex’s holocorder. <b>You’ve got a feline muzzle, complete with whiskers and moist nose!</b>");
				target.clearFaceFlags();
				target.faceType = GLOBAL.TYPE_FELINE;
				target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
				changes++;
			}
			else if (target.faceType == GLOBAL.TYPE_FELINE && !target.hasFaceFlag(GLOBAL.FLAG_MUZZLED))
			{
				output("\n\nYou suddenly feel your facial flesh and bones elongating and protruding forward. You check your appearance with your codex’s holocorder. <b>You’ve got a feline muzzle, complete with whiskers and moist nose!</b>");
				target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
				changes++;
			}
			
			// short facial hair blends into fur
			if (target.beardLength > 0 && (target.beardLength < 1 || !target.hasFur()) && target.beardLengthUnlocked(0)) {
				kGAMECLASS.output("\n\nAn irritating sensation centers on your chin, and you can’t help but scratch the itch with your [pc.fingers]. You notice that pieces of what was once your [pc.beard] are now littering your hands and falling to your [pc.feet]. <b>You no longer have a beard!</b>");
				target.removeBeard();
			}
			// or, if you have enough beard, something more original?
			else if (target.hasFur() && target.beardLength >= 1 && target.beardStyleUnlocked(11)) {
				kGAMECLASS.output("\n\nAn irritating sensation centers on your chin, and you can’t help but scratch the itch with your [pc.fingers]. It looks like <b>you have lynx-like sideburns instead of your [pc.beard]!</b>");
				target.beardStyle = 11;
				if (target.beardLength < 2) target.beardLength = 2;
				if (target.beardLength > target.tallness / 12) target.beardLength = target.tallness / 12;
			}
			
			// feline tongue
			if(target.tongueType != GLOBAL.TYPE_FELINE && target.tongueTypeUnlocked(GLOBAL.TYPE_FELINE))
			{
				output("\n\nYour tongue feels strange. ");
				if (target.hasTongueFlag(GLOBAL.FLAG_TAPERED))
					output("It definitely changes towards a humanoid shape. ");
				output("You gave your [pc.hand] an experimental lick and found it’s texture quite rough. It is also more sensitive than before. You feel the compulsion to try it... ");
				if (target.hasPerk("Flexibility")) output("On yourself, maybe? ");
				output("<b>You’ve got a bristly feline tongue!</b>");
				
				var wasLong:Boolean = target.hasTongueFlag(GLOBAL.FLAG_LONG);
				var wasPrehensile:Boolean = target.hasTongueFlag(GLOBAL.FLAG_PREHENSILE);
				
				target.tongueType = GLOBAL.TYPE_FELINE;
				target.clearTongueFlags();
				target.addTongueFlag(GLOBAL.FLAG_NUBBY);
				
				if (wasLong || wasPrehensile)
				{
					output(" Strangely enough, it preserved its former ");
					
					kGAMECLASS.clearList();
					if (wasLong) {
						kGAMECLASS.addToList("length")
						target.addTongueFlag(GLOBAL.FLAG_LONG);
					}
					if (wasPrehensile) {
						kGAMECLASS.addToList("dexterity")
						target.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
					}
					output(kGAMECLASS.formatList() + ".");
				}
				target.changeLust(10 + rand(10));
				changes++;
			}
			
			if (changes == 0 && target.faceType == GLOBAL.TYPE_FELINE && target.tongueType == GLOBAL.TYPE_FELINE && !(target.hasTongueFlag(GLOBAL.FLAG_LONG) && target.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)))
			{
				output(" Exception: Route has no targets available. Requesting instructions from the monitor... Exception: protocol not supported. Fallback route found, executing...");
				
				output("\n\nYour [pc.tongue] suddenly falls out of your mouth and begins undulating as it grows longer. For a moment it swings wildly, completely out of control; but then settles down and you find you can control it at will, almost like a limb. You’re able to stretch it to nearly 4 feet and retract it back into your mouth to the point it looks like a normal tongue. <b>You now have long, prehensile tongue.</b>");
				
				target.addTongueFlag(GLOBAL.FLAG_LONG);
				target.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
				changes++;
				
				output("\n\nWell, this isn’t the worst thing which can happen - you already have some kinky ideas how to make use of this new ‘limb’...");
			}
			
			afterTF(target);
		}
		
		private function routeDefault(target:Creature, usingCreature:Creature = null):void
		{
			var selectedTF:Function = RandomInCollection(options);
			options.splice(options.indexOf(selectedTF), 1);
			counter++;
			selectedTF(target);
		}
		
		protected function afterTF(target:Creature, usingCreature:Creature = null):void
		{
			//trace("After TF: " + counter + ", " + options.length)
			if (options.length > 0 && counter > 0 && rand(counter + 1) == 0 && counter < 4)
			{
				output("\n\n");
				routeDefault(target, usingCreature);
			}
			else
			{
				clearMenu();
				addButton(0, "Next", kGAMECLASS.useItemFunction);
			}
		}
		
		// Below is copy-paste from Mutator, so it is not dependent on non-vanilla external modules.
		
		public static var buffer:String = "";
		/**
		 * Wrapper for Creature.modFem with some auto-adjust. Supports common Mutator buffer for suppressed output.
		 * 
		 * @param	pc target creature
		 * @param	towards target femininity
		 * @param	power desired amount to change, should be positive
		 * @param	display show results of Creature.modFem in output
		 * @return if something actually changed
		 */
		public static function modFem(pc:Creature, towards:Number, power:Number = 1, display:Boolean = true):Boolean {
			buffer = "";
			var changes:Number = 0;
			
			var current:Number = pc.femininity;
			towards = Math.min(towards, pc.femininityMax());
			towards = Math.max(towards, pc.femininityMin());
			
			if (current == towards) return changes > 0;
			power = Math.abs(power); // failsafe
			power = Math.min(power, Math.abs(current - towards));
			if (current > towards) power *= -1;
			if (!pc.femininityUnlocked(current + power)) {
				buffer += "\n\n" + pc.femininityLockedMessage();
			} else {
				buffer += pc.modFem(power);
				if(pc.femininity != current) changes++;
			}
			
			if (display) output(buffer);
			return changes > 0;
		}
		
		/**
		 * Wrapper for Creature.modThickness with some auto-adjust. Supports common Mutator buffer for suppressed output.
		 * 
		 * @param	pc target creature
		 * @param	towards target thickness
		 * @param	power desired amount to change, should be positive
		 * @param	display show results of Creature.modThickness in output
		 * @return if something actually changed
		 */
		public static function modThickness(pc:Creature, towards:Number, power:Number = 1, display:Boolean = true):Boolean {
			buffer = "";
			var changes:Number = 0;
			
			var current:Number = pc.thickness;
			towards = Math.min(towards, pc.thicknessMax());
			towards = Math.max(towards, pc.thicknessMin());
			
			if (current == towards) return changes > 0;
			power = Math.abs(power); // failsafe
			power = Math.min(power, Math.abs(current - towards));
			if (current > towards) power *= -1;
			if (!pc.thicknessUnlocked(current + power)) {
				buffer += "\n\n" + pc.thicknessLockedMessage();
			} else {
				buffer += pc.modThickness(power);
				if(pc.thickness != current) changes++;
			}
			
			if (display) output(buffer);
			return changes > 0;
		}
		
		/**
		 * Wrapper for Creature.modTone with some auto-adjust. Supports common Mutator buffer for suppressed output.
		 * 
		 * @param	pc target creature
		 * @param	towards target tone
		 * @param	power desired amount to change, should be positive
		 * @param	display show results of Creature.modTone in output
		 * @return if something actually changed
		 */
		public static function modTone(pc:Creature, towards:Number, power:Number = 1, display:Boolean = true):Boolean {
			buffer = "";
			var changes:Number = 0;
			
			var current:Number = pc.tone;
			towards = Math.min(towards, pc.toneMax());
			towards = Math.max(towards, pc.toneMin());
			
			if (current == towards) return changes > 0;
			power = Math.abs(power); // failsafe
			power = Math.min(power, Math.abs(current - towards));
			if (current > towards) power *= -1;
			if (!pc.toneUnlocked(current + power)) {
				buffer += "\n\n" + pc.toneLockedMessage();
			} else {
				buffer += pc.modTone(power);
				if(pc.tone != current) changes++;
			}
			
			if (display) output(buffer);
			return changes > 0;
		}
	}
}
