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
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.indefiniteArticle;
	
	public class LaquineEars extends ItemSlotClass
	{
		
		//constructor
		public function LaquineEars()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.POTION;
			//Used on inventory buttons
			this.shortName = "L. Ears";
			//Regular name
			this.longName = "Laquine Ears"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pair of Laquine Ears";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This product looks like an innocuous pair of headband-mounted bunny ears, but in reality, it is a sophisticated microsurgeon delivery system. The ears themselves store a massive dose of the transforming machines, which are slowly absorbed through the skin of the scalp over twenty-four hours. The wearer is rapidly made to be more like a laquine (a combination lapine/equine), and <b>always</b> gains a pair of bunny ears at the end of the process. A user who already possesses bunny ears will find the product crumbling away when spent, but reports of malfunctions resulting in doubled ears can be found in seedier parts of the extranet. When scrambling one's genome, nothing is certain!\n\nXenogen Biotech is the only remaining producer of Laquine Ears after a drawn-out legal battle over the original patent that drove its smaller competitors out of business. Subsequently, the megacorporation purchased their bankrupted rival's programming secrets at a steep discount to further enhance their own product.\n\n<b>Warning:</b><i> Laquine ears were recently reformulated to introduce a number of TamaniCorp reproduction boosters, designed to counter the sterility plague facing the bouncy bunny-folk. Side effects include: extreme fertility, enhanced virility, rapid pregnancy, and over-enlargement of primary and secondary sexual characteristics.</i>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2700;
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
 		public function hasSharkScales():Boolean
 		{
 			return (kGAMECLASS.pc.skinType == GLOBAL.SKIN_TYPE_SCALES && kGAMECLASS.pc.hasSkinFlag(GLOBAL.FLAG_LUBRICATED));
 		}
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Fenoxo Fenbutt");
			if(target is PlayerCharacter) {
				var pc:Creature = target;
				
				if(pc.hasStatusEffect("Laquine Ears"))
				{
					output("You're already wearing one set of Laquine Ears. Any more would look rather silly. Also, it might give you cancer.");
					if(silly) output(" Horrible, horrible brain cancer.");
					if(!kGAMECLASS.infiniteItems()) quantity++;
					return false;
				}
				if(kGAMECLASS.flags["LAQUINE_EAR_USES"] == undefined)
				{
					output("You give the bunny ears a quick once over before placing them on you’re head. They’re mounted on the same kind of headband you see on Halloween costume pieces every year. The only difference that you can see is that small nubs line inside edge, doubtless to disperse the transformative microsurgeons contained with the ears themselves. If you shake them, the ears audibly slosh. What a weird way to distribute a genemod.");
					output("\n\nYou place them on your head, feeling a slight prickle as they begin to painlessly disperse their body-changing payload into your scalp. The directions say to keep them on for a full twenty-four hours for full effect. That shouldn’t be too hard. All you have to do now is wait");
					if(pc.earType == GLOBAL.TYPE_LAPINE) output(" and hope you don't look too silly with four ears");
					else if(pc.earType == GLOBAL.TYPE_QUAD_LAPINE) output(" and hope you don't look too silly with six ears");
					output(".");
				}
				else
				{
					if(pc.earType == GLOBAL.TYPE_LAPINE || pc.earType == GLOBAL.TYPE_QUAD_LAPINE) output("One pair of bunny ears is never enough.");
					else output("You don't even have a pair of bunny ears.");
					output(" Lucky for you, the Laquine Ears fit nicely atop your head, giving you the appearance of some laquine heritage before they even start to work. You can already feel the muted tingle of microsurgeons painlessly being absorbed by your scalp. In no time at all, you’ll be a sexy horse-bunny. Or in 24 hours, maybe. If not, you can always buy more.");
				}
				return false;
			}			
			else kGAMECLASS.output(target.capitalA + target.short + " puts on the ears for a bit, then tosses them in the garbage.");
			return false;
		}
		public function laquineEarProcDetemmienator(pc:Creature):void
		{
			if(rand(10) < 7) laquineEarsMinorTFsGO(pc);
			else if(rand(4) < 3) middle
			//Placeholder for major procs once I write them!
			else middle
		}
		public function laquineEarsMinorTFsGO(pc:Creature):void
		{
			var x:int = pc.biggestCockIndex();
			//(Penis) Awkward, persistent boner. Large exhibitionism gains.
			//Hypercommon if criteria met to account for otherwise low chance.
			if(pc.hasCock() && inPublic && !pc.hasStatusEffect("Priapism"))
			{
				pc.lust(100);
				textBuff += "You flush from head to toe as your body abruptly shunts ";
				if(pc.biggestCockVolume() >= 800) textBuff += "most of your ";
				textBuff += "blood south to your loins, giving you an absolutely irrepressible erection. Your [pc.cocks] ";
				if(pc.cockTotal() == 1) textBuff += "is";
				else textBuff += "are";
				textBuff += " rock-hard. So hard ";
				if(pc.cockTotal() == 1) textBuff += "it almost hurts";
				else textBuff += "they almost hurt";
				textBuff += ".";
				if(!pc.isCrotchExposed()) textBuff += " Your [pc.crotchCover] presses painfully down upon your rigid tumescence in an awful way, forcing you to reach inside and yank it into a less awkward position";
				if(pc.biggestCockLength() >= 8) 
				{
					textBuff += ". Even then, there’s too much engorged cock in your crotch for you to feel comfortable in your clothing. You have to hunch over as you move to keep from hurting your poor prick";
					if(pc.cockTotal() > 1) textBuff += "s";
					textBuff += ".";
				}
				else
				{
					textBuff += " Your revealing attire clearly highlights your state for all to see.";
					if(pc.biggestCockLength() < 8)
					{
						if(pc.exhibitionism() < 50) textBuff += " Part of you is glad you’re modestly endowed enough that it doesn’t make too big of a show.";
						else textBuff += " Part of you is sad you’re too modestly endowed to make a show of it.";
					}
					else if(pc.biggestCockLength() < 20)
					{
						textBuff += " Part of you can’t help but ";
						if(pc.exhibitionism() >= 50) textBuff += "thrill";
						else textBuff += "cringe";
						textBuff += " at the amount of maleness you have on display. It juts forward no matter how you turn, impossible to ignore and threatening to bump into everything.";
					}
					else
					{
						textBuff += " Part of you can’t help but ";
						if(pc.exhibitionism() >= 66) textBuff += "exult";
						else if(pc.exhibitionism() >= 33) textBuff += "whine";
						else textBuff += "cower in shame";
						textBuff += " at the immense amount of maleness you have on display. It is by far your most prominent feature at the moment, arcing out and up ";
						if(pc.biggestCockLength() < 36) textBuff += "a couple feet";
						else if(pc.biggestCockLength() < 72) textBuff += "several feet";
						else textBuff += "countless feet";
						textBuff += " into the air, bouncing noticeably with every beat of your heart. The veins visibly swell and relax, and you feel your heart thumping in your ears, working overtime to keep your man-meat fully inflated and in view of everyone.";
					}
				}
				textBuff += "\n\nThe unwelcome boner won’t go away either.";
				var fluffChoices:Array = [0,1,2,3,4];
				while(fluffChoices.length > 2)
				{
					fluffChoices.splice(rand(fluffChoices.length),1);
				}
				textBuff += fluffyChoiceDisplay(fluffChoices[0]) + fluffyChoiceDisplay(fluffChoices[1]);
				
				//Covered";
				if(!pc.isCrotchExposed())
				{
					textBuff += "\n\nKeeping yourself penned up inside your [pc.crotchCover] is agony. You fight it as long as you can, wincing and resting in hopes that it will vanish. It doesn’t. Finally, you can bear it no longer. Damn the consequences! You pull your [pc.crotchCover] open to allow your [pc.cocks] to spring out, fully erect and jutting, ";
					if(pc.cockTotal() > 1) textBuff += "each";
					else textBuff += "your";
					textBuff += " cockhead swollen. The open air feels so good against your monstrously swollen prick";
					if(pc.cockTotal() > 1) textBuff += "s";
					textBuff += " that you almost forget that you’re in public, but then, the damage is already done, isn’t it? [pc.EachCock] is on display to any who would dare look.";
				}
				//Merge";
				//Randomly choose one.";
				//General ogle";
				if(rand(4) == 0)
				{
					textBuff += "\n\nMen and women both ogle you as the walk by, whispering softly to each other. Some of them, you note, become aroused as well. More than one pair of pants tents, and at least one girl could cut diamonds with her nipples after staring a little too long to be completely casual.";
					if(pc.exhibitionism() < 33) textBuff += " You try your best to escape the crowds and hide with little success.";
					else if(pc.exhibitionism() < 66) textBuff += " You shyly press your hips forward to better show off, inwardly thrilling to the knowledge that someone is likely to go home and masturbate to you.";
					else textBuff += " You try your best to show off for your impromptu audience, wanting to moisten as many pussies and strain as many waistbands as possible.";
					textBuff += " After everyone in the immediate area has had their fill of your steel-hard member";
					if(pc.cockTotal() > 1) textBuff += "s";
					textBuff += " (and collected hundreds of holos of the bunny-eared " + pc.mf("heir","heiress") + " and [pc.hisHer] troublesome groin), the crowd finally thins.";
				}
				//Female Flashers";
				else if(rand(3) == 0)
				{
					textBuff += "\n\nPlenty of people stop to score a peek at the slutty [pc.race] waving [pc.hisHer] [pc.cocks] for all to see, but there’s a small group of women who stand out from the crowd, mostly due to the size of their chests. They all have tits too large to be entirely natural, and yet they shamelessly display them anyway, wearing tops with plunging necklines, cleavage-displaying holes, or glossy, transparent fabrics.";
					textBuff += "\n\nIn your present state, you cannot stop your eyes from looking, nor your [pc.cockBiggest] from throbbing approvingly";
					if(pc.cumQ() > 4000) textBuff += " and drooling a torrent of [pc.cumVisc] pre-cum to puddle below";
					else if(pc.cumQ() > 2000) textBuff += " and drooling a fat stream of [pc.cumVisc] pre-cum";
					else if(pc.cumQ() > 200) textBuff += " and drooling a steady trickle of [pc.cumVisc] pre-cum";
					else if(pc.cumQ() > 20) textBuff += " and beading a bubble of [pc.cumVisc] pre-cum at its tip";

					textBuff += ".\n\n<i>“Omigod, look at [pc.himHer]!”</i> one chirps, covering her mouth and looking to her friend. Both of their nipples are visible erect.";
					textBuff += "\n\nThe second pouts, <i>“Yeahhh, [pc.heShe]’s hot, but [pc.heShe] looks sooo lonely.”</i> Chewing her lip, she turns to the others and asks, <i>“We should pay him back somehow, right ladies?”</i>";
					textBuff += "\n\n<i>“Ooooh!”</i>";
					textBuff += "\n\n<i>“That sounds fun~”</i>";
					textBuff += "\n\n<i>“I guess, if you guys want to.”</i>";
					textBuff += "\n\n<i>“Don’t pretend you don’t want to, slut!”</i>";
					textBuff += "\n\nThey continue on like that, stepping closer. Soon, the group of big-boobed beauties has you completely surrounded. The first speaker peels her way out of lycra clubwear, revealing a pair of creamy blue boobies. They shine in the light, a product of inhumanly smooth skin. The others follow their leader’s example in short order. One after another, bouncing breasts spill into the immediate area around your head. They press close, tit to tit, nipples inches from your face. One of the girls has the audacity to touch [pc.oneCock], giggling when it jumps in her hand.";
					textBuff += "\n\nYou groan, overwhelmed by the sinful sexuality of it all.";
					textBuff += "\n\nThe girls titter giddily at your reaction and smush closer, smothering your face in breasts and running hands ";
					if(pc.hasHair()) textBuff += "through your [pc.hair]";
					else textBuff += "over your head";
					textBuff += ". They jostle and jiggle, struggling with one another to get their boobs in front of your face. Some of them have multiple nipples on each tit. One has a seemingly unending amount of cleavage due to her two rows of three breasts. Another has smooth, pink scales covering her feminine hemispheres, sliding effortly across your body.";
					textBuff += "\n\nYou whimper again, your [pc.cocks] brushing their legs as their hands brush ";
					if(pc.cockTotal() == 1) textBuff += "it";
					else textBuff += "them";
					textBuff += ", but the leader pulls back before things can get any worse, stuffing her tits back into a top that seems far too small to contain such marvellous melons. <i>“That was fun, but we’re gonna miss our party if we play any longer. Did you enjoy?”</i> Her compatriots likewise pack their boobs away.";
					textBuff += "\n\n<i>“Bu... buh...”</i> You struggle for words, overheated and oxygen starved, vision swimming.";
					textBuff += "\n\nThe whole crowd giggles and turns away, asses swaying, tails flicking, panties moistening. One muses, <i>“It’s too bad [pc.heShe] doesn’t speak English or whatever. I kind of wanted his number.”</i>";
					textBuff += "\n\nThe blue-skinned beauty shrugs. <i>“Yeah, I bet [pc.heShe] would’ve loved this party.”</i> They vanish around a corner.";
				}
				//Drippy trap fapper";
				else if(rand(2) == 0)
				{
					textBuff += "\n\nAmong the curious crowd is one small kui-tan individual, androgynous in the face with wide, curvy hips but lacking in even the most modest amount of chest. It’s the short-cropped hair and obvious bulge in his skirt that identifies his gender - male, despite the other trappings of femininity. He steps forward shyly, waiting for a reaction from you that never comes.";
					textBuff += "\n\nYou’re too busy eyefucking the femmy tanuki-boy, wondering if he’s going to sit on your [pc.cockBiggest], to do much else. The pressure in your loins is too distracting!";
					textBuff += "\n\nHe smiles and lowers himself down, bringing his head level with your crotch. There, he takes an experimental sniff, his animalistic nose twitching. He must like what he smells, because he sighs happily and pushes his nose into your crotch, this time inhaling with such ardor that you could clearly hear it from a dozen feet away.";
					textBuff += "\n\n<i>“Wha...”</i> You shudder when he stands and try to find your voice again, but your brain is suddenly devoid of blood.";
					textBuff += "\n\nThe trap straightens, revealing that his skirt is lifting, and more than that, he’s already dripping. Wet spatters of copious kui-tan prejaculate impact the ground between you. The raccoon boyslut sighs and rolls the skirt up out of the way to an eight-inch member... and a pair of tremendously swollen jewels. No wonder the hem on his skirt was so long. He was packing a pair of overstuffed melons, and the sight of you was just too much for him to resist.";
					textBuff += "\n\nHolding a hand beneath his leaky faucet, the trappy tanuki instantly fills his palm with gooey lust. He smears it over his knotty, burnished brown dick a second later, and moans harder, spurting a thicker line of clear ‘nuki goo across the ground. His wide eyes are fixed on your own throbbing member";
					if(pc.cockTotal() > 1) textBuff += "s";
					textBuff += " as he masturbates. His palm slides slowly at first, pumping once for every little bounce your prick";
					if(pc.cockTotal() > 1) textBuff += "s make";
					else textBuff += " makes";
					textBuff += ", but that rapidly falls away into full-on, furious stroking.";
					textBuff += "\n\nYou watch in disbelief";
					if(pc.cumQ() > 20) textBuff += ", dripping a bit more freely yourself";
					textBuff += ". He’s already masturbating; what harm would it do if you joined him? You reach down for your cock, but the wide-hipped alien grabs you by the wrist and pushes your hand against his furry balls, allowing you to feel the fluid sloshing within them.";
					textBuff += "\n\n<i>“Please,”</i> he whines, <i>“Squeeze.”</i>";
					textBuff += "\n\nYou do so almost before fully comprehending his request. His nut is soft in your hand, spongy almost. When you squeeze on its supple flesh, the tanuki-boy whimpers ecstatically and bucks his hips, throwing a long line of white into a nearby wall. He throws himself against you, his warm, silky body quivering as he erupts, his dick sliding against yours, spurting wildly, pumping and thrusting and spraying white so close to you without actually get on you. Well, a little jizz does dribble down his underside, smearing over your own length, but it’s hardly worthy of comment next to the erotic painting his release is creating.";
					textBuff += "\n\nYou rub the dwindling sack a little longer, feeling it drain its long-stored contents into his passionately twitching form moments before they spray out in long lances of white. The trap’s voice utters constant feminine coos of pleasure into your ear, his inky lips paying service to how sexy you are, and how you drove him to this with your display. How someday he wants to sit out in the open like you, his cock out and ready to be used by the first passerby.";
					textBuff += "\n\nIt’s nearly enough to make you cum yourself, but then he’s finished, kissing you on the cheek and staggering away, staining the front of his hastily donned skirt with still-dripping white. With his disappearance, the erotic moment seems to fade.";
				}
				//Cockpainting - reqs no cockpainting status.";
				else
				{
					textBuff += "\n\nFor a time, you’re merely ogled, but then a face appears among the crowd, brazenly walking up to you with a heavy-looking handbag. She’s a typical example of her race, totally unremarkable in most respects. <i>“I simply must paint you.”</i> Even her voice is forgettable. <i>“Do you consent?”</i>";
					textBuff += "\n\nThat at least sounds like something that might give you an excuse for being exposed, so you eagerly nod.";
					textBuff += "\n\n<i>“Okay then. Hold still.”</i> The alien artist kneels down and opens her bag, but instead of producing some kind of portable easel, she pulls out a tubular spraygun, spins the dial on the back, and kneels ";
					if(pc.legCount > 1) textBuff += "between your [pc.legs]";
					else textBuff += "in front of your [pc.legs]";
					textBuff += ". <i>“A proper base coat is essential.”</i> She pulls the trigger, and you feel a cool tingle as ";
			
					if(pc.cocks[x].cockColor != "pink" && pc.cocks[x].cockColor != "neon pink") textBuff += "neon-pink";
					else textBuff += "matte black";
					textBuff += " pigment spreads across your [pc.cock " + x + "]. She nods to herself, then gently lifts your blissfully engorged length to coat the underside. Your face blushes brighter the more she colors your cock. By the end of your tip-to-base basecoat, onlookers have gathered to watch the creation of art.";
					textBuff += "\n\n<i>“How lovely.”</i> Little miss Pic-a-cock-asso rubs you to make sure the paint has dried, then nods to herself while you try not to moan.";

					//small no new PG";
					if(pc.cocks[x].cLength() < 8)
					{
						textBuff += " <i>“Yes, a glossy pink definitely suits you.”</i> She puts down another layer, this time of ";
						if(pc.cocks[x].cockColor != "pink" && pc.cocks[x].cockColor != "neon pink") textBuff += "pure gloss to really make the pink pop.";
						else textBuff += "an even brighter pink than your natural color.";
						textBuff += "\n\n<i>“Now to dress this cutie up.”</i> She pulls a smaller device from her back and spins the dial to select a glossy-looking purple. She slowly circles around your [pc.cockHead " + x + "], laying on a coat so thick it creates a raised ring. Then she grabs you by said ring, squeezing tight enough that it’s almost painful. One handed, the artist sketches a throbbing heart around your ";
						if(pc.cumQ() >= 200) textBuff += "leaky ";
						textBuff += "urethra, then accents it with tiny purple flowers. Another few seconds has her filling in the heart, leaving the barest slit for you to cum through. <i>“Lovely, but it’s still missing something...”</i>";
						textBuff += "\n\nThe cock-painter snaps her fingers in sudden inspiration. <i>“A little guy like this needs some volumizing and texture to truly meet his full potential.”</i> She reaches behind her and grabs another device, still holding the line tool in her right hand. Then she lays into your shaft, spinning an even thicker line out from your [pc.sheathOrKnot " + x + "], slowly curling its way up your length. At the same time, she ambidextrously adds details in between the ridges - red lipstick prints, pretty stars, and even a bit of text at the root that says, <i>“fuck me.”</i>";
					}
					//Hyper no new PG";
					else if(pc.cocks[x].cLength() >= 36)
					{
						textBuff += " <i>“Subjects like you really make me feel like I should pack more pigment on these little excursions. Fortunately, I think I can still have you covered. We’ll just have to do a little mixing.”</i> She puts down another layer, starting with a rich, iridescent purple, right around your [pc.knotOrSheath " + x + "].";
						textBuff += "\n\n<i>“I’ve seen galotians get practically hypnotized by members this large - New Texans too. A rainbow of pretty colors ought to accentuate the effect.”</i> The penis-painting alien swaps through a number of colors in sequence, each time covering a little more of your dick in pigments. After purple comes blue, then green, yellow, and so on through all the colors of the rainbow. Each new coat brings with it a sensuous tingle, forcing you to agonizing heights of arousal with no relief. By the time she finishes, your penis looks like it would be more at home in the sky after a rainstorm than on your crotch.";
						textBuff += "\n\n<i>“Any artist with an airbrush could pull off this look, but it takes a master to transform the rainbow pattern into a fractal masterpiece.”</i> She swaps her bulk sprayer for a smaller detail tool and goes to work. <i>“Every blending between colors is an opportunity to lay out a new pattern, mathematical in precision but with the sort of beauty you’d find in nature.”</i> Her hands gently caress you as she works, the short bursts of sprayed colors tickling already hyper-sensitized neves. When you look down, your eyes nearly cross from the hyper-detailed rainbow that fills your view.";
						textBuff += "\n\nStill working, the artist chides, <i>“Hold still, I’m not done yet.”</i> She swaps back to her bigger sprayer and selects something that looks like clear coat. <i>“Just have to put a few more touches on it.”</i> She lacquers your cock from [pc.sheathOrKnot " + x + "] to tip, giving it a glossy shine that would draw the eye even without the hypnotic rainbow scrawled across your length. <i>“Annnnd, here we go.”</i> The gun flashes blindingly bright, and when you look back at your dick, it’s <i>twinkling</i>. A sea of glittery lights sparkle in and out of existence all over, completing the dazzling look.";
						textBuff += "\n\nThe perverse painter pulls her lining tool out and draws a few enormous kiss-marks on different parts of your [pc.cock " + x + "]. <i>“The appearance of popularity ought to get the girls even more worked up.”</i> She kisses her own work then, blushing. <i>“But you’re already popular with me.”</i> Right where she kissed, she sculpts a big pair of green lips out of the thick pigments. Atop them, she writes out in big looping letters, <i>“Galaxy’s Best Dick.”</i>";
					}					
					//Horsecock no new PG";
					else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_BLUNTED) && pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED))
					{
						textBuff += " <i>“Yes, a gleaming black would suit you. It must look every bit as glossy as a meticulously brushed show pony.”</i> She puts down another layer, this time in ultra-shiny black, as deep and dark as the deepest ocean and as reflective as a well-cut gemstone.";
						textBuff += "\n\n<i>“Now we can’t have an animal like this just running willy nilly all over the barnyard, knocking up all our mares, can we?”</i> She looks up at you, eyes twinkling as she pulls a new tool from her bag. This one is much smaller. She selects a tawny color and presses it to the underside of your equine dick, just below the blunted head, and pulls the trigger. Thicker paint comes out of this one, building up into a textured band that she slowly draws the whole way around your flaring cock. Once complete, she draws two connecting lines across the very top, giving it the appearance of wearing a leather harness. Four quick sprays create gleaming, metallic-looking connectors.";
						textBuff += "\n\n<i>“We need a lead for the handler, of course.”</i> She pushes your dick up and connects another band of yellow-brown color to the faux harness, slowly working it down the underside of your dick along the urethra. She makes sure that this band is the thickest one yet, but she’s quick to cross the medial ring, making your <i>“lead”</i> truly look like more than mere penis-paint. Another ring is created just outside your sheath, every bit as thick as the lead, which is then <i>“bolted”</i> to it with a flash of golden color.";
						if(pc.hasSheath(x)) textBuff += " When you go soft, you’re sure to feel the raised art rubbing on the sensitive interior of your sheath.";
						textBuff += "\n\nYour cock throbs mightily, but this perverted princess of pigment is far from done. She swaps the line tool for a smaller one, for fine details, then proceeds to lay in lines alongside the bands. They don’t look like much at first, but after a minute, you realize they make you look like your glossy-black horse-dick is bulging against the bands, like there’s so much swelling up inside the harness that it’s trying to split its way out. A circular ornament near the baseband completes the look, bearing a line of embossed text that reads, <i>“Free Stud Services.”</i>";
					}
					//Dogcock no new PG";
					else if((pc.cocks[x].cType == GLOBAL.TYPE_CANINE || pc.cocks[x].cType == GLOBAL.TYPE_KORGONNE || pc.cocks[x].cType == GLOBAL.TYPE_AUSAR || pc.cocks[x].cType == GLOBAL.TYPE_MILODAN) && pc.hasKnot(x))
					{
						textBuff += " <i>“While orange would be traditional for canine-style cocks, I think a neon orange lends them a certain eye-catching flair.”</i> She puts down another layer, this time an orange so bright it practically glows.";
						textBuff += "\n\n<i>“After all, a big dog-dick like this needs to properly advertise that it’s a real bitch-breaker.”</i> She squeezes you around your base to hold you still while reaching back into her back for another tool. This one is smaller than the big sprayer, with a more precise tip. She thumbs it over to black while sizing up your knot, gently squeezing. <i>“I’d be doing my galactic sisters a disservice if I didn’t properly tag this dangerous equipment.”</i> She brings her sprayer up, just below the tip of your urethra and begins to lay down a thick line of instantly bonding-pigment, heavy enough that it’ll provide a raised texture for your future partners. She expertly creates one short diagonal line, then another in perfect parallel, working until your whole [pc.cock " + x + "] is snugly encased in the kind of black-and-orange warning pattern you’d see on construction equipment.";
						textBuff += "\n\nThrough it all, your arousal has only climbed, enlarging your knot alongside it.";
						textBuff += "\n\n<i>“Oh my, that’s a real wrecking ball you’ve got there. Let’s make it look the part, shall we?”</i> She artfully spins her <i>“gun”</i> on a finger, showing off a little before bringing it down against your thickening canine anatomy. This time, she doesn’t make small lines, instead choosing to fill the entire area with metallic black. By the time she finishes, your [pc.cock " + x + "] is twitching and dripping in eagerness, but she is far from finished.";
						textBuff += "\n\nThe penis-painter changes out her liner for a detail gun and goes right back to work, texturing your bulbous knot to better resemble the construction equipment to which she compared it. She even goes through the trouble to paint a small, glittering chain from your urethral slit down underside to connect to the <i>“ball”</i> itself. As a final touch, in bright orange, she paints, <i>“Bitch Wrecker”</i> on top of your knot.";
					}
					//normal no new PG";
					else
					{
						textBuff += " <i>“Yes, a semi gloss blue definitely suits you, though I hardly think you’ll struggle with blue balls once I’m done.”</i> She puts down another layer, this time of a rich, regal-looking blue.";
						textBuff += "\n\n<i>“Now to dress this guy up.”</i> She pulls a smaller device from her back and spins the dial to select a glossy-looking red, then clicks it to add a purple gradient into the mix. She starts near your [pc.sheathOrKnot " + x + "]. This time it isn’t just a light coat of body paint but a thicker slurry that builds up as she sprays it, allowing her to create jutting purple-to-red spikes, rounded at the tips to rub on sensitive nerves. She lays them out all over your shaft, bigger at the base and smaller and more purple at the tip, with a gentler, almost innocuous curvature. <i>“Mmm, now that looks like a wonderful member, but it still lacks a certain pizazz.”</i>";
						textBuff += "\n\nThe cock-painter snaps her fingers in sudden inspiration. <i>“A big guy like this needs a crown worthy of a king, something to get the ladies.”</i> She looks up at you, then shrugs and adds, <i>“Or boys, whichever. They need to know that you have a vessel fit for royal vaginas.”</i> She toggles the color over to orange and lays out a crown over your tip, lighter textured than the nubs but with enough of a ridge for your partner to feel it.";
						textBuff += "\n\n<i>“Good... but it needs more.”</i> She swaps the color to a gem-like ruby and embeds extra adornments to the golden crest. In no time at all, your member looks positively regal from the top - and positively fuck-hungry below. Your alien artist isn’t done yet, however. She grabs a different device from her bag and proceeds to put extra detail work in-between the jutting cockstuds. In some places, she highlights the bulge of your veins, in others she adds faux black bands that appear to be cinched down about your girth. Finally, she scrawls, <i>“Sex God”</i> on your [pc.knot " + x + "].";
					}
					//Merge";
					textBuff += "\n\nWith her work complete, the artist pulls out her phone and snaps a quick holo, being sure to scan you from every single side{, ignoring the pre-cum pouring out of your prettied-up penis}. <i>“Thanks";
					if(flags["COCK_PAINTED_EXHIB_EVENT"] != undefined) textBuff += " again";
					textBuff += ". You";
					if(flags["COCK_PAINTED_EXHIB_EVENT"] != undefined) textBuff += "’re always a wonderful subject";
					else textBuff += " were a wonderful subject.";
					textBuff += "”</i> She starts to leave, then sees your questioning look. <i>“";
					if(flags["COCK_PAINTED_EXHIB_EVENT"] == undefined) textBuff += "The Organobond paint only lasts a few weeks, so don’t sweat it too much. Maybe I’ll paint you again sometime. Y";
					else textBuff += "Like I said last time, the Organobond paint only lasts a few weeks, and y";
					textBuff += "ou can always find my sister’s shop if you want to pay for ‘fine’ art.”</i> She sniffs disdainfully and vanishes into the rapidly dispersing crowd.";
					IncrementFlag("COCK_PAINTED_EXHIB_EVENT");
				}
				//Merge";
				textBuff += "\n\nIt’s at that moment that you feel your blood pressure stabilize and your [pc.cocks] softening by the slightest amount. Your flush gradually - very gradually fades, and while you are still horny, you are confident that in a short amount of time, ";
				if(pc.isCrotchExposed()) textBuff += "you’ll be back to normal";
				else textBuff += "able to tuck yourself away. Whew";
				textBuff += ".";
				pc.exhibitionism(2);
				textBuff = ParseText(textBuff);
				//Reduce lust now that it's over.
				pc.lust(-50);
			}

			var maxSize:Number = 0;
			if(pc.hasPerk("Mini")) maxSize = 10;
			else if(pc.hasPerk("Hung")) maxSize = 20;
			else maxSize = 16;
			var cocks:Array = [];
			for(x = 0; x < pc.cockTotal(); x++)
			{
				if(pc.cocks[x].cLength() < maxSize) cocks.push(x);
			}
			//(Penis) Minor length gain (0.1”</i>-0.2”</i>) up to (10"mini/16”</i> norm/20”</i> hung)";
			if(cocks.length > 0)
			{
				x = cocks[rand(cocks.length)];
				if(pc.cocks[x].cLength() < 6) textBuff += "\n\nTightness radiates from your [pc.cock " + x + "] as it grows palpably bigger, though not by a tremendous amount - just enough for you to know that the Laquine Ears are definitely working on the equine part of their name.";
				//Less than 10”</i>";
				else if(pc.cocks[x].cLength() < 10) textBuff += "\n\nOoh, your [pc.cock " + x + "] gets nice and warm, like it’s being dipped into a hot tub and swelling up from the heat. The sensation fades a few seconds later, but the slight addition to your size remains.";
				//Less than 16”</i>";
				else if(pc.cocks[x].cLength() < 16) textBuff += "\n\nStifling an unexpected moan, you shudder as pleasure races through your body, pooling in your [pc.cock " + x + "]. As a matter of fact, that pleasure seems to be collecting inside it, feeling almost like it’s swelling you with expansive euphoria. You measure yourself disbelievingly, but you have in fact gained a small fraction of an inch in length.";
				//else";
				else textBuff += "\n\nYour [pc.cock " + x + "] briefly swells, not notable in and of itself, but this time it feels a little different, like something more than just getting a boner. You check as the feeling fades, but you can’t spot any real difference. Maybe you gained some imperceptible amount of length from the Laquine Ears. Maybe not. It’s tough to tell when you’re swinging around such a big dick.";
				textBuff += laquineDickSizeAlert(pc.cocks[x].cLength(), pc.cocks[x].cLength() + 0.2);
				pc.cocks[x].cLength(0.2);
			}
			if(pc.balls > 0 && pc.ballDiameter() < 4 && pc.hasCock())
			{
				//(Balls & Penor) Minor ball size gain of 0.1. Max 4”</i> diameter";
				//less than 1”</i>";
				if(pc.ballDiameter() < 1) textBuff += "\n\nWarmth flows through your [pc.sack], leaving you with slightly larger [pc.balls].";
				//Less than 2”</i>";
				else if(pc.ballDiameter() < 2) 
				{
					textBuff += "\n\nA tenderness wells up in your [pc.sack], pulling it tight to your body. You reach down and gently probe your [pc.balls], feeling ";
					if(pc.balls == 1) textBuff += "it";
					else textBuff += "them";
					textBuff += " relax a moment later. You think you’ve gotten slightly larger.";
				}
				//Less than 3”</i>";
				else if(pc.ballDiameter() < 3)
				{
					textBuff += "\n\nYou sit down for a moment to rest, and something unusual happens. A sharp twinge of pain pinches your [pc.sack]";
					if(pc.legCount > 1) textBuff += ", forcing you to spread your [pc.legs]";
					else textBuff += ", forcing you to stretch out";
					textBuff += " to take the pressure off. Gently rubbing, the pain fades, but you find your [pc.balls] a little heavier than before.";
				}
				//Less than 4”</i>";
				else
				{
					textBuff += "\n\nAn achingly pleasant throb runs through your [pc.balls] once... twice, then fades into nothing. You shift around, gently rubbing your swollen sack, feeling a little more lusty and a lot more potent. Your balls have gotten slightly larger.";
				}
				laquineBallSizeUp(pc);
			}
			//(Penorhaver) Bunnygirl Hallucinations +10 lust";
			if(pc.hasCock())
			{
				AddLogEvent(ParseText(bunnygirlFapScene()));
				return;
			}
			//(cuntwielder, nonpreg in one cunny) Bunnyhorse fantasies +10 lust";
			if(pc.hasVagina())
			{
				AddLogEvent(ParseText(bunnyguyFapScene()));
				return;
			}
			

			//(Vagicite) Awkward, random wetness with obvious pheromonal smell. Exhibition gains!";
			textBuff += "You catch a whiff of a familiar smell... like pussy. Rich, fertile, hormonal pussy. {public:You cast your eyes around to look for the source. Perhaps a sly woman is having a little play with a hidden vibrator. That or there’s a soaking wet mynx looking for dick around the corner./You briefly cast your eyes around, suspecting an ambush from some horny alien. Perhaps there is some plant life that smells just like vaginal secretions?} No, wait. You’re the one that smells like sex. You’re the one with a {drooling/sopping/soaked/slippery} slit, the one whose pussy is putting out more pheromones that you thought your body capable of.";
			//Public";
			textBuff += "{Omigod, you can’t believe you got so wet from nothing at all. It makes you so happy, knowing that you don’t even need to think of boys to get all slutty and drippy!/It’s so embarrassing to know that you’re out in public, smelling like some freshly fucked slut. Your blush is so intense that it burns./It’s sort of embarrassing to know that anyone who walks past you will think you smell like sex, that you’re a wet and willing piece of ass who’s all juiced up from her latest tryst. At the same time, you can enjoy the thrill it gives you. After all, you look no different than at any other time, save for a little additional dampness in the crotch./It’s so exciting, knowing that everyone around you can smell you, how wet and ready you are to be taken and fucked. You discretely fan yourself to spread the smell around, smiling when you catch an upturned nose and tightened trousers.} [pc.GirlCum] trickles down your [pc.thighs] as you walk, soaking into your [pc.skinFurScales]. You’re going to need a shower if you ever want to stop smelling like pussy.";
			//Not public";
			textBuff += "What if someone approaches you while you’re like this? {Your cheeks go crimson in shame, but it doesn’t stop the scent from dripping forth from your [pc.vaginas]./Your cheeks go crimson with a mix of shame and arousal. They’ll know how your body is misbehaving, making you smell like a slut in heat. It’s sort of sexy, knowing they’ll probably get a huge boner before they even see you. And then you’ll have to fight them off... or let them fuck you./You flush in arousal at the thought. They’ll know your body is just a big fountain of fuckable wetness and slut-scents, and they’ll have the biggest, horniest boner, all for you. You catch yourself whimpering a time or two, the flow of lubrication thickening.} [pc.GirlCum] is getting all over your thighs, soaking into your [pc.skinFurScales]. You’ll need a shower if you ever want to stop smelling like pussy!";
			textBuff += "<b>These {sexy/stupid} Laquine Ears are turning you into a horny bunny!</b>";
			//Pussysoaked stats!";
			//Mild exhibitionism gain";
			//(Vag && noheat && !preggos) Heat status for 1 week or till preggers. Temporary fertileboost.";
			textBuff += "An unbidden fantasy bursts upon you. What if you got pregnant? {Back at Tavros, y/Y}ou have that whole nursery deck. Getting knocked up could be an advantage for you rather than a hindrance. Your [pc.belly] would swell up with young, all round and sexy, your [pc.nipples] dripping milk at the slightest provocation for your lovers and young alike. Your eyelashes flutter as you imagine yourself like that, [pc.legs] spreads and [pc.vaginas] dripping, so horny from your body’s altered hormones that you can outfuck even the most libidinous aliens.";
			//legs";
			textBuff += "Then you realize that your [pc.legs] are sort of spread, all but begging passersby to breed you.";
			//No legs";
			textBuff += "Then you realize that you’re sort of sticking your [pc.butt] out, all but inviting passersby to breed you.";
			//Merge no new pg";
			textBuff += "{ Your [pc.tails] {lift and wiggle/lifts and wiggles}, an implicit advertisement of your desire to be taken and bred.} Why are you like this? Why can’t you stop? You’ll do your best to stand normally, but the moment you stop thinking about, you slip back into that submissive, needy pose. You feel flushed, hot, and a little dizzy, like you’re going to fall down in front of the first man you see, ass in the air, pussy on display. <b>Are you in heat? Is this what heat feels like?</b> There’s definitely an empty feeling in your womb, one that you instinctively understand that only a child could fix. Maybe you should go get knocked up - just get pounded by boy after boy until you get to be a mommy.";
			//Yay, heat!";
			//(Vag) Feeling of emptiness leads to fingering... +5 vag capacity to max of 20";
			textBuff += "A palpable sensation of emptiness overwhelms you, though not everywhere. It centers {between your [pc.legs]/below the waist} in your [pc.vagina " + x + "]. You try to ignore it, but it only grows stronger the longer you wait. Fuck it! You cast your eyes around, making sure that nobody is paying you any mind, then stuff your fingers deep into your [pc.vagina " + x + "], finding that they slip in with far more ease than they ought to. <b>Though you are no looser, you can take larger insertions with ease, allowing you to take bigger dicks before you start to stretch.<b>";
			textBuff += "The urge fades, but not before you have a dizzy grin plastered on your face.";
			//+lust";

			//(Hueg Boobers) Loose a cup size down to G.";
			textBuff += "Your [pc.chest] isn’t quite as wobbly. You feel around, discovering that <b>{you’re now fit/your biggest tits have shrunk down to} X-Cups</b>. If you want huge tits, it might be best to get them back after you finish up with the Laquine Ears. After all, how would you hop about with eighty pound boobs hanging off your chest?";
			//Craving for grass  + slowstatgain(1) aim to AQ50.";
			textBuff += "You feel a little peckish. You could really go for a salad. No dressing or anything, just lush, leafy greens for you to nibble on. You would wolf down buckets of the stuff, you’re sure. Mmm, that would be the best. Your eyes dart around, keen and steady, looking for something to munch on. Even grass would do! <b>Your aim is more focused.</b>";
			//Nose twitches  + slowstatgain(1) reflex to RQ50.";
			textBuff += "Your nose won’t stop twitching, wrinkling and relaxing in rapid succession. You must look like some kind of rabbit, sniffing with your nose cutely wiggling. It stops after a minute of involuntarily adorableness, but not before leaving you feeling extra twitchy all over. <b>Your reflexes have improved</b>.";
		}
		
		public function fluffyChoiceDisplay(arg:Number):String 
		{
			if(arg == 0) return " When you try to do some math, the numbers just wind up fucking.";
			else if(arg == 1) return " When you picture a disgusting old woman, your mind peels back the effects of age to see the beauty she once was.";
			else if(arg == 2) return " When you shake your head to try and get ahold of yourself, it just makes your [pc.cocks] wiggle, pleasantly tugging on your excited loins.";
			else if(arg == 3) return " When you flex your other muscles, trying to draw the blood away, [pc.eachCock] flexes too, shattering your focus on anything but your excited loins.";
			else if(arg == 4) return " When you think about something nonsexual, like your ship for instance, you can’t help but notice how graceful its curves are, how pretty a figure it cuts against the stars, and how much you’d love to make love with a cute bunny-girl on top of it.";
			else return " When you try to distract yourself with stellar navigation, you instead mentally draw sexy constellations among the stars, clumping whole systems together into curvy, rabbit-eared lasses.";
		}
		public function laquineDickSizeAlert(old:Number,new:Number):String
		{
			//seven inches";
			if(old < 7 && new >= 7) return " <b>You’ve crossed over the threshold to having a seven inch dick - average for Terrans in this galaxy.</b>";
			//11”</i>+";
			else if(old < 11 && new >= 11) return " <b>You’re nearly a foot long. It’ll be almost impossible to hide, but on the flipside, there’s so much more of you to please. You can only imagine how good sinking all these inches in is going to feel.</b>";
			//Fourteen";
			else if(old < 14 && new >= 14) return " <b>You’re big enough to match the length of many races’ forearms. Big enough to put a bulge in almost anyone’s belly.</b>";
			//18+";
			else if(old < 18 && new >= 18) return " <b>You’d better be careful now that your dick is this big. An errant boner could easily rip right through cheap underwear. On the flipside, you’re fairly certain you can please a centaur with ease.</b>";
			return "";
		}
		public function laquineBallSizeUp(pc:Creature):void
		{
			var targetS:Number = 1;
			if(pc.ballDiameter() < 1) targetS = 1;
			else if(pc.ballDiameter() < 2) targetS = 2;
			else if(pc.ballDiameter() < 3) targetS = 3;
			else if(pc.ballDiameter() < 4) targetS = 4;
			while(pc.ballDiameter() < targetS)
			{
				pc.ballSizeRaw += 1;
			}
		}
		public function lassLaquineAcceptable():Boolean
		{
			return (pc.earType == GLOBAL.TYPE_LAPINE && pc.cocks[x].cType = GLOBAL.TYPE_EQUINE && pc.tailCount >= 1 && pc.tailType == GLOBAL.TYPE_LAPINE && pc.armType == GLOBAL.TYPE_LAPINE);
		}
		public function bunnyGirlFapScene(masturbate:Boolean = false):void
		{
			var textBuff:String = "";
			if(masturbate)
			{
				clearOutput();
				showName("HORNY\nBUNNY");
				textBuff += "Thinking back to the imaginary bunny-girl Laquine Ears introduced you to, you mentally call out to her, wishing for her to arrive and help you out with your troublesome, animalistic lust. There’s nothing there when you open your eyes, however. The scene is the same as the last time you looked around.\n\n";
			}
			if(flags["LAQUINE_LASS_TRYSTS"] == undefined) textBuff += "You catch a flash of movement out of the corner of your eye. Was that... a pair of bunny ears? They disappeared behind a corner, but you could swear you caught a glimpse of a white-furred bunnygirl. A faint giggle carries to your ears on the breeze from behind you, and you spin to find her standing there - a nude laquine female, giggling at the imitation ears on your headband.";
			}
			//1";
			else if(rand(4) == 0) textBuff += "<i>“Surprise!”</i> the girlish voice of your hallucinatory lover chirps as she vaults over your head, twirling through the air with inhuman agility to land some ten feet away. Those rabbit legs are truly powerful.";
			//2";
			else if(rand(3) == 0) textBuff += "<i>“Over here!”</i> the familiar voice of your hallucinatory lover chirps from the right. You look that way but can’t quite find her. When you look back in frustration, she’s standing straight in front of you, smiling shyly. <i>“Good to know I can still surprise you,”</i> she giggles, brushing a floppy ear into position.";
			//3";
			else if(rand(2) == 0) textBuff += "<i>“Look out below!”</i> your hallucinatory lover screams from somewhere high above, moments before crashing down in front of you. A ring of dust puffs outward from her hard landing, but she looks just fine as she stands up. Better than fine even. <i>“Sorry about that. Didn’t want you to get bored and change your mind waiting for me...”</i>";
			//4";
			else textBuff += "<i>“Hi.”</i> Your hallucinatory lover appears in the blink of an eye, literally. One moment there’s empty space, the next she’s standing there, bouncing on her large footpaws and grinning. <i>“So glad I didn’t miss it.”</i> Her nose twitches. <i>“I couldn’t bear to know you had to take care of your dick all by yourself.”</i>";
			//Merge";
			textBuff += "\n\nShe’s very typical of her race, with big fluffy footpaws, silky body fur that does little to hide her ";
			if(flags["LAQUINE_LASS_TRYSTS"] == undefined) textBuff += "pert, B-cup";
			else if(flags["LAQUINE_LASS_TRYSTS"] == 1) textBuff += "bouncy, D-cup";
			else if(flags["LAQUINE_LASS_TRYSTS"] == 2) textBuff += "motherly E-cup";
			else if(flags["LAQUINE_LASS_TRYSTS"] == 3) textBuff += "pillowy FF-cup";
			else textBuff += "milky M-cup";
			textBuff += " breasts, and long, droopy ears that hang down the back of her head as she nervously approaches you. The closer she gets, the more you can make out the finer details of her appearance. Pink nipples jut teasingly from amongst her ivory fur, and her eyes are a brilliantly reflective copper. Most importantly of all, you realize that you can smell the fertile scent of her pussy";
			if(flags["LAQUINE_LASS_TRYSTS"] != undefined) textBuff += " once again";
			textBuff += ". She’s in heat";
			if(flags["LAQUINE_LASS_TRYSTS"] != undefined) textBuff += " and ready for her next breeding! How does she pop out kids so fast?";
			textBuff += "!";
			textBuff += "\n\nWordlessly, she sinks to her knees in front of you. Her puffy tail twitches happily as she nuzzles up to your crotch. Her fingers deftly seek out your [pc.cockBiggest]";
			if(!pc.isCrotchExposed()) textBuff += ", tugging it free from its irksome confinement.";
			else textBuff += ", gently cradling it.";
			var x:int = pc.biggestCockIndex();
			//2smol. No new PG.";
			if(pc.cocks[x].cLength() < 8)
			{
				textBuff += " <i>“Oh my it’s so small still. You aren’t quite big enough to mate a girl like me, not yet.”</i> She rubs you slyly, teasing your undersized dick with her fluffy, paw-like hands. <i>“You’re going to have to use more Laquine Ears if you want to be " + pc.mf("man","woman") + " enough. And after that, maybe keep using them, just to see how big you can get.”</i> She kisses your [pc.cockHeadBiggest], slipping her tongue out to whirl around it. <i>“I’d better be on my way. Maybe you’ll be big enough to breed me next time...”</i>";
				textBuff += "\n\nThe mysterious laquine rolls away, a sad smile on her face. <i>“My pussy is just so... empty.”</i>";
				textBuff += "\n\nYou reach for her, but she’s already hopping away. The further she gets, the less visible her form becomes until she vanishes entirely, like she never existed at all. Did you just hallucinate that? Even if the bunny wasn’t real, the leftover arousal is.";
				pc.lust(10);
				return textBuff;
			}
			//Normal";
			if(pc.cocks[x].cLength < 16)
			{
				textBuff += " <i>“Ooooh, ";
				if(pc.cocks[x].cType != GLOBAL.TYPE_EQUINE) textBuff += "you’re pretty decently sized! A dick like this could tempt any girl onto it.";
				else textBuff += "you’re looking like a real laquine now. Even have the dick for it.";
				textBuff += "”</i> She rubs you slowly, seeming to measure your length as she does it. <i>“I don’t know... I don’t know if this is enough for me though.”</i> She chews a lip, looking up at you sadly. <i>“I think only the biggest, bulgiest laquines can scratch the itch inside me.”</i> A needy whimper escapes her throat. <i>“But maybe... maybe if we try hard enough, you can cool my heat. Can I... can I fuck you?”</i>";
				textBuff += "\n\nYou start to think about it, but your hard dick intrudes on your thoughts, bashing aside reason, sense, and consideration aside from how hard it is out of the way. <i>“Yes.”</i> You shift your hips forward to better display it. <i>“Oh God, yes!”</i>";
				textBuff += "\n\nThe bunny nods to herself, gaze firming into a determined glare. <i>“Okay. Let’s do this.”</i> She leaps up, propelled on powerful lapine feet, into your arms, hanging off your shoulders with ease. She’s surprisingly light for her size, but you suppose ";
				if(flags["LAQUINE_LASS_TRYSTS"] == 1) textBuff += "laquines must be light as a species. There’s certainly no better explanation for it.";
				else textBuff += "a hallucination would be.";
				textBuff += " Her pussy dribbles fresh lube over your [pc.cockBiggest] as she adjusts the ears on your head. <i>“Make sure to keep wearing these so you get nice and big.”</i> The bunny-girl sinks slowly down until her plush lips are kissing your [pc.cockHeadBiggest], letting you feel the heat washing off her hormonal, pregnancy-prepared pussy. <i>“Bigger and more virile.”</i> She whimpers and lets go.";
				textBuff += "\n\nInstead of sinking deep into her pink tunnel, the sensation vanishes as the laquine abruptly loses cohesion, briefly turning transparent before fading away. Faintly you can hear her voice crying, <i>“Noooooooo!”</i> as she disappears.";
				textBuff += "The whole thing was a vivid hallucination, but the boner you got from it was definitely not illusory in the slightest.";
				if(!pc.isCrotchExposed()) textBuff += " You’ll be walking bow-legged for a moment until it goes down.";
				pc.lust(100);
				return ParseText(textBuff);
			}
			//2hueg. No new PG.";
			else
			{
				IncrementFlag("LAQUINE_LASS_TRYSTS");
				textBuff += " <i>“";
				if(flags["LAQUINE_LASS_TRYSTS"] > 1) textBuff += "Oh my gawsh! I’ll never get tired of touching this.";
				else textBuff += "Oh my gawsh! It’s so big.";
				textBuff += "”</i> She rubs you slyly, taking her time to caress every massive vein along the path of her exploration. <i>“";
				if(lassLaquineAcceptable())
				{
					textBuff += "I cannot imagine a more fitting partner to take me. Your dick is so big, so perfect.”</i> She kisses it. <i>“And your body... you’re laquine to the core. I can feel it, throbbing through your dick. You know this is our purpose.”</i>";
					flags["LAQUINE_LASS_BUNSCORED"] = 1;
				}
				else if(flags["LAQUINE_LASS_BUNSCORED"] != undefined) textBuff += "What happened to you? You were supposed to be my laquine alpha...”</i> Her nose twitches, searching your musky cockscent for clues. <i>“You’re still laquine enough for now, I guess, but please... please put on Laquine Ears. I need my perfect bunny mate or we can’t keep fucking. It’s our purpose to breed, you and I. Promise me you’ll put some on, and I’ll fuck you forever.”</i>";
				else textBuff += "You aren’t all laquine yet, though, are you?”</i> Her nose twitches, searching your musky cockscent for clues. <i>“You’re still... sort of Terran.”</i> She nuzzles the side of your dick. <i>“But no Terran has a dick like this. No true Terran floods their head with machines designed to turn them into a big-dicked, horse-bunny.”</i> She kisses your member. <i>“You can try to breed me, but it won’t sate me for long. Please, go full laquine, for me.”</i> She pouts at you, one ear draped across your throbbing immensity. <i>“Once you’re my bunnystud alpha, I’ll never need to ache for cum again.”</i> She squeezes you. <i>“You can feel it, can’t you? Your body transforming, telling you that this is its purpose?”</i>";
				textBuff += "\n\nYou start to shake your head, but your [pc.cockBiggest] throbs mightily, and not just physically. You feel it swell in your mind, pushing other thoughts out of the way to make room for more important drives. <i>“Yes.”</i> The words slips through your lips in a pleasured hiss as the svelte girl-bun dapples you with kisses.";
				textBuff += "\n\nHer ears perk, lifting until they’re nearly as vertical and rigid as your [pc.cockNounBiggest]. The fertile hare smiles knowingly up at you, then slowly turns away, putting her forepaws on the ground and lifting her ass up beneath you so that your giant-sized rod lays across her back. Her ears swivel to listen to anything you have to say, primed and ready for instruction. Her tail twitches eagerly. Its poofiness sends pleasant tickles through the side of your shaft. <i>“Please,”</i> she begs, <i>“Breed me. Fuck me so pregnant!”</i>";
				textBuff += "\n\nYou push her shoulders down, lifting her ass higher. The slit between her legs is bright pink and exquisitely puffy. A marble-sized clit peeks out of the bottom of it, already soaked with the same clear juices that matt down the fur of her inner thighs. You note that the entrance is so hungry that it occasionally pops open before snapping back closed, winking at you, coaxing you to thrust inside.";
				textBuff += "\n\nAs if you needed the encouragement. You press against her, ";
				if(flags["LAQUINE_LASS_TRYSTS"] > 1) textBuff += "delighted to discover that she parts for you even more easily than before, her body somehow changing at a molecular level to be ever more efficient at taking your deepest dickings.";
				else textBuff += "surprised to discover that she parts without issue. Her body seems only casually acquainted with the laws of physics, like on some quantum level she exists for the sole purpose of taking the largest members the galaxy has to offer.";
				textBuffer += " She’s still quite tight, like a silken sleeve that hugs every inch you offer. She doesn’t moan when you thrust inside but instead squeaks, high pitched and feminine. Her body never offers much resistance. You can bulge her belly with the outline of your [pc.cockHeadBiggest], and she just whines for more. She’s a greedy, insatiable fuck-slut, and she won’t be satisfied until your [pc.sheath] is wrapped up snugly in her cunt-lips.";
				textBuff += "\n\n<i>“More!”</i> the laquine pants, finally scraping together enough sense to assemble a single syllable.";
				textBuff += "\n\nYour [pc.hips] push forward until they slap wetly against her inhuman mons. <i>“Take it slut!”</i> The words come out on their own, without an ounce of thought on your part";
				if(pc.isTreated()) textBuff += ", which isn’t that different from normal ever since you took the Treatment";
				textBuff += ". Grabbing her ass, you start fucking her in earnest, making her gurgle and squeak with bliss, watching your cock bulge her belly into the most obscene shapes as you pound her. She’s like a sapient, squeaking sex-toy, good for little more than taking big dicks, getting pregnant, and talking about how much she loves it. <i>“Beg for it.”</i>";
				textBuff += "\n\n<i>“Please!”</i> She chirps with pleasure, ass wiggling, squeezing down around your [pc.knotOrSheath " + x + "]. <i>“It’s like an itch that won’t go away...”</i> Whimpering, the breeding bitch, fondles her ";
				if(flags["LAQUINE_LASS_TRYSTS"] == 1) textBuff += "pert";
				else if(flags["LAQUINE_LASS_TRYSTS"] == 2) textBuff += "weighty";
				else if(flags["LAQUINE_LASS_TRYSTS"] == 3) textBuff += "motherly";
				else if(flags["LAQUINE_LASS_TRYSTS"] == 4) textBuff += "obscenely motherly";
				else textBuff += "overgrown, milk-dribbling";
				textBuff += " tits. <i>“Please knock me up, " + pc.mf("stud","mistress") + ". Please mate me";
				if(flags["LAQUINE_LASS_TRYSTS"] > 1) textBuff += " again";
				textBuff += ".”</i> Spatters of pussy-juice fall on your [pc.feet]. <i>“Please cum! I need to be pregnant!”</i> She arches her back, whole body quivering. Even her pussy is fluttering with ecstatic tremors, trying to tug the virile milk out of your [pc.cockBiggest]. <i>“Give me your cum!”</i>";
				textBuff += "\n\nSomehow, you endure for the moment, still slapping your hips into hers with passionate, confident strokes. <i>“Tell me what you are!”</i>";
				textBuff += "\n\n<i>“";
				if(flags["LAQUINE_LASS_TRYSTS"] == 1) textBuff += "I’m... I’m just a needy, dumb bunny that needs knocked up more than anything else in the galaxy!";
				else if(flags["LAQUINE_LASS_TRYSTS"] == 2) textBuff += "I’m a horny, slutty cum-receptacle whose body won’t go stop going into heat!";
				else if(flags["LAQUINE_LASS_TRYSTS"] == 3) textBuff += "I’m your personal incubator, just an empty vessel with no value beyond incubating your young at every opportunity!";
				else if(flags["LAQUINE_LASS_TRYSTS"] == 4) textBuff += "Your personal bunny preg-slut! My pussy is so broken in from your dick that nothing else will ever be as good. My womb aches for your cum and your cum alone, because it’s my purpose to accept as many of your loads as you’ll give me!";
				else if(flags["LAQUINE_LASS_TRYSTS"] == 5)
				{
					if(silly) textBuff += "I’m motherhood incarnate, a vessel who exists for you to dump as many loads into as you wish. That’s why I got your name tattooed on the inside of my womb and why my pussy soaks itself at the sight of you. I’m your pet cum-slut, always just around the corner, always hungry for more. I can’t seem think past my next fuck with you, my next opportunity to give you another litter, like I’ve taken so much of your cum that even my brain is gummed up with it.";
					else textBuff += "I’m your bunny-birthing fuckslut, just a broken-in hole of a woman who lives for her meetings with you. My body is so addicted to your cock that my pussy soaks itself at the sight of you. My ovaries don’t even work right. They won’t stop releasing eggs anymore, and you’ve taught me to love it.";
				}
				textBuff += "”</i> The way she says it is so shameless and eager";
				if(flags["LAQUINE_LASS_TRYSTS"] >= 3) textBuff += ", tinged with delirious love";
				textBuff += ". Her whole body flushes, not with shame but with desire. You can feel it all the way in her clenching tunnel, wrapping you in a warm sleeve of orgasm-inducing pleasure.";
				textBuff += "\n\nYou forget about her words the moment they leave her little, lapine muzzle. They’re dislodged from your mind by the expanding presence of your cock, this time not with need but with pleasure. It feels too good to devote time to consciousness, too good to parse even the simplest of words. You grunt, and your ";
				if(pc.balls == 0) textBuff += "internal cum-factory kicks into high-gear";
				else if(pc.balls > 1) textBuff += "[pc.balls] churn";
				else textBuff += "[pc.balls] churns";
				textBuff += ". Breeding feels so good. Perhaps too good. Your groan turns into a moan, then a lurid squeak as the feeling of her rapacious, equine-like muff clamping down on you overwhelms your senses. [pc.Cum] sprays into the slutty bunny’s deepest recesses, flooding her uterus and fallopian tubes both, tickling her ovaries into releasing a few more eggs.";

				//High cumQ";
				if(pc.cumQ() >= 5000)
				{
					textBuff += "\n\nHer belly balloons with the sheer weight of your copious seed. She isn’t even pregnant yet, but she’s starting to look the part. Rubbing her swollen belly, she quietly cums, making little squeaks each time her needy, dripping snatch gets off on the feeling of your spunk-distended dick.{ You flood her well passed the point of looking six months pregnant, a fact that spreads sheer delight across her sweating features. Looking back, she stammers, <i>“Th-thank you. I’ll make you so many... so many babies.”</i>";
					if(pc.cumQ() >= 40000) 
					{
						textBuff += " That seems likely given that you’re still cumming, swelling her tummy into a gravid dome. The fattened rabbit-slut is puffing up so big that her pregnant middle actually lifts her off the ground, her arms and legs windmilling uselessly.";
						if(pc.cumQ >= 50000)
						{
							textBuff += " Miraculously, not a single droplet escapes her sperm-thirsting womb, not even when you dump a few extra gallons inside her, just to make sure. She looks like a perverse parody of pregnancy by this point.";
							if(pc.cumQ() >= 60000) textBuff += " You pull out before you rupture the poor thing. Even an insatiable baby-maker like her deserves a chance to rest, so you do her the favor of spilling the rest of it across her ass, back, hair, and slowly drooping ears.";
						}
					}
				}
				if(pc.cumQ() < 60000)
				{
					textBuff += "\n\nWhen you step back, it feels like your dick is sliding out of her forever, inch after inch slowly escaping endless folds of clenching, cock-milking pleasure. When you do pop out, her lips snap shut with finality, trapping every ounce inside.";
				}
				else textBuff += "\n\nWhen you stumble back, spent, you realize that her lips have snapped shut, trapping every ounce of your perverted payload in her womb for maximum impregnation.";
				textBuff += "\n\n<i>“Th-thank you.”</i> The blissfully smiling laquine rolls on her back and sprawls, giggling almost drunkenly. <i>“";
				if(lassLaquineAcceptable()) textBuff += "You’re my perfect Alpha, and I can’t wait to have even more babies.”</i> She reaches down, fondling her swollen puss and shuddering. <i>“Could you... could you call for me more often? I need you... as often as you can.";
				else if(lassLaquineAcceptable()) textBuff += "You’re such a perfect Alpha... Anytime you want me, just close your eyes and think of me.”</i> She reaches down, fondling her swollen puss and shuddering. <i>“I’ll always be there for your cum. Always.”</i>";
				else textBuff += "I’m don’t know if that’ll actually take.”</i> She smiles sadly, rubbing her swollen pussy. <i>“But it scratched my itch for now... Keep wearing those ears, and maybe we can see more of each other.";
				textBuff += "”</i> She blows you a kiss, then fades away into nothingness.";

				//Repeat";
				if(flags["LAQUINE_LASS_TRYSTS"] > 1) textBuff += "\n\nCan you really be hallucinating that bunny preg-slut so consistantly, or is there something more to her? You may never know.";
				//First time";
				else textBuff += "\n\nWas that... a hallucination? You look around and realize that you’re all alone. The laquine ears must be messing with your head...";
				//Merge";
				textBuff += "That orgasm was no hallucination, though.";
				if(pc.isCrotchExposed())
				{
					textBuff += " Your [pc.cum] got everywhere";
					if(pc.cumQ() >= 1000) textBuff += ", dripping in huge globs";
					if(pc.cumQ() >= 5000) textBuff += ", collecting in puddles";
					if(pc.cumQ() >= 10000) textBuff += ", running off in thickened streams of male ejaculate";
					textBuff += ".";
				}
				else textBuff += " Your [pc.crotchCover] is absolutely bathed in [pc.cum]. You might need a shower to wash off all this spunk.";
				textBuff = ParseText(textBuff);
				pc.orgasm();
				if(pc.inRut())
				{
					pc.clearRut();
					output(" <b>Your rut has faded.</b>");
				}
				return textBuff;
			}
		}
		public function bunnyguyFapScene(fap:Boolean = false):void
		{
			var x:int = 0;
			var cunts:Array = [];
			for(x = 0; x < pc.totalVaginas(); x++)
			{
				if(pc.vaginas[x].type == GLOBAL.TYPE_EQUINE) cunts.push(x);
			}
			if(cunts.length > 0) x = cunts[rand(cunts.length)];
			if(fap)
			{
				clearOutput();
				showName("NEEDY\nLAQUINE");
				textBuff += "One of your ears perks as you swear the hear the low bass sound of a boisterous male singing a travelling song. It fades as quickly as it appears, only to resurface a minute later, louder and closer. The tune is slow and pleasant, but you can only pick a few words from the sonorous drone.";
				textBuff += "\n\n<i>“...my sweet laquine lass ... tease me with that candied ass ... wetter’n ocean breeze blowin’ in.... bed her like breeding season...”</i>";
				if(pc.laquineScore() >= 5) textBuff += "\n\nLaquine lass? Is he singing about you?";

				if(pc.inHeat()) textBuff += "\n\nLaquine lass... and breeding? It’s suddenly too warm and too hot. Thoughts of breeding make it difficult to focus on words, but you qualify as a laquine lass, don’t you? You’ve got this hot... aching... empty vagina that would feel so much better with a baby in it.";
				else if(flags["LAQUINE_GENT_BONED"] != undefined) textBuff += "\n\nYes, he’s definitely singing of you. You hum along with the familiar tune. It sparks a certain, familiar excitement within you after the last encounter...";
				textBuff += "\n\nThe source of the enchanting song appears in front of you, naked save for a dashing, crimson cape which he wears over his right shoulder. He himself is a laquine, gray-furred and grinning. A mop of unruly salt and pepper hangs over the left side of his handsome face. Beneath, twinkling, sky-blue eyes regard you with confident interest. Placing a hand on his sturdy, bunny-like leg, he bows with an elaborate flourish of his other arm. <i>“Smashing to meet such a lovely and beautiful flower on one’s journeys.”</i>";
				textBuff += "\n\nHe steps closer before you can respond, taking your hand in his. He plants a chaste kiss on your wrist, then tugs you into a close embrace, his arm strong around your back, the muscle so hard it may as well be made of corded iron strands. His fur is coarse but neatly combed, recently cleaned with a soap that reminds you faintly of freshly chopped wood. <i>“";
				if(flags["LAQUINE_GENT_BONED"] == undefined) textBuff += "My lady, I must present my deepest apologies, for I have not been entirely truthful with you.";
				else textBuff += "My lady, your presence is as a glass of cool water to a bunny like me.";
				textBuff += "”</i> Something hard and warm presses against your [pc.belly], climbing higher by the second. <i>“";
				if(flags["LAQUINE_GENT_BONED"] == undefined)
				{
					textBuff += "You see, I am taken by the worst sort of rapacious rut";
					if(pc.laquineScore() < 5) textBuff += ", and while you are so long from the laquine lover I need, I must have you all the same";
					else textBuff += ", and you are the most delectable specimen of laquine femininity I could envision. I must have you.";
				}
				else textBuff += "For I am taken with rapacious need once more. The only cure for my malady lies betwixt your heavenly legs, dear madam. I can contain myself no longer. For this, I beg your sincerest apologies.";
				textBuff += "”</i>";

				textBuff += "\n\nYou rock back in surprise, staring down to see the emerging length of his glossy, black shaft. It’s a thick, bestial thing, entirely at odds with the lithe male who seems too wiry to carry such a heavy endowment. From the blunt head to the medial ring, it’s already slathered in whitish, musky goo, and it begins to drizzle more the moment it reaches full size, rocking against your thigh with each passionate beat of its owner’s heart. He wasn’t lying. Your mere presence was enough to take him to full, raging tumescence.";
				textBuff += "\n\nYou can’t peel your eyes away from it. ";
				if(flags["LAQUINE_GENT_BONED"] == undefined) textBuff += "It would fit <i>perfectly</i> inside you. You’re sure of it.";
				else textBuff += "You did this to him.";
				textBuff += " He’s rocking against your [pc.leg], fluffy hands balled into tight, shaking fists. It’s all he can do not to jump you this very moment. Pre-cum bubbles up out of him hard enough to shoot an inch into the air before washing back down to collect in the folds of his tightly-stretched sheath. With great effort of will, you pull your eyes up to his cerulean ones, noting the struggle in his eyes, the way his inner animal tears at the cage of his sophisticated demeanor, one by one shredding the bars of his better nature to make way for a cunt-destroying breeding.";
				if(pc.inHeat()) textBuff += " A shiver travels up your spine at the thought, and for a moment, you aren’t sure if you want to take him to ease his burden or make him wait, if only to make him fuck you all the harder.";

				textBuff += "\n\n<i>“Have mercy,”</i> the laquine intones, his grip firming, <i>“For I must sire you a litter.”</i> His cheek twitches";
				if(!pc.isCrotchExposed()) textBuff += " as he yanks down your [pc.crotchCover]";
				textBuff += ". His cock twitches in eagerness, and the hung rabbit stops resisting, choosing to guide his passions rather than let them break him. He pulls you tight, planting kisses from the nape of your neck up to your [pc.ear], whispering that he will ";
				if(pc.inHeat()) textBuff += "give you every drop of seed in his body so that you may mother the next generation of his libidinous race.";
				else if(pc.vaginas[x].type == GLOBAL.TYPE_EQUINE) textBuff += "fill you like none other, teaching you what it means to fuck with a real male instead of some lesser species.";
				else textBuff += "be gentle to you, his delicate flower";
				textBuff += ". Meanwhile, his body swivels the rest of the way behind you, threading his burning-hot length between your [pc.thighs]. The medial ring brushes against [pc.oneClit], slick and warm, making you whimper.";

				//Bimb";
				if(pc.isBimbo()) textBuff += "\n\nThis isn’t at all what you expected when the dashing laquine arrived, but you’re not going to look a gift horse-bun in the mouth, not when he’s threading himself against your needy delta and promising to bang your brains out of your silly little head. To a bimbo like you, a laquine in rut is like an all-you-can-eat buffet, and your body is more than ready for it. You can already feel it, that pink, bubbly sort of brainlessness you experience every time your blood shifts south into your nethers, lighting up new nerves in preparation for a night spent servicing a deserving male. And they all deserve it, every last one.";
				//Heat";
				else if(pc.inHeat()) 
				{
					textBuff += "\n\nThis isn’t what you expected when the dashing laquine arrived, but it is exactly what your body desired. Your [pc.vaginas] could not have been any luckier, nor ";
					if(pc.totalVaginas() == 1) textBuff += "does it";
					else textBuff += "do they";
					textBuff += " feel like they could be any wetter. You are absolutely sodden with desire for his dick, made all the more aroused by his obvious fitness as a mate. Not only is he athletic and handsome, but he’s big, even for a laquine. Maybe it’s the pheromones wafting off his fuckstick that make him seem so desirable, but you can’t search out a single problem with that. The sooner you get him inside you, the better. Perhaps a few litters of his young will put out the insatiable itch lurking inside.";
				}
				//Nonbimb&nonheat";
				else textBuff += "\n\nThis isn’t how you thought you’d spend today, but there’s something about him, something you can’t quite put your finger on, like you’re connected to the strange rabbit on a deeper level than you can possibly imagine. Perhaps it’s because of that that you find yourself so wet and so pliable. Perhaps you simply needed something like this to take your mind off the stresses of life. Perhaps, when it comes down it, you’ve secretly loved the way your body is driving him mad, and you’re simply curious to see if he can survive intimate contact with your pussy.";
				//Merge";
				
				//Marecunt & heat fuck-end";
				if(pc.vaginas[x].type == GLOBAL.TYPE_EQUINE && pc.inHeat())
				{
					textBuff += "\n\nRocking his hips, the energetic bunny-man lets out a cute little growl, sawing himself against your [pc.vaginas] until he’s as wet with your own excitement as his oozing pre-cum. <i>“Yes,”</i> he groans, <i>“";
					if(pc.laquineScore() >= 5)
					{
						if(flags["LAQUINE_GENT_BONED"] != undefined) textBuff += "I’m so lucky to have found you, my lovely laquine maiden.”</i> He looks you over approvingly, his dick throbbing. <i>“You’ll be such a wonderful mother for our young, I can feel it.";
						else textBuff += "I can’t believe I finally get to knock up another real laquine!";
					}
					else textBuff += "I can’t believe I’m finally getting to end this rut.”</i> His gaze briefly flicks to the artificial ears you’re wearing, and he nods approvingly. <i>“You’re going to be such a perfect laquine mother when you’re all done.";
					textBuff += "”</i>";

					textBuff += "\n\nThe thought of being filled with his seed, [pc.belly]";
					if(pc.bellyRating() >= 20) textBuff += " further";
					textBuff += " ballooned, sends a torrent of further heat down your channel";
					if(pc.totalVaginas() > 1) textBuff += "s";
					textBuff += ". ";
					if(pc.totalVaginas() == 1) textBuff += "It clenches";
					else textBuff += "They clench";
					textBuff += " hungrily around nothing, even as your childrens’ future sire grabs by the wrist, pulling them behind your back to make your spine arch and [pc.oneVagina] open wider for him. He cocks his hips back to crudely aim his blunt tip at the sloppy entrance, then pushes forward to butt it into place, not quite yet inside. His tip is swelteringly hot and spills pre seemingly without end, lubricating you to the point where you can’t believe he hasn’t slipped inside yet.";

					textBuff += "\n\nThe bunny groans softly and, with a none-too-subtle tug on your arms, pulls you down onto his turgid bunny-breeder. Once the fattened crown breaks through your waiting gates";

					if(!pc.inHeat()) textBuff += ", you’re instantly aware of just why he was so keen to get inside you. Your mare-cunt is perfectly matched to his equine cock. That weighty, top-heavy girth stimulates nerves deep inside that no other dick can scratch. The sheath at the base bunches up around your rubbery vulvae, exactly as it should. Pregnancy is a small price to pay for an experience like this. It seems inevitable. Your whole body is heating up, and your womb tickles as your ovaries release an abrupt flood of eggs.<b> Did you just go into heat?</b>";
					else textBuff += ", the pleasure overwhelms you. This is what you needed - a warm, tumescent member, bubbling with virility lodged deep inside you, not some useless plastic penis. You swear you can almost feel his wiggling swimmers as you have your first orgasm, sliding into your womb in search of the dozens of eggs that must be there, lying in wait. It’s so good, so earth-shatteringly delightful that for a moment, you can only fantasize about how good his orgasm will feel, and good it will feel to know you’re going to birth dozens of his offspring.";
					if(pc.vaginalVirgin) textBuff += " Wasn’t losing your virginity supposed to hurt?";

					textBuff += "\n\nYour dashing, cunt-pleasing champion begins to fuck you hard the moment you adjust to his enormous member. He drills into you with such force that your [pc.legs] are lifted clear off the ground with his smallest thrusts, bouncing you so high that it almost looks like you’re hopping in place - only your legs are flailing limply while his powerful limbs carry your weight. [pc.GirlCum] spurts out at the impacts that launch you, cascading in salacious sheets to splatter on the ground. His pre-cum shoots out in thick wads, voluminous enough to drown a normal man’s orgasm, and he hasn’t even cum yet. It’s coming soon, though! The veins all along his length are thickening perceptibly. His flare is swelling.";
					textBuff += "\n\n<i>“P-please!”</i> the male laquine stutters, holding onto a modicum of politeness, <i>“Tell me that you want it... Tell me that in your heart of hearts, you want my children, dozens of them!”</i> Somehow, he expands still further without cumming, pressing on nerves that drive you wild.";
					textBuff += "\n\n<i>“Yes!”</i> you wantonly cry, shaking your hips and squeezing your [pc.vagina " + x + "] down on him, coaxing him to unload with your body’s every movement. <i>“Give it to me! Give me that cum!”</i> His next thrust drives you past the point of sensibility. <i>“Gimme allofit! Fuck me pregnant! Knock up my pussy!”</i>";
					if(pc.hasCock()) 
					{
						textBuff += " Your [pc.cocks] weakly unload";
						if(pc.totalCocks() == 1) textBuff += "s";
						textBuff += " onto the ground.";
					}
					if(pc.isSquirter())
					{
						textBuff += " Rivers of [pc.girlCum] spray down your thighs as you climax, still begging for his jizz.";
					}
					else textBuff += " Hot [pc.girlCumNoun] dribbles down your thighs as you climax, still begging him for his jizz.";
					textBuff += "\n\nHe grunts, his every muscle going tight as you hit the ground one last time, letting your weight carry you down a cock that suddenly feels about 20% thicker. It flexes inside you as his voice slips into a higher register, and you feel the hot, sperm-filled fluid spraying into your body. It’s a wonderful balm for your overheated channel, all warm and gooey and subtly tingling against your folds in a way that advertises just how pregnant you’re about to be. He lowers himself to the ground mid-orgasm, cradling your expanding middle as his sperm continues to fill you. Some runs back out, drenching his balls and his legs, but he does not seem to mind.";
					textBuff += "\n\nYou aren’t sure how long you stay like that, held in his capable arms, his dick sheath-deep, still leaking more virile seed into your most vulnerable place. It’s everything you thought it would be.";
					if(pc.inHeat()) textBuff += " One after another, you can feel your eggs being fertilized, alleviating your heat in the way that only motherhood can.";
					else textBuff += " A warm glow spreads through you, what you can only assume is the culmination of your impregnation.";
					textBuff += " It’s a lovely sensation.";

					//First time";
					if(flags["LAQUINE_GENT_BONED"] == undefined)
					{
						textBuff += "\n\n<i>“Thank you for that, my sweet maiden. You’ve eased this old campaigner’s burdens by virtue of your company.”</i> The now-sated laquine strokes your ";
						if(pc.hasHair()) textBuff += "[pc.hair]";
						else textBuff += "head";
						textBuff += " with gentle, almost imperceptible touches. <i>“But I must move onward for now. In the future, should you find yourself ravaged by heat, know that I will come extinguish your fire should you wish.”</i> His smile is cocksure, even as his form becomes insubstantial. <i>“I will be there for you, tender princess.”</i>";
					}
					//Repeat";
					else
					{
						textBuff += "\n\n<i>“Ahh, you truly are a balm for the trials of life, my sweet, knocked-up laquine.”</i> The now-sated laquine strokes your ";
						if(pc.hasHair()) textBuff += "[pc.hair]";
						else textBuff += "head";
						textBuff += ", his dick enjoying the residual afterglow in a pussy ";
						if(flags["LAQUINE_GENT_BONED"] < 3) textBuff += "that is becoming increasingly acclimated to his presence.";
						else if(flags["LAQUINE_GENT_BONED"] < 6) textBuff += "that seems halfway molded to his image.";
						else if(flags["LAQUINE_GENT_BONED"] < 9) textBuff += "that may as well have been designed for him.";
						else textBuff += "so familiar that he seems more natural inside you than anything else.";
						textBuff += " <i>“My time with you is spent, but should have need of me, I promise you, I will be there.”</i> He withdraws, fading into insubstantiality with a wry smile. <i>“I will always be there for your heats...”</i>";
					}
					//Merge
					textBuff += "\n\nThen he’s gone, as if he was never there. Even his puddled cum is gone. You’re left empty, but sated";
					if(pc.inHeat()) textBuff += ", your heat extinguished";
					textBuff += ".";
					if(flags["LAQUINE_GENT_BONED"] == undefined) textBuff += " Did you just get so horny you hallucinated a hot bunny stud?";
					else textBuff += " Maybe you should be concerned by your hallucinatory lover, but right now you’re feeling too well and truly satisfied to care.";
					pc.clearHeat();
					pc.lust(100);
					textBuff = ParseText(textBuff);
					pc.orgasm();
					return textBuff;
				}
				else
				{
					//Non marecunt & nonheat end";
					textBuff += "\n\nRocking his hips, the energy bunny-man lets out a cute little growl, sawing himself against your [pc.vaginas] until he’s as wet with your own excitement as his oozing pre-cum. <i>“Yes,”</i> he groans, <i>“I can’t believe I’m finally going to... finally going to get to end this rut!”</i> He cocks his hips back, crudely lining the blunt tip with your sloppy entrance. His tip is swelteringly hot and spills pre seemingly without end. <i>“You should ";
					if(!pc.inHeat()) textBuff += "be in heat, begging me to breed you...";
					if(!pc.inHeat() && pc.vaginas[x].type != GLOBAL.TYPE_EQUINE) textBuff += " or ";
					if(pc.vaginas[x].type != GLOBAL.TYPE_EQUINE) textBuff += "have a proper, laquine pussy, all plush and leaking...";
					textBuff += "”</i> Pulling your arms back, he forces you to arch your back, aligning you at the perfect angle for insertion. <i>“Then I could really let you have it.”</i>";
					textBuff += "\n\nHis hips inch upward, at first compressing your vulva, then forcing you to spread, wider by wider, but suddenly, the firm grip of his hands slackens.";
					textBuff += "\n\n<i>“Nooo, I was so close!”</i> your fluffy suitor curses even as his body fades into translucency. <i>“I need to breed so badly!”</i> He drops to his knees, everything below his hips already vanishing into nothing. <i>“Those ears... keep using them... maybe next time...”</i> His searching eyes fade to nothing.";
					//first time";
					if(flags["LAQUINE_FADEAWAY"] == undefined && flags["LAQUINE_GENT_BONED"] == undefined) 
					{
						textBuff += "\n\nWhat the FUCK? Was all that just a hallucination?";
						if(!pc.isCrotchExposed()) textBuff += " Looking down, you realize that you’re still wearing your [pc.crotchCover], and n";
						else textBuff += "N";
						textBuff += "o evidence of the rabbit remains, save for the moistness between your legs. When they said laquines fucked like bunnies, they must have meant it!";
					}
					//Repeats";
					else
					{
						textBuff += "\n\nOhhh no! Not again! It’s not fair that poor guy doesn’t get to nut inside you and fill you with his creamy, virile jism.";
						if(!pc.inHeat()) textBuff += " Wait... what are you thinking? He all but raped you!";
						else textBuff += " Maybe a baby bump would really fill out your figure, more than it already is.";
						textBuff += " The bizarre persistence of this hallucination nags at you, but not as badly as the freshly stoked heat between your [pc.thighs].";
					}
					pc.lust(20);
					textBuff = ParseText(textBuff);
					return textBuff;
				}
			}
		}
	}
}