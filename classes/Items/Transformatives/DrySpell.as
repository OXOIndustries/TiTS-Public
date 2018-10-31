package classes.Items.Transformatives 
{
	/**
	 * ...
	 * @author DrunkZombie
	 */
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.formatFloat;
	import classes.Engine.Utility.num2Ordinal;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.VaginaClass;
	import classes.CockClass;
	
	public class DrySpell extends ItemSlotClass
	{
		
		public function DrySpell() 
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "D. Spell";
			longName = "Dry Spell";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a wand shaped package of Dry Spell";
			tooltip = "The Dry Spell was created as a means of helping out races or individuals who are bothered by their body producing excessive amounts of fluids. Whether they are a bruchandus who’d like to wear standard clothing, or a person who’s feeling too wet for comfort down there, this simple transformative is marketed as the perfect way to dry up. \n\nThe packaging, made to look like a stage magician’s wand, contains a white, chalk-like stick. The tube is stamped with a label reading “Dry spell”, written in colorful letters over a stylized image of an arid desert, with a small figure of a sandy blonde witch traversing it in the distance. Printed on the opposite side is a rather corny tagline: “Wonderfully wacky white wand withers wasted wetness.” With its rather try-hard package design and slogan, the product screams of the usual J’ejune quality. \n\nAccompanying the item is a short guide on how to use it and a small warning that reads: “Potential side effects include: dry skin, mild irritation and an overabundance of friction!”";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 250;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			kGAMECLASS.clearOutput();
			author("ShadeFalcon");
			
			if (target is PlayerCharacter)
			{	
				howUsedMenu(target);
			
				return true;
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses it to no effect.");
			}
			return false;
		}
		
		private function howUsedMenu(target:Creature):void
		{			
			
			kGAMECLASS.clearOutput();
			author("Shadefalcon");
			kGAMECLASS.clearMenu();
			kGAMECLASS.output("According to the pamphlet, Dry Spell will make your body less lubricated if you eat it, while making any orifice dryer if you choose to insert it there. How will you use the white ‘wand’?");			
				
			//[Eat it] 
			kGAMECLASS.addButton(0, "Eat it", eatIt, target,"Eat it", "This is supposed to make some part of your body less lubricated - if it’ll work at all.");
			
			//[Insert Vaginally]
			if (target.hasVagina())
			{
				if (target.vaginas.length == 1)
				{
					if (target.vaginas[0].wetness() > 0 || target.vaginas[0].hasFlag(GLOBAL.FLAG_LUBRICATED) || target.vaginas[0].hasFlag(GLOBAL.FLAG_STICKY)) kGAMECLASS.addButton(1, "Vaginally", insertVaginaMenu, target, "Insert Vaginally", "This is supposed to make your muff less slick.");
					else kGAMECLASS.addDisabledButton(1,"Vaginally","Insert Vaginally","Your muff is already dry!");
				}				
				else
				{
					if (hasWetLubedStickyVagina(target)) kGAMECLASS.addButton(1, "Vaginally", insertVaginaMenu, target,"Insert Vaginally","This is supposed to make your muff less slick.");
					else kGAMECLASS.addDisabledButton(1,"Vaginally","Insert Vaginally","Your muffs are all already dry!");
					
				}
			}
			else kGAMECLASS.addDisabledButton(1,"Vaginally","Insert Vaginally","You do not have a vagina to insert it into!");	
			
			//[Insert Anally]
			kGAMECLASS.addButton(2, "Anally", insertAnal, target,"Insert Anally","This is supposed make your butthole less wet.");			
			
		}
		
		private function eatIt(target:Creature):Boolean
		{
				
			var rn:int = 0;
			var i:int = 0;
			var sel:Array = [];
			
			kGAMECLASS.clearOutput();
			author("Shadefalcon");
			
			//check for lubricated or sticky parts
			if (target.hasSkinFlag(GLOBAL.FLAG_STICKY) || target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED))
			{
				sel.push(1);
			}
			
			if (target.hasTongueFlag(GLOBAL.FLAG_STICKY) || target.hasTongueFlag(GLOBAL.FLAG_LUBRICATED))
			{
				sel.push(2);
			}
			
			if (target.hasACockFlag(GLOBAL.FLAG_STICKY) || target.hasACockFlag(GLOBAL.FLAG_LUBRICATED))
			{
				sel.push(3);
			}
			
			i = sel.length;
			
			//check for stage 5 galomax and only lubricated skin, if so print message and get out
			if (kGAMECLASS.flags["GALOMAX_DOSES"] >= 5 && target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED) && !target.hasSkinFlag(GLOBAL.FLAG_STICKY) && i == 1)
			{
				kGAMECLASS.output("\n\nConsidering the fact that most of your body is made out of a slick gooey mass, odds are that the Dry Spell won’t affect it. You probably shouldn’t risk trying either. This is a <b>Jéjune</b> product after all!");
				//item is not used so restore the quantity
				if(!kGAMECLASS.infiniteItems()) quantity++;
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.useItemFunction);
				return false;
			}
			
			kGAMECLASS.output("\n\nYou take the Dry Spell out of the package and");
			
			if (kGAMECLASS.silly) kGAMECLASS.output(" <b>EAT IT!!!</b>");
			else kGAMECLASS.output(" crunch away at the tasteless, chalk-like stick.");
			
			kGAMECLASS.output(" As it is chunked down to lesser pieces, the dry powder it consists of starts spreading in your mouth and sucks away at your spit.");
			
			if (target.hasTongueFlag(GLOBAL.FLAG_LUBRICATED)) kGAMECLASS.output(" Luckily, thanks to your lubricated tongue, it takes little effort for you to swallow the white mush.");
			else kGAMECLASS.output(" It takes a whole lot of effort not to spurt it all out, but you keep it in long enough to wash it down with your canteen.");
			
			if (kGAMECLASS.silly) kGAMECLASS.output(" You could swear eating three of these without drinking any water was a viral extranet challenge a while back.");
			
			kGAMECLASS.output(" After you’ve have fully consumed the white stick, you patiently wait for its effects to manifest.");

			//25% chance it is a dud or if no lube or sticky flags
			if (rand(4) == 0 || (i == 0))
			{
				kGAMECLASS.output("\n\nAfter waiting for a while you realize nothing’s gonna happen. Looks like it was a dud.");
				
				if (kGAMECLASS.silly) kGAMECLASS.output(RandomInCollection("\n\nDamn it J’ejune. Can’t you do anything right?","\n\nClassic J’ejune. <i>Laugh track</i>","\n\nGive me a dud one more time J’ejune. I dare you. I double dare you.","\n\nYou angrily shake your fist in the air and scream out, “J’EJUUNNNNEEEEE!!!!!"));
			}
			else
			{
				kGAMECLASS.output("\n\nA moment later, an intense heat spreads throughout your entire body, and you feel copious sticky perspiration dripping from your every pore");
				
				if (target.hasStatusEffect("Sweaty")) kGAMECLASS.output(", increasing the steady flow you had to begin with.");
				else if (kGAMECLASS.flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] != undefined) kGAMECLASS.output(", mixing together with the oil pouring from your mimbranes.");
				else kGAMECLASS.output(".");
				
				if (kGAMECLASS.flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] != undefined || target.hasPerk("Pheromone Sweat")) kGAMECLASS.output(" The sweet smell of your secretions fills the air and makes you grin absentmindedly for a second or two before the warmth drags you abruptly out of your daze.");
								
				kGAMECLASS.output(" Like standing within a sauna, it’s a dry, almost burning sensation, one which threatens to evaporate all the liquid within your body. Soon you can feel your sweat withering away, and every breath you take dries up your mouth, throat and nostrils.");
				
				if (target.hasGenitals())
				{
					kGAMECLASS.output("\n\nAs this desert-like drought continues to drain at your fluids, you start to feel almost electric, euphoric tingles in your skin and sparks of bliss in your crotch. You realize that the powder must’ve contained some form of aphrodisiac too");
				
					if (kGAMECLASS.silly) kGAMECLASS.output(" - because what doesn’t these days?");
					else kGAMECLASS.output(".");
				}
				
				if (target.hasCock())
				{
					kGAMECLASS.output("\n\n[pc.EachCock] begins to rise up");
					if (target.isCrotchExposed()) 
					{
						kGAMECLASS.output(", swelling more and more until you’re completely erect, beading pre-cum.");
						
						if (target.hasVagina())
						{
							kGAMECLASS.output(" Your [pc.vaginas] burn");
						
							if(target.totalVaginas() == 1) output("s");
				
							kGAMECLASS.output(" with the same lusty flame,");
					
							if (target.wettestVaginalWetness() >= 4) kGAMECLASS.output(" pouring");
							else if (target.wettestVaginalWetness() >= 2) kGAMECLASS.output(" leaking");
							else kGAMECLASS.output(" dripping");
						
							kGAMECLASS.output(" [pc.girlCum] as if trying to douse it.");
						}
					}
					else
					{
						kGAMECLASS.output(", tenting your [pc.lowerGarment] and slathering it with pre-cum");
						
						if (target.hasVagina())
						{
							kGAMECLASS.output(", adding to the mess created by the [pc.girlCum]");
						
							if (target.wettestVaginalWetness() >= 4) kGAMECLASS.output(" pouring");
							else if (target.wettestVaginalWetness() >= 2) kGAMECLASS.output(" leaking");
							else kGAMECLASS.output(" dripping");
						
							kGAMECLASS.output(" out of your [pc.vaginas]");
						}
						kGAMECLASS.output(".");
					}
				}
				else
				{
					if (target.hasVagina())
					{
						kGAMECLASS.output("\n\nYour");
						
						if (target.isCrotchExposed()) 
						{
							kGAMECLASS.output(" [pc.vaginas]");
							
							if (target.wettestVaginalWetness() >= 4) kGAMECLASS.output(" pour");
							else if (target.wettestVaginalWetness() >= 2) kGAMECLASS.output(" leak");
							else kGAMECLASS.output(" drip");
														
							if(target.totalVaginas() == 1) output("s");
							
							kGAMECLASS.output(" [pc.girlCum] from your crotch, as if trying to douse the lusty flame that burns");
							
							if (target.totalVaginas() == 1) output(" it.");
							else output(" them.");
						}
						else
						{
							kGAMECLASS.output(" [pc.lowerGarment] dampens with [pc.girlCum] that");
							
							if (target.wettestVaginalWetness() >= 4) kGAMECLASS.output(" pours");
							else if (target.wettestVaginalWetness() >= 2) kGAMECLASS.output(" leaks");
							else kGAMECLASS.output(" drips");
							
							kGAMECLASS.output(" from your [pc.vaginas], the garment soon soaked through as your lust keeps rising.");
						}
						
						kGAMECLASS.output("\n\nEventually, a [pc.girlCumColor]");
						
						if (target.wettestVaginalWetness() >= 4) kGAMECLASS.output(" veritable river");
						else if (target.wettestVaginalWetness() >= 2) kGAMECLASS.output(" steady stream");
						else kGAMECLASS.output(" slow dribble");
						
						kGAMECLASS.output(" is flowing down your thighs");
						
						if (!target.isNaga() && !target.isGoo()) kGAMECLASS.output(" and between your legs");
						
						kGAMECLASS.output(" as your lust keeps rising.");
					}
				}
				
				target.removeStatusEffect("Sweaty");
				
				kGAMECLASS.output("\n\nThe heat");
				
				if (target.hasGenitals()) kGAMECLASS.output(" and euphoria leave");
				else kGAMECLASS.output(" leaves");
				
				kGAMECLASS.output(" your body after a short while, but a feeling of parchedness remains in your");
				//determine what body part is affected
				if (i > 0)
				{
					rn = rand(i);
					
					if (sel [rn] == 1)
					{
						kGAMECLASS.output(" skin.");
						skinTF(target);
					}
					else if (sel [rn] == 2)
					{
						kGAMECLASS.output(" tongue.");
						tongueTF(target);
					}
					else if (sel [rn] == 3)
					{
						kGAMECLASS.output(" cock.");
						cockTF(target);
					}
					else
					{
						//error catch
						trace("What we have here is an error in the EatIt function of DrySpell.as when trying to dry out skin, tongue or cock.");
					}	
				}
				
			}

			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0, "Next", kGAMECLASS.useItemFunction);
			return true;
		}
		
		private function insertVaginaMenu(target:Creature):void
		{
				
			var i:int = 0;
			var x:int = 0;
			var btnSlot:int = 0;
			
			kGAMECLASS.clearOutput();
			author("Shadefalcon");
				
			if(target.vaginas.length == 1)
			{
				vaginaTF([target, 0]);
			}
			else
			{

				kGAMECLASS.output("You have more than one vagina. Which one will you insert Dry Spell into?\n");
				
				kGAMECLASS.clearMenu();
				
				for(i = 0; i < target.vaginas.length; i++)
				{
					kGAMECLASS.output("\nVagina " + (i + 1) + " - [pc.vagina " + i + "] - wetness: " + target.vaginas[i].wetness());
					if (target.vaginas[i].hasFlag(GLOBAL.FLAG_LUBRICATED)) kGAMECLASS.output(", Lubricated");
					if (target.vaginas[i].hasFlag(GLOBAL.FLAG_STICKY)) kGAMECLASS.output(", Sticky");
					
					if (target.vaginas[i].wetness() > 0 || target.vaginas[i].hasFlag(GLOBAL.FLAG_LUBRICATED) || target.vaginas[i].hasFlag(GLOBAL.FLAG_STICKY))
					{
						kGAMECLASS.addButton(btnSlot, "Vagina " + (i + 1), vaginaTF, [target, i], StringUtil.capitalize(num2Ordinal(i + 1)) + " Vagina", "Use this on your [pc.vagina " + i + "].");
							
					}
					else
					{
						kGAMECLASS.addDisabledButton(btnSlot,"Vagina " + (i + 1),StringUtil.capitalize(num2Ordinal(i + 1)) + " Vagina", "Your [pc.vagina " + i + "] is already dry!");
					}
					btnSlot++;					
				}
			}
			
		}
		
		private function insertAnal(target:Creature):Boolean
		{
			var lesswet:Boolean = false;			
			var remSticky:int = 0; //0 = no lube, 1 = remove sticky instead of lube, -1 = skip sticky
			
			kGAMECLASS.clearOutput();
			author("Shadefalcon");
			
			//stop if not wet, lubricated or sticky
			if (target.ass.wetness() == 0 && !target.ass.hasFlag(GLOBAL.FLAG_LUBRICATED) && !target.ass.hasFlag(GLOBAL.FLAG_STICKY))
			{
				kGAMECLASS.output("\n\nOn second thought, you’re as dry and smooth as can be so there’s no point in inserting the Dry Spell.");
				//item is not used so restore the quantity
				if(!kGAMECLASS.infiniteItems()) quantity++;
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.useItemFunction);
				return false;
			}
			
			if (target.isAssExposed()) kGAMECLASS.output("\n\nYou take the Dry Spell out of it’s packaging and proceed by inserting it in your [pc.asshole].");
			else kGAMECLASS.output("\n\nYou wiggle out from your [pc.lowerGarments] to give yourself access to your [pc.asshole], then proceed by taking the Dry Spell out of its packaging and inserting it anally.");
						
			kGAMECLASS.output("\n\nAs the dry, white stick penetrates your dark ring and slides deeper inside, you immediately get a taste of its absorbing effects.");
			
			if (target.ass.wetness() > 1) kGAMECLASS.output(" Your slick lube is sucked into the chalky transformative, gradually dissolving the stick. You realize that the powder must’ve contained some sort of aphrodisiac, because soon enough a blissful heat spreads through your backdoor and your continuous stream of oily secretions seems to accelerate. With the sheer amount of fluids you’re leaking, it doesn’t take long until the Dry Spell in its entirety has melted away.");
			else kGAMECLASS.output(" Every bit of fluids you have stored up in there is sucked into the chalky transformative, dissolving some of the ‘wand’ while leaving your orifice dry. Luckily, the powder must’ve contained an aphrodisiac for situations like these, because soon enough a blissful heat spreads through your backdoor, and you start to secrete lubricants once more. With a continuing stream of fluid, it doesn’t take long before the entire chalk has melted away.");
			
			
			kGAMECLASS.output("\n\nIt takes a short while before anything else happens, but suddenly your [pc.butt] lights up. Like a matchstick, it’s intense but short lived, and the warmth fades away within a few seconds.");
			
			//if wetness is 2+ or have lubricated or sticky flag
			if (target.ass.wetness() > 1 || target.ass.hasFlag(GLOBAL.FLAG_LUBRICATED) || target.ass.hasFlag(GLOBAL.FLAG_STICKY)) 
			{
				//enter here if wet but no flags
				if (!target.ass.hasFlag(GLOBAL.FLAG_LUBRICATED) && !target.ass.hasFlag(GLOBAL.FLAG_STICKY))
				{
					//25% chance to fail
					if (rand(4) == 0)
					{
						kGAMECLASS.output("\n\nYou’re about to leave it at that when your intruding digits are suddenly greeted by a rush of lube. As if a dam has been broken, your pucker starts to gush out oily secretions at a rapid pace. It doesn’t take long before the torrent calms down, however, and soon enough your fluids begin to drip at their usual pace. <b>Looks like your biology ensures that your slick orifice is always lubricated. Maybe it’ll run dry if you insert more Dry Spell?</b>");
						
					}
					else
					{
						kGAMECLASS.output("\n\nUsually, you’d have secreted a whole lot of slick fluids by now. It appears that your once seemingly endless reservoir of lube has dried up some.");
						lesswet = true;
					}
				}
				//Flags here, boss!
				if (target.ass.hasFlag(GLOBAL.FLAG_LUBRICATED))
				{
					//25% chance to fail to remove lube flag
					if (rand(4) == 0)
					{
						kGAMECLASS.output("\n\nYou’re about to leave it at that when your intruding digits are suddenly greeted by a rush of lube. As if a dam has been broken, your pucker starts to gush out oily secretions at a rapid pace. It doesn’t take long before the torrent calms down, however, and soon enough your fluids begin to drip at their usual pace. <b>Looks like your biology ensures that your slick orifice is always lubricated. Maybe it’ll run dry if you insert more Dry Spell?</b>");
						remSticky = -1;
						
					}
					else
					{
						//50% chance to remove sticky instead if present
						if (target.ass.hasFlag(GLOBAL.FLAG_STICKY))
						{
							if (rand(2) == 0) remSticky = 1;	
						}
						
						if (remSticky < 1)
						{
							kGAMECLASS.output("\n\nUsually, you’d have secreted a whole lot of slick fluids by now. It appears that your once seemingly endless reservoir of lube has dried up. <b>Looks like your orifice is no longer lubricated.</b>");
							target.ass.delFlag(GLOBAL.FLAG_LUBRICATED);
							lesswet = true;
							remSticky = -1;
						}
					}
				}
				//only go into this if sticky and no lube or lube set remSticky to 1
				if (target.ass.hasFlag(GLOBAL.FLAG_STICKY) && remSticky >= 0)
				{
					//25% chance to fail to remove sticky flag as long as remSticky was not set to 1 above
					if (rand(4) == 0 && remSticky < 1)
					{
						kGAMECLASS.output("\n\nYou’re about to leave it at that when your intruding digits are suddenly greeted by a thick, slow trickle of sticky fluids that spread around your entire tunnel. After a short while, your entire pucker is once again coated with adhesives, and every motion of your fingers is met with a hint of tackiness. <b>Looks like your biology ensures that you´ve always got a sticky orifice. Maybe it’ll run dry if you insert more Dry Spell?</b>");
					}
					else
					{
						kGAMECLASS.output("\n\nUsually, your backdoor would be fully coated with adhesive-like fluids by now, but it seems like the Dry Spell has dried them up. Now, your fingers move swiftly and smoothly in and out of your pucker, without the regular tacky sensation, which feels rather good in its own right. <b>Looks like your orifice is no longer sticky.</b>");
						target.ass.delFlag(GLOBAL.FLAG_STICKY);
						lesswet = true;
					}
				}
			}
			else
			{
				kGAMECLASS.output(" However, you don’t feel any different. Gingerly, you prod the insides of your pucker with a few digits, and after fingering yourself for a bit, you confirm that there’s been no changes. Your backdoor is as dry as can be. <b>It seems like the Dry Spell will no longer have any effect on your orifice.</b>");
				lesswet = true;				
			}
			
			if (lesswet) target.ass.wetness(-1);			
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0, "Next", kGAMECLASS.useItemFunction);
			return true;
		}
		
		private function skinTF(target:Creature):void
		{
			var x:int = 0;
			x = selectLubeSticky(target, 0);			
			
			kGAMECLASS.output("\n\nYour [pc.skinFurScales] feels a whole lot less");
			
			if (x == 1) kGAMECLASS.output(" slippery");
			else kGAMECLASS.output(" tacky");
			
			
			kGAMECLASS.output(" than you remember. Pulling out your Codex, you take a thorough look at yourself with its camera display app whilst touching yourself all over. From [pc.face] to [pc.arms], along your [pc.stomach] and down to");
			
			if (target.hasFeet()) kGAMECLASS.output(" your [pc.feet]");
			else kGAMECLASS.output(" where your lower body begins");
			
			kGAMECLASS.output(" there’s no hint of");
			
			if (x == 1) kGAMECLASS.output(" lubricant");
			else kGAMECLASS.output(" adhesive");
			
			kGAMECLASS.output(" anywhere on your figure. After finishing this brief inspection, you’re sure of it; <b>your [pc.skinFurScales] is no longer");
			
			if (x == 1)
			{
				kGAMECLASS.output(" lubricated.</b>");
				target.removeSkinFlag(GLOBAL.FLAG_LUBRICATED);
			}
			else
			{
				kGAMECLASS.output(" sticky.</b>");
				target.removeSkinFlag(GLOBAL.FLAG_STICKY);
			}
			
			if (kGAMECLASS.flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] != undefined) kGAMECLASS.output("\n\nYou´re about to leave it at that when suddenly your skin is soaked in that familiar strawberry-scented oil your mimbrane{s} produce{s}. <b>You’ll probably have to tell your mimbrane{s} to stop sweating if you want to stay dry!</b>");
		}
		
		private function tongueTF(target:Creature):void
		{
			var x:int = 0;
			x = selectLubeSticky(target, 1);
			
			kGAMECLASS.output("\n\nYour mouth feels a whole lot less");
			
			if (x == 1) kGAMECLASS.output(" slick");
			else kGAMECLASS.output(" glutinous");
			
			
			kGAMECLASS.output(" than you remember. Moving your [pc.tongue] tongue around experimentally, you glide it along your teeth, occasionally prodding it against your cheeks and");
			
			if (target.hasTongueFlag(GLOBAL.FLAG_LONG)) kGAMECLASS.output(" curling it around itself a couple of times to feel its new texture and make sure it’s as nimble as before.");
			else kGAMECLASS.output(" pressing it against itself to feel its new texture.");
			
			kGAMECLASS.output(" After a short while of this, you finally peek it outside your [pc.lips] and confirm your suspicions: <b>your tongue is no longer");

			if (x == 1)
			{
				kGAMECLASS.output(" lubricated.</b>");
				target.removeTongueFlag(GLOBAL.FLAG_LUBRICATED);
			}
			else
			{
				kGAMECLASS.output(" sticky.</b>");
				target.removeTongueFlag(GLOBAL.FLAG_STICKY);
			}
			
		}
		
		private function cockTF(target:Creature):void
		{
			var x:int = 0; //lube or sticky
			var i:int = 0; //iterator
			var rn:int = 0; //random number
			var c:int = 0; //random cock
			var cockopt:Array = []; //possible cocks
			
			x = selectLubeSticky(target, 2);
			
			//find cocks with the correct flag			
			for (i = 0; i < target.cocks.length; i++)
			{
				if (x == 1)
				{
					if (target.hasCockFlag(GLOBAL.FLAG_LUBRICATED, i)) cockopt.push(i);
				}
				if (x == 2)
				{					
					if (target.hasCockFlag(GLOBAL.FLAG_STICKY, i)) cockopt.push(i);
				}
			}
			
			//select a random eligible cock
			rn = rand(cockopt.length);	
			c = cockopt [rn];
			
			kGAMECLASS.output("\n\nYour [pc.cock " + c + "] feels a whole lot less");
			
			if (x == 1) kGAMECLASS.output(" slick");
			else kGAMECLASS.output(" tacky");
			
			kGAMECLASS.output(" than you remember. Examining your expanded appendage,");
			
			if (target.isCrotchExposed()) kGAMECLASS.output(" you");
			else kGAMECLASS.output(" you pull down your [pc.lowerGarment] and");
			
			
			kGAMECLASS.output(" experimentally start to rub gently at the sensitive [pc.cockHead " + c + "]. You proceed by carefully sliding your hand down along your shaft");
			
			if (target.hasKnot(c)) kGAMECLASS.output(" until you hit its [pc.knot " + c + "]");
			
			kGAMECLASS.output(", giving your tool a few short pumps for good measure.");
			
			
			kGAMECLASS.output("\n\nBesides the precum occasionally dripping from the tip of your cock, there’s no hint of any fluid or");
			
			if (x == 1) kGAMECLASS.output(" lubricant");
			else kGAMECLASS.output(" adhesives");
			
			kGAMECLASS.output(" on your [pc.cockNoun " + c + "], and every motion of your hand");
			
			if (x == 1) kGAMECLASS.output(" is met with a bit more friction, which feels rather good in its own right.");
			else kGAMECLASS.output(" glides more smoothly than usual, which feels rather good in its own right.");
			
			kGAMECLASS.output(" There’s no denying it - <b>your cock is no longer");

			if (x == 1)
			{
				kGAMECLASS.output(" lubricated.</b>");
				target.cocks[c].delFlag(GLOBAL.FLAG_LUBRICATED);
			}
			else
			{
				kGAMECLASS.output(" sticky.</b>");
				target.cocks[c].delFlag(GLOBAL.FLAG_STICKY);
			}
			
		}
		
		private function vaginaTF(arg:Array):void
		{
			var target:Creature = arg[0];
			var i:int = arg[1];
			var lesswet:Boolean = false;
			var remSticky:int = 0; //0 = no lube, 1 = remove sticky instead of lube, -1 = skip sticky
			
			kGAMECLASS.clearOutput();
			author("Shadefalcon");
			
			if (target.isCrotchExposed()) kGAMECLASS.output("\n\nYou take the Dry Spell out of the packaging and proceed by inserting it in your [pc.vaginaNounSimple " + i + "].");
			else
			{
				kGAMECLASS.output("\n\nYou wiggle out from your [pc.lowerGarments] to give yourself access to your honeypot");
				if (target.totalVaginas() > 1) output("s");
				
				kGAMECLASS.output(" and take the Dry Spell out of the package. You proceed by inserting it in your [pc.vaginaNounSimple " + i + "].");
			}
			
			kGAMECLASS.output("\n\nAs the dry, white stick penetrates your nether lips and slides inside your love tunnel, you immediately get a taste of its absorbing effects.");
			
			if (target.vaginas[i].wetness() >= 4) kGAMECLASS.output(" Your [pc.girlCum] is sucked into the chalk like transformative, gradually dissolving the stick. You realize that the powder must’ve contained some sort of aphrodisiac because soon enough a blissful heat spreads through your muff and your continuous stream of [pc.girlCum] seems to accelerate. With the sheer amount of fem-spunk you’re leaking, it doesn’t take long until the Dry Spell in its entirety has melted away.");
			else kGAMECLASS.output(" Your [pc.girlCum] is sucked into the chalky transformative, dissolving some of the ‘wand’ and leaving your orifice dry. Luckily, the powder must’ve contained some sort of aphrodisiac because soon enough a blissful heat spreads through your nethers and you start secreting fem-spunk once more. With a continuing stream of fluid, it doesn’t take long before the entire chalk has melted away.");
			
			kGAMECLASS.output("\n\nIt takes a short while before anything else happens, but suddenly your crotch lights up. Like a matchstick, it’s intense but short-lived, and the warmth fades away within a few seconds.");
			
			//if wetness is 2+ or have lubricated or sticky flag
			if (target.vaginas[i].wetness() > 1 || target.vaginas[i].hasFlag(GLOBAL.FLAG_LUBRICATED) || target.vaginas[i].hasFlag(GLOBAL.FLAG_STICKY)) 
			{
				kGAMECLASS.output(" However, afterwards you feel a bit parched down there. Gingerly you prod a few digits inside your [pc.vagina " + i + "], and after fingering yourself for a bit, you confirm it;");
				//the above text output is finished inside one of the below conditions
				//enter here if wet but no flags
				if (!target.vaginas[i].hasFlag(GLOBAL.FLAG_LUBRICATED) && !target.vaginas[i].hasFlag(GLOBAL.FLAG_STICKY))
				{
					//25% chance to fail
					if (rand(4) == 0)
					{
						kGAMECLASS.output(" <b>your vagina is not as wet anymore.</b>");
						kGAMECLASS.output("\n\nYou’re about to leave it at that when your intruding digits are suddenly greeted by a rush of [pc.girlCum]. Like a dam that’s been broken, your vaginal secretions start gushing out of your [pc.cuntNoun " + i + "]. It doesn’t take long before the torrent calms down, however, and your fluids begin to drip at their usual pace before long. <b>Looks like your biology ensures that your soggy snatch always stays dripping");
						if (kGAMECLASS.silly) kGAMECLASS.output(" like a broken fridge.");
						else kGAMECLASS.output(" wet.");
						
						kGAMECLASS.output(" Maybe it’ll run dry if you insert more Dry Spell?</b>");						
					}
					else
					{
						kGAMECLASS.output(" <b>your vagina is not as wet anymore.</b>");
						lesswet = true;						
					}
				}

				if (target.vaginas[i].hasFlag(GLOBAL.FLAG_LUBRICATED))
				{
					//25% chance to fail to remove lube flag
					if (rand(4) == 0)
					{
						kGAMECLASS.output(" <b>your vagina is not as wet anymore.</b>");
						kGAMECLASS.output("\n\nYou’re about to leave it at that when your intruding digits are suddenly greeted by a rush of [pc.girlCum]. Like a dam that’s been broken, your vaginal secretions start gushing out of your [pc.cuntNoun " + i + "]. It doesn’t take long before the torrent calms down, however, and your fluids begin to drip at their usual pace before long. <b>Looks like your biology ensures that your soggy snatch always stays dripping");
						if (kGAMECLASS.silly) kGAMECLASS.output(" like a broken fridge.");
						else kGAMECLASS.output(" wet.");
						
						kGAMECLASS.output(" Maybe it’ll run dry if you insert more Dry Spell?</b>");
						remSticky = -1;
						
					}
					else
					{
						//50% chance to remove sticky instead if present
						if (target.vaginas[i].hasFlag(GLOBAL.FLAG_STICKY))
						{
							if (rand(2) == 0) remSticky = 1;	
						}
						
						if (remSticky < 1)
						{
							kGAMECLASS.output(" <b>your vagina is not as wet anymore.</b>");
							kGAMECLASS.output("\n\nUsually, even without being aroused you’d have secreted a whole lot of [pc.girlCum] by now. It appears that your once seemingly endless reservoir has dried up. <b>Looks like your vagina is no longer constantly wet.</b>");
							target.vaginas[i].delFlag(GLOBAL.FLAG_LUBRICATED);
							lesswet = true;
							remSticky = -1;
						}
					}
				}
				//only go into this if sticky and no lube or lube set flag to 1 so remove sticky
				if (target.vaginas[i].hasFlag(GLOBAL.FLAG_STICKY) && remSticky >= 0)
				{
					//25% chance to fail to remove sticky flag but only if remSticky wasn't set to 1 above
					if (rand(4) == 0 && remSticky < 1)
					{
						kGAMECLASS.output(" <b>your vagina is not as sticky anymore.</b>");
						kGAMECLASS.output("\n\nYou’re about to leave it at that when your intruding digits are suddenly greeted by a thick, slow trickle of sticky fluids that spread around your entire tunnel. After a short while, your entire pussy is once again coated with adhesives, and every motion of your fingers is met with a hint of tackiness. <b>Looks like your biology ensures that you´ve always got a sticky muff. Maybe it’ll run dry if you insert more Dry Spell?</b>");
					}
					else
					{
						kGAMECLASS.output(" <b>your vagina is not as sticky anymore.</b>");
						kGAMECLASS.output("\n\nUsually, your muff would be fully coated with adhesive-like fluids by now, but it seems like the Dry Spell has dried them up. Now, your fingers move swiftly and smoothly in and out of your pussy, without getting tacky, which feels rather good in its own right. <b>Looks like your vagina is no longer sticky.</b>");
						target.vaginas[i].delFlag(GLOBAL.FLAG_STICKY);
						lesswet = true;
					}
				}
			}
			else
			{
				kGAMECLASS.output(" However, you don’t feel any different. Gingerly, you prod the insides of your [pc.vagina " + i + "] with a few digits, and after fingering yourself for a bit, you confirm that there’s been no changes. Your vagina is as dry as can be. <b>It seems like the Dry Spell will no longer have any effect on your honeypot.</b>");
				lesswet = true;				
			}
			
			if (lesswet) target.vaginas[i].wetness(-1);
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0, "Next", kGAMECLASS.useItemFunction);
		}
		
		//select either lubrication or sticky from a chosen body part, return as either 1 - lube or 2 - sticky (0 = error: nothing found)
		//part variable values 0 = skin, 1 = tongue, 2 = cock
		private function selectLubeSticky(target:Creature, part:int):int
		{
			var rn:int = 0;
			var i:int = 0;
			var sel:Array = [];
			
			switch (part)
			{
			//skin
			case 0:
				if (target.hasSkinFlag(GLOBAL.FLAG_LUBRICATED))
				{
					//only do if not galomax skin
					if (kGAMECLASS.flags["GALOMAX_DOSES"] == undefined || kGAMECLASS.flags["GALOMAX_DOSES"] < 5)
					{
						sel.push(1);				
					}
				}
				if (target.hasSkinFlag(GLOBAL.FLAG_STICKY))
				{
					sel.push(2);
				}				
				break;
			//tongue
			case 1:
				if (target.hasTongueFlag(GLOBAL.FLAG_LUBRICATED))
				{
					sel.push(1);
				}
				if (target.hasTongueFlag(GLOBAL.FLAG_STICKY))
				{
					sel.push(2);
				}				
				break;
			//cock
			case 2:
				if (target.hasACockFlag(GLOBAL.FLAG_LUBRICATED))
				{
					sel.push(1);
				}
				if (target.hasACockFlag(GLOBAL.FLAG_STICKY))
				{
					sel.push(2);
				}			
				break;
			}
			i = sel.length;
			if (i > 0) rn = rand(i);	
			return sel [rn];
		}

		private function hasWetLubedStickyVagina(target:Creature):Boolean
		{
			var i:int = 0;
		
			if (target.wettestVaginalWetness() > 0) return true;
		
			for(i = 0; i < target.vaginas.length; i++)
			{
				if (target.vaginas[i].hasFlag(GLOBAL.FLAG_LUBRICATED)) return true;
				if (target.vaginas[i].hasFlag(GLOBAL.FLAG_STICKY)) return true;				
			}
			return false;
		}
	}
}