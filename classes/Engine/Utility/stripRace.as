﻿package classes.Engine.Utility
{
	import classes.Util.InCollection;
	
	public function stripRace(sRace:String = "", fromPC:Boolean = false):String
	{
		sRace = sRace.toLowerCase();
		
		// Prefix
		if(sRace.indexOf("half-") != -1)
		{
			if(fromPC) sRace = "human";
			sRace = sRace.replace("half-", "");
		}
		if(sRace.indexOf("half ") != -1)
		{
			if(fromPC) sRace = "human";
			sRace = sRace.replace("half ", "");
		}
		if(sRace.indexOf("part ") != -1) sRace = sRace.replace("part ", "");
		
		// Suffix
		if(sRace.indexOf("-morph") != -1) sRace = sRace.replace("-morph", "");
		if(sRace.indexOf(" morph") != -1) sRace = sRace.replace(" morph", "");
		if(sRace.indexOf("-taur") != -1) sRace = sRace.replace("-taur", "");
		if(sRace.indexOf(" taur") != -1) sRace = sRace.replace(" taur", "");
		if(sRace.indexOf(" centaur") != -1) sRace = sRace.replace(" centaur", "");
		if(sRace.indexOf("-hybrid") != -1) sRace = sRace.replace("-hybrid", "");
		if(sRace.indexOf(" hybrid") != -1) sRace = sRace.replace(" hybrid", "");
		if(sRace.indexOf(" halfbreed") != -1) sRace = sRace.replace(" halfbreed", "");
		if(sRace.indexOf("-girl") != -1) sRace = sRace.replace("-girl", "");
		if(sRace.indexOf("-boy") != -1) sRace = sRace.replace("-boy", "");
		if(sRace.indexOf("-boi") != -1) sRace = sRace.replace("-boi", "");
		if(sRace.indexOf("-man") != -1) sRace = sRace.replace("-man", "");
		
		// Names
		if(InCollection(sRace, ["amazoness", "amazonian", "amazon"])) sRace = "human";
		if(sRace.indexOf("robot") != -1 || sRace.indexOf("machine") != -1 || sRace.indexOf("droid") != -1 || sRace.indexOf("automaton") != -1 || sRace.indexOf("conglomerate") != -1 || sRace.indexOf("junker") != -1) sRace = "robot";
		if(sRace.indexOf("anthro") != -1) sRace = "anthro";
		if(InCollection(sRace, ["cow", "bull", "futaurus", "minotaur", "holstaurus", "minitaur"])) sRace = "bovine";
		if(InCollection(sRace, ["horse", "alicorn", "unicorn", "pegasus"])) sRace = "equine";
		if(InCollection(sRace, ["dog", "doge", "doggo", "puppy", "pupper", "bitch", "hellhound", "husky"])) sRace = "canine";
		if(InCollection(sRace, ["fox", "vixen"])) sRace = "vulpine";
		if(InCollection(sRace, ["wolf", "worg"])) sRace = "lupine";
		if(InCollection(sRace, ["cat", "kitten", "tiger", "tigeress", "panther", "jaguar", "cheetah", "lion", "lioness", "chakat", "nekomata", "dragonne"])) sRace = "feline";
		if(InCollection(sRace, ["satyr"])) sRace = "goat";
		if(InCollection(sRace, ["sheep", "ram", "lamb"])) sRace = "ovine";
		//if(InCollection(sRace, ["griffin", "hippogriff", "quetzalcoatl", "phoenix", "vulpogryph", "sirin", "harpy"])) sRace = "avian";
		if(sRace.indexOf("shark") != -1 || InCollection(sRace, ["megalodon", "leviathan naga"])) sRace = "shark";
		if(InCollection(sRace, ["treant", "dryad"])) sRace = "plant";
		if(InCollection(sRace, ["red panda"])) sRace = "lesser panda";
		if(sRace.indexOf("'rahn") != -1) sRace = "rahn";
		if(sRace.indexOf("goblin") != -1) sRace = "gabilani";
		if(InCollection(sRace, ["raskvel", "rask"])) sRace = "raskvel";
		if(sRace.indexOf("pony") != -1) sRace = "pony";
		
		if(sRace.indexOf("NOT SET") != -1 || sRace.indexOf("?") != -1) sRace = "";
		
		return sRace;
	}
}
