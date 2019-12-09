package classes.Items.Miscellaneous 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class UthraSap extends ItemSlotClass
	{
		public function UthraSap() 
		{
			this._latestVersion = 1;
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.POTION;
			
			this.shortName = "UthraSap";
			this.longName = "bottled uthra sap";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a small bottle of uthra sap";
			
			this.tooltip = "The Codex informs you the sap of the Uthra Birch is well known for its transformative properties. When applied to the breasts or testicles, it reduces them in size. It is a substance used by the vanae for ritual punishment.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 25;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			
			if (!(target is PlayerCharacter))
			{
				kGAMECLASS.output(target.capitalA + target.short + " drinks the sap to no effect.");
			}
			else
			{	
				var changes:int = 0;
				
				kGAMECLASS.output("You stare at the ominous onyx sap that seems to suck out all the light around it.");
				if (kGAMECLASS.flags["CONSUMED_UTHRA_SAP"] == undefined)
				{
					kGAMECLASS.flags["CONSUMED_UTHRA_SAP"] = 1;
					kGAMECLASS.output(" According to the Codex, it’s not safe for consumption - you’re going to have to smear it on your naked [pc.skinFurScales] if you want to see the effects.");
				}
				else kGAMECLASS.output(" You know from last time that you’ve got to smear it on your naked [pc.skinFurScales] to see the effects.");

				kGAMECLASS.output("\n\nYou strip off your [pc.gear] and then thoroughly smear the sticky substance all over your [pc.chest] and loins. The entire experience feels very naughty as you rub the surprisingly cool sap all over your genitals. It’s almost as if you’re lubing yourself up for");
				if (target.hasCock()) kGAMECLASS.output(" a quick fap");
				else kGAMECLASS.output(" a quick frig");
				kGAMECLASS.output(".");

				kGAMECLASS.output("\n\nYou really get into working the lewd liquid all over your");
				if (target.hasCock())
				{
					kGAMECLASS.output(" [pc.cock]");
					if (target.balls > 0) kGAMECLASS.output(" and [pc.balls]");
					if (target.hasVagina() || target.biggestTitSize() > 0) kGAMECLASS.output(",");
				}
				if (target.hasVagina()) kGAMECLASS.output(" [pc.pussy]");
				if ((target.hasVagina() || target.hasCock()) && target.biggestTitSize() > 0) kGAMECLASS.output(" and [pc.fullChest]");
				kGAMECLASS.output(". Soon you find yourself stroking");
				if (!target.hasCock() && !target.hasVagina()) kGAMECLASS.output(" your [pc.nipples]");
				else kGAMECLASS.output(" yourself off");
				kGAMECLASS.output(" and the smacking sound of the syrupy fluid quickly fills the air. You let out a husky moan and let your head loll back. Why exactly were you smearing this on yourself again?");

				// Faux-lactation, the "method" by which the mass is lost from the titties
				if (target.biggestTitSize(true) > 0)
				{
					var moddedAnyTits:int = 0;
					var removedTitRows:int = 0;
					
					kGAMECLASS.output("\n\nWithout warning, you suddenly begin lactating");
					if (target.isLactating()) kGAMECLASS.output(" heavily");
					kGAMECLASS.output(" from your [pc.chest]. Your [pc.nipples] tingle and ache as they leak [pc.milk] all over your [pc.skinFurScales] and drool down your [pc.belly].");
					if (target.hasCock()) kGAMECLASS.output(" You increase the speed of your strokes and let out a whimpering little moan.");
					else
					{
						kGAMECLASS.output( "You plunge your fingers deep into your");
						if (target.hasVagina()) kGAMECLASS.output(" [pc.pussy] and stir them around");
						else kGAMECLASS.output(" [pc.asshole] and stroke your sensitive prostate.");
					}
					kGAMECLASS.output(" It feels so goooood!");
					
					for (var i:int = target.breastRows.length - 1; i >= 0; i--)
					{
						var ratingReduction:Number = 1; // 0 -> 5
						if (target.breastRows[i].breastRatingRaw > 5) ratingReduction = 2;
						if (target.breastRows[i].breastRatingRaw > 12) ratingReduction += target.breastRows[i].breastRatingRaw * 0.1;
						
						if (target.breastRatingUnlocked(i, target.breastRows[i].breastRatingRaw - ratingReduction))
						{
							target.breastRows[i].breastRatingRaw -= ratingReduction;
							if (moddedAnyTits == 0) moddedAnyTits = ratingReduction;
							changes++;
							
							if (i > 0 && target.breastRows[i].breastRatingRaw <= 0)
							{
								target.removeBreastRow(i, 1);
								removedTitRows++;
							}
						}
					}
					
					if (moddedAnyTits > 0)
					{
						kGAMECLASS.output("\n\nYou soar higher and higher and your octaves rise as well. In one blissful shuddering moment you let out a sweet cry and violently climax from your [pc.chest]. Your [pc.nipples] shoot [pc.milk] all over the place and spew all over your [pc.legOrLegs], smearing them in your [pc.milkVisc] emissions.");
						
						if (moddedAnyTits > 1)
						{
							kGAMECLASS.output(" You cum from your [pc.nipples] again and again, each time spraying more of your [pc.milk] all over yourself. With each explosive release, your [pc.chest] steadily shrinks as if you’re spurting out their contents. By the time you finish orgasming they’ve diminished in size to a [pc.breastCupSize]. <b>Your breasts have shrunk dramatically!</b>");
						}
						else
						{
							kGAMECLASS.output(" <b>Your breasts have shrunk!</b>");
						}
						
						if (removedTitRows > 0)
						{
							kGAMECLASS.output(" The shrinking effect continues unabated, succulent tit flesh gradually diminishing until nought but nipples remain - and soon those are gone too. <b>" + target.Num2Text(removedTitRows) + " row" + ((removedTitRows > 1) ? "s" : "") + " of breasts " + ((removedTitRows > 1) ? "have" : "has") + " dissipated from your chest.</b>");
						}
					}
				}
			
				// If pc.hasBalls = true
				if (target.balls > 0 && target.hasCock())
				{
					kGAMECLASS.output("\n\nLying there in a pool of your own [pc.milk], you feel yourself seized with lust once again. Your head is spinning with druggy goodness as you reach for your [pc.balls] and [pc.cock]. You frantically smear more sap on them and begin stroking yourself off once more. If it felt that good from your [pc.chest], imagine how your groin will feel!");

					kGAMECLASS.output("\n\nYou work");
					if (target.cocks.length > 1) kGAMECLASS.output(" one of");
					kGAMECLASS.output(" your slickened [pc.sheath]");
					if (target.cocks.length > 1) kGAMECLASS.output("s");
					kGAMECLASS.output(" with one hand and fondle your [pc.balls] with the other. It’s so easy to stroke yourself off with this sap; it feels as if it would be wrong <i>not</i> to. Your [pc.cumVisc] pre boils out from the tip of your [pc.cockHead] and mixes with the murky liquid. It forms glorious little spunk bubbles that explode and spill out your [pc.cumColor] love juice.");

					kGAMECLASS.output("\n\nYou spread your [pc.thighs] and fiercely work your [pc.cock], now grabbing it with two hands. Fapping like there’s no tomorrow, your senses are shamelessly seized in the rapturous heights of self pleasure. In a truly blissful instant you spill your [pc.cum] all around shooting [pc.cumVisc] ropes of [pc.cumColor] everywhere.");

					target.orgasm();
					
					var ballSizeReduction:Number = 0.5;
					if (target.ballSizeRaw > 5) ballSizeReduction = 1;
					if (target.ballSizeRaw > 10) ballSizeReduction = 2;
					if (target.ballSizeRaw > 20) ballSizeReduction += target.ballSizeRaw * 0.2;
					
					var newBallSize:Number = target.ballSizeRaw - ballSizeReduction;
					
					if (target.ballSizeUnlocked(newBallSize))
					{
						kGAMECLASS.output("\n\nInstead of immediate release, your [pc.cock] keeps relentlessly spurting your spunk like an out-of-control hose. You moan and arch your back - you’re paralyzed with pleasure and unable to do anything about it. A tiny part of you panics at the thought it may <i>never</i> stop cumming, though the rest of you happily trembles at the thought.");
						
						kGAMECLASS.output("\n\nWith each and every spurt the size of your [pc.balls] diminish. As your balls tighten it feels as if you’re utterly cumming them out of existence.");
						
						changes++;
						
						if (newBallSize > 0)
						{
							kGAMECLASS.output(" In the end you lose");
							if (ballSizeReduction > 5) kGAMECLASS.output(" quite a few inches");
							else if (ballSizeReduction > 2) kGAMECLASS.output(" a few inches");
							else if (ballSizeReduction > 1) kGAMECLASS.output(" over an inch");
							else if (ballSizeReduction == 1) kGAMECLASS.output(" around an inch");
							else kGAMECLASS.output(" a little bit");
							kGAMECLASS.output(" of size, your [pc.sack] feeling quite a bit lighter and <i>entirely</i> emptied. <b>Your balls have shrunk to a more manageable size.</b>");
							
							target.ballSizeRaw = newBallSize;
						}
						else
						{
							kGAMECLASS.output(" In the end you actually do, your [pc.sack] shrinking away until you’re left with a smooth patch of [pc.skinFurScales] in its place. <b>You no longer have balls!</b>");
							
							target.removeBalls();
						}
					}
					else kGAMECLASS.output("\n\n" + target.ballSizeLockedMessage());
				}
				
				kGAMECLASS.output("\n\nYou feel completely and utterly wiped when you stop orgasming at long last. You drag yourself to your [pc.feet] with considerable effort and examine your");
				if (moddedAnyTits > 0) kGAMECLASS.output(" [pc.milk]");
				if (target.hasCock() && moddedAnyTits > 0) kGAMECLASS.output(" and");
				if (target.hasCock()) kGAMECLASS.output(" [pc.cum]");
				kGAMECLASS.output(" soaked body for changes.");
				if (changes == 0) kGAMECLASS.output(" In the end, you didn’t change at all. But what a rush!");
				else kGAMECLASS.output(" What a rush!");
			}
			
			return false;
		}
	}
}