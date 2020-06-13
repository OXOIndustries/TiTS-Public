//By Skom
//Original impl. by Fenoxo.

/*
Flags
SOAK_TIMES_USED		how many times you've used Soak in your life
SOAK_USE_METHOD		last used; 1 = vaginally, 0 = orally
SOAK_OVERDOSE			overdose counter

* Note to coder: SOAK_OVERDOSE should be reset back to zero every time the Soak Overdose status effect ends. And I've recently realized that this flag can be replaced with a variable in the Soak Overdose status effect. Pick whatever works best.
*/
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
	import classes.Engine.Utility.getPlanetName;
	import classes.Engine.Utility.IncrementFlag;
	import classes.Engine.Map.InPublicSpace;
	import classes.Engine.Utility.num2Text;
	
	public class Soak extends ItemSlotClass {
		
		//constructor
		public function Soak() {
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 25;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Soak";
			//Regular name
			this.longName = "dose of Soak";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a dose of Soak";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This pink, candy-shaped pill is the illegal drug Soak. Colloquially called ‘the feminine counterpart of Throbb,’ Soak is known to dramatically enhance pussy lubrication, size and sensitivity, but it’s also highly addictive and can have permanent effects on the brain. Soak was originally created by Tamani Corp, but the company decided to shelve the project rather than face legal problems down the line.\n\n<b>Known to cause small to moderate amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 100;
			
			this.version = this._latestVersion;
		}
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		
		//METHOD ACTING!
		override public function useFunction(pc:Creature, usingCreature:Creature = null):Boolean 
		{
			var uses:Number = 0;
			if (pc is PlayerCharacter) 
			{
				if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];
				clearOutput();
				author("Skom");
				kGAMECLASS.showName("\nSOAK!");
				kGAMECLASS.showBust("SOAK");
				if(!CodexManager.entryViewed("Soak"))
				{
					//unlock codex entry
					output("You may not be an expert on the subject of drugs, but even you know that Soak is not the kind of thing you should take without being aware of the potential consequences. Maybe you should look it up on your Codex before trying.");
					CodexManager.unlockEntry("Soak");
					if(!kGAMECLASS.infiniteItems()) quantity++;
					return false;
				}
				else if(!pc.hasVagina()) 
				{
					output("You pick up the dose of Soak and gaze at it with fascination. If only you had a vagina, you could enjoy the thrill it promises, but, alas, this is not the case, so you store the pill back in its compartment.");
					if(!kGAMECLASS.infiniteItems()) quantity++;
					return false;
				}
				else if(uses < 1)
				{
					output("You pick up the Soak pill and eye with a mix of concern and anticipation. It’s nothing more than a small, pink, disk-shaped piece of candy, barely a centimeter in diameter - and rather non-suspect, for how dangerous the UGC claims it is.");
					output("\n\nAccording to most extranet guides you’ve checked, it should be inserted in the vagina for maximum effect, and considering how dry it feels to the touch, you don’t doubt that it would dissolve pretty quickly. But some guides said it can also be taken orally.");
				}
				else if(uses < 2)
				{
					output("You’ll probably never forget how it was the first time you took Soak: minutes after you ");
					if(kGAMECLASS.flags["SOAK_USE_METHOD"] == 1) output("slid the candy-like pill into your snatch");
					else output("swallowed the sweet pill");
					output(", you were ready like an Ausar in heat and drooling fem-lube like crazy! But still, you know it’s a dangerous thing. Should you take the drug and become a total slut for the next few hours, or should you just hide the candy and try your best to forget about it? ");
				}
				else if(uses < 3)
				{
					output("You pick up the dose of Soak, rolling it over in your fingers with hesitant excitement. It might just look like a tiny piece of candy, but you know it’s so much more... The ecstasy can take you to 7th heaven, but at what cost?");
				}
				else if(uses < 4) output("It’s just a tiny piece of candy, but it’s so potent. You know that if you take a dose of Soak, you’ll do <i>anything</i> to feel full. And you doubt your fingers will be enough. Still, the temptation of mindless, slutty euphoria is undeniable, and by this point, you’re not sure you can muster the willpower to resist.");
				else if(uses < 5)
				{
					output("You hold the dose of Soak in your hand, but you know it won’t be there for much longer. It’s taking quite a bit of willpower to keep from " + (kGAMECLASS.flags["SOAK_USE_METHOD"] == 1 ? "sliding it into your pussy, along with a few fingers.":"popping it into your mouth.") + " Just by having it on your fingertips, you know that it’d be a true feat of willpower to be able to put it away.");
					output("\n\nLooking at it just sitting there... it almost hurts. The dainty little candy feels heavy in your hand. And your pussy feels so tight! But, despite how much discomfort it causes you, you almost savor your current state. It’s because you know that in a minute you’ll be fingering yourself in bliss, drool spilling out of the corners of your mouth as your jaw hangs loose in pleasure.");
					output("\n\nYou want it, you need it, and you <i>have</i> it.");
				}
				else 
				{ 
					output("You pick up the dose of Soak all too eagerly, and you immediately know there’s no going back. No way you’d be able to muster the will to put it down. There is no hesitation, no worry, no fear - just giddy anticipation of how slutty you will a few minutes from now.");
					output("\n\nWell, it’s now or never! You have only one choice to make.");
				}
				output("\n\n");
				//BUTTONS: <Vaginal> <Oral> <Put Away>
				//* Don't create the Put Away button if SOAK_TIMES_USED >= 5.
				clearMenu();
				if(uses < 5) addButton(2,"Put Away",putAwayDatSoak,pc);
				else addDisabledButton(2,"Put Away","Put Away","No way are you putting it away now. You’re going to take it!");
				addButton(0,"Vaginal",putDatSoakInYerPuss,pc);
				addButton(1,"Oral",putDatSoakInYerMouf,pc);
				return true;
			}
			else
			{
				kGAMECLASS.output(pc.capitalA + pc.short + " uses the substance to no effect.");
			}
			return false;
		}

		//Button: Put Away
		public function putAwayDatSoak(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("GOOD\nCHOICE");
			author("Skom");
			var uses:Number = 0;
			if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];
			output("Good sense wins out in the end, and you manage to put away the dose of Soak. A sigh of ");
			if(uses >= 1) output("both relief and yearning regret escapes your lips, but you know it’s for the best.");
			else output("pure, clear-headed relief escapes your lips.");
			output(" Maybe you should sell the drug or get rid of it somehow, this way you’ll not be so easily tempted anymore.");
			if(kGAMECLASS.mitziIsCrew()) output(" Maybe Mitzi would like it as a gift? It probably can’t make her <i>more</i> slutty than she already is...");
			output("\n\n");
			if (!kGAMECLASS.infiniteItems()) kGAMECLASS.itemCollect([new Soak()]);
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
			// recreate Soak in inventory
			// back to item menu
		}

		//Button: Vaginal
		public function putDatSoakInYerPuss(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nSOAK");
			kGAMECLASS.showBust("SOAK");
			author("Skom");
			var uses:Number = 0;
			if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];
			output("You ");
			if(!pc.isCrotchExposed()) output(" quickly pull open your [pc.crotchCovers] and ");
			output("press the candy against the slit of [pc.oneVagina], slowly sliding it in with a finger. It goes inside quite easily, but the pill leaves a trail of warm, needy itch where it rubs your canal. The sensation is so pervasive that you can’t resist fingering yourself a little - which only helps the Soak to spread and dissolve quicker.");
			output("\n\nYou could masturbate here and now, but that would be kind of a waste, since the real rush hasn’t even started yet. Therefore, you decide to hold out for now, giving the drug time to really act on your system and build up one of those mind-shattering orgasms!");
			// set flag SOAK_USE_METHOD = 1; (vaginal)
			kGAMECLASS.flags["SOAK_USE_METHOD"] = 1;
			// set flag SOAK_TIMES_USED += 1;
			IncrementFlag("SOAK_TIMES_USED");
			// if does not have the Soak status effect, create a Next button that goes to Normal Scene
			if(!pc.hasStatusEffect("Soak"))
			{
				clearMenu();
				addButton(0,"Next",soakEffectsSceneWheee,pc);
			}
			// else, if already has the Soak status effect, set flag SOAK_OVERDOSE += 1;
			else
			{
				IncrementFlag("SOAK_OVERDOSE");
				if(kGAMECLASS.flags["SOAK_OVERDOSE"] >= 2)
				{
					if(rand(100) < Math.max( 10, (30*kGAMECLASS.flags["SOAK_OVERDOSE"]) - pc.willpowerRaw) )
					{
						clearMenu();
						addButton(0,"Next",badEndForSoakyBoisByAltair,pc);
						return;
					}
				}
				//No bad end?, create a Next button that goes to the Overdose Scene		
				clearMenu();
				addButton(0,"Next",soakOverdose,pc);
			}
		}


		//Button: Oral
		public function putDatSoakInYerMouf(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nSOAK");
			kGAMECLASS.showBust("SOAK");
			author("Skom");
			var uses:Number = 0;
			if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];

			output("You pop the candy and roll it around your [pc.tongue], savoring the unique piquancy. There’s a myriad of chemical flavors you can’t even begin to recognize, all barely disguised under a mild, sugary layer. Still, the thing is tasty in its own right, and it dissolves very quickly. Barely a minute after you finish, you notice that your mouth is salivating <i>way</i> more than usual.");
			output("\n\nYou’ve read about this on the extranet, but it’s different to experience it firsthand. Not only is your mouth wet, your tongue is feeling all tingly and sensitive, almost like it has become an erogenous zone in its own right. You can’t help but wonder how it would feel circling the head of a juicy cock, licking the slit clean of precum. <i>Hmm, so hungry...</i>");
			// set flag SOAK_USE_METHOD = 0; (oral)
			kGAMECLASS.flags["SOAK_USE_METHOD"] = 0;
			// set flag SOAK_TIMES_USED += 1;
			IncrementFlag("SOAK_TIMES_USED");
			// if does not have the Soak status effect, create a Next button that goes to Normal Scene
			if(!pc.hasStatusEffect("Soak"))
			{
				clearMenu();
				addButton(0,"Next",soakEffectsSceneWheee,pc);
			}
			// else, if already has the Soak status effect, set flag SOAK_OVERDOSE += 1;
			else
			{
				IncrementFlag("SOAK_OVERDOSE");
				// then if SOAK_OVERDOSE >= 2, check for bad end (conditions are in the Bad End Scene)
				if(kGAMECLASS.flags["SOAK_OVERDOSE"] >= 2)
				{
					// if bad end triggers, create a Next button that goes to the Bad End Scene
					if(rand(100) < Math.max( 10, (30*kGAMECLASS.flags["SOAK_OVERDOSE"]) - pc.willpowerRaw) )
					{
						clearMenu();
						addButton(0,"Next",badEndForSoakyBoisByAltair,pc);
						return;
					}
				}
				// else, create a Next button that goes to the Overdose Scene
				clearMenu();
				addButton(0,"Next",soakOverdose,pc);
			}
		}

		//Normal Scene
		public function soakEffectsSceneWheee(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nSOAK");
			kGAMECLASS.showBust("SOAK");
			author("Skom");
			var uses:Number = 0;
			if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];
			var x:int = pc.driestVaginaIndex();

			output("As the minutes pass by, you feel your nethers getting wetter and wetter, going way past your normal point of readiness. [pc.EachVagina] is drooling like crazy");
			if(!pc.isCrotchExposed()) output(" and thoroughly drenching your [pc.crotchCoverUnder] with your fem lube - perfect for shoving in a partner’s mouth before straddling their cock!");
			else output(" and causing a constant flow of your fem lube to thoroughly coat your thighs and trickle down your [pc.legOrLegs], leaving a sexy trail for potential partners to follow.");
			output("\n\nAs the drug’s name suggests, Soak really is making you as wet as a Galotian ultraporn actress. But, far from being uncomfortable, it feels great! It’s like a lowkey mini-orgasm that just never ends, and even though ordinary people might have felt embarrassed by the sheer amount of fluid that is leaking, you find that you couldn’t care less. Your mouth is also salivating like crazy, but you don’t mind, because, like, it helps to suck cock!");
			output("\n\nWhatever Soak is doing to your brain ");
			if(pc.PQ() >= 40) output("- that is, probably making it swim in ridiculous doses of dopamine and other endorphins - ");
			output("it’s awesome! Right now, you’re surfing on a wave of euphoria that makes the rest of your life pale in comparison, and the knowledge that the effects will eventually wear off causes a sudden sense of foreboding. You wonder if you’ll ever be able to live without Soak. But this worry too is soon forgotten, replaced by some dirty fantasy.");
			applySoak(pc,8*60);
			kGAMECLASS.processTime(1);
			pc.changeLust(5);
			clearMenu();
			addButton(0,"Next",soakEffectsSceneWheee2,pc);
		}
		public function soakEffectsSceneWheee2(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nSOAK");
			kGAMECLASS.showBust("SOAK");
			author("Skom");
			var uses:Number = 0;
			if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];
			var x:int = pc.driestVaginaIndex();
			
			output("Over the next few minutes, you feel a growing heat in your [pc.vaginas], accompanied by a tingly need that starts inside but quickly spreads to the labia and [pc.clits]. Meanwhile, more and more naugthy thoughts assault your mind - mostly fantasies of riding a huge, textured dildo, or spreading your " + (pc.legCount == 1 ? "self":"[pc.legsNoun]") + " to take a delicious monster cock, but for some reason these simple images cause your [pc.vaginas] to burn with need, and your thoroughly lubricated walls to rub together of their own accord. It’s almost as if they’re complaining about being so damn empty!" + (pc.hasCock() ? " [pc.EachCock] hardens in sympathetic need, aggravating your delicious predicament.":""));
			if(InPublicSpace(pc))
			{
				output("\n\nThe strange looks you’ve been getting from the inhabitants of " + getPlanetName() + " for the past few minutes give you cause to become self-conscious. Have they noticed just how randy you are? Perhaps they can smell the scent of your [pc.girlCumFlavor] fem-lube as it leaks out of your [pc.vaginas]?" + (pc.exhibitionism() < 66 ? " A blush comes to your [pc.face], and you try not to meet the passersby’s eyes as you continue on your way.":" You sincerely hope they can! With a confident stride, you continue on your way, [pc.hips] swaying hypnotically."));
				pc.exhibitionism(2);
			}
			if(!pc.isCrotchExposed()) 
			{ 
				output("\n\nEvery movement of your [pc.legOrLegs] causes the wet lips of your [pc.vaginas] to rub against the fabric of your [pc.crotchCoverUnder] in the most <i>sensuous</i> way - the mere act of walking has become a form of stimulation with your enhanced sensitivity. However, after a few moments, it starts to get a bit... more, as if your gear has suddenly gotten tighter, more restrictive.");
			}
			else output("\n\nEvery movement of your [pc.legOrLegs] causes even more fluid to leak down your thighs, and the wet lips of your [pc.vaginas] to rub together in the most <i>sensuous</i> way - the mere act of walking has become a form of stimulation with your enhanced sensitivity. However, after a few moments, it starts to get a bit... more.");
			if(uses >= 1) output("\n\n<i>Oh, the growth must have started!</i>");
			else output("\n\nCurious to find out exactly what’s going on, you " + (!pc.isCrotchExposed() ? "remove any coverings and ":"take off your [pc.crotchCovers] and ") + " glance down.");
			if(pc.hasCock()) output(" Setting the Codex to mirror mode and pulling up your cock, your suspicions are confirmed, prompting an excited giggle.");
			else output(" After a quick glance, your suspicions are confirmed, prompting an excited giggle.");
			kGAMECLASS.processTime(2);
			pc.changeLust(5);
			clearMenu();
			addButton(0,"Next",soakEffectsSceneWheee3,pc);
		}
		public function soakEffectsSceneWheee3(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nSOAK");
			kGAMECLASS.showBust("SOAK");
			author("Skom")
			var uses:Number = 0;
			if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];
			var x:int = pc.driestVaginaIndex();
			if(InPublicSpace(pc)) 
			{
				output("Suddenly, you remember that you’re in a public space " + (pc.exhibitionism() < 66 ? "and give everyone around a sheepish look":"and give a polite curtsey to your audience") + ", then go about finding a more secluded place, like a toilet or an alleyway, if only to prevent legal complications and prudish conservatives. Come what may, it’s just a matter of time before any lingering worries are washed away by the slutty haze that Soak is inflicting upon you.\n\n");
				pc.exhibitionism(2);
			}	
			output("To your utter delight, [pc.eachVagina] has swollen up quite noticeably, " + (pc.hasVaginas() ? "their":"its") + " lips juicy and puffed up in a mouthwatering invitation for a tongue or cock. You run a couple of fingers ever so softly over the labia, which sends a shiver of ecstasy running through your whole groin.");
			if(pc.hasCock()) output(" Your [pc.cocks] tremble" + (!pc.hasCocks() ? "s":"") + " with neglected excitement, already drooling precum without being even touched. Too bad for " + (!pc.hasCocks() ? "it":"them") + ", but you have other priorities right now!");
			output("\n\nPleasurable as it is, you notice the change isn’t complete yet: your [pc.clits] " + (pc.totalClits() ? "is":"are") + " still engorging, getting larger and puffier by the second before your very eyes! The change is accompanied by a sensation of tingly need that spreads through the whole exterior" + (pc.hasVaginas() ? "s":"") + " of your [pc.vaginas], begging to be touched and filled.");
			output("\n\nEven if you wanted to resist, this takes you far past the limit of your willpower, and you bring a hand down to gently massage your [pc.clits], encouraging even more growth. " + (pc.totalClits() == 1 ? "It":"Each of them") + " must have swollen almost half an inch larger by now. The touch causes you to tremble with ecstasy, your legs weakening momentarily. As soon as you recover, your other hand moves of its own accord to the slit of your [pc.vagina " + x + "], introducing a finger all the way in with needy haste, knuckles pressing against your swollen pussylips in a very gratifying manner.");
			output("\n\nThis new sensation is too much, and you immediately freeze in an attempt not to cum. The slightest stimulus could set off your orgasm, but you want to save it for the <i>real</i> thing. First, you release your [pc.clits], then you carefully pull the finger out of your [pc.vagina " + x + "], trying your darndest not to think of cock (and failing). Still, you manage to stave off the impending climax.");
			kGAMECLASS.processTime(2);
			pc.changeLust(5);
			clearMenu();
			addButton(0,"Next",soakEffectsSceneWheee4,pc);
		}
		public function soakEffectsSceneWheee4(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nSOAK");
			kGAMECLASS.showBust("SOAK");
			author("Skom")
			var uses:Number = 0;
			if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];
			var x:int = pc.driestVaginaIndex();
			output("After a minute of patient waiting, you deem it safe to tease yourself some more, running a few fingers over your [pc.vaginaNoun " + x + "] and [pc.clits] as you picture a huge cock dragging its meaty length all over your swollen pussylips. Your other hand goes to your [pc.breasts] this time, fondling and groping them with hedonistic abandon, occasionally pinching your [pc.nipples].");
			output("\n\nThis time, however, you indulge yourself unhurriedly, fingers playing in a languid, almost lazy way, even though your heart is pumping <i>fast</i> from the rush. You drag it out as much as possible, until you are almost on the verge of cumming, only to stop and wait for your [pc.vaginas] to calm down. Rinse, repeat.");
			output("\n\nEach time, it takes less and less to get you to the edge, and soon enough, your fingers start to tremble from the pleasure you’re inflicting on yourself - or maybe it’s just the effects of the drug, hard to tell at this point. Your breathing is unsteady, and your throat can’t help but let out a string of low moans, which are suddenly broken by an increase in pitch - during a moment of carelessness, you’ve brushed against [pc.oneClit].");
			if(rand(100) < (50 + 10 * Math.min(5, uses) - pc.willpower()))
			{ // start of the ‘ruined orgasm’
				output("\n\nApparently, this small lapse was all it took to send you tumbling over the edge; there is no way you can stop the chain reactions that have started in your superheated loins now. Trying to make the most of this accident, you vigorously finger your [pc.vagina " + x + "] and tease your [pc.clits], however, edged as you were, the orgasm comes crashing down like thunder, rocking your body from head to toe.");
				output("\n\nYou can’t help but let out a long series of lascivious moans as you squirt [pc.girlCum]");
				
				// variations
				if(pc.girlCumQ() >= 1000){
					output(" like a geyser in full eruption, forcing your fingers out in the process and creating a large pool under your feet. If you were riding a cock right now, the sheer force of your orgasm would give your partner a sensory overload they wouldn’t forget any time soon! Needless to say, your hands, thighs and [pc.legOrLegs] get utterly bathed in [pc.girlCumFlavor] girlcum.");
				}
				else if(pc.girlCumQ() >= 500) output(" like an open dam, releasing a flood that quickly soaks your hands, thighs and [pc.legOrLegs]. As your fingers haphazardly continue their work on your crotch, your dirty mind pictures someone tonguing your [pc.vaginas] and getting their face drenched with a generous coating of [pc.girlCumNoun].");
				else output(" like a stream, running down your thighs and [pc.legOrLegs] in a slow parody of your previous self-control. No matter how much you stimulate your [pc.vaginas] trying to coerce everything out, the flow simply refuses to stop. If only there was a thick, meaty cock fucking you throughout the orgasm, it would be just perfect!");
				if(pc.hasCock()) 
				{
					output(" Your [pc.multiCocks] choose" + (!pc.hasCocks() ? "s":"") + " this moment to contribute its own sympathetic climax to the party, spraying thick ropes of [pc.cum] all over your [pc.fullChest] and [pc.belly].");
					// apply cum-soaked status effect;
					pc.applyCumSoaked();
				}
				output("\n\nLeaning with your back on a solid surface is all you can do to stop yourself from collapsing during your intense climax. It takes well over a minute before it finally winds down, and you open your eyes in a daze, utterly spent. For an unwanted orgasm, this was fantastic! You can only imagine how it would have been if you had a real partner to sate your lust after edging yourself like that...");
				output("\n\nAs much as you’d like to repeat the experience, it will take some time before you’re ready to reach such heights again, so you decide to " + (!pc.isCrotchExposed() ? "put on your [pc.crotchCovers] and ":"") + "get back to your quest... whatever that was. Geez, you’re gonna be reeking of sex for hours!");

				// apply Soak status effect with a duration of 8h;
				// OR renew duration, if already under this effect;
				// (FEN NOTE: Done earlier.)
				// pass 45 min (after applying status effect);
				kGAMECLASS.processTime(45);
				//FEN NOTE: Original text said orgasm 3x... however, there's only one, so only doing one.
				pc.orgasm();
				// apply pussy-drenched status effect;
				pc.applyPussyDrenched();
				// end.
				// end of 'ruined orgasm'
			}
			else
			{ // successful edging
				output("\n\nThe small accident almost sends you tumbling over the edge, but you freeze your hands and manage not to cum, somehow. After this close call, you decide that you’ve edged yourself enough, now all that’s left to do is find a sexy partner to help sate your pent-up lust! Just thinking about it causes you to giggle with glee!");
				// maximize Lust;
				pc.changeLust(pc.lustMax()*3);
				// apply Soak status effect with a duration of 8h;
				//FEN NOTE: DOne earlier.
				// pass 45 min (after applying status effect);
				kGAMECLASS.processTime(45);
				// create button: Next (returns to item menu).
			}
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		//Overdose Scene
		public function soakOverdose(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nSOAK");
			kGAMECLASS.showBust("SOAK");
			author("Skom")
			var uses:Number = 0;
			if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];
			var x:int = pc.driestVaginaIndex();
			output("It doesn’t take even a minute for the overdose of Soak to kick in: your already wet [pc.vaginasLight] start" + (!pc.hasVaginas() ? "s":"") + " pumping out even more fem lube, and your pussylips swell even more than before. It’s beautiful to see just how juicy they are! But that’s not all: it seems like every part of your feminine reproductive system is going into overdrive.");
			if(!pc.hasPerk("Sterile") && !pc.hasPerk("Infertile")) output(" You can practically feel a new ovulation starting in your womb!");
			output("\n\nOver the next few moments, your breathing and heart rate accelerate dangerously, even as the muscles of your [pc.face] relax into a blissful expression, [pc.eyes] glazed and [pc.lipsChaste] parted, panting with overexcitement. Suddenly, your head gets dizzy, and your [pc.legOrLegs] threaten" + (pc.legCount == 1 ? "s":"") + " to give out. Finding purchase on the nearest solid surface, you slide to the ground as gently as possible, sitting down with your [pc.vaginas] fully exposed and engorged, [pc.eachClit] already out of its hood.");
			if(pc.hasCock()) output(" Your [pc.cocks] rise" + (pc.cockTotal() == 1 ? "s":"") + " to full mast and tremble" + (pc.hasCocks() ? "":"s") + " with sympathetic need.");
			output("\n\nYou’re having trouble thinking clearly as your mind swims in uncountable images of hedonism. In one fantasy, you are bending over to service a line of randy people, your [pc.breasts] resting on a large puddle of cum that leaks from your thoroughly used cunt. In another fantasy, you are lying ");
			if(CodexManager.entryUnlocked("Naleen") && CodexManager.entryUnlocked("Zil")) output("on your back in a forest while a humongously endowed Naleen plows your pussy with both of his ribbed cocks, and a Zil girl uses your face to get off, slathering your [pc.lipsChaste] with her sweet honey.");
			else output("on a bed while a double-cocked Kaithrit hunk plows your pussy with both of his nubby cocks, and an Ausar girl uses your face to get off, slathering your [pc.lipsChaste] with her feminine scent.");
			output(" In yet another fantasy, you are pinned against a wall on the street as an amazonian herm you’ve just met pumps you full of cum; once the stranger is finished, she slaps your ass and pulls her pants back up, leaving you in a debased state before the hungry eyes of an audience.");
			output("\n\nThese passions touch you with atrocious lust. The mere idea of getting filled with virile cum over and over sounds simply exhilarating; you want - no, <i>need</i> - to get filled! You ");
			if(!pc.isCrotchExposed()) output("take off your [pc.crotchCovers] without a second thought and ");
			output("bring a finger to the wet lips of your [pc.vaginaNoun " + x + "], sliding in with incredible ease. At this point, you are so relaxed you feel like you could break a record in taking monster cocks.");
			if(InPublicSpace(pc))
			{
				output("\n\nThe inhabitants of " + getPlanetName() + " look at you with all kinds of expressions; some are startled speechless, while others leer with shameless desire and start fondling their own crotches. Unfortunately for them, all you have eyes for now is your [pc.vagina " + x + "].");
				pc.exhibitionism(2);
			}
			kGAMECLASS.processTime(2);
			applySoak(pc,8*60);
			pc.changeLust(5);
			clearMenu();
			addButton(0,"Next",soakOverdose2,pc);
		}
		public function soakOverdose2(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nSOAK");
			kGAMECLASS.showBust("SOAK");
			author("Skom")
			var uses:Number = 0;
			if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];
			var x:int = pc.driestVaginaIndex();

			output("The feeling of something parting your pussylips and pushing in is just incredible, like your very passage has become one huge erogenous zone almost as sensitive as a clit. But, far from being an overwhelming sensation, this is more like an itch finally being relieved. Giving in to this mind-blowing need, you start fingering yourself with hedonistic abandon, delighting in the sensation of a finger rubbing against your insides - each thrust at a slightly different angle, just to see how it feels.");
			output("\n\nBut one finger just isn’t enough! Before you know it, you have inserted a second, and a third... ");
			if(pc.vaginas[x].looseness() >= 5) output("eventually settling for a fistful. ");
			output("Your [pc.vagina " + x + "] is releasing fem-lube so profusely that it doesn’t take any effort at all to slide that many fingers in and out! Before long, you are sitting on a pool of your own [pc.girlCumFlavor] fem-lube, a strong scent of female sex permeating the air, but you barely pay any attention to this as your other hand moves to play with your [pc.clits], circling and teasing with growing degrees of intensity.");
			if(pc.hasCock()) output("\n\nYour [pc.multiCocks] start" + (!pc.hasCocks() ? "s":"") + " drooling a weak trickle of [pc.cumNoun], which runs down your thighs and soon mixes with the puddle of fem lube on the ground. It’s almost like a soft, slow-moving, never-ending cumshot, but even this sensation is just another drop in the ocean of pleasure being provided by your [pc.vagina " + x + "].");
			if(InPublicSpace(pc))
			{
				output("\n\nBy this point, a crowd of locals has gathered tightly around you, most of whom are masturbating furiously to your sensual performance. Their devoted presence forms a protective circle around you, preventing non-fans from spotting you in this vulnerable state, even though everyone can hear your shameless, slutty vocalizations. Not that you care, considering how high you are right now.");
				pc.exhibitionism(2);
			}
			else output("\n\nBy this point, you are just following blind instinct. You continue to finger yourself with debauched abandon, the squishing and slapping sounds only eclipsed by the noises coming out of your throat in between ragged breaths - your shameless, needy moans would outclass any slut right now.");
			kGAMECLASS.processTime(2);
			pc.changeLust(25);
			clearMenu();
			addButton(0,"Next",soakOverdose3,pc);
		}
		public function soakOverdose3(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nSOAK");
			kGAMECLASS.showBust("SOAK");
			author("Skom")
			var uses:Number = 0;
			if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];
			var x:int = pc.driestVaginaIndex();

			output("Involuntary contractions start in your [pc.vaginas], so you decide to reduce the sensorial overload by leaving your [pc.clits] alone for a while and using that hand to play with your chest instead. Only when your fingers touch a [pc.nipple] do you realize just how drenched they are from all the [pc.girlCumFlavor] lube your nethers have been drooling, but the slippery coating only serves to help your hand as it glides eagerly all over your [pc.breasts], proceeding to grope them passionately, almost uncaringly. You even switch hands to apply more fem lube to your chest at some point. Whatever pain you might have felt from the rough treatment is immediately turned into pleasure by your endorphin-overdosed brain.");
			output("\n\nAfter a couple more minutes, however, you feel something <i>huge</i> building up inside, and shortly your body is seized by a sudden orgasm that breaks out of your system with the power of a tidal wave, robbing your [pc.legOrLegs] of " + (pc.legCount == 1 ? "its":"their") + " strength. [pc.GirlCum] gushes from your [pc.vaginas], almost pushing your hands away in the process, but a strong pleasure-seeking instinct drives you to continue fingering yourself, albeit haphazardly.");
			output("\n\nThe hand playing with your chest moves back to your [pc.clits], driving your orgasm to new heights and causing your [pc.breasts] to tremble with renewed shockwaves of pleasure.");
			if(pc.hasCock()) output(" Suddenly, [pc.eachCock] fires the rest of its own load without even being touched, painting your [pc.chest] and [pc.face] with long ropes of [pc.cumNoun].");
			output(" And yet, the blissful sensations coursing through your groin don’t seem anywhere near the end. There is always <i>more</i> coming out! The puddle of fluids under your [pc.footOrFeet] continues to expand as [pc.eachVagina] releases a steady flow of [pc.girlCum].");
			kGAMECLASS.processTime(2);
			pc.changeLust(25);
			clearMenu();
			addButton(0,"Next",soakOverdose4,pc);
		}
		public function soakOverdose4(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nSOAK");
			kGAMECLASS.showBust("SOAK");
			author("Skom")
			var uses:Number = 0;
			if(kGAMECLASS.flags["SOAK_TIMES_USED"] != undefined) uses = kGAMECLASS.flags["SOAK_TIMES_USED"];
			var x:int = pc.driestVaginaIndex();

			if(InPublicSpace(pc)) 
			{
				output("The crowd of adoring fans reach their orgasms almost at the same time, cocks showering you with cum from all directions. A particularly long, virile rope of salty alabaster cum fired by an ausar hits you square on the [pc.lips] before trickling down your chin, while you spot quite a few pussies contributing their own fem-juices to the growing puddle under your [pc.footOrFeet]. You’re also pretty sure you’ve seen more than one camcorder, but the current you is way past caring.\n\n");
				pc.exhibitionism(2);
			}
			output("Your body trembles from head to toe, and your vision goes blurry for a moment from the chaotic synapses in your overwhelmed brain, even as you continue to babble incoherently and moan in an utterly whorish pitch. Your [pc.eyes] are unfocused, and you’ve long lost control of the muscles of your [pc.face], jaw slacked and tongue lolling out, drooling saliva like it’s no-one’s business: a perfect picture of slutty debasement.");
			output("\n\nYou lose track of time, and yet the climax doesn’t seem like it’s going to ever wane. The feeling only stops when eventually your mind goes into overcapacity, causing you to black out.");
			output("\n\nYou wake up some time later, lying in a pool of sex fluids and saliva.");
			if(InPublicSpace(pc)) output(" Fortunately, one of your fans was considerate enough to drape a large coat over your vulnerable form, and you think you can still spot some of their faces around, keeping a protective watch.");
			output(" After gathering your bearings, you find that your relief was only temporary; your [pc.vaginas]");
			if(pc.totalVaginas() > 1) output(" are");
			else output(" is");
			output(" still very puffy, swollen beautifully and tingling with need, while your inner walls itch for a big cock to stretch them, and your womb craves virile seed.");
			output("\n\nWith your head still a bit hazy, you get up zombie-like and prepare to continue on your way (that is, as soon as you manage to remember what your actual goal was). Surely the trail of leaking [pc.girlCumFlavor] lube and the strong scent of sex will attract someone to help you with your burning need.");
			// if has status effect "Infertile", remove this status (not to be mistaken with the Infertile perk)
			pc.removeStatusEffect("Infertile");
			kGAMECLASS.processTime(60);
			// orgasm a few times;
			for(var ii:int = 0; ii < 5; ii++) { pc.orgasm(); }
			// apply pussy-drenched status;
			pc.applyPussyDrenched();
			// renew duration of Soak status effect to 8h;
			applySoakOverdose(pc,480);
			// apply Soak Overdose status effect with a duration of 8h1min;
			// OR renew duration of Soak Overdose to 8h1min, if already has Soak Overdose;
			// apply the Heat status effect with a duration of 8h1min;
			// OR, if already under Heat, apply Deep Heat instead, with a duration of 8h1min;
			// OR, if already under Deep Heat renew the duration to 8h1min;
			// rest for 1 hour (after applying statuses);
			// set Lust to 80;
			if(pc.lust() < 80) pc.changeLust(80-pc.lust());
			// check for bad end (see below);
			// if the bad end triggers, create button: Next (goes to bad end);
			var ODNum:Number = 0;
			if(kGAMECLASS.flags["SOAK_OVERDOSE"] != undefined) ODNum = kGAMECLASS.flags["SOAK_OVERDOSE"];
			if(rand(100) < Math.max( 10, (30*ODNum) - pc.willpowerRaw) )
			{
				clearMenu();
				addButton(0,"Next",badEndForSoakyBoisByAltair,pc);
			}
			// if the bad end doesn't trigger, create button: Next (returns to item menu).
			else
			{
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
			}
		}
		public function applySoak(pc:Creature, duration:Number = 480):void
		{
			if(!pc.hasStatusEffect("Soak"))
			{
				pc.createStatusEffect("Soak",0,0,0,0,false,"Icon_Vagina_2","You are currently high on Soak, leaving you a horny, sopping-wet mess with a serious drooling problem.",false,0,0xB793C4);
				for(var i:int = 0; i < pc.totalVaginas(); i++)
				{
					pc.vaginas[i].wetnessMod += 5;
				}
				pc.clitLength += 0.5;
			}
			pc.setStatusMinutes("Soak",duration);
		}
		public function applySoakOverdose(pc:Creature,duration:Number = 480):void
		{
			applySoak(pc,duration);
			if(!pc.hasStatusEffect("Soak Overdose")) pc.createStatusEffect("Soak Overdose",0,0,0,0,false,"Icon_Vagina_2","Your risky behavior has left you a sodden mess of slickened holes and pure libido.",false,0,0xB793C4);
			pc.setStatusMinutes("Soak Overdose",duration);
			//Yay, heat!
			//v1 - fertility boon
			//v2 - minimum lust boost
			//v3 - libido boost
			//v4 - tease bonus!
			if(!pc.inHeat()) pc.createStatusEffect("Heat",5,15,10,3,false,"LustUp","Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+500% Fertility\n+15 Minimum Lust\n+10 Libido\n+3 Tease Damage",false,duration,0xB793C4);
			else 
			{
				pc.setStatusValue("Heat",1,10);
				pc.setStatusValue("Heat",2,35);
				pc.setStatusValue("Heat",3,25);
				pc.setStatusValue("Heat",4,5);
				pc.setStatusTooltip("Heat","<b>You are in a deep heat!</b> Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+" + pc.statusEffectv1("Heat") * 100 + "% Fertility\n+" + pc.statusEffectv2("Heat") + " Minimum Lust\n+" + pc.statusEffectv3("Heat") + " Libido\n+" + pc.statusEffectv4("Heat") + " Tease Damage");
					pc.extendHeat(duration);
			}
		}
		public function soakOverWrapper():void
		{
			soakOverTFs(kGAMECLASS.pc);
		}
		//Permanent Changes
		//* Triggers when the Soak status effect ends
		public function soakOverTFs(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("\nSOAKED");
			var ODNum:Number = 0;
			if(kGAMECLASS.flags["SOAK_OVERDOSE"] != undefined) ODNum = kGAMECLASS.flags["SOAK_OVERDOSE"];
			// Mandatory taint gain (no text):
			pc.taint(1 + rand(3) + 2*ODNum);
			// Introduction paragraph for changes:
			output("As the saying goes, all good things come to an end, and the Soak rush you’ve been riding is no exception. In its wake, you’re left feeling a bit light-headed and... empty. Everything was so bright and exciting while you were high, and now, by contrast, life seems to have lost a bit of color. Well, at least you had a lot of fun over the past few hours!");

			//Willpower Loss
			if(ODNum >= 1 && pc.willpower() > 1 && rand(3) == 0)
			{
				pc.willpower( -(1 + rand(3) ));
				if(pc.hasItemByClass(Soak)) output("\n\nA sudden urge to take another dose of Soak hits you like a brick, but the warnings you’ve read in the Codex come back to mind, and you manage to stop yourself. It looks like you’re still in control, but... for how long? <b>Your willpower has been reduced.</b>");
				else output("\n\nYou catch yourself absent-mindedly reaching into your pack for another dose of Soak, only to despair when you find none in your possession. After taking a few deep breaths, you manage to sober up, but it’s hard not to recognize the signs of a mounting addiction. <b>Your willpower has been reduced.</b>");
			}
			//Libido
			if(pc.libido() < 100)
			{
				pc.libido( (rand(11) + Math.round((100-pc.libido())/6)) + 3*ODNum );
				output("\n\nYou’re about to resume your business when the Codex beeps a warning, prompting you to pick it up with an annoyed pout. It’s a medical diagnosis. After skimming through the jargon, you surmise your sexual hormones have spiked up a little, prompting you to get randy more easily.");
				if(ODNum >= 1) output(" However, the numbers continue to rise before your baffled eyes, as the diagnosis is automatically updated with new information provided by your nanobots. Okay, <i>maaaybe</i> the overdose wasn’t such a good idea...");

				// variations:
				if(pc.libido() >= 80 ) output("\n\nJudging from how hot [pc.eachVagina] is feeling feeling right now, you’d have a very hard time keeping your libido in check if some sexy alien tried to get in your pants. Actually, now that you think of it, is there even a point in resisting? It’s impossible to lie to yourself, you <i>want</i> to get fucked and filled with cum!");
				else if(pc.libido() >= 60 ) output("\n\nWell, ‘randy’ is an understatement: if you come across someone with a cock right now, you would definitely try to get in their pants, damn the consequences! [pc.EachVagina] relaxes of its own volition in agreement with that thought, drooling a bit more [pc.girlCumFlavor] lube than usual.");
				else if(pc.libido() >= 40 ) output("\n\nYou blush just to think of how much of a horny slut you’re becoming. But then again, if it feels so good to use your [pc.vaginas], perhaps you should do it more often, as nature intended...");
				output(" <b>Your libido has increased.</b>");
			}
			// End of the mental changes, start of the physical ones:
			output("\n\nWondering if the Soak has left any physical changes, you decide to set your Codex to mirror mode" + (pc.isCrotchExposed() ? "" : ", take off your [pc.crotchCovers]") + " and take a closer look at your crotch.");
			// To track the number of physical changes:
			var soakMaxChanges:int = 2 + ODNum;
			var soakChanges:int = 0;

			//Pussy Pumping
			// First determine if a pussy can use pumping (least pumped takes priority):
			var soakPump:int = 4;
			for (var x:int = 0; x < pc.totalVaginas(); x++) 
			{
				if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_HYPER_PUMPED) && soakPump >= 3) soakPump = 3;
				else if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) && soakPump >= 2) soakPump = 2;
				else if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && soakPump >= 1) soakPump = 1;
				else if(soakPump > 0) soakPump = 0;
			}
			//Soak bumps up 1 level to 2 at max.

			// Now move on to pumping (non-overdose cases):
			if(rand(4) == 0 && soakChanges < soakMaxChanges && soakPump < 2)
			{
				soakChanges++;
				if(soakPump == 0)
				{
					output("\n\nThe first thing to catch your attention is a visible increase in the volume of your pussylips. They aren’t quite as swollen as during the Soak rush, but they definitely look puffier than before! You run a finger over your [pc.vaginas], delighting in how plump and sensitive your labia feel.");
					for (x = 0; x < pc.totalVaginas(); x++)
					{
						//Nothing -> Slight Pump
						if(!pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
						{
							pc.vaginas[x].addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
							output("\n<b>Your [pc.vagina " + x + "] is now slightly pumped.</b>");
						}
					}
				}
				else if(soakPump == 1)
				{
					output("\n\nChecking the appearance of your pussylips in the Codex, you note that they look mouthwatering and absolutely gorgeous - perfect for being serviced by a hungry tongue, rubbed by a huge cock, or squeezed against someone else’s cunt!");
					for (x = 0; x < pc.totalVaginas(); x++)
					{
						if(pc.vaginas[x].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_PUMPED) && !pc.vaginas[x].hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
						{
							pc.vaginas[x].delFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
							pc.vaginas[x].addFlag(GLOBAL.FLAG_PUMPED);
							output("\n<b>Your [pc.vagina " + x + "] is now fully pumped.</b>");
						}
					}
				}
			}
			// More pumping (overdose case):
			if(ODNum >= 1 && rand(8) == 0 && soakChanges < soakMaxChanges && soakPump == 2)
			{
				soakChanges += 1;
				output("\n\nMuch to your delight, you find that your juicy pussylips are every bit as swollen as during the Soak overdose rush, the labia obscenely large and plump-looking. If you were to show them around, you seriously doubt anyone could resist giving your [pc.vaginas] some love!");
				for (x = 0; x < pc.totalVaginas(); x++)
				{
					if(!pc.vaginas[x].hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
					{
						pc.vaginas[x].delFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
						pc.vaginas[x].delFlag(GLOBAL.FLAG_PUMPED);
						pc.vaginas[x].addFlag(GLOBAL.FLAG_HYPER_PUMPED);
						output("\n<b>Your [pc.vagina " + x + "] is now hyper pumped.</b>");
					}
				}
			}
			//Bonus Capacity
			if(rand(6) == 0 && soakChanges < soakMaxChanges)
			{
				var soakCapacity:int = 0;
				for (x = 0; x < pc.totalVaginas(); x++)
				{
					if(pc.vaginas[x].bonusCapacity < 150)
					{
						pc.vaginas[x].bonusCapacity += 20;
						soakCapacity += 1;
					}
				}
				if(soakCapacity > 0)
				{
					soakChanges += 1;
					output("\n\nYou notice your insides are feeling more... spacious, somehow - it’s like your walls have stretched and expanded. For some reason, you just know <b>your [pc.vaginas]" + (pc.totalVaginas() > 1 ? " are" : " is") + " now capable of handling larger insertions</b>, without any change in looseness.");
				}
			}
			//Clit Size
			if(rand(4) == 0 && pc.clitLength < 1 && soakChanges < soakMaxChanges)
			{
				soakChanges += 1;
				output("\n\nUpon closer inspection, you notice that even though [pc.eachClit] has lost most of the extra size it had gained during the Soak high, it’s still a bit larger than it used to be. With" + (pc.totalClits() > 1 ? " pleasure buttons like these" : " a pleasure button like this" ) + " you expect you’ll be reaching new heights of ecstasy! <b>The size of your [pc.clits] has increased.</b>");
				pc.clitLength += 0.1;
			}
			//Lubricated Tongue
			if(rand(6) == 0 && ODNum >= 1 && !pc.hasTongueFlag(GLOBAL.FLAG_LUBRICATED) && soakChanges < soakMaxChanges)
			{
				soakChanges += 1;
				pc.addTongueFlag(GLOBAL.FLAG_LUBRICATED);
				output("\n\nAs you examine yourself, it suddenly occurs to you that you’ve been salivating <i>a lot</i> since you took that overdose of Soak, way more than on a normal high. You thought this would stop after the rush was over, but... no, your [pc.tongue] is still every bit as wet as before. Looks like you’ve got no choice but to get used to it. On the bright side, a slippery tongue makes it <i>that</i> much easier to suck cock! <b>Your tongue has become permanently lubricated.</b>");
			}
			//Wetness and Girlcum
			// Always triggers and does not count against the maximum number of changes
			var soakWetMax:int = 0;
			var soakGotWetter:int = 0;
			var soakSquiterIndex:int = 0;
			for (x = 0; x < pc.totalVaginas(); x++)
			{
				if(pc.vaginas[x].wetnessRaw < 5)
				{
					pc.vaginas[x].wetnessRaw += 1;
					soakGotWetter += 1; // marks that at least one vagina became wetter
					if(pc.vaginas[x].wetnessRaw >= soakWetMax)
					{
						soakWetMax = pc.vaginas[x].wetnessRaw;
						if(soakWetMax == 4) soakSquiterIndex = x; // to use in scene
					}
				}
			}
			if(soakGotWetter > 0)
			{
				if(soakWetMax >= 5)
				{
					output("\n\nSoak is said to make you wetter than a Rahn on a sugar rush, and it seems like this is the natural state of your [pc.vaginas] now, if the sheer amount of moisture drooling out is anything to go by. Your crotch is absolutely drenched, and it feels <i>fantastic!</i> Curious, you start stimulating the lips or your [pc.vaginas], which prompts a rivulet of [pc.girlCumFlavor] lube to run down your thighs and [pc.legOrLegs]. You’ve barely started, and it already feels so good!");
					output("\n\nGetting a little bolder, you run a finger over your [pc.clits], indulging in the buzz of electric pleasure it sends through your crotch. In response, [pc.eachVagina] starts releasing even more fluid than before! If you hadn’t just come out of a high, you would definitely work yourself to orgasm, but, as it is, you decide to save it for a real cock. Or maybe you could go on another Soak high, though you seriously doubt you can get any wetter than you already are.");
				}
				else if(soakWetMax == 4) // just became a squirter
				{
					output("\n\nYou bring your hand to your crotch and insert two fingers in your [pc.vagina " + soakSquiterIndex + "], delighting in just how easily they go in. There’s no way you can resist exploring the possibilities now!");
					output("\n\nWith giddy anticipation, you find a private place" + (pc.isCrotchExposed() ? "" : ", remove your [pc.crotchCovers]") + " and proceed to lie on your back so you can better indulge yourself. One hand circles and teases your [pc.clits], while the other continues to finger your [pc.vagina " + soakSquiterIndex + "] without a shred of restraint, drawing ragged sensual gasps from your throat. It doesn’t take long for you to feel the climax fast approaching.");
					output("\n\nIntent on seeing just how far you can squirt, you stop fingering yourself and focus solely on your [pc.clits], lifting and angling your [pc.hips] just right before redoubling the stimulation. Your body obliges by trembling as [pc.eachVagina] starts its contractions, the [pc.girlCum] building up before bursting out in a series of long, satisfying spurts that paint the ground a good four feet in front of your [pc.hips]. Panting from the exercise, you take a step back to admire your work. <i>‘Wow, that was kind of impressive,’</i> you mutter, blinking.");
					output("\n\n<b>It looks like you are now a squirter!</b>");
					pc.orgasm();
				}
				else if(soakWetMax == 2 || soakWetMax == 3)
				{
					output(" \n\nA bit of hot fem-lube trickles down your thighs, sending a shiver of excitement where it touches your skin. With a smile, you scoop some of the delicious treat in your fingers and bring it to your [pc.lipsChaste], savoring your own [pc.girlCumFlavor] taste. There is no way a" + (pc.isTreated() ? " randy bull or amazon" : " hot, randy alien") + " wouldn’t love shoving their mouth on [pc.oneVagina] to get some of <i>that!</i>");
				}
				else
				{
					output(" \n\nTaking some time to examine your pussylips, you notice that they are still quite moist with [pc.girlCumFlavor] lube - it looks like the info about Soak permanently increasing vaginal wetness was accurate. Not that you’re complaining, after all it <i>is</i> nice for your [pc.vaginas] to be constantly lubricated, always ready in case you happen to stumble upon some pent-up, sexy stranger wanting to take you for a tumble in the hay!");
				}
				// Conclusion:
				output(" \n\nOn a closer inspection, you confirm that<b>");
				if(pc.totalVaginas() > 1)
				{
					if(soakGotWetter == 1) output(" one of your [pc.vaginas] is");
					else output(" " + num2Text(soakGotWetter) + " of your [pc.vaginas] are ");
				}
				else output(" your [pc.pussy] is");
				output(" leaking noticeably more girlcum than before.</b>");
			} // end of wetness increase
			else if(soakGotWetter == 0) // wetness already maxed, so increase girlcum multiplier instead
			{
				if(pc.girlCumMultiplier() < 10) pc.girlCumMultiplier(1+ rand(5));
				else pc.girlCumMultiplierRaw += 1;
				// scene variations:
				if(pc.girlCumMultiplier() >= 10 && rand(2) == 0)
				{
					output("\n\nYou’ve barely formulated the thought when you feel a familiar wave of pleasure building up inside your [pc.vaginas]. Your walls start contracting of their own volition, and your body trembles as it is seized by a sudden, intense ecstasy. Some of the Soak-related blogs you’ve read talked about spontaneous orgasms, but this is <i>way</i> better than they said!");
					output("\n\nIntent on making the most of this rare opportunity, you start to vigorously finger [pc.oneVagina], while the other hand gently massages your [pc.clits] and pussylips, escalating out the impending climax. It doesn’t take five seconds for your [pc.vaginas] to start gushing out [pc.girlCum] like a fountain, prompting you to moan like a bitch in heat, and you savor every moment of it!");
					output("\n\nBy the time your long, spontaneous orgasm finally winds down, you notice you’re standing on a pool of your own fluids, your thighs, [pc.legOrLegs] and everything around entirely coated with [pc.girlCumNoun] and reeking of sex. <b>It looks like your" + (pc.hasCock() ? " feminine" : "") + " orgasms have gotten quite a little bit messier!</b>");
					pc.orgasm();
					pc.applyPussyDrenched();
				}
				else output("\n\n[pc.EachVagina] is so wet that it feels like your system is preparing be able to squirt [pc.girlCumNoun] on a moment’s notice! For some reason, you have a feeling <b>your" + (pc.hasCock() ? " feminine" : "") + " orgasms will be much messier from now on!</b>");
			}
			//Fertility and Pregnancy Speed
			if(rand(6) == 0 && soakChanges < soakMaxChanges && !pc.hasPerk("Sterile") && !pc.hasPerk("Infertile"))
			{
				if(pc.fertilityRaw < 5 && !pc.hasWombPregnancy())
				{
					soakChanges += 1;
					pc.fertilityRaw += 0.5;
					if(pc.fertilityRaw > 5) pc.fertilityRaw = 5;
					output("\n\nYou’re about to resume your business, when suddenly your Codex beeps a medical notification: <i>Warning, new ovulation detected. Ovule development speed above previous baseline.</i> After skimming through the detailed information, you surmise your" + (pc.hasCock() ? " feminine" : "") + " reproductive system is working more effectively than before to ensure a successful insemination. <b>You have become more fertile!</b>");
				}
				else if(pc.pregnancyIncubationBonusMotherRaw < 10)
				{
					soakChanges += 1;
					pc.pregnancyIncubationBonusMotherRaw += 0.5;
					if(pc.pregnancyIncubationBonusMotherRaw > 10) pc.pregnancyIncubationBonusMotherRaw = 10;
					//* If pregnant, accelerate all ongoing pregnancies by cutting down 20% of the remaining time. Probably a good idea to check motherhusk as a reference.
					output("\n\nThere’s a lingering ‘hotness’ deep inside your womb that refuses to go away even after the Soak has worn off. Pulling out your Codex and having it perform a detailed medical checkup, the reason becomes clear: your" + (pc.hasCock() ? " feminine" : "") + " reproductive system is working faster than before to accelerate fetal development. <b>Your future pregnancies are going to progress a bit quicker from now on.</b>");
				}
			}
			//* IMPORTANT: When the Soak Overdose status effect ends, set flag SOAK_OVERDOSE to 0.
			kGAMECLASS.flags["SOAK_OVERDOSE"] = 0;
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
		//Bad End Scene
		//Conditions:
		//Libido 90+
		//One or more vaginas at wetness 5+
		//Overdosing again while already overdosed
		//rand(100) < math.max( 10, (30*SOAK_OVERDOSE - pc.willpowerRaw) )
		public function badEndForSoakyBoisByAltair(pc:Creature):void
		{
			//(Author of the bad end: Altair Hayes)
			clearOutput();
			kGAMECLASS.showName("MORE\nSOAK...");
			author("Altair");
			output("As usual, you feel the effects of a Soak overdose settling in and go about your business, but this time you find yourself having a lot of trouble getting your thoughts in order, let alone remembering what your actual goals were. This state persists long after the Soak overdose wanes, only it’s now accompanied by a terrible headache, so you decide to pop one more dose... and then another... Eventually, the nanobots in your body adapt to the near-constant supply of Soak, and you find your head clearing again, but everything is different now.");
			output("\n\nEver since that prophetic overdose of Soak, you’ve found yourself lost to the utter depravity and pleasure of getting fucked. Long gone are your days of adventuring, now all you care about is keeping up your supply of the drug and getting your [pc.vaginas] stuffed by every cock in a ten yard radius. You’re pretty much incapable of keeping your fingers away from your crotch, let alone staying chaste for more than a few hours.");
			output("\n\nYou often spend whole hours sitting in your ship, fingering [pc.oneVagina] with a hand while browsing your Codex with the other. Yet, though your screen often displays pornography, what you’re really doing most of the time is searching for parties to crash. Be it a small bachelor’s party or a high society orgy, you always find the time to be the life of the party.");
			if(kGAMECLASS.crew(true) > 2) output(" The crew members who can’t keep up with your new lifestyle eventually go their separate ways, leaving you and accomplices to chase cock on your own.");
			output("\n\nIt helps that a lot of the time there are people selling ‘party favors’, and while you tend to bring your own supply of Soak, you find it easy to convince horny guys to buy you a hit or two.");
			output("\n\nA couple of months into this new lifestyle, you find yourself sitting in your captain’s chair, playing with your [pc.clits] when you get a notification on your Codex. You whip it out and find that there’s a barbeque going on not half an hour away from your current location. At first you don’t think much of it, as you’re more used to seedy underground nightclubs than house parties. Yet just before you pass on it, you decide to scroll through some of the tagged photos, and you’re immediately glad you did.");
			output("\n\nIn every other photo, you can see either throbbing bulges in tight swim trunks or sluts getting the stuffing of their life. You’re so focused on the guys’ horse cocks that you hardly notice the bovine horns on their heads. The idea of getting spit roasted by men that hung is already appealing, but you keep on scrolling, furiously fingering yourself to the photos. It’s only when you stumble upon a certain photo that you get knocked out of your mastubatory haze.");
			output("\n\nThe star of the photo is a cowgirl in her early twenties, with her mouth open and her tongue extended. Sitting on her tongue are five pink tablets that would look like innocent candy to the untrained eye, but you immediately recognize them as doses of Soak. As you frantically flip through the rest of the photos, lo and behold, you find pictures of girls in the same exact pose, on their knees with their tongue out, multiple doses resting on their tongues.");
			output("\n\nYou practically trip over yourself as you shift course to the planet. You were already planning on heading over after a quickie, but seeing how people are handing out pieces of Soak like candy, you just can’t help yourself. Law enforcement must be pretty forgiving with drugs there.");
			output("\n\nWhen you are only five minutes away from the party, you strip yourself nude and put on the skimpiest swimwear you can find. Once your ship lands on the open, grassy plot of private land, you reach into your personal stash of Soak and take out two doses. As you strut down the walkway you toss the first into your mouth and slip the second into [pc.oneVagina]. You’re not just planning on having fun, you’re planning on getting <i>fucked up</i>.");
			if(kGAMECLASS.mitziIsCrew()) output("\n\nMitzi, of course, wastes no time changing into a tiny bikini and following suit, but you lose sight of her soon after getting off the ship, as she rushes off to slut herself out to the nearest group of jocks. Tsk tsk, how impatient, didn’t even wait for the Soak to really hit before looking for a gangbang. You can do better.");
			else output("\n\nAnd it looks like you’re not the only one rich enough to have landed a personal airship here, as you count half a dozen other ships nearby. But that’s not what really matters to you. All you care about now is rubbing your drooling pussy against the biggest cock you can get your hands on. And you don’t have to wait long.");
			output("\n\nAs you approach the party, a horned hunk with sandy-blond locks jogs up to you. <i>“Welcome!”</i> he greets you with an extended hand an a hearty southern accent. <i>“Name’s Bastian, anything I can get you?”</i>");
			output("\n\nYou look him once over. He’s got a strong, muscular frame, a handsome tanned face, and his red swim trunks do absolutely nothing to hide the monster he’s packing downstairs. He’ll do just fine. <i>“I think you know what I want,”</i> you step forward and close the distance between the two of you, your hand immediately worming its way into his trunks. <i>“How about you get me some Soak and I show you a good time?”</i>");
			output("\n\nBastian looks down at you, his expression stony, and for a moment you’re worried that he’s taken this the wrong way. But a smirk soon cracks his cold demeanor. <i>“Another Soak-slut eh? Sure, I’ll hook you up. I’ve only got one question though,”</i> he reaches behind you and hooks two fingers into your soaking-wet snatch, <i>“where do you wanna get fucked?”</i>");
			output("\n\nYou look over his shoulder and over to the backyard in which the party is taking place. There’s about two hundred or so people hanging around, more than half of which are men, though you also see quite a few bulgy herms. Bastian follows your gaze and understands completely. He hoists you up, his fingers still in your snatch, and carries you over to a sunbathing chair by the pool. He sets you down, but not before pulling out his codex and a baggie full of Soak.");
			output("\n\n<i>“First thing’s first,”</i> he chuckles as he forces you onto your knees. <i>“I’ve gotta take a picture of this pretty little face. Open wide " + pc.mf("pussy boy.","girlie.") + "”</i>");
			output("\n\nYou obediently do as he says, and just as you do so your first two doses of Soak start to hit you. Drool starts pouring out of your mouth, and your hands immediately rush for your snatch. Bastian chuckles as he shakes the baggie right in front of you.");
			output("\n\n<i>“You already had some, didn’t you?”</i> The hunk says as he reaches down and tears off your swimwear. You nod furiously as you press your face against his crotch, breathing in his earthy musk. Fuck... you need his dick <b>now</b>. <i>“Tell me, are you a Soak slut?”</i> Bastian moves the camera in front of your face and awaits your response.");
			output("\n\n<i>“I’m a Soak slut, I’m a Soak slut!!”</i> You moan like a whore, easily catching the attention of a dozen or so men. <i>“Fuck me, pl-leeease!”</i>");
			output("\n\nBastian reaches into the bag, pulls out ten doses of Soak and offers them to you. You scarf them down without a second thought. Bastian steps away and calls out: <i>“Have at her boys!”</i>");
			output("\n\nImmediately, a group of young, muscular studs descend on you like a pack of ravenous wolves. Their animalistic cocks twitch and bob as their eager hands grope you. You feel yourself grow weak and all you can do is spread your legs and open your mouth. Both holes are immediately filled by twitching equine flares. Your eyes roll back as they sink themselves into you, and you’re lost to the pleasure of it all.");
			output("\n\nAfter around a minute of this, the second dose of soak hits you. You waste no time wrapping your legs around the horned hunk fucking your pussy even as the first of many orgasms wracks your body. Your [pc.biggestVagina] clenches around him, milking his girthy cock while your cunt squirts, soaking him from the waist down in your [pc.girlCum]. He hardly lasts a second longer, his copious spunk filling you up and painting your snatch white. The guy in your mouth quickly follows suit, blowing his load deep into your gullet before pulling out his saliva-coated cock, webs of your spit clinging from his flare to your [pc.lips].");
			pc.applyCumSoaked();
			pc.loadInCunt(kGAMECLASS.kiro,0);
			pc.loadInMouth(kGAMECLASS.kiro);
			output("\n\n<i>“More!”</i> You demand like the depraved Soak addict you are. <i>“Creampie my wet cunt!”</i>");
			output("\n\nThat’s all anyone needs to hear. The next few hours speed by like a blur, there’s not a moment when you’re not sucking, fucking, or getting carried off to a new location. You get rammed in the pool, by the grill, on a bearskin rug by the fireplace, and just about every room inside the house. You experience orgasms so powerful that you fail to notice when the guys swap out. One moment you’re getting stuffed by a ten inch knotted Kaithrit cock and the next you’re locked around a hunk with a two foot long horsecock.");
			output("\n\nIt’s only a matter of time until exhaustion takes you, and you fall unconscious while still being used.");
			kGAMECLASS.processTime(1440);
			clearMenu();
			addButton(0,"Next",soakBadEndPart2,pc);
		}
		public function soakBadEndPart2(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("POST-\nPARTY");
			author("Altair");
			output("When you eventually come to, you find yourself sharing a bed with a dozen or so other girls. One cursory glance under the covers reveals that they’re all Soak addicts too, if their puffy, engorged pussies are anything to go by.");
			if(kGAMECLASS.mitziIsCrew()) output("\n\nMitzi is sprawled there too, alabaster cum drooling out of her cunt, ass and mouth. Her unconscious expression could best be described as a slutty haze, jaw slack and tongue lolling out.");
			output("\n\nYou crawl out of bed and attempt to make your way back to your ship, only for you to fall flat on the ground, your [pc.legOrLegs] unable to carry you anywhere. The loud thump you make attracts the attention of someone in the house, as a pair of heavy footsteps sprints towards your general direction. And who else walks through the door other than Bastain, wearing a bathrobe embroidered with a trio of greek letters.");
			output("\n\n<i>“Whoa now,”</i> he says as he carefully picks you up, <i>“you okay there?”</i>");
			output("\n\n<i>“What’s going on?”</i> You ask, looking back on the bed of sleeping girls, none of which have seem to have woken up. The nanobots in your body are adapted to Soak, but those girls don’t have the same luck. It should take a long time for them to get back on their feet.");
			output("\n\nBastian carries you downstairs as he explains the situation. He says the party has gotten a bit out of hand, and a bunch of girls had more Soak than they could handle even though the doses were supposed to be really weak, according to his supplier. He princess-carries you down to the kitchen and sits you at a table.");
			output("\n\n<i>“Want something to drink?”</i> He asks innocently. You just ask for a glass of water, which is promptly handed to you. <i>“So tell me, how was last night?”</i>");
			output("\n\n<i>“I can’t remember half of it,”</i> you say, only half joking, pulling the glass of water up to your lips, but setting it back down before you drink it. You’d recognize the smell of Soak anywhere, and though you’re tempted to just drink it, you’ve got a better idea. <i>“But I’ll admit, it was fun,”</i> you say giddily.");
			output("\n\n<i>“So, you liked being a Soak slut?”</i> Bastian chuckles as he sits down across from you.");
			output("\n\nYou scoff. <i>“Ask me something new. If I didn’t like it, you think I’d be here?”</i>");
			output("\n\n<i>“Touché,”</i> he concedes. <i>“Say, weren’t you thirsty?”</i>");
			output("\n\n<i>“Tell me Bastian, how old are you?”</i> You ignore his question and reply with one of your own.");
			output("\n\n<i>“Twenty, why?”</i> He replies with a confused look.");
			output("\n\n<i>“And do you own this place?”</i> You continue your questioning, as you peer down into your water, the tablet Bastian slipped in only half dissolved.");
			output("\n\n<i>“Yeah... I inherited it from my grandpa,”</i> he mutters, his brow furrowing. <i>“Where are you going with all this?”</i>");
			output("\n\n<i>“So you’re under twenty-one and hosted party where other people under the age of twenty-one were drinking alcohol. You’re dosing up girls with Soak, which is also incredibly illegal,”</i> you get up from your seat and walk behind Bastian, pouring your water onto his crotch, <i>“and you just tried to hit me with a dose of Soak against my will.”</i>");
			output("\n\n<i>“What’re you getting at-”</i>");
			output("\n\n<i>“Ah, I’m not done yet,”</i> you can’t help but smile, knowing you’ve got him right where you want him. <i>“Now, say you did all of this to the " + pc.mf("son - or was it pussy boy? - of","daughter of") + " one of the most influential men in the galaxy.”</i>")
			output("\n\nYou pull out your Codex and show him exactly who you are. As soon as he makes the connection his eyes grow wide with fear. Even in a planet with lax law enforcement, one can’t get away unscathed after crossing someone of your social standing.");
			output("\n\n<i>“Now Dad may be dead,”</i> you continue, <i>“but his lawyers sure aren’t, and I assure you I’m good friends with them. So how about I cut you a deal? You sign this house over to me and bring me in on your little Soak operation. And in return I won’t sue you. You can even keep living here for as long as you’d like, if you promise to put that <i>nice</i> cock of yours to use on me everyday. How’s that sound?”</i>");
			output("\n\nBastian, who is too choked up with fear to respond, simply nods.");
			output("\n\n<i>“Good,”</i> you smile warmly at him as you send a couple messages on your codex, <i>“I’ll have some lawyers draft up the documents, and once you sign them, we’ll be good to go. Say, while we wait, how about you get me a dose of Soak and we have some fun?”</i>");
			kGAMECLASS.processTime(30);
			clearMenu();
			addButton(0,"Next",soakBadEndPart3,pc);
		}
		public function soakBadEndPart3(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("POST-\nPARTY");
			author("Altair");
			output("Days quickly become weeks, which quickly become months, and before you know it, three years have passed. Time flies by when you spend every night high on Soak and getting gangedbanged by a dozen or so rich college studs. They’ll gladly pay premium rent just for the privilege of having a live-in top-notch slut like yourself, and you’ll gladly ride their cocks as you pocket their cash. It’s a win-win situation.");
			output("\n\nIn truth, you only realized that you landed on New Texas a couple of days after that fateful BBQ party. You were so focused on getting fucked up on Soak that you didn’t even recognize the coordinates you were entering into your ship, never mind reading the display information. Not that you’re complaining, quite the contrary: Treated people are perfect for satisfying your needs.");
			if(kGAMECLASS.mitziIsCrew()) 
			{
				kGAMECLASS.showBust("MITZI_NUDE");
				output("\n\nMitzi, of course, moved in to help you with emptying balls every night.");
				if(kGAMECLASS.celiseIsCrew()) output(" As did Celise, who is more than happy to clean up the mess.");
			}
			output("\n\nA certain evening, you lift up the covers to a familiar sight, Bastian face deep in your snatch, your own personal alarm clock. The sleeping jock presently serving as your bed still has his knotted cock inside [pc.oneVagina], but this doesn’t stop Bastian’s tongue from masterfully gliding across your folds and dancing around [pc.oneClit]. You reach down and pat his sandy-blond hair, encouraging him to keep going as you reach for your codex and oversee the applications for incoming freshmen.");
			output("\n\nYou casually flip through the profiles, reading over their bios. You take particular interest in those who were bold enough to send you nudes. Bulls and Amazons tend not to be lacking downstairs - even Faux Cows can be pretty well-endowed - but you’d be remiss not to say that you always accept those with more exotic looking packages.");
			output("\n\nYou can’t help but bite your [pc.lip] as you peruse the more flattering photos, and you soon find yourself reaching for a dose of Soak. A new semester, a new supply of horny freshmen and their cash. This is your life now. What more could a Soak addict wish for?");
			kGAMECLASS.badEnd();
		}
	}
}
