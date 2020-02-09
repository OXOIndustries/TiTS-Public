package classes.Items.Transformatives {
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	
	public class SpunkShroom extends ItemSlotClass {
		public function SpunkShroom() {
			this._latestVersion = 1;
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			
			this.shortName = "Spunkshrm";
			this.longName = "spunkshroom";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a droopy-looking spunkshroom";
			
			this.tooltip = "This mushroom has a huge droopy cap that reminds you vaguely of a primitive dwelling you’ve seen in the past. According to rumor on the extranet, it ought to make your emissions more voluminous and potentially more virile per ounce than ever before. It also might poison you, so there’s that.\n\n<b>Known to cause high amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 1000;
			
			this.version = this._latestVersion;
		}
		//Slutshroom Menu

		//Alt Tarkus: - Slutshrooms (+moderate libido, moderate fertility, +wet if fertile enough) ? 
		//smallish, pink-colored mushroom

		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean {
			clearOutput();
			if(kGAMECLASS.silly) author("Squirtnoxo");
			else author("Fenoxo");
			if ((target is PlayerCharacter)) {
				var pc:Creature = target;
				var i:int = 0;

				//Consume one
				output("You pop the mushroom into your mouth and wince at the flavor. It’s like chewing on salt-dusted rust. You chomp a few times to break it into smaller pieces, then swallow the whole mess down before you have to taste it any longer. Ugh! The taste won’t quite leave your mouth...");
				//Poison
				if(rand(8) == 0 || !pc.hasCock() || pc.ballSize() <= 0)
				{
					output("\n\nIt takes less than a minute for you to double over from the stabbing pain in your gut. Your stomach ties itself in knots while you drop to the ground and double over. An involuntary spasm squeezes your middle like a toothpaste tube, and everything you’ve eaten in the past few hours comes up in a wave of burning pain - including the mushroom.");
					output("\n\nThat <b>hurt</b>! (-" + (Math.round(pc.HPMax()* 0.5)+1) + ")");
					pc.changeHP(-1*(Math.round(pc.HPMax()* 0.5)+1));
					return false;
				}
				pc.taint(5);
				//Cum quality:
				if(pc.cumQualityRaw < 6 && pc.libido() >= 35 && pc.maxCum() >= 800 && rand(4) == 0)
				{
					if(pc.cumQualityRaw < 2)
					{
						output("\n\nA warm glow radiates from your [pc.belly] down to your loins. That’s it?!");
					}
					//Sub 2-3
					else if(pc.cumQualityRaw < 3) output("\n\nA twinge in your loins is the only reaction your body gives to the exotic fungus. Maybe you ought to fuck somebody, just to see if anything changed...");
					//Sub 3-4
					else if(pc.cumQualityRaw < 4)
					{
						output("\n\nA sharp pain in your ");
						if(pc.balls > 0) output("[pc.balls]");
						else output("body");
						output(" is your only reaction to the strange fungus, and even that fades a second later, leaving you feeling oddly flushed and a little turned on.");
						//Small lust gain.
						pc.changeLust(5);
					}
					//4-5
					else if(pc.cumQualityRaw < 5)
					{
						output("\n\nYour ");
						if(pc.balls > 0) 
						{
							output("[pc.balls] seem");
							if(pc.balls == 1) output("s");
						}
						else 
						{
							output("[pc.cocks] seem");
							if(pc.cockTotal() == 1) output("s");
						}
						output(" to glow with with warmth as changes deep inside, the cells rearranging into a more insemination-friendly pattern.");
					}
					//5-6
					else 
					{
						output("\n\nYou gasp as an invisible hand reaches inside your ");
						if(pc.balls <= 0) output("body");
						else output("[pc.sack]");
						output(" and squeezes. You double over in pain, but the sensation vanishes just as quickly as it came on, leaving you with a bad taste in your mouth and a bizarre urge to empty your load into the first cunt you can fall into.");
						pc.slowStatGain("libido",5);
					}
					pc.cumQualityRaw += 1;
				}
				else
				{
					//Rapidly raise cumQ to 10k - include libido gains with.
					var maxCum:Number = pc.maxCum();
					//maxCum < 100 -> 150
					if(maxCum < 100)
					{
						output("\n\nAfter a brief, warning rumble, you hiccup. Oddly, ");
						if(!pc.isErect()) output("you got sort of hard at the same.");
						else output("you got even harder at the same time");
						output(". Another hiccup hits before you can take stock of the situation, and your ");
						if(!pc.isErect()) output("budding ");
						output("boner");
						if(pc.cockTotal() > 1) output("s grow");
						else output(" grows");
						output(" stiffer. You shake your head as spasm after involuntary spasm assaults you, leaving your hornier and harder each time. Just when you feel like you could cum at any moment, the gastric seizures finally cease.");
						output("\n\n...And now you’re standing there with the biggest, hardest erection");
						if(pc.cockTotal() > 1) output("s");
						output(". A puddle of pre-cum has formed ");
						if(pc.legCount > 1) output("between your [pc.legs]");
						else output("in front of your [pc.leg]");
						output(". At least the spunkshroom did <i>something</i>.");
						//Max lust!
						pc.changeLust(pc.lustMax());
						i = 0;
						while(pc.maxCum(true) < 150 && i < 800)
						{
							pc.boostCum(2);
							i++;
						}
					}
					//MaxCum < 400 -> 500
					else if(maxCum < 400)
					{
						output("\n\nYou burp, and ");
						if(!kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.INDOOR)) output("the horizon");
						else output("the wall");
						output(" wobbles for a second. Weird. When it happened, you swear one of the distortions looked sort of like a breast - a big one too, with a nice, puffy nipple hardened by lust. It looked nice enough that you realize you’");
						if(pc.isErect())
						{
							output("re packing ");
							if(pc.cockTotal() == 1) output("an ");
							output("even harder woodie");
							if(pc.cockTotal() > 1) output("s");
						}
						else
						{
							output("ve grown an absolutely enormous ");
							if(pc.cockTotal() > 1) output("set of ");
							output("erection");
							if(pc.cockTotal() > 1) output("s");
						}
						output(", and your hand has found its way down to squeeze ");
						if(pc.cockTotal() == 1) output("it");
						else output("one");
						output(". Huh.");

						output("\n\nAnother burp hits you, making your hand jerk, squeezing out a rope of pre-cum thick enough to fill a shot glass.");
						if(!pc.isCrotchExposed()) output(" You should probably do something to stop yourself from creaming straight into your clothes,");
						else output(" You should probably stop or something,");
						output(" but your vision is all twirly and swirly. You’re seeing tits and bent-over asses in everything, the world itself displaying a visual feast for your pumping hand. Pre issues forth with every pump");
						if(pc.balls > 1) output(", but your balls feel like they’re getting even heavier");
						else if(pc.balls == 1) output(", but your ball feels like it’s even heavier.");
						else output(", but you feel more pent-up than ever");
						output(". It splatters out in progressively lewder cascades.");

						output("\n\nFlecks of your effervescent cream foam around your fingers from the speed of your strokes, falling across ");
						if(kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.INDOOR)) output("a floor");
						else output("a spot on the ground");
						output(" that seems more upraised ass than surface to stand upon. You nearly struggle to stay upright as you peak and release thunderous bolts of sperm into the sea of infinite possibilities. An endless variety of woman are there, spreading the lips of their very fertile pussies for you to fire into.");
						output("\n\nThat or you just jacked off");
						if(!pc.isCrotchExposed()) output(" into you [pc.crotchCover]");
						output(" after having some strange mycological hallucinations. Still, you managed to produce enough [pc.cum] to fill a glass or two - upwards of a half liter for sure!");
						//Orgasm
						pc.orgasm();
						i = 0;
						while(pc.maxCum(true) < 500 && i < 800)
						{
							pc.boostCum(4);
							i++;
						}
					}
					//MaxCum < 1000 -> 1100
					else if(maxCum < 1000)
					{
						output("\n\nYour [pc.cocks] twitch");
						if(pc.cockTotal() == 1) 
						{
							output("es and ");
							if(!pc.isErect()) output("hardens");
							else output("throbs");
						}
						else
						{
							output(" and ");
							if(!pc.isErect()) output("harden");
							else output("throb");
						}
						if(!pc.isCrotchExposed()) output(" inside your [pc.crotchCovers]");
						output(". It happens entirely on its own, no sexualized thoughts necessary. Everything down there feels warm and hot and tight, and then you’re <i>drooling</i> [pc.cumNoun] - not climaxing, just leaking seed like there’s too much for your body to hold.");
						if(!pc.isCrotchExposed()) output(" It makes a real mess of your clothes, sealing them against your [pc.skinNoun] like spunky glue.");
						output(" The exotic, almost-ejaculatory feeling is arousing in its own way. You breathe harder and reach down, intending to milk out the rest, when the flow stops, leaving your ");
						if(pc.balls > 0) output("[pc.balls] feeling heavy.");
						else output("body feeling a bit backed up and ready to go.");
						//Gib blue balls status!
						pc.changeLust(10);
						pc.applyBlueBalls();
						i = 0;
						while(pc.maxCum(true) < 1100 && i < 800)
						{
							pc.boostCum(4);
							i++;
						}
					}
					//MaxCum < 1100 -> 2000
					//Temporary paralysis and priaprism
					else if(maxCum < 1100)
					{
						output("\n\nYour [pc.legs] feel");
						if(pc.legCount == 1) output("s");
						output(" a little weak, so you sit down before these mysterious mushrooms hit you with any unwelcome side-effects. Good thing too, as you find it harder and harder to move. Your body rolls onto its side, and there’s nothing you can do to stop it. Trying to push yourself up, you barely manage to make your fingers twitch.");
						output("\n\nThen the arousal hits.");
						output("\n\n");
						if(pc.lust() >= 80) 
						{
							output("Sure, you were already ");
							if(pc.isBimbo()) output("like, ");
							output("super horny, but this is beyond reason. ");
						}
						output("It feels like for every motor nerve that shuts down, a touch-sensitive one in your [pc.cocks] lights up.");
						if(!pc.isErect()) output(" You’re hard in record time.");
						output(" [pc.EachCock] <i>aches</i> for stimulation. ");
						if(pc.cockTotal() == 1) output("It");
						else output("They");
						output(" throb");
						if(pc.cockTotal() == 1) output("s");
						output(" with rapacious desire, a burning, boiling need that can only be satisfied by the feeling of a dripping-wet girl sliding onto it.");
						output("\n\nA whimper escapes your paralyzed lips as pre-cum spills out of your [pc.cockHeads] like water from a faucet, sliming your crotch in proof of your own absurd virility. You blink your eyes, pleased that muscle still works, and find the insides of your eyelids filled with erotic imagery of every description, the only constant a sea of steaming, fertile cunts hovering just over the end");
						if(pc.cockTotal() > 1) output("s");
						output(" of your [pc.cocks].");
						output("\n\nYou know you’d cum the moment one of them took you inside, cum and knock her up in a single instant. You’d keep cumming long after, drowning her womb in liter after liter of [pc.cumColor] goo, bathing her passage with enough liquid passion to leave her with a litter of quintuplets. <i>The thoughts won’t stop.</i>");
						output("\n\nA glob of [pc.cumColor]-tinted pre-cum spurts");
						if(!pc.isCrotchExposed()) output(" into your [pc.crotchCovers]");
						else output(" into the air");
						output(", trailed by a seemingly endless river.");

						output("\n\nIn your mind, a new ass is sinking onto your sperm-and-cunt-covered crotch, but you’re ready for it. Your [pc.balls] ");
						if(pc.balls <= 1) output("is");
						else output("are");
						output(" still full somehow, fuller than ever before. She’ll leave you with a pudgy belly and a slimy slit, contented and pregnant from mere contact with your pre-cum. You could probably knock her up from kissing her, to say nothing of what your spunkshroom-tainted sperm will do to her ovaries. She’ll probably let loose every egg at once when you cum.");
						output("\n\nHuge pulses of pre-cum pour out of you in waves as you’re subjected to increasingly insemination-focused fantasies. It soaks your [pc.skinNoun] and fills your nose with the scent of your own need, yet you can nothing. The paralysis holds you still as stress and excitement war over your <i>cum-bloated</i> cock");
						if(pc.cockTotal() > 1) output("s");
						output(", bobbing and bulging with unspent need.");
						output("\n\nIt’s a mercy when you black out after the tenth imaginary cum-shot.");

						pc.changeLust(pc.lustMax());
						i = 0;
						while(pc.maxCum(true) < 2000 && i < 800)
						{
							pc.boostCum(4);
							i++;
						}
						//Max lust. Give blue balls.
						pc.applyBlueBalls();
						clearMenu();
						addButton(0,"Next",blueBallsEpilogue,pc);
						return true;
					}
					//sub 10k, repeatable. Same gain rate as previous.
					else if(maxCum < 10000)
					{
						//Instant blueballs, instant orgasm
						//Nothard
						if(!pc.isErect())
						{
							output("\n\nYour whole body flushes as you abruptly become completely and totally hard. One second, you’re final. The next, your cock");
							if(pc.cockTotal() > 1) output("s are");
							else output(" is");
							output(" inflating like ");
							if(pc.cockTotal() == 1) output("a balloon");
							else output("balloons");
							output(" hooked up to a high pressure pump.");
						}
						//Hard
						else
						{
							output("\n\nYou may have already been hard, but your whole body flushes nonetheless as your [pc.cocks] fill");
							if(pc.cockTotal() == 1) output("s");
							output(" to immobility. ");
							if(pc.cockTotal() == 1) output("It’s");
							else output("They’re");
							output(" basically iron bar");
							if(pc.cockTotal() > 1) output("s");
							output(" at this point.");
						}
						//No new PG
						if(pc.cockTotal() == 1) output(" It quivers");
						else output(" They quiver");
						output(" once, accompanying by a wrenching, urgent contraction from deep inside you, and you’re cumming. Gallons of sparkling [pc.cumGem] vent from your too-pressurized ");
						if(pc.balls > 1) output("balls");
						else if(pc.balls > 0) output("ball");
						else output("prostate");
						output(" in the span of a dozen seconds.");
						if(!pc.isCrotchExposed()) output(" It floods your [pc.crotchCover] in an instant.");
						else output(" It slaps into the floor hard enough to kick up waves a for few feet in all directions.");
						output(" There’s no containing the excessive ejaculations. <i>It gets everywhere.</i>");

						//Low lib:
						if(pc.libido() < 33)
						{
							output("\n\nYou try to mitigate the mess as best you can, but it’s all for naught. [pc.CumNoun] saturates <i>everything</i>, and you might as well be trying to clean up a flash flood with a broken squeegee. After a few moments wasted trying to wrangle your spurting cock");
							if(pc.cockTotal() > 1) output("s");
							output(", you give into the pleasure at last, letting your needs dictate your hands’ motions along your cum-slick shaft.");
						}
						//Med lib:
						else if(pc.libido() < 66)
						{
							output("\n\nYou make the briefest attempt to contain the mess, but it’s pointless. [pc.cumNoun] is everywhere, squirting into every crack and crevice, rocketing out of you in potent declarations of just how good it feels to indulge your basest urges. Grabbing hold, you pump ");
							if(pc.cockTotal() > 1) output("a");
							else output("the");
							output(" [pc.cumNoun]-slicked shaft in libidinous abandon. Better to have the best, hottest orgasm possible if giving the whole world a one-[pc.manWoman] bukkake session is an inevitability.");
						}
						//Lib:
						else
						{
							output("\n\nYou embrace the depraved climax by grabbing hold of [pc.oneCock] and fervently jacking it, squeezing it from base to tip to wring out fattened drops of [pc.cumVisc] release into the deepening lake. Who cares if you make a mess? You milk out as much [pc.cumNoun] as possible, just to prolong your orgasm and attempt some measure of the mushroom’s effect on your virility.");
						}
						//Merge
						output("\n\nThat had to be at least a dozen liters if not more, judging by the [pc.cum] everywhere - including on you.");
						//Applycumsoak
						pc.applyCumSoaked();
						pc.orgasm();
						pc.boostCum(8);
					}
					//25k+ repeatable
					else if(maxCum < 25000)
					{
						output("\n\n[pc.Cum] leaks out of your [pc.cocks] not thirty seconds later. It starts as a dribbly trickle but transitions to a steady, strong stream in no time at all. You stare in disbelief ");
						if(!pc.isCrotchExposed()) output("at the growing wet patch");
						else output("at the puddle forming below");
						output(", amazed at just how much of the sinful substance you’re producing, all without cumming. A dozen terrans couldn’t keep up with you, and still, the [pc.cumColor] river continues, cascading down your [pc.thighs] and splattering to the ground.");
						output("\n\nFor a moment, you feel like a one-man fertility clinic, ready to fill upended pussy after upended pussy with potent loads. Then something inside you seals shut, and the flow ceases, leaving you feeling uncomfortably <i>full</i> and randy, ready to fuck the first ovulating slut you can get your hands on. You let out a few gallons, and your ");
						if(pc.balls > 1) output("[pc.balls] still feel blue enough to burst. You need release!");
						else output("libido is still raging like you haven’t gotten off in years. You need release!");
						//+33lust.
						pc.changeLust(33);
						//Apply blueballs / fillcum. :3	
						pc.applyBlueBalls();
						pc.boostCum(10);
					}
					//100k+ repeatable
					else
					{
						output("\n\n");
						if(pc.cockTotal() == 1) output("A single");
						else if(pc.cockTotal() == 2) output("Two");
						else if(pc.cockTotal() == 3) output("Three");
						else if(pc.cockTotal() == 4) output("Four");
						else if(pc.cockTotal() == 5) output("Five");
						else if(pc.cockTotal() == 6) output("Six");
						else if(pc.cockTotal() == 7) output("Seven");
						else if(pc.cockTotal() == 8) output("Eight");
						else output("Nine");
						output(" lance");
						if(pc.cockTotal() > 1) output("es");
						output(" of pressurized [pc.cumNoun] eject from your [pc.cocks] as your body’s ability to create seed skyrockets. However, you produce so much that it’s getting different to tell one room-flooding orgasm from another.");
						pc.boostCum(8);
					}

					//Libido gain portion!
					var baseLib:Number = pc.libidoRaw;
					pc.slowStatGain("libido",10);
					//Libido threshold passing
					//-> 20
					if(baseLib < 20 && pc.libidoRaw >= 20) output("\n\nThese mushrooms <b>are definitely affecting your libido</b>. It’s not too bad, though. You can handle it.");
					//>33
					else if(baseLib < 33 && pc.libidoRaw >= 33) output("\n\nBy any measure, <b>your libido is getting to a pretty respectable level</b>. Being turned on doesn’t take too long, and it isn’t greatly impacting your ability to focus.");
					//>50
					else if(baseLib < 50 && pc.libidoRaw >= 50) output("\n\n<b>Your libido is getting pretty strong.</b> You’ll have to take care of yourself more and more often if you keep indulging like this...");
					//66
					else if(baseLib < 66 && pc.libidoRaw >= 66) output("\n\nIt pains you to admit it, but <b>you feel kind of slutty.</b> So many things turn you on that it’s tough to wait a day between masturbation sessions.");
					//80
					else if(baseLib < 80 && pc.libidoRaw >= 80) output("\n\n<b>Your libido is so powerful as to be a constant, nagging distraction.</b> Every person you pass simply reinforces your surging sexual desires. The only way to keep from being horny all the time is frequent satiation.");
					//100
					else if(baseLib < 100 && pc.libidoRaw >= 100) output("\n\n<b>Your libido is overwhelmingly powerful.</b> A bared ankle is enough to start your motor, to say nothing of a properly displayed sexual organ.");
				}
			}
			else {	
				output(target.capitalA + target.short + " consumes the spunkshroom to no effect.");
			}
			return false;
		}
		public function blueBallsEpilogue(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("WAKING\nUP");
			output("You wake up soaked in [pc.cum] but somehow horny enough to breed a college full of kaithrit coeds. Residual soreness lingers in your muscles, but at least you’re able to move and ready to fuck. Universe look out! There’s a new and improved Steele on the prowl.");
			//orgasm, then +66 lust
			kGAMECLASS.processTime(10);
			pc.orgasm();
			pc.changeLust(+66);
			pc.applyCumSoaked();
			clearMenu();
			addButton(0,"Next",kGAMECLASS.mainGameMenu);
		}
	}
}