// This is the simplest method I can think of hooking up the codex functions into the tree structure for display
// It's janky as fuck, but it does work, at it means the actual codex "body" content can be done almost exactly
// like regular scenes are now.

public function configureCodex():void
{
	CodexManager.addCodexEntry(CodexManager.CODEX_TYPE_RACE, "Organic/Ara Ara", "Zil", zilCodexEntry);
}