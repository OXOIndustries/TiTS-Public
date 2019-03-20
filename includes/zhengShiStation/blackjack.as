import classes.PlayingCard;
import classes.PlayingCardDeck;

public function showBlackjackDealer():void
{
	showName("\nBLACKJACK!");
	if(flags["BLACKJACK_DEALER"] == 9999 || flags["BLACKJACK_DEALER"] == undefined) showBust("ULA");
}
public function blackjackTest():void
{
	clearOutput();
	
	flags["BLACKJACK_WIN"] = blackjackWin;
	flags["BLACKJACK_LOSE"] = blackjackLose;
	flags["BLACKJACK_DEALER"] = 9999;
	flags["BLACKJACK_BET"] = 0;
	flags["BLACKJACK_DEALER_SHOWN"] = undefined;
	output("Want play blackjack? Kay!");
	
	startBlackjack(true);
}

public function basicBitchBlackjackDealerIntro():void
{
	output("\n\nA robotic dealer invites you to play a game of blackjack. <i>“Blackjack! The game older than time. <b>500 credits</b> to play, a fortune to be won. House stands at sixteen, ties go to the dealer. Interested?”</i>");
	addButton(0,"Blackjack",setUpBasicBitchBlackjack,undefined,"Blackjack","Playing will cost you at least 500 credits, maybe more if you're feeling greedy.");
}
public function setUpBasicBitchBlackjack():void
{

	flags["BLACKJACK_WIN"] = blackjackWin;
	flags["BLACKJACK_LOSE"] = blackjackLose;
	flags["BLACKJACK_DEALER"] = 0;
	flags["BLACKJACK_DEALER_SHOWN"] = undefined;
	flags["BLACKJACK_BET"] = 0;
	startBlackjack();
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
		output("The dealer shuffles the deck exactly three times, each time with near-perfect precision. It's time to play!");
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
	output("\n\nThe dealer's hand: " + dealerHand.listHand(true) + ".\nVisible Value: <b>" + dealerHand.getCardPointTotalBlackjack(true) + "</b>");
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
	output("How much will you bet? " + (flags["BLACKJACK_BET"] < 500 ? "<b>A bet of 500 credits is required to play.</b>":"Current bet: " + flags["BLACKJACK_BET"] + " credits."));
	
	addButton(0,"Custom Bet",enterCustomBet,args,"Custom Bet","Enter a custom amount of credits to bet.");
	if(flags["BLACKJACK_BET"] + 500 < pc.credits) addButton(1,"Bet 500",takeFixedBet,[args[0],args[1],args[2],500]);
	else addDisabledButton(1,"Bet 500","Bet 500","That bet is more than your bank can cover.");
	if(flags["BLACKJACK_BET"] + 1000 < pc.credits) addButton(2,"Bet 1000",takeFixedBet,[args[0],args[1],args[2],1000]);
	else addDisabledButton(2,"Bet 1000","Bet 1000","That bet is more than your bank can cover.");
	if(flags["BLACKJACK_BET"] + 2500 < pc.credits) addButton(3,"Bet 2500",takeFixedBet,[args[0],args[1],args[2],2500]);
	else addDisabledButton(3,"Bet 2500","Bet 2500","That bet is more than your bank can cover.");
	if(flags["BLACKJACK_BET"] + 5000 < pc.credits) addButton(4,"Bet 5000",takeFixedBet,[args[0],args[1],args[2],5000]);
	else addDisabledButton(4,"Bet 5000","Bet 5000","That bet is more than your bank can cover.");
	if(flags["BLACKJACK_BET"] + 10000 < pc.credits) addButton(5,"Bet 10000",takeFixedBet,[args[0],args[1],args[2],10000]);
	else addDisabledButton(5,"Bet 10000","Bet 10000","That bet is more than your bank can cover.");
	if(flags["BLACKJACK_BET"] + 25000 < pc.credits) addButton(6,"Bet 25000",takeFixedBet,[args[0],args[1],args[2],25000]);
	else addDisabledButton(6,"Bet 25000","Bet 25000","That bet is more than your bank can cover.");
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
	if(pcHand.getCardPointTotalBlackjack() == 21 && pcHand.cards.length == 2)
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
	else if(dealerHand.getCardPointTotalBlackjack() == 21)
	{
		output("\n\n<b>Dealer has 21! You lose!</b>");
		if(flags["BLACKJACK_DEALER_SHOWN"] == undefined) output(" The facedown card is flipped to reveal a " + dealerHand.cards[0].cardDescription() + ".");
		clearMenu();
		addButton(0,"Next",flags["BLACKJACK_LOSE"]);
	}
	else if(dealerHand.getCardPointTotalBlackjack() >= 16 && pcHand.getCardPointTotalBlackjack() > dealerHand.getCardPointTotalBlackjack() && flags["BLACKJACK_STANDING"] != undefined)
	{
		output("\n\n<b>You win!</b>");
		if(flags["BLACKJACK_DEALER_SHOWN"] == undefined) output(" The facedown card is flipped to reveal a " + dealerHand.cards[0].cardDescription() + " for a total of <b>" + dealerHand.getCardPointTotalBlackjack() + "</b>.");
		clearMenu();
		addButton(0,"Next",flags["BLACKJACK_WIN"]);
	}
	//If standing, proceed with dealer till result:
	else if(flags["BLACKJACK_STANDING"] != undefined)
	{
		if(dealerHand.getCardPointTotalBlackjack() >= pcHand.getCardPointTotalBlackjack())
		{
			output("\n\n<b>Dealer wins!</b>");
			if(flags["BLACKJACK_DEALER_SHOWN"] == undefined) output(" The facedown card is flipped to reveal a " + dealerHand.cards[0].cardDescription() + " for a total of <b>" + dealerHand.getCardPointTotalBlackjack() + "</b>.");
			clearMenu();
			addButton(0,"Next",flags["BLACKJACK_LOSE"]);
		}
		//Dealer didnt win and must be below 16, so next round...
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
		clearMenu();
		addButton(0,"Hit",blackjackHit,[deck,dealerHand,pcHand],"Hit","Draw another card to try and get closer to 21 without going over.");
		addButton(1,"Stand",blackjackStand,[deck,dealerHand,pcHand],"Stand","Keep your current cards for now.");
		addButton(2,(flags["BLACKJACK_BET"] > 0 ? "Bet More":"Bet"),blackJackBettingScreen,[deck,dealerHand,pcHand]);
	}
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
	if(dealerHand.getCardPointTotalBlackjack() < 16)
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