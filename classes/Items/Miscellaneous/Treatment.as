﻿//====================================================//
//   TREATMENT PROCS OVER TIME ARE IN:	   			  //
//				/includes/treatment.as 				  //
//====================================================//

package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.GameData.CodexManager;
	import classes.Engine.Utility.rand;
	import classes.Engine.Interfaces.*;
	
	public class Treatment extends ItemSlotClass
	{
		//constructor
		public function Treatment()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.DRUG;
			
			//Used on inventory buttons
			this.shortName = "Treatment";
			
			//Regular name
			this.longName = "medipen loaded with the Treatment";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a medipen loaded with the Treatment";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This little pen contains one of the most sophisticated and highly regulated transformatives in the known universe. It’s called “The Treatment,” and it’s responsible for New Texas being the libertine sexual paradise it is today. They give it out for free, or near free, strangely enough.\n\n<b>Known to cause moderate amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1;
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
			var changes:int = 0;
			var changeLimit:int = 1;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			if(rand(3) == 0) changeLimit++;
			if(rand(3) == 0) changeLimit++;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				kGAMECLASS.clearOutput();
				var pc:Creature = target;
				//Just in case it didn't get unlocked before.
				CodexManager.unlockEntry("The Treatment");
				//Never read codex entry on it.
				if(!CodexManager.entryViewed("The Treatment"))
				{
					kGAMECLASS.output("You roll the strange medipen over in your hand. All it would take is a touch to the activation stud to trigger it. It’d be easy. But you don’t really know that much about it yet. Maybe you ought to look this one up on your codex.");
					if(!kGAMECLASS.infiniteItems()) quantity++;
				}
				//Use - repeat unbimboed/bro'ed
				else if(!pc.isBimbo() && !pc.isBro() && pc.isTreated())
				{
					kGAMECLASS.output("You consider another of the medipens containing the Treatment. You already took your dose. Taking more of it won’t do anything but waste it. Maybe you can find an interested friend to try it out with you? This’ll be fun!");
					if(!kGAMECLASS.infiniteItems()) quantity++;
				}
				//Faux-cow repeat use
				else if(pc.isBimbo() && pc.isFauxCow() && pc.isTreated())
				{
					output("You nervously eye the pen in your palm. The last one you took made you all cute and girly instead of big, strong, and masculine. At least it didn’t take away your dick. The warnings say it won’t do anything if you’ve already taken one, but maybe you can find someone cute to get to take it. Then you’ll have someone to help keep your balls from getting so painfully full!");
					if(!kGAMECLASS.infiniteItems()) quantity++;
				}
				//Bimbo repeat use
				else if(pc.isBimbo() && pc.isTreated())
				{
					kGAMECLASS.output("Your attention briefly flicks over one of the medipens that made everything so awesome. Giggling, you remember how weird but amazingly hot those days after your dose were. It’s too bad that taking it wouldn’t make you any more sensitive or happy. Maybe you can find a friend to give it to?");
					if(!kGAMECLASS.infiniteItems()) quantity++;
				}
				//Bull repeat use
				else if(pc.isBro() && pc.isTreated())
				{
					output("You grunt when you look down at the little medipen. Such a tiny thing changed you so much. A shame you can’t just take another dose and get even more virile. Fuckin’ one hit wonders. Maybe you could get a friend to take it? Male or female, they’re bound to love the results!");
					if(!kGAMECLASS.infiniteItems()) quantity++;
				}
				else
				{
					//First use - Male
					if(pc.hasCock() && !pc.hasVagina())
					{
						output("You roll the medipen in your hand, examining it. It’s amazing that this little thing is supposed to make you so much manlier AND more virile. You suppose ");
						if(pc.horns == 0) output("getting a pair of horns");
						else if(pc.hornType != GLOBAL.TYPE_BOVINE) output("that having your horns transform into bovine ones");
						else output("getting even bigger horns");
						output(" isn’t too bad a price to pay.");
						
						output("\n\nPressing the activation stud is all it will take. You hold the tip against your arm and brace yourself, pushing the button. A quiet-sounding ‘snick’ hits your ears, but nothing else. Did it even work? You look where you had the pen held. There’s a tiny red mark and nothing else. The pen’s label displays the word ‘inactive’ in bold red text. It must have a built in painkiller. You wonder how long it’ll take until your dick gets bigger.");
					}
					//First use - Female
					else if(pc.hasVagina() && !pc.hasCock())
					{
						output("You hold the medipen in your hand like a poisonous viper. This little thing... it’s what makes the girls on New Texas so fun-loving and buxom. And stupid. A quiet voice in the back of your mind makes sure to add that. Then again, they aren’t THAT stupid. They seem vapid, but you haven’t heard of any walking into traffic or forgetting how to eat. They’re just too busy getting laid to care.");
						output("\n\nYou shrug. The way this rush has been going so far, spending a few braincells in order to out-sex your foes is a worthy trade. All you have to deal with are big, milk-filled breasts and a serious craving for a good fuck. No big deal.");
						output("\n\nHolding the white cylinder against your forearm, you depress the activation stud. There’s a tiny pinch followed by the pen flashing red. The word ‘inactive’ appears in bold print. It didn’t even really hurt!");
						output("\n\nYou throw the spent casing away. You might as well go hunt for some of Dad’s pods while your tits swell up like houses. Will you even notice the changes happening?");
					}
					//First use - Intersex
					else
					{
						output("You examine the medipen in your hand. These things are meant for boys and girls. Not ");
						if(pc.hasCock() && pc.hasVagina()) output("herms");
						else output("people with nothing between their legs");
						output(". ");
						if(!pc.hasCock() && !pc.hasVagina()) output("It might wind up making you a big-breasted buttslut or a burly bull trapped in a rut he can never sate.");
						else output("It might make you a docile, cum-craving cow or a muscly breeder. Hell, it might even make you an airhead that can’t think of anything but drinking cum.");
						output(" About the only thing it guarantees is that you’ll get better at being sexy, whatever that means.");

						output("\n\nWell, whatever. You decided to do this. No point in turning back now. You jab the medipen against the [pc.skinFurScales] of your arm and push the activation stud. A soft ‘snick’ is all you notice, not even a little pain. Not bad at all. You toss the empty pen away, noting that it’s now covered in red text. Rubbing the small red spot it left behind, you wonder how long until you’ll notice any changes. Hopefully they all wind up being good!");
					}
					/*
					//"Treated" - Main, permanent status effect
					VARIABLE DEPENDING ON GENDER
					0 - Girl Mode:
						v1 - boob size result
						v2 - horn size result
						v3 - lip size result
						v4 - ball size result
					1 - Male Mode:
						v1 - boob size result
						v2 - horn size result
						v3 - cock mod
						v4 - ball size result
					4 - Amazon Mode:
						v1 - boob size result
						v2 - horn size result
						v3 - max cock size
						v4 - futacock size (if any)

					Have a second status to store more shit.
					//"The Treatment"
					v1 - Gender settings.
					* 0 - girl mode
					* 1 - dude mode
					* 2 - "cum-cow" - female bimbo mods + autofellatio sluuuut
					3 - herm/neuter doublemode - all male and female procs.
					* 4 - herm/neuter amazon - male perks + boob/lactation boosts.
					5 - herm girlmode + double dick/cum boosts.
					6 - herm girlmode + dick shrinking to almost nothing.
					v2 special variants
					v3 hour counter

					//Special variants - girls with bigger horns (size 5)!
					*/

					pc.createStatusEffect("Treated",0,0,0,0,true,"","",false,0);
					pc.createStatusEffect("The Treatment",0,0,0,0,false,"Icon_Cow","You are currently under the effects of the Treatment. Who knows what havoc it will wreak upon your system.",false,10080,0xB793C4);
					if(kGAMECLASS.flags["TREATMENT_HAX"] != undefined) setTreatmentMode(pc,kGAMECLASS.flags["TREATMENT_HAX"]);
					else
					{
						//Set values for chicks:
						if(pc.hasVagina() && !pc.hasCock())
						{
							//20% cumcow
							if(rand(5) == 0) setTreatmentMode(pc,2);
							//75% odds of Amazon if super butch
							else if((pc.tone >= 70 || pc.femininity < 60) && rand(4) <= 2) setTreatmentMode(pc,4);
							//10% random Amazon chance
							else if(rand(10) == 0) setTreatmentMode(pc,4);
							//Normies!
							else setTreatmentMode(pc,0);
						}
						//Set values for dudes
						else if(pc.hasCock() && !pc.hasVagina())
						{
							//20% cumcow for shemales/traps
							if((pc.hasBreasts() || pc.femininity >= 60) && rand(5) == 0) setTreatmentMode(pc,2);
							//Normies!
							else setTreatmentMode(pc,1);
						}
						//Herms/neuters
						else
						{
							//50% cumcow
							if(rand(2) == 0) setTreatmentMode(pc,2);
							//75% odds of Amazon if super butch
							else if((pc.tone >= 70 || pc.femininity < 60) && rand(4) <= 2) setTreatmentMode(pc,4);
							//50% odds otherwise
							else if(rand(2) == 0) setTreatmentMode(pc,4);
							//Otherwise, 50/50 split between male and female.
							else if(rand(2) == 0) setTreatmentMode(pc,0);
							else setTreatmentMode(pc,1);
						}
					}
				}
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " uses the treatment, but nothing happens.");
			}
			return false;
		}

		private function hasSheathedNonHorsecocks(target:Creature):Boolean
		{
			if(target.cockTotal() == 0) return false;
			for (var x:int = 0; x < target.cockTotal(); x++)
			{
				if(target.hasSheath(x) && target.cocks[x].cType != GLOBAL.TYPE_EQUINE) return true;
			}
			return false;
		}
		private function hasAHorseCuntNeedingRoom(target:Creature):Boolean
		{
			if(target.vaginaTotal() == 0) return false;
			for (var x:int = 0; x < target.vaginaTotal(); x++)
			{
				if(target.vaginas[x].type == GLOBAL.TYPE_EQUINE && target.vaginas[x].bonusCapacity < 15) return true;
			}
			return false;
		}
		private function setTreatmentMode(pc:Creature,arg:int = 0):void
		{
			trace("TREATMENT MODE SET: " + arg);
			//Cumcow

			//slamazon
			if(arg == 4)
			{
				//Set mode to amazon mode
				pc.setStatusValue("The Treatment",1,4);

				//v1 = boobs 14 to 23 (Max HHH-Cup)
				if(pc.short == "Sinarra") pc.setStatusValue("Treated",1,23);
				else pc.setStatusValue("Treated",1,14 + rand(10));
				//v2 = horn size
				pc.setStatusValue("Treated",2,5 + rand(4));
				//v3 cock bonus - if 0, don't grow a cock. 33% odds at time of this coding!
				if(!pc.hasCock())
				{
					if(rand(3) == 0) pc.setStatusValue("Treated",3,2 + rand(5));
					else pc.setStatusValue("Treated",3,0);
				}
				else pc.setStatusValue("Treated",3,2 + rand(5));
				//v4 = is whether or not the amazon is milky - 50/50 odds.
				pc.setStatusValue("Treated",4,rand(2));
				//Set "Treated Amazon" to remember that the PC got a special proccy!
				pc.createStatusEffect("Treated Amazon");
			}
			//chicks
			else if(arg == 0)
			{
				//v1 = boobs 9 to 31
				//v2 = horn size
				//v3 lip bonus
				//v4 = unused

				//Sin gets max boobs
				if(pc.short == "Sinarra") pc.setStatusValue("Treated",1,31);
				//Boobs from EE to JJ
				else pc.setStatusValue("Treated",1,9 + rand(23));
				//Horn size result - 1 to 3"
				pc.setStatusValue("Treated",2,1 + rand(3));
				//Lip Bonus 0-2
				pc.setStatusValue("Treated",3,0 + rand(3));
				//No balls.
				pc.setStatusValue("Treated",4,0);
				//Set mode to lady mode
				pc.setStatusValue("The Treatment",1,0);
				//Set rare proc to 0.
				pc.setStatusValue("The Treatment",2,0);
			}
			//hermy autofellatio moos
			else if(arg == 2)
			{
				//v1 = boobs 9 to 31
				//v2 = horn size
				//v3 lip bonus
				//v4 = unused

				//Sin gets max boobs
				if(pc.short == "Sinarra") pc.setStatusValue("Treated",1,31);
				//Boobs from HHH to JJ
				else pc.setStatusValue("Treated",1,23 + rand(9));
				//Horn size result - 1 to 3"
				pc.setStatusValue("Treated",2,1 + rand(3));
				//Lip Bonus 0-2
				pc.setStatusValue("Treated",3,0 + rand(3));
				//No balls.
				pc.setStatusValue("Treated",4,0);
				//Set mode to lady mode
				pc.setStatusValue("The Treatment",1,2);
				//Set rare proc to 0.
				pc.setStatusValue("The Treatment",2,0);

				pc.createStatusEffect("Cum-Cow");
			}
			else if(arg == 1)
			{
				//Set mode to man mode
				pc.setStatusValue("The Treatment",1,1);
				//Horn size result - 5 to 8"
				pc.setStatusValue("Treated",2,5 + rand(4));
				//9.4-12.5 ballRating (3-4").
				pc.setStatusValue("Treated",4,9.4+(rand(32)/10));
				//Cock Bonus 2-8
				pc.setStatusValue("Treated",3,2 + rand(7));
				if(pc.biggestCockLength() < 7) pc.setStatusValue("Treated",3,6);
				if(pc.hasPerk("Hung")) pc.setStatusValue("Treated",3,8);
			}
		}
	}
}

