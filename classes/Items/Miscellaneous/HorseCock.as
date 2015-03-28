package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.GameData.CodexManager;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	import classes.Engine.Utility.num2Text;
	
	public class HorseCock extends ItemSlotClass
	{
		//constructor
		public function HorseCock()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			//Used on inventory buttons
			this.shortName = "Horse-Cock";
			
			//Regular name
			this.longName = "equine phallus complete with balls";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an equine phallus complete with balls";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This oddly-detached penis has been crafted to look like a perfect representation of equine virility. It's dotted with veins that look real enough to pump blood, to say nothing of the swaying balls that dangle from its base. The back end is flat; perhaps it's meant to slot into a harness as a strap-on. Then again, there is a slit hidden on that smooth edge. Is it some kind of perverted masturbation sleeve?";
			
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
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var pc:Creature = target;
			kGAMECLASS.clearOutput();
			kGAMECLASS.author("Alkahest");
			//Trying it on yourself
			if(target is PlayerCharacter) {
				kGAMECLASS.flags["SYNTHSHEATH_USED"] = 1;
				//<You no cock>
				if(!pc.hasCock())
				{
					kGAMECLASS.output("You turn the sheath over in your hands, jiggling it around and chuckling as the large balls bounce around your hand. You absentmindedly stick the sheath to your naked groin, swinging your [pc.hips] around you briefly relinquish your grip on the toy only to find it remaining stuck to your crotch. You try to pull it away from your groin but are unable to do so. It must have some sort of suction device or something, you think.. You waggle your [pc.hips], and the fleshy tube sticking to your crotch sways back and forth, the apple-sized balls slapping into your thighs.");
					kGAMECLASS.output("\n\nYou chuckle at the sight of yourself with the equine sheath attached to your formerly bare crotch and lose yourself momentarily in a day-dream of railing some busty alien with a massive horse-cock. A sharp pain in your stomach causes you to double over, and you nearly scream in pain as you accidentally squish one of the fake testicles between your legs. A white hot lance of agony shoots up from your groin, and you freeze in shock. You look down at your crotch in confusion as a warm tingling begins emanating from your genitals replacing the previous pain with pure pleasure.");
					kGAMECLASS.output("\n\nYou moan at the alien sensations assaulting the pleasure centers of your brain, and idly note in your mild stupor that you can feel new and different parts of your anatomy that weren’t there before. Tentatively, you reach down with a trembling hand to touch the balls dangling heavily from your groin. You nearly pass out as you heft your new balls; you feel them rolling around in your hand and simultaneously enjoy the sensation of a warm palm cupping your sensitive spheres. You grit your teeth from involuntary, mounting arousal, large veins rising on the surface of the sheath from blood feeding into the dark depths of your fleshy tube. You gasp in amazement as a massive horsecock snakes from the entrance of your sheath.");
					kGAMECLASS.output("\n\nInch after inch of horse meat pours from your crotch in what seems a never-ending march up your chest: six inches, eight inches, 12 inches.... Finally it tops out at a mind boggling 16 inches, hovering temptingly in front of your nose. A potent, musky scent pours from the tip of your new cock, and a slick, sweet and salty smelling fluid dribbles from your urethra before your big balls tense up to blow a load of creamy white equine seed across your face. You gasp in surprise before another huge load of cum fills your agape mouth. You continue painting yourself for another minute or so before, spent, your cock slithers back into its sheath to hang innocuously along your thigh.");
					//Codex not unlocked!
					if(!CodexManager.entryUnlocked("SynthSheath"))
					{
						kGAMECLASS.output("\n\nYour Codex beeps with a warning about how this device may irreversibly alter one’s biology. You grimace ruefully at the device before regarding your enhanced genitalia. You smile and think that you definitely can get used to this.");
						//unlock codex!
						CodexManager.unlockEntry("SynthSheath");
					}
					pc.createCock();
					pc.shiftCock(0, GLOBAL.TYPE_EQUINE);
					pc.cocks[0].cLengthRaw = 16;
					pc.boostCum(50);
					pc.refractoryRate++;
					if(pc.refractoryRate < 5) pc.refractoryRate++;
					if(pc.refractoryRate < 10) pc.refractoryRate++;
					pc.balls = 2;
					pc.ballSizeRaw = 11;
					kGAMECLASS.processTime(5);
					pc.orgasm();
					pc.libido(2);
					return false;
				}
 				//Hazcawk
 				else 
 				{
 					//If only 1 non horsecock
 					if(eligableHorseTFDicks(pc) == 0)
 					{
 						kGAMECLASS.output("You don't have any suitable place to stick this - you're already packing some fine horsemeat.");
 						if(!kGAMECLASS.infiniteItems()) quantity++;
 					}
 					else if(eligableHorseTFDicks(pc) == 1) HorseCockHorseCockConversion(eligableHorseDick(pc));
 					else
 					{
 						kGAMECLASS.output("Screw it. Which dick do you want to slide into it?");
 						kGAMECLASS.clearMenu();
 						for(var x:int = 0;x < pc.cockTotal();x++)
 						{
 							if(pc.cocks[x].cType != GLOBAL.TYPE_EQUINE) kGAMECLASS.addButton(x,uppercase(pc.numTwoText(x+1)),HorseCockHorseCockConversion,x);
 							else kGAMECLASS.addDisabledButton(x,uppercase(pc.numTwoText(x+1)),uppercase(pc.numTwoText(x+1)),"It'd look silly to put a horse-cock on a horse-cock.");
 						}
 						return true;
 					}
 				}				
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " fiddles with the sheath to no effect, and worse yet, it tears. This ruins the sheath.");
			}
			return false;
		}
		// 9999 -- this doesn't work nagas and possibly taurs.
		public function HorseCockHorseCockConversion(target:int = 0):void
		{
			kGAMECLASS.clearOutput();
			kGAMECLASS.author("Alkahest");
			var pc:Creature = kGAMECLASS.pc;
			if(target < 0)
			{
				kGAMECLASS.output("OI, A FUKKIN' ERROR HAPPENED. SOMEHOW THE GAME IS TRYING TO TRANSFORM A DICK THAT DOESN'T EXIST. PLEASE BUG REPORT THIS THROUGH THE BUG REPORTS LINKS ON FENOXO.COM IN THE SIDEBAR.");
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
				return;
			}
			//<You GigantoDong>
			if(pc.cocks[target].cLength() > 18)
			{
				kGAMECLASS.output("Your [pc.cock " + target + "] lies draped over your thigh as you look at the far smaller sheath in your hand. There’s no way in heaven this could fit on your massive dong, but you ruefully lose yourself in a daydream of having a horse-cock this large. The ones you saw on ultraporn stars on the extranet always looked so... bestial and masculine. It’s hard not to appreciate the qualities.\n\nAbsentmindedly, you tug on the opening of the tube and find it stretches far farther than you would have first thought. You don’t know why, but you can't seem to stop yourself from taking the head of your [pc.cock " + target + "] and gently stuff it in the stretchy end of the sheath. The rubbery tube distends massively as your enormous cock invades its depths, stretching wide and long to hang heavily from your crotch.");
				if(pc.hasKnot(target)) kGAMECLASS.output(" Your thick knot stretches the poor abused toy even further, a visible lump remains in the depths of the sheath.");
				//{if Balls}
				if(pc.balls > 0)
				{
					kGAMECLASS.output("\n\n");
					//{if Small -> Average}
					if(pc.ballDiameter() <= 2)
					{
						kGAMECLASS.output("You pull the skin of the sheath’s balls up and around your own modest ");
						if(pc.balls == 1) kGAMECLASS.output("nut");
						else if(pc.balls == 2) kGAMECLASS.output("pair");
						else kGAMECLASS.output("group, groaning in discomfort as you try to fit so many into a space built for two");
						kGAMECLASS.output("; now it looks as though your balls have been replaced with a massive set of apple-sized nuts.");
						pc.ballSizeRaw = 11;
					}
					//{If Large -> Goddamn}
					else
					{
						kGAMECLASS.output("You look at your [pc.balls] and at the rubbery sack dangling from the sheath. You sigh and think to yourself that if it’s worth doing, it’s worth doing right. Reaching down, you tug at the rubbery skin to stretch it wide around your ");
						if(pc.balls == 1) kGAMECLASS.output("nut");
						else kGAMECLASS.output("nuts");
						kGAMECLASS.output(". You yank and pull, then pull some more, and finally your [pc.balls] roll into the rubbery skin of the sheath to hang heavily from your groin.");
						if(pc.balls > 2) kGAMECLASS.output(" You aren't sure how you fit so many in space built for two.");
					}
				}
				pc.balls = 2;
				kGAMECLASS.output("\n\nYou gasp at the tight feeling around your cock as you look at yourself in the mirror. The sheath has to be at least a foot long and a little wider than your cock. You admire the way your newly bestial genitals sway back and forth heavily and run your hands all over your groin. Suddenly, sharp pains along your cock pierce your reverie, and you look down at your sheath in mild shock. You can feel the skin of the sheath as though it were your own! You reach down and try to tug the fleshy toy from your crotch and find it firmly attached to your skin; you wince at the unusual sensation as if you’re pulling your cock out by the root.");
				kGAMECLASS.output("\n\nYour body grows warmer and warmer until huge, throbbing veins rise on the surface of your sheath. You squeeze and massage your big balls instinctively. Your breath catches in your chest as your newly blunted prick emerges from its leathery cocoon in the form of an enormous, black and pink-mottled horse-cock. Inch after inch of snakes out with every beat of your pounding heart, the girthy length bouncing along to the increasingly frantic biological rhythm.");
				if(pc.hasKnot(target)) kGAMECLASS.output("\n\nYou groan as your fat knot stretches the sensitive opening of your sheath open wide, popping free and continuing up your chest with the rest of your shaft.");
				else kGAMECLASS.output("\n\n");
				kGAMECLASS.output("\n\nFinally, your horsey tool is fully erect at a showstopping " + num2Text(Math.round(pc.cocks[target].cLength() + 4)) + "-inches. You run your hands up and down its massive length and hug it to your body, smelling the heady scent of your own animalistic musk. It clings to <b>your new horse-cock</b> like an arousing, pheromone-dense cloud.");
				kGAMECLASS.output("\n\nYou feel your balls tense up a moment before your new cock blasts a fountain of sticky semen straight up, only to rain down upon your head. You tilt your head back and open your mouth; sticking out your tongue you catch mouthful after mouthful of potent cum and greedily gulp it down.");
				kGAMECLASS.output("\n\nYour orgasm finally ends after what feels like an eternity. You stumble to your [pc.feet], a sticky wet mess, and watch in dazed amusement as your softening horse-cock slithers back up into its sheath to hang heavily along your thigh. You decide that you need to get a shower, covered in cum as you are");
				if(!CodexManager.entryUnlocked("SynthSheath"))
				{
					kGAMECLASS.output(", and as you’re walking to the bathroom, your Codex beeps with a warning about how this device may irreversibly alter ones biology. You grimace ruefully at the device");
					//unlock codex!
					CodexManager.unlockEntry("SynthSheath");
				}
				kGAMECLASS.output(".");
				pc.shiftCock(target, GLOBAL.TYPE_EQUINE);
				pc.cocks[target].cLengthRaw += 4;
				pc.cocks[target].cockColor = "mottled pink and black";
			}
			//{ifRegularCock/LargeCockles}
			else
			{
				kGAMECLASS.output("You examine the fleshy sheath in your hand before looking at your [pc.cock " + target + "]. A momentary daydream passes through your mind of you with a massive horse-cock, surrounded by a number of buxom aliens all interested in taking your equine seed for their own. You look in the end of the tube and slide your [pc.cock " + target + "] into the tight, rubbery orifice.");
				if(pc.hasKnot(target)) kGAMECLASS.output(" Your thick knot stretches the toy even further, a visible lump remains in the depths of the sheath.");
				//{if Balls}
				if(pc.balls > 0)
				{
					kGAMECLASS.output("\n\n");
					//{if Small -> Average}
					if(pc.ballDiameter() <= 2)
					{
						kGAMECLASS.output("You pull the skin of the sheath’s balls up and around your own modest ");
						if(pc.balls == 1) kGAMECLASS.output("nut");
						else if(pc.balls == 2) kGAMECLASS.output("pair");
						else kGAMECLASS.output("group, groaning in discomfort as you try to fit so many into a space built for two");
						kGAMECLASS.output("; now it looks as though your balls have been replaced with a massive set of apple-sized nuts.");
						pc.ballSizeRaw = 11;
					}
					//{If Large -> Goddamn}
					else
					{
						kGAMECLASS.output("You look at your [pc.balls] and at the rubbery sack dangling from the sheath. You sigh and think to yourself that if it’s worth doing, it’s worth doing right. Reaching down, you tug at the rubbery skin to stretch it wide around your ");
						if(pc.balls == 1) kGAMECLASS.output("nut");
						else kGAMECLASS.output("nuts");
						kGAMECLASS.output(". You yank and pull, then pull some more, and finally your [pc.balls] roll into the rubbery skin of the sheath to hang heavily from your groin.");
						if(pc.balls > 2) kGAMECLASS.output(" You aren't sure how you fit so many in space built for two.");
					}
				}
				pc.balls = 2;
				kGAMECLASS.output("\n\nYou chuckle as you walk around the room, swishing your hips and savoring the feeling of the sheath and heavy balls tugging gently at your groin as they swing pendulously. A sharp pain coming from your cock breaks you out of your reverie. You try to tug the sheath off of your shaft and wince in pain as it feels like you’re trying to pull your cock out by the roots. You groan at a buzzing sensation in your crotch. It’s just like when your arm is waking up after having laid on it wrong.");
				kGAMECLASS.output("\n\nSlumping to the floor, you look at your groin in amazement as large, thick veins rise on the surface of your sheath, blood visibly pumping into your crotch. Your breath catches in your chest as the thick head of a huge horse-cock emerges from the opening of the sheath.");
				if(pc.hasKnot(target)) kGAMECLASS.output(" You groan as your fat knot stretches the sensitive opening of your sheath open wide, popping free and continuing up your chest with the rest of your shaft.");
				kGAMECLASS.output(" Inch after inch of mottled flesh pours from your groin, ");
				if(pc.cocks[target].cLength() < 13) 
				{
					kGAMECLASS.output("far exceeding your original length to finally stand at a proud 16 inches.");
					pc.cocks[target].cLengthRaw = 16;
				}
				else 
				{
					kGAMECLASS.output("eclipsing your original length to finally stand at a proud " + num2Text(Math.round(pc.cocks[target].cLength() + 4)) + " inches.");
					pc.cocks[target].cLengthRaw += 4;
				}
				kGAMECLASS.output(" The stiff flesh bobs in front of your face.");

				kGAMECLASS.output("\n\nA potent, musky scent pours from the tip of your new cock. A slick, sweet and salty smelling fluid is dribbling from your urethra, and your big balls are tensing up. A load of creamy white equine seed blasts you across the face, and you gasp in surprise before another huge load of cum fills your agape mouth. You continue painting yourself for another minute or so before, spent, your cock slithers back into its sheath to hang innocuously along your thigh.");
				if(!CodexManager.entryUnlocked("SynthSheath"))
				{
					kGAMECLASS.output("\n\nYour Codex beeps with a warning about how this device may irreversibly alter one’s biology. You grimace ruefully at the device before regarding your enhanced genitalia. You smile and think that you definitely can get used to this.");
					//unlock codex!
					CodexManager.unlockEntry("SynthSheath");
				}
				pc.shiftCock(target, GLOBAL.TYPE_EQUINE);
				pc.cocks[target].cockColor = "mottled pink and black";
			}
			pc.boostCum(50);
			pc.refractoryRate++;
			if(pc.refractoryRate < 5) pc.refractoryRate++;
			if(pc.refractoryRate < 10) pc.refractoryRate++;
			kGAMECLASS.processTime(5);
			pc.orgasm();
			pc.libido(2);
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
		private function eligableHorseTFDicks(pc:Creature):Number
		{
			var eligableDicks:int = 0;
			for(var x:int = 0; x < pc.cockTotal(); x++)
			{
				if(pc.cocks[x].cType != GLOBAL.TYPE_EQUINE) eligableDicks++;
			}
			return eligableDicks;
		}
		private function eligableHorseDick(pc:Creature):Number
		{
			for(var x:int = 0; x < pc.cockTotal(); x++)
			{
				if(pc.cocks[x].cType != GLOBAL.TYPE_EQUINE) return x;
			}
			return -1;
		}
		private function uppercase(str:String):String {
			var firstChar:String = str.substr(0,1);
			var restOfString:String = str.substr(1,str.length);
			return firstChar.toUpperCase()+restOfString.toLowerCase();
		}
	}
}
