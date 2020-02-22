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
	import classes.Util.InCollection;
	
	public class NukiNutbutter extends ItemSlotClass
	{
		public function NukiNutbutter()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "N.Butter";
			longName = "‘Nuki Nutbutter";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a bottle of ‘Nuki Nutbutter";
			tooltip = "Tanuki Seed Cream, affectionately better known as ‘Nuki Nutbutter by gene-mod aficionados, is a popular treatment for affluent playboys. On application to the gonads, it mimics the famous testicular swelling of the kui-tan race, meaning that the longer the user goes without orgasm, the larger his testicles will grow. A warning label cautions against going <i>too</i> long, at risk of immobilization.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 5000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			kGAMECLASS.showName("‘NUKI\nNUTBUTTER");
			author("Savin");
			
			// Get Where: Lerriss Tamani shop.
			// How Much: 5,000C
			// What Do: Gives the PC Nuki Nuts. Dramatically increases cum production/amount.
			
			if(target is PlayerCharacter)
			{
				// On Use (PC has no balls)
				if(target.balls <= 0)
				{
					output("You take out the light brown bottle of seed cream and look it over. The instructions printed on the side are quite clear: apply directly to the testicles... an organ you lack at the moment.");
					
					// PC has no dick. Append to previous paragraph:
					if(!target.hasCock())
					{
						output(" You don’t even have a dick! You doubt this stuff’s going to do you much good right now, and so you return the bottle to your pack.");
						
						if(!kGAMECLASS.infiniteItems()) quantity++;
						return false;
					}
					// PC has a dick:
					else
					{
						output("\n\nWhat you do have, however, is a prostate. That’s basically the same thing, right? You squirt out the thick cream onto your fingers");
						if(!target.isAssExposed()) output(", pull off your undergarments,");
						output(" and bend over to spread your cheeks. The paste is cool to the touch, making your breath catch as your digits spread a little of it around your [pc.asshole] like lube. At least getting the stuff inside will be easy. You ");
						//tight/virginal:
						if(target.analVirgin || target.ass.looseness() <= 1) output(" press one finger into your tight behind, wiggling it around until the sheen of lubricants allow you to slowly plunge in. You gasp, biting your lip, and sink yourself down to the second knuckle. The pleasure and discomfort mix together to leave you panting, but you force yourself to work in a second finger shortly after the first");
						//kinda loose:
						else if(target.ass.looseness() <= 2) output(" put a little pressure on your clenching hole, wiggling one finger in, then another");
						//moderate gape:
						else if(target.ass.looseness() <= 4) output(" expertly work your fingers into your dark ring");
						//ultragape:
						else output(" easily sink your hand inside");
						output(", smearing the cream around inside your anal passage.");
						
						output("\n\nEventually, you find what you’re looking for: a slight rise in your asshole");
						if(target.race().indexOf("gryvain") != -1) output(", pressed between the full sacks of your internal nads");
						output(": your prostate. You start massaging the sensitive lump, sending shudders of pleasure through you");
						if(target.hasCock()) output(" -- your [pc.cock] jumps, starting to drool [pc.cum] between your [pc.legs]");
						output(". Slowly but surely, you coat the ass-flesh around your [pc.balls] with the tanuki-flavored paste, letting the nanomachines seep into your body directly.");
						
						output("\n\nBy the time you’re finished, your [pc.asshole] is clenching on its own, muscles spasming rhythmically around your fingers. Your insides feel oddly full all of a sudden, like you’ve just had a full meal...");
						if(target.hasCock()) output(" that’s settled entirely behind your [pc.cock], pressing urgently against the base of your tumescent prick.");
						output(" A moan escapes your lips...");
						if(target.hasCock()) output(" and a thick, creamy rope of [pc.cum] escapes from your [pc.cockHead]. You feel like");
						else output(" and you imagine blasting a thick, creamy rope of [pc.cum]. If only you had a cock, you can give it");
						output(" one good stroke, and you could bust a nut that would make a flood look like a drizzle.");
						
						// Increased CumVol:
						if(target.cumMultiplierRaw < 9000 || target.cumMultiplierRaw / 8 >= target.ballEfficiency)
						{
							output("\n\nThe way your [pc.balls] feels now, there’s no doubt about it... <b>you can");
							if(target.hasCock()) output(" cum more per orgasm, and");
							output(" store more seed inside you");
							if(target.hasCock()) output(" between orgasms");
							output("</b>.");
							
							if(target.cumMultiplierRaw < 9000)
							{
								if(target.cumMultiplierRaw < 1000) target.cumMultiplierRaw += 100;
								else if(target.cumMultiplierRaw < 3000) target.cumMultiplierRaw += 50;
								else target.cumMultiplierRaw += 30;
								if(target.cumMultiplierRaw > 9000) target.cumMultiplierRaw = 9000;
							}
							if(target.cumMultiplierRaw / 8 >= target.ballEfficiency) target.ballEfficiency += (2 + rand(7)) * 10;
						}
						// Else, refill cum: 
						else
						{
							output("\n\nYour [pc.balls] feels thick and heavy, swollen with cum.");
							if(target.hasCock()) output(" Oh, yeah... you ought to rub one out to celebrate. And relieve a little of this pressure building up!");
							else output(" Uh, you should definitely get a penis so you can rub one out to celebrate and to relieve yourself of all the pressure building up!");
						}
						
						target.ballFullness += 100;
						target.changeLust(50);
					}
				}
				// On Use, PC has balls, no Nuki Nuts:
				else if(!target.hasPerk("'Nuki Nuts"))
				{
					output("You take the light brown bottle of cream from your pack and turn it over in your hands, chuckling at the picture on the front of a furry raccoon-man in a robe that’s tenting under his legs, subtly suggesting a truly massive set of gonads hiding just out of sight. One application, it promises, and that could be you.");
					
					output("\n\nYou grin");
					if(!target.isAssExposed()) output(", slip down your [pc.lowerGarment],");
					output(" and squirt the contents of the bottle into your hand.");
					if(target.hasCock()) output(" Your [pc.cocks] throb" + (target.cocks.length == 1 ? "s" : "") + " in anticipation, but you lift " + (target.cocks.length == 1 ? "it" : "them") + " out of the way and cup your [pc.balls] instead.");
					output(" The sudden sensation of cold cream smearing across your sack sends a shiver up your spine, but makes you hard nonetheless. You give yourself a squeeze, massaging the thick brown paste over every inch of your " + (target.balls == 1 ? "nutsack" : "gonads") + ". A tingling sensation spreads, mixing with pleasure and the building anticipation: your heart is all aflutter thinking about letting your [pc.balls] swell up, growing so heavy and full that you can’t possibly hide " + (target.balls == 1 ? "it" : "them") + " -- everyone who comes near you will be able to see how absolutely, explosively pent up you are, ready to unleash the flood at a touch");
					if(!target.hasCock()) output("--that is, if you could.");
					output("...");
					
					target.ballFullness += 100;
					target.changeLust(50);
					
					output("\n\nFor the moment, though, your " + (target.balls == 1 ? "testicle just feels" : "balls just feel") + " weighty.");
					if(target.hasCock()) output(" Your [pc.cock] throbs urgently, beading with pre-cum until you take it in hand and give it a stroke.");
					else output(" You gently rub along the surface of your [pc.ballsack], its internal mass urgently pulses, desperately begging for release.");
					output(" Just that little motion almost makes you lurch -- what feels like a gallon of spooge churns just below the surface of your " + (target.balls == 1 ? "ballsack" : "balls") + ", fighting to escape. You clench, resisting the urge: if you just let yourself cum whenever you want, how will you get the swelling you so desperately crave?");
					
					output("\n\nAlready, your sack feels taut. Bigger than before. Fuller. <b>You now have the fabled Nuki Nuts, no doubt!</b>");
					
					// Perk: 'Nuki Nuts
					// v1: mLs of excess seed
					// v2: 0 is natural (race-specific), 1 is not natural (permanent)
					target.createPerk("'Nuki Nuts", 0, 1, 0, 0, "Permanent ability allowing your gonads to swell with excess seed.");
					
					output("\n\nYou keep squeezing and kneading your sack well after the nanomachine paste has run its course, just enjoying the sensation of it. Your [pc.balls] feel" + (target.balls == 1 ? "s" : "") + " so much more malleable, like working your fingers through putty, or the outside of a beanbag. Ooohh, that’s nice...");
					
					output("\n\n(<b>Perk Gained: ‘Nuki Nuts</b> - Your gonads can now swell up with excess semen, allowing for excessively large orgasms. Beware of immobilization!)");
				}
				// On Use, PC has balls and already has Nuki Nuts
				else
				{
					output("You take the light brown bottle of cream from your pack and turn it over in your hands, chuckling at the picture on the front of a furry raccoon-man in a robe that’s tenting under his legs, subtly suggesting a truly massive set of gonads hiding just out of sight. One application is all it takes to get like him... and you.");
					
					output("\n\nYou grin");
					if(!target.isAssExposed()) output(", slip down your [pc.lowerGarment],");
					output(" and squirt the contents of the bottle into your hand.");
					if(target.hasCock()) output(" Your [pc.cocks] throb" + (target.cocks.length == 1 ? "s" : "") + " in anticipation, but you lift " + (target.cocks.length == 1 ? "it" : "them") + " out of the way and cup your [pc.balls] instead.");
					output(" The sudden sensation of cold cream smearing across your sack sends a shiver up your spine, but makes you hard nonetheless. You give yourself a squeeze, massaging the thick brown paste over every inch of your gonads. Though you’ve already got the goods, so to speak, the paste still seems to do something as you spread it around: your balls feel weighty and full, more so than before, and fill out and stretch against the flesh of your sack.");
					
					target.ballFullness += 100;
					target.changeLust(50);
					
					output("\n\n");
					if(target.hasCock()) output("Your [pc.cock] throbs urgently, beading with pre-cum until you take it in hand and give it a stroke.");
					else output("You gently rub along the surface of your [pc.ballsack], its internal mass urgently pulses, desperately begging for release.");
					output(" Just that little motion almost makes you lurch -- what feels like a gallon of spooge churns just below the surface of your balls, fighting to escape. You keep squeezing and kneading your sack well after the nanomachine paste has run its course, just enjoying the sensation of it. Ooohh, that’s nice...");
					
					output("\n\n<b>Your sack is definitely fuller now.</b>");
					
					// Cum Cascade Extra!
					if(!target.hasPerk("Cum Cascade") && target.statusEffectv1("Orally-Filled") >= 500 && InCollection(target.statusEffectv3("Orally-Filled"), GLOBAL.VALID_CUM_TYPES))
					{
						var isKuiTan:Boolean = (target.originalRace.indexOf("kui-tan") != -1 || target.nukiScore() >= 3);
						
						output("\n\nSuddenly, a warm tingle hits your gut. There is a strange reaction with your nanomachines as you feel something within your [pc.balls] being rewired... It must be all the cum you’ve previously ingested combined with your " + (isKuiTan ? "natural" : "enhanced") + " kui-tan trait.");
						if(!isKuiTan) output(" Perhaps your body is adapting to a kui-tan’s natural ability to produce more [pc.cumNoun]?");
						output("\n\nYour codex beeps and you flip it into view to verify. It looks like the more intense side effects of having ‘Nuki Nuts are just setting in");
						if(isKuiTan) output(" -- or at least being more obvious than you can remember");
						output(". You should be careful of where you are when you decide to swallow semen from now on... unless you want to find yourself in a compromising position with overly bloated balls!");
						if(isKuiTan) output(" Although, being a kui-tan you already know this... right?");
						
						output("\n\n(<b>Perk Gained: Cum Cascade</b> - Orally ingesting semen will now put your ‘Nuki Nuts into overdrive, causing you to produce extra seed relative to how much semen you have in your belly. Beware of immobilization!)");
						// Perk: Cum Cascade
						// v1: 
						// v2: 
						// v3: 
						// v4: 
						target.createPerk("Cum Cascade", 0, 0, 0, 0, "Your ‘Nuki Nuts will jump into overdrive while you have semen orally ingested.");
					}
				}
				
				return false;
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the cream but to no effect.");
			}
			return false;
		}
	}
}

