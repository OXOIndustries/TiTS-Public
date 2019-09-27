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
	
	public class BreedersBliss extends ItemSlotClass
	{
		
		//constructor
		public function BreedersBliss()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "B.Bliss";
			//Regular name
			this.longName = "Breeder’s Bliss"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a dose of the drug known as “Breeder’s Bliss”";

			//Displayed on tooltips during mouseovers
			this.tooltip = "Created by TamaniCorp originally as a therapeutic drug for individuals of species that naturally undergo a heat or rut cycle, this drug became one of the company’s most popular items when early testing found that it could induce a similar state even in organisms that do not naturally experience a breeding season. With the tagline: <i>“Make every season breeding season!”</i> Breeder’s Bliss has proven especially popular with individuals in interspecies relationships who wish to give their partner a more “natural” reproductive experience. A fine print warning reads <i>“TamaniCorp is not responsible for increased libido, increased aggression, loss of inhibition, or unexpected pregnancies.”</i>";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 700;
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
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Night Trap");
			if(target is PlayerCharacter) {
				var pc:Creature = target;
				var changes:int = 0;
				var temp:String = "";
				var x:int = -1;
				
				//Consume
				//For herms, 50% chance to proc heat or rut per consumption of Breeder's Bliss
				//If possible, I'd like to make it so that taking a dose of Sterilex will end the effects of this drug early. I'd also like to make it so that you can be Sterilex'd/Infertile and still take this drug and gain the effects without becoming fertile. This way NPCs can be given Breeder's Bliss for the purposes of a scene and neither have to worry about pregnancy, nor being in heat/rut for a week.
				
				var canHeat:Boolean = (pc.hasVagina() && pc.fertility() > 0);
				var canRut:Boolean = (pc.hasCock() && pc.virility() > 0);
				
				//if pc can go into heat and rut, and one condition alreeady exist but the other doesn't, this code will force the other to be applied instaead of it being random
				//if neither or both conditions exists, it stays random
				if (canHeat && canRut)
				{
					if (pc.inHeat() && !pc.inRut()) canHeat = false;
					else if (pc.inRut() && !pc.inHeat()) canRut = false;
				}
				
				if(canHeat && !pc.isFullyWombPregnant() && (canRut == false || rand(2) == 0))
				{
					var totalWombs:int = pc.totalVaginas() - pc.totalWombPregnancies();
					
					//Heat Proc
					if(!pc.inHeat())
					{
						output("You pop the pill into your mouth and swallow it with a bit of water from your canteen. At first nothing happens, but soon you begin to feel <i>hot</i>. Your nethers flush warmly with blood as heat blooms in ");
						if(totalWombs > 1) output("each of ");
						output("your ");
						if(totalWombs > 1) output("unoccupied ");
						output("womb");
						if(totalWombs > 1) output("s");
						output(". Suddenly your posture feels inexplicably wrong, so you shift to a more comfortable stance, unconsciously adjusting your ");
						if(!pc.hasLegs()) output("[pc.lowerBody]");
						else output("[pc.legs]");
						output(" slightly and lifting your [pc.ass]");
						if(pc.tailCount > 0) output(" and [pc.tails]");
						output(" to better present your sex to those around you. Wait, what? That’s not how you’re supposed to stand! The thought is suddenly wiped from your mind as you begin to daydream vividly about ");
						if(pc.isTaur()) output("lying down");
						else output("bending over");
						output(" and letting a train of horny studs creampie your twat");
						if(totalWombs > 1) output("s");
						output(" until your womb");
						if(totalWombs > 1) output("s");
						output(" swell");
						if(totalWombs == 1) output("s");
						output(" with offspring. You’ve got a nursery ready for any future children already! Why aren’t you using it to its fullest capabilities?");

						output("\n\nThe ");
						//PC has pheromones or is ausar/huskar/kaithrit/or half any of these:
						if(pc.hasPheromones()) output("scent of fertile pheromones wafting from");
						else output("heat and moisture blossoming in");
						output(" [pc.eachVagina] clues you in on what’s happening at the same time as your Codex beeping to alert you that <b>you have gone into heat!</b>");

						//Add the "Heat" status, status duration 1 week or until pregnant in all wombs.
						//Yay, heat!
						//v1 - fertility boon
						//v2 - minimum lust boost
						//v3 - libido boost
						//v4 - tease bonus!
						pc.createStatusEffect("Heat",5,25,10,3,false,"LustUp","Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+500% Fertility\n+25 Minimum Lust\n+10 Libido\n+3 Tease Damage",false,28800,0xB793C4);
						pc.libido(1);
					}
					//Deep Heat Proc
					else if(!pc.inDeepHeat())
					{
						output("You pop the pill into your mouth and swallow it with a bit of water from your canteen. At first nothing happens, but soon you begin to feel feverishly <i>hot</i>. Your already breed-hungry womb");
						if(totalWombs > 1) output("s cry");
						else output(" cries");
						output(" out in frustration. Before swallowing this pill you were horny; now you’re positively juicing yourself at the mere thought of a cock to fill your achingly empty puss");
						if(totalWombs == 1) output("y");
						else output("ies");
						output(". You’re desperate to be filled with hot cum, to have your breasts swell with milk to feed the young growing in your equally swollen belly! As your mind glazes over with daydreams of being thoroughly bred by endless hordes of virile mates, your posture becomes even more wantonly slutty, ");
						//no legs: 
						if(!pc.hasLegs()) output("ass thrust outwards");
						else output("legs spread wide");
						//has tail:
						if(pc.tailCount > 0) output(", [pc.tails] waving and held as high as possible");
						output(" to display your flushed, dripping sex to anyone who might be present.");

						output("\n\nThe unmistakable scent of a fertile, needy breeding bitch fills the area. ");
						if(pc.hasPheromones()) output("You realize immediately");
						else output("Even your untrained nose can detect");
						output(" that the smell is coming from ");
						if(kGAMECLASS.silly) output("INSIDE THE HOUSE!!!");
						else output("[pc.eachVagina].");
						output(" Clouds of potent pheromones advertising your ability and readiness to bear children waft up from [pc.eachVagina] like an organic smokestack");
						if(!pc.isCrotchExposed()) output(", even in spite of your [pc.lowerGarment]");
						output(". Anyone that even comes close to you now is going to be able to tell how badly your body wants a baby, and you’re not sure you won’t just stick your [pc.ass] out and beg them for one.");
						output("\n\nIt’s painfully apparent to you now that <b>you are in a deep heat.</b> If you don’t plan on taking an endless string of creampies as deep as possible in your randy [pc.cunts] you should probably avoid other people for a few weeks. Given how fertile you are in your current state just a drop of cum could knock you up.");
						//Add the "Deep Heat" status, duration 2 weeks or until pregnant in all wombs.

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
					//Already in Deep Heat
					else
					{
						output("You pop the pill into your mouth and swallow it with a bit of water from your canteen. It’s hard to discern any changes given how extreme your heat is already, but after several moments you feel your [pc.cunts] growing warmer. You groan as you realize instinctively that ");
						//Add one week to Deep Heat status, maximum duration for Deep Heat should go no higher than 4 weeks
						if(pc.heatMinutes() < 22*24*60) 
						{
							pc.extendHeat(7*24*60);
							output("<b>your heat has been extended.</b>");
						}
						else output("<b>you are as deep into heat as you can possibly go.</b>");
					}
				}
				//Rut Proc
				else if(canRut)
				{
					if(!pc.inRut())
					{
						output("You pop the pill into your mouth and swallow it with a bit of water from your canteen. At first nothing happens, but soon you begin to feel <i>hot</i>. Your [pc.cocks] begin");
						if(pc.cockTotal() == 1) output("s");
						output(" to harden slightly and bead pre-cum. It’s not a full erection; it’s more like you’re just constantly prepared to impregnate any fertile mates you meet. Your idle thoughts are replaced with fantasies of giving every woman you meet as many thick, virile creampies as her pussy can handle, immediately moving on to your next partner, using your slick seed for lube until you fill her to the brim as well. Yeah, you could really go for knocking somebody up right now.");
						output("\n\nThen the idea occurs to you that your potential partners might find mates of their own if you don’t drive any rivals off. No, you won’t stand for that! You will brook no competition from anything with a penis! Before the thought is even out of your head you begin searching for a fertile female. Wait, none of this seems right to you!\n\nThe aching, swelling sensation of increased productivity in your [pc.balls] tips you off at the same time as your Codex that <b>you are now in rut.</b>");
						//Add the "Rut" status, duration 1 week. "Rut" status increases Libido +5, +25 minimum lust, 1000 mL minimum cum production, +4 virility increase, double refractory rate, and cannot flee from combat with enemies that have a penis. 

						pc.createStatusEffect("Rut",5,25,1000,4,false,"LustUp","Your body is driven for aggressive breeding, increasing your libido and virility, as well as boosting your minimum cum output.\n\n+5 Libido\n+25 Minimum Lust\n+1000mLs Minimum Cum\n+400% Virility",false,28800,0xB793C4);
						/*Rut effects
						//v1 - libido increase.
						//v2 - min lust
						//v3 - minimum cum increase.
						//v4 - virility increase*/
					}
					//Already in Rut
					else 
					{
						output("You pop the pill into your mouth and swallow it with a bit of water from your canteen. It’s hard to discern any changes given the intensity of your rut, but after several moments pass your [pc.cocks] harden");
						if(pc.cockTotal() == 1) output("s");
						output(" slightly and begin");
						if(pc.cockTotal() == 1) output("s");
						output(" to leak more pre-cum.");
						if(pc.rutMinutes() < 22*24*60)
						{
							output(" You groan as you realize instinctively that <b>your rut has been extended.</b>");
							//Add one week to Rut status, maximum duration for Rut should go no higher than 4 weeks
							pc.extendRut(7*24*60);
						}
						else
						{
							output(" You groan as you realize that <b>you cannot go any deeper into rut.</b>");
						}
					}
				}			
				//If proc vagina when pregnant in all vaginas
				else if(canHeat && pc.isFullyWombPregnant())
				{
					output("You pop the pill into your mouth and swallow it with a bit of water. After several moments have passed nothing seems to have changed. It seems this drug does nothing for you when you’re already as pregnant as possible.");
				}
				else
				{
					output("You pop the pill into your mouth and swallow it with a bit of water. After several moments have passed nothing seems to have changed. It seems this drug does nothing for you");
					if(!pc.hasGenitals()) output(" when you lack any genitals");
					else output(" due to your " + ((pc.hasVagina() && !pc.isFullyWombPregnant()) ? "infertility" : "non-virility"));
					output(".");
				}
				return false;
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " eats the pill to no effect.");
			}
			return false;
		}
	}
}