public function vendingMachineString():String 
{
	return "A vending machine with a picture of a cute deertaur on the front advertises the latest and greatest transformation products to come out of Vesperia in bold print. If you wanted to look more like the natives, this would be a good place to start.";
}

public function approachVesperianVendingMachine():void
{
	vendShopScreen();
}

public function vendShopScreen(buy:Boolean = true):void
{
	shopkeep = chars["VESPERIANVENDINGMACHINE"];
	chars["VESPERIANVENDINGMACHINE"].keeperBuy = "The vending machine is clean, its buttons overlaid with bright holo-projections of the various products it offers. Many appear to be out of stock.\n";
	//List prices and whatnot. Back should go back to VESPERIANVENDINGMACHINE's main menu.
	//Sell Menu
	chars["VESPERIANVENDINGMACHINE"].keeperSell = "ERROR\n";
	chars["VESPERIANVENDINGMACHINE"].keeperGreeting = "RUH ROH! SOMETHING WENT WRONG.";
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	buyItem();
}
