package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.RandomInCollection;
	
	public class FrontRackCream extends ItemSlotClass
	{
		public function FrontRackCream() {
			this._latestVersion = 1;
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.DRUG;
			
			this.shortName = "FrontRack";
			this.longName = "FrontRack cream";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a small bottle of FrontRack cream";
			this.tooltip = "This J’ejune cream was developed as an affordable means of restoring breast tissue in victims of serious accidents or health conditions. Despite its noble roots, test subjects soon found out that this cream worked in such way that replicas of the breasts, usually smaller, formed beneath the already existing sets. Therefore, the cream was deemed as unfit for medical usage and rebranded to appeal to certain kink circles.\n\nThis pale lavender cream comes in a small colorfully-labeled container, its size and shape resembling that of a nail polish bottle, and claims that the effect <i>may</i> take place after a few minutes. A disclaimer states that J’ejune Pharmaceutical is not held accountable if it doesn’t.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 600;
			
			this.version = _latestVersion;
		}
	
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			kGAMECLASS.showName("\nFRONTRACK");
			author("Kesil");
			
			if(target is PlayerCharacter)
			{
				var pc:Creature = target;
				
				if (pc.bRows() <= 1)
				{
					output((!pc.isChestExposed() ? "Once you’ve shed your upper gear, y" : "Y") + "ou unscrew the cap with your fingertips. Carefully, you rub the contents of the tiny bottle across your [pc.chest] in circles. It takes only a minute for the cream to melt into your body.");
				}
				else
				{
					output("You unscrew the cap with your fingertips" + (!pc.isChestExposed() ? " once you’ve shed your upper gear" : "") + ". Carefully, you apply the contents of the small bottle, minding your already existent mounds, gently ");
					if(!pc.hasBreasts() && pc.tone >= 60) output("spreading the contents of the bottle over your firm, muscular pecs.");
					else output("pressing any supple flesh with the fingertips of one of your hands and spread the contents of the bottle with the other, tending to one breast at a time.");
				}
				output("\n\n");
				
				// Suggested, from goo menu:
				var boobRowMax:int = 3;
				if(pc.isNaga() || pc.isGoo()) boobRowMax = 5;
				// Initial, from item:
				//Fen: NOPE!
				//boobRowMax = 10;
				
				if(pc.bRows() == boobRowMax) maxBoobsWarn(target);
				else if (pc.bRows() < boobRowMax && rand(2) == 0) boobRowTF(target, boobRowMax);
				else dudWarn(target);
			}
			
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " applies the FrontRack cream but to no effect.");
			}
			
			return false;
		}
		
		public function boobRowTF(target:Creature, boobRowMax:int):void
		{
			var pc:Creature = target;
			var hasBreasts:Boolean = (pc.breastRows[(pc.breastRows.length - 1)].breastRating() >= 1);
			
			if(pc.bRows() == 1)
			{
				output("It doesn’t take long until a swelling feel surges beneath your [pc.breasts]. Curious, you caress the skin and notice how sensitive to the touch it is. A pair of nubs poke out, followed by an excess of flesh that keeps on budding up <b>until it forms into a new pair of ");
				if(!hasBreasts && pc.tone >= 60) output("muscular pecs");
				else if(!hasBreasts) output("flat breasts");
				else output("A-cup breasts");
				output(" below the ones you already had.</b>");
			}
			else if(pc.bRows() == (boobRowMax - 1))
			{
				output("A familiar sensation courses through your chest area. A pair of fleshy nubs poke out, followed by an excess of soft flesh that keep on budding up <b>until it forms into a new pair of ");
				if(!hasBreasts && pc.tone >= 60) output("muscular pecs");
				else if(!hasBreasts) output("flat breasts");
				else output("A-cup breasts");
				output(" below the ones you already had.</b> When the warm distention process ends, you suspect <i>your frame may not be able to sustain any more mammaries next time you decide to add more ");
				if(!hasBreasts && pc.tone >= 60) output("muscle");
				else if (!hasBreasts) output("flat breasts");
				else output("breasts");
				output(".</i>");
			}
			else
			{
				output("A familiar sensation courses through your chest area. Smiling, you lower your head to confirm that flesh, muscle and fat are rearranging themselves anew. You eye two small lumps of flesh that quickly develop into [pc.nipples]. It doesn’t take long for their formation to finish, but once they fully bud out they herald a swell of flesh that soon accommodates right under your other mammaries. When the warm distention process ends, a tactile inspection confirms that <b>you now have another set of ");
				if (!hasBreasts && pc.tone >= 60) output("muscular pecs");
				else if(!hasBreasts) output("flat breasts");
				else output("A-cup breasts");
				output(".</b>");
			}
			
			pc.createBreastRow();
			var newRow:int = (pc.breastRows.length - 1); // This sets the index for the latest breast row.
			pc.breastRows[newRow].nippleType = pc.breastRows[(newRow - 1)].nippleType; // This copies the nipple type from the previous row and makes it the same value for the new row.
			pc.breastRows[newRow].breasts = 2;
			
			if (hasBreasts)
			{
				pc.breastRows[newRow].breastRatingRaw = 1;
			}
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		public function maxBoobsWarn(target:Creature):void
		{
			var pc:Creature = target;
			
			output("Even though your torso is already covered with row after row of ");
			if(!pc.hasBreasts() && pc.tone >= 60) output("pecs");
			else output("breasts");
			output(", you wonder whether you could squeeze more ");
			if(!pc.hasBreasts() && pc.tone >= 60) output("muscle");
			else output("tits");
			output(" there. After inspecting your body from shoulders to crotch, you conclude there’s no way your body could make room for another row, ");
			if(!pc.hasBreasts() && pc.tone >= 60) output("and another row of pectorals may be more trouble than it’s worth.");
			else if(pc.femininity > 55) output("no matter how waifish it would be.");
			else output("no matter how " + RandomInCollection(["tiny", "small", "diminuitive"]) + " it would be.");
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		
		public function dudWarn(target:Creature):void
		{
			output("After waiting for the results for several minutes, your [pc.chest] remains the same. Either this product you bought was a dud or you were a very unlucky customer.");
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);	
		}
	}
}

