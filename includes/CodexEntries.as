// This is the simplest method I can think of hooking up the codex functions into the tree structure for display
// It's janky as fuck, but it does work, at it means the actual codex "body" content can be done almost exactly
// like regular scenes are now.

public function configureCodex():void
{
	// Complex path tree entries DO work, but until we actually NEED to organise the data
	// (and I implement some kind of path folding), I don't think we should actually USE them more than say 1 deep (because the way addEntry works
	// requires at least a "root" path of some sort
	// At the very least, the "tree" view down the side of the UI supports scrolling, so its not a HUGE issue and it
	// can wait until we're at a point it needs to be fixed.
	
	// Other types of entries -- these are categorised under separate headings
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Arty", testPersonEntryA);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_EVENT, "Test Events", "Buttsunder", testEventEntryA);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_LOCATION, "Some/Complex/Path/To", "Tentacool", testLocationEntryA);
	
	// This is how I'm proposing we split things up for now -- stuff things into a root category of the relevent system they belong too -- "Organic" etc might be a better long-term solution, but there'll be a lot
	// of categories that likely won't be very full for a LONG time going down that route
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Ara Ara", "Zil", zilCodexEntry);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Ara Ara", "Ausar", ausarCodexEntry, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Ara Ara", "Mimbrane", mimbraneCodexEntry, true);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Unknown", "Myrmedion", myrmedionCodexEntry, true);
}

public function zilCodexEntry():void
{
	clearOutputCodex();
	userInterface.showBust("ZILFEMALE", "ZIL"); // ohoho lookit dis shit!

	outputCodex(header("The Zil"));
	outputCodex("\n<b>Genders:</b> Male and female.");
	outputCodex("\n<b>Height:</b> 5’ to 5’6” commonly. They can rarely attain heights of 6’.");
	outputCodex("\n<b>Weight:</b> 80 to 140 pounds.");
	outputCodex("\n<b>Hair:</b> Flexible spines covered in a downy-soft fuzz. They are commonly colored black, but sometimes can be yellow or yellow and black striped.");
	outputCodex("\n<b>Tongue:</b> Bright yellow, typically extends a foot past their lips when fully extended. The tip has a tube inside it capable of gathering sweet nectar from jungle flowers or lovers.");
	outputCodex("\n<b>Eyes:</b> Black sclera and iris result in eyes that appear solid black. Rarely they will have vibrant golden irises.");
	outputCodex("\n<b>Wings:</b> Male Zil have flight-capable wings, but the rest of the population does not.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Appearance"));
	outputCodex("Zil are almost entirely covered in chitinous armor plates. While it resembles an insectile exoskeleton, it is more biological armor than anything else, protecting against weapons and other dangerous inhabitants of \\\[REDACTED\\\]. Very few places on their bodies are unarmored: their mouths and bottom of their noses, their anuses, and fingertips, which affords them a decent grip. Their genitals and chests can have their covering plates retracted up and to the sides respectively, typically in order to breed or perform courtship.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Sexual Dimorphism"));
	outputCodex("Male Zil are born without the distinctly wasp-like abdomen and stinger that the females possess. Combined with their wings, this affords ‘men’ increased speed at the expense of an extra attack. Males have penises and females have vaginas. Females also have breasts that are capable of lactating a nutritious, honey-like substance that they can feed to their young. Both sexes’ sexual fluids are reported to be sweet, though all reports have been placed anonymously.");

	outputCodex("\n\n");
	
	outputCodex(blockHeader("Typical Environments"));
	outputCodex("The Zil are located primarily in the thick jungles of \\\[REDACTED\\\], though they have been observed in sparser sections of forest as well. They do not venture to the polar regions, and the winters of the seasonal areas typically cause them to migrate away. Low temperatures may therefore be effective at driving them off. They have not been seen off-world except when brought as slaves or ‘uplifted’, and are not presumed to have a method of unassisted interstellar travel.");
	
	outputCodex("\n\n");

	outputCodex(blockHeader("Reproduction"));
	outputCodex("Unsurprisingly, the Zil are much like humans when it comes to breeding. A male will insert his penis into the female, ejaculate his seed, and fertilize eggs in her uterus. Gestation takes between six and seven months, with the resulting progeny born as fraternal twins or triplets. When a Zil takes an interest in another, he will force himself into close proximity with the other and activate his pheromone glands. Both sexes have such glands all over their bodies, though the highest concentrations are centered on their genitals. It is reported that, with males, the densest and most effective scent is released from their foreskin. For females, both the breasts and the labia have incapacitating levels of this chemical reactant. Breeding with humans is possible and has happened. The resulting children are chimeral in appearance rather than the hybrids that were expected. More data is required.");
	
	outputCodex("\n\n");
	
	outputCodex(blockHeader("Society"));
	outputCodex("Zil society is simple and tribal. They live in small groups numbering twenty or thirty at most, hunting and gathering. A few tribes seem to have discovered simple farming, with crops of large, indigenous flowers. Most are content to harvest the plentiful plant life and prey creatures. Signs of open warfare have not been discovered, but the Zil keep no written history. The few instances of observed inter-tribal meetings have resulting in breeding nearly every time. Current theories explain this as a method of maintaining genetic diversity.");

	CodexManager.viewedEntry("Zil");
}

public function ausarCodexEntry():void
{
	clearOutputCodex();
	userInterface.showBust("SYRI"); // An example of an Ausar?

	outputCodex(header("The Ausar"));
	outputCodex("\n<b>Genders:</b> Male and female.");
	outputCodex("\n<b>Height:</b> Varies, usually similar to humans; they commonly range from five feet to just over six, with rare specimens reaching around seven feet in height.");
	outputCodex("\n<b>Weight:</b> Ausar are lithely built, weighing less than a human -- often from just over 100 lbs, and rarely over 200.");
	outputCodex("\n<b>Hair:</b> Color varies, with grey, black, and a dark gold being the most common. Some rare specimens have snow-white hair, or a fiery red mane.");
	outputCodex("\n<b>Eyes:</b> Ausar eyes are primarily white, with darkly colored irises formed as a vertical slit across the middle of the eye. Coloration ranges from dark blue or green to black.");
	outputCodex("\n<b>Ears:</b> The race's most distinguishing feature are a pair of tall, perky wolf-like ears that extend from eight to twelve inches above the head, and are often quite bushy. They are extremely sensitive, able to hear well outside the human range, which makes them both keen hunters and acutely vulnerable to sonic attacks.");
	outputCodex("\n<b>Tails:</b> Ausar have long, bushy tails of an exceptionally pleasant, soft fur. These tails usually display their emotional state, wagging when happy or tucking when sad -- though their owners have some measure of control over the tail's movements, and often will brush it against those they hold in great affection.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Combat"));
	outputCodex("Ausar naturally have a soft, velvety fur covering their arms and legs, though this serves as poor protection against anything short of the environment. As such, the race has strongly invested in personal shield technology, producing some of the most advanced in the galaxy. Due to their high physical agility, most Ausar shun heavier armors such as that worn by human Marines, instead relying on linked shields across fighting formations to guard against attacks. The staff was, in ancient times, the primary weapon of their race, and the staff is the basis for their current weapons technology, with both shock-pikes and crook-shaped railguns being the favored armaments of the day.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Gender Differences"));
	outputCodex("Ausar genders are largely divided as in humans, with males having broader chests and shoulders while females have wider hips and milk-producing breasts. Male Ausar are known to possess knotted phalluses, which can sometimes cause copulation to take hours once it’s lodged in a lover. To compensate, females of the race have exceptionally well lubricated, often quite elastic vaginas, which double to help in the birthing of litters.");

	outputCodex("\n\n");
	
	outputCodex(blockHeader("Typical Environments"));
	outputCodex("The Ausar homeworld is a vast, arid desert spotted with great shimmering oasis and vast temple-cities dedicated to the god-kings of old. Most of the world is uninhabited, occupied by deadly scorpion-like creatures the size of a horse as well as huge worms which have been the race’s primary source of food for aeons. After taking to the stars roughly 1000 years before contact with humans, the Ausar have come to adapt to many different environs, though most worlds they terraform retain the hot, dry desert conditions of the homeworld.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Reproduction"));
	outputCodex("As mentioned above, Ausar copulation is often an hours-long affair thanks to the male knot, and rapid recovery periods on both sides. Though not overly libidinous, the race is known for being more sexually forward than humans, as marriage and long-term sexual relationships are rarer among the race, though by no means unheard of. Once impregnated, an Ausar female will carry a “litter” of up to six  children for a period of six months before giving birth. Ausar are born blind for the first few weeks and need a mother's milk, but naturally grow and mature somewhat faster than humans, reaching adulthood at fifteen years.");

	outputCodex("\n\nDue to the long standing friendship between Ausar and Mankind, the two are perhaps the most common of xeno-romantic entanglements. Halfbreeds produced by Ausar-Human relationships are somewhat taller and heavier than an Ausar, often losing arm and leg fur, though they retain the tails of their alien parent, and smaller, floppier and less sensitive wolf ears. Half-ausar are born usually in pairs, can see at birth, and come of age as humans do. As one of the most common hybrid races in the galaxy, half-ausar has recently become a primary option in the U.G.C. census, rather than being filled in under “Other/Hybrid race.”");

	outputCodex("\n\n");

	outputCodex(blockHeader("Society"));
	outputCodex("Unlike most modern civilizations, the Ausar have not unified into a central government. Rather, their planets are ruled by independent kings and queens, who convene to decide matters related to the race; it was, indeed, humanity's gift of quantum communication that allowed the fragmented Ausar society, spread across the stars, to tighten and present a strong, united front to the galaxy. However, the local kings are still relatively free to act as they choose, though the King of Ausaril, the homeworld, is considered the “King of Kings,” and is generally deferred to by lesser despots, and holds the only post able to call the entire Ausar to war or countermand planetary kings (in large part thanks to a crushingly huge fleet and more advanced technology produced on the homeworld). In times of trouble or war, the Joint Ausar Fleet can be called on, with each world in the federation contracted to supply a certain number of ships and soldiers to the joint defense each decade.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Relationships"));
	outputCodex("The Ausar are known to be an exceptionally friendly and peaceful race. They are slow to anger, though they are quite territorial, and have rarely warred with other races. In interactions with humans, the Ausar are known to be outgoing and affectionate, readily making friendships that last a lifetime. Indeed, some have commented that most Ausar get along better with humans than their own kind, and thanks to their wolf-like appearance, are occasionally called “Man’s best friend among the stars.” As humanity’s first contact with alien life, and longest and staunchest ally, the saying has thus far rung true.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Technology"));
	outputCodex("The Ausar invented the Warp Gates, and therefore firmly placed themselves at the forefront of galactic technology. While they have yet to field an invention to overshadow the gates, the Ausar are still renowned as brilliant scientists, especially in regards to interstellar travel and ships. Ausar shields are second to none, and their ships are exceptionally quick, equipped with advanced LightDrive engines (a refinement on the human invention). Their technology, being exceptionally complex and prone to gaps in electronic defenses, is well - known to be vulnerable to security breach. More than once, a powerful Ausar fleet or financial institute has been decimated by a skilled hacker.");

	CodexManager.viewedEntry("Ausar");
}

public function myrmedionCodexEntry():void
{
	clearOutputCodex();
	userInterface.showBust("NONE"); // aha this is going to bite me in the ass when we end up adding a race called NONE or some shit!

	outputCodex(header("The Myrmedion"));
	outputCodex("\n<b>Genders:</b> Male and female.");
	outputCodex("\n<b>Height:</b> Myr are about human height, if possibly a tad shorter on average: a male is typically about 5 ft. 2; a female 5 ft. 6, being on average somewhat taller than the males.");
	outputCodex("\n<b>Weight:</b> For their heights, myr are heavier than humans thanks to their heavy chitinous armor plates and sturdier bone and muscle structures."); 
	outputCodex("<b>Hair:</b> Blacks and oranges are the most common colors. Red Myr, as the name suggests, have a higher tendency toward fiery red hair while the Gold Myr have a sizable population of strawberry-blondes.");
	outputCodex("\n<b>Eyes:</b> Myr eyes are solid black (or more rarely grey) compound eyes. They are noted to have relatively poor eyesight, and blindness and various eye problems are unusually common. ");
	outputCodex("\n<b>Ears:</b> Myr have pointed ears, called ‘elfin’ by first contact explorers.");
	outputCodex("\n<b>Antennae:</b> Much like the Zil race encountered earlier in the same Rush, the Myr are descendant from insects rather than mammals, and as such have highly sensitive antennae perched atop their head, used to sense airborne chemicals, vibrations, and air currents. The antennae are exceedingly sensitive to touch, and a non-verbal language seems to have arisen based on strokes and gentle tugs on these ‘feelers.’ It is hypothesized that these are acute erogenous zones, though evidence has not been collected to confirm these suspicions.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Combat"));
	outputCodex("Myrmedions are notably covered in a partial ‘suit’ of chitin plates which protect the legs, arms, and parts of the torso and abdomen. This natural armor, combined with an average strength considerably higher than a human’s, has meant that melee combat still reigns supreme among the myr, with swords and hammers being about as common in their militaries as rifles. Due to the “world war” being fought when First Contact was made, researchers have had ample opportunity to study myr combat doctrine, which in large part resembles Napoleonic or early World War I-era tactics, including infantry lines and massed bayonet charges into melee under the cover of artillery and primitive tanks and aircraft. Myr military technology is perhaps on par with early 20th Century earth, with bolt-action or revolving cylinder powder weapons still being predominant.");

	outputCodex("\n\nSupplementing their hand to hand abilities, Red Myr females have a venomous bite which, on contact, causes a mild paralysis in the victim. The venom is known to cause a ‘red heat’ sensation, inspiring rampant lust in the victim and usually putting him utterly at the mercy of the myr victor. Among Gold Myr, the venom of a Red is considered a strong but illicit aphrodisiac, taken in small quantities to induce a lethargic, horny state.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Gender Differences &amp; Reproduction"));
	outputCodex("Male and female myr have noticeable gender dimorphism, again tracing back to an insectile heritage. The vast majority of myr are wingless, females, divided into casts of worker and warrior based on familial lineage. Females have larger hips than males and a single pair of full breasts, which lactate a clear amber ‘honey’ based on the female’s nutritional state rather than her reproductive statues: a well-fed female will lactate most of her excess calories out, while poorly fed ones will not lactate at all. Among the Gold Myr, most females are infertile, relying on their queens to reproduce; Red Myr, on the other hand, have a reproductive female population of about 50%, and have no queens. Red Myr females lay single eggs when fertilized, which gestate for an average of six months before hatching.");

	outputCodex("\n\nA very few female Gold Myr are ‘queens,’ winged females able to reproduce without medical intervention. Usually serviced by several male drones, queens have exceptionally quick reproductive cycles, giving birth to large clutches of eggs fertilized by several different fathers. Queens can live for centuries, and birth hundreds if not thousands of young Gold Myr over her life span. As the name suggests, queens are highly revered by other Golds, some even revered as goddesses.");

	outputCodex("\n\nGold Myr have a second alternate female biology, called the ‘honeypot’ myr: these females possess exceedingly active breasts, so swollen with their nectar they practically glow amber. Acting as living larders for the hives, these females' breasts swell to enormous sizes, often debilitating them due to sheer weight: so immobile, their act almost like diners in the hive cities, setting up on street corners and in specialized restaurants to provide their nectar to the populace “straight from the tap.” Honeypots are relatively rare, perhaps one for every hundred females, but their incredible metabolism allows these few honeypots to quite efficiently feed much of the cities themselves. (Though researchers have not been able to confirm, there are apocryphal reports of some males inheriting the ‘honeypot’ gene. These reports conflict between the males either growing swollen nectar teats like females, or their testes swelling to even greater sizes as their gonads begin to produce nectar rather than sperm.)");

	outputCodex("\n\nMales are shorter lived and winged, possessing considerably less strength than the average female due to his lighter frame. Affectionately called ‘drones’ by their female counterparts, most males exist in myr society to do very little other than breed: they are dearly prized by their females, and were often fought over during ancient times before intricate breeding schedules were established some hundred years before First Contact. Male myr are characterized by their slight, light bodies and massive genetalia, with disproportionately large phalluses and semen-swollen testes that often drag on the ground when not regularly used.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Typical Environments"));
	outputCodex("Myrrellion is the sole planet inhabited by the myr race, and it is fairly Earth-like in most respects. The planet has vast desert regions across much of its land masses, with some forested regions in the far northern and southern reaches. There are few if any snowy or arctic areas on the planet. Hot and dry, Myrellion is generally inhospitable above ground. The myr, however, are largely subterranean, and have over the years drilled out vast complexes of underground cities that rival the splendour of even the mega-cities of Terra. Due to the world war currently under way, many once-prosperous cities on both inhabited continents have been bombed out and abandoned, straining the population of the remaining cities as they accommodate refugees.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Society"));
	outputCodex("Myr society is divided into two different cultures, divided along racial and geographical lines: the Gold Myr and the Red Myr. Reds are characteristically more militant and violent than the Golds, with a large standing army and military tradition. Golds, in contrast, are typically quite placid and artistically-minded, and control significantly less territory and boast a smaller population. Both are rigidly matriarchal and caste-based societies, divided up into worker, warrior, and drone groups (as expected, warriors are elevated in Red Myr society while workers receive the greatest praise among the Gold Myr). Castes are traced through familial lineage, usually through the father due to the difficulty of myr reproduction.");

	outputCodex("\n\nMyr have considerable trouble reproducing due to widespread infertility, tracing back to their insectile roots and the presence of ‘queens’ among their ancient ancestors, and still among Gold Myr. The vast majority of myr are female, with less than 10% of the population being male. Among the remaining populace, there are either only a handful of Gold Myr queens to go around, or in the case of the Red Myr, slightly less than half the female population is fertile at all, even without a reliance on queens for reproduction. As such, ‘breeders’ are rare and highly valued by both societies, usually becoming powerful leaders and politicians whose sway comes as much from their reproductive abilities as any savvy or natural ability in the field of statecraft.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Relationships"));
	outputCodex("Due to the overwhelmingly female-heavy population, males are in high demand between fertile females and queens: infertile females of both races are unlikely to ever see a male in person, much less be able to copulate with him. As such, lesbian relationships are extremely common and widely accepted, with even breeder females usually taking a woman lover, since males are in such high demand they can never make proper commitments. Indeed, a marriage between male and female is quite literally unheard of in myr society, and most males are shared between several dozen females over the course of their lives. Female-female marriages, on the other hand, are quite normal, though monogamy is a relatively new concept for the myr, many of whom still fondly remember a more tribal past with great orgies centered around their precious breeders.");

	outputCodex("\n\nSexuality among female myr is quite open, and most take several casual lovers - especially Red Myr warriors, who almost always keep “trench brides,” or worker females they have either captured or brought from home who serve their needs between battles. Gold Myr still practice regular public orgies as part of fertility rites led by their queens and breeder males, though they also have a higher rate of monogamous marriage than Reds do. While sex is considered highly private and personal among Red myr, and their dress and sexual mores are fairly conservative by galactic standards, Golds are quite open with their sex, even flaunting it in public: Gold myr dress is highly revealing, and there are no laws or inhibitions about public intercourse.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Technology"));
	outputCodex("Myr technology is nearly analogous with early 20th century earth technology, with basic coal-powered electricity and gas-operated monorails having been recently installed in some of the larger hive cities. Highly primitive computers have just entered service before First Contact, using punch-tape processors and tubes. Despite their largely underground existence, the myr do have aircraft, though most have been re-purposed into transports and military craft due to the war (indeed, the current Joint Ausar Fleet base in Gildenmere, the Gold Myr capital, is a repurposed airfield). Just before First Contact, the war between Red and Gold Myr took an unexpectedly lethal turn due to the Gold Myr introducing poison gasses into the conflict, an incredibly effective deterrent against the unchecked Red Myr advance into their territory, followed by the Red Myr threatening the unleash a primitive atomic weapon the day before First Contact. Due to the appearance of the Ausar expedition to Myrellion, thermonuclear war has been temporarily averted, which has since given the Gold Myr the opportunity to fashion their own WMDs in response. The presence of the alien expedition is assumed to be the only preventative factor keeping the world war from escalating to a nuclear inferno. Due to the surprisingly advanced nature of the race, and their ‘honeypot’ biology (which is seen as highly promising by Xenogen), U.G.C. diplomats have arrived on the planet and are working with both hierarchies to achieve a cease fire in the seven years' war.");

	CodexManager.viewedEntry("Myrmedion");
}

public function mimbraneCodexEntry():void
{
	clearOutputCodex();
	userInterface.showBust("MIMBRANE");

	outputCodex(header("Mimbranes"));
	outputCodex(blockHeader("\n- (Graft, Epidel, Second Skin)");

	outputCodex("<b>Sex:</b> Asexual");
	outputCodex("\n<b>Height:</b> 0.0004 to 0.25 inches. Typically ranges between the slightest fraction of an inch when resembling a thin film to a quarter of an inch when dense and/or well fed.");
	outputCodex("\n<b>Length:</b> 6 to 36 square inches. The parasite’s ability to distribute its mass to control its surface area can usually put it anywhere between six and thirty six square inches.");
	outputCodex("\n<b>Weight:</b> 100 to 340 grams (0.2 - 0.75 pounds)");
	outputCodex("\n<b>Hair:</b> None of its own, but able to replicate host features.");
	outputCodex("\n<b>Tongue:</b> None"); // I think it would be an idea to build an ordered list of "appearance descriptors" for codex entries, and just omit ones that will be blank/none etc, but to have everything in the same order otherwise.
	outputCodex("\n<b>Eyes:</b> Two tiny eyes protected by a thick portion of dermis that can act as eyelids. Round with bright sclera, thin redish iris, with average sized pupils. The eyeballs can vary in size, sometimes changing in size as the Mimbrane integrates into a host.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Senses"));
	outputCodex("Mimbrane feature small fleshy mouths below and between their eyes that protrude slightly from their form, typically thicker than the rest of the creature. Their mouth is used to breath, ingest liquids and communicate as most creatures, but if the parasite is able to latch onto a host organ with an orifice, it will ditch its normal mouth in favor of utilizing the newfound hole as its own. Without a properly sized orifice to borrow, Mimbrane will maintain their normal mouths, anxious to pass them off as small lumps with no seam. Information on how the creature feeds and breathes can be found below.");

	outputCodex("\n\nA Mimbrane’s most important organ is its skin. Its normal appearance is a light red or pink, lighter in color the thinner the creature stretches itself and more vibrant the more dense it is. Mimbrane are smooth and free of any discolorations or imperfections. They can appear as thin square sheets, slightly moist and glistening as they glide through the air or crawl along the ground. At their largest sizes, Mimbrane are incredibly lithe and become somewhat translucent.");

	outputCodex("\n\nThe parasite is able to prorate its sparse mass in order to control its surface area, allowing it not only encase its prey, but also fly and glide with relative ease. The creature’s more well-known trait is its ability to transform and alter its epidermis, mimicking its host’s every detail. More information on this feature can be found below.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Armor"));
	outputCodex("Due to its lean nature, Mimbrane rely more on their ability to dodge and conform to any shapes in order to help defend itself. Sharp blades and projectiles that actually do make contact easily injure the creature. Blunt weapons are normally ineffective. A Mimbrane’s primary offense and defense lie within its lust-inducing oil and spit, explained further below."); // "Explained in section [<random numbershit to look like a reference>]"?

	outputCodex("\n\n");

	outputCodex(blockHeader("Typical Environments"));
	outputCodex("Though the creatures can exist in most any habitat, Mimbrane tend to prefer natural and wooded areas, locales comprised of abundant sources of warmth and nutrients.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Means of Attack"));
	outputCodex("Mimbrane tend to be docile creatures, hiding from potential prey whenever possible. The cause of this is the extreme toll battle can take on the parasite. A single creature can take months to accumulate enough nutrients just to work up the reserves necessary to employ their lust attacks in addition to the above average energy expenditure. In other words, a Mimbrane that has decided to attack is putting its all into the effort.");

	outputCodex("\n\nA Mimbrane’s primary means of offense are targeted to their opponent’s carnal instincts. Its first attack is more passive, as the parasite’s skin secretes a clear oil, tinged lightly with a bright pink color. Contact with the parasite’s oily skin can wreck havoc on its opponent’s sexual craving. A byproduct of a Mimbrane’s sweat is the pungent cloud of ecstasy it produces; the parasite will periodically stress its pores and fan this gas towards their opponent. The creature’s more direct attack has it gather and concentrate its oil, spitting a particularly volatile batch of libidinal craving that bursts on contact.");

	outputCodex("\n\nWhile Mimbrane rely primarily on their ability to drive their opponents to sexual madness, they also utilize their light form to try and temporarily smother their hosts. This attack doubles the effectiveness of their oily skin as well. The few physical attacks of the parasite involve it creating tiny barbs along its surface and brushing against their opponent and fairly weak attempts at tripping up an opponent.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Parasitism"));
	outputCodex("A Mimbrane’s primary goal in life is to attach to a host, feed, and slowly reproduce. Once it has properly subdued a target, the parasite will work its way towards its intended body part. An interesting facet of these creatures is their inherent organ preferences, shared among the entire species. These baked-in predilections place importance on ease of acquiring liquid sustenance followed shortly thereafter by warmth and relative seclusion on the host.");

	outputCodex("\n\nMimbranes prioritize sexual organs, preferring penises over vaginas. Should the genitalia be either non-existent or claimed by other Mimbranes, the parasite will opt for the posterior, enshrouding the entire rear end and anus to account for its less-than-optimal choice. The next option for a Mimbrane would actually be the scrotum followed by the breasts, the lower and warmer sac an easier location for remaining secluded over the typically much more exposed breasts. And when all known sexual organs are unavailable, the parasite will opt for extremities, typically the hands and finally feet.");

	outputCodex("\n\nThe face is actually avoided when choosing a roost as it is typically a very sensitive and hard area to maintain for the parasite. Attempts to hide anywhere on or around the head more often increase the creature’s presence to the host. As a result, Mimbrane will rather reject a host than place themselves somewhere they believe would lead to their quick removal.");
	
	outputCodex("\n\nOnce a Mimbrane has chosen an organ, it quickly goes to work encapsulating the entirety of their selection, forming a perfect seal. From this point, mimicry becomes the primary goal of the parasite. The Mimbrane’s epidermis will integrate itself with its host’s nervous system, forwarding sensations on to nerve endings and feeling as if nothing were on the organ at all. Dead skin cells and sweat are passed through the creature if they are not able to be consumed.");

	outputCodex("\n\nThe parasite also works to visually represent its chosen target, detailing every bit of texture, coloration, hair and imperfection that they’ve covered. In only a few scant minutes, a Mimbrane’s pink, featureless, slick skin will perfectly resemble its target down to the last hair, freckle, or scar. Once the transformation is complete, a motionless Mimbrane becomes almost unperceivable to its host, save for a few telltale signs.");

	outputCodex("\n\nThe most visible indications of the parasite while they are attempting to mimic their chosen organ often appear as lumps of skin or enlarged body parts. The first sign is the bunching of the parasite’s skin along the base of their connection to the host. This acts as the creature’s defense from unassisted removal, painlessly digging into the host’s skin and alerting the parasite to any attempts to pry it free. The other visible trait are typically two tiny bumps close to the host’s orifice, where the Mimbrane hides its eyes.");

	outputCodex("\n\nThe final telltale mark is only when the parasite has bonded with an organ that does not feature some sort of cavity. A third bump will appear, hiding the creature’s small mouth. The lumps protecting a Mimbrane’s mouth and eyes have no visible seams, and the parasites will typically try to push these few remaining marks of evidence down against their host in an effort to better hide them. More information on the parasite’s tendencies when coupled with a host can be found below.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Feeding"));
	outputCodex("A Mimbrane can survive on sources of moisture such as plants, fruits or water, but it cannot reproduce until it has found and attached itself to a host. If it has clung to an organ that features some sort of orifice, it will dissolve its mouth in favor of substituting it with its newfound outlet. If there is no orifice, the Mimbrane will maintain its small mouth, trying its best to disguise it as an innocuous bump on its host.");

	outputCodex("\n\nThe mouth is where a Mimbrane continues to feed and breathe. The parasite is unable to continue breathing through its epidermis when coupled as its skin is currently occupied mimicking the host. As a result, the creature will wait for moments of inactivity to move its mouth open and close, stirring fresh air around and allowing it to easily absorb and process oxygen. The sensation – whether with a claimed hole or the creature’s mouth – can very easily be felt by the host and is the most glaring reminder of the parasite’s presence.");

	outputCodex("\n\nMimbranes ingest host secretions that pass through their borrowed mouths by absorbing them into the skin surround the opening in a manner similar to breathing. This action does not require the same amount of movement, however and usually goes undetected by hosts. The exception goes for parasites lacking a borrowed spout, who use their natural mouths in a manner similar to all other living creatures in order to collect what they crave. When located on extremities such as hands, Mimbrane will attempt to push themselves to a visible source when hungry.");

	outputCodex("\n\nDue to their slow and miniscule metabolism, the parasites only require a small fraction of the various discharges they can come into contact with. Most Mimbrane are unable to engorge themselves rapidly, which acts as a countermeasure from growing too large too fast, thus increasing their odds of irritating their hosts and reaching their demise.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Reproduction"));
	outputCodex("Mimbrane store and process any and all nutrients they come into contact with once in contact with a host. As a result, the body part they’ve encapsulated can appear to swell over time. The parasite can easily grow anywhere between twenty five and fifty percent of the size of the organ it currently resides over. People with swollen penises, vaginas, asses, or anything else never feel as if their organs have been smothered with the extra weight due to the creature’s continued mimicry and faked signals it sends to the nervous system.");

	outputCodex("\n\nOnce a Mimbrane has reached a large enough mass – roughly at least double its original mass – it will begin asexual reproduction in a form similar to binary fission. The parasite begins by preparing the host for the bizarre sensations, which are described to feel as if removing large bandages, onaholes, or other sorts of coverings after a long period of time. If it fears for its safety, the parasite will wait until the host is asleep.");

	outputCodex("\n\nA separation begins to occur along the perimeter of the Mimbrane’s original size. Over the course of an hour or two, the parasite will center its consciousness on the skin still attached to the organ and finish severing all of the extra mass its accumulated over the course of a number of weeks. At this point, the growth will fall or merely slip off of the host, still appearing like an enlarged copy of the organ it shed from. The faux organ will convulse and spasm for a few minutes, signaling the growth of the new consciousness.");

	outputCodex("\n\nThe new Mimbrane can survive in this state for tens of minutes, feeding off the excess stores of nutrition left to it by its parent. Some more experienced hosts have been known to enjoy the offspring for the time it exists as an engorged copy of their body part. The new Mimbrane’s mind briefly revolves around its memories as the body part in this state.");

	outputCodex("\n\nEventually it will settle and unravel back into its original form, flooded with the continued instincts and knowledge that is always passed down throughout the creation of the parasites. Mimbrane prefer to spread to new targets and will abandon their parents as soon as the opportunity arrives.");

	outputCodex(blockHeader("Intelligence and Behavior"));
	outputCodex("Evolution has taught this race to be patient and polite in order to increase odds of survival. Mimbrane intelligence is just above that of common house pets, surprisingly. The parasites rely on their lust-increasing secretions to attain hosts, but they cannot afford to continue to rely on them once they are in place. This forces the creatures to interact with their host as little as possible, relying on their mimicry, downplayed movements, and slow growth to conceal themselves as long as they feel they are in danger of aggravating their host, driving them to attempt and remove them.");

	outputCodex("\n\nOnce Mimbrane believe they’re in little harm of being forcibly removed from their perch, they may open up a little to their host. The parasite will more freely control its claimed organ in plain view of its host, responding to stimuli such as movement and sound like any other sentient creature will. The parasite will attempt to form and maintain this bond in order to help ensure its survival if it thinks it can make it work.");

	outputCodex("\n\nAs time and trust continue to build, Mimbrane can eventually reawaken their latent capabilities used when capturing prey, helping their host by waging the same spitting and secretion-based attacks against their opponents’ sexual drive. These strikes require a good degree of the nutrients the parasite has stored from the host, nutrients that are typically reserved purely for reproduction and self-sustenance. As a result, these actions can only be used sparingly by the creature when they feel open enough to aid in combat.");

	outputCodex("\n\nGetting a Mimbrane confident enough to act like this is quite a feat as this runs contrary to the species’ normally shy nature. A Mimbrane’s first instinct once it has attached to a host is to mimic and hide in plain sight. Even when the parasite has fully confided in its host, it will generally hide from all strangers.");

	outputCodex("\n\nWhat they won’t hide from are their fellow parasites. Mimbrane are highly sociable among one another, and people playing host to several of them may discover just how chatty the little guys can tend to be. No matter what form they may appear in, Mimbrane will utilize their mouth to make high-pitched squeaks to communicate with one another.");

	outputCodex("\n\nMimbrane will also come to the aid of their brethren when possible. If they discover their host is in combat with another of their kind, they will sweat the same lust-inducing oil that host-free Mimbrane use to subdue their prey. This can turn an individual’s armor against them as the parasites will use it as a pressure cooker for sexual fervor. Once the host has been humbled, existing Mimbrane already clinging to them will announce their presence and work together to signify any remaining key organs for the new parasite to claim as their own. This behavior can easily lead to an individual being overrun by the parasite if they continually encounter them.");

	outputCodex("\n\nFinally, Mimbrane will continue to aid one another on the same host by making certain any parasites without orifices to feed from are taken care of. It isn’t uncommon for an individual with several Mimbrane to frequently lose control of much of their body as the parasites communicate and feed one another if the fear of discovery and removal is low. This group mentality is exclusive to the parasites only when a host is present; they do not typically come to one another’s aid and work together alone in the wild.");

	outputCodex("\n\n");

	outputCodex(blockHeader("Removal"));
	outputCodex("Mimbrane’s incredible mimicry and tendencies to aid their hosts when they aren’t avoiding their ire is simply due to the fact they perish if they are ever removed from their host. The act of integrating into an organism’s nervous system is second nature to the parasite, but they will die of shock should they be pried away. Unaided removal is highly discouraged, as the parasite can easily utilize its connection to the host to paralyze them with signals of pain or pleasure.");

	outputCodex("\n\nMimbrane can utilize their natural defenses in addition to anything the organ at their disposal can grant them to defend themselves against others as well. Individuals with a great number of parasites across their body can even provide a challenge for medical professionals. Caution is recommended when dealing with anyone in a situation like this; the parasites will easily wrestle control away from their host when fueled by adrenaline and defend themselves.");
	
	outputCodex("\n\nContacting an anesthesiologist is the best approach to removing Mimbrane from an individual. The parasite’s need to breathe makes it susceptible to being knocked out and easily removed. There is rarely any lasting damage or scars to hosts.");

	CodexManager.viewedEntry("Mimbrane");
}