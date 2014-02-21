// This is the simplest method I can think of hooking up the codex functions into the tree structure for display
// It's janky as fuck, but it does work, at it means the actual codex "body" content can be done almost exactly
// like regular scenes are now.

public function configureCodex():void
{
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Arty", testPersonEntryA);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "SynA", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "SynB", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "SynC", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "SynD", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "SynE", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "SynF", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "SynG", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "SynH", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn1", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn2", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn3", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn4", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn5", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn6", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn7", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn8", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn9", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn10", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn11", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn12", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn13", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn14", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn15", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn16", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn17", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn18", testPersonEntryB);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn19", testPersonEntryB);
	
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