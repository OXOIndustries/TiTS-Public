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
	import classes.Items.Transformatives.TauricoVenidae; // Import unchanged TFs
	
	public class TauricoVenidaeLight extends ItemSlotClass
	{
		public function TauricoVenidaeLight() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			this.shortName = "DeerLite";
			this.longName = "Deerium Lite";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a Deerium Lite medipen";
			
			this.tooltip = "With the success of Taurico Venidae, VesperTech received high demands to create a 'Deerium Lite' for those who wanted to gain deer-like features without becoming a taur. This time, VesperTech's marketing team chose to stick with the more popular name.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 3500;
			
			this.version = this._latestVersion;
		}

		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			
			if (!(target is PlayerCharacter))
			{
				output(target.capitalA + target.short + " uses the injector to no effect.");
				return false;
			}
			
			clearOutput();
			author("VoidLord");

			output("You hold the medipen to your arm and slowly press down. You feel a bit of numbness, which is quickly followed by a sharp prick as the medipen injects you with the Deerium Lite. Hope this works.");
			
			var TFs:Array = new Array();

			// These are unchanged from Taurico Venidae
			var taurico:TauricoVenidae = new TauricoVenidae();
			if(taurico.needDeerCunt(target)) TFs.push(taurico.vaginaDeerTF);
			if(target.earType != GLOBAL.TYPE_DEER) TFs.push(taurico.deerEarTF);
			if(target.tailType != GLOBAL.TYPE_DEER || target.tailCount <= 0) TFs.push(taurico.deerTailTF);
			if(target.faceType != GLOBAL.TYPE_HUMAN && target.faceType != GLOBAL.TYPE_DEER) TFs.push(taurico.humanFaceTeef); //slightly changed condition
			if(target.hasCock() && (target.horns == 0 || target.hornType != GLOBAL.TYPE_DEER)) TFs.push(taurico.hornTFForDeertaur);
			if(target.hasLegFlag(GLOBAL.FLAG_FURRED) && ((target.legType != GLOBAL.TYPE_DEER && target.furColor != "brown") || (target.legType == GLOBAL.TYPE_DEER && target.furColor != "white-dappled brown"))) TFs.push(taurico.skinToFur);

			// New Taurico
			if(hasTFableDix(target)) TFs.push(deerifyCawk);
			if(target.eyeType != GLOBAL.TYPE_DEER) TFs.push(deerEyeTF);
			if(target.legType != GLOBAL.TYPE_DEER || !target.isBiped() || target.legCount != 2) TFs.push(deermorphBodyTF);
			if(target.faceType == GLOBAL.TYPE_HUMAN && rand(4) == 0) TFs.push(halfDeerFaceTF);
			if(target.faceType == GLOBAL.TYPE_DEER && target.hasPartFur("face") && !(target.hasFaceFlag(GLOBAL.FLAG_LONG) || target.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) && rand(4) == 0) TFs.push(fullDeerFaceTF);
			if(target.skinType != GLOBAL.SKIN_TYPE_FUR && rand(4) == 0) TFs.push(furrificationTF);
			if (target.skinType == GLOBAL.SKIN_TYPE_FUR && ((target.legType != GLOBAL.TYPE_DEER && target.furColor != "brown") || (target.legType == GLOBAL.TYPE_DEER && target.furColor != "white-dappled brown") && rand(4) == 0)) TFs.push(furDyeTF);


			if(TFs.length == 0)
			{
				output("\n\nNothing happens. Oh deer, looks like it's already done all it could.");
			}
			else 
			{
				var select:Number = rand(TFs.length);
				TFs[select](target);
			}
			return false;
		}

		public function hasTFableDix(target:Creature):Boolean
		{
			for each (var cawk:CockClass in target.cocks) if (cawk.cType != GLOBAL.TYPE_DEER) return true;
			return false;
		}

		// Change eyes to Deer eyes
		// Change eye color to brown or amber
		public function deerEyeTF(target:Creature):void
		{
			if (target.eyeTypeUnlocked(GLOBAL.TYPE_DEER))
			{
				output("\n\nYour vision blurs as you feel your");
				if (target.eyeCount() > 2) output(" top " + (target.eyeCount() > 3 ? "set of eyes" : "eye") + " shrink into your head, while your primary");
				output(" eyes bloat up, like they're about to pop! Thankfully, it stops and you quickly regain your vision and check your codex to see the changes. <b>Well, you certainly look 'doe-eyed' now!</b>");

				target.eyeType = GLOBAL.TYPE_DEER;

				var colors:Array = new Array();
				if (target.eyeColorUnlocked("amber")) colors.push("amber");
				if (target.eyeColorUnlocked("brown")) colors.push("brown");
				if (colors.length > 0) target.eyeColor = RandomInCollection(colors);
			}
			else output("\n\n" + target.eyeTypeLockedMessage());
		}

		// Grow/Change/Merge legs into 2 Deer legs
		// Legs become digitigrade, furred, hooves
		// Change fur color to brown or white-dappled brown
		// Change genital position to waist
		public function deermorphBodyTF(target:Creature):void
		{
			if(!target.legCountUnlocked(2)) output("\n\n" + target.legCountLockedMessage());
			else if (!target.legTypeUnlocked(GLOBAL.TYPE_DEER)) output("\n\n" + target.legTypeLockedMessage());
			//if no deer legs: 				
			else
			{
				output("\n\nYour [pc.legOrLegs] suddenly become weak, sending you tumbling onto your " + (target.isTaur() ? "flank" : "butt") + " wondering what’s happening. You flop on the floor helplessly feeling like ");
				if(target.legCount == 1) output("you’re splitting in half, until it really happens and your lower body becomes a pair of legs! They grow to look like those of a deer, with light brown fur capped by small black hooves.");
				else output("they’re turning to putty, until they change shape and start to resemble those of a deer, with light brown fur capped by small black hooves.");
				if(target.legType == GLOBAL.TYPE_EQUINE || target.legType == GLOBAL.TYPE_DEER || target.hasLegFlag(GLOBAL.FLAG_HOOVES)) output(" Your new legs aren’t much different than the old, to be honest.");
				else output(" You carefully get up, balancing yourself on your hooves as you try to get used to your new gait.");
				output(" <b>You now have the legs of a deer!</b>");

				target.genitalSpot = 0;
				target.legCount = 2;
				target.legType = GLOBAL.TYPE_DEER;
				target.furColor = "brown";
				target.clearLegFlags();
				target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
				target.addLegFlag(GLOBAL.FLAG_HOOVES);
				target.addLegFlag(GLOBAL.FLAG_FURRED);
			}
		}

		// Change to Deer penis/es
		// Penis/es becomes tapered, sheathed
		// Change penis color to pink
		public function deerifyCawk(target:Creature):void
		{
			var eligible:Array = new Array();
			for (var i:int = 0; i < target.cocks.length; i++) if (target.cocks[i].cType != GLOBAL.TYPE_DEER && target.cockTypeUnlocked(i, GLOBAL.TYPE_DEER)) eligible.push(i);

			if (eligible.length > 0)
			{
				i = RandomInCollection(eligible); // Yes, yes, bad practice - fuck the police
				output("\n\nThere's a rush of heat that hits your groin and pulses through your [pc.cocks]");
				if (!target.isCrotchExposed()) output(", causing " + (target.hasCocks() ? "them" : "it") + " to strain against your [pc.crotchCoverUnder]");
				output(".");
				output("\n\nThe pulsing continues as you feel your [pc.cock " + i + "] shrink into your crotch, disappearing");
				if (target.hasSheath(i) || target.hasStatusEffect("Genital Slit")) output(" into your " + (target.hasStatusEffect("Genital Slit") ? "slit" : "sheath"));
				output(" completely. Just as you think your cock has been removed, you see a tapered head poking out of your");
				if (!target.hasSheath(i)) output(" newly formed");
				output(" sheath, stretching outwards until it reaches its full length.");
				if (target.hasCockFlag(GLOBAL.FLAG_TAPERED, i)) output(" Come to think of it, it doesn't look too different from your old one.");
				output(" <b>You now have a sheathed, tapered deer's cock!</b>");

				target.shiftCock(i, GLOBAL.TYPE_DEER);
			}
			else output("\n\n" + target.cockTypeLockedMessage());
		}

		public function halfDeerFaceTF(target:Creature):void
		{
			if (target.faceTypeUnlocked(GLOBAL.TYPE_DEER))
			{
				output("\n\nYou feel your nose twitch for a bit, but your face doesn't feel any different. Still, you pull up your codex just to make sure. And behold, <b>you now have an adorable black, button nose - just like a deer's!</b>");
				target.faceType = GLOBAL.TYPE_DEER;
				target.clearFaceFlags();
			}
			else output("\n\n" + target.faceTypeLockedMessage());
		}

		public function fullDeerFaceTF(target:Creature):void
		{
			if (target.faceFlagsUnlocked([GLOBAL.FLAG_LONG, GLOBAL.FLAG_MUZZLED]))
			{
				output("\n\nYou feel an uncomfortable tingling sensation as the bones in your face begin flex out, stretching your nose and jaw until they form <b>a long, elegant snout, like a deer's!</b>");

				target.addFaceFlag(GLOBAL.FLAG_LONG);
				target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
				target.addFaceFlag(GLOBAL.FLAG_FURRED);
			}
			else output("\n\n" + target.faceFlagsLockedMessage());
		}

		public function furrificationTF(target:Creature):void
		{
			if (target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
			{
				if (target.hasScales()) output("\n\nYour scales are flaking off! One after another, the shiny [pc.scaleColor] little plates are falling to the ground. In their place soft, [pc.furColor] hairs spring up. You brush the last of your scales away as your full-body fur finishes growing in.");
				else if (target.hasChitin()) output("\n\nYour chitinous armor cracks loudly. Thankfully, it doesn’t hurt even though the fractures are spreading across your body like breaking glass. You peel away a piece and discover [pc.skinFurScales] growing up out of the gap, and as you marvel at it, the rest of your chitin slowly sloughs off.");
				else output("\n\nTiny hairs break through the surface of your [pc.skin], making you itch like crazy. It’s enough to distract you for sure, and it only gets worse as more and more hair emerges. The ones that came out first are getting longer and thicker, with the newer additions following close behind.");
				output("\n\n<b>Your whole body is now covered in [pc.skinFurScales]!</b>");

				target.skinType = GLOBAL.SKIN_TYPE_FUR;
				target.clearSkinFlags();
			}
			else output("\n\n" + target.skinTypeLockedMessage());
		}

		public function furDyeTF(target:Creature):void
		{
			output("\n\nYour fur begins to change in color, becoming a light brown save for your stomach and tail turning white.");
			if (target.legType == GLOBAL.TYPE_DEER) output(" You notice that you have white spots across your body too, giving a dappled effect of color.");
			output(" <b>You now have brown fur");
			if (target.legType == GLOBAL.TYPE_DEER) output(" dappled with white spots");
			output("!</b>");

			target.furColor = (target.legType == GLOBAL.TYPE_DEER ? "white-dappled " : "") + "brown";
		}
	}
}