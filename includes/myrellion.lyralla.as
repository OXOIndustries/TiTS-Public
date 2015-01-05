/*ANTBUTTEZ
Gold MyrNotes™
Lead by Council of Queens - a kind of representative matriarchy where power is proportional to offspring and each Queen Mother attempts to look out for her brood.
Each Queen’s offspring are raised collectively in what the golds call a ‘thollum,’ a kind of combination boarding school/daycare/technical .
New Queens are given a stipend by the council to establish themselves with and receive tax benefits relative to the portion of the population they have mothered.
Each queen is essentially in control of her own subsection of a city, responsible for the local government, only overruled by decisions from the council of queens.
Gold Myr are free to choose their calling during their upbringing at their thollum.
Future Queens are only discovered when they lay their first clutch of eggs, a process that often leaves their insectile abdomen significantly enlarged. Future births bring still further changes to their bodies, causing them to grow far larger in all respects than other members of their species.
Gold Myr society is loosely capitalistic backed by many socialist policies, similar to the Nordic Model.

WAR©NOTES (Would You Like To Know More?)
Gold Myr fighter pilots apparently sparked the conflict. (Kaizer wants this to be part falsification with each side blaming the other. I’m fine with the flygirls being kind of nutty, but 
Gold Myr had no warrior caste, relying on policing forces for the most part before the conflict.
A draft was instituted, giving the golds the numbers they needed to fight. Of course gold soldiers on the whole lack the training and discipline of their red counterparts.
Gold scientists developed nerve gas to use defensively to end the war, perhaps winds changed and blew it into a red town, leading the conflict to double down?
Gold likely to have more craftspeople and scientists than red, so better optics/scopes and more snipers?

BodyNotes
Gold Myr, obv
Cybernetic eye, legs & one arm
Tits getting bigger and more full of honey since being a diplomat. She’s getting to eat plenty and enjoys the effect it has on Juro.
PersonalityNotes
Juro thinks she’s a good woman. Probably banging her.
She’s probably falling for Juro. Particularly since he’s a male she doesn’t have to compete with the rest of her race for. Loves him more thankfully than an ugly girl.
Former Librarian before the draft. Loves books and histories.
Lyralla the Council of Queens ambassador
she was injured in a rocket or artillery blast around first contact
Lyralla's a good woman. Dedicated, effective, and otherwise pleasant to work with.
Doesn’t like auto-translators. Is teaching herself English to better function as a diplomat.
*/

//Room Appearance Blurbs

function lyrallasBonus():Boolean
{
	//Unmet
	if(flags["MET_LYRALLA"] == undefined)
	{
		output("\n\nA four-armed woman sits behind a cheap-looking desk, shuffling papers this way and that with one robotic hand. She keeps stealing glances at ");
		if(flags["MET_JURO"] != undefined) output("Juro");
		else output("the nearby kui-tan");
		output(".");
		if(flags["TALKED_WITH_JIRO_ABOUT_AMBASSADOR"] != undefined && flags["MET_LYRALLA"] == undefined) output(" She must be Lyralla, the gold myr ambassador he told you about.");
	}
	//Met
	else output("\n\nLyralla is sitting behind her desk looking busy as always. You aren’t sure how she does it, but she manages to flash you a friendly glance with her red, cybernetic eye.");

	return false;
}

//Approaching Lyralla
function approachingLyralla(backFromMenu:Boolean = false):void
{
	clearOutput();
	//First Time
	if(flags["MET_LYRALLA"] == undefined)
	{
		output("The short walk up to her desk gives you plenty of time to get a feel for the four-armed diplomat. Her most striking feature - or features - are her cybernetics, starting with a glowing red eye and including an ill-fitting, terran-style robotic arm. Her other three limbs are intact, three slim arms wrapped in polished chitin, delicately shifting a sea of paperwork into organized, book-sized atolls.");
		output("\n\nFor clothes, she sports a gleaming white robe that’s fastened by a gold-embossed belt. The top hangs open casually, almost indecently, exposing far more amber titflesh than it has any right to.");
		output("\n\nThe ambassador");
		if(flags["TALKED_WITH_JIRO_ABOUT_AMBASSADOR"] != undefined) output(", Lyralla,");
		output(" notices your stare at that exact moment. She smiles warmly despite your roving eyes and extends a hand, diplomatically drawing your eyes away from her immodest canyon of cleavage. “<i>Hello, and on behalf of the Council of Queens, allow me to extend you a warm welcome to our troubled planet, offworlder. My name is Lyralla.</i>”");
		output("\n\nYou pause before realizing that she’s speaking near-fluent English - you aren’t just hearing an auto-translated version of her native tongue relayed by the microsurgeons in your blood. “<i>You speak English</i>?” The disbelieving statement is out before you have time to think about.");
		output("\n\nLyralla nods serenely while tugging her robe into a more modest position. The garment doesn’t look like it was made for an individual with so much up top, though you can’t imagine an ambassador being given anything less than the finest clothing a species has to offer.");
		output("\n\n“<i>Of course. What kind of ambassador would I be if I did not learn the most common galactic tongues?</i>” She makes a clicking noise against the roof of her mouth. “<i>A cursory examination of public records reveals mistranslations as a serious contributor in over two dozen recent conflicts among your peoples.</i>” Her artificial eye audibly whirrs as it focuses on you, its organic mate black and silent. “<i>If I am to be the connecting tunnel between my people and the galaxy as a whole, then I am going to do everything I can to ensure that the supports are built on strong foundations, not shifting sands.</i>”");
		output("\n\nYou cock your head. “<i>A tunnel?</i>”");
		output("\n\nGrinning now, she offers, “<i>I believe a bridge may be a more apt metaphor. Our people dwell below ground and have less experience with such structures. I still have much to learn - your name, for instance.</i>”");
		output("\n\nYou ");
		if(pc.isNice()) output("introduce yourself and shake her hand, a gesture she seems to already have adapted to.");
		else if(pc.Mischievous()) output("introduce yourself as Captain [pc.name] Steele and strike a ludicrously exagerrated pose.");
		else output("tersely inform her of your name.");
		output("\n\nShe places her lower arms’ elbows on the desk and interlaces her fingers, resting her chin upon them as she smiles up at you. “<i>An interesting name for an interesting [pc.man]. Tell me, what can a I do for you?</i>”");
	}
	//Back From A Previous Menu
	else if(backFromMenu)
	{
		output("Lyralla shrugs, her metallic shoulder clicking audibly. “<i>Is there something else you need then? It is nice to practice my linguistics on someone aside from Juro.</i>”");
	}
	//Repeat
	else
	{
		output("Lyralla gives you a friendly wave with her robotic arm as you approach, trusting her remaining organic ones to set aside the paperwork and tablets she had been examining. “<i>");
		if(rand(8) == 0) output("I was reviewing ancient histories. It’s amazing how many times you went to war without provoking extinction level events!");
		else if(rand(7) == 0) output("I was just reviewing a proposed trade agreement. Word is getting out about our honey. Some place called New Texas seems to want to exchange surplus grain for it. They’ll even provide us with the milkers!");
		else if(rand(6) == 0) output("Comma splices! Comma splices everywhere! How can Ambassador Juro butcher your language so casually? Language is an art unto itself! Surely he can see that.</i>” She snorts and tosses one last tablet away. “<i>Sometimes I have to wonder how he got his position.");
		else if(rand(5) == 0) output("I was just looking over a proposal from KihaCorp. They’d like to use our likeness for a VI. I think the Council will have to pass a ruling on this one.");
		else if(rand(4) == 0) output("Did you know that pointing the innermost finger at some varieties of ausar is considered insulting in the same way that terrans regard upraised middle digits? There’s so much to learn!");
		else if(rand(3) == 0) output("I just got word that a small trading fleet will be stopping by. I wonder if all the food in the U.G.C. is as bland as that stuff Juro eats.");
		else if(rand(2) == 0) output("There’s so much out there... more than I ever imagined. Maybe someday, once the reds are taken care of, I’ll get a chance to see your universe.");
		else output("I’ve just come across a wonderful word: canoodling. It means hugging and kissing, but together, all in one small set of syllables. It is... elegant and touching. My people do not have such a term.");
		output("</i>” She smiles warmly at you. “<i>Is there something I can help you with, [pc.name]?</i>”");
	}
	//9999 menu
}

//Appearance
function lyrallaAppearance():void
{
	clearOutput();
	showLyralla();
	output("Lyralla is a gold myr first and foremost, and that means she has the same antennae poking up out of her black, bob-cut hair as the rest of her species. One is shorter than the other, its tip seared off by fire and healed imperfectly. Just below it is her injured eye. U.G.C. medics have fitted her with a prosthetic, but it’s a clunky, general purpose model. The iris glows red and whirrs noisily when focusing, lending its user a disconcertingly menacing air. It looks disturbingly out of place on the ambassador’s otherwise cheery face. The other eye is a solid black sphere, an unmistakable reminder that you’re looking at an alien.");
	output("\n\nHer body is covered in a white, gold-trimmed robe that hangs loosely everywhere but around her bust. Lyralla’s breasts are a few sizes too big for such a garment, tugging the neckline down until “plunging” seems a conservative estimate of its state. Four voluminous sleeves hang around her slender limbs. The cuffs only reach about halfway down her forearms, revealing plenty of gleaming chitin and shiny chrome.");
	output("\n\nOne of her arms, the upper left, is clearly artificial. It has none of the feminine grace of its three sisters, all hard metal and synthetic tendons. You recognize it as a Reaper Armaments model, the kind of prosthetic favored by the military, used to get dismembered soldiers back into fighting shape. Word has it that some marines have undergone voluntarily limb replacement surgeries in order to benefit from the enhanced strength and recoil compensation afforded by these robotic arms. Lyralla can be seen frowning at hers from time to time, but she uses it as naturally as her other three hands.");
	output("\n\nHer desk blocks any sight of the rest of her most of the time, but there’s no hiding the big bump of her ant-like abdomen, hanging out the back of a specially cut hole in her silky robe to dangle over the back of her stool. Similarly, whenever she shifts position, you can hear the metallic clinking of her two prosthetic legs.");
	clearMenu();
	addButton(0,"Next",approachingLyralla,true);
}

//Talk
function lyrallaTalkMenu():void
{
	clearOutput();
	showLyralla();
	//Bimbo
	if(pc.isBimbo()) output("“<i>I wanna like, learn some stuff about... stuff!</i>” you announce.");
	//Bro
	else if(pc.isBro()) output("“<i>I uh... have some questions,</i>” you explain.");
	//Nice
	else if(pc.isNice()) output("“<i>Well, I have a few questions,</i>” you say with a friendly grin.");
	//Mischievous
	else if(pc.isMischievous()) output("“<i>I have a few things I’d like to figure out,</i>” you smirk, “<i>... besides your contact information.</i>”");
	//Hard
	else output("“<i>I have a few things I need to discuss with you,</i>” you explain.");
	output("\n\nLyralla");
	if(!pc.isBro() && !pc.isMischievous() && !pc.isNice() && pc.isMischievous()) output("‘s antennae wiggle nervously. “<i>I’m afraid you’d need to be a dignitary of some rank to have access to my diplomatic connections.</i>” She smiles, her artificial eye twitching. Was that an attempt at a wink? “<i>But I’d love to answer some of your more mundane questions.</i>”");
	else output(" nods eagerly. “<i>Certainly. Sharing knowledge is my passion. It was even before I became an ambassador.</i>”");
	//Topic list
	//9999
}

//What Happened
//Tooltip: “Ask her what happened to her and how she wound up here.”
function whatHappenedToGetYouHereLyralla():void
{
	clearOutput();
	showLyralla();
	output("You ask her how she wound up here, like this.");
	output("\n\nLyralla pauses, considering for a moment. “<i>That’s... not a question I expected, to be honest. Surely you’d want to know about how my people live, what we eat, or even how we reproduce, no?</i>” She looks a little uncomfortable, fidgeting in her chair, a motion that only serves to make the top of her robe drift that much more open.");
	//Treated/Bimbo/Bro
	if(pc.isTreated() || pc.isBimbo() || pc.isBro()) output("\n\nYou brazenly check out her tits until you realize that the blushing myrmedion is awaiting a response. “<i>Uh... no?</i>” you guess.");
	//else
	else
	{
		output("\n\nYou ");
		if(pc.libido() >= 50 || pc.lust() >= 60) output("struggle to not stare at her cleavage but ultimately fail. There’s just too much delicious boob on display. Still, you manage to keep enough of your oversexed wits about you to answer, “<i>No.</i>”");
		else if(pc.libido() >= 35 || pc.lust() >= 40) output("struggle to not stare at her deliciously full cleavage, barely dragging your eyes back up to her face in time to answer, “<i>No.</i>”");
		else output("easily avoid an interplanetary incident by keeping your eyes above her neck and answering, “<i>No.</i>”");
	}
	//Merge
	output("\n\nLyralla places her lower palms together, bringing them up in front of her mouth while she tries not to blush. “<i>Okay... if you say so. I just uh... had to be sure.</i>” Her upper limbs reach around to tug her robe into a more chaste position.");
	if(pc.isBimbo() || pc.isBro() || pc.isTreated()) output(" It’s far easier to remember that there’s a conversation now.");
	output("\n\nShe shifts on her chair, her abdomen bouncing excitedly behind her. “<i>Well, it’s kind of a crazy story. One day, I’m working at the knowledge house-</i>” She pauses. “<i>Perhaps library would be a more familiar term, though there are several distinct differences.</i>”");
	output("\n\nYou nod. So she was something of their version of a librarian.");
	output("\n\n“<i>Anyway, I got word that I had been pulled for the draft. I was going to have to trade my time in the lore halls in for time in the trenches. The reds were making a big push for Kressia, and as you can imagine, we were starting to run low on able-bodied fighters.</i>” Her metallic hand fiddles with an errant strand of obsidian hair. “<i>They couldn’t even use me in the records department. No one ever gets shot in records.</i>”");
	output("\n\n“<i>It must have been horrible,</i>");
	output("” you ");
	if(pc.isAss()) output("flatly ");
	output("reply.");
	output("\n\n“<i>There are so many words to describe hardship, and yet none of them seem correct.</i>” Lyralla looks down at her desk. “<i>We sat in our trenches with our guns and our axes, dreading the day that the reds would come upon us and butcher us by the hundred.</i>” She wipes a tear from her good eye. “<i>Every day, they’d fire hellscream missiles into our trenches. Every day we’d have to hear that awful banshee wail and dread that it would land on us.</i>”");
	output("\n\nShe shudders. “<i>It turned out I would never have to fight a red. One of those missiles hit my position just before your people arrived in orbit. I only lived because Mella, one of the girls in my unit, saw it coming and tackled some of us to the ground.</i>” Lyralla turns her head away. “<i>She didn’t make it, but I did. Somehow I did.</i>”");
	output("\n\nYou look down, unsure of what to say.");
	output("\n\nThe gold-hued cyborg goes on. “<i>Your fleet offered medical assistance to the wounded once the cease-fire was established. I volunteered, feeling I had nothing more to live for. I might as well spare my sisters having to gamble on the generosity of aliens. I had no idea about all this.</i>” She glances over towards Juro, a fond look on her face, but her arms are gesturing to the varied races as a whole.");
	output("\n\n“<i>The technology you have... it’s incredible - almost magical. And yet you barely seem aware of the daily treasures you interact with. I had resigned myself to living the rest of my life half-blind in a chair, forgotten in some dark corner, and your people gave me my life back.</i>” She pulls the sleeve on her metal limb back, exposing the ugly prosthetic. “<i>It may make a lot of noise and scare away any male myr, but it lets me feel something close to whole. I had given up on that.</i>” She looks at Juro once more, red eye focusing noisily. “<i>Now I have a galaxy’s worth of information at my fingertips and marvellous company too... so long as that red stays in her hole.</i>”");
	//[The Red?]
	//[Cybernetics?]
	//[Juro?]
	//9999
}

//Juro
//Tooltip: Ask Lyralla about Juro, the U.G.C. diplomat. She appears quite fond of him.
function askLyrallaAboutJuro():void
{
	clearOutput();
	showLyralla();
	output("“<i>So that Juro guy... you like him?</i>”");
	output("\n\nLyralla sits bolt upright, crossing a pair of arms above and below her bosom to steady its errant jiggling. “<i>No, of course not! Not like you mean, anyway! Our relationship is friendly, professional, and appropriate to our stations - nothing more!</i>” Her skin turns coppery from a deep blush, and her antennae dance along with it, nervously waggling.");
	output("\n\nLeaning back disbelievingly, you cock your head to the side.");
	output("\n\nThe golden diplomat glowers at you. “<i>Look, it would be completely improper for us to have anything other than a deep and mutual respect. It doesn’t matter how handsome he is or what his race can do with their balls.</i>” Clapping her hands over her mouth, Lyralla swivels frantically in her chair, looking for a way out. She turns back to you after a moment, her head drooping low, defeated. Even her antennae seem flat and lifeless. “<i>He’s a good man, [pc.name]. It can’t be more than that. Not until this mess is all over. If it’s ever over.</i>”");
	//Talk menu
	//9999
}

//Cybernetics
//Tooltip “Ask Lyralla more about her parts. What’s it like having a metal arm and robotic eye?”
function cyberneticsDiscussionsWivLyralla():void
{
	clearOutput();
	showLyralla();
	output("You steer the topic toward the cybernetic parts she has now.");
	
	“What’s it like?” She holds the glittering metal up before her glowing eye. “It’s constant pain and your body never behaving like you think it should... and it’s wonderful too.” Lyralla blinks at you. “It’s a long way from perfect. The doctors haven’t gotten our nervous system perfectly mapped yet. Sometimes I wind up breaking things I mean to pick up. Other times just waking up in the morning gives me a migraine headache.” She rubs the back of her neck nervously. “All the headaches in the world are worth it, though.”
	The ant-girl points at the sign on the far wall. “See that sign? I can read it. It says ‘No unauthorized entry.’” Lyralla beams. “This eye - ugly as it is - it lets me see better than the real one ever could. My people have poor vision. Few of my sisters would be capable of such a feat.”
	“What about your arm? Or legs?”
	Lyralla shrugs. “They do what they’re supposed to. I’m stronger, I guess, but who cares? Physical strength is a weapon of last resort, the sort of thing only a brainless brute would care about. What good does lifting heavy things do against a missile? How useful is brawn against an invisible gas?” She leans in close, confident once more. “We wouldn’t need it at all if the red across the hall could be talked to like a civilized creature - like Juro or you.”
	An air of finality hangs over that. Is there anything else you’d like to talk to her about?
	[The Red?]
	[Juro?]
The Red?
//Tooltip: Ask Lyralla about the red ambassador - the one she seems pissed off at.
	You ask about ‘the red.’ What’s the deal with her?
	Lyralla shakes her head. “She’s a lost cause. Would you believe I tried to make peace with her when she first got set up here? I thought... you know, if we could make peace, one woman to other, it’d be the first step towards stopping the fighting.”
	“How’d it go?”
	“About as well as you might think. She pulled out a gun and threatened to shoot me. She said I was a ‘fucking spy’. Can you believe it?” All four of Lyralla’s arms shake with anger . “Apparently the reds are so addicted to violence and brutality that negotiations can only exist as a front for information gathering.” She slumps back in her chair. “I guess the only thing they understand are threats and military might. It is fortunate Juro and your people appeared when they did, or a lot more of my people might have needed these cybernetics.”
	The ant-girl rotates her silvery hand before her mismatched eyes, a sour grimace painted on her inhuman features. “I know I was chosen for a reason, but... talking to Nehzara makes my job feel like a hopeless, pointless thing.”
	It might be best to change the topic.

Her Job
//Tooltip: Ask her why she was chosen as an ambassador.
//Unlocks her queen
	“{Like, how’d you get this cool job?/How’d you score this job?/So how’d you wind up chosen as the diplomat for your people?}”
	Lyralla straightens in her chair, smiling. “{I guess I can tell you one more time./I suppose I managed to avoid discussing the circumstances of my appointment, didn’t I?/I’ll spare you the grizzlier parts of the story.}” Her lower arms rest comfortably on her desk, the upper pair falling across her chest to hide some of her golden bosom. “I was already here having my wounds tended to by your doctors.” The buxom diplomat grins. “They’re quite the capable bunch, I must admit.” Pride and thankfulness war for control of the pitch of her voice, neither able to beat out the other entirely.
	You follow the gold myr’s gaze toward a few passing medics.
	“I came out from under the anesthetic one day; my eye had just been fitted, you see.” She waves at her optical implant. “And I was needing something to do. My new legs weren’t healed enough for me to be on them for more than a few minutes at a time yet.”
	Looking lower, you spy a bit of chrome under the edge of her desk.
	Lyralla is either oblivious to your roaming eyes or used to the curiosity. If it bothers her, she doesn’t show it. “I was asking for something to read when Juro came by. He changed everything.”
	You cock your head to the side. “Juro? {Was that like, the cute, fuzzy guy?/The kui-tan over there?}”
	“Yeah, that’s him.” Lyralla’s robotic eye whirs, dilating as it loses focus.
	She’s going to need to get used to having such an easy-to-read eye if she wants to keep her job. It’s obvious she has feelings for him.
	The ant-women blithely continues on. “I am unsure if it was pity that brought him to talk with me or a deeper commonality of spirit, but when I requested reading materials, he was the one to bring them to me.” Her smile widens as she remembers. “He had the tomes I requested as well as a tablet loaded with some of his own favorite selections. I doubt he’s ever carried such a heavy load before! He nearly toppled just getting into the door to my room.”
	You {chuckle/giggle}, imagining the bookish kui-tan trying to wrangle so many primitive texts at once.
	Lyralla laughs with you. “Yes, he was quite the sight. He’s a good man, that one. He only dropped </i>The Karkashane Rhythms<i>. Quite a feat for one of a race without four arms.”
	The myr do have a discrete advantage in that department.
	“He had been using his lunch breaks to talk to the wounded - from both sides, trying to size us up, cheer us up, and get to know us a little better,” Lyralla explains. “That day, we talked until the third time his subordinates called for him. We compared histories both ancient and modern, and somehow even wasted a quarter of the hour on talk of weather formations.”
	//misch
“Maybe you should have become a meteorologist,” you quip.
//else
“That’s a lot of time to talk about clouds,” you respond.
//Merge
Lyralla’s gold-tanned skin darkens copper. “{Oh, I could never./It is, isn’t it?} We did hit it off, though. He came back the next day like clockwork, asking which books I had read. When I told him that I’d need a whole new batch of tomes, he nearly fainted,” she giggles. “Of course, I didn’t need more books - I had a tablet full of hundreds still to read. We talked about a few of them, and I even convinced him to give a few of our philosophers’ manuscripts a once-over.”
“Not too shabby.”
“Not too shabby indeed! I guess the breadth of my knowledge impressed him, because he was back a third time, suggesting I petition the Council of Queens for the position of ambassador. He even wrote up a recommendation.” Lyralla’s excitement is almost contagious. “All that time memorizing dusty old tomes turned out to be useful for something besides answering inane questions. I got word that I had been selected the next day.”
What? “Wouldn’t there be hundreds of other candidates to wade through?”
Lyralla openly smirks. “I would have thought so too, but it turned out they were split over two other candidates when my request arrived. Each had strong ties to powerful queens. The Council had been deadlocked for days, bickering endlessly. Politics as usual. My Queen is young - seen as weak enough that she and her brood could be easily controlled by either side. I was the eleventh hour compromise.” The myr’s smile looks a little more wan than before. “Every day I receive missives from my Queen about the pressure her rivals have her under, but I do my best for her and my people. Besides, we’ve gained no small amount of prestige from being the primary liaison between our people and the aliens with enough firepower to flatten our world.”
	Well, that’s something.
	The robed diplomat pauses to consider her words for a moment, calming herself. “That’s the long and short of it. Is there anything else you’d like to ask?”
	
Her Queen
//Unlocked by learning about how she got her job.
//Tooltip: Ask about Lyralla’s Queen
You ask her about her Queen. That’s like her mother, right?
Chuckling, Lyralla answers, “Yes and no. The term ‘mother’ in your tongue is weighted down by connotations of personal nurturing and closeness.” Her eyes twinkle. “This is why mastery of language is so important to what I do. So many misunderstandings could have arisen in our discussion if I wasn’t in the process of learning your tongues.” She leans over, her large tits nearly spilling out of her robe. “Yes, she gave me life, but no, she did not raise me, at least not directly.”
	“Who did?”
	“The thollum.”
	You try to wrap your head around the strange word. The autotranslators in your blood don’t offer up any suitable comparisons.
	Lyralla explains, “Thollums are roughly analogous to boarding schools, large extended families, and technical colleges. We are raised in classes of our sister siblings, educated in general disciplines until we choose one to focus on. The drones are raised elsewhere, of course. Their presence would be immensely distracting from our education.” She titters. “I’ll never understand why so many terrans try to get any learning done around the opposite gender after puberty. It’s pointless!”
	Thinking back, it does make a certain kind of sense.{ But why would you want to learn when there’s so much {pussy/dick} around?}
	Lyralla shakes her head and smiles at your reaction. “Surely I’ve gotten off base here. What exactly did you want to know about my Queen?”
	[Her Name]
	[Meet Her?]

Meet Her?
//Tooltip: Ask if you can meet her queen.
	You {{politely }request/demand}, “{Is it possible that I could meet her?/Where can I find her? I’d like to talk to a queen.}{ I bet her boobies are super huge!}”
	Looking at you curiously, Lyralla shakes her head. “Queen Irellia isn’t the kind to take social calls, especially since there’s so much political pressure on her nowadays. I imagine she’s busy... well-” She looks away, her jaw clenching and unclenching. “I’m not sure if I should say. The topic is taboo to many from your worlds.”
	Now that’s interesting. Do you pry into it?
	//[Nah]
	//[Pry]
Pry
//Tooltip: Try to get the ant-girl to fess up to whatever her Queen is up to!
	“I’m no stranger to taboo.{ It’s like, a really fun game!}”
	{Lyralla tilts her head, searching for some deeper meaning in your statement, but you just keep on smiling at her, hoping she’ll talk again. Oh good! She’s inhaling. Usually people do that before they talk or suck cocks. She’s probably gonna talk./Lyralla inhales deeply, then nods.} “Fine. You asked for it.”
	//Nice
	You nod understandingly.
	//Mischievous
	“I ask for all kinds of things,” you counter with a wink.
	//Hard
	You nod, waiting.
	Lyralla exhales, then takes one more deep breath, nearly bursting out of her robe in the process. Just what do they feed the girls here?
	“Well, when she isn’t politicking or laying, she’s... breeding.” The gold myr nervously looks at you, awaiting some kind of shocked reaction. When none comes, the tension perceptibly oozes out of her shoulders, even the artificial one.
	You cock an eyebrow at the myr. “And why would that shock me?”
	Lyralla waves her arms around in irritation. “I don’t know, but I’ve read about a lot of places where talking about it could get you jailed. It pays to be careful, okay?”
	You grin back at her.
	Lyralla sighs and graces you with a tired smile. “It isn’t just some... lewd... pleasure-seeking thing.” She pauses and chews her lower lip. “At least, I don’t think so. I mean, she might like doing it. I’ve never met her in person, but that’s not the point. For queens, their voting power is directly proportional to the number of their living offspring. The higher the portion of the population you produce, the more power you have to rule it. Queen Irellia’s initial holdings were small, owing to a low egg count from her first matings, but she has tirelessly courted more drones, kept her body working around the clock nonstop to catch up to the others.”
	Your eyes widen at the thought. She must be getting gangbanged almost around the clock. “That’s... impressive.”{ You shift your growing [pc.cocks] under your [pc.lowerGarment] to get more comfortable./ You try to ignore the increasing wetness pooling in your [pc.lowerGarment] at the thought.}
	“Yes. She’s already overtaken other queens around her own age, and lately her egg yields are through the roof. If she continues like this... our family may one day be the most powerful in all of Gildenmere.” Lyrella pauses uncomfortably. “Assuming there’s still a Gildenmere.”
	“Yeah...”
	Lyralla rifles through her paperwork for a moment, the topic closed for now.
	//Talk menu
Nah
//Tooltip: Nah!
	“I understand. Lemme think if I have any more questions for you.”
	Lyralla’s posture noticeably relaxes. “That would be wonderful.”
	//Talk menu
Her Name
	“What’s her name?{ I bet it’s cute!}”{ You pause and ask, “It’s not rude to ask that, is it?”}
	Lyralla smiles. “She is Queen Irellia Ildris Nere vas Uldred.”
	“That’s a mouthful.”
	“Full names often are, but only because they are so full of meaning. She was given the name Ildris Nere from her thollum’s registrar. Most myr only ever have two names, their assigned name and their Queen’s name. For instance, I am Lyralla Irellia. Queen Irellia’s mother’s is Queen Nere. She still sits on the council.”
	You lean forward, intrigued by the similarities and obvious differences in their naming scheme. “But what about the other names?”
	Lyralla smiles. “It’s good to have an eager pupil. Every queen chooses a Queen Name, the title that she will go by on the council and that her children will bear for her. Obviously Queen Irellia has chosen Irellia as her title, and I bear it for her as my second name.” She steeples her lower fingers. “The last and final part of her name is vas Uldred. Vas indicates a dwelling or physical location. It is used in this instance to indicate that the following word is her house. The seat of power. The place in the city from which she reigns.”
	“It’s not so bad once you break it down.” Lyralla beams. “Anything else I can help you with?”
//[Sure - Talk menu]
//[Uh... wha?]

Uhhh wha?
//Make it simple - please!
	“Uhh... maybe go over that one more time. It’s kind of complicated{ and stuff},” you say a little uncertainly.
	Lyralla sighs. “Cultural diversity can be such a bother. What seems obvious to me is utterly alien to you.” She holds out all four hands, shaking the upper left one first. “Okay, first up is her chosen queen name - Irellia. It’s what most people will call her and what her children, like me will bear as our second name.”
She lowers that hand and makes a cupping motion with her metallic one, as if it could hold the next part. “Second is Ildris. That’s the name she was assigned in her thollum.”
The smiling diplomat drops that hand with a noisy clank, leaving only her lower two remaining. She motions with part of the remaining pair while she explains, “Next is Nere. If she weren’t a queen, it would be what you might call a last name. Our last name’s are our mother’s chosen queen name instead of a father’s family name.”
Lowering that hand, she leaves herself with one outward-splayed palm. “The final part of her name is two parts: vas followed by the name of their house. The house name usually refers to specific structure within the Queen’s home city, but for some particularly blessed queens it can refer to a wider area of the city or even an entire settlement if she’s the only fertile female in the area.”
You scratch your head and nod slowly. It makes sense. Sorta.
Leaning back into her chair in relief, Lyralla beams at you, folding her upper arms behind her head. Her robe slips low enough that you swear you can see the edge of a gold-tinted nipple, but her lower limbs swiftly shift the fabric into a more proper position. “Wonderful. Just think, you already understand more about us than most of the galaxy. The more we share, the closer we can work together for the betterment of all. Now, was there something else you wanted to discuss?”
//Root talk menu

The War
//Tooltip: Ask her what she thinks about the war as a whole.
	“So what about the war? What do you think?”
	Lyralla shuffles papers aside into a neat stack. “The war? It’s over. There was a cease-fire. Or didn’t you hear?”
	“I heard. I just wanted your thoughts on it. Who started it, anyway?”
	Lyralla snorts. “Have you seen any of those goose-stepping, Scarlet Federation goons? It doesn’t take much to see who the real bad guy is here. They won’t even show their faces here in the DMZ, hiding behind those absurd masks of theirs! As if we would gas our OWN people just to kill a diplomat and a few troopers - preposterous!” The diplomat is scowling for once, a smoldering pit of anger burning her in one inky eye.
	You take a step back and carefully consider your next question. “What’d they do?”
	“They shot down some of our scouts - the planes hadn’t even left our borders. Blasted reds were probably too nearsighted or too poorly educated to realize that they weren’t being invaded. I hear they don’t even have thollums over there. They just punt their young directly into their military.” Lyralla’s antennae twitch. “They </i>claim<i> that our scouts shot first of course. The audacity of it all.”
	How do you respond?
	[Well...] - Could the golds have shot first? Myr are supposed to be short-sighted subterranean creatures. Wouldn’t ones that wanted to fly be extreme eccentrics?
	[What Next?] - The reds seem pretty barbaric. What happened next?
[Unfinished] Agree
	“What happened next?”
	Lyralla gives you a haunted look. “Isn’t it obvious? They declared war and launched an all-out offensive. They must have been preparing for something like this for years. The shelling started within a few hours. Their troops rolled out shortly after, butchering and slaving as they went. Did you know...” Her voice drops to a hushed whisper, “...they make their captives into sex slaves with that awful venom of theirs?”
	“Really?”{ You try to keep an open mind after hearing Nehzera’s side of the story.}
	“Really,” the cybernetic ant deadpans. “First chance they get, they slather them up in spit to take the fight out of them, then take advantage of the poor girls until they’re too hungry for more to remember those red bitches murdered their sisters.” A shiver wracks the diplomat. “That’s the worst part of it, really - how dehumanizing it all is. Even if they weren’t making their captives into sex slaves, they’d be just as bad off. The Scarlet Federation has no room for individuality. No room for freedom. No room for love.” She looks wistfully into the distance. “It’s worse than terrible. I don’t think there’s a word in either of our languages that can correctly describe it.”
	Shifting nervously, you can’t help but acknowledge her with a curt nod. “But what about the war? What happened?”
	The gold-robed ex-soldier blinks a few times. “Right.. the war. The reds... well, they were far readier for this than we were. We had a bigger population and base of industry, but that’s no substitute for having a well-trained, well-equipped army. They rolled right over a few of our cities. Our token police forces barely stood a chance.”
	“How’d you stop them then?”
	“We didn’t... not completely. The Council started a draft to get our military up and running, and while the reds were busy filling up on “trench wives,” we were busy digging trenches and developing weapons. We were busy teaching our weavers to stitch wounds shut, our machinists to make guns, and our workers to swing warhammers instead of... hammers.” She coughs. “I assure you that it sounds far more clever in our tongue.”
	You recall the gas and nukes you’ve heard mentioned in passing. “What about all the chemical and nuclear weapons?”
	Lyralla pushes back from her desk, scowling. “Weapons of last resort. Next to Gildenmere, Kressia was our second biggest city. We deployed nerve gas to try and stem the red tide, thinking that it would be so terrible that it could finally bring an end to the fighting.” She shakes her head sadly. “It didn’t. The reds swarmed in anywhere we didn’t gas, focusing their attacks into deadly spears. They made protective breathing masks not long after, allowing them to ignore the gasses almost completely. Kressia fell within a week of that discovery. No amount of trenches, mines, or determination could stop them.”
	She rubs at her forehead with one set of hands while wringing the other pair. “I’m pretty sure they were just going to nuke Gildenmere rather than waste the soldiers it would take to conquer it... then you showed up, giving us the time to discover those weapons ourselves. If they think they can wipe us off the map with waves of fire, they’ll find themselves having to live out of radioactive craters.”
	You wince.
	“Yeah, I’d prefer not to be melted into glass too.” Lyralla straightens, her face heavy with sadness. “I wish I could have filled that summary with more victories.”
	
Well...
//Could the golds have shot first? Myr are supposed to be short-sighted subterranean creatures. Wouldn’t ones that wanted to fly be extreme eccentrics?
	You point out that there isn’t any evidence one way or the other. Besides, wouldn’t ants crazy enough to take to the sky be less reliable the kind that stay on the ground, defending their homeland?
	Lyralla points a finger and stops, pausing to consider her next words. Her antennae lower until they’re pointed at you like little horns. “Even if that were true - that our scouts had strayed off course or turned violent of their own accord, it never would’ve turned into a war if the those scarlet witches knew anything about diplomacy. Reparations could have been made and peace sustained if not for their wanton bloodlust. You can’t seriously believe that we would want such desolation for our peoples, can you?”
	[Yes][No]
Yes
	“Yes.”
	Lyralla shakes her head at you. “I would have thought that your alien eyes could see things more clearly than most. I was mistaken. Good day.”
	The gold myr diplomat buries herself in her documents once more. It would seem this interview is at a close.
No
	“No, of course not.”
	Lyralla sags into her chair. “That’s a relief. It’s hard enough to get aid with the reds muddling up the waters and telling everyone that we’re responsible for all this.” She rubs at her temples. “Was there something more pleasant we could discuss?”
	//Talk menu	
Catch Her In The Act
//Can proc any time after talk scenes make it clear she luuuuuvs Juro.
	//Room note: Lyralla’s desk is empty, and Juro is nowhere to be found. Where could they be? You can faintly hear the occasional giggle emanating from a nearby storage closet.
	[Closet]

//Closer:
	Now that you’re an inch or two away from the door, there can be no doubt. It’s Lyralla’s voice on the other side, giggling out hushed, intimate whispers. A male voice answers her, talking in calmer, cooler tones laced with an undercurrent of barely-restrained excitement. The more you hear of it, the more sure you become of its identity. There’s no mistaking his measured timbre. It’s ambassador Juro, the kui-tan representative!
	The sounds from within are growing more heated by the second. Do you sneak a peek or walk off?
	[Peek In]
//Peek in
	Luckily, the doors on this planet are simple, hinged affairs. All you have to do is quietly twist the handle and slowly inch the stone portal inwards. This would never work with the hydraulic doors favored by coreward installations and starships. You can’t hide their pressurized hiss or open them part way; it’s an all-or-nothing affair.
	You whisper a thanks to whatever craftsman built and oiled the hinges to this particular entrance when it doesn’t make a single squeak to give away your eavesdropping. Stealthily craning your head to line your eyes up with the opened slot, you take your peek and try not to let what you see shock you overmuch.
	Lyralla’s robe is crumpled into a pile behind her. The fine, gold embroidery pales next to her naked, curvaceous form. Her huge breasts are on display, and each is easily as big as a melon, almost glowing amber from something contained within. Coppery nipples cap each feminine nectar tank, dribbling viscous, honey-colored fluid. The ambassador shows no sign of embarrassment at this. She even arches her back to better present the swaying mounds to the room’s other occupant.
	Juro isn’t nearly so exposed. He’s still wearing his normal ensemble with only a flap at his crotch undone. Straining hard against Lyralla’s hand, his member juts a full foot from its escape hatch. It’s a curious looking thing: three rounded knots are spaced along its length, and the tip is shaped almost like an upside-down heart. Further south, his balls swing free in the air as he pushes back against the myr’s chitinous palm. Each is easily the size of an orange at the moment. From what you remember of kui-tan biology, they can swell far, far larger if their owner doesn’t tend to them.
	Lyralla is panting hotly, but her brow is knitted with worry. “Are you... are you sure we won’t get caught?” Despite her concerns, a second hand joins the first, evenly coursing across the uneven surface of her partner’s bulging erection. Trickles of pre-cum fall onto her fingers, smearing across the hardened surface of her hands until they shine.
	“Relax. No one will be looking for us for another hour, and this closet is for my personal archives. Our assistants would never come in here without our permission. Besides, even if someone did see us slip in, it wouldn’t be inappropriate for me to be discussing the ancient treaty of Terrai over lunch in here.” Juro pauses to moan and step a little closer to his ant-like lover, pressing the fullness of his erection against her belly. Any closer and his face with disappear into her breasts. “Right there....”
	A smile replaces the worry on Lyralla’s golden lips, and her arms fall down onto Juro’s shoulders, squeezing him affectionately. “You know how I worry. I can’t imagine what that horrible red would do if she knew.” Her constant stroking of Juro slows, and a shudder wracks her upper body. “What I wouldn’t give for this whole mess to be behind us.” Her artificial eye unfocuses as she imagines it. “We wouldn’t have to hide anymore, and we could work in the diplomatic corps together, bringing peace and civilization wherever we go.” Her last organic limb slides down to cup at Juro’s balls, gently kneading his sensitive orb;s.
	Juro’s fuzzy, padded palms grab hold of the sides of Lyralla’s nectar-drizzling teats, his thumbs hooking underneath the bottoms to help support them. It’s a pointless gesture. The myr’s cushy chest-flesh wraps entirely around the insufficient digits, almost devouring them completely. The extra pressure squeezes out fresh dribbles of the cloying sweetness. A shining, amber drop spatters against his furry cheek, smearing a golden stain across the length of his muzzle. Juro’s tongue whips out to taste it, curling around the side of his face to gather every stray speck.
	He swallows and smiles fondly at the four-armed woman. “I’d have to make sure you had plenty to eat, because there is no way I’m giving up having this for lunch.” Juro kisses one of the leaking teats, running a surprisingly long and dexterous tongue over the surrounding areola to gather up the rogue trickles. The surrounding breastflesh is left gleaming from the impromptu spit-shine, and her other nipple has sympathetically engorged, jutting almost a full inch forward. You can only assume that it’s matching the one in Juro’s maw.
	The myr is busy leaning against the wall with her mouth open to reply, softly moaning as her furry mate begins to nurse. She pinches her spare nipple, squeezing the swollen thing shut before it begins to gush. Juro’s throat is bobbing as he swallows, the gentle sounds of his sucking barely loud enough to reach your [pc.ears].
	The big-balled diplomat tilts his head to look at Lyralla sidelong, letting the amber ambrosia slow so that he can talk. “Whatever happens, we have each other right now, and I wouldn’t give it up for the whole universe.” He bucks his hips forward, thrusting through three hands made slick by fragrant pre-cum, and she lets him, guiding him to the slippery gash hanging between her thighs. She has her abdomen pointed down, curling forward so that the shorter male can push into the feminine entrance at the end of it. Paired gasps of pleasure fill the air, one muffled by a mouth-filling tit, as he slips inside her.
	You can’t see the penetration too well, but it’s clear from the way his hips slowly grind forward that he didn’t ram it home all at once. He’s pushing forward a few inches at a time, then pausing and wiggling slightly to prepare for her for the next rounded bulge on his length. The distinctive tail that all kui-tan bear twitches from side to side, flailing faster the further inside he gets.
	Lyralla wraps her robotic limb around her mate’s shoulders and neck, almost crushing him into her rapidly draining tit. She rubs her cheek against his forehead and hair, closing her eyes and whimpering with each cunt-stretching knot he forces inside her abdomen. Her bottom two hands are still between his legs, rolling his balls around, caressing his sack, and enjoying the feeling of them swelling up with a fresh, sticky load for her alien womb.
	Slipping off in a moment of pleasure-induced clumsiness, she accidentally releases her pinched nipple, unleashing a pressurized stream of honeyed lactation. Juro’s ear instinctively flicks as a bit catches him there. The quick-witted ambassador eases off of the partially drained tit and lunges onto the other, nearly hosing himself down with the sticky fluid. His cheeks bulge out from the volume, but somehow he manages to avoid making any more mess.
	Lyralla’s spent tit dribbles for a moment, then stops. She moans as Juro reverses his stroke, slowly pulling out, if only to thrust back in. “S-sorry! I’m still not used to having honey! I didn’t get any on your clothes, did I?”
	“I don’t think so. It’ll wipe off, right?” Juro doesn’t seem to bothered by the glob of honey hanging from his ear or the fact that his face is smeared with it. He goes right back to guzzling the torrent coming from Lyralla’s tit after speaking. 
	“Good,” the myr pants, finally letting go of his balls, if only to let him thrust wholly inside her. The next push into her velvety depths forestals any further attempts at communication from either party. Juro’s mouth is far too full for talking anyway, and even if it wasn’t, he’d be too busy grunting and panting with how hard he’s pounding that downward-dangling abdomen.
	Lyralla isn’t doing any better. Her robotic legs are clicking noisily from the overwhelming amount of mixed signals her brain is sending, and they begin to lower her to the ground rather than give out entirely. She pushes Juro away, gushing nectar to the side as her ant-pussy makes the loudest, wettest-sounding, staccato slurp while his three knots pop out, one by one.
	The proud gold myr twists around to prone in a growing puddle of her own honey, her chitinous abdomen angled upward for more comfortable fucking. Her tits are partially squished by her own weight, bulging out around the sides, slick with glistening amber. Trickles of clear lubricant leak from her upraised pussy, mixed with Juro’s copious, white-tinged pre-cum. His balls look far bigger than before, and his cock pulses, jerking in the air with each beat of his heart.
	The kui-tan is on the proffered pussy in two shakes of an ant's tail, wrapping his hands around the chitinous organ so that he can properly pound into it. You can see much better from this angle, watching its lips distend with ease around the triple-knot bang. She’s either done this a lot or myr pussies are built to stretch around big, fat spheres.
	The gold ant has abandoned all traces of propriety. Her tongue is lolling out, lapping at some of the honey while her lower arms slide between the amber fluid and her own compressed breasts, toying with her sensitive, recently suckled nipples. Her upper arms eventually pull her face and tits up out of the puddle; the lower ones use the opportunity to squeeze and tug at her teats, expressing even more sweet nectar into the puddle beneath her. Her insectile tongue gathers the drops it can reach from her face, but there’s no helping the stickiness soaking the rest of her.
	Juro’s balls slap against her chitin’s underside with each thrust. The reserved kui-tan is fucking like a wildman, pounding her with regular, piston-like strokes. Sometimes he takes a hand off her abdomen to caress her near-hidden clit, causing her to coat his embedded shaft in even more lubricant. The mixed juices froth and bubble, dripping down the gleaming metal of Lyralla’s thighs on their way to the puddle below.
	//Ctail
	Your [pc.tail] wriggles around the edge of the door, openly dripping from the enticing sights and rich scents pressing against your senses. The parasitic sperm-harvester bodily tries to tug you into the room; it pulls tight again and again, anything to get at the ocean of kui-tan cream that’s about to burst forth from Juro’s balls. Without any leverage, it doesn’t even manage to budge you, but it does leave you flushed and panting. Goddamnit, you want that dick for yourself right now... and maybe those nectar-stuffed tits too.
	//Multi ctails
	Your [pc.tails] wriggle around the edge of the door, openly dripping from the enticing sights and rich scents pressing against your senses. The parasitic sperm-harvesters bodily try to tug you into the room, squirming and wriggling against one another in a frenzy of movement; they pull tight again and again, anything to get at the ocean of kui-tan cream that’s about to burst forth from Juro’s balls. Without any leverage, they don’t even manage to budge you, but they do leave you flushed and panting. Goddamnit, you want that dick for yourself right now... and maybe those nectar-stuffed tits too.
	//Nocunttailzbuthazdix
		//Clothed
		Your [pc.lowerGarment] grinds against your [pc.cocks] from the slightest shift in position. Standing still is hard enough without your crotch feeling so turned on that it could explode from the slightest provocation. {You can feel a few wet spots from your collected pre-cum but try not to focus on it./Trickles of pre-cum ooze down your [pc.leg], but you try not to focus overmuch on it./Streams of pre-cum run unchecked down your [pc.legs] to pool below you. You try to put it out of your mind, but part of you silently prays that no one notices it.} Someone is going to have to take care of this pent-up need post-haste.
		//Unclothed
		[pc.EachCock] is hard enough to split boulders, pulsing heavily against the side of the doorframe while you watch. Standing still this long is hard enough without your crotch constantly distracting you with pleasureful tickles of sensation. Even slight breezes are turning you on. {Heck, a droplet of pre-cum is hanging from your [pc.cockHeadBiggest] right now, but you try not to focus on it./Trickles of pre-cum ooze down your [pc.leg], but you try not to focus overmuch on it./Streams of pre-cum run unchecked down your [pc.legs] to pool below you. You try to put it out of your mind, but part of you silently prays that no one notices it.} Someone is going to have to take care of your [pc.cocks] post-haste.
	//Vaginas
		//not so wet
		Warm tingles of excitement radiate through your {feminine }sex{es} at every lewd act you witness. You {press your {[pc.knees]/[pc.thighs]} together, squeezing your folds around your [pc.clits]/wiggle instinctively, feeling every gentle breeze across your lips}, only making your [pc.vaginas] that much more eager. Juro’s dick would feel so good inside you - all hot and wet and slick and so perfectly ready to cum.
		//Pretty wet
		There’s a distracting surge in moisture between your {[pc.legs]/folds} at every increasingly lewd act you behold. The urge to touch them, to fondle your lips to the live performance you’re seeing, is almost overwhelming, and the naughty heat between your [pc.thighs] doesn’t help at all. If only you could join in. Juro’s dick would feel so good inside you, and Lyralla would taste so sweet. [pc.GirlCum] slithers down your [pc.legOrLegs] unchecked and unnoticed.
		//soaking
		Streams of [pc.girlCum] run down your [pc.thighs], the visible evidence of your unchecked and unsated desires. You shift position, battling the urge to touch yourself - maybe slip a finger or two... or three inside. Ultimately, you resist, but every movement has your [pc.clits] buzzing happily and yet more [pc.girlCumNoun] journeying toward the deepening puddle below. Why does Juro’s dick have to look so {delicious/yummy}, and Lyralla’s tits could really use a mouth back on them.
		//ultrawet++
		A huge puddle has already formed below thanks to your copious, overwet [pc.vaginas]. The [pc.girlCum] streams down your [pc.legsOrLeg] like a river of erotic lubrication, the unmistakable proof of your own unbridled eroticism. It’s a wonder Juro and Lyralla haven’t smelled the heady scent of your sex. It hangs around you like a cloud while you battle the instinct to try and plug the leak with an enthusiastic fist. The kui-tan doesn’t know what he’s missing. Lyralla isn’t anywhere near as slick or ready as you are.
	//Merge all
	Neither ambassador shows any sign of restraint or concern, too occupied by their own overstimulated mating instincts to worry about decorum, their bodies smashing against one another with wet slaps. The smaller male assaults his cybernetic lover with increasingly frenetic thrusts, his multiple knots thickening by the second. Lyralla whorishly moans, her whole body trembling. Looking back over her feebly twitching mechanical shoulder, she finds enough sense to beg, “Give it to me! Fuck me!”
	Juro responds by bottoming out. His whole body arches, every muscle working in one coordinated effort to bury his bulbous shaft in to the very base. His weighty balls tremble and quiver as they begin to unload. The fluid-caked ant-girl’s eyes widen, then roll back. Her tongue lolls out, sticky with unswallowed nectar, passively quivering and drooling in the face of her climax.
	Swelling larger by the second, Lyralla’s cock-stuffed abdomen gurgles audibly, packed with more cum than any unaugmented terran could handle. The skin beneath the chitinous plates becomes more visible by the second, stretched taut and shiny by the kui-tan’s copious load. Lyralla’s face drops into the honey, and she dimly moans. Sometimes she manages to drag her tongue around the pooled tit-sap to enjoy the flavor, but most of the time she’s just lying there, cumming from being so completely filled. 
	Juro stands rigid for the better part of a minute. His balls are visibly deflating before your eyes, slowly shrinking down until they’re little bigger than eggs. Then, the spent ambassador slumps over his insectile lover and pants heavily. His drained nuts are still quivering, still forcing more virile fluid into the climax-addled ant, but the bulk of his load has been deposited.
	They both lie there for a few seconds catching their breath. Juro recovers first, struggling up to his feet while still knotted inside her. He accidentally drags Lyralla a few inches through her puddled honey before getting comfortable. Running a hand fondly along her swollen abdomen, he remarks, “We may need to start taking longer lunch breaks.”
	Lyralla dazedly pulls her tongue back into her mouth. Her metallic eye whirrs as it points back at the kui-tan. “You’re going to have to get me more rations then. I can’t make nectar on love alone.”
	“Sometimes I wonder...” Juro retorts with an easy smile.
	Lyralla props herself up on her forearms and shakes her head. “If that were the case, I’d be pinned to my desk.”
	Juro grins wider. “Maybe I just need to get you a gift, you know - send you flowers and reap the rewards from my overwhelmed and overfilled love.” As soon as he finishes speaking, he pushes backward, popping the largest knot out. A cascade of white pours out around the second, smaller knot. The last two obstructions pop out much easier, leaving her well-stretched tunnel to gush spunk everywhere.
	You decide to move away before you get caught. Maybe you can find a quiet place to masturbate... or someone to help you with how hot you’re feeling.
*/