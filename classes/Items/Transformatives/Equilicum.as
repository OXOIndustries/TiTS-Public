//[Always DOES]
//Equalize cum production and testicle size on a certain ratio. Said ratio being 1 inch across for each
//2L of maximum ejaculate. With a maximum change of 10 inches/20L of maximum ejaculate per dose. 
//Gaining 3/5 and losing 2/5 of the difference between the 2 values to the lesser and greater value respectively.

//[ALSO MAY DO]
//If the difference reaches 10 inches/20L the player gains a second set of balls. Having multiple balls do
//not affect the equation at all, the microbots work based on the size of one teste to the production ratio.

//[EXAMPLE]
//Let's say maximum ejaculation is 8L, and the balls are 10 inches across.
//8L/2 = 4 inches
//10 inches - 4 inches = |6| inches
//⅗  of |6| inches is 3.6 inches
//3.6 inches*2 = 7.2L
//⅖  of 6 inches is 2.4
//You would gain 7.2L of maximum cum and loose 2.4 inches across.

//[PERKS AFFECTING OUTCOME]
//The Bulgy and Potent perks also affect Equilibricum. Any quantity/size increases are increased by 50% 
//and any quantity/size decreases are reduced by 50%. These bonus values go past the limiter value of 10 inches/20L.

package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.GameData.CodexManager;
	
	public class Equilicum extends ItemSlotClass {
		
		//constructor
		public function Equilicum() {
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.DRUG;
			//Used on inventory buttons
			this.shortName = "Equilicum";
			//Regular name
			this.longName = "Equilibricum";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a needle full of Equilibricum";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A needle full of an almost milky blue fluid. The reservoir seems to hold almost 250 mL it. On the side, there is an illustration of a scale with a jar of cum on one side and a bull's testicles on the other. The back features a warning that using this mod when there a significant difference in ball size and cum volume may result in the growth of extra testicles.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 1700;
			
			this.version = this._latestVersion;
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
		}
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean {
			if (target is PlayerCharacter) {
				
				//can use this item meaningfully
				if (target.balls > 0 || target.hasCock()){
					_useEquilicum(target);
					return true;
				} else {
					clearOutput();
					author("Altair Hayes");
			
					output("After carefully studying the label you decide that it would be advantagous to actually sport some balls before using this item. Or at least some form of prostate.");
					//addButton(0, "Next" ,mainGameMenu);
				} 
				
			//not the player	
			} else {
				kGAMECLASS.output(target.capitalA + target.short + " uses the substance to no effect.");
			}
			return false;
		}
		
		private function _useEquilicum(target:Creature):void {
			clearOutput();
			author("Altair Hayes");
			
			//inject the stuff
			if(target.balls > 0) 
			{
				output("With much anticipation, you carefully inject the small needle straight into ");
				if(target.balls > 0) output("one of ");
				else output("your [pc.balls], knowing the needle is coated in an anesthetic that would prevent any pain. You watch the vial slowly empty, the cyan fluid flowing into your [pc.balls]. You almost chuckle at the thought of having \"blue balls\". Once the needle is empty, you toss the empty vial to the side and casually rub your [pc.sack], waiting for the drug to kick in.");
			}
			else output("You examine the vial of milky blue liquid as you consider how to inject it. Shrugging your shoulders, decide to inject it into your prostate. Going for the safest route, you aim the needle at your perineum. As soon as the needle is all the way in, the blue liquid drains from the vial, and you can feel your prostate swelling with the fluid. Once the vial is empty, you pull it out and toss it to the side. You quickly rub your perineum, trying the soothe the odd sensation in your body as you await the drug's full effects.");
			output("\n\n");
			
			if(target.balls > 0) 
			{
				output("A short while after taking the dose of Equilibricum, your [pc.balls] churn");
				if(target.balls == 1) output("s");
				output(" as the microbots you injected start to take effect. ");
			}
			output("Feeling yourself overwhelmed with lust");
			//in public
			if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.PUBLIC)) output(" you head on over to a secluded spot and");
			else output(" you");
			output(" tear off your [pc.underGarments], trying to go at it. Much to your dismay, you’re totally and utterly numb. You try to masturbate,");
			if(target.hasCock() && target.hasVagina()) output(" fingering [pc.oneCunt] and thrusting into your hand as you try to cum, but your numb genitals can’t feel even the most passionate attempts at self-pleasure. It’s torment. After an hour of thrusting into your hands, you begin to regain feeling in your genitals and go at it.");
			else if(target.hasCock()) output(" bucking and thrusting into your hand as you try to cum, but your numb [pc.cocks] can’t feel even the tightest strokes. It’s torment. After an hour of thrusting into your hands, you begin to regain feeling in your [pc.cocks] and go at it.");
			else if(target.hasVagina()) output(" grating your fingers against your [pc.clits] and diving your fingers into your cunt, but your [pc.vaginas] can’t feel even the most eager finger-plunges. It’s torment. After an hour of grinding on your hands, you begin to regain feeling in your [pc.cunts] and go at it.");
			else output(" fingering your ass as you try to cum, but your numb [pc.asshole] can’t feel even the thickest of cocks. It’s torment. After an hour of thrusting into your hands you begin to regain feeling in your [pc.ass] and go at it.");
			target.lust(75);
			kGAMECLASS.processTime(50+rand(10));
			
			clearMenu();
			addButton(0, "Masturbate", _forceMasturbation, target);
		}
		
		//picks a mastrurbation scene in the order Penises>PantySniff/Goo!>Penis>Tail Cock*>Vagina>Tail Vagina*>Buttfinger
		//*If tail specific masturbation scenes are introduced in the future
		//!If these (=panty/goo) are both present, each has a 50% chance
		private function _forceMasturbation(target:Creature):void {
			//try multi cock fap
			if (target.hasCocks()) kGAMECLASS.multiCockFap();
			
			//check if should do goo or panty fap
			else if (kGAMECLASS.pantyFapCount() > 0 || kGAMECLASS.hasGooArmor()) {
				var doGooFap:Boolean = false;
				//if both panty and goo fap possible select randomly
				if(kGAMECLASS.pantyFapCount() > 0 && kGAMECLASS.hasGooArmor()) {
					var random:int = rand(1);
					if (random == 0) doGooFap = true;
				
				//if only has goo armor also do goo fap
				} else if(kGAMECLASS.pantyFapCount() == 0 && kGAMECLASS.hasGooArmor()) {
					doGooFap = true;
				}
				
				//if only has goo armor or randomly picked goo fap - do goo fap
				if(doGooFap) {
					kGAMECLASS.gooDickFap();
				//if not goo fap, do panty fap	
				} else {
					//get panty options
					var options:Array = new Array();
					if(target.hasKeyItem("Panties - Emmy's - Silky, purple, and cum-stained.")) options.push("Emmy");
					if(target.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) options.push("Kiro");
					if(target.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) options.push("Penny");
					if(target.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink.")) options.push("Saendra");
					if(target.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) options.push("Syri");
					if(target.hasKeyItem("Panties - Embry's - Plain, girly pink panties with little hearts.")) options.push("Embry");
					if(target.hasKeyItem("Panties - Xanthe's - Lacy, black siel-silk panties."))  options.push("Xanthe");
					if(target.hasKeyItem("Panties - Aina's - Extra-large, striped green centaur panties.")) options.push("Aina");
					if(target.hasKeyItem("Panties - Briha's - Nylon, camo-print T-back panties.")) options.push("Briha");
					if(target.hasKeyItem("Panties - Lys's - Sheer black panties.")) options.push("Lys");
					//select random index from the above
					random = rand(options.length);
						
					//select fap function based on character name
					if(options[random] == "Kiro" || options[random] == "Penny" || options[random] == "Saendra" || options[random] == "Syri" || options[random] == "Emmy") {
						kGAMECLASS.futaBabePantyfaps(options[random]);
					} else if (options[random] == "Embry") {
						kGAMECLASS.futaBabePantyfaps(options["[embry.name]"]);
					} else {
						kGAMECLASS.jackOffWithLadyPantiesYouSicko(options[random]);
					}
				} //end goo/panty fap try
				
			//try cock fap
			} else if (target.hasCock()) kGAMECLASS.singleDickFap();
			//try pussy fap
			else if (target.hasVagina()) kGAMECLASS.vaginalFap();
			//try tail cunt fap
			else if (target.hasCuntTail()) kGAMECLASS.tailingusFapReqsCuntTail();
			//if everything else fails, do butt fap
			else kGAMECLASS.wutwutindabuttbuttFap();
			
			clearMenu();
			addButton(0, "Next", _postMasturbation, target);
		}
		
		private function _postMasturbation(target:Creature):void {
			clearOutput();
			kGAMECLASS.showBust("");
			//show name of current room
			kGAMECLASS.showName(kGAMECLASS.rooms[kGAMECLASS.currentLocation].roomName);
			author("Altair Hayes");
			
			var maxCumInLiters: Number = target.maxCum() / 1000;
			var ballDiameter: Number = target.ballDiameter();
			
			var ballDiameterModifier:Number = _calculateBallDiameterModifier(maxCumInLiters, ballDiameter);
			var maxCumModifierInLiters:Number = _calculatemaxCumModifierInLiters(maxCumInLiters, ballDiameter);
			
			
			trace("Balls efficency: " + target.ballEfficiency);
			trace("Max cum start: " + maxCumInLiters);
			trace("Ball size start: " + ballDiameter);
				
			trace("Cum Modifier: " + maxCumModifierInLiters);
			trace("Ball Modifier: " + ballDiameterModifier);
			
			trace("Max cum end: " + (maxCumInLiters + maxCumModifierInLiters));
			trace("Ball size end: " + (ballDiameter + ballDiameterModifier));
			
			//do capping - target can't gain more than 10inches, 20L unless target has bulgy perk
			if (maxCumModifierInLiters > 20) maxCumModifierInLiters = 20.0;
			if (ballDiameterModifier > 10) ballDiameterModifier = 10.0;
			
			//if a value is increased, increase it by an additional 50% when target has bulgy/potent perk
			if (target.hasPerk("Potent") &&  maxCumModifierInLiters > 0) maxCumModifierInLiters *= 1.5;
			if (target.hasPerk("Bulgy") &&  ballDiameterModifier > 0) ballDiameterModifier *= 1.5;
			
			//if a value is reduced, half the loose when target has bulgy/potent perk
			if (target.hasPerk("Potent") &&  maxCumModifierInLiters > 0) maxCumModifierInLiters *= 0.5;
			if (target.hasPerk("Bulgy") &&  ballDiameterModifier > 0) ballDiameterModifier *= 0.5;
			
			//calculate new ball size raw from diameter
			var currentBallDiamter:Number = target.ballDiameter();
			var newBallDiameter:Number = currentBallDiamter + ballDiameterModifier;
			var totalBallSize:Number = newBallDiameter * Math.PI;
			var newBallSizeRaw:Number = totalBallSize - target.ballSizeMod;
			
			//set new ballsize raw
			target.ballSizeRaw = newBallSizeRaw;
			
			//calculate how ball efficency needs to change to match desired cum production
			var currentBallEfficency:Number = target.ballEfficiency;
			var currentCumQuantity:Number = maxCumInLiters * 1000;
			var desiredCumQuantity:Number = currentCumQuantity + maxCumModifierInLiters * 1000 ; //get this back to ml
			
			//calculate base cum quantity without ball efficency factored in
			var baseQuantity:Number = currentCumQuantity / currentBallEfficency;
			var newBallEfficency:Number = desiredCumQuantity / baseQuantity;
			
			//set calculated ball efficency
			target.ballEfficiency = newBallEfficency;
			
			/*trace("Starting Values");
			trace("-----------------");
			trace("ballEfficency: " + currentBallEfficency);
			trace("ballDiameter: " + currentBallDiamter);
			trace("cum quantity in ml: " + currentCumQuantity);

			trace("Modified Values");
			trace("-----------------");
			trace("New ballEfficency: " + target.ballEfficiency);
			trace("New ballDiameter: " + target.ballDiameter());
			trace("Calculated cum quantity in ml: " + target.maxCum());*/
			
			//last but not least, grow 2 more balls if difference between new and old ball diameter
			// reached 10 inches or more, or cum quantity was increased by 20 liters or more
			var ballsGrown:Boolean = false;
			if (ballDiameterModifier > 10 || maxCumModifierInLiters > 20) {
				if (target.balls == 0) ballsGrown = true;
				target.balls += 2;
			}
			
			//for pc with internal ballz
			if (target.balls == 0) {
				output("After your powerful orgasm you look down at your crotch, wondering when the effects of the mod will happen.");
				output(" Your feel your prostate");
				//ball size increased
				if(ballDiameterModifier > 0) output(" grow");
				//ball size decreased, but ball efficancy increased
				else  output(" shrink");
				output(" in your body, an odd feeling to say the least, and if you hadn't known the effects of the mod you would have just taken, you probably would be panicking right now. It isn't uncomfortable; it's just weird feeling an internal organ become");
				if(ballDiameterModifier > 0) output(" bigger");
				else  output(" denser");
				output(". However, once the transformations comes to a close and you feel like you've stopped");
				if(ballDiameterModifier > 0) output(" growing");
				else  output(" shrinking");
				output(", you start to imagine your next sexual encounter, and how it'll feel with your newfound ");
				if(ballDiameterModifier > 0) output(" capability");
				else  output(" efficiency");
				output(". Your grin stretches from ear to ear as your body churns up a load in anticipation.");
			//for pc with external ballz
			} else {
				//if person was internal balled and now gains his first external balls
				if (ballsGrown) {
					output("After your powerful orgasm, you look down at your crotch, wondering when the effects of the mod will happen.");
					output("Thankfully you don't have to wait any longer, you look down and watch in a mixture of perversion and awe. At first a small patch of your skin seems to become shriveled, then for a short while, nothing. You consider the mod to be a dud but quickly realize you are <i>very</i> wrong. <b>Your new nuts rapidly grow into your freshly developed scrotum</b>, stretching it to hold the lovely new orbs.");
					output("They lightly bounce as they come to a rest. You test out how they feel by fondling them as you imagine willing");
					if (target.isTreated()) output(" cows");
					else output(" whores");
					output(" at your feet, worshiping and licking your bulbous, cum-filled orbs. You can barely wait until you're able to put those babies to use, having them slap against the ass of");
					if (target.isTreated()) output(" the nearest cow");
					else output(" your next partner");
					output(".");
					output(" Your grin stretches from ear to ear as your nuts churn with anticipation.");
				//had balls all along
				} else {
					output("After your powerful orgasm, you idly await the new size of your nut");
					if(target.balls > 1) output("s");
					output(". Thankfully within a few minutes, you start to feel the changes happening.");
					//ball size increased
					if (ballDiameterModifier > 0) {
						output(" Your [pc.balls] rapidly swell");
						if(target.balls == 1) output("s");
						output(" in size as your scrotum becomes much more elastic to be able to hold your new size.");
						if(target.balls == 1) output(" They lightly bounce as they come");
						else output(" It lightly bounces as it comes");
						output(" to a rest.");
					//efficency increased
					} else {
						output("Your [pc.balls] churn");
						if(target.balls == 1) output("s");
						output(" with power, shrinking as ");
						if(target.balls == 1) output("it becomes");
						else output("they become");
						output(" more compact and dense. Although you lost a bit of size, you can't help but smile as you realize your [pc.balls] will release a much bigger payload than before.");
					}
					
					output(" You idly fondle ");
					if(target.balls == 1) output("it");
					else output("them");
					output(" as you imagine");
					
					//ball size increased
					if(ballDiameterModifier > 0) {
						output(" willing");
						if (target.isTreated()) output(" cows");
						else output(" whores");
						output(" at your feet, worshipping and licking your ball");
						if(target.balls > 1) output("s");
						output(". You can barely wait until you're slapping your [pc.balls] against the ass of");
						if (target.isTreated()) output(" the nearest cow");
						else output(" your next partner");
					//efficency increased
					} else {
						output(" blowing your load inside the nearest");
						if (target.isTreated()) output(" milker");
						else output(" ass");
					}
					output(". ");
					if(target.balls == 1) output("It churns");
					else output("They churn");
					output(" with anticipation.");
				}
			}
			
			//actually remove item from iventory
			if (!kGAMECLASS.infiniteItems()) target.destroyItem(new Equilicum(), 1);
			//return to game
			addButton(0, "Next", kGAMECLASS.mainGameMenu);
		}
		
		//calculates by what value the ball diameter needs to be modified so ball diameter to max cum quantity
		//relate to each other in a 1 inch to 2L ratio
		private function _calculateBallDiameterModifier(maxCumInLiters:Number, ballDiameter:Number):Number{
			var ballDiameterModifier:Number = 0;
			
			if(maxCumInLiters/2 > ballDiameter) {
				ballDiameterModifier = 0.6 * Math.abs(maxCumInLiters/2 - ballDiameter);
			} else {
				ballDiameterModifier = 0.4 * Math.abs(maxCumInLiters/2 - ballDiameter) * -1;
			}
			
			return ballDiameterModifier;
		}
		
		//calculates by what value the max cum capacity needs to be modified so ball diameter to max cum quantity
		//relate to each other in a 1 inch to 2L ratio
		private function _calculatemaxCumModifierInLiters(maxCumInLiters:Number, ballDiameter:Number):Number {
			var maxCumModifierInLiters:Number = 0;
			
			if(maxCumInLiters/2 > ballDiameter) {
				maxCumModifierInLiters = 0.4 * Math.abs(maxCumInLiters/2 - ballDiameter) * -2;
			} else {
				maxCumModifierInLiters = 0.6 * Math.abs(maxCumInLiters/2 - ballDiameter) * 2;
			}
			
			return maxCumModifierInLiters;
		}
	}
}

