/*Treated as combat with a different menu swapped in. "Victory" is raising your foe's lust to 100. "Loss" is letting it fall below 33 (and them going soft).

Combat start -> enemy ALWAYS gets first round.

AI:
Picks preferred actions if one was picked last turn OR if it is the first round of combat.
Display a hint about one of the preferred actions for next round if a new one was picked.
If a wrong action was picked, play a frustrated hint AND lose lust.

Sucking Actions:
Stroke Cock
Kiss Cock
Lick Cock
Suck Cock
Deepthroat Cock
Worship Cock
Rub Balls
Lick Balls
Suck Balls
Worship Balls

Potential Things That Can Mix It Up:
Your hands being grabbed
Cock being too big for deepthroat & such.
Not being able to deepthroat

Variances for PC "attacks"
Bimbo (sometimes rolled into high lust)
High lust/Libido
Med lust/Lib
Low lust/Lib*/

//Stroke Cock
//Bimbo
public function strokeDatDick(targetC:Creature):void
{
	setTarget(targetC);
	if(pc.isBimbo())
	{
		output("You place your [pc.hands] on [target.short]’s [target.cock] gently, almost worshipfully.");
		if(target.lust() >= 80) 
		{
			output(" It’s so slick with dribbling pre that your palms slip on first contact, but with a giggle and a vapid, horny smile, you simply enjoy its sloppy, soaked state, closing your fingers around " + (target.cocks[x].diameter() >= 3.5 ? "as much as you can":"it") + " and pumping up and down. Lurid squelches blend with your own too-pleased titters as you gleefully jack off [target.short].");
		}
		else if(target.lust() >= 50)
		{
			output(" It’s just so hard! It must ache for your touches, for your strokes. A dick like this needs to be caressed and teased, to be pumped and pleased. Cradling [target.hisHer] [target.cockNounSimple] like it’s a divinely bestowed gift, you set to stroking and pumping it, careful not to grip it too firmly or too softly. A handjob may look like a simple task, but a proper jerk-off requires skilled technique. Fortunately, you spend a <i>lot</i> of time thinking about how best to jerk off all the cute boys and girls the universe has to offer.\n\nYou giggle. This is fun!");
		}
		else
		{
			output(" It’s warm and firm with low grade arousal. You can feel the teltale throb of [target.short]’s heartbeat practically vibrating through its length. With an airy giggle and a smile, you set to jacking it off" + (target.cocks[x].diameter() >= 3.5 ? ", in love with the way it overflows your fingers, how it’s too big to be contained by your meager hands. Pleasing such a massive beast with only your hands will be a challenge, but it’s one you relish.":", pumping with deliberate strokes. Handjobs are just like any other part of sex - amazing and totally worthy of your complete concentration. You almost forget about everything else while you’re working, too caught up the sight and smell of this wonderful dick."));
		}
	}
	else if(pc.lust() >= 70 || pc.libido() >= 66)
	{
		output("\n\nYou eagerly grab [targt.short]’s [target.cock] in your hands and set to work on stroking it. " + pc.lust() < 70 ? "Horny":"Libidinous") + " as you are, you do so with relish.");	
		if(target.lust() >= 80)
		{
			output(" It’s dribbling plenty of pre to coat your fingers, so you make use of it. You rub the slick, musky juices into the tumescent length, absolutely loving how its slipperiness makes your impromptu jack-off so much easier. It’s almost effortless.");
		}
		else if(target.lust() >= 50)
		{
			output(" It’s nice and hard for you, firmly engorged in your fingers. " + (target.cocks[x].diameter() >= 3.5 ? "You can’t quite hold onto all of it, of course, big as it is, but between both your hands, you can get at a lot of phallic flesh. You pump and you squeeze. When it twitches, you twist your grip, and when it throbs you feather it with soft caresses.":"You put every ounce of your own burning desire into pleasing this virile rod. Long pumps up and down hit all the sensitive nerves. One fingered, you rub under the [target.cockHead] to tease a little more pleasure into the tumescent flesh at the apex of your strokes, then settle back in to rapidly squeezing up and down..."));
		}
		else
		{
			output(" Mere contact with genitals has your heart fluttering and your [pc.skin] flushing. You bat your eyelashes and look up at [target.himHer] while you pump and stroke, paying special attention to the spot just beneath the [target.cockHead].");
		}
	}
	else if(pc.lust() >= 40 || pc.libido() >= 33)
	{
		output("You grab [target.short]’s [target.cock] in your [pc.hands]. ");
		if(target.lust() >= 80) output("It’s slick with dribbling pre-cum, so you smear it around" + (target.cocks[x].diameter() >= 3.5 ? ", glad to have it there. You can’t wrap your hands the whole way around a boner this big, but at the very least, you grab as much as possible and tug it off on a curtain of its own lube. The messy secretions froth up from your rapid strokes, and you try not to think too hard about how your hands are going to smell like dick for the foreseeable future.":"massaging the musky lubricant into [target.hisHer] straining skin. Soon, your hands are soaked in [target.hisHer] messy secretions, but you try to focus on pleasing [pc.hisHer] [pc.cockNounSimple] instead of how gummed up your digits are getting."));
		else if(target.lust() >= 50)
		{
			It's rock hard in your grip{, even if you can't quite wrangle the whole thing}.
		}
		else
		{

		}
	}

			