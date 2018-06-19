//Spend some quality Halloween time slashing squash with your spawn
//https://docs.google.com/document/d/1Qtm-fVvVii7LQ4qEuVJvRa-8_9i2d0Zz_C9s0hr29yY/edit

import classes.GameData.Pregnancy.Child;
import classes.GameData.Pregnancy.UniqueChild;
import classes.GameData.Pregnancy.Containers.Genders;

public function havePumpkinCarvingScenes():Boolean
{
	
	//LOL lets use a uint to store flags
	flags["HWEEN_BIT_FLAGS"] = 0;
	
	//Might as well store all the conditions now so we don't have to check them again later
	//If condition is met, set the '<<x'th bit to 1
	//If any condition is met flags["HWEEN_BIT_FLAGS"] will be > 0
	//for copy-pasta: (condition ?1<<x:0) + //what it means
	flags["HWEEN_BIT_FLAGS"] = (zilCallgirlAtNursery() && ChildManager.ofUniqueType(ZilCallgirlUniqueChild) ?1<<0:0) + //Zheniya is at Nursery and have Zheniya babies
					(ChildManager.ofType(GLOBAL.TYPE_MILODAN) ?1<<1:0) + //Have Milodan pups
					(ChildManager.ofType(GLOBAL.TYPE_CUNTSNAKE) && (ChildManager.numChildrenAtNursery() - ChildManager.numOfType(GLOBAL.TYPE_CUNTSNAKE)) > 0 ?1<<2:0) + //Have cuntsnake babies and other kids
					(ChildManager.ofUniqueType(SeraUniqueChild) ?1<<3:0) + //Have Sera spawn
					(ChildManager.numOfType(GLOBAL.TYPE_RAHN) > 1 ?1<<4:0) + //'ave goobies
					(ChildManager.ofType(GLOBAL.TYPE_BOTHRIOC) ?1<<5:0) + //have bothrioc
					(ChildManager.ofType(GLOBAL.TYPE_WATERQUEEN) ?1<<6:0) + //have water princi
					(yammiRecruited() && ChildManager.numChildrenAtNursery() > 0 ?1<<7:0) + //Yammi is crew and have kids
					(ChildManager.ofUniqueType(BrihaUniqueChild) ?1<<8:0) //have Briha babies
					;
	
	return uint(flags["HWEEN_BIT_FLAGS"]) > 0;	
}

//returns true if the idex bit of flag is 1
public function rdBitFlag(idex:uint, flag:uint = 0xFFFFFFFF):Boolean
{
	if(flag == 0xFFFFFFFF) flag = flags["HWEEN_BIT_FLAGS"];	
	
	return uint(flag & (1<<idex)) > 0;
}

public function doPumpkinCarving():Boolean
{
	clearOutput();
	clearMenu();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	var plural:Boolean = ChildManager.numChildrenAtNursery() > 1;
	
	output("As you enter the nursery you’re greeted by a sea of orange pumpkins. <i>“Ah, [pc.name], you have amazing timing,”</i> Briget says as she waves you over. <i>“" + (plural ? "One of your little angels decided they wanted to have a little halloween party, and they’ve managed to convince most of their siblings as well,”</i> she lets out an exasperated sigh. <i>“So here we are, setting up " + ChildManager.numChildrenAtNursery() + " pumpkins" : "Your little angel decided they wanted to have a little halloween party,”</i> she lets out an exasperated sigh. <i>“So here we are, setting up a pumpkin") + ".”</i>");
	output("\n\n<i>“Would you like to help out? Family bonding and all that?”</i>");
	
	processTime(3);
	flags["CARVED_W_KIDDOS"] = 1;
	
	addButton(0, "Yes", yesImDyingForMoreKiddoInteractions, undefined, "", "");
	addButton(1, "No", sorryKidsIHateYou, undefined, "", "");
	
	return true;
}

public function sorryKidsIHateYou():void
{
	clearOutput();
	clearMenu();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	output("<i>“Oh. Well then, I suppose I will see you later, [pc.name].”</i> Briget turns away from you, and begins the process of gutting the pumpkins.");
	pc.addHard(3);
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

//This creates the button menu that persists until the buttons are overwritten or the event ends
public function yesImDyingForMoreKiddoInteractions():void
{
	clearOutput();
	clearMenu();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	var plural:Boolean = ChildManager.numChildrenAtNursery() > 1;
	
	output("Briget immediately shoves a carving knife into your hand while gesturing to the " + (plural ? "pile of pumpkins <i>“They still need their tops off, so start there.”</i>" : "pumpkin <i>“It still needs the top off, so start there.”</i>") + "");
	output("\n\nAfter a good " + (plural ? "two hours" : "couple minutes") + " of teamwork, the pumpkin" + (plural ? "s are ready to have a face of their" : "is ready to have a face of its") + " own. Briget signals to other staff members to " + (plural ? "release the children" : "bring your child") + ".");
	output("\n\nYou observe the festivities, trying to pick who to visit...");
	
	var button:int = 0;
	
	//if(rdBitFlag(x)) addButton(button, "", , button++, "", "");
	if(rdBitFlag(0)) addButton(button, "Zheniya", pumpkinZheniya, button++, "", "");
	if(rdBitFlag(1)) addButton(button, "Milodan", pumpkinMilodan, button++, "", "");
	if(rdBitFlag(2)) addButton(button, "Cunt Snake", pumpkinCSnake, button++, "", "");
	if(rdBitFlag(3)) addButton(button, "Sera", pumpkinSera, button++, "", "");
	if(rdBitFlag(4)) addButton(button, "Rahn", pumpkinRahn, button++, "", "");
	if(rdBitFlag(5) && rdBitFlag(6)) addButton(button, "Spiderlings", pumpkinSpiderlings, button++, "", "");
	else if(rdBitFlag(5)) addButton(button, "Bothrioc", pumpkinBothrioc, button++, "", "");
	else if(rdBitFlag(6)) addButton(button, "Water P.", pumpkinWPrincess, button++, "", "");
	if(rdBitFlag(7)) addButton(button, "Yammi", pumpkinYammi, button++, "", "");
	if(rdBitFlag(8)) addButton(button, "Briha Kids", pumpkinBriha, button++, "", "");
	
	addButton(14, "Leave", mainGameMenu, undefined, "Leave", "You’ve had enough hanging with the kiddos for this Halloween.");
}

public function pumpkinZheniya(btnSlot:int):void
{
	clearOutput();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	var plural:Boolean = ChildManager.numOfUniqueType(ZilCallgirlUniqueChild) > 0;
	
	output("You sit next to Zheniya, who currently has " + (plural ? "one of her kids" : "her kid") + " perched on her knee as they trace a ghost onto the pumpkin. You just kind of watch the two of them work with a dopey smile on your face. When they finish, your kid looks at you nervously before spinning the pumpkin so the image faces you. You get up and cower behind Zheniya, pretending to be afraid of the pumpkin ghost, resulting in a giggle fit from both Zheniya and the kiddo. You give them both a kiss on the cheek before walking away.");
	processTime(3);
	
	if(rdBitFlag(1)) addButton(btnSlot, "ZheniyaAgain", pumpkinZheniya2, btnSlot, "", "");
	else addDisabledButton(btnSlot, "Zheniya");
}

public function pumpkinZheniya2(btnSlot:int):void
{
	clearOutput();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	var plural:Boolean = ChildManager.numOfType(GLOBAL.TYPE_MILODAN) > 1;
	
	output("You notice that Zheniya is nowhere to be found among the pumpkins and decide to investigate. A smile lights your face when you find her in the kitchen. It’s seems that " + (plural ? "one of " : "") + "your fuzzy Milodan kitten" + (plural ? "s" : "") + " decided " + (plural ? "they" : "it") + " wanted some cookies. With Zheniya’s help, the little one is cracking an egg into a bowl filled with various powders.");
	output("\n\nYou decide to help the two with their baking, retrieving the cookie cutters from storage. Given the choice of a ghost, a pumpkin, or a broom, the kitten picks the ghost. Once a cookie sheet is filled to capacity, it is slid into the oven. Now all they have to do is wait.");
	output("\n\nWhile waiting for the cookies to be baked to perfection, the three of you work together to make a sweet icing. You earned some "+pc.mf("dad","mom")+" of the year points by sneaking the fur ball the mixing spoon covered in icing when Zheniya turned her back. The raised eyebrow directed your way tells you that you weren’t as sly as you thought.");
	output("\n\nOnce the cookies have finished, they are taken out and iced to spooky purrfection (the kit’s words, not yours). And when you bring the scrumptious cookies out to the cafeteria, the plate is emptied within 5 minutes.");
	processTime(25);
	
	addDisabledButton(btnSlot, "ZheniyaAgain");
}

public function pumpkinMilodan(btnSlot:int):void
{
	clearOutput();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	output("One of your little milodan kittens runs over to you crying. You scoop them up into your arms, cuddling them and peppering their little face with kisses, until their wailing sobs turn into tiny giggles. You ask the now calm fuzzball what had made them so upset. Immediately their eyes begin watering, as they point their lil paw at their pumpkin. It seems they accidently made a cut too large, resulting in the cat they had been carving turning into an undefined angular shape. You boop their nose.");
	output("\n\n<i>“Silly little kit, we have plenty of extra pumpkins. We can just start over.”</i>");
	output("\n\nYou spend the next 30 minutes helping the little one carve out the best darned cat on a pumpkin the galaxy has ever seen. If pumpkins didn’t rot, and were 2 dimensional, it would be shoo-in for the refrigerator door.");
	processTime(33);
	
	addDisabledButton(btnSlot, "Milodan");
}

public function pumpkinCSnake(btnSlot:int):void
{
	clearOutput();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	var plural:Boolean = ChildManager.numOfType(GLOBAL.TYPE_CUNTSNAKE) > 1;
	
	output("Your little snake kid" + (plural ? "s don’t" : " doesn’t") + " really care for pumpkin carving, but their little habitat’s been tricked out with fake spider webs and skeletons. It seems one of your other kiddos has drawn a crude crayon drawing of a pumpkin and taped it to the glass.");
	processTime(2);
	
	addDisabledButton(btnSlot, "Cunt Snake");
}

public function pumpkinSera(btnSlot:int):void
{
	clearOutput();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	var plural:Boolean = ChildManager.numOfUniqueType(SeraUniqueChild) > 1;
	var namedKids:Boolean = listSeraBabies()[0].Name != "";
	
	output("Instead of carving pumpkins, " + (plural ? "Sera and her kids" : (namedKids ? listSeraBabies()[0].Name + " and Sera" : "Sera and her kid")) + " are chowing down on a giant bag of candy corn. You raise an eyebrow at " + (plural ? "" : "the two of ") + "them. " + (namedKids ? listSeraBabies()[0].Name+" gives" : "They give") + " you a big grin. <i>“Briget says candy corn is both an inferior corn and candy, but dad is awesome and got " + (plural ? "us" : "me") + " some anyway!!”</i> They promptly shove another sticky handful into their mouths.");
	output("\n\n<i>“That still doesn’t explain the hiding in a corner,”</i> you say looking at Sera. She stands up and stretches.");
	if(flags["SERA_OBEDIENCE"] >= 80) output("\n\n<i>“I like my brat" + (plural ? "s" : "") + ", so they get a treat. I don’t want the rest of your brats begging me for candy. They need to beg you for that.”</i>");
	else output("\n\n<i>“Look, I like my brat" + (plural ? "s" : "") + ", so they get a treat. I don’t want the rest of your brats barking at me for candy. They need to beg you for that shit.”</i>");
	output("\n\nYou decide to leave " + (plural ? "" : "the two of ") + "them alone to their candy-corn-flavored massacre.");
	processTime(6);	
	
	addDisabledButton(btnSlot, "Sera");
}

public function pumpkinRahn(btnSlot:int):void
{
	clearOutput();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	output("Your gooey lil rahn kids had gotten hungry while carving and abandoned the half carved witches and owls in favor of munching on some roasted pumpkin seeds provided by Briget and the earlier pumpkin gutting session.");
	output("\n\nYou steal a handful of seeds from them, resulting in pouts. You rub one of their heads affectionately as you finish the snack. In return you get pelted with the remaining seeds until you leave.");
	processTime(5);
	
	addDisabledButton(btnSlot, "Rahn");
}

public function pumpkinBothrioc(btnSlot:int):void
{
	clearOutput();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	var plural:Boolean = ChildManager.numOfType(GLOBAL.TYPE_BOTHRIOC) > 1;
	
	output("Your spiderling" + (plural ? "s" : "") + " didn’t have much interest in carving pumpkins but " + (plural ? "they are" : "it is") + " happily telling " + (plural ? "each other " : "") + "spooky stories. You decide to listen in for a moment. It seems that " + (plural ? "one of them" : "it") + " was telling the tale of the murderous purple and green dino-morph. They are really getting into it. You decide you’d rather not interrupt their fun.");
	processTime(7);
	
	addDisabledButton(btnSlot, "Bothrioc");
}

public function pumpkinWPrincess(btnSlot:int):void
{
	clearOutput();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	var plural:Boolean = ChildManager.numOfType(GLOBAL.TYPE_WATERQUEEN) > 1;
	
	output("Your princess" + (plural ? "es" : "") + " didn’t have much interest in carving pumpkins but " + (plural ? "they are" : "she is") + " happily telling " + (plural ? "each other " : "") + "spooky stories. You decide to listen in for a moment <i>“...and the ghost screamed yoinks!!! Right into the dog’s ear!!!”</i> They are really getting into it. You decide you’d rather not interrupt their fun.");
	processTime(7);
	
	addDisabledButton(btnSlot, "Water P.")
}

public function pumpkinSpiderlings(btnSlot:int):void
{
	clearOutput();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	output("It seems your princesses and spiders are in the middle of a heated debate. Your bothrioc children claim that the murderous purple and green dino-morph was truly the most horrific of spooky stories, while the princesses advocate for the disappearance of the scaredy cat dog with the blue collar. It’s getting rather heated. You decide you value your life and don’t want to get between them.");
	processTime(3);
	
	addDisabledButton(btnSlot, "Spiderlings");
}

public function pumpkinYammi(btnSlot:int):void
{
	clearOutput();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	if(ChildManager.ofType(GLOBAL.TYPE_MILODAN) && ChildManager.ofType(GLOBAL.TYPE_KORGONNE) && ChildManager.numChildrenAtNursery() > 2)
	{
		output("You hear growling and hissing coming from the cafeteria. You rush over worried someone’s gotten themselves hurt. But when you arrive you struggle to contain a laugh. Yammi has generously made some delicious carameled apples for everyone to enjoy. It seems two of your children have set their eyes on the same apple. Yammi stares at you with distress in her eyes as the milodan and korgonne fluff balls growl and hiss louder and louder.");
		output("\n\nBefore a cry-inducing fight can break out you grab the two by the scruff of their necks, reminding them that there’s plenty more apples that are all exactly the same. Unfortunately for the two of them, while you were busy scolding them, the original argument causing apple had been snatched up by some other sibling. ");
		output("\n\nThe two each get their own apple but pout while eating them, neither of them happy with the results. You rub their heads in affection and give Yammi a nod in thanks for her effort.");
		
	}
	else if(ChildManager.numChildrenAtNursery() > 2)
	{
		output("You hear strange noises coming from the cafeteria. You rush over worried someone’s gotten themselves hurt. But when you arrive you struggle to contain a laugh. Yammi has generously made some delicious carameled apples for everyone to enjoy. It seems two of your children have set their eyes on the same apple. Yammi stares at you with distress in her eyes as the kids growl and hiss louder and louder.");
		output("\n\nBefore a cry-inducing fight can break out you grab the two by their shoulders, reminding them that there’s plenty more apples that are all exactly the same. Unfortunately for the two of them, while you were busy scolding them, the original argument causing apple had been snatched up by some other sibling.");
		output("\n\nThe two each get their own apple but pout while eating them, neither of them happy with the results. You rub their heads in affection and give Yammi a nod in thanks for her effort.");
	}
	else
	{
		output("You hear strange noises coming from the cafeteria. You rush over worried someone’s gotten themselves hurt. But when you arrive you struggle to contain a laugh. Yammi has generously made some delicious carameled apples for everyone to enjoy. It seems your child has set their eyes on an apple. Yammi stares at you with distress as the little one continues to get caramel all over themself.");
		output("\n\nBefore too much of a mess can be made, you grab the apple out of their hand and cut it up into pieces, reminding them of their manners. Unfortunately for Briget, most of the damage has already been done and a bath will be necessary.");
		output("\n\nYou rub their head in affection and give Yammi a nod in thanks for her effort.");
	}
	processTime(13);
	
	addDisabledButton(btnSlot, "Yammi");
}

public function pumpkinBriha(btnSlot:int):void
{
	clearOutput();
	showName("PUMPKIN\nCARVING");
	author("Bumbling Bee");
	
	if(ChildManager.numOfUniqueType(BrihaUniqueChild) > 1) output("Out of nowhere, Aya runs over to you, pulling you over to Briget. She’s wearing a red and white cap with a small bag design on the front of it. <i>“Daddy, Briget’s helping me make my costume!”</i> she bounces around in joy, her hat nearly slipping off her head. <i>“I’m gonna dress up as a bag devil trainer.”</i> She runs to her brother, pulling him away from his pumpkin carving and bringing him over to you. <i>“Brahn, Brahn, Brahn, Brahn, tell Dad what your costume is!”</i> Your son rubs the back of his head, giving you a sheepish smile. <i>“Uhm I’m gonna... Be a...”</i> his words turn into an indecipherable mumble. His older sister rolls her eyes and punches his shoulder. <i>“What he means to say is that he’s going as Ivy-cat! The best bag devil ever!”</i> Having made her point Aya kisses your cheek before running off to watch Briget finish her costume.");
	else
	{
		output("Out of nowhere, Aya runs over to you pulling you over to Briget. She’s wearing a red and white cap with a small bag design on the front of it. <i>“Daddy, Briget’s helping me make my costume!”</i> she bounces around in joy, her hat nearly slipping of her head. <i>“I’m gonna dress up as a bag devil trainer.”</i> She thrusts a navy blue sparkly bag into your hands. Out of the bag you pull a small green figurine that looks like a cat with a flower on its back. <i>“Isn’t he the best!”</i>");
		output("\n\nYou hand the small toy back to her, messing with her hair as you do. <i>“He is rather cool, and your costume looks awesome, kiddo,”</i> you say with a fond smile on your face as she races around excitedly. You thank Briget for her hard work and give Aya a kiss on the forehead before going to wander somewhere else.");
	}
	processTime(9);
	
	addDisabledButton(btnSlot, "Briha");
}