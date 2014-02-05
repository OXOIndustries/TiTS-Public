/*Intro
Combat Description
Attacks
Normal Attack
Constrict
Pounce
Victory
Victory by HP
Victory by Lust
Ride Him
Get Blown
Defeat Sex
Reverse Rape
Intro
*/

//First Time:
function naleenEncounter():void
{
	if(flags["TIMES_MET_MALE_NALEEN"] == undefined)
	{
		output("\n\nAs you walk through the jungles, you do your best to keep alert, scanning for the danger that could come from any angle.  You are certain that you sense movement close to your [pc.feet]. You react as quickly as you can, falling into your combat stance and looking around, trying to establish just what it was that you sensed.");
		output("\n\nAs you do so, something long and sinuous slaps out at you, forcing you to dodge it. You quickly shift back into position as a figure slides out of the undergrowth, revealing itself");
		if(hours < 17) output("in the light.");
		else output("in the starlight.");

		output("\n\nA form not unlike a gargantuan serpent coils before you, readying itself to strike. You realize that this is no mere snake you’re facing, though. Where the head would be instead rises a masculine torso covered in jet black fur, like a panther’s. He has the face of a human man, but covered in short feline fur, and instead of human ears, feline ones jut from atop his skull. They are currently lying flat, complementing the threatening scowl he’s giving you. His messy hair is long enough to reach his shoulders, held out of the way of his golden eyes by a green headband of woven leaves.");
		output("\n\nYour codex chimes to warn you that this is a naleen, an indigenous predatory sapient.");
		if(flags["TIMES_MET_NALEEN"] != undefined) output(" This is the male variety of the species.");
		output("\n\n<i>“Not bad, I love it when prey proves a challenge,”</i>  he says, a hint of a hiss under his breath. <i>“It makes catching you all the more fun.”</i>");
		output("\n\nHe bares his claws at you and growls. It’s a fight!");
		flags["TIMES_MET_MALE_NALEEN"] = 1;
	}
	else
	{
		output("\n\nAs you walk through the jungle you hear a growling nearby. You quickly scan the area for the source and you notice a serpentine form partially hidden in the trees.");
		output("\n\n<i>“Hello again, prey,”</i>  the naleen panther greets you. His face contorts into an angry scowl as he bares his claws at you. Looks like he wants a rematch.");
		output("\n\nYou ready yourself for combat!");
		flags["TIMES_MET_MALE_NALEEN"]++;
	}
	startCombat("9999");
}

//Combat begins.

Combat Description
You’re fighting a naleen: a towering, serpentine predator from the waist down, supporting a chiseled humanoid torso that bears more than a passing resemblance to a feline, with jet black fur and perky feline ears. His messy hair hangs loose down his shoulders, held by a headband of woven leaves. He scowls menacingly, baring his razor sharp claws at you as he studies you, his coils primed for a pounce the moment he catches an opening.

Attacks
Similar AI and weakness to the Naleen Huntress. A bit less agile, a bit stronger. Basically more Tanky than the Naleen Huntress.

Likes/Dislikes:
Feminine faces: Kinda likes!
Big butts: Really likes!
Small butts: Kinda likes!
Big breasts: Really likes!
Small breasts: Kinda likes!
Penises: Dislikes!
Big masculine endowments: Dislikes a lot!
Multiple sex organs or breasts: Kinda likes!
Hypersized attributes: Kinda likes!
Gaped orifices: Dislikes!
Tails: Really Dislikes!
Tail genitalia: Dislikes a lot!
Lactation: Kinda Likes!
Baldness: Dislikes!
Long hair: Kinda likes!


He will start out by using his claws and constrict move to attack, once he is below 75% of his health, he’ll also randomly poison the PC.

If below 60% health, he’ll start using his pounce attack with a low frequency.

If below 30% health, he’ll basically spam his pounce. 


Miss: The naleen slides out of the way of your attack, serpentine body coiling upon itself with serpentine speed.

Block: The naleen deflects your strikes with quick strikes of his own, effectively parrying your attack.

Normal Attack
//instead of a double attack, this one uses a more powerful single blow.

The naleen quickly slithers your way, using his serpentine body to gain altitude and maul with a vicious downward strike!
	{standard dodge/miss messages}
	Hit: You manage to fall in a defensive stance just in time, yelping in pain as you are forcibly struck by his razor-sharp claws.

Constrict
//Grapple, must struggle to escape. If the Naleen’s HP is <= 75%: Randomly apply a dose of poison. He will ONLY poison when you are held within his coils.
 
	The naleen lunges at you, but you nimbly dodge the attack. However, before you can blink, you feel his leathery scales coursing across your body as he moves around you, squeezing tight! Your breath is knocked away, and in a moment you're seeing stars!
	Fail to escape: You groan in pain, struggling madly to escape the brutal confines of the naleen's coils. He grins down at you with a predatory glint in his eye, baring his fangs….
	Constrict: The naleen grins predatorily, constricting his lower half in a painful vice. You groan as well as you can under the pressure of his bone-crushing coils.
	Poison: His coils tighten ever so slightly, further immobilising you. With a menacing growl he exposes his fangs and {bites the exposed skin near your shoulder} {bites, punching through a thin spot in your [pc.armor]}. You yell as you feel his venom pumping into your bloodstream. Ceasing your struggle momentarily, your thoughts become hazy and your movements sluggish; suddenly the idea of surrendering to this powerful male’s coils doesn’t sound like such a bad idea….
	If he’s unable to bite you somehow: You gasp as his coils tighten ever so slightly, further immobilising you. With a menacing growl he exposes his fangs and moves to bite you. Thankfully he’s unable to bite through your {[pc.armor]}{[pc.skin]}. With a frustrated growl, he tightens his coils once more. You groan in pain as the tightness forces the air from your lungs.
	//Deal damage instead.

	Escape: You feel his coils loosen ever so slightly under your struggle, and you press your advantage. With a mighty push, you extract yourself, leaving him to futilely grasp at the air.

Pounce
//If PC is shielded, deal some damage to the Naleen too.
//Deals Heavy Damage, is a bit easier to avoid than his claws.
//Meant to hurt the PC’s health rather than their shields. Is there a way to amplify HP damage and reduce shield’s damage?

With a snarl ending in a hiss, he launches to the air. He strikes at you with claw and fang in a mighty pounce!

Miss: You quickly get out of his way as he impacts the ground where you were mere moments ago. You step back, narrowly avoiding his sweeping snake half as he uses his momentum in an attempt to trip you.

Hit Shield: You yelp as you are brought crashing down onto the ground. Luckily your shield seems to have taken the brunt of his blow. You push him off, watching as he flops on the ground with a pained yowl. He quickly gets back on his coils, though it seems like he didn’t get out of this unscathed.

Hit: You yelp as you are brought crashing down onto the ground. Without shields to protect you, you are left to struggle against his slashing claws and bites. You eventually manage to push him off you, but not before taking significant damage.

Victory
Victory by HP

The naleen struggles to lift his torso from the ground, too beaten to do anything but glare defiantly at you as he tries to slither away.

{if Kind:
You watch him from a distance, putting your weapons away now that he’s beaten. A curious sight does catch your eye, though. His twin reptilian cocks are standing at half-mast; seems like he found the fight enjoyable. Maybe you should do something about that?

[Leave]
You’ve probably done enough already. You turn to leave, shooting him a victorious grin as you go.
}
{Mischievous:
You smirk confidently, looking down at his defeated form. Suddenly your eyes catch a most curious sight. Seems like someone’s enjoyed your little dance a bit too much. His twin reptilian shafts are standing at half-mast, emerging from a nearly-concealed genital slit located just below where his feline half meets his snake half. Whatever are you going to do about that? 

[Leave]
Too bad you’re not really in the mood right now. He’s one lucky cat... or maybe not so lucky after all? You motion a small farewell to the prone naleen and move away.
}
{else: //Hard
You glower at your defeated foe, strutting confidently towards him as he growls and tries to slither away. As you look him over and decide what you should do, you cannot help but notice the slut’s getting hard. Twin reptilian peckers emerge from a nearly concealed slit located right between his feline and snake halves. Seems like you are not quite done with this one yet.

[Leave]
You kick his tail away and tell him to scramble. You don’t have time to waste with wimps like him.

The naleen turns and slithers away as fast as he can, before you can change your mind.
}

(Display Options)
Victory by Lust

He immediately stops trying to fight you and sits back on the ground, furiously masturbating his bulbous pricks. They emerge from a nearly-concealed genital slit located just below the border between his feline half and serpentine end.

You watch his erections and his furious hands with a pang of pleasure; teasing a naleen into submission is quite a feat for most people, after all. Hmm… he’s not exactly hard on the eyes; maybe you could help him get off?

(Display Options)

Ride Him
//Requires PC has at least one vagina and not taur

You feel your own desires peak as you look over your quarry; you know exactly what you want to do with him. But first, you need to secure him, just in case he gets any bright ideas about those claws of his.

Procuring a nearby vine, you roll the naleen onto his belly, pinning him to the ground as you forcefully tie his hands behind his back. Satisfied that he won’t be using those sharp claws anytime soon, you roll him over once more and take a good look at him.

You've caught yourself quite a fine specimen here. His features are attractive; masculine, but not overly developed, giving him smooth, clean lines. Atop his head are his cat-like ears, which flick from time to time as he watches you through defiant, golden eyes. He growls softly as you examine him with just a hint of a hiss under his breath.

Drawing yourself up to your full height, you {place your [pc.foot] atop his chest, pushing down firmly with enough weight to make yourself felt without hurting him}/{coil your [pc.legs] around his chest, trapping him within the bindings of your own coils}. 

{if Hard:
Glowering down imperiously from on high, you demand he lower his eyes and show you proper respect.
}

He huffs and turns to look away.

Despite his reaction, you watch with amusement as you notice his soft-barbed dicks {if defeat by HP: throbbing as a bead of pre begins to form on their twin tips.}{else: throb in excitement as a large dollop of pre forms on their twinned tips, sliding down his lengths as he makes his excitement clear.}

{if Hard:
With a smile, you compliment him on being such a good bitch and understanding his place. 
}
{Mischievous:
Well, that’s frankly quite flattering. One can only hope to have this kind of effect on such a fine looking kitty as him.

He glances at you momentarily before looking away. If it weren’t for his black fur you’re certain he’d be blushing in embarrassment. Cute.
}
{else: //Kind
You tell him that as long as he doesn’t give you a reason to hurt him, you won’t. Plus you’ll make it feel good for him too.

Your only reply is a grunt of acknowledgement.
}

On a whim, you {move your [pc.foot] back against the exposed flesh and begin to stroke one of his dicks, feeling the surprisingly soft barbs bend and flex as you run your foot over them}{bring up the very tip of your tail and start to stroke his cocks with it, coiling it into a perverse figure eight, running over soft, pliant barbs and feeling them tickle across your scales}. He groans as you do so. 

Some predator he is, getting off on being utterly dominated by his <i>prey</i>. You tease him for being so accepting of your advances. He glares menacingly back at you, growling even louder.

{Hard:
Ah-ah! You chide him to play nicely, or else, {grinding your foot into that one dick even harder}/{coiling tighter around his oozing pricks as you give them a nice, hard squeeze}, though not hard enough to actually hurt... yet.

He grunts in understanding as he lays down and begins to relax, acknowledging that he’s at your mercy.
}
{Mischievous
Now, now. If he doesn’t play nice, you might have to do something you’ll both regret. So he’d better get over himself and submit. Plus he seems to be enjoying himself too, you tease.

He grunts in pleasure as you give his shaft a firm stroke with your [pc.foot], his doubled spurts of pre signalling his undeniable enjoyment as he calms down.
}
{else: //Kind
You warn him against fighting back. He obviously wanted sex with you. All he has to do is lie back and you can both enjoy it.

He scoffs at first, but after a moment to think he decides that to play along. With a nod of understanding he quiets down. You give him a congratulatory stroke on with your [pc.foot], earning a pleasured sigh from the increasingly aroused, alien naga.
}

That's better. Lowering yourself down until you are straddling his waist, just above where his cocks emerge, you feel one {rubbing against your [pc.ass]}/{pushing against your [pc.nagalegs]}.  Once in position, you drag yourself up his body, sliding your [pc.vaginas] {and [pc.balls]} over his form, revelling as his soft fur tickles you, slipping over his firm, defined muscles until you are resting on his collarbone with your [pc.vaginas] hovering above his face. "Lick," you demand before warning him that you had better not feel so much as a scratch from his teeth.

He hesitantly extends his tongue to give [pc.oneVagina] a tentative lick, then another, and another.

You shudder a little as his tongue's touch sends the most delicious tingles up your spine, but stay quiet, casting a stern gaze down at him to make sure he continues.

You feel his tongue circling your labia, teasing your [pc.clits], then backing down as he licks your opening. As moisture gathers, he eagerly laps it up.

Amusement mingles with your pleasure; the once-stern expression on the naleen's face has softened, swept aside by his concentration on the task so literally in front of him. You reach down with one hand and caress his head, scratching gently between his ears, smiling as you praise him for his efforts.

He begins purring, sending rumbling vibrations through your canal. Slowly he inches closer, lifting himself slightly off the ground until his nose bumps against [pc.oneClit]. You moan appreciatively, bucking slightly as you encourage him to go faster.

His tongue is a blur on your [pc.vagina " + x + "], earnestly licking all around and inside you with apparent hunger, quite a turn from the previously hesitant feline-snake.

The pleasure washes over you; if you were to let him, why, you could probably cum from just this alone... but you don't feel like letting him just yet. Instead, you steel yourself and pull away from his face and questing tongue, dragging your now-slick and dripping cunt back over his belly towards his loins. {It's empty sister{s quiver/ quivers} needily, but you only had time for one tongue-job.} His dicks are hot and damp as your netherlips touch them, soaked in pre-cum wrung from him whilst he was lavishing his attention on your cunt before. You grind back against {one/them}, tantalisingly brushing {its/their} rubbery nubs against your outer lips but not actually allowing {it/them} to penetrate you. You look down at him with imperious regality from your perch, waiting to see what your little pet will do now.

He tries to move himself so he can properly align himself with your entrance{s}, but a menacing glare quickly stops him on his tracks. Writhing with eager need, the naga does his best to entice you before his bindings arrest his movements. With nothing else to do, he looks at you, panting, and then he whispers, “P-please….”

You tilt your head slightly. What did he just say? You didn’t catch that right.

“Please, I need-” he catches himself mid-sentence, swallowing audibly. “Please,” he begs.

Well, how could you refuse such a request? You take hold of his barbed {prick and align it with your opening./pricks and align them with {two of }your entrances.}

“Ah, yes….”

Slowly you begin sliding down {its length/their lengths}.

“Yes!”

You moan as {it spears/they spear} inside of you, {its/their} flexible bristles sending sparks of pleasure coursing along your nerves as they caress your inner walls. Down and down you sink over inch after inch of thick, textured naga-cock.

“Yes-sssss!” he hisses, as you finally bottom out. His face contorts in equal parts relief and pleasure.

//CHECK VIRGINITIES HERE!

You groan lustily, clenching down and feeling {their/its} hot, hard length{s} inside of yourself, savoring the soft barbs as they caress your inner walls. Mustering your strength, you raise yourself upwards and then slam yourself back home again, setting a quick and passionate pace that sends shivers of pleasure through your sopping-wet womanhood{s}. Again and again, you bounce atop his scaly body, working his purplish prick{s} with libertine enthusiasm, caring only for the way they feel inside you and praying that he doesn't get off before you do.{ His unused dick threads through the crack of your [pc.butt] like the sinuous snake that it's attached to, leaking in between throbbing pulses of excitement.}

Soon enough he starts bucking against you, his body now moving on full, biological automatic. His coils thrash against the ground as he erratically thrusts into you, flattening plants and digging deep furrows into the ground. He yowls and mewls in a crescendo as he escalates towards the peak of his pleasure. You grab hold of his shoulders for stability and ride him like a ship in a storm, only the crests of these undulating waves make your [pc.vaginas] sizzle with drippy, leaking bliss.

You clamp down with your [pc.vagina] for all you're worth, losing yourself in the sheer pleasure you're feeling. The electric sparks his nubs tease from your misfiring nerves make it difficult to do anything but groan and bounce, your mind entirely filled full of fuck and need. You are getting so close that you can feel little else, and with all the bubbling pre drizzling out of your slit{s}, the naleen appears equally close. Each wet slap of flesh on flesh could be the one that brings one of you off. Each shuddering sigh of bliss could be the signal of an impending orgasm. Both your bodies are quivering with palpable need, and any second now, one of you is going to cum.

Ultimately, the naleen finishes first. With a yowl that quickly dissolves into a hiss, he thrusts upward, bending his back with inhuman flexibility as he unloads all of his cat-snake cream into into your juicing cunn{y/ies}. Jet after jet of warm jism plasters your walls as his thrashings slowly fade into weaker and weaker twitches. Every ejaculation seems to rob him of strength until his body is still and his members are dribbling virile spunk into your creampied snatch{es}.

Luckily, the feeling of hot spooge pouring into your receptive, quivering entrance{s} is the last stimulant you need. Your [pc.vaginas] clamp down with all their might, instinctively trying to hold as much of his cum inside of you as possible while your climax rocks you. You fling back your head and cry out in pleasure, oblivious as {[pc.eachCock] spurts/sprays/gushes/cascades [pc.cum] onto his belly and chest while }[pc.eachVagina] gushes and drools, washing his loins with your own female orgasm. Your interior muscles rhythmically clench and squeeze with excited trembles. Each time you gasp and moan, riding your orgasm long past the end of the naleen's quick cum.

You take a deep breath, finally able to relax after getting your rocks off, and lick your lips in contentment. It takes a moment to extract yourself from your naleen partner's many coils, but when you do, a stream of mixed juices drips down from your well-used hole{s} and down onto his slowly receding, purple cocks.

“Now that wasn’t so bad, was it?” You say with a superior look.

The naleen is openly purring, eyes closed as he enjoys his afterglow. Looks like he’s on the verge of taking a catnap.

{if Kind / Mischievous:
You roll him on his side and undo his bindings before giving him a soft pat on the head.

“Thank you…” he exhales in an exhausted whisper, momentarily opening his eyes to gaze at you.

Satisfied, you don your [pc.gear] and leave him lying on the jungle floor.
}
{else: //Hard
You look at the lazy cat-snake. Off to nap already. You ponder if you should even bother releasing him at this point.

[Release][Leave]

[=Release=]
You roll him on his side, undoing his bindings and leaving him to pass out on the ground.

Satisfied for the moment, you don your [pc.gear] and leave him lying on the jungle floor.

[=Leave=]
He’s a big kitty, he can take care of himself.

You put on your [pc.gear] and leave the naleen to fend for himself.
}

//If the PC can get pregnant by naleens, this is probably an appropriate time to make a conception check, Fenoxo//

Get Blown
//Requires PC has at least one penis

Looking between your would-be assailant and your crotch, you decide there's only one thing to do in this situation. Turnabout is fair play, after all, but first, you had better see about securing his hands. You don't want any nasty little surprises if he gets a second wind, after all. With plenty of nearby vines, finding something to bind his hands is as simple {as a bodyguarding job/as a borderworld smuggling run/as a drive calibration}.

He glares at you, growling defiantly as you gaze down upon him. 

{Hard:
You deliver a slap across his face, immediately silencing him. You remind him of his position, and warn him that unless he fancies being left helpless for the zil, he had best cooperate.

He looks away; it’s clear that your slap hurt his ego more than it hurt him. When he gazes back at you, you observe he seems much more mellow and accepting. Good.
}
{Mischievous:
You warn the little kitty to play nice. You took him down once already, and you can take him down as many times as you need. So he might as well as be good a boy and save you both the trouble.

He looks away with a scowl, but otherwise seems compliant. Now that’s much better.
}
{else: //Kind
You simply continue to look down at the him, not reacting to his threatening growl at all.

He tries to struggle against his bindings, but you pin him down by his shoulders. Your message is clear, either he stays quiet and lets do your thing or you’re not budging and neither is he.

He snorts in frustration, but after a few moments he decides to comply. You release him as he goes slack, patting him on the head for his cooperation.
}

Now that he’s calmed down you’re free to secure his hands behind his back so you can start with the fun stuff. After all, he seemed pretty intend on doing this kind of stuff to you. He's probably more upset about being on the bottom than he is about the sex. Stepping closer to him, you adjust your [pc.gear] to expose your {half-erect [pc.cockNounSimple], letting it wave in the naleen's face} / {[pc.cocks]. Then, you take your [pc.cockBiggest] in hand and wave it in the naleen’s face}. He considers it for a moment, but you command him to lick it before he can give any response.

He nervously extends his quivering tongue, giving your [pc.cockHeadBiggest] a tentative lick, barely tasting you.

With a click of your tongue, you push your dick against the naleen's face, rubbing it along his cheeks and under his nose, forcing him to inhale your masculine scent even as you instruct him to try again, and lick properly this time.

Nodding reluctantly in understanding, he looks up. The aggressiveness he once spouted has been completely replaced by compliance. Extending his tongue once more, he tries his best to lick the underside of your [pc.cockBiggest]. Though he is earnest in his attempt, there’s only so much he can do whilst lying prone and helpless. The warm pressure of his tongue against your length is pleasant nonetheless.

With a better blowjob in mind, you set out to remedy his subpar positioning. Uou pull him upright by his muscular shoulders, settling him against a nearby tree so that he'll remain upright in spite of his restraints. Then, you straddle his chest and stroke his ears. That’s a good kitty. Now, if he wants to keep being a good boy, he needs to keep licking. You present him with your [pc.cockBiggest] once more, admiring the way his saliva has made it shine.

Detecting just the faintest hint of what might be a purr, you smile as he noses your throbbing shaft. He sniffs you softly, taking in your scent as he extends his tongue once more. Though his movements are slow, you notice that he seems to be more eager than before. Perhaps the erotic contact and scent of your [pc.cockBiggest] is starting to get to him?

He takes his time lapping along the underside, the sides, and even the top of your shaft all the way from the [pc.sheath " + x + "] to the tip. A bead of pre form on your [pc.cockHeadBiggest] and is eagerly swiped by the naleen’s feline tongue, drawn deep into his rumbling throat.

You purr in pleasure as his tongue caresses your sensitive flesh, your [pc.cockBiggest] growing harder under his ministrations, rewarding him with ever-more pre-cum to lap up. Unable to remain passive, you start to buck against his tongue, rolling your shaft along the hot, wet length of his caressing muscle until you find yourself almost accidentally thrusting against his lips, dragging your [pc.cockHeadBiggest] back against them, leaving a trail of shining pre in your wake.

You continue your soft motions until - with a gasp of surprise - you finally find yourself inside the naleen’s warm mouth. He looks strangely pleased, pursing his lips over [pc.cockHeadBiggest] and beginning to suckle it like a teat. His tongue, not missing a beat, begins circling around it, pushing against your cumvein as you hiss in pleasure.

Squeezing with your [pc.legs], you pull back slightly, just enough to keep your cock out of his mouth, well beyond his reach. As you do so, you praise him for getting into the spirit of things; he's doing very well.

\“<i>Please, can you…?</i>\” he pleads.

You look at him in confusion.

\“<i>My hands are tied,</i>\”  he says, struggling against his bonds.

Looking over at your former foe, you turn your head back to see just how horny his submission has made him. He's panting slightly with frustrated lust, both cocks jutting forth hard and firm from his loins, already dripping with his desire.

If you were feeling generous, you could give him some relief. Maybe you could use your hands, or maybe you could let him take your ass. {PC has a cunt-tail: Better yet, you could give your [pc.tailgina] an orgasmic snack.} Then again, he did attack you. You could just ignore him and get yours.

[Ignore] [Handjob] [Ass] [CuntTail]
//Display CuntTail option only if PC Has CuntTail= True//

[=Ignore=] 
You simply shake your head and inform him that you won't. You'll cut him loose once you finish, you promise, but right now, this is your time. He should be a good little pet and get back to licking - the sooner you're done, the sooner he can go free.

He nods in understanding, closing his eyes and opening his mouth. His tongue extends like a landing pad, ready to receive you. You’re more than happy to oblige.

You clasp your hand around your shaft, stroking it a few times to ensure you are fully erect before aiming it at the naleen's open maw. Smoothly you brush it along his warm, wet tongue, gliding inside his welcoming mouth{!Hyper: and pushing in until you have hilted yourself}. {PC has hyperdick: Despite your inhuman size, the naleen's mouth just seems to keep stretching around it; evidently, it's not just his tail that's snake-like. Soon, your [pc.sheath " + x + "] is pressing hard against his lips thanks to the body-filling blowjob you're receiving.}

Straining to gulp around your entire length, the naleen closes his eyes. You feel his {if PC is small: lips} {else: throat muscles} grip down against you from all sides, stroking you pleasurably as they attempt to draw you deeper, and can’t help but wonder at how well practiced he is at this.

There's only one way to find out…. You start to thrust your hips back and forth, sliding your cock in and out of the warm, wet velvet of his mouth, moaning at the feel of him wrapped so tightly around your shaft. Your rhythmic motions are effortless; it feels like kitty-snake lacks even a hint of a gag reflex.{ Not even your immense [pc.cockBiggest] seems to bother him. You can clearly see it outlined in his throat. Just how stretchy is he?} You gradually become aware of his tongue's movements slowing before going entirely slack beneath you.

Hungry for more, you tell him to get back into it.

He furrows his brows, but complies with your order. Slowly he works his tongue around your {impressive }girth, drooling around your [pc.cockBiggest] as he tries to swallow.

<i>\"That's a good boy,\"</i>  you note, even as you pick up the pace of your thrusting. Now that you've seen how well he can handle it, you can start throat-fucking the oral cocksleeve in earnest.

The naleen's tongue coils and twists, wrapping up your " + pc.mf("man","herm") + "-meat even as you thrust it deep into his mouth and pull it out again. The heat and the friction send the most delicious sensations across your body. Growling like an animal, you fuck him as hard as you can, and your new bitch-boy seems to get off on it. You can feel him purring, vibrating your [pc.cockBiggest] in his throat, each pleasant rumble sending sparks cascading through your mind. You dimly feel yourself petting his ears, giving him an idly affectionate scratch as you continue to piston your hips.

His brow softens a bit, and you feel him twisting slightly to lean in against your caressing hand. His purring intensifies slightly and his tongue begin stroking you a little more vigorously, pumping along your length. Between his mouth and the squeezing oral appendage, it becomes difficult not to immediately climax. The sensations are something akin to fucking a hot, wet passage while a smaller sleeve moves along your length, stroking to its own tempo. Your [pc.hips] lurch jerkily as you try to maintain your rhythm. Somehow, you hold on, thrusting with powerful, firm motions as you try to ignore his tongue's rampant tugging.

You gasp and moan, feeling the last of your resistances crumble beneath his added onslaught of pleasure. With an ecstatic cry, you plunge your shaft into his mouth one last time, completely hilting yourself as you erupt in orgasm, spilling your [pc.cum] down his throat{ until his belly bulges {slightly/hugely/obscenely}}. Gasping for breath, you heave a huge sigh as you slump against him, absently pulling your semi-flaccid shaft from the naleen's mouth.{{ Your other wilting length/ Your other wilting lengths} did a good job of splattering his fur with [pc.cumColor] streaks.{ There's even a puddle forming underneath him, staining his long, wriggling tail with your [pc.cum].}}

He gasps and coughs, some of your recent deposit drooling out of his mouth along with his saliva. “Can you let me go now?”

{Kind / Mischievous: 
{Mischievous: Well, you are tempted to leave him and see how long it takes him to break free, but you don't have time for that.} You nod absently and clamber off of his chest, pulling him into a position where you can remove the vines binding his wrists. Gathering your gear, you turn and start heading off, leaving the now-free naleen behind you.

Before you are out of sight, though, curiosity prompts you to look back. The horny being is busily wiping off some of the semen he spilt down himself during your coupling, applying it to his own dicks as makeshift lube and jerking himself off furiously. You chuckle at the sight.
}
{Hard:
[LetGo][Refuse]

[=LetGo=]
You nod as you get off of him and roll him on his side so you can get to his bindings.

You’ve barely released him and the slut is already masturbating. The horny cat-snake wasted no time getting his paws around his peckers to pump himself to orgasm. Honestly, it’s kind of amusing, however you’ve no time to waste. You put on your [pc.gear] and leave the cat to his devices.

[=Refuse=]
You shake your head.

“What!? But I-”

You silence him with a finger.

If he didn’t want to wind up tied in the middle of the jungle he shouldn’t have challenged you. He’s a big kitty. You have no doubt he’ll find a way to release himself.

You chuckle as you step away from the cursing feline. He vainly tries to reach for his bindings with his claws, but in his current position this is more than a little difficult. Well, you got yours, so there’s no point in sticking around. You don your [pc.gear] and leave the thrashing cat-snake to his own devices.
}


[=Handjob=] 
Well, since he's being so enthusiastic about it, you suppose it wouldn’t hurt to give him a hand. Reaching back behind you, your fingers close around one of the naleen's lizard-like pricks, feeling the lumps adorning his shaft against your palm as your hand encircles it and makes the first stroke.

He lets out a hiss of pure pleasure, idly humping your hands as you tease the soft swollen bulbs of one of his shafts.

With a smirk you squeeze just a little tighter, enough to be firm but not painful, and start to stroke again, languidly drifting up and down his length, your fingers locked around him all the while. “Ah, yeah…” you hear him whisper airily. His hips move slowly, tentatively at first, before he begins to thrust at a desirable pace.

Since you're going to be nice, he's going to have to get off before you can. With this realisation, you release his dick and swivel around on his chest so that you're facing his twin shafts. Now seated less awkwardly, you reach forward and take hold of his prick once more, this time you grab the second one too, teasingly caressing them with your fingers before squeezing them just right and starting to pump. You time yourself so that when one hand is stroking down its shaft, the other is stroking up the other.

The naleen starts panting at that, a yowl of pleasure escaping his lips as you hear - and feel - the rumbling purring on his chest. Seems like he’s enjoying himself! Perhaps he's imagining a pair of lovely females, one on each of lengths, bouncing up and down to a fast, alternating tempo.

Grinning to yourself, you press your advantage, stroking faster and faster, erratically squeezing and releasing his shafts in order to heighten his pleasure. Beads of pre-cum well from each tip, oozing down over your fingers, and you happily gather up this impromptu lube in order to increase the smoothness with which your hands fly over his dicks.

By this point your former foe has been reduced to a mewling, moaning pile. He struggles futilely against his bindings with each yowl you draw from his lips. His hips thrust furiously against your hands, beads of pre flying off his twin reptilian pricks with each messy slap of cock on cock on hand. His throbbing along with the rising desperation in his voice make it clear that you don’t have long before he blows.

That, naturally, only spurs you on, and you continue to piston away with your hands until he finally loses control and climaxes. You lean back to avoid being splattered, even as your hands are covered in his seed. You settle back, giving him a moment to catch his breath. He purrs, eyes closed in a happy smile as he leans back to get comfy against the tree.

“Thanks, I really needed that,” he says, idly licking his lips.

Shifting back to face him once more, you tell him that means it's time for you to get off. As you say this, your hand starts stroking your own erection, to start lubing yourself up with the naleen's own cum.

“Oh, right," he swallows, still panting. “S-sorry, but I’m a bit tired after that.”

What? You got him off and he’s not even going to have the courtesy of returning the favor? You might as leave him for the zil if that’s the case.

“No, wait! I’m sorry… I suppose you could just use my mouth?” he suggests.

That will do, you tell him. \"<i>Now open wide....</i>\"

As he does so, you waste no time in sliding your jizz-slick and leaking [pc.cockBiggest] home, feeding it into the naleen's unresisting mouth until you have hilted yourself inside of him. {His throat bulges around your hugeness, but he seems totally unphased by it. Clearly there's more than a little snake in this kitten.} His fatigue shows in that he makes almost no effort to assist you beyond trying to keep his mouth sealed around your cock and giving you the occasional lick; it's like fucking an onahole. Still, not one to be stymied, you continue to hump his face until you can feel your climax approaching.

Your dick pops wetly from his mouth and you give him a second or two to realise what you have in mind before you point your [pc.cockHeadBiggest] at his face as you stroke yourself over the edge, erupting in a spray of [pc.cum] all over his face{ and chest{ and stomach}}.

Sighing in contentment, you slide off of the naleen, casually rolling him onto his side so you can undo his bindings. As you start making your way again, you turn back to see what he's doing with his new freedom. You can't resist smirking to yourself when you see he's still where you left him, lazily licking his face clean as best he can.


[=Ass=] 
You look at the strange half-cat, half-snake humanoid and a wicked idea comes to mind. Reaching back, you squeeze the cheeks of your [pc.butt], spreading them apart to reveal your back passage, telling him that if he can reach it, you'll let him put it in.

Furrowing his brows, he begins adjusting his coils, humping the air to get some leverage so he can bend far enough to align one of his cocks with your pucker.

You encourage him to keep at it, lust starting to grow as it becomes clear that he really can fuck you and suck you at the same time.

He grunts with effort as he nears your ass. You have no doubt that this position will put quite a bit of strain on his back, but that’s not your problem. If he wants some, he’d better come and get it.

The naleen manages a few thrusts against your [pc.butt], but his awkward position means he can’t aim all that well, so he winds up poking your cheeks with his bulbous pricks. You find yourself laughing as he tickles you with his tips. The look on his face is absolutely priceless. A mix of frustration and desperation; you tease him by rooting him on and patting him encouragingly.

Try as he might, though, it's clear he just can't get anywhere, not in his present state. Turned on as you are, now, the idea of letting him give up is unacceptable; you want his cock in your ass and your cock in his mouth! Reaching back behind you, you feel for his manhood, closing your fingers triumphantly around the hot, wet, bulbous flesh. You give him a tender caress, and then guide the chosen dick towards your asshole, aligning its tip with your opening.

Your captive naleen thrusts into your hand in excitement, which causes his cock to escape your grasp and brush along your [pc.butt]. You scold him for his impatience. If he doesn't stop and let you do what you need, he's not going to get anything.

Nodding submissively, he complies immediately, letting you grab one of his snake-dicks and bring it closer. He doesn’t make a single move, just letting you guide him until you feel his tip press against your [pc.asshole]. See? Isn’t it much easier when he cooperates?

<i>\"Now,\"</i> you tell him, \"<i>go slowly; you want to savor this….</i>\"

Straining to control himself, he begins pressing the tip of his shaft into your [pc.butt]. You purr in anticipation, waiting for the delicious feeling of being speared open. At first it’s just a small pressure; he dares not thrust inside you. Instead, he resolves to smear your opening with his pre.

You chastise the naleen; you told him to go slow, not to just sit on his ass doing nothing.

Swallowing and furrowing his brows in concentration, he nods, and finally, he begins the slow process of spearing your bowels. Pressure is applied once more, but this time he doesn’t stop. Slowly, your sphincter conforms to the shape of his tip, allowing him entrance{, not that there was much conforming for you to do, gaped as you are}.

With a soft sigh of pleasure you release his shaft, confident that he can continue feeding it inside of you now. You can feel his other purple prick on {your lower back}/{the underside of your tail's base}.

His entrance is slow, almost grudgingly so. Whenever he meets with resistance, he stops in his tracks and wiggles a bit to loosen you enough so he continue to press inside you. In a few moments, you feel the touch of his scaly snake half, and you smile knowing he’s fully hilted inside you. He lets out a grunt that easily devolves into a purr of enjoyment as you grip around his bulbous base with your sphincter.

//BUTTGINITY CHECK HURR!

You arch your back and moan in pleasure, praising the naleen for how good he feels inside of you, instructing him to thrust slowly, to let you feel him massaging your insides with his wonderful snake-cock. If he does well, you promise, you'll reward him. In fact, you have something for him now, so he'd best open wide….

Smiling eagerly, he licks his lips and holds his maw open for you, his feline tongue slipping past his lips to lightly lick at your [pc.cockHeadBiggest], enticing you to give him his prize.

And give his prize you shall. Slowly, you start feeding your [pc.cockBiggest] into his mouth, feeling its velvety wetness engulf you as he swallows inch after inch.{PC has HyperDick: Even your immense size doesn't stop him. The naleen is able to smoothly gulp down your monstrous shaft without pause. Even the slow distention of his neck doesn't arrest his efforts.} 

Finally, when you've been taken to the hilt, you moan in pleasure, both from the feeling of his throat wrapped around your prick and from the sensation of his cock as it slowly pushes in and out of your [pc.asshole], the bulbs covering his length stimulating you almost like anal beads, his other prick dripping hot pre-cum down the crevice between your cheeks and lubing his strokes.

You slide back, drawing your cock from his mouth and pushing your ass harder into the naleen's cock, then thrust forward again, feeling his mouth and throat stretch around your {huge }dick with effortless ease. Nerves afire with pleasure, you continue to thrust and grind, absently ordering him to go faster now.

He eagerly complies, speeding up his pace until you can hear the soft squelching of your ass being taken by his reptilian member, a deliciously lewd noise that encourages you to do the same to feline mouth wrapped around your own [pc.cockBiggest]. Whenever he thrusts into you, he hits your prostate, and you moan, instinctively pumping into his eager mouth. He purrs as he feels you feed him more of your delicious rod. The rogue vibrations send sparks of pure enjoyment up your spine, which makes you spurt a fresh gob of pre into hungry throat. As the electric pleasure dissipates, you instinctively clench your ass, drawing a pleasured grunt from your naleen partner, and he thrusts back into you.

The two of you continue in this endless cycle of pleasure like a well-oiled machine.  You can feel the tightness of impending climax welling up {within your [pc.balls]}/{at the base of your spine}, and you ride the wave of pleasure as it surges through your body towards its crescendo as best you can. A blissful cry tears its way out of your throat, promising the naleen that his reward is coming, commanding him to ravage you.

As if he needed further invitation. He slams himself into you, all in one thrust, slapping your back with his snake-half as he sets about quickly pumping in and out of you. His pre, having pooled inside you, leaks from the seal of your ass like a perverted stream of pleasure. You don’t go easy on him either; you hold his face flush with your crotch, having fed him the entirety of your length. He struggles against his bonds, his throat giving you an impromptu massage as he licks and swallows. It’s all too much to bear, and without warning, you cry your pleasure to the heavens.

You surrender yourself to the sensation as [pc.cum] floods from your shaft into his waiting belly{, which begins to swell {hugely }as you flood him with your seed}, riding a wave that shows no sign of ending. His cock grinds against your prostate and stretches your ass, keeping the feelings growing stronger even as you empty yourself into him.

Rewarded with delicious [pc.cum] and having a {huge, }throbbing dick shoved all the way inside him, he contentedly slams your [pc.asshole] with his throbbing snakehood. With a purring gurgle, you feel him flooding your backdoor with his alien fuckslime. Spurt after warm spurt of fertile seed inflams you and stokes the fires of your lust. Similarly, his left-over shaft spurts against your lower back, drenching your {tailbase} and your [pc.butt] with his cum, washing you with a lewd layer of sticky release.

You cry out again as your climax winds down, washing through your body with a last wonderful spasm of pleasure and warmth, finally allowing your [pc.cocks] to go limp. You slump atop him, gasping for breath and then, pull your shaft free of his mouth.

He goes absolutely limp, tongue hanging out of his mouth, which seems to have been stuck in a huge ‘O’ shape. His cock is still buried deep inside you, no doubt being held by its bulbous shape.

With a whimper of delight as it tickles your sensitive flesh, you wiggle and squirm atop of him, eventually pulling yourself free, feeling a hot cascade of jism flowing down your [pc.thighs]. Looking at your partner, you note he seems to be unconscious, and you promptly slap his face hard enough to snap him from his stupor. He blinks blearily at you until you present your cum-dripping ass to him, commanding him to clean up his mess.

Barely aware of what’s being asked, he extends his tongue, licking your butt clean of his seed. You gasp as his cold nose wedges itself into your ass-crack, licking the slowly trickling stream of white escaping your used hole. You moan at the feeling of his warm tongue, cleaning up your insides.

Pleasant minutes pass before his tongue rolls away, and you no longer feel seed dripping from your ass. Straightening up, you turn back to him, praising him for the good bitch he is, only to find he's almost asleep on his... well, tail. You give him a soft pat on his snout, and he actually collapses then and there, snoring faintly as he does so. With a smile, you free him from his vine bondings, gather your gear, and leave.

[=CuntTail=]
Well, this just seems like a perfect opportunity. Your [pc.cuntTail] writhes eagerly through the air behind you, its obscene tip opening up as you place it over one of his dripping shafts and start to greedily swallow it. You moan as the sensations hit your brain, feeling his long, rounded dick spreading your tail's pussy wide and plunging deep inside of you, pushing down and down until you have taken it all.

He yowls in pleasure, struggling against his bindings as he eagerly begins humping your tail end. A smirk of pleasure crosses your own lips, closing your eyes as you savor the feeling of fullness in your ever-hungry tail-cunt, squeezing down and slowly pumping up and down. You can feel your pre-cum drooling from your neglected [pc.dick] and open your eyes, time to put that mouth to good use.

The moment he opens his maw to moan in pleasure, you strike. With a powerful shove, you feed him half your cock {if Big Cock: , too horny to care that your girth forces his jaw to dislodge in order to accept you}. (Personality Check)

{Kind:
You are surprised when the male cat-snake doesn’t gag. He must have experience with this kind of thing. You briefly wonder if he’s practiced on himself or had other partners to play with.
}
{Mischievous:
You are mildly surprised when he doesn’t gag. Seems like this kitty got around. Well, if he is so well trained, you see no reason not enjoy yourself to the fullest. You eagerly thrust inside the well trained cock-sleeve that is his throat.
}
{Hard:
You smirk when you’re met with no gag reflex. What a slut! He must be used to taking cocks like a good little bitch. You give him a hard thrust, forcing him to swallow around you. <i>\"That’s it, take it like a good little kitty slut.\"</i>
}

With your cock hilted in his mouth, and his cock hilted in your [pc.tailgina], you are finally ready to start pumping for real. You go slowly, at first, adjusting to keeping pace at both ends. The feeling is incredible: your cock in something hot and tight, pulsing flesh wrapped around your shaft and greedily taking in every inch you have to give it, but there's also something in your tail-cunt too. The symbiote’s nerves feed you every delicious twitch and pulse the naleen's prick makes inside of itself, letting you know the joy of being wrapped around someone else's girth and having it hot and wet inside of you. You start to up the pace, slamming into his mouth while your tail does the same on his reptilian cock. The friction on and inside of you building, pushing you ever onwards in your pleasure.

Your partner has been reduced to nothing more than a fuck-toy, mewling and moaning in pleasure whenever you pull back far enough to allow a sound to escape him. His other lizard-prick bounces, slapping enviously against your tail-cunt. Perhaps you should grant it some release too?

Even as you continue slapping your cock inside your victim's throat, you try and concentrate on your tail's slavering fuckhole. With an act of will, you force it to release his first drooling, bulbous prick. Quick as the snake it once was, it snatches up his other shaft, ravenously sucking him down to the hilt and starting to bob and squeeze just as it did the first one.

His eyes roll to the back of his skull, a muffled scream ripping through his throat for a moment. In his currently overloaded state, his tongue start darting around your [pc.cockBiggest], unintentionally teasing you in all the right spots. Damn, you’re getting close.

Spurred on by that thought, you slam him harder than ever, facefucking him like the living onahole he is in pursuit of your release, tailcunt doing its best to suck his balls out through his shaft behind you. The feel of him around you, inside you, it's too much. With one last thrust, you arch your back and cry out as your male orgasm washes over you, sending [pc.cum] gushing into the naleen's mouth.

Gurgling, he chokes on your [pc.cum] for a moment before adapting and beginning to swallow. Your tail’s work finally pays off, and you feel a distinct warm stream being shot inside it with an equally warm stream being shot outside, splattering over your orgasmically quivering flesh.

You moan in ecstasy as you idly hump his greedy mouth, letting the last of your load slip down his throat and into his {bloated }belly. You feel, oh so deliciously full yourself, your tail-cunt gorged on his seed. Yet... you can fit more, and he has another cock. Drooling mixed fluids, your tail wetly slurps free of the naleen's lower prick and moves back to the upper one with deceptive laziness, swallowing him up once more. With practiced ease, your tail pushes him over the edge, draining this second cock of all its remaining seed as well, leaving you groaning at the delicious sensation of being so utterly and completely stuffed with predator-spunk.

With blissful laziness, you pull your cock free of the naleen's mouth and slide off of his midriff, tail curling back around for you to inspect it. The perverse lips at its end are drooling thick gobbets of naleen seed, the scent of sex wafting from it with each twitch. Naughty boy, he got you so very messy….

<i>\"Since this is your mess, you need to clean it up.\"</i> As you say this, you present your tail's seed-dripping cunt to him, holding it within easy reach of his tongue where the obscene scents can fill his nostrils, right in front of his face.

He sniffs the air, still dazed after his back-to-back double orgasm. But, surely enough, extends his tongue, taking a tentative lick at your slick cunt. You move it a bit closer to his, letting him taste around your puffy lips and just slightly penetrate your folds. You bite your lower lips as the surge of pleasure forces your tail to plug his mouth in a perverted kiss, extracting a purr of enjoyment as he begins drinking your mixed juices, lapping at your insides.

You groan and purr to yourself, savoring the strange cunnilinguis you are receiving, but enough is eventually enough and you pull your now-cleaner cunt away. Graciously, you roll the panting naleen onto his side and remove his bonds, setting him free before turning and heading back on your way.

Defeat Sex
//If you don’t have a pussy, he just ass-fucks you. They’ll be largely similar for the most part.

Lording over your {beaten/lusty} form, his mouth opens into a predatory grin.

<i>\“You invaders are all the same. Take away your walls and your guns, and you are all wimps,\”</i> he mocks you. <i>\“But you did put up a decent struggle; it was fun, so this, time I’ll spare you,\”</i> he says, coiling his body around himself.

You begin to pick yourself up, shakily climbing to your [pc.feet] in order to leave when you find yourself roughly pushed on your back. You struggle to keep your footing, but are too dazed to avoid falling down.

<i>\“I didn’t say you could go,\”</i> he says, slithering around you and stopping right before you, heavy coils pinning you down. <i>\“Hunting always makes me feel… hot. And since I’m sparing your life, I expect you to at least take responsibility for these,\”</i> he moves his coils to lift your chin, and you find yourself face-to-dick with a pair of reptilian shafts, already leaking pre-cum.

Fixated by the pricks confronting you, knowing you are completely at his mercy, you give your assent to taking care of them, however he wants you to do so.

He releases you but keeps you surrounded by his coils. <i>\“Strip,\”</i> he orders, crossing his arms as he waits for your compliance.

Nodding your head, you pick yourself up and begin to remove your [pc.gear]. {High Libido/Lust: Despite everything, your arousal spikes at what is about to happen to you, and you can't resist doing your best to put on an impromptu show for the naleen.}

Licking his lips, he makes a circular motion with his index, ordering you to give him a good look at your naked body.

With a nod of your head, you slowly twirl around, letting him drink in every inch of your now-naked form.

<i>\“Not bad, I might even consider keeping you around if you do well enough.” His coils begin closing in around you, and soon enough you feel them wrapping around your midriff. He grips you firmly enough to ensure you have nowhere to go, but not tightly enough to provide any real discomfort. His slithering body proves to be quite stimulating, and you find yourself {hardening} {and/or} {moistening} {if genderless: growing excited} under his caress.

{if Cocks:
He feels you poke his snake-half with your [pc.cockBiggest], chuckling softly at your eagerness. <i>\“That’s the spirit. No reason why you shouldn’t enjoy yourself too,\”</i> he grins.

Almost despite yourself, you feel your dick growing harder in anticipation, stoked further by the sensation of smooth scales sliding over your sensitive prick-flesh.
}

He continues to wrap you, coiling around just beneath your [pc.butt], and hoisting you up and off the floor. You immediately move your hands to support yourself on his topmost coils while he moves you into a sitting position, legs spread.

Exposed, you can't help but wriggle slightly to better raise your ass and let him see what there is to play with down there.

He moves closer and under you, to examine what you have to offer.

{if one Vagina:
You jump within his coils as he licks you, from the bottom of your nethers to the tip of [pc.oneClit].

You bite back a moan as his tongue circles your pleasure-button, nether-lips starting to grow damp in anticipation, unconsciously wriggling closer to his face in hopes of another lick.

<i>\“Delicious, and eager too. Prey like you are the best,\”</i> he says, licking his lips.
}
{else if two Vaginas:
<i>\“Two!?\”</i> he exclaims in surprise.<i>\“Quite a catch I made. You have one for each of mine… never seen an invader like that,\”</i> he chuckles. <i>\“I wonder… were you planning on seducing one of us? Never mind, you have two and I intend to put them to good use,\”</i> he says, licking his lips.

A perverse thrill surges through you at his words, the prospect of getting <b>both</b> of your cunts stuffed at the same time filling you with lustful eagerness despite the circumstances.
}
{else if more Vaginas:
<i>\“Wow, what a nice selection you have. I don’t even know which to take,\”</i> he says as he examines your setup. <i>\“Makes me wonder what kind of partners you must have. Don’t worry, even if I only have two, I’m pretty sure you’ll remember me,\”</i> he says licking his lips.

Your multitude of cunts clench in anticipation of this, and you bite back a lewd moan at the promise.
}
{else if Male:
<i>\“Nothing… that’s too bad,\”</i> he comments. <i>\“Guess I’ll have to use this little hole then.\”</i> You jump as you feel his nose dig {behind your balls} / {between your [pc.thighs]}.

You bite your lips as you feel his wet tongue slide out and start to caress your sensitive taint, slowly working its way up your body, towards your [pc.asshole]. As it circles your back passage, you can't help but moan softly. An amused chuckle is your response, and then you clench up as you feel his tongue worming his way into your ass. Insistently he pokes and prods at you, squirming inside of you as you loosen up under his tongue's perverse caresses, making you gasp and whimper as you feel it squirming around inside of you, leaving you slick with saliva.

He rises, licking his lips. <i>\“I think you’re ready.\”</i>
}
{else: //PC is genderless
<i>\“Nothing here too, what a weird invader you are….\”</i>

You jump as you feel his nose dig {behind your balls} / {between your [pc.thighs]}. <i>\“Luckily, you still have something back here,\”</i> he chuckles.

Anything you might have said is cut off by a whorish moan as his warm, wet tongue suddenly slurps lewdly at your [pc.asshole], tickling your anus with perverse caresses and starting to worm inside. You can't help but clench down, trapping the deliciously wriggling invader inside of you, but its fluttering strokes tease you open and allow him to squirm it deeper inside of you, lathering you with his makeshift lube.

He rises, licking his lips. <i>\“I think you’re ready.\”</i>
}

He adjusts his coils so he can support your back as he adjusts you and aligns himself with your [pc.vaginas] / [pc.asshole].

{if one Vagina:
You groan as you feel his lower cock spearing inside of you, piercing through your folds {and tearing through your hymen} as it plunges inside of you to the hilt. Its strange, lumpy texture produces the strangest and yet most delightful feelings. {His neglected upper cock glides onto your belly, already starting to drizzle pre-cum onto your [pc.skinFurScales].} / {Over the pussy his upper cock goes, {scraping along your [pc.balls] before} sliding its strangely textured shaft over your own [pc.cockBiggest], unabashedly frotting you as it goes.}
}
{if two or more Vaginas:
You moan like a whore, unable to help yourself as you feel him penetrate {two/both} of your [pc.cunts] at the same time, spreading you wide in unison and sliding home with a smoothness that you doubt could be achieved by taking two partners at once. The bulbs lining his shafts seem to almost massage the thin wall between your stuffed pussies, as if trying to frot themselves inside you even as he penetrates you.
}
{else: //If the PC only has their ass.
With only the one hole available to him, his topmost shaft slides home, stretching you out as the progressively larger bulges of his shaft push through your [pc.asshole] like a cross between a dildo and a string of anal beads, rubbing you in the most delicious of ways. His second cock has to settle for gliding through your [pc.asscheeks]{ and eventually rubbing against the base of your tail}, taking what pleasure it can from the friction there.
}

The naleen doesn’t spare you much time to adjust, eager to get off himself, he begins thrusting at a rather brisk pace.

You moan as you feel your hole{s} stretched by his alien length{s}, the bulges aligned in such a way to caress your walls and tease you, stretching and releasing as {it/they} go further in and then pull out, {grinding [against your cock]/[through the cheeks of your ass],} making you instinctively start to hump back against him.

He grunts and groans as his thrusts become increasingly erratic and desperate, a soft growl building in his throat as he nears his peak.

You shudder and groan, writhing around his impaling prick{s} as you do your best to keep up with his increasingly erratic thrusts. You find yourself pushing against him harder, anxious to take pleasure from this as well.

{if Vagina:
You let out a mewl of disappointment as he suddenly pulls himself completely free of your cunt, your netherlips clenching down on a cock that is no longer there. You were so close....

He pants, growling softly as he adjusts himself, positioning his lower shaft on the entrance of your [pc.asshole] and his topmost on the entrance to your [pc.vagina].

A thrill of desire surges through you as you realise what he intends. You don’t really have time to say or do anything else, as he begins penetrating you once more. The first few inches of his [pc.girlCumNoun]-drenched shaft penetrate your ass while his throbbing topmost tool enters your pussy. As soon as the first few inches are safely guarded within you, he bucks violently, feeding you his twin bulbous cocks at once.

You cry out in pleasure at the feeling of being stuffed in both holes simultaneously, stretching around his paired phalli and rubbing through your inner walls, massaging you inside with incredible intimacy.

He pounds your holes with renewed vigor, snarling furiously as, with a final shove, he yowls, and you feel warmth beginning to soak your insides.

The feeling of his seed rolling around inside of you is all the stimulus you need, and you cry out as your own orgasm washes through you, your holes clamping down on the naleen's shafts and milking him for all he's worth as you climax together. You grip the twin members impaling you with each shuddering wave of electric pleasure that crashes over you{if cock: , painting your [pc.chest] and face with your own [pc.cumtype] as your male half makes your pleasure known.} As you are filled with naleen spunk, you blank out, and by the time you come to your senses; you can only feel the emptiness left by his lizard-like cocks.

<i>\“You look good,”</i> he chuckles, eyeing the streams of white vacating your used [pc.vagina] and your abused ass, joining together into a perverted cascade.

You simply groan deeply, too caught up in your afterglow to think of anything more coherent. You are dimly aware of his coils slowly lowering you to the forest floor and untwining themselves from about your limbs. You simply let your eyes sink closed and breathe slowly, getting your strength back.

The moment you open your eyes, you are met with his golden, slitted ones. <i>\“It’s such a pity I have to let you go… but do come back. Intruders like you make the best prey,\”</i> he grins {if cock: , extending his tongue to lick a stray strand of cum off your [pc.face].

//blah blah hours pass, loss, etc.
}
{else if two or more Vaginas:
You cry out as he suddenly vacates your pussies, {both}/{all} sets of nether-lips clenching down and trying to hold onto cocks that are no longer there. You cast a look his way, wondering what is going on; he was close to cumming as well, so why is he….  You don’t time to finish that thought as you are suddenly jerked around in his undulating coils, his visage being slowly replaced by the floor. By the time he stops, you are more than a little dizzy.

You suddenly feel the naleen’s bulbous tips press against your [pc.vaginas] once more. And before you are able to utter a single syllable, he’s pistoning inside you again. Any hopes of speech dashed, you resign yourself to moaning whorishly as he pounds your cunnies into a bubbling mess of mixed fluids that grows wetter and hotter with each passing second.

You writhe and thresh in the naleen's coils, helpless to do anything otherwise, abandoning yourself to feeling your {first }two pussies getting the sort of pleasure you could never get from two separate partners. You can feel that wonderful wall giving way, your own orgasm impending. When your partner cries out, his doubled shafts pouring thick, warm seed into your greedy fuckholes. The sensation is the last little push you need to arch your back in blissed doubled climax, crying out{ as [pc.eachCock] sprays in wild surrender}.

As you come down from your mind-shattering orgasm, you have the distinct feeling of being hefted towards the ground. His shafts pull out of you with twin pops, giving way to a pair of streams composed of your mixed juices. You close your eyes, resting for a moment before you are awakened to meet the naleen’s golden-eyed gaze.

<i>\“You’re not so bad, for an intruder. It’s truly a pity I can’t just keep you… but hunting you is very fun. Not many intruders out there that make prey as fine you are,\”</i> he chuckles, slithering away.

//loss message
}

{else: //PC’s ass
You moan in desire as you feel him withdraw, leaving you panting in frustration as the sudden, horrible emptiness fills you. Before you can think to complain, plead, do anything, you feel his powerful coils rippling and twitching, shifting you around in his grasp until you are facing away from him, [pc.ass] up in the air and back exposed.

The Naleen slaps your {butt}, leaving a reddened stamp, as he forcefully grabs your hips and prepares for reinsertion. This time, however, he aligns his lower shaft, and before you know it he’s already shoved several inches inside you.

You groan, deep and low as you are filled again, clenching down on this new shaft as it spears inside of you, welcoming the feeling of being stretched out once more.

He fucks you with uncontained lust, his top bulbous shaft slapping against your butt-cheeks, leaving off-white marks of his pre as he approaches the edge. And with a yowl and a final lunge, he comes. Jet after jet of white, fertile naleen spunk being fed into your bowels. An equally enthusiastic stream showers over your back, partially protected by his coils, but most of it slides along the circumference of his snake half to pool at your back{ and wings}.

You arch your back, feeling his sticky seed sliding over your [pc.skin], the perverse sensation and the feeling of his warmth flooding inside of you all that you need to push you over the edge and achieve your own orgasm. Your ass squeezes and clenches for all it's worth, milking him dry and sucking his load deep inside of you, pleasure crackling through your nerves{, [pc.eachCock] spraying its own [pc.cumtype] across his coils}. You gasp and moan and shudder, finally sprawling limply in his coils, a dripping, blissed-out mess.

Panting, he taps your ass gently as he lowers you to the jungle ground. Once he’s safely deposited you, he uncoils, freeing you. <i>\“That wasn’t half bad. Pity I can’t keep you.\”</i>

{if PC cock:
He takes a deep breath and his eyes suddenly catch a glimpse of your spent member{s}, still half-erect, and not able to contain himself he decides to have a little taste. He swipes his finger over your [pc.cockHeadBiggest] and licks the small gob off. <i>\“Hmm, tasty.\”</i>

{if high Libido / min Lust:
You find yourself growing hard again at the display. Your [pc.cocks] stiffening in response as you groan.

Your snake-cat captor watches you, half in amusement and half in disbelief. <i>\“Well, if you aren’t a very special invader….\”</i>

His interest rekindled, he slithers your way, grabbing your rock-hard [pc.cockNounSimple]. You gasp in pleasure as he begins to slowly stroke you, drawing a pleasured moan from your lips as your sensitive member is stimulated.

It doesn’t take long for you to fire a couple weak bursts all over his hand. He withdraws and watch your [pc.cocks] shrinking. <i>\“That’s better,\”</i> he says, licking his hand clean.
}
He slithers away, looking back at you with a predatory grin. <i>\“See you next hunt, invader.\”</i>

//Loss message
}

Reverse Rape
//Can only happen if the PC has a cunt-tail. Two or more gives you an alt version.

Lording over your {beaten/lusty} form, his muzzle opens into a predatory grin.

<i>\“You invaders are all the same. Take away your walls and you are all wimps,\”</i> he mocks you. <i>\“But you did put up a decent struggle, it was fun, so this time I’ll spare you,\”</i> he says, coiling his body around himself.

You begin to pick yourself up, shakily climbing to your feet in order to leave when you find yourself roughly pushed on your back. You struggle to keep your footing but are too dazed to avoid falling down.

<i>\“I didn’t say you could go,\”</i> he says, slithering around you and stopping right before you, heavy coils pinning you down. <i>\“Hunting always makes me feel… hot. And since I’m sparing your life, I expect you to at least take responsibility for these,\”</i> he moves his coils to lift your chin, and you find yourself face-to-dick with a pair of reptilian shafts, already leaking pre-cum.

{if one Cunt-tail:
As you stare at the dripping dicks, a pang of sudden, intense need fills your mind. You <b>have</b> to have that cum! You realise dimly that it's coming from the symbiont grafted to your spine, which is practically drooling at the thought of sucking your assailant dry.

Do you hold the cunt-tail back, and let the naleen have his way with you? Or will you feed the cunt-tail's hunger?

[Feed] [Resist]

[=Resist=]
//If the cunt-tails haven’t been fed in a while, PC picks GiveIn without a choice.

You decide to resist your urges for the moment and see what the naleen has in store for you.

(Everything else play as a normal defeat rape.)

[=Feed=]
Your tail writhes and squirms, thrashing free of the naleen's larger, clumsier coils. Like a biological whip it cracks out, pussy-orifice opening like a toothless maw and impaling itself on his topmost cock, greedily swallowing it almost to the hilt and making you cry out as the sensation of rough and hard penetration feeds back to you.

<i>\“What the…!\”</i> a sheer cry of pleasure rips through the naleen’s throat as your tail-cunt forms a vacuum-like seal around his cock. It pulls and tugs at his member, mixing pain with pleasure, and whether intentionally or not, you do feel his coils slackening around you.

A surge of energy fills your limbs, lust and power washing over your senses, filling you with fresh power and vitality. With his coils slackened, you wrestle yourself free of his grasp, pushing him to the ground and straddling his waist below his members, pinning him in place. Your tail's ravenous pussy squeezes and clenches, roughly milking him of his rich, glorious seed.

<i>\“G-Get off!\”</i> he protests, shortly before you will your tail to give him a hard suck. His protests silenced for the moment, you’re left to hear his weak mewls of pleasure as you overpower him easily.

Ignoring him, your eyes fall upon his second member. It just doesn't sit right with you that you have two thick, juicy, cum-filled cocks to drain and only one tail to drain them with. As you ponder the matter, your tail falls still, ceasing its pumping whilst you contemplate. The naleen under you starts to wriggle at that, but you clench your tail's cunny with eye-watering force, making him painfully aware that he cannot topple you that easily.

Making your decision, you raise your tail up and off his first shaft, aligning it with the tip of his second one. Before you can penetrate yourself with it, though, you muse to yourself about why you should leave one out of the fun? Your hand closes around the base of his upper shaft and you press his two cocks together, so they are as close as they can be. You give him a moment to contemplate what you're doing, and then your tail dives down, stretching obscenely over each tip, devouring the two cocks, your hot cunt gulping down inch after inch of bulging shaft until you have forced yourself upon him to the hilt, your eyes rolling back in your head at the sensations of being crammed so full, stretched so wide!

Under you, you receive no protests as a pair of black furred hands set upon your [pc.hips]. His grip is not tight, in fact it’s almost like he was holding you for support. Looking down, all you can see is his desperate gaze; lust, fear and need all congealed into a single gaze. You can barely feel his hips moving, whatever fight he had in him, you seem to have drained when you set your tail loose upon his shafts. He’s probably as harmless as a little kitty right now.

You grin down at him and reach out a hand to gently pat his cheek, telling him that if he's a good boy, you'll give him a special treat. You start to pump his shafts with your tail for emphasis, biting back a moan as your over-stretched orifice glides wetly over his flesh, rippling around them in an instinctive attempt to milk him of all that delicious seed.

Nerves aflame with pleasure, your tail's rapacious cunt veritably devours the shafts, the sensation of being stretched over two cocks at the same time absolutely incredible. You continue to pump and suckle, moaning like a whore as your senses give way under the tide of feedback, until your back arches and you cry out in ecstasy as your body shudders before the orgasm rippling up your perverse tail. {[pc.EachCock] explodes, spattering [pc.cum] across the naleen's torso as it goes off in sympathy.} {Your [pc.vaginas] clench{es} in sympathetic climax, drooling your [pc.girlCum] over the coils upon which you sit.}

When you finally come down from your orgasmic high, you look down to see the naleen, out cold, with his tongue hanging out. You feel your prehensile tail-cunt give those twin reptilian poles a couple finishing sucks before its vice-like grasp loosens itself, allowing you to pull away.

As your tail's opening lets go with a loud, wet, obscene slurping, the naleen's two shafts are revealed. They're bright red now, practically glowing with heat; you've fucked him raw with your tail. Not that he doesn't deserve it, after all. Calmly you gather your things, put on your gear, and continue on your way, leaving the unconscious naleen in your wake. Maybe he'll be a little more cautious in the future....

}
{else if two Cunt-tails:
Your tails writhe and squirm, threshing free of the naleen's larger, clumsier coils. Like a pair of biological whips they crack out, pussy-orifices opening like toothless maws and impaling themselves on his twin cocks, greedily swallowing each almost to the hilt and making you cry out as the doubled-over sensation of rough and hard penetration feeds back to you.

The naleen yelps in shock, dropping you roughly onto the jungle floor. He poises his claws to strike at your tails, but a painful squeeze is all that’s needed to stop him in his tracks.

Tail-cunts clenched to keep him from trying anything, you pick yourself up off the ground and advance, unable to resist a triumphant sneer; the tables have turned. Forcibly you push him down onto his back, straddling his waist so that you can pin his wrists down. Now that he's secured, your tails can really get to work, alternatively rising up and then sliding down, stroking each shaft in turn, greedy flesh milking his cocks.

All fight leaves him as your milking tails reduce him to a pile of mewls and moans. He surrenders to the pleasure and can only gaze at you through half-lidded eyes as you drain him of his precious seed. He doesn’t buck and doesn’t fight your advances; he’s completely at your mercy.

You pat him on his head, softly stroking his ears, praising him for his surrender. The only answer you get though, is a moan. Your prehensile pussies continue to suck on his bulbous shafts, their strange shape forming an excellent makeshift plug for your tail-cunts, preventing any unwanted spills. You close your eyes and just enjoy the ride for a few moments.

It doesn’t last long, though. A grunting yowl, shakes you from your trance as you feel his shafts throbbing, followed shortly by the warmth of his seed entering your vaginas. That was quick!

You tails continue to slurp away, pumping at his spent shafts and keeping them from going totally limp, milking up every last drop of seed they have to offer. Even when no more emerges, you continue sucking away with your obscene tails, even as you {Nice: praise him for his cooperation, congratulating him on being so clever as to make the best of this.}/{Else: tease him about blowing his load so early. Were your cunts just that good?} Stretching your back, you shift forward slightly and lay down on his belly, pinning his top under your own, his head placed squarely {against your chest}/{between your {topmost} [pc.breasts]}, your tails still milking him in hopes of coaxing another load from him.

You feel a warm wetness on your {nipple}, and when you look down, you see he’s decided to lap at your {breasts). You consider stopping him. You were just relaxing and not inviting him to partake of your bare {chest}, but he seems earnest in his desire to please; plus it just feels too good. So for now, you let him do as he pleases, settling down once more atop him.

As the naleen's tongue plays across your [pc.nipples] and his shafts start to harden within your still-milking tails, a warm feeling washes over you. You feel strangely sleepy and content, and you can't fight back a yawn that slips up your throat. Feeling comfortable with such a soft, fuzzy cushion under you, you decide there isn't any harm in it. Laying your head down, you allow your eyes to fall closed as you drift off to sleep.

<b>Later….</b>

With a contented yawn, you lift yourself from your impromptu bed and stretch yourself; you feel so rested now. You realise that the naleen is stretched underneath you, completely still, though a closer look confirms he's fine, just passed out. Your need for seed feels sated, the hunger of your inhuman tails no longer clawing at the back of your mind, and you look back towards his loins as you gently slip them free of the naleen's cocks. As they slide back inside his groinal slit, you notice that there isn't a single drop of seed smeared against them or your own tail-cunts; they've absorbed every last drop. Looks like your tails milked him totally dry; you idly wonder how many orgasms he must have had before unconsciousness claimed him.

Satisfied with how things turned out, you remove yourself from the comatose naleen's form, gather up and reapply your {gear}, and continue on your way.
}

