// This is the simplest method I can think of hooking up the codex functions into the tree structure for display
// It's janky as fuck, but it does work, at it means the actual codex "body" content can be done almost exactly
// like regular scenes are now.

public function configureCodex():void
{
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Arty", testPersonEntryA);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_PERSON, "Test People", "Syn", testPersonEntryB);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_EVENT, "Event A", "Buttsunder", testEventEntryA);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_EVENT, "Event B", "Snouts", testEventEntryB);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_LOCATION, "Some/Complex/Path/To", "Tentacool", testLocationEntryA);
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_LOCATION, "This/Isnt/Simpler/Either", "Interbutts", testLocationEntryB);
	
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Organic/Ara Ara", "Zil", zilCodexEntry);
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