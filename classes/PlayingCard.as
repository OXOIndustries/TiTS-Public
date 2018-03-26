package classes
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	import classes.ItemSlotClass;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.GLOBAL;
	import classes.Engine.Utility.num2Text;
	public class PlayingCard
	{
		//constructor
		public function PlayingCard(argSuit:String = "hearts",argVal:Number = 2, argPri:Number = 2)
		{
			suit = argSuit;
			cardValue = argVal;
			cardPriority = argPri;
		}
		//For cheateyness.
		// include "consts.as"
		//data
		//Cock length
		public var suit:String = "hearts";
		//used for what beats what. Ace = 14, king 13, queen 12, jack 11, etc.
		public var cardPriority:Number = 1;
		//Used for the numeric value of a card. Jack+ should all be 10. Blackjack will need special tweaks for the variable ace value.
		public var cardValue:Number = 1;

		public function cardDescription():String
		{
			var numberName:String = num2Text(cardPriority);
			if(cardPriority == 10) numberName = "ten";
			else if(cardPriority == 11) numberName = "jack";
			else if(cardPriority == 12) numberName = "queen";
			else if(cardPriority == 13) numberName = "king";
			else if(cardPriority == 14) numberName = "ace";
			numberName += " of ";
			numberName += suit;
			return numberName;
		}
	}
}

