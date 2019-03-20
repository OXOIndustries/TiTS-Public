package classes
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	import classes.ItemSlotClass;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.PlayingCard;
	public class PlayingCardDeck
	{
		//constructor
		public function PlayingCardDeck()
		{
		}
		public var cards:Array = [];

		
		public function initDeck():void
		{
			//Empty the old array
			cards = [];
			var suit:String = "";
			//Cycle through the suits
			for(var x:int = 0; x < 4; x++)
			{
				if(x == 0) suit = "hearts";
				else if(x == 1) suit = "diamonds";
				else if(x == 2) suit = "spades";
				else if(x == 3) suit = "clubs";
				//Cycle through the cards and load 'em up.
				for(var y:int = 2; y < 15; y++)
				{
					cards.push(new PlayingCard());
					cards[cards.length-1].cardPriority = y;
					cards[cards.length-1].cardValue = y;
					if(y >= 10) cards[cards.length-1].cardValue = 10;
					if(y == 14) cards[cards.length-1].cardValue = 11;
					cards[cards.length-1].suit = suit;
				}
			}
		}
		public function shuffleDeck():void
		{
			//We load the deck into a storage deck, then randomly splice back into our OG.
			var oldDeck:Array = [];
			for(var x:int = 0; x < cards.length; x++)
			{
				oldDeck.push(new PlayingCard());
				oldDeck[x].cardPriority = cards[x].cardPriority;
				oldDeck[x].cardValue = cards[x].cardValue;
				oldDeck[x].suit = cards[x].suit;
			}
			//Reset our main array to splice in
			cards = new Array(oldDeck.length);
			
			var randomPos:Number = 0;
			for (var i:int = 0; i < cards.length; i++)
			{
			    randomPos = int(Math.random() * oldDeck.length);
			    cards[i] = oldDeck.splice(randomPos, 1)[0];   //since splice() returns an Array, we have to specify that we want the first (only) element
			}
		}
		public function drawCard():Array
		{
			if(cards.length == 0) 
			{
				throw("ERROR. Attempted to draw from empty deck.");
				return ([new PlayingCard()]);
			}
			return cards.splice(0,1);
		}
		public function addCard(newCard:PlayingCard):void
		{
			cards.push(newCard);
		}
		public function getCardPointTotalBlackjack(dealer:Boolean = false):Number
		{
			var total:Number = 0;
			var aces:Number = 0;

			for(var x:int = 0; x < cards.length; x++)
			{
				if(x == 0 && dealer) {}
				else
				{
					if(cards[x].cardPriority == 14)
					{
						total += 11;
						aces++;
					}
					else total += cards[x].cardValue;
				}
			}
			//Convert aces to 1 to keep under 21.
			while(total > 21 && aces > 0)
			{
				total -= 10;
				aces -= 1;
				//kGAMECLASS.output("DEDUCTING POINTS. ACES: " + aces + " TOTAL: " + total);
			}
			return total;
		}
		public function listHand(dealer:Boolean = false):String
		{
			if(cards.length == 1) return cards[0].cardDescription();
			else if(cards.length == 2) return (dealer ? "facedown card":cards[0].cardDescription()) + " and " + cards[1].cardDescription();
			else if(cards.length > 2)
			{
				var outputS:String = "";
				for (var x:int = 0; x < cards.length; x++)
				{
					if(x+2 > cards.length) outputS += ", and ";
					else if(x != 0 && x < cards.length - 1) outputS += ", ";
					if(dealer && x == 0) outputS += "facedown card";
					else outputS += cards[x].cardDescription();
				}
				return outputS;
			}
			return "ERROR. No cards.";
		}
	}
}
