package classes.Items.Miscellaneous
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.formatFloat;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.num2Ordinal;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.GameData.CodexManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	
	public class Throbb extends ItemSlotClass
	{
		
		//constructor
		public function Throbb()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 20;
			this.type = GLOBAL.DRUG;
			
			//Used on inventory buttons
			this.shortName = "Throbb";
			
			//Regular name
			this.longName = "vial of Throbb";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a vial of Throbb";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This vial of transparent cyan fluid seems so innocuous considering its supposed deleterious effects: overwhelming libido increase, massive male genital growth, and a titanic boost to production of semen (along with requisite swelling of semen-producing organs). In order to use it, females are to inject it just above the pubic mound. Males are supposed to inject directly into their preferred organ.\n\n<b>Known to cause moderate amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 200;
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
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				
				// Just in case it didn't get unlocked before.
				CodexManager.unlockEntry("Throbb");
				// Never read codex entry on it.
				if(!CodexManager.entryViewed("Throbb"))
				{
					kGAMECLASS.output("You are reminded that Throbb is an illegal and potentially dangerous drug. Perhaps you should read up on it before injecting it into yourself.");
					if(!kGAMECLASS.infiniteItems()) quantity++;
					return false;
				}
				
				//Multiple wangs: 
				if(target.cockTotal() > 1) 
				{
					kGAMECLASS.output("You have more than one penis. Which one will you inject with Throbb?\n");
					kGAMECLASS.clearMenu();
					var btnSlot:int = 0;
					for(var i:int = 0; i < target.cocks.length; i++)
					{
						output("\n<b>" + StringUtil.capitalize(num2Ordinal(i + 1)) + " Cock:</b>");
						if(target.cocks[i].cockFlags.length > 0)
						{
							for(var x:int = 0; x < target.cocks[i].cockFlags.length; x++)
							{
								output(" " + GLOBAL.FLAG_NAMES[target.cocks[i].cockFlags[x]] + ",");
							}
						}
						if(target.cocks[i].cockColor != "") output(" " + StringUtil.toDisplayCase(target.cocks[i].cockColor) + ",");
						output(" " + GLOBAL.TYPE_NAMES[target.cocks[i].cType]);
						if(target.cocks[i].cLength() > 0) output(", " + formatFloat(target.cocks[i].cLength(), 3) + " in long");
						if(target.cocks[i].thickness() > 0) output(", " + formatFloat(target.cocks[i].thickness(), 3) + " in thick");
						
						addButton(btnSlot, "Cock " + (i + 1), throbbPCEffects, i, StringUtil.capitalize(num2Ordinal(i + 1)) + " Cock", "Use this on your [pc.cock " + i + "].");
						btnSlot++;
					}
					return true;
				}
				else return throbbPCEffects();

			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " injects the Throbb to no effect.");
			}
			return false;
		}
		public function throbbPCEffects(arg:int = 0):Boolean {
			var pc:Creature = kGAMECLASS.chars["PC"];
			kGAMECLASS.clearOutput();
			var changes:int = 0;
			var changeLimit:int = 2;
			var temp:* = 1;
			if(rand(2) == 0) changeLimit++;
			if(kGAMECLASS.flags["TIMES_THROBB_USED"] == undefined) kGAMECLASS.flags["TIMES_THROBB_USED"] = 0;
			kGAMECLASS.flags["TIMES_THROBB_USED"]++;

			//First Use: 
			if(kGAMECLASS.flags["TIMES_THROBB_USED"] == 1) {
				kGAMECLASS.output("Well, here goes nothing. You twist the little plastic cap off one end of the vial to reveal the needle. It gleams menacingly in the light as you consider it. There’s no backing out now. You reverse your grip, align the needle with your ");
				if(!pc.hasCock()) kGAMECLASS.output("groin");
				else kGAMECLASS.output("[pc.cock " + arg + "]");
				kGAMECLASS.output(" and jam it in.\n\nIt doesn’t do anything at all! Not at first anyway. You discard the spent needle and look around, wondering if you got a dud when the effects finally hit.");
			}
			//Repeat Use: 
			else kGAMECLASS.output("Already feeling a familiar, anxious lust, you uncap the throbb and look down at your crotch. There’s barely any hesitation when you plunge it in and depress the plunger, flooding your system with the libido-spiking mutagen. You don’t feel anything at first, but then again, you didn’t the first time either. You smile and rub yourself, calmly awaiting the effects.");

			//<= 25 libido get boosted by 10!
			if(pc.libido() <= 25) {
				kGAMECLASS.output("\n\nThe room tilts slightly on its axis, and you move your head to compensate, aware that the Throbb must be doing this but bound by your body’s traitorous senses to experience it all the same. Your [pc.skin] flushes hotly a moment later, fed by the rapid-fire hammering of your accelerating heartbeat. A slow moan slips out between your lips as your thoughts invariably slip into sexual musings, wondering how horny this is going to make you or if you’ll need to fuck six times a day just to function. That idea has more and more appeal; you briefly consider injecting yourself with more when your better sense asserts itself. This stuff has you panting with lust and has undoubtedly supercharged your libido!");
				pc.libido(10);
				pc.taint(5);
				pc.lust(50+rand(10));
				changes++;
			}
			//<= 50 libido get boosted by 7
			else if(pc.libido() <= 50)
			{
				kGAMECLASS.output("\n\nA slutty, whorish sounding moan slips out of your [pc.lips] before you can stop it. You didn’t even feel it coming, but you can tell why you made it now. Your whole body is burning up with lust, carried aloft on a wave of crimson, pulsating desire that pumps through your very veins, making your eyes cross and your tongue loll from you from your mouth. A simpering, needful whimper follows on the heels of the moan as you become completely, irrevocably aroused, too turned on to function in any sane manner. You’re certain it’s given your libido a bump, not that you mind. It’s just another excuse to fuck, after all.");
				pc.libido(7);
				pc.taint(3);
				pc.lust(75+rand(10));
				changes++;
			}
			//<= 75 libido get boosted by 5!
			else if(pc.libido() <= 75) 
			{
				kGAMECLASS.output("\n\nSuddenly, you realize you need to fuck - right now. You want sex like a starving man wants food: fast and in as great a quantity as possible. Lolling out of your mouth, your [pc.tongue] hangs limply as you begin to pant, dripping saliva over your [pc.chest]. Your [pc.skin] is hot and flushed, so sensitive to the touch that you can’t help but rub your hands along over yourself and quietly moan out your enjoyment. As soon as you can get your bearings straight, you’re going to bend someone over and give them a good, hard fucking.");
				if(!pc.hasCock()) kGAMECLASS.output(" Where did that thought come from? You don’t even have a dick yet!");
				kGAMECLASS.output(" Maybe two or three fucks, actually. That way you can use your cum as lube and give a proper, thorough creampie.");
				if(!pc.hasCock()) kGAMECLASS.output(" There’s no banishing the strange thoughts.");
				//+100+rand(10) lust
				pc.libido(5);
				pc.taint(2);
				pc.lust(100);
				changes++;
			}
			//Else libido get boosted by 3!
			else 
			{
				kGAMECLASS.output("\n\nYou fall flat on your [pc.butt], letting lewd little moans slip out of your mouth, and unashamedly fondling your ");
				if(pc.hasCock()) kGAMECLASS.output("[pc.cocks]");
				if(pc.hasCock() && pc.hasVagina()) kGAMECLASS.output(" and ");
				if(pc.hasVagina()) kGAMECLASS.output("[pc.vaginas]");
				if(!pc.hasCock() && !pc.hasVagina()) kGAMECLASS.output("groin");
				kGAMECLASS.output(". Every single inch of your [pc.skin] feels tingly and sensitive, and you break out into a sweat regardless of the ambient temperature. You’re hot, inside and out, fiendishly aroused by the Throbb. You wonder just how much fucking hornier it can get you. It’s kind of hard to think straight with how turned on you are right now, but you have a hard time caring. It feels so good, and you’re going to get so big and sexy!");
				pc.libido(3);
				pc.taint(1);
				pc.lust(100);
				changes++;
			}
			//GROWTH! REQUIRES DICK!
			if(pc.hasCock() && ((pc.cockTotal() > 1 && rand(2) == 0) || (changes < changeLimit && rand(2) == 0))) {
				//Make a smallish dick bigger!
				if(pc.cockLengthUnlocked(arg, 9) && pc.cocks[arg].cLengthRaw <= 8) {
					kGAMECLASS.output("\n\nYour hand strays to your [pc.cock " + arg + "] without conscious thought. On noticing it, you merely smile, admiring the shape of your swollen length, like your hand belongs there. Your arm begins to pump, dragging your hand up and down the length, pleasuring yourself before you have a chance to react, and you just slump back, jacking on your [pc.cock " + arg + "] as it feels better and better.");
					temp = Math.round(23 + rand(30))/10;
					if(pc.hasPerk("Hung")) temp *= 2;
					pc.cocks[arg].cLengthRaw += temp;
					kGAMECLASS.output("\n\nThis is way more pleasurable than any normal masturbation! You don’t really recall being able to take such long strokes along your length or having it fill your hand so powerfully, throbbing just like the drug’s namesake. Looking down, you gasp. Your [pc.cock " + arg + "] is at least two inches longer and still growing! You tug it to help it on its way, moaning as it slops big ropes of pre onto your knuckles. <b>You’ve gained " + num2Text(temp) + " inches of length!</b>");
					changes++;
				}
				//Make a kinda big dick bigger!
				else if(pc.cockLengthUnlocked(arg, 21) && pc.cocks[arg].cLengthRaw <= 20)
				{
					kGAMECLASS.output("\n\nYou couldn’t stop yourself from grabbing onto your [pc.cock " + arg + "] if you wanted to. It’s burning with need, throbbing and bouncing against you as it weakly shoots out ropes of pre-cum as thick as your normal ejaculate. You tug it, feeling lengthing in your hand, thickening to match its expanded size, and groan. Your [pc.hips] lurch into the air as you start fistfucking yourself, dick lengthening all the while. ");
					temp = Math.round(15 + rand(30))/10;
					if(pc.hasPerk("Hung")) temp *= 2;
					pc.cocks[arg].cLengthRaw += temp;
					kGAMECLASS.output("<b>It doesn’t stop until you’ve gained " + num2Text(temp) + " inches of length.</b>");
					changes++;
				}
				//Make a hyper dick bigger!
				else if (pc.cockLengthUnlocked(arg, 30))
				{
					kGAMECLASS.output("\n\nDespite its immensity, your [pc.cock " + arg + "] has become painfully hard. You idly wonder how you have enough blood to make a dong this size this rigid before another wave of excitement washes that away. Pre-cum is practically pissing out of your slit as you start pumping your expanding length, rolling down the [pc.cockHead " + arg + "] in waves of cream that are sure to be outshone by your inevitable, massive orgasm. You’re throbbing so hard, thickening with each beat of your heart. It feels so good that you can’t fathom why you haven’t cum yet. It’s like you’re drowning in an ocean of burning, oozing lust, and the only thing exposed is the steadily growing tip of your length. <b>Your [pc.cock " + arg + "] has gotten even bigger!</b>");
					temp = Math.round(10 + rand(30))/10;
					if(pc.hasPerk("Hung")) temp *= 2;
					pc.cocks[arg].cLengthRaw += temp;
					changes++;
				}
				else
				{
					kGAMECLASS.output(pc.cockLengthLockedMessage());
				}
			}
			
			//Grow balls from nothing!
			if(pc.ballsUnlocked(2) && pc.balls <= 0 && pc.hasCock() && pc.longestCockLength() >= 10 && changes < changeLimit) {
				kGAMECLASS.output("\n\nJust when you’re getting into the chemical arousal that’s coursing through you, your gut twists, and nausea threatens to overwhelm you. Something is squeezing down on you painfully hard! You check, but there’s nothing there aside from your hand massaging your embiggened phallus. Closing your eyes, you try to identify the source of your discomfort. The tightness shifts lower, sliding down and granting you relief at last. You open your eyes to see something entirely unexpected - a small scrotum with two lumps inside. <b>You have grown testicles!</b>");
				pc.balls = 2;
				pc.ballSizeRaw = 3;
				if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 3;
				changes++;
			}
			else if (!pc.ballsUnlocked(2) && pc.balls <= 0)
			{
				kGAMECLASS.output(pc.ballsLockedMessage());
			}
			
			//Make balls bigger!
			
			// Calc new ballsize
			var newBallSize:Number = 0.0;
			if (pc.ballSizeRaw < 4) newBallSize = pc.ballSizeRaw + 1.5 + rand(20) / 10;
			else if (pc.ballSizeRaw < 8) newBallSize = pc.ballSizeRaw + 0.75 + rand(10) / 10;
			else newBallSize = pc.ballSizeRaw + 0.5 + rand(5) / 10;
			if(pc.hasPerk("Bulgy")) newBallSize *= 1.2;

			if(pc.ballSizeUnlocked(newBallSize) && pc.balls > 0 && pc.hasCock() && rand(3) == 0 && changes < changeLimit)
			{
				kGAMECLASS.output("\n\nA churning, swelling tightness stretches the skin of your [pc.sack] tight for a moment as the omnipresent heat travels into your [pc.balls]. ");
				if(pc.balls == 1) kGAMECLASS.output("You can feel it");
				else kGAMECLASS.output("You can feel them");
				kGAMECLASS.output(" churning up a huge load of [pc.cum], swelling just to hold all the [pc.cumColor] goodness that’s waiting to burst out in a blissful explosion. You gently palm ");
				if(pc.balls == 1) kGAMECLASS.output("it");
				else kGAMECLASS.output("one");

				pc.ballSizeRaw = newBallSize;
				
				kGAMECLASS.output(" and nearly blow your load when you feel it pulsating in your hand, stretching out against you. <b>Your [pc.balls] got bigger!</b>");
				changes++;
			}
			else if (!pc.ballSizeUnlocked(newBallSize) && pc.balls > 0)
			{
				kGAMECLASS.output(pc.ballSizeLockedMessage());
			}
			
			//Increase cum capacity if can hold less than 3 shots a day!
			if(pc.cumMultiplierRaw / 3 >= pc.ballEfficiency && pc.hasCock() && changes < changeLimit) {
				kGAMECLASS.output("\n\nYou whimper and ooze a strand of [pc.cum] onto yourself when a strange but pleasurable sensation rolls over your [pc.balls]. It isn’t necessarily growth, nor is it some kind overly erotic, orgasm-inducing surge. The feeling could best be described as a budding capacitance. <b>Somehow, you know your body can hold even more [pc.cum] in its reserves.</b>");
				changes++;
				pc.ballEfficiency += 3 + rand(6);
			}
			//Increase cum multiplier to a max of x50!
			if(pc.cumMultiplierRaw < 50 && pc.hasCock() && rand(2) == 0 && changes < changeLimit) {
				kGAMECLASS.output("\n\nMuscles in your abdomen lock and release, rhythmically clenching with the pulsing pleasure that’s running through your [pc.cocks], pushing more and more pre out each time. <b>You can force out even more ejaculate during orgasm!</b>");
				pc.cumMultiplierRaw += 2 + rand(3);
				pc.ballEfficiency++;
				changes++;
			}
			//Increase cum quality by 25%
			if(pc.cumQualityRaw < 2 && pc.hasCock() && rand(3) == 0 && changes < changeLimit) {
				kGAMECLASS.output("\n\nAs heavy as loins are feeling right now, you’re not sure you could drag yourself anywhere, but at the same time, your body is demanding you get up and stuff yourself inside the closest pussy - not just any pussy either: the wettest, most fertile twat you can find. You find yourself fantasizing about dozens of round-bellied women riding you one after the other, all carrying your offspring, when you become aware of that heavy feeling settling in your [pc.balls]. There’s no doubt about it; <b>you’ve gotten more virile.</b>");
				pc.cumQualityRaw += .25;
				changes++;
			}
			//Increase refractory rate!
			if(pc.refractoryRate < 100 && pc.hasCock() && changes < changeLimit) {
				kGAMECLASS.output("\n\nEven though you’re practically dripping liquid from your crotch, you feel like you’re never going to run out. Your body is producing it more than fast enough, and if the growing tightness in your [pc.balls] is any indication, <b>you’re producing [pc.cum] even faster than before, allowing you to refill more quickly between orgasms.</b>");
				changes++;
				pc.refractoryRate++;
			}
			//Grow a penis from nothing!
			if(pc.createCockUnlocked() && !pc.hasCock() && changes < changeLimit) 
			{
				kGAMECLASS.output("\n\nA swollen lump of flesh appears ");
				if(pc.hasVagina()) kGAMECLASS.output("right above your [pc.vaginas]");
				else kGAMECLASS.output("in the center of your crotch");
				kGAMECLASS.output(". It feels achy and a little painful but very very sensitive, and it’s getting bigger with alarming ridity. The little knot is sticking an inch out past your [pc.skinFurScales], turning glossy and red as it does. You touch its tip and moan, assaulted by pleasure you barely understand, watching the bulge stretch out another inch in eager response. In seconds, you’re rubbing and fondling it, coaxing more and more length from your crotch until ");
				pc.createCock();
				pc.setNewCockValues(arg);
				
				kGAMECLASS.output("<b>your hand is wrapped around a " + num2Text(Math.round(pc.cocks[arg].cLengthRaw*10)/10) + "-inch long, twitching [pc.cockNounSimple " + arg + "].</b>");
				changes++;
			}
			else if (!pc.createCockUnlocked())
			{
				kGAMECLASS.output(pc.createCockLockedMessage());
			}
			trace("LIBIDO: " + pc.libido() + " COCK LENGTH: " + pc.biggestCockLength() + " BALLS: " + pc.balls + " BALL SIZE: " + pc.ballSize);
			//Bad end: Occurs if libido hits 100 and cock is bigger than 30" long and balls are at least 10"
			if(pc.libido() >= 100 && pc.biggestCockLength() >= 30 && pc.balls > 0 && pc.ballDiameter() >= 10 && pc.taint() > 50)
			{
				kGAMECLASS.output("\n\nEven after the transformation ends, you just can’t stop yourself....");
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0,"Next",throbbBadEnd);
				return true;
			}
			else
			{
				//Wear off
				kGAMECLASS.output("\n\nThe artificial heat and longing that filled you and put you into such a state fade, but the arousal and need remain. <b>You should probably go blow off some steam....</b>\n\n");
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
				return false;
			}
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
		public function throbbBadEnd():void
		{
			var pc:Creature = kGAMECLASS.chars["PC"];
			
			kGAMECLASS.clearOutput();
			kGAMECLASS.output("You masturbate on the spot, rubbing your [pc.cockBiggest] again and again while thick rivulets of [pc.cum] spill out of your distended [pc.cockHeadBiggest]. Even though you aren’t orgasming, your swollen sack has become so productive that your pre-cum has been replaced by the real deal. You heft and squeeze " + (pc.balls > 1 ? "one" : "your") + " testicle. The tightness against the sloshing orb is enough to make your length bloat and lurch, throwing a thick rope at least three meters into the air before it splatters down across your face.");
			kGAMECLASS.output("\n\nThe sensation of ejaculation is too irresistible not to indulge. You run your hands up and down your drooling shaft to coax out another lurid deluge, letting loose a low moan when your member immediately and voluminously responds with spontaneous orgasm, pumping out a glob of [pc.cumNoun] bigger than your head. A second follows before the first hits the ground. Your fourth shot is weaker; it mostly resembles one of those fountains that shoots laminar stream of water up to cascade back over itself. The feeling of being slicked in your own steaming hot [pc.cumNoun] mid-orgasm nearly makes you pass out from raw pleasure.");
			kGAMECLASS.output("\n\nYou lose yourself in the growing [pc.cumColor] lake, rolling your [pc.hips] with each muscle-clenching burst of ecstasy, letting your hands slide and stream wherever their lusty whims carry them. The lust hammering through every fiber of your being demands no less, and you couldn’t resist if you wanted to. It’s too damn strong. Your [pc.cockBiggest] is a pillar of pleasure that may as well be magnetically bound to your palms, because the only way you’re going stop touching yourself is if your life depends on it.");
			kGAMECLASS.output("\n\nPanting as you finish draining your [pc.balls], you try to remember what you were up to before you fell into another drug-fueled fap session. You were exploring or something, but everything was so sexy. Just thinking about some of the aliens you’ve encountered has your flagging phallus pumping up beautifully. Damn if you think about one more juicy, pliant pussy or pillowy bosom, you’re going to have to... ahhh, fuck it. You grab hold of yourself and start jacking off again. You’ll figure it out after another cum.");
			kGAMECLASS.output("\n\nOf course, you don’t. You wind up blowing a load all over your face and wondering why anyone would complain about it, and then you start thinking about coating other people’s faces with your [pc.cum]. Then, you’re right back where you started, letting yourself sink into another self-indulgent rut.");
			kGAMECLASS.output("\n\nAfter a few dozen cyclic attempts to resume normal life, you give up. It’s better to just wrap your hands around your cock and give in to the feelings it provides....");
			
			kGAMECLASS.processTime(60 + rand(30));
			
			pc.removeAll();
			for(var i:int = 0; i < 12; i++)
			{
				pc.ballEfficiency += 3 + rand(6);
				pc.cumMultiplierRaw += 2 + rand(3);
				pc.cumQualityRaw += 0.25;
				pc.refractoryRate++;
				if(pc.ballFullness < 100) pc.ballFullness = 100;
				
				pc.orgasm();
				if(rand(6) == 0) pc.orgasm();
				
				pc.applyCumSoaked();
			}
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",throbbBadEndPartDues);
		}
		public function throbbBadEndPartDues():void
		{
			kGAMECLASS.currentLocation = "GAME OVER";
			kGAMECLASS.generateMap();
			kGAMECLASS.showLocationName();
			
			kGAMECLASS.clearOutput();
			//[Next]
			kGAMECLASS.output("At some point, you realized that your dreams of following in your Dad’s footsteps had died. There was no way you were going to be able to focus long enough to find the probes he left scattered around the universe. You made the best of a rough situation, though, by managing to set up an online holo-show.");
			kGAMECLASS.output("\n\nOne of your fans was even nice enough to cart you off to a studio with drains and proper recording equipment. You let them worry about the money, of course. It’s too much work to keep up with all that garbage when you could be using your time to queue up a hot new porno.");
			
			kGAMECLASS.days += 30 + rand(6);
			kGAMECLASS.hours = rand(24);
			kGAMECLASS.processTime(rand(60));
			
			kGAMECLASS.badEnd("GAME OVER - You have overdosed on Throbb.");
		}
	}
}
