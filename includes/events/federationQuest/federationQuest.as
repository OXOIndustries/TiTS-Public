//FederationQuest: https://docs.google.com/document/d/1Wj-ZZxh2H3k6cgURx8ew5ZIWlY3wUPkYCHrr2SalIfs/edit#
//
//FEDERATION_QUEST:	0 - Quest denied
//					1 - Quest begun
//					2 - Final Fight ready to proc
//					~Resolutions~
//					3 - Defeated Queen, captured
//					4 - Defeated Queen, let go
//					5 - Rebels leave and agree to stop attacking
//					6 - Rebels leave and plan to hook up with Kuitan
//					7 - Rebels leave with Kara taking them to Mhenga
//					8 - Rebels leave with PC pledging to take them to Mhenga
//					9 - Rebels leave with PC paying for them to be taken to Mhenga
//					~Special~
//					10- Follow up to 8, PC succesfully took the rebels to Mhenga themselves

import classes.Items.Guns.RudimentaryRevolver;
import classes.Items.Treasures.QueenlyNecklace;
import classes.Items.Miscellaneous.GemSatchel;

//Sellera Quest Intro
public function selleraHelp():void
{
	clearOutput();
	clearMenu();
	selleraHeader();
	author("Savin");
	
	output("Stepping a little closer to the stoic red myr marshal, you suggest that you’ve done all the thinking you need to about what side of Myrellion’s history you want to be on. How can you help the Federation?");
	output("\n\nSellera allows herself the barest hint of a smile. <i>“I thought you might see things our way. The Federation could use someone with your talents and connections, Steele. And I’m not above saying that your technology... your weapons... could be the tipping point if and when the war gets hot again.”</i>");
	output("\n\nUnfortunately, you’re not sure you’ve got the resources to start passing out plasma rifles and shield belts to every Federation soldier.");
	output("\n\nSellera shrugs, seating herself on the edge of her desk. <i>“I don’t expect you to. But you can arm yourself. And perhaps... as an offworlder, you might be able to accomplish something even my most elite seem incapable of.”</i>");
	output("\n\nThat sounds like she has a job for you already.");
	output("\n\n<i>“Yes indeed. You picked an auspicious day to join the Federation’s war effort, Steele. As we discussed earlier, the rebels in this city -- and others -- have proved to be rather vexing. They’re being armed, and gaining intelligence, from outside the city. The damned queen still in Kressia is bad enough without an external supply line bringing arms and explosives in under our noses. We’ve eliminated several smugglers, but more keep popping up. We need to hit the source if we’re to have peace in the city.”</i>");
	output("\n\nYou nod. Reasonable enough, but... wouldn’t these supplies be coming from Gildenmere? You’re not sure what you can do against an entire city.");
	output("\n\n<i>“That’s what I suspected at first,”</i> Sellera answers coolly, <i>“but it appears that the Republic isn’t behind this. Not officially, anyway. I’m not even sure they have the means even if they wanted to. No, my scouts have traced back one of the most recent arms shipments -- several dozen bolt-action rifles, hand grenades, shaped charges -- to a city on the surface: Renneke. It was a Republic industrial center, and so became the target of a weeks-long artillery barrage until the city was almost completely flattened. It’s been abandoned for over a year now.”</i>");
	output("\n\nSo the rebels are being supplied from Renneke -- a ruin?");
	output("\n\n<i>“Yes. We now believe at least one major factory must have survived the barrage; perhaps partially shielded underground. Normally, I would have already sent commandos to assault the facility, ceasefire be damned... except the scouts also believe that there is a damn Queen personally running the operation. One who’s been disavowed by the Republic, no less.”</i>");
	
	processTime(8+rand(4));
	selleraFedQuestMenu();
}

public function selleraFedQuestMenu():void
{
	addButton(0, "The Queen", selleraQueen, undefined, "The Queen", "Find out more about this mysterious Gold Queen.");
	addButton(1, "Renneke", selleraRenneke, undefined, "Renneke", "Ask the Marshal about the city you’ll be travelling to.");
	addButton(2, "Commandos", selleraCommandos, undefined, "Commandos", "What can she tell you about the troops you’ll be working with.");
	addButton(3, "Mission", selleraMission, undefined, "Mission", "So what’s the plan?");
	addButton(14, "Back", selleraMenu, undefined, "", "");
}

public function selleraQueen():void
{
	clearOutput();
	selleraHeader();
	author("Savin");
	
	output("<i>“Disavowed?”</i>");
	output("\n\nSellera nods, picking a file up from her desk. <i>“Queen Estallia. Dubbed ‘the War Queen’ by her soldiers. Unlike most of the overgrown cows, Estallia at least had the plates to fight with the thousands of her children she sent into the grinder. She actually led from the front like a proper commander, even fought in the trenches. About as close as a gold can be to respectable. Which of course means that her fellow queens wanted nothing to do with her once the ceasefire was declared.”</i>");
	output("\n\nThe marshal makes a disgusted noise under her breath, thumbing open the file. <i>“Estallia went underground, intending to continue the fight, politics be damned. The Republic disavowed her and the soldiers that went with her -- somewhere between five hundred and a thousand. Reports vary. We know she’s been responsible for several raids along the western edge of No Myr’s Land, but we’ve never been able to track her unit back to their base. And we’ve tried. Ironically, and luckily for us, it appears her hired smugglers aren’t nearly as adept at subterfuge.”</i>");
	output("\n\nSo: rebel queen, armed and dangerous, sitting in a munitions factory with hundreds of soldiers at her command. " + (pc.isMischievous() ? "Piece of cake." : "That sounds like trouble.") + " What’s keeping her from just sending the troops in?");
	output("\n\n<i>“Aside from the political shit-storm us killing a queen would cause? Frankly, I </i>could<i> send my troops in, but I’d lose half of them in the process. The army remnant Estallia commands is dug in and fanatically loyal. Most of them are veterans, many her own children. As long as the queen stands, I suspect they will fight to the death. They have every time we’ve engaged the remnant before.”</i>");
	
	processTime(5+rand(3));
	
	selleraFedQuestMenu();
	addDisabledButton(0, "The Queen");
}

public function selleraRenneke():void
{
	clearOutput();
	selleraHeader();
	author("Savin");
	
	output("<i>“Tell me about Renneke.”</i>");
	output("\n\nSellera raises an eyebrow. <i>“Nothing much to say: standard industrialized city, built over a natural iron mine near the surface. About half the city was topside, bad real estate altogether: desert all around. Primarily produced small arms and ordnance during the war. Automobiles before. It was under-manned but heavily fortified when the IV Corps was ordered to take it. Every building was turned into a pillbox or hollowed out to hide artillery: fighting in the streets would have been a massacre for both sides. So we shelled it instead. The Republic forces holding the city retreated once it became clear we had no interest in taking the city’s facilities: we’d simply raze it to the ground.”</i>");
	output("\n\nAnd there was no Federation presence in the city after they took it?");
	output("\n\n<i>“Not after the cease-fire. We’ve consolidated much of our position, Steele. No need to hold ruins with no strategic value. Renneke is well behind our lines, and as I said, was largely decimated during the fighting. When the war officially comes to an end, we may dedicate the resources to rebuilding it and reopening the mines, but at present, it holds little value for us. Likely why Estallia’s remnant force chose it as their base of operations.”</i>");
	
	
	processTime(4+rand(2));
	
	selleraFedQuestMenu();
	addDisabledButton(1, "Renneke");
}

public function selleraCommandos():void
{
	clearOutput();
	selleraHeader();
	author("Savin");
	
	output("You ask the marshal about the commando team she’s sending with you.");
	output("\n\n<i>“You’ll be going in with a squad from the Seventh Pathfinders, led by a junior officer by the name of Thyrsa. " + (flags["MET_LIEVE"] != undefined ? "I believe the two of you are acquainted. " : "") + "The unit is made up of elite veterans, the best I have on hand. The unit was originally meant to act as sappers and artillery spotters, so Pathfinders are used to operating behind enemy lines without the possibility of support or reinforcements. You’ll find Thyrsa’s troops, while somewhat eccentric, are an extremely lethal fighting force.”</i>");
	output("\n\nFair enough. Do they have any experience with snatch and grab missions?");
	output("\n\n<i>“Nobody has experience capturing queens,”</i> Sellera grunts. <i>“Either they surrender when their daughters abandon them in a city falling around them, or they flee to Gildenmere before we get near them. No other queen has actually tried to fight before, at least not that we know of. Thyrsa should have some ideas for taking her prisoner: the details of the grab are up to her.”</i>");
	
	processTime(4+rand(2));
	
	selleraFedQuestMenu();
	addDisabledButton(2, "Commandos");
}

public function selleraMission():void
{
	clearOutput();
	selleraHeader();
	author("Savin");
	
	output("Alright, so where do you come in? She doesn’t expect you to storm the place like a one "+pc.mf("man", "woman")+" army, you hope.");
	output("\n\nSellera snorts, <i>“No! No. I’m sure you’re quite competent in a fight, Steele, but I’m not sending you in alone. Scout Thyrsa’s commando is preparing to move on Renneke as we speak: you’ll have two half-tracks and a dozen of my best soldiers with you. A small force, quick and quiet.”</i>");
	output("\n\nSounds like she doesn’t intend you to fight it out with the queen’s troops.");
	output("\n\n<i>“I don’t. If possible, you’re to get through this mission without killing anyone. High Command’s orders, in all their wisdom. Killing the queen causes an incident, not to mention makes her a martyr for her daughters. Capturing her, though... well, we have plenty of queens behind Federation lines. What’s one more?”</i>");
	output("\n\nSo she wants Estallia alive?");
	output("\n\n<i>“<b>Command</b> wants Estallia alive. Ours is to do and die. If at all possible, yes, your job is to bring the War Queen back alive and unharmed. There will be no consequences for </i>you<i> if you only bring back her head, however. The means by which you neutralize the queen will be left up to you and Scout Thyrsa. Talk her into submission, kidnap her in her sleep. Whatever you think is best. Just get it done, Steele.”</i>");
	output("\n\nSounds straightforward enough. Though you have to ask: is there any reward for such a dangerous undertaking?");
	output("\n\nSellera’s lips turn downward a moment, but she regains her neutral expression a heartbeat later. <i>“I understand you offworlders have a rather mercenary attitude. Conveniently, I have a mercenary budget on hand as well. Ostensibly to pacify or recruit the local nyrea, but as they seem content to remain in the deep caves...”</i>");
	output("\n\nShe reaches into a drawer on her desk and takes out a rather heft-looking pouch from inside, tossing it to you. You catch it and take a peek inside: it’s full of dark-colored gemstones, several dozen of them. Swiping your Codex over the lot, the Steele mineral analysis suggests something in the neighborhood of 20,000 credit’s worth. A serious sum.");
	output("\n\n<i>“Satisfactory?”</i>");
	
	processTime(15+rand(5));
	
	selleraFedQuestMenu();
	addDisabledButton(3, "Mission");
	addButton(5, "You’re In", selleraLetsDoThis, undefined, "You’re In", "Let’s go bag a Queen.");
	addButton(6, "No Thanks", selleraNoThanks, undefined, "No Thanks", "Generous offer, but you’re going to have to pass. You doubt you’ll get a second chance.");
}

public function selleraNoThanks():void
{
	clearOutput();
	clearMenu();
	selleraHeader();
	author("Savin");
	
	flags["SELLERA_DENIED"] = GetGameTimestamp();
	flags["FEDERATION_QUEST"] = 0;
	
	output("After a few moments of consideration, you shake your head and toss the gem bag back. <i>“Sorry, Marshal. Not interested.”</i>");
	output("\n\n<i>“Disappointing,”</i> Sellera says, taking your refusal in stride. <i>“I see your interest in the Federation’s success was overstated. Very well. See yourself out, Steele, I have a raid to oversee.”</i>");
	output("\n\nCold. You turn back towards the elevator and make yourself scarce.");
	
	processTime(2);
	addButton(0, "Next", move, "834");
}

public function selleraLetsDoThis():void
{
	clearOutput();
	clearMenu();
	selleraHeader();
	author("Savin");
	
	flags["FEDERATION_QUEST"] = 1;
	
	output("<i>“Alright, I’m in,”</i> you say, even as Sellera plucks the pouch out of your hand. Guess you aren’t getting paid up front.");
	output("\n\nSellera bounces the pouch in her hand, making it jingle against her chitin. <i>“Good to hear. <b>Thyrsa’s Pathfinders should be getting ready near the city gates</b>, in the old bunker. Join them when ready. Best of luck, Steele.”</i>");
	output("\n\nYou nod, turning back towards the elevator. Time to go bag yourself a queen!");
	
	processTime(2);
	addButton(0, "Next", move, "834");
}

//Quest Rejected: Lieve’s Return
public function lieveReturn():Boolean
{
	clearOutput();
	lieveHeader(false, true);
	clearMenu();
	author("Savin");
	
	output("As you step into the bunker, you’re greeted by an overpowering, unfamiliar odor. It smells like a much murkier, wetter pork mixed with... something fungus-ish. Your nose wrinkles up at the stench. Glancing around, you find the source: a pot over a small cookfire in the corner, tended to by Lieve’s trench wives. The red myr herself is sitting by the firing port, nursing a bowl of what must by a local stew. A bandage is wrapped around her forehead, and the chitin not hidden by her uniform is showing more than a few new dents and scars. ");
	output("\n\n<i>“You okay, Lieve?”</i> you ask, taking a seat beside her when she waves you in.");
	output("\n\n<i>“Hey. Yeah. I’ll live,”</i> she says, very gingerly setting her bowl aside. <i>“Just got winged by some buckshot. Better than I can say for most of my unit.”</i>");
	output("\n\nOh. What happened?");
	output("\n\nShe sighs and rubs one of the new scars on her arm plate. <i>“We were sent to capture a terrorist -- a Gold queen that went rogue and was supplying the rebels in the city, raiding our border outposts. Mission went south: it was an ambush. Rebels destroyed one of our half-tracks and caught us in a crossfire while we tried to pull out the wounded. We were in a gunfight for almost an hour, right until our ammunition ran out and we had to fight our way out with hand weapons.”</i>");
	output("\n\nSounds rough. Did they capture their target?");
	output("\n\nLieve shakes her head. <i>“We ran into her in the fight. She came at us like a four-meter behemoth, swinging swords bigger than I am in either hand. Tore through most of us... until Sergeant Venna went at her with a hand grenade. It was...”</i> she trails off with a shudder. <i>“Well, Queen Estallia isn’t a threat anymore.”</i>");
	if(pc.isNice()) output("\n\nYou put a hand on Lieve’s shoulder. Best you can do, given the circumstances.");
	else output("\n\nOuch.");
	output("\n\n<i>“Let’s... let’s change the subject, hmm?”</i> Lieve suggests, forcing herself to smile. <i>“I’m sure you didn’t come here just to hear me... whatever I’m feeling right now. So, how are you doing?”</i>");
	
	flags["SELLERA_DENIED"] = undefined;
	processTime(7+rand(3));
	
	lieveMenu();
	return true;
}

//Accepted Quest: Meeting the Pathfinders
public function tryProcFederationQuest():Boolean
{
	if(flags["FEDERATION_QUEST"] != 1) return false;
	
	flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	
	output("\n\nA pair of treaded armored trucks are idling outside of the gatehouse bunker. Both are painted black, with the golden crossed hammers of the Federation proudly emblazoned on their flanks. A large-bore machine gun sits on turret above the cabin of each truck, with a belt of ammunition hanging down into the open top.");
	output("\n\nA dozen female Federation troops are gearing up around the trucks, loading in crates of supplies or checking weapons in preparation. " + (flags["MET_LIEVE"] != undefined ? "Lieve herself " : "A woman with officer’s stripes who must be the Lieve you were told about") + " is walking among them, issuing orders and double-checking her troops’ preparations. Seeing you, she steps away from the rest of the commandos, motioning you over.");
	
	addButton(0, "Lieve", fedQuestRendevous, undefined, "Lieve", "Go over and talk to Lieve. Better be ready to embark as soon as you do: she and her squad look eager to depart.");
	
	return true;
}

public function fedQuestRendevous():void
{
	clearOutput();
	clearMenu();
	showBust("LIEVE", "RED_COMMANDO", "RED_HEAVY_WEAPONS");
	showName("THE\nPATHFINDERS");
	author("Savin");
	
	if(flags["MET_LIEVE"] != undefined) output("<i>“Steele!”</i> Lieve grins, sauntering up as you approach. <i>“Marshal Sellera’s office radioed down and said we were getting some off-worlder help. I didn’t expect that to be you! Welcome aboard.”</i>");
	else output("<i>“You must be the offworlder Marshal Sellera’s office radioed down about. I’m Lieve, commander of the Pathfinders here. Good to have you with us.”</i>");
	output("\n\nLieve gives you a clap on the shoulder, leading you into the midst of the Federation squad under her command. Several black-clad red myr women glance up at you with a mix of suspicion and wonder -- most, you guess, haven’t seen many off-worlders before. The troops you see are all older myr, at a glance, mostly looking to be in their late twenties or early thirties, compared to the fresh young faces of most of the myrish soldiers you’ve seen thus far; many are showing scarred flesh or chitin on what little skin isn’t covered by their uniforms.");
	output("\n\nA couple of " + (flags["MET_LIEVE"] == undefined ? "unfamiliar " : "") + "gold myr are moving among the ranks too, bringing food or cleaning bits of gear. The commandos pretend not to notice them, save for a single short, boyish myr standing over them. When the pair finish, their mistress gives them each a long kiss on the lips and sends them off into the bunker, giggling and flush-faced. Once the door’s shut behind them, Lieve calls the unit together:");
	output("\n\n<i>“Alright ladies, this is what we’ve been waiting for. Finally have actionable intel on the War Queen’s location thanks to the smugglers MPs caught last week. Since we’re the best, we get the most dangerous job. The bad news is, our Glorious Leaders have, in their wisdom, decided that we’re to take her alive.”</i>");
	output("\n\nThere’s a general grumbling and hissing from the commandos as they group up around Lieve. She puts her hands up, <i>“...Which means, rather than dropping a thousand pounds of ordinance on her head, we’re being sent in to grab her. And we won’t have any on-site support: don’t want to tip the bitch off that we’re coming. Artillery fire is green lit only to cover our exfil.”</i>");
	output("\n\nOne of the black-clad soldiers grunts, <i>“What the fuck? Is Command trying to get us killed?”</i>");
	output("\n\n<i>“Just you, Marik,”</i> Lieve quips back, hefting herself up onto the hood of one of the armored trucks, facing the rest of the troops. <i>“Thankfully, Marshal Sellera’s managed to find us some backup. Everyone, meet [pc.name] Steele. You’ve all been briefed on how off-worlders fight: [pc.heShe] will be our walking tank. Let [pc.hisHer] shields take the hits, and we’ll sweep up after [pc.himHer].”</i>");
	output("\n\n<i>“So how do we capture a queen that <b>wants</b> to fight?”</i> another of the troop asks. <i>“Dog-pile her?”</i>");
	output("\n\nLieve chuckles, <i>“As much as I’d like to see that, I also don’t want to watch a four-meter mountain of muscle rip you in half. So no. We’ve got nets and chains in the half-track, along with a case of tranquilizers -- the big ones they use to knock out riding flordas. The brief says it might take three to five shots with them to bring down a queen-sized target, so don’t waste ‘em. The real problem is going to be getting something that fat out of her base: even if we do sneak in without alerting her guards, I wouldn’t put my coin on us being able to drag her out under her daughters’ noses. Getting the War Queen back to the half-tracks is going to be a fight and a half.”</i>");
	output("\n\nGlancing between the troops, Lieve adds <i>“Yeah, I know. It’s gonna be rough, but we’ll manage. Always do. Any questions?”</i>");
	
	flags["MET_LIEVE"] = 1;
	processTime(15+rand(5));
	
	addButton(0, "Your Role", fedQuestYourRole, undefined, "Your Role", "So what does Lieve want you to do exactly?");
	addButton(1, "The Queen", fedQuestTheQueen, undefined, "The Queen", "What can Lieve tell you about the War Queen?");
	addButton(2, "Resistance", fedQuestResistance, undefined, "Resistance", "How much resistance are you actually expecting.");
	addButton(3, "Support", fedQuestSupport, undefined, "Support", "So there’s not going to be any support from the Federation?");
	addButton(5, "Ready2Go", fedQuestReady2Go, undefined, "Ready2Go", "Tell the commandos you’re ready to depart.");
}

public function fedQuestSupport():void
{
	clearOutput();
	author("Savin");
	
	output("<i>“No,”</i> Lieve answers when you ask. <i>“If we send a larger detachment, the Queen’s soldiers will see us coming a mile away. We’ve only got one shot at this: we can’t fuck it up. Artillery is a no-go since Command wants her alive, but we’ll be able to call it in once we have her, use it to cover our escape if need be.”</i>");
	output("\n\nYou’d ask about air cover or... anything... but thinking back to you arrival on the planet, escorted by biplanes... that’s probably about the best they can do.");
	output("\n\nOne of the commandos, Marik, chimes in: <i>“At least we’ll have the half-tracks. More firepower in one of these beasts than a whole company of Goldies.”</i>");
	output("\n\nYou glance up at the single machine gun mounted on top. Well, guess that beats bolt-actions...");
	
	processTime(3);
	
	addDisabledButton(3, "Support");
}

public function fedQuestResistance():void
{
	clearOutput();
	author("Savin");
	
	output("<i>“The Marshal said something about almost a thousand soldiers with the Queen...”</i>");
	output("\n\n<i>“Yeah, she’s got quite the little army,”</i> Lieve smirks. <i>“They’re spread out, though, all over Renneke and other places. The smugglers we caught gave up that the Queen’s planning a raid in the north, near the Fessaran causeway. Most of her soldiers should be deployed that way for several days. The Queen should only be guarded by a few dozen troops at most.”</i>");
	output("\n\nA few dozen? That’s still...");
	output("\n\n<i>“Double that, and they might have a chance!”</i> one of the commandos boasts, earning a few laughs from the others.");
	output("\n\nLieve puts up a hand to quiet them, <i>“We’re expecting infantry only, but they’ll be dug in. Boobytraps, mines, and emplaced guns are the order of the day. We’ll need to stay quick and quiet to avoid getting bogged down in a shootout. And keep that minesweeper handy, Seresh.”</i>");
	
	processTime(3);
	
	addDisabledButton(2, "Resistance");
}

public function fedQuestTheQueen():void
{
	clearOutput();
	author("Savin");
	
	output("<i>“So what do we know about the Queen?”</i>");
	output("\n\nLieve shrugs. <i>“About as much as the Marshal probably told you, Steele. Estallia, aka the War Queen, is the only one of her kind to fight on the front lines. Led a battalion of her own daughters into combat, apparently quite effectively. Estallia and Sellera went head to head for most of the end of the war -- we all know how that turned out for her.”</i>");
	output("\n\nThe rest of the troops laugh and cheer, tossing a few profanities about how they kicked the Queen’s ass in the war. And that they’ll do it again, too -- this time in person.");
	output("\n\n<i>“We know the queen’s big. Maybe four meters tall. Carries a pair of massive swords -- and I mean <b<massive</b>. Crush light armor kinda big. She’s got more chitin than most myr of either race, and apparently bolts metal to it, making herself like a walking tank. Taking her out through direct action is going to be... tough. And for a giant gold death machine, she’s surprisingly wiley -- prefers ambuscade and misdirection to frontal attacks. One of the only generals to realize hurling troops at gun lines was less than genius. Maybe that’s why her troops love her so much. That, or that fact that she’s their mom.”</i>");
	output("\n\nLieve chuckles at herself. <i>“Not much more to say, really. Like I said, her troops are insanely loyal, so Fed Intel could never get close to her. Couldn’t even get the cypher for their comms out of prisoners, no matter how much venom we plied them with. Almost respectable.”</i>");
	output("\n\n<i>“You would think that, gold-fucker!”</i> Marik says, flicking her tongue through a v-shaped cleft between two fingers. Some of the other troopers laugh, though a bit more hesitantly than before. Lieve takes something -- a bullet, maybe -- out of her vest pocket and flicks it at the bigger myr’s head, bouncing it off her red mohawk.");
	
	processTime(5);
	
	addDisabledButton(1, "The Queen");
}

public function fedQuestYourRole():void
{
	clearOutput();
	author("Savin");
	
	output("<i>“What’s my role going to be in this?”</i> you ask. Looking between the pack of red myr veterans, they look like they can handle themselves pretty damn well.");
	output("\n\n<i>“Damn right we can!”</i> Marik boasts, curling an arm up and showing off her impressive musculature. One of the commandos next to her wraps black-plated digits around the big woman’s bicep, giggling and giving it a squeeze.");
	output("\n\nLieve rolls her eyes. <i>“I’m sure your bodybuilding is real impressive to the people with </i>space ships<i>, Marik. Wanna show off your trophies next? Anyway Steele, your job on this op is going to be our... distraction. If everything goes smoothly, you’ll just run with my team and provide support while we take down the queen. But when things inevitably go tits-up, we’re going to be relying on you to cover us: those spacer weapons and shields are going to prove their worth against dozens of fanatical guerilla fighters.”</i>");
	output("\n\nSo basically, you get to do all the heavy lifting in the fight. Guess that’s why they pay you the big bucks.");
	output("\n\nLieve grins. <i>“Yeah, just don’t get in over your head. Your shields can handle a lot, but the goldies will be throwing a lot of fire at you once we bag their mother. Don’t get overwhelmed: last thing you want is ending up held for ransom by these people. Wouldn’t be the first star-walker the goldies have nabbed like that to fuel what’s left of their war effort.”</i>");
	
	processTime(5);
	
	addDisabledButton(0, "Your Role");
}

public function fedQuestReady2Go():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showBust("LIEVE", "RED_HEAVY");
	showName("LIEVE\n& MARIK");
	
	output("<i>“Everybody get your shit, check your weapons, pile into the half-tracks. We leave in ten,”</i> Lieve says, thumping her fist on the side of one of the trucks. The commandos hop to it, finishing up their preparations with gusto. While they work, Lieve pulls one of them -- the big, burly red myr called Marik -- aside and brings her over to you. ");
	output("\n\nQuiet enough so just the three of you can hear, Lieve says, <i>“[pc.name], this is my second, Staff Sergeant Sterre Marik. Also known as the biggest pain in the ass in the Federation army.”</i>");
	output("\n\nThe sergeant, a dark-plated myr standing head and shoulders above Lieve, laughs boisterously. The pair of antenna poking up on either side of her hawk of crimson hair bob gaily, in stark contrast to the scarred, brutish figure below. <i>“Ah, she’s just boiling her chitin over losing the division hand-to-hand tourney to me last week! Pleasure to finally meet you, Captain. ");
	if(hasFuckedLieveSolo()) output("Lieve here’s been gushing about you like a schoolgirl for a while. ");
	else if(reclaimedProbeMyrellion()) output("Heard impressive things about you -- hope they’re all true. ");
	output("Look forward to seeing what you can do.”</i>");
	output("\n\nLieve " + (hasFuckedLieveSolo() ? "flushes and " : "") + "crosses her arms. <i>“Ehem. I’m going to be busy running the squad, so I’ve asked Marik here to look after you while we’re in the field. Not saying you can’t handle yourself, but-”</i>");
	output("\n\n<i>“But you aren’t used to working with Federation troops. Don’t worry, top, I’ll make sure [pc.heShe] doesn’t wander off at the first sight of honey-tits.”</i>");
	output("\n\n<i>“You better,”</i> Lieve grins. <i>“Or <b>you’re</b> explaining to the marshal how you lost Captain Steele.”</i>");
	output("\n\nThe head scout gives Marik a clap on an armored shoulder and, noticing one of the other Pathfinders about to drop an ammunition crate, shouts and stomps off. Marik chuckles and turns her attention to you, ");
	if(pc.tallness < 6*12) output("looking down at you, hands on her hips. ");
	else if(pc.tallness < 7*12+1) output("staring at you more or less eye-to-eye -- she really is huge for a myr, now that you’re alone with her. ");
	else output("looking up at you with hands on her hips. She might be bigger than any other myr you’ve seen, but you’re still towering over her.");
	
	processTime(15+rand(5));
	
	addButton(0, "Greet", fedQuestMarikGreet, undefined, "Greet", "Play nice with the great big myr amazon.");
	addButton(1, "Snark", fedQuestMarikSnark, undefined, "Snark", "Oh great, a babysitter.");
	addButton(2, "Flirt", fedQuestMarikFlirt, undefined, "Flirt", "A big, strong red myr woman is just the kind of bodyguard you were hoping for.");
}

public function fedQuestMarikGreet():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showBust("RED_HEAVY");
	showName("\nMARIK");
	
	output("Figuring you might as well be nice, you extend a hand and properly introduce yourself. Marik looks at your hand hovering between you for a moment, seemingly confused by the gesture, before a moment of clarity washes over her face and she takes your hand into a crushing, bear-like grip and shakes it vigorously. <i>“Right, sorry. I sorta slept through the second half of the ‘interacting with off-worlders’ course.”</i>");
	output("\n\nThe sergeant chuckles at herself and puts an arm around your shoulders, turning you towards one of the armored trucks. <i>“Listen, just follow my lead when the lead starts flying. Do your part, and me and the girls will make sure you make it through no problem.”</i>");
	output("\n\nSounds fair. Though wasn’t Lieve talking about having <i>you</i> do the heavy lifting?");
	output("\n\nMarik shakes her head. <i>“Boss-girl likes to think you offworlders are some kinda gods. Much as I’d like that to be the case, something tells me space gods can catch a bullet same as anybody else. I don’t know about how you conduct war, but we work together here. I don’t want to see any loner hero shit, alright? Let us cover you while you do your... alien badass thing.”</i>");
	output("\n\nGuess that’s fair enough. Marik leads you to the back of one of the armored trucks and ushers you up the hatch.");
	
	fedQuestDepart();
}

public function fedQuestMarikSnark():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showBust("RED_HEAVY");
	showName("\nMARIK");
	
	output("<i>“Oh great, a babysitter,”</i> you groan, watching Lieve walk off. This is just what you need.");
	output("\n\n<i>“Yeah, what does that make you then?”</i> the big myr smirks, eying you up. <i>“Look, just follow my lead, put some holes in gold bitches, and we’ll be good. Think you can manage?”</i>");
	output("\n\nYeah, if she can keep up. " + (pc.isAss() ? "Damn primitives. " : "") + "You heft up your [pc.weapon] and follow in Lieve’s wake towards the back of one of the armored trucks, hauling yourself up the hatch and into the belly of the beast.");
	
	pc.addMischievous(3);
	fedQuestDepart();
}

public function fedQuestMarikFlirt():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showBust("RED_HEAVY");
	showName("\nMARIK");
	
	output("Flashing a smile ");
	if(pc.tallness < 6*12) output("up ");
	else if(pc.tallness > 7*12) output("down ");
	output("at the imposing red myr, you wonder aloud just what she can do with all those rippling muscles of hers. Marik grins and plants her hands firmly on her hips, flexing enough that you can see her biceps in all their glorious definition through the too-tight sleeves of her uniform.");
	output("\n\n<i>“Make it through this mission and maybe you’ll find out,”</i> she says, giving you a sudden clap on the shoulder, nearly enough to knock you forward. <i>“Listen, just stick with me -- and try not to stare at my ass <b>all</b> the time -- and I’ll make sure you get through this no problem.”</i>");
	output("\n\nSounds fair. Though wasn’t Lieve talking about having <i>you</i> do the heavy lifting?");
	output("\n\nMarik shakes her head. <i>“Boss-girl likes to think you offworlders are some kinda gods. Much as I’d like that to be the case, something tells me space gods can catch a bullet same as anybody else. I don’t know how you conduct war, but we work together here. I don’t want to see any loner hero shit, alright? Let us cover you while you do your... alien badass thing.”</i>");
	output("\n\nGuess that’s fair enough. Marik leads you to the back of one of the armored trucks and ushers you up the hatch.");
	
	flags["MARIK_FLIRTED"] = 1;
	fedQuestDepart();
}

//Leaving for Renneke
public function fedQuestDepart():void
{
	output("\n\nYou take a seat " + (pc.isTaur() ? "in the middle of the truck’s bed" : "on one of the side benches") + ", soon followed by Marik and before long, another half-dozen commandos. Lieve herself, though, is nowhere to be seen.");
	output("\n\n<i>“Lieve’s up in the cabin,”</i> Marik says, seeing you glancing around. <i>“Farm girl made the mistake of telling somebody she drove tractors back home. Guess that makes her our driver. Which means you better buckle up: it’s gonna be a bumpy ride.”</i>");
	output("\n\n" + (pc.isTaur() ? "Rather than a seatbelt, you find a harness behind you not unlike what you’d find on your ship. You strap in, watching as " : "One of the other commandos hands you a cord tied off to the top of the truck: something to hold onto at least. You wrap it around your wrist as ") + "the last member of the squad embarks. The shorter myr with the trench wives, you’re pretty sure. She hauls the hatch closed and steps up to the turret overhead, racking back the bolt of the heavy gun. The rest of the squad breaks out their own weapons, primitive rifles for the most part, though Marik pulls a bigger gun with an enormous magazine off a rack on the side of the truck.");
	output("\n\n<i>“Alright, ladies, trade your field kit out for extra ammo and tranqs. We’re going in quiet, coming out hot. Big guns will cover us as much as they can, but when we’re inside the compound, it’s rifles and hand-weapons.”</i>");
	output("\n\n<i>“Yes sergeant!”</i> the commandos shout back, half drowned-out by the sudden roar of the engines. A thrumming vibration runs through the bed of the armored vehicle. Somehow this ancient-looking iron beast feels like it’s shaking harder than a ship about to make a LightDrive jump -- you grip your harness tighter and grit your teeth, just hoping that growing howl from up front doesn’t turn into an explosion.");
	output("\n\nThankfully it doesn’t, though the truck roars and something loud pops from behind you, almost as loud as a gunshot. A couple of the commandos catch sight of you and laugh");
	if(pc.isBro()) output(", prompting you to flash them a sexy grin and a wink. At least now they’re giggling for a different reason, and blushing a darker hue of red. ");
	else if(pc.isAss()) output(", right up until you scowl at them and adjust your [pc.weapon]. ");
	else if(pc.isBimbo()) output(". You’re not sure why, but they seem happy! You just giggle along with them, and soon the whole squad is snickering for some reason! Aren’t these cute lil’ ants nice? ");
	else output(". ");
	output("The truck starts moving a few moments later, lurching forward and grinding its treads into the rocky tunnel, followed swiftly by the other truck and the rest of the commandos.");
	output("\n\nNext stop: Renneke, and Myrellion’s surface.");
	
	processTime(10+rand(5));
	addButton(0, "Next", fedQuestTrip, undefined, "", "");
}

public function fedQuestTrip():void
{
	clearOutput();
	clearMenu();
	moveTo("RENNEKE");
	author("Savin");
	showBust("RED_HEAVY_WEAPONS", "RED_COMMANDO", "RED_COMMANDO", "RED_COMMANDO");
	showName("\nHALF-TRACK");
	
	output("The trip to the surface is a long and bumpy crawl through the tunnels of No Myr’s Land; a dark and silent wasteland broken only by the trucks’ headlights and the low rumble of their engines. Once you’re out of Kressia, it quickly becomes too dark to see much further than your hands, leaving the rest of the commandos shrouded in shadows, little more than glimpses of red chitin and polished gunmetal.");
	output("\n\nThe rest of the soldiers are mostly silent, save for the occasional joke or complaint. The engines of the two trucks make it impossible to hold a conversation. " + (flags["MARIK_FLIRTED"] != undefined ? "As much as you might try and talk Marik up along the way, the better half of what either of you two say is totally drowned out by the racket. " : "") + "All you can really do is shove the noise into the background and lean your head back against the shuddering side of the armored truck, trying to get some rest before the mission. You’re hardly the only one with the idea.");
	
	processTime(35+rand(10));
	addButton(0, "Next", fedQuestArrive, undefined, "", "");
}

public function fedQuestArrive():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showBust("RED_HEAVY_WEAPONS", "RED_COMMANDO", "RED_COMMANDO");
	showName("\nRENNEKE");
	
	//Give the PC the full benefit of a sleep. No Lust gain. Set time to 12:00.
	var lust:Number = pc.lust();
	sleepHeal();
	if(hours >= 12) processTime((23-hours)*60 + (60-minutes));
	processTime((11-hours)*60 + (60-minutes));
	pc.lust(lust, true);
	
	output("You’re woken up by a plated hand on your shoulder, giving you a rough shake. The world is blinding when you open your eyes, searing them so badly you recoil and cover your face. Marik laughs, a little more clearly now that the engines aren’t echoing in the tunnels.");
	output("\n\n<i>“Welcome to Renneke, Steele,”</i> she laughs. <i>“Population: a shitload of gold assholes. Get your shit ready: top says we’re coming up on the mission area.”</i>");
	output("\n\n" + (pc.isMischievous() ? "Well, at least they had the decency to wake you up first! " : "") + "You groan, rubbing at your eyes until the truck’s crew comes into focus under the beating desert sun. The rest of the commandos aren’t doing much better in the bright light, shielding their black eyes or pulling on darkened goggles. Overhead, towering ruins loom over the trucks on either side: bombed out stone buildings, most just crumbling walls two stories high; others, little more than a few beams sticking up out of the rubble piled on the sides of the street.");
	output("\n\nLieve wasn’t kidding when she said the Federation flattened this place.");
	output("\n\nMarik stops jerking you around long enough to check her watch. <i>“Okay, ladies, safeties off. We’re-”</i>");
	output("\n\nThe burly sergeant stops mid-sentence, her antennae perking up. " + (pc.earType == GLOBAL.TYPE_CANINE || pc.antennaeType > 0 ? "Your keen senses pick it up, too: " : "It takes you a split second to hear it, too: ") + "a faint, hissing whine. Getting closer.");
	output("\n\n<i>“<b>INCOMING!</b>”</i> Marik howls.");
	output("\n\nBefore you can blink, she’s grabbing you and shoving you against the side of the truck, shielding you. The whine turns into a howl, then into an explosion so close that the truck nearly capsizes, blown sideways by the blast. Debris and shrapnel erupt overhead, showering down on you like metal rain. A shock of pain in your [pc.ears], and that’s the last thing you really <i>hear</i> for several seconds: you feel the next explosion more than anything, your whole body shuddering with close impact. You can see the other commandos screaming: some in fear, others pain, clutching lacerations or fractured chitin.");
	output("\n\nMarik shouts something in your ear, but it the ringing drowns it out completely. You just give her a weak thumb’s up and shift in your harness. Something else explodes nearby in one of the buildings, and this time it’s a cloud of dust washing over the truck, blinding you and biting at your eyes.");
	output("\n\nThe first words you hear again are <i>“Fucking mortars!”</i> screamed by one of the commandos, clutching her rifle to her chest. <i>“Fuck!”</i>");
	output("\n\n<i>“Drive, dammit!”</i> Marik shouts, banging a fist on the back of the cabin. You can already feel the truck accelerating, but it’s a heavy, slow beast, meant to soak up bullets, not bombs from on high. Hell, you don’t even have a roof!");
	output("\n\nYour moment of hearing is cut short: the myr on the heavy gun sees something and squeezes the trigger, letting loose a deafening cacophony of massive gun-blasts. Shell casings the length of your fist rain down into the bed, smoking in the sunlight.");
	output("\n\nMarik shouts something, putting a hand on your chest and pressing you to the side again. The truck veers hard to the right, almost lifting its treads off the ground again, and suddenly you’re hearing more gunfire than just the heavy machinegun: the other truck’s gun opens up, followed by small arms from the streetsides. Bullets crack and ping against the armored sides, adding to the deafening noise.");
	output("\n\n<i>“Had this whole street zeroed from the start!”</i> Marik grunts, keeping you both pinned and shielded with her body. <i>“Driving into a goddamn firing squad!”</i>");
	output("\n\n<i>“Oh, shit, rocket!”</i> the woman on the MG shouts down. She bangs on the cabin, and the truck swerves hard. You hear another explosion, this one way bigger than before, and the building to your left just about collapses in a cloud of dust and falling stone.");
	output("\n\nThere’s another explosion, this time accompanied by a fireball that washes over the back of the truck. Everyone screams, ducking as chunks of steel go flying.");
	output("\n\nYou glance up at the gunner. She’s wide-eyed, looking back from her vantage in the turret. <i>“Truck two’s flipped! Landed a fucking shell right on the hood.”</i>");
	output("\n\nThat’s half the squad gone, or left behind at the very least. The women in your truck start cursing and screaming until Marik grabs the gunner: <i>“Tell Lieve to find us some goddamn cover or we’re next!”</i>");
	output("\n\nThe gunner nods and starts yelling into the cabin. The truck can’t go any faster, but it starts zigzagging down the street, as close to serpentine as a giant armored deathtrap can go. Marik turns to you, hefting up her automatic. <i>“Hope you’re as good as they say, Steele. We’re-”</i>");
	output("\n\nSomething heavy hits Marik before she can finish, barreling the sergeant to the floor. It takes a second for you to process what you saw: the gunner, tumbling back into the truck bed clutching at her throat, coughing up blood.");
	output("\n\n<i>“MEDIC!”</i> Marik shouts, and then she’s clambering into the turret, firing the machinegun nonstop.");
	output("\n\nA few frantic heartbeats later and the sun vanishes, replaced by solid concrete: another tunnel? The gunfire stops abruptly, the last few rifle shots pinging off the hull of the armored truck before Lieve takes a turn and guns the engines towards... something you can’t see. Then the truck’s engines cut, lurching you forward as it slows, then stops.");
	
	addButton(0, "Next", fedQuestArrive2, undefined, "", "");
}

public function fedQuestArrive2():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showBust("RED_HEAVY_WEAPONS", "RED_COMMANDO", "RED_COMMANDO");
	showName("\nRENNEKE");
	
	output("<i>“Where are we!?”</i> Marik shouts down, letting the gun cool for a second.");
	output("\n\n<i>“Uh... parking garage?”</i> Lieve answers, sticking her head up through a hatch. <i>“Only entrance underground I could see. Should be across the street from the target building.”</i>");
	output("\n\nMarik grunts. <i>“Yeah, with half the squad roasted and a hundred angry golds about to swarm us. What the shit, Lieve, how did they know we were coming?”</i>");
	output("\n\n<i>“I thought those smugglers broke a little too easily,”</i> the squad’s leader sighs. <i>“Doesn’t matter now. Everyone spread out and find cover: they’re coming.”</i>");
	output("\n\nYou and the commandos pile out the back of the truck, grabbing your weapons and spreading out to various chunks of rubble and burned-out husks of cars spread around the garage. The concrete overhead shudders with an impact, a distant explosion, and dust and detritus rains down on you. You can hear footsteps in the distance, getting closer every second. You glance back to the truck, watching Marik swivel the machinegun around towards one of the entrances. The truck looks much worse for wear: covered in dents, scorch-marks, and bullet holes. You’re not sure it would have made it much further anyway.");
	output("\n\nYou feel a hand on your shoulder, and look up to see Lieve beside you, bracing the butt of a shotgun on her hip. <i>“Okay, [pc.name]. " + (hasFuckedLieveSolo() ? "If we don’t make it through this... it’s been fun. Tell the girls I love ‘em. " : "This is where you show us how awesome you spacers are. ") + "You’re going to have to take the brunt of this attack. I’m sorry, but we’re already down half the squad.”</i>");
	output("\n\nEven if you wanted to, there’s not much chance for escape now. The golds will be on you in seconds. You " + (pc.hasShieldGenerator() ? "can only hope your shields last" : "really wish you’d mentioned you don’t actually have a shield generator beforehand... you’re not much tougher than the commandos without one") + ".");
	output("\n\nYou take a deep breath and ready your [pc.weapon]. From just around the corner, you hear a shrill whistle followed by beating footsteps, charging down the ramp amid a cacophony of warcries and bloody screams. The first gold rounds the corner, a too-thin woman in a ragged uniform, shouldering a carbine. You hear a gunshot and she drops, but a dozen more golds storm in after her, charging your position.");
	
	processTime(6+rand(3));
	addButton(0, "Fight!", fedQuestAmbushFight, undefined, "", "");
}

public function fedQuestAmbushFight():void
{
	var enemies:Array = [];
	for (var i:int = 0; i < 4; i++)
	{
		enemies.push(new MyrGoldRemnant());
		if(rand(2) == 0) enemies[i].rangedWeapon = new RudimentaryRevolver();
	}
	
	var allies:Array = [];
	allies.push(pc);
	allies.push(lieve);
	for (var x:int = 0; x < 3; x++)
	{
		allies.push(new MyrRedCommando());
	}
	
	flags["GOLD_AMBUSH_COVER"] = 100;
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(allies);
	CombatManager.setHostileActors(enemies);
	CombatManager.displayLocation("GOLD AMBUSH");
	CombatManager.victoryCondition(CombatManager.SURVIVE_WAVES, 10);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.victoryScene(fedQuestAmbushVictory);
	CombatManager.lossScene(fedQuestAmbushLoss);
	CombatManager.encounterTextGenerator(fedQuestAmbushText);
	CombatManager.beginCombat();
}

public function fedQuestAmbushText():String
{
	if(pc.hasStatusEffect("Lieve Buff") && pc.statusEffectv1("Lieve Buff") <= 0) pc.removeStatusEffect("Lieve Buff");
	else if (pc.hasStatusEffect("Lieve Buff")) pc.addStatusValue("Lieve Buff", 1, -1);
	//We'll also handle the Gold Brute spawning here
	var eText:String = "";
	eText+="You’re fighting a squad of Gold Myr remnants!";
	if(CombatManager.enemiesAlive() <= 3 && !CombatManager.hasEnemyOfClass(MyrGoldBrute))
	{
		var ded:Creature = null;
		var enemies:Array = CombatManager.getHostileActors();
		for(var i:int = 0; i < enemies.length; i++) if(enemies[i].HP() <= 0 || enemies[i].lust() >= enemies[i].lustMax()) ded = enemies[i];
		if(ded != null)
		{
			CombatManager.removeHostileActor(ded);
			CombatManager.addHostileActor(new MyrGoldBrute());
			eText+="\n\n<b>Among the golds rushing to join the fight comes a much bigger, more heavily armored myr.</b> A burly bruiser of a gold, with a heavy flak jacket and gas mask combining to leave virtually no flesh exposed. Unlike her sisters, she’s carrying a solid metal shield and a shotgun, and walks fearlessly into the heart of the gunfight. The commandos’ shots just bounce off her like they’re nothing!";
		}
	}
	else eText+="\n\nA dozen gold myr are spread out across the parking garage, armed with a mismatched array of handguns and rifles and decked out in scraps of uniforms and armor that look like they were salvaged from the battlefields of yesteryear. Your Red Myr compatriots, what few are left, are ducking behind burnt-out husks of cars or the sides of their armored truck, snapping off shots as quick as they can. Sergeant Marik is manning the heavy machine gun, firing nonstop at the other entrance behind you.";
	eText+="\n\nLieve is " + (lieve.HP() > 0 ? "standing beside you, doing what she can to keep the commando team fighting" : "collapsed on a pile of rubble beside you, groaning and cradling a cracked sleeve of chitin on her arm") + ".";
	eText+="\n<b>("+flags["GOLD_AMBUSH_COVER"] +"% Cover)</b>";
	
	
	
	return eText;
}

public function fedQuestCoverDamage(damage:int):void
{
	//Hehe little hack so I do't have to rewrite more Remnants for the non-cover fights
	if(flags["FEDERATION_QUEST"] == 2) return;
	
	flags["GOLD_AMBUSH_COVER"] -= int(damage*.66);
	if(flags["GOLD_AMBUSH_COVER"] < 0) 
	{
		flags["GOLD_AMBUSH_COVER"] = 0;
		output("\n<b>(Cover gone!)</b>");
	}
	else output("\n<b>(-" + int(damage*.66) + "% Cover)</b>");
}

public function fedQuestAmbushLoss():void
{
	if (pc.hasStatusEffect("Lieve Buff")) pc.removeStatusEffect("Lieve Buff");
	
	clearOutput();
	author("Savin");
	showBust("LIEVE", "RED_COMMANDO");
	showName("\nGOLD AMBUSH");
	
	output("<i>“Incoming!”</i> one of the commandos screams. You look up at the entrance, just in time to see a pair of gold myr kneeling behind a railing: one with a long metal tube on her shoulder, and the other shoving a finned black rocket into the back. Everyone starts shooting at them, but the way this fight’s been going, it’s no surprise nobody manages to land a hit before you hear a <i>whoosh</i> of the rocket igniting.");
	output("\n\nLieve grabs you, throwing you face-down into the dirt just before the rocket impacts the side of the half-track. You only hear the explosion, and feel the wave of heat blasting over you.");
	output("\n\nGunfire echoes through the garage, a deafening symphony of destruction over the echoes of the truck’s destruction. Dazed and reeling from the concussive blast, you manage to stagger to your [pc.feet], only to be grabbed by Lieve.");
	output("\n\n<i>“We’re leaving. Now!”</i> she shouts, yanking you back. You turn towards the side entrance Marik was covering, now mostly a smoldering crater surrounded by wounded golds. Lieve shoves past them, followed by the remaining commandos, and pulls you into a stairwell leading both up and down. Of course she wants to go deeper: you can still hear enemies shouting above, echoing from on high.");
	output("\n\nThe commandos charge down to the bottom level and through a heavy metal door, slamming it closed behind them and wedging it shut with a metal bar through the handles. With the door secured, you’re finally able to catch your breath for the first time since you entered Renneke.");
	
	processTime(15+rand(5));
	flags["FEDERATION_QUEST_AMBUSH"] = 0;
	
	eventQueue.push(fedQuestAmbushLoss2);
	
	CombatManager.genericLoss();
}

public function fedQuestAmbushLoss2():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showBust("LIEVE", "RED_COMMANDO");
	showName("\nRENNEKE");
	
	output("You slump down against one of the walls, taking a look around: you appear to be in an office, with stacks of actual paper and some sort of mechanical keyboard spread out on a desk facing you. Another door, long since knocked off its hinges, leads into a long concrete hallway. A single dead lightbulb swings overhead, cracked like an eggshell and covered in cobwebs.");
	output("\n\n<i>“Dammit,”</i> Lieve snaps, punching the wall. <i>“Dammit!”</i>");
	if(flags["MARIK_FLIRTED"] != undefined)
	{
		output("\n\nGlancing around at the myr, you suddenly find a knot forming at the bottom of your stomach: <i>“Where’s Marik?”</i> you ask, looking over the squad.n");
		output("\n\n<i>“She was in the truck,”</i> Lieve answers, voice quiet.");
		output("\n\nOh, fuck.");
	}
	output("\n\n<i>“Steele, my squad’s in shambles. We’re going to do more harm than good if we keep going like this. I need you... I need you to go ahead without us. We’ll distract the goldies, draw them off from the compound. Give you a chance to sneak inside and deal with the queen: this is why Sellera wanted you with us, I guess. The rest of the girls and I will make our way back topside and look for survivors from the other truck, then circle back to you for exfiltration. I don’t... I don’t know how you’re going to take the queen down, but you’ll figure something out. You’ve got to.”</i>");
	
	processTime(3);
	
	addButton(0, "Leave?", fedQuestAmbushLossLeave, undefined, "Leave?", "Fuck this, can’t you just leave? This was not part of the plan!");
	addButton(1, "CallHelp", fedQuestAmbushLossCall, undefined, "Call For Help", "Can’t you call for help?");
	addButton(2, "Okay", fedQuestAmbushLossOkay, undefined, "Okay", "Fine. Off you go to find the queen.");
}

public function fedQuestAmbushLossLeave():void
{
	clearOutput();
	author("Savin");
	showBust("LIEVE", "RED_COMMANDO");
	showName("\nRENNEKE");
	
	output("<i>“Out of the question,”</i> the myrish officer sighs, shoving a shell into her shotgun. <i>“Even if failure was acceptable, the chance of us just walking out of the city while the goldies are swarming us is... not good, especially with no armor and no support. Plus there’s miles of flatlands outside the city: we get out there with enemies on us, and we’re target practice.”</i>");
	output("\n\nThat sucks. Can’t you steal one of their cars, or find a tunnel entrance?");
	output("\n\n<i>“Maybe?”</i> Lieve shrugs. <i>“We’ll keep our eyes out, but I wouldn’t count on it. No, our best plan now is to get the queen and use her as a shield: they won’t be able to blast us while we have their mother hostage.”</i>");
	
	processTime(3);
	addDisabledButton(0, "Leave?");
}

public function fedQuestAmbushLossCall():void
{
	clearOutput();
	author("Savin");
	showBust("LIEVE", "RED_COMMANDO");
	showName("\nRENNEKE");
	
	output("You glance over at one of the commandos with a primitive, trunk-sized radio strapped to her back. <i>“Can’t we call for help?”</i>");
	output("\n\n<i>“Help from where?”</i> Lieve counters. <i>“We’re hours out from the nearest Federation outpost. Yeah, we’ll call for reinforcements, but we’re on our own for a while here. The mission has to continue: the best chance we have is capturing their queen, and using her to get out of here.”</i>");
	output("\n\nAnd what about that artillery support you were promised?");
	output("\n\n<i>“I’m not authorized to call it down until we have Estallia. So again: mission comes first, then we can worry about getting out of here alive.”</i>");
	
	processTime(3);
	addDisabledButton(1, "CallHelp");
}

public function fedQuestAmbushLossOkay():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showBust("LIEVE", "RED_COMMANDO");
	showName("\nRENNEKE");
	
	output("You give Lieve a firm nod and turn towards the hallway. Hopefully that’ll take you where you need to go, or this is going to be a real short suicide mission.");
	output("\n\n<i>“[pc.name],”</i> Lieve calls after you. She draws something from her belt -- a cannister about the size of her forearm, filled with a bubbling green liquid. <i>“The only tranquilizer that survived the blast. It’s not enough to deal with the queen on its own, but maybe you can get some use out of it. Slow her down, at least.”</i>");
	output("\n\nYou take the vial and stow it in your pack.");
	output("\n\n<i>“We’ll do what we can to keep the goldies off you,”</i> Lieve repeats. " + (hasFuckedLieveSolo() ? "She leans in, giving you a kiss on the cheek. The familiar warmth of residual venom burns where her lips touched you, making your heart go aflutter. <i>“Stay safe out there. I’m counting on you.”</i>" : "<i>“Stay safe.”</i>") + "");
	output("\n\n<i>“I will,”</i> you answer, starting down the hall. Alright, time to finish this.");
	
	pc.createKeyItem("Myr Heavy Tranquilizer Dart");
	
	processTime(3);
	currentLocation = "M25";
	addButton(0, "Next", mainGameMenu);
}

public function fedQuestAmbushVictory():void
{
	if (pc.hasStatusEffect("Lieve Buff")) pc.removeStatusEffect("Lieve Buff");
	
	clearOutput();
	author("Savin");
	showBust("LIEVE", "RED_COMMANDO", "RED_HEAVY_WEAPONS");
	showName("\nGOLD AMBUSH");
	
	output("<i>“They’re pulling back!”</i> Lieve shouts, watching the gold fighters that are still standing -- what few there are -- start scrambling back towards the entrances. <i>“Cease fire. Cease fire!”</i>");
	output("\n\nGunshots echo for a moment more, but die off quickly once Lieve starts shouting. The gold myr withdraw out of sight in the reprieve, leaving you and the remaining reds in silence. Eventually, Marik clambers down from the turret, slinging her automatic rifle over her shoulder. <i>“What now, top?”</i>");
	output("\n\nLieve sighs, shoving shells into her shotgun. <i>“Well, we’re down half the squad and the enemy knows we’re here. We need to move or they’ll start gassing us. Okay, there’s a lower level of the garage, should connect us to the factory. Move out.”</i>");
	output("\n\nYou get to your [pc.feet] and follow Lieve towards a door behind the truck, opening onto a stairwell that’s all but shredded by bullet holes and bloodstains. The surviving troops seem to have carried off their casualties when they retreated, at least. Lieve leads the squad down the stairs at a quick jog, taking you several floors under the cityscape until you come to a metal door. The commandos usher you in and close the door behind you, dropping a bar over it to keep any wandering golds out.");
	output("\n\n");
	
	processTime(5+rand(3));
	flags["FEDERATION_QUEST_AMBUSH"] = 1;
	
	eventQueue.push(fedQuestAmbushVictory2);
	
	CombatManager.genericVictory();
}

public function fedQuestAmbushVictory2():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showBust("LIEVE", "RED_COMMANDO", "RED_HEAVY_WEAPONS");
	showName("\nRENNEKE");
	
	output("For the first time since the opening blasts, you have a chance to catch your breath. You slump down against one of the walls, taking a look around: you appear to be in an office, with stacks of actual paper and some sort of mechanical keyboard spread out on a desk facing you. Another door, long since knocked off its hinges, leads into a long concrete hallway. A single dead lightbulb swings overhead, cracked like an eggshell and covered in cobwebs.");
	output("\n\n<i>“Dammit all,”</i> Lieve groans, sitting down on the edge of the desk. <i>“This is going great, huh?”</i>");
	output("\n\nMarik puts her shoulder to the corner of the hallway, leaning out with her weapon ready. <i>“Yeah, swell. What’s the plan, Lieve; go out in a blaze of glory?”</i>");
	output("\n\nLieve chuckles and glances over at you. <i>“Not yet. We’ve still got our secret weapon.”</i>");
	output("\n\nUh-oh.");
	output("\n\n<i>“[pc.name], we pushed the golds back for the moment, but there’s a whole swarm of them out there, ready to come at us again as soon as they regroup. So here’s the plan: the girls and I are going to go out and be a big damn distraction, have ourselves a running firefight back to the other truck and get our wounded. While we do that, you sneak ahead and grab the queen. This garage should connect to the target building -- just go down the hall and keep running ‘till you hit an old armor factory. That’s where she should be hiding out. If she’s even here, still.”</i>");
	output("\n\nSo she’s sending you out all by yourself into a base full of hardened veterans to try and capture a deadly myr warrior who towers over " + (pc.tallness >7*12+1 ? "even " : "") + "you... alive. Great.");
	output("\n\n<i>“I wouldn’t ask if I didn’t believe you could do it,”</i> Lieve says, shouldering her shotgun and getting to her feet. " + (hasFuckedLieveSolo() ? "<i>“I <b>know</b> you can do it, [pc.name]. We’re counting on you.”</i>" : "") + "");
	output("\n\n<i>“You give us all the fun jobs, boss,”</i> one of the commandos laughs.");
	output("\n\nAnother adds, <i>“We’ll keep the bitches off you, captain. Just stick a boot up that queen’s tailpipe for the ones we lost.”</i>");
	output("\n\n<i>“Settle down,”</i> Marik says. <i>“We’ve all got our jobs. Check weapons and ammo, get ready to move.”</i>");
	output("\n\nThe commandos grunt a unified <i>“Yes, sergeant,”</i> and get to work shoving rounds into their rifles or passing out the remaining grenades.");
	
	processTime(10+rand(5));
	
	addButton(0, "Queen", fedQuestAmbushVictoryQueen, undefined, "Queen", "How the hell are you supposed to take down the War Queen all by yourself?");
	addButton(1, "Support", fedQuestAmbushVictorySupport, undefined, "Support", "Aside from the half-dozen commandos left, what support is the Federation providing now that things have gone tits-up?");
	addButton(2, "Leave", fedQuestAmbushVictoryLeave, undefined, "Leave", "Time to head out.");
}

public function fedQuestAmbushVictoryQueen():void
{
	clearOutput();
	author("Savin");
	showBust("LIEVE", "RED_COMMANDO", "RED_HEAVY_WEAPONS");
	showName("\nRENNEKE");
	
	output("<i>“How the hell am I supposed to pull this off?”</i> you ask, crossing your arms. ");
	if(pc.isMischievous()) output("<i>“You expect me to talk the queen to death!?");
	else if(pc.isBimbo() || pc.isBro()) output("<i>“Should I, like, fuck the queen into submission?”</i>");
	output("\n\nLieve shrugs. <i>“The how is up to you, [pc.name]. You’ll think of something. Talk her down, duel her, tie her up while she’s asleep, I don’t know. We lost most of our tranquilizers, so that’s off the table. If it comes down to a big scrum, try and hold out. I’ll loop the squad back around if we hear gunfire and we’ll hit the front door.”</i>");
	output("\n\nWell, that’s comforting.");
	output("\n\nAfter a moment’s thought, Lieve says more quietly: <i>“If you have to kill her, kill her. The important thing is that she’s neutralized, even if it causes the gold ambassadors to lose their damn minds again. We’re not assassins, but the War Queen’s too dangerous to let go. This is our one chance to take her down... one way or the other.”</i>");
	
	processTime(3);
	addDisabledButton(0, "Queen");
}

public function fedQuestAmbushVictorySupport():void
{
	clearOutput();
	author("Savin");
	showBust("LIEVE", "RED_COMMANDO", "RED_HEAVY_WEAPONS");
	showName("\nRENNEKE");
	
	output("<i>“We’re gonna get help from the Federation now, right?”</i>");
	output("\n\nMarik just laughs. <i>“No way. Nearest outpost is more than an hour out, and we can’t get artillery cover until we have the queen.”</i>");
	output("\n\n<i>“[pc.HeShe] has a point, though,”</i> Lieve says, turning to one of the commandos with a trunk-sized primitive radio strapped to her back. <i>“Tell Sellera to get the 10th Armored out here on the double, or she’s going to be down a dozen pathfinders with no queen to show for it.”</i>");
	output("\n\nThe radio-myr snaps a crisp salute and puts the reciver to her ear, starting to speak a rush of jargon that your translators can’t make heads or tails of.");
	output("\n\n<i>“Like Marik said, though, those tanks won’t be here for a while. We’re on our own for now.”</i>");
	output("\n\nGreat.");
	
	processTime(3);
	addDisabledButton(1, "Support");
}

//Entering the facility
public function fedQuestAmbushVictoryLeave():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	showBust("LIEVE", "RED_COMMANDO", "RED_HEAVY_WEAPONS");
	showName("\nRENNEKE");
	
	output("You give Lieve a firm nod and turn towards the hallway, brushing past Marik as you do so. The big myr gives you a friendly clap on the shoulder, whispering <i>“Good luck." + (flags["MARIK_FLIRTED"] != undefined ? " Pull this off, and I’ll definitely show you what these muscles can do." : "") + "”</i>");
	output("\n\n<i>“[pc.name],”</i> Lieve calls after you. She draws something from her belt -- a cannister about the size of her forearm, filled with a bubbling green liquid. <i>“Take this tranquilizer. It’s not enough to deal with the queen on its own, we don’t have enough left between us for that, but maybe you can get some use out of it. Slow her down, at least.”</i>");
	output("\n\nYou take the vial and stow it in your pack.");
	output("\n\n<i>“We’ll do what we can to keep the goldies off you,”</i> Lieve repeats. " + (hasFuckedLieveSolo() ? "She leans in, giving you a kiss on the cheek. The familiar warmth of residual venom burns where her lips touched you, making your heart go aflutter. <i>“Stay safe out there. I’m counting on you.”</i>" : "<i>“Stay safe.”</i>") + "");
	output("\n\n<i>“I will,”</i> you answer, starting down the hall. Alright, time to finish this.");
	
	pc.createKeyItem("Myr Heavy Tranquilizer Dart");
	
	processTime(3);
	currentLocation = "M25";
	addButton(0, "Next", mainGameMenu);
}

public function fedQuestInvestigateToxin():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("You " + (pc.tallness < 5*12 ? "haul yourself up the side and " : "") + "peer over the rim, looking down into a mess of some kind of soft moss that’s been packed down at the bottom of the crate. Must be the local equivalent of hay for packaging, you guess. Well, the inside looks pretty much empty, unfortunately... wait, no, you catch just the barest hint of something shiny at the bottom! You reach inside and nab it, bringing it into the light. It’s a canister, stark metal labelled with several warnings. Between the alien language being translated in your head and the complex chemicals you’ve got no experience with, you have exactly no clue what this stuff is <i>exactly</i>, but the biggest label on the cap, marked on either side by that same symbol as you’ve seen everywhere, says in big bold letters: “<b>LUSTOXIN</b>.” ");
	output("\n\nSomebody must have forgotten their chemical weapons. What a world.");
	output("\n\nYou don’t know how much use you could get out of military grade chemical weapons in the long run, but for right now... tossing a shot of it into the vents might clear things out for you somewhere. Who knows.");
	
	addButton(0, "Take it", function():void{IncrementFlag("FEDERATION_QUEST_LUSTOXIN"); clearOutput(); quickLoot(new Lustoxin());}, undefined, "", "");
	addButton(1, "Leave it", mainGameMenu, undefined, "", "");
}

public function fedQuestCheckTank():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("You clamber up onto the side of the tank, checking out the heavy metal on display. It reminds you of something you saw in a documentary about ancient wars growing up, especially with the huge treads running top to bottom on either side. A brief inspection of the exterior shows you that there are still parts of the tank oiled up and smelling of grease -- somebody’s been working on this, and recently. The remnant troops must be planning on bringing this beast to bear in battle.");
	output("\n\nHaving to escape the city with this on your tail might be... problematic.");
	
	processTime(5);
	addButton(0, "Sabotage", fedQuestSabotageTank, undefined, "Sabotage", "Try and jack up this tank before it becomes a problem.");
	addButton(1, "Leave", mainGameMenu, undefined, "", "");
}

public function fedQuestSabotageTank():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("You roll up your metaphorical sleeves and grab some of the tools from the workbenches nearby. It’s a simple task to pull one of the engine-covering plates off, giving you access to the thank’s mechanical guts. Now to find some way to quietly sabotage it...");
	
	addButton(0, "Next", fedQuestSabotageMinigame, undefined, "", "");
}

public function fedQuestSabotageMinigame():void
{
	userInterface.showMinigame();
	var gm:RotateMinigameModule = userInterface.getMinigameModule();
	
	var g:uint = RGMK.NODE_GOAL;
	var i:uint = RGMK.NODE_INTERACT;
	var l:uint = RGMK.NODE_LOCKED;
	
	var n:uint = RGMK.CON_NORTH;
	var e:uint = RGMK.CON_EAST;
	var s:uint = RGMK.CON_SOUTH;
	var w:uint = RGMK.CON_WEST;
	
	// 9999 update with new puzzle
	gm.setFailablePuzzleState(
		fedQuestSabotageSuccess, 
		fedQuestSabotageFailure, 
		RotateMinigameModule.MAX_MOVES, 43,
		7, 7, 
	[
		g | e | s, 	i | n | s, 	i | n | e, 	i | w | e,	i | e | w, 	i | n | e,	i | s | w,
		i | e | w, 	i | n |s|e, i | e | w, 	i | n | e, 	i | n | s,	i | e | w,	i | n | w,
		i | n | s, 	l, 			i | e | s, 	i | s | w, 	l,			l,			i | n | s,
		i | e | w, 	l, 			g | e,	 	i | n | s,	i | e | w,	i | s | e,	i | e | w,
		i | n | w,	i | n | e,	i | n | w,	l,			i | n | e,	i | n | s,	g | n,
		l,			i | e | w,	l,			l,			i | e | n,	i | e | w,	l,
		g | e,		i |e|w| s,	i | n | s,	i | e | w,	i | n | s,	i | s | w,	i | w
	]);
}

public function fedQuestSabotageSuccess():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("You pull yourself up out of the engine block and wipe the grease from your brow. The equipment looks more or less exactly like it did before, but pretty much all the wires and tubes inside are tangled up into knots. No way this thing’s going to start now! ");
	processTime(35+rand(10));
	flags["FEDERATION_QUEST_TANK"] = 1;
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fedQuestSabotageFailure():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("After several minutes of working, it turns out that, no, you don’t know anything about alien diesel-age engines. Best to leave it alone before you blow yourself up.");
	processTime(35+rand(10));
	flags["FEDERATION_QUEST_TANK"] = 0;
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fedQuestVents():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("Well, this should keep the guards out of your hair for a good long while while they fuck themselves senseless. You pull the Lustoxin vial from your pack and look around for somewhere to use it. Ah, there we go: you spy a vent above the door, hanging on with a simple metal latch. It comes undone with a thumb’s push" + (pc.tallness < 5*12 ? " once you scramble up onto a chair from a nearby office" : "") + ", letting you peer into a series of connecting metal shafts built into the wall. This’ll spread the gas all over!");
	processTime(5+rand(4));
	
	addButton(0, "Do it", fedQuestGasTheGoldsRaceWarNow, undefined, "Do it", "Pop that sucker in there and smoke the golds out with their fuck-gasses.");
	addButton(1, "Don’t", mainGameMenu, undefined, "Don’t", "Maybe not...");
}

public function fedQuestGasTheGoldsRaceWarNow():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	flags["FEDERATION_QUEST_GOLD"] = 3;
	pc.destroyItemByClass(Lustoxin, 1);
	output("Alright, time to do this. You rear back and hurl the vial into the vents, recovering it as quick as you can. You hear the glass shatter, and the sound of pressurized gas erupting into the air.");
	output("\n\nSomeone shouts in the room to the north, followed by the sounds of furniture being knocked over and panicked footsteps running around. The door slams open a second later, and amid a roiling pink gas cloud, a single gold soldier stumbles out with one arm over her mouth and three clutching at her breasts and crotch. She sees you, starts to shout something, but then two pairs of fingers find her nipples. She collapses to her knees with a sensual whimper, pawing at your [pc.leg] and feverishly groping herself. The sounds inside the room turn from panic to lustful whines and tearing clothes.");
	output("\n\nAnd then the gas starts seeping out the open door.");
	if(pc.hasAirtightSuit()) output("\n\nThankfully, you’re protected from little things like chemical weapons. Good choice of outfit, [pc.name].");
	else
	{
		output("\n\nOh, crap. ");
		output("\n\nYou put an arm around your mouth and nose, trying to shield yourself, but of course that’s too little too late. You feel a familiar flush in your cheeks, and your heart starts to pound in your chest...");
		if(pc.lust(100) >= pc.lustMax())
		{
			output("\n\nYou groan and start clawing at your [pc.gear], groping at yourself and helping the myr girl’s wandering hands find your loins. The desperation of your chemical desires drives you forward, grabbing the gold by the arm and pulling her back into the room: one myr alone can’t possibly satisfy you!");
			addButton(0, "Next", function():void{moveTo("G19"); clearOutput(); clearMenu(); author("Savin"); if(pc.hasCock())fedQuestOrgyCock(); else fedQuestOrgyCooter();} , undefined, "", "");
			return;
		}
	}
	
	processTime(10+rand(6));
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fedQuestDrinkMachine():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("You step up to the large, black metal machine thrumming on the countertop. A smell of something... earthy and foamy reaches your nose, and you can feel heat radiating from the machine. You’re not quite sure what’s brewing, but it looks about done. Someone will probably be coming to get their drinks in a minute. Maybe you could use that to your advantage somehow...");
	processTime(2+rand(3));
	
	if(pc.hasKeyItem("Myr Heavy Tranquilizer Dart")) addButton(0, "Traquilizers", fedQuestTranquilizers, 0, "Traquilizers", "Break open that tranq dart into the drinks. Should knock out anybody who takes a sip... if it’s as strong as Lieve made it out to be.");
	addButton(14, "Leave", mainGameMenu, undefined, "", "");
}

public function fedQuestTranquilizers(part:int):void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	switch(part)
	{
		case 0:	output("You take the tranq dart out of your pack and crack it open on the side of the counter. The top of the machine comes open easily, revealing a pot of bubbling black liquid that blows a steamy cloud of its rich scent into your face. You carefully upend the contents of the dart into the pot and replace the cover: it looks like nobody was ever here at all. With that done, you find somewhere to lay low and let things play out...");
				pc.removeKeyItem("Myr Heavy Tranquilizer Dart");
				processTime(10);
				addButton(0, "Next", fedQuestTranquilizers, 1, "", "");
				break;
				
		case 1:	output("A few minutes later, you hear a lull in the conversation from the other room, followed by a door creaking open. You duck down behind one of the tables in the corner, letting the shadows mask you. A single gold myr saunters into the break room just as you find cover, a slender myr in a dark uniform that’s been patched and repaired so many times to it looks more like rags than a proper soldier’s gear. Though she has a rifle clutched in one hand, she carries it by her side like she’s not expecting trouble -- guess the garrison here doesn’t expect trouble, what with Lieve’s team halfway across the city.");
				output("\n\nThe soldier wanders over to the drink machine and pops it open, pouring the contents into a dozen cups she pulls down from a cupboard and spreads out on a tray. She doesn’t even look your way as she gathers the drinks up and walks right back out the way she came, none the wiser to your sabotage. With her gone, you creep back to the door and listen for what’s to come.");
				output("\n\nIt doesn’t take long before you hear an alarmed shout from the other room -- <i>“Hey! Hey, are you okay!?”</i> -- followed by a heavy <i>thunk</i> of something heavy falling over. And then another. Someone screams, another woman yells for help, and then you start hearing the bodies fall in earnest. A minute later and the other room is silent.");
				output("\n\nGuess that solves that, then.");
				processTime(5+rand(5));
				flags["FEDERATION_QUEST_GOLD"] = 1;
				addButton(0, "Next", mainGameMenu, undefined, "", "");
				break;
	}
}

public function fedQuestBarracksSearch():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("You take a quick look through some of the open footlockers and chests scattered through the room. There’s plenty of ammunition, underwear, and sealed ration packs to be found everywhere you look, but nothing stands out as particularly useful... until you get to the back of the room. There’s a rack on the back wall filled with rifles, and a single iron lever sitting at the top. Weird. You pick it up and find a small note taped to the rubber grip:");
	output("\n\n<i>“Ask Sgt. Kamara before using main elevator”</i> followed by a big, bubbly-looking heart.");
	output("\n\nMight be useful!");
	
	flags["FEDERATION_QUEST_LEVER"] = 1;
	rooms["G19"].removeFlag(GLOBAL.OBJECTIVE);
	processTime(3);
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fedQuestSquadFight():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("You push the door open, wincing when its hinges squeal loudly. Beyond it is a large room dominated by a messy arrangement of military bunks and footlockers, all surrounding a wide circular table.");
	output("\n\nThe sounds of laughing and conversation that had been evident from outside tail off almost immediately. The dozen or so gold myr who were sitting around the card table, smoking and drinking while they relax, all slowly crane their heads around to face you.");
	output("\n\n<i>“Who...?”</i> one of them starts to ask.");
	output("\n\n<i>“Intruder!”</i> another shouts, grabbing a rifle from where it rested up against the table. That seems to rouse the rest of them into action, grabbing at weapons and armor and shouting over each other until a dozen gun barrels and bladed weapons are all aimed at you. Oh, crap.");
	output("\n\nOne of the gold soldiers thrusts a bayoneted rifle in your face and screams <i>“Put your hands up!”</i>");
	output("\n\nYou’ve got a better idea...");
	processTime(5+rand(3));
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new MyrGoldSquad());
	CombatManager.displayLocation("GOLD SQUAD");
	CombatManager.victoryScene(fedQuestSquadVictory);
	CombatManager.lossScene(fedQuestSquadLoss);
	CombatManager.encounterTextGenerator(fedQuestSquadText);
	addButton(0, "Fight!", CombatManager.beginCombat, undefined, "", "");
}

public function fedQuestSquadText():String
{
	var eText:String = "";
	//eText += "You’re fighting a pack of gold myr soldiers!";
	eText += "The troops filling the barracks are ragged and skinny by gold standards, looking like they’ve been subsisting on the barest of essentials for some time. Their uniforms tattered and patched, and they’re carrying a variety of rifles, pistols, axes, and swords in a rag-tag mish-mosh of whatever weapons they could grab in their rush to capture you. ";
	var e:Creature = CombatManager.getHostileActors()[0];
	if(e.HPQ() >= 75) eText += "The entire squad is still up and fighting.";
	else if(e.HPQ() > 25) eText += "Though some of their number have fallen, most of the myr are still up and fighting.";
	else eText += "Most of the myr have fallen, but a few die-hards are still on their feet, struggling to keep fighting.";
	
	return eText;
}

public function fedQuestSquadVictory():void
{
	clearOutput();
	clearMenu();
	showBust("GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER");
	author("Savin");
	
	processTime(15+rand(6));
	if(CombatManager.getHostileActors()[0].HP() <= 0)
	{
		flags["FEDERATION_QUEST_GOLD"] = 1;
		output("The last of the myrish warriors slumps to the ground, clutching at her wounds. Most of the group has slipped into unconsciousness, or crawled off in the chaos of battle. Slowly, you lower your [pc.weapon] and survey the room: nearly a dozen myr troops are passed out on the floor or flopped over the beds and tables, half of which have been knocked over or smashed to pieces in the ruckus.");
		output("\n\nNobody’s left to stop you from striding into the middle of the room and searching the place for anything useful...\n\n");
		
		CombatManager.genericVictory();
	}
	else
	{
		flags["FEDERATION_QUEST_GOLD"] = 2;
		output("You watch with a self-satisfied smirk as the last of the gold myr give in to their desires, joining the growing orgy on the floor. Over-stimulated myr are groping and kissing and fingering with lust-addled abandon. That they’re all sisters doesn’t seem to even phase them anymore: whatever discipline and reserve these soldiers had has been completely eroded by your sensual assault. The familiar scents of honey and sex start filling the air, corresponding to the moans of the defeated golds.");
		output("\n\nThe way they’re looking at you, dark eyes full of need and desire, it would be so easy to just lose yourself in that orgiastic scene for a while...\n\n");
		
		pc.lust(33);
		addButton(0, "Join In", fedQuestOrgyJoin, undefined, "Join In", "Help yourself to a place in the gold myr orgy sprawling out around you. ");
		addButton(1, "Leave", CombatManager.genericVictory, undefined, "", "");
	}
}

public function fedQuestSquadLoss():void
{
	clearOutput();
	clearMenu();
	showBust("GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER");
	author("Savin");
	
	output("You stumble back, trying to push back the surge of myrish bodies pressing in on you. Instead, you feel your [pc.weapon] being yanked from your hand. Chitinous hands grab at your gear, tearing it off you with careless rage. The soldiers scream at you, but the echoes of gunshots in the confines of the barracks have left you deafened; you can’t make out anything they’re saying. Not that it matters -- you’re too weak to resist as they disarm and disrobe you. You feel your arms being pulled behind you and metal cuffs latching around your wrists.");
	output("\n\nOne of the golds shoves you down and plants a boot " + (pc.hasBreasts() ? "between your breasts" : "on your chest") + ", grinding you into the floor with her heel. She shouts something to the other soldiers, and they all laugh, looking down at you with wicked smirks.");
	output("\n\nYour hearing comes back with a whining ring, just in time to hear the woman pinning you sneer, <i>“I think we’ve got a new plaything, girls.”</i>");
	output("\n\nYou try and say something -- to tell them to wait, that you’re a spacer, that you’re worth something if they’d just listen -- but the myr in charge just grinds her bootheel into your [pc.chest].");
	if(pc.race() == "red myr") output("\n\n<i>“Of course you’d say that, Red scum,”</i> she snarls. ");
	else if(pc.race() == "gold myr") output("\n\n<i>“Shut up, traitor! You’ve got nothing to say to us,”</i> she snarls. ");
	else output("\n\n<i>“Shut up,”</i> the myr snaps. ");
	output("<i>“Gag [pc.himHer].”</i>");
	output("\n\nYou try to protest, but it seems there’s nothing you can say to change their minds. One of the haggard soldiers gets behind you and shoves something solid into your mouth, forcing it open around hard, tasteless plastic. Your words are left as nothing but formless moans around the gag -- and through it! There’s a hole right in the middle, letting your [pc.tongue] poke through.");
	output("\n\n<i>“Can we try [pc.himHer] out now?”</i> one of the myr asks, already unbuttoning her ragged uniform’s blouse.");
	output("\n\n<i>“Should we get mother?”</i> another adds.");
	output("\n\nThe woman pinning you down smirks, <i>“No, she’s got enough on her plate. Let’s enjoy this while we can.”</i>");
	output("\n\nOne of the myr turns around and pulls up a patch of cloth wrapped around the golden abdomen thrusting out over her rump, revealing a pair of plump pink lips around a glistening passage. She’s already wide open, built to take a myr male’s massive prick; when she thrusts herself back against your [pc.face], her pussy spreads out to completely cover your mouth. You feel a wave of wet heat billowing into your mouth, carrying with it a sultry taste of desire.");
	output("\n\n<i>“Lick!”</i> the lead myr barks, pulling you up onto your [pc.knees]. You hear either a whip or a riding crop snap somewhere behind you, and several more uniforms coming undone. There’s little room for argument in the myr captain’s voice, and as the squad starts crowding around you, you realize things are going to go pretty bad for you if you don’t start getting these needy women off.");
	output("\n\nYour [pc.tongue] thrusts into the silken channel pressed against your gag, flicking around the soft walls of the myr woman’s cock-sheath. She moans, groping at her tits with two hands and spreading her pussylips for you with the other pair. Other myr purr and murmur their own own desires to each other, starting to caress each other’s chests and slipping hands down to each others’ abdomens.");
	output("\n\nAt least with your hands tied, there’s not much they can expect from you other than to eat them out one at a time.");
	output("\n\nThe first of the pack is already grinding her honeypot back against your gag, drooling sweet juices through the hole in your gag. You don’t have much choice but to swallow it down, trying to keep your [pc.tongue] working her clit and slit until she’s had enough.");
	output("\n\nOr, in her case, gets pulled off and replaced by another lusty myr, eager for a taste of what the offworlder can do. It isn’t long before you’re being passed from soldier to soldier, forced to orally pleasure one myr after the next. The procession drags on for what seems like a musky, fem-cum filled eternity. The longer you last, the wilder the orgy around you grows. Bodies undulate and voices cry out all around you; the sister-soldiers devolve into ever-lewder couplings, their curvaceous figures sprawling out all around you, and over you, and under you. ");
	if(pc.hasCock()) output("Eventually, inevitably, one of them discovers you’re packing a " + (pc.totalCocks() > 1 ? "multitude of cocks" : "cock") + ". Pretty soon, you’ve got another abdominal-cunt bouncing on " + (pc.totalCocks() > 1 ? "each of your cocks" : "your [pc.cock]") + ". ");
	output("\n\nOther myr find themselves drawn to your body, tongues flicking out to caress your [pc.skinFurScales]. Chitinous fingers pinch your [pc.nipples] and sinuous tongues probe your [pc.vagOrAss], all working to pleasure <i>you</i> for once...");
	output("\n\nFor every orgasm you’re given, though, a dozen myrish girls ride your face through their own climaxes. You writhe in your bonds, bucking your [pc.hips] as the girls engulf you in sex...");
	output("\n\n");
	
	eventQueue.push(pc.hasCock() ? fedQuestSquadLossCock : fedQuestSquadLossCooter);
	
	CombatManager.genericLoss();
}

public function fedQuestSquadLossCock():void
{
	clearOutput();
	clearMenu();
	showBust("GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER");
	author("Savin");
	
	pc.removeAll();
	
	output("<b>Your place in the myr orgy continues for hours, and hours, and hours...</b>");
	output("\n\nYou lose track of how many myr come to sample your cock" + (pc.totalCocks() > 1 ? "s" : "") + ", thrusting their plump rears onto your [pc.cock] and riding you until you’ve filled them with [pc.cum]. Time flows in fits and bursts, sometimes blindingly fast, then sensually slow until the orgy finally winds down. Exhausted warriors collapse all around you, but your [pc.cocks] " + (pc.totalCocks() > 1 ? "are never without a hand, lips, or pussy to warm them" : "is never without a hand, lips, or pussy to warm it") + ".");
	output("\n\nThroughout the night, you keep your [pc.ears] perked for any sign of rescue. Any hint that Lieve and her soldiers are nearby.");
	output("\n\nWhen dawn comes, you begin to lose hope.");
	output("\n\nThe gold soldiers use you again throughout the next day, though many of the faces you see are different than those from before. More and more soldiers pass through the barracks, take what they want from you, and move on. Nobody talks to you -- at least, beyond simple commands such as <i>“lick deeper”</i> or <i>“cum for me.”</i> At least they feed you once in a while, but there’s no news to be heard. No mention of the commandos, or the queen, or anything.");
	output("\n\nAnd no mention of releasing you. The golds pack up and move a few days after your capture, blindfolding you and tossing you into a truck. When you next awaken, you’re in another barracks, somewhere else. Another safehouse. The rotation happens once every week or two: the golds stow you somewhere, abuse you a little, use you like a toy, and then move you again.");
	output("\n\nAs the days drag on and on, you become a regular feature in the myrs’ barracks, chained in the center for the use of anyone who needs a little relief after her duties. Your [pc.cocks] " + (pc.totalCocks() > 1 ? "are" : "is") + " never anything less than rock hard and drained of every drop, constantly being ridden by myr girls who’ve probably never seen a dick in their lives. But they learn quickly: how to pleasure, and take pleasure, from you with all the speed and ease in the world.");
	output("\n\nYou wonder if anybody will ever come looking for you. Someone from Steele Tech, or the embassy... maybe even the Marshal and her troops.");
	output("\n\nNobody ever does. The rest of your days are spend as the myrs’ fuck-puppet, a sextoy to be used and forgotten, until well after you hear cheers of the Federation’s retreat from Gold territory. Your adventure ends in the hands of the people you made your enemy, deep inside their reclaimed homeland.");
	
	pc.createStatusEffect("Milk Paused");
	pc.createStatusEffect("Cum Paused");
	processTime((5 * 7 * 24 * 60) + rand(1440));
	pc.removeStatusEffect("Milk Paused");
	pc.removeStatusEffect("Cum Paused");
	
	badEnd();
}

public function fedQuestSquadLossCooter():void
{
	clearOutput();
	clearMenu();
	showBust("GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER");
	author("Savin");
	
	pc.removeAll();
	
	output("Myr after myr after myr takes her pleasure from you, riding your face before returning to the orgy. Time flows in fits and bursts, sometimes blindingly fast, then sensually slow until the orgy finally winds down. Exhausted warriors collapse all around you, fawning over you until they’re fast asleep... and you’re still bound up, unable to leave.");
	output("\n\nThroughout the night, you keep your [pc.ears] perked for any sign of rescue. Any hint that Lieve and her soldiers are nearby. ");
	output("\n\nWhen dawn comes, you begin to lose hope.");
	output("\n\nThe gold soldiers use you again throughout the next day, though many of the faces you see are different than those from before. More and more soldiers pass through the barracks, take what they want from you, and move on. Nobody talks to you -- at least, beyond simple commands such as <i>“lick deeper”</i> or <i>“cum for me.”</i> At least they feed you once in a while, but there’s no news to be heard. No mention of the commandos, or the queen, or anything.");
	output("\n\nOnly after what must be a week -- and two moves between safehouses, blindfolded and tossed around like a grainsack -- do you hear news: a drunken soldier lets slip between bouts of face-riding that her mother is negotiating with someone at the embassy. A ransom payment for your release, you imagine. All you have to do is hang on for a little while...");
	output("\n\nOf course, a little while turns into another week. And then another. And a third... soon, you’ve lost track of the days. You become a regular feature in the myrs’ barracks, chained in the center for the use of anyone who needs a little relief after her duties. The girls take a liking to you, or at least to your [pc.tongue], and their whispered words keep your spirits up -- that soon, you’ll be released.");
	output("\n\nThe fateful day comes when it comes, long after you’ve given up any hope of tracking the days. A pair of myrish soldiers grab you and haul you to your [pc.feet], dragging you from their underground fortress and into the back of a truck. The last thing you see for the next few hours is a blindfold wrapping over your head.");
	output("\n\nWhen the blindfold comes off, you’re pushed down on your [pc.knees]. Your eyes open to a long strip of concrete, suspended on wires from either side of a red canyon. The wind howls, whistling past you. A dozen gold soldiers stand behind you, rifles at their sides. Across the bridge, you expect to see red myr here to rescue you... instead, you’re faced with several human and ausar men in black and gold suits of armor. A shuttlecraft hovers just over the bridge, engines idling. ");
	output("\n\nSteele Tech!");
	output("\n\nThank God, you’re saved. You scramble up the moment the myr release you and go staggering towards them. Before you reach their lines, though, the door of the shuttle slides open and a familiar face comes out.");
	output("\n\n[rival.name] smiles at you, adjusting the collar of [rival.hisHer] executive suit.");
	output("\n\n<i>“Good to see you, cousin,”</i> [rival.heShe] smirks. <i>“How does it feel to see the new C.E.O. of Steele Tech? Don’t worry, I’m sure we’ll find some use for you... while you work off that big, fat ransom I paid the queen for you.”</i>");
	
	pc.createStatusEffect("Milk Paused");
	pc.createStatusEffect("Cum Paused");
	processTime((5 * 7 * 24 * 60) + rand(1440));
	pc.removeStatusEffect("Milk Paused");
	pc.removeStatusEffect("Cum Paused");
	
	badEnd();
}

public function fedQuestOrgyJoin():void
{
	clearOutput();
	clearMenu();
	showBust("GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER");
	author("Savin");
	
	output("Now that the gold myr have turned their attentions from fighting you to desperately fucking each other, you find yourself staring more and more at the curvaceous bodies beneath their torn uniforms. Honey-filled breasts and plump abdomens jiggle and bounce as the girls undulate around each other, licking pussies and groping fleshy mounds with shameless incestuous lust.");
	output("\n\nYou set your [pc.weapon] aside and strip out of your [pc.gear]. All eyes are on you, the sexy slab of offworlder ass who kicked off this myrish orgy. Even though you should still be enemies, the girls have no compunction against reaching up and stroking your [pc.legs], moaning and beckoning you into their myriad arms.\n\n");
	
	if(pc.hasCock()) fedQuestOrgyCock();
	else fedQuestOrgyCooter();
}

public function fedQuestOrgyCock():void
{
	showBust("GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER");
	author("Savin");
	
	output("<i>“" + (silly ? "OwO" : "Ooh") + ", what’s this?”</i> one of the lusty golds coos, wrapping her slick, chitinous fingers around your [pc.cock]. A shiver runs through you as three more hands play around your thighs");
	if(pc.totalCocks() > 1) output(" and find their way to " + (pc.totalCocks() > 2 ? "more cocks" : "another cock") + "");
	output(". She crawls up onto her knees, getting eye-level with your crotch, and stares in awe at what you’re packing.");
	output("\n\n<i>“A queen’s staff!”</i> another myr giggles, planting two hands on your [pc.butt], and a third on your thigh. <i>“I haven’t touched one since the Thollum.”</i>");
	output("\n\nThe first girl slaps her sister’s hand away. <i>“I saw it first!”</i>");
	output("\n\nBefore the second myr can protest, the first opens her mouth and sucks down your [pc.cock], taking the shaft almost to the base in a single bob of her head. More of the defeated myr perk up, watching their most aggressive sister start deep-throating your prick. Another myr slips up behind her, gives you a wink, and grabs the cock-hungry ant’s abdomen and lifts it to her mouth before digging into her twat. " + (pc.totalCocks() > 1 ? "Another myr grabs your second prick, shoving her sister to the side and licking your crown. " : "") + "More myr start crawling over, groping and squeezing the girls already on you, thrusting hands into plump pussies and suckling on each other’s tits.");
	output("\n\nA chorus of moans echo through the barracks, matching the hands running all across your body, your [pc.cocks], and your [pc.butt]. " + (pc.hasVagina() ? "Your feel a long tongue flick across your [pc.cunt], digging into your juicy folds. Another finds her way to your ass, flicking around your [pc.asshole] before plunging in. " : "") + "Somehow, even after forcing them into this predicament, their hostility has turned entirely to lust. They don’t know friend from foe anymore. They’re nothing but slaves to their desire.");
	output("\n\nEnough of this. You grab the gold myr that’s been sucking your [pc.cock] and flip her around, making that succulent behind bob in the air, drooling juices between her legs. Her pussy winks at you, tantalizingly wet, begging to be stuffed. Your [pc.cock] jumps to attention, rubbing against the ant-girl’s smooth chitinous thighs. Nice and slow, you drag your [pc.cockHead] up the girl’s wiggling rump and into the plump lips of her quim. She squeals and wiggles her ass for you, enticing you to slide on into her slippery slit. The slick walls squeeze down around your shaft, drawing you deeper and deeper into the quivering goldie’s quim until you’re completely sheathed in her warmth.");
	output("\n\nAnother of the myr cups her cheeks and pulls your cocksleeve first into a kiss, then into her chest, urging her sister to suckle. More myr converge around the three of you, groping and kissing. Someone thrusts a breast into your face, and myrish nectar flows across your [pc.lips]. Someone’s hands grab your [pc.butt], and another myr licks your [pc.chest]. Other girls come up behind <i>them</i> and tend to their sister’s needs while you keep plowing that first juicy cunny.");
	output("\n\nThe myr you’re fucking cums long before you do, completely inexperienced at taking dick and loving the new sensations you’re helping her experience. The moment she hits her climax, though, one of her sisters rolls her off your cock and takes her place, thrusting her own abdomen down on your shaft. Well, one rebel’s as good as the next, you guess -- you thrust deep into her virginal passage, making that honey-flushed rump jiggle with the impacts.");
	
	pc.lust(pc.lustMax());
	processTime(30);
	addButton(0, "Next", fedQuestOrgyCock2, undefined, "", "");
}

public function fedQuestOrgyCock2():void
{
	clearOutput();
	clearMenu();
	showBust("GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER");
	author("Savin");
	
	output("Girl after girl takes her time on your [pc.cock], bouncing on your shaft or letting you bend them over and thrust away. By the time you finally cum, there’s a moaning pile of sated honey-sluts sprawled out around you, leaking ropes of fem-slime from their well-fucked pussies. The smells of honey and sex permeate the air, intermixed with a nice, thick musk of your own as the last golden girl slumps forward on hands and knees, her honeypot filled to the brim with your [pc.cum]. A pair of her sisters eagerly grab her abdomen and spread her lips. Their tongues vanish into her seeded twat, lapping up what you left cooling inside -- and drawing out a whole new chorus of moans from their sister.");
	output("\n\nYou stumble back, satisfied with your tryst with the lust-addled myr, and grab your equipment. Other myrmedions fill the gap in the orgy you leave, squabbling over who gets to drink the cum out of the girl’s pussy next. Something tells you this orgy’s going to be going on for a good long while... " + (silly ? "Looks like you’ve started the first self-perpetuating fuck machine." : "") + "");
	if(inCombat()) output("\n\n");
	
	processTime(25+rand(11));
	pc.orgasm();
	if(inCombat()) CombatManager.genericVictory();
	else addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fedQuestOrgyCooter():void
{
	showBust("GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER", "GOLD_REMNANT_FIGHTER");
	author("Savin");
	
	output("You don’t know if it’s their own rampant lusts or " + (flags["FEDERATION_QUEST_GOLD"] == 3 ? "the chemicals" : "some insatiable submissive instinct") + " taking over, but the myr girls seem to care nothing for your appearance. Alien, myr, it seems all the same to minds dominated by desire. A pair of the golden-hued sluts paw at your [pc.legs] and thighs, urging you into the pile of entwined bodies now dominating the barracks.");
	output("\n\nYou slip down on your [pc.knees], and immediately the two gold myr fawning on you put their mouths to your [pc.nipples], groping hungrily at your [pc.chest]. " + (pc.isLactating() ? "A whimper of pleasure escapes your [pc.lips] as [pc.milk] starts to flow. The golden honeys grin up at you, all too familiar with suckling from their sisters. " : "") + "They ease you onto your back, and one of the lusty ants shifts around so that one of her over-ample breasts is pressed against your [pc.face], smelling sugary-sweet and begging to be played with.");
	output("\n\nLocking your [pc.lips] around her amber teat, your mouth is quickly treated to an explosion of flavor: sweet nectar rolls thickly across your [pc.tongue], filling your mouth with her natural bounty. The other of the pair finds her way between your [pc.legs], running her chitinous black fingers across your [pc.vagOrAss]. Your breath catches as one digit circles and then delves your fuckhole, giving you your first real thrill -- the first of many, you’re sure.");
	output("\n\nAlready, other bodies are coming closer, drawn to the alien in their midst. Hands and breasts and tongues run all across your [pc.skinFurScales] until you find that the orgy has come to surround you, a dozen writhing, moaning bodies entwining all around you. Hands play across your [pc.chest], and more and more fingers and tongues find their way to your loins. Your [pc.hips] buck against myrish mouths, and in reward, you feel a long, sinuous tongue slithering inside you. It squirms like a tentacle, lapping at your inner walls as its owner searches out your tenderest reaches. A pair of black, featureless eyes glance up at you from their owner’s place between your thighs, flashing you a smile while she eats your " + (pc.hasVagina() ? "quim" : "ass") + ".");
	output("\n\nThe girl whose tit you’re suckling from, meanwhile, moans " + (pc.isLactating() ? "around your [pc.nipple] " : "") + "and arches her back, gushing sweet nectar across your [pc.tongue]. Somewhere behind her, another myr girl’s getting a faceful of fem-cum -- as is a yet another who’s wormed her way behind the girl eating you out. There’s a practical train forming around you now, woman after woman eating muff or sucking tits in a chorus of moaning, writhing bodies, all consumed by pleasure.");
	output("\n\nAll you need to do now is to lay back and suck on a nectar-laden boob, reaping the rewards of your " + (flags["FEDERATION_QUEST_GOLD"] == 3 ? "cleverness" : "victory") + ". Soldier after soldier cries out in orgasm around you, surrendering into each other’s arms, and before long the barracks is suffused in the smells of sex and honey. There’s no frantic race to climax for you this time, no hot-and-heavy humping: now when you have these sluts to do everything for you: your orgasm comes at the end of a slow, steady rise, erupting into shivering pleasure that washes through your body. You gasp and moan around your mouthful of amber nipple, arching your back to the beat of oral satisfaction. The ant worshipping your [pc.vagOrAss] " + (pc.hasVagina() ? "gets a faceful of your liquid approval, gasping with glee as fem-cum spurts across her cheeks." : "murmurs happily as your ass squeezes around her tongue, binding her to you until your body finally calms itself down.") + "");
	output("\n\nYou’ve barely caught your breath after cumming before the myr who were working on either end of you crawl over your prostrate body, wrapping each other in their myriad arms and sharing a long, tongue-filled kiss. They’ve lost all interest in you, moving on to other, needier desires. Well, that suits you just fine -- you’ve still got a queen to catch, after all. Squirming out from under the sea of lusty bodies, you gather your gear and slip away.");
	if(inCombat()) output("\n\n");
	
	processTime(25+rand(11));
	pc.orgasm();
	if(inCombat()) CombatManager.genericVictory();
	else addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fedQuestLootChemicals():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("As carefully as you can, you pick one of the pressurized canisters up from the open crate and give it a look-see. Between the alien language being translated in your head and the complex chemicals you’ve got no experience with, you have exactly no clue what this stuff is <i>exactly</i>, but the biggest label on the cap, marked on either side by that same symbol as you’ve seen everywhere, says in big bold letters: “<b>LUSTOXIN</b>.”");
	output("\n\nGee, wonder what that could possibly be.");
	output("\n\nYou don’t know how much use you could get out of military grade chemical weapons in the long run, but for right now... tossing a shot of it into the vents might clear things out for you somewhere. Who knows.");

	processTime(3);
	if(flags["FEDERATION_QUEST_LUSTOXIN"] < 5 || flags["FEDERATION_QUEST_LUSTOXIN"] == undefined) addButton(0, "Take", function():void{IncrementFlag("FEDERATION_QUEST_LUSTOXIN"); lootScreen = fedQuestLootChemicals; itemCollect([new Lustoxin()], true);}, undefined, "", "");
	else addDisabledButton(0, "Take", "Take", "You’ve already looted the remaining Lustoxin.");
	addButton(1, "Leave", mainGameMenu, undefined, "", "");
}

public function fedQuestMotherSearch():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("Since the queen’s not here... that leaves you free to search for valuables. You toss her bed -- nothing under there -- and heft open her trunk. Inside are several large articles of clothing, queen-size dresses with huge amounts of bust-room and some lacey lingerie that looks so oddly out of place in the shadow of those giant’s swords on the wall. " + (pc.isFeminine() ? "Too bad none of this will fit you... the queen’s clothes look decadently comfortable and sexy." : "") + "");
	output("\n\nAfter a few minutes of turning up exactly nothing of value, you turn towards the map on the wall. Something looks... a little off about it. It’s not obvious at first glance, but as you get near, you can see there’s some scuff marks on the wall, some areas where the dust is a little thinner. Looks like someone’s been moving this thing recently.");
	output("\n\nYou yank the map down, and sure enough, there’s a steel safe planted in the wall just behind it. A steel safe which is, of course, locked.");
	
	processTime(10+rand(6));
	if(pc.characterClass == GLOBAL.CLASS_SMUGGLER)
	{
		output("\n\nNo worries there. You pull your picks out and get to work, wiggling them around in the lock until you hear that familiar, satisfying click.");
		addButton(0, "Next", fedQuestMotherSafe, undefined, "", "");
	}
	else 
	{
		flags["FEDERATION_QUEST_MOTHER"] = 1;
		output("\n\nYou’ll need to find some keys to get inside. " + (pc.characterClass == GLOBAL.CLASS_ENGINEER ? "Too bad it’s not a digital lock, or you could hack through it with ease." : "") + "");
		addButton(0, "Next", mainGameMenu, undefined, "", "");
	}
}

public function fedQuestMotherSafe():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	flags["FEDERATION_QUEST_MOTHER"] = 2;
	output("The safe’s door swings open, bearing its contents to your inquisitive fingers. You dump the valuables out and see what’s on offer:");
	output("\n\nThere’s a lengthy necklace of green and red gemstones on a silvery chain, culminating in a fist-sized rock embedded in gold that would hang low between the breasts; a red plastic single-shot pistol, loaded with a shell about half the size of your fist -- a flare gun, you suppose, if dangerously primitive; and a... handheld computer, a little smaller and sleeker than your Codex, marked with the logo of Xenogen Biotech.");
	output("\n\n<i>“Hello,”</i> you say, flipping the tablet in your hand and activating it. The Xenogen logo appears on the screen, followed by a password screen.");
	output("\n\nCrap. " + (pc.characterClass == GLOBAL.CLASS_ENGINEER ? "You spend a few moments trying to break the code, but it’s tough... and it’s got a self-destruct on the harddrive, set to activate if you enter too many wrong passwords. Dammit. " : "") + "You’ll have to find the password somewhere, or maybe just show it off at that Xenogen office at the airstrip.");
	processTime(10+rand(6));
	
	fedQuestMotherLoot();
}

public function fedQuestMotherLoot():void
{
	clearMenu();
	if(!pc.hasKeyItem("Xenogen Datapad")) pc.createKeyItem("Xenogen Datapad");
	if(flags["FEDERATION_QUEST_FLARE"] == undefined) addButton(0, "Flare Gun", function():void{IncrementFlag("FEDERATION_QUEST_FLARE"); lootScreen = fedQuestMotherSafe; itemCollect([new FlareGun()], true);}, undefined, "", "");
	else addDisabledButton(0, "Flare Gun", "Flare Gun", "You already looted this.")
	if(flags["FEDERATION_QUEST_NECKLACE"] == undefined) addButton(1, "Necklace", function():void{IncrementFlag("FEDERATION_QUEST_NECKLACE"); lootScreen = fedQuestMotherSafe; itemCollect([new QueenlyNecklace()], true);}, undefined, "", "");
	else addDisabledButton(1, "Necklace", "Queenly Necklace", "You already looted this.");
	addButton(14, "Leave", mainGameMenu, undefined, "", "");
}

public function fedQuestOfficerFight():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("You test the latch on the rusty iron door at the end of the bridge, and to your surprise, find that the door pushes open with a little bit of effort. A rush of cold air blasts out of the crack at you, and you wince as the hinges squeal like nails on a chalkboard. Fuck it -- you shoulder the door the rest of the way in and draw your [pc.weapon], charging into the little cabin.");
	output("\n\nThe room inside is small, just a few feet on either side, and stuffed full of shelves full of binders and strange machines you can’t figure at a glance -- probably part of that radio dish on the roof. A single gold myr in a long, dark coat and a brimmed cap was sitting on a chair at the machines, listening through a headset clasped awkwardly over her cap and flowing black ponytail. She’s speaking into a microphone in front of her, but the moment you storm in, she twirls around with preternatural grace and speed, drawing a handgun from a holster on her skirt’s belt and levelling the primitive slug-thrower at you. ");
	output("\n\n<i>“Sorry, mother,”</i> she says into the mic, setting it back down on the machines. <i>“Something’s come up...”</i>");
	output("\n\nHer black eyes narrow at you, and she thumbs back the hammer of her pistol. <i>“The " + (InCollection(pc.race(), "myr", "gold myr", "red myr") ? "false myr" : "offworlder") + "!”</i> the woman snarls. <i>“As if luring the Federation’s best into our little trap wasn’t reward enough.");
	if(flags["KILLED_TAIVRA"] != undefined) output(" Though perhaps we should thank you for slaying that warlord under the caves before the red bitches could recruit her.");	
	else if(nyreaDungeonFinished()) output(" A nyrean warlord and a red venom-sucker too? Truly, I didn’t think star-walkers could be so low.");
	if(pc.isDependant(Creature.DEPENDANT_MYRVENOM)) output(" I can see it in your eyes: you’re hooked on their poison, aren’t you? Is that why you’re here -- so you can get your next fix? Disgusting.");
	if(flags["KQ2_QUEST_FINISHED"] == 1) output(" And you’re to blame for ruining our operation out in the wastelands, too!");
	output("”</i>");
	output("\n\nShe thumbs the hammer on her pistol, and her amber lips curl into a wicked grin. <i>“Mother will be so pleased when she learns I’ve captured the star-walker. Now be a good [pc.boyGirl] and surrender, and I’ll go easy on the interrogation...”</i>");
	output("\n\nYeah, right.");
	processTime(5+rand(3));
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new MyrGoldOfficer());
	CombatManager.displayLocation("GOLD OFFICER");
	CombatManager.victoryScene(fedQuestOfficerVictory);
	CombatManager.lossScene(fedQuestOfficerLoss);
	CombatManager.encounterTextGenerator(fedQuestOfficerText);
	addButton(0, "Fight!", CombatManager.beginCombat, undefined, "", "");
}

public function fedQuestOfficerText():String
{
	var eText:String = "";
	
	eText += "The woman in front of you is tall and sensuously curvaceous -- your eyes are drawn constantly to the pair of enormous, honey-laden breasts straining the front of her blouse so hard that half the buttons have popped off, leaving her with an immense valley of cleavage. She’s wearing a greatcoat and a knee-length skirt, and an officer’s cap cut with holes to allow a pair of plump, wiggly antennae through. An ass-length ponytail of charcoal hair flicks around behind her, its tip brushing across her thick, pussy-bearing abdomen, its slit bare and drooling over her meaty rump.";
	
	return eText;
}

public function fedQuestOfficerBreakWindow():void
{
	clearOutput();
	output("You " + (pc.hasRangedWeapon() ? "take a shot at" : "swing your weapon at") + " where you think the window was. Sure enough, you hear a crack of glass, followed by a rush of wind. The smoke starts swirling and gusting out -- but it’s still going to take a few moments to clear! ");
	flags["FEDERATION_QUEST_WINDOW"] = 2;
	pc.removeStatusEffect("Smoke Grenade");
	pc.createStatusEffect("Smoke Grenade", rand(3)+1, 0, 0, 0, false, "Blind", "Ranged attacks are far more likely to miss.", true, 0);
	CombatManager.processCombat();
}

public function fedQuestOfficerLoss():void
{
	//clearOutput();
	clearMenu();
	showBust("GOLD_REMNANT_SI_OFFICER");
	author("Savin");
	
	if(pc.HP() <= 0)
	{
		output("<i>“Get down already!”</i> the gold warrior snaps, shoving you hard in the chest with the butt of her pistol. You stagger back, feeling your [pc.legs] give under the blow -- the last of many you’ve endured in this insane quest. You stagger back, dropping your gear as you go. What little resistance you had left to offer is torn apart by a series of rough pushes and slaps, and feeling another pair of arms rending your gear from your body.");
		output("\n\nWhen you’re defenseless and disarmed, the gold myr smirks and pushes herself up against you, binding your wrists with two arms.");
	}
	else
	{
		output("<i>“You know you can’t win, don’t you?”</i> the golden goddess before you purrs, striding towards you with a sensual, confident gait. Every step makes her prodigious honeypots bounce hypnotically, so full of sweet nectar that her heavy breath causes little trickles to leak from her saucer-like teats, staining her blouse. <i>“You and your red friends think that its strength that will win this war, that you can just do whatever you want because you’ve got the biggest guns and the scariest soldiers. But you’re wrong, alien. So very wrong.”</i>");
		output("\n\nShe steps closer, and before you know it, she’s pressed her enormous chest against you, compressing her honey-filled boobs so that the swollen mounds squirt all over your [pc.chest]. She grabs your wrists in two of her hands, holding you steady while the other pair disarm you, pulling your gear off and throwing it aside.");
		output("\n\nYou know you should resist, but... ");	
	}
	output("\n\n<i>“Take a seat,”</i> the gold myr whispers into your [pc.ear], leveraging a pair of her arms to push you down into the chair she’d been sitting in before you barged in. You collapse heavily into it, rolling back on its wheels until your back <i>thump</i>s into the comms terminal against the far wall. Before you can catch your balance, one of the woman’s high-heeled feet rears up and plants itself in your crotch, knocking the breath out of you. Your eyes go wide, looking up at her with a mix of fear and anticipation.");
	output("\n\nShe smirks down at you, pinning you against the chair almost absent-mindedly. Her attention focuses on the pistol in her hands, fondling it in two hands, turning it over and over again. For a moment, you wonder if she’d actually shoot you -- shoot to kill, that is. Point blank like this, there’s nothing your shields could do. But she finally thumbs the safety and holsters it, crossing her other arms under her breasts.");
	output("\n\n<i>“Comfortable? Good,”</i> she says, gazing down at you with a smirk on her amber lips. <i>“Now, why don’t you tell me where your little red friends are?”</i>");
	output("\n\nOf course you try and resist her interrogation... and of course, she punishes you. The firm, flat bottom of her foot presses down on your [pc.crotch], putting pressure on your loins until you cry out for mercy. Fuck, it hurts so good!");
	output("\n\nThe golden inquisitor tsks her tongue. <i>“I’ll ask you again: where are your friends?”</i>");
	output("\n\nYou try to hold hold back. You really do. But a few more minutes of agonizing half-leasure and you’re babbling like a kid, spewing all the details of your mission, everything you know about the rest of the team and their goals, just to make her stop. But every question you answer only spawns more. Your captor is insatiably curious, at first asking you about your mission, then the Federation-occupied Kressia, and then about the spaceport... and Confederate space... and all about your ship.");
	output("\n\nBy the time you realize what she’s after, it’s too late. You’ve already surrendered so much that telling her the rest comes easily, words flowing out of your mouth without a second thought, as if you’re hypnotized by the pleasure-pain of her foot and the promise restrained by her too-tight shirt, overflowing with myrish honeypots. Every breath she takes creates tidalwaves of motion in her chest, refusing to let your gaze wander from her turgid teats.");
	output("\n\nSuddenly, without warning, the pressure on your crotch subsides. The myr officer steps back and adjusts the cap on her head, antennae wriggling. <i>“Thank you, Steele. You’ve been most helpful... for a venom-sucking red sympathizer. We’ll be taking your ship; you won’t need it any more. Not once your ‘friends’ in the Federation realize what you’ve done.”</i>");
	output("\n\nA few soldiers arrive before too much longer, restraining you while the officer leaves. Hours pass, then days, bound up in the myr compound. You hope for rescue, for Lieve and the other red myr to kick in the door and come bail you out... but they never come. The guards refuse to speak of them, to tell you how the battle played out. Still, you soon start catching glimpses of familiar-looking rifles in their hands, or new gear marked with the Federation symbol that’s been only partially patched over.");
	
	pc.removeEquipment();
	
	output("\n\nA week passes in loneliness and fear before the officer who captured you returns, a smug smirk on her amber lips. You’re hauled to your [pc.feet] by your current set of guards and dragged to the main chamber of the factory. It’s been cleared out of half-built tanks; your ship sits here, battered and scorch-marked; the flag of the Gilden Republic is painted over bridge, and the whole exteriors been repainted gold.");
	output("\n\n<i>“A wonderful weapon,”</i> you captor beams. <i>“Alone, it was enough to destroy the Federation navy. And their air corps. Those self-righteous crimson bitches had no answer for such fearsome technology!”</i>");
	output("\n\nTo destroy... oh, no.");
	output("\n\n<i>“And they dare not respond, for fear of even more alien attacks. You’ve turned the tide for us, captain. The stone-spirits were kind to bring you to us. But I’m afraid this is where our friendship must end. The Federation is frothing at the mouth to get their hands on the one responsible for the destruction of so much of their military. I almost pity you.”</i>");
	output("\n\nYou look up at her, eyes wide, just in time for the huge doors of the factory to wheel open behind her. A squad of black-clad Federation soldiers march in, unarmed except for holstered pistols, their eyes covered by dark goggles to protect them from the beating sun.");
	output("\n\n<i>“Goodbye, Steele. Thank you for your service to the Republic,”</i> the officer smirks, stepping out of the way. A pair of red myr soldiers grab your arms, pulling you towards the door.");
	output("\n\nNo matter how much you plead, no matter how many times you try to explain yourself... nothing will turn their ears to the truth. Even the Confederate embassy won’t help you, after what you’re accused of.");
	output("\n\nThe inevitable fate of a war criminal awaits you...");
	
	CombatManager.genericLoss();
	
	pc.createStatusEffect("Milk Paused");
	pc.createStatusEffect("Cum Paused");
	processTime((6 * 24 * 60) + rand(1440));
	pc.removeStatusEffect("Milk Paused");
	pc.removeStatusEffect("Cum Paused");
	
	badEnd();
}

public function fedQuestOfficerVictory():void
{
	
	//clearOutput();
	clearMenu();
	showBust("GOLD_REMNANT_SI_OFFICER");
	author("Savin");
	
	processTime(15+rand(6));
	output("With a gasp, the myrish officer pitches forward onto her hands and knees. Her handgun clatters to the ground, sliding across the floor until you catch it under a [pc.foot]. Breathing hard, the ant-woman looks up at you with dark, wide eyes " + (CombatManager.getHostileActors()[0].HP() <= 0 ? "filled with hatred" : "brimming with desire") + ".");
	output("\n\n<i>“M-mother won’t fall so easily,”</i> she groans. <i>“And even if you defeat us, the spirit of freedom will live on!”</i>");
	output("\n\nWhatever. You throw her primitive weapons out the window, and think of what to do with her...");
	output("\n\n<b>You found the Queen’s keys</b>");
	output("\n\n");
	
	flags["FEDERATION_QUEST_RADIO"] = 1;
	flags["FEDERATION_QUEST_KEYS"] = 1;
	
	if(pc.hasCock() || pc.hasHardLightStrapOn()) addButton(0, "Titfuck", fedQuestOfficerTitfuck, undefined, "Titfuck", "This ant’s got massive tits just overflowing with nectar. Take advantage of those big honeypots.");
	else addDisabledButton(0, "Titfuck", "Titfuck", "You need a cock or strapon for this.")
	addButton(1, "Queen", fedQuestOfficerQueen, undefined, "Queen", "Sit on the ant-slut’s face and make her tongue you out.");
	addButton(2, "Leave", fedQuestOfficerLeave, undefined, "Leave", "You don’t have time to mess around with this haughty rebel.");
}

public function fedQuestOfficerTitfuck():void
{
	clearOutput();
	clearMenu();
	showBust("GOLD_REMNANT_SI_OFFICER_NUDE");
	author("Savin");
	
	output("You lick your lips, watching the way the ant-girl’s huge honeypots press into the hard, cold floor of the comms tower. They’re bigger than any red myr’s could ever hope to be, so full of her nectar bounty that the stress of battle has made them leak, staining the front of her blouse. You step forward and grab it, tearing her shirt open to expose the huge, succulent mounds its hiding; their owner gasps as her breasts are bared, falling into your waiting hands. Your fingers clench around her jutting teats, immediately rewarded by streams of thick, rich myrish nectar pouring from the overburdened honeypots. She’s got to have gallons of that golden honey built up inside her, like she’s been eating for the entire rebel group to feed ‘em out of her tits!");
	output("\n\nWhen on Myrellion, do as the myr do. You push the gilden officer onto her back and delve into the quivering pillars of cleavage to suckle from her bounty. She cries out, at first in surprise, then disgust, and finally in pleasure. She struggles weakly to push you off until your lips lock around one of her teats; once you start to draw straight from the source, her resistance crumbles into nothing, replaced by little gasps and moans. The woman’s arms lock around your back, trying to keep you buried in her tits.");
	output("\n\nYet when you try to pry yourself free, her four hands glide limply off your [pc.skinFurScales]. You stand, shifting your [pc.legs] over her broad hips, and " + (pc.hasCock() ? "shuck off your gear, freeing your [pc.cock] and slapping it into the narrow valley between her tits." : "activate your hardlight cock, shuddering as it springs to existence amidst a wave of new sensation.") + " The running rivulets of honey pool into her cleavage, and while it’s a sticky, thick substance, there’s enough of it -- all fresh and warm -- that your [pc.cockOrStrapon] is able to glide along the glistening glaze on her golden flesh.");
	output("\n\n<i>“You... you deviant!”</i> she gasps, black eyes wide as you start to fuck her cleavage. <i>“What kind of alien perversion-”</i>");
	output("\n\nYou silence her with a mouthful of cock, shoving your [pc.cockOrStrapon] through her bust and into those plush amber lips she’s so fond of flapping. There’s one thing you say for Gold Myr, you quickly realize: their being almost all women means they’ve got a hell of a cock-hunger hidden deep in their minds, ready to come out at the first taste of dick. And this stuck-up rebel’s got it worse than most: you’ve barely plunged your schween into her mouth before you feel her sucking, swirling her tongue around your crown.");
	output("\n\nFor someone who’s probably never seen a dick in her life, this girl’s got <i>talent</i>. Enough to make you grin down at her, tweaking her nipples until she’s squealing around you.");
	output("\n\n<i>“Who’s the pervert here?”</i> you wonder aloud, pulling your dick out of her mouth and back into her honey-slickened tits. She doesn’t have the words to answer you, but two of her arms wrap around her tits, squeezing them massive orbs together around your pistoning prick, completely enveloping you in warm, jiggling boobflesh.");
	output("\n\n<i>“That’s what I thought.”</i> Her tits quake as your [pc.hips] slap against them, squirting jets of honey into the air that rain down all over her, coating more and more of her amber-hued flesh in nectar. Behind her, her plump abdomen adds to the liquid mess surrounding her, leaking a steady trickle of girlish desire onto your [pc.legs]. Poor thing must be swimming in her own lusts by now, getting a face-full of cock as she is, but you’ve got no intention of satiating her now: not unless she can get off by having her tits fucked, anyway.");
	output("\n\nYou certainly can.");
	output("\n\nThe tight, wet heat surrounding your [pc.cockOrStrapon] seems to grow more intense with every thrust, as good as any pussy and treating you to the best show on Myrellion for your trouble. Your body decides to reward her just the way she needs: you thrust forward, burying your shaft as deep between her lush breasts as you can before the inevitable climax shudders through you, ");
	if(pc.hasCock())
	{
		output("and your [pc.cock] shoots a thick wad of [pc.cum] over her chin and neck, leaving ropes hanging between her tits when you let them go. There’s a spiderweb of [pc.cumColor] goo in her cleavage now, marking her as your conquest for all to see.");
		output("\n\nIt looks especially good, you decide, once you’ve tied all four of her wrists to the shelves nearby, leaving her honeypots exposed and dripping onto her lap. ");
	}
	else
	{
		output("feeding back through your nerves in waves of pleasure. Too bad there’s no cum for her, no matter how much your body tries to squirt it all over her!");
		output("\n\nOnce you’ve caught your breath, you pull yourself off of the golden officer and tie her wrists to the nearby shelves.");
	}
	output("\n\n<i>“You’re cruel!”</i> she huffs, squirming in her restraints. <i>“Typical red sympathizer! My mother will-”</i>");
	output("\n\nOh, hush. You tear off a piece of her blouse and stuff it into her mouth, silencing her while you decide what your next move is. Your eyes wander over the comms relay she was using...");
	output("\n\n");
	
	processTime(15+rand(6));
	pc.orgasm();
	
	CombatManager.genericVictory();
}

public function fedQuestOfficerQueen():void
{
	clearOutput();
	clearMenu();
	showBust("GOLD_REMNANT_SI_OFFICER_NUDE");
	author("Savin");
	
	output("You stalk forward, a hungry grin on your lips as you take in the myr’s voluptuous form. She’s beautiful, in an oversexed, insectile kind of way, with plush pouty lips that are a natural amber hue, pursed together in a look of defiance. How cute. You bet you could find something more productive for them to be doing...");
	output("\n\nGrabbing the front of the officer’s blouse, you push her back down onto the metal floor and tear her shirt open, letting those bountiful honeypots flow out into your hands. They’re as soft as they look, and her saucer-sized golden teats bead with sweet nectar with just the lightest little squeezes. She must be eating for the whole rebel cell, storing all their food in these oversized melons of hers. Honeypot is right!");
	output("\n\nYou work your way up, running a honey-slicked thumb across the ant-girl’s lips, letting her taste herself while you disrobe.");
	output("\n\n<i>“What vileness are you planning?”</i> she breathes around your fingers, staring at you with wide eyes, both fathomless as black holes that draw you in until your face is barely an inch from hers. Her nose curls, but your playing hands soon draw a soft little gasp from her, making her back arch off the metal floor.");
	output("\n\n<i>Vileness is such a strong word</i>, you think to yourself. Why, it’s downright tender... or would be, if you weren’t in an alien warzone surrounded by four-armed terrorists with mommy issues. As it is, well, she’d have done worse to you, right?");
	output("\n\nYou shift up her body, planting your [pc.butt] on the tops of her prodigious tits and presenting your [pc.vagOrAss] to the oversexed ant, circling the entrance with a honey-slicked digit. The myrish officer cocks an eyebrow, but her antennae swivel directly towards your sex, and her eyes widen ever so slightly.");
	if(pc.isMischievous()) output("\n\n<i>“C’mon, you know what to do,”</i> you urge her, giving her a lascivious grin. <i>“Living with all these girls, you’ve gotta know how to take care of each other...”</i>");
	else output("\n\n<i>“C’mon, get licking,”</i> you command her, crooking a finger to get the ant-babe off her back.");
	output("\n\n<i>“Disgusting red-lover,”</i> the officer growls, but a few tweaks of her nipples has her gasping, surrendering to boob-fueled lusts that make her obey, just to keep the pleasure coming. She cranes her head up, running out a long, sinuous tongue out from between her amber lips, flicking " + (pc.hasVagina() ? "between the lips of your [pc.cunt], displaying all the skill you’d have expected from an officer in an all-woman army. She probably keeps discipline by doing this to her troops!" : "around the rim of your [pc.asshole], though she seems much less than enthused about the prospect.") + " You bite your lip, suppressing a little moan her work draws out; ohh, you needed something like this after all this fighting!");
	output("\n\nThe moan turns into a sigh, a long exhalation as the myr-girl’s tongue presses against your entrance, urging your body to open for her like a flower. Little lightning bolts of pleasure surge out from around her probing muscle as it brushes against your inner walls, teasing around the shallows before diving in deep. You shudder, sliding down from the mountains of ant-boobage to push your [pc.vagOrAss] down on her plush lips, letting her tongue explore as far into your body as it possibly can.");
	output("\n\n<i>“Good girl,”</i> you coo, patting the side of a monumental boob. The myr narrows her eyes at you, but doesn’t stop licking. Good girl indeed.");
	output("\n\nYou let your weight bear down on the insectile slut’s face, pinning her to the rickety tower’s shuddering floor. She grunts and growls, trying to come up for air, but it’s a futile task: you’re all but drowning her in " + (pc.hasVagina() ? "muff" : "butt") + " until you’re almost ready to cum.");
	output("\n\nThe officer between your [pc.legs] squirms, feeling the quickening contractions in your [pc.vagOrAss] around her tongue. You squeeze your muscles together, making sure she doesn’t escape until you’ve had your fun. And she tries, one last attempt to deny you of your prize, a final show of disdain for you, the Federation, everything the both of you stand for... ");
	output("\n\nAnd just like the Federation, you’re stronger. You dominate the golden slut, refusing to let her have her way: you take what you want from her, since you’ll get it no other way. And just like a gold myr, you think she secretly likes it... if only from the way her nipples are rock hard behind you, and a glance over your shoulder shows you a little pool of femcum spreading from the flushed lips of her abdominal cunt.");
	output("\n\nWhen your orgasm comes, riding the wave of struggle-tongue-fucking, it comes <b>hard</b>. Or rather, you do. You gasp, moaning, thrusting your [pc.hips] against the officer’s face, grinding your [pc.vagOrAss] against her amber lips. ");
	if(pc.hasCock()) output("Your [pc.cock] throbs once, then erupts in a stream of [pc.cumColor] that splatters the top of the ant’s head and smears across her face. ");
	if(pc.hasVagina()) output("Your pussy leaks around the myr’s tongue, trickling your orgasmic juices down her cheeks as you cum. ");
	output("The submissive ant sputters, finally extricating herself when you relax your thighs, and her chest heaves as she gasps for breath.");
	output("\n\nWhile she’s preoccupied, you grab her wrists and tie them to the shelves nearby, making sure she isn’t going to be a threat going forward. Your eyes wander over the comms relay she was using...");
	output("\n\n");
	
	processTime(15+rand(6));
	pc.orgasm();
	
	CombatManager.genericVictory();
}

public function fedQuestOfficerLeave():void
{
	clearOutput();
	clearMenu();
	showBust("GOLD_REMNANT_SI_OFFICER");
	author("Savin");
	
	output("You just walk over and deliver a quick backhand to the rebel officer, knocking her lights right out. Just in case, you tie her up, leaving her four wrists tied up on the shelves nearby.");
	output("\n\nAnd now to figure out your next move. Your eyes wander over the comms relay she was using...");
	output("\n\n");
	
	processTime(5+rand(3));	
	CombatManager.genericVictory();
}

public function fedQuestRadioFolder():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("You pull the folder off the shelf and toss it onto the console. A quick look through the few dozen pages inside reveals nothing but gibberish. Page after page after page of absolute, unintelligible gibberish. At first you think that your translators are fucked, but a quick glance at some of the other documents lying around shows that they’re still legible... so what gives?");
	if(pc.isBimbo() || pc.isBro() || pc.intelligence()/pc.intelligenceMax() < .33) output("\n\nHow weird!");
	else output("\n\nOnly when you get to the last page in the folder does everything make sense: several lines of the gibberish are paired with identical-length phrases in the gold myr’s language... it’s a cipher! No doubt that the Federation would kill to have this.");
	
	processTime(10+rand(5));
	addButton(0, "Take It", fedQuestRadioFolderTake, undefined, "Take It", "Take the cipher and deliver it to the Federation.");
	addButton(1, "Destroy", fedQuestRadioFolderDestroy, undefined, "Destroy It", "Giving the cipher to the Federation could tip the balance of the tenuous peace. Better make sure they don’t get it.");
}

public function fedQuestRadioFolderTake():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("You take the folder and stuff it into your pack. There’s probably a reward in it for you if you make it back to the field marshal with this in tow.");
	flags["FEDERATION_QUEST_CYPHER"] = 1;
	
	processTime(3);
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fedQuestRadioFolderDestroy():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("Somehow, you figure the planet would be better off without anybody getting ahold of this. You grab a match off of the defeated officer and strike it off her uniform cap, letting the flames kiss the corner of the folder. It catches fire, browning and curling until you’re forced to drop it to the ground. A few minutes later and there’s nothing left but ash.");
	flags["FEDERATION_QUEST_CYPHER"] = 0;
	
	processTime(3);
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

//Calling the Queen for the final battle
public function fedQuestRadioSet():void
{
	clearOutput();
	clearMenu();
	author("Savin");
	
	output("You step over to the primitive communications terminal and " + (pc.characterClass == GLOBAL.CLASS_ENGINEER ? "push a few buttons, quickly figuring out how to active it" : "tell it to turn on. Nothing happens. You command it to activate. To broadcast. Nothing. Uh... how does this thing work? You grumble and start searching for an analog “on” button, but damn there’s a lot of buttons and dials and knobs on this thing, none of which have any obvious purpose. Half of them aren’t even labelled! Ugh. It takes you several minutes to finally make it do anything, and then there’s quite a bit more knob-fiddling before it seems to be working right again") + ".");
	output("\n\nSure that you have things settled the way they should be, you bring the headset up to your [pc.ear] and listen in.");
	output("\n\nA woman is speaking over the radio, urgency in her voice:");
	output("\n\n<i>“Ellira, come in! Ellira? Daughter, answer me!”</i>");
	output("\n\nDaughter? That means... the queen! You’ve got her on radio!");
	if(pc.isAss())
	{
		output("\n\nA victorious smirk on your lips, you hold down the “TALK” button and say, <i>“Sorry, queenie. Your daughter’s indisposed at the moment.”</i>");
		output("\n\n<i>“Who-?”</i> the voice comes back, scowl almost audible. <i>“You "+pc.mf("bastard","bitch")+"! I won’t let you red dogs get away with this!”</i>");
		output("\n\n<i>“Then come and stop me,”</i> you taunt, and smash the radio. Hopefully, that’ll lure your quarry right to you...");
		output("\n\nTurning to the window, you watch a big, bulky armored truck pull up outside. Must be the queen.");
	}
	else if(pc.isMischievous())
	{
		output("\n\nYou pitch your voice as best you can to match the ant officer’s. It’s not a great impression, especially since you don’t speak their language except through a translator program, but... hey. At least there’s a lot of static and distortion on the line. Probably can’t tell too much difference.");
		output("\n\n<i>“Uhh... everything’s under control. Situation normal,”</i> you try.");
		output("\n\nThe woman comes back, <i>“What happened? We heard gunfire from the factory!”</i>");
		output("\n\n<i>“Just, uh, just a weapons malfunction. But, uh, everything’s alright! I’m fine. Everybody’s fine, thank you! Uh, how’re you?”</i>");
		output("\n\nThere’s a moment of silence. <i>“I see. Perhaps I should return and check in on my careless daughters, then.”</i>");
		output("\n\n<i>“Uh, no, no, that’s alright. We, uh, have a fuel leak here! Hit a gas line. Give us a few minutes to patch it up!”</i>");
		output("\n\nThe voice pauses again. <i>“You’re not Ellira. What have you done with my daughter!?”</i>");
		output("\n\nYou sputter, looking out the window towards an approaching armored truck thundering down the street. Guess she’s coming to visit.");
		output("\n\n<i>“Bye, mom!”</i> you laugh, and blast the console.");
		output("\n\nBetter get ready for your royal audience!");
	}
	else
	{
		output("\n\n<i>“Hello?”</i> you venture. <i>“This is [pc.name] Steele. Your daughter is unharmed... Queen Estallia.”</i>");
		output("\n\nA moment’s silence passes. <i>“I’d heard there was a star-walked amongst this red filth. I thought your kind were supposed to be elevated, enlightened. Yet here you are, supporting the brutal war-mongers that have torn this planet apart.”</i>");
		output("\n\n<i>“Seems to me like you’re the one keeping this war going,”</i> you answer back. <i>“We’re stopping you.”</i>");
		output("\n\nYou hear a sharp breath, then a long sigh. <i>“I can’t allow that. I will reclaim my daughters, and you will be my prisoner. You must realize you are alone here. There is nobody left to stop me.”</i>");
		output("\n\n<i>“We’ll see.”</i>");
		output("\n\nYou smash the radio and turn to the windows, watching a bulky armored truck trundle into the cargo dock. Looks like your royal audience will be waiting for you...");
	}
	flags["FEDERATION_QUEST"] = 2;
	processTime(10+rand(5));
	rooms["V19"].removeFlag(GLOBAL.OBJECTIVE);
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fedQuestQueen():void
{
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	showName("WAR QUEEN\nESTALLIA");
	author("Savin");
	
	output("When you return to the floor of the garage, the side loading door is open, letting in waves of searing desert air. Several haggard-looking gold myr soldiers stand around the back of a thrumming truck that’s parked there, surrounding what can only be a queen: a massive woman, towering nearly twice as tall as any of her daughters, with four massive breasts held back by battle-scarred tank treads wrapped around her chest and shoulders. She’s carrying a pair of swords, crude metal beams forged and sharpened into blades fit for her tremendous size.");
	output("\n\nOne of her eyes is covered in a dark cloth, but the other black orb regards your coldly, sizing you up before she finally speaks.");
	output("\n\n<i>“So our red sympathizer finally shows [pc.himHer]self. Most of your friends are dead... or fled. My daughters are sweeping the city for what’s left of them. I doubt my girls will find much more than broken chitin. As for you, though...”</i> The queen hefts one of the over-sized greatswords from her shoulder, levelling the tip at your chest in challenge.");
	output("\n\nShe hasn’t attacked yet, though. Maybe you have a chance to try something...");
	
	processTime(5+rand(2));
	
	addButton(0, "Attack", fedQuestQueenAttack, undefined, "Attack", "Let’s get this over with.");
	addButton(1, "Go Home", fedQuestQueenHome, undefined, "Talk: Go Home", "Tell the myrish queen to go home. There’s no need to fight here.");
	addButton(2, "Surrender", fedQuestQueenSurrender, undefined, "Talk: Surrender", "Try and get the queen to surrender. The fight’s already lost, and she’s got a better chance with you than with the Federation commandos.");
	addButton(3, "Why Fight?", fedQuestQueenWhy, undefined, "Talk: Why Fight?", "Try and figure out why the myrish War Queen is fighting this hopeless battle!");
	addButton(4, "Leave World", fedQuestQueenLeave, undefined, "Talk: Leave World", "Rather than fight a losing battle against the Federation, what if she simply left for greener pastures?");
}

public function fedQuestQueenAttack():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("You draw your [pc.weapon] and return the queen’s threat, ready to show these gold myr bitches what you star-walkers can do.");
	
	clearMenu();
	addButton(0, "Next", fedQuestQueenFight, undefined, "", "");
}

public function fedQuestQueenHome():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“I don’t want to fight you,”</i> you tell the queen, putting your hands up in a gesture of peace. <i>“Hasn’t there been enough bloodshed?”</i>");
	output("\n\nShe glowers. <i>“Clearly not. I still see one venom-sucker still standing. You come here to kill me and my daughters, and now you talk of peace?”</i>");
	processTime(5+rand(2));
	
	addDisabledButton(1, "Go Home", "Talk: Go Home", "You already tried this.");
	addButton(5, "Save Her", fedQuestQueenSave, undefined, "Talk: Save Her", "You came all this way to save the gold myr. You have no intention of fighting her... or letting her be captured.");
	addButton(6, "Try Peace", fedQuestQueenTryPeace, undefined, "Talk: Try Peace", "You came here to try and stop this war! The Gold Myr have already lost: why keep fighting?");
}

public function fedQuestQueenTryPeace():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“I came here to stop this war!”</i> you retort. <i>“Your people have already lost. Fighting now is just wasting your lives. The Federation isn’t so bad -- look at Kressia. Your people there are starting to rebuild. To learn to live with the reds. You can too! Keeping up this fight is just suicide now.”</i>");
	output("\n\nThe soldiers behind the queen, her daughters one and all, seem unfazed by this assertion. Their hands remain doggedly on their clubs and rifles, and their mother does not so much as look at them for validation as she answers, <i>“We already knew that going in. Nobody’s here who isn’t prepared to die for our freedom.”</i>");
	output("\n\n<i>“I’d rather die than live as a red slave!”</i> one of her daughters interjects.");
	output("\n\nAnother belts out <i>“Death before dishonor!”</i>");
	output("\n\nThe queen smiles at her daughters’ commitment. <i>“You see, alien? There are worse things than death. I’d rather see my children die for what they believe in than become thralls to foreign tyrants. Be they from across the sea or beyond the stars!”</i>");
	output("\n\nGuess there’s no reasoning with the towering queen. You ready yourself to fight.");
	processTime(5+rand(2));
	
	clearMenu();
	addButton(0, "Next", fedQuestQueenFight, undefined, "", "");
}

public function fedQuestQueenSave():void
{
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“Wait, please,”</i> you say. <i>“I didn’t come here to fight you. I came to help, damn it!”</i>");
	output("\n\nThat gives them pause. Enough that you aren’t riddled with bullets right away, at least. You continue while you can, saying that you came to stop the bloodshed, not continue it. You’ve got no loyalty to the Federation. You’re no myr, after all. " + (flags["KING_NYREA"] != undefined && pc.hasPerk("Nyrean Royal") ? "All you care about is your "+pc.mf("king","queen")+"dom of nyrea down below the surface. " : "") + "The violence is hurting everyone... and you didn’t come here to see the queen lose all her daughters for what -- pride? Even if she defeats Lieve and her troops, the Federation knows where she is. What she’s planning. It’s only a matter of time before this little rebellion all comes crashing down.");
	output("\n\nShe scoffs. <i>“I came here to die, off-worlder. Me and all my daughters... we knew what we were signing up for. Giving the reds one last broken plate before we go is better than the alternatives.”</i>");
	output("\n\n<i>“So that’s it? You’re resigned to just die here?”</i>");
	output("\n\nThe soldiers behind her murmur in affirmation, hefting their weapons. Their queen-mother takes on a wry little smile as her children’s voices ring. <i>“You see, alien? They know as well as I do: there can be no peace between gold and red. There-”</i>");
	output("\n\n<i>“Then live to fight another day!”</i> you plead. <i>“Even if you win now, more Federation troops will come. Or they’ll bomb the city. Or worse. But they’re regrouping now. You’ve got a chance to run. Go back to your city and rebuild, get back what you’ve lost some other way.”</i>");
	output("\n\n<i>“And you would just let us go?”</i> the queen sneers. <i>“How do we know this isn’t some devious red trap? Or are you really that scared of us?”</i>");
	output("\n\nIt’s her troops that have control of the city. You’re just one "+pc.mf("man","woman")+" in the middle of all this, trying to keep everybody alive.");
	if(pc.isMischievous())
	{
		output("\n\nAfter a moment, the queen shakes her head. <i>“You have a liar’s look, alien. No, I’ll not walk into a trap. I choose to fight with honor!”</i>");
		output("\n\nHer daughters cheer behind her, readying their weapons. You guess that’s it, then.");
		processTime(7);
		clearMenu();
		addButton(0, "Next", fedQuestQueenFight, undefined, "", "");
	}
	else
	{
		output("\n\nA moment passes, filled with uncomfortable silence. The golden-hued rebels look between themselves, then at their titanic matron.");
		output("\n\n<i>“What will your Federation friends do when they realize what you’ve done?”</i> the queen wonders aloud, still eying you suspiciously. <i>“I struggle to believe in selfless sacrifice these days.”</i>");
		output("\n\nA fair question. <i>“They wouldn’t dare hurt an off-worlder. Especially someone well-connected like me.”</i> At least, you hope so.");
		output("\n\nThe queen seems to think for a moment, sizing you up with her one good eye like she can the measure of you from your face alone. When she finally speaks, her voice is low but hard, a hiss across the old factory. <i>“I hate that I believe you, alien. But I feel that you speak true... and I would not have my daughters die for nothing. This city has served its purpose. Perhaps it is time to leave.”</i>");
		output("\n\nShe looks back to her daughters, and finds no complaints from the gaggle of golds at her heels. Slowly, they start lowering their weapons, pulling off gas-masks and helmets. Underneath are young women, sun-burnt and dirty, with shaggy gold and black hair hanging in sweaty clumps across their faces. You expected them to look angry, fearsome, determined... something. Instead, they just look sullen. Hungry.");
		output("\n\nEstallia’s shoulders lower slowly, and she sheathes her swords on her abdomen. Without a word, she turns back to the truck. Her daughters follow, shortly followed by more gold soldiers filing out from the shadows -- including those you’d defeated earlier. The intelligence officer from the tower saunters by, escorted by a pair of troopers, and blows you a kiss before embarking onto the truck, shortly followed by the last of Estallia’s soldiers.");
		output("\n\nThe queen is the last to embark, keeping her eye on you until the last of her daughters is safe.");
		output("\n\n<i>“I will not forget this, star-walker. Nor will my queenly sisters. Pick your allies carefully on our world, alien. Not all will be as reasonable as I am.”</i>");
		output("\n\n<i>Says the terrorist,</i> you think to yourself, watching the War Queen depart. You’re not sure if you’ve made the right choice... if letting her walk away will really save lives, rather than just postponing the destruction her rebels would cause.");
		output("\n\nBarely a minute passes after the armored truck trundles away before there’s an explosion behind you. Hot wind billows past, carrying with it dust and debris. Jackbooted feet thunder on the concrete floor, accompanied by the sounds of weapons cocking and red myr shouting.");
		output("\n\n<i>“[pc.name]!”</i> Lieve shouts, stepping to your side with her shotgun at her shoulder. <i>“Where’s the queen? We saw her APC driving up!”</i>");
		output("\n\n<i>“She’s gone,”</i> you answer back, not taking your eyes off the empty vehicle dock. <i>“She and all her daughters. They won’t trouble you anymore.”</i>");
		output("\n\nYou hope.");
		output("\n\nLieve blinks, slowly lowering her gun. <i>“You... you let them go?”</i>");
		output("\n\nNodding, you turn to the ant-women filing into the factory. <i>“I did. Queen Estallia has realized that her daughters’ lives are more important than her revenge.”</i>");
		output("\n\nThe commandos scowl, and more than one of them aims her rifle at you.");
		output("\n\n<i>“That wasn’t the mission, [pc.name],”</i> Lieve growls. At least she keeps her shotty pointed down. <i>“What the fuck were you thinking?”</i>");
		output("\n\n<i>“That there’s been enough suffering on this planet already,”</i> you answer, putting your [pc.weapon] away. <i>“There’s no more terrorists. The War Queen’s gone home. Mission accomplished.”</i>");
		output("\n\nLieve sighs, then curses. Her fist slams into a the nearby skeleton of a tank, sending a shuddering <i>thump</i> echoing through the factory floor.");
		output("\n\nEerie silence falls afterwards. A stark difference from the din of battle that’s permeated the ruined city up until now. After a short while, Lieve motions for her commandos to lower their weapons and turns back to you. <i>“Dammit. If you were one of my troops I’d deck you for this. String you up for lashes! Dammit all!”</i>");
		output("\n\nLieve takes a second to calm herself before her shoulders finally slump, and all the fight goes out of her. <i>“Fuck it. As long as the attacks stop. Let’s just... let’s just go.”</i>");
		processTime(15+rand(6));
		flags["FEDERATION_QUEST"] = 5;
		addButton(0, "Next", fedQuestResolution, undefined, "", "");
	}
}

public function fedQuestQueenSurrender():void
{
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“Listen, more Federation troops are on their way,”</i> you tell her. Hell, it’s probably even true. <i>“They’re not going to stop until you’re captured... or worse.”</i>");
	output("\n\n<i>“I know,”</i> the queen says. She sounds almost proud. <i>“We’re a thorn in the imperialists side, one last reminder that freedom for my people will not die quietly! To surrender would undo everything we’ve fought for. That my daughters have died for. I will not give in to Red tyranny, nor that of their alien masters!”</i>");
	output("\n\nDammit. <i>“Can’t you see this is suicide? Your pride is going to get you all killed!”</i>");
	output("\n\nThe soldiers behind the queen, her daughters one and all, seem unfazed by this assertion. Their hands remain doggedly on their clubs and rifles, and their mother does not so much as look at them for validation as she answers, <i>“We already knew that going in. Nobody’s here who isn’t prepared to die for our freedom.”</i>");
	output("\n\n<i>“I’d rather die than live as a red slave!”</i> one of her daughters interjects.");
	output("\n\nAnother belts out <i>“Death before dishonor!”</i>");
	output("\n\nThe queen smiles at her daughters’ commitment. <i>“You see, alien? There are worse things than death. I’d rather see my children die for what they believe in than become thralls to foreign tyrants. Be they from across the sea or beyond the stars!”</i>");
	output("\n\nGuess there’s no reasoning with the towering queen. You ready yourself to fight.");
	
	processTime(7);
	clearMenu();
	addButton(0, "Next", fedQuestQueenFight, undefined, "", "");
}

public function fedQuestQueenWhy():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“" + (pc.isBimbo() ? "Could I, like, ask you some stuff?" : "Before this goes any further, I have a question.") + "”</i>");
	output("\n\nThe War Queen cocks an eyebrow. <i>“Very well. I’ll not deny a condemned "+pc.mf("man","woman")+" [pc.hisHer] last questions.”</i>");
	output("\n\nThat’s a start, at least. <i>“Why are you still fighting? Can’t you see that this fight is already lost? A group your size can’t possibly overthrow the Federation!”</i>");
	output("\n\nThe queen laughs. Uproariously, throwing her head back and guffawing at you. <i>“Of course it can’t. We’ve long since passed the point of being able to win this war. Now, we want to make these red whores bleed for every inch of Republic soil they defile. I want them to suffer for what they’ve done, to my people... my daughters... my country! We will make them pay!”</i>");
	output("\n\n<i>“Is this vengeance worth your life; your <b>daughters</b> lives?”</i>");
	output("\n\nThe haughty grin slides off her amber lips. <i>“I have witnessed the ‘mercy’ of the victorious reds, and I will not see more of my children live as slaves!”</i>");
	output("\n\n<i>“For years we fought against the red aggressor, forced to defend our borders from their expansionist desires. But my sisters were always weak-willed. Unwilling to do what needed to be done. They lost us this war. Now they seek to appease our red overlords... or come crawling to you aliens to protection, hoping you’ll save them from their own pathetic weakness! Unlike those simpering cowards, I refuse to go down without one last fight. And my daughters... I raised no cowards, alien. My children are of stronger stock.”</i>");
	output("\n\nThe soldiers behind her murmur in agreement, rattling their metaphorical sabers... and also a few real ones.");
	
	flags["FEDERATION_QUEST_WHY"] = 1;
	processTime(7);
	addDisabledButton(3, "Why Fight?", "Talk: Why Fight?", "You already tried this.");
}

public function fedQuestQueenLeave():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	if(flags["FEDERATION_QUEST_WHY"] == undefined)
	{
		output("<i>“Have you ever thought about just leaving?”</i> you suggest. <i>“Us aliens could find you and yours somewhere else to live, away from the Red Myr.”</i>");
		output("\n\n<i>“I will not rely on your charity, alien,”</i> the queen snorts. <i>“I fought for years against the red menace. I watched my city crumble under the treads of their tanks, and my daughters and sisters fall under their guns... or worse, to their venom. I am not thinking of escape, alien. All I think of is vengeance!”</i>");
		output("\n\nO-okay then.");
		processTime(5);
	}
	else
	{
		output("<i>“I understand you want to go down fighting,”</i> you say. <i>“You think that’s better than living as slaves. Okay. But wouldn’t the great snub to the Federation be knowing -- always knowing -- that there are gold myr living free out there in the galaxy, forever out of their reach?”</i>");
		output("\n\nThe queen’s upper set of arms cross, and the lower pair rest on her hips, still clutching her sword-hilts. <i>“Would that I could be a thorn in their side forever. But I am not that naive. I know this rebellion will end eventually, in the only way it can.”</i>");
		output("\n\n<i>“What if there was another way? What if you could leave Myrellion altogether; settle someplace else?”</i>");
		output("\n\nShe scowls. <i>“I will not-”</i>");
		output("\n\n<i>“Leave your home? This isn’t your city, is it? No. Your home is gone. Swallowed up by the red myr! Will you not run? You’re terrorists, hiding in ruins and striking from the shadows. I’m asking you to think about your daughters: don’t let them live out their lives hiding, scurrying in the darkness, when you could be out in the galaxy building a new life for yourselves. The Federation can’t touch you on another planet!”</i>");
		output("\n\nThe queen and her soldiers all regard you for a moment, considering what you’re saying. Finally, Estallia says, <i>“Where would we go, off-worlder? What gracious peoples would take a battalion of battle-hardened refugees whose technology is millennia behind their own. What have we to offer but our bodies?”</i>");
		output("\n\nOnly they have the answer to that question. Surely the queen and her children did something before the war?");
		output("\n\nOne of the soldiers speaks up. <i>“I was a miner.”</i>");
		output("\n\n<i>“I spent six years as a mechanic,”</i> another offers. One of her four arms is in a sling, and the other three carry large steel picks, covered in rust and red stains.");
		output("\n\n<i>“I distilled honey wine,”</i> a third girl, one with particularly large breasts under her tattered uniform, says.");
		output("\n\nOthers start to chime in after them, listing off occupations and skills. None of them are what you’d call modern: there’s no computer techs or starship engineers amongst them. But they <i>are</i> skills. A foundation they can build on... or somewhere to start on an all new world. They <i>can</i> do other things than just fight!");
		output("\n\nThe queen considers your words, and her daughters’, for a long, long time. Her plated fingers tap rhythmically on the hilts of her greatswords. Finally, she speaks again: <i>“Perhaps you speak the truth, star-walker. Before your kind came, I’d joked that our world was doomed. Then the aliens came and threatened us all from the sky. I didn’t see a way to save us then. Perhaps you were a solution in disguise all along.”</i>");
		if(pc.isMischievous()) output("\n\n<i>“That’s me. I’m a problem solver,”</i> you grin.");
		else output("\n\nYou breathe a sigh of relief. Perhaps this War Queen can see reason after all!");
		output("\n\n<i>“So, alien, you seem to have all the answers. How do we get off this world? Where would you have us go?”</i>");
		output("\n\n<i>Good question...</i>");
		processTime(15+rand(6));
		addDisabledButton(4, "Leave World", "Talk: Leave World", "You already tried this.");
		addButton(10, "Kui-tan", fedQuestQueenKuitan, undefined, "Talk: Kui-tan", "The kui-tan seem to have a serious interest in Myrellion. Surely the queen and her troops would be a smash hit on the ‘nuki homeworld.");
		addButton(11, "Mhen’ga", fedQuestQueenMhenga, undefined, "Talk: Mhen’ga", "You know a jungle world that’s full of other honey-swollen yellow insect girls. Maybe the myr would fit in on Mhen’ga?");
	}
}

public function fedQuestQueenKuitan():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“Well, the kui-tan seem to be pretty sympathetic to you. I’m sure they’d give you a home if you asked.”</i>");
	output("\n\n<i>“The kui-tan?”</i> the queen asks, twitch an antenna. <i>“They are " + (pc.race() == "kui-tan" ? "your" : "the") + " small, fuzzy race... all of whom possess hyper-virile male organs.”</i>");
	output("\n\nYou nod. That about sums ‘em up.");
	output("\n\n<i>“You know what they would do with us, don’t you? Amongst their kind, we’d be little more than trench wives of a different sort, controlled by debt rather than lustful venom. I fail to see the difference.”</i>");
	output("\n\n<i>“The difference is that the kui-tan won’t <b>force</b> you to do anything. Slavery is illegal in the Confederacy" + (pc.intelligence()/pc.intelligenceMax() >= .75 ? " and it’d be a public relations nightmare anyway" : "") + "!");
	output("\n\nThe queen considers for a moment, looking at several of her daughters nearby. <i>“And you’re sure of this?”</i>");
	output("\n\nYou nod, trying to seem confident in your proclamation.");
	output("\n\nEstallia sighs, her shoulder slumping slightly. The metal clinging to her flesh groans under the shifting weight of boobflesh.");
	output("\n\n<i>“I have little reason to trust you, alien... but your arguments ring true. I have lost so many children that perhaps my lust for revenge blinded me to those still looking to me for guidance. They deserve better than this world.”</i>");
	output("\n\n<i>“Mother...”</i> one of them says, reaching up and putting a hand on the War Queen’s abdomen.");
	output("\n\nEstallia silences her with a gesture of her hand. <i>“This is a losing war. Our alien interloper speaks true. If there is a way to save you from red oppression... I will take it. Each of you is more precious to me than all the land and wealth on this world.”</i>");
	output("\n\nReturning her attention to you, the queen says, <i>“Very well. If I have your word that we will not be pursued, then my daughters and I will withdraw. We will meet with the kui-tan ambassador and see what he has to say for his people.”</i>");
	output("\n\nYou breathe a sigh of relief and tell her that’s all you can ask for.");
	
	processTime(7);
	clearMenu();
	addButton(0, "Next", fedQuestQueenKuitan2, undefined, "", "");
}

public function fedQuestQueenKuitan2():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("She looks back to her daughters, and finds no complaints from the gaggle of golds at her heels. Slowly, they start lowering their weapons, pulling off gas-masks and helmets. Underneath are young women, sun-burnt and dirty, with shaggy gold and black hair hanging in sweaty clumps across their faces. You expected them to look angry, fearsome, determined... something. Instead, they just look sullen. Hungry.");
	output("\n\nEstallia’s shoulders lower slowly, and she sheathes her swords on her abdomen. Without a word, she turns back to the truck. Her daughters follow, shortly followed by more gold soldiers filing out from the shadows -- including those you’d defeated earlier. The intelligence officer from the tower saunters by, escorted by a pair of troopers, and blows you a kiss before embarking onto the truck, shortly followed by the last of Estallia’s soldiers.");
	output("\n\nThe queen is the last to embark, keeping her eye on you until the last of her daughters is safe.");
	output("\n\n<i>“I will not forget this, star-walker. Nor will my queenly sisters. Pick your allies carefully on our world, alien. Not all will be as reasonable as I am.”</i>");
	output("\n\n<i>Says the terrorist,</i> you think to yourself, watching the War Queen depart. You’re not sure if you’ve made the right choice... if removing the last obstacle between the Federation and complete global domination is really the best thing for Myrellion.");
	output("\n\nBarely a minute passes after the armored truck trundles away before there’s an explosion behind you. Hot wind billows past, carrying with it dust and debris. Jackbooted feet thunder on the concrete floor, accompanied by the sounds of weapons cocking and red myr shouting.");
	output("\n\n<i>“[pc.name]!”</i> Lieve shouts, stepping to your side with her shotgun at her shoulder. <i>“Where’s the queen? We saw her APC driving up!”</i>");
	output("\n\n<i>“She’s gone,”</i> you answer back, not taking your eyes off the empty vehicle dock. <i>“She and all her daughters have agreed to leave Myrellion for good. Their attacks are over.”</i>");
	output("\n\nYou hope.");
	output("\n\nLieve blinks, slowly lowering her gun. <i>“You... you let them go?”</i>");
	output("\n\nNodding, you turn to the ant-women filing into the factory. <i>“I did. Queen Estallia has realized that her daughters’ lives are more important than her revenge.”</i>");
	output("\n\nThe commandos scowl, and more than one of them aims her rifle at you.");
	output("\n\n<i>“That wasn’t the mission, [pc.name],”</i> Lieve growls. At least she keeps her shotty pointed down. <i>“What the fuck were you thinking?”</i>");
	output("\n\n<i>“That there’s been enough suffering on this planet already,”</i> you answer, putting your [pc.weapon] away. <i>“There’s no more terrorists. The War Queen’s gone home. Mission accomplished.”</i>");
	output("\n\nLieve sighs, then curses. Her fist slams into a the nearby skeleton of a tank, sending a shuddering <i>thump</i> echoing through the factory floor.");
	output("\n\nEerie silence falls afterwards. A stark difference from the din of battle that’s permeated the ruined city up until now. After a short while, Lieve motions for her commandos to lower their weapons and turns back to you. <i>“Dammit. If you were one of my troops I’d deck you for this. String you up for lashes! Dammit all!”</i>");
	output("\n\nLieve takes a second to calm herself before her shoulders finally slump, and all the fight goes out of her. <i>“Fuck it. As long as the attacks stop. Let’s just... let’s just go.”</i>");
		
	processTime(15+rand(6));
	flags["FEDERATION_QUEST"] = 6;
	clearMenu();
	addButton(0, "Next", fedQuestResolution, undefined, "", "");
}

public function fedQuestQueenMhenga():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“I know a world that’s ripe for colonization,”</i> you offer. <i>“A jungle planet, home to a race not too dissimilar to yourselves called the zil. They could probably use some strong warriors like you, helping to keep the jungle safe.”</i>");
	output("\n\nMaybe keep the colonists from getting too aggressive in their slaving, too. You never know. ");
	if(flags["PQ_RESOLUTION"] != undefined) output("The zil seem like they can defend themselves better than the colonists give them credit for.");
	else if(flags["FIRST_CAPTURED_ZIL_REPORTED_ON"] != undefined) output("Then again, with Haswell there...");
	output("\n\n<i>“A virgin world, is that right?”</i> the queen says, eying you suspiciously. <i>“With room for me and my daughters to live, unmolested?”</i>");
	output("\n\nWell, there are certainly other people on the planet. You list a few that you’ve seen, and tell her about the port of Esbeth. There’s a small settlement of off-worlders there, but the majority of the planet’s population is much more primitive than the myr. If anything, they’d be the potential conquerors there.");
	output("\n\nEstallia snorts. <i>“We are gold myr! My people are not conquerors, alien. Once, we were a peaceful people, subsisting on trade and mining. Violence has never been in our nature.”</i>");
	if(pc.isMischievous()) output("\n\n<i>Could have fooled you.</i> ");
	else output("\n\nThe state of the planet says otherwise... but you keep that to yourself for now. Instead, you say, ");
	output("\n\n<i>“Then you’ll have no problem making your home amongst the natives and other colonists. They’re trying to find their way to peace, too.”</i>");
	output("\n\n<i>“If you speak true,”</i> Estallia finally says, crossing a pair of her arms, <i>“Then this Main-gah sounds like a paradise compared to the home my daughters have known for the last half decade. But how would we get there? It shames me to say that my people are much less... advanced than yours. We have not learned to travel the stars as your kind has.”</i>");
	output("\n\nThat’s alright... there’s plenty of ways to get to the stars these days. If that’s all that’s keeping the War Queen and her daughters trapped on Myrellion, maybe you could help.");
	
	processTime(15+rand(6));
	if(pc.credits >= 30000) addButton(11, "Donate", fedQuestQueenDonate, undefined, "Talk: Donate", (silly?"Less money, less problems.":"Give the myr rebels enough credits to buy their way off planet. With so many of them, and one as large as the War Queen... you doubt you could find them passage for less than 30,000 credits."));
	else addDisabledButton(11, "Donate", "Talk: Donate", "You don’t have the required 30,000 credits to afford passage for all the rebels.");
	//PC must have a capital ship, or a ship with a shit ton of cargo space. Else, grayed out.
	if(9999 == 0) addButton(12, "Take Them", fedQuestQueenTake, undefined, "Talk: Take Them", "You have a big-ass ship. Big enough to take all these gold myr, anyway. Tell the queen to meet you somewhere safe, and you’ll evacuate them yourself.");
	else addDisabledButton(12, "Take Them", "Talk: Take Them", "There is absolutely no way you could ferry all these gold myr with your current ship.");
	
	if(flags["KQ2_QUEST_FINISHED"] == 1) addButton(13, "Tap Kara", fedQuestQueenKara, undefined, "Talk: Tap Kara", "Kara and her smuggler buddies aboard the <i>Ghost</i> owe you a big damn favor, and you know they’re operating around here. Tap your favor with them to evacuate the myrmedion rebels.");
}

public function fedQuestQueenKara():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“I know some people that might be able to help you with that,”</i> you say, taking out your Codex and bringing up Kara’s contact info.");
	output("\n\nOne short vidcall later and you’ve arranged the pickup. The <i>Ghost</i> will make its way back to Myrellion and embark the War Queen’s daughters at a landing zone she specified, an old airbase a few days’ walk from here on the surface. It’ll take a few trips due to space limits, but Kara’s ship is quick and quiet: you don’t think they myr will have any trouble getting to their new home.");
	output("\n\nOnce the details are settled, the War Queen gives you a solemn nod. <i>“It feels like a betrayal, leaving my home in the hands of the Red Menace. Yet my sister-queens have betrayed me a hundred times over with their cowardice and appeasements. I think it will do my children good to be rid of them, to be able to start anew.”</i>");
	output("\n\nYou hope so. Setting your Codex aside, you shake the War Queen’s hand and tell her that she and her daughters had best leave. Lieve and her commandos won’t be happy to hear what’s happened.");
	output("\n\n<i>“Indeed. You are brave to set aside your alliance for peace’s sake,”</i> she says, almost smiling. <i>“I never thought I’d commend a pacifist again... but there you have it. Tell your Federation friends that the War Queen and her rebels will no longer trouble them. We have stars to explore!”</i>");
	
	processTime(15+rand(6));
	clearMenu();
	flags["FEDERATION_QUEST"] = 7;
	addButton(0, "Next", fedQuestQueenLeaveCombine, undefined, "", "");
}

public function fedQuestQueenTake():void
{
	
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“I can take you,”</i> you offer. <i>“I have a ship. A <b>big</b> ship.”</i>");
	output("\n\nEstallia’s antennae twitch. <i>“Is that so? And you’d put yourself at such risk for us? You must realize the Federation would like nothing more than to destroy us.”</i>");
	output("\n\n<i>“They wouldn’t dare destroy a star-walker ship. If they even could.”</i>");
	output("\n\nShe nods, slowly, thinking. <i>“Very well. For my daughters’ sake, I will trust you, alien. Your logic is iron-clad... and if you speak true, your heart is many times larger than mine would be, were our situations reversed. There is an old airbase, a day’s forced march from here. When your business with the Red Army is concluded, you will find us there.”</i>");
	output("\n\nOne of her daughters hands you a scrap of paper with coordinates.");
	output("\n\n<i>“Be there, soon. We will not last long without the shelter this city provides.”</i>");
	
	processTime(15+rand(6));
	clearMenu();
	flags["FEDERATION_QUEST"] = 8;
	addButton(0, "Next", fedQuestQueenLeaveCombine, undefined, "", "");
}

public function fedQuestQueenDonate():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("If there’s one thing a spaceborne play" + pc.mf("boy","girl") + " like you is good for, it’s shilling out credits when they’re needed. You tap over to your bank account on your Codex and tell the War Queen that you’d be willing to pay for passage -- for her and all her children -- off of Myrellion.");
	output("\n\nThe queen seems genuinely surprised, arching her eyebrows and twitching her antennae. <i>“That is... shockingly generous of you. Why are you so willing to sacrifice for our sake? Surely you know your Federation friends will not take kindly to such a betrayal.”</i>");
	output("\n\nMaybe not, but there isn’t a whole lot the Field Marshal can do about it. For your part, you just want the fighting to stop.");
	output("\n\nWhile you’re trying to explain your reasoning to Estallia, you use your Codex to connect with a frontier mass-transit corp, text a representative and convince him that you’ve got war refugees seeking asylum on another planet, and schedule a pickup for the myr. By the time you’re done moralizing, you’re able to capstone the explanation by saying that a refugee ship will be arriving at the Gildenmere airfield in a few days to pick her and her daughters up.");
	output("\n\nOne of the queen’s officers snatches the Codex from you and examines the messages, eyeing it from beneath a pair of thick spectacles, one lens of which is spider-webbed with cracks. She motions the queen down to her level, and the two exchange a quick whispered conversation that your translators can’t entirely decipher. Once they’ve done, Estallia turns her attention back to you with a solemn nod.");
	output("\n\n<i>“Very well, Steele. We will accept your generosity and leave this planet. Inform your red puppet-masters that they have nothing left to fear from the dreaded War Queen. I only feel sorry for my sister-queens’ daughters left behind in their hands.”</i>");
	output("\n\nYou want to tell her what you really think about Federation rule, but you’ve wasted enough time. Lieve won’t wait forever before she storms this place.");
	output("\n\n<i>“We’ll leave now to go and gather our belongings. What little we have left. With luck, we will see you again.”</i>");
	output("\n\nNow that... would be nice. You give the ultra-buxom ant-matron a smile as she stands, marshalling her daughters.");
	pc.credits -= 30000;
	
	processTime(15+rand(6));
	clearMenu();
	flags["FEDERATION_QUEST"] = 9;
	addButton(0, "Next", fedQuestQueenLeaveCombine, undefined, "", "");
}

public function fedQuestQueenLeaveCombine():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("Queen Estallia gathers her daughters back to the armored truck they arrived in, carting their wounded and lust-drunk sisters out from around the complex and off the streets.");
	output("\n\nThe queen is the last to embark, keeping her eye on you until the last of her daughters is safe.");
	output("\n\n<i>“I will not forget this, star-walker. Nor will my queenly sisters. Pick your allies carefully on our world after we are gone. One thing the queens and the reds have in common is their love of treachery and unrepentant avarice.”</i>");
	output("\n\nYou watch the War Queen depart, driving off into the sunset... or the roiling purple clouds, anyway. You’re not sure if you’ve made the right choice... if removing the last obstacle between the Federation and complete global domination is really the best thing for Myrellion. But it’s certainly the best thing you could do for them, no doubt about that.");
	output("\n\nBarely a minute passes after the armored truck trundles away before there’s an explosion behind you. Hot wind billows past, carrying with it dust and debris. Jackbooted feet thunder on the concrete floor, accompanied by the sounds of weapons cocking and red myr shouting.");
	output("\n\n<i>“[pc.name]!”</i> Lieve shouts, stepping to your side with her shotgun at her shoulder. <i>“Where’s the queen? We saw her APC driving up!”</i>");
	output("\n\n<i>“She’s gone,”</i> you answer back, not taking your eyes off the empty vehicle dock. <i>“She and all her daughters have agreed to leave Myrellion for good. Their attacks are over.”</i>");
	output("\n\nYou hope.");
	output("\n\nLieve blinks, slowly lowering her gun. <i>“You... you let them go?”</i>");
	output("\n\nNodding, you turn to the ant-women filing into the factory. <i>“I did. Queen Estallia has realized that her daughters’ lives are more important than her revenge.”</i>");
	output("\n\nThe commandos scowl, and more than one of them aims her rifle at you.");
	output("\n\n<i>“That wasn’t the mission, [pc.name],”</i> Lieve growls. At least she keeps her shotty pointed down. <i>“What the fuck were you thinking?”</i>");
	output("\n\n<i>“That there’s been enough suffering on this planet already,”</i> you answer, putting your [pc.weapon] away. <i>“There’s no more terrorists. The War Queen’s leaving your people alone. Mission accomplished.”</i>");
	output("\n\nLieve sighs, then curses. Her fist slams into a the nearby skeleton of a tank, sending a shuddering <i>thump</i> echoing through the factory floor.");
	output("\n\nEerie silence falls afterwards. A stark difference from the din of battle that’s permeated the ruined city up until now. After a short while, Lieve motions for her commandos to lower their weapons and turns back to you. <i>“Dammit. If you were one of my troops I’d deck you for this. String you up for lashes! Dammit all!”</i>");
	output("\n\nLieve takes a second to calm herself before her shoulders finally slump, and all the fight goes out of her. <i>“Fuck it. As long as the attacks stop. Let’s just... let’s just go.”</i>");
	
	processTime(7);
	clearMenu();
	addButton(0, "Next", fedQuestResolution, undefined, "", "");
}

public function fedQuestQueenFight():void
{
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	author("Savin");
	
	output("Without another word, the towering War Queen lunges forward. You think she’s coming for you and duck down, taking cover behind the workbenches nearby. Her actual target is the tank in the middle of the assembly line, though: she lands atop it with a thunderous crunch of metal beneath her boots, shaking the mostly-finished armored behemoth. Several of her daughters scurry into the hatches after her, and a second later ");
	if(flags["FEDERATION_QUEST_TANK"] == 1)
	{
		output("the tank engine sputters... and then a cloud of black, greasy gas starts fuming from under the armored turret. The crew screams and starts bailing out, followed by flames licking at their chitin. ");
		//output("\n\n");
		fedQuestQueenFight2();
	}
	else
	{
		output("the engine shudders to life! The whole tank seems to throb and vibrate as the primitive diesel engine roars behind it, pushing to forward off the line -- and straight toward you! The War Queen laughs triumphantly, riding with the tank’s oversized turret as it ponderously rotates to face you down, guns and swords all levelled at you.");
		output("\n\nYou might have the tech... but a tank’s still a tank. And this one’s got a hell of a commander riding it into battle, ready to grind you to paste!");
		processTime(7);
		
		flags["KHORGAN_LEFT_COVER"] = 100;
		flags["KHORGAN_CENTER_COVER"] = 100;
		flags["KHORGAN_RIGHT_COVER"] = 100;
		currentLocation = "KHORGAN_CENTER_COVER";
		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors(pc);
		CombatManager.setHostileActors(new EstalliaTank());
		CombatManager.displayLocation("WAR QUEEN");
		CombatManager.victoryScene(fedQuestQueenFight2);
		CombatManager.lossScene(fedQuestQueenSquish);
		CombatManager.encounterTextGenerator(fedQuestQueenText);
		addButton(0, "Fight!", CombatManager.beginCombat, undefined, "", "");
	}
}

public function fedQuestQueenText():String
{
	var eText:String = "A towering gold myr queen whose breasts are bound by tank treads and whose four arms are wielding a brace of massive iron greatswords. She’s riding atop a heavy tank, crewed by several of her daughters who are manning the heavy machine guns and the main battle-cannon turret under their mother’s iron-shod boots.";
	eText += "\n\n";
	eText += fedQuestQueenUpdateCover();
	return eText;
}

public function fedQuestQueenUpdateCover():String
{
	var coverRemaining:Number = 0;
	if(currentLocation == "KHORGAN_LEFT_COVER") coverRemaining = flags["KHORGAN_LEFT_COVER"];
	else if(currentLocation == "KHORGAN_RIGHT_COVER") coverRemaining = flags["KHORGAN_RIGHT_COVER"];
	else if(currentLocation == "KHORGAN_CENTER_COVER") coverRemaining = flags["KHORGAN_CENTER_COVER"];
	coverRemaining = Math.round(coverRemaining * 10)/10;
	var eText:String = "";
	if(coverRemaining >= 100) eText+= "Your cover is still in pristine condition!";
	else if(coverRemaining >= 75) eText+= "The cover is largely intact.";
	else if(coverRemaining >= 50) eText+= "The cover is in pretty rough shape.";
	else if(coverRemaining >= 25) eText+= "Cover is getting pretty sparse.";
	else if(coverRemaining > 0) eText+= "There’s barely anything to hide behind at this point!";
	else eText+= "<b>There isn’t a scrap of cover to be found! You need to move!</b>";
	eText+= " (" + coverRemaining + " %)";
	return eText;
}

public function fedQuestQueenBonusMenu():void
{
	if(currentLocation == "KHORGAN_RIGHT_COVER")
	{
		addButton(10,"Move Left",fedQuestMoveLeft,undefined,"Move Left","Move to the next cover.");
		addDisabledButton(12,"Move Right","Move Right","There’s no cover to your right. You’ll have to move left!");
	}
	else if(currentLocation == "KHORGAN_CENTER_COVER")
	{
		addButton(10,"Move Left",fedQuestMoveLeft,undefined,"Move Left","Move to the next cover.");
		addButton(12,"Move Right",fedQuestMoveRight,undefined,"Move Right","Move to the next cover.");
	}
	else if(currentLocation == "KHORGAN_LEFT_COVER")
	{
		addButton(12,"Move Right",fedQuestMoveRight,undefined,"Move Right","Move to the next cover.");
		addDisabledButton(10,"Move Left","Move Left","There’s no cover to your left. You’ll have to move right!");
	}
}
public function fedQuestMoveRight():void
{
	clearOutput();
	output("You sprint along to the next cover!\n");
	if(currentLocation == "KHORGAN_LEFT_COVER") currentLocation = "KHORGAN_CENTER_COVER";
	else if(currentLocation == "KHORGAN_CENTER_COVER") currentLocation = "KHORGAN_RIGHT_COVER";
	CombatManager.processCombat();
}
public function fedQuestMoveLeft():void
{
	clearOutput();
	output("You sprint along to the next cover\n");
	if(currentLocation == "KHORGAN_RIGHT_COVER") currentLocation = "KHORGAN_CENTER_COVER";
	else if(currentLocation == "KHORGAN_CENTER_COVER") currentLocation = "KHORGAN_LEFT_COVER";
	CombatManager.processCombat();
}

public function fedQuestQueenSquish():void
{
	clearOutput();
	showBust("ESTALLIA");
	author("Savin");
	
	output("You collapse, crying out in pain. Your mind doesn’t even have the chance to fully register what hit you before the War Queen’s tank comes barreling down the factory floor, grinding its treads directly into your face.");
	output("\n\nYou make a very "+pc.mf("handsome","pretty")+" smear on the ground, at least.");
	
	badEnd();
}

public function fedQuestQueenFight2():void
{
	showBust("ESTALLIA");
	author("Savin");
	currentLocation = "S15";
	pc.shields(pc.shieldsMax());
	clearMenu();
	
	if(flags["FEDERATION_QUEST_TANK"] != 1)
	{
		clearOutput();
		output("The tank shudders and comes to a stop. For a moment, you’re not sure if it’s going to shell you... or just explode. After a moment, though, oily black smoke starts billowing up from between the cracked metal plates. The hatch slams open and the gold myr crewing it start scrambling out, coughing and screaming and spraying some kind of pale foam from handheld throwers back into the belly of the beast. ");
	}
	output("\n\nQueen Estallia leaps off the top of the burning tank, landing with earth-shaking force in front of you. She swings both her greatswords to bear, advancing towards you with a murderous intensity in her one good eye.");
	output("\n\nBefore she can close the distance, something explodes behind you.");
	output("\n\nYour first instinct is to take cover, assuming the tank’s just detonated. Instead of metal shrapnel, though, it turns out to be lead that goes flying over your head instead. You hear shouting, and then a hand grabs you by the shoulder, hauling you to your [pc.feet].");
	output("\n\n<i>“Miss us, Steele?”</i> Lieve says, flashing you a three-fingered hand gesture that’s probably like a thumbs up. Once you’re up, she shoulders her shotgun and takes a step back towards her commandos as they storm in, forming a firing line behind her. On the other side of the factory, Estallia’s daughters are amassing, readying their own weapons.");
	output("\n\n<i>“You handle Estallia and we’ll take care of her daughters!”</i> Lieve shouts. ");
	if(pc.hasKeyItem("Myr Heavy Tranquilizer Dart")) output("\n\nYou check your pack, making sure the vial of queen-sized tranquilizer is still ready to use.");
	else output("\n\nYou really wish you hadn’t wasted your tranquilizer already...");
	
	var enemies:Array = [];
	var queen:Creature = new Estallia();
	enemies.push(queen);
	enemies.push(new MyrGoldBrute());
	for (var i:int = 0; i < 2; i++)
	{
		enemies.push(new MyrGoldRemnant());
	}
	
	var allies:Array = [];
	allies.push(pc);
	allies.push(new Lieve());
	if(flags["FEDERATION_QUEST_AMBUSH"] == 1) allies.push(new Marik());
	for (var x:int = allies.length; x < 5; x++)
	{
		allies.push(new MyrRedCommando());
	}
	
	flags["GOLD_AMBUSH_COVER"] = 0;
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(allies);
	CombatManager.setHostileActors(enemies);
	CombatManager.victoryCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, queen);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.displayLocation("REMNANT HORDE");
	CombatManager.victoryScene(fedQuestQueenVictory);
	CombatManager.lossScene(fedQuestQueenDefeat);
	CombatManager.encounterTextGenerator(fedQuestQueenText2);
	addButton(0, "Fight!", CombatManager.beginCombat, undefined, "", "");
}

public function fedQuestQueenText2():String
{
	//Process Lieve buff for PC
	if(pc.hasStatusEffect("Lieve Buff") && pc.statusEffectv1("Lieve Buff") <= 0) pc.removeStatusEffect("Lieve Buff");
	else if (pc.hasStatusEffect("Lieve Buff")) pc.addStatusValue("Lieve Buff", 1, -1);
	
	//Handle spawning new Golds
	var i:int = 0;
	if(CombatManager.enemiesAlive() < 4)
	{
		var enemies:Array = CombatManager.getHostileActors().slice(1);
		for(i = 0; i < enemies.length; i++) if(enemies[i].HP() <= 0 || enemies[i].lust() >= enemies[i].lustMax())
		{
			if(enemies[i] is MyrGoldRemnant) flags["FEDERATION_QUEST_REVENGE"] = 1;
			else if (enemies[i] is MyrGoldBrute) flags["FEDERATION_QUEST_HOT"] = 1;
			CombatManager.removeHostileActor(enemies[i]);
			CombatManager.addHostileActor(rand(4) == 0 ? new MyrGoldBrute() : new MyrGoldRemnant());
		}
	}
	
	//Determine flavor text
	var allies:Array = CombatManager.getFriendlyActors().slice(1);
	var lieveAlive:Boolean = false;
	var redsAlive:Boolean = false;
	for(i = 0; i < allies.length; i++)
	{
		if(allies[i] is Lieve && allies[i].HP() > 0) lieveAlive = true;
		if((allies[i] is MyrRedCommando || allies[i] is Marik) && allies[i].HP() > 0) redsAlive = true;
	}
	
	var eText:String = "";
	eText += "You’re fighting the War Queen and her daughters, a gaggle of heavily armed gold myr rebels that are bent on going down fighting. They shout <i>“Death before dishonor”</i> and other such slogans as they fight, struggling tooth and nail against you and your red myr allies.";
	eText += "\n\nQueen Estallia is still standing, and as long as she is, so too will her daughters. There’s a seemingly endless tide of gold myr bodies flooding into the factory behind the queen, ready to take the place of their fallen sisters. " + (flags["FEDERATION_QUEST_TRANQD"] == 1 ? "The queen is wobbling on her feet, though, clearly starting to lose her focus due to the drugs coursing through her veins." : "") + "";
	if(lieveAlive) eText += "\n\nLieve and her red myr commandos are supporting you, making their superior gear and training count against overwhelming numbers.";
	else if(redsAlive) eText += "\n\nThe remaining red myr commandos are supporting you, making their superior gear and training count against overwhelming numbers.";
	else eText += "\n\nThe red commandos are all down for the count, leaving you alone to face the queen.";

	return eText;
}

public function fedQuestQueenDefeat():void
{
	if (pc.hasStatusEffect("Lieve Buff")) pc.removeStatusEffect("Lieve Buff");
	
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	showName("WAR QUEEN\nESTALLIA");
	author("Savin");
	
	output("You collapse onto your hands and [pc.knees], gasping for breath and groaning in pain. The din of gunfire all around you is slowly receding, dying down until finally, an almost eerie silence settles over the old factory.");
	output("\n\nAfter a long while, you roll onto your back... and find yourself staring up at several gold myr soldiers walking amongst the fallen red myri. One of them is standing over you, aiming her rifle into your stomach.");
	output("\n\n<i>“[pc.HeShe]’s still alive, mother,”</i> she says, calling over the War Queen. Estallia stalks over, each footstep causing the floor to shudder beneath her iron boots.");
	output("\n\n<i>“Ah, our alien interlope has survived,”</i> she says, a smug smirk on her amber lips. <i>“Good. You’ve brought a great deal of harm to my daughters, star-walker. Your presence emboldened the red bastards far beyond their ability, and you yourself... you fight as well as a company of my own commandos. Too bad you chose the side of evil. We can’t allow you to continue helping our enemies.”</i>");
	output("\n\n<i>“But we won’t kill you,”</i> Estallia says, crossing a pair of arms beneath her massive double-rack of tits. <i>“Unlike your assassin friends, we aren’t barbarians. You will become my prisoner until this conflict is over, and we have reclaimed my daughters’ birthright!”</i>");
	output("\n\nYou gulp as several gold soldiers grab your arms, dragging you away...");

	addButton(0, "Next", fedQuestQueenDefeat2, undefined, "", "");
}

public function fedQuestQueenDefeat2():void
{
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	showName("WAR QUEEN\nESTALLIA");
	author("Savin");
	
	output("It’s been... months, maybe? Maybe even a year since the Federation raid on the rebel base. You long, long ago lost track of time. Your life now revolves entirely around the regular visits from Queen Estallia.");
	output("\n\nToday... or tonight, it’s hard to know so far underground... you are sprawled out across the many cushions and pillows that lie strewn about Estallia’s chambers. Your Codex was taken from you shortly after your capture, the first time you tried to arrange rescue, and so you’re entertaining yourself reading one of the many books in Estallia’s library. One thing you’ve learned in your captivity is that the War Queen loves her books, and even as she and her rebels move from hideout to hideout, the library always manages to come with them. The big vellum tome in your hands is a treatise on Myrellion’s history, thoroughly slanted towards a gold’s perspective, describing reds as soulless mutants that were driven off from the <i>“civilized lands”</i> generations ago.");
	output("\n\nYou’re not sure if the book’s meant to be a tale to scare children, or if someone actually thinks this is history. If so, it’s starting to feel understandable why the golds and reds hate each other so much.");
	output("\n\nYou’re just finishing up one of the later chapters when the door to the queen’s chamber rumbles open. It’s made of solid iron, so big and heavy just by its intrinsic need to admit a woman of Estallia’s height that you’re not sure that they even bother locking it: you can’t hope to budge it, but the queen slides it open with ease, striding into the room with the same confident swagger that she’s been bearing since your capture. Like you’re some kind of prize pet that she’s always happy to see.");
	output("\n\nMaybe that’s exactly what you are.");
	output("\n\n<i>“Another victory,”</i> Estallia says proudly, unbuckling the complex web of belts and harnesses that keep her greatswords strapped to her abdomen. <i>“Your ship has proven worth ten times its weight in kirkite. It’s been years since I’ve seen my daughters’ morale so high as when they see our new flagship tearing through red lines, flying the Republic’s colors.”</i>");
	output("\n\nThe War Queen chuckles to herself, letting the mass of belts and blades clatter to the floor beneath her. A pair of her arms begin tugging at the battle-worn treads that bind her bountiful honeypots, rubbing at fresh scars and cracks in her chitinous plates. The war going hot again has taken its toll on her body, but not her beauty -- nor her spirit, it seems. Indeed, today she seems more cheerful than ever before, smiling unabashedly despite your stares.");
	output("\n\nThe tank treads <i>thud</i> to the floor, revealing the four full bosoms of the queen. <i>“Days like this make me start thinking of what comes next. Once the menace is defeated once and for all. There will be so much to rebuild... and of course, we’ll need to repopulate. My daughters will need new sisters... and brothers, too. I see my sons far too little these days.”</i>");
	
	addButton(0, "Next", (pc.hasCock() ? fedQuestQueenDefeatCock : fedQuestQueenDefeatCooter), undefined, "", "");
}

public function fedQuestQueenDefeatCock():void
{
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	showName("WAR QUEEN\nESTALLIA");
	author("Savin");
	
	output("The golden giant strides towards you, closing the great distance with a single step and " + (pc.isTaur() ? "pulling you to your [pc.feet]" : "hauling you up off your [pc.feet]") + ". <i>“So let’s get started. You’ve still got a purpose to serve, [pc.name].”</i>");
	output("\n\nEstallia shoves you back into the piles of cushions on the floor, splaying you out across the pillows. Her thick, gel-soft abdomen comes down on you a second later, its sheer weight crushing you down into the soft silks beneath you. At her abdomen’s end is a deep, broad fuckslit, each lip almost the thickness of your forearm. It’s wide enough that with a little effort, you could wedge your head in there and get to work" + (pc.totalCocks() >= 3 ? " or stick all your members in there at once and start filling the queen with your seed like her own personal harem" : "") + "; her clit sits at the top of the hungry mouth of her sex, erect and golden-red with her desires.");
	output("\n\nYou’ve come to learn what she desires. Wrapping your arms around the swollen body of her abdomen, you angle her breeding hole down and lock your [pc.lips] around the turgid pillar of queenly clit. Stoic as she might be, even the War Queen gasps with the shock of sudden, intense pleasure. Her pussylips clench together underneath it, leaking thick ropes of glistening nectar onto your [pc.belly]. You suckle upwards, bobbing your head up and down on the length of her oversized clitoris, tasting the honey-sweet juices starting to accumulate on her fevered flesh.");
	output("\n\nEstallia only makes you service her with your mouth for a few moments, long enough to make the battle-worn warrior’s body slicked with excitement. When she’s had her fill of your mouth, the War Queen stands, pulling her clit out out your mouth with a wet <i>pop</i>! She shifts her own body forward, what must be just the slightest little motion for her, but more than enough to drag the weighty breeding-body down your [pc.chest] and belly, and align her lush pussylips with the crown of your [pc.cock].");
	if(pc.totalCocks() == 1) output("\n\nLike all golden queens, Estallia looks like she could take a tree trunk up her twat without a second though. Yet when she lowers her back-pussy down the length of your [pc.cock], it feels every bit as tight as a virgin’s first embrace. You never get used to this feeling, to being so thoroughly wrapped in nectar-slicked muscle, squeezing and kneading you from [pc.knot] to [pc.cockHead].");
	else if(pc.totalCocks() == 2) output("\n\nEstallia’s quim opens like a book, taking your first cockhead between her plush pussylips, and then your second as well, sliding down the length of both your cocks! Despite all the extra room in her cunt, you can feel her muscles squeezing down on you, wrapping every inch of dick in nectar-slick flesh.");
	else output("\n\nAll of your cocks slide into the queen’s quim with ease -- you’re her own one-"+pc.mf("","wo")+"man harem, packing enough cock to fertilize her over and over again until her abdomen is bloated with little myr... and she knows it. Loves it. Relishes it. Her eyes close and a moan escapes her lips, lasting until her quim is pressed against your crotch and all your cocks are fully consumed in the nectar-slick mire of queenly cunt.");
	
	pc.cockChange();
	
	output("\n\n<i>“That’s it. You’re no drone... but you’ll do,”</i> Estallia smirks, settling her abdomen against your [pc.legOrLegs]. She braces two arms on the ceiling, steadying her titanic frame, while the other pair cup and squeeze her ripe honeypots. Fragrant amber drips to the floor in thick, quivering piles, leaning across her breasts and black-chitin fingers in little rivers that beg to be licked clean.");
	output("\n\nBut you’re going <i>nowhere</i> with her abdomen crushing down on you, burying you beneath what feels like a solid ton of fuckmeat.Your arms wrap around her plump backside, sinking into the flesh stretched out between her many armored plates. Your whole world is dominated by the steady rise and fall of the queen’s body, faster and faster until you’re squirming and moaning, pumping [pc.cum] into her waiting wombs.");
	output("\n\nEstallia moans softly, squeezing a particularly thick stream of honey from her teats. <i>“Ah, that feels like a clutch being fertilized... a good first start, [pc.name]. But you have a lot more golden lives to replace tonight.”</i>");
	output("\n\nYou shudder beneath the queen’s plush abdomen, feeling her vaginal muscles slowly wring every last drop of seed out of your cock" + (pc.totalCocks() > 1 ? "s" : "") + ". And she doesn’t stop there -- she never lets you catch your breath on the best of days, and now... now she’s relentless, starting to move again before you’ve even passed the shivering pleasures of your first orgasm, hungry for your seed.");
	output("\n\nAnd she’ll harvest it. Again and again and again, until you’ve fathered a whole generation of the War Queen’s spawn. Her abdomen is swollen with pregnant weight by the time she’s done breeding you that night, but that doesn’t stop her coming the next night, and the night after that...");
	output("\n\nYou’re reduced to little more than another drone, and when the war finally ends years later, you join a legion of male myr in servicing the most powerful queen on Myrellion, ensuring her wombs are never empty, and her brood is the largest of them all.");
	
	pc.removeAll();
	pc.orgasm();
	
	pc.createStatusEffect("Milk Paused");
	pc.createStatusEffect("Cum Paused");
	processTime((3 * 365 * 24 * 60) + rand(1440));
	pc.removeStatusEffect("Milk Paused");
	pc.removeStatusEffect("Cum Paused");
	
	pc.orgasm();
	
	badEnd();
}

public function fedQuestQueenDefeatCooter():void
{
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	showName("WAR QUEEN\nESTALLIA");
	author("Savin");
	
	output("<i>“But that’s going to change, now that the war’s almost won,”</i> Estallia says with a smile. <i>“And <b>that</b> means we’ll need to start rebuilding. To repopulate.”</i>");
	output("\n\nThe War Queen opens the door, never breaking eye contact with you as the steel rolls aside, and a solid dozen gold myr men saunter in. They’re all naked save for little bits of silk and jewelry on their extremities, brazenly displaying their overly-long cocks and cum-swollen testicles.");
	output("\n\n<i>“My poor boys have been away from their momma for so long,”</i> Estallia coos, stroking four of them on the cheeks. <i>“They deserve something special. Something to take their mind off things until I find them a new queen to serve." + (pc.hasVagina() ? " And in the meantime, you can help my bloodline start renewing within your womb. Slower than a queen’s, I know, but every new child helps." : "") + "”</i>");
	output("\n\nThe queen takes a step back, and her children advance on you in a wave of golden chitin and pale, flawless flesh, more supple and soft than you’ve seen since your capture by the grizzled queen and her war-weary band of rebels. Several of them lick their lips or reach down to stroke their soft, low-hanging cocks as they approach.");
	output("\n\n<i>“Have fun, my darlings,”</i> Estallia smiles, retreating to the door, content to merely watch the imminent gangbang.");
	output("\n\nYou don’t exactly have a lot of time to wonder about the twisted form of motherly love she’s showing -- a pair of chitinous hands grab your shoulders, and another quad push you into the pillows, spreading your [pc.legs] and exposing your [pc.vagOrAss]. While he does so, the other myr drones form a circle around you, jerking themselves -- and each other, as often as not -- off while two of their brothers get to work on you, presenting a golden cockhead to your [pc.lips] and another nestling between the cheeks of your [pc.butt].");
	output("\n\nThe sudden, overwhelming smell of too-sweet honey just under your nose makes you choke for a second, just long enough for the scent’s owner to drive his hips forward, plunging the long, slender shaft of his cock down your throat. He doesn’t even both stopping in your mouth, but just pushes your [pc.tongue] down and out of the way. Your throat bulges around him, and it’s all you can do to suppress your gag reflex and choke down the first solid foot of ant-boy dick -- and there’s plenty more to come!");
	output("\n\nThey myr don’t even give you a chance to get used to your throat getting fucked before one of the boys smears a streak of thick, warm precum around the entrance of your [pc.vagOrAss]. You have just enough time to gasp in surprise, coughing up honey-pre as a second dick forces its way inside you. The drone brothers bump their four fists together over your prostrate body as they start to rail you, picking up a staccato rhythm of thrusts that go impossibly deep inside you -- so deep you feel like they’re going to touch at any moment!");
	output("\n\nInstead, the myr brothers pull apart, leaning back to let some of the other boys in on the action. Chitinous hands grab your own, guiding your hands to wrap around the mass of naked dicks surrounding you.Other boys find their own ways to use your body, thrusting their cocks between your [pc.feet]" + (pc.hasBreasts() ? ", between your [pc.boobs]," : "") + " and even under your arms -- anywhere they can press two folds of flesh together around their needy pricks.");
	output("\n\nInundated by golden-hued bodies and amber-leaking dicks, you can’t exactly do much but squirm and moan as the queen’s sons fuck you into the pillows. Over their heads, you can just make out their mother in the door, watching with a glint of pride in her eyes. How sweet...");
	output("\n\nYour rumination is interrupted by a sudden feeling of stickiness in your [pc.vagOrAss], squirting from one of the boy’s cocks. Your body instinctively clenches around him, milking all that fuck-honey out of him... and there’s a <i>lot</i> to milk, too, pouring out of those grapefruit-sized gonads hanging between his skinny legs until you feel like you’ve got a gallon of steaming spunk sloshing around in your " + (pc.hasVagina() ? "womb" : "gut") + ". The myr boy pulls out with a contented sigh, drying his cockhead off on your thigh... and making room for another of his brothers to take his place.");
	
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_MYR);
	pp.cumType = GLOBAL.FLUID_TYPE_HONEY;
	pp.createPerk("Fixed CumQ", 500, 0, 0, 0);
	
	if(pc.hasVagina())
	{
		for(var vIdx:int = 0; vIdx < pc.vaginas.length; vIdx++)
		{
			pc.cuntChange(vIdx, pp.cockVolume(0));
			pc.loadInCunt(pp, vIdx);
		}
	}
	else
	{
		pc.buttChange(pp.cockVolume(0));
		pc.loadInAss(pp);
	}
	
	pc.removeAll();
	pc.orgasm();
	
	addButton(0, "Next", fedQuestQueenDefeatCooter2, undefined, "", "");
}

public function fedQuestQueenDefeatCooter2():void
{
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	showName("WAR QUEEN\nESTALLIA");
	author("Savin");
	
	output("The seventh or eighth load blown inside you clues you into your fate, but it’s the second round of fucking -- when the first boy the have ramming his dick in your [pc.vagOrAss] comes back around and sinks himself into your honey-drenched depths that you fully realize this isn’t going to end.");
	output("\n\nAnd it doesn’t. It never does.");
	output("\n\nEven months later, " + (pc.hasVagina() ? "when your belly is swollen full of half-myr offspring, " : "") + "the boys are still taking turns railing you. These are different drones, you know, drawn from a different queen’s failed harem, but the result is the same: you’re nothing more than the alien cumdump, a fixture in Estallia’s palace to keep her fuck-boys nice and virile while their queen is leading the charge against your former comrades in the Federation.");
	output("\n\nNow you’re just a sextoy, an ornament in the depths of Estallia’s palace. Countless myr boys use your body every day -- and more than a few of her daughters as well, joining in with their brothers and step-fathers to further debase the offworld-whore.");
	output("\n\nAnd after a time, the never-ending suffusion of pleasure erases all doubts from your mind: this is right where you belong. Where you deserve to be.");
	
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_MYR);
	pp.cumType = GLOBAL.FLUID_TYPE_HONEY;
	pp.createPerk("Fixed CumQ", 72000, 0, 0, 0);
	
	if(pc.hasVagina())
	{
		for(var vIdx:int = 0; vIdx < pc.vaginas.length; vIdx++)
		{
			pc.loadInCunt(pp, vIdx);
		}
	}
	else
	{
		pc.loadInAss(pp);
	}
	
	pc.createStatusEffect("Milk Paused");
	pc.createStatusEffect("Cum Paused");
	processTime((5 * 7 * 24 * 60) + rand(1440));
	pc.removeStatusEffect("Milk Paused");
	pc.removeStatusEffect("Cum Paused");
	
	badEnd();
}

public function fedQuestQueenVictory():void
{
	if (pc.hasStatusEffect("Lieve Buff")) pc.removeStatusEffect("Lieve Buff");
	
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	showName("WAR QUEEN\nESTALLIA");
	author("Savin");
	
	processTime(15+rand(6));
	var allies:Array = CombatManager.getFriendlyActors();
	flags["FEDERATION_QUEST_LONE_SURVIVOR"] = 1;
	for(var i:int = 1; i < allies.length; i++) if(allies[i].HP() > 0) flags["FEDERATION_QUEST_LONE_SURVIVOR"] = 0;
	
	if(flags["FEDERATION_QUEST_LONE_SURVIVOR"] == 1)
	{
		fedQuestQueenLone();
		return;
	}
	
	output("Estallia crumbles, collapsing onto her knees and leaning back on her abdomen. Her girder-beam-like swords slam into the ground at either side of her, kicking up thick clouds of dust all around. Seeing their mother fall, the few remaining myr circle defensively around her, but the War Queen puts up a hand. Slowly, deliberately, they lower their weapons -- which are quickly secured by the Federation commandos. The reds start handcuffing their gold counterparts, forcing them onto their knees while you and Lieve approach the War Queen herself.");
	output("\n\n<i>“Spare my daughters,”</i> the queen growls between gritted teeth. <i>“Let them go... please.”</i>");
	output("\n\nEstallia sways, and is forced to steady herself by bracing all four arms on the ground. She almost looks like she’s bowing... or grovelling.");
	output("\n\n<i>“We’re not going to hurt them,”</i> Lieve says, slinging her shotgun over her shoulder. <i>“But if you didn’t want them to end up prisoners... or worse... you shouldn’t have turned them into terrorists! You’re lucky we believe in fair treatment of our prisoners; the Federation doesn’t practice torture.”</i>");
	output("\n\nYou can see the queen’s lips twist, holding back a response. Anything she says can only make her situation worse, and so Estallia falls silent, hanging her head in the shame of defeat.");
	output("\n\nLieve pulls out a pair of four-cuffed restraints, but quickly realizes they’re infinitely too small for the massive queen’s wrists. She makes do with ropes and chains from the factory floor instead, binding the queen as securely as she can before calling several of her troops over to come drag the War Queen back to their truck. The rest fan out to search the factory, trying to recover anything else that might be of interest to High Command.");
	output("\n\nAs the commandos disperse, Lieve turns to you with a big, goofy smile. <i>“We did it! Haha, we did it! The Field Marshal was right to send an off-worlder with us, cuz I don’t think we’d have made it without you. You’re a damn hero, [pc.name]. Or you will be, when we get back to Kressia. Marik’s managed to get the truck working again, and looks like the goldies left us another one big enough for the queen! C’mon, let’s get underway.”</i>");
	output("\n\n");
	
	flags["FEDERATION_QUEST"] = 3;
	processTime(10+rand(5));
	eventQueue.push(fedQuestResolution);
	CombatManager.genericVictory();
}

public function fedQuestQueenLone():void
{
	output("Estallia crumbles, collapsing onto her knees and leaning back on her abdomen. Her girder-beam-like swords slam into the ground at either side of her, kicking up thick clouds of dust all around. Seeing their mother fall, the few remaining myr circle defensively around her, but the War Queen puts up a hand. Slowly, deliberately, they lower their weapons. They don’t pose much of a threat to you anymore, and honestly, they look like they’re barely standing.");
	output("\n\nThe queen curses, groaning in pain" + (CombatManager.getHostileActors()[0].hasStatusEffect("Tranq'd") ? " and confusion, reeling from the drugs in her veins" : "") + ". <i>“And here we are, off-worlder, you and I; my daughters broken and your companions fallen. You are the first truly worthy foe I have faced in many years... so tell me, what is it you want? What would you have of me?”</i>");
	
	addButton(0, "Capture", fedQuestQueenCapture, undefined, "Capture Her", "You came here to capture the queen, so that’s what you’re gonna do.");
	addButton(1, "Let Go", fedQuestQueenLetGo, undefined, "Let Her Go", "You didn’t want to fight the queen anyway. Let her and her daughters go: as long as they promise to stop their attacks against the Federation.");
}

public function fedQuestQueenCapture():void
{
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	showName("WAR QUEEN\nESTALLIA");
	author("Savin");
	
	output("You step forward, aiming your [pc.weapon] at the queen and demanding she surrender herself into the Federation’s custody.");
	output("\n\nThe War Queen stares up at you with her one good eye, gaze full of loathing and disdain. <i>“I have little choice... for my daughters’ sake. Leave them be, let them return to their lives as free women. Swear this to me... and I will become your prisoner.”</i>");
	output("\n\nYou look to the bare handful of women still surrounding the War Queen: they look broken and battered, covered in dirt and grime, emaciated and wearing little more than scraps of their once-fine uniforms. Without their queen to inspire them, they’re not a threat. They barely are one now... so you consent. Estallia is what you were sent here for, and she’s what you’ll bring back to the Field Marshal.");
	output("\n\nThe queen nods and raises a pair of her hands in a gesture of surrender. The other two arms usher her children away, pushing the wounded and the stunned rebels back towards the armored truck.");
	output("\n\nThey don’t go willingly, but they do eventually leave -- not before giving their mother parting hugs and shedding a few tears into her queenly bosom. Estallia gives them each a huge and a smile, telling them to stay strong and live out lives of bounty and peace if they can. As her daughters hesitantly withdraw, Estallia gives you a determined nod and presents her hands for you to bind.");
	output("\n\nYou do so, securing the queen’s four wrists before going to wake up Lieve and her commandos.");
	output("\n\nAfter a bit of shaking, Lieve sits up, rubbing her head. <i>“Ugh, I’ve got a few new cracks in my chitin after that.”</i>");
	output("\n\nShe blinks, finally locking eyes on the queen. " + (hasFuckedLieveSolo() ? "She laughs, grinning ear to ear and throwing her arms around your shoulders. <i>“You did it! Stars and stones, you did it!”</i> she giggles, squeezing you tight. <i>“We actually captured the War Queen!”" : "<i>“Stars and stones, is that.... is that the War Queen?”</i>") + "");
	output("\n\n<i>“Don’t sound so thrilled,”</i> Estallia huffs, glowering at the commandos as they recover. <i>“You did nothing, scarlet whore. You and your thugs would all be dead right now if it wasn’t for your star-walker savior.”</i>");
	output("\n\nLieve hucks a glob of pink-tinged spit into the War Queen’s face before turning to the scattered commandos, pulling them to their feet one by one and sending the wobbly-legged girls out into the factory to secure anything else of value to the Federation while you and Lieve grab Estallia, dragging her back to the half-track.");
	output("\n\n");
	
	flags["FEDERATION_QUEST"] = 3;
	processTime(10+rand(5));
	eventQueue.push(fedQuestResolution);
	CombatManager.genericVictory();
}

public function fedQuestQueenLetGo():void
{
	clearOutput();
	clearMenu();
	showBust("ESTALLIA");
	showName("WAR QUEEN\nESTALLIA");
	author("Savin");
	
	output("<i>“I want you to stop attacking the Federation,”</i> you say, lowering your [pc.weapon]. That’s what this entire mission was really about: securing peace for the Federation occupation force and the myr living under them. <i>“Swear to me that you’ll go and live in peace... and I’ll let you go.”</i>");
	output("\n\nThe queen narrows her one good eye at you, searching your face for any hint of deception.");
	output("\n\nWhen she finds none, Estallia sighs and shakes her head. <i>“I see I have no choice left. It seems I am lucky to be at your mercy, alien, rather than that of your red masters. Peace has never been their goal.”</i>");
	output("\n\nShe might be surprised just how much peace there is when people stop fighting hopeless battles to the bitter, bloody end. Some of her daughters laugh at that, though you can’t tell if it’s sincere or not: they’re too battered and broken to really emote more than hoarse, husky wheezes. You tell them to take their mother and leave: go home, or find a new one; leave the ruins and stay away from Federation soldiers.");
	output("\n\nThe rebels nod, looking almost relieved by your demand as they help their queenly mother to her feet and begin to withdraw. They drag their fallen sisters back to the armored truck Estallia arrived in, followed slowly by their defeated mother.");
	output("\n\nOnce the truck has sputtered off down the street, disappearing into the ruins of the city, you begin the laborious process of patching Lieve and her commandos up, getting them back on their feet.");
	output("\n\nLieve sits up, rubbing her head. <i>“Ugh, I’ve got a few new cracks in my chitin after that,”</i> she groans. <i>“Where’s the queen?”</i>");
	output("\n\nSlowly, you explain what happened: the queen is gone, but she’s vowed to cease her attacks on the Federation. An even trade for the lives of Lieve and all her remaining soldiers, you think.");
	output("\n\nShe grunts and picks up her shotgun, using it like a crutch to get back on her feet. <i>“Damn it all. Well, you did the best you could, [pc.name]. We expected a lot of you... taking down a queen all by yourself was a hell of an ask. But you got us through this suicide mission in one piece. So thank you.”</i>");
	output("\n\nThe two of you get the remaining commandos up and at ‘em, scouring the factory for anything else of value to the Federation before falling back to the half-track.");
	output("\n\n");
	
	flags["FEDERATION_QUEST"] = 4;
	processTime(10+rand(5));
	eventQueue.push(fedQuestResolution);
	CombatManager.genericVictory();
}

//Heading back to Kressia and quest wrap up
public function fedQuestResolution():void
{
	clearOutput();
	clearMenu();
	moveTo("RENNEKE");
	if(flags["FEDERATION_QUEST"] == 3)
		showBust("LIEVE", "RED_COMMANDO", "ESTALLIA");
	else if(flags["FEDERATION_QUEST_AMBUSH"] == 1)
		showBust("LIEVE", "RED_COMMANDO", "RED_HEAVY_WEAPONS");
	else 
		showBust("LIEVE", "RED_COMMANDO");
	showName("\nHALF-TRACK");
	author("Savin");
	if(pc.hasKeyItem("Myr Heavy Tranquilizer Dart")) pc.removeKeyItem("Myr Heavy Tranquilizer Dart");
	
	output("It’s a long, bumpy, quiet ride back to Kressia.");
	if(flags["FEDERATION_QUEST"] == 3) output("\n\nYou’re in the back of the captured truck with Queen Estallia, surrounded by half of the remaining Federation commandos. They keep their weapons ready, and the friendly banter and playfulness you saw amongst them on the trip in is gone entirely: they’re on the clock now, all serious faces and steady trigger fingers. The queen, though, does not try to escape: she’s too battered from the fight, and at this range, even her tremendous strength can do nothing to overwhelm so many guns so close at hand.");
	else
	{
		output("\n\nThe red commandos around you look weary, saying little amongst themselves. Many of them have bandages around their flesh and patches on their chitin; all of them have dour looks, especially when they glance your way.");
		output("\n\nIt’s not a comfortable trip home for anyone.");
	}
	if(flags["FEDERATION_QUEST_AMBUSH"] == 1 && flags["MARIK_FLIRTED"] != undefined)
	{
		output("\n\nMarik puts a hand on your shoulder, giving you a slight smile. Her immense bosoms rise and fall evenly with her breath, stretching the front of her too-tight uniform tunic. As the ride continues on, and day turns into night, the dusky sergeant makes a none-too-subtle offer to let you rest your head on those soft honey-laden pillows. You don’t turn her down.");
		sleepHeal();
	}
	
	if(hours >= 12) processTime((23-hours)*60 + (60-minutes));
	processTime((11-hours)*60 + (60-minutes));
	
	addButton(0, "Next", fedQuestResolution2, undefined, "", "");
}

public function fedQuestResolution2():void
{
	clearOutput();
	clearMenu();
	moveTo("840");
	showBust("LIEVE", "SELLERA");
	showName("MANOR\nWAR ROOM");
	author("Savin");
	
	output("When you arrive back in Kressia, the commandos disembark");
	if(flags["FEDERATION_QUEST"] == 3)
	{
		output(", taking the slumped-shouldered War Queen away towards the local base. ");
		if(flags["FEDERATION_QUEST_LONE_SURVIVOR"] == 0) output("Her daughters are rounded up as well, marched in a different direction.");
	}
	else output(". Several guards outside the manor look at them expectantly... and then sigh and slump their shoulders when no prisoners come forward.");
	output("\n\nLieve puts a hand on your back and guides you up the steps of the mayoral mansion. The sentries standing outside snap to attention as you approach, throwing open the doors for you. Lieve leads you through the familiar winding corridors and elevators down to the Field Marshal’s office. Clearly you’re expected: every door between you and Sellera’s office is opened without a second thought.");
	output("\n\nThe Field Marshal is inside, hands braced against her desk and eyes fixed on a map of " + (pc.hasKeyItem("Gildenmere Pass") ? "a city" : "what looks like Gildenmere") + " pinned down by handguns and knives at its corners.");
	
	if(flags["FEDERATION_QUEST"] > 3)
	{
		output("\n\n<i>“I gave you a job,”</i> the Field Marshal growls. <i>“One job. A hard job, but an important one. I assume you’ve returned empty-handed because you accidentally killed the War Queen, because surely you didn’t-”</i>");
		output("\n\n<i>“She got away,”</i> Lieve says, lowering her eyes... and giving you a push forward. Taking the hint, you spend the next several minutes reiterating what you told Lieve the first time around. With every word, Sellera seems to grow more and more irate; by the end, she’s practically fuming beneath her tight black uniform.");
		output("\n\nRather than exploding, though, Sellera takes a long, deep breath when you’ve finished your explanation. She lets it go in a heavy sigh, and you can hear her chitin grinding as she clenches her fists.");
		output("\n\n<i>“You damn offworlders. As soft as a hatchling’s ass, every last one of you... you don’t understand this war. This world! You think you’re noble and wise, when all you’ve ever known is luxury and hedonism. Letting that whore-queen go will only cause more death and suffering. Even if she no longer threatens us directly, Estallia remains a symbol of rebellion so long as she is free. The chaos she’s caused will never stop so long as she’s free.”</i>");
		output("\n\nSellera punches her desk, growling like a feral wolf. <i>“Go, Steele. Get out of my sight.”</i>");
		processTime(25+rand(6));
		addButton(0, "Next", fedQuestResolutionEscaped, undefined, "", "");
		return;
	}
	
	output("\n\nYou can’t remember ever having seen Sellera smile before, but she greets the two of you with a cheshire cat smile that almost makes you wince back.");
	output("\n\n<i>“Congratulations, you two! Estallia’s capture is a tremendous victory for our occupation. Without their War Queen to rally behind, and all her resources pouring into our cities, it’s only a matter of time before the last embers of the rebellion are stamped out, once and for all.”</i>");
	
	if(flags["FEDERATION_QUEST_CYPHER"] == 1)
	{
		processTime(15+rand(6));
		addButton(0, "GiveDocs", fedQuestResolutionGive, undefined, "Give Documents", "Hand over those code documents you found in the radio tower. This will give the Federation access to Republic communications, putting them in a much stronger position going forward.");
		addButton(1, "KeepDocs", fedQuestResolutionKeep, undefined, "Withhold Documents", "Keep those documents you found in the radio tower to yourself...");
		return;
	}
	
	fedQuestResolutionCaptured();
}

public function fedQuestResolutionEscaped():void
{
	clearOutput();
	clearMenu();
	moveTo("832");
	showBust("LIEVE");
	showName("\nLIEVE");
	author("Savin");
	
	output("Lieve looks like she wants to say something, but instead bites her lip and guides you back outside. It’s a silent walk right up until you reach the gates leading back into town. There, Lieve finally lets a grunt and lets the tension out of her shoulders. ");
	output("\n\n<i>“I’m sorry about... everything. The marshal was right: we needed Estallia. Badly. But I know me and my girls wouldn’t have made it out of that deathtrap without you. So thanks. I mean it.”</i>");
	if(hasFuckedLieveSolo()) output("\n\nShe steps closer, putting her hands on your [pc.hips]. <i>“I knew I picked good,”</i> she smiles, leaning in and putting a kiss on your cheek. Your [pc.skin] tingles, just a bit, making you blush. I’m gonna go tell the girls I didn’t die. Come see me when you get a chance, okay?”</i>");
	else output("\n\nShe gives you a clap on the shoulder. <i>“We’ll get her someday... though probably without your help. I was afraid Sellera was going to try and have you thrown in the brig. No matter how badly we messed up... that would have been a mistake. I’m glad reason won out, because there’s nobody who could have stopped her if she’d decided to commit suicide by alien. Anyway! I’m gonna go check in on my wives, tell ‘em I’m okay. Come see me over at the gatehouse when you get a chance, okay?”</i>");
	processTime(10+rand(5));
	if(flags["FEDERATION_QUEST"] >= 7) flags["FEDERATION_QUEST_EVAC_TIMER"] = GetGameTimestamp();
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function fedQuestResolutionGive():void
{
	clearOutput();
	clearMenu();
	showBust("LIEVE", "SELLERA");
	showName("MANOR\nWAR ROOM");
	author("Savin");
	
	output("You dig into your pack and take out the documents you seized from the radio tower, handing them over to the Field Marshal. She takes them and scatters the papers across the desk, looking them over with a cocked eyebrow. When she realizes what she’s looking at, that cheshire grin returns with a vengeance.");
	output("\n\n<i>“Aha, the golden whores actually wrote this down? It’s not even encrypted. Were they that confident, or just stupid? I’ll make sure our intelligence service gets these, Steele... and they’ll make sure I hear everything the remaining queens say to each other. Good work.”</i>");
	flags["FEDERATION_QUEST_CYPHER"] = 2;
	
	fedQuestResolutionCaptured();
}

public function fedQuestResolutionKeep():void
{
	clearOutput();
	clearMenu();
	showBust("LIEVE", "SELLERA");
	showName("MANOR\nWAR ROOM");
	author("Savin");
	
	output("You decide that the balance of power in the system is probably better off with the Federation not having access to Gold comms. You keep the documents hidden, and let the Field Marshal continue uninterrupted.");
	
	fedQuestResolutionCaptured();
}

public function fedQuestResolutionCaptured():void
{
	output("\n\nLooking quite self-satisfied, Sellera steps around the desk and presents her hand in a surprisingly Terran gesture. You shake it, enduring her crushing grip for a full second before she releases you and sits back on her desk. <i>“Never let it be said the Federation doesn’t reward its friends. We don’t have the same type of currency as you aliens use, but I’m lead to understand you value gemstones as highly as we do.”</i>");
	output("\n\nSellera reaches into the desk and withdraws a small sack, about the size of your palm, and deposits it in your hand. You bounce it, feeling the weight and hearing the jingle of several stones inside. Nice.");
	output("\n\n<i>“Now, if there’s nothing else... I have an interrogation to attend that I’ve been looking forward to for years.”</i>");
	output("\n\nLieve snaps a crisp salute and puts a hand on your shoulder, leading you back up to the manor grounds above.");
	output("\n\nSeveral dozen Federation troops are gathered around the commandos’ trucks, and let out a cheer when you and Lieve stride out. Helmets and caps go flying, and black-clad red rush up the stairs to greet you, shaking your hand and clapping you on the back. There are too many overlapping voices all talking at once for your translators to catch what’s being said, but you get the gist: you’re a big damn hero. You can’t help but smile as you’re all but carried along by the crowd of elated troopers.");
	output("\n\n");
	processTime(10+rand(4));
	
	itemScreen = fedQuestResolutionCaptured2;
	lootScreen = fedQuestResolutionCaptured2;
	useItemFunction = fedQuestResolutionCaptured2;
	
	itemCollect([new GemSatchel()]);
}

public function fedQuestResolutionCaptured2():void
{
	clearOutput();
	clearMenu();
	moveTo("LIEVE BUNKER");
	showName("KRESSIA\nBUNKER");
	author("Savin");
	
	var marikSex:Boolean = (flags["FEDERATION_QUEST_AMBUSH"] == 1 && flags["MARIK_FLIRTED"] == 1);
	var busts:Array = new Array();
	busts.push(hasFuckedLieveSolo() ? "LIEVE_NUDE" : "LIEVE");
	if(marikSex) busts.push("RED_HEAVY_NUDE");
	busts.push(hasFuckedLieveSolo() ? "SIERVA_NUDE" : "SIERVA");
	busts.push(hasFuckedLieveSolo() ? "MAYREN_NUDE" : "MAYREN");
	showBust(busts);
	processTime(6*60+rand(25));
	
	output("<i>Several hours, a trip to a gold myr-staffed titty bar, and more booze than you can count, later...</i>");
	output("\n\nYou slump against the side of Lieve’s bunker, swaying on your [pc.feet] and trying to slur out... something that you’re sure was important. Lieve giggles, patting your shoulder and guiding you inside.");
	if(marikSex) output("\n\nMarik follows you, bellowing with laughter at whatever it was you just said. The burly red sergeant is soaked in liquor -- you definitely remember doing body shots out of that awesome rack of hers, and her shirt’s so soaked now that you can see all that bronzed flesh through the fabric. It’s damn hard to take your eyes off those big, dark teats poking through...");
	if(hasFuckedLieveSolo())
	{
		output("\n\nYou’ve barely made it through the door before the sexy scout leader has her arms wrapped around your neck, pushing you up against the concrete and thrusting her tongue into your mouth. Lieve’s wives come over with smiles and lusty moans, groping and caressing their red wife... and, pretty soon, you as well. Nothing like being properly rewarded...");
		if(marikSex) output("\n\nEspecially when you feel Sergeant Marik’s breasts pressing against your [pc.skinFurScales]. Her strong, muscular arms wrap around you, and you feel her teeth teasing your [pc.ear]. You’re not sure when she lost her shirt, but Marik’s topless and her big brown teats are rubbing against you; Lieve smirks and puts her hands on your cheeks, turning your head to bury you into her sergeant’s cleavage.");
		output("\n\nThe girls pull you down onto the bedding on the floor, spreading your [pc.legs] and tearing your [pc.gear] off. Chitinous digits run across your [pc.skinFurScales], grabbing at your [pc.butt] before searching for something even more sensitive to start stroking...");
		output("\n\nIt’s not long before a pair of crimson lips lock around yours, and red venom licks at your senses. Your [pc.skin] burns with desire: every touch becomes a miasma of pleasurable sensation, and your lust for the big-girls around you drives you to thrust into pussies and suckle on clits with all the passion in the world.");
		if(pc.hasCock()) output("\n\nYour [pc.cock] ends up gripping by latex-smooth chitin fingers and guided into one of the ant-girl’s pussies. Another pushes her breasts into your face, letting you suckle nectar from her meaty mounds. Many, many hands grope and caress you, urging you to fuck harder and faster -- before switching you out to another pussy, or a mouth, or... well, by the time you’re done, there’s no orifice left unfucked. [pc.Cum] runs like thick wine across the bunker floor, smearing in lurid pools of spunk, sweat, and nectar in every crack and crevasse.");
		else output("\n\n Fingers push into your [pc.vagOrAss] while others grope and caress your [pc.chest], pinching your [pc.nipples]. Myr girls kiss and lick at you, worshipping your body with a bath of venom and nectar while you fuck them with your hands, and they do the same to you.");
		output("\n\nYou fall asleep entwined in bodies, surrendering to the drunken stupor and surrounded by the soft bodies of gold myr, and the hard muscles of reds.");
		pc.orgasm();
	}
	else
	{
		output("\n\n<i>“Hey girls!”</i> Lieve calls in, opening her arms wide as the pair of gold myr trench wives comes scampering out, hugging and kissing her -- and quickly getting their daily dose of venom from Lieve’s crimson lips. ");
		output("\n\n<i>“We’ll try and keep it chaste so you can sleep it off,”</i> she says, only half-slurring. Guess she held her liquor a little better... or myr are just damn hardy. You murmur something approaching a thanks and slump down onto the bedding on the floor, clutching at pillows under your head. You feel a body curling up next to you, soft and warm and wrapping an arm around your [pc.chest]. Sleep comes soon after...");
		if(marikSex)
		{
			output("\n\nFor a few hours, anyway.");
			output("\n\nYou awake to hot breath on your cheek, and the feeling of your wrists being pinned on either side of your body. Your eyes blink open blearily, slowly bringing the dark face of Sergeant Marik into focus. She’s grinning down at you, her black eyes twinkling in the flickering lantern-light.");
			output("\n\n<i>“You wanted to see what these muscles could do,”</i> Marik growls softly, mindful of the other sleeping ants around you. <i>“Just try not to scream...”</i>");
			output("\n\nYou try, but having a big, buff chocolate amazon pounding you into the bedding isn’t exactly a serene experience. It isn’t long before there’s a strong hand covering your mouth as Marik’s hips grind against you, ");
			if(pc.hasCock()) output("taking your cock to the hilt in her tight twat");
			else if(pc.hasVagina()) output("rubbing your pussies together");
			else output("rubbing her sultry twat against your tender, bare groin");
			output(". You squirm underneath her, gasping with pleasure and trying to return it as best you can. But this ant’s clearly been pent up for some time before you came along, and she’s ferociously eager to take out all that frustration on your [pc.hips].");
			output("\n\nWhen she’s done, you lie exhausted on the floor, barely able to move thanks to your sore muscles and a pelvis that feels like its been ground to dust. Not to mention the big pair of red myr tits pressed against your face, pinning you down under Marik’s dense, muscular weight as she slides into sleep. Hot breath washes over your [pc.hair], lulling you asleep shortly after her, this time for the rest of the night...");
			pc.orgasm();
		}
	}
	
	addButton(0, "Next", fedQuestResolutionCaptured3, undefined, "", "");
}

public function fedQuestResolutionCaptured3():void
{
	clearOutput();
	clearMenu();
	showBust("MAYREN_NUDE");
	showName("KRESSIA\nBUNKER");
	author("Savin");
	
	sleepHeal();
	eventBufferXP();
	output("You wake up alone come morning, lying on the floor of the bunker covered in a thick beige blanket. The ant-girls have already left, back to their daily rituals and routines, leaving the lazy offworlder to catch [pc.hisHer] beauty sleep. You yawn and start to gather up your gear, trying not to pay attention to the dull throbbing in your head left over from last night’s bender. For such an uptight group, red myr sure know how to party.");
	output("\n\nWhen you finally stagger out of the bunker, one of Lieve’s trench wives, Mayren, is sitting outside on a concrete ledge. She’s very naked, save for a simple gold shawl around her shoulders, and seems to be busying herself with a needle and thread, repairing one of Lieve’s uniform shirts.");
	output("\n\n<i>“Good morning!”</i> she chirps as you step down from the bunker’s hatchway. <i>“Lieve said to tell you that a messenger came by a bit ago to get her. They want her up at the mansion for some kind of interrogation, I think?”</i>");
	output("\n\nMayren shrugs lightly and returns her attention to her sewing, humming to herself while she works.");
	output("\n\nLooks like your job is done here.");
	pc.createStatusEffect("Lieve Disabled", 0, 0, 0, 0, true, "", "", false, 60*3);
	processTime(60*2+rand(16));
	pc.lust(pc.lustMin(), true);
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

//End of Main parts of Federation Quest
//Start of extra stuff depending on resolution
public function lieveGiveCoat():void
{
	clearOutput();
	showName("LIEVE\n& CREW");
	showBust("LIEVE", "RED_COMMANDO", "RED_COMMANDO");
	clearMenu();
	author("Savin");
	
	output("You step into the bunker, and are immediately greeted by a rousing cheer that takes you by surprise. The red myr commandos are all gathered inside, leaning against the walls or sitting on ammo crates as Lieve’s two gold myr wives pour honey wine into metal mess kit cups.");
	output("\n\n<i>“There [pc.heShe] is!”</i> Lieve grins, walking over and clapping a hand on your shoulder.");
	output("\n\n<i>“Our hero!”</i> one of the commandos grins, to another round of cheers from her comrades.");
	output("\n\nYou blink at the tipsy collection of red myr: didn’t you just recently get dressed down by their Field Marshal for fucking up their entire plan?");
	output("\n\nLieve pulls you into the middle of the room, and one of her wives pushes a cup of amber wine into your hands. Several of the troopers clink their cups to yours, and more than one subtly smacks your [pc.butt] as they crowd around you.");
	output("\n\n<i>“Don’t look so surprised,”</i> Lieve says, still smiling. <i>“Look, I know things got complicated out there, but you did what you thought was right. And more importantly, you got us out of there alive. If it wasn’t for you, I don’t think we’d have walked out of Estallia’s trap.”</i>");
	output("\n\nThe red soldiers nod their agreement, though much less enthusiastically. Their pride may be dampened from the loss, but they still manage to show a little gratitude. Moreso, once Lieve downs her cup of wine and speaks again: <i>“So since Sellera doesn’t seem like she’s gonna be giving our starward mercenary a reward for our collective cockup, me and the girls all pitched in a little and got you something!”</i>");
	output("\n\nShe waves over one of her wives, who approaches with a fairly large bundle held in two of her arms. Lieve takes it and presents it to you, saying, <i>“Here. May it serve you well next time you pull the feelers of a bunch of rebels.”</i>");
	output("\n\nYou open the bundle and roll out a heavy black overcoat, the same kind you’ve seen a lot of Federation officers wearing. The crossed hammers of the red government are proudly displayed on the shoulders, and where the unit patch would otherwise be they’ve stitched in a starfield surrounding a big, brown orb -- Myrellion itself.");
	output("\n\n<i>“Snazzy, huh?”</i> Lieve says, bumping you with an elbow. <i>“Well c’mon, let’s see you in it!”</i>");
	output("\n\nYou spend the next few minutes modelling in your Federation greatcoat for the giggling commandos, knocking back the sweet, thick honey wine as you do so. It’s been tailored more-or-less right for you, you think, and it’s not too hot or heavy down here in the caverns under Myrellion. Not bad at all... and pretty damn sexy looking. By the time you’re done, several of the myr are looking a little tipsy, and you’ve lost count of the number of times your butt’s been grabbed or somebody’s felt up your " + (pc.tone >= 60 && pc.thickness >= 60 ? "muscles" : "arms") + " through your sleeves. The conversation’s died down, so you give the commandos your farewell and get underway. You’ve still got work to do of your own, after all.");
	output("\n\n");
	flags["FEDERATION_QUEST_COAT"] = 1;
	processTime(35+rand(15));
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	
	itemCollect([new MyrGreatcoat()]);
}

public function lieveGiveDocs():void
{
	clearOutput();
	lieveHeader(false, true);
	clearMenu();
	
	output("<i>“Hey, Lieve, I got something for you,”</i> you say, taking the bundle of remnant documents out of your pack. You hand them over to the red myr commando, who spends a minute looking them over with a critical eye.");
	output("\n\n<i>“Huh, looks like a Republic code book. Recent, too... I heard some of these phrases on the radio just yesterday. This is a real lucky find! I’ll take this to the Intelligence girls up at the manor and get ‘em working on deciphering what we’ve been picking up from Gildenmere. With any luck, you just gave us a big leg up over the enemy!”</i>");
	if(hasFuckedLieveSolo()) output("\n\nLieve gives you a huge grin and leans in, planting a wet kiss on your cheek and grabbing a handful of [pc.butt] while she’s leaned in close. <i>“You’re the best alien a girl could wish for.”</i>");
	else output("\n\nLieve gives you a firm clap on the shoulder and tucks the documents under her arm. <i>“You’re a real friend to the Federation, [pc.name]. Don’t let the Field Marshal tell you otherwise.”</i>");
	output("\n\nWith that, Lieve squeezes past you through the bunker door and starts jogging north towards Sellera’s manor. Looks like you’ve given the Federation a big lead over the Republics!");
	flags["FEDERATION_QUEST_CYPHER"] = 2;
	processTime(7);
	
	lieveMenu();
}

//Taking the myr to Mhenga yourself if you have a capital ship
public function fedQuestEvacuate():void
{
	clearOutput();
	clearMenu();
	moveTo("RENNEKE");
	setLocation("\nSALT FLAT", rooms["RENNEKE"].planet, rooms["RENNEKE"].system);
	showBust("GOLD_REMNANT_BRUTE", "ESTALLIA", "GOLD_REMNANT_FIGHTER");
	author("Savin");
	
	output("You take a shuttle down from your ship to the coordinates of the remnant beacon, barreling through the wispy clouds over Myrellion’s southern deserts to a long salt flat that seems utterly devoid of... well, anything. Your sensors pick up a few crashed aircraft and a handful of bombed-out entrances to the underworld hives, but that’s about it. Still, you fly down to the coordinates and set ‘er down on the rolling dunes.");
	output("\n\nYou haven’t even made it to the airlock when you hear a loud <i>thump thump</i>, a banging on the hatch from outside. That was fast. You slide open the airlock, and sure enough, there’s a gold myr standing outside with a tattered cloak wrapped around her slender shoulders. She squints at you, shielding her black eyes from the sun, and says <i>“You’re Steele, yes? Good. My queen mother and the remains of our warriors are coming soon. I hope, for all our sakes, you are true to your word.”</i>");
	output("\n\nOver the next hour, dozens of gold myr arrive at your shuttle, coming in ragged trains from out of caves and hidden dugouts across the plains. You usher them aboard, helping them find seats and passing out your shuttle’s emergency rations between waves of haggard, war-weary women. You’re keenly aware of all the weapons they bring aboard, slung on shoulders or holstered on hips as they embark, held separate from the rest of their equipment.");
	output("\n\nGuess they still don’t trust you. Hard to blame them... but it doesn’t exactly ease the quiet tension in the air. Soon your shuttle’s almost completely full of remnant soldiers and crates full of food, clothing, tools, building supplies... everything a little colony of myr could want to build themselves a new life. Everything except a queen.");
	output("\n\nYou’re about to ask what gives when you finally see the towering black shadow of the War Queen emerging from over a distant dune, walking alone across the sand. Unlike your first meeting, she’s exchanged the tank treads for a simple grey tunic with a long scarf wrapping around her head and neck; her swords are sheathed on her abdomen, leaving her four hands free to each carry a metal crate under her arms.");
	output("\n\n<i>“Offworlder,”</i> Estallia says by way of greeting, ducking her head down low to peer into the main airlock. Several of her daughters scramble back to the cargo hold to open the only queen-sized door available. <i>“I’m... surprised you came. It seems I’ve misjudged you yet again. One of the first times I’m happy to have been proven wrong.”</i>");
	output("\n\nThe War Queen gives you a slight nod and pulls herself aboard, adding the heavily laden crates to the rest of her colony’s supplies. The entire ship shudders and shakes with the queen’s every step, making her daughters sway unsteadily until they find somewhere for her to sit down. Once everyone is secure, you clamber up into the cockpit and get underway, flying the former freedom fighters to their new home...");
	
	addButton(0, "Next", fedQuestEvacuate2, undefined, "", "");
}

public function fedQuestEvacuate2():void
{
	clearOutput();
	clearMenu();
	moveTo("SHIP HANGAR");
	shipLocation = "SHIP HANGAR";
	currentLocation = "SHIP HANGAR";
	setLocation("SHIP\nINTERIOR", rooms[shipLocation].planet, rooms[shipLocation].system);
	showBust("GOLD_REMNANT_BRUTE", "ESTALLIA", "GOLD_REMNANT_FIGHTER");
	author("Savin");
	
	processTime(23*60+rand(90));
	
	output("A bit of warp travel and a lot of awkward conversations later, and you arrive on Mhen’ga.");
	output("\n\nDuring the long trip, at least a few of the remnant soldiers open up to you when they catch you alone around the ship. You’re the first person outside their enclave some of them have seen for months, and the desire to talk finally overcomes them. You’re regaled with variations on the same story: their army’s defeat, their mother’s decision to continue to fight on in spite of the cease fire, and the months of scrounging through the wreckage of their world to eke out a living while striking back at the Federation’s occupying forces.");
	output("\n\nAnd the more they talk, the more excited the myr become. Several of them share their hopes for their own little tunnel-houses, or how they want to roam the surface with the native wasp-folk, or start their own mines... the possibilities seem endless, growing with each myr you speak with.");
	output("\n\nWhen you finally land at Esbeth’s starport, Estallia is holding court in your cargo hold, surrounding herself with her daughters and beginning to organize them into groups of builders and land-clearers, farmers and guards. This is the first time you’ve seen a gold myr queen actually directing her brood, watching the dozens of smaller myr listening attentively, almost as if hypnotized by their mother’s authoritative voice booming throughout the ship’s hold. The shudder of your ship dropping out of LightDrive speeds puts an end to the planning session, and the exiled queen turns to you with a genuine smile and rises to her feet, towering over the assembled myr crawling all over the hold.");
	output("\n\n<i>“Have we arrived, captain?”</i> she asks, going to one of the view ports overlooking the planet below. <i>“This... this blue-green world will be our new home?”</i>");
	output("\n\n<i>“Welcome to Mhen’ga,”</i> you tell her, stepping down into the hold. <i>“What do you say we take you down planetside?”</i>");
	
	addButton(0, "Next", fedQuestEvacuate3, undefined, "", "");
}

public function fedQuestEvacuate3():void
{
	clearOutput();
	clearMenu();
	showBust("ESTALLIA", "GOLD_REMNANT_SI_OFFICER");
	author("Savin");
	
	output("You spend the next few hours shuttling the myr remnant down, along with their supplies and foodstuffs, dropping them off at Esbeth. Flahne is more than happy to help speed their arrival through the reams of paperwork for the low, low price of some sweet honey right from the tap of the queen’s hyper-buxom intelligence officer. The deal is suckled, and an hour or so later there’s a great big gaggle of gold myr following along in their mother’s shadow as the former War Queen strides down Esbeth’s main road, to the shocked awe of the locals half her size.");
	output("\n\n<i>“Thank you for this, captain,”</i> Estallia says, reaching an arm down to your shoulder. <i>“Truly. My daughters and I will spend a few days building a base, and from there-”</i>");
	output("\n\n<i>“Mother!”</i> the intelligence officer huffs, crossing her arms under her breasts.");
	output("\n\nEstallia grimaces, biting her lip. <i>“We will... build a home for ourselves. Perhaps we will see you in a few days, once we are settled.”</i>");
	output("\n\nHopefully you will. Seeing Estallia and her daughters living normal lives here would be a hell of a reward for what you risked to bring them here.");
	processTime(6*60+rand(15));
	flags["FEDERATION_QUEST_EVAC_TIMER"] = GetGameTimestamp();
	flags["FEDERATION_QUEST"] = 10;
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

//New myr colony on Mhenga
public function myrOnMhenga(update:Boolean = false):Boolean
{
	if(update) flags["MYR_ON_MHENGA"] = 1;
	return flags["MYR_ON_MHENGA"] == 1;
}

public function myrMhengaChamber():Boolean
{
	output("The former War Queen has set up her court here: a titanic metal throne covered in cushions and blankets all colored the richest gold dominates the far wall. Queen Estallia is sitting upon it with her plush golden abdomen pushed through a gap in the back, where it’s currently being serviced by a dozen male zil. The ones that aren’t currently pumping away at her rear-mounted pussy are standing at attendance, cleaning the mess they leave around Estallia’s backside or using their hands and mouths to add to the queen’s stimulation.");
	output("\n\nEstallia’s leaning back in her throne, smiling to herself and stroking the hair of three of the zil boys. Everyone seems to be quite happy, enthralled in each other’s bodies. Like this, Estallia almost looks like any other myr queen... if it wasn’t for the eye patch, and the pair of obscenely large swords mounted in easy reach on either side of her throne. ");
	
	addButton(0, "Estallia", myrMhengaEstallia, undefined, "Estallia", "Speak to the former War Queen.");
	
	return false;
}

public function myrMhengaEstallia():void
{
	clearOutput();
	showName("\nESTALLIA");
	showBust("ESTALLIA");
	author("Savin");
	
	output("You stride up onto the carpet spread out before the throne, giving the regal ant before you ");
	if(pc.isBro() || pc.isAss()) output("an upnod.");
	else if(pc.isNice()) output("a respectful bow.");
	else output("an exaggerated bow.");
	output("\n\n<i>“Captain Steele,”</i> the queen says, leaning forward and steepling the fingers of two hands. The zil boys around her don’t pay you any mind, content to keep servicing their massive mistress. <i>“" + (flags["MET_ESTALLIA_MHENGA"] == undefined ? "Welcome to our new home. The residents of Esbeth were kind enough to provide us with this structure, and my daughters are dutifully building more homes for themselves in the clearings west of here. And best of all? There’s no damn red in sight. Only aliens, and most of them friendly. Thank you again, captain." : "Welcome back. Speak your desires.") + "”</i>");
	flags["MET_ESTALLIA_MHENGA"] = 1;
	processTime(3);
	
	//If she gets more options in the future just make/call a main menu func
	estalliaTalkMenu();
}

public function estalliaTalkMenu():void
{
	clearMenu();
	if(flags["KQ2_MYRELLION_STATE"] == 1) addDisabledButton(0, "OtherQueens", "Other Queens", "You know the fate of all the other queens, you monster.");
	else addButton(0, "OtherQueens", estalliaTalkQueens, undefined, "Other Queens", "Ask Estallia about the other Republican queens she left behind. How have they taken to her leaving?");
	addButton(1, "ColonyStatus", estalliaTalkColony, undefined, "Colony Status", "Ask the queen how her new colony is coming along.");
	addButton(2, "OtherRaces", estalliaTalkRaces, undefined, "Other Races", "Estallia’s the first gold queen to colonize the stars. How’s she getting on with the other spacefaring races?");
	addButton(14, "Leave", mainGameMenu, undefined, "", "");
}

public function estalliaTalkQueens():void
{
	clearOutput();
	showName("\nESTALLIA");
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“Those sniveling slits?”</i> Estallia snorts when you ask. <i>“Let them cower. I gave everything to the Republics, including my own flesh and blood... and they declare me an outlaw because I fight for their freedom? They have no backbone. No honor. Now that I am here on Mhen’ga and able to speak to them openly once again through your ‘quantuum telephones,’ I begin to see why the reds hate us so much. All they care about is safety and peace, while their cities are occupied and their daughters are forced to become trench wives!”</i>");
	output("\n\nThe War Queen fumes, slamming one of her fists against the arm of her throne. The zil drones surrounding her squeak and recoil. After a long moment, Estallia growls and sits back, tapping her armored fingers on the metal throne. <i>“I apologize. I was never renowned for my patience or diplomacy, even before the war... my fellow queens have done little to improve my disposition.”</i>");
	output("\n\nEstallia shakes her head sadly. <i>“Gold myr are by our nature gentle and good-hearted, but this generation of queens has forgotten what it means to rule. Too greedy, self-absorbed, and lacking the plates to protect their daughters. And now they’ve all but surrendered our planet to the reds while they spread their twats for you aliens, hoping the star-walkers will save them from their own damn mess!”</i>");
	output("\n\n<i>“It matters little, now that I am an exile from my world,”</i> she adds. <i>“I can never return, so long as the reds continue to claim my homeland. But this new world... this may be better than a homecoming.”</i>");
	processTime(7);
	
	estalliaTalkMenu();
	addDisabledButton(0, "OtherQueens");
}

public function estalliaTalkColony():void
{
	clearOutput();
	showName("\nESTALLIA");
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“So, how’s the colony doing?”</i> you ask.");
	output("\n\n<i>“Better than even I had hoped,”</i> Estallia answers, pride swelling in her voice. <i>“My daughters are nothing if not industrious and hard-working women, and they’ve taken to the challenges of settling this new world with the same gusto that all the other colonists have. We really are making a home for ourselves here. My children have begun planting seeds and harvesting wood and local produce; they’ve made contact with local tribes and arrangements with other groups of colonists for supplies we can’t produce or procure ourselves.”</i>");
	output("\n\nYou nod. <i>“That’s good. I see you’ve hit it off with the natives.”</i>");
	output("\n\nEstallia chuckles, and behind her, the zil boy currently thrusting into her abdominal quim grunts and bucks forward, spilling his seed into the queen.");
	output("\n\n<i>“Yes, indeed, and I can feel their eggs growing inside me. Ah, it’s been years since I was last bred... just after the war broke out, before we realized how serious the Federation threat was. You chose a good world for me and my brood, one with a race compatible with our own. I can’t wait to see my hybrid children, winged and lush with honey... they’ll be glorious!”</i>");
	output("\n\nThey’ll be something, alright. Too bad you’ll have to wait years to see any fully grown.");
	processTime(7);
	
	estalliaTalkMenu();
	addDisabledButton(1, "ColonyStatus");
}

public function estalliaTalkRaces():void
{
	clearOutput();
	showName("\nESTALLIA");
	showBust("ESTALLIA");
	author("Savin");
	
	output("<i>“What’s your take on the other races that have come to colonize Mhen’ga?”</i>");
	output("\n\n<i>“You mean aside from humans?”</i> Estallia laughs back. <i>“They seem to be overwhelming amongst these colonists. They’re a fine bunch, eager enough and certainly brave, but I sense that they’ll play a dominant role in this planet’s future. The zil certainly don’t appreciate that fact, from what I’ve seen, but then they’ve got every reason not to. I understand better than most the desire to defend your home from invaders.”</i>");
	output("\n\nShe repeats that to the zil, probably in their native language, earning smiles and enthusiastic nods from the drones. <i>“Perhaps the presence of a more advanced, and more eloquent, race allied to the zil will help the human colonists realize that these stalwart amber souls aren’t savages to be subjugated, as nyrea are, but merely need guidance, as my new drones did.”</i>");
	if(pc.isMischievous() || pc.isBro() || pc.isBimbo()) output("\n\nWell, they needed pussy, anyway.");
	else output("\n\nThat’s one way to look at it.");
	output("\n\n<i>“And the other races?”</i> you ask.");
	output("\n\n<i>“I’ve had little time to meet any others, though the pointy-eared furry ones seem quite friendly. One called herself an ausar, and the other, with even more fur, a human? Strange, indeed. The gel-like creature that mans the spaceport dest, Flahne, is quite interesting: she says her race is made up of only a single cell each, yet she’s as large and cunning as anyone... and addicted to sweets, so she’s made herself quite a few friends amongst my honeypot daughters. I can easily see an alliance forming between her race and mine, if they all share her predilections.”</i>");
	output("\n\n<i>“And there’s the... laquines, they’re called? The race that golden-furred hermaphrodite working at the Xenogen office belongs to. Her company doesn’t seem interested in my enclave, so I myself have had little reason to speak to her, though my daughters claim she’s pleasant enough. And one of the only members of her race here, so of little consequence. Ah, so many of your star-walker races have fur, but where is the chitin, hmm? I’d hate to envision a galaxy so devoid of other insectile life!”</i>");
	processTime(7);
	
	estalliaTalkMenu();
	addDisabledButton(2, "OtherRaces");
}
