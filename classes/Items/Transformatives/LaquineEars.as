package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Engine.Utility.getPlanetName;
	import classes.Engine.Utility.IncrementFlag;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Map.InPublicSpace;
	
	
	public class LaquineEars extends ItemSlotClass
	{
		
		//constructor
		public function LaquineEars()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "L. Ears";
			//Regular name
			this.longName = "Laquine Ears"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of Laquine Ears";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This product looks like an innocuous pair of headband-mounted bunny ears, but in reality, it is a sophisticated microsurgeon delivery system. The ears themselves store a massive dose of the transforming machines, which are slowly absorbed through the skin of the scalp over twenty-four hours. The wearer is rapidly made to be more like a laquine (a combination lapine/equine), and <b>always</b> gains a pair of bunny ears at the end of the process. A user who already possesses bunny ears will find the product crumbling away when spent, but reports of malfunctions resulting in doubled ears can be found in seedier parts of the extranet. When scrambling one’s genome, nothing is certain!\n\nXenogen Biotech is the only remaining producer of Laquine Ears after a drawn-out legal battle over the original patent that drove its smaller competitors out of business. Subsequently, the megacorporation purchased their bankrupted rival’s programming secrets at a steep discount to further enhance their own product.\n\n<b>Warning:</b><i> Laquine ears were recently reformulated to introduce a number of TamaniCorp reproduction boosters, designed to counter the sterility plague facing the bouncy bunny-folk. Side effects include: extreme fertility, enhanced virility, rapid pregnancy, and over-enlargement of primary and secondary sexual characteristics.</i>";
			
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
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Fenoxo Fenbutt");
			if(target is PlayerCharacter) {
				var pc:Creature = target;
				
				if(pc.hasStatusEffect("Laquine Ears"))
				{
					output("You’re already wearing one set of Laquine Ears. Any more would look rather silly. Also, it might give you cancer.");
					if(kGAMECLASS.silly) output(" Horrible, horrible brain cancer.");
					if(!kGAMECLASS.infiniteItems()) quantity++;
					return false;
				}
				if(kGAMECLASS.flags["LAQUINE_EAR_USES"] == undefined)
				{
					output("You give the bunny ears a quick once over before placing them on your head. They’re mounted on the same kind of headband you see on Halloween costume pieces every year. The only difference that you can see is that small nubs line inside edge, doubtless to disperse the transformative microsurgeons contained with the ears themselves. If you shake them, the ears audibly slosh. What a weird way to distribute a genemod.");
					output("\n\nYou place them on your head, feeling a slight prickle as they begin to painlessly disperse their body-changing payload into your scalp. The directions say to keep them on for a full twenty-four hours for full effect. That shouldn’t be too hard. All you have to do now is wait");
					if(pc.earType == GLOBAL.TYPE_LAPINE) output(" and hope you don’t look too silly with four ears");
					else if(pc.earType == GLOBAL.TYPE_QUAD_LAPINE) output(" and hope you don’t look too silly with six ears");
					output(".");
				}
				else
				{
					if(pc.earType == GLOBAL.TYPE_LAPINE || pc.earType == GLOBAL.TYPE_QUAD_LAPINE) output("One pair of bunny ears is never enough.");
					else output("You don’t even have a pair of bunny ears.");
					output(" Lucky for you, the Laquine Ears fit nicely atop your head, giving you the appearance of some laquine heritage before they even start to work. You can already feel the muted tingle of microsurgeons painlessly being absorbed by your scalp. In no time at all, you’ll be a sexy horse-bunny. Or in 24 hours, maybe. If not, you can always buy more.");
				}
				pc.createStatusEffect("Laquine Ears",0,0,0,0,false,"Pill","You are wearing Laquine Ears and will slowly transform into a Laquine over time, so long as the ears’ supply of microsurgeons holds out.",false,1440);
				IncrementFlag("LAQUINE_EAR_USES");
				return false;
			}
			else kGAMECLASS.output(target.capitalA + target.short + " puts on the ears for a bit, then tosses them in the garbage.");
			return false;
		}
		
		public static function effectProc(target:Creature, initDuration:uint, targetDelta:uint):void
		{
			if (targetDelta > 0) laquineEarProcDetemmienator(target, initDuration, targetDelta);
			else laquineEarsFinale(target, initDuration, targetDelta);
		}
		private static function laquineEarProcDetemmienator(pc:Creature, initDuration:uint, targetDelta:uint):void
		{
			// Calculate the time offset
			var deltaShift:uint = initDuration - targetDelta;

			//get minutes left. If <= 1, force major
			var minutes:Number = pc.getStatusMinutes("Laquine Ears");
			//20% chance, plus a forced change before expiry.
			if(minutes <= 1 || rand(10) <= 1) laquineEarsMajorTFsGo(pc,deltaShift);
			//Out of remaining 80%, 30% moderate TFs
			else if(rand(8) <= 2) laquineEarsModerateTFsGo(pc,deltaShift);
			//Remaining 50%:
			else laquineEarsMinorTFsGO(pc,deltaShift);
		}
		private static function laquineEarsMajorTFsGo(pc:Creature,deltaShift:uint):void
		{
			var x:int = 0;
			var i:int = 0;
			var textBuff:String = "";
			var choices:Array = [];
			var inPublic:Boolean = InPublicSpace();
			
			if(pc.hasCock() && !pc.hasStatusEffect("Priapism"))
			{
				for(i = 0; i < pc.cockTotal(); i++)
				{
					if(pc.cocks[i].cLength() >= 12) choices.push(1);
				}
			}
			var cMax:Number = 28;
			if(pc.hasPerk("Mini")) cMax = 20;
			else if(pc.hasPerk("Hung")) cMax = 36;
			/*
			if(pc.hasCock())
			{
				for(i = 0; i < pc.cockTotal(); i++)
				{
					if(pc.cocks[i].cLength() < cMax && pc.cocks[i].cType == GLOBAL.TYPE_EQUINE) choices.push(2);
				}
			}*/
			if(pc.hasCock() && pc.balls <= 1)
			{
				for(i = 0; i < pc.cockTotal(); i++)
				{
					choices.push(3);
				}
			}
			if(pc.hasCock() && pc.balls == 2)
			{
				for(i = 0; i < pc.cockTotal(); i++)
				{
					choices.push(4);
				}
			}
			// If PC is sufficiently Laquine and has a big enough dick (20" according to Fen's) then the PC will permanently obtain the arousing musk of a space-bunny.
			// Operates like all other pheromone effects. Can be referenced, etc.
			if(pc.hasCock() && !pc.hasPerk("Musky Pheromones") && pc.laquineScore() >= 4)
			{
				for(i = 0; i < pc.cockTotal(); i++)
				{
					if(pc.cocks[i].cLength() >= 20) choices.push(5);
				}
			}
			if(pc.hasVagina())
			{
				for(i = 0; i < pc.totalVaginas(); i++)
				{
					if(pc.vaginas[i].type != GLOBAL.TYPE_EQUINE) choices.push(6);
				}
			}
			if(pc.hasVagina())
			{
				for(i = 0; i < pc.totalVaginas(); i++)
				{
					if(pc.vaginalPuffiness(i, true) < 2 || pc.vaginas[i].bonusCapacity < 800) choices.push(7);
				}
			}
			/*
			if(pc.hasVagina() && pc.bRows() == 1)
			{
				for(i = 0; i < pc.totalVaginas(); i++)
				{
					if(pc.vaginas[i].type == GLOBAL.TYPE_EQUINE) choices.push(8);
				}
			}
			*/
			if(pc.legType != GLOBAL.TYPE_LAPINE) 
			{
				choices.push(9);
				choices.push(9);
				choices.push(9);
			}
			
			var select:int = 0;
			if (choices.length > 0) select = choices[rand(choices.length)];
			
			var hasGlossy:Boolean = false;
			var goBlack:Boolean = false;
			
			if(select == 0)
			{
				laquineEarsModerateTFsGo(pc, deltaShift);
				return;
			}
			// (Penor 12"+) Priapism - Yank crotch coverings out of the way. PC cannot wear anything that covers crotch!
			if(select == 1)
			{
				textBuff += "A";
				if(pc.isBimbo()) textBuff += " yummy-feeling";
				else if(pc.isBro()) textBuff += " righteous";
				else if(pc.exhibitionism() < 66) textBuff += "n unwelcome";
				else textBuff += "n unexpected";
				textBuff += ParseText(" tingle rushes through your body, warm and a little dizzying as it slides down into your crotch, pooling in [pc.cocks]. With no blood left over for your brain, you struggle not to stumble. More of that cock-firming arousal spills into your");
				if(pc.cockTotal(GLOBAL.TYPE_EQUINE) == pc.cockTotal())
				{
					if(pc.laquineScore() >= 5) textBuff += " lovely laquine tool" + (pc.cocks.length == 1 ? "" : "s");
					else textBuff += " bestial tool" + (pc.cocks.length == 1 ? "" : "s");
				}
				else textBuff += " increasingly sensitive tool" + (pc.cocks.length == 1 ? "" : "s");
				textBuff += " while seconds tick by, phallic flesh spilling out and up to the beat of your heart.";
				// Covered
				if(!pc.isCrotchExposed(true))
				{
					textBuff += ParseText("\n\nYou groan as the [pc.cockHeads] press" + (pc.cocks.length == 1 ? "es" : "") + " against your [pc.crotchCover], thrusting into the unforgiving obstruction with feral determination. <i>It hurts!</i> Never before has your tumescence been so resolute in the quest to be erect, nor so sensitive. It feels like you’ve been edging for hours, every nerve bright red and raw from overstimulation to the point where even simple contact with your equipment is like the grittiest sandpaper.");
					textBuff += ParseText("\n\nYou yank down your [pc.crotchCovers] and sigh with relief. Hot maleness surges out, inches upon inches swelling with the kind of immediacy you’d associate with a pneumatic piston. <b>You are hard.</b> It’s almost ludicrous how hard you are, considering the complete lack of anything to arouse you. You’re just standing there, rock-hard prick" + (pc.cocks.length == 1 ? "" : "s") + " bouncing in the breeze, unflappably erect with no signs of fading.");
					textBuff += ParseText("\n\nOnce, you try to cram your rebellious genitalia into your [pc.crotchCover], but there’s no way to get it inside without hurting yourself. Usually your boners would have a little give, would allow themselves to be compacted and stored if the situation required it. Now though? You’re going to have to get used to walking around without any pants. <b>The laquine ears have given you a bad case of priapism.</b> According to the Codex, it’s a common laquine affliction and mostly harmless for their species. A significant amount of orgasms or the passage of time should assuage your inflamed nethers.");
					//Queue event to remove bits
					if(!pc.isCrotchExposedByArmor(true) || (pc.hasArmor() && !pc.isCrotchExposedByLowerUndergarment(true)))
						kGAMECLASS.eventQueue.push( function():void { kGAMECLASS.unequip(pc.armor, true); } );
					if(!pc.isCrotchExposedByLowerUndergarment(true))
						kGAMECLASS.eventQueue.push( function():void { kGAMECLASS.unequip(pc.lowerUndergarment, true); } );
				}
				// Exposed - no new PG
				else
				{
					textBuff += " You groan out loud and pump your hips to the tempo of your swelling prong" + (pc.cocks.length == 1 ? "" : "s") + ", unable to control yourself as you become undeniably, completely erect. You are passionately, exquisitely hard.";
					textBuff += "\n\nWere you foolish enough to wear any clothing that attempted to cover your rampaging length" + (pc.cocks.length == 1 ? "" : "s") + ", you’d have to remove it. The flesh is too firm and too sensitive. Crushing yourself into pants would be agony. You bite your palm, expecting that pain will help you battle the troublesome boner" + (pc.cocks.length == 1 ? "" : "s") + ", but not even physical agony can chase away the pernicious tumescence. <b>The laquine ears have left you temporarily engorged and sensitive! Wearing any crotch-covering clothing item would be agony like this, but at least you’ll be ready for sex at the drop of a hat.</b>";
				}
				
				pc.applyPriapism();
			}
			// (Penor) Grow five to ten inches, dependent on perks. Low chance cock becomes glossy black if not. Immensely pleasurable but no cum. (Mini: 3/4-7/Hung:7-11} inches. (20"mini/28" norm/36" hung)
			else if(select == 2)
			{
				choices = [];
				for(i = 0; i < pc.cockTotal(); i++)
				{
					if(pc.cocks[i].cType == GLOBAL.TYPE_EQUINE && pc.cocks[i].cLength() < cMax)
					{
						choices.push(i);
					}
					if(!hasGlossy) hasGlossy = (pc.cocks[i].cockColor == "glossy black");
				}
				if(choices.length > 0) x = choices[rand(choices.length)];
				var growth:Number = 5 + rand(6);
				if(pc.hasPerk("Mini")) growth = 3 + rand(5);
				else if(pc.hasPerk("Hung")) growth = 7 + rand(5);
				
				if(pc.cockLengthUnlocked(x,pc.cocks[x].cLength() + growth))
				{
					goBlack = (pc.cocks[x].cockColor != "glossy black" && (hasGlossy || rand(3) == 0));
					
					// 9999
					
					pc.cocks[x].cLength(growth);
					if(goBlack) pc.cocks[x].cockColor = "glossy black";
				}
				else textBuff += ParseText(pc.cockLengthLockedMessage());
			}
			// (Penor + Noballs) Growballs
			else if(select == 3)
			{
				if(pc.ballsUnlocked(2))
				{
					//[LE] [Balls]
					// If PC doesn't have balls, grow balls. If PC has 2 or more cocks, grow quads.
					// If PC has one ball, get two balls.
					// PC has Penis but no Balls ; start testicles at 6 inches around
					if(pc.balls <= 0)
					{
						textBuff += "A strange and much too hot pressure builds in your crotch. Your [pc.cocks] dribble" + (!pc.hasCocks() ? "s":"") + " wincingly-hot prejizz ";
						if(!pc.isCrotchExposed()) textBuff += "within the tight boundary of your [pc.crotchCoverUnder]";
						else textBuff += "down the shaft" + (pc.hasCocks() ? "s":"") + " and against your [pc.thighs]";
						textBuff += ". It’s a bit painful, but then it suddenly becomes... heavenly" + (!pc.isCrotchExposed() ? ", and you pull down your [pc.crotchCovers] to get a better look":"") + ". More and more fluid flows with a supernatural ease, all the while your [pc.skinFurScales] extend" + (pc.skinType == GLOBAL.SKIN_TYPE_SCALES || pc.skinType == GLOBAL.SKIN_TYPE_FEATHERS ? "":"s") + " below your half-erected [pc.cocksLight] in a bulgy spherical shape.";
						textBuff += "\n\nYou watch enamored, unable to resist stroking out a few more loads, squirting pre wherever it can reach. Reproductive tissue forms in the shadow of your breeding stick" + (pc.hasCocks() ? "s":"") + ", connecting to your masculine plumbing and attaching itself to your [pc.base] An internal ‘flop’ makes you bend the " + (!pc.hasKnees() ? "proverbial ":"") + "knee, and then there’s a second squeeze. When it’s over, your taut, ";
						if(pc.hasFur()) textBuff += "fuzzy";
						else if(pc.hasScales()) textBuff += "scaly";
						else if(pc.hasChitin()) textBuff += "chitiny";
						else textBuff += "smooth";
						textBuff += " pouch dangles at the front of your [pc.legsNoun]. <b>You delicately take possession of your sensitive scrotum, noting that you have two, baseball-sized testicles sloshing inside!</b>";
						textBuff += "\n\nYou’ve never had trouble with your [pc.cumNoun] output, but this is certainly a welcome change. While hefting one of your newly-formed spunk-bunkers, you remind yourself to be a bit more careful how you [pc.walk] and sit from now on. You also think jacking off right now would be fantastic.";
						textBuff = ParseText(textBuff);
						pc.ballSizeRaw = 6;
					}
					// PC has Penis and only One Ball";
					else if(pc.balls == 1)
					{
						textBuff += "A weird, straining ‘knot’ forms in your spunk-sack that shifts your balance so hard you nearly fall on your face. Luckily you don’t add some other kind of agony on top of your spontaneous testicular torsion.";
						textBuff += "\n\nWhatever’s going on is shunting blood towards your [pc.cocks], and they’re throwing out fat, simmering rods of pre-cum" + (!pc.isCrotchExposed() ? " into your [pc.crotchCoverUnder]":"") + ". There’s a ‘flop’ of sorts when the unnatural and oddly satisfying development finishes connecting to your prepped plumbing.";
						textBuff += "\n\nWhen you peer down, you note that where there was once one, there are <b>now two #-sized testicles in your ballsack!</b> It’s the same exact size as its older twin, and it looks just as succulently plump, lickable, fondleable as the other. Already you can feel your [pc.cumVisc] load strengthening with this arousing addition, and you can’t wait to see if the laquine ears will make them both more productive before they run dry.";
						textBuff = ParseText(textBuff);
					}
					pc.balls = 2;
					pc.changeLust(30);
				}
				else textBuff += ParseText(pc.ballsLockedMessage());
			}
			// (Balls + 2 + Penor) Get quadballs?
			else if(select == 4)
			{
				if(pc.ballsUnlocked(4))
				{
					//[Grow Quadballs]
					// Original Doc states PC needs 2+ dicks and 2 balls for this to occur. 
					// Let me know if you wanna work in a lower chance of this with just one dick.
					textBuff += "Inordinately pleasurable heat throbs at your crotch. Exquisite temperatures swell your [pc.multiCocks] to full mast right away" + (!pc.isCrotchExposed() ? ", pushing your [pc.crotchCoverUnder] aside on their own":"") + ". Veins visibly swell and relax from [pc.cockHead] to [pc.knotBallsHilt].";
					textBuff += "\n\nThere’s a powerful, unsubtle twist wreaking havoc in your churning scrotum, and the changes are fanning across your ";
					if(pc.hasFur()) textBuff += "fuzzy";
					else if(pc.hasScales()) textBuff += "scaly";
					else if(pc.hasChitin()) textBuff += "chitiny";
					else textBuff += "smooth";
					textBuff += " sack in depthless gaps. All you can tell at the moment is that they are building weight, but they’re not expanding individually. Upon closer inspection, you see why.";
					textBuff += "\n\nHefting your virile seed-stash makes you bowl over into the nearest wall. Suddenly there’s an immensely pleasant pinch: your already strained ballsack is expanding noticeably to accommodate new occupants. <b>Two new balls grow in the confines of your cum factory, connecting rapidly with the rest of your internal plumbing.</b> When the low-burning pain comes to an end, you run a [pc.hand] across your testicular field, delighting in the luxuriously swollen and sumptuous flesh now present there. It’s like they were implanted there as reward for some legendary devotion to a fertility god.";
					textBuff += "\n\nThere’s one last lurch and gurgle before your quartette settles down. This sublime circumstance pleases you beyond belief. They’re so massively engorged that your [pc.legOrLegs] shake" + (pc.legCount == 1 ? "s":"") + " when touching them, imagining multiple tongues slicking across their eye-catching diameters.";
					if(pc.hasCocks()) textBuff += " With " + num2Text(pc.cockTotal()) + " cocks, you always felt that two balls just weren’t enough. <b>But now you have four,</b> and y";
					else textBuff += " Y";
					textBuff += "ou can already feel them hard at work, churning up [pc.cumNoun]-shots so large and thick that you could impregnate fields of pussies with each body-rattling pulse.";
					textBuff += "\n\nIt’s more than appropriate for a [pc.raceShort] like yourself.";
					textBuff += "\n\nNow you’ll be filling your partner’s every holes twice as well... you’ve certainly got enough production to cast a [pc.cumVisc] blanket over someone too. All that’s left is to find that lucky partner...";
					textBuff = ParseText(textBuff);
					pc.balls = 4;
					pc.changeLust(33);
				}
				else textBuff += ParseText(pc.ballsLockedMessage());
			}
			// (25"+ dicks) Musky Pheromones!
			else if(select == 5)
			{
				// If PC is sufficiently Laquine and has a big enough dick (25" according to Fen's doc) then the PC will permanently obtain the arousing musk of a space-bunny.
				// Operates like all other pheromone effects. Can be referenced, etc.
				textBuff += "<i>Wow.</i> For a brief moment, you felt relaxed. Even the word ‘relaxed’ doesn’t do justice to how <b>good</b> you randomly felt. A full body warmth blossomed and spread from your [pc.footOrFeet] to your [pc.fingers] out of the blue. For a brief instant you were spellbound by your environs, felt there was no evil, no great task, no boulder to push up a hill. You glance down, noticing your [pc.cocks] " + (!pc.hasCocks() ? "is":"are") + " heavy" + (!pc.isCrotchExposed() ? ", bulging mightily behind your [pc.crotchCoverUnder]":"") + ".";
				if(!pc.isErect()) 
				{
					if(!pc.hasCocks()) textBuff += " It isn’t that erect, but it’s an admirable schlong all the same.";
					else textBuff += " They’re not that erect, but your schlongs are pretty nice to look at.";
				}
				textBuff += " Do laquine ears just come with the random ability to provide spontaneous orgasms? Then it hits you...";
				textBuff += "\n\n...Something smells... <i>phenomenal</i>. Once you get more than a whiff, you identify the fragrance to be on some kind of all-natural spectrum. There’s a little salt - some sweat. There’s a wooden, earthy overlay to that. Beneath it all, there’s the weirdest scintillation of all, something that’s <i>spicy</i> but mildly suffocating. It’s the base of this clean and <b>thick</b> aroma. You can’t place it, but you are sure that it’s <b>musk.</b> Have you always smelled like this?";
				textBuff += "\n\nYour body odor has changed. " + (inPublic ? "When you start to look around, you’re noticing a few tents pitching in the passerby’s crotches.":"The more you inhale, the harder you get.") + " The previous raw happiness returns when you begin stroking your unready slab" + (pc.hasCocks() ? "s":"") + ", <b>revealing that your signature has become laced with the same arousing musk of a laquine.</b> Your [pc.cocks] " + (!pc.hasCocks() ? "is":"are") + " so swollen with laquine pride that " + (!pc.hasCocks() ? "it’s":"they’re") + " generating the strongest clouds of it, " + (inPublic ? "leaving":"sure to leave") + " everyone around you squirming from the overwhelming amounts of sexual signal boosting.";
				textBuff += "\n\nNow that your body is adequately broadcasting its truest, basest intentions, you wonder how much easier it’ll be to pick up a few bar hopping hotties. Anyone that gets in your way from now on is going to have to fight the compulsion to spread their legs in front of you, too!";
				textBuff += "\n\n(<b>Perk Gained: Musky Pheromones</b> - Pheromones grant a +5 musk bonus to tease attack and arousal.)";
				pc.createPerk("Musky Pheromones", 0, 0, 0, 0, "Grants a +5 musk bonus to tease attacks.");
				pc.changeLust(5);
			}
			// (Vag) Horsepussywhynot?
			else if(select == 6)
			{
				choices = [];
				for(i = 0; i < pc.totalVaginas(); i++)
				{
					if(pc.vaginas[i].type != GLOBAL.TYPE_EQUINE) choices.push(i);
				}
				if(choices.length == 0) textBuff += "<b>Boy howdy did an error ever happen. Tried to TF vagina to equine, but no adequate pussies found.</b>";
				else
				{
					x = choices[rand(choices.length)];
					if(pc.vaginaTypeUnlocked(x,GLOBAL.TYPE_EQUINE))
					{
						textBuff += "A twinge ";
						if(pc.legCount > 1) textBuff += ParseText("between your [pc.legs]");
						else textBuff += "below the waist";
						textBuff += ParseText(" swiftly yanks your attention to your [pc.vagina " + x + "]. Prickly tingles tickle their way across it, then inside, swiftly giving way to a insistent heat and unforgiving pressure. You feel like the exterior of your feminine genitalia is being massaged. Every inch of surface area experiences the same undulating kneading. At the same time, your increasingly engorged cunt is pushing back, taking up more and more space. With a whimper of aroused agony, ");
						if(!pc.isCrotchExposed()) textBuff += ParseText("you tear open your [pc.crotchCover]");
						else textBuff += "stare down";
						textBuff += ParseText(" and discover that your [pc.vaginaNoun " + x + "] has changed shape!");
						textBuff += "\n\nIn its place, <b>you’ve developed an equine vagina, complete with lips so large and plush that they look to have been recently pumped.</b>";
						pc.changeLust(10);
						pc.slowStatGain("libido",5);
						pc.shiftVagina(x,GLOBAL.TYPE_EQUINE);
						pc.vaginas[x].addFlag(GLOBAL.FLAG_PUMPED);
					}
					else textBuff += ParseText(pc.vaginaTypeLockedMessage());
				}
			}
			// (Vag) Extra puffy cuntlips + BonusCapacity aimed at raising capacity to 800.
			else if(select == 7)
			{
				choices = [];
				for(i = 0; i < pc.totalVaginas(); i++)
				{
					if(pc.vaginalPuffiness(i, true) < 2 || pc.vaginas[i].bonusCapacity < 800)
					{
						choices.push(i);
					}
				}
				if(choices.length == 0) textBuff += "<b>Oopsie! Tried to puff vagina, but no adequate pussies found.</b>";
				else
				{
					x = choices[rand(choices.length)];
					var puffed:Boolean = false;
					//START THE PUFFENING!
					if(pc.vaginas[x].type != GLOBAL.TYPE_EQUINE)
					{
						// PC has non-Equine Pussy - Increase to Slightly Pumped
						if(!pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
						{
							textBuff += "Your attentions are turned swiftly to [pc.oneVagina] when a sudden, head-tilting sensation runs from brain to crotch. " + (!pc.isCrotchExposed() ? "Just as you get your [pc.crotchCoverUnder] out of the way, w":"W") + "etness explodes out of your [pc.pussyNoun " + x + "]. Your sapphic slopes tingle from an inner, electrifying massage, no doubt brought on by the laquine ears’ microsurgeons. Crystalline beads of [pc.girlCumNoun] flow down the expanding, delicate skin, which swells into something decidedly indelicate.";
							textBuff += "\n\nYou feel as though you’ve been submerged in water, the waves forcibly stroking you from several angles while your engorging pussylips dip and rise in the opposite directions.";
							textBuff += "\n\nOnce the damp pussy-molding comes to an end, you realize that, for better or worse, <b>your [pc.vagina " + x + "] is slightly pumped!</b> When your thighs squirm around, you’re rubbing into more of that fertile flesh, sort of rubbery without being drenched. The sized-up lips obscure [pc.oneClit], meaning that it has more lovely friction to create on future emergences.";
							textBuff = ParseText(textBuff);
							pc.changeLust(8);
							pc.inflateVagina(x);
							puffed = true;
						}
						// PC has non-Equine Pussy - Increase to Fully Pumped
						else if(!pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
						{
							textBuff += "A rubbing sensation stimulating enough to make you moan aloud grips you by the [pc.clit]; " + (!pc.isCrotchExposed() ? "you pull your [pc.crotchCoverUnder] aside in a hurry to see what’s going on":"you glance to your [pc.pussies] straight away") + ". Your dewy mound coats itself in a sudden gush of [pc.girlCumVisc] wetness. The already pumped-looking exterior begins to swell into greater glory, and it’s far more arousing than it has any right to be. ";
							if(pc.clitLength < 1.5) textBuff += "You attribute that to the fact your [pc.clits] " + (pc.totalClits() == 1 ? "is":"are") + " struggling to maintain presence in the changing landscape, sort of like medieval fiefdoms.";
							textBuff += "\n\nThe rubbery, hypersensitive lips spread into a chubbier shape than they were ever intended for. It’s taking up more space than it has a right to. But you don’t care about that. When you rub a finger across your beautifully soaked and bloated mound of [pc.vaginaColor " + x + "] twat, you can only think how good it’s going to feel smashing it in someone’s face. There’s just too much to worship down there. You think you could vanish anyone in <b>your fully pumped cunt.</b>";
							textBuff = ParseText(textBuff);
							pc.changeLust(10);
							pc.inflateVagina(x);
							puffed = true;
						}
					}
					// PC has Equine Pussy - Increase to Slightly Pumped
					else
					{
						if(!pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
						{
							textBuff += "Pangs of pleasure bring you to a stop. Demanding throbs draw your eyes to your [pc.vagina " + x + "]" + (!pc.isCrotchExposed() ? ", forcing you to slip aside your [pc.crotchCoverUnder]":"") + ". Your horse-pussy is wettening and tingling, like you’ve just begun fingering yourself. [pc.GirlCumColor] droplets of fresh moisture glaze the [pc.vaginaColor " + x + "] exterior of your rubbery twat, and those fat lips are doing the impossible, spreading into a somehow wider shape. Redness explodes across your [pc.face], thoughts of this new and wonderful development rushing as quick as the transformation occurs.";
							textBuff += "\n\nOnce it ends, it doesn’t take a genius to see <b>that your mare-cunt is fatter than it was before, the lips slightly pumped.</b> You already had plenty of pussy to worship... but damn, you could probably bury an entire face in there now, not to mention hug a big, fat cock tighter! Just touching it produces the lewdest squelch!";
							textBuff = ParseText(textBuff);
							pc.changeLust(10);
							pc.inflateVagina(x);
							puffed = true;
						}
						// PC has Equine Pussy - Increase to Fully Pumped";
						else if(!pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
						{
							//ORGASM
							textBuff += "A moist churning in your nethers forces a moan of pure pleasure from your lips. The way your legs are quivering makes sitting more than a polite suggestion. When you get your hands on the source of arousal" + (!pc.isCrotchExposed() ? " within your [pc.crotchCoverUnder]":"") + ", sprinklings of [pc.girlCumNoun] mixed with ladyjuice soak your fat cuntlips. The texture and detail of each droplet flowing down your latex-like exterior is orgasmic, and it brings you to sudden orgasm.";
							textBuff += "\n\n[pc.OneClit] throbbing, your impressive pussylips begin to expand before your eyes, equally unnatural and exciting. Your equine cunny was big before, but now... you now understand what having a broodmother’s equipment is like. The gash is slightly bigger than a leithan’s, plumped out to an obscene degree, like a pheromonal mitten of ultrasensitive feminine flesh.";
							textBuff += "\n\nFuck, it’s not just flesh, the hedonistic texture is totally alien, fully evolved for the purposes of enabling breeding across a currently unknown spectrum, <i>to say nothing of what ‘is’ known.</i> When the U.G.C. discovers new aliens with gigantic cocks, you’ll be the first one to be able to fuck them properly.";
							textBuff += "\n\nYou don’t think there’s any dick that won’t be sealed in now. They won’t even need a knot to keep all the cum in at this point. Even better, you could probably drown someone in the sheer amount of pussy you have. All you’d have to do to subdue someone is flash this magnificent muff their way. If the scent doesn’t do ‘em in, then its shamelessly bloated lips will. If you could detach your own head and lock it between your [pc.thighs], you’d probably live out the rest of your days servicing that unconquerable slit.";
							textBuff += "\n\n<i>There are mods to change flavors, right?</i>";
							textBuff = ParseText(textBuff);
							pc.orgasm();
							pc.inflateVagina(x);
							puffed = true;
						}
					}
					// Vaginal Capacity (if under 800)
					if(pc.vaginas[x].bonusCapacity < 800 && (!puffed || rand(2) == 0))
					{
						// low variant
						if(pc.vaginas[x].bonusCapacity < 333)
						{
							textBuff += (puffed ? "\n\nAs an added bonus (though you’re not sure that a sudden hollowness is a normal feeling), t":"T") + "he tiny robots swarming through your genome are no doubt working some kind of biology-rebuilding magic in your vaginal tunnel. There are subtle differences in shape, like you’re expanding outwards. Warm tingles spread through your reproductive system, stretching the shape of your interior to account for greater insertions. <b>You’re able to slide more of your [pc.hand] in than before.</b> It brings an instant rush of arousal, especially when you realize it’s also going to help more kids make their trip into the galaxy.";
							pc.changeLust(5);
						}
						// middling variant
						else if(pc.vaginas[x].bonusCapacity < 600)
						{
							textBuff += (puffed ? "\n\nThe changes don’t end with your expanded exterior. ":"") + "A twinge in your vaginal interior leads you to feel it’s become... stretchier. You feel <i>emptier.</i> <b>Why aren’t you mounted on a huge dick right now?</b> Laquines are known for a few things, and having big cocks and bigger cumshots are a few of those important facts. Why aren’t you bearing their kids, either? There’s <i>a lot</i> of room in there, more than silly things like <i>nature</i> would allow normally.";
							textBuff += "\n\nYou shake your head, a blush spreading across your cheek. When you slide a [pc.finger] into your pussy, <b>you are much deeper than before. In fact, if you wanted to, your entire hand could slide in without an ounce of pain.</b>";
							pc.changeLust(10);
						}
						// huge capacity variant
						else
						{
							textBuff += (puffed ? "\n\nAn equally stark change comes on the back of the previous. ":"") + "A powerful rumble vibrates in your feminine canal. You think you’re developing a stomach ache, maybe you haven’t eaten. But that’s not it. A wave of arousal comes crashing down on you, girly jizz flowing as if you were being lavished with great amounts of attention. Your reproductive canal begins to stretch thanks to the biological rewriting of the tiny robots encouraging this unnatural growth.";
							textBuff += "\n\nLow, bass-like ‘thumps’ vibrate through your waistline, ending at your curves. Your [pc.vaginaColor " + x + "] interior is flexing and getting stretchier, obscenely so, making you feel like little more than the most perfect cock holster. There’s no dick you wouldn’t be able to hilt yourself on now, save for the most extreme displays of grotesque masculinity. When you gingerly test the limits of your morphed biology, your [pc.pussyNoun " + x + "] is able to accept your entire hand <b>and keep going.</b> You pull back in a mixture of awe and trepidation.";
							textBuff += "\n\nImagining the near-infinite depths someone can sink into you brings an instant rush of lust. And that’s before you realize just how many kids you could give birth to at once. Maybe you should put this newfound ability to use soon?";
							pc.changeLust(20);
						}
						pc.vaginas[x].bonusCapacity += 75;
					}
				}
			}
			// (Vag + 1 rowboobs) Extra row of boobage
			else if(select == 8)
			{
				if(pc.createBreastRowUnlocked(2))
				{
					// 9999
					
					pc.createBreastRow();
					pc.breastRows[1].nippleType = pc.breastRows[0].nippleType;
					pc.breastRows[1].breasts = pc.breastRows[0].breasts;
					pc.breastRows[1].breastRatingRaw = pc.breastRows[0].breastRatingRaw;
				}
				else textBuff += ParseText(pc.createBreastRowsLockedMessage());
			}
			// (Naga) Shed tail, reveal cute bunlegs!
			// (Taur) Become bunbuntaur!
			// (Drider) Become Bunnytaurtrain
			// (Other legs) BECOME BUNLEGS!
			else if(select == 9)
			{
				//Lapine Legs TF (From Naga, Taur, and regular legs) (Major Effect/10%)
				//Start of William's Modifications to Laquine Ears
			
				// Lapine Legs already exist in code, they merely lack legitimate obtainment.
				// FLAGS: Digitigrade, Furred, Paws
				var bipedal:Boolean = true;
				
				// Bipedal Lapine Legs ; I will not write for 'bunnytaurs' or the like.
				if(bipedal)
				{
					//[From Naga]
					if(pc.isNaga())
					{
						textBuff += "When you try to slither forward, a loss of movement and feeling is felt in your snake-like tail. Pain erupts after a full-body numbness sets in, dragging you to the ground while a silent scream writes itself on your face. Fear strikes you when you look over your shoulder, seeing the entire lower half of your body wildly shifting, tightening to an absurdly gut-wrenching detail. New limbs sprout in place of your shedding tail, covered in short, fibrous bunny-fur.";
						textBuff += "\n\nYou bite your lower lip, the straining rigidity fading as quick as it came. When you look back again, your single coil has vanished, <b>transformed into two long lapine legs!</b> The new, digitigrade balance takes a few seconds to get used to, but you find that when you stand on your six padded bunny-toes, hopping is a lot easier than walking. In fact, your bouncier mobility <i>feels preferable!</i>";
					}
					//[From Taur]
					else if(pc.isTaur())
					{
						textBuff += "Bowling over, a sudden and complete loss of feeling in your horse-half brings you to the ground yelping. Before you’ve hit the surface, your voice is lost in the unholy pain of a reshaping body structure. Your vision fades to black straight away, the numbness being overtaken with an immensely relieving warmth. Somehow, it feels like you’re getting smaller. But that’s not what these ears are supposed to do... right? Finally looking back, you see your entire lower-half disappearing and reshaping from the form of a " + (pc.tallness < 60 ? "pony":"steed") + "...";
						textBuff += "\n\n...to the form of a bunny. You bite your lip hard enough to bleed, groaning from the torture. Your transmogrification does away with your many legs, reducing you to the level of a normal, bipedal creature. After clapping your hands to the ground and loosing one final yell, it ends as quick as it came. You look back in fear, noting that your waist <b>now thickens out with two furry lapine legs!</b>";
						textBuff += "\n\nYou clutch the nearest wall when you stand, finding balance hard to discover anew on digitigrade rabbit’s feet. The thick pads at the bottom of your digitigrade limbs, along with the six toes, make hopping around much easier than walking. After a minute or so of experimenting, you determine that your newfound bounciness is <i>preferable!</i>";
					}
					//[From Other]
					else
					{
						textBuff += "A painful numbness begins at your feet and rises to your waist, staunching blood flow and forcing you to the ground with a grimace on your face. The muscle-locked sensation is replaced with a rapidly growing warmth. When you look back to see the beginnings of transmogrification, your hips widen painfully to account for thickening thighs covered in short, fibrous bunny-fur. Further down, past the knee, your ankles bend into animalistic paws capped with three big toes.";
						textBuff += "\n\nShifting skeletal structure pries your mouth open in a silent scream, but it lasts for only a moment. Warmth flexes out through your pores, and when you look back again, feeling returns to your limbs. Standing is easy, but you find yourself balancing on your toes. Experimental movements reveal hopping on your padded feet has become easier - and, curiously, <i>preferable</i> to walking. <b>Getting around on your new lapine legs is going to encourage a bouncier mode of mobility!</b>";
					}
					pc.legCount = 2;
					pc.genitalSpot = 0;
				}
				pc.clearLegFlags();
				pc.legType = GLOBAL.TYPE_LAPINE;
				pc.addLegFlag(GLOBAL.FLAG_FURRED);
				pc.addLegFlag(GLOBAL.FLAG_PAWS);
				pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			}
			if(textBuff == "") textBuff += "ERROR. <b>Fenoxo fucked up.</b> Major Laquine Proc, Select state: " + select + " and Choices state: " + choices.length;
			AddLogEvent(ParseText(textBuff),"passive",deltaShift);
			return;
		}
		private static function laquineEarsModerateTFsGo(pc:Creature,deltaShift:uint):void
		{
			var x:int = 0;
			var i:int = 0;
			var textBuff:String = "";
			var choices:Array = [];
			if(pc.totalCocks() > pc.totalCocks(GLOBAL.TYPE_EQUINE) && pc.hasCock()) 
			{
				choices.push(1);
				choices.push(1);
				choices.push(1);
			}
			//(Horsecock) Gains (Mini: 1/2-4/Hung:5-6) inches. (15" mini/20" norm/26" hung)
			var cMax:Number = 20;
			if(pc.hasPerk("Mini")) cMax = 15;
			else if(pc.hasPerk("Hung")) cMax = 26;
			if(pc.hasCock())
			{
				for(i = 0; i < pc.cockTotal(); i++)
				{
					if(pc.cocks[i].cLength() < cMax && pc.cocks[i].cType == GLOBAL.TYPE_EQUINE) choices.push(2);
				}
			}
			if(!pc.hasVagina() && pc.hasCock() && pc.balls == 0) choices.push(3);
			//(Balls and Penor) BallRating gain of 1. Max 5" diameter. (Higher if bulgy?)
			if(pc.hasCock() && pc.balls > 1 && ((pc.ballDiameter() < 7 && pc.hasPerk("Bulgy")) || pc.ballDiameter() < 5)) choices.push(4);
			//Refractory to 4x human
			if(pc.refractoryRate < 4 && pc.hasCock() && !pc.hasStatusEffect("Blue Balls")) choices.push(5);
			if(pc.hasCock() && pc.balls > 1 && pc.ballDiameter() >= 5 && pc.maxCum() < 30000) choices.push(6);
			if(pc.hasCock() && pc.virility() > 0 && !pc.inRut() && pc.biggestCockLength() >= 10) choices.push(7);
			if(pc.hasVagina())
			{
				for(i = 0; i < pc.totalVaginas(); i++)
				{
					if(pc.vaginas[i].wetness() < 4) choices.push(8);
				}
			}
			//Up to 3L squirts!
			if(pc.isSquirter() && pc.girlCumQ() < 3000) choices.push(9);
			//Fertility up to 5x human
			if(pc.fertility() < 5 && pc.hasVagina() && pc.isSquirter()) choices.push(10);
			//10x preggo speed
			if(pc.pregnancyIncubationBonusMotherRaw < 10 && pc.hasVagina()) choices.push(11);
			if(pc.hasVagina() && !pc.isFullyWombPregnant() && pc.fertility() > 0) choices.push(12);
			if(pc.tailCount > 0 && pc.tailType != GLOBAL.TYPE_LAPINE) 
			{
				choices.push(13);
				choices.push(13);
				choices.push(13);
			}
			if(pc.tailCount == 0) 
			{
				choices.push(14);
				choices.push(14);
				choices.push(14);
			}
			if(pc.hasScales() || pc.hasChitin()) 
			{
				choices.push(15);
				choices.push(15);
				choices.push(15);
			}
			if(pc.hasFeathers()) 
			{
				choices.push(16);
				choices.push(16);
				choices.push(16);
			}
			if(pc.armType != GLOBAL.TYPE_LAPINE) 
			{
				choices.push(17);
				choices.push(17);
				choices.push(17);
			}
			if(pc.eyeType != GLOBAL.TYPE_HUMAN)
			{
				choices.push(18);
				choices.push(18);
				choices.push(18);
			}
			if((pc.earType == GLOBAL.TYPE_LAPINE || pc.earType == GLOBAL.TYPE_QUAD_LAPINE) && pc.skinType == GLOBAL.SKIN_TYPE_SKIN && pc.tailCount > 0 && pc.tailType == GLOBAL.TYPE_LAPINE) 
			{
				choices.push(19);
				choices.push(19);
				choices.push(19);
			}
			if((pc.faceType != GLOBAL.TYPE_LAPINE || !pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) && pc.hasFur()) 
			{
				choices.push(20);
				choices.push(20);
				choices.push(20);
			}
			if(pc.faceType == GLOBAL.TYPE_HUMAN && !pc.hasFur()) 
			{
				choices.push(21);
				choices.push(21);
			}
	
			var select:int = 0;
			if (choices.length > 0) select = choices[rand(choices.length)];

			if(select == 0)
			{
				laquineEarsMinorTFsGO(pc, deltaShift);
				return;
			}
			//(Penis) Random cock becomes horsecock.
			if(select == 1)
			{
				choices = [];
				for(i = 0; i < pc.totalCocks(); i++)
				{
					if(pc.cocks[i].cType != GLOBAL.TYPE_EQUINE) choices.push(i);
				}
				x = choices[rand(choices.length)];

				if(pc.cockTypeUnlocked(x,GLOBAL.TYPE_EQUINE))
				{
					textBuff += "Out of nowhere you get the biggest, bulgiest boner.";
					if(!pc.isCrotchExposed()) textBuff += ParseText(" It threatens to rip right through your [pc.crotchCover]. You let it out before it does any damage.");
					textBuff += " It’s so swollen, the flesh ballooning beyond what you thought was your maximum size, and it’s still getting bigger, straining against its normal shape.";
					if(!pc.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT)) textBuff += " The tip shudders then inflates outward, every trembling shift of phallic flesh bringing with it a pulse of hellish pleasure, flattening as you gain a tremendously thick, blunt head.";
					if(!pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) textBuff += " Next a wave of ecstatic delight congeals around the rim of your chubby crown, causing more blood to flow to whole new places. Your prickhead is getting thicker and thicker, until it flares wider than the shaft below.";
					//KnotBGone:
					if(pc.hasKnot(x)) textBuff += ParseText(" It’s so hot and tight that you almost miss the sight of your [pc.knot " + x + "] vanishing into the veiny girth of an increasingly equine-appearing member.");
					if(pc.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED)) textBuff += " Your foreskin is peeled back by the excessive tumescence, sliding down the shaft until it gathers around the very base. Over time, it darkens to a dusky black that clings tight to your shaft, revealing that <b>you’ve grown a brand new sheath from your foreskin.</b>";
					else textBuff += " The skin around the base pulls tight, gathering together around your shifting cock until the folds have piled up into a lewd-looking bunch of skin. The texture and color shifts to a glossy, supple black, revealing that <b>you’ve grown a brand new sheath.</b>";
					textBuff += ParseText("\n\nYou thrust your [pc.hips] in the empty air as the transformation continues, new urges radiating up your spine and into your brain, filling your mind with images of bent-over bunnies, their tails twitching as their lush slits drool in excitement. High pitched voices squeak in delirious desire as you stroke yourself. Ribbons of pre-cum spill out with ease, slicking your strokes as you hump your hand, imagining yourself fucking a bunny-girl so hard that you can see your flaring cock-tip through her silk-furred belly.");
					textBuff += "\n\nWhen you climax, what feels like gallons upon gallons of musky horse-cream spurt from <b>your new horse-cock</b>. You aren’t sure what your cum counts as this point. Is it lapine? Equine? Or still some semblance of Terran? All you know is that <b>your dick got ";
					if(pc.cocks[x].cLength() < 14) textBuff += "so much ";
					textBuff += "bigger when it changed species.</b> The raw, bestial weight hangs heavy on your mind and your body, even as it retreats into its snug sheath. You have the feeling these new urges aren’t going to go away... that you’re going to be fantasizing about bunny buns for some time to come.";
					textBuff = ParseText(textBuff);
					//Horseween.
					//slowStatGain +20 libido.
					pc.slowStatGain("libido",20);
					pc.shiftCock(x,GLOBAL.TYPE_EQUINE);
					if(pc.cocks[x].cLength() < 14) pc.cocks[x].cLength(3+rand(3));
					if(pc.hasPerk("Hung")) pc.cocks[x].cLength(2);
					if(pc.hasPerk("Mini")) pc.cocks[x].cLength(-2);
					pc.orgasm();
				}
				else textBuff += ParseText(pc.cockTypeLockedMessage());
			}
			//(Horsecock) Gains (Mini: 1/2-4/Hung:5-6) inches. (15" mini/20" norm/26" hung)
			else if(select == 2)
			{
				choices = [];
				for(i = 0; i < pc.cockTotal(); i++)
				{
					if(pc.cocks[i].cLength() < cMax && pc.cocks[i].cType == GLOBAL.TYPE_EQUINE)
					{
						choices.push(i);
					}
				}
				if(choices.length > 0) x = choices[rand(choices.length)];
				var growth:Number = 1 + rand(5);
				if(pc.hasPerk("Mini")) growth = 1;
				else if(pc.hasPerk("Hung")) growth += 2;
				if(growth > 6) growth = 6;
				if(pc.cockLengthUnlocked(x,pc.cocks[x].cLength() + growth))
				{
					//Smol growth (1) (mini)
					if(growth == 1)
					{
						textBuff += ParseText("Your crotch feels bizarrely warm as blood collects in your [pc.cock " + x + "]. You don’t really get any harder, but there’s enough new-grown flesh there to grant you an extra inch at full size. You’re honestly surprised to see such growth. Your whole life, your body seems to have been fighting to give you a small dick. At least the Laquine Ears seem capable of punching through your inborn affinity.");
					}
					//2"
					else if(growth == 2)
					{
						textBuff += ParseText("Mmm, warm lust bubbles through your loins, but particularly your [pc.cock " + x + "]. ");
						if(pc.lust() >= 75) textBuff += "Since it’s already hard, you can immediately tell that it’s growing larger, expanding by an eighth of an inch every heartbeat, the blossoming cock-flesh increasing in raw sensation the bigger it gets.";
						else
						{
							textBuff += "It launches ";
							if(pc.hasSheath(x)) textBuff += "out of its sheath";
							else textBuff += "to full size";
							textBuff += " in an instant, rock hard and throbbing, getting bigger with every beat of your heart. An eighth of an inch at a time, it expands with each heartbeat, the fresh cock-flesh raw and sensitive, red-hot and potent.";
						}
						textBuff += " You look on in stunned excitement, getting bigger and harder. When your [pc.cockNoun " + x + "] finally stops its excited pulsing, you have two more inches of throbbing equine fuckmeat.";
						//+lust
						pc.changeLust(15);
					}
					//3"
					else if(growth == 3)
					{
						textBuff += ParseText("Your [pc.cock " + x + "] leaps to the fore of your mind");
						if(pc.lust() >= 75) textBuff += " as it begins to swell, the already rigid boner expanding";
						else textBuff += " as it unexpectedly surges to full size and beyond";
						textBuff += ", so hot and hard that pre-cum squeezes out in thick streams. The musky member wobbles deliciously under its own weight, bowing down to gravity’s increasing effects as it expands. The girth swells apace with the length as it expands, every inch of bunny-horse-meat tingling hotly, promising you the best orgasm of your life if you just reach down and stroke it. Then it stops. You’re three inches longer than you were a minute ago.";
						pc.changeLust(34);
					}
					//4"
					else if(growth == 4)
					{
						textBuff += ParseText("Pleasure assails you from nowhere as your [pc.cock " + x + "] balloons. The veins fill, then bloat, then expand some more, transforming into highways full of nutrients to feed your burgeoning cockmeat. In between, fresh flesh fills the gaps while the whole of the shaft lengthens, pushing your fattened, flaring head further from your body. One inch... then two... then three... You feel like it’s never going to stop. Rhythmic bliss scours through your mind, filling you with delirious, sensuous need. With a final pulse, ");
						textBuff += "your [pc.cock " + x + "] shoots a wave of pre-cum hard enough to splatter something ten feet away, the transformation complete. You’re four inches longer and horny as hell!";
						pc.changeLust(60);
					}
					//5"
					else if(growth == 5)
					{
						textBuff += "You double over, not in agony but in bliss, as dick abruptly begins to spill out of your sheath";
						if(!pc.isErect()) textBuff += ", first your normal length as you attain hardness, then hot new flesh";
						else textBuff += ", flexing powerfully with new flesh";
						textBuff + ". The newborn dickskin is glossy, unmarred by a single touch, and it smells powerfully of your cock, secreting more pheromones than the rest of your member put together. Clear pre-jizz dribbles from your flaring head as it stretches away from your body, hotter and harder, longer and more pleasurable than ever before.";
						textBuff += ParseText("\n\nInch after inch emerges, a seemingly unending tide of new dick that leaves you gasping and panting, watching your [pc.cock " + x + "] transform into a perfect example of bloated hypersexuality. Your [pc.hips] shudder, humping another two inches worth of dick into the open air. Your head swims, and your drizzling laquine length hoses a bucket’s worth of pre onto the floor as it finishes growing, trembling in orgiastic delight. How ever will you satiate such an incredible boner?");
						pc.changeLust(80);
					}
					//6"
					else
					{
						textBuff += ParseText("Growing dizzy, you stumble to the ground. It feels like you’re anemic, like there’s no blood going to your head, and you understand why a moment later. Your [pc.cock " + x + "] is jutting up out of your groin like an impossible pillar, bigger than it’s ever been, and it’s getting bigger with every passing second. Watching more dick spill out of your sheath is mesmerizing and highly erotic. The more your member grows, the hornier you get, until you’re panting and whining at the sheer sexual thrill of getting bigger. You can vaguely smell the pheromones pouring off it mixed with the sweet scent of pre-cum.");
						textBuff += ParseText("\n\nBubbles of pre-jizz pour out, one after another another, thicker and creamier the more your flare swells. Your [pc.cock " + x + "] is tight and overfilled. Your muscles are tense and screaming. Your mouth is actually screaming, crying out in joy as your penis finishes gaining a half a foot of new length and erupts, spraying thick coats of sticky seed over everything in front of you. The moment it stops, it slaps hard into your ");
						if(pc.bellyRating() < 16 && pc.cocks[x].cLength() >= 18) textBuff += ParseText("[pc.chest]");
						else textBuff += ParseText("[pc.belly]");
						textBuff += ParseText(", trickling seed across your [pc.skinFurScales]. You wrap your arms around it in euphoric love. The sudden pressure is enough to bring you right back to the precipice, but somehow you hold back, content with the knowledge that you’re going to be a truly big-dicked laquine.");
						pc.orgasm();
					}
					textBuff += laquineDickSizeAlert(pc.cocks[x].cLength(),pc.cocks[x].cLength() + growth);
					pc.cocks[x].cLength(growth);
				}
				else textBuff += ParseText(pc.cockLengthLockedMessage());
			}
			//(Penor and No Cunt) Grow Balls
			else if(select == 3)
			{
				if(pc.ballsUnlocked(2))
				{
					textBuff += ParseText("Nausea reaches out of your gut and slaps you upside the head. You groan and double over, feeling your innards twisting. Your [pc.belly] gurgles like you’d eaten week old ausari snazzlers. Then your muscles tighten... and tighten again. They twist until they’re doubling you over with agonizing pressure. Then, a ‘pop’ of sudden release. It doesn’t hurt quite so bad, and you feel like you might not puke after all. You straighten, only to feel something else inside you pop free.");
					textBuff += "The pain is gone, but its cause is not. <b>";
					if(pc.legCount > 1) textBuff += ParseText("Between your [pc.legs]");
					else textBuff += "Dangling below your waist";
					textBuff += " is a new-grown sack containing two testes,</b> further displaying your maleness for all to see.";
					if(!pc.isCrotchExposed()) textBuff += ".. when you aren’t dressed.";
					textBuff = ParseText(textBuff);
					//+1 libido
					pc.libido(2);
					pc.balls = 2;
					pc.ballSizeRaw = 3.4;
				}
				else textBuff += ParseText(pc.ballsLockedMessage());
			}
			//(Balls and Penor) BallRating gain of 1. Max 5" diameter. (Higher if bulgy?)
			else if(select == 4)
			{
				if(pc.ballSizeUnlocked(16))
				{
					//1-2 diameter (to “large” size.)
					if(pc.ballDiameter() < 1)
					{
						textBuff += "You gasp as your movements cause your [pc.sack] to squeeze tightly against your body - surprisingly tightly. Reaching down to handle it, <b>you discover that your testes have enlarged to the size of eggs.</b>";
					}
					//2-3 diameter (to “baseball”)
					else if(pc.ballDiameter() < 2)
					{
						textBuff += "You take a quick break from your activities when your [pc.sack] grows warm and tight, then hotter and even more constricting.";
						if(!pc.isCrotchExposed()) textBuff += " Peeling your [pc.crotchCover] out of the way";
						else if(pc.isTaur()) textBuff += " Twisting back and down against your side,";
						else textBuff += " Bending over to the limits of your flexibility";
						textBuff += " allows you a much better view of what’s going on. <b>Your balls are expanding,</b> unsubtly plumping, first one, then the other";
						if(pc.balls > 2) textBuff += ", and so on";
						textBuff += ". Then the pattern repeats, jostling your nuts about as they swell. They finally settle down a minute later, an inch bigger - roughly the size of baseballs.";
					}
					//3-4 diameter (to “apple”)
					else if(pc.ballDiameter() < 3)
					{
						textBuff += "You’re quite certain [pc.balls] are expanding. They feel heavier, for one, slapping against the side of your [pc.leg] as you move. For another, you find yourself suddenly and unexpectedly aroused, but your [pc.cocks] ";
						if(pc.cockTotal() == 1) textBuff += "is";
						else textBuff += "are";
						textBuff += " only half-hard at best. Your [pc.sack] churns, and [pc.cum] dribbles from your [pc.cockHeads]. There’s no room inside your body for all the sperm being manufactured all of a sudden. It spills out in gooey ropes, splattering on the ground. Yet soon enough the flow thins to a trickle, redirecting to fill your [pc.balls], inflating them to the size of apples. Only then does the pressure ease off and the arousal recede, <b>leaving you with bigger, more productive balls.</b>";
						pc.changeLust(15);
					}
					//4-5 diameter (to grapefruit)
					else if(pc.ballDiameter() < 4)
					{
						textBuff += "Gentle, lapping warmth enfolds your [pc.sack]. It’s like sitting in the universe’s gentlest, most perfectly temperature-calibrated hot-tub. A sigh slips out of you as you luxuriate in the sensation. It’s too pleasant too ignore. ";
						if(pc.isCrotchExposed()) textBuff += "Before your eyes";
						else textBuff += "Beneath your [pc.crotchCover]";
						textBuff += ", your [pc.balls] expand. It’s a subtle growth, like an angel is reaching down from the heavens to pour <i>more</i> into each of your testes. They engorge with new flesh and new seed, and that pleasant warmth becomes a sensuous tingle. <b>Your nuts are easily the size of grapefruits.</b>";
						textBuff += "\n\nYou moan and massage your newly-swollen nutsack, dribbling pre so thick that it’s the same [pc.cumColor] as your [pc.cumNoun]. Is this how all laquines are? Big balled bunnies that just love having their nuts rubbed? Stars, you could probably cum from this alone with enough time and effort, but you’re a busy [pc.manWoman]. You begrudgingly pull your hand free to return focus to your current task.";
						//+15 lust
						pc.changeLust(15);
					}
					//(perks) 5-7 diameter. (to cantaloupe)
					else
					{
						textBuff += "A sharp pinch in your [pc.sack] disturbs you from your previous activity, forcing you to pay attention to the changes that are rippling through your [pc.balls]. Now that you’re looking, it’s clear that this is no subtle change. Your testicles are packing on weight worse than a galotian at a bukkake party. The pinch you felt was the sudden addition of a half-pound of new weight to your reproductive tissues.";
						textBuff += "\n\nThere’s no pain any longer, however. Whatever the Laquine Ears are doing to make your nuts grow so rapidly is also reinforcing the connective tissues of your sack and dilating your internal cum-tubes to handle the additional sperm they’ll be producing. You heft one in your hand, feeling it pulse, delighting in the warm throb of your body becoming bigger and better with each passing second. It’s exquisite, and yet... are laquines supposed to be this big? Are their balls supposed to be so luxuriously soft, so swollen that they spill out over the sides of your hand?";
						textBuff += "\n\nYou’ve always been quite bulgy, but this is a pleasing new development. Your churning, expanding, ballooning cum factories have got to be the heaviest un-augmented nuts in the sector. You’d have to turn to Throbb or Suma Cream to find anyone who could rival you for raw, majestic endowment. <b>Your canteloupe-sized balls</b> lurch and gurgle one last time before they settle into your hand. Excess seed dribbles from your [pc.cocks] as you give them a happy squeeze and consider how carefully you’ll need to walk to avoid pressing too firmly on the virile spunk-tanks.";
						pc.changeLust(20);
					}
					textBuff = ParseText(textBuff);
					laquineBallSizeUp(pc);
				}
				else textBuff += ParseText(pc.ballSizeLockedMessage())
			}
			//(Penor) Like a Rabbit - Increase Refractory to approx 4x human.
			else if(select == 5)
			{
				//Change instantly, but proc message next time you get blue balls.
				//FEN NOTE: FUCK THAT. How about Instant Blue Balls.
				textBuff += ParseText("You’re getting blue balls already? Just how quickly is your body producing [pc.cumNoun]? Did the Laquine Ears do this to you? <b>You’re going to have to get off more frequently to avoid blue balls...</b>");
				pc.applyBlueBalls();
				pc.refractoryRate = 4;
			}
			//(Penor & balls dun growin’) Get hard if not, and dribble pre. (+cum volume, target of 10L cumshot. Higher if bulgy?)
			else if(select == 6)
			{
				var oldLust:Number = pc.lust();
				pc.lust(300);
				//Up to 3L
				if(pc.maxCum() < 9000)
				{
					textBuff += "Out of nowhere, ";
					if(!pc.isCrotchExposed()) textBuff += "you dribble pre all over the inside of your [pc.crotchCover]";
					else textBuff += "you dribble pre all over your [pc.thighs]";
					textBuff += ", your [pc.cocks] oozing the syrupy substance for a minute straight. Your insides feel tight and full, perhaps a little sore by the time the libidinous flow ceases. You aren’t sure what just happened, but it’s undoubtedly related to your ";
					if(pc.isHerm()) textBuff += "masculine ";
					textBuff += "orgasms somehow. Perhaps you’ll be producing even more seed?";
					textBuff = ParseText(textBuff);
					//+slight lust and fill balls.
					pc.ballFullness = 100;
					while(pc.maxCum() < 9000)
					{
						pc.boostCum(10);
					}
					pc.changeLust(oldLust+10,true);
				}
				//Up to 6L
				else if(pc.maxCum() < 18000)
				{
					textBuff += "Tight, hot pleasure blossoms within your body out of nowhere, bearing you down to your knees. [pc.EachCock] grows ";
					if(!pc.isErect()) textBuff += "stiff";
					else textBuff += "even stiffer";
					textBuff += " and hard";
					if(pc.isErect()) textBuff += "er";
					textBuff += " from the erotic force of it all. It feels like a muscle in your middle is squeezing down, stuffing more and more blood into your tumescent dick";
					if(pc.cockTotal() > 1) textBuff += "s";
					textBuff += ", and with your increasing engorgement comes the sense of being pent up, like you’ve been edging for hours. Pre-cum suddenly erupts from your [pc.cockHeads], not in lurid spurts but in debauched streams";
					if(!pc.isCrotchExposed()) textBuff += ", soaking the inside of your [pc.crotchCover]";
					textBuff += ", flooding out of your [pc.balls] as if there is suddenly no room for the bubbling juices.";
					textBuff += "\n\nPumping your hips, you can’t stop yourself from grabbing hold of [pc.oneCock] and stroking yourself to orgasm any more than you can stop the sensuous lubricant from puddling in your palms. Keening in bliss, your whole crotch clenches as a teeth-rattling climax hits you. [pc.Cum] sprays out in long, voluminous lances, each thicker than the previous, discharging in sync with the thrusts of your hips. You watch it puddle, more and more of it. More than you should be able to produce, but you spurt it out all the same. You cum until that soreness you felt earlier returns, and then you cum some more.";
					textBuff += "The experience is exhausting but ultimately satisfying. Your body is making so much more [pc.cumNoun] now. By your estimate, you ejaculated at least six liters worth of sperm-laden goo. <b>Your cumshots have gotten significantly bigger than before!</b>";
					textBuff = ParseText(textBuff);
					pc.orgasm();
					while(pc.maxCum() < 18000)
					{
						pc.boostCum(10);
					}
				}
				//Up to 10L
				else
				{
					textBuff += "This is getting absurd. One minute, you’re minding your own business. The next, your [pc.cocks] ";
					if(pc.cockTotal() == 1) textBuff += "is";
					else textBuff += "are";
					textBuff += " rock-hard and drooling worse than a pack of wild-dogs eyeing the steaks in a butcher’s window. The worst part is how quickly it comes and goes. By the time you reach down to tend to the eruption of potent need, the flood of sticky pre-jizz slows, and you find yourself going soft once more.";
					textBuff += "\n\nOnly to have it happen again five minutes later. And again, five minutes after that. Each time it happens, there’s more pre. With every drip and droplet, the sensation becomes more sensuous, almost deliriously erotic. After dealing with these troublesome experiences for a whole hour, they become positively debilitating. Your head swims from the leaky, drooling ecstasy. Your crotch is soaked in it. Your [pc.hips] jerk into the empty air at the slightest hint of a boner, throwing webs of sticky goo";
					if(!pc.isCrotchExposed()) textBuff += " deep into your [pc.crotchCover]";
					else textBuff += " over everything within reach";
					textBuff += ". You feel more like a fountain of pre-cum than [pc.aRace], more aware of the pulse and throb of fluid spilling out of you like water from a faucet than your own thoughts.";
					textBuff += "\n\nYou slick your whole lower body with it, but each time you reach for your length, your traitorous body steals away the bliss, packing it deep in your [pc.balls] for later use. Just when think you’re going to go mad, it stops. Your [pc.cocks] are soaked, but the troublesome hyper-lubrication stops. Inside, you feel sore, like you haven’t cum in ages. You aren’t entirely sure what happened. <b>Maybe the Laquine Ears upgraded your body to produce bigger, heavier loads?</b>";
					textBuff += "Jacking off suddenly seems like a great idea.";
					textBuff = ParseText(textBuff);
					pc.changeLust(1000);
					if(pc.ballFullness < 99) pc.ballFullness = 99;
					while(pc.maxCum() < 30000)
					{
						pc.boostCum(10);
					}
				}
			}
			//(Penor) Lagonic Rut (Not sure if this reference is that awesome)
			else if(select == 7)
			{
				textBuff += ParseText("You idly grunt and scratch your [pc.chest] as you feel unseasonably warm. You’re sort of horny too, not like you need to get off right now, but like you’re ready for sex at any moment, like you could knock up the first girl to cross your path, then nail her sister while the first is still recovering. You might have to fight off a jealous boyfriend in between, but that’s a small price to pay to sow your seed. Your nostrils flare in between idle twitches of your nose. Yeah, definitely feel like you need to assert your dominance. Once " + pc.mf("other males","the troublesome males") + " are out of your way, you’ll be free to fuck with impunity.");
				textBuff += "\n\nWait a second. You shake your head, trying to clear your senses. <b>Are you going into rut?</b> Is that what this is? A quick search on your Codex confirms it for sure: one of the side effects of Laquine Ears is <b>an extra-potent form of rut colloquially known as “Lagonic Rut,”</b> named after an infamous wife-stealing laquine of old folk tales. You don’t get far through his exploits before you get bored of the details and focus on all the fertile girls he impregnated. The numbers before you stop seeming like a warning and more like a challenge.";
				textBuff += "\n\nHow many kids can you sire?";

				/*Rut effects
				//v1 - libido increase.
				//v2 - min lust
				//v3 - minimum cum increase.
				//v4 - virility increase*/
				pc.createStatusEffect("Lagonic Rut",5,25,2000,5,false,"LustUp","Your body is driven for aggressive breeding, increasing your libido and virility, as well as boosting your minimum cum output.\n\n+5 Libido\n+25 Minimum Lust\n+2000mLs Minimum Cum\n+500% Virility",false,28800,0xB793C4);
			}
			//(Vagoo) Wetter Cunt up to 4.
			else if(select == 8)
			{
				choices = [];
				for(i = 0; i < pc.totalVaginas(); i++)
				{
					if(pc.vaginas[i].wetness() < 4) choices.push(i);
				}
				x = choices[rand(choices.length)];

				//Wetness to 2.
				if(pc.vaginas[x].wetness() < 2)
				{
					//Multicunt already have 1 passed 2:
					if(pc.wettestVaginalWetness() >= 2) textBuff += ParseText("You feel more wet than normal. Sure, you’re already supernaturally gifted in the ladyhood department, but there’s extra dampness spreading to a slit that previously struggled with it, like the glands in one juicy quim have spread into the lining of its neighbor, <b>making that [pc.vaginaNoun " + x + "] wetter than normal.</b>");
					//Aroused
					else if(pc.lust() >= 66) textBuff += ParseText("You are feeling positively wet, and not just in the normal way. Your [pc.vaginaNoun " + x + "] is drenched like you’ve just finished an hour of finger play, but you haven’t even had to touch it. You could slide right down on a big hard dick without any warning. It wouldn’t hurt at all. It’d probably feel really, really good, in fact. <b>You’re wetter than you used to be for sure.</b> No doubt you’ll be passively moist even when you aren’t turned on.");
					//Unaroused
					else 
					{
						textBuff += "You are feeling a little more damp ";
						if(pc.legCount > 1) textBuff += ParseText("between the [pc.thighs]");
						else textBuff += "down below";
						textBuff += ParseText(" than you normally would, and you definitely aren’t turned on right now. Could it be that <b>your [pc.vaginaNoun " + x + "] is just wetter than it used to be</b>?");
					}
					pc.vaginas[x].wetness(1);
				}
				//Wetness to 3.
				else if(pc.vaginas[x].wetness() < 3)
				{
					//Multicunt with more than 3 on one.
					if(pc.wettestVaginalWetness() >= 3)
					{
						textBuff += "You’re getting wetter down below. You can feel it spreading from one slick pussy to another, blessing ";
						if(pc.totalVaginas() == 2) textBuff += "your second";
						else textBuff += "another";
						textBuff += " slit with the slick-and-creamy sensation of being completely ready for sex. Any time of day or night, a dick could slide right up in ";
						pc.vaginas[x].wetness(1);
						if(pc.driestVaginalWetness() >= 3) textBuff += "any of";
						else textBuff += "almost any of";
						textBuff += ParseText(" your holes, and you’d feel nothing but lubricated bliss. <b>[pc.OneVagina] has gotten wetter, catching up to its sister");
						if(pc.totalVaginas() > 2 && pc.driestVaginalWetness() >= 3) textBuff += "s";
						textBuff += ".</b>";
					}
					//Aroused
					else if(pc.lust() >= 66)
					{
						textBuff += "You are positively wet.";
						if(!pc.isCrotchExposed()) textBuff += ParseText(" Your [pc.vaginaNoun " + x + "] has turned your [pc.crotchCover] into a steaming, slippery swamp.");
						else textBuff += " If you bothered with something as mundane as undies, they’d be a steaming, slippery swamp by now.";
						textBuff += " It feels almost like someone reached deep into your cunt and flipped the switch labeled “In Case of Horsedick, Add Lube”. You suppose laquines must be nice and wet, particularly during breeding seasons, when they’re especially turned on. No doubt about it, <b>you’ve been given a very slick pussy.</b>";
						pc.vaginas[x].wetness(1);
					}
					//Unaroused
					else 
					{
						textBuff += ParseText("Unprovoked, a sense of serious dampness spreads beneath your [pc.hips]. You aren’t feeling particularly turned on, but you moisten all the same. Is this how laquines feel? Are they always <b>passively wet and ready for action</b>? Do their panties get so slick when they’re turned on that their ripe, alien cameltoes are on full display? You have a feeling you’re going to find out.");
						pc.vaginas[x].wetness(1);
					}
				}
				//Wetness to 4.
				else
				{
					//Multipuss
					if(pc.wettestVaginalWetness() >= 4)
					{
						textBuff += ParseText("The warm, ooey gooey feeling of feminine slickness spreads inside you, leaking from one dripping cunt to a slightly less moist pussy. It flashes sizzling-hot, and then you’re dripping from another hole, cascading slick lubricant down your [pc.thighs]. <b>You are a wet ");
						if(pc.laquineScore() >= 3) textBuff += "bunny";
						else if(pc.isBimbo()) textBuff += "fuckslut";
						else if(pc.libido() >= 70) textBuff += "slut";
						else textBuff += ParseText("[pc.boyGirl]");
						textBuff += ParseText(" who can squirt from more than one hole when [pc.heShe] cums.</b>");
						pc.vaginas[x].wetness(1);
						if(pc.driestVaginalWetness() < 4) textBuff += " Just one more hole to go, and you’ll be able to erupt around a bunnycock no matter where it slides into you.";
						else textBuff += " Now you can erupt around a thick bunnycock no matter where it slides into you.";
					}
					else if(pc.lust() < 66)
					{
						//Unaroused
						textBuff += ParseText("Whenever you move, you can feel your netherlips sliding against one another on a curtain of slickness. You aren’t even aroused, and your [pc.vaginaNoun " + x + "] is wet and ready for sex. You could dip a finger in right now and it would come back coated in a glossy sheen. If you aren’t careful, a trickle of lubrication will run down your inner thigh. To aliens with keen noses, you must smell like quite the horny bitch, even now. Sex like this will be effortless. There’s no chance of a penis rubbing you sore ever again, and <b>you’re pretty sure you’re going to squirt when you orgasm now too.</b>");
						pc.vaginas[x].wetness(1);
					}
					//Aroused
					else
					{
						textBuff += ParseText("Warm [pc.girlCumNoun] trickles down your [pc.legOrLegs] in thin streams. You must look quite a sight, flushed and dripping, your [pc.vaginaNoun " + x + "] so soaking wet that anyone within a few feet can smell how horny you are. This isn’t some fluke. This is your new normal. You can tell on some instinctual level. <b>You are gonna to leak [pc.girlCum] whenever you get turned on and stay sopping wet even when you calm down.</b> It’s all part and parcel of turning into a horny bunny built to take big dicks. <b>You’ll probably squirt the moment you cum too.</b>");
						pc.vaginas[x].wetness(1);
					}
				}
			}
			//(Vagoo) Increase squirtability
			else if(select == 9)
			{
				textBuff += ParseText("Something feels tight in your middle. You stop and double over, pressing your palm to the trouble spot, just above your groin. Then you feel it. Something inside you palpably swells, pushing against your fingers. It’s deep inside you, right next to your [pc.vaginas]. A squirt of [pc.girlCum] erupts");
				if(!pc.isCrotchExposed()) textBuff += ParseText(" into your [pc.crotchCover]");
				else textBuff += ParseText(" down your [pc.legOrLegs]");
				textBuff += ", hosing out of you in thick sprays. It’s like someone reached up inside you and squeezed down on some hidden gland full of girl-lube, wringing every ounce of fuckjuice from your body. Is that what grew? <b>Are your squirting orgasms getting even wetter?</b>";
				pc.boostGirlCum(4);
			}
			//(Vagoo) Increase fertility
			else if(select == 10) 
			{
				//Increase up to 5x human levels.
				//One jump
				if(pc.fertility() < 2)
				{
					textBuff += "You feel a twinge inside you as something changes near your uter";
					if(pc.totalVaginas() == 1) textBuff += "us";
					else textBuff += "i";
					textBuff += ". Nothing visible presents itself, but the laquine ears must be doing something to your womb.";
				}
				//Next jump
				else if(pc.fertility() < 3)
				{
					textBuff += "A sudden heat radiates through your womb";
					if(pc.totalVaginas() > 1) textBuff += "s";
					textBuff += ", spreading toward the center from both sides. Your ovaries must be kicking into a higher gear. Maybe the gentle radiance you feel within is what it feels like to ";
					if(!pc.isPregnant()) textBuff += "let out a half-dozen eggs all at once?";
					else textBuff += "have your reproductive system enhance itself mid pregnancy, your ovaries backing up with unspent eggs as they await the chance to get you knocked up all over again?";
					textBuff += " <b>Yes, you must be more fertile.</b>";
				}
				//Third jump
				else if(pc.fertility() < 4)
				{
					if(pc.totalVaginas() == 1) textBuff += "Two";
					else if(pc.totalVaginas() == 2) textBuff += "Four";
					else textBuff += "Six";
					textBuff += ParseText(" points of pressure just below your [pc.belly] leap to the forefront of your mind. That must be... your ovaries. You can feel them swelling, displacing other tissues to make room for more productive babymaking. Terran biology states that the body doesn’t produce new eggs beyond a certain point, but you are pretty sure that you’re producing fresh eggs this very moment. Millions of them.<b> The Laquine Ears are making you a much better breeder.</b>");
				}
				//Fourth jump
				else
				{
					textBuff += "Palpable fertility yanks your attention from whatever else you were doing down to your attention-demanding womb";
					if(pc.totalVaginas() > 1) textBuff += "s";
					textBuff += ". You’re pretty sure you aren’t supposed to be able to feel it, but the lining radiates a delightful warmth as it thickens, spreading deeper into your body. Your ovaries pulsate alongside, swelling up with even more eggs, ready to leave you in a state of perpetual fertility. Laquines are supposed to have fertility problems, but maybe the Laquine Ears come engineered with a plan to overcome that?";
					if(!pc.isPregnant()) textBuff += "\n\nEverything seems so hollow and empty.";
					else textBuff += "\n\nEverything seems so perfect and fitting with your pregnancy. The moment you give birth, however, you’re liable to feel empty.";
					textBuff += " Sure, your womb";
					if(pc.totalVaginas() > 1) textBuff += "s are";
					else textBuff += " is";
					textBuff += " building up in preparation for perpetual impregnation, and with how sinfully swollen your ovaries feel, they must be leaking out a steady stream of eggs. But that doesn’t mean that you don’t crave the thick, cream filling that only a big, spurting bunnyhorse-dick can offer. Just imagining your enhanced womb ballooning under the weight of gallons of seed has you sighing in contentment.";
					textBuff += "\n\n<b>You’ve become a very fertile, breeding ";
					if(pc.laquineScore() >= 2) textBuff += "bunny";
					else textBuff += ParseText("[pc.boyGirl]");
					textBuff += ".</b>";
					if(pc.isBimbo() || pc.libido() >= 80) textBuff += " This is going to be fun.";
					else textBuff += " Maybe you shouldn’t have bought these transformative bunny ears...";
				}
				pc.fertility(1);
				pc.slowStatGain("libido",1);
			}
			//(Vagoo) Increase preggo speed multiplier to x10.
			else if(select == 11)
			{
				if(pc.pregnancyIncubationBonusMotherRaw < 2)
				{
					//To x2 multiplier
					textBuff += "A twinge in your womb";
					if(pc.totalVaginas() > 1) textBuff += "s";
					textBuff += " reminds you that laquines, like the rabbits they so resemble, have a much shorter incubation period than humans - only five or six so months instead of the nine you’d be accustomed to. <b>Your pregnancies may be coming to term more quickly.</b>";
					pc.pregnancyIncubationBonusMotherRaw = 2;
				}
				//To 4x multiplier
				else if(pc.pregnancyIncubationBonusMotherRaw < 4)
				{
					textBuff += "Your uter";
					if(pc.totalVaginas() == 1) textBuff += "us feels";
					else textBuff += "i feel";
					textBuff += " more... active somehow, more able to nourish and support unborn offspring. The fertile feeling leaves you instinctively aware that <b>your pregnancies are going to come to term very quickly.</b> Your body is gearing up for breeding, every bit of feminine anatomy ready to help you put out enough young to repopulate the laquine race.";
					pc.pregnancyIncubationBonusMotherRaw = 4;
				}
				//To 7x multiplier
				else if(pc.pregnancyIncubationBonusMotherRaw < 7)
				{
					textBuff += "Swarms of microsurgeons trickle into your womb";
					if(pc.totalVaginas() > 1) textBuff += "s";
					textBuff += ", gathering together in churning, electrified masses. You can feel tingles radiate the whole way out to your belly button as <b>your body is tuned into a baby-making machine.</b> Somehow you know those little robots aren’t ever going to entirely go away. They’ll be there helping your children grow faster than mere biology should allow, all so that you birth out as many fertile laquines as possible.";
					pc.pregnancyIncubationBonusMotherRaw = 7;
				}
				//To 10x multiplier
				else
				{
					textBuff += ParseText("A rumble comes from within your [pc.belly], but it isn’t your stomach or even your intestines. It’s your womb");
					if(pc.totalVaginas() > 1) textBuff += "s";
					textBuff += "... well, mostly your womb";
					if(pc.totalVaginas() > 1) textBuff += "s";
					textBuff += " but also your fallopian tubes and ovaries. Those organs are expanding as your body devotes more resources to their development and care. Warm tingles spread through every inch of them as your reproductive system slips into overdrive, preparing new connections for a thicker umbilical cord in order to feed your hyper-fast incubations, rewriting organs to produce growth-stimulating amniotic fluid.";
					textBuff += "\n\n<b>Your reproductive system has been hijacked to produce babies at ten times the normal rate, though you think your advanced immune system has kept the Laquine Ears from converting your eggs into pure-bred horse-bunnies.</b>";
					pc.pregnancyIncubationBonusMotherRaw = 10;
				}
			}
			//(Vagoo) Heat Extension (as minor) OR DEEP HEAT
			else if(select == 12)
			{
				//If not in heat, do minor heat bit.
				if(!pc.inHeat())
				{
					textBuff += "A fantasy bursts upon you, unbidden. What if you got pregnant? ";
					if(getPlanetName().toLowerCase() == "tavros station") textBuff += "Y";
					else textBuff += "Back at Tavros, y";
					textBuff += ParseText("ou have that whole nursery deck. Getting knocked up could be an advantage for you rather than a hindrance. Your [pc.belly] would swell up with young, all round and sexy, your [pc.nipples] dripping milk at the slightest provocation for your lovers and young alike. Your eyelashes flutter as you imagine yourself like that,");
					if(pc.legCount > 1) textBuff += ParseText(" [pc.legs] spread and");
					textBuff += " [pc.vaginas] dripping, so horny from your body’s altered hormones that you can outfuck even the most libidinous aliens.";
					//legs
					if(pc.legCount > 1) textBuff += ParseText("\n\nThen you realize that your [pc.legs] are sort of spread, all but begging passersby to breed you.");
					//No legs
					else textBuff += ParseText("\n\nThen you realize that you’re sort of sticking your [pc.butt] out, all but inviting passersby to breed you.");
					//Merge no new pg
					if(pc.tailCount > 0) 
					{
						textBuff += ParseText(" Your [pc.tails] ");
						if(pc.tailCount > 1) textBuff += "lift and wiggle";
						else textBuff += "lifts and wiggles";
						textBuff += ", an implicit advertisement of your desire to be taken and bred.";
					}
					textBuff += " Why are you like this? Why can’t you stop? You’ll do your best to stand normally, but the moment you stop thinking about it, you slip back into that submissive, needy pose. You feel flushed, hot, and a little dizzy, like you’re going to fall down in front of the first man you see, ass in the air, pussy on display. <b>Are you in heat? Is this what heat feels like?</b> There’s definitely an empty feeling in your womb, one that you instinctively understand that only a child could fix. Maybe you should go get knocked up - just get pounded by boy after boy until you get to be a mommy.";
					//Yay, heat!
					//v1 - fertility boon
					//v2 - minimum lust boost
					//v3 - libido boost
					//v4 - tease bonus!
					pc.createStatusEffect("Heat",5,25,10,3,false,"LustUp","Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+500% Fertility\n+25 Minimum Lust\n+10 Libido\n+3 Tease Damage",false,28800,0xB793C4);
				}
				//In heat, extend duration - only for normal garden variety heats. No special versions.
				else if(pc.inHeat() && pc.statusEffectv1("Heat") < 10 && pc.hasStatusEffect("Heat"))
				{
					//In heat, deep heat?
					textBuff += ParseText("You briefly wonder if you can get double-pregnant. Like, is there a mod out there that would let you get knocked up but stay in heat? That way you could feel the luxurious, beautiful feeling of your [pc.belly] expanding with children mixed with the insatiable need to breed. You could gather [pc.girlCumNoun] from your sopping cunt and smear it over yourself until your whole body shines, giving off a cloud of pheromones so potent that every laquine in the system would line up, just for a chance to sniff you.");
					textBuff += "\n\nThen all the cum they’d put in you would slip into some new eggs, and your belly would get too big for you keep adventuring. You’d be forced to lie there, pinned under the weight of your future offspring, playing with tits that just get bigger and milkier over time, fucking all day and all night with small breaks to give birth every few weeks. It could go on forever, you, getting dicked by the most virile, potent laquines the universe has to offer, your offspring repopulating their race.";
					textBuff += "\n\n<b>Your heat has massively deepened, leaving you in Deep Heat.</b> The pheromonal musk you exude has thickened into an overwhelming cloud, and a few drops of the wrong cum in ";
					if(pc.totalVaginas() > 1) textBuff += "a";
					else textBuff += "your";
					textBuff += " slit is liable to leave you happily pregnant. It’s incredibly difficult to view that as a bad thing, but it might be best to lock yourself in the ship for a few weeks if you want to keep ";
					if(pc.legCount > 1) textBuff += ParseText("your [pc.legs] closed.");
					else textBuff += "yourself from getting creampied every two steps.";
					pc.changeLust(100);
					//Yay, heat!
					//v1 - fertility boon
					//v2 - minimum lust boost
					//v3 - libido boost
					//v4 - tease bonus!
					pc.setStatusValue("Heat",1,10);
					pc.setStatusValue("Heat",2,35);
					pc.setStatusValue("Heat",3,25);
					pc.setStatusValue("Heat",4,5);
					pc.setStatusTooltip("Heat","<b>You are in a deep heat!</b> Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+" + pc.statusEffectv1("Heat") * 100 + "% Fertility\n+" + pc.statusEffectv2("Heat") + " Minimum Lust\n+" + pc.statusEffectv3("Heat") + " Libido\n+" + pc.statusEffectv4("Heat") + " Tease Damage");
					pc.extendHeat(7*24*60);
				}
				//Otherwise extend duration.
				else
				{
					textBuff += "Now that you think about it, getting knocked up would be pretty good. Sure, you’d have to carry around a kid or whatever, but you’d be all sexy with your belly all blown up. You could get sheer negligees that expose it and let your lovers rub their hands across it before they fuck you - because of course you’d be a super horny mommy. All those hormones, swimming around in your head? You’d be juicy and slutty, using your gravid tummy as an advertisement to show off just how much you like taking a bone.";
					if(pc.legCount > 1) 
					{
						textBuff += ParseText("\n\nYour [pc.legs] spread a little wider of their own accord");
						if(pc.tailCount > 0) textBuff += ParseText(", your [pc.tails] lifted high");
						textBuff += ".";
					}
					else
					{
						textBuff += ParseText("\n\nYour every motion adds a little extra wiggle to your [pc.hips]");
						if(pc.tailCount > 0) textBuff += ParseText(", your [pc.tails] lifted high");
						textBuff += ".";
					}
					if(pc.legCount == 1) textBuff += " Slithering";
					else textBuff += " Walking";
					textBuff += " around takes a little longer until you realize what you’re doing. <b>Your heat must have deepened. Who knows how long it will take to go away?</b> It’s the only explanation for why you feel so empty and fuckable, or why your body insists that every idle pose you adopt must be perfect for getting mounted.";
					pc.extendHeat(14*24*60);
				}
			}
			//Nonbun tails fall off.
			else if(select == 13)
			{
				if(pc.tailCountUnlocked(0))
				{
					textBuff += ParseText("Your balance shifts so suddenly that you nearly pitch forward onto your face. Luckily you windmill your arms just right and catch your balance, but not before you hear something ‘thump’ on the ground behind you. Turning back, you see your [pc.tails], desiccated and dead. That makes sense, you suppose. <b>The bottom of your tailbone has");
					if(pc.originalRace == "human") textBuff += " returned to its normal human-like state";
					else textBuff += " become strangely naked and bare";
					textBuff += ", leaving you bereft of posterior adornments.</b>";
					pc.removeTails();
				}
				else textBuff += ParseText(pc.tailCountLockedMessage());
			}
			//Grow bunbunpoof.			
			else if(select == 14)
			{
				if(pc.tailCountUnlocked(1) && pc.tailTypeUnlocked(GLOBAL.TYPE_LAPINE))
				{
					textBuff += ParseText("A slowly growing knot just above your [pc.butt] audibly strains, then pops, bringing you relief and concern in equal measure. You spin around, expecting something disgusting, but instead you discover that <b>you’ve grown a small bunny tail, complete with rapidly thickening fur.</b> The little puffball twitches as it acclimates to its new environment. How cute!");
					pc.tailCount = 1;
					pc.tailType = GLOBAL.TYPE_LAPINE;
					pc.clearTailFlags();
					pc.addTailFlag(GLOBAL.FLAG_FURRED);
					pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
				}
				else if(!pc.tailTypeUnlocked(GLOBAL.TYPE_LAPINE)) textBuff += ParseText(pc.tailTypeLockedMessage());
				else textBuff += ParseText(pc.tailCountLockedMessage());
			}
			//Scales/Chitin flake off to skin
			else if(select == 15)
			{
				if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
				{
					textBuff += ParseText("Your [pc.skinFurScales] ");
					if(pc.hasChitin()) textBuff += "is";
					else textBuff += "are";
					textBuff += " falling off.";
					if(pc.hasChitin()) textBuff += " Cracks spiderweb through it, spreading outward across your body.";
					else textBuff += " The smallest ones are the first to fall, dropping off before their larger brethren.";
					textBuff += " You brush the hardened detritus from your body to reveal the smooth, perfect skin below. And then the itching starts. Now that your skin has tasted freedom, it wants ";
					if(pc.hasChitin()) textBuff += "this onerous covering";
					else textBuff += "these onerous coverings";
					textBuff += ParseText(" removed. You scratch like a wild man, watching your [pc.skinFurScales] pile up around your feet until at last, you feel relief. <b>You have bare skin!</b>");
					pc.clearSkinFlags();
					pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
				}
				else textBuff += ParseText(pc.skinTypeLockedMessage());
			}
			//Feathers fall off to skin
			else if(select == 16)
			{
				if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
				{
					textBuff += "You’re molting! All over your body, your feathers are falling off! They collect around you in piles of soft plumage. As you dimly scratch a few stragglers from your shoulders, you wonder if they’d be any good in a pillow. Isn’t that how they used to make the things before Synthfluff was designed? <b>Your feathers are gone, leaving you with bare skin.</b>";
					pc.clearSkinFlags();
					pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
				}
				else textBuff += ParseText(pc.skinTypeLockedMessage());
			}
			//Big floofy armpaws for males, cutey paws for ladies
			else if(select == 17)
			{
				if(pc.armTypeUnlocked(GLOBAL.TYPE_LAPINE))
				{
					//Masculinez:
					if(pc.mf("m","") == "m")
					{
						//Already have floof arms
						if(pc.hasArmFlag(GLOBAL.FLAG_FURRED)) textBuff += "The fur on your arms thickens, then thickens some more. At the same time, your hands broaden. The joints take on new muscle and padding. You could probably strike a wall with your palm at full force without any pain. The bigger fingers would be perfect for grabbing cute laquine lasses with round laquine asses. <b>You have big, powerful paws.</b>";
						//No floof arms
						else textBuff += "Fur erupts out of your hands. It’s thick and " + pc.furColor + ". It grows denser by the minute, sending runners out along the veins in your arms to colonize with more fur. Your new coat spreads the whole way out to your elbows before you can truly comprehend what’s happening, and once there, it contents itself with filling in every spare inch of skin. Soft paw pads emerge on your fingers and palms while you’re distracted. Then your hands themselves grow bigger, <b>widening into powerful, masculine paws</b> that would be perfect for wrapping around a cute laquine heiny.";
					}
					//Femmyarms!
					else
					{
						if(!pc.hasArmFlag(GLOBAL.FLAG_FURRED)) textBuff += "Fur erupts all over your arms, from the tips of your fingers all the way back to your elbow. It thickens into a " + pc.furColor + " coat in no time. Then y";
						else textBuff += "Y";
						textBuff += "our digits narrow slightly before your eyes. Your fingers shorten as well, becoming daintier and less suited to manual labor. You can still grip a gun easily enough, but you can’t help but wonder how they’ll look during sex. Anything you grab with your tiny paws is going to look huge. To complete <b>your new, feminine paws</b>, pink pads emerge from your palm and fingertips.";
					}
					pc.clearArmFlags();
					pc.armType = GLOBAL.TYPE_LAPINE;
					pc.addArmFlag(GLOBAL.FLAG_FURRED);
					if(pc.mf("m","") == "m") pc.addArmFlag(GLOBAL.FLAG_THICK);
					pc.addArmFlag(GLOBAL.FLAG_PAWS);
				}
				else textBuff += ParseText(pc.armTypeLockedMessage());
			}
			//Revert to normal eyes
			else if(select == 18)
			{
				if(pc.eyeTypeUnlocked(GLOBAL.TYPE_HUMAN))
				{
					textBuff += "Everything goes blurry for a minute. You’re left wiping your eyes and wondering if you need to run to the doctor before everything snaps back into clear, vivid focus. You pull up your Codex’s front-facing camera to check yourself over and discover <b>your eyes have returned to normal!</b>";
					pc.eyeType = GLOBAL.TYPE_HUMAN;
				}
				else textBuff += ParseText(pc.eyeTypeLockedMessage());
			}
			//(Plain Skin && tail + ears) Bunfur sprouts
			else if(select == 19)
			{
				if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
				{
					textBuff += "Laquine-like fur steals a march on you, sprouting in thin wisps and tufts too small to notice. When you do discover your growing pelt, it responds by redoubling its growth, thickening into a lustrous coat of silky fur. You run your hands down it in awe. The smooth fibers slide between your fingers, and you admire the way the light shines off the new-grown coat. It grows almost everywhere, <b>giving you a layer of fur thick enough for any laquine to be proud of.</b>";
					pc.clearSkinFlags();
					pc.skinType = GLOBAL.SKIN_TYPE_FUR;
					pc.addSkinFlag(GLOBAL.FLAG_FURRED);
				}
				else textBuff += ParseText(pc.skinTypeLockedMessage());
			}
			//(Bodyfur) Bunnyface!
			else if(select == 20)
			{
				if(pc.faceTypeUnlocked(GLOBAL.TYPE_LAPINE))
				{
					//Half-bunny face
					if(pc.faceType == GLOBAL.TYPE_LAPINE)
					{
						textBuff += "Your jaw locks and you reflexively clasp your hands to your face. You can tell your face is about to change. Suddenly, whiskers sprout from between your fingers. Gritting your teeth, you feel your buck-toothed maw being dragged forward bit by bit. When it stops, you experimentally bite the air a few times. Surprised at the sudden change, you pull out your Codex for a peek. <b>You now have a laquine-like muzzle.</b>";
					}
					//Long muzzle
					else if(pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED) && pc.hasFaceFlag(GLOBAL.FLAG_LONG))
					{
						textBuff += ParseText("Your mouth pinches in uncomfortably. You clap a hand to your [pc.lipsChaste], but it does nothing to assuage the increasing tightness. Nor does it slow the effects of these troublesome ears one bit. You can feel your longer muzzle retracting into your face bit by aching bit. Extra teeth vanish into your gums, making way for your diminishing maw. Your front teeth bite your tongue once by accident, but that’s hardly a concern. The pinching feeling grows and grows, tighter and tighter with every quarter inch that fades from your muzzle.");
						textBuff += "\n\nWhen your nose is almost short enough to vanish from view, the pain finally stops, and a set of rabbit-like whiskers erupt from either side. <b>You have a lapine-style face, just like a laquine!</b>";
					}
					//Short muzzle
					else if(pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED))
					{
						textBuff += "Your jaw locks, muscles straining and rigid. Something is happening to your muzzle! You clap a hand to your moderately extended jawline and feel it flexing under your touch. The bones are shifting slightly as they adopt a new form. Whiskers burst out of either side of a nose that seems entirely too twitchy to be trusted. Your teeth ache briefly until your top incisors lengthen slightly. There’s no doubting it; <b>you have a lapine-like face, just like a laquine.</b>";
					}
					//No muzzle
					else
					{
						textBuff += "Your jaw locks, muscles straining and rigid. Something is coming. You clap your fingers to your face only to discover your jawline extending, the bones twisting like clay under a sculptor’s touch. Your toothy maw is dragged forward. A pinch above your incisors makes you wince before they drop down to give you the slightest hint of buck teeth. Whiskers sprout from between your fingers, and your damned nose won’t stop twitching. You give up on stopping the change and sit back, pulling out your Codex to examine <b>your new, laquine-like muzzle.</b>";
					}
					pc.clearFaceFlags();
					pc.faceType = GLOBAL.TYPE_LAPINE;
					pc.addFaceFlag(GLOBAL.FLAG_FURRED);
					pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
				}
				else textBuff += ParseText(pc.faceTypeLockedMessage());
			}
			//(Nofur) Half-Bunnyface!
			else if(select == 21)
			{
				if(pc.faceTypeUnlocked(GLOBAL.TYPE_LAPINE))
				{
					textBuff += "Your facial muscles are strained and rigid. Something is coming. You clap your fingers to your face only to discover your visage shifting and twisting like clay under a sculptor’s touch. A pinch above your incisors makes you wince before they drop down to give you the slightest hint of buck teeth. If that wasn’t unsettling enough, your damned nose won’t stop twitching. You give up on stopping the change and sit back, pulling out your Codex to examine yourself. <b>You now have a bunny-like face.</b>";
					
					pc.clearFaceFlags();
					pc.faceType = GLOBAL.TYPE_LAPINE;
					pc.addFaceFlag(GLOBAL.FLAG_SMOOTH);
				}
				else textBuff += ParseText(pc.faceTypeLockedMessage());
			}
			if(textBuff == "") textBuff += "ERROR. <b>Fenoxo fucked up.</b> Moderate Laquine Proc, Select state: " + select + " and Choices state: " + choices.length;
			AddLogEvent(ParseText(textBuff),"passive",deltaShift);
			return;
		}
		private static function laquineEarsMinorTFsGO(pc:Creature, deltaShift:uint):void
		{
			var x:int = pc.biggestCockIndex();
			var textBuff:String = "";
			var inPublic:Boolean = InPublicSpace();
			
			var choices:Array = [];
			//Public bonerstuff
			if(pc.hasCock() && inPublic && !pc.hasStatusEffect("Priapism")) choices.push(1);
			//Small length gain
			var maxSize:Number = 0;
			if(pc.hasPerk("Mini")) maxSize = 10;
			else if(pc.hasPerk("Hung")) maxSize = 20;
			else maxSize = 16;
			var cocks:Array = [];
			for(x = 0; x < pc.cockTotal(); x++)
			{
				if(pc.cocks[x].cLength() < maxSize && pc.cockLengthUnlocked(x, (pc.cocks[x].cLengthRaw + 0.2))) cocks.push(x);
			}
			//(Penis) Minor length gain (0.1"-0.2") up to (10" mini/16" norm/20" hung)
			if(cocks.length > 0) 
			{
				choices.push(2);
				choices.push(2);
				choices.push(2);
			}
			//Ball growth
			if(pc.hasCock() && pc.balls > 0 && pc.ballDiameter() < 4)
			{
				choices.push(3);
				choices.push(3);
			}
			//Bunny girl hallucination
			if(pc.hasCock()) choices.push(4);
			//(cuntwielder, nonpreg in one cunny) Bunnyhorse fantasies +10 lust
			if(pc.hasVagina()) choices.push(5);
			//(Vagicite) Awkward, random wetness with obvious pheromonal smell. Exhibition gains!
			if(pc.hasVagina()) choices.push(6);
			//(Vag && noheat && !preggos) Heat status for 1 week or till preggers. Temporary fertileboost.
			if(pc.hasVagina() && !pc.isFullyWombPregnant() && pc.fertility() > 0 && !pc.inHeat()) choices.push(7);
			//BonusCapacity Gainz.
			var cunts:Array = [];
			for(x = 0; x < pc.totalVaginas(); x++)
			{
				if(pc.vaginas[x].bonusCapacity < 20) cunts.push(x);
			}
			if(cunts.length > 0) 
			{
				choices.push(8);
				choices.push(8);
			}
			//(Hueg Boobers) Loose a cup size down to G.
			if(pc.biggestTitSize() > 15) 
			{
				choices.push(9);
				choices.push(9);
				choices.push(9);
				choices.push(9);
			}
			//Craving for grass + slowstatgain(1) aim to AQ50.
			if(pc.AQ() < 50) 
			{
				choices.push(10);
				choices.push(10);
				choices.push(10);
			}
			//Nose twitches + slowstatgain(1) reflex to RQ50.
			if(pc.RQ() < 50) 
			{
				choices.push(11);
				choices.push(11);
				choices.push(11);
			}

			var select:Number = 0;
			if(choices.length > 0) select = choices[rand(choices.length)];
			else if(pc.earType != GLOBAL.TYPE_LAPINE && pc.earType != GLOBAL.TYPE_QUAD_LAPINE) select = 12;

			//if(kGAMECLASS.debug) textBuff += "SELECT: " + select + "\n";
			if(select == 0)
			{
				//textBuff += "Totes an error. No event successfully procced.";
				textBuff += "A tingling sets atop your head and you feel a minor change incoming from the Laquine Ears... however, the feeling quickly fades away as soon as it arrives. Perhaps you are as laquine as you are going to get?";
			}
			//(Penis) Awkward, persistent boner. Large exhibitionism gains.
			//Hypercommon if criteria met to account for otherwise low chance.
			if(select == 1)
			{
				x = pc.biggestCockIndex();
				pc.lust(100);
				textBuff += "You flush from head to toe as your body abruptly shunts ";
				if(pc.biggestCockVolume() >= 800) textBuff += "most of your ";
				textBuff += "blood south to your loins, giving you an absolutely irrepressible erection. Your [pc.cocks] ";
				if(pc.cockTotal() == 1) textBuff += "is";
				else textBuff += "are";
				textBuff += " rock-hard. So hard ";
				if(pc.cockTotal() == 1) textBuff += "it almost hurts";
				else textBuff += "they almost hurt";
				textBuff += ".";
				if(!pc.isCrotchExposed()) textBuff += " Your [pc.crotchCover] presses painfully down upon your rigid tumescence in an awful way, forcing you to reach inside and yank it into a less awkward position";
				if(pc.biggestCockLength() >= 8) 
				{
					textBuff += ". Even then, there’s too much engorged cock in your crotch for you to feel comfortable in your clothing. You have to hunch over as you move to keep from hurting your poor prick";
					if(pc.cockTotal() > 1) textBuff += "s";
					textBuff += ".";
				}
				else
				{
					textBuff += " Your revealing attire clearly highlights your state for all to see.";
					if(pc.biggestCockLength() < 8)
					{
						if(pc.exhibitionism() < 50) textBuff += " Part of you is glad you’re modestly endowed enough that it doesn’t make too big of a show.";
						else textBuff += " Part of you is sad you’re too modestly endowed to make a show of it.";
					}
					else if(pc.biggestCockLength() < 20)
					{
						textBuff += " Part of you can’t help but ";
						if(pc.exhibitionism() >= 50) textBuff += "thrill";
						else textBuff += "cringe";
						textBuff += " at the amount of maleness you have on display. It juts forward no matter how you turn, impossible to ignore and threatening to bump into everything.";
					}
					else
					{
						textBuff += " Part of you can’t help but ";
						if(pc.exhibitionism() >= 66) textBuff += "exult";
						else if(pc.exhibitionism() >= 33) textBuff += "whine";
						else textBuff += "cower in shame";
						textBuff += " at the immense amount of maleness you have on display. It is by far your most prominent feature at the moment, arcing out and up ";
						if(pc.biggestCockLength() < 36) textBuff += "a couple feet";
						else if(pc.biggestCockLength() < 72) textBuff += "several feet";
						else textBuff += "countless feet";
						textBuff += " into the air, bouncing noticeably with every beat of your heart. The veins visibly swell and relax, and you feel your heart thumping in your ears, working overtime to keep your man-meat fully inflated and in view of everyone.";
					}
				}
				textBuff += "\n\nThe unwelcome boner won’t go away either.";
				var fluffChoices:Array = [0,1,2,3,4];
				while(fluffChoices.length > 2)
				{
					fluffChoices.splice(rand(fluffChoices.length),1);
				}
				textBuff += fluffyChoiceDisplay(fluffChoices[0]) + fluffyChoiceDisplay(fluffChoices[1]);
				
				//Covered
				if(!pc.isCrotchExposed())
				{
					textBuff += "\n\nKeeping yourself penned up inside your [pc.crotchCover] is agony. You fight it as long as you can, wincing and resting in hopes that it will vanish. It doesn’t. Finally, you can bear it no longer. Damn the consequences! You pull your [pc.crotchCover] open to allow your [pc.cocks] to spring out, fully erect and jutting, ";
					if(pc.cockTotal() > 1) textBuff += "each";
					else textBuff += "your";
					textBuff += " cockhead swollen. The open air feels so good against your monstrously swollen prick";
					if(pc.cockTotal() > 1) textBuff += "s";
					textBuff += " that you almost forget that you’re in public, but then, the damage is already done, isn’t it? [pc.EachCock] is on display to any who would dare look.";
				}
				//Merge
				//Randomly choose one.
				var exhibEvents:Array = [0,1,2];
				if(!pc.hasStatusEffect("Painted Penis")) exhibEvents.push(3);
				var exhib:int = exhibEvents[rand(exhibEvents.length)];
				
				//General ogle
				if(exhib == 0)
				{
					textBuff += "\n\nMen and women both ogle you as the walk by, whispering softly to each other. Some of them, you note, become aroused as well. More than one pair of pants tents, and at least one girl could cut diamonds with her nipples after staring a little too long to be completely casual.";
					if(pc.exhibitionism() < 33) textBuff += " You try your best to escape the crowds and hide with little success.";
					else if(pc.exhibitionism() < 66) textBuff += " You shyly press your hips forward to better show off, inwardly thrilling to the knowledge that someone is likely to go home and masturbate to you.";
					else textBuff += " You try your best to show off for your impromptu audience, wanting to moisten as many pussies and strain as many waistbands as possible.";
					textBuff += " After everyone in the immediate area has had their fill of your steel-hard member";
					if(pc.cockTotal() > 1) textBuff += "s";
					textBuff += " (and collected hundreds of holos of the bunny-eared " + pc.mf("heir","heiress") + " and [pc.hisHer] troublesome groin), the crowd finally thins.";
				}
				//Female Flashers
				else if(exhib == 1)
				{
					textBuff += "\n\nPlenty of people stop to score a peek at the slutty [pc.race] waving [pc.hisHer] [pc.cocks] for all to see, but there’s a small group of women who stand out from the crowd, mostly due to the size of their chests. They all have tits too large to be entirely natural, and yet they shamelessly display them anyway, wearing tops with plunging necklines, cleavage-displaying holes, or glossy, transparent fabrics.";
					textBuff += "\n\nIn your present state, you cannot stop your eyes from looking, nor your [pc.cockBiggest] from throbbing approvingly";
					if(pc.cumQ() > 4000) textBuff += " and drooling a torrent of [pc.cumVisc] pre-cum to puddle below";
					else if(pc.cumQ() > 2000) textBuff += " and drooling a fat stream of [pc.cumVisc] pre-cum";
					else if(pc.cumQ() > 200) textBuff += " and drooling a steady trickle of [pc.cumVisc] pre-cum";
					else if(pc.cumQ() > 20) textBuff += " and beading a bubble of [pc.cumVisc] pre-cum at its tip";
					textBuff += ".\n\n<i>“Omigod, look at [pc.himHer]!”</i> one chirps, covering her mouth and looking to her friend. Both of their nipples are visible erect.";
					textBuff += "\n\nThe second pouts, <i>“Yeahhh, [pc.heShe]’s hot, but [pc.heShe] looks sooo lonely.”</i> Chewing her lip, she turns to the others and asks, <i>“We should pay [pc.himHer] back somehow, right ladies?”</i>";
					textBuff += "\n\n<i>“Ooooh!”</i>";
					textBuff += "\n\n<i>“That sounds fun~”</i>";
					textBuff += "\n\n<i>“I guess, if you guys want to.”</i>";
					textBuff += "\n\n<i>“Don’t pretend you don’t want to, slut!”</i>";
					textBuff += "\n\nThey continue on like that, stepping closer. Soon, the group of big-boobed beauties has you completely surrounded. The first speaker peels her way out of her lycra clubwear, revealing a pair of creamy blue boobies. They shine in the light, a product of inhumanly smooth skin. The others follow their leader’s example in short order. One after another, bouncing breasts spill into the immediate area around your head. They press close, tit to tit, nipples inches from your face. One of the girls has the audacity to touch [pc.oneCock], giggling when it jumps in her hand.";
					textBuff += "\n\nYou groan, overwhelmed by the sinful sexuality of it all.";
					textBuff += "\n\nThe girls titter giddily at your reaction and smush closer, smothering your face in breasts and running hands ";
					if(pc.hasHair()) textBuff += "through your [pc.hair]";
					else textBuff += "over your head";
					textBuff += ". They jostle and jiggle, struggling with one another to get their boobs in front of your face. Some of them have multiple nipples on each tit. One has a seemingly unending amount of cleavage due to her two rows of three breasts. Another has smooth, pink scales covering her feminine hemispheres, sliding effortly across your body.";
					textBuff += "\n\nYou whimper again, your [pc.cocks] brushing their legs as their hands brush ";
					if(pc.cockTotal() == 1) textBuff += "it";
					else textBuff += "them";
					textBuff += ", but the leader pulls back before things can get any worse, stuffing her tits back into a top that seems far too small to contain such marvellous melons. <i>“That was fun, but we’re gonna miss our party if we play any longer. Did you enjoy?”</i> Her compatriots likewise pack their boobs away.";
					textBuff += "\n\n<i>“Bu... buh...”</i> You struggle for words, overheated and oxygen starved, vision swimming.";
					textBuff += "\n\nThe whole crowd giggles and turns away, asses swaying, tails flicking, panties moistening. One muses, <i>“It’s too bad [pc.heShe] doesn’t speak English or whatever. I kind of wanted [pc.hisHer] number.”</i>";
					textBuff += "\n\nThe blue-skinned beauty shrugs. <i>“Yeah, I bet [pc.heShe] would’ve loved this party.”</i> They vanish around a corner.";
				}
				//Drippy trap fapper
				else if(exhib == 2)
				{
					textBuff += "\n\nAmong the curious crowd is one small kui-tan individual, androgynous in the face with wide, curvy hips but lacking in even the most modest amount of chest. It’s the short-cropped hair and obvious bulge in his skirt that identifies his gender - male, despite the other trappings of femininity. He steps forward shyly, waiting for a reaction from you that never comes.";
					textBuff += "\n\nYou’re too busy eyefucking the femmy tanuki-boy, wondering if he’s going to sit on your [pc.cockBiggest], to do much else. The pressure in your loins is too distracting!";
					textBuff += "\n\nHe smiles and lowers himself down, bringing his head level with your crotch. There, he takes an experimental sniff, his animalistic nose twitching. He must like what he smells, because he sighs happily and pushes his nose into your crotch, this time inhaling with such ardor that you could clearly hear it from a dozen feet away.";
					textBuff += "\n\n<i>“Wha...”</i> You shudder when he stands and try to find your voice again, but your brain is suddenly devoid of blood.";
					textBuff += "\n\nThe trap straightens, revealing that his skirt is lifting, and more than that, he’s already dripping. Wet spatters of copious kui-tan prejaculate impact the ground between you. The raccoon boyslut sighs and rolls the skirt up out of the way to an eight-inch member... and a pair of tremendously swollen jewels. No wonder the hem on his skirt was so long. He was packing a pair of overstuffed melons, and the sight of you was just too much for him to resist.";
					textBuff += "\n\nHolding a hand beneath his leaky faucet, the trappy tanuki instantly fills his palm with gooey lust. He smears it over his knotty, burnished brown dick a second later, and moans harder, spurting a thicker line of clear ‘nuki goo across the ground. His wide eyes are fixed on your own throbbing member";
					if(pc.cockTotal() > 1) textBuff += "s";
					textBuff += " as he masturbates. His palm slides slowly at first, pumping once for every little bounce your prick";
					if(pc.cockTotal() > 1) textBuff += "s make";
					else textBuff += " makes";
					textBuff += ", but that rapidly falls away into full-on, furious stroking.";
					textBuff += "\n\nYou watch in disbelief";
					if(pc.cumQ() > 20) textBuff += ", dripping a bit more freely yourself";
					textBuff += ". He’s already masturbating; what harm would it do if you joined him? You reach down for your cock, but the wide-hipped alien grabs you by the wrist and pushes your hand against his furry balls, allowing you to feel the fluid sloshing within them.";
					textBuff += "\n\n<i>“Please,”</i> he whines, <i>“Squeeze.”</i>";
					textBuff += "\n\nYou do so almost before fully comprehending his request. His nut is soft in your hand, spongy almost. When you squeeze on its supple flesh, the tanuki-boy whimpers ecstatically and bucks his hips, throwing a long line of white into a nearby wall. He throws himself against you, his warm, silky body quivering as he erupts, his dick sliding against yours, spurting wildly, pumping and thrusting and spraying white so close to you without actually get on you. Well, a little jizz does dribble down his underside, smearing over your own length, but it’s hardly worthy of comment next to the erotic painting his release is creating.";
					textBuff += "\n\nYou rub the dwindling sack a little longer, feeling it drain its long-stored contents into his passionately twitching form moments before they spray out in long lances of white. The trap’s voice utters constant feminine coos of pleasure into your ear, his inky lips paying service to how sexy you are, and how you drove him to this with your display. How someday he wants to sit out in the open like you, his cock out and ready to be used by the first passerby.";
					textBuff += "\n\nIt’s nearly enough to make you cum yourself, but then he’s finished, kissing you on the cheek and staggering away, staining the front of his hastily donned skirt with still-dripping white. With his disappearance, the erotic moment seems to fade.";
				}
				//Cockpainting - reqs no cockpainting status.
				else if(exhib == 3)
				{
					textBuff += "\n\nFor a time, you’re merely ogled, but then a face appears among the crowd, brazenly walking up to you with a heavy-looking handbag. She’s a typical example of her race, totally unremarkable in most respects. <i>“I simply must paint you.”</i> Even her voice is forgettable. <i>“Do you consent?”</i>";
					textBuff += "\n\nThat at least sounds like something that might give you an excuse for being exposed, so you eagerly nod.";
					textBuff += "\n\n<i>“Okay then. Hold still.”</i> The alien artist kneels down and opens her bag, but instead of producing some kind of portable easel, she pulls out a tubular spraygun, spins the dial on the back, and kneels ";
					if(pc.legCount > 1) textBuff += "between your [pc.legs]";
					else textBuff += "in front of your [pc.leg]";
					textBuff += ". <i>“A proper base coat is essential.”</i> She pulls the trigger, and you feel a cool tingle as ";
					if(pc.cocks[x].cockColor != "pink" && pc.cocks[x].cockColor != "neon pink") textBuff += "neon-pink";
					else textBuff += "matte black";
					textBuff += " pigment spreads across your [pc.cock " + x + "]. She nods to herself, then gently lifts your blissfully engorged length to coat the underside. Your face blushes brighter the more she colors your cock. By the end of your tip-to-base basecoat, onlookers have gathered to watch the creation of art.";
					textBuff += "\n\n<i>“How lovely.”</i> Little miss Pic-a-cock-asso rubs you to make sure the paint has dried, then nods to herself while you try not to moan.";
					//small no new PG
					if(pc.cocks[x].cLength() < 8)
					{
						textBuff += " <i>“Yes, a glossy pink definitely suits you.”</i> She puts down another layer, this time of ";
						if(pc.cocks[x].cockColor != "pink" && pc.cocks[x].cockColor != "neon pink") textBuff += "pure gloss to really make the pink pop.";
						else textBuff += "an even brighter pink than your natural color.";
						textBuff += "\n\n<i>“Now to dress this cutie up.”</i> She pulls a smaller device from her back and spins the dial to select a glossy-looking purple. She slowly circles around your [pc.cockHead " + x + "], laying on a coat so thick it creates a raised ring. Then she grabs you by said ring, squeezing tight enough that it’s almost painful. One handed, the artist sketches a throbbing heart around your ";
						if(pc.cumQ() >= 200) textBuff += "leaky ";
						textBuff += "urethra, then accents it with tiny purple flowers. Another few seconds has her filling in the heart, leaving the barest slit for you to cum through. <i>“Lovely, but it’s still missing something...”</i>";
						textBuff += "\n\nThe cock-painter snaps her fingers in sudden inspiration. <i>“A little guy like this needs some volumizing and texture to truly meet his full potential.”</i> She reaches behind her and grabs another device, still holding the line tool in her right hand. Then she lays into your shaft, spinning an even thicker line out from your [pc.sheathOrKnot " + x + "], slowly curling its way up your length. At the same time, she ambidextrously adds details in between the ridges - red lipstick prints, pretty stars, and even a bit of text at the root that says, “fuck me.”";
						kGAMECLASS.flags["COCK_PAINTED_DESIGN"] = 1;
					}
					//Hyper no new PG
					else if(pc.cocks[x].cLength() >= 36)
					{
						textBuff += " <i>“Subjects like you really make me feel like I should pack more pigment on these little excursions. Fortunately, I think I can still have you covered. We’ll just have to do a little mixing.”</i> She puts down another layer, starting with a rich, iridescent purple, right around your [pc.knotOrSheath " + x + "].";
						textBuff += "\n\n<i>“I’ve seen galotians get practically hypnotized by members this large - New Texans too. A rainbow of pretty colors ought to accentuate the effect.”</i> The penis-painting alien swaps through a number of colors in sequence, each time covering a little more of your dick in pigments. After purple comes blue, then green, yellow, and so on through all the colors of the rainbow. Each new coat brings with it a sensuous tingle, forcing you to agonizing heights of arousal with no relief. By the time she finishes, your penis looks like it would be more at home in the sky after a rainstorm than on your crotch.";
						textBuff += "\n\n<i>“Any artist with an airbrush could pull off this look, but it takes a master to transform the rainbow pattern into a fractal masterpiece.”</i> She swaps her bulk sprayer for a smaller detail tool and goes to work. <i>“Every blending between colors is an opportunity to lay out a new pattern, mathematical in precision but with the sort of beauty you’d find in nature.”</i> Her hands gently caress you as she works, the short bursts of sprayed colors tickling already hyper-sensitized neves. When you look down, your eyes nearly cross from the hyper-detailed rainbow that fills your view.";
						textBuff += "\n\nStill working, the artist chides, <i>“Hold still, I’m not done yet.”</i> She swaps back to her bigger sprayer and selects something that looks like clear coat. <i>“Just have to put a few more touches on it.”</i> She lacquers your cock from [pc.sheathOrKnot " + x + "] to tip, giving it a glossy shine that would draw the eye even without the hypnotic rainbow scrawled across your length. <i>“Annnnd, here we go.”</i> The gun flashes blindingly bright, and when you look back at your dick, it’s <i>twinkling</i>. A sea of glittery lights sparkle in and out of existence all over, completing the dazzling look.";
						textBuff += "\n\nThe perverse painter pulls her lining tool out and draws a few enormous kiss-marks on different parts of your [pc.cock " + x + "]. <i>“The appearance of popularity ought to get the girls even more worked up.”</i> She kisses her own work then, blushing. <i>“But you’re already popular with me.”</i> Right where she kissed, she sculpts a big pair of green lips out of the thick pigments. Atop them, she writes out in big looping letters, “Galaxy’s Best Dick.”";
						kGAMECLASS.flags["COCK_PAINTED_DESIGN"] = 2;
					}
					//Horsecock no new PG
					else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT) && pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED))
					{
						textBuff += " <i>“Yes, a gleaming black would suit you. It must look every bit as glossy as a meticulously brushed show pony.”</i> She puts down another layer, this time in ultra-shiny black, as deep and dark as the deepest ocean and as reflective as a well-cut gemstone.";
						textBuff += "\n\n<i>“Now we can’t have an animal like this just running willy nilly all over the barnyard, knocking up all our mares, can we?”</i> She looks up at you, eyes twinkling as she pulls a new tool from her bag. This one is much smaller. She selects a tawny color and presses it to the underside of your equine dick, just below the blunted head, and pulls the trigger. Thicker paint comes out of this one, building up into a textured band that she slowly draws the whole way around your flaring cock. Once complete, she draws two connecting lines across the very top, giving it the appearance of wearing a leather harness. Four quick sprays create gleaming, metallic-looking connectors.";
						textBuff += "\n\n<i>“We need a lead for the handler, of course.”</i> She pushes your dick up and connects another band of yellow-brown color to the faux harness, slowly working it down the underside of your dick along the urethra. She makes sure that this band is the thickest one yet, but she’s quick to cross the medial ring, making your “lead” truly look like more than mere penis-paint. Another ring is created just outside your sheath, every bit as thick as the lead, which is then “bolted” to it with a flash of golden color.";
						if(pc.hasSheath(x)) textBuff += " When you go soft, you’re sure to feel the raised art rubbing on the sensitive interior of your sheath.";
						textBuff += "\n\nYour cock throbs mightily, but this perverted princess of pigment is far from done. She swaps the line tool for a smaller one, for fine details, then proceeds to lay in lines alongside the bands. They don’t look like much at first, but after a minute, you realize they make you look like your glossy-black horse-dick is bulging against the bands, like there’s so much swelling up inside the harness that it’s trying to split its way out. A circular ornament near the baseband completes the look, bearing a line of embossed text that reads, “Free Stud Services.”";
						kGAMECLASS.flags["COCK_PAINTED_DESIGN"] = 3;
					}
					//Dogcock no new PG
					else if(InCollection(pc.cocks[x].cType, [GLOBAL.TYPE_CANINE, GLOBAL.TYPE_KORGONNE, GLOBAL.TYPE_MILODAN]) && pc.hasKnot(x))
					{
						textBuff += " <i>“While orange would be traditional for canine-style cocks, I think a neon orange lends them a certain eye-catching flair.”</i> She puts down another layer, this time an orange so bright it practically glows.";
						textBuff += "\n\n<i>“After all, a big dog-dick like this needs to properly advertise that it’s a real bitch-breaker.”</i> She squeezes you around your base to hold you still while reaching back into her back for another tool. This one is smaller than the big sprayer, with a more precise tip. She thumbs it over to black while sizing up your knot, gently squeezing. <i>“I’d be doing my galactic sisters a disservice if I didn’t properly tag this dangerous equipment.”</i> She brings her sprayer up, just below the tip of your urethra and begins to lay down a thick line of instantly bonding-pigment, heavy enough that it’ll provide a raised texture for your future partners. She expertly creates one short diagonal line, then another in perfect parallel, working until your whole [pc.cock " + x + "] is snugly encased in the kind of black-and-orange warning pattern you’d see on construction equipment.";
						textBuff += "\n\nThrough it all, your arousal has only climbed, enlarging your knot alongside it.";
						textBuff += "\n\n<i>“Oh my, that’s a real wrecking ball you’ve got there. Let’s make it look the part, shall we?”</i> She artfully spins her “gun” on a finger, showing off a little before bringing it down against your thickening canine anatomy. This time, she doesn’t make small lines, instead choosing to fill the entire area with metallic black. By the time she finishes, your [pc.cock " + x + "] is twitching and dripping in eagerness, but she is far from finished.";
						textBuff += "\n\nThe penis-painter changes out her liner for a detail gun and goes right back to work, texturing your bulbous knot to better resemble the construction equipment to which she compared it. She even goes through the trouble to paint a small, glittering chain from your urethral slit down underside to connect to the “ball” itself. As a final touch, in bright orange, she paints, “Bitch Wrecker” on top of your knot.";
						kGAMECLASS.flags["COCK_PAINTED_DESIGN"] = 4;
					}
					//normal no new PG
					else
					{
						textBuff += " <i>“Yes, a semi gloss blue definitely suits you, though I hardly think you’ll struggle with blue balls once I’m done.”</i> She puts down another layer, this time of a rich, regal-looking blue.";
						textBuff += "\n\n<i>“Now to dress this guy up.”</i> She pulls a smaller device from her back and spins the dial to select a glossy-looking red, then clicks it to add a purple gradient into the mix. She starts near your [pc.sheathOrKnot " + x + "]. This time it isn’t just a light coat of body paint but a thicker slurry that builds up as she sprays it, allowing her to create jutting purple-to-red spikes, rounded at the tips to rub on sensitive nerves. She lays them out all over your shaft, bigger at the base and smaller and more purple at the tip, with a gentler, almost innocuous curvature. <i>“Mmm, now that looks like a wonderful member, but it still lacks a certain pizazz.”</i>";
						textBuff += "\n\nThe cock-painter snaps her fingers in sudden inspiration. <i>“A big guy like this needs a crown worthy of a king, something to get the ladies.”</i> She looks up at you, then shrugs and adds, <i>“Or boys, whichever. They need to know that you have a vessel fit for royal vaginas.”</i> She toggles the color over to orange and lays out a crown over your tip, lighter textured than the nubs but with enough of a ridge for your partner to feel it.";
						textBuff += "\n\n<i>“Good... but it needs more.”</i> She swaps the color to a gem-like ruby and embeds extra adornments to the golden crest. In no time at all, your member looks positively regal from the top - and positively fuck-hungry below. Your alien artist isn’t done yet, however. She grabs a different device from her bag and proceeds to put extra detail work in-between the jutting cockstuds. In some places, she highlights the bulge of your veins, in others she adds faux black bands that appear to be cinched down about your girth. Finally, she scrawls, “Sex God” on your [pc.knot " + x + "].";
						kGAMECLASS.flags["COCK_PAINTED_DESIGN"] = 0;
					}
					//Merge
					textBuff += "\n\nWith her work complete, the artist pulls out her phone and snaps a quick holo, being sure to scan you from every single side";
					if(pc.cumQ() >= 200) textBuff += ", ignoring the pre-cum pouring out of your prettied-up penis";
					textBuff += ". <i>“Thanks";
					if(kGAMECLASS.flags["COCK_PAINTED_EXHIB_EVENT"] != undefined) textBuff += " again";
					textBuff += ". You";
					if(kGAMECLASS.flags["COCK_PAINTED_EXHIB_EVENT"] != undefined) textBuff += "’re always a wonderful subject";
					else textBuff += " were a wonderful subject.";
					textBuff += "”</i> She starts to leave, then sees your questioning look. <i>“";
					if(kGAMECLASS.flags["COCK_PAINTED_EXHIB_EVENT"] == undefined) textBuff += "The Organobond paint only lasts a few weeks, so don’t sweat it too much. Maybe I’ll paint you again sometime. Y";
					else textBuff += "Like I said last time, the Organobond paint only lasts a few weeks, and y";
					textBuff += "ou can always find my sister’s shop if you want to pay for ‘fine’ art.”</i> She sniffs disdainfully and vanishes into the rapidly dispersing crowd.";
					IncrementFlag("COCK_PAINTED_EXHIB_EVENT");
					//apply paint!
					//v1 - painted penor.
					//v2 - tease damage bonus.
					//v3 - tease cap bonus
					//v4 - temporary libido boost.
					pc.createStatusEffect("Painted Penis",x,2,5,5,false,"LustUp","With your phallus professionally painted, you feel slightly more libidinous. Your crotch-based teases will likely be more effective against those vulnerable to them.\n\n+2 Tease Damage\n+5 Tease Damage Cap\n+5 Libido",false,28800,0xB793C4);
					pc.libidoMod += 5;
				}
				//Merge
				textBuff += "\n\nIt’s at that moment that you feel your blood pressure stabilize and your [pc.cocks] softening by the slightest amount. Your flush gradually - very gradually - fades, and while you are still horny, you are confident that in a short amount of time, you’ll be ";
				if(pc.isCrotchExposed()) textBuff += "back to normal";
				else textBuff += "able to tuck yourself away. Whew";
				textBuff += ".";
				pc.exhibitionism(2);
				pc.slowStatGain("libido",1);
				textBuff = ParseText(textBuff);
				//Reduce lust now that it's over.
				pc.changeLust(-50);
			}
			//(Penis) Minor length gain (0.1"-0.2") up to (10" mini/16" norm/20" hung)";
			if(select == 2)
			{
				x = cocks[rand(cocks.length)];
				if(pc.cocks[x].cLength() < 6) textBuff += "Tightness radiates from your [pc.cock " + x + "] as it grows palpably bigger, though not by a tremendous amount - just enough for you to know that the Laquine Ears are definitely working on the equine part of their name.";
				//Less than 10"
				else if(pc.cocks[x].cLength() < 10) textBuff += "Ooh, your [pc.cock " + x + "] gets nice and warm, like it’s being dipped into a hot tub and swelling up from the heat. The sensation fades a few seconds later, but the slight addition to your size remains.";
				//Less than 16"
				else if(pc.cocks[x].cLength() < 16) textBuff += "Stifling an unexpected moan, you shudder as pleasure races through your body, pooling in your [pc.cock " + x + "]. As a matter of fact, that pleasure seems to be collecting inside it, feeling almost like it’s swelling you with expansive euphoria. You measure yourself disbelievingly, but you have in fact gained a small fraction of an inch in length.";
				//else
				else textBuff += "Your [pc.cock " + x + "] briefly swells, not notable in and of itself, but this time it feels a little different, like something more than just getting a boner. You check as the feeling fades, but you can’t spot any real difference. Maybe you gained some imperceptible amount of length from the Laquine Ears. Maybe not. It’s tough to tell when you’re swinging around such a big dick.";
				textBuff = ParseText(textBuff);
				textBuff += laquineDickSizeAlert(pc.cocks[x].cLength(), pc.cocks[x].cLength() + 0.2);
				pc.cocks[x].cLength(0.2);
			}
			if(select == 3)
			{
				//(Balls & Penor) Minor ball size gain of 0.1. Max 4" diameter
				//less than 1"
				if(pc.ballDiameter() < 1) textBuff += "Warmth flows through your [pc.sack], leaving you with slightly larger [pc.balls].";
				//Less than 2"
				else if(pc.ballDiameter() < 2) 
				{
					textBuff += "A tenderness wells up in your [pc.sack], pulling it tight to your body. You reach down and gently probe your [pc.balls], feeling ";
					if(pc.balls == 1) textBuff += "it";
					else textBuff += "them";
					textBuff += " relax a moment later. You think you’ve gotten slightly larger.";
				}
				//Less than 3"
				else if(pc.ballDiameter() < 3)
				{
					textBuff += "You sit down for a moment to rest, and something unusual happens. A sharp twinge of pain pinches your [pc.sack]";
					if(pc.legCount > 1) textBuff += ", forcing you to spread your [pc.legs]";
					else textBuff += ", forcing you to stretch out";
					textBuff += " to take the pressure off. Gently rubbing, the pain fades, but you find your [pc.balls] a little heavier than before.";
				}
				//Less than 4"
				else
				{
					textBuff += "An achingly pleasant throb runs through your [pc.balls] once... twice, then fades into nothing. You shift around, gently rubbing your swollen sack, feeling a little more lusty and a lot more potent. Your";
					if(pc.balls == 1) textBuff += " testicle has";
					else textBuff += " balls have";
					textBuff += " gotten slightly larger.";
				}
				textBuff = ParseText(textBuff);
				laquineBallSizeUp(pc);
			}
			//(Penorhaver) Bunnygirl Hallucinations +10 lust
			if(select == 4)
			{
				bunnyGirlFapScene(pc,false,deltaShift);
				return;
			}
			//(cuntwielder, nonpreg in one cunny) Bunnyhorse fantasies +10 lust
			if(select == 5)
			{
				bunnyguyFapScene(pc,false,deltaShift);
				return;
			}
			//(Vagicite) Awkward, random wetness with obvious pheromonal smell. Exhibition gains!
			if(select == 6)
			{
				textBuff += "You catch a whiff of a familiar smell... like pussy. Rich, fertile, hormonal pussy.";
				if(inPublic) textBuff += " You cast your eyes around to look for the source. Perhaps a sly woman is having a little play with a hidden vibrator. That or there’s a soaking wet minx looking for dick around the corner.";
				else textBuff += " You briefly cast your eyes around, suspecting an ambush from some horny alien. Perhaps there is some plant life that smells just like vaginal secretions?";
				textBuff += " No, wait. You’re the one that smells like sex. You’re the one with a ";
				if(pc.wettestVaginalWetness() >= 4) textBuff += "drooling";
				else if(pc.wettestVaginalWetness() >= 3) textBuff += "sopping";
				else if(pc.wettestVaginalWetness() >= 2) textBuff += "soaked";
				else textBuff += "slippery";
				textBuff += " slit, the one whose pussy is putting out more pheromones that you thought your body capable of.";
				//Public";
				if(inPublic)
				{
					textBuff += "\n\n";
					if(pc.isBimbo()) textBuff += "Omigod, you can’t believe you got so wet from nothing at all. It makes you so happy, knowing that you don’t even need to think of boys to get all slutty and drippy!";
					else if(pc.exhibitionism() < 33) textBuff += "It’s so embarrassing to know that you’re out in public, smelling like some freshly fucked slut. Your blush is so intense that it burns.";
					else if(pc.exhibitionism() < 66) textBuff += "It’s sort of embarrassing to know that anyone who walks past you will think you smell like sex, that you’re a wet and willing piece of ass who’s all juiced up from her latest tryst. At the same time, you can enjoy the thrill it gives you. After all, you look no different than at any other time, save for a little additional dampness in the crotch.";
					else textBuff += "It’s so exciting, knowing that everyone around you can smell you, how wet and ready you are to be taken and fucked. You discretely fan yourself to spread the smell around, smiling when you catch an upturned nose and tightened trousers.";
					textBuff += " [pc.GirlCum] trickles down your [pc.thighs] as you walk, soaking into your [pc.skinFurScales]. You’re going to need a shower if you ever want to stop smelling like pussy.";
				}
				//Not public";
				else
				{
					textBuff += "\n\nWhat if someone approaches you while you’re like this? ";
					if(pc.exhibitionism() < 50) textBuff += "Your cheeks go crimson in shame, but it doesn’t stop the scent from dripping forth from your [pc.vaginas].";
					else if(pc.exhibitionism() < 66) textBuff += "Your cheeks go crimson with a mix of shame and arousal. They’ll know how your body is misbehaving, making you smell like a slut in heat. It’s sort of sexy, knowing they’ll probably get a huge boner before they even see you. And then you’ll have to fight them off... or let them fuck you.";
					else textBuff += "You flush in arousal at the thought. They’ll know your body is just a big fountain of fuckable wetness and slut-scents, and they’ll have the biggest, horniest boner, all for you. You catch yourself whimpering a time or two, the flow of lubrication thickening.";
					textBuff += " [pc.GirlCum] is getting all over your thighs, soaking into your [pc.skinFurScales]. You’ll need a shower if you ever want to stop smelling like pussy!";
				}
				textBuff += "\n\n<b>These ";
				if(pc.isBimbo() || pc.libido() >= 70 || pc.inHeat()) textBuff += "sexy";
				else textBuff += "stupid";
				textBuff += " Laquine Ears are turning you into a horny bunny!</b>";
				textBuff = ParseText(textBuff);
				pc.exhibitionism(1);
				pc.slowStatGain("libido",1);
				pc.changeLust(33);
				pc.applyPussyDrenched();
			}
			//(Vag && noheat && !preggos) Heat status for 1 week or till preggers. Temporary fertileboost.
			if(select == 7)
			{
				textBuff += "A fantasy bursts upon you, unbidden. What if you got pregnant? ";
				if(getPlanetName().toLowerCase() == "tavros station") textBuff += "Y";
				else textBuff += "Back at Tavros, y";
				textBuff += "ou have that whole nursery deck. Getting knocked up could be an advantage for you rather than a hindrance. Your [pc.belly] would swell up with young, all round and sexy, your [pc.nipples] dripping milk at the slightest provocation for your lovers and young alike. Your eyelashes flutter as you imagine yourself like that,";
				if(pc.legCount > 1) textBuff += " [pc.legs] spread and";
				textBuff += " [pc.vaginas] dripping, so horny from your body’s altered hormones that you can outfuck even the most libidinous aliens.";
				//legs
				if(pc.legCount > 1) textBuff += "\n\nThen you realize that your [pc.legs] are sort of spread, all but begging passersby to breed you.";
				//No legs
				else textBuff += "\n\nThen you realize that you’re sort of sticking your [pc.butt] out, all but inviting passersby to breed you.";
				//Merge no new pg
				if(pc.tailCount > 0) 
				{
					textBuff += " Your [pc.tails] ";
					if(pc.tailCount > 1) textBuff += "lift and wiggle";
					else textBuff += "lifts and wiggles";
					textBuff += ", an implicit advertisement of your desire to be taken and bred.";
				}
				textBuff += " Why are you like this? Why can’t you stop? You’ll do your best to stand normally, but the moment you stop thinking about it, you slip back into that submissive, needy pose. You feel flushed, hot, and a little dizzy, like you’re going to fall down in front of the first man you see, ass in the air, pussy on display. <b>Are you in heat? Is this what heat feels like?</b> There’s definitely an empty feeling in your womb, one that you instinctively understand that only a child could fix. Maybe you should go get knocked up - just get pounded by boy after boy until you get to be a mommy.";
				textBuff = ParseText(textBuff);
				//Yay, heat!
				//v1 - fertility boon
				//v2 - minimum lust boost
				//v3 - libido boost
				//v4 - tease bonus!
				pc.createStatusEffect("Heat",5,25,10,3,false,"LustUp","Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+500% Fertility\n+25 Minimum Lust\n+10 Libido\n+3 Tease Damage",false,28800,0xB793C4);
			}
			//(Vag) Feeling of emptiness leads to fingering... +5 vag capacity to max of 20
			if(select == 8)
			{
				x = cunts[rand(cunts.length)];
				textBuff += "A palpable sensation of emptiness overwhelms you, though not everywhere. It centers ";
				if(pc.legCount > 1) textBuff += "between your [pc.legs]";
				else textBuff += "below the waist";
				textBuff += " in your [pc.vagina " + x + "]. You try to ignore it, but it only grows stronger the longer you wait. Fuck it! You cast your eyes around, making sure that nobody is paying you any mind, then stuff your fingers deep into your [pc.vagina " + x + "], finding that they slip in with far more ease than they ought to. <b>Though you are no looser, you can take larger insertions with ease, allowing you to take bigger dicks before you start to stretch.</b>";
				textBuff += "\n\nThe urge fades, but not before you have a dizzy grin plastered on your face.";
				textBuff = ParseText(textBuff);
				pc.changeLust(10);
				pc.vaginas[x].bonusCapacity += 5;
			}
			//(Hueg Boobers) Loose a cup size down to G.
			if(select == 9)
			{
				textBuff += ParseText("Your [pc.chest] aren’t quite as wobbly. You feel around, discovering that <b>");
				if(pc.bRows() == 1) textBuff += "you now fit";
				else textBuff += "your biggest tits have shrunk down to";
				
				x = pc.biggestTitRow();
				pc.breastRows[x].breastRatingRaw -= (1 + rand(4));
				if(pc.breastRows[x].breastRatingRaw < 0) pc.breastRows[x].breastRatingRaw = 0;
				
				textBuff += ParseText(" [pc.breastCupSize " + pc.biggestTitRow() + "]</b>. If you want huge tits, it might be best to get them back after you finish up with the Laquine Ears. After all, how would you hop about with eighty pound boobs hanging off your chest?");
			}
			//Craving for grass + slowstatgain(1) aim to AQ50.
			if(select == 10)
			{
				textBuff += "You feel a little peckish. You could really go for a salad. No dressing or anything, just lush, leafy greens for you to nibble on. You would wolf down buckets of the stuff, you’re sure. Mmm, that would be the best. Your eyes dart around, keen and steady, looking for something to munch on. Even grass would do! <b>Your aim is more focused.</b>";
				pc.slowStatGain("aim",1);
			}
			//Nose twitches + slowstatgain(1) reflex to RQ50.
			if(select == 11)
			{
				textBuff += "Your nose won’t stop twitching, wrinkling and relaxing in rapid succession. You must look like some kind of rabbit, sniffing with your nose cutely wiggling. It stops after a minute of involuntarily adorableness, but not before leaving you feeling extra twitchy all over. <b>Your reflexes have improved.</b>";
				pc.slowStatGain("reflexes",1);
			}
			if(select == 12)
			{
				textBuff += "The Laquine Ears don’t seem to be doing a damned thing. Damnit!";
			}
			if(textBuff == "") textBuff += "ERROR. Fenoxo fucked up. Minor Laquine Proc, Select state: " + select + " and Choices state: " + choices.length;
			AddLogEvent(ParseText(textBuff),"passive",deltaShift);
			return;
		}
		
		private static function fluffyChoiceDisplay(arg:Number):String 
		{
			if(arg == 0) return " When you try to do some math, the numbers just wind up fucking.";
			else if(arg == 1) return " When you picture a disgusting old woman, your mind peels back the effects of age to see the beauty she once was.";
			else if(arg == 2) return ParseText(" When you shake your head to try and get ahold of yourself, it just makes your [pc.cocks] wiggle, pleasantly tugging on your excited loins.");
			else if(arg == 3) return ParseText(" When you flex your other muscles, trying to draw the blood away, [pc.eachCock] flexes too, shattering your focus on anything but your excited loins.");
			else if(arg == 4) return " When you think about something nonsexual, like your ship for instance, you can’t help but notice how graceful its curves are, how pretty a figure it cuts against the stars, and how much you’d love to make love with a cute bunny-girl on top of it.";
			else return " When you try to distract yourself with stellar navigation, you instead mentally draw sexy constellations among the stars, clumping whole systems together into curvy, rabbit-eared lasses.";
		}
		private static function laquineDickSizeAlert(old:Number,newS:Number):String
		{
			//seven inches
			if(old < 7 && newS >= 7) return " <b>You’ve crossed over the threshold to having a seven inch dick - average for Terrans in this galaxy.</b>";
			//11"+
			else if(old < 11 && newS >= 11) return " <b>You’re nearly a foot long. It’ll be almost impossible to hide, but on the flipside, there’s so much more of you to please. You can only imagine how good sinking all these inches in is going to feel.</b>";
			//Fourteen
			else if(old < 14 && newS >= 14) return " <b>You’re big enough to match the length of many races’ forearms. Big enough to put a bulge in almost anyone’s belly.</b>";
			//18+
			else if(old < 18 && newS >= 18) return " <b>You’d better be careful now that your dick is this big. An errant boner could easily rip right through cheap underwear. On the flipside, you’re fairly certain you can please a centaur with ease.</b>";
			return "";
		}
		private static function laquineBallSizeUp(pc:Creature):void
		{
			var targetS:Number = 1;
			if(pc.ballDiameter() < 1) targetS = 1;
			else if(pc.ballDiameter() < 2) targetS = 2;
			else if(pc.ballDiameter() < 3) targetS = 3;
			else if(pc.ballDiameter() < 4) targetS = 4;
			else if(pc.ballDiameter() < 5) targetS = 5;
			else targetS = 7;
			while(pc.ballDiameter() < targetS)
			{
				pc.ballSizeRaw += 1;
			}
		}
		public static function lassLaquineAcceptable(pc:Creature,cIdx:int):Boolean
		{
			return (cIdx >= 0 && (pc.earType == GLOBAL.TYPE_LAPINE || pc.earType == GLOBAL.TYPE_QUAD_LAPINE) && pc.cocks[cIdx].cType == GLOBAL.TYPE_EQUINE && pc.cocks[cIdx].cLength() >= 16 && pc.tailCount >= 1 && pc.tailType == GLOBAL.TYPE_LAPINE && pc.armType == GLOBAL.TYPE_LAPINE);
		}
		public static function bunnyGirlFapScene(pc:Creature,masturbate:Boolean = false,deltaShift:Number = 0):void
		{
			var textBuff:String = "";
			if(masturbate)
			{
				clearOutput();
				kGAMECLASS.showName("HORNY\nBUNNY");
				textBuff += "Thinking back to the imaginary bunny-girl Laquine Ears introduced you to, you mentally call out to her, wishing for her to arrive and help you out with your troublesome, animalistic lust. There’s nothing there when you open your eyes, however. The scene is the same as the last time you looked around.\n\n";
			}
			if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == undefined) textBuff += "You catch a flash of movement out of the corner of your eye. Was that... a pair of bunny ears? They disappeared behind a corner, but you could swear you caught a glimpse of a white-furred bunnygirl. A faint giggle carries to your ears on the breeze from behind you, and you spin to find her standing there - a nude laquine female, giggling at the imitation ears on your headband.";
			//1
			else if(rand(4) == 0) textBuff += "<i>“Surprise!”</i> the girlish voice of your hallucinatory lover chirps as she vaults over your head, twirling through the air with inhuman agility to land some ten feet away. Those rabbit legs are truly powerful.";
			//2
			else if(rand(3) == 0) textBuff += "<i>“Over here!”</i> the familiar voice of your hallucinatory lover chirps from the right. You look that way but can’t quite find her. When you look back in frustration, she’s standing straight in front of you, smiling shyly. <i>“Good to know I can still surprise you,”</i> she giggles, brushing a floppy ear into position.";
			//3
			else if(rand(2) == 0) textBuff += "<i>“Look out below!”</i> your hallucinatory lover screams from somewhere high above, moments before crashing down in front of you. A ring of dust puffs outward from her hard landing, but she looks just fine as she stands up. Better than fine even. <i>“Sorry about that. Didn’t want you to get bored and change your mind waiting for me...”</i>";
			//4
			else textBuff += "<i>“Hi.”</i> Your hallucinatory lover appears in the blink of an eye, literally. One moment there’s empty space, the next she’s standing there, bouncing on her large footpaws and grinning. <i>“So glad I didn’t miss it.”</i> Her nose twitches. <i>“I couldn’t bear to know you had to take care of your dick all by yourself.”</i>";
			//Merge
			textBuff += "\n\nShe’s very typical of her race, with big fluffy footpaws, silky body fur that does little to hide her ";
			if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == undefined) textBuff += "pert, B-cup";
			else if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 1) textBuff += "bouncy, D-cup";
			else if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 2) textBuff += "motherly E-cup";
			else if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 3) textBuff += "pillowy FF-cup";
			else textBuff += "milky M-cup";
			textBuff += " breasts, and long, droopy ears that hang down the back of her head as she nervously approaches you. The closer she gets, the more you can make out the finer details of her appearance. Pink nipples jut teasingly from amongst her ivory fur, and her eyes are a brilliantly reflective copper. Most importantly of all, you realize that you can smell the fertile scent of her pussy";
			if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] != undefined) textBuff += " once again";
			textBuff += ". She’s in heat";
			if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] != undefined) textBuff += " and ready for her next breeding! How does she pop out kids so fast?";
			textBuff += "!";
			textBuff += "\n\nWordlessly, she sinks to her knees in front of you. Her puffy tail twitches happily as she nuzzles up to your crotch. Her fingers deftly seek out your [pc.cockBiggest]";
			if(!pc.isCrotchExposed()) textBuff += ", tugging it free from its irksome confinement.";
			else textBuff += ", gently cradling it.";
			var x:int = pc.biggestCockIndex();
			//2smol. No new PG.
			if(pc.cocks[x].cLength() < 8)
			{
				textBuff += ParseText(" <i>“Oh my it’s so small still. You aren’t quite big enough to mate a girl like me, not yet.”</i> She rubs you slyly, teasing your undersized dick with her fluffy, paw-like hands. <i>“You’re going to have to use more Laquine Ears if you want to be " + pc.mf("man","woman") + " enough. And after that, maybe keep using them, just to see how big you can get.”</i> She kisses your [pc.cockHeadBiggest], slipping her tongue out to whirl around it. <i>“I’d better be on my way. Maybe you’ll be big enough to breed me next time...”</i>");
				textBuff += "\n\nThe mysterious laquine rolls away, a sad smile on her face. <i>“My pussy is just so... empty.”</i>";
				textBuff += "\n\nYou reach for her, but she’s already hopping away. The further she gets, the less visible her form becomes until she vanishes entirely, like she never existed at all. Did you just hallucinate that? Even if the bunny wasn’t real, the leftover arousal is.";
				pc.changeLust(10);
				if(!masturbate) AddLogEvent(textBuff,"passive",deltaShift);
				else output(textBuff);
			}
			//Normal
			else if(pc.cocks[x].cLength < 16)
			{
				textBuff += " <i>“Ooooh, ";
				if(pc.cocks[x].cType != GLOBAL.TYPE_EQUINE) textBuff += "you’re pretty decently sized! A dick like this could tempt any girl onto it.";
				else textBuff += "you’re looking like a real laquine now. Even have the dick for it.";
				textBuff += "”</i> She rubs you slowly, seeming to measure your length as she does it. <i>“I don’t know... I don’t know if this is enough for me though.”</i> She chews a lip, looking up at you sadly. <i>“I think only the biggest, bulgiest laquines can scratch the itch inside me.”</i> A needy whimper escapes her throat. <i>“But maybe... maybe if we try hard enough, you can cool my heat. Can I... can I fuck you?”</i>";
				textBuff += "\n\nYou start to think about it, but your hard dick intrudes on your thoughts, bashing aside reason, sense, and consideration aside from how hard it is out of the way. <i>“Yes.”</i> You shift your hips forward to better display it. <i>“Oh God, yes!”</i>";
				textBuff += "\n\nThe bunny nods to herself, gaze firming into a determined glare. <i>“Okay. Let’s do this.”</i> She leaps up, propelled on powerful lapine feet, into your arms, hanging off your shoulders with ease. She’s surprisingly light for her size, but you suppose ";
				if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == undefined) textBuff += "laquines must be light as a species. There’s certainly no better explanation for it.";
				else textBuff += "a hallucination would be.";
				textBuff += ParseText(" Her pussy dribbles fresh lube over your [pc.cockBiggest] as she adjusts the ears on your head. <i>“Make sure to keep wearing these so you get nice and big.”</i> The bunny-girl sinks slowly down until her plush lips are kissing your [pc.cockHeadBiggest], letting you feel the heat washing off her hormonal, pregnancy-prepared pussy. <i>“Bigger and more virile.”</i> She whimpers and lets go.");
				textBuff += "\n\nInstead of sinking deep into her pink tunnel, the sensation vanishes as the laquine abruptly loses cohesion, briefly turning transparent before fading away. Faintly you can hear her voice crying, <i>“Noooooooo!”</i> as she disappears.";
				textBuff += "The whole thing was a vivid hallucination, but the boner you got from it was definitely not illusory in the slightest.";
				if(!pc.isCrotchExposed()) textBuff += " You’ll be walking bow-legged for a moment until it goes down.";
				pc.changeLust(100);
				if(!masturbate) AddLogEvent(textBuff,"passive",deltaShift);
				else output(textBuff);
			}
			//2hueg. No new PG.
			else
			{
				IncrementFlag("LAQUINE_LASS_TRYSTS");
				textBuff += " <i>“";
				if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] > 1) textBuff += "Oh my gawsh! I’ll never get tired of touching this.";
				else textBuff += "Oh my gawsh! It’s so big.";
				textBuff += "”</i> She rubs you slyly, taking her time to caress every massive vein along the path of her exploration. <i>“";
				if(lassLaquineAcceptable(pc,x))
				{
					textBuff += "I cannot imagine a more fitting partner to take me. Your dick is so big, so perfect.”</i> She kisses it. <i>“And your body... you’re laquine to the core. I can feel it, throbbing through your dick. You know this is our purpose.";
					kGAMECLASS.flags["LAQUINE_LASS_BUNSCORED"] = 1;
				}
				else if(kGAMECLASS.flags["LAQUINE_LASS_BUNSCORED"] != undefined) textBuff += "What happened to you? You were supposed to be my laquine alpha...”</i> Her nose twitches, searching your musky cockscent for clues. <i>“You’re still laquine enough for now, I guess, but please... please put on Laquine Ears. I need my perfect bunny mate or we can’t keep fucking. It’s our purpose to breed, you and I. Promise me you’ll put some on, and I’ll fuck you forever.";
				else textBuff += "You aren’t all laquine yet, though, are you?”</i> Her nose twitches, searching your musky cockscent for clues. <i>“You’re still... sort of Terran.”</i> She nuzzles the side of your dick. <i>“But no Terran has a dick like this. No true Terran floods their head with machines designed to turn them into a big-dicked, horse-bunny.”</i> She kisses your member. <i>“You can try to breed me, but it won’t sate me for long. Please, go full laquine, for me.”</i> She pouts at you, one ear draped across your throbbing immensity. <i>“Once you’re my bunnystud alpha, I’ll never need to ache for cum again.”</i> She squeezes you. <i>“You can feel it, can’t you? Your body transforming, telling you that this is its purpose?";
				textBuff += "”</i>";
				textBuff += "\n\nYou start to shake your head, but your [pc.cockBiggest] throbs mightily, and not just physically. You feel it swell in your mind, pushing other thoughts out of the way to make room for more important drives. <i>“Yes.”</i> The words slips through your lips in a pleasured hiss as the svelte girl-bun dapples you with kisses.";
				textBuff += "\n\nHer ears perk, lifting until they’re nearly as vertical and rigid as your [pc.cockNounBiggest]. The fertile hare smiles knowingly up at you, then slowly turns away, putting her forepaws on the ground and lifting her ass up beneath you so that your giant-sized rod lays across her back. Her ears swivel to listen to anything you have to say, primed and ready for instruction. Her tail twitches eagerly. Its poofiness sends pleasant tickles through the side of your shaft. <i>“Please,”</i> she begs, <i>“Breed me. Fuck me so pregnant!”</i>";
				textBuff += "\n\nYou push her shoulders down, lifting her ass higher. The slit between her legs is bright pink and exquisitely puffy. A marble-sized clit peeks out of the bottom of it, already soaked with the same clear juices that matt down the fur of her inner thighs. You note that the entrance is so hungry that it occasionally pops open before snapping back closed, winking at you, coaxing you to thrust inside.";
				textBuff += "\n\nAs if you needed the encouragement. You press against her, ";
				if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] > 1) textBuff += "delighted to discover that she parts for you even more easily than before, her body somehow changing at a molecular level to be ever more efficient at taking your deepest dickings.";
				else textBuff += "surprised to discover that she parts without issue. Her body seems only casually acquainted with the laws of physics, like on some quantum level she exists for the sole purpose of taking the largest members the galaxy has to offer.";
				textBuff += " She’s still quite tight, like a silken sleeve that hugs every inch you offer. She doesn’t moan when you thrust inside but instead squeaks, high pitched and feminine. Her body never offers much resistance. You can bulge her belly with the outline of your [pc.cockHeadBiggest], and she just whines for more. She’s a greedy, insatiable fuck-slut, and she won’t be satisfied until your [pc.sheath] is wrapped up snugly in her cunt-lips.";
				textBuff += "\n\n<i>“More!”</i> the laquine pants, finally scraping together enough sense to assemble a single syllable.";
				textBuff += "\n\nYour [pc.hips] push forward until they slap wetly against her inhuman mons. <i>“Take it slut!”</i> The words come out on their own, without an ounce of thought on your part";
				if(pc.isTreated()) textBuff += ", which isn’t that different from normal ever since you took the Treatment";
				textBuff += ". Grabbing her ass, you start fucking her in earnest, making her gurgle and squeak with bliss, watching your cock bulge her belly into the most obscene shapes as you pound her. She’s like a sapient, squeaking sex-toy, good for little more than taking big dicks, getting pregnant, and talking about how much she loves it. <i>“Beg for it.”</i>";
				textBuff += "\n\n<i>“Please!”</i> She chirps with pleasure, ass wiggling, squeezing down around your [pc.knotOrSheath " + x + "]. <i>“It’s like an itch that won’t go away...”</i> Whimpering, the breeding bitch, fondles her ";
				if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 1) textBuff += "pert";
				else if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 2) textBuff += "weighty";
				else if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 3) textBuff += "motherly";
				else if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 4) textBuff += "obscenely motherly";
				else textBuff += "overgrown, milk-dribbling";
				textBuff += " tits. <i>“Please knock me up, " + pc.mf("stud","mistress") + ". Please mate me";
				if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] > 1) textBuff += " again";
				textBuff += ".”</i> Spatters of pussy-juice fall on your [pc.feet]. <i>“Please cum! I need to be pregnant!”</i> She arches her back, whole body quivering. Even her pussy is fluttering with ecstatic tremors, trying to tug the virile milk out of your [pc.cockBiggest]. <i>“Give me your cum!”</i>";
				textBuff += "\n\nSomehow, you endure for the moment, still slapping your hips into hers with passionate, confident strokes. <i>“Tell me what you are!”</i>";
				textBuff += "\n\n<i>“";
				if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 1) textBuff += "I’m... I’m just a needy, dumb bunny that needs to be knocked up more than anything else in the galaxy!";
				else if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 2) textBuff += "I’m a horny, slutty cum-receptacle whose body won’t go stop going into heat!";
				else if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 3) textBuff += "I’m your personal incubator, just an empty vessel with no value beyond incubating your young at every opportunity!";
				else if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 4) textBuff += "Your personal bunny preg-slut! My pussy is so broken in from your dick that nothing else will ever be as good. My womb aches for your cum and your cum alone, because it’s my purpose to accept as many of your loads as you’ll give me!";
				else
				{
					if(kGAMECLASS.silly) textBuff += "I’m motherhood incarnate, a vessel who exists for you to dump as many loads into as you wish. That’s why I got your name tattooed on the inside of my womb and why my pussy soaks itself at the sight of you. I’m your pet cum-slut, always just around the corner, always hungry for more. I can’t seem think past my next fuck with you, my next opportunity to give you another litter, like I’ve taken so much of your cum that even my brain is gummed up with it.";
					else textBuff += "I’m your bunny-birthing fuckslut, just a broken-in hole of a woman who lives for her meetings with you. My body is so addicted to your cock that my pussy soaks itself at the sight of you. My ovaries don’t even work right. They won’t stop releasing eggs anymore, and you’ve taught me to love it.";
				}
				textBuff += "”</i> The way she says it is so shameless and eager";
				if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] >= 3) textBuff += ", tinged with delirious love";
				textBuff += ". Her whole body flushes, not with shame but with desire. You can feel it all the way in her clenching tunnel, wrapping you in a warm sleeve of orgasm-inducing pleasure.";
				textBuff += "\n\nYou forget about her words the moment they leave her little, lapine muzzle. They’re dislodged from your mind by the expanding presence of your cock, this time not with need but with pleasure. It feels too good to devote time to consciousness, too good to parse even the simplest of words. You grunt, and your ";
				if(pc.balls == 0) textBuff += "internal cum-factory kicks into high-gear";
				else if(pc.balls > 1) textBuff += "[pc.balls] churn";
				else textBuff += "[pc.balls] churns";
				textBuff += ". Breeding feels so good. Perhaps too good. Your groan turns into a moan, then a lurid squeak as the feeling of her rapacious, equine-like muff clamping down on you overwhelms your senses. [pc.Cum] sprays into the slutty bunny’s deepest recesses, flooding her uterus and fallopian tubes both, tickling her ovaries into releasing a few more eggs.";

				//High cumQ
				if(pc.cumQ() >= 5000)
				{
					textBuff += "\n\nHer belly balloons with the sheer weight of your copious seed. She isn’t even pregnant yet, but she’s starting to look the part. Rubbing her swollen belly, she quietly cums, making little squeaks each time her needy, dripping snatch gets off on the feeling of your spunk-distended dick.";
					if(pc.cumQ() >= 15000) textBuff += " You flood her well passed the point of looking six months pregnant, a fact that spreads sheer delight across her sweating features. Looking back, she stammers, <i>“Th-thank you. I’ll make you so many... so many babies.”</i>";
					if(pc.cumQ() >= 40000)
					{
						textBuff += " That seems likely given that you’re still cumming, swelling her tummy into a gravid dome. The fattened rabbit-slut is puffing up so big that her pregnant middle actually lifts her off the ground, her arms and legs windmilling uselessly.";
						if(pc.cumQ() >= 50000)
						{
							textBuff += " Miraculously, not a single droplet escapes her sperm-thirsting womb, not even when you dump a few extra gallons inside her, just to make sure. She looks like a perverse parody of pregnancy by this point.";
							if(pc.cumQ() >= 60000) textBuff += " You pull out before you rupture the poor thing. Even an insatiable baby-maker like her deserves a chance to rest, so you do her the favor of spilling the rest of it across her ass, back, hair, and slowly drooping ears.";
						}
					}
				}
				if(pc.cumQ() < 60000)
				{
					textBuff += "\n\nWhen you step back, it feels like your dick is sliding out of her forever, inch after inch slowly escaping endless folds of clenching, cock-milking pleasure. When you do pop out, her lips snap shut with finality, trapping every ounce inside.";
				}
				else textBuff += "\n\nWhen you stumble back, spent, you realize that her lips have snapped shut, trapping every ounce of your perverted payload in her womb for maximum impregnation.";
				textBuff += "\n\n<i>“Th-thank you.”</i> The blissfully smiling laquine rolls on her back and sprawls, giggling almost drunkenly. <i>“";
				if(lassLaquineAcceptable(pc,x) && kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] == 1) textBuff += "You’re my perfect Alpha, and I can’t wait to have even more babies.”</i> She reaches down, fondling her swollen puss and shuddering. <i>“Could you... could you call for me more often? I need you... as often as you can.";
				else if(lassLaquineAcceptable(pc,x)) textBuff += "You’re such a perfect Alpha... Anytime you want me, just close your eyes and think of me.”</i> She reaches down, fondling her swollen puss and shuddering. <i>“I’ll always be there for your cum. Always.";
				else textBuff += "I don’t know if that’ll actually take.”</i> She smiles sadly, rubbing her swollen pussy. <i>“But it scratched my itch for now... Keep wearing those ears, and maybe we can see more of each other.";
				textBuff += "”</i> She blows you a kiss, then fades away into nothingness.";

				//Repeat
				if(kGAMECLASS.flags["LAQUINE_LASS_TRYSTS"] > 1) textBuff += "\n\nCan you really be hallucinating that bunny preg-slut so consistantly, or is there something more to her? You may never know.";
				//First time
				else textBuff += "\n\nWas that... a hallucination? You look around and realize that you’re all alone. The laquine ears must be messing with your head...";
				//Merge
				textBuff += " That orgasm was no hallucination, though.";
				if(pc.isCrotchExposed())
				{
					textBuff += " Your [pc.cum] got everywhere";
					if(pc.cumQ() >= 1000) textBuff += ", dripping in huge globs";
					if(pc.cumQ() >= 5000) textBuff += ", collecting in puddles";
					if(pc.cumQ() >= 10000) textBuff += ", running off in thickened streams of male ejaculate";
					textBuff += ".";
				}
				else textBuff += " You absolutely bathed your [pc.crotchCover] in [pc.cum]. You might need a shower to wash off all this spunk.";
				if(pc.inRut())
				{
					pc.clearRut(false);
					textBuff += " <b>Your rut has faded.</b>";
				}
				textBuff = ParseText(textBuff);
				if(!masturbate) AddLogEvent(textBuff,"passive",deltaShift);
				else output(textBuff);
				pc.orgasm();
				pc.applyCumSoaked();
			}
			if(masturbate)
			{
				clearMenu();
				addButton(0, "Next", kGAMECLASS.mainGameMenu);
			}
		}
		public static function bunnyguyFapScene(pc:Creature,fap:Boolean = false,deltaShift:Number = 0):void
		{
			var x:int = 0;
			var textBuff:String = "";
			var cunts:Array = [];
			for(x = 0; x < pc.totalVaginas(); x++)
			{
				if(pc.vaginas[x].type == GLOBAL.TYPE_EQUINE) cunts.push(x);
			}
			if(cunts.length > 0) x = cunts[rand(cunts.length)];
			else x = 0;
			if(fap)
			{
				clearOutput();
				kGAMECLASS.showName("NEEDY\nLAQUINE");
			}
			textBuff += "One of your ears perks as you swear you hear the low bass sound of a boisterous male singing a traveling song. It fades as quickly as it appears, only to resurface a minute later, louder and closer. The tune is slow and pleasant, but you can only pick a few words from the sonorous drone.";
			textBuff += "\n\n<i>“...my sweet laquine lass ... tease me with that candied ass ... wetter’n ocean breeze blowin’ in.... bed her like breeding season...”</i>";
			if(pc.laquineScore() >= 5) textBuff += "\n\nLaquine lass? Is he singing about you?";

			if(pc.inHeat()) textBuff += "\n\nLaquine lass... and breeding? It’s suddenly too warm and too hot. Thoughts of breeding make it difficult to focus on words, but you qualify as a laquine lass, don’t you? You’ve got this hot... aching... empty vagina that would feel so much better with a baby in it.";
			else if(kGAMECLASS.flags["LAQUINE_GENT_BONED"] != undefined) textBuff += "\n\nYes, he’s definitely singing of you. You hum along with the familiar tune. It sparks a certain, familiar excitement within you after the last encounter...";
			textBuff += "\n\nThe source of the enchanting song appears in front of you, naked -- save for a dashing, crimson cape which he wears over his right shoulder. He himself is a laquine, gray-furred and grinning. A mop of unruly salt and pepper hangs over the left side of his handsome face. Beneath, twinkling, sky-blue eyes regard you with confident interest. Placing a hand on his sturdy, bunny-like leg, he bows with an elaborate flourish of his other arm. <i>“Smashing to meet such a lovely and beautiful flower on one’s journeys.”</i>";
			textBuff += "\n\nHe steps closer before you can respond, taking your hand in his. He plants a chaste kiss on your wrist, then tugs you into a close embrace, his arm strong around your back, the muscle so hard it may as well be made of corded iron strands. His fur is coarse but neatly combed, recently cleaned with a soap that reminds you faintly of freshly chopped wood. <i>“";
			if(kGAMECLASS.flags["LAQUINE_GENT_BONED"] == undefined) textBuff += "My lady, I must present my deepest apologies, for I have not been entirely truthful with you.";
			else textBuff += "My lady, your presence is as a glass of cool water to a bunny like me.";
			textBuff += "”</i> Something hard and warm presses against your [pc.belly], climbing higher by the second. <i>“";
			if(kGAMECLASS.flags["LAQUINE_GENT_BONED"] == undefined)
			{
				textBuff += "You see, I am taken by the worst sort of rapacious rut";
				if(pc.laquineScore() < 5) textBuff += ", and while you are so long from the laquine lover I need, I must have you all the same.";
				else textBuff += ", and you are the most delectable specimen of laquine femininity I could envision. I must have you.";
			}
			else textBuff += "For I am taken with rapacious need once more. The only cure for my malady lies betwixt your heavenly " + (pc.hasLegs() ? "legs" : "thighs") + ", dear madam. I can contain myself no longer. For this, I beg your sincerest apologies.";
			textBuff += "”</i>";

			textBuff += "\n\nYou rock back in surprise, staring down to see the emerging length of his glossy, black shaft. It’s a thick, bestial thing, entirely at odds with the lithe male who seems too wiry to carry such a heavy endowment. From the blunt head to the medial ring, it’s already slathered in whitish, musky goo, and it begins to drizzle more the moment it reaches full size, rocking against your thigh with each passionate beat of its owner’s heart. He wasn’t lying. Your mere presence was enough to take him to full, raging tumescence.";
			textBuff += "\n\nYou can’t peel your eyes away from it. ";
			if(kGAMECLASS.flags["LAQUINE_GENT_BONED"] == undefined) textBuff += "It would fit <i>perfectly</i> inside you. You’re sure of it.";
			else textBuff += "You did this to him.";
			textBuff += " He’s rocking against your [pc.leg], fluffy hands balled into tight, shaking fists. It’s all he can do not to jump you this very moment. Pre-cum bubbles up out of him, hard enough to shoot an inch into the air before washing back down to collect in the folds of his tightly-stretched sheath. With great effort of will, you pull your eyes up to his cerulean ones, noting the struggle in his eyes, the way his inner animal tears at the cage of his sophisticated demeanor, one by one shredding the bars of his better nature to make way for a cunt-destroying breeding.";
			if(pc.inHeat()) textBuff += " A shiver travels up your spine at the thought, and for a moment, you aren’t sure if you want to take him to ease his burden or make him wait, if only to make him fuck you all the harder.";

			textBuff += "\n\n<i>“Have mercy,”</i> the laquine intones, his grip firming, <i>“For I must sire you a litter.”</i> His cheek twitches";
			if(!pc.isCrotchExposed()) textBuff += " as he yanks down your [pc.crotchCover]";
			textBuff += ". His cock twitches in eagerness, and the hung rabbit stops resisting, choosing to guide his passions rather than let them break him. He pulls you tight, planting kisses from the nape of your neck up to your [pc.ear], whispering that he will ";
			if(pc.inHeat()) textBuff += "give you every drop of seed in his body so that you may mother the next generation of his libidinous race";
			else if(pc.hasVaginaType(GLOBAL.TYPE_EQUINE)) textBuff += "fill you like none other, teaching you what it means to fuck with a real male instead of some lesser species";
			else textBuff += "be gentle to you, his delicate flower";
			textBuff += ". Meanwhile, his body swivels the rest of the way behind you, threading his burning-hot length between your [pc.thighs]. The medial ring brushes against [pc.oneClit], slick and warm, making you whimper.";

			//Bimb
			if(pc.isBimbo()) textBuff += "\n\nThis isn’t at all what you expected when the dashing laquine arrived, but you’re not going to look a gift horse-bun in the mouth, not when he’s threading himself against your needy delta and promising to bang your brains out of your silly little head. To a bimbo like you, a laquine in rut is like an all-you-can-eat buffet, and your body is more than ready for it. You can already feel it, that pink, bubbly sort of brainlessness you experience every time your blood shifts south into your nethers, lighting up new nerves in preparation for a night spent servicing a deserving male. And they all deserve it, every last one.";
			//Heat
			else if(pc.inHeat()) 
			{
				textBuff += "\n\nThis isn’t what you expected when the dashing laquine arrived, but it is exactly what your body desired. Your [pc.vaginas] could not have been any luckier, nor ";
				if(pc.totalVaginas() == 1) textBuff += "does it";
				else textBuff += "do they";
				textBuff += " feel like they could be any wetter. You are absolutely sodden with desire for his dick, made all the more aroused by his obvious fitness as a mate. Not only is he athletic and handsome, but he’s big, even for a laquine. Maybe it’s the pheromones wafting off his fuckstick that make him seem so desirable, but you can’t search out a single problem with that. The sooner you get him inside you, the better. Perhaps a few litters of his young will put out the insatiable itch lurking inside.";
			}
			//Nonbimb&nonheat
			else textBuff += "\n\nThis isn’t how you thought you’d spend today, but there’s something about him, something you can’t quite put your finger on, like you’re connected to the strange rabbit on a deeper level than you can possibly imagine. Perhaps it’s because of that that you find yourself so wet and so pliable. Perhaps you simply needed something like this to take your mind off the stresses of life. Perhaps, when it comes down it, you’ve secretly loved the way your body is driving him mad, and you’re simply curious to see if he can survive intimate contact with your pussy.";
			//Merge
			
			//Marecunt & heat fuck-end
			if(pc.vaginas[x].type == GLOBAL.TYPE_EQUINE || pc.inHeat())
			{
				textBuff += "\n\nRocking his hips, the energetic bunny-man lets out a cute little growl, sawing himself against your [pc.vaginas] until he’s as wet with your own excitement as his oozing pre-cum. <i>“Yes,”</i> he groans, <i>“";
				if(pc.laquineScore() >= 5)
				{
					if(kGAMECLASS.flags["LAQUINE_GENT_BONED"] != undefined) textBuff += "I’m so lucky to have found you, my lovely laquine maiden.”</i> He looks you over approvingly, his dick throbbing. <i>“You’ll be such a wonderful mother for our young, I can feel it.";
					else textBuff += "I can’t believe I finally get to knock up another real laquine!";
				}
				else textBuff += "I can’t believe I’m finally getting to end this rut.”</i> His gaze briefly flicks to the artificial ears you’re wearing, and he nods approvingly. <i>“You’re going to be such a perfect laquine mother when you’re all done.";
				textBuff += "”</i>";

				textBuff += "\n\nThe thought of being filled with his seed, [pc.belly]";
				if(pc.bellyRating() >= 20) textBuff += " further";
				textBuff += " ballooned, sends a torrent of further heat down your channel";
				if(pc.totalVaginas() > 1) textBuff += "s";
				textBuff += ". ";
				if(pc.totalVaginas() == 1) textBuff += "It clenches";
				else textBuff += "They clench";
				textBuff += " hungrily around nothing, even as your childrens’ future sire grabs by the wrist, pulling them behind your back to make your spine arch and [pc.oneVagina] open wider for him. He cocks his hips back to crudely aim his blunt tip at the sloppy entrance, then pushes forward to butt it into place, not quite yet inside. His tip is swelteringly hot and spills pre seemingly without end, lubricating you to the point where you can’t believe he hasn’t slipped inside yet.";

				textBuff += "\n\nThe bunny groans softly and, with a none-too-subtle tug on your arms, pulls you down onto his turgid bunny-breeder. Once the fattened crown breaks through your waiting gates";

				if(!pc.inHeat()) textBuff += ", you’re instantly aware of just why he was so keen to get inside you. Your mare-cunt is perfectly matched to his equine cock. That weighty, top-heavy girth stimulates nerves deep inside that no other dick can scratch. The sheath at the base bunches up around your rubbery vulvae, exactly as it should. Pregnancy is a small price to pay for an experience like this. It seems inevitable. Your whole body is heating up, and your womb tickles as your ovaries release an abrupt flood of eggs.<b> Did you just go into heat?</b>";
				else textBuff += ", the pleasure overwhelms you. This is what you needed - a warm, tumescent member, bubbling with virility lodged deep inside you, not some useless plastic penis. You swear you can almost feel his wiggling swimmers as you have your first orgasm, sliding into your womb in search of the dozens of eggs that must be there, lying in wait. It’s so good, so earth-shatteringly delightful that for a moment, you can only fantasize about how good his orgasm will feel, and good it will feel to know you’re going to birth dozens of his offspring.";
				if(pc.vaginalVirgin) textBuff += " Wasn’t losing your virginity supposed to hurt?";

				textBuff += "\n\nYour dashing, cunt-pleasing champion begins to fuck you hard the moment you adjust to his enormous member. He drills into you with such force that your " + (pc.legCount == 1 ? "[pc.leg] is" : "[pc.legs] are") + " lifted clear off the ground with his smallest thrusts, bouncing you so high that it almost looks like you’re hopping in place - only your " + (pc.hasLegs() ? "legs are" : "lower body is") + " flailing limply while his powerful limbs carry your weight. [pc.GirlCum] spurts out at the impacts that launch you, cascading in salacious sheets to splatter on the ground. His pre-cum shoots out in thick wads, voluminous enough to drown a normal man’s orgasm, and he hasn’t even cum yet. It’s coming soon, though! The veins all along his length are thickening perceptibly. His flare is swelling.";
				textBuff += "\n\n<i>“P-please!”</i> the male laquine stutters, holding onto a modicum of politeness, <i>“Tell me that you want it... Tell me that in your heart of hearts, you want my children, dozens of them!”</i> Somehow, he expands still further without cumming, pressing on nerves that drive you wild.";
				textBuff += "\n\n<i>“Yes!”</i> you wantonly cry, shaking your hips and squeezing your [pc.vagina " + x + "] down on him, coaxing him to unload with your body’s every movement. <i>“Give it to me! Give me that cum!”</i> His next thrust drives you past the point of sensibility. <i>“Gimme allofit! Fuck me pregnant! Knock up my pussy!”</i>";
				if(pc.hasCock()) 
				{
					textBuff += " Your [pc.cocks] weakly unload";
					if(pc.totalCocks() == 1) textBuff += "s";
					textBuff += " onto the ground.";
				}
				if(pc.isSquirter())
				{
					textBuff += " Rivers of [pc.girlCum] spray down your thighs as you climax, still begging for his jizz.";
				}
				else textBuff += " Hot [pc.girlCumNoun] dribbles down your thighs as you climax, still begging him for his jizz.";
				textBuff += "\n\nHe grunts, his every muscle going tight as you hit the ground one last time, letting your weight carry you down a cock that suddenly feels about 20% thicker. It flexes inside you as his voice slips into a higher register, and you feel the hot, sperm-filled fluid spraying into your body. It’s a wonderful balm for your overheated channel, all warm and gooey and subtly tingling against your folds in a way that advertises just how pregnant you’re about to be. He lowers himself to the ground mid-orgasm, cradling your expanding middle as his sperm continues to fill you. Some runs back out, drenching his balls and his legs, but he does not seem to mind.";
				textBuff += "\n\nYou aren’t sure how long you stay like that, held in his capable arms, his dick sheath-deep, still leaking more virile seed into your most vulnerable place. It’s everything you thought it would be.";
				if(pc.inHeat()) textBuff += " One after another, you can feel your eggs being fertilized, alleviating your heat in the way that only motherhood can.";
				else textBuff += " A warm glow spreads through you, what you can only assume is the culmination of your impregnation.";
				textBuff += " It’s a lovely sensation.";

				//First time
				if(kGAMECLASS.flags["LAQUINE_GENT_BONED"] == undefined)
				{
					textBuff += "\n\n<i>“Thank you for that, my sweet maiden. You’ve eased this old campaigner’s burdens by virtue of your company.”</i> The now-sated laquine strokes your ";
					if(pc.hasHair()) textBuff += "[pc.hair]";
					else textBuff += "head";
					textBuff += " with gentle, almost imperceptible touches. <i>“But I must move onward for now. In the future, should you find yourself ravaged by heat, know that I will come extinguish your fire should you wish.”</i> His smile is cocksure, even as his form becomes insubstantial. <i>“I will be there for you, tender princess.”</i>";
				}
				//Repeat
				else
				{
					textBuff += "\n\n<i>“Ahh, you truly are a balm for the trials of life, my sweet, knocked-up laquine.”</i> The now-sated laquine strokes your ";
					if(pc.hasHair()) textBuff += "[pc.hair]";
					else textBuff += "head";
					textBuff += ", his dick enjoying the residual afterglow in a pussy ";
					if(kGAMECLASS.flags["LAQUINE_GENT_BONED"] < 3) textBuff += "that is becoming increasingly acclimated to his presence.";
					else if(kGAMECLASS.flags["LAQUINE_GENT_BONED"] < 6) textBuff += "that seems halfway molded to his image.";
					else if(kGAMECLASS.flags["LAQUINE_GENT_BONED"] < 9) textBuff += "that may as well have been designed for him.";
					else textBuff += "so familiar that he seems more natural inside you than anything else.";
					textBuff += " <i>“My time with you is spent, but should have need of me, I promise you, I will be there.”</i> He withdraws, fading into insubstantiality with a wry smile. <i>“I will always be there for your heats...”</i>";
				}
				//Merge
				textBuff += "\n\nThen he’s gone, as if he was never there. Even his puddled cum is gone. You’re left empty, but sated";
				if(pc.inHeat()) textBuff += ", your heat extinguished";
				textBuff += ".";
				if(kGAMECLASS.flags["LAQUINE_GENT_BONED"] == undefined) textBuff += " Did you just get so horny you hallucinated a hot bunny stud?";
				else textBuff += " Maybe you should be concerned by your hallucinatory lover, but right now you’re feeling too well and truly satisfied to care.";
				pc.clearHeat();
				pc.changeLust(100);
				textBuff = ParseText(textBuff);
				IncrementFlag("LAQUINE_GENT_BONED");
				if(!fap) AddLogEvent(textBuff,"passive",deltaShift);
				else output(textBuff);
				pc.orgasm();
			}
			else
			{
				//Non marecunt & nonheat end
				textBuff += "\n\nRocking his hips, the energy bunny-man lets out a cute little growl, sawing himself against your [pc.vaginas] until he’s as wet with your own excitement as his oozing pre-cum. <i>“Yes,”</i> he groans, <i>“I can’t believe I’m finally going to... finally going to get to end this rut!”</i> He cocks his hips back, crudely lining the blunt tip with your sloppy entrance. His tip is swelteringly hot and spills pre seemingly without end. <i>“You should ";
				if(!pc.inHeat()) textBuff += "be in heat, begging me to breed you...";
				if(!pc.inHeat() && pc.vaginas[x].type != GLOBAL.TYPE_EQUINE) textBuff += " or ";
				if(pc.vaginas[x].type != GLOBAL.TYPE_EQUINE) textBuff += "have a proper, laquine pussy, all plush and leaking...";
				textBuff += "”</i> Pulling your arms back, he forces you to arch your back, aligning you at the perfect angle for insertion. <i>“Then I could really let you have it.”</i>";
				textBuff += "\n\nHis hips inch upward, at first compressing your vulva, then forcing you to spread, wider and wider, but suddenly, the firm grip of his hands slackens.";
				textBuff += "\n\n<i>“Nooo, I was so close!”</i> your fluffy suitor curses even as his body fades into translucency. <i>“I need to breed so badly!”</i> He drops to his knees, everything below his hips already vanishing into nothing. <i>“Those ears... keep using them... maybe next time...”</i> His searching eyes fade to nothing.";
				//first time
				if(kGAMECLASS.flags["LAQUINE_FADEAWAY"] == undefined && kGAMECLASS.flags["LAQUINE_GENT_BONED"] == undefined) 
				{
					textBuff += "\n\nWhat the FUCK? Was all that just a hallucination?";
					if(!pc.isCrotchExposed()) textBuff += " Looking down, you realize that you’re still wearing your [pc.crotchCover], and n";
					else textBuff += "N";
					textBuff += "o evidence of the rabbit remains, save for the moistness between your " + (pc.hasLegs() ? "legs" : "thighs") + ". When they said laquines fucked like bunnies, they must have meant it!";
				}
				//Repeats
				else
				{
					textBuff += "\n\nOhhh no! Not again! It’s not fair that poor guy doesn’t get to nut inside you and fill you with his creamy, virile jism.";
					if(!pc.inHeat()) textBuff += " Wait... what are you thinking? He all but raped you!";
					else textBuff += " Maybe a baby bump would really fill out your figure, more than it already is.";
					textBuff += " The bizarre persistence of this hallucination nags at you, but not as badly as the freshly stoked heat between your [pc.thighs].";
				}
				textBuff = ParseText(textBuff);
				pc.changeLust(20);
				IncrementFlag("LAQUINE_FADEAWAY");
				IncrementFlag("LAQUINE_GENT_BONED");
				if(!fap) AddLogEvent(textBuff,"passive",deltaShift);
				else output(textBuff);
			}
			if(fap)
			{
				clearMenu();
				addButton(0, "Next", kGAMECLASS.mainGameMenu);
			}
		}
		private static function laquineEarsFinale(pc:Creature, initDuration:uint, targetDelta:uint):void
		{
			// Calculate the time offset
			var deltaShift:uint = initDuration - targetDelta;
			var textBuff:String = "";
			if(pc.earTypeUnlocked(GLOBAL.TYPE_LAPINE))
			{
				//[LE] [Lapine Ears]
				// PC can gain Lapine Ears at any time as normal, but this will contain adjectives for a new lapine ear type to be slotted in. Normal Lapine Ears don't adequately display lengthiness.
				// Let me know if you want Quad Lop or something.
				// adjectives = ["lop", "droopy", "floppy"];
				if(pc.earType != GLOBAL.TYPE_LAPINE && pc.earType != GLOBAL.TYPE_QUAD_LAPINE)
				{
					//Regular Ears
					if(rand(2) == 0)
					{
						textBuff += "The rabbit ears don’t slosh when you shake your head any more. Instead, they flop warm and fuzzy against your [pc.hair]. Too late - you realize that you can feel through them - and that your old ears are long gone! <b>Looks like you’ll have rabbit ears from here on out.</b>";
						
						pc.earType = GLOBAL.TYPE_LAPINE;
						pc.clearEarFlags();
						pc.addEarFlag(GLOBAL.FLAG_LONG);
						pc.addEarFlag(GLOBAL.FLAG_FURRED);
						pc.earLength = 6 + rand(7);
					}
					//Loppy Bois
					else
					{
						textBuff += "Drained of their microsurgeons, <b>your laquine ears crumble away.</b> However, a sudden warmth in your scalp spreads to your extant auricles and they twitch uncontrollably. An undefinable <i>itch</i> spreads from the root to the tip, and when you try to scratch it, you find that your ears are growing past your palms! The irritation forces your eyes shut for the duration of its dubious effect.";
						textBuff += ("\n\nAfter the last-minute transformation, there’s an added weight on your head. When you whip out your codex, you discover that <b>you now have lop-rabbit ears</b>");
						textBuff += "; the rounded tips are ";
						pc.earLength = 12+rand(25);
						if(pc.earLength >= pc.tallness) textBuff += "hanging low enough to drag on the ground like head-mounted tails";
						else if(pc.earLength > pc.tallness/2) textBuff += "hanging around your [pc.thighs]"
						else if(pc.earLength >= pc.tallness/2.5) textBuff += "hanging to your waist";
						else if(pc.earLength >= pc.tallness/3) textBuff += "dangling just above your waist";
						else if(pc.earLength >= pc.tallness/4) textBuff += "dangling down to your [pc.chestNoun]";
						else textBuff += "hanging over your shoulders";
						textBuff += ". Anytime you shift your neck, your floppy and very grabbable appendages whirl with your motions. They look rather adorable, actually." + (pc.isBimbo() || pc.libido() >= 66 ? " You can’t wait to find someone to take you doggystyle now, maybe bury your face in their crotch. As long as they’re holding you by those things!":"");
						pc.earType = GLOBAL.TYPE_LAPINE;
						pc.clearEarFlags();
						pc.addEarFlag(GLOBAL.FLAG_FURRED);
						pc.addEarFlag(GLOBAL.FLAG_FLOPPY);
						pc.addEarFlag(GLOBAL.FLAG_LONG);
					}
				}
				else if(pc.earType != GLOBAL.TYPE_QUAD_LAPINE && kGAMECLASS.flags["LAQUINE_EAR_USES"] > 7 && rand(3) == 0)
				{
					textBuff += "<b>Your laquine ears expire</b>, but they do not crumble away as you might expect. Instead, they grow heavier, not with a payload of microsurgeons but with warm, pulsating flesh. There’s no ignoring it. The second pair of ears have grown onto you, and you can feel the new rabbit ears brushing back and forth against the old. <b>You have four bunny ears.</b> They look kind of nice, if you don’t mind appearing like you’ve suffered an obvious mutation.";
					pc.earType = GLOBAL.TYPE_QUAD_LAPINE;
					pc.clearEarFlags();
					pc.addEarFlag(GLOBAL.FLAG_LONG);
					pc.addEarFlag(GLOBAL.FLAG_FURRED);
					if(pc.earLength < 6) pc.earLength = 6 + rand(7);
				}
				else
				{
					textBuff += "The redundant Laquine Ears fall off your head, the securing band crumbling away. The ears themselves crackle softly as their color fades to ash gray, then they break apart into ear-shaped piles of dust. <b>Your Laquine Ears have run out of juice. Time to re-up!</b>";
				}
			}
			else 
			{
				textBuff += "The Laquine Ears fall from your head, unable to properly take root. <b>You’ll need to put on another set if you want to undergo more bunny-horse transformations.</b> You doubt it’s possible for you to get the ears too. Shucks.";
			}
			AddLogEvent(ParseText(textBuff),"passive",deltaShift);
		}
		// Persistent status effect Hotfix
		public static function laquineEarsRemove(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("LAQUINE\nEARS");
			
			output("By the moment you touch them, the Laquine Ears crackle, rapidly lose their color and drop off the securing headband, which in turn, also disintigrates and falls from your head. <b>You have removed the laquine ears.</b>");
			pc.removeStatusEffect("Laquine Ears");
			
			clearMenu();
			addButton(0, "Next", kGAMECLASS.mainGameMenu);
		}
	}
}

