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
	import classes.Engine.Utility.IncrementFlag;
	import classes.Engine.Utility.num2Text;
	
	public class OmegaOil extends ItemSlotClass
	{
		
		public function OmegaOil() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			this.shortName = "O. Oil";
			this.longName = "Omega Oil";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a sachet of Omega Oil";
			
			this.tooltip = "A small sachet of clear ointment with a greek Omega symbol on it. The label reads: <i>“You love being plowed, but can’t afford to buy gallons of lube? You just want to mate all day like a mindless beast, but can’t let go? You want the fun of an estrus cycle without having to worry about pregnancies and contraception? Then our brand new Omega Oil™ is for you! Based on years of research by ABO Corp on the exotic natives of Omega IV, Omega Oil™ will make your back entrance perfectly suitable for some anal excitement!”</i> Lower on the packaging are tiny characters you barely decipher: <i>“Use with caution; MAY cause permanent changes to the user’s body.”</i>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 520;
			
			this.version = this._latestVersion;
		}
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var pc:Creature = kGAMECLASS.pc;
			var changes:int = 0;
			clearOutput();
			author("Shysquare");
			
			if (!(target is PlayerCharacter))
			{
				output(target.capitalA + target.short + " uses it to little to no effect.");
				return false;
			}
			//Subsequent Uses (PC is Blood Fevered):
			//Effect : auto raises pc lust by 15
			if(pc.hasStatusEffect("Fuck Fever"))
			{
				output("Despite the fire already coursing through your veins, you decide to take another dose of Omega Oil. You pour the viscous liquid on your finger");
				if(pc.analCapacity() >= 100) output("s");
				output(" and apply it in the usual fashion into your over heated body.");
				if(pc.isTaur()) output(" You have no trouble finding a <i>“comfortable”</i> position this time.");
				output(" The oil is blissfully cool to your overheated body.");

				output("\n\nYou don’t feel particularly different from before, but... the heat in your body feels <i>denser</i>, somehow.");
				output(" <b>The Fuck Fever has been extended.</b>");
				pc.addStatusMinutes("Omega Oil",7000);
				pc.addStatusMinutes("Fuck Fever",7000);
				changes++;
			}
			//3rd dose and more, status <i>Flushed</i>:
			else if(pc.hasStatusEffect("Flushed"))
			{
				//Consume
				//automatically adds 15 to the players lust/
				pc.lust(15);
				if(kGAMECLASS.flags["OMEGA_FEVERED"] == undefined) 
				{
					output("Torn between apprehension and curiosity, you wonder what kind of strange side-effects you may trigger this time as you");
					kGAMECLASS.flags["OMEGA_FEVERED"] = 1;
				}
				else output("This time, you know with certainty what you are getting into. You");
				output(" pour the oil on your fingers once again and apply it, finger");
				if(pc.analCapacity() >= 100) output("s");
				output(" blissfully cool inside your heated body.");

				//Main effects
				//same as 1st dose/
				//Removes Status <i>“Strangely Warm”</i>, Gives status <i>“Blood Fevered”</i> (72 hours)
				//Effect:
				//pc more vulnerable to (cock) tease/ lust attack
				//pc can’t flee enemies with dick/phallus/penetrating organ
				//PC gains a small amount of lust every turn when fighting dicked NPCs ?
				pc.removeStatusEffect("Flushed");
				pc.createStatusEffect("Fuck Fever",0,0,0,0,false,"Icon_LustUp","You are significantly more passively lusty than before.\n\n(+33 minimum lust)\n(Extremely vulnerable to phallus-bearing foes.)",false,5760,0xB793C4);
				pc.setStatusValue("Omega Oil",1,33);
				pc.setStatusMinutes("Omega Oil",5760);

				output("\n\nYour mind clouds as your ");
				if(!pc.hasVagina() || pc.ass.wetness() > 0) output("[pc.asshole] moistens");
				else
				{
					output("[pc.pussies] moisten");
					if(pc.totalVaginas() == 1) output("s");
				}
				output(". Despite already being hornier than usual, the desire to be claimed constantly burns even stronger in your blood.");
				output("\n\nImages and thoughts come unbidden to your mind, overwhelming your control as you rapidly lose yourself in them, daydreaming of... wagging your [pc.ass] before lustful " + RandomInCollection(["mercenaries","strangers","rushers","aliens"]) + ", watching their boners pop out at your ");
				if(pc.hasVagina()) output("fertile");
				else output("tantalizing");
				output(" scent and wanton behavior.");
				output("\n\nPerhaps you could even entice them into fighting for you, letting only the strongest Alpha");
				if(pc.analVirgin) output(" claim your virginity");
				else output(" breed your [pc.asshole]");
				output(", mating you over and over again until the burning fades.");
				output("\n\nOr maybe - little shivers of");
				if(pc.analVirgin) output(" nerves and");
				output(" excitement run down your spine at the thought - " + RandomInCollection(["they could","you could set yourself up in a breeding stand and let strangers in the street"]) + " take turns filling every hole available, with no regards to your own pleasure, until you were " + RandomInCollection(["an ecstatic mess","in a puddle of all your combined juices"]) + ".");
				output("\n\nYou shake your head to clear the ");
				if(pc.libido() < 25 && pc.exhibitionism() < 33) output("unwanted ");
				output("fantasy from your mind. There’s a dull throbbing in your [pc.asshole] that demands to be satisfied. Somehow you have a feeling mere fingers won’t be nearly enough to find relief, and you aren’t quite sure how far you would go to ease this craving. The next few days are certainly going to be...<i> interesting</i>.");
				output("\n\n<b>You have Fuck Fever, and will suffer from it for the next 72 hours.</b>");
				changes++;

			}
			//2nd dose, status <i>“Flushed”</i> :
			//Consume
			else if(pc.hasStatusEffect("Strangely Warm"))
			{
				//automatically adds 15 to the players lust/
				pc.lust(15);
				output("The label does warn the user against applying more than one dose in 48 hours; however, you decide not to heed this warning");
				//first time dose with status <i>“flushed”</i>:
				if(kGAMECLASS.flags["OMEGE_FLUSHED"] == undefined)
				{
					output(". After all, what’s the worst that could happen?");
					if(pc.IQ() >= 50) output(" Surely this product would not have been put on the market if it wasn’t safe to do so.");
					if(pc.IQ() >= 75) output(".. right ?");
					output(" You");
					kGAMECLASS.flags["OMEGE_FLUSHED"] = 1;
				}
				else output(" and");
				output(" slick");
				if(pc.analCapacity() < 100) output(" your finger");
				else output(" two fingers");
				output(" with the clear liquid, then do as instructed and lube your [pc.asshole] with it. The aching sensation comes stronger than last time, but it makes the");
				if(pc.analCapacity() < 100) output(" finger");
				else output(" fingers");
				output(" in your ass all the more pleasurable as you wait for the product to take effect.");

				//main effects
				//same as 1st dose
				//Removes Status <i>“Strangely Warm</i>, Gives status <i>“Flushed””</i> (72 hours)
				pc.removeStatusEffect("Strangely Warm");
				pc.createStatusEffect("Flushed",0,0,0,0,false,"Icon_LustUp","You are significantly more passively lusty than before.\n\n(+25 minimum lust)\n(Vulnerable to phallus-bearing foes.)",false,4320,0xB793C4);
				pc.setStatusValue("Omega Oil",1,25);
				pc.setStatusMinutes("Omega Oil",4320);

				//Effect: min lust raised by 15, pc more vulnerable to (cock) tease/ lust attack
				pc.lust(25);
				output("\n\nYou feel quite apathetic all of a sudden, as if your brain were wrapped in a thick wooly duvet. A haze of lust clouds your mind as your");
				if(!pc.hasVagina()) output(" [pc.asshole] moistens");
				else 
				{
					output(" [pc.vaginas] moisten");
					if(pc.totalVaginas() == 1) output("s");
				}
				output(". Your hands begin stroking your body from top to bottom,");
				if(!pc.hasCock()) output(" your sensitive [pc.skin] burning with desire");
				else output(" your [pc.cocks] flushed with need");
				output(", until they reach your sensitive entrance. You aren’t quite tired, but don’t have the motivation to do anything but stay right there, finger");
				if(pc.analCapacity() > 100) output("s");
				output(" lazily playing with your [pc.asshole]. Fantasies about bending over and presenting your needy [pc.asshole] to a virile ");
				if(rand(3) == 0) output("male");
				else if(rand(2) == 0) output("herm");
				else output("alpha");
				output(" overwhelm you. You find yourself wishing you could just stay just like this forever");
				//if willpower <50% of max, random:
				if(pc.WQ() < 50) output(", without that pesky inheritance your Dad wanted you to find.");
				else output(", waiting for a well-endowed mate to claim you for their own. ");
				output("\n\nEventually the haze begins to lift and the world rights itself. As you pull yourself together however, it feels like <b>you are a bit hornier than before!</b>");
				changes++;
			}
			//1st dose :
			else
			{
				//automatically adds 15 to the players lust
				pc.lust(15);
				output("Pulling the small bag from your pack, you open it and pour the viscous liquid on your fingers. Following the instructions on the back of the packet,");
				if(pc.isTaur()) output(" and many uncomfortable contortions later,");
				output(" you position one lubed finger against your [pc.asshole] and slowly massage the rim, then push it in. The ointment feels quite cool at first, but fortunately warms rapidly. After a few seconds fingering yourself, a ");
				//if first use:
				if(kGAMECLASS.flags["OMEGA_OILED"] == undefined) output("strange");
				else output("familiar");
				output(" heat begins to curl inside you");
				if(pc.hasCock()) output(", slowly spreading from your insides to your [pc.cocks]");
				if(pc.hasVagina()) output(", and you feel moisture  trickling down your [pc.thighs]");
				if(!pc.hasGenitals()) output(", then slowly spreads all over your [pc.skinFurScalesNoun], making you so sensitive you would probably climax from the slightest draft against your skin");
				output(". A dull ache throbs inside you. You <i>need</i> to be filled with a big, fat cock, with a thick knot to keep you impaled on it while it breeds you. The feeling passes quickly, but it leaves you slightly flushed as you wait for the advertised effects to occur.");
				//Gives status <i>“Flushed”</i> (48 hours)
				//Effect: min lust raised by 15 (for the duration of the status)
				if(!pc.hasStatusEffect("Strangely Warm"))
				{
					output("\n\nYou fantasize about submitting and presenting your needy [pc.asshole] to a faceless, well-endowed stranger, having them ram your ass like it’s going out of style. <b>You feel like you’ll stay hornier than normal... at least for a while!</b>");
					pc.createStatusEffect("Strangely Warm",0,0,0,0,false,"Icon_LustUp","You are more passively lusty than before.\n\n(+15 minimum lust)",false,4320,0xB793C4);
					pc.createStatusEffect("Omega Oil",15,0,0,0,true,"","Hidden status that actually tracks the lust mod so we only gotta check 1.",false,4320);
					changes++;
				}
				pc.lust(15);
			}
			//Main effects :	
			//Wetness
			//Effect: 75% chance of raising wetness by 0,75 ; if PC genderless, raises wetness by 1
			if(pc.ass.wetness() < 5 && rand(4) != 0 && changes == 0)
			{
				output("\n\nYour eyes widen in shock as you feel oily moisture bead out of your [pc.asshole]");
				if(pc.ass.wetness() > 3 && !pc.isAssExposed()) output(", staining your [pc.lowerGarment]");
				output(". <b>Your anal wetness has been increased !</b>");
				pc.ass.wetness(1);

				//upon reaching max wetness :
				if(pc.ass.wetness() >= 5)
				{
					output("\n\nYou moan as slick lubricant dribbles out of your [pc.asshole], this time in enough quantity to");
					if(!pc.isAssExposed()) output(" stain your [pc.lowerGarments]");
					else output(" trickle down your thighs");
					output(". Your back passage feels incredibly sensitive, wet and accommodating. <b>Your ass is ready to be plowed by anything, and always will be.</b>");
				}
				changes++;
			}
			//Capacity
			//Effect: 25% chance of increasing bonus capacity by 25
			if(pc.ass.bonusCapacity < 200 && rand(4) == 0 && changes == 0)
			{
				output("\n\nThe ache you felt mere moments ago is back, only this time it’s gaining in intensity. Only your finger seems to relieve the throbbing a bit, so you keep massaging inside your [pc.asshole]. Eventually you think of how nice it would be to be filled with a buzzing dildo or even a nice, juicy cock. As the thought comes to mind, you realize a second finger slipped in your [pc.asshole] at some point during your daydream, and you didn’t even notice ! <b>Your asshole feels deeper, somehow.</b>");
				pc.ass.bonusCapacity += 25;
				changes++;
			}
			//Elasticity
			//Effect: 25% chance of increasing elasticity by 0,25
			if(pc.elasticity < 3 && rand(4) == 0 && changes == 0)
			{
				output("\n\nThe throbbing you felt earlier is back, only this time it’s not fading. Finger still moving in your [pc.asshole], you idly think of how nice it would be to fill it with a thick dildo or even a nice, juicy cock. Suddenly, you realize a second finger slipped in your [pc.asshole] at some point during your daydream, and you weren’t even aware of it ! <b>Your asshole has become more pliable.</b>");
				pc.elasticity += 0.25;
				changes++;
			}
			//Adds lust
			//Effect: 75% chance of raising pc lust by 10
			if(rand(4) == 0 && changes == 0)
			{
				output("\n\nYou wait for a while, still slowly pumping your finger inside yourself. However, nothing happens, except the tingling on your skin and the urge to come becoming stronger over time.");
				if(pc.isNice()) output(" That wasn’t a faulty lot, was it?");
				else if(pc.isMischievous()) output(" Well that’ll teach you to buy products from some no-name company....");
				else output(" What a fucking scam.");
			}
			//Nothing
			//Effect: nothing happens
			else if(changes == 0)
			{
				output("\n\nYou wait for a while, still slowly pumping your finger inside yourself. However, nothing more happens.");
				if(pc.isNice()) output(" That wasn’t a faulty lot, was it?");
				else if(pc.isMischievous()) output(" Well, that’ll teach you to buy from some no-name company....");
				else output(" What a fucking scam.");
			}
			IncrementFlag("OMEGA_OILED");
			return false;
		}
		//Codex - not presently enabled because it's completely unneeded and unremarkable.
		//History
		public function analHeatItem():void
		{
			output("Created as a last ditch attempt at saving the now bankrupt A.B.O.Corp, this niche transformative was inspired by the very peculiar reproductive physiology of the planet Omega IV. The planet’s discovery was out of the ordinary in two respects: first, it wasn’t discovered during a Rush (some think that it had been overlooked during a previous Rush due to the comparatively small size of its solar system). Second, the sentient species that dominated the planet refused to be part of the UGC, despite the great technological advancements it would have brought them.");
			output("\n\nThe planet’s authorities declared complete planet lockdown a few decades after 1st contact when an isolationist party came into power. One of the reasons cited for the lockdown was that being part of the <i>“morally corrupt”</i> UGC <i>“would mean renouncing traditional values that have been at the core of \\\[their\\\] very society and the collapse of \\\[their\\\] civilisation into degenerate heathens”</i>.");
			output("\n\nFortunately, A.B.O.Corp researchers stationed on the planet at the time managed to escape with invaluable data and used it to create the product line that is known today as Omega Oil.");
		}


		/* UNACTIVATED DAMAGE OVER TIME... seems a little too much between being unable to flee and all increased lust damage.
		//CombatText:
		///+5 lust every turn against an enemy with cock/phallus/equivalent
		//random:
		output("\n\nYou catch yourself staring longingly at your foe{s}’s{enemy has an unclothed crotch: [enemies.cocks]/else: [enemies.groin]}. Dammit !");
		output("\n\n//A wave of lust makes{taur : your front legs buckle/ biped: your knees buckle/ else: you nearly double over} as filthy fantasies overwhelm you ; it’s almost enough to make you throw caution to the wind and get on all four{if naga/taur/goo/not biped: - or as close to it as possible -} to present your needy hole to your {foe/enemy/opponent/adversary}, but you manage to restrain yourself.");
		output("\n\n//No matter how hard you try to focus, your mind keeps filling with increasingly {dirty/naughty/filthy/debauched} scenarios in which you submit to your foe and worship their [enemies.cocks]. As you pull yourself together, you begin to realize that in your state, your libido may be a greater opponent than your current {foe/enemy}.");
		output("\n\n//if naga : Your tail twists and turns so much with repressed desire, you are almost tying yourself into knots trying <i>not</i> to wrap yourself tightly around your foe and rub against {their} {enemies.groin}. Who knows how long you’ll be able to keep on fighting ?");
		output("\n\n//Waves of lust nearly overwhelm you{PC willpower= max of current level:, but you are filled with determination} and you keep fighting, for now.}");*/

	}
}