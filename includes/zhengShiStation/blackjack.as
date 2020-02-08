import classes.PlayingCard;
import classes.PlayingCardDeck;

/* ROO NOTES
NPC by William

Panty String: "Panties - Roo's - Satiny, bright red panties with ribbony side-ties."

Flags
======================================
MET_ROO
	1 = know her name
	2 = she knows your name
ROO_HIGHEST_STRIP_LEVEL
	See ROO_STRIP_LEVEL FOR DETAILS
ROO_STRIP_LEVEL
	0 = normal
	1 = jacket off
	2 = skirtoff
	3 = shoirt
	4 = Panties
	5 = nakkers
ROO_GASMED
	Total roogasm count
ROO_ON_CD
	1 if Roo is on Cooldown for gasming
ROO_CREDIT_OVERALL
	Overall credits won/lost
ROO_CREDITS_DAILY
	Overall credits daily - WILL NOT GO BELOW 0.
ROO_GAMES_PLAYED
	Total blackjack games played.
ROO_WINS
	Blackjacks won.
ROO_LOSSES
	Blackjacks lost.
ROO_SEXED
	Sex scene counter.
ROO_SELFTALKED
	Used for tracking which topic to discuss. Loops. Undefined at start.
ROO_SELFTALKED_TOTAL
	Incremented for each time talked. Undefined at start
*/

public function showBlackjackDealer():void
{
	showName("\nBLACKJACK!");
	if(flags["BLACKJACK_DEALER"] == 9999 || flags["BLACKJACK_DEALER"] == undefined) showBust("ULA");
	if(flags["BLACKJACK_DEALER"] == 1) showRoo();
}
public function showRoo():void
{
	showName(flags["MET_ROO"] != undefined ? "\nROO" : "\nBLACKJACK!");
	showBust(rooBustDisplay());
}
public function rooBustDisplay():String
{
	switch(flags["ROO_STRIP_LEVEL"])
	{
		case undefined:
		case 0:
			return "ROO";
		case 1:
			return "ROO_SKIRT";
		case 2:
			return "ROO_SHIRT";
		case 3:
			return "ROO_PANTIES";
		case 4:
			return "ROO_NUDE";
		default:
			return "ROO";
			break;
	}
}
public function roogasm():void
{
	IncrementFlag("ROO_GASMED");
	flags["ROO_ON_CD"] = 1;
}

public function processCasinoEvents():void
{
	if(flags["MET_ROO"] != undefined)
	{
		flags["ROO_ON_CD"] = undefined;
		flags["ROO_CREDITS_DAILY"] = 0;
		flags["ROO_STRIP_LEVEL"] = 0;
		flags["ROO_TALK_CD"] = 1;
		flags["ROO_GAMED_TODAY"] = undefined;
	}
}

public function blackjackTest():void
{
	clearOutput();
	flags["BLACKJACK_WIN"] = blackjackWin;
	flags["BLACKJACK_LOSE"] = blackjackLose;
	flags["BLACKJACK_TIE"] = blackjackTie;
	flags["BLACKJACK_DEALER"] = 9999;
	flags["BLACKJACK_BET"] = 0;
	flags["BLACKJACK_DEALER_SHOWN"] = undefined;
	output("Want play blackjack? Kay!");
	
	startBlackjack(true);
}

public function blackjackTie():void
{
	clearOutput();
	showBlackjackDealer();
	
	if(flags["BLACKJACK_DEALER"] == 1)
	{
		output("<i>“Another hand then?”</i> the bunny-cat smiles with apparent delight at the thought of playing with you again.");
		rooMenu();
	}
	else
	{
		output("Well, what are the chances?\n\nThe dealer prepares another hand. Do you play again?");
		flags["BLACKJACK_DEALER_SHOWN"] = undefined;
		flags["BLACKJACK_BET"] = 0;
		flags["BLACKJACK_STANDING"] = undefined;
		clearMenu();
		addButton(0,"Play Again",startBlackjack,true);
		addButton(14,"Leave",blackjackCleanup);
	}
}

public function basicBitchBlackjackDealerIntro():void
{
	output("\n\nA robotic dealer invites you to play a game of blackjack. <i>“Blackjack! The game older than time. <b>500 credits</b> to play, a fortune to be won. House stands at seventeen, ties go to the dealer. Interested?”</i>");
	//Roo roo roo!
	rooBonus(0);

	addButton(1,"Blackjack",setUpBasicBitchBlackjack,undefined,"Blackjack","Playing will cost you at least 500 credits, maybe more if you’re feeling greedy.");
}
public function setUpBasicBitchBlackjack():void
{

	flags["BLACKJACK_WIN"] = blackjackWin;
	flags["BLACKJACK_LOSE"] = blackjackLose;
	flags["BLACKJACK_TIE"] = blackjackTie;
	flags["BLACKJACK_DEALER"] = 0;
	flags["BLACKJACK_DEALER_SHOWN"] = undefined;
	flags["BLACKJACK_BET"] = 0;
	startBlackjack();
}

public function rooCapacity():Number
{
	return 750;
}

public function startBlackjack(clearBet:Boolean = false):void
{
	var deck:PlayingCardDeck = new PlayingCardDeck();
	var dealerHand:PlayingCardDeck = new PlayingCardDeck();
	var pcHand:PlayingCardDeck = new PlayingCardDeck();
	deck.initDeck();
	deck.shuffleDeck();
	deck.shuffleDeck();
	deck.shuffleDeck();
	//Go bet if not yet betted
	if(flags["BLACKJACK_BET"] == 0)
	{
		blackJackBettingScreen([deck,dealerHand,pcHand]);
		return;
	}
	clearOutput();
	showBlackjackDealer();
	flags["BLACKJACK_STANDING"] = undefined;
	if(clearBet) flags["BLACKJACK_BET"] = 0;
	
	if(flags["BLACKJACK_DEALER"] == 9999)
	{
		output("You start up a game of blackjack!");
		output(" A quick shuffle of the cards and you’re ready to play!");
	}
	else if(flags["BLACKJACK_DEALER"] == 0)
	{
		output("The dealer shuffles the deck exactly three times, each time with near-perfect precision. It’s time to play!");
	}
	else if(flags["BLACKJACK_DEALER"] == 1)
	{
		output("Roo expertly shuffles the deck with a wink and a smile. It’s time to play!");
	}
	pcHand.addCard(deck.drawCard()[0]);
	pcHand.addCard(deck.drawCard()[0]);
	output("\n\nYou draw: " + pcHand.listHand() + ".\nValue: <b>" + pcHand.getCardPointTotalBlackjack() + " </b>.");

	dealerHand.addCard(deck.drawCard()[0]);
	dealerHand.addCard(deck.drawCard()[0]);
	output("\n\nThe dealer draws: " + dealerHand.listHand(true) + ".\nVisible Value: <b>" + dealerHand.getCardPointTotalBlackjack(true) + "</b>");
	blackJackOptions([deck,dealerHand,pcHand]);
}

public function blackjackStatus(args:Array):void
{
	var deck:PlayingCardDeck = args[0];
	var dealerHand:PlayingCardDeck = args[1];
	var pcHand:PlayingCardDeck = args[2];
	//If not enough bet yet, make sure bet is done
	if(flags["BLACKJACK_BET"] < 500)
	{
		blackJackBettingScreen(args);
		return;
	}
	//If hand not dealt yet, go do that instead.
	if(pcHand.cards.length <= 0)
	{
		startBlackjack();
		return;
	}
	clearOutput();
	showBlackjackDealer();
	output("Your current hand: " + pcHand.listHand() + ".\nValue: <b>" + pcHand.getCardPointTotalBlackjack() + " </b>");
	output("\n\nThe dealer’s hand: " + dealerHand.listHand(true) + ".\nVisible Value: <b>" + dealerHand.getCardPointTotalBlackjack(true) + "</b>");
	blackJackOptions([deck,dealerHand,pcHand]);
}

public function blackJackBettingScreen(args:Array):void
{
	var deck:PlayingCardDeck = args[0];
	var dealerHand:PlayingCardDeck = args[1];
	var pcHand:PlayingCardDeck = args[2];
	showBlackjackDealer();
	clearOutput();
	if(stage.contains(userInterface.textInput)) removeInput();

	//Roo is dealer:
	if(flags["BLACKJACK_DEALER"] == 1)
	{
		if(flags["ROO_CREDIT_OVERALL"] == 0)
		{
			output("Why not? Slapping the chit down, you declare your readiness to bet, already thinking about how much you want to start with. A low cursory chirp comes from the table, anticipating your starting wager.");
			output("\n\nRoo is nothing if not positive, eagerly shuffling the deck in preparation. <i>“How much shall we play for?”</i> she asks in a sing-song voice.");
		}
		// Repeat
		else if(flags["ROO_GASMED"] == 0)
		{
			output("A little frivolous gambling will do your soul... probably no good, but hey, there’s a pretty woman ");
			if(flags["ROO_HIGHEST_STRIP_LEVEL"] != 0) output("who’ll strip down when you win! That’s something to look forward to!");
			else output("that you just can’t deny.");
			output("\n\n<i>“Yay!”</i> she throws a hand into the air, genuinely overcome with positivity. <i>“Whenever you’re ready, ");
			if(flags["MET_ROO"] != 2) output(pc.mfn("handsome","cutie","cutie"));
			else output("[pc.name]");
			output("!”</i> Before planting your chit into the table, you decide on how much you’re putting in...");
		}
		// Repeat (Gamegasm’d once)
		else if(flags["ROO_GASMED"] < 3)
		{
			output("Yeah, you’re in!");
			output("\n\n<i>“Awesome!”</i> Roo cheers, giving you a comical thumbs-up. <i>“It’s just not the same without you, [pc.name]. How much will you play for?”</i>");
			output("\n\nPutting a chit down, you decide...");
		}
		// Repeat (Gamegasm’d 3 times)
		else if(flags["ROO_GASMED"] < 10)
		{
			output("How can you say no?");
			output("\n\n<i>“I’m-”</i> Roo stops herself, curbing her overwhelming excitement. <i>“Welcome back, happy to have you, [pc.name]! Now, what will your bet be?”</i>");
		}
		// Repeat (Gamegasm’d 10 times)
		else
		{
			output("You’ve got the time, and you’ve got the money.");
			output("\n\nNodding, Roo’s sanguine voice stumbles all over itself trying to maintain a trace of etiquette. <i>“Very well, [pc.name]...”</i> she begins, blinking rapidly when she meets your eyes. <i>“What will you start off at?”</i>");
		}
		output("\n\n");
		processTime(1);
	}
	output("How much will you bet? " + (flags["BLACKJACK_BET"] < 500 ? "<b>A bet of 500 credits is required to play.</b>":"Current bet: " + flags["BLACKJACK_BET"] + " credits."));
	if(flags["BLACKJACK_DEALER"] == 1)
	{
		if(flags["BLACKJACK_DEALER"] == 1)
		{
			winningsDisplay();
		}
	}
	
	if(flags["BLACKJACK_DEALER"] != 1) addButton(0,"Custom Bet",enterCustomBet,args,"Custom Bet","Enter a custom amount of credits to bet.");
	else addDisabledButton(0,"Custom Bet","Custom Bet","Betting with Roo can only be done in specific amounts.");
	if(flags["BLACKJACK_BET"] + 500 < pc.credits) addButton(1,"Bet 500",takeFixedBet,[args[0],args[1],args[2],500]);
	else addDisabledButton(1,"Bet 500","Bet 500","That bet is more than your bank can cover.");
	if(flags["BLACKJACK_BET"] + 1000 < pc.credits) addButton(2,"Bet 1000",takeFixedBet,[args[0],args[1],args[2],1000]);
	else addDisabledButton(2,"Bet 1000","Bet 1000","That bet is more than your bank can cover.");
	if(flags["BLACKJACK_BET"] + 2500 < pc.credits) addButton(3,"Bet 2500",takeFixedBet,[args[0],args[1],args[2],2500]);
	else addDisabledButton(3,"Bet 2500","Bet 2500","That bet is more than your bank can cover.");
	if(flags["BLACKJACK_BET"] + 5000 < pc.credits) addButton(4,"Bet 5000",takeFixedBet,[args[0],args[1],args[2],5000]);
		else addDisabledButton(4,"Bet 5000","Bet 5000","That bet is more than your bank can cover.");
	if(flags["BLACKJACK_DEALER"] != 1)
	{
		if(flags["BLACKJACK_BET"] + 10000 < pc.credits) addButton(5,"Bet 10000",takeFixedBet,[args[0],args[1],args[2],10000]);
		else addDisabledButton(5,"Bet 10000","Bet 10000","That bet is more than your bank can cover.");
		if(flags["BLACKJACK_BET"] + 25000 < pc.credits) addButton(6,"Bet 25000",takeFixedBet,[args[0],args[1],args[2],25000]);
		else addDisabledButton(6,"Bet 25000","Bet 25000","That bet is more than your bank can cover.");
	}
	if(pcHand.cards.length <= 0 && flags["BLACKJACK_BET"] < 500) addButton(14,"Leave",mainGameMenu);
	else addButton(14,"Back",blackjackStatus,[deck,dealerHand,pcHand]);
}

public function betInputOkay():Boolean
{
	if( isNaN(Number(userInterface.textInput.text))) return false;
	if(Number(userInterface.textInput.text) + flags["BLACKJACK_BET"] > pc.credits) return false;
	if(Number(userInterface.textInput.text) < 500) return false;
	else return true;
}

public function enterCustomBet(args:Array):void
{
	clearOutput();
	showBlackjackDealer();
	output("How much?");
	displayInput();
	userInterface.textInput.text = "";
	userInterface.textInput.maxChars = 10;
	addButton(0,"Place Bet",takeBet,args);
	addButton(14,"Back",blackJackBettingScreen,args);
}
public function takeBet(args:Array):void
{
	clearOutput();
	showBlackjackDealer();
	if(stage.contains(userInterface.textInput)) removeInput();

	if(!betInputOkay())
	{
		output("Please enter a valid bet amount.");
		clearMenu();
		addButton(0,"Next",blackJackBettingScreen,args);
		return;
	}
	else
	{
		var betAmount:Number = Number(userInterface.textInput.text);
		if(flags["BLACKJACK_BET"] > 0) output("You add " + betAmount + " to your bet, raising the total to " + (flags["BLACKJACK_BET"]+betAmount) + ".");
		else output("You bet a total of " + betAmount + ".");
		flags["BLACKJACK_BET"] += betAmount;
	}
	clearMenu();
	addButton(0,"Next",blackjackStatus,args);
}

public function takeFixedBet(args:Array):void
{
	var deck:PlayingCardDeck = args[0];
	var dealerHand:PlayingCardDeck = args[1];
	var pcHand:PlayingCardDeck = args[2];
	userInterface.textInput.text = args[3];
	takeBet([deck,dealerHand,pcHand]);
}

public function blackJackOptions(args:Array):void
{
	if(stage.contains(userInterface.textInput)) removeInput();
	var deck:PlayingCardDeck = args[0];
	var dealerHand:PlayingCardDeck = args[1];
	var pcHand:PlayingCardDeck = args[2];

	var standValue:Number = 17;
	if(flags["BLACKJACK_DEALER"] == 1) standValue = 16;

	if(pcHand.hasBlackjack())
	{
		output("\n\n<b>BLACKJACK! You win!</b>");
		clearMenu();
		addButton(0,"Next",flags["BLACKJACK_WIN"]);
	}
	else if(pcHand.getCardPointTotalBlackjack() > 21)
	{
		output("\n\n<b>Bust! You lose!</b>");
		clearMenu();
		addButton(0,"Next",flags["BLACKJACK_LOSE"]);
	}
	else if(dealerHand.getCardPointTotalBlackjack() > 21)
	{
		output("\n\n<b>Dealer goes bust! You win!</b>");
		if(flags["BLACKJACK_DEALER_SHOWN"] == undefined) output(" The facedown card is flipped to reveal a " + dealerHand.cards[0].cardDescription() + " for a total of <b>" + dealerHand.getCardPointTotalBlackjack() + "</b>.");
		clearMenu();
		addButton(0,"Next",flags["BLACKJACK_WIN"]);
	}
	else if(dealerHand.getCardPointTotalBlackjack() >= standValue && pcHand.getCardPointTotalBlackjack() > dealerHand.getCardPointTotalBlackjack() && flags["BLACKJACK_STANDING"] != undefined)
	{
		output("\n\n<b>You win!</b>");
		if(flags["BLACKJACK_DEALER_SHOWN"] == undefined) output(" The facedown card is flipped to reveal a " + dealerHand.cards[0].cardDescription() + " for a total of <b>" + dealerHand.getCardPointTotalBlackjack() + "</b>.");
		clearMenu();
		addButton(0,"Next",flags["BLACKJACK_WIN"]);
	}
	//If standing, proceed with dealer till result:
	else if(flags["BLACKJACK_STANDING"] != undefined)
	{
		//If dealer is set and leading, dealer wins
		if(dealerHand.getCardPointTotalBlackjack() >= standValue && dealerHand.getCardPointTotalBlackjack() > pcHand.getCardPointTotalBlackjack())
		{
			output("\n\n<b>Dealer wins!</b>");
			if(flags["BLACKJACK_DEALER_SHOWN"] == undefined) output(" The facedown card is flipped to reveal a " + dealerHand.cards[0].cardDescription() + " for a total of <b>" + dealerHand.getCardPointTotalBlackjack() + "</b>.");
			clearMenu();
			addButton(0,"Next",flags["BLACKJACK_LOSE"]);
		}
		//If tie, nobody winzors!
		else if(dealerHand.getCardPointTotalBlackjack() >= standValue && dealerHand.getCardPointTotalBlackjack() == pcHand.getCardPointTotalBlackjack())
		{
			output("\n\n<b>A tie!</b> Nobody wins and nobody loses - for now.");
			if(flags["BLACKJACK_DEALER_SHOWN"] == undefined) output(" The facedown card is flipped to reveal a " + dealerHand.cards[0].cardDescription() + " for a total of <b>" + dealerHand.getCardPointTotalBlackjack() + "</b>.");
			clearMenu();
			addButton(0,"Next",flags["BLACKJACK_TIE"]);
		}
		//Dealer didnt win and must be below stand value (16/17), so next round...
		else
		{
			clearMenu();
			addButton(0,"Next",blackjackStand,[deck,dealerHand,pcHand]);
		}
	}
	else
	{
		output("\n\nDo you hit or stand? (Hitting draws a new card.)");
		output("\n<b>Betting:</b> " + flags["BLACKJACK_BET"] + " credits.");
		if(flags["BLACKJACK_DEALER"] == 1)
		{
			winningsDisplay();
		}
		clearMenu();
		addButton(0,"Hit",blackjackHit,[deck,dealerHand,pcHand],"Hit","Draw another card to try and get closer to 21 without going over.");
		addButton(1,"Stand",blackjackStand,[deck,dealerHand,pcHand],"Stand","Keep your current cards for now.");
		if(debug) addButton(2,"Win",winAtBlackjack,[deck,dealerHand,pcHand],"Stand","Keep your current cards for now.");
		
		//if(pcHand.getCardPointTotalBlackjack() >= 21) addButton(2,(flags["BLACKJACK_BET"] > 0 ? "Bet More":"Bet"),blackJackBettingScreen,[deck,dealerHand,pcHand]);
		//else addDisabledButton(2,"Bet","Bet","It’s too late in the game for more betting.");
	}
}
public function winAtBlackjack(args:Array):void
{
	var deck:PlayingCardDeck = args[0];
	var dealerHand:PlayingCardDeck = args[1];
	var pcHand:PlayingCardDeck = args[2];
	clearOutput();
	output("Cheating...");
	if(pcHand.getCardPointTotalBlackjack() < 21)
	{
		while(pcHand.getCardPointTotalBlackjack() < 21) 
		{ 
			pcHand.cards[pcHand.cards.length-1].cardValue++; 
			pcHand.cards[0].cardValue++;
			if(pcHand.getCardPointTotalBlackjack() > 21) pcHand.cards[0].cardValue--;
		}
	}
	blackjackDealerAI([deck,dealerHand,pcHand]);
}
public function blackjackHit(args:Array):void
{
	var deck:PlayingCardDeck = args[0];
	var dealerHand:PlayingCardDeck = args[1];
	var pcHand:PlayingCardDeck = args[2];
	clearOutput();
	showBlackjackDealer();
	pcHand.addCard(deck.drawCard()[0]);
	output("You draw: " + pcHand.cards[pcHand.cards.length-1].cardDescription() + ".\n");
	output("Your current hand: " + pcHand.listHand() + ".\nValue: <b>" + pcHand.getCardPointTotalBlackjack() + " </b>");
	blackjackDealerAI([deck,dealerHand,pcHand]);

}
public function blackjackStand(args:Array):void
{
	var deck:PlayingCardDeck = args[0];
	var dealerHand:PlayingCardDeck = args[1];
	var pcHand:PlayingCardDeck = args[2];
	flags["BLACKJACK_STANDING"] = true;
	clearOutput();
	showBlackjackDealer();
	output("You keep your current hand: " + pcHand.listHand() + ".\nValue: <b>" + pcHand.getCardPointTotalBlackjack() + " </b>");
	blackjackDealerAI([deck,dealerHand,pcHand]);
}
public function blackjackDealerAI(args:Array):void
{
	var deck:PlayingCardDeck = args[0];
	var dealerHand:PlayingCardDeck = args[1];
	var pcHand:PlayingCardDeck = args[2];

	var standValue:Number = 17;
	if(flags["BLACKJACK_DEALER"] == 1) standValue = 16;
	if(dealerHand.getCardPointTotalBlackjack() < standValue)
	{
		dealerHand.addCard(deck.drawCard()[0]);
		output("\n\nThe dealer draws a card: " + dealerHand.cards[dealerHand.cards.length-1].cardDescription() + ".\n");
		output("Dealer’s hand: " + dealerHand.listHand(true) + ".\nVisible Value: <b>" + dealerHand.getCardPointTotalBlackjack(true) + "</b>");
	}
	else 
	{
		output("\n\nDealer stands: " + dealerHand.listHand() + ".\nValue: <b>" + dealerHand.getCardPointTotalBlackjack() + "</b>");
		flags["BLACKJACK_DEALER_SHOWN"] = true;
	}
	blackJackOptions([deck,dealerHand,pcHand]);
}

public function blackjackWin():void
{
	clearOutput();
	output("The dealer congratulates you on your good fortune and dispenses " + flags["BLACKJACK_BET"] + " credits to your account.");
	pc.credits += flags["BLACKJACK_BET"];
	flags["BLACKJACK_DEALER_SHOWN"] = undefined;
	flags["BLACKJACK_BET"] = 0;
	flags["BLACKJACK_STANDING"] = undefined;
	clearMenu();
	addButton(0,"Play Again",startBlackjack,true);
	addButton(14,"Leave",blackjackCleanup);
}
public function blackjackLose():void
{
	clearOutput();
	pc.credits -= flags["BLACKJACK_BET"];
	output("The dealer expresses a convincing simulation of compassion while debiting your wager (" + flags["BLACKJACK_BET"] + ") from your account. Play again?");
	flags["BLACKJACK_DEALER_SHOWN"] = undefined;
	flags["BLACKJACK_BET"] = 0;
	flags["BLACKJACK_STANDING"] = undefined;
	clearMenu();
	addButton(0,"Play Again",startBlackjack,true);
	addButton(14,"Leave",blackjackCleanup);
}
public function blackjackCleanup():void
{
	flags["BLACKJACK_LOSE"] = undefined;
	flags["BLACKJACK_WIN"] = undefined;
	flags["BLACKJACK_TIE"] = undefined;
	mainGameMenu();
}

/*
public function bjScorecheck():void
{
	var hand:PlayingCardDeck = new PlayingCardDeck();
	hand.cards.push(new PlayingCard("spades",10,14));
	hand.cards.push(new PlayingCard("hearts",10,10));
	hand.cards.push(new PlayingCard("diamonds",10,13));
	output(hand.getCardPointTotalBlackjack() + "\n");
	hand = new PlayingCardDeck();
	hand.cards.push(new PlayingCard("hearts",10,10));
	hand.cards.push(new PlayingCard("hearts",10,10));
	hand.cards.push(new PlayingCard("hearts",10,10));
	hand.cards.push(new PlayingCard("spades",10,14));
	hand.cards.push(new PlayingCard("hearts",10,10));
	output(hand.getCardPointTotalBlackjack() + "\n");
	hand = new PlayingCardDeck();
	hand.cards.push(new PlayingCard("spades",10,14));
	hand.cards.push(new PlayingCard("spades",10,14));
	hand.cards.push(new PlayingCard("spades",10,14));
	hand.cards.push(new PlayingCard("diamonds",10,13));
	hand.cards.push(new PlayingCard("diamonds",10,13));
	hand.cards.push(new PlayingCard("spades",10,14));
	output(hand.getCardPointTotalBlackjack() + "\n");
	hand = new PlayingCardDeck();
}*/

//Add to Treasure Nova - [Bunny Dealer/Roo]
// Add to J29 \GAME FLOOR. This is Roo's tile.
// Roo will be available from 12:00 to 24:00 each day; her work day refreshes at 12:00. When Roo gamegasms, she reappears the next day at 12:00.
// PC will introduce themselves after they get her to strip once, which will determine when Roo can say their name.
// Roo has three levels of lewdness. Minimum, Intensifies, Maximizes. [Play] revolves around this from start to finish!
public function rooBonus(button:Number = 0):void
{
	if(hours >= 12)
	{
		//Roo Not Met
		if(flags["MET_ROO"] == undefined)
		{
			output("\n\nOne notably enthusiastic dealer who manages a table at the very middle of this room catches your eye. A white head of curly hair and two floppy bunny’s ears cap a heart-shaped face with cherry-red eyes. If you want to play a hand of blackjack, you don’t need to look farther than her. Also, it’s one of the only free seats you see.");
		}
		// Roo Met but isn’t at her table (Got Gamegasm’d!)
		else if(flags["ROO_ON_CD"] == 1)
		{
			output("\n\nRoo’s table has been commandeered by a sylvan-eared substitute. The fey man assumes her job with a calm demeanor that doesn’t do justice to the true owner. After your string of victories she’s had to take the day off, alas. She’ll no doubt be back later!");
		}
		// Roo Met (PC has gamegasm’d her repeatedly, replace the above)
		else if(flags["ROO_GASMED"] >= 4)
		{
			output("\n\n<i>“[pc.name]!”</i> Roo shouts your name before you look her way. She’s leaned forward provocatively, showing off the slit of her creamy cleavage, all but begging you with her beaming eyes to try your luck again. Despite her distinctly unprofessional (and of course well received) gesture, she casually returns to her game while keeping one cat-like eye on you.");
		}
		// Roo Met (PC has gamegasm’d her once, replace the above)
		else if(flags["ROO_GASMED"] > 0)
		{
			output("\n\nRoo is cheerily dealing cards and running game after successful game. The cat-bunny hops to her feet when she spots you, calling your name and waving you over to take the free seat. With graciousness like that you almost do so on autopilot. " + (flags["ROO_STRIP_LEVEL"] == 0 ? "Considering your recent victories, you wonder if you could get another messy jackpot out of her!":"You wonder if you should finish your game and get another messy jackpot out of her..."));
		}
		// Roo Met (PC has played her and gotten her to strip today, replace the above)
		else if(flags["ROO_STRIP_LEVEL"] > 0)
		{
			output("\n\nRoo is where she always is, shuffling a deck of cards and humming happily as she does a few clothes short. The moment she spots you she waves you over with her ruby red smile, distributing cards with feline precision. You could pull up that free chair and join her again, see if you can get her to take the rest of her clothes off...");
		}
		// Roo Met (PC hasn’t played her today)
		else //Fen note: made this generic since she didn't have a catch-all "else".
		{
			output("\n\nRoo is where you last saw her, dealing out cards with masterful reflex. Her ears flop abruptly when she blows a cute kiss your way, finishing with a wink. Through that gesture she still kept one eye on her game! To her left a seat is available. Maybe you could be her player one?");
		}
		if(flags["ROO_ON_CD"] == 1) addDisabledButton(button,"Roo","Roo","After her climax, Roo is off duty for the day.");
		else if(flags["MET_ROO"] == undefined) addButton(button,"Bunny Dealer",approachRoo,undefined,"Bunny Dealer","Grab a seat at the table and consider striking up a game with the bunny-eared dealer!");
		else if(pc.credits < 500) addDisabledButton(button,"Roo","Roo","You don’t have any money. There’s no reason to annoy anybody by sitting at a game you can’t afford to play.");
		else addButton(button,"Roo",approachRoo,undefined,"Roo","Sidle up to the blackjack table and have a go with Roo again!");
	}
	else
	{
		if(flags["MET_ROO"] != undefined) 
		{
			output("\n\nRoo isn’t working her usual table right now. Maybe you should check back after noon?");
			addDisabledButton(0,"Roo","Roo","This blackjack table isn’t currently open for business.");
		}
		else addDisabledButton(0,"Bunny Dealer","Bunny Dealer","This blackjack table isn’t currently open for business.");
	}
}

public function approachRoo():void
{
	clearOutput();
	showRoo();
	author("William");
	// First Time
	if(flags["MET_ROO"] == undefined)
	{
		flags["MET_ROO"] = 1;
		flags["ROO_HIGHEST_STRIP_LEVEL"] = 0;
		flags["ROO_STRIP_LEVEL"] = 0;
		flags["ROO_GASMED"] = 0;
		flags["ROO_CREDIT_OVERALL"] = 0;
		flags["ROO_CREDITS_DAILY"] = 0;
		flags["ROO_SEXED"] = 0;

		output("You’re here to gamble, not loiter! " + (!pc.isTaur() ? "You plant your butt on that free chair to the freckled dealer’s leftmost side":"You move the chair away and kneel down in its place to the freckled dealer’s leftmost side") + ", catching the tail end of a game on a shell-shaped hardlight table. The word ‘BUST!’ blares coldly and digital chips fall down the virtual hole in front of all but one of the four players, while the winner’s partition jingles in fiscal triumph.");
		output("\n\n<i>“Aww, better luck next time!”</i> the canary-voiced dealer bounces her head left and right, gathering the cards and shuffling the deck all over. You note the white fur on her briskly moving arms, curious if she must be half-laquine with those floppy ears. <i>“And hello to you, " + pc.mfn("handsome","cutie","cutie") + "! Don’t be shy now!”</i>");
		output("\n\nPlaying cards of decidedly traditional origins are flicked to the other players by agile fingers. <i>“My name’s Roo!”</i> she declares in a near-whistle, winking at you, laying one card face down on her side with a tiny flourish. <i>“And I’ll be your blackjack dealer for today, and hopefully every day!”</i> The attention she hits you with is mildly embarrassing; it’s enough to make you forget the kind of crowd you’re surrounded by. <i>“Or I could be! Are you playing, sweetie?”</i>");
		output("\n\nAs the bouncer explained, credits are to be presented up front... though you don’t quite know how to do that. At least until you look at what everyone else has done. Devices similar to your codex or plain chits have been slotted into ports on the table, their displayed balances increasing or decreasing with success or failure.");
		output("\n\nIn the seconds it took for you to make that discovery, another round has just played out. Roo sings praises and wishes the losers a shift in fortune. You pull out a loaded credit chit and glance at the cat-tailed dealer- wait, cat tails? So she’s a kaithrit then! That explains the feline’s fancy moves!");
		output("\n\n<i>“Ah, first time in Treasure Nova?”</i> the genial kitty-rabbit perks up again, sensing your confusion. <i>“The rules are pretty simple if I says so myself!”</i> she flicks out one card to each player in a mere second. <i>“Just plug in your money, tell me your bet, and we’ll start playing! No forfeits, though! Hopefully Colis or Alphonse told you that.”</i> Another card swicks. <i>“Minimum bets are 500 credits, maximum bets 5000,”</i> another, <i>“and if you win a lot, <b>you’ll start earning some super special VIP prizes!</b>”</i> The deep heat in her tone raises an eyebrow. <i>“Haven’t had to give out any lately believe it or not! Luck’s just not been on anyone’s side, sadly...”</i>");
		output("\n\n‘<i>Swick.</i>’ <i>“But that’s all there is to it!”</i> she announces gaily, flattening an upright card next to her face-down ‘hole’ card with avid diligence. Deck still in hand, her apple cat’s eyes are centered on you. <i>“Shall we play?”</i>");
		processTime(5);
	}
	// Repeat Time
	else if(flags["ROO_HIGHEST_STRIP_LEVEL"] < 1)
	{
		output("<i>“Hiya, ");
		if(flags["MET_ROO"] != 2) output(pc.mfn("handsome","cutie","cutie"));
		else output("[pc.name]");
		output("!”</i> Roo chimes on your approach, flicking her eyes meaningfully to the free seat. <i>“Come to play a game of blackjack? Just slot in some money and let’s see where the cards lay!”</i>");
		output("\n\nAll her movements encourage you to sit before you’ve even though about it. You have to admit, her quickness-under-concentration is something else.\n");
		processTime(1);
		winningsDisplay();
	}
	// Repeat Time (Got her to strip in a day)
	else if(flags["ROO_GASMED"] == 0)
	{
		output("<i>“Ah! There you are, [pc.name]! Come to see if you can win everything off me");
		output("?”</i> the blackjack-bunny asks, cupping her shapely tits together. Roo’s inner exhibitionist is even more blatant than her plush boobs. <i>“Pull up a seat and let’s keep going! You want to see everything under, riiiight?”</i>");
		output("\n\nPossibly.\n");
		processTime(1);
		winningsDisplay();
	}
	// Repeat Time (Gamegasm’d her 1 time)
	else if(flags["ROO_GASMED"] < 3)
	{
		output("<i>“Ohh, yes, there you are! Welcome back, [pc.name]!”</i> Roo giggles with demure glee, waving in the same motion she gives herself a card. <i>“Will you be playing again today? I’ve marked your seat as VIP-only, you know! I get to decide who sits there, and you’re the only one I think deserves it!”</i> Her two tails click cutely, forming a small heart-shape behind her back. <i>“Maybe you’d like to see what else is on offer, hmm?”</i>");
		output("\n\nYou could find the time.\n");
		processTime(1);
		winningsDisplay();
	}
	// Repeat Time (Gamegasm’d her 3 times)
	else if(flags["ROO_GASMED"] < 10)
	{
		output("Roo’s whole body squirms sluttily. In a burst of speed she delivers every card to the table before slamming the deck down and cocking herself aggressively to show you as many curves as possible while seated. <i>“[pc.name]! I’m glad you’re here. Shall we play again? Perhaps you want to try for the ultimate reward, mmmm?”</i>");
		output("\n\nHer coquettish feline eyes are pursed, and her rabbity lips are set to full pout mode. Maybe you will!\n");
		processTime(1);
		winningsDisplay();
	}
	// Repeat Time (Gamegasm’d her 10 times)
	else
	{
		output("<i>“[pc.name], [pc.name]!”</i> Roo squeals, hopping up from the table and fist pumping high into the air. The modded kaithrit forms a heart shape with her snowy hands, and her talented tails swirl around her waist to form a similarly affectionate gesture. <i>“Come on, let’s have another game! Just seeing you is enough to know that lady luck has also smiled on me!”</i>");
		output("\n\nAre you in for another game?\n");
		processTime(1);
		winningsDisplay();
	}
	//[Play] [Appearance] [Leave]
	rooMenu();
}

public function winningsDisplay():void
{
	if(flags["ROO_CREDITS_DAILY"] > 0) output("\n<b>Win Streak:</b> " + flags["ROO_CREDITS_DAILY"] + " credits.");
	output("\n<b>Overall Winnings:</b> " + flags["ROO_CREDIT_OVERALL"] + " credits.");
}

public function rooMenu(inGames:Boolean = false):void
{
	clearMenu();
	var playText:String = "Join the game, and win some cash!";
	if(flags["ROO_HIGHEST_STRIP_LEVEL"] > 0) 
	{
		playText += " And while you’re at it, see if you can’t get Roo to strip " + (flags["ROO_GASMED"] == 0 ? "naked":"down until she cums her brains out") + "!";
	}
	addButton(0,"Play",gamblingThymesWivRoocipher,undefined,"Play",playText);
	//if(inGames) 
	addButton(1,"Appearance",rooAppearance,undefined,"Appearance","The decorations here are nice and all, but this lady deserves a thorough inspection!");
	if(flags["ROO_TALK_CD"] == 0) addButton(2,"Talk",talkToRoo,undefined,"Take the downtime to ask Roo a personal question - you’ll have to play another hand to keep things moving, though!")
	else addDisabledButton(2,"Talk","Talk","You’re at the apex of the game, now’s not the time for talking!");
	addButton(14,"Leave",leaveRooBehind,undefined,"Leave",(flags["ROO_GAMED_TODAY"] != undefined ? "You’ve played long enough, time to move on.":"This isn’t for you."));
}

//[Play]
// Tooltip: Join the game, and win some cash! {seenRooStrip: And while you’re at it, see if you can’t get Roo to strip {naked /seenGamegasmOnce: down until she cums her brains out}!}
// Roo stripping spikes PC lust randomly.
// PC inputs a bet every play, 500 to 2500 credits. Maybe have a [Repeat] button for convenience?
// Whenever Roo strips, the player can continue to play, or leave. They can also [Talk] to her, asking one question. Doing so continues the game automatically.

public function gamblingThymesWivRoocipher():void
{
	clearOutput();
	showRoo();
	author("William");
	// First Time
	
	// Input Bet, 500 min, 2500 max, and go to Blackjack Game
	// Following text takes place between hands, allowing the player to continue betting, talk to Roo, or pack up and leave.
	flags["BLACKJACK_WIN"] = pcWinsVsRoocipher;
	flags["BLACKJACK_LOSE"] = rooKickedYerAssholeOutYourTeeth;
	flags["BLACKJACK_TIE"] = blackjackTie;
	flags["BLACKJACK_DEALER"] = 1;
	flags["BLACKJACK_DEALER_SHOWN"] = undefined;
	flags["BLACKJACK_BET"] = 0;
	IncrementFlag("ROO_GAMES_PLAYED");
	//Disable talking till she strips
	flags["ROO_TALK_CD"] = 1;
	flags["ROO_GAMED_TODAY"] = 1;
	startBlackjack();
}

// Player lost hand!
public function rooKickedYerAssholeOutYourTeeth():void
{
	clearOutput();
	showRoo();
	author("William");
	pc.credits -= flags["BLACKJACK_BET"];
	flags["ROO_CREDITS_DAILY"] -= flags["BLACKJACK_BET"];
	//Can't go negative
	if(flags["ROO_CREDITS_DAILY"] < 0) flags["ROO_CREDITS_DAILY"] = 0;
	flags["ROO_CREDIT_OVERALL"] -= flags["BLACKJACK_BET"];
	flags["BLACKJACK_DEALER_SHOWN"] = undefined;
	flags["BLACKJACK_BET"] = 0;
	flags["BLACKJACK_STANDING"] = undefined;
	IncrementFlag("ROO_LOSSES");

	output("Roo’s voice is the only one not cackling or jeering when your slice of the table glowers in defeat. ");
	if(pc.isAss()) output("The way it rubs your nose in it makes you want to slam your fist on it, or the person who designed it. ");
	output("<i>“Unfortunately, it was not to be");
	if(flags["MET_ROO"] == 2) output(", [pc.name]");
	output("!”</i> she starts, collecting the cards and shuffling the deck. <i>“Will you try again? Luck may be fickle, but I know you can turn this around!”</i>\n");
	winningsDisplay();
	processTime(3);
	
	rooMenu();
}

public function rooStrips(amount:Number):void
{
	flags["ROO_STRIP_LEVEL"] = amount;
	if(amount > flags["ROO_HIGHEST_STRIP_LEVEL"]) flags["ROO_HIGHEST_STRIP_LEVEL"] = amount;
}

public function pcWinsVsRoocipher():void
{
	clearOutput()
	author("William");

	var bet:Number = flags["BLACKJACK_BET"];
	flags["BLACKJACK_BET"] = 0;

	pc.credits += bet;
	flags["BLACKJACK_DEALER_SHOWN"] = undefined;
	flags["BLACKJACK_STANDING"] = undefined;
	flags["ROO_CREDITS_DAILY"] += bet;
	flags["ROO_CREDIT_OVERALL"] += bet;
	flags["BLACKJACK_DEALER_SHOWN"] = undefined;
	flags["BLACKJACK_STANDING"] = undefined;
	IncrementFlag("ROO_WINS");
	//Reset talk CD if stripping time
	if((flags["ROO_STRIP_LEVEL"]+1) * 5000 <= flags["ROO_CREDITS_DAILY"]) flags["ROO_TALK_CD"] = 0;

	// Player won hand! No stripping.
	if((flags["ROO_STRIP_LEVEL"]+1) * 5000 > flags["ROO_CREDITS_DAILY"])
	{
		showRoo();
		output("<i>“Congratulations!”</i> Roo chimes, gathering and shuffling the cards at inhuman speed, your side of the table exploding with monetary achievement. <i>“A deserved win" + (flags["MET_ROO"] == 2 ? ", [pc.name]":"") + "! Will you be playing again, sweetie? " + (RandomInCollection(["Luck is on your side, there’s no doubt!","Lady luck has her hand on your shoulder, of that I am certain!","It’s always worth it to capitalize on good fortune!"])) + "”</i>");
		output("\n\nSo she says, but what seems like a potential windfall can just as easily be a short-lived fluke. Play again?\n");
		winningsDisplay();
		processTime(2);
		rooMenu();
	}
	//[Player won, Roo strips! (Jacket)]
	else if((flags["ROO_STRIP_LEVEL"]+1) * 5000 <= flags["ROO_CREDITS_DAILY"] && flags["ROO_STRIP_LEVEL"] == 0)
	{
		// First Time
		if(flags["ROO_HIGHEST_STRIP_LEVEL"] == 0 || flags["ROO_HIGHEST_STRIP_LEVEL"] == undefined)
		{
			output("<i>“Oh my!”</i> Roo claps her hands together, face reddening. She says nothing in the time it takes for the system to pay out your winnings and for one of your fellow players to disband. Something appears in her side of the table, a flash of green not as obscene as what you’ve been bombarded with.");
			output("\n\nAll of a sudden, the bunny-cat stands up, capturing the attention of you and the other three players. She leans forward, a low moan fluttering across her sparkly lips. In a warmer voice she poses a question, <i>“What’s your name?”</i>");
			output("\n\nThe question’s directed to you. ");
			flags["MET_ROO"] = 2;
			if(pc.isBimbo()) output("<i>“[pc.name]!”</i> you gleam, waving cutely.");
			else if(pc.isBro()) output("<i>“[pc.name],”</i> you grunt, gazing blatantly at her hefty boobs.");
			else if(pc.isNice()) output("<i>“[pc.name],”</i> you say, finding it hard to maintain eye contact when she’s thrusting her chest out.");
			else if(pc.isMischievous()) output("<i>“Ste-”</i> you stop yourself from making a corny joke, letting your response trail out in the direction of her cupped cleavage, <i>“[pc.name]...”</i>");
			else output("<i>“[pc.name],”</i> you flatly reply, arching one eyebrow.");
			if(InCollection(pc.short,["Syl","Sylvestra","Fenoxo","William","Savin","Bowsette"])) output("\n\n<i>“Ohh, that name sounds really familiar. Well, you’re in appropriately lewd company, hun!”</i>");
			else output("\n\n<i>“What a pretty name!”</i>");
			output(" Roo says, both hands moving for her front. <i>“You see, [pc.name], when <b>terrific fortune</b> favors my players, I’m obligated to grant them their VIP rewards!”</i>");
			output("\n\nShe pops the buttons of her open-chest jacket in sequence, and her cleavage-defining top crumples, driven outwards by breasts too big for it. A ");
			if(pc.hasCock()) output("cock-tickling ");
			else if(pc.hasVagina()) output("clit-drumming ");
			output("moan of exquisite relief flows from her pillowy lips as she lobs you your fragrant reward - you easily snatch it before it lands on your head.");
			output("\n\nWhen you refocus on her, Roo is striking a sexy pose that draws surrounding eyes to her oh-so squeezable tits, still criminally hidden behind a plain gray shirt. Plush, hand-filling boobs wear that troublesome cloth like a weightless feather that could just <i>slip</i> away on a breeze, displaying their luxurious goodness for all to see. Jiggling them exclusively in your direction, she asks, <i>“So, think you can win the rest?”</i>");
			output("\n\nYou blink rapidly - twice in less than a second; a twinge of arousal strikes your crotch like an erotic lightning bolt, slightly enhanced by the smell of her fruit-scented attire.");
			if(pc.libido() < 33) output(" If your prize for winning is seeing her naked... what’s the harm in continuing?");
			else if(pc.libido() < 66) output(" This game just got a lot sexier! Now you <i>have</i> to keep playing!");
			else output(" Holy shit, do you get to keep the clothes too? You <i>have</i> to find out, you <i>have</i> to keep winning!");
			output("\n\nBetter set it aside for now...");
			pc.changeLust(5);
		}
		// Repeat (lewdness minimum <=3 gamegasms)
		else if(flags["ROO_GASMED"] <= 3)
		{
			output("<i>“Ooh, wonderful!”</i> Roo cheers, jumping up. One of the other players leaves, perhaps tired of losing. <i>“Congratulations, [pc.mister] [pc.name]! I knew you were a shrewd player and... ah, let’s get you your reward!”</i>");
			output("\n\nHer too-tight jacket, a chic symbol of formality and professionalism, is coming off. Dainty hands close in on gold buttons, twisting and sliding them through clear-cut fabric slots. With each unfastening her quality bosom presses heavier on her uniform, accelerating the process and threatening to rip the last two from their strings. Sumptuous breasts, relieved of the weight pushing them up, tear her tucked shirt out from her belted skirt.");
			output("\n\nLike before, she tosses you the item, laughing as your nostrils flare to better inhale that lung-pleasing fragrance.");
			output("\n\nRoo dances left and right, expressing relief and enjoyment at her titillating liberation. Her big and bouncy boobs are flaunted so temptingly that you feel getting thrown out for a single touch might be worth it... to some people. Focusing on the game is going to get a lot harder with those sweater puppies flopping around though, especially under a shirt so light it’s like a glorified cloth obscuring the view...");
			pc.changeLust(6);
		}
		// Repeat (lewdness intensifies 4-9 gamegasms)
		else if(flags["ROO_GASMED"] < 10)
		{
			output("<i>“You deserve more than a simple applause, [pc.name]!”</i> the kitty-rabbit laughs as your digital balance ticks up. One of her players vanished at some point, taking their earnings with them. Regardless, you know the real prize of this victorious hand!");
			output("\n\nRoo stands abruptly, cat tails thrusting out, prurient eagerness fueling her muscles. A splash of red colors her sultry face, keeping you attentive");
			if(pc.hasGenitals())
			{
				output(" while your ");
				if(pc.hasCock()) output("[pc.cocksLight]" + (pc.isHerm() ? " and [pc.clits]":"") + " respond" + ((pc.cockTotal()+pc.totalClits() == 1) ? "s":"") + " dutifully" + (!pc.isCrotchExposed() ? ", stretching against your [pc.crotchCoverUnder]":""));
				else if(pc.hasVagina()) output("[pc.clits] bulge " + (pc.isCrotchExposed() ? "outward":"against your [pc.crotchCoverUnder]"));
			}
			output(".");
			output("\n\nShe doesn’t even reach for her buttons, opting to rip the top of her jacket down and let her " + (pc.hasCock() ? "boner-building":"arousal-engorging") + " boobies flop out over the tight hem. A button snaps and pings off the table, " + (pc.RQ() < 50 ? "sailing past you like a rolling coin":"and you catch it on casual instinct") + ".");
			output("\n\n<i>“This is one of the reasons I <b>love</b> to see others enjoying themselves, it means I can too!”</i>");
			output("\n\nSure enough, Roo is <i>very</i> happy. You’re not sure how to quantify it, but the way she hops up and down, bouncing her well-endowed chest into the resistant seams of her jacket, you get the feeling she’s doing this not because she’s a lecher, but because she might like you! While you think the jacket-turned-corset would make a great look, especially with her tenting nipples protruding over the rim, she still undresses and flings you your temporary prize. Now her chest provides an endless source of temptation.");
			output("\n\nThe ruby-eyed dealer gives you a lovely little dance, thrusting her hips back and her chest forward, hooking a finger past the neckline and dragging down so that you might feast your eyes on stress-sedating fields of voluptuous kaithrit breast. That weightless gray shirt that cloaks her divine bosom has all the insignificance of tissue paper. It would be <i>so easy</i> to remove, to free her jiggle from solitary confinement!");
			output("\n\nBut, alas...");
			output("\n\nRadiating from the vestment’s inner lining is a strong, soothing, cherry-scented perfume, and it smells heavenly. It keeps your mind off the jealousy others begin to display, and the siren call of womanly bounty. <i>“Come on, [pc.name]! Let’s keep going!”</i> she exclaims.");
			pc.changeLust(7);
		}
		// Repeat (lewdness maximizes 10+ gamegasms)
		else
		{
			output("Roo’s intense passions manifested when you sat at this table. Here you are... winning again... there goes a player, too.");
			output("\n\nBut it’s not just about the money anymore, you don’t care so much about that now. It’s about what you’re doing for her, and what she’s doing for you. On her demure face is carnal expression, devotion to the show, dedication to you. Sure, you know how much she loves giving everyone something to look at, but what they aren’t seeing is what’s between you and her.");
			output("\n\nThey don’t see her willingness to gladden you, to take your mind off the stresses of your surroundings, your goals, all to bask in her buoyant radiance.");
			output("\n\nRed lips open and inhale sharply; Roo slips her arms through the sleeves of her burgundy jacket. To a distant eye she’d be limbless, but it lasts only a second; there’s a bulge of her knuckles against the material and a sudden thrust of force.");
			output("\n\nHer uppermost clothing splits apart and the flung buttons launch into uncertainty, pinging off heads and tables. The cherry-scented wind produced by the act gently breezes " + (!pc.hasHair() ? "across your scalp":"through your [pc.hairColor] [pc.hairs]") + "; an expansive smile brightens your slowly blushing [pc.face] watching her breasts flop in opposite directions below the shirt. Hefting the torn garment, Roo throws it to the side, gazing at you longingly, directing her very essence to you.");
			output("\n\nSupple boobs blithely cupped captivate every titgazing gambler. Her shirt is always the same tantalizing vestment, creasing to the waves of her rippling chest. Even while she performs a little dance, hopping to the left, curving to the right, playing with her magnificent mammaries, you spot her once or twice close to breaking her the rules, close to giving you a double-presentation instead of the usual peek past the neckline into her purr-rattled breasts.");
			output("\n\nYou’re tranquilized by their anxiety-quelling quaverings, but mildly frustrated when the show ends. An exhilarated coo slips out of Roo’s lips when she sits, reassuming her role. <i>“[pc.name],”</i> her eyes close, <i>“another round?”</i>");
			pc.changeLust(8);
		}
		processTime(4);
		rooStrips(1);
		showRoo();
		rooMenu();
	}
	//[Player won, Roo strips! (Skirt)]
	else if((flags["ROO_STRIP_LEVEL"]+1) * 5000 <= flags["ROO_CREDITS_DAILY"] && flags["ROO_STRIP_LEVEL"] == 1)
	{
		// First Time
		if(flags["ROO_HIGHEST_STRIP_LEVEL"] < 2)
		{
			output("Another successful bout and your heart skips a beat. Another of your fellow players departs the table, your balance increases thanks to smart choice-making... and Roo stands again, taking one step back. <i>“Awesome work, [pc.name]!”</i> she grins. <i>“You’re a natural!”</i> Her thumbs wiggle past the wrap of her skirt, pulling the loop of cloth from her squishy hips.");
			output("\n\nThe kaithrit’s slender fingers dig through the hugging hem of her skirt in meticulous fashion, the lengths of her gemini tails racing circuits around her body. Roo’s candied thighs wiggle to and fro, tentative and sensual yet quick enough you don’t see the pleated garment’s buttons unclick, spilling her voluptuousness into plain view.");
			output("\n\n<i>“Ready or not!”</i> she giggles, flinging her skirt directly at your face with enough speed and surprise you can’t catch it. Your nose is struck by the residual pheromones hidden behind her satiny red panties, and now she looks less a dealer and more like a frat girl partying in the dorm.");
			output("\n\nHer hips aggressively cock and the springy plushness they’ve accumulated quivers attractively. More freckles can be seen around her flawless waistline, deepening in presence towards her ass. Her shoulders roll, and her chest bounces in rhythm; she seats herself, hurriedly shuffling the deck after that blithe and brazen conduct. <i>“You’re on a roll, [pc.name]!”</i>");
			output("\n\nFlirtatious as ever, she asks, <i>“Will it stay that way?”</i>");
			pc.changeLust(5);
		}
		// Repeat (lewdness minimum <=3 gamegasms)
		else if(flags["ROO_GASMED"] <= 3)
		{
			output("Cool and calculated, you’re relishing your latest gain as another patron slumps off after their latest bust. Roo stands, and the ruby red smile she flashes is powerful enough to make you blush. <i>“You’re a keen [pc.guyGirl], [pc.name]! And this is your next reward!”</i>");
			output("\n\nRoo’s lips purse into a cute pout; her child-bearing hips thrust forward, knocking the table and presenting her fashionable skirt. The kaithrit’s fleshy thighs sway to the left and smack to the right, keeping your eyes on her ripe curves and off the hip-squeezing garment that comes apart one button later and sails towards your [pc.face]. You catch the pleated article and set it near her jacket, eager to resume your inspection of the fanciful feline.");
			output("\n\nAn immodest professional, Roo begins with what seems like a lead-up to a lap dance and ends with her presenting her panty-covered butt to you, both white tails swimming into the shape of a cutesy heart around it. The whole crowd flinches and whistles when she lays a sharp smack on her apple-shaped buttocks.");
			if(pc.hasGenitals()) 
			{
				output(" The impact sends a powerful signal to your ");
				if(pc.hasCock()) output("[pc.cocks]");
				else if(pc.hasVagina()) output("[pc.clits]");
				output(", bidding your loins make ready.");
			}
			output("\n\nThe impish bunny-cat then plants it back in the seat and reshuffles the deck as if it never happened. <i>“You’re certainly destined for greatness, [pc.name]!”</i>");
			output("\n\nThat may just be true.");
			pc.changeLust(66);
		}
		// Repeat (lewdness intensifies 4-9 gamegasms)
		else if(flags["ROO_GASMED"] <= 9)
		{
			output("Money is won, the jury’s still out on fame... and yet, you start to contemplate if this game is really about the credits, what with this kaithrit always performing for you, always using new and more distinct maneuvers to pleasure you without touch.");
			output("\n\n<i>“Hmhm, as expected...”</i> Roo murmurs. A player pushes back from the table and without a word the lop-eared woman launches up from her seat on the command of the table.");
			output("\n\nRoo claps twice, locking her hands behind her head. Her immaculate form begins to sway to an invisible rhythm, a song that only she hears over the din. Pliable hips undulate from side to side, accentuating each willowy flow with a sharp jerk that presents the bunny-kitten as a bitch ready to be bred or a slut enticing her next one night stand.");
			output("\n\nAnd yet, from where you’re sitting, being the center of her salacious affections, it doesn’t seem like she’s exhibiting because she’s obligated. Is this what it’s like to be enchanted?");
			output("\n\nA single finger goes to her luscious lips; she gives a small pout and tiny kiss to the tip - her eyes are never far from yours. She twirls in place, sticking out her butt. The view you and the game watchers get is top credit. Her miniskirt is only small enough to hide the fattest mounds of handleable fecundity, and below the pleated garment are her satiny red panties with ribbony side-ties.");
			output("\n\nA show of hands and short hurrahs, everyone prays for her to do more. Considerate cat that she is, Roo’s apple-shaped bottom swirls and grinds - for your eyes only; she smacks it once on either cheek. The ripples are barely seen for her underwear");
			if(pc.hasGenitals())
			{
				output(", and your " + (pc.hasCock() ? "[pc.cockNoun]":"[pc.clit]") + " jumps to projected stimulation that woefully ends when she unsnaps the inveigling article.");
			}
			else output(", and the projected stimulation woefully ends when she unsnaps the inveigling article.");
			output("\n\nYou catch her skirt and stare at it, sensing the faintness of ladyscent. In your beating heart, you feel like she was right there on you the whole time.");
			output("\n\n<i>“Oh, [pc.name],”</i> Roo titters, <i>“you know how to rejuvenate a game! I’ll need to order you another drink soon!”</i>");
			pc.changeLust(7);
		}
		// Repeat (lewdness maximizes 10+ gamegasms)
		else
		{
			output("Staring into Roo’s flickering eyes strengthens a tightness in your chest. A fire burns warm behind her trembling pupils in her moistening irises. The second player departs with their final total, merely being your next step to seeing Roo uncovered.");
			output("\n\nThe casino’s mercurial lighting neither enhances nor dims the indefatigable passion stoked by your repeated wins, but they have brought her emotions into focus. You enable her, and she in turn stirs your desire. You watch unflinchingly, not a soul nor sound able to turn you away from her glory as a heat swells in your cheeks, reddening you to her color.");
			output("\n\nLike before she stands abruptly, barely containing her want for you, your happiness, your pleasure. In her lewd perambulations she does everything possible to sustain your interest in her, groping wildly at her body, biting her lip, pinching a painfully erect nipple through the fabric. Furry hands swim across a vast rump atop the skirt covering it, before digging angrily into it and tearing it off and dropping it to the side, exposing her shapely bottom to you in one quick motion.");
			output("\n\nSaliva-sparkling lips form a moaning ‘O’ shape; Roo leans over the table on the verge of crawling across, seating herself in your lap, and unleashing her suppressed cravings. Frisky white tails gyrate wildly, settling on wrapping around her whenever they feel the need to clench. She drags backwards, her yielding and malleable tits contouring to every obstacle in their way, so sensitive that she could be mistaken for a victim of Dumbfuck.");//nice~
			output("\n\nHer once-professional mien has been replaced with covetous cupidity. Even when she turns her back to shake her ass, she is always locked to you, watching for the twinkles in your [pc.eyes], the slow blinks you give, the tiny shudders on your mouth. You stare enraptured at her panty-covered ass, counting the freckles on either side. The ripples fanning through her copious squish, over and around the ribboned side-ties of her panties, never fail to make your mouth water.");
			output("\n\n<i>“Ahh, [pc.name],”</i> Roo hums, <i>“it’s never a bad day when you’re here. Luck in [pc.raceShort] form! Are we to play again?”</i> There’s a transient glower that passes across her face. Three words form on her pretty lips: <i>claim your prize.</i>");
			pc.changeLust(8);
		}
		processTime(5);
		rooStrips(2);
		showRoo();
		rooMenu();
	}
	//[Player won, Roo strips! (Shirt)]
	else if((flags["ROO_STRIP_LEVEL"]+1) * 5000 <= flags["ROO_CREDITS_DAILY"] && flags["ROO_STRIP_LEVEL"] == 2)
	{
		// First Time
		if(flags["ROO_HIGHEST_STRIP_LEVEL"] < 3)
		{
			output("Your hot streak continues unchallenged. None of the other players have come close to your winnings. The third stands as if to leave, but instead sticks around to watch. He, and plenty of others who’ve gathered, aren’t about to miss what’s coming.");
			output("\n\n<i>“My goodness!”</i> the floppy kaithrit puffs, <i>“it’s been too long without a winner like you, [pc.name]!”</i> Roo chirps, arms crisscrossing. You inhale, a hugely goofy smile on your [pc.face]. You’d have to be the densest [pc.raceShort] in the galaxy to not see what part of her midriff those delicate fingers are interested in.");
			output("\n\nEnough people have gathered that a few members of security are present, likely protecting their staff. The oppressive shadows of a dozen horny freebooters encircling you would be worrying if not for the pearl in the middle. <i>Two pearls, even!</i> <i>“Here we go!”</i> Roo hums, upending her shirt in spontaneous motion.");
			output("\n\nWhen your brain clarifies her new state of undress, taking your eyes off Roo’s exposed bosom is impossible - your attention is dominated by her gorgeous tits. Nipples as large as bubblegum wads shine, fully erect and begging to be tweaked. The kaithrit does so, tugging her luscious bust in solid gropes, throwing her head back with a lustful cry. It’s not hot enough in here to sweat, but her sublime teats glisten. You see why: there’s a burgundy blush of shameless arousal budding in her soft cleavage.");
			output("\n\nSitting again, the table acts as the perfect boobshelf. The rabbit’s rounded tits are set high with little sag and no end of wanton jiggle. <i>“This is the most rousing game I’ve had this month! Oh, [pc.name], you must make it one to remember,”</i> she flicks you a card, <i>“for both of us!”</i>");
			output("\n\nYou’re not sure why, but the desire to keep playing has been <i>bolstered...</i>");
			pc.changeLust(5);
		}
		// Repeat (lewdness minimum <=3 gamegasms)
		else if(flags["ROO_GASMED"] <= 3)
		{
			output("<i>“Ah, hell with it.”</i> The third player at the table stands frustrated, but she sticks around to watch the show.");
			output("\n\nNot hard to figure out why when you see Roo stand, crimson eyes twinkling merrily. <i>“[pc.name]! You’re going far, keep up the good work! And keep your eyes on me, okay? This’ll boost your luck!”</i>");
			output("\n\nYou’re not sure about that, but it <i>is</i> boosting a few things! The audience");
			if(pc.hasGenitals()) output(", your " + (pc.hasCock() ? "[pc.cocksLight]":"[pc.clits]") + ",");
			output(" and the security presence!");
			output("\n\nThe gray shirt concealing the bunny-cat’s heaving breasts is thrown into the air; it floats down in your direction. Roo grabs her breasts in both delicate hands, squeezing hard enough it looks painful, letting her catspaws vanish into silky smooth skin. Her fur comes into view when she leans forward, squeezing towards her nipples enthusiastically. You half expect milk to squirt out, but all that swells atop her heavenly bosom is a russet-colored blush that fascinates you, arouses you, and most importantly, locks your sight to her.");
			output("\n\n<i>“Mmmh!”</i> Roo strikes another pose, thrusting her chest out, pink teats jutting powerfully. Her lush scent wafts your way. It’s a hedonistic spectacle that you aren’t motivated to look away from until she deals you another hand.");
			output("\n\n<i>“You aren’t going to leave a lady like this, are you?”</i>");
			output("\n\nYou’re not, right?");
			pc.changeLust(6);
		}
		// Repeat (lewdness intensifies 4-9 gamegasms)
		else if(flags["ROO_GASMED"] <= 10)
		{
			output("For anyone else, winning this much money would be a life changing (or life <i>saving</i>) event. But in your case it doesn’t have the same luster. It’s not that which you’ve won. It’s not the things you’ve enabled yourself to buy. It’s Roo’s veneration - her services outweigh the effect of cold, digital credits, and she’s to play it out all over again.");
			output("\n\nBefore she even touches her tits, Roo bites her lower lip, pivots forward, and gives an uncharacteristically husky moan. The casino quiets when she pulls on the neck of her shirt and tugs downward; ample lapine-feline breasts spill over the top accompanied by a faint crack of splitting fabric. Pink nipples harden when lacquered by wolf whistles; nimble white fingers sink into champagne-colored boobflesh as if part of the scenery, never to be found again.");
			output("\n\nShe twirls to the left, and to the right, expressing the light cover over her head when her back is to you. When Roo turns again, one arm cupping the marshmallow undersides, she seems to shine brighter than the decor.");
			output("\n\nFor a brief second your eyes drag up from her magical tits to her lustfully composed face. Unblinkingly and unthinkingly she smushes her slowly rocking plushness together, making it look even bigger. Her bosom recaptures your attention, and your sight is guided back down. That exquisite and healthy chest bounces around like mad when she hops. On the subtlest movements, airy caresses fan through her wanton cushions; her mouth parts in bliss and her rubies roll back, almost going vacant from brazen ecstasy.");
			output("\n\n...You want to wrap your head in her cleavage. The increased security, however, dispels that notion. For now.");
			output("\n\nThroaty purrs emerge from her lips. Even though you’re totally surrounded by people watching a skank at her job, it’s... it’s more than that. <i>“Ahh, [pc.name]...”</i> Roo murmurs, winking at her fans. <i>“I hope you feel what I feel right now.”</i>");
			output("\n\nFor a nervous second you wonder if this is a developing obsession, but the way she looks at you, the vermilion shape of her glimmering eyes... there’s an emotion in her broadcast that touches you on a personal level. What exactly is it that she hopes you feel? And why you? No doubt though, you’re aware of a uniquely pleasurable and satisfying feeling you struggle to identify, and it grows each time she ‘rewards’ you.");
			output("\n\nAnother card comes your way after the shirt, but you’re finding it difficult to keep your [pc.eyes] away from her bright pink nipples.");
			output("\n\nYou’ll have to keep winning, then. Walking away with your fortunes early is one end to the story, but if you want to understand her, then only by staying will you do so.");
			pc.changeLust(7);
		}
		// Repeat (lewdness maximizes 10+ gamegasms)
		else
		{
			output("<i>“Oh stars abound,”</i> Roo asks, hopping to her feet, pent-up emotion coruscating through her feline features. <i>“Is this really luck?”</i> Her bubbly cheeks raise, and her eyes curve into a matching smile to the one of her lips. <i>“Or is this fate?”</i> She looks down to you again, glowing hot with anticipation, bracing for what she’s about to do.");
			output("\n\nYour latest win hammers her will on the anvil, drives another player away. The remnants of her sophistication become a faint memory, and her face brightens. Instead of reaching for her waist, she reaches into the neckline of her shirt and <b><i>pulls</i></b> with all her might. The gray cloth tears down the middle like a lightning bolt, and the article falls to the side like a bird’s feather. Her amazing boobs jiggle appropriately, and she spreads her arms like an eagle in flight, loosing a feral moan that hints at inner roiling ardor.");
			output("\n\n<i>“[pc.name]!”</i> she giggles, pinching and twisting her nipples to provoke another groan of delight. She lurches forward and arches back, throwing her tits in every direction. Hands behind her back, she swivels to the left and right, spicing up her act as if she were an animal in distress.");
			output("\n\n<i>All for you</i> says her sight, and she firms her palms to the undersides of her rapturous chest. You follow her nipples, sensing the steady increase of your heartbeat, ruminating on Roo’s sublime form and the galaxy as you know it: is it only inhabited by you and this gorgeous creature? Is she really just a kaithrit? Just some pirate’s servant? Is the way she handles her chest to arouse you nothing but a dream?");
			output("\n\nHer bosom is a feast for anyone’s hands, and you don’t think there exists a palm of the right dimensions that could perfectly fit to and worship them. From the way Roo is moaning now, she sounds like she wants you there, smothered in silky soft tit, warmed in the hearth of her life-giving breast.");
			output("\n\nMore security shows up for her safety... probably yours too. A large crowd of boob-gazers follows.");
			output("\n\nThe air around you smells more like her as the seconds pass, but you can’t see her groin - she’s sat down, grasping, no, fumbling for her cards. Her voice buds at the back of her mouth, locked away by pursed lips. There’s only one person between you and her, your real prize.");
			output("\n\nWill you reach out?");
			pc.changeLust(8);
		}
		processTime(5);
		rooStrips(3);
		showRoo();
		rooMenu();
	}
	//[Player won, Roo strips! (Panties)]
	else if((flags["ROO_STRIP_LEVEL"]+1) * 5000 <= flags["ROO_CREDITS_DAILY"] && flags["ROO_STRIP_LEVEL"] == 3)
	{
		// First Time
		if(flags["ROO_HIGHEST_STRIP_LEVEL"] < 4)
		{
			output("This feeling of being unstoppable is inevitable in a game like this, especially when you’ve made it past the house’s milestones. You ask yourself how you’ll best spend the windfall you’ve accrued in this game of chance...");
			output("\n\nBut your fiscal speculations end soon enough. Right now, the money doesn’t matter nearly as much as the final prize. The last player next to you joins the large crowd gathered, every pair of eyes on nearly-naked Roo.");
			output("\n\nMesmeric mammaries wobbling, she stands up to a dozen catcalls, showboating for her audience... but it’s all for <i>your benefit.</i> This is what <i>you</i> made possible. <i>“[pc.name], your luck is truly dazzling! And to sufficiently honor it, there’s only one thing I can do now!”</i> You don’t even notice yourself leaning forward to get that much closer to the big reveal.");
			output("\n\nAll she’s wearing now are <i>her panties.</i>");
			output("\n\nThis is the first time you’ve seen Roo panting. All of her major erogenous zones have flushed a deep ruby red, same hue as her lips. In front of all these people she is at her most aroused, but while you watch her, she only watches <i>you.</i> A single droplet of sweat beads on your neck following her fingers as they hook gracefully into her red, side-tied panties, unknotting the strings with gradual pressure.");
			output("\n\nThe fabric cords unwind, easing out of their depression in her plump thighs, and like a feather they slip away to a round of applause. Now, everyone is looking at you, congratulating you for undressing this sluttily presenting woman through your profitable success. Well, more like they’re thanking you for giving them all something to rally around.");
			output("\n\n<i>“You deserve it, [pc.name]! You terrific [pc.raceCuteShort], you!”</i> She spreads the garment in your direction, presenting the undergarment before gesturing expansively in circular motions, as if drawing back the curtain on her cunt. The gathered pirates and mercs are snapping holopics, naturally.");
			output("\n\nRoo’s pussy is a beautiful, supple, and pleasingly moist affair. Her vulva is pumped outwards into two wanton slopes, sure to hug tight anything that would savor its sensitive skin. It looks almost virginal in presentation, but that doesn’t come as much of a surprise. Kaithrit pussies are simply pretty, owing their reproductive beauty to genetically impeccable, unspoiled textures.");
			output("\n\nAnd... wait, you’ve only just now noticed that part of her thighs aren’t actually thighs, but bands of some sort. Some kind of stripping on her right leg blends in perfectly with her flesh, and a web of imperceptible wires are threading into her nethers. Several boxes are held in place... vibrators? Receivers? It’s no surprise you hadn’t spotted them before, they’re tiny, and obscured easily by buxom skin.");
			output("\n\n<i>“This is a special moment, [pc.name],”</i> Roo seats herself on her underwear, <i>“you have earned well today, but the game is not over juuuuust yet! If you can continue your winning streak, you will earn the greatest prize of all: you’ll get a <b>jackpot!</b>”</i> Her voice comes out in heated moans, and she trembles in bottled excitement. <i>“Will you rise to the occasion?”</i>");
			output("\n\n" + (pc.hasCock() ? "Something between your legs is rising to the occasion, that’s for sure... but y":"Y") + "ou almost wonder if refusal is an option. <i>What is going to happen if you reach that peak?</i>");
			pc.changeLust(5);
		}
		// Repeat (lewdness minimum <=3 gamegasms)
		else if(flags["ROO_GASMED"] <= 3)
		{
			output("<i>“I’m so impressed, [pc.name]! You’ve come this far again, and it feels like none of my rewards are worthy of your cunning!”</i>");
			output("\n\nComing from anyone else, Roo’s praises would seem odd, but there’s not a note in her sprightly vocals that betrays her sincerity. The last player has already stood up, done wasting their money, more interested in seeing you climb to the top.");
			output("\n\nBeing at the top certainly has its advantages too... like seeing a certain kaithrit dealer about to bare her all.");
			output("\n\nRoo’s panty-straps cling tight enough that the flesh of her breedable hips spreads over the strings like a soft muffin. Two fingers on either side wiggle past the knotted side-ties, pushing outwards and unraveling the garment with kittenish pressure. She bites her lower lip tastefully, loosing a long, lustful cry when she tears it off in one quick motion. With little restraint and absolutely no shame, Roo presents her panties to you in their lust-glossened glory, and a thunderous applause and cheer breaks out in your honor.");
			output("\n\nA growing lump in your throat threatens to close off air for good; so intently do you watch the enthusiastic kaithrit exhibit her pure-looking, dribbling pussy to you, gently parting the engorged, sloped labia, that the amount of restraint being shown in this room right now is worthy of a few grand prizes. The sensitive skin shines with accumulating arousal, and there’s almost no resistance when she slides a finger between the lips, dipping into her sheathing honeypot, shifting the wires of her cleverly-hidden vibes around.");
			output("\n\nHer body jerks upwards while she slides another finger in, coming away with strands of femme cum clinging to her digits; Roo groans, her thighs quivering, silencing her unsteady voice with a taste of secreted bliss. The kitten preens herself a little too long, delighting in what must be a fantastic taste to go with a promising, scintillating scent. Soon enough, she seats herself, visibly horny" + (pc.hasCock() ? " and looking ready to take your painfully erect [pc.cockBiggestNoun]":"") +".");
			output("\n\n<i>“[pc.name], allow me to shuffle this deck, and let us all to bear witness to your final victory! You can do it!”</i> Roo’s fists pump and her pussyscent thickens, threatening to make this area reek with her womanly musk.");
			output("\n\nMore than that, you can see an incredible thrill running through her like a soft wave. After what happened last time she must be <i>expecting</i> you to win...");
			pc.changeLust(6);
		}
		// Repeat (lewdness intensifies 4-9 gamegasms)
		else if(flags["ROO_GASMED"] <= 10)
		{
			output("Your length of success isn’t about the money, is it? What’s going on in front of you is worth more than the credits you’ve hustled from the illicit gambling den.");
			output("\n\nInterwoven side-ties hold Roo’s lustrously smooth panties in place. The sleek strings press obstinately into her flesh to perform their duty, and the folds of her hips sandwich them like two fine-baked buns. She spins around on her clawed toes, bending low to present you with the fullness of her amazing ass. You don’t even see her fingers digging into the cords, undoing the two knots that preserve her last remnant of dignity with gentle pushes.");
			output("\n\nAn applause that’s muted to your [pc.ears] breaks out when Roo removes the garment, twirling around, standing on one leg, bending the other backward, and holds the glossy pussycloth up by the end of its line. A steady flow of fem-cum drips down her thighs, past the wires of her high-quality vibrators.");
			output("\n\nSoftly inhaling, she thrusts her crotch forward, a few beads of femcream swatting off to the table. Wherever your eyes seem to look, once to her fat clit, then to her chubby folds, then to her navel, Roo’s fingers follow expertly, performing an arousing show of self-stimulation on the transient feature of your desires. Are you captive to her, or is she captive to you?");
			output("\n\nShe slides a finger inside the pristine walls of her tender twat, artfully pumping to the knuckle one, two, three, all four of her fingers. For a second her countenance shatters, drool streams down her chin, and her air-sucking gasps are, in their own way, beautiful. She’s working to give you a show without plunging into early orgasm.");
			output("\n\nPresenting her coated hand to you, she licks each digit clean before sitting on her panties. Her pink button was lubricated enough that it shone like a star, and it’s an image that you just can’t erase from your mind. It’s been imprinted on your mind, and anything resembling its tiny, throbbing shape hits you with a sudden, arousing urge. Even some of the cards are now affecting you.");
			output("\n\n<i>“[pc.name], I am so happy!”</i> Roo says, ready to play the final round. <i>“Please! I’m so close now, and I know you’re ready for this too!”</i>");
			output("\n\nYou can see it. Every card that she draws now, any one of them could seal your victory and crash her with another galaxy-quaking orgasm. It’s a pleasure you are certain she can’t adapt to.");
			output("\n\nFrom what you’ve seen, you hope she never does.");
			output("\n\nWatching her squirm to maintain her air of etiquette, struggling to fortify herself for something that she’s slowly learning may be a guarantee when you sit down...");
			output("\n\n<b>It’s up to you to put the ‘nova’ in <i>Treasure Nova...</i></b>");//Nice :3
			pc.changeLust(7);
		}
		// Repeat (lewdness maximizes 10+ gamegasms)
		else
		{
			output("Your credit total jingles, and the table’s cold, apathetic order to Roo flashes. From what you see in her eyes, this is the moment where all her dreams have flown. Her sweet, wine-colored eyes gently narrow. This time she stands slowly, and then, the kaithrit leaps up on to the table, looking down like a goddess given form.");
			output("\n\nShe only breaks sight to attend to the hundreds watching her, spreading her arms out and basking in their attention. Roo’s hips rise and fall in alternating lifts and dips, gingerly unwinding the knots with luxuriously smooth undulations. Against an imagined pole she grinds, maintaining perfect balance in her dance towards the climax, one that will be as thunderous as all before if her hidden toys have anything to say about it.");
			output("\n\nWithout announcement yet with great fanfare she tugs one string and her panties slip down to her feet, just inches away from you, presenting you the fullness of her rose-colored pussy, the large, lust-plumped lips slightly parted and sopping wet. Her fluids rain down on the table, flexed out with the spreading of her legs. Her fingers rest above the clit, index and pinkie spread; middle and ring stroking small blissful circles against her womb.");
			output("\n\nThrough the valley of her cleavage and past the radiant star of her clit, you meet her stare. Utter joy blooms and blossoms across her face, powerful enough to blur your eyes with awed tears. Her smile is a mix of matronly adoration and girlish love, but it’s not the point - her fingers firm into her crotch and she tugs back, giving you an even better view of her femininity in all its glory.");
			output("\n\nHer lube-lacquered gem sits throbbing at the apex of her enthusiastic slit. Where your sight wanders her hands follow, rubbing, fondling, cupping, worshiping herself as if commanded by telepathy. The touch of air to her womanhood soaks her fur in fresh fervence. Roo’s glistening button reflects almost every source of the Nova’s light - it is the star at the center of your receptive gaze. Its round shape is celestial in design, forming a system of desire that webs around your brain in sticky, femcum patterns.");
			output("\n\n<i>“You’re so close,”</i> she says softly, stepping back and hopping from the effluent-covered table. She handles her cards better than you’d think, like her clothes were all obstructing the true woman in front of you. <i>“I’m right here...”</i> she places her cards down, <i>“...will you have me again?”</i>");
			output("\n\nThings have quieted down, and at the very edge of your perceptive auditory range, you can hear the pounding in her chest. Her calm motions belie the cresting excitement within. You will win this. You can’t <i>not</i> win this.");
			output("\n\nRoo knows it’s going to happen. What she doesn’t know is <i>when</i> it will happen. But when it does, she’ll be reminded forevermore that you will <i>always</i> be her player one.");
			pc.changeLust(8);
		}
		processTime(5);
		rooStrips(4);
		showRoo();
		rooMenu();
	}
	//[Player won, Roo gamegasms!]
	// PC will have intoxication added each time - getting VIP Drinks :3
	else
	{
		showRoo();
		// First Gamegasm
		if(flags["ROO_GASMED"] == 0)
		{
			output("You’ve won, and now you don’t know what to expect. Roo has nothing left to take off, unless her ears are clip-on fakes!");
			output("\n\nShe doesn’t reach for her deck like before. Instead, she gives you a shy smile, kicks her chair back, and spreads her legs. Everyone around you quiets down. The moment the green text on her side of the table disappears, a blaring jingle assaults your ear drums, shouting out the word <b>JACKPOT!</b>");
			output("\n\nA gasp like birdsong crescendos up to the casino’s ceiling, and Roo convulses on the spot. Her voice cracks down the middle, vibrated into an ear-shattering screech. Every muscle in her body flexes plainly against her flesh, locking beautifully sweat begins to form over her blushing skin. The most she can manage is to hold her tits in each hand, throw her head back, and squirt.");
			output("\n\nHer abdominals ripple with the strongest effect of whatever’s smashing her brain to pieces. The mechanical grumble of a motor can be faintly heard at her opened labia, where many thin strings travel. The second her vibrators kicked on, she didn’t just gush, she began to <i>flood.</i>");
			output("\n\nRoo’s pink netherlips visibly part, launching out shots of scent-rich girlcum, steadily reducing to a mound-slickening river that puddles heavily around her. It’s the equivalent of wringing someone like a rag. The frequency of her sex toys is not consistent, and you can grok that from the random spasms that flex through her like lightning.");
			output("\n\nThe cajoling continues as Roo very literally cums her brains out, discoloring the floor and the table with her pheromonally-charged juices. She’s being harvested for all she’s worth. The groomed fur on her legs begins to mat down and plaster to her like a gross sleeve. Camera flashes from numerous devices record every titillating detail of her thrashing orgasm. Despite this, the kaithrit slut lazily gropes and massages her tits, whimpering slow, sibilant hums of feminine bliss, a prisoner in her own helplessly climaxing body.");
			output("\n\nWiping her arm across her jaw, Roo stains her fur with drool. Although the strongest effect has passed, you can still hear the low mechanical hum from where you sit. You collect your winnings, several credits richer, and realize this is what it’s like to hit jackpot in <i>Treasure Nova.</i>");
			output("\n\n<i>“O-O-Oh, it’s been a long time,”</i> Roo giggles, tongue lolling. She lazily glances across to you, eyes crossed in forced bliss. Her chest was already sensitive, but the way she cups it makes her moan openly.");
			if(pc.hasCock()) output(" [pc.EachCock] " + (!pc.isCrotchExposed() ? "struggles mightily against your covered crotch":"rockets to attention, beading a [pc.cumColor] dollop of pre") + " in want for the vulnerable kaithrit in front of you.");
			if(pc.hasVagina()) output(" Your [pc.pussiesLight] tingle" + (!pc.hasVaginas() ? "s":"") + " receptively, your loins clearly wishing to experience what the bunny-cat just did.");
			output(" The room begins to reek of gamegasm’d catgirl cunt.");
			output("\n\n<i>“W-W-Well, ummff, [pc.name], you’ve really outdone yourself!”</i> she lurches forward, an utter mess. <i>“I’m sorry, I would come to see you, but... I have gone so long without relief that it’s... a little difficult! Please forgive me,”</i> she sighs blearily. <i>“I hope you enjoyed your rewards, though! And there’s a little something extra for you!”</i>");
			output("\n\nYou look to your side, and a helpful slave-server deposits a tall glass with a bright, sparkling red liquid inside. <i>“Here ‘ya go, [pc.mister] high-roller! A </i>" + (!silly ? "Ruby Tether":"Ruby Lubey") + "<i> on the house!”</i>");
			output("\n\nRoo is hefted up by the other staff, one shouldering each arm. <i>“Enjoy your drink! It’s... it’ssss one of the - Ah! - best ever.”</i>");
			output("\n\nYou stand up and eye the fancy glass, filled with a lustrous beverage. The crowds have begun to clear, and while Roo is carried away you gingerly lift the drink to your lips and sample the contents.");
			output("\n\nAnd... it’s...");
			output("\n\nWhen the first piquant droplet touches your tongue and spreads through to your taste buds, a refreshing chill runs through your jaw, scouring downwards through your body. Automatically and unthinkingly you knocked the glass further back, gulping down your bonus as every known positive emotion vies for dominance in your brain. There’s the slight tang of raspberry, the hit of superb alcohol, and a bunch of other flavors finely balanced that defy identification.");
			output("\n\nSomething small hits your nose and you finally open your eyes - the drink is gone. Were you that thirsty? While you wonder what genius concocted this divine brew, you note a glistening gem inside: a small, finely cut piece of satyrite.");
			output("\n\nSecurity retrieves the glass, the gem, and ushers you away from the table with a few thumbs ups. You make your way up from the game floor with your incredible earnings in hand, realizing this is what it’s like to be at the top. Of a pirate casino, sure, but who’s to say they aren’t emulating law-abiding society admirably?");
			output("\n\nFor now, you note that Roo’s table has been taken over by a substitute who has restarted her game. You doubt that the man there is at all interested in performing like her, though.");
			//loot dat shit and whatnot
			//Dont forget to drank dat drunk
			processTime(6);
			pc.changeLust(10);
			pc.imbibeAlcohol(50);
			roogasm();
			output("\n\n");
			clearMenu();
			addButton(0,"Next",mainGameMenu);
		}
		// Gamegasms <=3
		else if(flags["ROO_GASMED"] <= 3)
		{
			output("Roo’s eyes close partway while she pushes herself out, spreads her legs, and prepares to messily orgasm in front of the entire casino. The kaithrit’s chin lifts, her cheeks raise, and she points to her crotch and... whatever’s inside that compels her to erupt. In the precious seconds before it flips on, you and she exchange knowing smiles.");
			output("\n\nThe bunny-cat’s arms cartwheel and her boobs shake orgasmically. A current of pure arousal runs through her body, wiping her mind clear of anything that isn’t the urgent need to cum all over the floor and herself like a biblical flood. The surge of compelled release surges down to the entrance of her parting cunt soon after.");
			output("\n\nHer brilliant eyes glass over, divested of rationality and replaced with one of the roughest, most forced orgasms you’ll ever see. The way she pleasure seizes and grips tight to the chair makes you think her entire nervous system has been rigged up to some incredible device, something more than a few vibrators. Unless her womb has been rigged up, you don’t see how else an invisible force treats her as little more a ragdoll.");
			output("\n\nHer keening voice carries across the casino and out the door; her tails fall limp and she arches upwards on her tiptoes. Fem-cum is squirting violently from her juciy slit, her glands ejaculating with unmatched ferocity. Copious, pheromonally-charged lubricants blast towards the table in a show of feminine bukkake, discoloring everything in her vicinity. You can see when the implants show mercy: her butt is planted back in the seat and her nerveless thighs merely quiver rapidly.");
			output("\n\nAnd now, the cat-rabbit’s floor drenching wetness streams out with intermittent bursts, puddling expansively across the ground. Her freckled face glows molten red with bliss, and is the prime target of all snapping photos. Roo goes through climax after climax, squirting, spurting, and flailing uselessly, a prisoner to the mechanisms slagging her with obscenity - all the while, she moans a rumbly purr, absent-mindedly groping more enjoyment out of her glazed frame.");
			output("\n\nWhen the show comes to an end, you retrieve your credits and find another <i>Ruby Tether</i> sat within reach, the piece of satyrite gleaming at the bottom of its basin. <i>“Glory... Glorious... Oh, [pc.name], I’m so happy...”</i> Roo whines, her voice stabilizing enough to speak. Her womanly fragrance fills your nostrils");
			if(pc.hasGenitals()) output(" and hardens your " + (pc.hasCock() ? "[pc.cocks]":"[pc.clits]"));
			output(". <i>“You’ve done it again, and here I am... your reward...”</i>");
			output("\n\nYou down the exquisite drink, basking in your moment of fame, the " + (pc.mf("kingly","queenly")) + " star at the center of <i>Treasure Nova.</i> Security shows up to shoulder the gamegasm’d Roo, who waves at you while she stumbles off in their arms, and you’re left to leave the fuckscented floor behind");
			if(pc.hasGenitals()) output(" with a raging " + (!pc.hasCock() ? "lady-":"") + "boner");
			output(".");
			output("\n\nA few minutes later, Roo’s table is taken over by a man you’re almost certain is an android with how emotionless he is. The kaithrit will probably be back tomorrow. In the meantime, you should figure out what you can do with some non-taxable income...");
			processTime(7);
			pc.changeLust(12);
			pc.imbibeAlcohol(50);
			roogasm();
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
		// Gamegasms 4-9
		else if(flags["ROO_GASMED"] < 10)
		{
			output("<i>“Oh yes!”</i> Roo squeals, hopping up from her chair. Pulses of joy can be seen thumping lightly against her chest, tremors of boobflesh preluding to another fantastic orgasm. You’re adding " + bet + " credits to your account, and you’re getting to see the rabbit-eared slut detonate all over the casino again. A crowd slightly larger than before appears, already whipping out recording devices and shoving hands in their pants.");
			output("\n\n<i>“[pc.name]! Are you ready? Keep your eyes here,”</i> she pinches her tits and dips gracefully, leaning backwards while bending at the knees, keeping her left leg lifted and tucked behind the right, like she’s serving you a drink. It’s an agile maneuver that prompts a few oohs and ahhs from the audience.");
			output("\n\nAnd once more, she is struck by erotic lightning, jerking upwards and stumbling to her ass. Mind-eradicating ecstasy fires out in overdue gouts of feminine bliss, and Roo’s voice must be carrying through the entire recreation deck right now. The whole casino hears it and stops to appreciate the sheer bliss ravaging her sentience one shot of ladymusk at a time, manifesting as muscle lashing pleasure-flogs visible plainly at her abdomen.");
			output("\n\nImpassively arching upwards, balancing on her neck and heels, she furiously jills more inundating effluence from her brightly shining pussy. Agile fingers slide through her plumped-up folds, driving her gamegasm to the intensity of a supernova. Under the auroral lighting she glistens with every color on the available spectrum, her button-like clit throbbing out rivers of hazardous slipperiness that imprint on every man and woman present.");
			output("\n\nIt’s far from over, and the puddle continues to swell, reaching your [pc.footOrFeet] and warming you with the residue of paralyzing climax. Roo’s objectified body clenches, seizes, thrashes, and spasms upwards, until she’s lying in a mess of her own make, the vibrators having rung out a vicious orgasm that all dick-wielders aspire to provide their partners. There the kaithrit lies, the naked white star at the center of her feline nebula, merely to be observed, admired, adored... <i>treasured.</i>");
			output("\n\nShe crawls onto her chest and sits up on all fours, staring at you longingly");
			if(pc.hasGenitals()) output("; you struggle " + (pc.hasCock() ? "not to bust a nut right then and there":"cream yourself on the spot") + ". You can see that she’s in control, no longer needing a shoulder to lean on.");

			// First Time
			if(flags["ROO_GASMED"] == 4)
			{
				output("\n\nYou go to claim your winnings and your complementary <i>Ruby Tether,</i> only to jerk upwards in shock when you feel two hands on your [pc.legOrLegs]. You scooch back and look down to see Roo on all fours, nestling herself into your crotch, pressing her nose ");
				if(pc.hasCock()) output("to your " + (!pc.isCrotchExposed() ? "tent-pitching ":"") + "[pc.cockHeadBiggest]");
				else if(pc.hasVagina()) output("against your clit");
				else output("to your barren loins");
				output(".");
				// Has Genitals
				if(pc.hasGenitals()) 
				{
					output("\n\n<i>“I need so much more, [pc.name],”</i> she giggles, ");
					if(!pc.isCrotchExposed() && pc.hasCock()) output("nuzzling your bulge with her cheek");
					else output("lapping at your " + (pc.hasCock() ? "cock":"button") + " with a smile");
					output(". <i>“I know that after that you have to be feeling like me. If you wish it, then take me, too!”</i>");
					output("\n\nIs that... really okay? Looking around nervously while Roo grope-fucks you, a lot of suited security have arrived at your flanks, some flashing brawny thumbs-ups and grins before turning to watch the crowds.");
					output("\n\nYou look down again, noting Roo’s increasing sexual distress. Were you to fuck her, she’d be all yours, a sight for others to envy. You’d be playing with her right in front of everyone and probably end up in a highly rated porn clip on some dingy website.");
					output("\n\nBut is that a reason to say no to someone so needy?");
					processTime(7);
					pc.changeLust(15);
					clearMenu();
					//[Sex] [Turn Down]
					addButton(0,"Sex",rooSexMenu,true,"Sex","Now that she’s done for the day, what’s stopping you from getting your real reward?");
					addButton(1,"Turn Down",turnDownRoocipher);
				}
				// Neuter
				else
				{
					output("\n\n<i>“It’s a shame you’ve nothing here,”</i> she giggles, gripping your [pc.thighs] and rising up to plant a lipsticked kiss on your cheek. <i>“But there’s my gift to you,”</i> she whispers, her breath warmly washing across your [pc.skinFurScales]. <i>“Come back soon, okay?”</i>");
					output("\n\nShe stumbles into the arms of security to be led out, leaving you to finish your drink and consider growing genitals to take advantage of a future opportunity...");
					//[Next] // Go to Turn Down
					processTime(7);
					pc.changeLust(10);
					clearMenu();
					addButton(0,"Next",turnDownRoocipher);
				}
			}
			// Repeat Time
			else
			{
				output("\n\nThis time you watch Roo move under the table, reaching out to stroke and grip your [pc.legOrLegs], and insert herself into your most personal space. Her head glides to your loins, facially caressing ");
				if(pc.hasCock() && !pc.isCrotchExposed()) output("your bulge");
				else if(pc.hasCock()) output("the stiffening flesh of [pc.oneCock]");
				else if(pc.hasVagina()) output("[pc.oneClit]");
				else output("your barren groin");
				output(".");
				// Has Genitals
				if(pc.hasGenitals())
				{
					//didn’tFuckLastTime: 
					if(flags["ROO_SEXED"] != undefined) output("\n\n<i>“You’ve won me again, [pc.name]. Will this be our moment?”</i> is her whispered question.");
					//fuckedRooLastTime:
					else output("\n\n<i>“There was never any doubt, [pc.name]. This is our moment. Use me as you wish, your prize!”</i> she smiles invitingly.");
					output("\n\nLike before, security shows up with their own small praises, silently keeping the crowds back while affording you an opportunity to claim Roo in front of every pirate and merc in <i>Treasure Nova.</i>");
					output("\n\nIf you want her, she’s more than ready for it.");
					processTime(7);
					pc.changeLust(15);
					clearMenu();
					//[Sex] [Turn Down]
					addButton(0,"Sex",rooSexMenu,true,"Sex","Now that she’s done for the day, what’s stopping you from getting your real reward?");
					addButton(1,"Turn Down",turnDownRoocipher);
				}
				// Neuter
				else
				{
					output("\n\n<i>“It’s a shame you’ve nothing here,”</i> she giggles, gripping your [pc.thighs] and rising up to plant a lipsticked kiss on your cheek. <i>“But there’s my gift to you,”</i> she whispers, her breath warmly washing across your [pc.skinFurScales]. <i>“Come back soon, okay?”</i>");
					output("\n\nShe stumbles into the arms of security to be led out, leaving you to finish your drink and consider growing genitals to take advantage of a future opportunity...");
					processTime(7);
					pc.changeLust(10);
					clearMenu();
					addButton(0,"Next",turnDownRoocipher);
				}
			}
			pc.imbibeAlcohol(50);
			roogasm();
			return;
		}
		// Gamegasms >=10
		else
		{
			output("For the spectacle to come there is no fanfare but silent expectancy. Roo’s pussy is no doubt the most sensitive thing on Zheng Shi in light of her losses. ");
			//first:
			if(flags["ROO_GASMED"] == 10) output("It occurs to you, watching her shy smile, watching her spread her arms and legs a step or two from her seat, that you’ve trained something into her.");
			else output("She’s been trained to love every second of defeat, to revel in its orgasmic reward. She owes all of those ‘losses’ to you, her most shrewd contestant, perhaps her luckiest... but most importantly: <i>her player one.</i>");
			output("\n\nTime stops in that delicate moment before explosion. Roo’s body provocatively shifts into something that won’t hurt her when it comes. You catch the growl of activating machinery in her body and stand up, eager to watch all over again as she collapses to the floor a convulsing, benumbed wreck of feminine nerves.");
			output("\n\nRoo’s voice is lost to the shock of disabling euphoria, her body and very form twisting to the currents of unbridled ecstasy raging across her exposed soul. Shots of girlmusk greater in volume than ever before arc upwards in trajectories that you don’t even bother sidestepping. In the space of three more heartbeats, she’s drenched the table in her pooling nectar.");
			output("\n\nHer forced pleasure abates into something steadier, and she’s gushing all over herself, still mauling her tits and yanking on her clit with all the strength she has left. At no other point has she looked so beautiful. This soiled woman discards her masks at the sopping singularity, flooding the room with her juices and permeating its air with saccharine scent. Fair skin wears russet hues of gradual bliss, shining under the auroral lights of <i>Treasure Nova.</i>");
			output("\n\nShe arches upwards, voice raising to its highest, bird-like pitch, prying apart her lust-aglow pussy lips and locking into place. Every ounce of fluid inside her discharges violently for the entertainment of any who look upon her debased and wholly objectified being. Fur and hair pristine, now discolored, shrink and flatten in a sea of her own sparkling flavor.");
			output("\n\nAs all times before this, you have witnessed the transience of Roo at her peak. Like a nova herself, she appears a bright star, resplendent in her existence, beautiful in her ephemeral weakness.");
			output("\n\nTo others, she is already fading, a worthless slut like any other.");
			output("\n\nBut to you, she is a part of <i>your galaxy,</i> an interminable icon.");
			output("\n\nAs pictures and videos are saved and probably uploaded somewhere, the fallow feline remains a few seconds longer. With ghostly grace she sits up and rolls onto her sensitive belly, shuffles forwards, rises to her knees, and climbs atop the table, trailing cooling girlcum along her path.");
			output("\n\nThe first thing she does when she’s inches away is reach for your head, stroke your cheek, and press her soft lips to yours. It’s a kiss that ");
			if(flags["ROO_GASMED"] > 10) output("always ");
			output("feels like one you’ve waited an eternity for.");
			// Has Genitals
			if(pc.hasGenitals()) 
			{
				output("\n\nHer free hand sinks to your crotch; Roo ");
				if(pc.hasCock()) output("strokes the side of your [pc.cocks] " + (!pc.isCrotchExposed() ? "through your clothing, finger-worshiping your bulge":"brazenly, bringing you into a readier state") + ".");
				else output("slides a finger into the crease of your [pc.pussy], " + (!pc.isCrotchExposed() ? "pushing your clothes inside too":"drawing out the first droplets of your arousal") + ".");
				output(" Between her hot and heavy breaths, she whispers, <i>“Will you have me, too? You’ve been patient long enough.”</i>");
				output("\n\nHer two tails weave around your waist, pulling you a little closer, increasing her odds that you might say ‘yes’ just a little bit.");
				processTime(7);
				pc.changeLust(15);
				clearMenu();
				//[Sex] [Turn Down]
				addButton(0,"Sex",rooSexMenu,true,"Sex","Now that she’s done for the day, what’s stopping you from getting your real reward?");
				addButton(1,"Turn Down",turnDownRoocipher);
			}
			// Neuter
			else
			{
				output("\n\nHer free hand sinks to your crotch only to find disappointment. <i>“As always, you never fail to impress, but... it’s a shame there’s nothing here,”</i> she laughs, running her hand across your barren loins. <i>“But that’s fine. You’re more important.”</i>");
				//[Next] // Go to [Turn Down]
				processTime(7);
				pc.changeLust(10);
				clearMenu();
				addButton(0,"Next",turnDownRoocipher);
			}
			pc.imbibeAlcohol(50);
			roogasm();
			return;
		}
	}
}

//[Turn Down]
// Tooltip: Now’s not the time.
public function turnDownRoocipher():void
{
	clearOutput();
	showRoo();
	author("William");
	//Set up this status for displaying certain outros when leaving.
	if(!pc.hasStatusEffect("Roo_Turned_Down")) pc.createStatusEffect("Roo_Turned_Down");
	pc.setStatusMinutes("Roo_Turned_Down",40);
	//Special panty collect interrupt:
	if(flags["ROO_GASMED"] >= 10 && !pc.hasKeyItem("Panties - Roo's - Satiny, bright red panties with ribbony side-ties."))
	{
		rooPantyCollectScene();
		return;
	}
	// 4-9 Gamegasms
	else if(flags["ROO_GASMED"] < 10)
	{
		output("While it’s a persuasive offer, it’s not what you’re after right now. Roo’s natural lips consequently purse into a cute pout. <i>“Aw...”</i> she hums. <i>“Then, please return soon.”</i>");
		output("\n\nShe crawls out and stands, giving you a silly wink as security move to her side. <i>“Until next time, [pc.name]!”</i> she blows a kiss before being walked out.");
		output("\n\nBefore leaving, you aren’t keen on wasting the signature drink provided, and you gladly rejuvenate your body with the best liquor you get for light years. Walking off, the area is cleaned and the table re-opened. Now it’s time to figure out what to do with all this money...");
	}
	// >=10 Gamegasms
	else
	{
		output("You run a [pc.finger] along Roo’s ear in a motion that crosses her scalp, her cheek, and ends on her dazzling lips. You trace them and gently let her down, telling her that you’re not up for a victory frolic.");
		output("\n\n<i>“I understand, [pc.name],”</i> she whispers, leaning back and softly sighing. <i>“Then come back soon, okay?”</i>");
		output("\n\nOn shaky balance she gets her feet on the floor before being flanked by security. She caresses the top of your [pc.hand], giggling at your reaction. Roo then leaves to rest for the day.");
		output("\n\nAfter finishing your victory drink and energizing your body with a rush of the best liquor for light years, you leave the game floor behind to be quickly cleaned. Roo’s table re-opens, but that’s not on your mind right now. You’re thinking of her, when she’ll be back, and only barely about what you will do with your earnings.");
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Special Event - 10+ Gamegasms (ONE-TIME ONLY)]
// After Roo gamegasm’s for the 10th time, then no matter what the PC picks, this sequence will override/add on to the endings of sex/leaving.
// This event will not trigger until the PC has had sex with her once in any fashion, and has exhausted all of her talk options.
public function rooPantyProcChance():Boolean
{
	return (flags["ROO_GASMED"] >= 10 && !pc.hasKeyItem("Panties - Roo's - Satiny, bright red panties with ribbony side-ties."));
}

public function rooPantyCollectScene(arg:String = "back"):void
{
	clearOutput();
	showRoo();
	author("William");
	if(arg == "tableFukk") output("<i>“That’s good,”</i> she nods, <i>“because I have something I need to tell you, and something else I wish for you to have.”</i> Roo strides around the table and back, collecting something you can’t see. She hides it behind her back coyly.");
	else if(arg == "notBack") output("<i>“Ah, [pc.name], this reminds me!”</i> she chirps, launching deftly to her feet. <i>“There’s something I want you to have, and something I wish to tell you.”</i> She maneuvers around the table to collect something, but you can’t see what - it’s hidden behind her back.");
	else output("You tell Roo you’re not in need of service, and she nods. Instead of giving you a spiel, instead of heading off like she usually does, she takes this precious one-on-one time to maneuver around the table and grab something. She holds it behind her back as she approaches you again. <i>“[pc.name], there’s something I want you to have, and something I want to say.”</i>");
	output("\n\nA degree of worry builds inside, but you wait patiently for her to continue. <i>“You asked me how I came to be here. I can’t answer that.”</i> She kneels down in front of you, a dour smile cresting her features. <i>“But I want you to know that I am not unhappy, that I don’t begrudge any of this. Especially not after meeting you.”</i>");
	output("\n\nHer arms weave around and she presents you something... red...");
	output("\n\n...her bright red panties.");
	output("\n\n<i>“I love the game, and I love the job. Nobody else has ever come as close as you have. You could point your finger to the sky, and instead of seeing the moon or the star, they’d only be able to look at your finger.”</i> She grins goofily. <i>“Sorry, it’s just a silly compliment. I don’t want you to get attached to me or anything, if you were asking that question back then because you were worried for me.”</i>");
	if(pc.isNice() || pc.isBimbo() || pc.isMischievous()) output("\n\nYou were, and you emphasize that. All you get out of her is a shrug of the shoulders.");
	else output("\n\nYou nod lightly, not committing to an answer.");
	output("\n\n<i>“As long as you’re happy, then I’m happy. It’s how I feel for anyone who comes here,”</i> she smiles as you take her underwear. <i>“When I first saw you I didn’t see a pirate, a killer... I don’t see anything of this place or the usual clientele in you. That’s why I was even happier when you began to win.”</i>");
	output("\n\nShe stands finally, refulgent in splendid nudity. <i>“Any time you come back, I’ll treat you to a show. So long as you win!”</i> She wags a playful finger. <i>“And don’t go thinking I didn’t appreciate the sentiment either way. I’ll be alright, you’ve got my word on that!”</i>");
	output("\n\nRoo turns to gather her things while you hastily pocket her lingerie, lest security take it from you. <i>“Just see me as I am: a funny-looking kaithrit.”</i> A blown kiss and a heartful wave later, she’s gone.");
	output("\n\nHer clarity still lingers, overriding the effect of the free drink you’re given. You wander off with your earnings and your fragrant bonus");
	if(pc.isNice() || pc.isMischievous() || pc.isMischievous()) output(", thinking her situation a little morose. You doubt you’ll learn anything more of that cat, but if she has that attitude every day, she’ll surely be alright");
	else output(", thinking little of her situation. You didn’t learn much in the end, but you’re still happy to accept her graces, wondering when next you should try to earn them");
	output("...");
	//Satiny, bright red panties with ribbony side-ties.

	pc.createKeyItem("Panties - Roo's - Satiny, bright red panties with ribbony side-ties.");
 	output("\n\n(<b>Gained Key Item: Panties - Roo’s</b>.)");
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
}

//[Appearance]
// Tooltip: The decorations here are nice and all, but this lady deserves a thorough inspection!
// Only available before playing a hand.
public function rooAppearance():void
{
	clearOutput();
	showRoo();
	author("William");
	output("You shake your head, deciding to sit out a few games. Roo accepts the answer. In fact, she does so with poised alacrity, positioning herself in a way that helps you accomplish your goal! Guess she knows where <i>your</i> eyes are." + (flags["ROO_STRIP_LEVEL"] >= 4 ? " With her body totally exposed, she takes greater pleasure in your intense analysis, cheeks blooming from ocular stimulation.":""));
	output("\n\nTreasure Nova’s sunniest employee is a light-skinned kaithrit who’s replaced her fluffy ears with those of a lop bunny’s. They dangle inflexibly from her head of pristine white and curly hair, beautifully styled and maintained to maximize charm and refinement. Two cherry red eyes with vertical pupils sit like gems in the crown of her lovably freckled face, and her full red lips widen easily into merry smiles below her cute button nose, creasing her squeezable cheeks.");
	output("\n\nFrom the neck down Roo’s body expands into a femininity lithe at its core and silky-plush at its curves - she’s a bombshell, and her features are positively enhanced by the skanky uniform she wears!");
	if(flags["ROO_STRIP_LEVEL"] < 3)
	{
		if(flags["ROO_STRIP_LEVEL"] == 0) output(" Beneath her buttoned jacket and the nametag it bears");
		else if(flags["ROO_STRIP_LEVEL"] == 1) output(" Beneath her breezy shirt");
		output(" are a perky pair of EE-cup boobs, nipples erect and showing plainly through the fabric.");
		if(flags["ROO_HIGHEST_STRIP_LEVEL"] < 3) output(" You couldn’t guess as to their color, though.");
		else output(" You know that they’re a delicious pink in color.");
	}
	else
	{
		output(" With her clothing discarded by repeat defeat, Roo’s creamy flesh is laid bare, and her captivating EE-cups, capped by bliss-fattened pink nipples, wobble in trance-inducing patterns.");
	}
	output(" Starting at her biceps, an argent sleeve of groomed fur coats her arms to the fingertips, ending with blunted claws.");
	output("\n\nAfter dealing another hand, she flashes you a cheshire smile that puts her cat-like fangs on display. Her tongue clicks, her eye gives that cute wink, and she’s back to it. The tease...");
	output("\n\nHer waist is, in a word, nubile; very mature with appropriately thickened hips that someone could spend a few hours lavishing with attention and still be unable to comprehend their splendor.");
	if(flags["ROO_HIGHEST_STRIP_LEVEL"] >= 4) output(" They’re thick enough to hide the remote vibes slotted in her nethers, designed to go off at a moment’s notice.");
	output("\n\nRoo has a rosily-freckled vanilla-hued butt that quivers like a bubble when she makes sudden moves. Emerging from her tailbone are two long, prehensile kaithrit tails that speak her race’s secondary language. ");
	//rooNotStripped:
	if(flags["ROO_STRIP_LEVEL"] < 4)
	{
		if(flags["ROO_STRIP_LEVEL"] < 2) output("Behind her mini skirt and beneath her satiny red panties");
		else output("Beneath her satiny red panties");
		output(" is undoubtedly a pussy. There’s a faint cameltoe, and the moist, plump outline is unmistakable. ");
		if(flags["ROO_HIGHEST_STRIP_LEVEL"] < 3) output("Its color is as much a mystery as her nipples.");
		else if(flags["ROO_HIGHEST_STRIP_LEVEL"] < 4) output("Its colors and detailed features remain a mystery.");
		else output("It shares the same vibrant color as her nipples.");
	}
	else
	{
		//rooStripped:
		output("Without her bottom clothes, she can’t hope to hide (nor does she seem to want to) her chubby, drooling pink pussy. Nearly invisible vibrator cords web into both her cunt and colon both, primed to go off at a moment’s notice.");
	}
	output(" Completing her ensemble, her feet are shoved into a pair of heels specially made for her animalistic limbs.");
	output("\n\nIn your opinion, Roo is a nonpareil dealer, and without a doubt one of the <i>Nova’s</i> brightest pearls.");
	output("\n\n<i>“Ready to play yet" + (flags["MET_ROO"] == 2 ? ", [pc.name]":"") + "?”</i> she quips, deck of cards in hand and a grin on her adorable face.");
	output("\n\nThe smile she gives really is disarming...");
	flags["ROO_TALK_CD"] = 1;
	processTime(11);
	clearMenu();
	rooMenu();
	setButtonDisabled(1);
}

//[Talk]
// PC can talk to Roo only when she strips a piece of clothing. If they don’t take the opportunity it’ll show up again later! PC can’t ask Roo a question after she strips her panties.
// PC inputs their next bet, gets dialogue, and then goes automatically to the blackjack game.
public function talkToRoo():void
{
	clearOutput();
	showRoo();
	author("William");
	flags["ROO_TALK_CD"] = 1;
	// Minimum Lewd
	if(flags["ROO_GASMED"] <= 3)
	{
		output("You tap the table and ready your next bet, something else on your mind besides the money going in.");
		output("\n\n<i>“Hmm?”</i> Roo perks up, noticing you move to ask something. Guess it’s no surprise a casino dealer is <i>that</i> perceptive! <i>“You have a curious look on your face!”</i>");
		output("\n\nYou don’t think you’ll be able to engage her that much while she’s playing her game, but in light of your victory she could stand to answer <i>something</i>, even if it is brief.");
	}
	// Intensified Lewd
	else if(flags["ROO_GASMED"] < 10)
	{
		output("After setting another bet, you’re interrupted before you even open your mouth.");
		output("\n\n<i>“You have a look on you, [pc.name],”</i> Roo smiles nonchalantly, as if knowing your moves before you do. Can she really read you that well? Are you <i>that</i> plain to see?");
		output("\n\n<i>“Mmm, you’re thinking you’re... simple, right?”</i> The hell? <i>“I’m not psychic! I just know how to read the usual faces! Want to ask something again?”</i>");
		output("\n\nYou’re only gonna get one, so what’ll it be?");
	}
	// Maximized Lewd
	else
	{
		output("<i>“What’s on your mind, I wonder...”</i> Roo asks pointedly - her head is in the game she prepares on top of your continued betting. <i>“I’ll always make time for you, [pc.name]. Just say the word!”</i>");
		output("\n\nDo you have something to ask?");
	}
	//[Herself] [Her Job] [Treasure Nova] [Bosses] [Fetish]
	rooTalkMenu();
}

public function rooTalkMenu():void
{
	clearMenu();
	//[Herself]
	addButton(0,"Herself",rooHerselfTalkies,undefined,"Herself","Is there anything she can tell you about herself?");
	//[Her Job]
	// Must ask about [Herself] five times; gray out otherwise
	if(flags["ROO_SELFTALKED_TOTAL"] == undefined || flags["ROO_SELFTALKED_TOTAL"] < 5) addDisabledButton(1,"Her Job","Her Job","You should get to know her a bit more. As well as you can, anyway.");
	else addButton(1,"Her Job",rooHerJobbieTalk,undefined,"Her Job","Ask about her job and why she does it.");
	//[Treasure Nova]
	addButton(2,"Treas.Nova",rooTalksTreasureNova,undefined,"Treasure Nova","How’d she end up here, and what’s this place like?");
	//[Boss]
	if(flags["ROO_NOVA_TALK"] == undefined) addDisabledButton(3,"???","???","You’ll need to talk about something else first.");
	else addButton(3,"Her Boss",askRooAboutHerBoss,undefined,"Her Boss","Ask about her boss.");
	//[Fetish]
	// Tooltip: Ask about her love for exhibition.
	if(flags["ROO_GASMED"] < 4) addDisabledButton(4,"???","???","You’ll have to beat Roo a few times before you can ask this.");
	else addButton(4,"Fetish",askRooAboutHerFetish,undefined,"Fetish","Ask about her love for exhibition.");
}

//[Herself]
// Tooltip: Is there anything she can tell you about herself?
public function rooHerselfTalkies():void
{
	clearOutput();
	showRoo();
	author("William");
	// First Time
	if(flags["ROO_SELFTALKED"] == undefined)
	{
		// Bimbo
		if(pc.isBimbo()) output("<i>“What’s the story of the cute kitty cat with bunny’s ears?”</i> You lean forward, holding your smiling head up by the palms on your cheeks, looking super adorable.");
		// Bro
		else if(pc.isBro()) output("<i>“Anything more I can learn about the kitten under the dress?”</i> you ask bluntly, drumming the table with your fingers.");
		// Kind
		else if(pc.isNice()) output("<i>“I know your name, but I want to know more,”</i> you ask simply, flashing her a winning smile.");
		// Misch
		else if(pc.isMischievous()) output("Sly grin on your face, you ask, <i>“I’d like to be spoiled. Tell me something about yourself, I like getting to know the cute girls,”</i> finishing by propping your nose on your knuckle.");
		// Hard
		else output("<i>“Your clothes are one thing, but I’m interested in you. What’s there to really know about the bunny-eared cat?”</i> you ask sharply.");
		// Merge
		output("\n\nHer ears perk up halfway before slumping down. <i>“Oh-ho,”</i> Roo hums, flicking out cards at indiscernible speeds. <i>“Well, this girl’s got a lotta secrets. Not the kind you go telling anyone who just asks,”</i> she winks; out goes another card. <i>“Certainly not when she’s working hard!”</i> She giggles, dealing your hand. <i>“How about this, ");
		if(flags["MET_ROO"] != 2) output(pc.mfn("handsome","cutie","cutie"));
		else output("[pc.name]");
		output(", I’ll tell ‘ya something whenever you’re on a streak! Deal?”</i>");
		output("\n\nDeal.");
		output("\n\n<i>“That’s all the time for now, though!”</i>");
		output("\n\nAw what?");
		output("\n\n<i>“The game awaits, [pc.name]!”</i>");
		output("\n\nSo it does...");
	}
	// Repeat
	else
	{
		output("You ask your bubbly dealer for another <b>Roo-mination.</b> Roo’s ears flop upwards and a wide grin breaks her mask; a yelp slips up her throat and she snickers uncontrollably.");
		output("\n\n<i>“D’aw, sure!”</i> she stammers through her chuckling.");
		// Merge
		// fact 1 (cycle through then randomize)
		if(flags["ROO_SELFTALKED"] == 1)
		{
			output("\n\n<i>“A lotta people ask about my ears, and the answer’s not the most exciting,”</i> she simpers, <i>“my boss - and he’s the best! - really liked the idea when I asked to get ‘em! Saw him watching an old story. There’s something that terrans really liked, or like really, about cuties with bunny ears. Says it gives a place a’ business a reeeaal...”</i> she finishes dealing, <i>“...hoppy feeling!”</i>");
			output("\n\nYou sigh, and she wags a finger. <i>“Hehe, I’m a little spoiled. Let’s play, now!”</i>");
			output("\n\nBack to the game then.");
		}
		// fact 2
		else if(flags["ROO_SELFTALKED"] == 2)
		{
			output("\n\nFor a second, her smile turns lopsided, face lost in thought. It rights itself when she speaks. <i>“Here’s something, I actually have two siblings! Now I won’t go giving names, but if you ever see my face with green eyes...”</i> She pauses to make a silly gesture, sticking her tongue out in a playful manner. <i>“...you probably just met my sister. If you ask me, she’s nowhere near as fun as I!”</i>");
			output("\n\n<i>“Anyway!”</i> She sets her deck down. <i>“Let’s keep going!”</i>");
		}
		// fact 3
		else if(flags["ROO_SELFTALKED"] == 3)
		{
			output("\n\n<i>“Mmm,”</i> Roo hums, casually working her wrists. She stops to inspect you for no more than two seconds, tilting her head and finishing the job. <i>“I gotta say, I can’t quite tell what your preference is! See, everyone’s got their own likes and dislikes, and you can sometimes tell by a little look in their eye. The kinda people I prefer...”</i> She pats the deck, <i>“I like guys that look at me, and I like girls that get... really wet,”</i> she smiles, chewing her lower lip to stifle a laugh.");
			output("\n\nYou would ask her to go into more detail, but the game calls.");
		}
		// fact 4
		else if(flags["ROO_SELFTALKED"] == 4)
		{
			output("<i>“The best thing to eat, in my opinion... are cookies!”</i> The impish expression she wears nearly drags you into silly laughter. <i>“Aw, but I’m serious! You might not think it, but we’ve got an awesome kitchen and an incredible team! When my day’s over, there’s really nothing better than falling into bed with chocolate melting in my mouth...”</i>");
			output("\n\nFor a second, Roo stares out into the casino, vacant eyed with confectionery awe. <i>“I shouldn’t have said that, I want another sooo bad!”</i> A shake of the head and she’s back to the game. <i>“I’m jus’ a simple girl with simple wants. Also, I don’t like carrots!”</i>");
		}
		// fact 5
		else if(flags["ROO_SELFTALKED"] == 5)
		{
			output("\n\n<i>“One of my favorite things,”</i> Roo start, ears twitching in thought, <i>“...is, hmm, how to put this...”</i> She sets the deck down, pausing the game in a rare show. <i>“To me, it doesn’t matter who looks at me. Long as they like what they see, and I’ve yet to meet someone who doesn’t!”</i> Her dealing resumes, and she beams, <i>“See, I like knowing that what I’m doin’ is having an effect, this is the best job I’ve ever had!”</i>");
			output("\n\nShe shrugs her shoulders, bouncing her boobs in the process, clearly enjoying the light smile you give.");
		}
		// facts exhausted (when everything else is said, add this on)
		else
		{
			output("\n\nRoo doesn’t spend too long talking this time, instead offering up a bunch of random details about herself, such as her measurements, that she used to be a little overweight, and how on her first week of dealing cards she somehow broke the table and later caused a brawl. In her words they weren’t the halcyon days.");
			output("\n\nWhat sticks with you the most are when she lets slip the tiniest details about her personality, how she reacted to what she was doing - willfully, responsibly. Unfortunately, you can’t get her to tell you anything more personal.");
		}
	}
	IncrementFlag("ROO_SELFTALKED");
	if(flags["ROO_SELFTALKED"] > 6) flags["ROO_SELFTALKED"] = 1;
	IncrementFlag("ROO_SELFTALKED_TOTAL");
	processTime(10);
	rooMenu();
}

//[Her Job]
// Tooltip1: Ask about her job and why she does it.
// Tooltip2: You should get to know her a bit more. As well as you can, anyway.
// Must ask about [Herself] five times; gray out otherwise
public function rooHerJobbieTalk():void
{
	clearOutput();
	showRoo();
	author("William");

	// Bimbo
	if(pc.isBimbo()) 
	{
		output("<i>“You look great doing this job ‘ya know!”</i> you bat your eyes, <i>“so how’d you get it? How’d you get so good at looking cute while doing it?”</i>");
		output("\n\n<i>“I can only answer half that question reasonably, you know!”</i> she laughs.");
	}
	// Bro
	else if(pc.isBro())
	{
		output("You fold your arms, asking, <i>“What got you doing this? There’s gotta be something better for a beautiful woman like you.”</i>");
		output("\n\n<i>“Aww! True, there may be, but!”</i> She bobs her head once.");
	}
	// Kind
	else if(pc.isNice()) 
	{
		output("<i>“You seem capable of more than dealing cards,”</i> you start politely, <i>“why be a dealer?”</i>");
		output("\n\nThe kaithrit giggles. <i>“Oh, there’s a few things.”</i>");
	}
	// Misch
	else if(pc.isMischievous())
	{
		output("<i>“Someone with hands like yours, surely there’s something more suitable for a cute, efficient cat like yourself?”</i> you ask.");
		output("\n\n<i>“Perhaps,”</i> she winks.");
	}
	// Hard
	else
	{
		output("<i>“Dealing cards must be a step down from what you could be doing,”</i> you say out loud, and she shakes her head.");
		output("\n\n<i>“Not so,”</i> she fires back.");
	}
	// Merge
	output("\n\n<i>“Luck’s an interesting thing. It has a way of equalizing any contest. Nobody’s a sure winner, everyone’s always thinking, second guessing. The shrewd are as vulnerable as the fools.”</i> Her tongue slicks across her lips. <i>“Not my words, so don’t go quoting me!”</i> She fans out the next card, then the next. <i>“It’s probably weird to say, but I really like seeing how lucky or unlucky someone can be, seeing what they feel, what their faces look like, all when their next hand could break their bank or enrich it.”</i>");
	output("\n\nHer motions flag for a microsecond. <i>“Watching stony faced people plan so hard, then getting to see if it pans out! I see hundreds, maybe thousands of people a day applying their experiences, learning just a bit about them from the way they play... the way they decide on the next action...”</i>");
	output("\n\nCards placed, she gives you a briefly timid look. <i>“That, and other things... oh, I think I’m where I want to be for as long as possible.”</i>");
	output("\n\nThat’s it?");
	output("\n\n<i>“Yep!”</i>");
	processTime(10);
	rooMenu();
}

//[Treasure Nova]
// Tooltip: How’d she end up here, and what’s this place like?
public function rooTalksTreasureNova():void
{
	clearOutput();
	showRoo();
	author("William");
	// First (repeat for asking three times)
	if(flags["ROO_NOVA_TALK"] == undefined || (flags["ROO_NOVA_TALK"] != undefined && flags["ROO_NOVA_TALK"] > 1))
	{
		// Bimbo
		if(pc.isBimbo()) 
		{
			output("<i>“This place sure is pretty,”</i> you muse, eyelashes fluttering. <i>“But not as pretty as you! What’s it like, how’d you get here?”</i>");
		}
		// Bro
		else if(pc.isBro()) output("<i>“Tell me about this casino, how you ended up being one of its stars,”</i> you gesture meaningfully.");
		// Kind
		else if(pc.isNice()) output("<i>“What got you working in a place like this? Tell me about this casino,”</i> you prompt.");
		// Misch
		else if(pc.isMischievous()) output("<i>“What’s the skinny on this place? You’re like the gem in its crown, after all.”</i> You give her a silly wink. <i>“What put you there?”</i>");
		// Hard
		else output("<i>“What should I watch out for around here? You must have been here a while.”</i>");
		// Merge
		output("\n\n<i>“It’s the best!”</i> Roo nearly shouts. Her tone tells you that she isn’t making that claim under duress. <i>“Games of chance have a way of bringing so many people together, even if it’s not usually for niceties. Our boss is the most amazing guy, too! He’s <b>great</b> at handling rowdy folks. Also, we’re the most reputable casino you’ll ever find outside the U.G.C, and not even those nasty Black Void types can say that!”</i>");
		output("\n\nShe throws out the first cards. <i>“It must be really hard to believe. Even I didn’t at first. But we’ve got the best food, and the best staff! Strictly speaking, most of our players leave with a little more. Not everyone can experience a windfall, Lady Luck being the fickle entity she is, but that’s why we offer more than just games. There’s a little something for everyone here, always a chance to make connections, and plenty to learn!”</i>");
		output("\n\nRoo gives herself one card, and suddenly squirms. <i>“Oh, and we have the best drink in the galaxy. Nobody else could ever copy it. Our signature and most expensive beverage, reserved for only top earners, VIPs and staff alike: the <b>Ruby Tether!</b> It is, oh, [pc.name],”</i> her balled fists wave wildly, <i>“if the heavens of old religions exist in this universe, if it lies beyond the celestial ether at its unknowable edges, then what we provide is a taste of divinity!”</i> She speaks with a conviction that nobody could diplomatically criticize. " + (flags["ROO_GASMED"] != undefined ? "<i>“But you know that already! And I bet you can’t wait to have it again, right?”</i>":"<i>“A single drop would prove it. I hope you will earn a taste of our finest treasure soon.”</i>"));
		output("\n\n");
		if(flags["ROO_GASMED"] > 0)
		{
			//firstTime & rooGasm’dOnce:
			if(flags["ROO_NOVA_TALK"] == undefined) output("Well, you wouldn’t mind, but you note that she did ignore your question. The game is set, however, so you’ll have to earn another opportunity to ask.");
			//repeat & rooGasm’dOnce::
			else output("No matter how vehemently she describes it, what you tasted can’t be praised enough.");
		}
		//firstAndRepeat & rooNeverGamegasm’d: 
		else output("Sure, but you can’t help but realize she dodged your question." + (flags["ROO_NOVA_TALK"] != undefined ? " Unfortunately, the game is set, and you’ll have to earn another opportunity.":""));
	}
	// Second (one time only)
	else if(flags["ROO_NOVA_TALK"] == 1)
	{
		output("Roo neglected to answer you the first time. A conscientious woman like her doesn’t make that kind of mistake easy, so you ask her again: how did she become an employee of the casino?");
		output("\n\nPressing the matter dims her face ever so slightly, something you were beginning to think was impossible.");
		output("\n\n<i>“Not on the best terms.”</i> She shakes her head and hits the table. <i>“No, no, that’s not what I said. Let’s... [pc.name],”</i> Roo smiles, raising one fuzzy finger, speaking in an uncompromising tone, <i>“not everyone has the freedom to choose what they do. And that’s alright! It’s what you make of your situation, never about what gets you there.”</i>");
		output("\n\nFor a second you consider responding, but that answer is likely the best one you’ll get, and so you let the matter go. You can see when the questioning is going too far.");
	}
	processTime(10);
	IncrementFlag("ROO_NOVA_TALK");
	rooMenu();
}

//[Boss]
// Tooltip: Ask about her boss.
// Must ask about [Treasure Nova]
public function askRooAboutHerBoss():void
{
	clearOutput();
	showRoo();
	author("William");
	// Bimbo
	if(pc.isBimbo()) output("<i>“What’s the boss like around here? Looks like everyone’s treated right!”</i>");
	// Bro
	else if(pc.isBro()) output("<i>“You have a high opinion of your boss. Hopefully he does for everyone under him.”</i>");
	// Kind
	else if(pc.isNice()) output("<i>“Who runs this place, what’s he like? I can tell you have more than a little respect.”</i>");
	// Misch
	else if(pc.isMischievous()) output("<i>“Shame you told me about your boss, I was getting used to thinking you were the most important person here. What’s your opinion?”</i>");
	// Hard
	else output("<i>“You said ‘boss’, so, only one person runs the place?”</i>");
	// Merge
	output("\n\n<i>“Ahh, I can’t give you his name. You probably won’t ever see him either,”</i> she muses with a hint of sadness. <i>“He’s an extremely busy guy, but trust me when I say, [pc.name], I’ve never met anyone who has their head on so right! He... I swear, he sees and hears things before they’ve even happened, that’s the only way I can describe it. He’s amazingly smart, and he’s not a jerk either! That’s why this place runs so smoothly, he doesn’t hire just anyone!”</i>");
	output("\n\nYou can see that in her.");
	output("\n\n<i>“Hehe, I don’t get to meet him often. He shows up once or twice a month, since this isn’t our only casino.”</i> The last cards are shunted. <i>“Gets a little lonely without him. Has a way of just lighting up the places he goes. Now!”</i> She claps her hands together, <i>“Let’s continue.”</i>");
	//Ohno, the NTR! :P
	processTime(10);
	rooMenu();
}

//[Fetish]
// Tooltip: Ask about her love for exhibition.
// Tooltip2: You’ll have to beat Roo a few times before you can ask this.
// Requires Roo to have gamegasm’d four times; hide with [ ??? ] otherwise.
public function askRooAboutHerFetish():void
{
	clearOutput();
	showRoo();
	author("William");
	output("You’ve seen it enough times to see that Roo enjoys stripping down, ");
	//first: 
	if(flags["ROO_FETISH_TALK"] == undefined) output("but the reason isn’t very clear.");
	else output("and you want a quick reminder of why.");
	output(" ");
	if(pc.isBimbo()) output("<i>“You don’t get undressed just ‘cause it’s the job, right? Not complaining! Just noticed you getting more into it, s’all!”</i>");
	else if(pc.isBro()) output("<i>“You get really into it when you strip down. Do you like me that much?”</i>");
	else if(pc.isNice()) output("<i>“Something tells me you’re not stripping because you’re obligated. Do you enjoy it that much?”</i>");
	else if(pc.isMischievous()) output("<i>“Now don’t get me wrong, seeing a cute kitty-rabbit like you putting on a show is worth everything, but why exactly? There’s more going on there than obligation.”</i>");
	else output("<i>“You seem to have a thing for putting on a show, but why do you put that much into it for me?”</i>");
	output("\n\nAn eye-lining blush blossoms across her face and she rapidly doles out the rest of the cards. <i>“The way I look at it, [pc.name]... I’m just a silly girl working in a casino, and I’ve been doing it for a super long time. </i>Just<i> dealing cards would be boring, plus it’s sometimes a little sad not being able to go on vacation, if you catch my drift.”</i>");
	output("\n\nHer posture straightens and her tails weave in a pattern behind her chair. <i>“There’s one thing that makes my days better, makes it all worth it, and that’s knowing for any amount of time what I can mean to someone else. Does that make sense?”</i>");
	output("\n\nYour reaction simply makes her laugh. <i>“There’re very few people who don’t like seeing a naked girl, who wouldn’t appreciate her body!”</i> She pokes one of her breasts, and her finger is swallowed to the second joint. <i>“Part of me really likes being a prize for someone, and nobody else has risen to the occasion quite like you.”</i>");
	output("\n\nIn that sentence you identified with a hint of melancholy. Dispelling it, she winks. <i>“There’s nothin’ special about it.”</i> Roo exhales quietly, and shrugs her shoulders. <i>“Let’s see where your luck stands this time, sweetie!”</i>");
	processTime(14);
	IncrementFlag("ROO_FETISH_TALK");
	rooMenu();
}


//[Sex]
// Tooltip: Now that she’s done for the day, what’s stopping you from getting your real reward?
// Option only appears after Roo gamegasms a 3rd time, and will then be available for >=4 gamegasms.
// After 6 gamegasms, Roo offers to take an offshoot of Gush. Her tits will temporarily grow a few cup sizes and begin producing milk. It will last until all of the milk is drained; her tits go back to normal afterwards.
public function rooSexMenu(display:Boolean = true):void
{
	if(display)
	{
		clearOutput();
		showRoo();
		output("Roo’s down for fun, but what do you want to do with her?");
	}
	clearMenu();
	//[Undertable Oral]
	// Tooltip: Make Roo service you under the table. Her tongue’s probably as nimble as her fingers!
	// Requires Genitals, and is usable by all body types.
	// Able to choose Cock or Vagina if Herm.
	addButton(0,"U.Table Oral",undertableOral,undefined,"Undertable Oral","Make Roo service you under the table. Her tongue’s probably as nimble as her fingers!");
	if(pc.hasCock() && pc.cockThatFits(rooCapacity()) >= 0) addButton(1,"Table Fuck",tableFuckRoo,undefined,"Table Fuck","Flop the lapcat on the table and rail her!");
	else if(!pc.hasCock()) addDisabledButton(1,"Table Fuck","Table Fuck","Go spend your winnings on a brand new penis so you can fuck Roo with it!");
	else addDisabledButton(1,"Table Fuck","Table Fuck","You’re way too big for this kitty!");
	addButton(5,"Never Mind",turnDownRoocipher);
}

//[Undertable Oral]
// Tooltip: Make Roo service you under the table. Her tongue’s probably as nimble as her fingers!
// Requires Genitals, and is usable by all body types.
// Able to choose Cock or Vagina if Herm.
public function undertableOral(forceGenital:Number = 0):void
{
	clearOutput();
	showRoo();
	// PC is Herm, choosing dick or puss
	if(pc.isHerm() && forceGenital == 0)
	{
		output("What part of your body do you want the feline to fancy?");
		clearMenu();
		//[Dick{s}] [Puss{y/ies}]
		addButton(0,"Dick" + (pc.hasCocks() ? "s":""), undertableOral,1);
		addButton(1,"Puss" + (pc.hasVaginas() ? "ies":"y"), undertableOral,2);
		return;
	}
	var dicking:Boolean = false;
	if(pc.hasCock() && !pc.hasVagina()) dicking = true;
	if(forceGenital == 1) dicking = true;
	var x:int = 0;
	if(dicking) x = pc.biggestCockIndex();
	else x = rand(pc.totalVaginas());
	//set "dicking" true for dickuse, "cunting" for vaguse. Also set up passthru arg for herm menu!
	//set X to be the dick or vajazzle
	// Roo Gamegasms 4-9
	if(flags["ROO_GASMED"] < 10)
	{
		// PC using Dick
		if(dicking)
		{
			if(pc.isBimbo()) output("<i>“Oh um... my " + (pc.hasCocks() ? "dicks are":"dick is") + " super hard!”</i> you cry in a delirious, begging tone. <i>“Please take care of it!”</i>");
			else if(pc.isBro()) output("<i>“Put those lips to work on my dick,”</i> you mutter, spreading your [pc.thighs] wider.");
			else if(pc.isNice()) output("<i>“How about a blowjob, then?”</i> you suggest with a sheepish smile.");
			else if(pc.isMischievous()) output("<i>“Your head in my lap is a great start,”</i> you grin, <i>“and your lips on the cock" + (pc.hasCocks() ? "s":"") + " you’ve teased all night would be a textbook finish.”</i>");
			else output("<i>“Suck my cock" + (pc.hasCocks() ? "s":"") + " then, if you’re really that much of an eager slut.”</i>");
		}
		// PC using Pussy
		else
		{
			if(pc.isBimbo()) output("<i>“Please suck my pussy! Watching you got me so turned on I like, can’t think straight!”</i> you beg helplessly.");
			else if(pc.isBro()) output("<i>“Your mouth, my pussy. Now,”</i> you grunt.");
			else if(pc.isNice()) output("<i>“If it’s no trouble, would you eat me out? I really need someone down there...”</i> you inquire demurely.");
			else if(pc.isMischievous()) output("<i>“I’ve won money, a drink, and you,”</i> you start, leaning back, <i>“and I want your lips on my pussy, giving me a taste of what you just went through.”</i>");
			else output("<i>“Lick me out with all you’ve got,”</i> you grunt. <i>“Show your VIP the proper respect.”</i>");
		}
	}
	// Roo Gamegasms >=10
	else
	{
		output("You politely pull Roo from the table, guiding her toes to the floor before gently pushing on her shoulders. Sensing your wants, she kneels before your widening crotch, ready to get to work.");

		// PC using Dick
		if(dicking)
		{
			if(pc.isBimbo()) output("<i>“My " + (!pc.hasCocks() ? "cock really needs":"cocks really need") + " a little lip service! Pleeaase Rooooo?”</i> you request airily.");
			else if(pc.isBro()) output("<i>“My dick" + (pc.hasCocks() ? "s":"") + " could use a good suck,”</i> you murmur.");
			else if(pc.isNice()) output("<i>“You’re the one responsible for " + (!pc.hasCocks() ? "this":"these") + " being so hard,”</i> you pat your [pc.cocksLight], quietly finishing, <i>“so help me lighten the load.”</i>");
			else if(pc.isMischievous()) output("<i>“Only way I’m gonna leave here satisfied is if you fix " + (!pc.hasCocks() ? "this little problem":"these little problems") + " you’ve caused,”</i> you chuckle, tracing a finger down your [pc.cocksLight], <i>“show me how good you are with that tongue" + (flags["ROO_BJS"] != undefined ? " again":"") + "!”</i>");
			else output("<i>“Use your mouth, your hands, your tongue,”</i> you order, <i>“service me.”</i>");
		}
		// PC using Pussy
		else
		{
			if(pc.isBimbo()) output("<i>“I hope you really, really like wet puss" + (!pc.hasVaginas() ? "y":"ies") + ", because mine need" + (!pc.hasVaginas() ? "s":"") + " a lot of licking!”</i> you cheer, flashing a dopey smile.");
			else if(pc.isBro()) output("<i>“I know how much you love pussy,”</i> you smirk.");
			else if(pc.isNice()) output("<i>“Let me feel what you felt tonight,”</i> you say with a warm smile" + (pc.balls > 0 ? ", moving your [pc.ballsNoun] out of the way":"") + ", <i>“I want you to eat me out better than anyone.”</i>");
			else if(pc.isMischievous()) 
			{
				output("<i>“Watching you enjoy yourself made me want a taste of that pleasure,”</i> you simper");
				if(pc.balls > 0) output(", hefting your [pc.ballsNoun] off your vulva" + (pc.hasVaginas() ? "e":"") + ", <i>“my puss" + (!pc.hasVaginas() ? "y":"ies") + " enjoyed the show anyway. How ‘bout an encore?”</i>");
			}
			else output("<i>“Eat me out, and do your best to make me feel what you did a second ago,”</i> you command.”</i>");
		}
	}
	// Merge
	output("\n\n<i>“As you wish,”</i> Roo whispers, giggling cutely ");
	if(pc.isTaur()) 
	{
		output("while sliding under your hindquarters ");
		output("and rubbing her cheek to your " + (dicking ? "[pc.cock " + x + "]":"[pc.pussy " + x + "]") + ", taking a long, trembling whiff of " + (!pc.isCrotchExposed() ? "concealed ":"") + (!dicking ? "mare-":"stud-") + "musk. You lift up and plant your front legs on the table, swiveling a bit to give yourself a view of the horny suckslut.");
	}
	else output("while burying her face in your groin and breathing in your " + (!dicking ? "girl-":"phallic ") + "musk, groping carefully at the ");
 	if(!pc.isCrotchExposed())
 	{
 		if(dicking) output("bulge");
 		else output("outline");
 	}
 	else output("flesh");
 	output(" of your " + (dicking ? "[pc.cocks]":"[pc.pussies]") + ".");
	
	// PC using Cock
	if(dicking)
	{
		output("\n\n<i>“This is my reward,”</i> she quips" + (!pc.isCrotchExposed() ? ", nuzzling one last time into your confined maleness before pulling your soiled [pc.crotchCovers] out of the way, allowing your proud tumescence to pop free":", stroking your burgeoning tumescence") + ". <i>“And...”</i> she murmurs, pressing her nose to your [pc.cockType " + x + "] broadness, <i>“it " + (flags["ROO_BJS"] == undefined ? "is one of the finest I’ve ever received":"is one I will always eagerly receive") + ".”</i> She brushes a finger at your [pc.cockHead " + x + "], coaxing out teeth-filtered moans and [pc.cumColor] dollops to saturate her sleeves of white fur.");
		output("\n\nHer silken tongue emerges, lapping gingerly at one stand-out vein before the fullness of her sodden muscle graciously loops beneath and ends at the opposite side of your rod, vibrating from the rumbly purr in the back of her throat. Roo’s head slides to the left and her paws to the right, swirling her fluffy tails around " + (pc.tallness >= 7*12 ? "your [pc.legsNoun]":"your waist") + ".");
		output("\n\n" + (pc.cocks[x].cType == GLOBAL.TYPE_EQUINE ? "Her body seems to writhe when she crosses your medial ring, spending ample time lubing your halo of endowment. ":"") + "Staining herself in your juices lends her fur an innate, prick-pleasing friction that gently swells your urethra into fullness. More pre flows");
		if(pc.hasSheath(x) || pc.hasKnot(x))
		{
			output(", making " + (pc.hasSheath(x) ? "her mischievous sheath-fingerings":"the teasing of your [pc.knot " + x + "]") + " far more pleasant");
		}
		output(", and a familiar knot catches in your male half.");
		output("\n\nThe dexterous dealer’s digits curve and wind around your [pc.cock " + x + "], shining it in her copious saliva and massaging it to another level of stiffness altogether. When her tongue drags towards your [pc.cockHead " + x + "], she " + (pc.cocks[x].hasFlag(GLOBAL.FLAG_FORESKINNED) ? "peels back your foreskin with her pink taster and ":"") + "plants a soul-stealing kiss on your tip, suckling a load of palate-rinsing pre into her mouth. Faint lipstick marks start indiscernible and shine distinctly after after every subsequent smooch.");

		// PC balls
		if(pc.balls > 0)
		{
			output("\n\nOn the inverse stroke, the kaithrit lowers her head into your ");
			if(pc.hasFur()) output("fuzzy");
			else if(pc.hasScales()) output("scaly");
			else output("doughy");
			output(" [pc.ballsNoun], ");
			if(pc.balls < 2) 
			{
				output("raising her chin and planting her flared nostrils against your single ");
				if(pc.ballDiameter() < 3) output("weighty");
				else if(pc.ballDiameter() < 6) output("hefty");
				else output("huge");
				output(" testicle");
			}
			else
			{
				output("slotting her nose in the crease between your ");
				if(pc.ballDiameter() < 3) output("weighty");
				else if(pc.ballDiameter() < 6) output("hefty");
				else output("tremendous");
				output(" nuts");
			}
			output(", tongue dancing out to circle " + (pc.balls == 1 ? "it":"each one") + " in open-mouthed worship. From the delirious musk-drunk moans the ‘nad-loving kitty makes, you get the feeling she prefers the taste of your churning nut-stash to everything else, spending a mind-melting amount of time groaning into your ");
			if(pc.balls == 1) output("slippery jewel");
			else output(num2Text(pc.balls) + " slippery jewels");
			output(". When she does pull away, she’s left kiss marks across the ");
			if(pc.hasFur()) output("pelt");
			else if(pc.hasScales()) output("sheen");
			else output("skin");
			output(" of your roiling pouch, enriching your pot with a larger prize of [pc.cumNoun].");
		}
		// Multicock
		if(pc.cockTotal() > 1)
		{
			output("\n\nShe handles your extra penis" + (pc.cockTotal() > 2 ? "es":"") + " with the same finesse as her deck of cards, keeping her spit-speckled mouth on your [pc.cockNoun " + x + "], expertly jerking your unattended, dribbling one" + (pc.cockTotal() > 2 ? "s":"") + " to the side. Her delicate paws switch to firm, girth-encompassing tugs that flatten veins and force throbs that spurt pre into her hair, onto her ears, and across her face with the flick of agile wrists. Even though only one cock is going to enjoy the pleasure of her pillowy lips, she has no intention of leaving your untasted masculinit" + (pc.cockTotal() == 2 ? "y":"ies") + " out.");
		}
		// Merge
		output("\n\nMuffled vocals broken apart by absent-minded purrs thrum across your kaithrit-girded [pc.cocksLight], Roo leaving a slight mess of makeup to remind future lovers of her time spent servicing you. Now that you’re allowed to touch her, you build up enough tolerance to her electrifying technique to reward her efforts, stroking on her loppy ears and clenching your [pc.fingers] around locks of snowy hair.");
		output("\n\nMomentarily distracted by the next raw heave of ascending orgasm, you nearly miss Roo sitting up and slotting your [pc.cock " + x + "] into her cleavage. Your mind explodes from the suddenly plush compression of sumptuous boobflesh gloving your member in a warm-hearted embrace. Both hand-overflowing tits squish around your impossibly hard dick like two sides of a fluffy sandwich. Roo’s mouth curves into a willing smile, and with one arm belting her slick breasts, she pumps up and down, fat nipples poking into your [pc.knotOrSheath " + x + "]" + (pc.balls > 0 ? " and once or twice into your [pc.ballsNoun]":"") + ".");
		output("\n\n<i>“Hehe, I hope you don’t mind a titfuck too!”</i> She slurps ardently at [pc.eachCockHead] when it comes close enough. You encourage it, not about to turn down a trip through her quivering mammaries. Pretty soon her whole body has accumulated enough [pc.cumColor]-tinted moisture that she could catch anyone’s eye even from across the casino.");
		if(pc.cocks[x].cLength() < 12) output(" Your cock vanishes into");
		else output(" Your cock is too big to totally vanish into");
		output(" her enviable bosom, tucked gently into her bed of sultry delight.");

		if(pc.exhibitionism() < 66) output("\n\nThe eyes of so many people on you is a somewhat cold reminder of your vulnerability in front of so many slavers and pirates. You catch sight of one recording device between the burly arms of two security officers, hoping whoever’s holding is keeping it for personal use. Roo snaps a finger in front of your eyes, <i>“Don’t look that way, [pc.name]. I’m here.”</i>");
		else 
		{
			output("\n\nYou and Roo are kindred spirits, doing your best to show off what’s happening to every witness and recorder in the surrounding crowd. ");
			if(pc.biggestTitSize() >= 1) 
			{
				output("You find the sense to fondle and play with your [pc.breasts]");
				if(!pc.isChestExposed()) output(", slipping them free of your [pc.chestCovers]");
				if(pc.canMilkSquirt()) output(", squirting [pc.milkNoun] into the air and winning a few whistles and claps");
				output(". ");
			}
			output("While the cat-slut between your legs works you deeper, you try to angle your wanton face in angles ensuring nobody misses.");
		}
		output("\n\nPrejizz rolls down her ample form, leaving [pc.cumVisc] trails on their descent. Once or twice the happy cat squeezes you so tight in her blissful crevice that pockets of pre develop and spill or burst, causing a loop of lewdly squelching ecstasy that forces you to cry out for more of her gifted ministrations. Slumping helplessly in your seat, excitedly anticipating another cock-massage, she provokes more of those lung-keening declarations, cheering at how easily you relax into her.");
		output("\n\n[pc.Hips] lurching, you screw Roo’s titslit on your own unpositioned terms, and she’s happy to cradle your phallus ");
		if(pc.hasCocks()) output("and lick at " + (pc.cockTotal() == 2 ? "the other":"another") + " ");
		output("while you do it. Her inundated pathway shines a brain-mellowing [pc.cumGem] color, speeding you downwards through her wobbling heaven. In your [pc.cockNoun " + x + "] you can feel her heart bouncing around your firm boner like the hypnotic jiggle of her boobs flopping like crazy into your [pc.dickSkin " + x + "]. You almost want to sit up and pin her to the table, slam your [pc.cockType " + x + "] dick in [pc.knotBallsHilt " + x + "]-deep, but then you would miss out on your initial request...");
		output("\n\nThe kaithrit pushes back on your groin and abruptly unsheathes you from her wet, heaving valley. You almost explode on her then and there, and you would have if she didn’t grip tight to your painfully-bobbing dick" + (pc.hasCocks() ? "s":"") + ", breathing a pacifying air across their quivering shapes.");
		processTime(25);
		pc.changeLust(25);
		clearMenu();
		addButton(0,"Next",rooBeej2,x);
	}
	else
	{
		// PC using Pussy
		underTableRooEatsPuss(x);
	}
}

//[Next]
public function rooBeej2(x:int):void
{
	clearOutput();
	showRoo();
	author("William");
	output("<i>“Ready, [pc.name]?”</i> she purrs, licking your becalmed [pc.cockHead " + x + "] with a swirl, prostrating herself in front of your [pc.cock " + x + "]. ");
	//cockSize<7:
	if(pc.cocks[x].cLength() < 7) output("<i>“It’s such a perfect size. I’ll slot it right in, and never let go!”</i> she giggles. <i>“Then you can fill me to your heart’s desire...”</i>");
	else if(pc.cocks[x].cLength() < 14) output("<i>“I’ll never get tired of seeing a cock this big so hard for me! You have no idea how happy that makes me...”</i> she grins slyly, and your dick pulses out another strand of goop across her nose.");
	else output("<i>“I won’t be able to fit all this in my mouth, you know!”</i> she huffs, peppering your pillar with kisses. <i>“But I’ll drain you dry, don’t you worry!”</i>");

	output("\n\nRuby cushions open with a cute ‘ahh’, and Roo’s O-shaped mouth wraps lovingly around your [pc.cockHead " + x + "], and it takes all of your willpower not to thrust in and facefuck her on your ");
	if(pc.cocks[x].cLength() < 7) output("swollen");
	else if(pc.cocks[x].cLength() < 14) output("inhuman");
	else output("monstrous");
	output(" pole. She looks into your straining eyes, watching you twist in pleasure as inch after [pc.cockColor " + x + "]-hued inch disappears into her indulgent maw. Your impatient shuffles accelerate your holstering.");
	output("\n\nHer entire body gets off on being orally claimed, clenching and squirming with a desire to be debased, to be little more than a slut spitted on the cock of her favorite [pc.raceShort]. If you thought her lips were amazing before, having them wrapped passionately around your penis is maddening. They’re impossibly soft - the top and the bottom have their own unique, sensual texture that nearly releases your pressurizing loads.");
	output("\n\nBut as you stare into her eyes, you manage to hold back again, denying yourself that delicious moment of creampieing that moist pocket for a while longer. The buxom kaithrit plies you with her velveteen tongue, swirling it around the " + (pc.cocks[x].cLength() < 7 ? "heavy":"massive") + ", lubricated thickness bracing a jaw " + (pc.cocks[x].cLength() < 7 ? "well-suited for sucking dicks like yours":"not suited for sucking dicks this large") + ". Her hands steady themselves on your [pc.thighs] as she moves to take you to her throat, continuing your sopping wet journey through hollowed cheeks and sauna-like terrain.");
	output("\n\nNeedy whimpers float from your lips as her");
	//output(" pussy-tight");
	output(" uvula hugs against the " + (pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED) ? "flare":"ballooning tip") + " of your pulsating cock. Preseed plummets into her accommodating belly, squirting hard. She inhales through her nose and takes you down");
	if(pc.cocks[x].cLength() > 16) output("; although she couldn’t hope to take you all the way, you mentally thank her for the effort all the same");
	output(". Fatter globs of dick-drool widen your cumvein and stretch her open with greater amounts of liquid offering, upsetting her careful throat-threading.");
	output("\n\n");
	if(pc.cocks[x].cLength() < 6) output("But she handles you superbly" + ((pc.hasKnot(x) || pc.hasSheath(x)) ? ", even taking your [pc.knotOrSheath " + x + "] inside":"") + " before slapping her nose to your [pc.belly] and filling her few breaths now with your salty moistness while her impish tongue laps at your [pc.knotBallsHilt " + x + "].");
	else if(pc.cocks[x].cLength() < 14) output("But she sucks your supreme dick down, glossing you " + (pc.cocks[x].cType == GLOBAL.TYPE_EQUINE ? "past your medial ring ":"") + "and ending just before your [pc.knotBallsHilt " + x + "], gagging slightly before " + ((pc.hasKnot(x) || pc.hasSheath(x)) ? "your [pc.knotOrSheath " + x + "]":"several unobtainable inches") + ". You rub her head, an avalanche of praise spilling out.");
	else output("She can’t take your mass very far before her obstinate throat locks up. Your [pc.cockHead " + x + "] does inflate noticeably just above her breast, but it’s only a few seconds before she sputters and pulls back for relief. You’re just happy she tried where few else would.");

	output("\n\nRoo’s throat refreshes for another go, and the rhythmic narrowing of cock-conquered muscle gapes a few centimeters wider as her shallow fellatio continues. It’s almost more than your libido can stand. ");
	if(pc.isBimbo() || pc.isMischievous() || pc.isNice()) output(" A more primal, animalistic side of you wants to gag and ruin her, but your better nature prevails, soothed in part by your soft strokes to her ears.");
	else output(" You " + (!pc.isTaur() ? "grab her by the ears and ":"") + "force more in than she can yet handle, satisfying your urges and impressing your audience when she kicks a leg back in shock.");

	output("\n\nRelentless ripples of looping muscle tighten around your [pc.cock " + x + "], inconsistently aimed. ");
	if(pc.cockTotal() == 1) output(" Now that she’s adjusted to your meat, she uses her free hands to massage and stimulate any exposed flesh on her withdrawals.");
	else output(" Adjusted to your largest slab of meat, Roo uses her hands to jack your spare cock" + (pc.cockTotal() > 1 ? "s":"") + " in tentative movements.");
	output(" Esophageal nerves pull tight until your tip is a new adam’s apple");
	if(pc.cocks[x].cLength() < 12 && (pc.hasKnot(x) || pc.hasSheath(x))) output(", drawing you deep enough that your " + (pc.hasKnot(x) ? "knot":"sheath") + " noisily pops inside");
	else if(pc.cocks[x].cLength() < 16 && pc.balls > 0) output(", pulling so hard that your [pc.ballsNoun] slap" + (pc.balls == 1 ? "s":"") + " brutally against the overflowing channel of her chin");
	output(".");

	// feline or barbed cock
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY) || pc.cocks[x].cType == GLOBAL.TYPE_FELINE) output("\n\nRoo’s throat is scrubbed thoroughly the spongy, nubby distensions bristling along your [pc.cockColor " + x + "] shaft. They brush her sensitive interior with an almost abrading force, but you can tell that she appreciates it. For this wide-eyed feline she probably can’t imagine sheathing any other cock in the sweltering confines of her facial fuckhole.");
	
	// merge
	output("\n\nThe kaithrit’s fluffy head must be swimming now - you can smell fluid passion raining between her legs. Roo’s calculating yet bubbly exterior has been wholly replaced with reverence for savory " + (pc.hasVagina() ? "herm-":"") + "meat. The tiny exhalations from her nostrils are acutely pleasurable, providing a cooling contrast to the warmth of saliva on your exposed cock.");
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(" She’s not at all ready for the tendrils inside either, which now sting her with potent loads of lust venom that serve to amplify the feline purr into a body-quaking jitter.");
	output("\n\nThe ease at which Roo takes you inside without discomfort speaks volumes of what experience she has, and of her willingness. She licks and laps at you, swallowing " + (pc.cumQ() < 15000 ? "belly-filling":"gut-distending") + " amounts of fluid, jacking with all her might, moaning faster and faster, all with the edges of her full lips quirked up in a delighted smile. <i>“[pc.name],”</i> she mumbles, her words slurred by a mouthful of tightening dick, <i>“you don’t haff to hold back!”</i>");
	output("\n\nYou thrust hard into her face, now, gripping tight to her head, no longer able to remain passive. She wiggles her oral organ back and forth, matching your speed with pendulous bobs of feral excitement. Roo can sense your orgasm in the throbs of your beefy prong. They’re her only warning, lost as your fully occupied brain is to fucking the kitty-bitch’s primrose maw. <i>“Cum, please!”</i> she husks.");
	output("\n\nIt’s your turn to feel like a jackpot. Gasping through gritted teeth you hammer into Roo’s throat");
	if(pc.cocks[x].cLength() < 12 && pc.hasKnot(x)) output(", ramming your [pc.knot " + x + "] through the gap");
	if(pc.hasSheath(x)) output(", swaddling her nose in your pheromone-charged cock-pocket");
	output(". The wild clenching of her throat on your gut-locked [pc.cockHead " + x + "] milks you to the edge of consciousness." + (pc.hasVagina() ? " You nearly do pass out when a finger and thumb pinch around [pc.oneClit], expressing a crash of [pc.girlCumVisc] feminine bliss into the mix.":""));
	output("\n\nThe combined voices of your audience bellow celebratorily, but it all drowns out under the hew of male orgasm.");
	// low cum (<500 mL)
	if(pc.cumQ() < 500)
	{
		output("\n\nThe first shot of [pc.cumNoun] jets into Roo’s belly. Her throat and mouth reward your slow, groaning thrusts with savage milking force, burying your member in deep as possible and urging your [pc.cumVisc] load to surge. You release it all, desperate to drain yourself in the ");
		if(pc.balls > 0) output("ball-squeezing ");
		output("kaithrit’s insides. The little amount you feed her at first seems disappointing. Nothing in her mien suggests displeasure, but she’s shudderingly hungry for more.");
		if(pc.cockTotal() > 1) output(" The middling amounts your extra dick" + (pc.cockTotal() > 2 ? "s":"") + " offer" + (pc.cockTotal() == 2 ? "s":"") + " up in her hair seem to be a good compensation!");
	}
	// oodles of cum (501-2999mL)
	else if(pc.cumQ() < 3000)
	{
		output("\n\nRocking against Roo’s mouth, you spunk her with belly-saturating blasts of [pc.cum]. She gurgles and whimpers as some [pc.cumFlavor] goop rises up around your holstered dick, which even now you’re spastically drilling into her. A round, ejaculate-taut pudge forms at her once-flat tummy, filling out to house your [pc.cumGem] reservoir. Her own passions are stoked by the virility you shoot into her, and she cums again, squirting out gouts of femjuice.");
		if(pc.cockTotal() > 1) output(" Wads of [pc.cumColor] sperm shot off onto and over the table, until your extra dick" + (pc.cockTotal() > 3 ? "s":"") + " reduce" + (pc.cockTotal() == 2 ? "s":"") + " to a relaxing, kaithrit-shampooing dribble.");
	}
	// plenty of cum (3000-5999mL)
	else if(pc.cumQ() < 6000)
	{
		output("\n\n[pc.Cum] pours through your [pc.cock " + x + "], inflating Roo’s throat with violent amounts of onrushing cream. The impressive nut you’re busting strains her wider to accept it, and her lithe body can’t hope to contain it all without making additional space in the form of a rounding, greedy gut. The ruby-eyed kaithrit drowns in [pc.cumGem] goo, a few ropes spilling from her nostrils as you pump the " + (pc.balls > 0 ? "ball-squeezing ":"") + "kitty full of [pc.cumFlavor] spooge. She, too, cums from the rush of it all. Seems being the recipient to such a mighty orgasm is right up her alley, as your bitch-kitten’s pussy is spurting in time with your shudderingly powerful cumshots.");
		if(pc.cockTotal() > 1) output(" Some of your reservoir is shunted to your extra dick" + (pc.cockTotal() > 2 ? "s":"") + ", which throb out obscene amounts of the stuff that carry halfway across the game floor, not quite close enough to hitting your aroused viewers.");
	}
	// lots of cum (6000-not quite 10kmL)
	else
	{
		output("\n\nIt’s impossible not to scream from the release Roo brings you to. Her throat gains a few inches of spermy mass as soon as you grace her with the first column of [pc.cum]. Her entire body turns into a lurching, spasmodic wreck when it cannonballs into her cum-thirsty stomach. Her hands fall limp to the side as she wobbles like a ragdoll, a slave to your mast-stiffening pulses of [pc.cumFlavor] jizz. You sit up from the chair" + (pc.balls > 0 ? ", [pc.ballsNoun] pressed to her chin":"") + ", and flush her system with goo. Her abdomen swells massively, inundating from tum to bum; ropes of semen filter through her nose, and even around her lips. Her eyes go vacant, rolling back, she squirts and cums pitifully on the spot, little more than a cumdump feasting on her favorite meal.");
		if(pc.cockTotal() > 1) output(" It fatigues your testicular plumbing to split the [pc.cumGem] load " + num2Text(pc.cockTotal()) + " ways, and your deep-[pc.cumColor] load fires out across the room, nailing the table, security, and your hapless audience.");
		if(pc.cumQ() >= 10000)
		{
			output("\n\nUnfortunately for the kaithrit, you’re not done yet, and you have no choice but to pull free lest you truly suffocate her on curve-fattening jism. You slam a fist into the table, setting off sabotage alarms, yanking her head off your mizzenmast; the tension renews in your nut-busting tool. Fresh gouts of the stuff lance out to strike her now, gifting Roo a blinding [pc.cumColor] facial of [pc.cumNoun]. The sensitivity in your rod is such that you can’t hope to control its targeted saturations, and you fall back into the seat, fountaining weaving tendrils of jizz across the room, painting everyone and everything in your scent and flavor, idly hoping in the back of your mind you don’t catch heat for this.");
			output("\n\nBut it’s worth it, seeing Roo utterly glazed, and seeing out of your periphery a Jumper slutbun getting spunked by your oceanic gratefulness.");
		}
	}
	// Merge
	if(pc.cumQ() < 6000) output("\n\nRoo slides off your cock with a wet pop.");
	else output("\n\nRoo sputters and wipes her windshield with both arms, panting dryly.");
	if (pc.cumType == GLOBAL.FLUID_TYPE_CHOCOLATE_CUM) output(" She slurps up the dregs of your still-warm release, puffing out her cheeks with seed-filled chocolate. The kitty cums again, moaning in confectionery delight. She gulps the hot, melty, creamy dark nut down, cumming <i>again,</i> looking extremely well fed.");
	output(" <i>“M-My... [pc.name]... that was delicious,”</i> she grins, patting her belly.");
	output("\n\nSatisfied eyes gaze longingly at your receding [pc.cocksLight]" + (pc.balls > 0 ? " and your diminished [pc.ballsNoun]":"") + "; she passes the seconds catching her breath and savoring the warmth you emptied into ");
	if(pc.cumQ() >= 6000) output("and onto ");
	output("her. <i>“I’ll never forget how this makes me feel. Thank you.”</i>");

	if(rooPantyProcChance()) 
	{
		processTime(35);
		pc.orgasm();
		pc.imbibeAlcohol(50);
		IncrementFlag("ROO_SEXED");
		IncrementFlag("ROO_BJS");
		clearMenu();
		addButton(0,"Next",rooPantyCollectScene,"notBack");
		return;
	}
	// Normal End
	output("\n\nAnd neither will you. Casino security disperse your peanut gallery as galotians come by to clean the place. Roo retrieves her attire, blows you a kiss, and heads off with the toughs.");
	output("\n\nMiraculously, you’re not entirely sure how, but your <i>Ruby Tether</i> survived the sex untarnished. After that, you aren’t about to say no to that godlike beverage. You don’t even attempt to relish it, just downing it, rejuvenating your body with top-tier alcohol. Striding off the game floor you let the staff take it all from there, thousands of credits richer, and wondering when next you might come back for such quality service...");
	processTime(35);
	pc.orgasm();
	var ppBJMeow:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppBJMeow.loadInMouth(pc);
	pc.imbibeAlcohol(50);
	IncrementFlag("ROO_SEXED");
	IncrementFlag("ROO_BJS");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// PC using Pussy
public function underTableRooEatsPuss(x:int = 0):void
{
	clearOutput();
	showRoo();
	author("William");
	output("<i>“I can’t wait to see how wet you get" + (flags["ROO_CUNNILINGED"] == undefined ? " this time":"") + ", [pc.name],”</i> Roo snickers, running a hand across your nethers. ");
	if(!pc.isCrotchExposed()) output("She digs your feminine equipment out from under your [pc.crotchCovers]");
	else output("She rubs a small circle into [pc.oneClit]");
	output(", admiring the ");
	//wetness: 
	if(pc.vaginas[x].wetness() < 2) output("reddened and slightly wet");
	else if(pc.vaginas[x].wetness() < 3) output("plump, moistening");
	else if(pc.vaginas[x].wetness() < 4) output("drooling");
	else if(pc.vaginas[x].wetness() < 5) output("sopping wet");
	else output("beautifully soaked");
	output(" [pc.vaginaColor " + x + "] texture of your vagina. <i>“It’s " + (flags["ROO_CUNNILINGED"] == undefined ? "always ":"") + "so pretty,”</i> the kaithrit coos, <i>“so aroused and ready to be taken!”</i>");
	output("\n\nShe leans closer to your heat-radiating slit; her tongue slithers out to lap at either side of your " + (pc.vaginalPuffiness(x) > 0 ? "pumped-up ":"") + "folds. You squeak appreciably, and your yelp elongates into a proper moan when she pulls the ");
	if(pc.vaginas[x].looseness() < 2) output("rigid,");
	else if(pc.vaginas[x].looseness() < 4) output("resilient,");
	else output("limber,");
	output(" sensitive skin apart to sample the interior. A ");
	if(pc.vaginas[x].wetness() < 3) output("droplet");
	else if(pc.vaginas[x].wetness() < 5) output("stream");
	else output("gush");
	output(" of [pc.girlCumVisc] secretion ");
	if(pc.vaginas[x].wetness() < 3) output("clings to");
	else output("covers");
	output(" her hand. The [pc.girlCumFlavor] taste makes her hum with delight.");

	output("\n\n<i>“[pc.name], you better not let just anyone taste this,”</i> she murmurs, <i>“" + (pc.vaginas[x].hymen ? "because you are a greater prize than I.":"because you have an exquisite flavor.") + "”</i>");
	output("\n\nHer sugar-seeking muscle fully emerges, slicking over your delta and polishing your pussy’s exterior in a sheen of wetness that makes it shine like a beacon in the dark, dim lighting. There’s no doubt in your mind that everyone’s pointing their cameras at your [pc.face], glowing red-hot with embarrassment and arousal. Roo takes it so very slow that you feel like you’re out on the lake, sitting next to your romantic fling as the fog closes in.");
	output("\n\nTheir distinct bunny ears bob up and down, and in the wide-eyed kaithrit’s gaze is the reflection of your [pc.vaginasLight], glistening in dazzling casino lights. You didn’t expect to be taken so easily by the bunny-cat’s sapphic affections, but here you are, begging her to taste more. Your [pc.vagina " + x + "] dominates her mind with its smooth, supple features, and she in turn, takes control of you by your ruinously-teased femininity.");
	output("\n\nThe fragrant dew trickling from your entrance is suckled greedily with unerring accuracy. She harvests the first, tastiest drops of nectar from you, purring into your supplicating walls. Fluttering cat tails weave around your " + (pc.tallness/12 >= 7 ? "[pc.legOrLegsNoun]":"waist") + ", clenching tight in a possessive alien gesture. You can only endure her remarkably gentle licks and kisses for a short while before another mini-orgasm puddles prettily into her maw.");
	output("\n\nRoo " + (pc.balls > 0 ? "hefts your [pc.ballsNoun] out of the way and ":"") + "rakes her cheek across the surface of your " + (!pc.hasVaginas() ? "twat":"arrayed twats") + ", smearing her horny face in clingy pheromones. Her nose deflects off your [pc.clit], ");
	if(pc.clitLength < 0.5) output("a tiny, throbbing button of soul-searing nerves");
	else if(pc.clitLength < 0.75) output("a cute, quivering orb");
	else if(pc.clitLength < 1.5) output("a lube-lacquered gumball of muscle-locking potential");
	else output("a suckable pole of oversexed flesh");
	output(". Very carefully your vaginal buzzer is pinched between her teeth and rolled back and forth, causing you to arch back and gush a little more enthusiastically, spitting out enough pheromones that yours and hers become a visible soup of sexual humidity.");

	//Image here

	output("\n\n");
	showImage("RooUnderTableLick");
	output("Those bright, velvety lips of hers...");
	if(flags["ROO_CUNNILINGED"] == undefined) output(" if you thought they felt amazing at any other point, you weren’t ready for feeling them where it matters most");
	else output(" you’re never prepared for their inhuman suppleness You’re not sure if kaithrits have better lips than most, or if hers are modded, but their contact is greater than any finger or cock");
	output(". Her tongue is barely felt for their exquisite plushness. Roo’s carmine cushions seem to have two different luxurious textures spread out among upper and lower lip, and all you can do is quiver nervelessly, somehow made so sensitive to those sparkling pleasure-pillows.");
	// PC dicksize clit
	if(pc.clitLength > 3.5) output("\n\n<i>“Aww, this is kind of adorable, actually!”</i> she laughs, pursing her amazingly soft lips into a small, clit-hugging ‘O’. The cunt-kissing kaithrit inhales your unnatural length of clitoral flesh, swishing her tongue to the underside of nerves never meant to grow into a full-on pole. While she dances orally at your hypersexed muscle, a dizzying pressure nearly overwhelms you with raw, riotous sensations. You hurriedly grab her head and pull her off before it becomes too much, and she thankfully abates.");
	// PC pumped pussy
	if(pc.vaginalPuffiness(x)) output("\n\n<i>“There’s so much here, you’d make other women jealous!”</i> From where Roo’s furry fingers are pressing, you’re sure she must be referring to the obscene amounts of pussy there is to worship. Vibrant ripples and nerve tingling stimulations assault you from every end as she drags her mouth, tongue, and hands over vast amounts of feminine flesh. She gets a single rough lick in before you grip her ears and whine, a half-hearted orgasm spilling out. Not to be interrupted, she lunges in and completes your satisfaction, sprinkling herself in your yielding bliss.");
	// Merge
	output("\n\n<i>“Now, how about I see what it’s like inside?”</i> she airily suggests. You don’t doubt it’ll be to her liking, considering how moist you are, how ready you are for anyone or anything to pump inside and quench this burning need. ");
	if(pc.libido() < 33) output("You would probably go insane if she up and left you alone, alone yet surrounded, crying out for help.");
	else output("If she left you alone now, you wouldn’t think twice about hopping on any number of the able dicks in this room, draining their balls into your womb. There’s a mouse-eared character watching fervidly. In his eyes, you plainly see capability and want.");
	output("\n\nFluffy tails tightening blissfully, Roo wiggles her nose into [pc.onePussy], tongue slipping past your wet, unfurling slopes. <i>“Mmmm,”</i> Roo moans, widening your most sensitive place, shocking your system with another ambrosial harvest. Elegant fingers tenderly massage your skin, opening your " + (pc.elasticity < 2 ? "inflexible":"elastic") + " hole up to further inspection. The slowness at which she handles you is masterful, and it brings you to a new level of wetness, something her narrowed eyes greatly approve of.");
	output("\n\nLurching forward, [pc.thighs] clenching, you");
	if(!pc.isTaur()) output(" grab Roo by the ears and hold tight");
	else output(" shift all your weight onto Roo’s face");
	output(", hyperventilating on the edge of a tectonic orgasm. The slut-cat whimpers but doesn’t resist, clearly enjoying a little rough treatment. You decide to set the pace, unwilling to be little more than [pc.aRaceShort] cumming like crazy, helpless to those expansive, heavenly... lips...");
	output("\n\nOh right...");
	output("\n\nBefore Roo gets any ideas you seat her drooling and cum-splattered face deeper into your bliss-imbued [pc.pussyNoun " + x + "]. Your [pc.hips] rock against her head, taking pleasure directly from her. She obliges, allowing you to use her like a lop-eared dildo, suckling firmly on your labia and worshiping your clit with lurid, squelching echoes. The kitty-rabbit has yet to lose herself to wantonness: she just purrs away, faintly squeaking while filling you to capacity with tongue and lip.");
	// PC gryvain pussy
	if(pc.vaginas[x].type == GLOBAL.TYPE_GRYVAIN)
	{
		output("\n\nYou owe a lot of your pleasure to your gryvain biology. The unique interior of your [pc.vaginaColor " + x + "] cunny is lined with a bunch of clit-like nodules that react strongly to any stimulation. A tongue, in this instance, nearly rolls your eyes clean back into your skull as well as a cock can. When your walls tighten in contracting euphoria, every one of those ‘dents’ rubs against each other and clamps down on her invading muscle, and <i>that’s</i> when your " + (!pc.isSquirter() ? "lip-soaking minigasms":"squirts") + " are at their strongest" + (silly ? " and your ahegao is maximized":"") + ".");
	}
	// PC suula or stinger pussy
	if(pc.vaginas[x].type == GLOBAL.TYPE_SUULA || pc.vaginas[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
	{
		output("\n\nNone of your cilia or pussy-tendrils have been left unmolested, and thoroughly roused, they sting back at the invader. Roo’s face lights up brighter than a Christmas ornament, prickling numbness racing through her nervous system. The venom allows her to perceive every source of stimulus with precision detail. The way she begins to treat you now indicates that your pussy went from being simply incredible to the most marvelous muff of all.");
	}
	// Merge
	output("\n\nShe saws you in half, curving and twisting that pussy-pleasing muscle through your juicing genitals. You pause, breath coming too hot, eyes totally glazed over with anticipation of ramping up. Not just that, but being seen by so many people is...");
	if(pc.exhibitionism() < 50) output("\n\n...unnerving. A chill arcs through your abdominals and ices your brain. All of a sudden your indecency feels out of place and violated, and you nervously look around while Roo slobbers away. A pair of fingers snap near your [pc.ear], and her voice comes, <i>“[pc.name], don’t worry about anything, I’m right here with you!”</i>");
	else output("\n\n...fucking hot. Everybody watching you getting the best cunnilingus on station. Everybody can smell your pheromones ripe in the air, wanting so badly to have a touch or taste of you, and Roo too. But they can’t. They have to observe, they have to see you enjoy yourself to the fullest. " + (pc.biggestTitSize() >= 1 ? "You pull your [pc.chestCovers] down and":"You") + " give them an extra show, pinching one [pc.nippleNoun].");
	output("\n\nYou look down again and say to Roo, <i>“");
	if(pc.libido() < 33) output("Please... take care of it.");
	else if(pc.libido() < 66) output("Make me cum so hard I forget who I am!");
	else output("Turn me into a sloppy slut... just like you!");
	output("”</i>");
	output("\n\nRoo doesn’t keep you waiting long. Before launching into a frenzied, pussy-sucking rhythm, she jerks her head into your " + (pc.vaginalPuffiness(x) > 0 ? "puffy ":"") + "[pc.pussiesLight]. Your ever-moaning voice lilts, starbursts blossoming behind your retinas. Underscoring your soulful vocalizations are her fluid-soaked husks and groans. Now where her tongue hits, you swear it’s not because she wants to please you, it’s because she wants you to feel every ounce of affection she has for you.");
	output("\n\nTo another orgasm you’re licked, and then another, each time you’re shouting at the top of your lungs for more. ");
	//highCapacityAndLooseness: 
	if(pc.vaginalCapacity(x) > 500 && pc.vaginas[x].looseness() >= 4) output("With so much pussy open to her she manages to fit her entire hand in. It’s both astounding and breathtaking, and when you scream out for it, you evelop her limb in [pc.girlCumVisc] climax. ");
	output("The din of the audience is muted behind the indulgence, below the heavy whiffs of ladymusk.");

	output("\n\nAnd then, you’re wallowing in the sensations slowly pushing out your personality, your IQ, your common sense - Roo has split your cunt with her face, grabbing your twat by its fluid-flecked horn and driving you into spasmodic, arhythmically thumping bliss.");
	output("\n\nA part of you cries out indignantly that she didn’t warn you, but the rest of you tells that part to cram it. Pink and purple bands of color cocoon your vestiges of reality. Roo is a masterful appreciator of all things pussy. She strokes your [pc.clits]" + (pc.totalClits() > 1 ? ", all of them at once":"") + ". She sucks forcefully from [pc.eachPussy]" + (pc.totalVaginas() > 1 ? ", fingering whichever she isn’t actively tongefucking":"") + ". Her tails provide excellent counterbalance, keeping you from writhing off the side of your seat into a twitching heap of aggressively worshiped nerves.");
	// PC has cock
	if(pc.hasCock()) output("\n\nAlthough you asked for a good muff munching, the fastidious dealer isn’t content to leave your manliness unloved and untouched. Although she doesn’t kiss or suck, she jerks and wettens your [pc.cocks] in all forms of effluence, encouraging them to offer up a fine orgasm of their own.");
	// Merge
	output("\n\nYou take it all. Your pussy is hers. You could never hope to please yourself even half as good as her. Maybe it was all the teasing. Maybe you were just pent up. Maybe there’s something in the air making you crazy.");
	output("\n\nBut all that matters is that you cum soon, that your candied, femcum-dribbling pussy is carried to the peak. You can hear all the squelches and the schlucks, the slurps and kisses. You can see forceful ejaculations half-squirting out you, her face acting as a stop-gap that causes it all to pool and burst out. It’s so obscene, so debauched, and it’s happening in front of hundreds of people.");
	output("\n\nAnd they’re about to see you cum your heart out, melting happy and horny. They’re about to watch you absolutely adore being a slut.");
	// PC not squirter
	if(!pc.isSquirter()) output("\n\nYour [pc.pussiesLight] flex, tickled frictiously to the peak. A spine-tingling, brain-electrifying orgasm lights up your nerve clusters. Incredible pulses of sensation spasm every muscle, and it takes the kaithrit source of your ecstatic orgasm to hold you down, to suckle out [pc.girlCumColor], [pc.girlCumVisc] torrents of [pc.girlCumNoun]. It’s so absolutely intense that you can feel the brush of wind against your erect [pc.nipplesLight], mouth open and gasping as Roo’s tongue hits <i>that</i> spot, bending your walls to her will, carrying you moaning and groaning, then panting, through a phenomenal, luscious orgasm that pours out of you a glittering, [pc.girlCumGem] puddle.");
	// PC squirter
	else 
	{
		output("\n\nYour eyes water and your [pc.pussiesLight] are spread, bent, strained by the thirsty kaithrit. When orgasm crashes upwards through your system you unconsciously flex out lances of [pc.girlCum] that shatter upon Roo’s face and fervently flushes across the casino floor. She stretches you to the breaking point, working out your cataclysmic release in thunderously erotic increments. All of her efforts were devoted to <i>that</i> spot inside you, knowing exactly the area that made you howl spectacularly on the plateau.");
		output("\n\nYou moan, you curse, and moan some more before relaxing into sighs and mewls of susceptibility. Your [pc.pussiesIsAre] vibrating with untold amounts of pleasure, brought to a brilliant pinpoint where even the slightest kiss of wind could make you repeat that all over. In the aftermath, a glittering, [pc.girlCumGem] puddle spreads out from where you and Roo sit. It’s a mixture of your combined fluids like an atmosphere.");
	}
	// Merge
	if(pc.hasCock()) output("\n\nYour dick-gasm wasn’t anywhere near as exciting, and indeed wasn’t noticed. The only evidence your [pc.cocksLight] had any fun is the dregs of [pc.cum] in the kaithrit’s hair.");
	output("\n\nLacking strength, you lie there, a pleased, contented sigh drifting from your [pc.lipColor] lips and [pc.girlCumNoun] dripping from your shudderingly warm [pc.thighs] and Roo’s face. She looks fucking hot like that... covered in a delicious sheen of you. Even now she’s unthinkingly licking at it all, trying in vain to wash her face with a tongue of normal length.");
	
	//Get her panties
	if(rooPantyProcChance()) 
	{
		processTime(35);
		pc.imbibeAlcohol(50);
		pc.orgasm();
		IncrementFlag("ROO_CUNNILINGED");
		IncrementFlag("ROO_SEXED");
		clearMenu();
		addButton(0,"Next",rooPantyCollectScene,"notBack");
		return;
	}
	// Normal Ending
	else
	{
		output("\n\n<i>“Ohh, where was I...”</i> she asks.");
		output("\n\n<i>“Hiek!”</i> you wince, feeling one last stroke of oral flesh across your mons.");
		output("\n\n<i>“I loved every second of that, sweetie. I can tell you did, too,”</i> Roo laughs. <i>“Feel better? Don’t try to stand too soon, okay? Now, I have to go, I don’t want either of us getting in trouble!”</i>");
		output("\n\nSecurity arrives with a hand towel that Roo uses to clean you and wipe her face with, eventually collecting her clothes. <i>“Take care of yourself, and come back soon! We’ll be here until the heat death of the universe!”</i> she chimes.");
		output("\n\nWhile she walks off and the crowd is dispersed, you sit up to find that, somehow, your free <i>Ruby Tether</i> is still sitting there, cold and untouched. After a round like that you don’t need to think twice about re-energizing yourself with that invigorating beverage, gulping it down like a parched [pc.manWoman] in a barren desert.");
		output("\n\nYour strength returns immediately, giving you the means to get up" + (!pc.isCrotchExposed() ? ", get dressed":"") + ", and collect your winnings. Moving off the game floor, you find yourself alone with your thoughts, wondering what you can do with this newfound affluence... wondering when Roo will be back...");
		processTime(35);
		pc.orgasm();
		IncrementFlag("ROO_CUNNILINGED");
		IncrementFlag("ROO_SEXED");
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//[Table Fuck]
// Tooltip: Flop the lapcat on the table and rail her!
// Tooltip2: Go spend your winnings on a brand new penis so you can fuck Roo with it!
// Tooltip3: You’re way too big for this kitty!
// Requires penis. Roo’s capacity volume is around 17 inches|100% thickness at most.
// Roo will stick herself with a drug that makes her tits bloat with milk rapidly when she is fucked after the 6th gamegasm, making this a milkier encounter.
// After Roo uses her milky drug, the PC will be presented, after clicking this, an option to ask her to use it again, and the option is always available.
public function tableFuckRoo():void
{
	clearOutput();
	showRoo();
	author("William");
	// Special Start: 6+ Gamegasms, Roo takes a milky drug (one-time only blurb)
	if(flags["ROO_GASMED"] >= 6 && flags["ROO_MILKED"] == undefined)
	{
		clearOutput();
		showRoo();
		author("William");
		flags["ROO_MILKED"] = 1;
		output("<i>“I wanna give you something extra, [pc.name],”</i> Roo says, putting a hand to your [pc.chest] and reaching behind herself. On the dealer’s side of the fancy table she fumbles for a medipen among a few random objects. It’s filled with a bright green liquid that rolicks around its airtight container. <i>“Don’t worry, it’s for me. Keep your eyes wide open, okay?”</i>");
		output("\n\nPressing the hypo to her neck she hits the button and the fluid inside shunts instantly into her bloodstream. She flicks the useless device away and immediately groans. Her pupils dilate in separate timeframes and her boobs, her oh-so squeezable and lavish... lush...");
		output("\n\nThey’re getting bigger!");
		output("\n\nThe bunny-eared kitten’s voice fails her and she gets locked into a limp, groan. Her chest thrusts out and pearlescent white drops of kaithrit-flavored cream dribble out from her expanding swells. Her tits were just short of an F-cup, but they’re growing well past that and into G-cup territory, filling with unnatural amounts of purest-white milk. What surprises you the most is how they still aren’t sagging despite their chemically-induced bounty. They’re holding firm, taut, and audibly sloshing before your eyes.");
		output("\n\nRoo raises a finger to one sugarmound and your boner’s added inches " + (!pc.isCrotchExposed() ? "nearly thrust your meat through your [pc.crotchCoverUnder]":"throb out a [pc.cumVisc] strand of goop onto her crotch") + ". The carmine-colored cat regards your awestruck countenance with a tiny laugh as you struggle to " + (!pc.isCrotchExposed() ? "free your [pc.cocks] and ":"") + "mount her. <i>“It’s a super-charged drug, little like lactaid. It doesn’t last long, but it does leave me rather burdened! Make sure you milk me really good! And... I can always get more...”</i> she giggles.");
		output("\n\nOh fuck.");
		processTime(5);
		pc.changeLust(3);
		clearMenu();
		addButton(0,"Next",rooTableFuck,true);
		return;
	}
	// Roo Gamegasms 4-9
	if(flags["ROO_GASMED"] < 10)
	{
		output("You lean down and slide your [pc.hands] under Roo’s armpits, lifting her light body up and drawing her into a short kiss, then roughly bending her back over the table and prying her slime-glazed legs apart.");
		if(pc.tallness < 54) output(" Given that you’re not the most vertically inclined [pc.raceShort], there’s a chair nearby that gives you ample position above her.");
		output("\n\n<i>“So polite!”</i> The bubbly catgirl titters and grabs her tits in either hand, trill words tumbling from her tantalizingly pursed mouth. <i>“Oh, [pc.name]! You’ll make so many jealous! I hope you leave them no doubt of your ability...”</i>");
		output("\n\n");
		if(pc.isBimbo()) output("<i>“Naw, they’ll just wanna come have a round with me after I dick you really good!”</i> you chirp, wagging a [pc.finger].");
		else if(pc.isBro()) output("<i>“If they doubt it, they can take your place when I’m done with you,”</i> you smile, totally self-assured.");
		else if(pc.isNice()) output("<i>“That’s their problem,”</i> you whisper, stroking her waist and pinching a nipple, <i>“not ours, Roo.”</i>");
		else if(pc.isMischievous()) output("<i>“They’ll be doubting their own before too long, mark my words!”</i> you laugh, <i>“so let’s focus on us right now. You’ve had this coming for a while methinks!”</i>");
		else output("<i>“They’ll regret it if they try something,”</i> you snarl, casting a wary eye outwards. <i>“They will never be in this position,”</i> you finish, watching her shiver in adoration.");
		if(flags["ROO_MILKED"] != undefined)
		{
			output("\n\n<i>“Shall we make it a creamier reward?”</i> she asks, grasping at a medipen from where she sat.");
			processTime(2);
			clearMenu();
			addButton(0,"Yes",yesGetDatMilk,undefined,"Yes","You could use an extra drink!");
			addButton(1,"No",noMilkNowRoocipher,undefined,"No","Maybe next time.");
			return;
		}
	}
	// Roo Gamegasms >=10
	else
	{
		output("It’s your turn to stand" + (pc.tallness < 54 ? " and you need a boost to do it right, grabbing a nearby chair for support":"") + "; you tap the table and ask Roo to lie back, carefully grabbing her legs by the ankles and spreading her fuzzy limbs wide, exposing her dizzyingly engorged cunt, visibly steaming. Boiling pussyjuice drips from her overheated nethers, translucent and mouth-watering in shape, texture, and fragrance. She grips her breasts, losing her hands into plush, sweet titflesh, regarding you with a sanguine face. <i>“Let them all know, [pc.name], what I am to you right here... right now...”</i>");
		if(pc.isBimbo()) output("\n\n<i>“No problem, sweetness! I’m gonna give your pussy the creamiest reward!”</i> you sing.");
		else if(pc.isBro()) output("<i>“They’ll know that and then some,”</i> you grin, patting her thigh.");
		else if(pc.isNice()) output("<i>“They’ll know what you </i>mean<i> to me,”</i> you reply, stroking her shimmery face, <i>“that’s all I want you to think about.”</i>");
		else if(pc.isMischievous()) output("<i>“They don’t see anything but two sexy beasts about to fuck,”</i> you grin enthusiastically, <i>“all the better for us to go wild.”</i>");
		else output("<i>“I’ll do that, and for you, too,”</i> you whisper, pinching her nipple.");

		if(flags["ROO_MILKED"] != undefined) 
		{
			output(" <i>“Shall we make it a bit messier, too?”</i> she grins, producing a medipen.");
			processTime(2);
			clearMenu();
			addButton(0,"Yes",yesGetDatMilk,undefined,"Yes","You could use an extra drink!");
			addButton(1,"No",noMilkNowRoocipher,undefined,"No","Maybe next time.");
			return;
		}
	}
	processTime(5);
	pc.changeLust(3);
	clearMenu();
	addButton(0,"Next",rooTableFuck,false);
}

//[Yes] // You could use an extra drink!
public function yesGetDatMilk():void
{
	clearOutput();
	showRoo();
	author("William");
	output("You give her an eager nod and Roo presses the injector to her neck, groaning voraciously. Her mouth salivates as a green goo roils and shunts into her body. She tosses the device away, the drug acting fast. She’s glassy-eyed and shivering in the span of three heartbeats. Her boobs tremble wetly and the first droplets of unnaturally produced lactic bounty trickle out through unpopped corks. <i>“Ohh, it’s... heavy...!”</i> she winces.");
	output("\n\nBut just like before, her amazing tits swell into arm-swallowing mounds of flesh that visibly slosh with excessive bounty, far more squeezable than before having swollen up to G-cups again. Right now, she has the best boobies on Zheng Shi.");
	output("\n\nAnd they’re all yours to play with.");
	processTime(2);
	IncrementFlag("ROO_MILKED");
	clearMenu();
	addButton(0,"Next",rooTableFuck,true);
}

//[No] // Maybe next time.
public function noMilkNowRoocipher():void
{
	clearOutput();
	showRoo();
	author("William");
	output("You pilfer the injector and set it out of her reach, shaking your head. <i>“I understand, [pc.name],”</i> she murmurs, giving herself back to you.");
	clearMenu();
	addButton(0,"Next",rooTableFuck,false);
}

// Merge
public function rooTableFuck(milky:Boolean = false):void
{
	clearOutput();
	showRoo();
	author("William");
	var x:int = pc.cockThatFits(rooCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	// Normal Start
	output("Roo does everything she can to present her superlative chest to you, silently demonstrating that you needn’t show any shame or restraint. All their size, all their weight, all their sumptuousness... just watching them react to her lightest movements feels right... feels enough...");
	output("\n\nGrunting cutely, she scooches forward a bit so that her waist hangs off the table and her tails are freed, which are able to caress you around the neck and [pc.ears]. It’s a gesture of reassurance, and when they come close to your thigh-gripping hands, they wrap around your wrists and softly tug you to her " + (!milky ? "ample":"rotund") + " breasts, which now sit at eye-level with your blushing face, inches away.");
	if(!pc.isChestExposed())
	{
		output("\n\nOnce you’re positioned for her needs, Roo divests you of your [pc.chestCovers] one piece at a time" + (pc.biggestTitSize() >= 1 ? ", exposing your [pc.breasts] for her own enjoyment":"") + ".");
	}
	else output("\n\nNow that you’re straddling her, her hands roam over your body" + (pc.biggestTitSize() >= 1 ? ", playing with your [pc.breasts] by pawing playfully at a [pc.nippleNoun]":"") + ".");
	output("\n\nThe second your [pc.fingers] touch down on her " + (!milky ? "plump, well-rounded":"swollen, jiggly") + " tits you don’t want to ever let go. <i>“My nipples, too!”</i> she grins, pinching one and moaning. You can’t resist thrusting your [pc.face] into her cleavage, an incredible feeling of satisfaction washing over you from scalp to belly. She moves quickly to stroke your head");
	if(pc.hasHair() && pc.hairLength >= 3) output(", threading [pc.hairColor] [pc.hairNoun] between her fingers, tousling [pc.hairs] and pulling in reminder of your purpose");
	output(". <i>“[pc.name], you can’t rest yet!”</i>");
	output("\n\nYou reluctantly rise, mouth curling into a goofy smile. Caressing then squeezing, you marvel at how her boobs shake and overflow from inadequately sized palms that are better served clapping those puppies together. " + (milky ? "Doing so unleashes the pressure behind her teats, and broad, glistening arcs of milk shoot into the air and land messily on her, to be rubbed in by whoever’s hand gets there first.":"") + " Roo’s lips part and her jaw slackens; her slitted eyes shine with boobie-based bliss. Birdsong coos drift from her satin-red lips. The moments when her brain soft-locks are visible in her twitching irises, always glimmering when hit with short, sharp spikes of nipple-bound lust.");
	output("\n\nShe was warm already, but you swear she’s getting hotter. Before your restraint totally vanishes, you massage her pert melons with inspiring rubs, swirling one hand clockwise and the other counter" + (milky ? ", puddling milk into her valley, abusing her nipples until she’s a milky momma shining in her own wetness":"") + ". Silky flesh bounces in your grasp; you’re feeling for her thick heartbeats, and holding your breath when she gasps for air, quivering beautifully underneath.");
	output("\n\nPanting madly, you grab lady luck by her tits and smush them together, letting your fingers sink into dreamy fields of kaithrit bosom. " + (milky ? "Thin white arcs squirt upwards, sprinkling your cheek only to drip back down. Palmfuls of kitty-cream slough on the table in steadily increasing amounts. ":"") + "The sensitive kitten gladly moans, but in her hyper-aroused state it’s a much throatier purr than you’ve heard. She’s not a simple cat, but a ripe lioness waiting to be claimed. The sound inspires an animal reaction, and you knead hard enough to hurt" + (milky ? ", soaking your [pc.hands] in the alabaster droplets trickling over them":"") + ".");
	output("\n\nHer deep pink sex blooms in submissive bliss, drizzling wet and warm sugar. The kaithrit’s gumball-like clit is vibrating skyward, coated in a cooling layer of warm juice. A discoloration spreads on the tabletop, expanding the more she’s teased. Roo instinctively wraps her arms around either side of her sweat" + (milky ? " and milk":"") + " slickened chest, giggling pleasure-drunk. <i>“Are you gonna play with them all day?”</i> she asks, one tail tickling your cheek. <i>“That’s fine with me. But just remember, when you cum our time’s up!”</i>");
	output("\n\nThat’s fine with you; you don’t intend on busting your nut " + (!pc.isCrotchExposed() ? "in your pants":"on the table") + ".");

	// Milky Roo
	if(milky)
	{
		output("\n\nBut before you get started, you want just a little more time with this lactating feline. Milk spurts out with such ease that she’d make top dollar hooked up to a machine. You can tell the crowd loves it when you shift your grip to her throbbing areola and pull upwards, then go back down to <i>squeeze</i>, yanking her caps in eager, varying tugs that soon have her entire top coated in white. She looks hot, and she <i>feels</i> hot... and there’s still more in her fluctuant mammaries...");
		output("\n\n...More to drink... you can’t resist pressing her nipples together and suckling from both at once. Superheated cream flows past your lips, rinsing and rejuvenating your palate before surging down into your thirsty gut. It feels like you’re gaining weight with every hungry gulp, and you almost consign yourself to living your life as an industrial-grade kitty-milker when you feel her massaging the rear of your head.");
		output("\n\nShaking free, you finally turn your attentions to your own needs, ready to officially claim your prize.");
		var ppBJMeow:PregnancyPlaceholder = new PregnancyPlaceholder();
		ppBJMeow.createPerk("Fixed MilkQ", 2000, 0, 0, 0);
		pc.milkInMouth(ppBJMeow);
	}
	processTime(15);
	pc.changeLust(35);
	clearMenu();
	addButton(0,"Next",rooTableFuck2,milky);
}

public function rooTableFuck2(milky:Boolean = false):void
{
	clearOutput();
	showRoo();
	author("William");
	var x:int = pc.cockThatFits(rooCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("Thick, aching throbs pulse through your [pc.cocks]");
	if(!pc.isCrotchExposed()) output(", demanding to be released, to taste the pussy-scented air and plumb its source. It’s a simple matter to pull your bottoms aside and introduce your cunt-stuffer" + (pc.hasCocks() ? "s":"") + " to the casino.");
	else output(", so immovably erect that the smallest touches make you lurch forward involuntarily.");
	output(" Roo rocks herself a little closer to your stiffened rod, bringing her haze of vaginal heat close enough to envelop the the [pc.cockHead " + x + "]. <i>“I can feel how hard you are without looking!”</i>");
	output("\n\nSwallowing, you " + (pc.isTaur() ? "lift your front half up on the table and mount her, and she widens her crotch in acceptance":"grab her by the thighs, widening her crotch until her pussy modestly parts") + ". Fueled by mite impatience you line your [pc.cock " + x + "] up to her nectar-suffused pocket, sliding the [pc.cockHead " + x + "] between her chubby folds and glazing your pre-coated dick in her feminine moisture. Natural male and female lubricants come together to ready your breeding rod for its time-tested duty. <i>“Mmf...”</i> Roo moans, <i>“make sure you’re nice and ready. I might be a... little tight...”</i>");
	pc.cockChange();
	//repeat:
	if(flags["ROO_TABLEFUCKED"] == undefined) output("\n\nFucking understatement!");
	output("\n\nHer heart-melting smile lends a vigorous boost of speed to your preparation. Slathered in superheated syrup, you purposefully aim your rigid prong over her pussy and thrust forward across her delicate skin. Rubbing your [pc.cockType " + x + "] shaft over her clit in an elongated motion, you ‘bottom’ out, grinding your [pc.knotBallsHilt " + x + "] to her vulva");
	if(pc.cocks[x].cLength() >= 12) output(" and wiggling your [pc.cockHeadBiggest " + x + "] into the lower entrance of her cleavage");
	output(". Dilated cat’s eyes regard your member with deep affection and sensuous analysis. <i>“");
	if(pc.cocks[x].cLength() < 7) output("You’ll be able to fit that all in perfectly! I’ll be hugging every inch from every side...");
	else if(pc.cocks[x].cLength() < 13) output("Ooh, yours is so big, I bet it can’t fit in most girls! But I’m very wet... I think you can get it all inside me... I can’t wait!");
	else output("Your cock is big enough to make others wish theirs was so... so large and powerful. Please be careful with me, okay?");
	output("”</i>");
	output("\n\nSliding back across her vanilla tummy, you rock your [pc.hips] and plant your [pc.cockHeadBiggest " + x + "] to her lust-slick tunnel. Taking a deep breath, you apply weight to your lower half and push in as you exhale. Your crown slips past the fattened entrance easily, already beginning to stretch her pliant and moldable muff. The dealer grabs both of her boobs, happily squealing the more [pc.dickSkin " + x + "] sinks into her pressurized depths.");
	output("\n\nSeeping streams of kaithrit honey drool over and under your most sensitive skin, agitating your passions, imbuing the desire to skewer her on your veiny girth. Roo gasps, shuddering nervelessly, voice rising in an orgasm that begins where your motions are finally arrested in her vibed-up pussy. ");
	if(pc.cocks[x].cLength() < 7) output("You’re [pc.knotBallsHilt " + x + "]-deep in the clenching cat’s spread lips, and her glorious pussy is clutching super tight, almost painfully so. Were you any bigger, it might hurt!");
	else if(pc.cocks[x].cLength() < 13) output("You nearly make it all the way, but her painfully tight clenching stops you. All it takes is an insistently firm thrust, and you socket her feminine folds with the rest up to the [pc.knotOrSheath " + x + "]. At her navel you can see the outline of your [pc.cockHead " + x + "], which just tapped her cervix.");
	else output("Your too-big size spears her in more ways than one. Your sheer width and length strains her body far wider than it was meant to be taken, and several [pc.cockColor " + x + "] inches are left out never to be welcomed, " + (pc.cocks[x].cType == GLOBAL.TYPE_EQUINE ? "including your medial ring":"especially your [pc.knotOrSheath " + x + "]") + ".");
	output("\n\n");
	if(milky) showImage("RooTableFuckMilk");
	else showImage("RooTableFuck");
	output("<i>“[pc.name]!”</i> she cries, her tails wrapping around your waist on genetic instinct. <i>“Take me! Mark me as yours!”</i> she yowls, mauling hands never far from her " + (milky ? "milk-squirting ":"") + "tits. Yours aren’t either" + (milky ? ", and you’re practically bathing yourself in her lurid bounty":"") + ".");
    output("\n\nThe nubile kaithrit bucks against you, lancing herself on your meaty boner, upsetting your balance and squeezing so tight that your head lightens. It takes a table-rocking yank to pull out and a floor-shaking thrust to get back in; the resistance you’re facing is outrageous! No matter how hard you try to control your breathing, you can’t. Her scissoring thighs are as strong and stubborn as a mule’s, too excited by having a real dick instead of her vaginal buzzers.");
    output("\n\nThe dealer’s pot clinches down on you like you just got caught robbing the place. The powerfully suckling walls of her velvet-vice darken your vision and numb your loins. Pressure slowly fades into benignness, making it all the more urgent that you fuck her harder. So you do, jack-hammering back and forth, pumping her voluptuous frame as pinkish colors softly creep in on your consciousness" + (pc.balls > 0 ? ", amplified by the impact of your [pc.sack] to her nethers":"") + ".");
	output("\n\nThough your [pc.cock " + x + "] is swimming in a bucket’s worth of lubricant her restraining hole holds tight like it’s slowly melded to you and you’re not fucking it, but fucking the entire body it’s part of. For a second that seems to be true, considering every spastic jerk throws Roo up and down. You’re not sure if she’s wriggling to purposefully push you back in when you manage to unholster even a few inches, but it’s not helping your case!");
	output("\n\nYet, despite the firmness of her her cock-curtaining cunt, you do manage to fuck her addled tunnel with mindless relish. You’re not really sliding in or out, but squeezing your hips against one another in what must be a feral, depraved show to others. You decide, after your knuckles have gone white from " + (!pc.isTaur() ? "gripping so tight to her thighs":"to an imagined handhold") + ", that she’s just been cumming this entire time... that her rigged-up pussy has been oversensitized by a lifetime of obligated debauchery.");
	output("\n\nInstead of working against the pain and focusing on it, you push it out with a monumental effort. At last you open your eyes, fully adjusted to the bulge-strangling vice of her sweltering channel. A little more blood makes it to your slut-taming " + (pc.cocks[x].cLength() < 12 ? "shaft":"pillar") + ", restoring some semblance of control and feeling. You can hear the squelches of her lurid cunt, feel the wave-like motions of her unrelaxed interior grabbing hold, fighting to pull you back in and drain you of your load.");
	output("\n\nRoo’s legs " + (pc.isTaur() ? "firm themselves to your flanks":"lock around your waist") + " as possessive as her tails, undergirding the inward thrusts " + (pc.cocks[x].cLength() < 7 ? "that lunge close to ":"that bounce off ") + "her womb. The backstrokes have become a little easier. A volume of femme cum gathers inside, so great and packed in that it backblasts when enough vacant space is available, splashing your [pc.knotBallsHilt] in the heady liquid of a cabbit cock-socket.");
	// PC feline or barbed cock
	if(pc.cocks[x].hasFlag(GLOBAL.FLAG_NUBBY) || pc.cocks[x].cType == GLOBAL.TYPE_FELINE)
	{
		output("\n\nFor a kaithrit, there’s no better than a cock of their race, and you came well-equipped for this molten hole. Every time you bury your [pc.cock " + x + "] in her aggressive twat, the soft, bristly nubs lining your shaft brush her insides that pleasure her so well it seems her pussy relents out of respectful mercy. For a short time anyway. When you hit her clit just right, it’s back to the suffocating compression.");
	}
	// PC suula or stinger-flagged cock
	else if(pc.cocks[x].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.cocks[x].cType == GLOBAL.TYPE_SUULA)
	{
		output("\n\nThis may just be a time you regret having an aphrodisiac-equipped penis. For a brief second you thought the application of sanity-eroding venom would confuse her hungry pussy, get it to cede more control to you. It doesn’t. Instead, Roo screams blissfully, roaring uncharacteristically. Her walls tighten to the point that pre backs up inside your urethra, double-layering the devilishly brilliant pressure eating away at your being.");
	}
	// Merge
	output("\n\nSnapping back to sudden awareness, you realize that you just blacked out for a single second. It did nothing to slow your pace. Instead, that spot of rest kicks your brain into overdrive, and you’re punishing the pussy’s pussy harder. Your anguish up to this point vanishes. Roo’s femininity is being split with savage ferocity by your [pc.cock " + x + "], and you note that the more unclaimed inches she has, the more she whimpers in agonizing emptiness.");
	output("\n\nBut you’re here, driving your turgid mast back inside and widening her hips to house it. You can’t blame her or her body for the way it cherishes your virile shaft. Roo’s cunt has been trained to delight in lonely, unaided orgasm, that now that it has someone to take charge and show it what it’s been missing, it’s released all of that bottled up desire, happily enjoying having a big, hot, sticky dick to grip tight to instead of the hollow nothingness you now occupy.");
	// PC balls
	if(pc.balls > 0)
	{
		output("\n\nAnd your [pc.ballsNoun], your ");
		if(pc.ballDiameter() < 3) output("ample");
		else if(pc.ballDiameter() < 5) output("hefty");
		else output("tremendous");
		output(" orbs, fervor-fattened and eager to unload, slap powerfully to her taint. When they swing you feel a shot of pre squirt out inside, glossing her with more [pc.cumColor] juice. You can’t imagine the torrid fire that’s been burning for so long, waiting for a mate like you to come and quench it’s endless desire just for one round. You know your subby kaithrit can feel the boiling load churning inside, can feel the ");
		if(!pc.hasFur() && !pc.hasScales()) output("doughy");
		else if(pc.hasFur()) output("furry");
		else output("scaly");
		output(" texture squirming and shifting in her vulnerable places. You know she, like you, can’t wait for it all come spurting and flooding out.");
	}
	// Merge
	output("\n\nIn your frenzied state you hardly register lady libertine’s great big smile, her joy-inundated eyes staring only at you. You don’t feel the sweat dripping off you, you don’t even know you have an audience. Watching her knead her " + (milky ? "sopping-wet, milky ":"") + "tits and hold tight to you while orgasm urgently weaves inside you is enough. Soon, they all become insignificant details.");
	output("\n\nOne hand scrambles above her head, reaching for a control at the table, and in that mind-bending, everything before this disappears to a vibration not a soul could ever prepare for. Flipping on her vibrators, her contracting pussy ignites and seizes, padlocking your [pc.cocks " + x + "]. She explodes in unfathomable orgasm while the tremulations flood into your nervous system. All you can do is slam one more time into the ecstatic, platinum-furred creature below you, and cum.");
	// low cum (<1000mL)
	if(pc.cumQ() < 1000)
	{
		output("\n\nOrgasm spills out and reality flashes before your eyes, incoherent sounds muted. All you know for sure is that your [pc.cocks] have opened, and [pc.cum] is spurting" + (pc.balls > 0 ? " on every clench of your [pc.ballsNoun]":"") + ". Your brain is only capable of comprehending things in images with your senses gone haywire, and the only one you’re able to conjure in your moment of release is the manic onrush of [pc.cumVisc] sperm being shepherded into Roo’s womb. You don’t think she’s fertile, but the fantasy that she may be, the imagination that she doesn’t belong to pirates... those thoughts help your ejaculations finish.");
	}
	// oodles of cum (1001-6999mL)
	else if(pc.cumQ() < 7000)
	{
		output("\n\nRaging ropes of magma-hot [pc.cumNoun] erupt from your [pc.eachCockHead]. You’re spunking Roo with gouts of [pc.cumVisc], gushing seed. Unable to see or even think, only weird images come to mind of what’s going on. You understand just how powerful her vibrators are that even though you’re not the intended target, ropes of [pc.cumColor] sperm gush into her thirsty puss with a volume that easily inflates her belly, giving her a delightful pudge. In the recesses of your mind you hope it’s enough to satisfy her and yourself, and that you’ll walk away from this unscathed.");
	}
	// lots of cum (>7000mL)
	else
	{
		output("\n\nRoo’s vibrators were meant only for her. They’re set a strength only she can handle. Yet the jolt of their activation, and the low hum they’ve reduced to, have both unleashed the proverbial kraken. The volume of [pc.cumNoun] pumping through [pc.eachCock] is enough to feed a family of galotians, and it’s more than enough [pc.cumVisc] jizz to round out her abdominals with a nut-stuffed bulge that suggests early pregnancy.");
		output("\n\nNot that you can hear it. Your senses are on a climax-induced vacation, and your lagged brain is only capable of producing images to understand the muted world surrounding it. It senses your needful spunk battering her inner walls, collecting in the scant few spaces your dick isn’t in, and all subsequent shots shooting the previous loads further in and the rest of it back out. Yours is a gifted orgasm that lasts longer than most, every shot greater than the average loads of some races; every throb of goop, you can feel Roo’s legs tighten, ensuring she gets all you’ve got to give.");
		flags["ROO_TEMP_CUM_STORAGE"] = 1;
	}
	processTime(30);
	pc.orgasm();
	//loadIn?
	var ppBJMeow:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppBJMeow.createVagina();
	ppBJMeow.loadInCunt(pc,0);
	clearMenu();
	addButton(0,"Next",rooTableFukkEpi,milky);
}

public function rooTableFukkEpi(milky:Boolean = false):void
{
	clearOutput();
	showRoo();
	author("William");
	var x:int = pc.cockThatFits(rooCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("You dare to open your eyes in the aftermath, finding a blurry existence waiting for you. Bright lights, flashing cameras, recording indicators... those are all there. You stumble back numb to everything, and miraculously manage to stay on your feet. You’re not in pain, you realize, you’re not suffering, you’re just... rebooting. Yeah...");
	output("\n\nSomehow you slide your [pc.cock " + x + "] free of Roo, and, seeing her as the only thing comforting thing in the area, you fall face-first into her pillowy chest");
	if(milky || flags["ROO_TEMP_CUM_STORAGE"] == 1)
	{
		output(", splattering ");
		if(milky) output("milk");
		if(milky && flags["ROO_TEMP_CUM_STORAGE"] == 1) output(" and ");
		if(flags["ROO_TEMP_CUM_STORAGE"] == 1) output("cum");
		output(" everywhere");
	}
	output(". You don’t care, you just want to lie here for a second. You can’t sleep... it’s a public place, right... but you’ve gotta catch your breath, fuck...");
	output("\n\nMotherly strokes to your head gradually reactivate your brain functions, and you find the strength to look up, meeting Roo’s face. <i>“[pc.name],”</i> you hear, <i>“good [pc.boyGirl], good [pc.boyGirl]...”</i>");
	output("\n\nShe helps you off her. The crowds have begun dispersing");
	//, highCumV and multicock:
	if(pc.cockTotal() > 1 && flags["ROO_TEMP_CUM_STORAGE"] == 1) output(" some of them wiping off the [pc.cumNoun]-geysering you nailed them with");
	output(". Staff begin cleaning up the area and preparing their game room in ordinary fashion, giving you a few precious, unwatched seconds with Roo.");

	flags["ROO_TEMP_CUM_STORAGE"] = undefined;
	output("\n\n<i>“Sorry to " + (flags["ROO_TABLEFUCKED"] == undefined ? "catch you off guard":"hit you with that again") + "... you just looked like you needed a boost!”</i> She kisses your cheek, still stroking you with her wonderfully soft hand. <i>“Feel better, my " + (pc.mf("handsome","cute")) + " [pc.raceCuteShort]?”</i>");
	output("\n\nHer laugh makes you laugh, and nod too. You’re still throbbing from the abuse of her pussy <i>and</i> her toys, and you’re fucking exhausted, but you’re plenty relieved.");

	if(rooPantyProcChance()) 
	{
		processTime(15);
		IncrementFlag("ROO_SEXED");
		IncrementFlag("ROO_TABLEFUCKED");
		pc.imbibeAlcohol(50);
		addButton(0,"Next",rooPantyCollectScene,"tableFukk");
	}
	// Normal End
	else
	{
		output("\n\n<i>“Well, we better clear out,”</i> she explains, surprisingly lucid and perky, <i>“gotta clean up... keep the cards shuffling... come back to do it tomorrow! Hope to see you again!”</i>");
		output("\n\nShe hops down from the table and collects her clothing before meeting with security who guide her safely out, but not before she blows you a kiss. While you sit for a few minutes longer, a servant brings you your complementary <i>Ruby Tether,</i> and you waste no time guzzling it down. Whether or not alcohol is conducive to recovery doesn’t matter, because that inveigling beverage gets you right out of the ditch you were in.");
		output("\n\nYou fish through the effluence-coated table and collect your prize winnings too! Several credits richer, you leave the game floor behind, still thinking about Roo. By the time you’re off, a new dealer has manned the rapidly cleaned table.");
		output("\n\nHe isn’t anywhere near as appealing as the kaithrit before him.");
		processTime(15);
		IncrementFlag("ROO_SEXED");
		IncrementFlag("ROO_TABLEFUCKED");
		pc.imbibeAlcohol(50);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//[Leave/Done Playing]
// Tooltip1: This isn’t for you.
// Tooltip2: You’ve played long enough, time to move on.
public function leaveRooBehind():void
{
	clearOutput();
	showRoo();
	author("William");
	// Repeat Time (Gamegasm’d >=2 times, choosing not to sex)
	if(flags["ROO_GASMED"] >= 0 && pc.hasStatusEffect("Roo_Turned_Down"))
	{
		pc.removeStatusEffect("Roo_Turned_Down");
		output("While it’s sorely tempting, you’re not keen on getting any kind of service smack dab in the middle of a packed casino. No matter how much she may seem to love and encourage it!");
		output("\n\n<i>“Mmmf,”</i> Roo’s vacant face glows with shameful happiness, a messy orgasm painting the space under the table. Her legs shudder in warm bliss, the low-set vibrators to remain active for some time. <i>“I hope I’ll be seeing you again very soon [pc.name]...”</i>");
		output("\n\nOh, she might, especially if you’re treated to these kinds of shows!");
	}
	// Leave After Roo Strips A Clothing Piece
	else if(flags["ROO_STRIP_LEVEL"] > 0)
	{
		output("<i>“Noo!”</i> Roo cries playfully. <i>“[pc.name], you’re on such a strong streak!”</i> You are, sort of, but you didn’t plan to spend all your time gaming today. <i>“If you were a light, would you want someone to turn you on and forget to flip the switch on their way out?”</i>");
		output("\n\nYou swallow. The way she asked that question was...");
	}
	// Leave After Playing A Hand, Roo Hasn’t Stripped
	else if(flags["ROO_STRIP_LEVEL"] == 0 && flags["ROO_GAMED_TODAY"] <= 0)
	{
		output("You’ve spent enough money, and you know better than to overindulge. You collect your chit and stand up from the table, prompting a theatrical ‘awww’ from Roo. <i>“All done, ");
		if(flags["MET_ROO"] == 2) output(pc.mfn("handsome","cutie","cutie"));
		else output("[pc.name]");
		output("? That’s fine, but make sure you come back, okay? I know you’ll win your way to the top!”</i>");
		output("\n\nThe way she says it implies it can <i>only</i> be true. ...Maybe you’ll be back.");
	}
	// First Time/Haven’t played yet
	else
	{
		output("On second thought, no, you will not play. Roo is a gracious sort about it though, only shrugging lightly with that cute smile on her face. <i>“I’ll always be here when you feel up to the challenge!”</i> she says." + (flags["ROO_HIGHEST_STRIP_LEVEL"] > 0 ? " <i>“And do come back! I can’t wait to see how far you can push your luck!”</i>":""));
		output("\n\nMaybe later.");
	}
	flags["ROO_TALK_CD"] = 1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}