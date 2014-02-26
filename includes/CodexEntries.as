// This is the simplest method I can think of hooking up the codex functions into the tree structure for display
// It's janky as fuck, but it does work, at it means the actual codex "body" content can be done almost exactly
// like regular scenes are now.

public function configureCodex():void
{
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Arty", testPersonEntryA);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn", testPersonEntryB);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_EVENT, "Test Events", "Buttsunder", testEventEntryA);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_EVENT, "Test Events", "Snouts", testEventEntryB);
	
	// Complex path tree entries DO work, but until we actually NEED to organise the data
	// (and I implement some kind of path folding), I don't think we should actually USE them more than say 1 deep (because the way addEntry works
	// requires at least a "root" path of some sort
	
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_LOCATION, "Some/Complex/Path/To", "Tentacool", testLocationEntryA);
	//CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_LOCATION, "This/Isnt/Simpler/Either", "Interbutts", testLocationEntryB);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_LOCATION, "Test Locations", "Tentacool", testLocationEntryA);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_LOCATION, "Test Locations", "Interbutts", testLocationEntryB);
	
	// This is how I'm proposing we split things up for now -- stuff things into a root category of the relevent system they belong too
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Ara Ara", "Zil", zilCodexEntry);
}

public function zilCodexEntry():void
{
	clearOutputCodex();
	userInterface.showBust("ZILFEMALE", "ZIL"); // ohoho lookit dis shit!

	outputCodex(header("The Zil"));
	outputCodex("\n<b>Sexes:</b> Male and female.");
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

public function testPersonEntryA():void
{
	clearOutputCodex();
	
	outputCodex(header("Arty Rynn"));
	outputCodex("\nSome duder who exists. Honest. No really!");
	outputCodex("\nRight Honourable Mentlegenn and such.");
	outputCodex("\nA Dude Who Is Cool.");
	
	outputCodex("\n\n");
	
	outputCodex("More words, words words.");
	
}

public function testPersonEntryB():void
{
	clearOutputCodex();
	
	outputCodex(header("Syn"));
	outputCodex("\nSome batshit insane chick that won't leave you alone. Have fun with that.");
	outputCodex("\nPain in the cunt factor: infinity.");
	outputCodex("\nShe looks kinda cool or some shit, whatever.");
	
	outputCodex("\n\n");
	
	outputCodex("Insert words here etc.");
}

public function testEventEntryA():void
{
	clearOutputCodex();
	
	outputCodex(header("The Great Buttsunder"));
	outputCodex("\nYou took it in the butt. It was good. The end.");
	
	outputCodex("\n\n");
	
	outputCodex("Guess I better pad out this placeholder shit some more so I can make sure the UI doesn't fall over.");
}

public function testEventEntryB():void
{
	clearOutputCodex();
	
	outputCodex(header("Victory of the Snouts"));
	outputCodex("\nAnd on that day, Savin's rage intensified 10 fold.");
	
	outputCodex("\n\n");
	
	outputCodex("I couldn't help myself...");
	
}

public function testLocationEntryA():void
{
	clearOutputCodex();
	
	outputCodex(header("Planet Tentacool"));
	outputCodex("\nCool place. Many tentacools.");
	
	outputCodex("\n\n");

	outputCodex("TENTACOOLS. I fucking love that word. TENTA. COOLS. B)");
}

public function testLocationEntryB():void
{
	clearOutputCodex();
	
	outputCodex(header("The Interbutts"));
	outputCodex("\nA super cool place. It's full of smut.");
	
	outputCodex("\n\n");
	
	outputCodex("THE INTERNET. ITS FOR PORN.");
	
}