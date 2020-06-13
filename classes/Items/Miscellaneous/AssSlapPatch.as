// The Xenogen Ass Slap Patch
// by Foxxling

package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StorageClass;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.indefiniteArticle;
	import classes.Engine.Utility.num2Ordinal;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.rand;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	
	public class AssSlapPatch extends ItemSlotClass
	{
		public function AssSlapPatch()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 50;
			type = GLOBAL.PILL;
			
			shortName = "Ass Patch";
			longName = "Ass Slap patch";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "the Xenogen Ass Slap patch";

			tooltip = "A small black square-shaped packet with a shiny metallic butt on the front. The back has a set of instructions, a list of side effects, a standard medical legalese and other legal jargon.\n\n[altTooltip AssSlapPatch]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 200;
			
			version = _latestVersion;
		}
		
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			
			if(target is PlayerCharacter)
			{
				author("Foxxling");
				
				if(target.hasStatusEffect("Ass Slap Patch"))
				{
					output("You can only wear one patch at a time.");
					if(!kGAMECLASS.infiniteItems()) quantity++;
					
					return false;
				}
				else
				{
					useAssPatch(target);
				}
			}
			else
			{
				output(target.capitalA + target.short + " uses the patch, but nothing happens.");
			}
			return false;
		}
		
		protected function useAssPatch(target:Creature):void
		{
			output("You tear the packet open and pull the smooth paper covering the adhesive side.");
			if(target.isNude()) output(" Since you’re already naked, you go ahead and slap the patch on your [pc.ass].");
			else if(!target.isAssExposed()) {
				if(!target.hasArmor()) output("You reach into your [pc.lowerUndergarment] and do your best to slap the patch onto your [pc.ass].");
				else output(" You reach into your [pc.armor] and press the patch onto your [pc.ass].");
			}
			output(" The moment the patch is secure, you flinch when a low level electric shock fires into your buttocks. After that, the occupied spot on your butt grows warm. You adjust to the heat of the patch and it begins to gently vibrate against your [pc.skin].");
			
			target.changeLust(5);
			
			output("\n\n");
			// Notes: The pad is expended after 2 days. Has a 1/3 chance to to trigger every hour *or just make it trigger as often as boobswell pads
			// v1: TFs per cycle
			// v2: Timer to trigger TFs
			target.createStatusEffect("Ass Slap Patch", 1, 0, 0, 0, false, "LustUp", "The applied Ass Slap patch is gradually working to fill out your butt cheeks. You can remove it at any point via the “Remove Ass Slap Patch” command in the “Masturbation” menu, but the patch will still be consumed. It’s one use only.", false, 4320,0xB793C4);
		}
		public static function updateEffect(deltaT:uint, maxEffectLength:uint, doOut:Boolean, target:Creature, effect:StorageClass):void
		{
			target.lust(deltaT / 10);
			
			var originalRating:Number = Math.floor(effect.value2);
			effect.value2 += (Math.min(effect.minutesLeft, deltaT) * 0.003);
			var newRating:Number = Math.floor(effect.value2);
			
			if (doOut && (target is PlayerCharacter) && (newRating > originalRating && (newRating % 2 == 0 || newRating < 6)))
			{
				effecTF(deltaT, maxEffectLength, target, effect);
			}
		}
		// Physical Changes
		private static function effecTF(deltaT:uint, maxEffectLength:uint, target:Creature, effect:StorageClass):void
		{
			var msg:String = "";
			var totalTFs:Number = effect.value1;
			var select:int = 0;
			var i:int = 0;
			var TFList:Array = new Array();
			
			// Common - if (pc butt rating is less than max)
			if(target.buttRatingRaw < 20 && target.buttRatingUnlocked(target.buttRatingRaw + 1))
				TFList.push(1);
			// Common - if (pc hip rating is less than max)
			if(target.hipRatingRaw < 20 && target.hipRatingUnlocked(target.hipRatingRaw + 1))
				TFList.push(2);
			// Common - if (pc butt rating > 10 and butt type is not already permanent)
			if(target.buttRatingRaw >= 10 && !target.hasPerk("Buns of Steel") && !target.hasPerk("Bubble Butt"))
				TFList.push(3);
			// Uncommon - if (pc asshole is not tight)
			if(target.ass.loosenessRaw > 1 && rand(3) == 0)
				TFList.push(4);
			// Uncommon - if (pc asshole is not elastic)
			if(target.elasticity < 2 && rand(3) == 0)
				TFList.push(5);
			// Uncommon - if (pc asshole is self lubed and wetness < max)
			if(target.ass.wetnessRaw < 4 && rand(4) == 0)
				TFList.push(6);
			// Rare - if (pc asshole is not self lubed)
			if(!target.ass.hasFlag(GLOBAL.FLAG_LUBRICATED) && rand(8) == 0)
				TFList.push(7);
			// Uncommon - if has soft butt perk
			if(target.hasPerk("Bubble Butt") && rand(2) == 0)
				TFList.push(8);
			
			if(TFList.length <= 0) TFList[TFList.length] = select;
			
			while(TFList.length > 0 && totalTFs > 0)
			{
				i = rand(TFList.length);
				select = TFList[i];
				TFList.splice(i, 1);
				
				switch(select)
				{
					case 1:
						msg += ParseText("Thanks to the Ass Slap Patch you’re wearing, your [pc.ass] is slowly filling out and growing bigger.");
						// butt rating +1
						target.buttRatingRaw += 1;
						break;
					case 2:
						msg += ParseText("Looking down, you notice a sizable change in your [pc.hips]. Must be the Ass Slap Patch.");
						// hip rating +1
						target.hipRatingRaw += 1;
						break;
					case 3:
						msg += "There’s a sudden itchy feeling in your butt. You hear an internalized mechanical hum as the sensation intensifies, causing you to stop and catch your breath. You can feel your ass reshaping, becoming well defined. Unable to stop yourself from reaching back to rub the uncomfortable itch, you feel a hollow form on the side of each of your buttcheeks as you squeeze them together. Once it is over, you use your codex’s blank screen like a mirror to survey the changes. Your ass has now become perfectly sculpted buns of " + (kGAMECLASS.silly ? "steele" : "steel") + ".";
						msg += "\n\n(<b>Perk Gained: Buns of Steel</b> - Ass remains hard and shapely regardless of muscle tone.)";
						// ass gains Buns of Steel Perk
						// Bunz of Steel Perk
						// Causes PC’s ass to be considered hard and shapely even with low muscle tone and/or a low butt score.
						// Can not co-exist with bubble butt
						target.createPerk("Buns of Steel", 0, 0, 0, 0, "Your ass is always firm, regardless of tone.");
						break;
					case 4:
						msg += ParseText("You feel a slight vibrating buzz in your [pc.asshole] as it tightens, possibly a side effect of the Ass Slap Patch you’re wearing.");
						// asshole tightens up a level
						target.ass.loosenessRaw -= 1;
						if(target.ass.loosenessRaw < 1) target.ass.loosenessRaw = 1;
						break;
					case 5:
						msg += ParseText("You feel your [pc.asshole] grow hot, not sure how or why, but it feels great all of a sudden.");
						// asshole elasticity + 0.5
						target.elasticity += 0.5;
						break;
					case 6:
						msg += "You feel the tell-tale coolness and sudden wave of warmth that accompanies your ass growing more wet, a feeling that makes you a little randy if you’re quite honest. That Ass Slap Patch must be doing its thing.";
						// asshole wetness +1 and lust + 10
						target.ass.wetnessRaw += 1;
						target.lust(10);
						break;
					case 7:
						msg += ParseText("You suddenly feel your [pc.asshole] grow a little cold. After a quick internal inspection, and after the temperature returns to normal, you realize you’re a bit wetter than usual down there. Your asshole must be secreting natural lubricant, much like a vagina does - the doing of the Ass Slap Patch, no doubt.");
						// asshole begins to secrete lube
						target.ass.addFlag(GLOBAL.FLAG_LUBRICATED);
						break;
					case 8:
						msg += ParseText("A shiver runs across your [pc.butts] and suddenly they don’t feel as extra bouncy and bubbly as they did before... You suppose this is one of the side effects of the Ass Slap Patch....");
						// remove soft butt perk
						msg += "\n\n(<b>Perk Lost: Bubble Butt</b>)";
						// ass gains Buns of Steel Perk
						target.removePerk("Bubble Butt");
						break;
				}
				
				if (msg != "") AddLogEvent(msg, "passive", deltaT);
				
				totalTFs--;
			}
			return;
		}
	}
}
