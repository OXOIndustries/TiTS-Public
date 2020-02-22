//Here’s some basic dialogue and some flavor ideas. Use what you like and edit or discard the rest if any! Also note, I am developing a serious appreciation for the amount of effort you put into this stuff. It ain’t easy! Hehehehehehehe. Anyways, if anything else is needed, just let me know. 

public function yammiShopDisplay(nude:Boolean = false):void
{
	if(flags["YAMMI_RECRUITED"] == undefined)
	{
		showYammi(nude);
	}
	else
	{
		showName("\nSALIRE");
		showBust("SALIRE");
	}
	author("Lady Jenn");
}
public function showYammi(nude:Boolean = false):void
{
	showName("\nYAMMI");
	showBust(yammiBustDisplay(nude));
}
public function yammiBustDisplay(nude:Boolean = false):String
{
	var str:String = "YAMMI";
	
	if(nude) str += "_NUDE";
	else if(yammiIsCrew()) str += "_APRON";
	
	return str;
}

public function icedTeatIsClosed():Boolean
{
	if(pc.hasStatusEffect("Iced Teats Closed")) return true;
	return false;
}

public function icedTeatsExteriorBonusFunc():Boolean
{
	author("Lady Jenn");
	output("\n\nTo the south, a colorful building boasts an illuminated signboard proudly displaying the title: Iced Teats Frozen Treats and Confectionery Company. Beneath it is the catch line: “The number one supplier in female-based frozen sweets”. All flavors harvested fresh from the breast, guaranteed safe for any humanoid or similar entity! Above all this is an image of a fetching pink skinned woman with bright crimson hair, dressed in barely enough clothing to contain her assets. She is reclined comfortably and holding a bowl of what appears to be ice cream, which is cleverly animated to cascade slowly through a number of appetizing colors.");
	if(icedTeatIsClosed())
	{
		flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
		output("\n\nUnfortunately, there is a “Momentary Delay” sign posted on the front door, notifying you that the shop is curently closed...");
	}
	else
	{
		flags["NAV_DISABLED"] = undefined;
		if(flags["MET_YAMMI"] == undefined) output("\n\nWell, maybe it’s worth checking out! After all, if anyone deserves a cool treat it’s a brave space explorer, risking life and limb day after day!");
		if(flags["KAEDE_FUCKED"] != undefined && flags["KAEDE_FUCKED"] > 0 && flags["KAEDE_NT_ENCOUNTER"] == undefined)
		{
			kaedeThreeSomesOrSpawnOrSomethingCassTits();
			return true;
		}
	}
	return false;
}

public function icedTreatsInterior():Boolean
{
	yammiShopDisplay();
	showName("ICED\nTEATS");
	if(flags["MET_YAMMI"] == undefined)
	{
		flags["MET_YAMMI"] = 1;
		output("The shop interior is made up of row after row of clear plastic devices with trays in front for bowls, and handles to draw the ice cream treats. On taking a second look, you realize each one appears to be occupied by a female form! Before you can make much of this, your attention is called to the right, where the cashier calls to you.");

		output("\n\n<i>“Hello! Welcome to Iced Teats!”</i>");

		output("\n\nThis tall orange skinned woman has short lime green hair and bright red eyes. She wears a bright red miniskirt and vest combo that she must have to squeeze her C-cups into with a shoehorn. Her eye shadow, nail polish, and lipstick all share the hue of her hair. Her ears are bony fans, her fingers webbed, and she has gill slits on her neck, betraying an amphibious origin. Her smile is inviting and warm as you step up to the counter.");

		output("\n\n<i>“My name is Yammi! What can I get for you today?”</i> She chirps happily, indicating the large flavor list behind her. <i>“We have cones, bowls, or frozen feasts, in any combination of flavors you prefer!”</i>");
		processTime(1);
		//(Options include ‘Cone’, ‘Bowl’, ‘Feast’, ‘Questions’, and ‘Back’, with back leaving the store)
		yammiRepeatMenu(false);
		return true;
	}
	else if(flags["YAMMI_SELF_TALK"] == 1 && rand(3) == 0 && flags["YAMMI_BAD_DAY"] == undefined)
	{
		yammisBadDay();
		return true;
	}
	else if(flags["YAMMI_BAD_DAY"] == 1)
	{
		firstChanceToHireYammi();
		return true;
	}
	else
	{
		if(flags["YAMMI_RECRUITED"] == undefined)
		{
			output("The shop interior is made up of row after row of clear plastic devices with trays in front for bowls, and handles to draw the ice cream treats. Just like last time, you spot women occupying the space inside the machinery. Yammi calls to you almost as soon as you step inside the door.");
			output("\n\n<i>“Welcome back to Iced Teats! When you’d like to order, just say the word.”</i> The orange-skinned alien is dressed the same as the last time you saw her, sporting a bright red miniskirt and vest combo that would threaten sensibilities on a more modest world. Her cheerful eyes watch you curiously as you make your way around the shop.");
			addButton(0,"Yammi",yammiRepeatMenu,true,"Yammi","Approach the aquatic alien behind the counter.");
		}
		else
		{
			saliresIcedTeats();
		}
		return false;
	}
}

public function yammiRepeatMenu(outputS:Boolean = true):void
{
	if(outputS)
	{
		clearOutput();
		yammiShopDisplay();
		output("You step up to brightly-colored alien. Do you order something");
		if(flags["YAMMI_RECRUITED"] == undefined) output(" or strike up some conversation");
		output("?");
	}
	clearMenu();
	if(pc.credits >= 10) addButton(0,"Cone",orderAYammiCone,undefined,"Cone","Order a cone for the low low price of 10 credits.");
	else addDisabledButton(0,"Cone","Cone","You can’t afford the 10 credits for a cone.");
	if(pc.credits >= 20) addButton(1,"Bowl",orderAYammiBowl,undefined,"Bowl","Order a bowl for the not so low price of 20 credits.");
	else addDisabledButton(1,"Bowl","Bowl","You can’t afford the 20 " + (isAprilFools() ? "dogecoin" : "credit") + " cost of a bowl of titty-milk icecream. How sad.");
	if(pc.credits >= 50) addButton(2,"Feast",orderAYammiFeast,undefined,"Feast","Order a veritable feast of icecream. It only costs 50 credits - a huge savings, according to the menu.")
	else addDisabledButton(2,"Feast","Feast","You can’t afford the 50 credits a feast would cost.");
	if(flags["YAMMI_RECRUITED"] == undefined)
	{
		addButton(3,"Questions",questionsForYammi,undefined,"Questions","Strike up a conversation and ask her about some stuff.");
		if(flags["YAMMI_BAD_DAY"] == 2)
		{
			if(pc.credits >= 7000) addButton(4,"Free Her",payForYammisSlutitude,undefined,"Free Her","Pay for Yammi’s debt so that she can get out of this hellhole.");
			else addDisabledButton(4,"Free Her","Free Her","You can’t afford to buy Yammi out of her contract.\n\n7000 credits");
		}
	}
	addButton(14,"Back",mainGameMenu);
}

//Questions
public function questionsForYammi():void
{
	clearOutput();
	yammiShopDisplay();
	output("<i>“Of course! Anything you care to know!”</i> Yammi nods vigorously.");
	//(Select from ‘Ice Cream’, ‘Girls’, ‘Company’, ‘Yammi’, ‘Suggestions’, ‘Sex’, or ‘Back’)
	clearMenu();
	addButton(0,"Ice Cream",askYammiAbootIceCream);
	addButton(1,"Girls",askYammiAbootZeGurls)
	addButton(2,"Company",askYammiAboutTheCompany);
	addButton(3,"Herself",askHerAboutHerself);
	addButton(5,"Sex",askyammiAboutSex);
	addButton(14,"Back",yammiRepeatMenu,false);
}

// Ice Cream scoops
public function getIceCreamContainer(iType:int = 0, sSize:String = ""):PregnancyPlaceholder
{
	var iSize:Number = 0;
	if (sSize == "cone") iSize = 5;
	if (sSize == "bowl") iSize = 15;
	if (sSize == "feast") iSize = 50;
	
	var ppIceCream:PregnancyPlaceholder = new PregnancyPlaceholder();
	ppIceCream.breastRows[0].breasts = 1;
	ppIceCream.breastRows[0].breastRatingRaw = iSize;
	ppIceCream.milkType = iType;
	ppIceCream.milkMultiplier = 100;
	ppIceCream.milkFullness = 100;
	return ppIceCream;
}
public function icedTeatsAlienName():String
{
	if(flags["YAMMI_RECRUITED"] != undefined) return "Salire";
	else return "Yammi";
}
//Choose ‘Cone’
public function orderAYammiCone():void
{
	clearOutput();
	yammiShopDisplay();
	pc.credits -= 10;
	output("<i>“Just a taste today? Certainly! Here you are!”</i> With a flourish, " + icedTeatsAlienName() + " produces a deep cone made of red-brown wafer. <i>“Our cones are 100% natural nutrients healthy for any carbon based life form and easily digestible for silicates!”</i>");
	preparingToGetIceCream("cone");
}

//Choose Bowl
public function orderAYammiBowl():void
{
	clearOutput();
	yammiShopDisplay();
	pc.credits -= 20;
	output("<i>“A hearty appetite, I see!”</i> " + icedTeatsAlienName() + " smiles and hands you a black bowl and spoon. <i>“Here you are. When you’re done, just toss those out. They automatically break down to simple particles in 48 hours so they don’t pollute!”</i>");
	preparingToGetIceCream("bowl");
}

//Choose Feast
public function orderAYammiFeast():void
{
	clearOutput();
	yammiShopDisplay();
	pc.credits -= 50;
	output("<i>“As you wish! Here you go!”</i> " + icedTeatsAlienName() + " pulls a tray with three bowl-like depressions in it from beneath the counter. <i>“Mix and match to your heart’s content, and you can keep the tray for use at home! Careful you don’t get a headache though!”</i> She giggles.");
	preparingToGetIceCream("feast");
}

//Preparing to get ice cream
public function preparingToGetIceCream(servingType:String = "cone"):void
{
	yammiShopDisplay();
	output("\n\nYou examine the selection before you, each device containing a woman with her tits wrapped in a net of straps ready to surrender her flavored breast milk for your snacking pleasure. Various tubes and devices are in place to feed them, please them, and clean them. As you examine the flavor tags on each machine, the occupant watches you from inside; some are expectant, some a bit tired, and some look pleading, their massive melons overfull.");
	//(Flavors would be Gewinfruit, Yokto, Blitzaberry, Strawberry, Jumbijumbi, Darginut, Chocolate, and Flameberks)
	clearMenu();
	addButton(0,"Gewinfruit",gewinFruit,servingType,"Gewinfruit","Try some gewinfruit flavor. It’s supposed to be quite rich.");
	addButton(1,"Yokto",getYokto,servingType,"Yokto","Try some Yokto flavor.");
	addButton(2,"Blitzaberry",blitzaberryCone,servingType,"Blitzaberry","Try some blitzaberry, a childhood favorite.");
	addButton(3,"Strawberry",strawberryIcedCream,servingType,"Strawberry","Try some strawberry. Who doesn’t love strawberries?");
	addButton(4,"Jumbijumbi",jumbiJumbiCream,servingType,"Jumbijumbi","You hear it’s an acquired taste!");
	addButton(5,"Darginut",darginutIcedCream,servingType,"Darginut","Try some darginut, a hearty favorite of U.G.C. troops.");
	addButton(6,"Chocolate",chocolateIcedCream,servingType,"Chocolate","Who doesn’t love chocolate?");
	addButton(7,"Flameberks",flameberksIcedCream,servingType,"Flameberks","Judging by the name alone, it has to be spicy.");
}

//Gewinfruit
public function gewinFruit(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Cone
	if(servingType == "cone")
	{
		if(flags["HAD_GEWINFRUIT"] == undefined)
		{
			output("You’ve heard of Gewinfruit. They’re supposed to be very rich in flavor, so you decide to try it while it’s just a cone-full. The gray-skinned woman inside looks a touch on the weary side as you set your cone in the holder. She must be one of the popular ones!");
			output("\n\nWhen you pull the lever, she closes her eyes slowly. It takes a couple seconds, but the machine quick-freezes and whips her fresh breast-juice into a kiwi-green ice cream. You can feel the vibration of the machine as it works pumps and motors inside, then your cone is full, leaving her visibly sighing and looking disappointed.");
			output("\n\nThe ice cream is very savory, and you take your time to finish it. It feels like it fills you more than maybe it should.");
		}
		//Repeat Cone
		else
		{
			output("You decide the Gewinfruit was worth a second go. The gray skinned dispenser girl watches you approach and you almost hear a groan. Clearly she gets a lot of small time cones and not as many bowls as she would like. While you sympathize, you’re only here for a treat. The cone is slow to fill again, proving her continued popularity. You leave her somewhat disappointed again, but enjoy your savory green ice cream anyways.");
		}
	}
	//Bowl/Feast
	else
	{
		if(flags["HAD_GEWINFRUIT"] == undefined)
		{
			output("Gewinfruit, you have been told, are quite flavor-rich. This sounds right up your alley! You set the bowl in place to fill, and the gray-skinned woman inside the machine perks up. She had looked a bit weary, probably a popular flavor, but the prospect of certain pleasure has her attention.");
			output("\n\nYou pull the lever, and her eyes close as the machinery hums to life. For several seconds you watch her squirm in her casing, then the machine begins to fill your bowl with freshly pumped, frozen, and whipped ice cream in a curious kiwi-green color. As your bowl fills with ice cream, her face continues to darken, until her eyes suddenly snap open in a look of sexual bliss you know well. It takes a couple seconds after that to finish filling your bowl.");
			output("\n\nYou stroll away, trying the first spoonful and finding a savory taste to your snack. This looks like something you’re going to enjoy, and it turns out to be pretty filling.");
		}
		//Repeat Bowl/Feast
		else
		{
			output("You return to the Gewinfruit flavor-girl, and she looks pleased to see you again. Obviously a woman that enjoys her work! As usual, she’s pretty tapped out, and it takes you almost half a minute to fill your bowl. Her deepening blush and look of ecstasy make it worthwhile. You then wink to her and head off to enjoy your filling, savory meal.");
		}
	}
	flags["HAD_GEWINFRUIT"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.changeHP(5);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.changeHP(15);
	}
	else 
	{
		processTime(12);
		pc.changeHP(50);
	}
	pc.milkInMouth(getIceCreamContainer(GLOBAL.FLUID_TYPE_MILK, servingType));
	clearMenu();
	addButton(0,"Next",yammiRepeatMenu,true);
}

//Yokto
public function getYokto(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Cone
	if(servingType == "cone")
	{
		if(flags["HAD_YOKTO"] == undefined)
		{
			output("Yokto? You’ve never even heard of it. Well, you have a cone anyways, not like you’re committing too much. As you approach the machine, the gold scaled reptilian woman inside looks outright desperate, her bosoms bulging in their web of straps. Must not be a local favorite.");
			output("\n\nYou set up your cone and pull the lever, and instantly a pale yellow ice cream starts to fill it. Inside the machine, the woman’s face turns to an expression of relief. You’re sure if her mouth wasn’t taken up with a feed-tube she’d be thanking you!");
			output("\n\nAfter only a couple seconds, you have a heaping cone of Yokto-flavored ice cream. You take an experimental lick, and find it to be somewhere between an orange and a lemon in sourness, but with almost the flavor of a blueberry! You suspect it won’t be an unpopular taste for long.");
		}
		//Repeat Cone
		else
		{
			output("You come back to the golden scaled Yokto girl, and note that her breasts seem somewhat less swollen than last time. Clearly she’s seeing more customers lately! The cone still fills up lightning fast, but she looks pleased to have some more of her burden taken away. You feel happy to help her, especially since it nets you a tart treat!");
		}
	}
	//Bowl/Feast
	else
	{
		if(flags["HAD_YOKTO"] == undefined)
		{
			output("You haven’t heard of a Yokto before, but isn’t adventure your job description? You place the bowl down and reach for the lever. Inside the machine, a golden scaled reptilian looks absolutely ecstatic to have a customer. Her breasts are swollen inside the mesh that holds them, betraying a lack of clients. That makes you debate, but only for a second.");
			output("\n\nThe lever is pulled and immediately pale yellow ice cream begins flooding the bowl. The golden woman inside the machine bucks as much as her restraints allow, and achieves orgasm in moments. These devices are really something! Before your rapidly filling container is topped off entirely, she even manages a second! You feel happy to have given her such a good time as you collect your treat, hoping she’ll return the flavor... err, favor!");
			output("\n\nThe first spoonful hits you with an unexpected blueberry flavor with a sourness somewhere between a lemon and an orange. It’s very strong, but quite good. You suspect she won’t remain disused for long once people start to try her.");
		}
		//Repeat Bowl/Feast
		else output("You return to the golden Yokto-girl and place your bowl on the tray. She looks like she remembers you, and you can all but hear her thank you past her feed tube. Her tits still look full, but she’s obviously seeing more traffic since last time. A quick pull of her lever proves she’s still pouring out her milk with speed, as it only takes seconds for your bowl to fill, and her to climax. You wander away to munch on your ice cream and leave her to recover.");
	}
	flags["HAD_YOKTO"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.changeHP(2);
		pc.changeEnergy(2);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.changeHP(7);
		pc.changeEnergy(7);
	}
	else 
	{
		processTime(12);
		pc.changeHP(25);
		pc.changeEnergy(25);
	}
	pc.milkInMouth(getIceCreamContainer(GLOBAL.FLUID_TYPE_MILK, servingType));
	clearMenu();
	addButton(0,"Next",yammiRepeatMenu,true);
}

//Blitzaberry
public function blitzaberryCone(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Cone
	if(servingType == "cone")
	{
		if(flags["HAD_BLITZABERRY"] == undefined)
		{
			output("You remember Blitzaberries... you had some way back, and you remember the sugar rush fondly! It’s still a bit odd to imagine a connection between the small dark berries and the chalk-white, gray haired woman inside the machine, but you hope for the best. The woman almost appears to be napping as you approach.");
			output("\n\nYour cone sits in the holder, and the dark purple ice cream begins to flow. The woman’s expression hardly changes from the meditative expression she wore when you arrived. Even as you walk away, there’s no reaction. Must be nice to be able to do that with your tits in a literal vice, you decide.");
			output("\n\nThe cone surprises you by tasting exactly like fresh Blitzaberries! They’re so sickeningly sweet you almost can’t eat it, but fond childhood memories push you to devour the whole cone in only a handful of bites. In a few minutes you’re shaking slightly and suddenly want to do ANYTHING to burn off some energy!");
		}
		//Repeat Cone
		else output("You head back to the meditative Blitzaberry gal. What was good once is going to be great the second time! She opens her eyes slightly to note your presence as you place your cone and pull the lever, but you have to marvel at her serenity as you fill it. You doubt you’ll ever achieve the level of calm she has. Especially not after wolfing down your hyper-sugary ice cream again!");
	}
	//Bowl/Feast
	else
	{
		if(flags["HAD_BLITZABERRY"] == undefined)
		{
			output("When it comes to sugar rushes, you’ve never had anything like a Blitzaberry. You had them when you were much younger and you still recall them with fondness. The chalk-white skinned woman inside the machine has gray hair, neither of which exactly screams ‘blitzaberry’ to you since they’re very small and dark, but you’re sure she must be the right one... maybe?");
			output("\n\nYou set your bowl in place, noting her oddly serene and sleepy expression. When you crank the handle, the machine buzzes to life, and dark purple ice cream begins to steadily fill it up. Her expression hardly moves until almost the exact point that you release the handle, then she suddenly opens her eyes and reaches physical nirvana. As her expression changes to a dreamy one, you try a spoonful of your snack.");
			output("\n\nHey, they nailed it! Just as sweet as you remember, and by the time you’ve finished the bowl you’ll know it’s just as sugary too, since your spoon will be rattling around even when you’re trying to hold still. Ah, sugar!");
		}
		//Repeat Bowl/Feast
		else output("You return to the serene Blitzaberry woman for another helping of sweet sugary goodness. As you pump out a fresh batch, you note she hardly moves a muscle, and even after you finish it takes the machine several seconds of buzzing and chugging to make her reach orgasm. You marvel at her meditative skill, since these devices are custom set to make their occupant get off as swiftly as possible! You debate how she must do it as you begin shovelling sugary goodness into your mouth... you are heading for a belly-ache, but you don’t care!");
	}
	flags["HAD_BLITZABERRY"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.energy(7);
	}
	else if(servingType == "bowl") 
	{
		processTime(8)
		pc.energy(20);
	}
	else 
	{
		processTime(12);
		pc.energy(75);
	}
	pc.milkInMouth(getIceCreamContainer(GLOBAL.FLUID_TYPE_MILK, servingType));
	clearMenu();
	addButton(0,"Next",yammiRepeatMenu,true);
}

//Strawberry
public function strawberryIcedCream(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Cone
	if(servingType == "cone")
	{
		if(flags["HAD_STRAWBERRY"] == undefined)
		{
			output("You double-take. Strawberry? It’s listed as a new flavor even! You haven’t had strawberries in quite a while. You’re impressed that the woman inside even has pink skin and darker hair. Being new, she’s seen use, but her tits aren’t empty yet. Far from it! She looks quite happy to see you, like the fresh faced saleswoman she might have been had her tits not come out just right.");
			output("\n\nYou pop the cone into place and pull the lever. She visibly tenses inside, her boobs not yet used to being squeezed of the goods. Lucky for her you’re just here for a cone, so she can relax after only a quick few seconds. The dark red ice cream looks very much like strawberry-color.");
			output("\n\nMmmm, it even tastes like actual fresh strawberries, not the artificial type of flavor!");
		}
		//Repeat Cone
		else
		{
			output("You head back to your strawberry machine. Why not? She still looks eager to serve! As you get a fresh cone, you note she looks more relaxed this time. Girls here must get used to their role as quick as she fills your cone! You give her a smile and a nod as you stroll off, enjoying your nice chill strawberry taste.");
		}
	}
	//Bowl/Feast
	else
	{
		if(flags["HAD_STRAWBERRY"] == undefined)
		{
			output("Strawberry! Really? You are shocked, but here it is, a ‘new’ flavor you’ve always enjoyed. You chuckle at how long things take to get around! You miss them, so you head over, noting the pink skinned, pink haired woman inside looking as inviting as she can. She is quite eager to sell her product, you can see. Her tits speak of considerable success, but they’re far from done.");
			output("\n\nYou pop your bowl in place and pull the lever, and she becomes tense, not used to her tits being juiced yet. The machinery sets to work helping her relax in the most direct way possible. Your bowl is three quarters full of dark red ice cream when she goes off like a rocket, and then visibly drains of all her tension. You smile at her, knowing she’ll be getting more used to this in no time.");
			output("\n\nWhat do you know? It tastes just like real strawberries, not even the artificial flavor! This bowl isn’t going to last you long at all!");
		}
		//Repeat Bowl/Feast
		else
		{
			output("You pop back in to see Miss Strawberry. She looks eager as ever, and nods a bit as you place your bowl. She’s getting better at both relaxing during the squeeze, and at holding off orgasm. It takes until you have a full bowl for her to reach a climax this time! You chuckle at her happy afterglow and head out to eat your strawberry snack.");
		}
	}
	flags["HAD_STRAWBERRY"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.changeHP(2);
		pc.changeEnergy(2);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.changeHP(7);
		pc.changeEnergy(7);
	}
	else 
	{
		processTime(12);
		pc.changeHP(25);
		pc.changeEnergy(25);
	}
	pc.milkInMouth(getIceCreamContainer(GLOBAL.FLUID_TYPE_STRAWBERRY_MILK, servingType));
	clearMenu();
	addButton(0,"Next",yammiRepeatMenu,true);
}

//Jumbijumbi
public function jumbiJumbiCream(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Choose Cone
	if(servingType == "cone")
	{
		if(flags["HAD_JUMBIJUMBI"] == undefined)
		{
			output("Jumbijumbi is supposed to be one of those ‘acquired tastes’, so you decide to only risk it in small quantities for now. The presentation is normal enough: A mauve skinned woman with bright red insectile eyes watches you with a look of casual boredom. She doesn’t appear to be unused, but she isn’t as exhausted as some of the girls you’ve seen.");
			output("\n\nYou pop your cone in and pull the lever. The ice cream comes out very slowly, being black as tar and very thick. You debate about your choice, but decide to go ahead, especially given the almost disapproving look you’re getting from the woman you’re pumping from. You resolve to eat it and enjoy it if it’s even vaguely possible!");
			output("\n\nIn all honesty, it’s pretty horrible. It rakes your taste buds like razors, almost like you don’t have the proper equipment to taste it and your body is just guessing. To your astonishment, you soon find yourself popping the last of the cone into your mouth! How did you eat all that?!");
		}
		//Repeat Cone
		else output("You approach the bored Jumbijumbi dispensing woman again, deciding to risk it once more. You still don’t know how you ate all the last batch you got, so you determine to pay more attention this time. While you fill your cone the lady looks somewhat more well disposed to you, maybe because you didn’t make a horrible face last time? You walk away and lick your awful tasting cone, debating about how much pride she must take in her terrible ice cream and... Oh, blast it, you’re done again?! How do you keep eating it so fast?");
	}
	//Choose Bowl/Feast
	else
	{
		if(flags["HAD_JUMBIJUMBI"] == undefined)
		{
			output("You hesitate at the Jumbijumbi machine. You’ve heard it’s a taste you really have to build yourself up to. Well, you didn’t get where you are by being timid! You stride up to the machine and decide to get yourself a good serving of it, no matter the flavor it hits you with!");
			output("\n\nThe woman inside has mauve skin and bright red insectile eyes, and when you approach she shifts from bored to curious. Her breasts are used but not much. Perhaps she doesn’t see many people coming for a full bowl. Either way you fearlessly place it on the tray and pull the lever. Thick black ice cream slowly oozes out, while she looks very surprised. It seems she’s not used to full on stimulation! Despite the efforts of the machine she still hasn’t achieved climax by the time your bowl is done filling, which is quite a feat given the pace it fills.");
			output("\n\nYou walk away and pop a spoonful in your mouth. It’s pretty gross, though you don’t know why. Maybe you just don’t have taste buds for this particular flavor of terrible? You debate just how they can turn a profit on such a godawful flavor. There must be some race that likes it, but... wait a second, where did it all go? You feel very full. Did you honestly eat all of that?");
		}
		//Repeat Bowl/Feast
		else output("You approach the Jumbijumbi machine again, still uncertain how you gulped down the last batch. Throwing caution to the wind, you set your bowl in place. Inside the machine, the insect eyed mauve woman looks pleased to see you again. She looks even more pleased as you pull the lever and the machinery sets to work on her. The ice cream is as dark and slow as it was before. You fill it up and take your gross tasting frozen snack, leaving her to her pleasures. Once again, the ice cream is virtually inedible. You can’t even imagine how you ate so much last time. It’s not an acquired taste, it’s an atrocity. How would anyone ever... Oh, for crying out loud, where did it all go? Again? How do you do that and not notice?! Is it just so awful your brain doesn’t record it somehow or what?");
	}
	flags["HAD_JUMBIJUMBI"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.changeHP(1);
		pc.changeEnergy(1);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.changeHP(3);
		pc.changeEnergy(3);
	}
	else 
	{
		processTime(12);
		pc.changeHP(9);
		pc.changeEnergy(9);
	}
	pc.milkInMouth(getIceCreamContainer(GLOBAL.FLUID_TYPE_MILK, servingType));
	clearMenu();
	addButton(0,"Next",yammiRepeatMenu,true);
}

//Darginut
public function darginutIcedCream(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Choose Cone
	if(servingType == "cone")
	{
		if(flags["HAD_DARGINUT"] == undefined)
		{
			output("Darginuts, so you’ve heard, are a staple in military food packs. Apparently they are tasty and healthy little things, and a lot of soldiers like them as a taste of home since they’re widely grown. You’ve never had the good fortune, so you decide to give it a shot.");
			output("\n\nThe fur covered woman inside the machine is streaked light and dark brown, and her feeding leaves her with cute chipmunk-cheeks. You bet if you opened the machine you could find a bushy tail. You pop your cone in place and she watches you with excited curiosity. When you pull the lever, she virtually shakes with pleasure. Excitable type, isn’t she? The ice cream is a light beige-brown, and it comes out in shots, indicating she’s as often used as you assumed.");
			output("\n\nYou lick at your cone. What did you expect? It tastes very nutty, almost wood-like, and it sticks with you for almost an hour. You see why soldiers would like them, Darginut remains on your tongue long after you finish eating it.");
		}
		//Repeat Cone
		else
		{
			output("You saunter up to the Darginut machine again, eager for another long lasting taste. The fuzzy girl inside seems interested in what you do, and you suspect her attention span must be short indeed. Her ice cream flows a little more steadily this time, and she vibrates as much as her toys must in there. It must take a lot of feed to supply such a high-strung woman! You wander off with your cone, debating about perhaps buying bulk Darginuts to round out your ship’s rations. At least then you’d have something to munch on as you jump from planet to planet!");
		}
	}
	//Choose Bowl/Feast
	else
	{
		if(flags["HAD_DARGINUT"] == undefined)
		{
			output("You’ve heard that soldiers like Darginuts because they grow them everywhere, and they’re healthy and easy to munch on. You’ve never had the pleasure, but if it’s good enough for the military surely it’s good enough for you. The Darginut machine calls!");
			output("\n\nYou put your bowl on the tray and reach for the lever. The woman inside has striped light and dark brown fur and bright, curious eyes, her cheeks puffed out from feeding, and you bet there’s a big fluffy tail in there too. As you begin drawing your ice cream, she practically vibrates on her own from the machine’s stimulation. Boy, she’s an energetic one! Your ice cream comes in short spurts of beige-brown, displaying her popularity. It takes you a while, and her three very rapid climaxes, to fill the bowl.");
			output("\n\nIt’s woody, very nutty, and quite delicious! The flavor sticks with you a while too. You can see where they’re popular... Maybe you should buy some to fill in the ‘cockpit munchies’ requirement.");
		}
		//Repeat Bowl/Feast
		else output("You head back to the Darginut dispenser, ready for another helping of nutty goodness. The woman inside seems attentive to your actions again, and you wonder if she recalls what happens when people stroll up to her each time. As you pull the lever, she begins shaking with pleasure, causing the machine to rattle quite a bit. The ice cream comes more steadily this time than it did before, allowing you to fill the bowl in only two of her climaxes. You shake your head and smile as you head out with your ice cream, glad to see someone enjoying her job so much!");
	}
	flags["HAD_DARGINUT"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.changeHP(5);
		pc.changeEnergy(1);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.changeHP(13);
		pc.changeEnergy(5);
	}
	else 
	{
		processTime(12);
		pc.changeHP(40);
		pc.changeEnergy(20);
	}
	pc.milkInMouth(getIceCreamContainer(GLOBAL.FLUID_TYPE_MILK, servingType));
	clearMenu();
	addButton(0,"Next",yammiRepeatMenu,true);
}

//Chocolate
public function chocolateIcedCream(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Choose Cone
	if(servingType == "cone")
	{
		if(flags["HAD_CHOCOLATE"] == undefined)
		{
			output("You stroll past several machines, then you spot one with a banner you like: Chocolate! It seems some things never fall out of favor! You are pleased there’s at least something you know for certain you like in here.");
			output("\n\nThe woman in the machine is chocolate skinned herself, and despite her tits being almost half-again the size of any other one you’ve seen in here, she looks tired and well used. Of course, she would be a popular flavor, wouldn’t she? You also note she’s blindfolded, probably to prevent people from getting a big dose of pleading eyes. You shrug and silently apologize as you draw your cone from her, which takes quite a while since she’s so tapped it only comes out at a drizzle.");
			output("\n\nOh, sweet chocolate! You hadn’t really expected to find this one here, but you’re very glad you did, and a little disappointed you only bought a cone.");
		}
		//Repeat Cone
		else
		{
			output("You head back to the sweet chocolate vendor, and she’s as well used as before. You set the cone in place to fill and note it’s just as slow as it was. Her popularity can’t be questioned. She seems to sigh as you collect your cone. Oh well, you’re sure they change the girl in the case at least daily if she’s that tuckered out! You head out with your delicious ice cream in hand.");
		}
	}
	//Choose Bowl/Feast
	else
	{
		if(flags["HAD_CHOCOLATE"] == undefined)
		{
			output("You walk around a little, when suddenly your eye catches something. Hello! Chocolate! The woman inside is as dark skinned as her flavor, and she looks very tired and well tapped, despite her tits being almost half again as big as anyone else’s in here. She’s also blindfolded, maybe to prevent guilt-inducing looks.");
			output("\n\nYou set your bowl on the tray and pull the lever. She tilts her head back in a groan as a drizzle of chocolate begins to fill the bowl. It takes a long time to fill, but you’re patient, and to your surprise the flow never actually stops. All the while she is clearly given a thorough workout by the machine she occupies. You are astonished that it still hasn’t gotten her to orgasm by the time you’re done. You move away with it still chugging on towards her reward.");
			output("\n\nMmmmm, sweet literally milk chocolate! You’re very pleased you spotted that one!");
		}
		//Repeat Bowl/Feast
		else
		{
			output("Time for more chocolate, you decide. When you reach her, she’s just as tired as before. You suppose that’s one of those hazards of fame you hear about. You get filling your bowl and she shudders as the pleasure inducing devices set to work. Of course, even slow as she tends to be, you’re done long before she is. You head out, happily spooning chocolate into your mouth and knowing she’ll appreciate the climax later.");
		}
	}
	flags["HAD_CHOCOLATE"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.changeHP(2);
		pc.changeEnergy(2);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.changeHP(7);
		pc.changeEnergy(7);
	}
	else 
	{
		processTime(12);
		pc.changeHP(25);
		pc.changeEnergy(25);
	}
	pc.milkInMouth(getIceCreamContainer(GLOBAL.FLUID_TYPE_CHOCOLATE_MILK, servingType));
	clearMenu();
	addButton(0,"Next",yammiRepeatMenu,true);
}

//Flameberks
public function flameberksIcedCream(servingType:String = "cone"):void
{
	clearOutput();
	yammiShopDisplay();
	//Choose Cone
	if(servingType == "cone")
	{
		if(flags["HAD_FLAMEBERKS"] == undefined)
		{
			output("You come across a flavor you’ve never even heard of. Flameberks? What the heck is a Flameberk? You decide you have got to try this.");
			output("\n\nThe woman in the machine has flame-orange hair and skin of a molten-metal red. She looks pleased as you walk up, almost like she’s welcoming another victim. You decide to show no fear as you get your cone of the bright orange ice cream, hoping that her extremely full bosoms feel quite a squeeze as you do so. By the rate it comes out, you suspect she’s a flavor for only the brave.");
			output("\n\nYou’re right, although you manage to keep yourself from reacting near enough for her to see. This stuff is like licking the active end of a flame thrower! It’s only sheer guts that keeps you working at it until it’s done, and even then you require a fair bit of time between licks. That’s not a treat, that’s torture!");
		}
		//Repeat Cone
		else
		{
			output("Maybe you just hate yourself today, or maybe you’re becoming a masochist, but you decide to grab a cone of Flameberks flavor ice cream. The red woman inside the machine looks modestly impressed to see you again. You fill your cone and try not to sweat, but your body knows what’s coming up, and you don’t think you succeed. Still, you put on a brave front, and you’re well out of her sight before you take your first lick. It’s every bit as agonizing as you remember. Why did you get this stuff again?");
		}
	}
	//Bowl/Feast
	else
	{
		if(flags["HAD_FLAMEBERKS"] == undefined)
		{
			output("What in the world is a Flameberk? That’s what you ask yourself as you stroll up to the machine of that label. Well, as an intrepid space explorer, you feel duty bound to answer that question!");
			output("\n\nYou slide the bowl in place. The woman you’ll be juicing for this stuff has fire orange hair and molten metal red skin, and she looks pleased to see you. She seems to welcome her latest helpless victim. You look stern as you crank the lever down, and bright orange ice cream begins to fill the bowl. It comes quickly, and by how full her tits look you can tell she’s something of a specialty flavor. She also refuses to lose that half-taunting look, despite the fact you can feel the machine working her like a pro. You get well out of her view before you begin to chow down.");
			output("\n\nIt’s so hot! Why did you get so much!? You soldier on, taking long breaks between spoonfuls, but it’s sheer agony to finish. You think you’d rather drink lit napalm. By the time you’re done, your guts are very angry at you. You’re afraid they might decide to move out on you while you sleep! Right there you resolve never to try an actual Flameberk.");
		}
		//Repeat Bowl/Feast
		else
		{
			output("You don’t know why you do it, but here you are again, sliding your bowl onto the Flameberks tray. For what it’s worth the normally taunting woman seems genuinely impressed to see you, and that fills you with pride. She also seems less able to resist the forced orgasm she’s delivered, which makes you feel better too. You head off with a smug look, ice cream in one hand and spoon in the other. Of course that supremacy lasts only until your first spoonful of frozen breast milk based torture hits your tongue! Your stomach demands to know why you hate it so much.");
		}
	}
	flags["HAD_FLAMEBERKS"] = 1;
	if(servingType == "cone") 
	{
		processTime(4);
		pc.changeHP(1);
		pc.changeEnergy(1);
	}
	else if(servingType == "bowl") 
	{
		processTime(8);
		pc.changeHP(3);
		pc.changeEnergy(3);
	}
	else 
	{
		processTime(12);
		pc.changeHP(9);
		pc.changeEnergy(9);
	}
	pc.milkInMouth(getIceCreamContainer(GLOBAL.FLUID_TYPE_MILK, servingType));
	clearMenu();
	addButton(0,"Next",yammiRepeatMenu,true);
}

public function askYammiAbootIceCream():void
{
	clearOutput();
	yammiShopDisplay();
	output("You have to admit you’re curious about the whole idea, so you ask about the ice cream. Yammi perks right up.");
	output("\n\n<i>“Oh, I hoped you’d ask! Iced Teats has been around for a very long time. Our founder Gelkenminah Broboskin Dravimilink the Eleventh supposedly came from a very hot world where drinkable moisture was reserved exclusively for breeding females. Everyone else just had to rely on their body absorbing what it could from the hot, dry world. Now, this may be apocryphal, since this was a very long time ago, but supposedly one day he got off his world and found a lover, and when they had children he was amazed to find that she lactated.”</i> She poses to display the best curve of her barely restrained mammaries. <i>“Discovering a source of sweet flavor and moisture got him to thinking, and it wasn’t long before he found ideal cooling-coil technology, a few genetic artists, and some 100% legal, legitimate indentured servants. The rest is history: he built the company and his descendants have made it a smash hit, moving from original flavors to carefully cultivated unique flavors over the company’s long lifespan!”</i>");
	output("\n\nYou express your doubts about the story, and Yammi looks distressed.");
	output("\n\n<i>“I assure you that it’s as accurate as historians have been able to verify!”</i> she notes.");
	output("\n\nIn an effort to move the conversation along, you go back to clarify the source of the desserts.");
	output("\n\n<i>“100% genuine female mammaries, or the nearest equivalent gland!”</i> she explains proudly, with a sweeping gesture around the store. <i>“Our girls have been exclusively selected and carefully bio-tweaked to provide the ultimate in cool refreshment, flavor, and nutrition to the sentient races of the cosmos!”</i>");
	output("\n\nWell, that explains the product fairly well, doesn’t it?");
	//(Select ‘Back’ to return to the Questions menu)
	processTime(6);
	clearMenu();
	addButton(0,"Next",questionsForYammi);
}

//Girls
public function askYammiAbootZeGurls():void
{
	clearOutput();
	yammiShopDisplay();
	output("You glance at the machines nearby, noting the shapes of women trapped inside, and inquire with Yammi about them. Surely that can’t be a comfortable job.");
	output("\n\n<i>“All production servants are fed, sheltered, and comfortably orgasmed well in excess of galactic minimum standards. Genetic engineering has been involved to bring each one to production output and produce appropriate flavoring. All indentured workers and servers are almost considered legal property of the Iced Teats Confectionery Company,”</i> she recites.");
	output("\n\nYou roll your eyes. Even ice cream stores have legal jargon these days! Calling her attention back to the point of your question, you indicate the discomfort they must feel in those machines.");
	output("\n\n<i>“It’s really hard for me to sympathize with them, actually. They get one day on, two days off, spa treatments, exercise, great food, entertainments... It’s really not fair!”</i> Yammi’s expression turns somewhat sour. <i>“They’re indentured servants, almost all of them were bred specifically for this role, so they don’t know any other life. The machines are carefully made to be comfortable as can be, and they have massaging devices to keep them from getting stiff and achy. Plus every time they make more than a cone, they get an orgasm.”</i>");
	output("\n\nThat seems like not too bad of a job, except for the bit about being enslaved. You note as much to Yammi, and she rolls her eyes.");
	output("\n\n<i>“Just between us, I kind of wish I’d made the cut. I mean sure, I actually have the chance to buy out my own contract and get out of here eventually, but they get all the good things, you know?”</i>");
	output("\n\nYou let her know your curiosity is piqued by the ‘buying out contract’ comment. Sounds like there’s a loophole in this arrangement.");
	output("\n\n<i>“Well, indentured servants have to work to pay off all the food, shelter, and so on that their master has given to them. It’s like being in deep debt. Since I just have those bills to pay off, I just need to squirrel away enough tips and make a bit of " + (isAprilFools() ? "dogecoin" : "credit") + " on the side. Eventually I’ll be able to afford it!”</i> She smiles cheerfully at the idea. <i>“The producers though, their bills are huge and they only get more expensive. Spas and gyms aren’t cheap! They’re in it for life, so they should be happy that life is going to be mostly pleasant.”</i> Yammi seems to have a hint of jealousy in her voice.");
	output("\n\nWell, their situation could certainly be worse, you are forced to admit. Still, what a job. You imagine it must be a punishing task to make so much ice cream in a day.");
	output("\n\n<i>“It absolutely is. Some of our best selling flavors have to be switched out once a day, twice on some holidays! The extractor is also a little on the merciless side. The intense squeezing and suction occasionally bruises overused flavors a little. One or two of them that are adapted for hot environments also bitch endlessly about the ice coils being so close to their nipples.”</i> Yammi crosses her arms and shrugs. <i>“But really, they have hyper metabolisms as far as digesting food and making cream. I’ve never yet seen one run out! They just slow down a little bit. And the constant feed ensures they have ample fuel for the process. As for their aches and gripes, they should just be happy they don’t have to deal with screaming angry customers throwing things at them and cursing at them all the time.”</i> Realizing she just resorted to grousing about her job, Yammi’s cheeks flush a cute blood-orange color and she covers her mouth, then notes: <i>“I’m just going to stop talking now! Sorry!”</i>");
	output("\n\nYou chuckle and tell her it’s alright, to put her at ease. No point getting her in trouble.");
	//(Select ‘Back’ to return to the Questions menu)
	processTime(9);
	clearMenu();
	addButton(0,"Next",questionsForYammi);
}

//Company
public function askYammiAboutTheCompany():void
{
	clearOutput();
	yammiShopDisplay();
	output("You ask about the company. It sounds like a big one, you might trip over them somewhere down the line. It can’t hurt to know a thing or two about them.");
	output("\n\n<i>“Iced Teats is one of the oldest confections companies still in operation. They are careful to manage their recruitment programs and keep ample stocks of indentured workers on hand in case opportunities for expansion pop up. The males they use for breeding are also typically used for light labor or office work.”</i> She leans on her counter and looks thoughtful. <i>“The company prides itself on never retiring a flavor. They’re also proud to note that because of their stocks of indentured servants, no less than three species have been saved from extinction after galactic calamities wiped out every other viable genetic deposit. They are also on the leading edge of collecting new species, snatching up breeders as soon as they are legally able and rapidly expanding their stores.”</i>");
	output("\n\nWell, that sounds not terrible, given that it’s a giant soulless corporation. You then notice Yammi leaning closer, and suspect she has more to add.");
	output("\n\n<i>“Just between you, me, and the stars? I’m not entirely convinced that they have all that legality in mind. I’ve seen some new girls get hauled in and they weren’t all that cooperative. Others came in and I had only just heard of their species a month prior.”</i> She says hushedly. <i>“It doesn’t happen often, but in a company this big they could be kidnapping and enslaving thousands of new girls. Not at gunpoint, mind you. One I remember seeing came up in a newspaper as vanishing because of huge gambling debts, and another one was a sports player who lost them a huge amount of money after they funded her career.”</i>");
	output("\n\nWell, that’s pretty interesting. You make a mental note to keep your ears open for further news. When you ask Yammi if she has more details, she shakes her head.");
	output("\n\n<i>“I’m just a cashier. And look, these people raised me. They’ve given me everything I have. Not all of them are bad. But somewhere in the middle of the company, something’s gone a little rotten.”</i>");
	output("\n\nShe suddenly goes back to fiddling with her register, and you can’t get her to approach the topic any more. She must sense something extraordinary in you to have risked such a sensitive bit of information. You decide not to press further.");
	//(Select ‘Back’ to return to the Questions menu)
	processTime(5);
	clearMenu();
	addButton(0,"Next",questionsForYammi);
}

//Yammi
public function askHerAboutHerself():void
{
	clearOutput();
	yammiShopDisplay();
	output("<i>“Eh? Me?”</i> Yammi blushes a darling blood-orange. <i>“I’m nobody special. Just an indentured servant who didn’t have the right genes for production use. I just work here as a cashier.”</i>");
	output("\n\nYou invite her to fill you in a little more. After all, everyone is someone, right?");
	output("\n\n<i>“Well, I am an amphibian, that’s pretty neat. I even sleep in a tub of water. Very comfortable!”</i> She wracks her brain to try and find anything interesting to say about herself. <i>“Nope. That’s about it. I was bred and raised by the company and I’ve worked for them my whole life. I’m hoping to buy out my contract and get out and about soon. Apparently my people live a looong time, so I should have plenty of opportunities.”</i>");
	output("\n\nYou see an opening and slip right in, inquiring about what she would do and where she’d go when she’s free of contractual obligations?");
	output("\n\n<i>“Well, think first I’d find some warm water-world and take a vacation. I get one day out of ten off around here. It’s terrible. I need a little unwinding time, you know?”</i> She looks off into the middle distance and sighs. <i>“Just somewhere nice and relaxing to spend some time, maybe get a job to pay my way and stay there longer. After that, maybe I’d try my hand at this space traveling stuff. I’m sure I could get on as a cook on some ship! Seems like there’s a lot out there to do and see, and so many meals to prepare. Cooking’s kind of a hobby of mine.”</i>");
	output("\n\nYou assure her there is a lot out there, and there’s no end to it in sight. She giggles and smiles.");
	output("\n\n<i>“Thanks! It’s sweet of you to say that. Of course, first I’ve got to finish here.”</i> She shrugs. <i>“One thing at a time, right?”</i>");
	flags["YAMMI_SELF_TALK"] = 1;
	//(Select ‘Back’ to return to the Questions menu)
	processTime(6);
	clearMenu();
	addButton(0,"Next",questionsForYammi);
}

//Sex
public function askyammiAboutSex():void
{
	clearOutput();
	yammiShopDisplay();
	output("You don’t feel shy mentioning that so many beauties around is pretty stimulating, not the least of which is Yammi herself. Her face goes blood-orange in blush.");
	output("\n\n<i>“Officially the company doesn’t condone unauthorized breeding and/or sexual interaction with our employees,”</i> she says calmly. When you inquire about unofficially, she smiles a little. <i>“Well, some of the girls are stored in back in case we need to switch flavors, and a friendly visit is possible, sometimes. They do enjoy warm flesh after all the cold machines. For a slight tip of course... a girl’s got to pay her way somehow!”</i> She taps the counter nervously. <i>“Not today though. The girls who would be up for that aren’t in. But... maybe for a big enough tip, I might be convinced to put up the ‘Momentary Delay’ sign and lock the door for a little personal time. A woman has needs.”</i>");
	//output("\n\n<b>Placeholder till some sex appears. Someone be a dear and write this for me. She doesn’t need scenes for everybody.</b>");
	processTime(2);
	clearMenu();
	addButton(14,"Back",questionsForYammi);
}
