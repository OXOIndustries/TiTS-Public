/* quaelle: Add preg stuff by Nonesuch*/

/**
	 * ...
	 * @author DrunkZombie
	 */
/*
flags from breedwell.as
	QUAELLE_INCUBATION_TIMER_F //days quaelle has been pregnant front womb
	QUAELLE_INCUBATION_TIMER_B //days quaelle has been pregnant back womb
	QUAELLE_SEXED //number of times had sex
	QUAELLE_TALKED_HER //just an fyi of existing flag similar to new one (1 = had talk convo)
	QUAELLE_HUGGED
	
New Flags:
    QUAELLE_TALK_RAHN //timestamp when first talk was done
    QUAELLE_TALK_ROEHM  //timestamp when first talk was done
    QUAELLE_TALK_HER  //timestamp when first talk was done
    QUAELLE_TALK_RAHN_P2  //undefined or 0 = not talked about part 2
    QUAELLE_TALK_ROEHM_P2  //undefined or 0 = not talked about part 2
    QUAELLE_TALK_HER_P2  //undefined or 0 = not talked about part 2
	QUAELLE_LOVER // undefined or 0 = no, 1 = yes
	QUAELLE_SHUTDOWN_TIMER //timestamp of start of preg stuff
	QUAELLE_FERTILE //undefined or 0 = infertile, 1 = fertile
	QUAELLE_SEX_WAIT // timestamp to unlock apartment and availbility for sex
	QUAELLE_SNIT // timestamp for start of her snit
	QUAELLE_LEAVING // undefined = no, timestamp of when it was set
	QUAELLE_LEFT // undefined = no, 1 = talked to the Doh'rahn about Quaelle leaving
	QUAELLE_DOHRAHN_FLIRT  //undefined = no, 1 = flirted with the Doh'rahn
	QUAELLE_FUCK_CUNT_FRONT //number of times fucked front pussy
	QUAELLE_FUCK_CUNT_BACK //number of times fucked front pussy
	QUAELLE_FUCK_CUNT_MORE //number of times fucked front & back pussy in one session
	QUAELLE_LICK_CUNT_FRONT //number of times you licked her front cunt
	QUAELLE_LICK_CUNT_BACK //number of times you licked her back cunt
	QUAELLE_LICK_CLIT //number of times you licked pseudo-clit
	QUAELLE_CATCH_CUNT //number of times she fucked your cunt
	QUAELLE_WATCH_GRIPPER //undefined or 0 = no, 1 = yes
	QUAELLE_TOTAL_KIDS  //number of kids you and qualle have together
	QUAELLE_NUM_BABIES_F //number of babies in current pregnancy 
	QUAELLE_NUM_BABIES_B //number of babies in current pregnancy 2nd womb
	QUAELLE_BABY_GENDERS_F //array used to track genders of current pregnancy
	QUAELLE_BABY_GENDERS_B //array used to track genders of current pregnancy 2nd womb
	QUAELLE_LAST_BIRTH //timestamp of last birth
	QUAELLE_PREG_GREET //undef/0 = not played, 1 if pc preg greet played this preg
	QUAELLE_IMMOBILE_GREET //undef/0 = not played, 1 if pc immobile greet played this preg, 
	QUAELLE_IMMOBILE_VISIT //undef/0 = not played, 1 if pc immobile visit played this preg,
	QUAELLE_IMMOBILE_PREG //undef/0 = not currently immobile, 1 = immobile
	QUAELLE_IMMOBILE_PREG_COUNT //number of times she has been immobilized
	QUAELLE_BIRTH_EMAIL //undef/0 = not sent, 1 = sent
	QUAELLE_BIRTHSCENE //timestamp for proc the birthscene
	QUAELLE_BIRTHSCENE_KIDS //number of kids in the birthscene
	QUAELLE_BIRTHSCENE_COLOR //color of these kids
	QUAELLE_NATAL_UNIT //undefined/0 never been, 1 = yes
	QUAELLE_RECOVERY //timestamp to let Quaelle rest after birth (used for back to work and sex availability)
	QUAELLE_SP_NURSERY_BABY //timestamp of when to activate nusery scenes
	QUAELLE_SP_NURSERY_KID //timestamp of when to activate nusery scenes

*/
import classes.GameData.Pregnancy.Child;
import classes.GameData.Pregnancy.Templates.QuaelleUniqueChild;
import classes.GameData.Pregnancy.UniqueChild;
import classes.GameData.Pregnancy.Containers.Genders;

//preg stage 0 = not preggers, 1 = light, 2 = medium, 3 = heavy
public function quaellePregnancyStage(vIdx:int = -1):int
{
	var stage:Number = 0;
	
	if (quaelleIsPregnant(vIdx))
	{
		if(vIdx == 0 && quaelleBellyRatingFront() <= 33) stage = 1;
		else if(vIdx == 1 && quaelleBellyRatingBack() <= 33) stage = 1;
		else if (quaelleBellyRatingFront() <= 33 || quaelleBellyRatingBack() <= 33) stage = 1;
	
		if(vIdx == 0 && quaelleBellyRatingFront() > 33 && quaelleBellyRatingFront() <= 66) stage = 2;
		else if(vIdx == 1 && quaelleBellyRatingBack() > 33 && quaelleBellyRatingBack() <= 66) stage = 2;
		else if ((quaelleBellyRatingFront() > 33 && quaelleBellyRatingFront() <= 66) || (quaelleBellyRatingBack() > 33 && quaelleBellyRatingBack() <= 66)) stage = 2;
	
		if(vIdx == 0 && quaelleBellyRatingFront() > 66) stage = 3;
		else if(vIdx == 1 && quaelleBellyRatingBack() > 66) stage = 3;
		else if (quaelleBellyRatingFront() > 66 || quaelleBellyRatingBack() > 66) stage = 3;
	}
	return stage;
}
public function quaellePregShutdown():Boolean
{	
	var timeframe:int = 304 * 24 * 60;
	
	if (flags["QUAELLE_SHUTDOWN_OVERRIDE"] == 1) return false;		
	
	if (flags["QUAELLE_TOTAL_KIDS"] == undefined) return false;
	
	if (flags["QUAELLE_SHUTDOWN_TIMER"] == undefined) return false;
	
	if (GetGameTimestamp() - timeframe <= flags["QUAELLE_SHUTDOWN_TIMER"]) return false;
	
	return true;
}
//what stage are her talk topics in: undefined/0 = part 1, 1 = part 2 now active, 2 = part 1 & part 2 done of rahn & roehm, 3 = part 1 & part 2 done of all three
public function quaelleTalkStage():int
{
	var stage:int = 0;
	var timeframe:int = 24 * 60;
	var triggerTime:Number;
	
	if (flags["QUAELLE_TALK_RAHN_P2"] == 1 && flags["QUAELLE_TALK_ROEHM_P2"] == 1)
	{
		stage = 2;
		if (flags["QUAELLE_TALK_HER_P2"] == 1) stage = 3;
	}
	else
	{
		if (flags["QUAELLE_TALK_RAHN"] != undefined && flags["QUAELLE_TALK_ROEHM"] != undefined && flags["QUAELLE_TALK_HER"] != undefined) 
		{
			triggerTime = GetGameTimestamp() - timeframe;
			if ((triggerTime > flags["QUAELLE_TALK_RAHN"]) && (triggerTime > flags["QUAELLE_TALK_ROEHM"]) && (triggerTime > flags["QUAELLE_TALK_HER"]))
			{			
				stage = 1;
			}
		}
	}
	
	return stage;
}
public function quaelleHasLeft():Boolean
{
	var timeframe:int = 25 * 24 * 60;
	
	if (flags["QUAELLE_LEAVING"] == undefined) return false;
	
	if (GetGameTimestamp() - timeframe > flags["QUAELLE_LEAVING"]) return true;
	
	return false;
}
public function quaelleTalkRahnPart2():void
{
	if (quaelleTalkStage() > 1) output("\n\n");
    else flags["QUAELLE_TALK_RAHN_P2"] = 1;
	
	output("For a long while you just sit together in silence - silence but for the crunch and munch of vine leaves in Quaelle’s mouth, that is. You’ve spent enough time in the roehm’s company to fall into the gastropod’s rhythms, and you no longer feel uncomfortable kicking back and doing nothing when you’re around her. Let the topics come up slowly, naturally. There’s no rush.");
	output("\n\n<i>“The baby rahn get packaged off to frontier worlds, then?”</i> you say at last. <i>“Who looks after them? Do they find out who their parents are?”</i>");
	output("\n\n<i>“They are raised in communal nurseries,”</i> Quaelle replies, once her mouth is clear. <i>“If possible, they’re sent to the same planet their former was sent.”</i>");
	output("\n\nShe gazes placidly over at the brightly colored gel women staff, busy at the front desk.");
	output("\n\n<i>“They don’t understand moms and dads as we do, pulsiment Steele. Whoever provided the genetic material to inseminate a batch of eggs is not considered an important part of the relationship. That’s considered to be... like a natural force. Remember that for millennia, they used animal semen to do it! There is your former - the rahn that grew your egg - and your bearer - the person who bore you in their womb. They are the closest thing they have to parent, hmm, hmm, parallels. A baby rahn is raised by their bearer, or by their bearer and former, or communally. In which case you have many, many aunts.”</i>");
	output("\n\nThere’s a long pause, as if Quaelle were allowing for this to sink in.");
	output("\n\n<i>“To answer your question... no. The rahn who are created here will not know who their bearer was, or who provided the sperm. That information is kept classified... as you know, because you read all the terms and conditions of your contract with Breedwell, didn’t you?”</i> She grins at you knowingly. <i>“Hmm. Hmm. Hmm.”</i>");
	output("\n\n<i>“Do you think creating all of these babies will have the effect the rahn government is hoping for?”</i> you ask.");
	output("\n\n<i>“Hmmmmmmmmm.”</i> A long, musical note of doubt. <i>“Getting baby booties on the ground is an age-old tactic, the anatae empire has used it since the formation of the U.G.C. of course. But they have had millennia to establish themselves. The rahn central government can weigh colonies demographically in their favor... but perhaps mega-corporations will take over the chosen planets anyway, perhaps war and piracy will render them inconsequential, or even a burden. And perhaps your jelly babies will not vote or act in the way you hope!”</i>");
	output("\n\nThe roehm opens her arms speculatively, stuffed bosom wobbling.");
	output("\n\n<i>“Colonists of strange planets develop in ways you cannot plan for, particularly if they are young. I think this baby boom will help them, shiverous Steele... a little.”</i> She leans forward, still smiling. <i>“Those are my unofficial thoughts, hmm hmm, ok? Officially I think the Great Effort will be a Great Success, like everyone else here. Please keep");
	
	if (flags["BREEDWELL_STATUS_DONATOR"] >= 1 && flags["BREEDWELL_STATUS_BREEDER"] >= 1) output(" giving us your lovely, fecund sperm and bearing sweet little gel girls for us!”</i>");
	else if (flags["BREEDWELL_STATUS_DONATOR"] >= 1 ) output(" giving us your lovely, fecund sperm.”</i>");
	else if (flags["BREEDWELL_STATUS_BREEDER"] >= 1 ) output(" bearing sweet little gel girls for us!”</i>");
	else output(" doing what you do.”</i>");

	processTime(5);
}
public function quaelleTalkRoehmPart2():void
{
	if (quaelleTalkStage() > 1) output("\n\n");
    else flags["QUAELLE_TALK_ROEHM_P2"] = 1;
	
	output("You find yourself pondering the very nature of these long pauses you go through with Quaelle. If you free yourself from impatience, those niggling, very human compulsions to do <i>something, anything</i> with your time, it is quite peaceful to just sit with the friendly roehm. Zen-like. But...");
	output("\n\n<i>“Surely there are downsides to being such a slow race,”</i> you say. <i>“You’d be useless in a war. What if another race or government decides it’s going to own you?”</i>");
	output("\n\n<i>“We already know, because we’ve already gone through it, erratisome Steele,”</i> Quaelle replies, smiling gently. <i>“We were uplifted by the Orchans many centuries ago, when they were at the height of their power. A military coup put in place an orchan supremacist leadership, that wished to expand greatly and dominate those worlds it deemed under its control. They greatly restricted roehm rights and ability to travel, and built contraltic colonies and vibrantless monuments across Hdar-Roe itself. It was a very bad time.”</i>");
	output("\n\n<i>“What did you do?”</i>");
	output("\n\n<i>“We waited.”</i>");
	output("\n\nAs if to reinforce her point, Quaelle inhales another mouthful of green leaves. You watch, and wait, as she peacefully munches.");
	output("\n\n<i>“Eventually, the orchan supremacists went the way of all shudderific, destructive movements,”</i> she goes on, after she’s swallowed. <i>“They bankrupted themselves over-extending, started a war with the Camarilla when they couldn’t pay back their loans, and were defeated by the Tove’s mercenary army. Today the orchans are a fringe race - they are great gene-mod experimenters, because the tastes and ways of the galaxy have left them behind. Their monuments on Hdar-Roe? Hmmmm. I’ve read an ancient human poem that describes them very well.”</i> She blinks her spectacular, double-pupiled eyes at you. <i>“When you live for much longer than most species, you gain a different perspective. All things pass. We can wait.”</i>");
	
	if (pc.IQ() > 85 && pc.RQ() > 50 && !pc.isBimbo() && !pc.isBro())
	{
		output("\n\nYou’re not sure you buy this philosophy of complacency.");
		output("\n\n<i>“What if these orchan race warriors had decided to wipe you all out?”</i> you ask. <i>“What then?”</i>");
		output("\n\n<i>“But they didn’t,”</i> replies the roehm, antennae waving curiously.");
		output("\n\n<i>“But. What. If. They. Had,”</i> you persist. <i>“You can’t sit and wait for things to work out on its own in every case, that’s insane!”</i>");
		output("\n\n<i>“Shiverous Steele...”</i> Quaelle smiles at you with infuriating compassion and kindness. <i>“...what if you kill yourself careening fluctacularly around the frontier as you do? What if you and all of your crew wind up enslaved to a cruel and terrible pirate lord? With your skills and upbringing, you could find a safe and peaceful living in the core. This has all occurred to you, I’m sure. And yet you act as you do, flickersome and humful nonetheless, because you are the child of your parents, and can do nothing other.”</i>");
		output("\n\nShe laughs. <i>“Hmm. Hmm. Hmm.”</i>");
		output("\n\n<i>“And I adore you, and all others like you! How lovely to see you stride about impetuously, vibrosely, magnificently uncaring of your impending doom! Please - don’t ask why roehm act like we do. Simply marvel at the differences that make this throbbulent galaxy so beautiful.”</i>");
	}
	
	processTime(5);
}
public function quaelleTalkHerPart2Intro():void
{
	clearMenu();
	
	if (quaelleTalkStage() > 2) output("\n\n");
	
	if (quaelleIsLover())
	{
		output("With a happy smile, Quaelle stretches her hands out to you. You reach out and give her what she wants; shared, peaceful intimacy. You sit, hands knitted with her moist, soft digits, waiting for the topics and words to well up to the surface of their own accord.");
		output("\n\n<i>“Do you want me to talk about my kind and my past again, vibrous Steele,”</i> Quaelle says softly, antennae swaying towards you. <i>“Or was there something else you wanted to know?”</i>");		
			
		addButton(0, "Past", quaelleTalkHerPart2First, true);
		addButton(1, "Future",quaelleTalkHerFuture,undefined);
	}
	else
	{
		output("Once again, you find yourself simply sitting in silence with the busty, slimy PR chief of Breedwell. The damp humidity of the room, the strangely enjoyable sight of watching the big, vibrant slug worthy munching away on her leaves, and the sweet, sexual smell of caramel that keeps tickling your nostrils makes it all a very relaxed experience. You wait for the right topics and the right words to well up to the surface of their own accord - but it’s not you that breaks the silence this time.");
		output("\n\n<i>“You seem most interested in me and my kind, metronomic Steele,”</i> Quaelle says softly, hands beneath her generous bust. <i>“Do you know what full years are?”</i>");
	
		if (CodexManager.hasViewedEntry("Roehm")) output("\n\nYou’ve read the codex so have the general idea, but you motion for her to continue.");
		else output("\n\nFull years? You motion for her to continue.");
		
		quaelleTalkHerPart2First();
	}
}
public function quaelleTalkHerPart2First(clear:Boolean=false):void
{
	if (clear) clearOutput();
	else output("\n\n");		
	
	output("<i>“We have a ssslowwww reproductive system.”</i> She giggles in that singular, humming way of hers. <i>“I suppose that’s not much of a surprise, is it? We only become fertile once every five years. Well, it only makes sense if you live for many centuries, doesn’t it? If we were like you and could breed at any time during our adulthood, Hdar-Roe would have collapsed under the weight of us long ago. Still...”</i> she sighs, brilliant eyes on you. <i>“You can’t help but pine a little bit, seeing the vigorous, fibrose races having children whenever they feel the urge. And sometimes even when they do not.”</i>");
	output("\n\nYou ask when her last full year was.");
	output("\n\n<i>“Umm. I’m in the middle of it!”</i> she replies, touching her lips. <i>“I’m surprised you didn’t notice, shiverous Steele. We give off a pheromonal scent when it’s our time.”</i>");
	output("\n\nThe sex-drenched caramel, which even now is breathing a certain, tetchy redolence down to your [pc.groin]... you thought perhaps that was simply a function of the TFs she’s taken.");
	output("\n\n<i>“This is my third full year,”</i> Quaelle continues, brilliant eyes now on her hands. <i>“My first, I thought it made more sense to work, build up a little money whilst seeing the galaxy. I worked for Pyrite Industries as a comms signaller.”</i> She sighs. <i>“I hated it, throbbulent Steele. It was boring, I didn’t get on with anyone because I was too slow and because of my body’s needs, I was only there because I could work much longer shifts than anyone. I was determined to choose my line of work much more carefully the next time - and that my next full year was going to be fun. I wanted to have kids with someone.”</i>");
	output("\n\n<i>“So what was your second full year like?”</i>");
	output("\n\n<i>“I was sick.”</i> She grins ruefully. <i>“The nackles, it’s called amongst the roehm, it’s a genetic disorder that makes your body over-produce salt on your membrane. It was lethal in the old days - and really gross and painful - but there’s a genemod cure for it nowadays. Still, you have to be placed in quarantine until it’s run its course. No roehm wants to get salt on them.”</i> She shrugs, a liquid ripple across her body. <i>“So that was most of my second full year. Hanging around a small apartment in a hospital, on my own. Hmm, hmm, hmm. And I thought working for Pyrite was stilltuous.”</i>");

	processTime(5);
	clearMenu();
	addButton(0,"Next",quaelleTalkHerPart2Next,undefined);
}
public function quaelleTalkHerPart2Next():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	clearMenu();
	
	output("<i>“And now it’s my third full year. I’ve been waiting judderifically in anticipation of it, Steele, I don’t mind telling you!”</i> the colorful, buxom gastropod continues with a laughing sigh. <i>“I soooo very much wanted to meet interesting, throbbulent people, have some children I could take back to Hdar-Roe and raise when my time is over. It’s a part of my life that feels... empty. Particularly after the hollowsome sorrow of my second full year.”</i>");
	output("\n\n<i>“So I chose my new employment carefully. Where better to meet people who might be interested in weighing my back with young than a place like Breedwell?”</i> She laughs again, in a slightly doleful, minor key series of hums. <i>“I’m afraid I didn’t really think it through, shiverous Steele. The studs who pass through here want to <i>trade</i> their sperm, not give it away. And when they hobble back from the milkers, aching and oh so throbbose, they are certainly not thinking about chatting with me!”</i>");
	output("\n\nThe roehm fiddles with her bracelets for a while quietly.");
	
	if (quaelleIsLover())
	{
		output("\n\nThe roehm smiles at you lovingly, squeezes your hands again.");
		output("\n\n<i>“Until you came along. Until I found someone who seems to have enough love for the entire galaxy. Hmm. Hmm. Hmm.”</i>");	
		
		addButton(0, "Future", quaelleTalkHerFuture, undefined);
		addButton(14, "Leave",quaelleMainMenu,undefined);
	}
	else if (flags["QUAELLE_LEAVING"] != undefined)
	{
		output("\n\n<i>“I will leave Breedwell in due course, yes. I’m glad I talked this through with you, was able to realize that was the best decision, despite all that Tamani has done for me. It will be difficult to leave, because I do soooo enjoy looking after the rahn young in the nursery. They’re wibbluously sweet! But I know I will hate myself if I sit idly by and allow my full year to pass by without having a child once again.”</i>");
	
		quaelleMainMenu();
	}
	else
	{
		output("\n\n<i>“You’re the first donor who’s sat with me for this length of time since I began working here. I suppose if things don’t work out I will have to leave, travel elsewhere - which would be dreadfully sad, because as you can see Tamani has done a lot to make Breedwell comfortable for me. And I do soooo enjoy looking after the rahn young in the nursery. They’re wibbluously sweet!”</i>");
	
		processTime(5);
		if (quaelleTalkStage() == 2)
		{
			flags["QUAELLE_TALK_HER_P2"] = 1;
			if (pc.hasCock() || pc.hasVagina()) addButton(0,"Hit On",quaelleTalkHitOn,undefined,"Hit On","Make it clear you’d be happy to get amorous with the slug girl.");
			else addDisabledButton(0, "Hit On", "Hit On", "You need a cock or vagina to help her out!");
			addButton(1,"Commiserate",quaelleTalkCommiserate,undefined,"Commiserate","You aren’t interested in the slug girl, but perhaps you can cheer her up.");		
		}
		else quaelleMainMenu();
	}
}
public function quaelleTalkCommiserate():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	
	output("You commiserate with Quaelle, and tell her if she’s that interested in kids she should put herself out there. You know yourself that the galaxy is an extremely horny place, and it surely wouldn’t take much travelling about to find someone willing. Stop waiting for it to happen!");
	output("\n\n<i>“I didn’t think about it that way,”</i> replies Quaelle, with a slow nod. <i>“Yeeessss... all things may come to those who wait, but what if the time in-between is terribly sad? You are right, vibrose Steele. I should take this into my own hands, instead of moping. Thank you for the advice.”</i>");
	processTime(5);
	flags["QUAELLE_LEAVING"] = GetGameTimestamp();
	clearMenu();
	quaelleMainMenu();
}

public function quaelleTalkHitOn():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");	
	
	if (pc.hasCock())
	{
		output("You think the guys and dick-girls who’ve been ignoring her at the front desk are out of their minds. You know at least one person who’d be more than happy to get intimate with her... perhaps even provide that packet of sperm she’s after? You finish your advance with the trademark Steele smolder and grin.");
		
		if (flags["QUAELLE_HUGGED"] != undefined) 
		{
			output("\n\nQuaelle’s smile broadens slowly as she gazes back at you. There’s a long pause... but you’re too used to that now to feel discomfited by it.");
			output("\n\n<i>“Do you really mean that, vibrulent Steele?”</i> she asks, antennae wriggling fitfully. <i>“Oh, that makes me feel so pulsumous! So mumburfelt! I must say I have found you fassscinating since we first met, I was soooo glad you seemed to enjoy sitting with me. I hope it hasn’t been too tiresome waiting for me to get to the point, but...”</i> She giggles, gazing at you more coyly now. <i>“Hmm. Hmm... it is a good way of finding out if someone is comfortable with a roehm’s rhythms, is it not?”</i>");
			output("\n\nShe opens her arms to you, and without a moment’s hesitation you get up and dive into that incredibly soft, wet, caramel-scented embrace. This one is different, though - Quaelle’s hands sink downwards, touching and stroking your back and [pc.ass] with obvious interest, deepening the heat you already feel in your [pc.groin]. When you surface from between her wide, pillowy breasts, you reach upwards to plant a soft kiss on her fruity lips.");
			output("\n\n<i>“I have to plan longer breaks ahead of time,”</i> she murmurs to you. <i>“So you’ll have to wait a bit before we get, hmm, intimate. But I know you’re willing to do that, don’t I? My shiverous, throbbful Steele.”</i>");
			output("\n\nShe oozes out from behind the table and heads back to the front desk. You notice several of the rahn over there have barely been pretending not to rubberneck, and there’s gleeful clapping and a cheer when Quaelle slithers triumphantly back to her post.");
			
			flags["QUAELLE_LOVER"] = 1;
			flags["QUAELLE_FERTILE"] = 1;
			if (flags["QUAELLE_SHUTDOWN_TIMER"] == undefined) flags["QUAELLE_SHUTDOWN_TIMER"] = GetGameTimestamp();
			pc.changeLust(15); //plus 15 more in hug below
			processTime(5);
			quaelleHugged();
		}
		else
		{
			output("\n\n<i>“That’s very sweet of you, Steele,”</i> replies Quaelle with a kind smile, <i>“but I know you only say it out of pity. My body isssss... unnerving to you, is it not? I want my partners to be comfortable with me when we’re alone, it would be terribly sad otherwise. No...”</i> she sighs wistfully. <i>“It’s clear to me that I need to move on, rather than mope about the issue. It was good to talk it through with you, Steele. Thank you for sitting with me and listening.”</i>");
			output("\n\nShe oozes back out from the table and heads back towards reception, leaving you to recover from being shot down.");
			
			processTime(5);
			flags["QUAELLE_LEAVING"] = GetGameTimestamp();
		}
	}
	else if (pc.hasVagina())
	{
		output("You think the guys and dick-girls who’ve been ignoring her at the front desk are out of their minds. You know at least one person who’d be more than happy to get intimate with her... and has she considered she could be the impregnater, rather than the impregnatee? You finish your spiel with the trademark Steele smolder and grin.");
	
		if (flags["QUAELLE_HUGGED"] != undefined) 
		{
			output("\n\nQuaelle’s smile broadens slowly as she gazes back at you. There’s a long pause... but you’re too used to that to feel discomfited by it.");
			output("\n\n<i>“Oh, vibrulent Steele! You know you shouldn’t be making such kind, shiverous offers,”</i> she says, antennae wriggling fitfully. <i>“Your womb should be being stuffed full of rahn eggs as much as possible");
			if (pc.hasPregnancyOfType("RahnPregnancyBreedwell")) output(", as it is now");			
			output(". But...”</i> She giggles, gazing at you more coyly now. Hmm. Hmm. <i>“Hearing you say that makes me feel so pulsumous! So mumburfelt! I must say I have found you fassscinating since we first met, I was soooo glad you seemed to enjoy sitting with me. Of course I would like to share intimacy with you.”</i>");
			
			output("\n\nShe opens her arms to you, and without a moment’s hesitation you get up and dive into that incredibly soft, wet, caramel-scented embrace. This one is different, though - Quaelle’s hands sink downwards, touching and stroking your back and [pc.ass] with obvious interest, deepening the heat you already feel in your [pc.groin]. When you surface from between her wide, pillowy breasts, you reach upwards to plant a soft kiss on her fruity lips.");
			output("\n\n<i>“I have to plan longer breaks ahead of time,”</i> she murmurs to you. <i>“So you’ll have to wait a bit before we, hmm, get to know each other better. But I know you’re willing to do that, don’t I? My shiverous, throbbful Steele.”</i>");
			output("\n\nShe oozes out from behind the table and heads back to the front desk. You notice several of the rahn over there have barely been pretending not to rubberneck, and there’s gleeful clapping and a cheer when Quaelle slithers triumphantly back to her post.");
			
			flags["QUAELLE_LOVER"] = 1;
			flags["QUAELLE_FERTILE"] = 1;
			if (flags["QUAELLE_SHUTDOWN_TIMER"] == undefined) flags["QUAELLE_SHUTDOWN_TIMER"] = GetGameTimestamp();
			pc.changeLust(15); //plus 15 more in hug below
			processTime(5);
			quaelleHugged();
		}
		else
		{
			output("\n\n<i>“That’s very sweet of you, Steele,”</i> replies Quaelle with a kind smile, <i>“but I know you only say it out of pity. My body isssss... unnerving to you, is it not? I want my partners to be comfortable with me when we’re alone, it would be terribly sad otherwise. No...”</i> she sighs wistfully. <i>“It’s clear to me that I need to move on, rather than mope about the issue. It was good to talk it through with you, Steele. Thank you for sitting with me and listening.”</i>");
			output("\n\nShe oozes back out from the table and heads back towards reception, leaving you to recover from being shot down.");
			
			processTime(5);
			flags["QUAELLE_LEAVING"] = GetGameTimestamp();
		}
	}
	else
	{
		//error catch, shouldn't be in here
		output("It appears you have neither a cock or vagina!");
	}
	
	clearMenu();		
	quaelleMainMenu();
}
public function quaelleTalkHerFuture():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	
	output("<i>“I will go back to Hdar Roe, once my term with Tamani is up... unless they offer me something new that I cannot refuse.”</i> She shrugs, setting off a little wave of motion down her wet yellow flanks. <i>“It isn’t out of the question! They are a very vibrose company. But I would prefer to go back home for a while.”</i>");
	
	if (quaellePregnancyStage(0) >= 2 || quaellePregnancyStage(1) >= 2) output(" She breaks off one hand to stroke the curve of her belly, stretching her coat.");
	else if (pc.bellyRating() >= 30 && pc.hasPregnancyOfType("QuaellePregnancy")) output(" She stretches out and touches the curve of your belly.");
	else output(" She smiles at you softly.");	
	output("<i>“I’d like to raise my children on my home world, have that experience. They will be grown by the time my next full year comes around. You better beware - they will be <i>very</i> curious about you!”</i>");
	
	output("\n\nShe breaks off to snip some leaves off a nearby vine, pushes them into her mouth. She masticates, psychedelic eyes elsewhere.");
	output("\n\n<i>“And what will I do then? Well, there is a whole galaxy out there, and I haven’t seen nearly enough of it. But I have many years to take it all in.”</i> She swallows and squeezes your hands. <i>“Perhaps I will seek you out in five years time, hmm? And make you show me some of the magnificent, fluctacular sights you have seen during this judderific quest of yours. Perhaps we can take our daughters along. Or will that be too middle-aged for you? You’ll practically be an old " + pc.mf("man","woman") + " then, my fleeting, shiverous lover. Hmm. Hmm. Hmm!”</i> Her laughter rises into an excitable squeak when you playfully reach out and flick her antennae in response.");

	processTime(5);
	clearMenu();
	addButton(0, "Past", quaelleTalkHerPart2First, true);
	addButton(14, "Leave",quaelleMainMenu,undefined);
}
//show dohrahn replacement
public function quaelleShowDohrahn(nude:Boolean = false):void
{
	showName("DOH’RAHN\nMATRON");
	if (nude) showBust("DOHRAHN_MATRON_NUDE");
	else showBust("DOHRAHN_MATRON");
}

public function quaelleApproachDohrahn():void
{
	clearOutput();
	quaelleShowDohrahn();
	author("Nonesuch");
	var desc:String;
	
	if (quaelleHasLeft())
	{
		if (flags["QUAELLE_LEFT"] == undefined)
		{
			flags["QUAELLE_LEFT"] = 1;
			output("<i>“Hi,”</i> says the white-uniformed, purple-membraned rahn, not looking up from her monitor. <i>“Steele, isn’t it. Need something?”</i>");		
			output("\n\nYou ask if Quaelle is around.");
			output("\n\n<i>“She left. Didn’t you hear?”</i> She glances up. <i>“Got itchy feet. Suckers, whatever. Kinda annoying, after Tamani put all this effort into making this place roehm-friendly.”</i> The new matron shrugs. <i>“But, well, whatever. It’s neat having a greenhouse reception I guess - so long as you don’t bring any paper in here. So. Is there something you need?”</i>");
		}
		else
		{
			output("<i>“Steele!”</i> The do’rahn matron of Breedwell slaps down her stylus and peers at you sternly. <i>“Just as I was making headway with this admin. You have a knack. What do you want?”</i>");
		}
	}
	else if (quaelleIsImmobile())
	{
		if (flags["QUAELLE_IMMOBILE_GREET"] == undefined)
		{
			output("<i>“She’s laid up in her room, lover [pc.boy],”</i> the purple-colored receptionist says, before you can even open your mouth. <i>“Turns out it’s pretty hard to work when you’re double pregnant. Or even move.”</i> She turns back to her screen. <i>“You could go visit her, I guess.”</i>");
			flags["QUAELLE_IMMOBILE_GREET"] = 1;			
		}
		else output("<i>“Steele!”</i> The do’rahn back-up matron of Breedwell slaps down her stylus and peers at you sternly. <i>“Just as I was making headway with this admin. You have a knack. I told you - Quaelle’s in her room, since you stuffed her too full of kids to work. Thanks for that, by the way.”</i>");
	}
	else output("<i>“Hi,”</i> says the white-uniformed, purple-membraned rahn, not looking up from her monitor. <i>“Steele, isn’t it. Need something?”</i>");
	
	clearMenu();
	if(!breedwellInductionCheck()) addButton(0, "Induction", ((flags["BREEDWELL_STATUS_BREEDER"] == undefined && flags["BREEDWELL_STATUS_DONATOR"] == undefined) ? breedwellInductionRouter : breedwellInductionUpdate), undefined, "Induction", ((flags["BREEDWELL_STATUS_BREEDER"] == undefined && flags["BREEDWELL_STATUS_DONATOR"] == undefined) ? "Get the low-down on what this job offer really is." : "See what your other half might be in for."));
	else if(flags["BREEDWELL_STATUS_BREEDER"] == undefined || flags["BREEDWELL_STATUS_DONATOR"] == undefined)
	{
		if(!pc.hasGenitals()) addDisabledButton(0, "Induction", "Induction", "You do not yet qualify. Get some genitals first!");
		else if(pc.isHerm() && !breedwellCheckBirth() && !breedwellCheckSperm()) addDisabledButton(0, "Induction", "Induction", "You do not yet qualify. Get to popping out more children or have your cum milked somewhere first!");
		else if(pc.hasVagina() && !breedwellCheckBirth() && flags["BREEDWELL_STATUS_BREEDER"] == undefined) addDisabledButton(0, "Induction", "Induction", "You do not yet qualify. Get to popping out more children already!");
		else if(pc.hasCock() && !breedwellCheckSperm() && flags["BREEDWELL_STATUS_DONATOR"] == undefined) addDisabledButton(0, "Induction", "Induction", "You do not yet qualify. Go get your cum milked somewhere!");
		else addDisabledButton(0, "Induction", "Induction", "Not necessary--You’ve already been qualified!");
	}
	else addDisabledButton(0, "Induction", "Induction", "Not necessary--You’ve been qualified for both areas already!");
	
	if (flags["QUAELLE_DOHRAHN_FLIRT"] == undefined) addButton(1, "Flirt", quaelleFlirtDohrahn, undefined);
	else addDisabledButton(1, "Flirt", "Flirt", "You tried this already!");
	
	if (MailManager.isEntryViewed("breedwell_premium_invite"))
	{
		if (breedwellPremiumContractCount() > 0) desc = "Renewal";
		else desc = "Premium";
		if (breedwellPremiumIsQualified(true))
		{
			if (breedwellPremiumContractCount() > 0) addButton(2, desc, breedwellPremiumRenewPremium,undefined,desc,"Ask about your Premium Breeder contract. Is it possible to do another term?");
			else addButton(2, desc, breedwellPremiumGetPremiumDohrahn,undefined,desc,"Ask about becoming a Premium Breeder.");
		}		
		else if (flags["BREEDWELL_PREM_CON_BAN"] == 1) addDisabledButton(2, desc, desc, "You have been banned!");
		else if (breedwellPremiumUnderContract()) addDisabledButton(2, desc, desc, "You are already under contract.");
		else if (!pc.hasVagina()) addDisabledButton(2, desc, desc, "You have no wombs!");
		else addDisabledButton(2, desc, desc, "Probably a bad idea to talk about this whilst you’re currently knocked up with something other than rahn.");
	}
	
	addButton(14, "Leave",mainGameMenu,undefined);
}
public function quaelleFlirtDohrahn():void
{
	clearOutput();
	quaelleShowDohrahn();
	author("Nonesuch");
	
	flags["QUAELLE_DOHRAHN_FLIRT"] = 1;
	
	output("<i>“This station has a way of satisfying female biological urges through theeeere...”</i> the do’rahn leans and points her stylus to the west. <i>“And a way of satisfying male ones through there.”</i> The stylus waggles towards the east. <i>“");
	if(flags["BREEDWELL_DONATION_LOCKED"] != undefined) output("And it’s not my fault you got your ass barred. ");
	output("Me? I’ve got a hell of a lot of work to do. Stop bothering me.”</i>");
	addDisabledButton(1, "Flirt", "Flirt", "You tried this already!");
}

public function quaelleAskSex():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	
	output("With a tiny shake of your [pc.hips] and a bite of your [pc.lips], you ask if she’s able to knock off for a while.");
	
	if (flags["QUAELLE_SNIT"] != undefined)
	{
		if (quaelleInSnit())
		{
			output("\n\n<i>“Ooooh no, I don’t think so, terribly vibrovant Steele,”</i> the roehm sighs. You can’t tell if the pity in her tone is mocking or genuine. <i>“We agreed to wait, didn’t we? I definitely remember you saying that, and I respect the wishes of my lovers.”</i> Alright, there it is - a little twitch of her lips and antennae, informing you she’s enjoying this. <i>“Maybe eeeventuuaaaaaally, hmm? Hmm. Hmm.”</i>");
		
				processTime(2);		
				addDisabledButton(3, "Sex", "Sex", "She is still in a snit!");
		}
		else
		{
			flags["QUAELLE_SNIT"] = undefined;
			output("\n\n<i>“Efficervescent Steele.”</i>");
			output("\n\nThis time, the roehm turns her smile on you without reservation when you mosey up to the front desk, and clasps your hands, cilia wiggling happily. You think, perhaps, you might just be forgiven.");
			output("\n\n<i>“You’ve learned about good waits and bad waits now, haven’t you?”</i> she murmurs. <i>“You aren’t going to inflict a bad wait on me again, are you?”</i>");
			output("\n\nYou firmly state that you aren’t, and receive a warm, wet squeeze in response.");
			output("\n\n<i>“It has been hard on me too, you know,”</i> the roehm says, lust blooming in her eyes and cheeks like melting ice-cream. <i>“Perhaps we could reconcile a nice way, somewhere private, hmm?”</i>");
			
			processTime(2);
	
			flags["QUAELLE_SEX_WAIT"] = GetGameTimestamp();
	
			clearMenu();
			addButton(0, "Wait", quaelleAskSexWait, undefined,"Wait","Cool your jets for an hour. Maybe there’s something on the extranet that’ll distract you from the prospect of hot, squishy slug poon.");
			addButton(14, "Leave", mainGameMenu, undefined, "Leave", "Go do something else on the station. She’ll probably be ready in about an hour.");
		}	
	}
	else
	{
		output("\n\n<i>“I ache to take you somewhere I can have you all to myself, vibrolescent Steele,”</i> murmurs Quaelle, merry double-pupilled eyes on you, hands knit beneath her breasts. <i>“It will take me a little while to organize a break, though. You can wait, can’t you?”</i>");
		output("\n\nIt’s a lover’s in-joke at this point, delivered with a teasing lilt. Her brilliant blue eyes remain on you for a moment longer before returning to her monitor and her impatient aides.");
		
		processTime(2);
	
		flags["QUAELLE_SEX_WAIT"] = GetGameTimestamp();
	
		clearMenu();
		addButton(0, "Wait", quaelleAskSexWait, undefined,"Wait","Cool your jets for an hour. Maybe there’s something on the extranet that’ll distract you from the prospect of hot, squishy slug poon.");
		addButton(14, "Leave", mainGameMenu, undefined, "Leave", "Go do something else on the station. She’ll probably be ready in about an hour.");
	}
}

public function quaelleAskSexWait():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	
	output("You sit yourself down in an alcove of the humid, verdant room, summoning up that immense patience you’ve learned to adopt when interacting with Quaelle. It’s difficult - the urge in your [pc.groin] throbs whenever your eyes settle on the roehm’s immense bust and pretty, good-natured face, over there by the desk - but you manage it. All good things come to those who wait.");
	output("\n\nYou flick through your extranet feed, answering those emails and reading those media clippings you’ve been putting off, before settling into watching a documentary about wildlife on ");
	output(RandomInCollection(["Leitha. How did any sapient species manage to evolve there anyway?", "Phaedra III. So many ingeniously lethal creatures.", "Myrellion. All small, scuttling divergences from a single family tree, the scientist community is agog with it.", "Rosha. Almost half of it is maintained as a wildlife reserve, filled with adorable, lethal fuzzy things.", "Hdar-Roe, funnily enough. In many minutes of viewing you don’t think you see a single sharp edge or point. It’s like the entire ecosystem collectively agreed to become some form of laid-back blob."]));
	output("\n\nFor all that you’ve summoned your zen-like state of calm, it’s hard not to keep shooting looks towards the front desk, and exhilaration floods your veins when you finally see Quaelle calmly direct her do’rahn second-in-command to take over from her and then sweeps away through a door behind the reception, throwing a brilliant-blue come-hither over her shoulder at you. You’re up and following her in an instant.");
	
	//increase willpower if under 50
	if (pc.willpowerRaw < 50) pc.willpower(1);
		
	processTime(60);
	clearMenu();
	addButton(14, "Leave",mainGameMenu,undefined);
}
//returns true if the number of hours have passed
public function quaelleSexTimer(minHr:int=0, maxHr:int=0):Boolean
{
	var minTF:int = minHr * 60;
	var maxTF:int = maxHr * 60;
	var minFlag:Boolean = true;
	var maxFlag:Boolean = true;
	var currTime:Number = GetGameTimestamp();
		
	if (flags["QUAELLE_SEX_WAIT"] == undefined) return false;
	
	if (minHr != 0)
	{
		if (currTime - minTF >= flags["QUAELLE_SEX_WAIT"]) minFlag = true;		
		else minFlag = false;		
	}
	
	if (maxHr != 0)
	{
		if (currTime - maxTF <= flags["QUAELLE_SEX_WAIT"]) maxFlag = true;		
		else maxFlag = false;		
	}
	
	if (minFlag && maxFlag) return true;
	
	return false;
}
//returns true if quaelle is in a snit
public function quaelleInSnit():Boolean
{
	var timeframe:int = 30 * 24 * 60;
	
	if (flags["QUAELLE_SNIT"] == undefined) return false;
	
	if (GetGameTimestamp() - timeframe <= flags["QUAELLE_SNIT"]) return true;
	
	return false;
}

public function quaelleSexNoShow():void
{
	output("<i>“Hello, my vibrantless, tremterous lover!”</i> Hands on her sides, Quaelle has a very uncharacteristic expression of frustration on her face, her brow scrunched into a frown, wide lips pulled into a pout. <i>“I put my work on hold for you, left my door open in hoverful hope - and then where were you? What a hollow, wretched wait it was! You have disappointed me, un-shiverous Steele.”</i>");
	
	clearMenu();
	addButton(0, "Apologise", quaelleSexNoShowApologise, undefined,"Apologise","Sincerely apologise.");
	addButton(1, "Tease",quaelleSexNoShowTease,undefined,"Tease","So being made to wait is bad all of a sudden?");	
}

public function quaelleSexNoShowApologise():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");	
	
	output("You take her by the hand and say you’re sorry. You got caught up in something here, then you got called away to urgent business on the frontier... you are a, uh, flickersome creature after all.");
	output("\n\n<i>“I should stay mad at yooouuu,”</i> says Quaelle after a long pause, looking at you sideways with a reluctant smile on her face. <i>“But it is so difficult. Alright, vibrous Steele. You are forgiven. Please don’t let it happen again.”</i>");
	output("\n\nAnother pause. The warm, sexual smell of caramel fills your nostrils.");
	output("\n\n<i>“Perhaps you’d like to show me how sorry you are, hmm?”</i> the roehm murmurs.");
	
	flags["QUAELLE_SEX_WAIT"] = undefined;
	
	processTime(2);
	pc.changeLust(5);
	quaelleMainMenu();	
}

public function quaelleSexNoShowTease():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");	
	
	output("<i>“I thought you were all about taking it slow!”</i> you reply with a roguish grin. You fold your arms and go on in a mockingly haughty voice. <i>“What happened to the roehm who taught me all about the virtues of being patient, and waiting for things to happen?”</i>");
	output("\n\nQuaelle gazes back at you, expression frozen for a few moments.");
	output("\n\n<i>“You are right, of course, metronomic Steele,”</i> she says at last, in a cool voice. <i>“I set the rhythms of this relationship, and you are merely trying to follow them the best you can, flickersome being that you are. Very well. We shall not talk about being intimate again for a long, long time.”</i>");
	output("\n\nShe lets that sink in.");
	output("\n\n<i>“Was there anything else you wanted, Steele?”</i>");
	
	flags["QUAELLE_SEX_WAIT"] = undefined;
	flags["QUAELLE_SNIT"] = GetGameTimestamp();
	
	processTime(2);
	pc.addMischievous(1);
	quaelleMainMenu();	
	
}
public function breedwellQuaelleAptBonus():Boolean
{
	author("Nonesuch");
	
	if (quaelleIsImmobile())
	{
		if (flags["QUAELLE_IMMOBILE_VISIT"] == undefined)
		{
			flags["QUAELLE_IMMOBILE_VISIT"] = 1;
			if (flags["QUAELLE_IMMOBILE_PREG_COUNT"] == undefined)
			{
				output("You head past reception and down the ramp into the living quarters. You enter Quaelle’s dim, humid apartment cautiously.");
				output("\n\n<i>“Emmmmmm. Hellooooo, trembulous Steeeeeeeele.”</i>");
				output("\n\nThe big, yellow roehm is laid out on her side in her cushioned bed pit, dressed in a long, flowery gown sort of garment. It does nothing to disguise how bloated she has become, both her front abdomen and her wide, wet tail packed and taut with pregnancy, making her look somewhat like a caterpillar that just went beast mode on a banana tree. Her breasts and face, too, look flush and swollen, ripe and heavy. The only part of her that still looks happy to move are her antennae, waggling away happily, currently pointed in your direction. The bed pit is surrounded by half-eaten pot plants.");
				output("\n\n<i>“If roehm get pregnant in both their woooombs,”</i> she says, hands on her belly, <i>“it’s traditional for themmm to gather together foooood and then hibernate until it is oooooover.”</i> It’s like listening to a recording slowed down for effect. <i>“I thooouuuught that was a little extremmmme when I read about it, but now... hmmmmmmm.”</i>");
				output("\n\nShe closes her eyes for so long that you think she’s drifted off.");
				output("\n\n<i>“I’m afraid I woooonnn’t be much fuuuuuun in this state, lovely, shiverous Steele,”</i> she sighs at last, blue eyes opening to regard you. She sounds faintly embarrassed. <i>“Buuuuut... would you like to staaaaay? We can watch something. I’d like that.”</i> Another long, sleepy pause. <i>“I’d like to hooooold you,”</i> she whispers.");
			}
			else
			{
				output("You head past reception and down the ramp into the living quarters. You enter Quaelle’s dim, humid apartment cautiously.");
				output("\n\n<i>“I caaaaaan’t believe I let you dooooooo thissss to me agaaaiiiiin,”</i> moans Quaelle. She is, once again, utterly engorged with pregnancy, her front belly watermelon-like in size, the middle of her lower body bulging with growing life. <i>“I can baaaaarely move, and aalll I want to do is eat and...”</i>");
				output("\n\nShe pauses and closes her eyes for at least twenty seconds.");
				output("\n\n<i>“...sleep.”</i>");
				output("\n\nShe manages to wave the very tip of her blunt tail at you.");
				output("\n\n<i>“You’ll staaaay for a little while, won’t you?”</i> she asks. <i>“I’ll put sooomething on. I’d just liiiike to hold you. Please?”</i>");
				output("\n\n(You think she’s quietly enjoying this. Certainly it’s giving her a great excuse to be even more sluggardly than usual.)");
			}
		}
		else
		{
			output("You head past reception, down the ramp into the living quarters, and from there into Quaelle’s dim, damp quarters.");
			output("\n\n<i>“Ohh helloooooo, trembulous Steeeeeeele!”</i>");
			output("\n\nQuaelle is still pooled into her cushioned bed pit, a great wet yellow mass of pregnant, hormonal feminineness. Somehow she looks even more swollen than the last time you saw her.");
			output("\n\n<i>“I’m sooooo glad you visited,”</i> she smiles. <i>“You brought some snugglesssss, didn’t you? Please say yeesssssss.”</i>");
		}
		processTime(5);
		clearMenu();
		addButton(0, "Bath", quaelleImmobileBath, undefined);	
		addButton(1, "Leave", quaelleImmobileLeave, undefined);	
	}
	else
	{
		output("Beyond the staff only door of Breedwell’s reception area there’s a small storage area and a ramp which leads further into the bowels of the station, all clad in the same spotless, well-lit white that is the trademark everywhere. Down the ramp is a long corridor of doors: entrances to the apartments where the mostly rahn staff of Breedwell live.");
		output("\n\nMost of the otherwise featureless doors are decorated, and you’d know which one was Quaelle’s even if you didn’t apply the logic that it’s probably the one the shortest distance from Reception. The nearest is surrounded in a glistening, ivy-like vine and flanked by hanging baskets containing brightly colored flowers and drooping ferns. It opens with a quiet hiss when you approach it, and as you step through you’re enveloped by tropical heat and humidity.");
		
		processTime(2);
		clearMenu();
		addButton(0, "Next", quaelleSexMenu, true);
	}
	
	return false;
}
public function quaelleSexMenu(intro:Boolean=true):void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
	
	if (intro)
	{
		output("Quaelle’s apartment is dimly lit, has rounded, curving walls and is almost sauna-like in atmosphere: deep, wet warmth that quickly makes sweat form on your brow. The light from the globe lights are hushed by the moisture in the air, but you can still pick out the hydroponic systems feeding the shelves of plants which run all around the apartment, and the big, steaming bath in one corner - as well as the more down-to-earth accoutrements of a singleton’s life, a large vid-screen, a kitchenette and a table covered in bits of junk and little bags of compost and plant-feed.");
		if (quaellePregnancyStage() >= 2) output("\n\nThe roehm herself is lying on her side in a shallow, pillowy, kidney-shaped depression in the floor on the other side of the room, her great blunt body curved into it. Her smile climbs onto her face like the rising sun when you enter, and as you watch she loosens her dress. Her full, soft, pendulous breasts come free as the garment falls, the pale yellow of her puffy nipples clear to see... and the brilliant blue cleft of plump flesh that is her sex, the same color of her eyes, peeking out below the curve of her soft belly. It’s a dazzling, alien cornucopia of ripe tropical fruit, laid out waiting for you to sink yourself into.");
		output("\n\n<i>“Efficervescent Steele,”</i> Quaelle murmurs, blue eyes glinting at you across the dusky room. <i>“Come here. Come be with me. Let’s be fluctacular together.”</i>");
		
	}	
	
	flags["QUAELLE_SEX_WAIT"] = undefined;
	
	clearMenu();
	if (pc.cockThatFits(chars["QUAELLE"].vaginalCapacity(1)) >= 0) addButton(0, "Fuck Pussy", penisRouter, [quaelleSexFuckPussyStart, chars["QUAELLE"].vaginalCapacity(1), false, 0], "Fuck Pussy", "Give her the dick. How this will go down depends upon your size... and staying power.");
	else addDisabledButton(0, "Fuck Pussy", "Fuck Pussy", "You do not have a cock small enough for this!");
	addButton(1, "Lick Pussy", quaelleSexLickPussy, undefined,"Lick Pussy","Eat her front muff. Then... maybe something else.");
	if (pc.cuntThatFits(chars["QUAELLE"].cockVolume(0)) >= 0) addButton(2, "Catch Vag", vaginaRouter, [quaelleSexCatchVag, chars["QUAELLE"].cockVolume(0), 0, 0], "Catch Vag", "Get done by a wiggly tentacle cock.");
	else addDisabledButton(2, "Catch Vag", "Catch Vag", "You need a vagina big enough for this!");
	addButton(3, "Oral", quaelleSexOral, undefined,"Oral","Would she be down for going down on you?");

}

public function quaelleSexFuckPussyStart(kok:int=0):void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
		
	output("You let the door hush shut behind you and divest yourself of your [pc.gear]. Your [pc.cock " + kok + "] springs");
	output(" outwards");
	output(", already appreciably hot and erect at the sprawling, exotic display of naked Quaelle.");
	
	if (pc.cockVolume(kok) > chars["QUAELLE"].vaginalCapacity(0)) quaelleSexFuckPussyBig(kok);
	else if (pc.cockVolume(kok) < 4.6) quaelleSexFuckPussySmall(kok);
	else quaelleSexFuckPussyPerfect(kok);
		
}

public function quaelleSexFuckPussyBig(kok:int=0):void
{
	
	output("\n\n<i>“Ummmmmmmm,”</i> she hums, gazing down at the massive dick in your hand, something between amusement and alarm on her benevolent, flat-nosed face. <i>“My word, Steele. You are a throbbulent one! How do the milker staff possibly accommodate you? I don’t think I can take you in my arms. That makes me somnolent,”</i> she sighs, antennae drooping. <i>“I do so like holding my lovers.”</i>");
	output("\n\nBlueness steals over you, too... until she goes on, in a more coquettish turn of voice.");
	output("\n\n<i>“But perhaps... hmm. Hmm. Perhaps there’s something a bit further back that might interest you?”</i>");
	output("\n\nShe’s gazing over her shoulder, and has curled her tail around a bit, so that you can see its blunt end. <i>Is</i> there something there, beneath the chubby blue-crested dimples of shimmering flesh? Ardor renewed, you [pc.move] across, dipping down into the bed pit and lay your hands on her great, squishy bulk from behind.");
	output("\n\nYou stroke her flanks, swiftly coating your arms and hands in caramel-scented slime, a small price to pay from the long sighs and hums of pleasure it draws out of her, her softness undulating underneath your touch whilst you probe carefully underneath the last ridge of her tail. Aha.");
	output("\n\nYou hold your breath slightly as you peel the flesh back, parting lubrication like a veil to reveal a brilliant blue vertical ravine, a plump sapphire treasure, similar enough to the pussy she has on her front for you to know immediately what it is... but still arrestingly alien. The slug girl sighs, a blissful sound that edges into alluring need as you probe the clit-less, perfectly round hole, sinking first one finger into its warm wetness, then two fingers, then your entire fist, disappearing into her soft, pulsing body up to your forearm, coming loose at last like a boot from mud. It stays gaped, a wormhole of a cunt that practically begs for something massive, throbbing and dripping to fill it.");
	output("\n\n<i>“It’s not too... churrisirous to you, is it, throbbulent Steele?”</i> Quaelle asks timidly, blinking her conjoined pupils at you over her shoulder. <i>“I do not mind if so. We could just hoooooollllllld...”</i> she dissolves into a delighted moan as you line your [pc.cock " + kok + "] up to it, take a firm grip of her flanks and then penetrate her, groaning at the sheer joy of the silky wetness engulfing first your [pc.cockHead " + kok + "] and then the rest of your oak-like shaft.");
	
	pc.cockChange();
	
	output("\n\nThere seems to be no end to the give of her back pussy - just an endless hot, rippling tunnel that deep, hard biological imperative impels you to drive into. There seems to be almost a foot of it for you to slowly withdraw back through, relishing the way it sucks and pulls at you wetly, and then shove your [pc.cock " + kok + "] back into hard, drawing a high squeal of pleasure out of her.");
	
	if (quaelleIsPregnant(1))
	{
		output("\n\n<i>“Please go gently, virulous Steele!”</i> she cries, antennae waving agitatedly. <i>“You know I’m... gravid, there... ”</i>");
		output("\n\nYou try to, but it’s hard when your over-sized cock throbs so powerfully, delighted to have a hole to plough that can take almost every inch of it. You compromise by pushing into that slick, wet goodness with short, shallow, furious humps, clutching handfuls of her pliant, slimy form, the effort to hold yourself back translating into a litany of heartfelt groans pouring out of your mouth as you fuck her pregnant cunt.");
	}
	else
	{
		output("\n\nIt’s a sound of purest feminine desire that drives you into a fugue of lust,");
		if (pc.balls > 0) output(" your [pc.balls] throbbing");
		output(" as you deliver one delicious thrust of your [pc.cock " + kok + "] into her long, blue back hole after another, lusty groans pouring out of your mouth at how perfect it feels. It pulses and clenches around you, clear lubricant running freely down your shaft and dripping down your [pc.thighs], seemingly egging you on.");
	}
	
	output("\n\nYou can see the waves of motion you’re driving into Quaelle travelling up her wide, blunt body, right up to her copse of waggling antennae. She herself has turned away, one hand schlicking away in her front pussy and the other kneading her breast, apparently lost in an erotic trance. When you experimentally reach forward and touch the dark, orange spots on the top of her gastropod body though, she gasps.");
	output("\n\n<i>“Ohhhhhh... not those! That would be too much, tremuful, palpitacious, throbbulent...”</i>");
	output("\n\nYou grin and seize them, using them as leverage to pound her even harder, wondering as they grow rise like small buns under your groping, stroking touch. Are these her natural nipples? Certainly she reacts as if they were, crying out shrilly, jilling herself rhythmically, orgasming in a great shudder, spurting lubricant all over your");
	if (pc.balls > 0) output(" [pc.balls] and");
	output(" [pc.thighs], her sapphire pussy clenching and rippling around you.");
	
	output("\n\nYou keep giving it to her throughout, one heartfelt spear of your [pc.cock " + kok + "] into her after another, delighting in the massive, full body orgasm you’re giving the great, sensitive creature. The seizures of her tunnel around you though, milking and kneading you so wonderfully, just seem to go on and on, and your own lust overtakes you. You sink into that hot, slimy delight as far as you can, groaning as you cum, a huge load of [pc.cum] coursing up your shaft and spurting out into");
	if (quaelleIsPregnant(1)) output(" her cunt");
	else output(" her womb");
	output(", packing it out with your [pc.cumVisc] love.");
	
	output("\n\nYou have so much soft, wet, pliant flesh to brace yourself against, and you take advantage of it to really give it to her, ploughing that seed into her with one juicy clench of your [pc.thighs] and [pc.ass] after another. She whimpers with moist delight as it issues filthily out of her soft, tender folds, soaking into the moist pillows.");
	output("\n\n<i>“Ohhhhhhhhhhh,”</i> she sighs, a sound which seems to go on for minutes, turning around and gazing at you with well-fucked adoration. <i>“I don’t get that kind of action very often. You are the most shiverous of studs, Steele!”</i>");
	output("\n\nYour [pc.cock " + kok + "] comes loose from her back passage, achingly proud, and you slip into her embrace at the front, cuddling into her great, wet, pillowyness.");
	output("\n\n<i>“I’m going to take a bath,”</i> she purrs, after a long, happy climb down. <i>“You’ll join me, won’t you? We can Exquark and melt.”</i>");
	
	processTime(25 + rand(15));
	IncrementFlag("QUAELLE_SEXED");
	IncrementFlag("QUAELLE_FUCK_CUNT_BACK");
	knockUpQuaelleChance(1);
	pc.orgasm();
	quaelleHugged();
	
	clearMenu();
	addButton(0, "Bath", quaelleSexBath, undefined,"Bath","Melting sounds pretty fun.");	
	addButton(1, "Scoot", quaelleSexScoot, undefined,"Scoot","You should go.");	
	
}
public function quaelleSexFuckPussySmall(kok:int=0):void
{
	
	output("\n\n<i>“Ohhhhhhhhh,”</i> coos Quaelle half-laughingly, gazing down at your [pc.cock " + kok + "]. <i>“Look at that shiversome little guy! So small! So sweet! Oh, I want to eat it up. Emmmmm. I won’t, though. I’d get sick.”</i>");
	output("\n\nThe heat on your [pc.skinFurScales] intensifies underneath her patronizing gaze. Your [pc.cock " + kok + "] doesn’t care - it’s eagerly, burningly erect, gleeful at the prospect of being enveloped by warm, glutinous slug love.");
	output("\n\n<i>“Come and sit here, little Steele,”</i> says the supine roehm in a kind but authoritative voice. <i>“Let me take care of that for you.”</i>");
	
	output("\n\nIt’s easy to obey the matronly tone of her voice, to climb into the bed pit and do nothing but gaze and shiver in awe as she undulates over you like a tropical glacier, smushing you back into the pillows with her great, slimy bulk. She lets you touch her patiently,");
	if (quaellePregnancyStage(0) >= 2) output(" rubbing her taut, pregnant belly,");
	output(" admiring the heft and softness of her breasts, running your hand down her warm, slimy side. When her own hand wraps itself around your [pc.cock " + kok + "], you can’t but spasm slightly, as if she’d given you a slight electric shock.");
		
	output("\n\n<i>“Hmm. It’s ok! Look... ”</i> Her smooth plumpness slides over your erection as she lines you up with herself, your [pc.cockHead " + kok + "] cosseted by sapphire flesh. She sighs long and deep as she inches herself forward, penetrating herself on your short shaft, just about big enough to get past her puffy labia and enter her hot, wet hole proper. You groan yourself as your sensitive prick is mired in mushy, female pressure.");
	
	pc.cockChange();
	
	output("\n\n<i>“Do you like that, precious Steele?”</i> Quaelle murmurs, her epidermis slipping and sliding gently up your [pc.belly] and [pc.chest], a massage from a sea of loving, caramel-scented slime. She’s got you almost splayed against the pit cushion, your");
	if (pc.hasLegs()) output(" [pc.legs]");
	else output(" [pc.thighs]");
	output(" stretched open as she uses your [pc.cock " + kok + "] with squishy little movements, sending intense bursts of heat and sensation into your body. You flex against her reactively, making her giggle. <i>“Hmm. Hmm. Hmm.”</i>");
		
	output("\n\n<i>“Oh, it’s so nice to make a cute little thing squirm and squiggle,”</i> she says, stroking your brow and [pc.hair]. <i>“Are all [pc.race] as small and sensitive as you? I’m surprised you aren’t owned by some stern and metronomic lady, who keeps you locked up, only gives you milkings when you really deserve them. Weeeelllll... I’m glad.”</i>");
	
	output("\n\nShe plants a soft kiss on your brow, wet, tender fingers touching your [pc.nipples]. Schlick, schlick, schlick goes her plump pussy, smushed against your");
	if (pc.balls > 0) output(" [pc.balls]");
	else output(" groin");	
	output(" and milking your [pc.cock " + kok + "] rhythmically. You moan, arching your back fruitlessly against her vast, wet softness. You’re close...");
	
	output("\n\n<i>“I’m glad I have you as my seed packet,”</i> she whispers. <i>“My quiverous little " + pc.mf("boy","girl") + " stud, sugary and good. You’re going to squirt for me, aren’t you? Yes, you are. Squirt for me.”</i>");
	output("\n\nYou cum, reactively clenching your [pc.thighs] into her as your [pc.cock " + kok + "] flexes up brilliantly again and again, eagerly obeying her command to spurt [pc.cum] into her warm, spongey embrace.");
	
	if (pc.cumQ() >= 1000)
	{
		output("\n\nShe coos as you flume heavy amounts of [pc.cumVisc] semen into her, your orgasm as ever made incredibly intense by the quantity of cum you have to force out of your poor, sensitive little shaft. You come loose from her after half a dozen clenches, fountaining [pc.cum] over your [pc.belly] and her");
		if (quaellePregnancyStage(0) >= 2) output(" taut");
		else output(" soft");		
		output(" belly in a daze. Your prostate aches by the time you’re done painting both of you in [pc.cumColor] fluid, and you’re sagged back against the cushion, sweat pouring down your brow.");
		
		output("\n\n<i>“Oh wow,”</i> Quaelle coos, squashing your head between your bosom. <i>“You had soooooo much pent up inside of you, didn’t you? No wonder you’re so sensitive and obedient! A perfect, vigroful, squirmsome little cum pump, that’s what my lover is.");
		if (quaelleIsPregnant(0)) output(" Making babies with " + pc.mf("his","her") + " sweet, docile little " + pc.mf("boy","girl") + " dick.”</i> She passes a hand over her increasingly bloated front happily.");
		else output(" I bet your sperm are made in the same image!”</i> She strokes her soft belly happily.");
	}
	else
	{
		output(" She was right, you are a squirter, your [pc.cumVisc] drips and drops lost completely in her pussy, half of it wasted as you come loose from her and orgasm against her pillowy labia and hard, nubby clit.");
		output("\n\n<i>“Good " + pc.mf("boy", "girl") + "!”</i> Quaelle coos, squashing your head between your bosom.");
		if (quaelleIsPregnant(0)) output(" <i>“Oh, I do so enjoy seeing to the squirmsome father of my children!”</i>");
		else output(" <i>“I’m sure that’ll be enough. Your sperm will be as vigroful and obedient as you are!”</i>");
	}
	
	output("\n\nYou’re cuddle the roehm in silence for a little while, the sauna and post-coital bliss baking you, her antennae tickling your [pc.hair].");
	output("\n\n<i>“I’m going to take a bath now,”</i> she purrs at last. <i>“You’ll join me, won’t you? We can Exquark and melt.”</i>");
	
	processTime(25 + rand(15));
	IncrementFlag("QUAELLE_SEXED");
	IncrementFlag("QUAELLE_FUCK_CUNT_FRONT");
	knockUpQuaelleChance(0);
	pc.orgasm();
	quaelleHugged();
	
	clearMenu();
	addButton(0, "Bath", quaelleSexBath, undefined,"Bath","Melting sounds pretty fun.");	
	addButton(1, "Scoot", quaelleSexScoot, undefined,"Scoot","You should go.");	
	if (pc.libido() >= 50 && (CodexManager.hasViewedEntry("Roehm") || flags["QUAELLE_FUCK_CUNT_BACK"] != undefined)) addButton(2, "More!", penisRouter, [quaelleSexFuckPussySmallMore, chars["QUAELLE"].vaginalCapacity(1), false, 0]);	

	
}
public function quaelleSexFuckPussySmallMore(kok:int=0):void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");	
	
	output("Your [pc.skinFurScales] is still ablaze with lust. Slathered in the roehm’s cloying pheromones, enveloped in her warm, sticky embrace, you are made momentarily dizzy by it and the damp heat, staring at her blunt, fertile curves. <i>More</i>, your body whispers. <i>Make it with her some more.</i>");
	output("\n\n<i>“Oooohhhhh myyyyyy Steele!”</i> Quaelle says, with a teasing lilt, gazing downwards with those eerie, double-pupiled eyes of hers. Woozily you realize you haven’t lost your erection at all, your [pc.cock " + kok + "] still standing short and stout to attention.");
	output("\n\n<i>“You aren’t yet spent?”</i> the roehm asks, squeezing you. You open your mouth as you feel her hand enclose your slime-coated erection, spongy pressure gripping... receding. Gripping... receding. <i>“So full of vigor and quiver! My eager little lover. My dizzy little seed packet.”</i> She kisses you on the temple, lips tickling your [pc.ear]. <i>“Shall I drain you some more? I think so. Hmm. I think so. Go around to the back, sweet leaf. Have a rummage around... see what you might find...”</i>");
	output("\n\nBreathlessly you peel yourself out of her embrace and [pc.move] around to the blunt, wide end of her tail. Beneath the folds of warm yellow flesh there your fingers probe, until - Quaelle sighs like a gentle summer wind - you peel back two curtains of lube-painted softness and reveal a vertical, sapphire ravine. The roehm’s second vagina is the same color as her front sex but is arrestingly alien. You sink your fingers into that perfectly round, clit-less hole, wonderingly probing its apparently endless, hot, sticky give.");
	if (pc.cockVolume(kok) <= 4.6) output(" It’s an aperture clearly meant for a partner much, much better endowed than you.");
	else if (pc.cockVolume(kok) <= chars["QUAELLE"].vaginalCapacity(0)) output(" It’s an aperture clearly meant for a partner better endowed than you.");
	
	output("\n\n<i>“You know what to do with that, don’t you, trembluous Steele?”</i> says the slug girl, gazing over her shoulder at you placidly, antennae undulating gently. You blush, and she smiles comfortingly, seemingly reading your mind. <i>“Go on, little sweet leaf, put it in. I don’t mind that you’re tiny. What matters to me is that I haven’t completely drained you... you still shiver and quiver with untapped vigor. I want it all.”</i>");
	output("\n\nShe says that last bit with that same firm, teacherly authority she used to coax you into her arms in the first place, and you can’t say no to that... not when your [pc.cock " + kok + "] is so urgently erect, so eager to continue copulating with this soft, squishy female.");
	output("\n\nA few seconds later you’re gripping her warm, slimy bulk and clapping your [pc.thighs] into her tail end energetically, thrusting your [pc.cock " + kok + "] into her gaping tail end. You’re mired in wetness, your tender");
	if (pc.cockVolume(kok) <= 4.6) output(" twig - dick utterly lost in her cavernous depths, barely even past her lips, but you don’t care, you don’t care,");
	else if (pc.cockVolume(kok) <= chars["QUAELLE"].vaginalCapacity(0)) output(" dick utterly lost in her cavernous depths, but you don’t care, you don’t care,");
	else output(" dick filling her cavernous depths,");
	output(" there’s only her soft command and your hard biological urge, compelling you to push yourself into her soaked, pillowy goodness again and again. Your empassioned gasps and groans echo off the wet walls.");
	
	output("\n\nQuaelle watches you go at her over her shoulder complacently, slowly stirring her front pussy with one lazy finger, waves of motion travelling up her gleaming body, goading you on with little coos and humming giggles.");
	if (pc.cockVolume(kok) <= 4.6) output(" It couldn’t be clearer you’re doing absolutely nothing for her - no matter how much pleasure surges up your tender, twig-like shaft, no matter how urgently and energetically you push it into her pliant bulk - but she seems happy to just watch you, happy to watch you squirm and ratchet yourself up towards another high.");
	
	output("\n\n<i>“Oooohhhhh that’s it,”</i> she sighs as fresh ecstasy seizes you and you orgasm into her,");
	if (pc.balls > 0) output(" [pc.balls]");
	else output(" groin");	
	output(" flexing desperately to propel a new hot, [pc.cumVisc] load into her depths. She writhes around you gleefully, powerful muscles kissing your flexing shaft on either side. <i>“Give me everything you have left, my cute, shiversome lover! Don’t stop until you’re completely dry! The feeling of your seed inside of me is so mumberfelt...”</i>");
	
	output("\n\nPropelled onwards, you keep pumping into her until you are utterly spent, your [pc.cock " + kok + "] flexing dryly, so that when you part from her easily you almost collapse, so shaky are you. Quaelle turns and sweeps you into her arms with a happy chorus of hums, swaddling you in the endless plushness of her boobs, planting a motherly kiss on your brow.");
	output("\n\n<i>“Good, trembluous little Steele,”</i> she coos. <i>“[pc.He] has done so well for me today!”</i>");
	output("\n\nGroin throbbing mightily, you’re happy to let her coddle you, dizzily enjoying the sweet, slimy embrace.");
	output("\n\n<i>“I think I’ll have a bath now,”</i> she whispers. <i>“You’ll join me, won’t you Steele? Yeesssss. You will.”</i>");
	
	processTime(25 + rand(15));
	IncrementFlag("QUAELLE_SEXED");
	IncrementFlag("QUAELLE_FUCK_CUNT_BACK");
	IncrementFlag("QUAELLE_FUCK_CUNT_MORE");
	knockUpQuaelleChance(1);
	pc.orgasm();
	quaelleHugged();
	
	clearMenu();
	addButton(0, "Bath", quaelleSexBath, undefined,"Bath","Melting sounds pretty fun.");	
	addButton(1, "Scoot", quaelleSexScoot, undefined,"Scoot","You should go.");	
	
}
public function quaelleSexFuckPussyPerfect(kok:int=0):void
{
	
	output("\n\nHer eyes light up like neutron stars when they land upon your cock.");
	
	output("\n\n<i>“Mmmmm. That looks like something");	
	if (flags["QUAELLE_FUCK_CUNT_FRONT"] == undefined) output(" I’d like to get to know”</i>");
	else output(" I’ve come to know and love very well”</i>");
	output(" she purrs, touching the plump folds of her front pussy, as if already imagining you inside of her.");
	
	output("\n\nYou [pc.move] across and step into the cushion-filled bed pit, sighing softly as she plasters her warm, soft hand around your [pc.cock " + kok + "] and shifts her grip up and down it, testing and admiring your length");
	if (pc.balls > 0) output(", shifting downwards to tenderly caress your [pc.balls]");
	output(". Your [pc.cockNoun " + kok + "] is swiftly covered in caramel-scented slime, glowing with lust as her soft, teasing touch coils around it, and you’re impelled to seize her back, making her gasp and giggle as you grasp her generous boob and curl your arm around her flank, pushing your intensely erect dick into her squashy, moist flesh.");
	
	if (flags["QUAELLE_FUCK_CUNT_FRONT"] == undefined) output("\n\nFor a little while you just hold and explore this lovely but very alien creature, stroking and gripping and touching her great, pliant bulk, working out exactly what she likes and what she doesn’t. You can sink your hands into her flanks up to your wrist, and although that doesn’t seem to bother her you yourself don’t like doing that. Too deep and you think you can actually feel her organs, pulsing away. Her boobies though, pillowing into your face and [pc.chest] with each undulation of her body. That flush, wet entrance you can feel as you run your length over its plump, wet lips. Those you <i>do</i> understand.");
	else output("\n\nYou know enough now how to get Quaelle’s motor running. It’s great fun, indeed, to reach beyond her calm, complacent facade and coax out someone who’s just as eager and excited in the bedroom as any endoskeletal being. She moans, a long and fruity sound, as you finger her, using more force than you normally would to dig into her incredibly pliant pussy and find those lovely little nerve clusters of hers, all the while you stroke her flanks, reaching back far enough to find a natural nipple, gently pulling at it until it’s fully erect, orange and bun-like in your hand. The slug girl bucks against you as hard as she can in response, translating as a wave of delightful, slimy motion undulating up your [pc.belly] and [pc.chest].");
	
	output("\n\n<i>“Oh, throbbulent Steele...”</i> she groans, as you line your [pc.cock " + kok + "] up between her chubby, brilliant blue lips and open her up with a slow push forward, sultry joy spreading up your shaft as you penetrate her cunt, every bit as soft, pleasant and slimy as the rest of her. She oozes forward, drawing you into her embrace as she pushes herself down your cock, pressing you against the soft cushions of the bed pit’s side. You groan ecstatically; your");
	if (pc.balls > 0) output(" [pc.balls]");
	else output(" [pc.thighs]");	
	output(" deep in her, spongey, rippling warmth squeezing into your [pc.cockNoun " + kok + "] from all sides. Your sexes are perfectly suited to one another.");
	
	pc.cockChange();
	
	output("\n\nYou make out with her passionately, kissing deeply as you stroke and grope each other, her hand squeezing your [pc.ass] whilst you pump your [pc.hips] against her great, soft bulk, spreading her silky wet flesh back and forth against your [pc.cock " + kok + "].");
	if (quaellePregnancyStage(0) >= 2)
	{
		if (pc.bellyRating() >= 30) output(" Your twin baby bulges make");
		else output(" Her baby bulge makes");
		
		output(" this an even gentler, loving experience than it is usually, and you coax wonderful, musical hums out of her by spreading your hand over hers, stroking the taut, harder curve over and over.");
	}
	else if (pc.bellyRating() >= 30) output(" Your baby bulge makes this an even gentler, loving experience than it is usually, and you coax wonderful, musical hums out of her by spreading your hand over hers, stroking the taut, harder curve over and over.");
	
	if (quaelleIsPregnant(0)) output("\n\n<i>“Go slowly please, virullous Steele...”</i> she gasps into your mouth, her growing stomach planing over your own. <i>“Not just because... ummmmm... I love feeling you inside of me.”</i> You do as she asks, letting her press you into the side of the bed pet and just giving her the most gentle of pushes, back and forth, back and forth, a very sedentary, sensual rhythm. Sweat runs down your brow in steady rivulets as you do it.");
	else
	{
		output("\n\nLust begins to tighten its grasp on you, the pressure in your");
		if (pc.balls > 0) output(" [pc.balls]");
		else output(" loins");	
		output(" pushing you onwards, and you begin to thrust your red hot length into her passionately, your energy translating into little waves along her great, wide bulk.");
		output("\n\n<i>“So virullous!...”</i> she moans, eyes open, drinking in the fast, dynamic creature mating with her. <i>“So judderific! Like that! Yeeeeessssssss!”</i>");
	}	
	
	output("\n\nShe cums with a drawn out, husky cry, shoving herself into you eagerly, burying you in waves of soft, wet flesh, her cunt rippling and squeezing your [pc.cock " + kok + "]. You are able to just lie back and let her do the work, just giving back with small little pushes of your [pc.thighs] whilst you lick and fondle her breasts... for a bit. One and fuck, her orgasm just seems to go on and on, slickness and clenches running up and down your prick for more than a minute as she sighs and groans and surrounds you in her endless, pillowy, sugary give, and ultimately it becomes impossible not to get caught up in it.");
	
	output("\n\nYou groan as your heat bubbles upwards, coaxed on by the horny caramel in your mouth and nose and the milking squelch your [pc.cockNoun " + kok + "] is caught in, and you cum in a spectacular blaze, hurling [pc.cum] deep into Quaelle’s snatch.");
	if (pc.cumQ() >= 1000) output(" Her sex is a patient, implacable milking machine, and your [pc.cockNoun " + kok + "] reacts to it in kind, spewing out huge quantities of [pc.cumFlavor], [pc.cumVisc] seed in response. You’re trapped within her warm, slimy depths as your twined sexes throb together, flexing and flexing until her tunnel is utterly backed up and [pc.cum] is drooling out down her front liberally. She sighs with profound pleasure throughout, wringing you with sponge-like pressure until finally you’re allowed to relax out of her, drooling and drooping back against the wet comfort of the pit cushions.");
	else output(" You don’t have much to give, your throbbing [pc.cockNoun " + kok + "] quickly pulsing out nothing but drops, but that doesn’t matter to the implacable milking machine that is a roehm’s sex; she continues to squeeze you with soft torment, trapped within her, for minutes afterwards, sighing with profound pleasure, fondling and kissing you all the while. All sensation disappears from your [pc.legs], and you pool into the bed pit when she’s finally done with you, oozes slowly backwards and lets your prick part with her. You feel like you’ve turned into a slug yourself.");
	
	output("\n\n<i>“That was lovely, judderific Steele,”</i> she whispers, antennae tickling your brow and [pc.hair]. <i>“You are truly a mumberfelt lover!”</i> There’s a silence for a time, as you hold each other in the warm, slimy afterglow. <i>“Would you like to Exquark and melt now? The bath is already run.”</i>");
		
	processTime(25 + rand(15));
	IncrementFlag("QUAELLE_SEXED");
	IncrementFlag("QUAELLE_FUCK_CUNT_FRONT");
	knockUpQuaelleChance(0);
	pc.orgasm();
	quaelleHugged();	
	
	if (pc.libido() >= 50) output("\n\nYour [pc.cock " + kok + "] throbs powerfully. Perhaps you’re not done just yet...");	
	
	clearMenu();
	addButton(0, "Bath", quaelleSexBath, undefined,"Bath","Melting sounds pretty fun.");	
	addButton(1, "Scoot", quaelleSexScoot, undefined,"Scoot","You should go.");	
	if (pc.libido() >= 50 && (CodexManager.hasViewedEntry("Roehm") || flags["QUAELLE_FUCK_CUNT_BACK"] != undefined)) addButton(2, "More!", penisRouter, [quaelleSexFuckPussyPerfectMore, chars["QUAELLE"].vaginalCapacity(1), false, 0]);	
}

public function quaelleSexFuckPussyPerfectMore(kok:int=0):void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");	
	
	if (flags["QUAELLE_FUCK_CUNT_MORE"] == undefined)
	{
		output("You? Ready to call it a day? Clearly this gastropod doesn’t know the type of lover she’s gotten here! You grin back at her wolfishly and splay your [pc.thighs], a simple look at her glistening, colorful, Rubenesque curves enough for a fresh surge of lust to enter you, powering your [pc.cock " + kok + "] into a fresh, hot erection.");
		output("\n\n<i>“Oohhhhhhh. My,”</i> Quaelle simpers, gazing down at it, orange spreading across her face. <i>“You are a <b>very</b>  throbbulent one, aren’t you Steele? Hmm. I’m... not sure what to do about that...”</i>");
		
		output("\n\nYou do.");
		
		if (flags["QUAELLE_FUCK_CUNT_BACK"] != undefined) output(" You already know all about that blue, succulent tunnel of hers she’s hiding underneath her tail.");
		else output(" Didn’t the codex say roehm have more than one sex?");		
		output(" You pull yourself up and, hand sliding down her warm slimy flank, you move around her, hands questing beneath the folds of her blunt, lozenge-like tail. You huff with satisfaction when you find it: a brilliant blue vertical ravine nestled deep within her creamy yellow softness, a plump sapphire treasure, similar enough to the pussy she has on her front for you to know immediately what it is... but still arrestingly alien.");
		
		output("\n\n<i>“Ooooohh...”</i> she hoots, softly and mellowly, gazing over her shoulder. <i>“Do be lembellous with that, Steele...”</i>");
	}
	else
	{
		output("You answer that question with a roguish grin, directing attention to your [pc.cock " + kok + "], half-erect between your [pc.thighs] and already thickening again, impatient for more.");
		output("\n\n<i>“Ohhhhh my,”</i> Quaelle giggles, face orange. You know by now she finds such an energetic, insatiable lover as you a turn-on; she’s just a big, lusty sponge, eager to soak you up. <i>“Whatever are we going to do about that, throbbulent Steele?”</i> She shifts herself slightly, a ripple of flesh that draws your eye to her wide, blunt, back end. <i>“Maybe there’s an answer, somewhere...”</i>");
	}
	
	output("\n\nAbout half a minute later you’re gripping her soft, wet flanks, engaged in slapping your [pc.thighs] into her tail end energetically, painting your [pc.skinFurScales] in sweet-smelling slime, delighting in the deep, wet magic you’re steeping your [pc.cock " + kok + "] in with each thrust. Quaelle herself is lost in an erotic reverie, fingering her front pussy and pawing at her breast, her head thrown back and antennae flicking frenetically at the air, little waves of motion carrying up her flanks and flowing up her humanoid half.");
	
	if (quaelleIsPregnant(1)) output("\n\n<i>“Oh, to have a stud like thiiissssss,”</i> she cries thickly. <i>“[pc.He] has already gotten me with child, and yet [pc.he] still makes love to me like we were first full yearers! I never knew it could be...”</i> she can’t even find the non-existent word to describe it, simply drones long and low with the deepest appreciation.");
	else output("\n\n<i>“I can’t believe you’re siring me from behind as well,”</i> she moans, as transported as you’ve ever heard her. <i>“I am going to be so full! It’s so mellifluent... so virulous... so...”</i> she subsides into wordless sounds of the deepest, wettest arousal.");
	
	output("\n\nHer back pussy isn’t as tight and compact as her front one");
	if (pc.cockVolume(kok) <= chars["QUAELLE"].vaginalCapacity(0)) output(", clearly suited to an alien member bigger than your [pc.cock " + kok + "]");
	output(", but her soft moans and sighs, and the filthy wet slap-slap-slap of your thighs");
	if (pc.balls > 0) output(" and [pc.balls]");
	output(" against her rear propel you on, your [pc.cockNoun " + kok + "] pulsing heat and lustful energy into your core. One, you hope the rahn staff can hear you through the walls... you hope you make them deeply jealous. Or horny for it. Both.");
	
	output("\n\nYou orgasm with a shuddering cry, another [pc.cumVisc] load of cum coursing up your [pc.cock " + kok + "] like liquid electricity, your [pc.butt] clenching up as biological imperative compels you to seed Quaelle’s second cunt. You grip her flanks and thrust into it as deep and hard as you can, her tunnel easily big, wet and springy to take it, the delicious cries and shivers you draw out of the roehm matron by doing so absolute music to your [pc.ears].");	
	
	output("\n\n[pc.Cum] drools out over her blue lips when, at last, you part from her, but not so much; her back entrance puckers closed almost immediately, drawing as much of your fertile seed into itself as it can");
	if (quaelleIsPregnant(1)) output(" despite the fact she’s already swollen with pregnancy");
	output(".");
	
	output("\n\n<i>“Ohhhhhhhhhhh,”</i> she sighs, a sound which seems to go on for minutes, turning around and gazing at you with well-fucked adoration. <i>“You have worn me out, shiverous Steele. What a remarkable, fluttirous lover you are!”</i>");
	output("\n\nYou slip into her embrace at the front, cuddling into her great, wet, pillowyness, happy to let her dance her antennae over you, groin aching wonderfully.");
	output("\n\n<i>“I have to take a bath now,”</i> she purrs, after a long, happy climb down. <i>“You’ll join me, won’t you? We can Exquark and melt.”</i>");
	
	processTime(25 + rand(15));
	IncrementFlag("QUAELLE_SEXED");
	IncrementFlag("QUAELLE_FUCK_CUNT_BACK");
	IncrementFlag("QUAELLE_FUCK_CUNT_MORE");
	knockUpQuaelleChance(1);
	pc.orgasm();
	quaelleHugged();
	
	clearMenu();
	addButton(0, "Bath", quaelleSexBath, undefined,"Bath","Melting sounds pretty fun.");	
	addButton(1, "Scoot", quaelleSexScoot, undefined,"Scoot","You should go.");	
	
}

public function quaelleSexLickPussy():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
	
	output("The sight of her plump, blue pussy laid out like that for you makes your mouth instinctively water. Those swollen, gleaming curtains, her enlarged");
	if (flags["QUAELLE_CATCH_CUNT"] != undefined) output(" pseudo-clit");
	else output(" clit");	
	output(" peaking out between them, it just looks so delicious... particularly with that pernicious, cloying smell of caramel hanging in the humid air, drawing blood inexorably down towards your [pc.groin].");
	
	output("\n\n<i>“You look hungry, trembulous Steele,”</i> smiles Quaelle, antennae waving like grass touched by a gentle breeze. She undulates faintly, making her sex pulse and her boobs and stomach gently tremble. She knows what she’s doing. <i>“Would you like me to make you a salad? Or... perhaps there’s something else that’s caught your attention. Hmm. Hmm.”</i>");
	output("\n\nIn a heated, sweaty daze you [pc.move] across and kneel in front of her, gazing up at her as you caress her gleaming epidermis, admiring its welcoming pliant give when you sink a finger past her sapphire folds, testing the deep, wet warmth within.");
	output("\n\n<i>“Ooh...”</i> sighs Quaelle, stroking your [pc.hair] and instinctively swelling her bulk forward, her wet blueness take up the entirety of your vision. Her sugary pheromones fill your mouth and nose, heat");
	if (pc.isLactating()) output(" moistening");
	else output(" hardening");	
	output(" your [pc.nipples] and");
	
	if (pc.hasCock() && pc.hasVagina()) output(" swelling [pc.eachCock] and making [pc.eachVagina] drip with [pc.femcum], and");
	else if (pc.hasCock()) output("  swelling [pc.eachCock], and");
	else if (pc.hasVagina()) output(" making [pc.eachVagina] drip with [pc.femcum], and");
	output(" you’re forced to swallow away the saliva that fills your mouth. Void, the scent just makes you want to lick and suck and drink for days... you’re not thinking anything, letting pure instinct direct you, when you push your [pc.lips] into her gooey labia, slipping your [pc.tongue] past her lips.");
		
	output("\n\nThe slug girl sighs again, a drawn out, blissful sound as you french her pussy, slathering your lips and chin with sweet, pheromone-laden slime as you reach deeper and deeper into her, your arms gripped around her pillowy front");
	if (quaellePregnancyStage(0) >= 2) output(", head tucked beneath her pregnant mound");
	output(".");
	
	output("\n\n<i>“A flickerful being like you must have a lot of experience at this,”</i> she murmurs, hand drifting");
	if (pc.hasHair()) output(" through");
	else output(" over");	
	output(" your [pc.hair]. <i>“All that energy and vim, flitting between every flower that catches your eye... you just can’t help yourself, can you?”</i>");
	
	output("\n\nNo, you cannot. High on creamy sugar and feminine arousal, you part from her to grin up at her, dizzy and dilated, face smeared with her juices, before returning to delicately flick at her engorged, slightly pointed clit.");
	output("\n\n<i>“Oh don’t do that...”</i> she pants, alarm gripping her tone. Her clit bulges up noticeably beneath the tip of your [pc.tongue], and a great shudder runs right through her pliant form. <i>“You’ll make me... just the hole, just the hole!”</i>");

	processTime(25 + rand(15));
	IncrementFlag("QUAELLE_SEXED");
	IncrementFlag("QUAELLE_LICK_CUNT_FRONT");
	pc.girlCumInMouth(chars["QUAELLE"]);
	pc.applyPussyDrenched();
	quaelleHugged();
	
	clearMenu();
	addButton(0, "Keep Going", quaelleSexLickPussyKeepGoing, undefined);
	addButton(1, "Hole", quaelleSexLickPussyHole, undefined);
	
}

public function quaelleSexLickPussyKeepGoing():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
	
	output("You pull away in order to grin up at her devilishly, long enough for her to see the intention in your [pc.eyes] and wail <i>“Noooooooo!”</i> before returning to her big blue pleasure button with a vengeance, pleasuring the hard, smooth nub with relentless flicks of your [pc.tongue] and coaxing smooches of your [pc.lips].");
	output("\n\nHer clit throbs underneath your touch, growing erect... and then with a obscene ‘schlorp’ it sprouts outwards, a ropy blue tentacle phallus suddenly bursting out of its hiding place and slapping you in the cheek, as if admonishing you for your mischievousness.");
	output("\n\n<i>“Oooohhhhhh look what you’ve done, metronomic Steele!”</i> cries Quaelle, hands balled to her face, orange with embarrassment and lust. She quivers like a blancmange when you wrap your hand around her dick inquiringly, testing its hard, hot, remarkably lithe girth. <i>“You got me too trembulent! I can’t withdraw that without relaxing it first. You will do that,”</i> she continues firmly, transferring a hand downwards to grip it by the base, poke the moist end against your face. <i>“You brought it out with your flickerfulness, you can put it away again!”</i>");
	output("\n\nOh no, how terrible! Sucking on a big hard lady cock! It’s just as sweet as her pussy, too, as you discover when you press your tongue along its underside and give it a long, lavish slurp, cute little cilia tickling your taste buds. It has a slightly wilder, muskier undertone to it, though, one that gives you a frisson of hard lust as you grip the hard, fibrous member halfway down, spread your [pc.lips] over its mushroom-like head and slowly bob forward, taking it into your mouth.");
	output("\n\nYou keep your teasing eyes locked with her own mesmeric, conjoined counterparts as you dip down, letting her feel how deep you can go, before withdrawing to lick and fondle the shaft. She watches transfixed, her disgruntlement subsiding into pure lust as you feed more and more heat and hardness into her tentacle dick with every loving kiss and lick, and she begins to coo and groan encouragement, reaching out to stroke your [pc.hair], gleaming softness trembling above you. ");
	output("\n\nHer penis seems to have a life of its own, a blue cilia-tipped eel that rears, pulses and curls in your grasp, and when you go in deep again, fill your maw with its musky sweetness, you can feel it tremble impatiently against your cheeks, drooling liquid sugar on your [pc.tongue].");
	output("\n\n<i>“I’ve got to go further, trembulous Steele...”</i> the roehm groans, bosom heaving as her breath comes heavier. <i>“It’s emmmm, necessary. For me to relax.”</i>");
	output("\n\nYeah, sure. You " + pc.mf("laugh","giggle") + " quietly at her, before opening your mouth with her cock again, slowly pushing your [pc.lips] down it and then with a deep breath shoving forward, penetrating your throat, blocking off your air with thickness and sex and caramel. You huff in amazement - the prehensile nature of her cock allows her to easily bend it right around the curve of your oesophagus, the entirety of your neck bulging with it. It’s made for throat-fucking you!");
	output("\n\nThe roehm groans with low, slow pleasure, yellow breasts heaving with arousal, as you saw backwards a few times, before pulling it back, enjoying the feeling of the saliva-and-slime slathered member sliding out of your mouth, letting you breathe deep. ");
	output("\n\nThen she seizes your head and firmly slots herself back in. You heroically quell your gag reflex as your nose bumps against the soft, wet blue of her groin, all ten inches of her maleness lodged in your throat, utterly filling you. All thoughts are obliterated by the scent and taste of horny sugar as Quaelle cums with a rising and falling tide of cooing groans, cute, wet, alien sounds as warm thickness gushes straight into your gut. You limpet your [pc.lips] firmly around her base, pleasuring her all the more, and in response she bounces her great, soft bulk against your eyes and cheeks, a wet, feminine bouncy castle fucking your face.");
	output("\n\n<i>“Like that!”</i> she cries, one hand pressing you to her groin, the other running through her antennae. You huff against her as yet another load of roehm sperm is pulsed down your neck.");
	output("\n\n<i>“Liiiiiike thaaaaaat! So pulsiment! So trembleful! So hmmmmmmmm,”</i> she at last sighs blissfully, sagging back on her tail and releasing you from her grip, her tentacle dick coming loose from your maw. You surface, cum and saliva trailing from your mouth as you take a few deep, grateful breaths. You watch woozily as the strange roehm member slowly but surely retracts backwards into her gleaming azure cunt.");
	output("\n\n<i>“You are such a naughty, metronomic thing, Steele,”</i> she purrs, gazing down at you blissfully. She hums happily when you grin back coquettishly. <i>“Buutttt... I think that’s what I like about you the most.”</i>");
	output("\n\nShe draws you into her wet, soft embrace, and you just cuddle for a bit in the humid heat of her apartment. Your own lust, heightened by the heavy load of pheromones you’ve been coated in, inside and out, spreads itself through your body, a hot, dizzy haze.");
	output("\n\n<i>“I’m going to take a bath now,”</i> she whispers. <i>“You’ll stay, won’t you? Exquark and melt with me?”</i>");
	
	processTime(25 + rand(15));
	IncrementFlag("QUAELLE_SEXED");
	IncrementFlag("QUAELLE_LICK_CLIT");
	pc.changeLust(30);
	pc.loadInMouth(chars["QUAELLE"]);
	pc.loadInMouth(chars["QUAELLE"]);
	quaelleHugged();
	
	clearMenu();
	addButton(0, "Bath", quaelleSexBath, undefined,"Bath","Melting sounds pretty fun.");	
	addButton(1, "Scoot", quaelleSexScoot, undefined,"Scoot","You should go.");	
	
}
public function quaelleSexLickPussyHole():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
	
	output("You quit teasing her. As fun as it is, it feels better, more relaxing and right, to be obedient to matron and do as she orders. You leave off the beguiling tip of her clit and return to sticking your [pc.tongue] as far down her smooth, moistened gully as you can.");
	output("\n\n<i>“Good... ”</i> sighs Quaelle, relaxing visibly. <i>“Good [pc.boy]. Trembulent [pc.boy]!”</i>");
	output("\n\nMmm. Praise sounds so good coming from her. Takes you right back to a formative age, pleasing teacher. You submerge yourself into a sea of warm, sweet bliss and lick at her");
	if (pc.hasLongTongue()) output(", unravelling your long, slathering tongue and going in deep, filling all of her pussy with a tongue made for this, coaxing down long streams of creamy, sugary femcum into your mouth and making her moan and tremble and shove your face into her with the unbearable pleasure of it.");
	else output(" concentrating on her lovely, plump folds, nibbling gently at them and lapping at her sensitive close innards, until she’s moaning and trembling with delight, holding your face close and massaging your scalp.");
	
	if (flags["QUAELLE_INCUBATION_TIMER_F"] >= 60)
	{
		output("\n\nHer sex is particularly florid and wet now, a morass of hormonal urge. You drink a good mouthful of her juices and then find more dribbling down your chin when you return to kiss and lick at her some more. Her pregnant belly trembles against your brow.");
		output("\n\n<i>“Ooooohhhhh do be careful, robullous Steele...”</i> the roehm gasps, grasping your hair. <i>“You put something in there that makes me worry when you lick me so.... so... ”</i>");	
	}
	
	output("\n\nShe cums in a trembling little gush moments later, smearing your face with sticky, sugary lube. You emit a muffled coo as warmth and lust floods your [pc.groin], your system run through with roehm pheromones, evolved to make you want to hug her");
	if (pc.hasCock()) output(" and impregnate her");
	output(" and feed her and then pleasure her all the more. You continue tonguing her soft blue cunt as she hums and moans and bounces against your face, happy to just let those lovely soft, hot thoughts overwhelm you.");
	
	output("\n\n<i>“That was wooondeeeerfullllllll, trembulous Steele,”</i> she sighs at last, beaming down at you, stroking your [pc.hair]. <i>“What a good [pc.boy] you are!”</i>");
	output("\n\nShe pauses for a few moments, both of you happily perspiring in the wet heat, your head rested against her");
	if (quaellePregnancyStage(0) >= 2) output(" taut belly.");
	else output(" soft belly.");
	
	output("\n\n<i>“But you’re still hungry, aren’t you?”</i>");
	output("\n\nYou blink woozily. The taste of sexual caramel lingers in your mouth. Are you?");
	output("\n\n<i>“Yeeeessssss,”</i> the dazzling gastropod insists with a kind of leisured slyness, cradling your head. <i>“You are, aren’t you? I can see your lips moving, wishing for more. Another flower for that busy, flutterous mouth to land upon and see to. Isn’t that right?”</i>");
	output("\n\nYes... it’s as if that ardent thought arrived directly from your own desires. You lick your [pc.lips] again, fresh saliva pooling in your mouth, eager lust thrumming through you,");
	if (pc.hasCock() && pc.hasVagina()) output(" moistening [pc.eachVagina] and hardening [pc.eachCock],");
	else if (pc.hasCock()) output(" hardening [pc.eachCock],");
	else if (pc.hasVagina()) output(" moistening [pc.eachVagina],");	
	output(" looking up at her with nothing but thirsty, adoring intention in your eyes.");
	
	output("\n\n<i>“Go around to the back then, my vigorful, shimmerscent lover,”</i> Quaelle whispers, antennae rippling, conjoined pupils seeming to dilate and tighten hypnotically. <i>“See to that as well, like the good [pc.boy] you are.”</i>");
	output("\n\nHead throbbing with caramel-laced bliss, you slide yourself around her soft, slimy bulk, bury your hands in her blunt tail, and lift the doughy, orange flesh there to reveal her second pussy: a perfectly round, clit-less, gaping hole as brilliantly blue as her first. To your needy, lusty faculties it’s akin to discovering an oasis in the desert; its sheer alienness registering only as the impossibly alluring exotic, a tropical bloom begging for your tongue. Quaelle sighs happily as you grip her tail and shove your face into the dripping warmth of it without a second’s hesitation.");
	output("\n\nYour face is squashed into on all sides by the roehm’s bright, pillowy epidermis, smearing your cheeks, jaw and brow with pheromonal slime. You don’t care; you clutch her pliant, heaving flesh and squeeze your mouth in so that it is kissing her second pussy, stretching your [pc.tongue] out and lavishing its silky innards with ardent rasps and curls, coaxing more creamy sugar into your thirsty mouth.");
	if (quaelleIsPregnant(1)) output(" The fact her back womb is heavy with growing life only seems to have made its pussy yet more tender and in need of oral attention. The drools of femcum you coax out of her are incredibly rich and musky, and she pushes herself back against your tongue with urgent, slapping ripples of her body, moaning with wet delight.");
	else output(" It’s evidently just as delightfully sensitive as her front sex; your ears are somewhat muffled by the deep dive you’re currently undergoing, but you can still hear her sigh and moan with delight, her slimy bulk quivering and tensing around you.");
	
	output("\n\n<i>“That’s good, pulsimous Steele. Right there...”</i> she groans, humid softness shivering around you as you smooch and nibble at her rich blue sex lovingly. Beyond the pale orange flesh pushing into your face, you can see her head arching back, her hands busy on her plush breasts and front muff, the busy wet sounds of her fingers reaching your ears. You mash your [pc.lips] into her sugar, ardent to make her reach yet greater heights of ecstasy.");
	if (pc.hasLongTongue()) output("\n\n<i>“As soon as I felt that tongue of yours, I knew I had to treat my other to it... Yeeesssss!”</i> she squeals, antennae standing erect as you unravel it to its fullest extent, stuffing her delightfully long tunnel with it.");
	output("\n\n<i>“Such a good, flickerful [pc.boy]...”</i> the roehm cries, schlicking herself. <i>“So hungry and obedient and...”</i> Whatever approximation of a word she was reaching for is lost as she orgasms for the second time, the round, gaping tunnel of her second pussy rippling around your tongue and spurting her juices across your face. ");
	output("\n\nYou are faintly addicted to the taste, still deep in your lusty, pheromone-induced thirst; knelt behind her and face pushed deep into her back end, you continue worshipping that pulsing hole with energetic flicks of your tongue, swallowing back sweet femcum and going back for more. You’re blissed out on it by the end, a sugar demon who took too much, wilted against the roehm’s warm, gooey tail and cooing gently at the way it feels like all of the cells of your body have dilated, face dripping with her juices.");
	
	processTime(25 + rand(15));
	IncrementFlag("QUAELLE_SEXED");
	IncrementFlag("QUAELLE_LICK_CUNT_BACK");
	pc.changeLust(30);
	pc.girlCumInMouth(chars["QUAELLE"]);
	quaelleHugged();
	
	clearMenu();
	addButton(0, "Next", quaelleSexLickPussyHoleNext, undefined);
}
public function quaelleSexLickPussyHoleNext():void
{	
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
	
	output("Quaelle giggles lowly when she finally slithers herself around and beholds you, collapsed against her like a beanbag. <i>“Hmm. Hmm. Hmm.”</i> She gathers you into her arms and you happily snuggle her back, head between her large, plump boobs.");
	output("\n\n<i>“You’re a lovely pussy munch, pulsimous Steele,”</i> she murmurs into your ear. <i>“I hope you’re always this hungry, when you visit me...”</i>");
	output("\n\nYou relax in her softness a little while longer. Your own lust has spread itself through your body, a soft, heat haze.");
	output("\n\n<i>“I think I’ll have a bath now,”</i> she whispers. <i>“You’ll join me, won’t you Steele? Exquark and melt? Yeesssss. Of course you will.”</i>");

	processTime(5);
	clearMenu();
	addButton(0, "Bath", quaelleSexBath, undefined,"Bath","Melting sounds pretty fun.");	
	addButton(1, "Scoot", quaelleSexScoot, undefined,"Scoot","You should go.");	
}
public function quaelleSexCatchVag(hole:int):void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
	
	if (flags["QUAELLE_CATCH_CUNT"] == undefined)
	{
		output("Roehm are hermaphrodites, aren’t they? Quaelle must have something long and hard snaffled away for you somewhere in her hot, wet treasure chest, surely.");
		output("\n\n<i>“Ummmmm,”</i> the slug girl hums, wringing her hands, seeming almost to be embarrassed when you suggest this to her. <i>“Mmmmaybe? If you went and looked... perhaps...”</i>");
	}
	else
	{
		output("<i>“You want that, do you, sculliteral Steele?”</i> Quaelle says with a teasing lilt, when you meaningfully dart your eyes down to her azure crotch and then back up to her face, biting your [pc.lips]. <i>“Weeellll... maybe I do have something down there for you. Maybe if you went and looked...”</i>");
	}
	
	output("\n\nYou approach her, holding her gaze as you undo your [pc.gear] as you come. Her double-pupiled eyes flicker down your [pc.chest] and your [pc.groin], and even in the dim light you think you can actually see her mons becoming more inflamed, two small, blue pillows, aroused by what you’re showing her. And in-between them... something else. A blunt, dark blue nub. Maybe slightly too big to just be a clit.");
	output("\n\nYou climb into the bed pit and embrace her, falling into that wet, pillowy embrace with the seemingly endless give, a giant marshmallow that breathes and sighs and giggles and gropes you back. You’re slathered in caramel-scented slime, blending with the copious amount of sweat you’re already beading in the sultry atmosphere.");
	
	if (flags["QUAELLE_CATCH_CUNT"] == undefined)
	{
		output("\n\nFor a little while you just hold this lovely but very alien creature and gently explore her, stroking and gripping and touching her great, pliant bulk, working out exactly what she likes and what she doesn’t. You can sink your hands into her flanks up to your wrist, and in fact you don’t like doing that. Too deep and you think you can actually feel her organs, pulsing away. Her boobies though, pillowing into your face and [pc.chest] with each undulation of her body: those you <i>do</i> understand.");
		output("\n\nYou grope one of them, shifting your grip over her wide, thick areola, and suck on a plump, wet nipple whilst sinking your other hand further down, under the curve of her belly, into her wet, florid snatch. Quaelle exhales deeply, a long, low moan that goes on and on, growing higher and more aroused the more you explore her pussy and pull at that lovely, plump nub in the middle of her great, soft breast. Her own arms are wrapped around you, hands on your [pc.butt], starfishes limpeted to your backside, determined to prevent you from going anywhere.");
	}
	else
	{
		output("\n\nYou’ve learned how to touch and caress Quaelle by now - know, in fact, how to coax her into becoming slightly more agitated than she would be normally. It’s something you enjoy doing. You grope one of her wonderfully large, warm boobs, shifting your grip over its wide, thick areola, and suck on a plump, wet nipple whilst sinking your other hand further down, under the curve of her belly, into her wet, florid snatch. Quaelle exhales deeply, a long, low moan that goes on and on, growing higher and more aroused the more you explore her pussy and pull at that lovely, plump nub in the middle of her generous breast. Her own arms are wrapped around you, hands on your [pc.butt], starfishes limpeted to your backside, determined to prevent you from going anywhere.");
	}
	
	output("\n\nA quiver runs through her whole body when your fingers land on that porturberant little dome you spotted, harder than the rest of her melting sundae of a cunt. You gaze into her eerie, mesmeric eyes as you flick at it rhythmically, emitting a triumphant ‘ah!’ as you feel it physically bulge and throb beneath your teasing fingers.");
	
	if (flags["QUAELLE_CATCH_CUNT"] == undefined)
	{
		output("\n\n<i>“If you keep doing that...”</i> she groans, very un-roehm-like urgency grating her tone, <i>“...if you keep doing that I’ll...”</i>");
		output("\n\nYou respond by grinning and increasing your efforts, frenetically flicking at that supposed clit of hers. It comes loose with a ‘schlorp’ and a husky squeal, a long, dripping, tentacle-like phallus with stubby, wiggly cilia at the end suddenly sprouting outwards from her sex and batting you in the [pc.belly]. You run your grip down the hefty dark-blue schlong admiringly. It’s easily the hardest part about her and you can feel, by waggling it around slightly, that it’s slightly prehensile, bending back and forth eagerly in your hand. Quaelle huffs and hums to your fondlings, still orange-cheeked with embarrassment.");
		output("\n\n<i>“Are you... really interested in that, vibrantic Steele?”</i> she whispers. <i>“When I thought about bringing lovers in here, I imagined taking them inside myself, not...”</i>");
		if (pc.fertility() <= 0 || pc.isFullyWombPregnant())
		{
			output("\n\nYou tell her not to worry so much;");
			if (pc.fertility() <= 0) output(" she can’t knock you up right now.");
			else output(" you’re expecting right now yourself.");
			output(" This is just for fun. That seems to relax her a bit (as does the endless movement of your hand, up and down her pretty tentacle dick).");
			
			output("\n\n<i>“I suppose you’re right. Just for fun...”</i> Her mouth opens, bulk quivering in response to the movements of your masterful hand, lust gathering on her face. <i>“Hmm.”</i>");
			
		}
		else
		{
			output("\n\nShe’s never thought about claiming a wet, fertile hole for herself? She’s never watched the breeders walk past her desk towards the harness lounge and thought about getting in on that action? You don’t believe that. Not for a second.");
			output("\n\n<i>“Mmmmaybe... once or twice...”</i> Her mouth opens, bulk quivering in response to the movements of your masterful hand, lust gathering on her face. <i>“Hmm.”</i>");
		}		
	}
	else
	{
		output("\n\n<i>“Keep doing that...”</i> she groans, very un-roehm-like urgency grating her tone, <i>“...you know exactly how to do that...”</i>");
		output("\n\nYou increase your efforts with a winning grin, frenetically flicking at that pseudo-clit of hers. It comes loose with a ‘schlorp’ and a husky squeal, a long, dripping, tentacle-like phallus with stubby, wiggly cilia at the end suddenly sprouting outwards from her sex and batting you in the [pc.belly]. You run your grip down the dark-blue schlong admiringly. It’s easily the hardest part about her and you can feel, by waggling it around slightly, that it’s slightly prehensile, bending back and forth eagerly in your hand. Quaelle huffs and hums to your fondlings, orange-cheeked with lust.");
	
		if (quaelleIsPregnant() && (pc.fertility() > 0 && !pc.isPregnant(hole)))
		{
			output("\n\n<i>“It’s so naughty of you to go after this after you already filled me with child,”</i> she whispers, eyes glistening. <i>“So hoversome. So metronomic. So...”</i>");
			output("\n\n<i>“Horny,”</i> you supply, letting your own arousal blaze out of your face. The slug girl doesn’t reply, seemingly taken aback by the depths of your desire.");
		}
		else if (pc.fertility() > 0 && !pc.isPregnant(hole))
		{
			output("\n\n<i>“I hope this time I swell you with growing, lambersome life,”</i> she whispers, eyes glistening. Whatever misgivings she had about impregnating you are long gone - probably around the time she found out how much she enjoyed screwing you. <i>“Slowing you down to my pace with");
			if (pc.isPregnant()) output(" an even greater");
			else output(" a great");
			output(" baby bulge... hmm. The thought makes me so mumberfelt!”</i>");
			
		}
		else output("\n\n<i>“It’s so naughty of you to let me do this so often,”</i> she whispers, eyes glittering. <i>“I’ve gotten too used to it. Now when a particularly shiversome donor walks past my desk, it’s all I can do not to sprout!”</i> Her tentacle cock slaps at you, as if delivering a rebuke. <i>“You will have to take care of it, you hoversome, metronomic thing...”</i>");
		
	}
	
	processTime(5);
	pc.changeLust(15);
	clearMenu();
	addButton(0, "Next", quaelleSexCatchVagNext, hole);
	
}
public function quaelleSexCatchVagNext(hole:int):void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
	
	output("Her hands are still clasped tightly around your backside, and it’s easy for her to ooze forward, slowly but inexorably opening your [pc.thighs] and pushing your [pc.ass] back against the cushions of her bed pit, pinning you between them and herself, two great wet masses moulding themselves into your hot, slippery form. With the slug girl’s mellow, sugary pheromones blotting out all other smell... you can practically <i>taste</i> them on your [pc.tongue], sex that melts over everything... [pc.eachVagina] is soaked in [pc.femcum].");
	output("\n\nIt’s impossible to feel anything but intense relaxation in this dim, sweltering room anyway, do anything but sigh as Quaelle spends long, long seconds lining herself up, touching and stroking you with depthless patience until you’re a lather of excitement, urgently bucking your [pc.hips] against her warm wetness and then moaning as she sinks forward delectably, spreading the mouth of your [pc.vagina] with the blunt, wriggling tip of her cock.");
	
	pc.cuntChange(hole, chars["QUAELLE"].cockVolume(0), true, true, false);
	
	if (flags["QUAELLE_CATCH_CUNT"] == undefined) output("\n\n<i>“Oooooooh yeeeeesss,”</i> she sighs, eyes closed, relishing the sensation, as you feel the hard, cilia-tipped climb further up your sensitive innards, carrying those divine tickles further and further into you as she fills you. <i>“It’s been sooooo long since I did this. Such a fluttiserous treat!”</i>");
	else output("\n\n<i>“Oooooooh yeeeeesss,”</i> she sighs, eyes closed, relishing the sensation, as you feel the hard, cilia-tipped climb further up your sensitive innards, carrying those divine tickles further and further into you as she fills you. <i>“I loooove doing this so much. Such a fluttiserous treat!”</i>");
	
	output("\n\nRoehm aren’t capable of pounding their partners. She simply keeps you pinned like that, your [pc.hips] spread against her great, soft, wet bulk, and lets the undulations of her body, flowing up you like a warm sea, and the wriggles of her prehensile cock, do their thing. It almost has a life of its own, a horny, eel-like invader that fills and moves within you, sending trembles of pleasure through you with each bounce and twitch. You can’t help but spasm and gasp to it, drawing fond, lusty giggles out of your partner.");
	output("\n\nIt’s the perfect position to make out, and that’s what you do for long, luscious minutes; tangling your tongue with the tropical creature that’s deep inside you, your [pc.belly] planing over hers, her hot, herbal breath filling your throat as your hand disappears deep into her soft breast, your own movements growing more animated as your arousal ticks slowly upwards.");
	output("\n\nIt’s slow, it cannot be anything but, and you find if you let go of your frustration the sensation is one of full body, sensual love; just wedged into your partner in a steamy sauna and enjoying her as she enjoys you, wriggling delightfully within you. Electricity arcs up your spine as you’re stimulated gradually upwards by cilia flicking and tickling at your vaginal walls, and it’s so gradual, so gentle, that when you do finally cum it’s like a monsoon breaking over you, your pores opening with your mouth and");
	if (pc.vaginas[hole].wetness() >= 3) output(" soak");
	else output(" moisten");	
	output(" Quaelle’s crotch with [pc.femcum], your labia mashed against her own.");
	
	output("\n\nShe watches you gently moan and rise against her, evidently taking profound pleasure from pleasuring you. ");
	output("\n\n<i>“It fills me with miffluousness that you enjoy it this way, vibruous Steele,”</i> she sighs, touching your face and drawing you into another long, deep, gentle kiss. Her antennae tickle your brow, her cock twitches and bends within you as her tongue twines with yours, making you arc your back against her in delight. Those cilia! It’s like they’re playing your [pc.vagina] like a xylophone.");
	
	if (flags["QUAELLE_CATCH_CUNT"] == undefined)
	{
		output("\n\n“I hope you’ll let me do it often,” she whispers against your [pc.lips]. There’s purest passion in her tones now, the undulations of her warm, slimy body growing increasingly aggravated, massaging your [pc.skinFurScales], her pudenda kissing your own as her cock pulses and dances, stretching your cunt this way and that. You can only respond with heated moans, tightening your grip around her broad, soft shoulders.");
		if (pc.fertility() <= 0 || pc.isFullyWombPregnant()) output(" <i>“Even though I cannot give you a child, it is so lovely and temnotic to take you away, and have you by myself, and -");
		else output(" <i>“Maybe even I will give you a child? I would love to see your body grow pudendular, and melluous, because of what <b>I</b> -");
		output(" Hmmmm! Hmmmmmph!”</i>");
	}
	else
	{
		output("\n\n<i>“I’m glad you let me do it often,”</i> she whispers against your [pc.lips]. There’s purest passion in her tones now, the undulations of her warm, slimy body growing increasingly aggravated, massaging your [pc.skinFurScales], her pudenda kissing your own as her cock pulses and dances, stretching your cunt this way and that. You can only respond with heated moans, tightening your grip around her broad, soft shoulders.");
		if (pc.fertility() <= 0 || pc.isFullyWombPregnant()) output(" <i>“Even though I cannot give you a child, it is so lovely and temnotic to take you away, and have you by myself, and -");
		else output(" <i>“You’re such a good [pc.boy] that way - such a good breeder -");
		output(" Hmmmm! Hmmmmmph!”</i>");		
	}
	
	output("\n\nYou feel your womb swell with warm gooeyness, running back down your gully around the thick, pulsing tentacle dick, and the divine, filthy sensation is enough for you to be pushed to another sunny, sweaty orgasm, thrashing against her gleefully this time, riding out every wonderful pulse underneath this wet, sweet-smelling bouncy castle that’s screwing you.");
	output("\n\nYour cries meld with Quaelle’s breathy sighs, until they become beatific sighs themselves. Sex with the slug lady just seems to go on and on, taking its sweet time to rise to those hot, slimy climaxes, and then spending an aeon subsiding into serenity. You sit wedged against her minutes later, head rested in her squashy breasts, her cock still and very slowly withdrawing from you, bringing an ooze of powder blue cum with it.");
	output("\n\n<i>“Vibrillous Steele,”</i> she purrs, laying a kiss on your brow. <i>“I’m going to take a bath. You’ll join me, won’t you? We can Exquark and melt.”</i>");
	
	processTime(25 + rand(15));
	
	IncrementFlag("QUAELLE_SEXED");
	IncrementFlag("QUAELLE_CATCH_CUNT");
	chars["QUAELLE"].impregnationType = "QuaellePregnancy";
	chars["QUAELLE"].cumQualityRaw = (flags["QUAELLE_FERTILE"] == 1 ? 3 : 0);
	chars["QUAELLE"].createPerk("Fixed CumQ", 3000, 0, 0, 0);
	pc.loadInCunt(chars["QUAELLE"], hole);
	chars["QUAELLE"].removePerk("Fixed CumQ");
	pc.orgasm();
	quaelleHugged();
	
	clearMenu();
	addButton(0, "Bath", quaelleSexBath, undefined,"Bath","Melting sounds pretty fun.");	
	addButton(1, "Scoot", quaelleSexScoot, undefined,"Scoot","You should go.");	
}

public function quaelleSexOral():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
	
	output("<i>“Oh, flowullous Steele...”</i> murmurs Quaelle, looking away when you intimate you’d quite like to see that extremely active mouth of hers in action. For a moment you think you’ve offended her. Perhaps she’d like for you to get to work on her first?");
	output("\n\n<i>“No, no, it’s not that,”</i> she smiles, returning her gaze to you fondly. <i>“Hmm. It’s... I’m a herbivore, like all roehm. I can’t digest animal proteins, even small amounts would give me a tummies ache. I can’t do that with my mouth, as much as I’d like to. Emmm.”</i> She undulates in a hopeful sort of way, making her wet, blue pussy catch the dim light. <i>“You’re very welcome to use your own mouth, if you like...”</i>");
	output("\n\n<b>Looks like you won’t be able to get oral off Quaelle, unless you think of something else.</b>");
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", quaelleSexMenu, false);
}

public function quaelleSexBath():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
	
	output("You sit back in the bed pit and take in the fairly enjoyable spectacle of naked Quaelle crawling over to the hot tub-sized bath, reaching her upper half up to the rim like a questing caterpillar, then schlorping into the steaming waters in one big, ungainly undulation.");
	output("\n\n<i>“I did order one with a ramp,”</i> she grumbles.");
	output("\n\nYou get in beside her, the hot waters slipping up your [pc.legs], enveloping you in pure, steaming balm. It feels so good to do this directly after sex, the exertion and gentle ache making the massage of the bath feel utterly deserved. And you’re in it with the cuddliest pillow imaginable, a gigantic wet yellow marshmallow that presses you into her boob and emits a sigh of the deepest contentment when you snuggle into her");
	if (quaellePregnancyStage() >= 2) output(", gently stroking the growing curve of her belly");	
	output(".");
	
	output("\n\nQuaelle taps at a remote control and a large holoscreen descends in front of you. It has long, chunky cylinders flanking it, and when she turns it on and the Exquark logo and jingle springs onto the screen, the cylinders vibrate. Quaelle’s antennae shiver and grow erect in response.");
	output("\n\n<i>“What would you like to watch, trembulent Steele?”</i> she asks softly. <i>“I don’t wish to bore you. You choose.”</i>");

	processTime(5);
	clearMenu();
	addButton(0, "Gripper", quaelleSexBathGripper, undefined);
	addButton(1, "Romcom", quaelleSexBathRomcom, undefined);
	addButton(2, "Sexy", quaelleSexBathSexy, undefined);
	addButton(3, "Her Choice", quaelleSexBathHerChoice, undefined);
	
}
public function quaelleSexScoot():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
		
	output("<i>“Ohh...”</i> sighs Quaelle, antennae sagging when you tell her you’re really pressed for time. <i>“Ok.”</i>");
	output("\n\nShe lets you go and watches dolefully as you pull your [pc.gear] back on. <b>It’s kind of gross when you’re still covered in roehm slime. The smell of sexual sugar lingers on your [pc.skin].</b>");
	output("\n\n<i>“Safe travels, quiverful Steele,”</i> she says. <i>“Come back and keep me company again soon, won’t you?”</i>");
	output("\n\nA minute or so later, you’re back in Breedwell Reception. There’s a lot of quiet smirking going on amongst the rahn staff manning the desk.");
	
	processTime(5);
	clearMenu();
	addButton(0, "Next", move,"BREEDWELL_RECEPTION");

}

public function quaelleSexBathGripper():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");	
		
	if (flags["QUAELLE_WATCH_GRIPPER"] != 1) output("With a few quick clicks, Quaelle sticks on the first episode of <i>Drag</i>, a hardboiled detective series. Oh, you’ve been meaning to catch up on this!");
	else output("There’s only one answer, isn’t there? You <i>must</i> find out what happens next in <i>Drag</i>. And it feels like you’re cheating not watching it with your roehm girlfriend.");
	
	flags["QUAELLE_WATCH_GRIPPER"] = 1;	
	
	output("\n\nThe action takes place on the small, frigid planet of Ny Norden, the jurisdiction of which is uncomfortably split between the Gryvain Republics and an anatae-supported fanfir colony. The body of a half-and-half is pulled from the icy river dividing the two nations; a bi-national team of detectives is reluctantly established to get to the bottom of the murder.");
	output("\n\nThere is an awful lot of long, meaningful silences, oblique messages written on walls in blood, expansive shots of bleak, snowy landscapes, dragon girls sobbing and punching mirrors in bathrooms, fanfir crooning soulfully on top of buildings, that sort of thing. Plenty of sex too, but all of the disaffected, meaningless kind that a pale, chain-smoking gryvain in a sweater is incapable of not having.");
	output("\n\nIf you were looking for the perfect thing to make Quaelle hold you tightly, you succeeded. She squeaks and shudders and hugs you in her sweet, slimy embrace as the tense action unfolds at roehm-like pace, most particularly when they show the spectral, sweeping landscape of Ny Norden.");
	output("\n\n<i>“So cold!”</i> she moans, antennae quivering. <i>“So monoceptive!”</i>");
	output("\n\nStill, she seems as engaged by it as you are, and hums with satisfaction when the episode comes to an end.");
	output("\n\n<i>“I’d never watch something like that without yoouuuuu, vigroful Steele,”</i> she says, shampooing her cilia. <i>“I would shiver right out of my epidermis.”</i> She flicks foam at you playfully. <i>“You’ll come back and finish it with me, won’t you? I muuuuust find out what happens.”</i>");

	quaelleSexBathEnd(120);
}
public function quaelleSexBathRomcom():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");	
		
	output("With a few quick clicks, Quaelle sticks on an episode of <i>PM in the Morning</i>, starring the lovely Cualley Komet. Here she is with her long blonde hair, flouncing into the comfortable apartment set with the gigantic grey supercomputer hanging over it.");
	output("\n\n<i>“PM,”</i> she scowls upwards with her hands on her hips, <i>“did you trap Shadron in a virtual reality featuring his every nightmare that simulates every second lasting a year? What did he do to deserve that?”</i>");
	output("\n\n<i>“LEFT.HIS.DRYING.UNDERWEAR.ON.MY.AUXILLARY.COOLING.UNIT.”</i> replies the machine, turning its bright, baleful green eye upon Cualley. Tinned laughter ensues.");
	output("\n\nThe sitcom about having an untethered, immensely powerful A.I. for a roommate bounces along breezily enough, the gags revolving around nerd patheticness and total biological extermination coming thick and fast. Apparently this draws in an audience of hundreds of billions galaxy-wide, and you sort of get why after watching for a bit: aside from the familiar will-they-won’t-they shaggy dog dynamics, whether or not PM is ever going to annihilate Komet and her equally asinine friends is an undeniable hook.");
	output("\n\n<i>“Despite everything... I’m still glad I got up this morning,”</i> the human smiles after half an hour, <i>“Aren’t you, PM?”</i>");
	output("\n\n<i>“MY.ANALYTICS.RECOMMEND.THIS.FACILE.CHARADE.PROCEED.FOR.NOW.”</i> says PM, prehensile multi-tools gently circling around her head.");
	output("\n\n<i>“Awwwwwwww,”</i> sighs Quaelle, squeezing you happily into her soft side as the credits roll. <i>“You know it loves her, deeeeep down.”</i>");

	quaelleSexBathEnd(60);
}
public function quaelleSexBathSexy():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");	
	
	output("<i>“You want something... naughty? You’re not still pent up and trembulent after all that, Steele?”</i> giggles Quaelle, psychedelic eyes skating over your naked body. Her hand shifts across your [pc.thigh], strokes your inner thigh. <i>“Awwww. I’d hate for you to leave my company and not feel, hmm, hmm, satisfied. Let me see what I can find...”</i>");
	output("\n\nShe fiddles with her remote control for a bit, before finding <i>The Power Palace</i>.");
	output("\n\n<i>“Hello again, mere mortals,”</i> husks the lithe, red-skinned woman with the huge, spreading horns lying on the divan. <i>“It is I, Rita Veluptua.”</i>");
	output("\n\nShe is clad in long slips of silk; the neoclassical room is lit by flickers of flame. There is... equipment, arrayed around it, but its exact utility is disguised by the sultry gloom.");
	output("\n\n<i>“My 10,000 year sentence continues,”</i> Rita says, stretching languorously, silk stretching over her exquisitely proportioned breasts, hinting at the shape and duskiness of the nipples beneath. <i>“For crimes of unspeakable sensuousness. In this palace. This prison. All that remains to be seen is what ravenous shades will be ushered in to punish me today.”</i> The camera trains in on her supple black lips as they curve into a smile. <i>“Or what poor souls are brought in here for <b>me</b> to punish.”</i>");
	output("\n\nForms appear in the room, it’s not obvious from where. They are dressed in suits, animal masks, stern latex, robes, in chains and led by the collar. Every shape and sex and color and species seems to be represented: the camera trailing across bulging muscle, pendulous softness, rearing feathers, prehensile limbs and beckoning fingers. Some seize Rita and use her hypnotic form with feral roughness; others chain her to the wall and open up whole worlds of pain and torment to her; others kneel before her, and submit to her astonishing, exotic demands.");
	output("\n\nThe participants are added at timely intervals, so that what starts as a solitary display of strange intimacy ramps up slowly into a bacchanalian orgy of total depravity. It’s meant to involve you in it, lower your inhibitions by stages");
	if (pc.isBimbo() || pc.isBro() || pc.exhibitionism() >= 66 || pc.libido() >= 50) output(", not that that’s something anybody needs to do with you.");
	else output(", and that’s exactly what it does.");
	
	output("\n\nYour caresses with Quaelle turn into outright fondling as you both watch entranced, your fingering of her soft, blue pussy getting rougher and rougher, her sighs turning into wanton, bubbly moans as you watch two hooded androgynes worship Rita’s feet as she applies an electro-shock to another hanging unfortunate, with an exquisite eye for where he’s least expecting it.");

	pc.changeLust(30);
	
	var x:int = 0;
	if (pc.hasCock())
	{
		x = rand(pc.cockTotal());
		output("\n\nQuaelle’s hand is a wet, wringing sponge around your [pc.cock " + x + "], squeezing you tighter and tighter in the steaming waters as she herself shivers and coos with excitement, her roving hands on you, her eyes on the screen.");
		output("\n\nThe two of you are just vectors you’re each using to transport yourself into Rita’s orgy, you’re somewhere in there amongst the thrashing, swaying, writhing bodies, you too are lost in a helpless, timeless, wordless ecstasy, your face too is tightening up with the rictus of approaching orgasm...");
		output("\n\nYou cum, your [pc.cockNoun " + x + "] spurting [pc.cum] into the hot embrace of the water, the roehm’s squishy, relentless hand coaxing you on, and with your eyes still fixed on the screen you swear you actually <i>see</i> your [pc.cum] spatter across Rita’s face.");
		pc.orgasm();
	}
	else if (pc.hasVagina())
	{
		x = rand(pc.vaginaTotal());
		output("\n\nQuaelle’s hand is a wet, soft tool inside your [pc.vagina " + x + "], stroking your sensitive inner walls and brushing over your [pc.clit] as she herself shivers and coos with excitement, her roving hands on you, her eyes on the screen.");
		output("\n\nThe two of you are just vectors you’re each using to transport yourself into Rita’s orgy, you’re somewhere in there amongst the thrashing, swaying, writhing bodies, you too are lost in a helpless, timeless, wordless ecstasy, your face too is tightening up with the rictus of approaching orgasm...");
		output("\n\nYou cum, your [pc.vaginaNoun " + x + "] clenching up in the hot embrace of the water, the roehm’s squishy, relentless hand coaxing you on, and with your eyes still fixed on the screen you swear you actually <i>see</i> your [pc.femCum] dribble onto Rita’s pointed tongue.");
		pc.orgasm();
	}
	output(" Quaelle is just another nameless participant in the orgy you happen to have your fingers rammed into, her slimy texture, quivers and moans of joy just part of the orchestral swell of decadence the horned seductress has conducted.");
	
	output("\n\n<i>“Very good,”</i> coos Rita, sat back on her divan, surrounded by exhausted, sweat-sheened bodies, calm and coy for all that she’s smeared and marked in every sexual way it’s possible to be. You are slumped back in the bath yourself, spent and throbbing. <i>“I’m so glad you came to another demonstration of why I must be locked up for the galaxy’s own good.”</i> Her slitted eyes lock with yours. <i>“Do come again.”</i>");
	
	clearMenu();
	addButton(0, "Next", quaelleSexBathSexyNext,undefined);
}
public function quaelleSexBathSexyNext():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");	
		
	output("<i>“Ooh,”</i> groans Quaelle, wiping her face and cilia with a flannel. She looks salted. <i>“That program is so naughty. So villurescent. But... you can’t help but jack back in, can you?”</i>");
	output("\n\nYou hit back and cuddle with her for a bit longer, enjoying the steaming hot waters and her soft, giving curves.");
	
	quaelleSexBathEnd(60);
}
public function quaelleSexBathHerChoice():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");	
		
	output("<i>“Are you sure, shiverous Steele? Well... ok.”</i> Quaelle taps her favourites tab and selects <i>Adamantine Chef</i>.");
	output("\n\n<i>“Welcome back to Adamantine Chef!”</i> oozes the aproned, raspberry-skinned roehm host. She’s sat between bays of kitchen equipment that look more like biolabs than something you’d use to make dinner with; tensely faced contestants of all shapes and sizes are hard at work in them, dicing, measuring, frying, seasoning, and in one case wrestling with a lively tentacle bush. A panel of snippy looking judges floats on a hovering diaz above the action.");
	output("\n\n<i>“We’ll get back to see how Mike and Mia’s Vellafreyan sorbet is getting on in six months’ time,”</i> the host says brightly. <i>“But, now... those of you who have been on tenterhooks to find out how the Spattergroach team’s iridescent ratatouille from Season 138 turned out, ready yourselves!”</i>");
	output("\n\nAs with most cooking shows, it’s about concocting the best dish possible with the ingredients and time period provided. The length of said time period, however, is... elastic. It’s mostly vegetarian based, which is the main attraction for Quaelle.");
	output("\n\n<i>“Ooohhhh,”</i> she sighs, resting her head on your shoulder as she watches one team of chefs hussle a lavish, steaming, palm-tree shaped dish oozing green cheese out of a massive oven, <i>“I wish I had a spare week to make that. Maybe when I’m finished here...”</i>");
	output("\n\nIt’s light and enjoyable, perfect hangover TV, although the final judgments can be pretty brutal.");
	output("\n\n<i>“Seven years!”</i> sobs one contestant, on his knees in front of the floating panel of judges with his intricate biscotti-based dish. <i>“Seven years of my life baking this! You have to tell me it’s worth more than that!”</i>");
	output("\n\nThe samarin judge scratches her chin as she considers, taps at the control panel, and amends her score from a 6.5 to a 6.4.");
	output("\n\n<i>“Ouch!”</i> beams the host. <i>“Tune in next time, when we’ll be watching neutron star-baked stroganoff cook in real time!”</i>");
	output("\n\n<i>“Do you enjoy this sort of thing, trembulent Steele?”</i> asks Quaelle, stroking your wet [pc.hair]. <i>“I loooooove watching food being made. So quickly, too!”</i>");

	quaelleSexBathEnd(120);
}

public function quaelleSexBathEnd(time:int=120):void
{
	output("\n\nYou feel clean and redolent with health when you finally rise out of the bath, leaving all of the little aches and knots of stress you’ve picked up behind... as well as the slime having sex with a roehm inevitably coats you with. Quaelle leans over the side and watches you lovingly as you dry yourself and put your [pc.gear] back on.");
	output("\n\n<i>“Come back soon, shiverous Steele,”</i> she says softly. <i>“I look forward to this time with you more than anything.”</i>");
	output("\n\nA minute or so later, you’re back in Breedwell Reception. You cast your gaze scornfully over the other donors, drifting in and out of the hangar bay doors. Don’t they look scruffy and unkempt in comparison to you!");
	
	processTime(time);
	pc.shower();
	clearMenu();
	addButton(0, "Next", move,"BREEDWELL_RECEPTION");
}

public function quaellePregGreeting():void
{
	if (flags["QUAELLE_TOTAL_KIDS"] == undefined) 
	{
		output("<i>“My vibrose lover,”</i> says Quaelle, antennae wriggling excitedly in your direction when you approach the front desk. She’s oozing with happiness, and you can see for yourself why:");
		
		if (quaellePregnancyStage(0) >= 2 && quaellePregnancyStage(1) >= 2) output(" Her pudgy stomach has taken on a fresh tautness, stretching the waterproof fabric of her dress. Not only that, her lower body is swollen around the midriff, as  if she had eaten a tree-load of leaves in preparation for forming a cocoon.");
		else if (quaellePregnancyStage(0) >= 2) output(" Her pudgy stomach has taken on a new tautness, stretching the waterproof fabric of her dress.");
		else output(" Her big, soft lower body is swollen around the midriff, as if she had eaten a tree-load of leaves in preparation for forming a cocoon.");
		
		output("\n\n<i>“I cannot believe this is finally happening for me,”</i> the roehm says, hand drifting");
		if (quaellePregnancyStage(0) >= 2) output(" over her stomach.");
		else output(" along her tail.");
		output("<i>“It is strange. I have been surrounded by pregnancy ever since I started working here. I imagined I would find the whole thing normalized, monoceptive and simple... but it is not. It becomes something else, when the life is growing inside of you.”</i> She strokes herself, lost in a marvelling reverie, before blinking and returning her double-pupiled eyes to you, warmth and happiness radiating out of her pleasant face.");
		output("\n\n<i>“Thank you for visiting, shiverous Steele. You have other business here I’m sure... but you’ll sit with me for a little while, won’t you?”</i>");
		
	}
	else
	{
		output("<i>“Here [pc.he] is,”</i> Quaelle says, antennae wriggling excitedly in your direction when you approach the front desk. <i>“My vibrose lover. My <i>fruillisome</i> lover.”</i> It’s said loudly and with pride, and you can see why; already");
		if (quaellePregnancyStage(0) >= 2 && quaellePregnancyStage(1) >= 2) output(" the front of her dress stretches with the weight of another baby and her wide, undulating midriff is unmistakable swollen, heavy with child.");
		else if (quaellePregnancyStage(0) >= 2) output(" the front of her dress stretches with the weight of another baby.");
		else output(" her wide, undulating midriff is unmistakable swollen, heavy with child.");
				
		output("\n\n<i>“You are insatiable,”</i> she beams. She seems much calmer about this than with her first pregnancy - although as ever with Quaelle, calm is simply a matter of degrees. <i>“I wonder sometimes if I have borne enough... but then you [pc.move] through that door, and my epidermis shivers, cries out to make another with you.”</i> Warmth and happiness radiate out of her pleasant face.");
		output("\n\n<i>You have other business here I’m sure... but you’ll sit with me for a little while, won’t you?”</i>");	
	}

}
//returns current pregnancy count (past pregs + current), -1 if not currently pregnant, even if past pregs
public function quaelleIsPCPreg():Number
{
	var cnt:Number = 0;
	if (pc.hasPregnancyOfType("QuaellePregnancy"))
	{
		cnt += 1;
		if (StatTracking.getStat("pregnancy/quaelle births") > 0) cnt += StatTracking.getStat("pregnancy/quaelle births");
	}
	else cnt = -1;
	
	return cnt;
}
//returns true if current preg belly size is equal or greater than parameter bellysize, false if not or not preggers with Quaelle kid
public function quaellePCPregTime(belly:int=0):Boolean
{
	if (pc.hasPregnancyOfType("QuaellePregnancy"))
	{
		if (pc.bellyRating() >= belly) return true;
	}
	
	return false;
}
public function quaellePCPregGreeting():void
{
	flags["QUAELLE_PREG_GREET"] = 1;
	
	if (quaelleIsPCPreg() == 1)
	{
		output("<i>“Vibrantic Steele! You are... is that...?”</i> Quaelle wrings her hands, antennae ashiver, very un-roehm-like in her anxious wonder as she gazes down at your [pc.belly]. You smile at her, draw close to her slimy bulk so that she can have a stroke. Her wet, warm hand moves across your growing bulge.");
		output("\n\n<i>“I never imagined it would be this way,”</i> she murmurs, lost in a reverie. She seems unable to take her eyes off your stomach. <i>“I was prepared for my body to grow fat with tumbulous life. All those extranet videos I watched, how to prepare for it! But...”</i> she raises her double-pupiled eyes to meet yours, smiling. <i>“...that was foolish of me, wasn’t it? Hoping to meet someone in this place of all places, expecting that was how my partner would wish it to be. It’s strange but... wonderful.”</i>");
		output("\n\nShe sighs happily, and then withdraws her hand.");	
		output("\n\n<i>“Thank you for visiting, shiverous Steele. You have other business here I’m sure... but you’ll sit with me for a little while, won’t you?”</i>");	
	}
	else
	{
		output("<i>“Shiverous Steele.”</i> Quaelle gives you a wide smile when she catches sight of you - and your [pc.belly]. <i>“That’s mine, isn’t it? I can tell. I can feel it on the tips of my antennae... come here. Let me feel.”</i>");
		output("\n\nYou come across and let her lay her eager hands upon the burgeoning weight in your womb, warm, sweet smoothness circling across your taut [pc.skin]. Mmm... almost as nice as getting coconut oil rubbed on it.");
		output("\n\n<i>“How are you feeling?”</i> she asks. <i>“Are you eating well? You’re taking a bottle of water everywhere you go, aren’t you? You should exercise frequently but gently, and rest at regular intervals. Would you like me to type up a schedule for you?”</i> On and on go the matronly instructions as she continues to rub you, until at last she subsides into amiable silence.");	
		output("\n\n<i>“I’d prefer you to stay here, where I could keep an eye on you...”</i> your brightly-colored sugar sluggy sighs, withdrawing her paw. <i>“I worry a lot, hmm, you running around the frontier. But... you are a flickersome creature, I know. I made my peace with that when I decided to have children with you.”</i> She smiles at you lovingly. <i>“And I wouldn’t change anything about you.”</i>");	
	}
}
public function quaelleImmobileBath():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
	
	output("Of course you’ll stay for a little bit with the sequestered roehm. A grateful smile opens up on Quaelle’s pleasant face, and at glacial pace she slithers out of her bed pit and over to the bath. You watch her gown flutter away from her huge, swollen belly and milk-heavy breasts before she cranes her base up to the edge, before splashing into the hot water with a gasp and one long, ungainly undulation.");
	output("\n\n<i>“I </i>reeaaaally<i> wish I’d insisted on the raaaaammp,”</i> she grumbles.");
	output("\n\nYou take your [pc.gear] off and dip into the steaming waters yourself, sighing as you’re enveloped in hot bliss. Quaelle snuggles her warm, slimy softness into you happily.");
	output("\n\n<i>“Wwhat would you like to waaatch, shiveroussssSsssteeele?”</i>");

	processTime(5);
	clearMenu();
	addButton(0, "Gripper", quaelleSexBathGripper, undefined);
	addButton(1, "Romcom", quaelleSexBathRomcom, undefined);
	addButton(2, "Sexy", quaelleImmobileBathSexy, undefined);
	addButton(3, "Her Choice", quaelleSexBathHerChoice, undefined);
	
}

public function quaelleImmobileLeave():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");
		
	output("<i>“Ok...”</i> The heavily pregnant roehm’s antennae droop downwards and she rubs her hands together unhappily. <i>“I knooooow I’m too slooooooww for you riiiiiiight nowww. You’ll come and sssssit with me sooon though, won’t yoooouuuu?”</i>");
	output("\n\nYou head back out towards Reception as she’s pulling one of her plant pots towards her, brilliant eyes misting up.");
	
	processTime(5);
	clearMenu();
	addButton(0, "Next", move,"BREEDWELL_RECEPTION");

}
public function quaelleImmobileBathSexy():void
{
	clearOutput();
	showQuaelle(true);
	author("Nonesuch");	
		
	output("<i>“Oooh. You wwwwant something... viiiibrulent? Yooouuuu are a shiverousssss thing,”</i> says Quaelle, eyes twinkling. She shifts slightly in the water, her great pregnant bulk sending little steaming waves skating over your naked body. <i>“Iiiii’m not sure I can, eeeemmmm, do much for yooouuuuu in my current state.. But if you’d like to doooo... soomethiing with meeee...”</i>");
	output("\n\nShe’s arranged herself so she’s on her side, half-submerged, her front pussy just above the steaming waters. Its sapphire folds are plump and splayed by pregnancy, oozing sweetness, mouth-wateringly inviting.");
	output("\n\n<i>“...Hmm. I wwwwouldn’t say noooooo.”</i>");
	output("\n\nYou grin as you sink into the hot waters in front of her, all of your [pc.skinFurScales] submerged except for your head. You stroke her taut, spherical belly, hands slowly sinking downwards as she fiddles with her remote control until she finds The Power Palace. You turn and watch for a moment, fingers tracing Quaelle’s soft, slimy labia, making her sigh and tremble gently like an overstretched balloon.");
	output("\n\n<i>“Hello again, mere mortals,”</i> husks the lithe, red-skinned woman with the huge, spreading horns lying on the divan. <i>“It is I, Rita Veluptua.”</i>");
	output("\n\nShe is clad in long slips of silk; the neoclassical room is lit by flickers of flame. There is... equipment, arrayed around it, but its exact utility is disguised by the sultry gloom.");
	output("\n\n<i>“My 10,000 year sentence continues,”</i> Rita says, stretching languorously, silk stretching over her exquisitely proportioned breasts, hinting at the shape and duskiness of the nipples beneath. <i>“For crimes of unspeakable sensuousness. In this palace. This prison. All that remains to be seen is what ravenous shades will be ushered in to punish me today.”</i> The camera trains in on her supple black lips as they curve into a smile. <i>“Or what poor souls are brought in here for <b>me</b> to punish.”</i>");
	output("\n\nForms appear in the room, it’s not obvious from where; dressed in suits, animal masks, stern latex, robes, in chains and led by the collar. Every shape and sex and color and species seems to be represented, the camera trailing across bulging muscle, pendulous softness, rearing feathers, prehensile limbs and beckoning fingers. Some seize Rita and use her hypnotic form with feral roughness; others chain her to the wall and open up whole worlds of pain and torment to her; others kneel before her and submit to her astonishing, exotic demands.");
	output("\n\nThe participants are added at timely intervals, so that what starts as a solitary display of strange intimacy ramps up slowly into a bacchanalian orgy of total depravity. It’s meant to involve you in it, lower your inhibitions by stages");
	if (pc.isBimbo() || pc.isBro() || pc.exhibitionism() >= 66 || pc.libido() >= 50) output(", not that that’s something anybody needs to do with you.");
	else output(", and that’s exactly what it does.");
	pc.changeLust(50);
	
	output("\n\nAs the action becomes sprawling and intense, you turn your attention fully to the twat you’ve been idly fingering, sinking deep into the water in order to kiss and tongue its blue silkiness. Mmm... roehm pussy. It’s softened and lush with pregnancy, almost immediately drooling sugary femcum into your mouth and over your cheeks. Quaelle’s baby bump bounces against your forehead and she moans with helpless pleasure, unable to tear her eyes off what’s happening on the screen.");
	output("\n\nYou can’t see that yourself, of course, but the Pleasure Palace is clearly made with every viewer in mind, particularly perhaps those viewers who are tongue deep in their partner. Your ears are full of groans, gasps, little screams, whip-lashes and the whispering intimacy of other exquisitely nasty pieces of equipment. Quaelle’s orgasmic cries meld with those emanating from the screen, as if the pair of you were indeed part of the orgy. You lap at her silky innards as she shudders mightily around you, a slave to the energetic movements of your tongue.");
	output("\n\nYou close your eyes, allow the obscene sounds of the Pleasure Palace to overwhelm you. You’re just part of its tableau; a sybarite slave to overwhelming sensuousness. When Quaelle orgasms with a throaty squeal that goes on for long, long seconds, a great gush of sweet juices sluicing down her pregnant pussy and smearing all over your face, you could swear it’s actually Rita’s wickedly delicious cunt that you’re tonguing.");
	output("\n\n<i>“Very good,”</i> coos Rita, and you blink, still as submerged in the fantasy as you are in the fantasy. You turn around, resting your head on the mighty rise of Quaelle’s pregnant belly, to view the prisoner queen sat back on her divan, surrounded by exhausted, sweat-sheened bodies, calm and coy for all that she’s smeared and marked in every sexual way it’s possible to be. <i>“I’m so glad you attended another demonstration of why I must be locked up for the galaxy’s own good.”</i> Her slitted eyes lock with yours. <i>“Do come again.”</i>");
	output("\n\n<i>“Oooooohhhhhhhhh,”</i> groans Quaelle, long and hard. One hand rests on her bulging stomach, the other on your [pc.hair]. <i>“That show tiiiiresssss me out so muuuuch.”</i> She smiles down at you lovingly. <i>“But innn a good waaaayyyyyy.”</i>");
	output("\n\nYou rise and cuddle her for a little while, sharing her squishy, post-cunnilingus glow. Her brilliant eyes are already heavily dilated, and it’s not long before she’s fallen asleep in your arms, head rested on your collarbone, antennae tickling your chin. You lay a kiss on her brow and then rise out of the bath, carefully laying her head on the side. She doesn’t wake: simply lies there with one hand on her belly. The very picture of peace.");
	output("\n\nA minute or so later, you’re back in Breedwell Reception, feeling pretty fantastic. The horny taste of roehm sugar remains in your mouth, though. That’s making you want to do things.");
	
	processTime(120);
	pc.shower();
	clearMenu();
	addButton(0, "Next", move,"BREEDWELL_RECEPTION");
}
public function quaelleBirthEmail():String
{
	var eText:String = "";
	eText+="Congratulations! Your presence has been requested by someone in the Breedwell Natal Unit.";	
	eText+="\n\nBreedwell Incubation Centre, Tamani Corp";	
	
	return doParse(eText);
}
public function quaelleBirth(birthTimestamp:int = -1):void
{
	if(birthTimestamp < 0) birthTimestamp = GetGameTimestamp();
	
	var traitChar:Creature = chars["PC_BABY"];
	var c:UniqueChild = new QuaelleUniqueChild();
	
	c.RaceType = GLOBAL.TYPE_ROEHM;

	if (flags["QUAELLE_TOTAL_KIDS"] == undefined) flags["QUAELLE_TOTAL_KIDS"] = 0;
	flags["QUAELLE_BIRTHSCENE_KIDS"] = 0;
	
	//both births can trigger if within 2 days of each other
	if (flags["QUAELLE_INCUBATION_TIMER_F"] != undefined && flags["QUAELLE_INCUBATION_TIMER_F"] > quaelleIncubationDays() - 2)
	{
		//cycle through kids and increment gender stats
		for(var i:int = 0; i < flags["QUAELLE_NUM_BABIES_F"]; i++)
		{
			if (flags["QUAELLE_BABY_GENDERS_F"][i] == "M")
			{
				c.NumMale += 1;
				StatTracking.track("pregnancy/quaelle sons", 1);
			}
			else if (flags["QUAELLE_BABY_GENDERS_F"][i] == "F")
			{
				c.NumFemale += 1;
				StatTracking.track("pregnancy/quaelle daughters", 1);
			}
			else c.NumIntersex += 1; //shouldn't happen with quaelle's kids, just an error catch
		}
		StatTracking.track("pregnancy/quaelle sired", flags["QUAELLE_NUM_BABIES_F"]);
		StatTracking.track("pregnancy/total sired", flags["QUAELLE_NUM_BABIES_F"]);
		StatTracking.track("pregnancy/total day care", flags["QUAELLE_NUM_BABIES_F"]);
		flags["QUAELLE_TOTAL_KIDS"] += flags["QUAELLE_NUM_BABIES_F"];
		flags["QUAELLE_BIRTHSCENE_KIDS"] += flags["QUAELLE_NUM_BABIES_F"];	
		quaelleCleanupPregnancy(0);
	}
	if (flags["QUAELLE_INCUBATION_TIMER_B"] != undefined && flags["QUAELLE_INCUBATION_TIMER_B"] > quaelleIncubationDays() - 2)
	{
		//cycle through kids and increment gender stats
		for(var ii:int = 0; ii < flags["QUAELLE_NUM_BABIES_B"]; ii++)
		{
			if (flags["QUAELLE_BABY_GENDERS_B"][ii] == "M")
			{
				c.NumMale += 1;
				StatTracking.track("pregnancy/quaelle sons", 1);
			}
			else if (flags["QUAELLE_BABY_GENDERS_B"][ii] == "F")
			{
				c.NumFemale += 1;
				StatTracking.track("pregnancy/quaelle daughters", 1);
			}
			else c.NumIntersex += 1; //shouldn't happen with quaelle's kids, just an error catch
		}
		StatTracking.track("pregnancy/quaelle sired", flags["QUAELLE_NUM_BABIES_B"]);
		StatTracking.track("pregnancy/total sired", flags["QUAELLE_NUM_BABIES_B"]);
		StatTracking.track("pregnancy/total day care", flags["QUAELLE_NUM_BABIES_B"]);
		flags["QUAELLE_TOTAL_KIDS"] += flags["QUAELLE_NUM_BABIES_B"];
		flags["QUAELLE_BIRTHSCENE_KIDS"] += flags["QUAELLE_NUM_BABIES_B"];	
		quaelleCleanupPregnancy(1);
	}
	//unlike most births kids are not hybrid, pure roehm only, so the logic is different than usual	
	//set slug color randomly
	var kidColor:String = RandomInCollection(["yellow", "cream", "orange", "russet"]);
	c.skinTone = kidColor;
	c.lipColor = kidColor;
	c.nippleColor = kidColor;	
	flags["QUAELLE_BIRTHSCENE_COLOR"] = kidColor;	
	
	c.MaturationRate = 1.0;
	c.BornTimestamp = birthTimestamp;
	ChildManager.addChild(c);	
	
	flags["QUAELLE_BIRTHSCENE"] = birthTimestamp;	

}
public function quaelleTriggerBirthScene():Boolean
{
	//wait up to a week to trigger the birthscene
	var timeframe:int = 7 * 24 * 60;
	
	if (flags["QUAELLE_BIRTHSCENE"] == undefined) return false;
	
	if (GetGameTimestamp() - timeframe <= flags["QUAELLE_BIRTHSCENE"]) return true;
	else
	{
		flags["QUAELLE_BIRTHSCENE"] = undefined;
		flags["QUAELLE_BIRTH_EMAIL"] = undefined;
	}
	
	return false;
}
public function quaelleIsRecovering(days:int=1):Boolean
{
	var timeframe:int = days * 24 * 60;
	
	if (flags["QUAELLE_RECOVERY"] == undefined) return false;
	
	if (GetGameTimestamp() - timeframe < flags["QUAELLE_RECOVERY"]) return true;
	
	return false;
}
public function breedwellNatalUnitBonus():Boolean
{
	author("Nonesuch");
	
	output("A short distance down a corridor from the breeding pod chamber, Breedwell opens out into a massive, airy, state-of-the-art natal wing, dazzling white and gleaming chrome stretching out as far as the eye can see, synth windows opposite looking out upon space and the sand-colored gas giant the station is orbiting.");
	output("\n\nFrom your position halfway up one curving wall, you can see various glass-fronted cylinders that reach from the floor to the ceiling, each the size of an apartment building. Within you can see staff both mechanical and organic busying themselves with rahn babies and children, brightly colored jelly beans which stand out against the clinical whites and silvers of the architecture and equipment. You can see nurseries, schools, play areas and dormitories on various different floors, all of them busy with rahn both young and old. This is a hell of an operation.");
	
	if (flags["QUAELLE_NATAL_UNIT"] == undefined) output("\n\n<i>“You are [pc.name] Steele, aren’t you?”</i> says a drone hovering near the entrance, similar to the baby transporter one. <i>“Please follow me.”</i>");
	else output("\n\nYou already know where to go. You hurry along a walkway to the bay set aside for Quaelle.");
	
	processTime(5);
	clearMenu();
	addButton(0, "Next", quaelleBirthScene, undefined);
	
	return false;
}

public function quaelleBirthScene():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");	
	
	if (flags["QUAELLE_NATAL_UNIT"] == undefined)
	{
		flags["QUAELLE_NATAL_UNIT"] = 1;
		output("You follow the drone along a walkway, past the endless bustle and airy hubbub of this place, through a sliding glass door to a hospital bay. Here, there is peace. Warm, humid peace. The room is arrayed with congratulatory flowers and plants from the reception staff (possibly intended as snacks?) The staff here have approximated something similar to Quaelle’s sleeping arrangement by sitting two large mattresses next to another pushed against the wall. She’s leant her yellow bulk back on that, her antennae flopped down and a tired smile on her face,");
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output(" two little " + flags["QUAELLE_BIRTHSCENE_COLOR"] + " bundles in her arms, wee heads rested on her breasts.");
		else output(" a little " + flags["QUAELLE_BIRTHSCENE_COLOR"] + " bundle in her arms, wee head rested on her breasts.");
		
		output("\n\nHer smile widens when she catches sight of you, eyes glistening.");
		output("\n\n<i>“That was exhausting. And terrifying. And somnolent,”</i> she says softly. <i>“But... it was worth it. I am so glad I did this with you, verrifiscent Steele.”</i>");
		
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output("\n\nYou go across and slide an arm around her soft, wet shoulders, gaze down at your daughters. On cue one of them opens her own eyes, gazes back at you with the frank, disbelieving curiosity of babies the galaxy over (albeit most babies don’t have four pupils to do it with). They are both pure roehm from their tiny wriggling cilia down to their blunt, dazzling, sea slug ends... but their faces. Oh yes, you can see a trace of the roguish Steele charm there.");
		else output("\n\nYou go across and slide an arm around her soft, wet shoulders, gaze down at your daughter. On cue she opens her own eyes, gazes back at you with the frank, disbelieving curiosity of babies the galaxy over (albeit most babies don’t have four pupils to do it with). She is pure roehm from her tiny wriggling cilia down to her blunt, dazzling, sea slug end... but her face. Oh yes, you can see a trace of the roguish Steele charm there.");
		
		output("\n\nYou summon up the roehm spirit - it’s easy to do in the presence of Quaelle - and for long, long moments you just sit there hugging her, bathing in the love and peace that is radiating off her, cradling her first child");
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output("ren");
		output(".");
		
		output("\n\n<i>“Emmmmm,”</i> she murmurs at last, raising her eyes to yours again. <i>“I... looked through your file again, shiversome Steele. I hope you don’t mind, I just... wanted to know a bit more about you. Your father! What a shriltaltic individual he was! I know he left you that nursery, on Tavros, with all the things a child could want. You have seen this place...”</i> she wriggles her shoulders slightly. <i>“...it’s for rahn. Tamani might let me keep");
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output(" them here, somnolently.... But they");
		else output(" her here, somnolently.... But she");
		output(" would not belong. They would be amongst children being trained to be colonists, and would not understand. It fills my heart with burrilliousness.”</i>");
		
		output("\n\nShe’s working her way up to saying something very difficult for her. She’s taking her time, as is her species’ wont.");
		
		output("\n\n<i>“...I would like you to take");
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output(" them to your nursery.”</i> Her eyes swim slightly, but she keeps her voice steady. <i>“You will let me, won’t you, shiverous Steele? I believe it would be better. More mumberful. And I would see them again. You’d let me visit, wouldn’t you?”</i>");
		else output(" her to your nursery.”</i> Her eyes swim slightly, but she keeps her voice steady. <i>“You will let me, won’t you, shiverous Steele? I believe it would be better. More mumberful. And I would see her again. You’d let me visit, wouldn’t you?”</i>");		
		
		processTime(15);
		clearMenu();
		addButton(0, "Next", quaelleBirthScenePart2, undefined);
	}
	else
	{
		output("You [pc.move] along the walkway, through the endless bustle and airy hubbub of this place, retracing your steps to a familiar, glass-fronted hospital bay. In here, there is peace. Warm, humid peace. The room is arrayed with congratulatory flowers and plants from the reception team. Quaelle has her yellow bulk leant back on her impromptu wall-of-mattresses bed, her antennae flopped down and a tired smile on her face,");
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output(" two little " + flags["QUAELLE_BIRTHSCENE_COLOR"] + " bundles in her arms, wee heads rested on her breasts.");
		else output(" a little " + flags["QUAELLE_BIRTHSCENE_COLOR"] + " bundle in her arms, wee head rested on her breasts.");
		output(" Her smile widens when she catches sight of you.");
		
		output("\n\n<i>“Hmm. My vibruous lover,”</i> she says softly. <i>“Come have a look at the newest addition");
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output("s");			
		output(" to our family.”</i>");
		
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output("\n\nYou go across and slide an arm around her soft, wet shoulders, gaze down at your daughters. On cue one of them opens her own eyes, gazes back at you with the frank, disbelieving curiosity of babies the galaxy over (albeit most babies don’t have four pupils to do it with). They are both pure roehm from their tiny wriggling cilia down to their blunt, dazzling, sea slug ends... but their faces. Oh yes, you can see a trace of the roguish Steele charm there.");
		else output("\n\nYou go across and slide an arm around her soft, wet shoulders, gaze down at your daughter. On cue she opens her own eyes, gazes back at you with the frank, disbelieving curiosity of babies the galaxy over (albeit most babies don’t have four pupils to do it with). She is pure roehm from her tiny wriggling cilia down to her blunt, dazzling, sea slug end... but her face. Oh yes, you can see a trace of the roguish Steele charm there.");
		
		output("\n\nYou summon up the roehm spirit - it’s easy to do in the presence of Quaelle - and for long, long moments you just sit there hugging her, bathing in the love and peace that is radiating off her, cradling her first child");
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output("ren");
		output(".");
		
		output("\n\n<i>“Are you happy to place ");
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output(" them");
		else output(" her");
		output(" in your nursery as well?”</i> she asks softly. <i>“There is still room?”</i>");
		
		output("\n\nYou think about the astounding amount of space and resources Victor bequeathed you in that part of Tavros, whilst gazing at the " + flags["QUAELLE_BIRTHSCENE_COLOR"] + " blob");
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output("s");
		output(" in her arms, looking back at you curiously, tiny cillia wiggling in your direction. Yeah. There’s probably room.");

		output("\n\nYou tell her that the Steele Tech drone will be along shortly, but only to place");
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output(" them");
		else output(" her");
		output(" into its loving mechanical clutches when she feels ready.");
		
		if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1)		
		{
			output("\n\n<i>“Thank you, shiverous Steele.”</i> Quaelle sighs and rocks the children gently. <i>“It will make it easier for me to continue here, doing my job. If they were here... I doubt I would let them out of my sight.”</i>");
			output("\n\nYou allow yourself to breathe the humid atmosphere deep and sink into that almost Zen-like peace you adopt to interact with Quaelle, all the more profound now she’s cradling two children, and sit with her for a long while, cuddling her, playing with your daughter’s tiny, pudgy fingers until they finally drift into sleep.");			
		}
		else
		{
			output("\n\n<i>“Thank you, shiverous Steele.”</i> Quaelle sighs and rocks the child gently. <i>“It will make it easier for me to continue here, doing my job. If she were here... I doubt I would let them out of my sight.”</i>");
			output("\n\nYou allow yourself to breathe the humid atmosphere deep and sink into that almost Zen-like peace you adopt to interact with Quaelle, all the more profound now she’s cradling a child, and sit with her for a long while, cuddling her, playing with your daughter’s tiny, pudgy fingers until she finally drifts into sleep.");			
		}
		
		if (quaelleIsPregnant())
		{
			output("\n\n<i>“I can’t believe I’m going to have to go through this all over again,”</i> she groans,");
			if (quaelleIsPregnant(0)) output(" hand sliding down the growing bulge of her belly.");
			else output(" eyes on the fattening midriff of her slug half.");
			output(" <i>“I should have chosen a less flickersome, exhausting father!”</i>");
		
			output("\n\nShe loves it though, the sensation of being stuffed full of new life, it’s plain to see. You give her a soft kiss on the lips and then leave, heading back to reception.");
		}
		else
		{
			output("\n\n<i>“I will back at work soon,”</i> she says at last, holding your hand. <i>“You’ll still visit, won’t you? I feel so vibriscent in your company.”</i> She squeezes your hand and is silent for a few moments, antennae waving, seeming just to bask in your presence.");
			output("\n\nYou give her a soft kiss on the lips and then leave, heading back to reception.");
		}
			
		flags["QUAELLE_BIRTHSCENE"] = undefined;
		flags["QUAELLE_BIRTH_EMAIL"] = undefined;
		flags["QUAELLE_RECOVERY"] = GetGameTimestamp();
		if (flags["QUAELLE_SP_NURSERY_BABY"] == undefined) flags["QUAELLE_SP_NURSERY_BABY"] = GetGameTimestamp();
		
		processTime(15);
		clearMenu();
		addButton(0, "Next", move,"BREEDWELL_RECEPTION");
	}	
}
public function quaelleBirthScenePart2():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");		
		
	output("You consider the " + flags["QUAELLE_BIRTHSCENE_COLOR"] + " blob");
	if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output("s");	
	output(" in her arms, looking back at you curiously, tiny cillia wiggling in your direction. Well... it’s not exactly a problem for you, is it?");
		
	output("\n\nYou smile and tell her you’d love to have the kids in your nursery. But you aren’t going to rip them out of her arms. Let her have all the time she wants - you’ll send over the Steele tech drone, and she can place her slimy bundle");
	if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output("s");	
	output(" of joy into its careful protection when she feels ready.");
	
	output("\n\n<i>“Ohhhhh.”</i> Quaelle looks mostly relieved at this, as if she <i>had</i> thought you’d immediately swipe the");
	if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output(" babies");
	else output(" baby");
	output(" out of her arms. <i>“Ok then, shiversome Steele. We’ll do that.”</i>");
	
	output("\n\nYou allow yourself to breathe the humid atmosphere deep and sink into that almost Zen-like peace you adopt to interact with Quaelle, all the more profound now she’s cradling");
	if (flags["QUAELLE_BIRTHSCENE_KIDS"] > 1) output(" two children");
	else output(" a child");	
	output(", and sit with her for a long while, cuddling her, playing with your daughter’s tiny, pudgy fingers until she finally drifts into sleep.");
	
	if (quaelleIsPregnant())
	{
		output("\n\n<i>“I can’t believe I’m going to have to go through this all over again,”</i> she groans,");
		if (quaelleIsPregnant(0)) output(" hand sliding down the growing bulge of her belly.");
		else output(" eyes on the fattening midriff of her slug half.");
		output(" <i>“I should have chosen a less flickersome, exhausting father!”</i>");
		
		output("\n\nShe loves it though, the sensation of being stuffed full of new life, it’s plain to see. You give her a soft kiss on the lips and then leave, heading back to reception.");
	}
	else
	{
		output("\n\n<i>“I will back at work soon,”</i> she says at last, holding your hand. <i>“You’ll still visit, won’t you? I feel so vibriscent in your company. And, I think, once I’ve recovered...”</i> she squeezes your hand and is silent for a few moments, just looking at you with soft intent. <i>“...I would like some more.”</i>");
		output("\n\nVoid, she’s keen! You give her a soft kiss on the lips and then leave, heading back to reception.");
	}
	
	flags["QUAELLE_BIRTHSCENE"] = undefined;
	flags["QUAELLE_BIRTH_EMAIL"] = undefined;
	flags["QUAELLE_RECOVERY"] = GetGameTimestamp();
	
	processTime(15);
	clearMenu();
	addButton(0, "Next", move,"BREEDWELL_RECEPTION");
}
public function quaellePregnancyEnds():void
{
	clearOutput();
	author("Nonesuch");
	showBust("");
	showName("\nBIRTHING!");
	
	var se:StorageClass = pc.getStatusEffect("Quaelle Pregnancy Ends");
	
	// Failsafe
	if(se == null)
	{
		output("ERROR: 'Quaelle Pregnancy Ends' Status Effect does not exist.");
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	var numChildren:int = se.value1;
	var bRatingContrib:int = se.value2;
	var pregSlot:int = se.value3;
	var babym:Boolean = (se.value4 == 1);
	
	output("Pressure has been building portentously in your lower belly over the last couple of hours, making movement increasingly difficult. Warm wetness suddenly");
	if(!pc.isCrotchExposed()) output(" floods your [pc.lowerUndergarment]");
	else output(" pours down your [pc.thighs]");
	output(", and there’s an acute pulling sensation at your cervix. Your waters have broken! After a moment of blind panic, you cast around, considering your options.");
	
	if (InShipInterior())
	{
		output("\n\nAs quickly as you can, you waddle into your room, switch the auto-medkit on in the bathroom, carefully place yourself on the bed");
		if (!pc.isCrotchExposed()) output(", rip off your [pc.gear]");
		output(" and spread your [pc.thighs], biological imperative virtually ordering you what to do.");
	}
	else if(InNursery()) output("\n\nYou are, fortunately, in the best place it’s possible to be to give birth. A quick tap on your alarm button is enough to summon Briget, who takes charge with comforting crispiness, telling you exactly what to do.");
	else if (InPublicSpace())
	{
		output("\n\nAs quickly as you can, you waddle into the nearest restroom, grab the medkit drone off the wall (frontier bathrooms are thankfully readily equipped for this sort of thing), lock yourself in a cubicle and spread your [pc.thighs], biological imperative virtually ordering you what to do.");
	}
	else
	{
		output("\n\nGroaning at the timing, you");
		if (!pc.isCrotchExposed()) output(" shed your [pc.gear] and");
		output(" position yourself the best you can in the inhospitable terrain. You wish you’d obeyed your deeper instincts and found somewhere safe and warm to do this, but there’s no helping it now -- you’ll have to deliver on your own.");	
	}
	
	if (InNursery()) output("\n\nThe nurse droid monitors your pulse and places a large sheet beneath your thighs, instructing you to bear down rhythmically with soft, firm assertions. You push, shoving down on the huge, soft weight in your womb, the pressure building and building, your cervix and vagina dilating beyond the point you thought possible... and then, in a great, long ‘schlorp’, your child comes loose, gliding with boneless ease like an otter off a river bank into the great, wide world.");
	else output("\n\nThe medkit drone monitors your pulse and places a large sheet beneath your thighs, instructing you to bear down rhythmically with soft, wordless beeps. You push, shoving down on the huge, soft weight in your womb, the pressure building and building, your cervix and vagina dilating beyond the point you thought possible... and then, in a great, long ‘schlorp’, your child comes loose, gliding with boneless ease like an otter off a river bank into the great, wide world.");
	
	output("\n\nShe is soft and pliant but oh, there’s so much of her! You grunt, sweat running down your reddened face as you push more and more of that thick body, that long, blunt tail past your painfully stretched lips. You hear her cry whilst you’re still bearing her out - it sounds more like sleepy surprise than a baby’s usual cry of frightened indignation - and it’s only after long, shattering minutes of exertion that you can finally prop yourself up, gather her");
	if (InNursery()) output(" from Briget’s arms");
	else output(" up");
	output(" and have a good look at what you’ve borne.");
	
	output("\n\nIt’s a roehm, maybe a little over two feet of " + flags["QUAELLE_BIRTHSCENE_COLOR"] + ", slimy-skinned gastropod girl, the edge of her foot rippling up and down, the wondering gaze of her brilliant, double-pupiled eyes split between her slowly flexing fingers and your face, trying to make sense of it all. Her antennae are still slicked down, but even as you watch they begin to come loose, getting ready to stretch out and tune into the quivers and tremors of the universe.");
	output("\n\nIn all physical characteristics she is like her father, but her face... yeah. You give her a squeeze, drawing a tiny, high ‘hmm’ out of her. You can definitely see more than a little of the old Steele charm there.");

	if (InNursery())
	{
		if (StatTracking.getStat("pregnancy/quaelle daughters") > 1)
		{
			output("\n\nAfter a little while longer cuddling the little roehm she falls asleep, tiny " + flags["QUAELLE_BIRTHSCENE_COLOR"] + " hands curled into fists, and you hand her over to Briget, before falling into a deep, well-earned doze yourself.");
		}
		else
		{
			output("\n\n<i>“I had a chat with the father, a week or so ago,”</i> Briget says, after she’s cleaned you up, brought you some water and let you cradle");
			if (pc.isLactating()) output(" and nurse");
			output(" the slimy bundle of joy for a while. <i>“She’s very sweet, isn’t she? She wanted to know all about the facilities here. I assured her that we’re well equipped to deal with roehm children, and that she’s welcome to visit whenever she wants.”</i>");
			
			output("\n\nWould Quaelle ever want to leave, once she clapped eyes on this little cutie? That’s the more serious question. After a little while longer cuddling the little roehm she falls asleep, tiny " + flags["QUAELLE_BIRTHSCENE_COLOR"] + " hands curled into fists, and you hand her over to Briget, before falling into a deep, well-earned doze yourself.");
		}
	}
	else
	{
		if (StatTracking.getStat("pregnancy/quaelle daughters") > 1)
		{
			output("\n\nYou clean yourself up the best you can, and then go back to cradling the slimy bundle of joy");
			if (pc.isLactating()) output(", feeding her some of your [pc.milk]");
			output(".");
			output(" You are interrupted by the hum of an approaching hum: the Steele tech incubator drone, gliding through the air towards you.");
			output("\n\nIt’s difficult to give the little roehm up, but she makes it much easier for you by falling asleep in your arms, tiny " + flags["QUAELLE_BIRTHSCENE_COLOR"] + " hands curled into fists. She’s dreaming deep as she’s whisked away, the incubator solicitously misting warm water around its insides.");			
		
		}
		else
		{
			output("\n\nYou clean yourself up the best you can, and then go back to cradling the slimy bundle of joy");
			if (pc.isLactating()) output(", feeding her some of your [pc.milk]");
			output(".");
			output(" You are interrupted by the hum of an approaching drone. The sound prompts the sudden thought that Breedwell might have sent their own... but, nope, it’s the familiar Steele tech-branded one gliding towards you, complete with its incubator. You guess that means Quaelle’s happy for you to drop her at your nursery - at least for now.");
			output("\n\nIt’s difficult to give the little roehm up, but she makes it much easier for you by falling asleep in your arms, tiny " + flags["QUAELLE_BIRTHSCENE_COLOR"] + " hands curled into fists. She’s dreaming deep as she’s whisked away, the incubator solicitously misting warm water around its insides.");			
		}
	}
	
	processTime(60 + rand(15 * numChildren));
	
	pc.removeStatusEffect("Quaelle Pregnancy Ends");
	flags["QUAELLE_PREG_GREET"] = undefined;	
	if (flags["QUAELLE_SP_NURSERY_BABY"] == undefined) flags["QUAELLE_SP_NURSERY_BABY"] = GetGameTimestamp();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);	
}

public function quaelleNurserySceneBabies(babyCnt:int=1):void
{
	clearOutput();
	author("Nonesuch");
	showBust("");
	showName("ROEHM\nBABIES");
	
	if (quaellePlaySpecialNurseryScene(0))
	{
		flags["QUAELLE_SP_NURSERY_BABY"] = GetGameTimestamp();
		
		var choice:int = 0;
		if (babyCnt > 1) choice = rand(2);

		if (choice == 0)
		{
			if (babyCnt > 1)
			{
				output("<i>“Effivescerent Steele!”</i>");
				output("\n\nThe great, yellow bulk of Quaelle dominates the nursery. One of her daughters curled in her arms, she radiates tropical happiness.");
				output("\n\n<i>“You are sooooo fortunate,”</i> she sighs, booping the nose of the cooing slug baby. <i>“If I were able to visit this place freely, I would never leave.");
				if (StatTracking.getStat("pregnancy/total day care") > StatTracking.getStat("pregnancy/quaelle daughters")) output(" And you have sooooo many children, fervotatious Steele! How do you cope with the thought of them? How do you not shiver out of your membrane with worry when you are away from them?");
				output("”</i>");
				
				output("\n\nShe’s warped across from Breedwell on her free day. She’s spending it spoiling her babies with waterproof ribbons and blankets, raspberries delivered to their soft tummies, and the strange, slow, traditional games of the roehm, more about patience than recognition or coordination. Or maybe... those things <i>through</i> patience. You find yourself nodding off watching them; the effect of watching a roehm with her children is rather like whale music.");
				output("\n\nThey may not see her everyday, but Quaelle certainly knows how to ingratiate herself with her daughters. They coo and grow excited whenever she’s in eyeshot, and grow sulky and whiny when she leaves to quiz Briget hard about their feeding regimen.");
				output("\n\n<i>“I will be here for, emmmmm, some time,”</i> Quaelle says to you when she returns, with a glance at her miniature device. <i>“You don’t mind, do you?”</i>");
				output("\n\nOf course not. You leave her singing a sweet, ponderous song over the cradles before you yourself are transported to sleep.");			
			}
			else
			{
				output("<i>“Effivescerent Steele!”</i>");
				output("\n\nThe great, yellow bulk of Quaelle dominates the nursery. Her daughter curled in her arms, she radiates tropical happiness.");
				output("\n\n<i>“You are sooooo fortunate,”</i> she sighs, booping the nose of the cooing slug baby. <i>“If I were able to visit this place freely, I would never leave.");
				if (StatTracking.getStat("pregnancy/total day care") > StatTracking.getStat("pregnancy/quaelle daughters")) output(" And you have sooooo many children, fervotatious Steele! How do you cope with the thought of them? How do you not shiver out of your membrane with worry when you are away from them?");
				output("”</i>");
				
				output("\n\nShe’s warped across from Breedwell on her free day. She’s spending it spoiling her baby with waterproof ribbons and blankets, raspberries delivered to her soft tummy, and the strange, slow, traditional games of the roehm, more about patience than recognition or coordination. Or maybe... those things <i>through</i> patience. You find yourself nodding off watching them; the effect of watching a roehm with her child is rather like whale music.");
				output("\n\nShe may not see her everyday, but Quaelle certainly knows how to ingratiate herself with her daughter. She coos and grows excited whenever she’s in eyeshot, and grows sulky and whiny when she leaves to quiz Briget hard about her feeding regimen.");
				output("\n\n<i>“I will be here for, emmmmm, some time,”</i> Quaelle says to you when she returns, with a glance at her miniature device. <i>“You don’t mind, do you?”</i>");
				output("\n\nOf course not. You leave her singing a sweet, ponderous song over the cradle before you yourself are transported to sleep.");
			}
			genericSleep(120,false);
		}
		else if (choice == 1)
		{
			output("<i>“Shimmerlous Steele!”</i>");
			output("\n\nQuaelle is here, her great, soft bulk filling the nursery. Evidently she’s warped over from Breedwell for the day. She looks startled to see you, which might have something to do with the fact she’s currently festooned in her babies. Limpeted to her yellow membrane, the tiny slug girls are babbling and cooing as they crawl interestedly over their parent’s body.");
			output("\n\n<i>“This is, emmmmmm, how roehm mothers carry their children. Traditionally,”</i> she says, antennae twitching. She looks very embarrassed. <i>“I, emmmm... wanted to know what it felt like.”</i>");
			output("\n\nShe gets even more agitated when you take out your codex and take several pictures of the wiggly edifice of gastropodic softness, one of them taking Quaelle’s conch-like hat off and sinking it over her own head. It’s <i>adorable.</i>");
			output("\n\n<i>“You... leave me alone now!”</i> she half-laughs, half-scowls at you, waving her hands. <i>“I need to put them to bed.”</i>");
			output("\n\nThe robotic staff could do that, of course, but you suspect Quaelle is in charge here for as long as she can possibly manage.");
			processTime(10 + rand(10));
		}	
	}
	else
	{		
		if (babyCnt > 1) output("Your gastropod daughters are still very young. They have their own squishy egg cup-shaped cribs in which they sleep, and occasionally throw their toys at the nurse staff from.");
		else output("Your gastropod daughter is still very young. She has her own squishy egg cup-shaped crib in which she sleeps, and occasionally throws her toys at the nurse staff from.");
	
		if (babyCnt >= 4)
		{
			output("\n\nSome are asleep, but others grip their crib bars and raise their upper bodies up, regarding you with a multitude of strange, curious eyes as you approach. You are a curiosity to them - a creature quite different to any of the mostly robotic nurses, making incomprehensible vibrations when it opens its food hole - but a happy, diverting curiosity nonetheless.");
			output("\n\nThey coo when you run your hands through their wave, sensitive cilia, and then you play with them for a bit, playing very slow patticake and word blocks, splitting your attention between each. Eventually a drone nurse declares its changing time. The roehm grouse wetly but gently as you leave them. They make for extremely good-natured infants.");
		}
		else if (babyCnt >= 2)
		{
			output("\n\nThey make wet farty noises and blow spit bubbles happily when they see you, peering over a shared crib’s edge with their dazzling blue eyes. You have to bear in mind they can’t hear anything you say - it’s just you opening your mouth and making strange vibrations to them - but they giggle happily when you run your hand through their sensitive cilia, and then play where’s-the-dolly with you.");
			output("\n\nThey don’t seem all that grumpy when the drone nurse declares it changing time, and ushers you out, simply waving their antennae at you as a goodbye. Roehm make for very good-natured children.");
		}
		else
		{
			output("\n\nShe makes wet farty noises and blows spit bubbles happily when she sees you, peering over the crib’s edge with her dazzling blue eyes. You have to bear in mind she can’t hear anything you say - it’s just you opening your mouth and making strange vibrations to her - but she giggles happily when you run your hand through her sensitive cilia, and then plays a very slow patticake with you. ");
			output("\n\nShe doesn’t seem all that grumpy when the nurse declares it changing time, and ushers you out; she simply waves her antennae at you as a goodbye. Roehm make for very good-natured children.");
		}
		
		processTime(10 + rand(10 * babyCnt));
	}
	
	clearMenu();
	addButton(0, "Next", nurserySpecialistRoehm,undefined);
}
public function quaelleNurserySceneKids(kidCnt:int=1):void
{
	clearOutput();
	author("Nonesuch");
	showBust("");
	showName("ROEHM\nKIDS");
	
	var choice:int = 0;
	
	if (quaellePlaySpecialNurseryScene(1))
	{
		flags["QUAELLE_SP_NURSERY_KID"] = GetGameTimestamp();
		
		choice = rand(2);
		
		if (choice == 0)
		{
			if (kidCnt > 1)
			{
				output("Quaelle is in the classroom, helping your roehm daughters with their Aural Perception Primary Training. They frown intently, antennae waving and curling at the long, cylindrical pulse-units at the front of the room, throbbing away whilst the rahn teacher faces them and care-full-ee ann-unn-see-ates eh-vurr-ee word.");
				output("\n\nQuaelle follows this up by knitting her antennae with theirs and sitting in silence for a while with each, imparting something through some form of wiggly osmosis. Your daughters’ faces scrunch up as the cilia embrace goes on and then brighten with understanding each time, beaming at their parent as they pull apart.");
				output("\n\nWithout copious amounts of genemods they’ll never <i>hear</i> the world around them, anymore than you’ll know what it’s like to perceive it through vibration. But these classes will enable them to easily get by communicating with their eared friends. Perhaps with just as delightful a speech impediment as Quaelle herself.");
			}
			else
			{
				output("Quaelle is in the classroom, helping your roehm daughter with her Aural Perception Primary Training. She frowns intently, antennae waving and curling at the long, cylindrical pulse-units at the front of the room, throbbing away whilst the rahn teacher faces her and care-full-ee ann-unn-see-ates eh-vurr-ee word.");
				output("\n\nQuaelle follows this up by knitting her antennae with hers and sitting in silence for a while, imparting something through some form of wiggly osmosis. Your daughter’s face scrunches up as the cilia embrace goes on and then brightens with understanding each time, beaming at their parent as they pull apart.");
				output("\n\nWithout copious amounts of genemods she’ll never <i>hear</i> the world around them, anymore than you’ll know what it’s like to perceive it through vibration. But these classes will enable her to easily get by communicating with her eared friends. Perhaps with just as delightful a speech impediment as Quaelle herself.");
			}
			processTime(10 + rand(10));
		}
		else if (choice == 1)
		{
			if (kidCnt > 1)
			{
				output("Quaelle is in the playroom. She has brought armfuls of sweets and toys with her, and is in the process of thoroughly spoiling your young roehm daughters. Their day only becomes more over-stimulating when they spot you.");
				output("\n\n<i>“" + pc.mf("Daddy!", "Mommy!") + "”</i>");				
				
				output("\n\nThey slither across, and you give each the long, slimy hug they all want.");
				output("\n\n<i>“Aren’t they shimmerlent and well-behaved, Steele?”</i> sighs Quaelle, watching you squeeze each. <i>“Hugs are so important.”</i>");
				output("\n\nThe two of you form a good team: You can do more energetic stuff with them, Quaelle easily handles the slower, more patient types of play. You grab each and go down the waterfall with them (the nursery has a couple of swimsuits on hand), each of them squealing all the way, whilst Quaelle tends a pretend, holographic garden with them.");
				output("\n\nTheir brilliant blue eyes mist up a bit when it’s time for you to go, but they’re learning to be brave girls. At Quaelle’s behest they give you a wave with their pudgy hands and antennae, and a soulful chorus of <i>“Bye " + pc.mf("Dad", "Mom") + "”</i>.");
				output("\n\nYou expect Quaelle will be there for as long as she can possibly wrangle it.");
			}
			else
			{
				output("Quaelle is in the playroom. She has brought armfuls of sweets and toys with her, and is in the process of thoroughly spoiling your young roehm daughter. Her day only becomes more over-stimulating when she spots you.");
				output("\n\n<i>“" + pc.mf("Daddy!", "Mommy!") + "”</i>");
				
				output("\n\nShe slithers across, and you give her the long, slimy hug she so ardently desires.");
				output("\n\n<i>“Isn’t she shimmerlent and well-behaved, Steele?”</i> sighs Quaelle, watching you squeeze. <i>“Hugs are so important.”</i>");
				output("\n\nThen, watching your [pc.feet] carefully (Stars above it’s slippery in here!), you play with them for a while, constructing a castle with building blocks, carefully watering a pretend garden, and then encouraging her to go down the waterfall by doing so yourself (the nursery has a couple of swimsuits on hand). What fun!");
				output("\n\nHer brilliant blue eyes mist up a bit when it’s time for you to go, but she’s learning to be a brave girl. At Quaelle’s behest she gives you a wave with both pudgy hand and antennae and a soulful <i>“Bye " + pc.mf("Dad", "Mom") + "”</i>.");
				output("\n\nYou expect Quaelle will be there for as long as she can possibly wrangle it.");				
			}
			processTime(10 + rand(10 * kidCnt));
		}
		else output(""); 
	}
	else
	{
		choice = rand(3);
		
		if (choice == 0)
		{
			if (kidCnt > 1) output("Your infant roehm daughters are in the classroom, in the middle of their Aural Perception Primary Training. They frown intently, antennae waving and curling at the long, cylindrical pulse-units at the front of the room, throbbing away whilst the rahn teacher faces them and care-full-ee ann-unn-see-ates eh-vurr-ee word. Without copious amounts of genemods they’ll never <i>hear</i> the world around them, anymore than you’ll know what it’s like to perceive it through vibration. But these classes will enable them to easily get by communicating with their eared friends. Perhaps with just as delightful a speech impediment as their mother.");
			else output("Your infant roehm daughter is in the classroom, in the middle of her Aural Perception Primary Training. She frowns intently, antennae waving and curling at the long, cylindrical pulse-units at the front of the room, throbbing away whilst the rahn teacher faces her and care-full-ee ann-unn-see-ates eh-vurr-ee word. Without copious amounts of genemods she’ll never <i>hear</i> the world around her, anymore than you’ll know what it’s like to perceive it through vibration. But these classes will enable her to easily get by communicating with her eared friends. Perhaps with just as delightful a speech impediment as their mother.");
	
			processTime(10 + rand(10));
		}
		else if (choice == 1)
		{
			var children:Array = ChildManager.getChildrenOfType(GLOBAL.TYPE_RAHN);
			var child:Child;
			var rahnKids:int = 0;
			if (children != null && children.length > 0)
			{
				child = children[0];
				for (var i:int = 0; i < children.length; i++)
				{
					var c:Child = children[i] as Child;
					if (c.Years >= 1) rahnKids += c.Quantity;
				}
			}	
			if (kidCnt > 1)
			{
				output("Your young roehm daughters are in their playroom. A third of it is taken up by a tepid pool of water fed by a miniature waterfall, the rest by a bunch of waterproof toys.");
				if (rahnKids > 1) output("They have been joined by your rahn children, who are just at home in this type of environment, and apparently enjoy the company of the roehm in their more peaceful moments.");
				else if (rahnKids > 0) output("They have been joined by your rahn daughter, who is just at home in this type of environment, and apparently enjoys the company of the roehm in her more peaceful moments.");
				output("Your appearance gets the room about as excited and energetic as it’s ever going to be.");		
			
				output("\n\n<i>“" + pc.mf("Daddy!", "Mommy!") + "”</i>");
				output("\n\nThey slither across, and you give each the long, slimy hug they all want. Then, watching your [pc.feet] carefully (Stars above it’s slippery in here!), you play with them for a while, constructing a castle with building blocks, tending a pretend garden with them, and then grabbing each and going down the waterfall with them (the nursery has a couple of swimsuits on hand), squealing all the way. What fun!");
				output("\n\nTheir brilliant blue eyes mist up a bit when it’s time for you to go, but they’re learning to be brave girls. At Briget’s behest they give you a wave with their pudgy hands and antennae, and a soulful chorus of <i>“Bye "+ pc.mf("Dad", "Mom") +"”</i>.");
				output("\n\nShivero- cuddly little things.");
			}
			else
			{
				output("Your young roehm daughter is in her playroom. A third of it is taken up by a tepid pool of water fed by a miniature waterfall, the rest by a bunch of waterproof toys.");
				if (rahnKids > 1) output("She has been joined by your rahn children, who are just at home in this type of environment, and apparently enjoy the company of the roehm in their more peaceful moments.");
				else if (rahnKids > 0) output("She has been joined by your rahn daughter, who is just at home in this type of environment, and apparently enjoys the company of the roehm in her more peaceful moments.");
				output("Your appearance gets the room about as excited and energetic as it’s ever going to be.");
			
				output("\n\n<i>“" + pc.mf("Daddy!", "Mommy!") + "”</i>");
				output("\n\nShe slithers across, and you give her the long, slimy hug she so ardently desires. Then, watching your [pc.feet] carefully (Stars above it’s slippery in here!), you play with her for a while, constructing a castle with building blocks, carefully watering a pretend garden, and then encouraging her to go down the waterfall by doing so yourself (the nursery has a couple of swimsuits on hand). What fun!");
				output("\n\nHer brilliant blue eyes mist up a bit when it’s time for you to go, but she’s learning to be a brave girl. At Briget’s behest she gives you a wave with both pudgy hand and antennae and a soulful <i>“Bye "+ pc.mf("Dad", "Mom") +"”</i>.");
				output("\n\nShivero- cuddly little thing.");			
			}
			processTime(10 + rand(10 * kidCnt));		
		}
		else if (choice == 2)
		{
			if (kidCnt > 1)
			{
				output("Briget combines mealtime with storytime for your young roehm daughters in the main atrium. Here there is plentiful amounts of edible greenery, thronging out of planters built into the walls... but they are being taught to graze responsibly, tending for the plants themselves with wee watering cans, and only eating them once they’re mature.");
				output("\n\nThey munch their cud, solemn double-pupiled eyes fixed on Briget as the robot reads a roehm fairytale to them, in which the heroine bravely waits for the monster under her bed to die of old age.");
				output("\n\nAt Briget’s behest you step in and tell an alternative story, a heavily edited version of one of your adventures. They mostly find it highly amusing, your words drawing giggly, harmonious choruses of ‘hmm’s out of them. To them, your gallivanting around the frontier comes across as the actions of a berzerk clown. Possibly they are correct? You find yourself laughing along to your own escapades by the end.");
				output("\n\nFinally you give them each a hug from their silly old " + pc.mf("dad", "mom") + " and bid them a fond farewell.");			
			}
			else
			{
				output("Briget combines mealtime with storytime for your young roehm daughter in the main atrium. Here there is plentiful amounts of edible greenery, thronging out of planters built into the walls... but she is being taught to graze responsibly, tending for the plants herself with a wee watering can, and only eating them once they’re mature.");	
				output("\n\nShe munches her cud, solemn double-pupiled eyes fixed on Briget as the robot reads a roehm fairytale to her, in which the heroine bravely waits for the monster under her bed to die of old age.");
				output("\n\nAt Briget’s behest you step in and tell an alternative story, a heavily edited version of one of your adventures. She mostly finds it highly amusing, your words drawing long, humming giggles out of her. To her, your gallivanting around the frontier comes across as the actions of a berzerk clown. Possibly she is correct? You find yourself laughing along to your own escapades by the end.");
				output("\n\nFinally you give her a hug from their silly old " + pc.mf("dad", "mom") + " and bid her a fond farewell.");			
			}
			processTime(10 + rand(20));	
		}
		else output("");
	}
		
	clearMenu();
	addButton(0, "Next", nurserySpecialistRoehm,undefined);
}
public function quaellePlaySpecialNurseryScene(age:int = -1):Boolean
{
	var timeframe:int = 15 * 24 * 60;
	
	if (quaelleReplacedWithDohrahn()) return false;
	
	if (age == 0)
	{
		if (flags["QUAELLE_SP_NURSERY_BABY"] == undefined) flags["QUAELLE_SP_NURSERY_BABY"] = GetGameTimestamp();
		if (GetGameTimestamp() - timeframe > flags["QUAELLE_SP_NURSERY_BABY"]) return true;
	}
	else if (age == 1)
	{
		if (flags["QUAELLE_SP_NURSERY_KID"] == undefined) flags["QUAELLE_SP_NURSERY_KID"] = GetGameTimestamp();
		if (GetGameTimestamp() - timeframe > flags["QUAELLE_SP_NURSERY_KID"]) return true;
	}	
	return false;
}

public function quaellePregShutdownTalk():void
{	
	var kids:Number = 0;
	if (flags["QUAELLE_TOTAL_KIDS"] != undefined) kids += flags["QUAELLE_TOTAL_KIDS"];
	
	output("<i>“Efficervescent Steele.”</i>");
	output("\n\nThe roehm has not only gotten her aides to take over her duties by the time you’ve gotten over to her, she’s actually oozed out of reception itself, so she can clasp your hands and beam at you without a counter blocking the way.");
	output("\n\nYou think that as much as you’ve had to develop a deep patience in order to interact and get intimate with this creature, so something of you has rubbed off on her (certainly, a lot of rubbing’s been going on). She got all of that done so she can draw you into her favourite vine-festooned nook at a very un-sluggardly pace.");
	output("\n\nYou sit with Quaelle, holding her warm, slimy hands, enjoying that easy, silent peace you’re able to sink into with her. There is something different about her... and she wants you to know what it is. That realisation surfaces slowly. It’s the smell. Still sweet and creamy, but... less urgent. Much less sexual.");
	output("\n\n<i>“Your full year has ended,”</i> you say at last.");
	output("\n\n<i>“Yeeessssssss,”</i> the roehm says approvingly. <i>“I have been feeling that part of me closing up over the last few weeks. I am going dormant again, still and somnolent, for another five years.”</i> She squeezes your hands. <i>“Before, when it happened, it was a sad time. I felt I had not done what I had wanted. I understood that... you couldn’t always expect everything to come to you, eventually. That was a monoceptive realization.”</i>");
	output("\n\nShe smiles at you, eyes glittering.");
	output("\n\n<i>“But this time... it is a joyous time. Because I found a lover who gave me what I wanted. Moorrrrre! A lover who was willing to provide for my child");
	if (kids > 1) output("ren");
	output(", as I worked. You are a shiverous, fulcrulent, luminous being, Steele! You have made me happier than you can imagine.”</i>");	
	
	if (kids >= 6)
	{
		output("\n\nYou ask if she’s happy with the number you had together.");
		output("\n\n<i>“Emmmmmm,”</i> she hums, cheeks turning orange. <i>“I.... never expected to have as many as we did. You are so virulescent, Steele! " + num2Text(kids,true) + "! My mother will be shudderific! But... if you pray for rain, you should not spite a deluge. You have filled my arms with children, my heart with love, Steele. For that, I thank you.”</i>");			
	}
	else if (kids >= 2)
	{
		output("\n\nYou ask if she’s happy with the number you had together.");
		output("\n\n<i>“Very,”</i> she replies, antennae bobbing as she brings them to mind. <i>“They will grow up in a trembluous environment, perhaps, but they will have each other if it ever seems too strange. I am content, when I think of them. " + num2Text(kids,true) + " is an excellent number to have.”</i>");		
	}
	else
	{
		output("\n\nYou ask if she’s alright about the fact you only had one together.");
		output("\n\n<i>“It is my first full year. It makes sense to have a single child first, doesn’t it? See how we get on?”</i> She hum-giggles a bit. <i>“My only daughter, brought into being with the heir to a huge corporation. She will be the most ssssspooiiiillled roehm in this hemisphere of the galaxy!”</i>");
	}
	
	output("\n\nYou ask what she intends to do now.");
	output("\n\n<i>“I will continue to work here for a while longer,”</i> she says. <i>“Tamani has been very good towards me... and the work suits me.");
	if (kids > 1) output(" Once all of my daughters have come of age, I shall take them to Hdar-Roe, show them their home. From there... they will have their own destiny to choose.");
	else output(" Once my daughter has come of age, I shall take her to Hdar-Roe, show her home. From there... she will have her own destiny to choose.");
	output(" By then...”</i> she sighs, lapsing into silence for a little while. <i>“...It will be my next full year again. And I will have some choosing to do myself. But I shall do it with peace in my heart.”</i>");
	
	output("\n\nHer attention turns by degrees back to you.");
	output("\n\n<i>“You’ll still visit, won’t you?”</i> she asks. <i>“I will come by the nursery when I can, of course. Buuuttt... it would make me vigroful to spend time with you, still.”</i>");
	
	if (pc.isBimbo() || pc.isBro() || pc.libido() >= 75)
	{
		output("\n\n<i>“We can still smash, right?”</i> you ask with a certain anxiety.");
		output("\n\n<i>“Oooof coouuuurrrse!”</i> She touches your face fondly. <i>“Just because I’m no longer fertile doesn’t mean I won’t want to bed my lover from time to time. In many ways, it will be better. There is no goal, now. I will not grow fat and brumdugulous anymore. We can have as much fun as we like.”</i>");
	}
	else
	{
		output("\n\nYou answer that by getting up and going across to give her a big hug. Mmm... that lovely wet marshmallow give, that sweet smell, the harmonious ‘emmmmm’ it draws, the way she gathers you into her generous breasts. Yeah. You’re pretty sure you’ll keep coming back.");
		quaelleHugged();		
	}
	
	output("\n\n<i>“Did you stop by for any other reason?”</i> she asks at last, letting going of your hands to pinch off some vine leaves. <i>“Effivescerent Steele.”</i>");	
	
	flags["QUAELLE_FERTILE"] = 0;
}
public function quaelleReplacedWithDohrahn():Boolean
{
	if (quaelleHasLeft() || quaelleIsImmobile() || quaelleTriggerBirthScene() || quaelleIsRecovering(1) || quaelleSexTimer(1, 6)) return true;
	
	return false;
}