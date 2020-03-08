package classes.Items.Transformatives 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.VaginaClass;
	import classes.Engine.Utility.rand;
	import classes.Engine.Interfaces.*;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.num2Text;
	
	public class TauricoVenidae extends ItemSlotClass
	{
		
		public function TauricoVenidae() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			this.shortName = "Deerium";
			this.longName = "Taurico Venidae";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a Taurico Venidae medipen";
			
			this.tooltip = "A potent one-shot cosmetic transformative from VesperTech, a Terran biocorp that produces the Taurico line of drugs. Taurico Venidae is sometimes called Deerium by those too stupid - or too lazy - to remember its full name. Nevertheless, VesperTech’s marketing department has stuck by the original name for their venerable product. It promises a deer-like appearance, complete with antlers for males!\n\nIt comes in an easy to administer medipen.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 3809;
			
			this.version = this._latestVersion;
		}
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var tChanges:int = 2 + rand(2);
			var totalChanges:int = 0;
			var changes:int = 0;
			
			clearOutput();
			author("Wsan");
			
			if (!(target is PlayerCharacter))
			{
				output(target.capitalA + target.short + " uses the injector to no effect.");
				return false;
			}
			
			output("You hold the medipen up to your arm and wince, even before you press down. Taking a deep breath, you push it against your skin until it triggers a short, sharp spray of numbing agent... and the barely felt pinch of an injection. The ");
			if(target.IQ() < 50) output("Deerium");
			else output("Taurico Venidae");
			output(" is inside you now. Hopefully the results are worth it.");
			
			var TFs:Array = new Array();

			if(target.earType != GLOBAL.TYPE_DEER) TFs.push(deerEarTF);
			if(target.tailType != GLOBAL.TYPE_DEER || target.tailCount <= 0) TFs.push(deerTailTF);
			if(target.hasLegFlag(GLOBAL.FLAG_FURRED) && ((target.legType != GLOBAL.TYPE_DEER && target.furColor != "brown") || (target.legType == GLOBAL.TYPE_DEER && target.furColor != "white-dappled brown"))) TFs.push(skinToFur);
			if(target.legType != GLOBAL.TYPE_DEER || !target.isTaur() || target.legCount != 4) TFs.push(getYouACentaurBod);
			if(target.faceType != GLOBAL.TYPE_HUMAN) TFs.push(humanFaceTeef);
			if(hasTFableDix(target)) TFs.push(growADeerCawk);
			if(needDeerCunt(target)) TFs.push(vaginaDeerTF);
			if(needsHeightTF(target)) TFs.push(deertaurHeightChange);
			if(target.hasCock() && (target.horns == 0 || target.hornType != GLOBAL.TYPE_DEER)) TFs.push(hornTFForDeertaur);

			if(TFs.length == 0)
			{
				output("\n\nSadly, nothing happens. Oh deer.");
			}
			else 
			{
				var select:Number = rand(TFs.length);
				TFs[select](target);
			}
			return false;
		}

		//Ear TF
		//Deer ears
		public function deerEarTF(target:Creature):void
		{
			if(target.earTypeUnlocked(GLOBAL.TYPE_DEER))
			{
				output("\n\nYou reach up and scratch behind your ear, trying to satisfy a persistent itch. It won’t go away, and amidst your frustration you suddenly realize there’s a new sensation - your ears are changing! They contort and curve, a light covering of fuzzy fur growing across the back of them. When the transformation finishes, you have <b>lightly-furred deer ears!</b>");
				target.earType = GLOBAL.TYPE_DEER;
				target.clearEarFlags();
				target.addEarFlag(GLOBAL.FLAG_FURRED);
				target.earLength = 3;
			}
			else output("\n\n" + target.earTypeLockedMessage());
		}
		//Tail TF
		//Gain a deer tail! Change fur color to brown.
		public function deerTailTF(target:Creature):void
		{
			if(target.tailTypeUnlocked(GLOBAL.TYPE_DEER))
			{
				//Already has a tail: 
				if(target.tailCount == 1) 
				{
					output("\n\nYou feel a strange pressure building in your [pc.tail], and a distinct itchiness to boot. You check behind yourself, irritably reaching back to inspect yourself, only to discover your tail is transforming! It’s ");
					if(target.hasTailFlag(GLOBAL.FLAG_LONG)) output("shortening, ");
					else if(target.hasTailFlag(GLOBAL.FLAG_FURRED)) output("fluffing up, ");
					else output("changing, ");
					output("becoming softer, and changing at the base. By the time it settles into its new form, you realize that <b>you’ve got yourself a short fluffy tail - like a deer’s!</b>");
				}
				else if(target.tailCount > 1) 
				{
					output("\n\nYou feel a strange pressure building in your [pc.tails], and a distinct itchiness to boot. You check behind yourself, irritably reaching back to inspect yourself, only to discover your tails are transforming! They’re ");
					if(target.hasTailFlag(GLOBAL.FLAG_LONG)) output("shortening, ");
					else if(target.hasTailFlag(GLOBAL.FLAG_FURRED)) output("fluffing up, ");
					else output("changing, ");
					output("becoming softer, and changing at the base. By the time they settle into their new forms, you realize that <b>you’ve got yourself short fluffy tails - like a deer’s!</b>");
				}
				//No tail to begin with:
				else
				{
					output("\n\nYou feel a knot of pleasure forming at the base of your spine, right above your [pc.butt]. Gingerly reaching a hand down there, you find a sizeable bump! It looks like you’re growing a tail! You moan in pleasure as your new appendage slowly but surely shapes itself together, coalescing into <b>a short fluffy tail - like a deer’s!</b>");
					
					target.tailCount = 1;
				}
				target.tailType = GLOBAL.TYPE_DEER;
				target.clearTailFlags();
				target.addTailFlag(GLOBAL.FLAG_FLUFFY);
				target.addTailFlag(GLOBAL.FLAG_FURRED);
			}
			else output("\n\n" + target.tailTypeLockedMessage());
		}
		//Skin TF
		//Gain brown fur with a white stomach.
		//Have furry legs and not brown or dappled fur.
		public function skinToFur(target:Creature):void
		{
			if(target.furColorUnlocked("brown"))
			{
				if(target.legType != GLOBAL.TYPE_DEER)
				{
					output("\n\nYou sense a slight itch spreading out along your [pc.legOrLegs], uniting in the middle. You look down to see yourself changing!");
					if(target.hasLegFlag(GLOBAL.FLAG_FURRED)) output(" Your fur begins to change, giving way to a light brown covering across your body save for your underbelly and tail turning white.");
					output(" <b>You now have brown fur covering your lower body!</b>");
					target.furColor = "brown";
				}
				//Random chance to get dappled white spots across your fur instead of regular effect
				else
				{
					output("\n\nYou sense a slight itch spreading out along your arms and legs, uniting in the middle. You look down to see yourself changing! ");
					//if PC has body fur already: 
					if(target.hasLegFlag(GLOBAL.FLAG_FURRED)) output(" Your fur begins to change, giving way to a light brown covering across your body save for your stomach and tail turning white. You notice that you have white spots across your body too, giving a dappled effect of color.");
					output(" <b>You now have brown fur dappled with white spots on your lower body!</b>");
					target.furColor = "white-dappled brown";
				}
				//Make sure hasfur.
				if(!target.hasLegFlag(GLOBAL.FLAG_FURRED)) target.addLegFlag(GLOBAL.FLAG_FURRED);
			}
			else output("\n\n" + target.furColorLockedMessage());
		}
		//Lower Body TF + Leg + Capacity TF
		//Change legtype to deer. Gain centaur body. Increase capacity of orifices. Gain four legs. 
		public function getYouACentaurBod(target:Creature):void
		{
			if(target.legCountUnlocked(4) && target.legTypeUnlocked(GLOBAL.TYPE_DEER))
			{
				//if no deer legs: 
				if(target.legType != GLOBAL.TYPE_DEER)
				{
					output("\n\nYour [pc.legOrLegs] suddenly become weak, sending you tumbling onto your butt wondering what’s happening. You flop on the floor helplessly feeling like ");
					if(target.legCount == 1) output("you’re splitting in half, until it really happens and your lower body becomes a pair of legs! They grow to look like those of a deer, with light brown fur capped by small black hooves.");
					else output("they’re turning to putty, until they change shape and start to resemble those of a deer, with light brown fur capped by small black hooves.");
					if(target.legType == GLOBAL.TYPE_EQUINE || target.hasLegFlag(GLOBAL.FLAG_HOOVES)) output(" Your new legs aren’t much different than the old, to be honest.");
					else output(" You carefully get up, balancing yourself on your hooves as you try to get used to your new gait.");
					output(" <b>You now have the legs of a deer!</b>");
				}
				//if not tauric: 
				if(!target.isTaur())
				{
					output("\n\nSuddenly, your whole body is assailed by a sensation of stretching. Your body contorts and strains, growing ");
					if(target.legCount < 4) output("larger");
					else if(target.legCount > 4) output("smaller");
					output(" by the second... and more equine in shape. All you can do is endure it, trying to get used to the stretching feeling that’s gripping your entire form. Slowly but surely, your rear end expands into the shape of a deer’s backside, covering itself in fur.");
					if(target.legCount < 4) output(" New legs begin to bud out of your changing body, growing down to support your alien frame. You’ve got four of them now, just enough to be able to carry your lightly-built, powerful equine frame.");
					output(" After a few minutes, you’re able to scrabble up onto your animalistic legs and give your tauric body a bit of a test. You quickly end up bounding about, just like a nimble " + target.mf("buck","doe") + ". <b>You’ve definitely got a deer body now</b>, complete with fuzzy fur and agile, tauric shape.");
					//Capacity Increase with taurbod unlock:
					output("\n\nAs your body slowly transforms to be more deer-like, you feel your [pc.asshole]");
					if(target.hasVagina()) 
					{
						output(" and [pc.cunts] seem");
						if(target.totalVaginas() == 1) output("s");
					}
					output(" to grow deeper, much more capacious. You feel like you could take much longer, thicker insertions now. Your tauric body certainly has room for it!");
					if(target.isBimbo()) output(" You’re already thinking about a hot stud to fill you up over and over, until he’s completely spent.");
				}
				//if tauric already: 
				else
				{
					output("\n\nYour already tauric body itches and crawls, beginning to change as a result of the transformative you took. Your skin furs over, outcrops of brown fur popping up across your body. Your legs thin slightly, hooves on the end of your feet. The transformation is slow, but fills you with a subtle pleasure the whole time. <b>Your body is now that of a deer!</b>");
				}
				target.genitalSpot = 2;
				target.legCount = 4;
				target.legType = GLOBAL.TYPE_DEER;
				target.furColor = "brown";
				target.clearLegFlags();
				target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
				target.addLegFlag(GLOBAL.FLAG_HOOVES);
				target.addLegFlag(GLOBAL.FLAG_FURRED);
			}
			else output("\n\n" + target.legCountLockedMessage());
		}
		//Facial TF
		//PC doesn't have a human face. Gain a human face.
		public function humanFaceTeef(pc:Creature):void
		{
			if(pc.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
			{
				output("\n\nYou feel your [pc.face] start to strain, becoming ");
				if(pc.skinType == GLOBAL.SKIN_TYPE_GOO) output("harder and firmer, taking on a more defined shape");
				else output("softer and more malleable");
				output(". You run a hand along your mutating features, and find that your face is taking on an altogether more human shape. You’re soon left with a solidifying visage: " + pc.mfn("you’ve got a manly jaw and sharp features,","you have a cute little nose and delicate features,","you’ve got an androgynous visage somewhere between a typical male and a typical female,") + " <b>an altogether human face</b>.");
				pc.clearFaceFlags();
				pc.faceType = GLOBAL.TYPE_HUMAN;
			}
			else output("\n\n" + pc.faceTypeLockedMessage());
		}
		//Cock TF
		//Changes cocktype to equine. Increases in size, up to 18 inches long.
		//Massive Lust spike. 
		public function growADeerCawk(pc:Creature):void
		{
			if(pc.cockTypeUnlocked(0, GLOBAL.TYPE_EQUINE))
			{
				output("\n\nYou feel a sudden rush of arousal building up in [pc.oneCock], blood rushing to pump it full");
				if(!pc.isCrotchExposed()) output(" as it strains against your [pc.lowerGarment]");
				output(".");

				var eligible:Array = new Array();
				var maxGrowth:int = 18;
				if(pc.hasPerk("Mini")) maxGrowth -= 8;
				else if(pc.hasPerk("Hung")) maxGrowth += 8;
				if(pc.tallness >= 72) maxGrowth++;
				if(pc.tallness >= 84) maxGrowth += 2;
				if(pc.isBro()) maxGrowth += 2;

				for(var x:int = 0; x < pc.cockTotal(); x++)
				{
					if(pc.cocks[x].cType != GLOBAL.TYPE_EQUINE) eligible.push(x);
					else if(pc.cocks[x].cLength() < maxGrowth) eligible.push(x);
				}
				var y:int = eligible[rand(eligible.length)];

				//if not equine already:
				if(pc.cocks[y].cType != GLOBAL.TYPE_EQUINE)
				{
					output(" It begins to shift form, forming a ring around the middle and thickening at the head - perfect for stretching a cute deertaur wiiide open so you can slide the rest of your considerable length in after it. You groan in satisfaction as it finishes thickening, settling into place as a <b>thick, flared equine cock!</b> Vesperians must believe in walking softly and carrying a big stick.");
					pc.changeLust(40);
					pc.shiftCock(y,GLOBAL.TYPE_EQUINE);
					pc.libido(2);
				}
				//if less than 18" long: 
				else if(pc.cocks[y].cLength() < maxGrowth)
				{
					//Megagrow - one shot six-inch growth
					if(rand(4) == 0 && !pc.hasPerk("Mini"))
					{
						author("Fenoxo & Wsan");
						if(!pc.isCrotchExposed()) output("\n\nYou barely have time to fish your swelling equine member out of your bottoms before");
						else output("\n\nYou barely have time to wrap a steadying hand around your swelling equine member before");
						output(" wave of growth rolls through it, physically prying your fingers open with the new girth it brings. Inch after inch of fresh length pours out of your growth, swelling the obscene totem longer and higher. After the excitement reaches its peak, your pulsing phallus wobbles and bows downward under its own weight, dribbling pre-cum. You whimper, hand stroking of its own volition, a virtual prisoner to the pleasure of your expanding prick. Then it happens again: your dickskin audibly creaks from stretching a full three inches in the space of a few seconds, taut and shining. It feels to good to do anything but cum and watch the obscene flare at your tip expand.\n\nPumping your [pc.hips], you squirt... and squirt some more, rapturously ejaculating every drop from your newly-enhanced horse-cock. You feel like a stallion... one destined to fuck every cute doe in a five mile radius. Panting, you examine your changed genitalia.");
						pc.orgasm();
						pc.ballFullness = 0;
						pc.cocks[y].cLengthRaw += 6;
					}
					//Normalgrow
					else
					{
						output("\n\nYour [pc.cock " + y + "] grows, expanding outwards as waves of pleasure roll through it until finally, you can’t help but cum just feeling it stretch. You huff a satisfied sigh and inspect your recently-grown cock.");
						pc.orgasm();
						pc.cocks[y].cLengthRaw += 1+rand(2);
						if(pc.cocks[y].cLength() < maxGrowth - 5) pc.cocks[y].cLengthRaw++;
					}
					pc.libido(1);
					output(" Looks like it’s " + num2Text(Math.round(pc.cocks[y].cLength())) + " inches long!");
				}
			}
			else output("\n\n" + pc.cockTypeLockedMessage());
		}
		public function hasTFableDix(pc:Creature):Boolean
		{
			if(!pc.hasCock()) return false;
			var eligible:Array = new Array();
			var maxGrowth:int = 18;
			if(pc.hasPerk("Mini")) maxGrowth -= 8;
			else if(pc.hasPerk("Hung")) maxGrowth += 8;
			if(pc.tallness >= 72) maxGrowth++;
			if(pc.tallness >= 84) maxGrowth += 2;
			if(pc.isBro()) maxGrowth += 2;

			for(var x:int = 0; x < pc.cockTotal(); x++)
			{
				if(pc.cocks[x].cType != GLOBAL.TYPE_EQUINE) eligible.push(x);
				else if(pc.cocks[x].cLength() < maxGrowth) eligible.push(x);
			}
			return (eligible.length > 0);
		}
		//Vagina TF
		//Change vagina type to equine. Huge capacity increase. 
		public function vaginaDeerTF(pc:Creature):void
		{
			if(pc.vaginaTypeUnlocked(0, GLOBAL.TYPE_DEER))
			{
				output("\n\nYour [pc.vaginas] clench");
				if(pc.totalVaginas() == 1) output("es");
				output(" hard all of a sudden, squirting an ungodly amount of pussy-juice ");
				if(!pc.isCrotchExposed()) output("onto your thighs");
				else output("onto the inside of your [pc.lowerGarment]");
				output(". You almost double over as waves of pleasure crash into your crotch, sending trembling shockwaves all through your body in reaction.");
				output("\n\nYou cum, hard, drenching yourself in girl-cum. Rather than clamping down more, though, your sex seems to stretch out as it orgasms, growing larger, thicker, darker... by the time it’s done, you feel like you’re rocking ");
				if(pc.totalVaginas() == 1) output("a doe-cunt");
				else output("doe-cunts");
				if(pc.isNaga()) output(" on the face of your naga body");
				else if(pc.legCount > 1) output(" between your [pc.legs]");
				output(". A quick touch and feel tells you that that’s exactly the case: <b>your feminine sex");
				if(pc.totalVaginas() == 1) output(" is");
				else output("es are");
				output(" now just like a deer’s</b>.\n\nNow to find a nice, fat cock to break your new doe-cunt in...");

				for(var x:int = 0; x < pc.totalVaginas(); x++)
				{
					pc.shiftVagina(x,GLOBAL.TYPE_DEER);
					pc.vaginas[x].bonusCapacity += 200;
				}
				pc.orgasm();
				pc.libido(2);
			}
			else output("\n\n" + pc.vaginaTypeLockedMessage());
		}
		public function needDeerCunt(pc:Creature):Boolean
		{
			if(!pc.hasVagina()) return false;
			for(var x:int = 0; x < pc.totalVaginas(); x++)
			{
				if(pc.vaginas[x].type != GLOBAL.TYPE_DEER) return true;
			}
			return false;
		}
		//Height Change
		public function deertaurHeightChange(target:Creature):void
		{
			if(target.tallnessUnlocked(target.tallness - 6))
			{
				//Shrink, variable from 5' to 6' for females and 5'6 to 6'6 for males
				output("\n\nWhoa! The room’s spinning, and if you’re not imagining things, getting bigger. You glance around wide-eyed as your body shrinks, watching others suddenly tower over you. You’re shorter now, your center of gravity lower to the ground, increasing your stability and speed. Checking your codex, apparently <b>you’re now " + num2Text(Math.round(target.tallness / 12)) + " feet");
				if(target.tallness % 12 != 0) output(" and " + num2Text(Math.round(target.tallness % 12)) + " inches");
				output(" tall!</b>");

				target.tallness -= 3 + rand(10);
			}
			else output("\n\n" + target.tallnessLockedMessage());
		}
		public function needsHeightTF(target:Creature):Boolean
		{
			var tooTall:Number = 78;
			if(target.hasVagina() && !target.hasCock()) tooTall -= 6;
			if(target.hasVagina() && target.hasCock()) tooTall -= 3;
			return (target.tallness > tooTall);
		}
		//Horn TF
		public function hornTFForDeertaur(pc:Creature):void
		{
			var numPoints:int = 4 + rand(9);
			var numLength:int = 8 + rand(5);
			
			if(pc.hornsUnlocked(numPoints) && pc.hornLengthUnlocked(numLength) && pc.hornTypeUnlocked(GLOBAL.TYPE_DEER))
			{
				//Antlers for males
				if(pc.horns > 0) output("\n\nYour [pc.horns] crack, then flake away like little more than dust. In their place, you");
				else output("\n\nYou");
				output(" feel a scratchy sensation just above your ears, and the moment you reach up to check it out you’re struck by a sharp pain. Cringing, you scrunch your eyes shut as the pain passes, an odd sensation persisting in its wake. You gingerly reach up to feel it out, and your hand strikes bone! You grip it, feeling a velvety covering spread across its length. When all is said and done, <b>you have an impressive set of antlers!</b>");
				
				pc.removeHorns();
				pc.hornType = GLOBAL.TYPE_DEER;
				pc.hornLength = numLength;
				pc.horns = numPoints;
			}
			else output("\n\n" + pc.hornsLockedMessage());
		}
	}
}