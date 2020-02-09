import classes.Items.Toys.Bubbles.HugeCumBubble;
import classes.Items.Toys.Bubbles.LargeCumBubble;
import classes.Items.Toys.Bubbles.MediumCumBubble;
import classes.Items.Toys.Bubbles.SmallCumBubble;
import classes.ItemSlotClass;

/* Item utility functions. Put here since fuck figuring out how to inheritance*/
//Use Options
//While In Combat
public function playerUsedBubbleBuddyInCombat(targetCreature:Creature, usingCreature:Creature, item:ItemSlotClass):void
{
	clearOutput();
	
	// Grapple check
	if(pc.isGrappled())
	{
		output("You struggle to throw the cum bubble, but you can’t while in the grips of the opponent!");
		return;
	}
	
	author("Adjatha");
	
	var healed:Boolean = ((targetCreature.HP() < targetCreature.HPMax()) || (targetCreature.energy() < targetCreature.energyMax()));
	
	//throw it like a water balloon while in combat
	//[Small cum Bubble]
	if(item is SmallCumBubble)
	{
		output("Shrugging, you suppose your cum bubble may be worth a try. Gripping it firmly, you lean back and pitch the elastic ball with all the force you can muster.");
		if(rangedCombatMiss(usingCreature, targetCreature))
		{
			output("\nYou whiff, and the ball rolls away!");
		}
		else
		{
			output("\n\nThe golfball-sized orb hits its mark and connects with a latex twack. Its casing is too dense to burst, however, and the rubbery ball bounces off and rolls away!");
			//Uses accuracy to hit and deals small kinetic damage
			applyDamage(item.baseDamage, usingCreature, targetCreature);
		}
	}
	//[Medium cum Bubble]
	else if(item is MediumCumBubble)
	{
		output("You loosely hold the squishy sphere in one hand while adjusting to a side-facing stance. Shifting your weight backwards, you swing the bubble backwards, eyes focused on your opponent");
		if(targetCreature.isPlural) output("s");
		output(". In one, smooth motion, you extend your arm past your [pc.hips] and shift your weight forward, pivoting to add force to your throw. You snap your wrist just as you release the balloon, its warm, sticky contents pitched at some force.");
		if(rangedCombatMiss(usingCreature, targetCreature))
		{
			output("\nYou whiff, and the ball splatters harmlessly on the ground!");
		}
		else
		{
			output("\n\nThe fist-sized orb hits its mark, the taut latex bloating outward from the impact for a moment before popping with a sharp snap! The [pc.cumVisc] contents of the balloon splatter against your target");
			if(targetCreature.isPlural) output("s");
			output(" like a spilled glass of [pc.cumColor] cream.");
			if(targetCreature.hasAirtightSuit())
			{
				output("\nUnfortunately,");
				if(targetCreature.isPlural) output(" their outfits are");
				else output(" " + targetCreature.mfn("his", "her", "its") + " outfit is");
				output(" airtight, making the attack ineffective!");
			}
			else if(targetCreature.hasSkinFlag(GLOBAL.FLAG_ABSORBENT))
			{
				output("\nOops, it looks like you have misjudged your opponent");
				if(targetCreature.isPlural) output("s--their " + (targetCreature.skinType == GLOBAL.SKIN_TYPE_GOO ? "gooey" : "") + " skin absorbs the semen" + (healed ? ", revitalzing their health and energy" : "") + "!");
				else output("--" + targetCreature.mfn("his", "her", "its") + " " + (targetCreature.skinType == GLOBAL.SKIN_TYPE_GOO ? "gooey" : "") + " skin absorbs the semen" + (healed ? ", revitalzing " + targetCreature.mfn("his", "her", "its") + " health and energy" : "") + "!");
				if(healed) {
					targetCreature.HP(Math.round(targetCreature.HPMax() * 0.25));
					targetCreature.energy(Math.round(targetCreature.energyMax() * 0.25));
				}
			}
			else if(targetCreature.isLustImmune)
			{
				output("\nHowever, your opponent");
				if(targetCreature.isPlural) output("s seem");
				else output(" seems");
				output(" to be unaffected by the attack!");
			}
			else
			{
				//Uses accuracy to hit and deals small lust damage
				applyDamage(item.baseDamage, usingCreature, targetCreature);
			}
		}
	}
	//[Large Cum Bubble]
	else if(item is LargeCumBubble)
	{
		output("Gripping the semi-taut ball of spunk with both hands, you take a few steps forward, fingers sinking into the yielding surface slightly. Pulling the orb back with your arm completely straight, you bend slightly at the waist and pitch it forward. Releasing your grip just as the sphere starts its upswing, you follow through in an outward motion to add a spin to the projectile, which arcs heavily toward your target");
		if(targetCreature.isPlural) output("s");
		output(".");
		if(rangedCombatMiss(usingCreature, targetCreature))
		{
			output("\nYou whiff, and the ball splatters harmlessly on the ground!");
		}
		else
		{
			output("\n\nThe head-sized orb hits its mark, the straining latex covering snapping almost immediately upon contact. The showering spunk released from the popped balloon erupts like an upturned pitcher, warm jizz drenching your target");
			if(targetCreature.isPlural) output("s");
			output(" as thoroughly as a 20-man bukkake session.");
			if(targetCreature.hasAirtightSuit())
			{
				output("\nUnfortunately,");
				if(targetCreature.isPlural) output(" their outfits are");
				else output(" " + targetCreature.mfn("his", "her", "its") + " outfit is");
				output(" airtight, making the attack ineffective!");
			}
			else if(targetCreature.hasSkinFlag(GLOBAL.FLAG_ABSORBENT))
			{
				output("\nOops, it looks like you have misjudged your opponent");
				if(targetCreature.isPlural) output("s--their " + (targetCreature.skinType == GLOBAL.SKIN_TYPE_GOO ? "gooey" : "") + " skin absorbs the semen" + (healed ? ", revitalzing their health and energy" : "") + "!");
				else output("--" + targetCreature.mfn("his", "her", "its") + " " + (targetCreature.skinType == GLOBAL.SKIN_TYPE_GOO ? "gooey" : "") + " skin absorbs the semen" + (healed ? ", revitalzing " + targetCreature.mfn("his", "her", "its") + " health and energy" : "") + "!");
				if(healed) {
					targetCreature.HP(Math.round(targetCreature.HPMax() * 0.50));
					targetCreature.energy(Math.round(targetCreature.energyMax() * 0.50));
				}
			}
			else if(targetCreature.isLustImmune)
			{
				output("\nNevertheless, your opponent");
				if(targetCreature.isPlural) output("s seem");
				else output(" seems");
				output(" to be unaffected by the attack!");
			}
			else
			{
				//Uses accuracy to hit and deals moderate lust damage
				applyDamage(item.baseDamage, usingCreature, targetCreature);
			}
		}
	}
	//[Huge Cum Bubble]
	else
	{
		output("Hefting the massive cum tank with both hands, you begin swinging it back and forth, using your [pc.hips] to add weight to your sweeps. As you prepare to toss the pressurized sphere, you twist toward your target, stepping forward as you release the orb. The enormous jizz bubble soars with hypnotic grace, its elastic sheath blobbing and deforming from the force of your pitch.");
		if(rangedCombatMiss(usingCreature, targetCreature))
		{
			output("\nYou whiff, and the ball splatters harmlessly on the ground!");
		}
		else
		{
			output("\n\nWhen the torso-sized orb hits its mark, the over-pressurized latex covering disintegrates with an echoing pop. The full weight of your mammoth load detonates all over the place in one, [pc.cumColor] instant. Your target");
			if(targetCreature.isPlural) output("s are");
			else output(" is");
			output(" bathed in the [pc.cumVisc] cream, the force of impact enough to knock a man clear off his feet. The deluge of seed is so excessive, it’s almost as if someone had just upturned a bathtub full of spunk.");
			if(targetCreature.hasAirtightSuit())
			{
				output("\nUnfortunately,");
				if(targetCreature.isPlural) output(" their outfits are");
				else output(" " + targetCreature.mfn("his", "her", "its") + " outfit is");
				output(" airtight, making the attack ineffective!");
			}
			else if(targetCreature.hasSkinFlag(GLOBAL.FLAG_ABSORBENT))
			{
				output("\nOops, it looks like you have misjudged your opponent");
				if(targetCreature.isPlural) output("s--their " + (targetCreature.skinType == GLOBAL.SKIN_TYPE_GOO ? "gooey" : "") + " skin absorbs the semen" + (healed ? ", revitalzing their health and energy" : "") + "!");
				else output("--" + targetCreature.mfn("his", "her", "its") + " " + (targetCreature.skinType == GLOBAL.SKIN_TYPE_GOO ? "gooey" : "") + " skin absorbs the semen" + (healed ? ", revitalzing " + targetCreature.mfn("his", "her", "its") + " health and energy" : "") + "!");
				if(healed) {
					targetCreature.HP(Math.round(targetCreature.HPMax() * 0.85));
					targetCreature.energy(Math.round(targetCreature.energyMax() * 0.85));
				}
			}
			else if(targetCreature.isLustImmune)
			{
				output("\nEven after all that, your opponent");
				if(targetCreature.isPlural) output("s seem");
				else output(" seems");
				output(" to be unaffected by the attack!");
			}
			else
			{
				//Uses accuracy to hit, deals moderate lust damage, and may cause knock-down
				applyDamage(item.baseDamage, usingCreature, targetCreature);
			}
			if(!targetCreature.isGoo() && !targetCreature.hasStatusEffect("Tripped") && !targetCreature.isPlanted() && (((usingCreature.aim()/2) + rand(20) + 1) > ((targetCreature.reflexes()/4) + (targetCreature.physique()/4) + 10)))
			{
				CombatAttacks.applyTrip(targetCreature, "Cannot act for a turn.");
				output("\n\n<b>There’s so much [pc.cumNoun] that " + targetCreature.getCombatName() + " is tripped!</b>");
			}
		}
	}
	itemConsume(item);
}
//While Out of Combat
//Use option while you are in your exploring state
public function outOfCombatBubbleBuddyUse(item:ItemSlotClass):Boolean
{
	clearOutput();
	author("Adjatha");
	output("You hoist the sloshing spunk sack with mild interest. It’s still warm and no matter how long you play with it, it retains your heat perfectly.");
	//bimbo brains: 
	if(pc.isBimbo()) output(" Isn’t that funny- a condom that keeps your cummies swimming forever! You wonder how they do it, but forget your train of thought and go back to playing with the squishy ball.");
	else output(" You’re not sure how it’s supposed to keep the sperm potent, but you suppose the rubbery material must have some enzyme that inhibits cellular degradation, possibly an off-shoot of longevity technology.");
	output(" No matter how they do it, you seem to have a perpetually potent sample of your cum.");
	output("\n\nPlaying with the elastic tension of your still-warm spunk bubble, you idly wonder what to do with the thing. Really no sense in carrying it around all the time, but what practical use does a sealed cum ball have?");
	//[Ditch It] [Pop It] [Put It Away]
	clearMenu();
	addButton(0,"Ditch It",ditchDatCumBall,item);
	addButton(1,"Pop It",popDatBubbleButtBubb,item);
	addButton(2,"Put Away",putItAway,item);
	if(pc.hasPerk("Dumb4Cum")) addButton(3,"Drink It",drinkSomeBubbleBud,item,"Drink It","Gosh, cum is tasty. Maybe you could like, drink some?");
	else if(pc.hasPerk("'Nuki Nuts") && pc.hasCock() && pc.balls > 0) addButton(3,"Drink It",drinkSomeBubbleBud,item,"Drink It","Your ‘nuki nuts could use a little booster. Bottoms up!");
	else addDisabledButton(3,"Drink It","Drink It","You have no reason to start drinking cum.");
	return true;
}
//[Ditch It]
public function ditchDatCumBall(item:ItemSlotClass):void
{
	clearOutput();
	author("Adjatha");
	showName("\nDITCH IT");
	output("You’re forced to admit that you can’t really think of a good use for a ball of spunk, no matter how fresh it might stay. You drop the latex sphere and watch it bounce slightly as it rolls along the ground. Maybe somebody (or something) will have a use for this. If so, they’re welcome to it.");
	itemConsume(item);
	//Maybe this slightly reduces your encounter rate in the wild for two hours, as the local fauna focus on the cum?
	clearMenu();
	addButton(0,"Next",useItemFunction);
}
//[Pop Bubble]
public function popDatBubbleButtBubb(item:ItemSlotClass):void
{
	clearOutput();
	author("Adjatha");
	showName("\nPOP IT");
	//Small Bubble
	if(item is SmallCumBubble) output("Despite your best efforts, the latex sheath on your small orb is far too dense to pop with your bare hands. You squeeze, squish, crush, and even smash the sphere, but it bounces back from every impact, its contents securely sealed away. You’d need to puncture or melt the casing, and frankly neither seems all that appealing at the moment. You tuck the durable little guy away, a little impressed by the sheath’s over engineered design. The guys and gals at TamaniCorp don’t kid around when it comes to keeping sperm safe!");
	//Medium Bubble
	else if(item is MediumCumBubble)
	{
		output("You simply can’t help yourself. Gripping the grapefruit-sized latex orb in one hand, you begin fingering the pliant surface. No matter how hard you squeeze, however, the sealed condom just bulges out in a new direction. These things are tougher than you’d have expected! Placing your other hand over it, you press your palms together, flattening the sphere bit by bit, its warm contents bloating between your fingers. The violet hue thins and grows more transparent the more pressure you place on the squashed sheath, until it’s nearly translucent.");
		output("\n\nYou apply just a little bit more tension and the overwrought latex pops in your grip, the gooey contents splattering across the [pc.skinFurScales] of your hands and upper arms. A few blobs of the sticky jizz catch you across the face, making your wince in surprise. You indulge a small chuckle of delight, fingers dripping with your preserved spunk.");
		if(pc.isGoo()) 
		{
			output(" You focus slightly and the spoo on your arms slowly sinks past your slimy skin, reincorporated into your gelatinous frame. Delicious!");
			if(pc.hairType == GLOBAL.HAIR_TYPE_GOO) pc.addBiomass(300);
		}
		else 
		{
			output(" You should probably clean this up at some point!");
			pc.applyCumSoaked();
		}
		//increase lust by 1-3 and non-goos gain the “Cum Soaked” status
		pc.changeLust(1+rand(3));
		itemConsume(item);
	}
	//Large Bubble
	else if(item is LargeCumBubble)
	{
		output("Hoisting the bowling ball of latex-sheathed cum between both hands, you rotate it slowly in your grip. You can’t seem to find the seam where your toy sealed up the hefty bubble. Shrugging, you begin digging your fingers into the taut surface, only able to depress the elastic an inch or so before the tension halts your squeezing. You give it a series of therapeutic compresses, but the orb maintains its integrity. Maybe you should sell these as stress balls?");
		output("\n\nYou begin tossing the ball into the air and catching it, enjoying the warm, fluid squish that fills your hands with every pitch. Tossing higher and higher, a crazy idea enters your head. Rather than moving to catch the cum sphere, you position yourself directly under it, you face upturned and your eyes closed. A tense, blind moment of anticipation makes you hold your breath. When the ball finally comes back down, it lands on your face with a gooey, rubbery impact. The force of the hit seems sufficient to rupture the pliant covering, popping the bubble and releasing its shower of warm spunk all over your [pc.skinFurScales]. It drenches your [pc.hair] and splatters across your [pc.chest], utterly coating you in your own, still-fresh ejaculate. ");
		//if goo body:
		if(pc.isGoo())
		{
			output("You relish the feeling of warm, sweet fluids all over your frame and begin scooping it up with both hands, to drizzle the slime into your eager mouth. You gel skin tingles with the fresh meal, glistening with organic approval.");
			if(pc.hairType == GLOBAL.HAIR_TYPE_GOO) pc.addBiomass(4000);
		}
		else
		{
			output("You’re completely soaked! If you just [pc.walk] around like this, people might start getting ideas.");
			pc.applyCumSoaked();
		}
		//increase libido by 1, lust by 2-5, and non-goos gain the “Cum Soaked” status
		pc.libido(1);
		pc.changeLust(2+rand(4));
		itemConsume(item);
	}
	//Huge Bubble
	else
	{
		output("You find a comfortable spot and take a seat, holding the massive cum bubble with both arms. Squeezing it against your [pc.chest] in a tight hug, you savor the elastic warmth of the beachball-sized thing. It’s practically the size of your torso! As you hold it tightly, you can feel the latex slightly vibrating in your embrace, its pressurized contents eagerly seeking some outlet from the straining sheath. The rubbery container is so taut, in fact, that you bet you could pop it with a single finger. Holding the colossal orb in the crook of one arm, you press your index finger against the strained surface, applying more and more pressure until the ball practically trembles in your grip.");
		output("\n\nEasing for a moment, you then drive your forefinger back in, poking the ball as hard as you can. The latex covering snaps, its internal pressure disintegrating the sphere as the liquid spunk discharges like a ruptured reservoir. It’s like you set off a gooey bomb- the cum explodes in every direction, soaking you from the top of your [pc.hair] to the bottom of your [pc.legOrLegs]. Slimy, dripping [pc.cumNoun] leaks down the curve of your [pc.lips]");
		if(!pc.isNude()) output(" and splatters against your [pc.gear]");
		output(". A spreading pool of the warm spunk has left a detonation pattern on the ground in front of you, the thick glaze just EVERYWHERE!");
		if(pc.isGoo()) 
		{
			output(" Giggling with manic delight, you strip off your [pc.gear] and let your semi-permeable gelatinous frame take care of the mess. Your body soaks up the warm seed, skin drinking in the spunk with insatiable thirst, while you gather up handfuls from the ground to drip into your eager maw. Such a feast! You eat to fulfillment and lounge in dazed contentment for a few minutes, rubbing your cum-bloated belly.");
			if(pc.hairType == GLOBAL.HAIR_TYPE_GOO) pc.addBiomass(70000);
		}
		else
		{
			output(" You can’t help but ");
			if(pc.libido() < 25) output("pale in terror");
			else if(pc.libido() < 50) output("blush with hot embarrassment");
			else if(pc.libido() < 80) output("chuckle in lusty delight");
			else output("coo with whorish satisfaction");
			output(" at what you must look like. Your [pc.skinFurScales] is so coated by the dripping spunk that you could pass for a galotian! You’re going to need one heck of a shower to get all this off.");
			pc.applyCumSoaked();
		}
		//increase libido by 1, lust by 7-10, and non-goos gain the “Cum Soaked” status
		pc.libido(1);
		pc.changeLust(7+rand(4));
		itemConsume(item);
	}
	clearMenu();
	addButton(0,"Next",useItemFunction);
}

//[Put it away]
public function putItAway(item:ItemSlotClass):void
{
	clearOutput();
	author("Adjatha");
	showName("\nNEVER MIND...");
	output("You tuck the cum bubble back into your belongings for now. Surely there’s somebody out there who would love a fresh spunk delivery.");
	clearMenu();
	addButton(0,"Next",useItemFunction);
}

//[Drink It]
//Your ‘nuki nuts could use a little booster. Bottoms up!
public function drinkSomeBubbleBud(item:ItemSlotClass):void

{
	clearOutput();
	author("SomeKindofWizard");
	showName("BOTTOMS\nUP!");
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();

	if(pc.hasPerk("Dumb4Cum"))
	{
		author("Fenoxo Fenbutt");
		output("You heft the perfectly preserved bubble of seed ");
		if(item is SmallCumBubble) output("between your fingers");
		else if(item is MediumCumBubble) output("in your hands");
		else if(item is LargeCumBubble) output("in both hands");
		else output("in your arms");
		output(". There’s spooge inside. Probably still warm");
		if(pc.isBimbo()) output(" or something.");
		else output(" thanks to the advanced containment systems.");
		output(" Your mouth waters at the thought of it. It’d be so easy ");
		if(pc.isBimbo()) output("to like, pop a hole in it and drink up all the yummy goo.");
		else output("to puncture it and get at the delicious goo.");
		output(" How can anyone resist the liquid bounty within?");

		output("\n\nWith your concerns taking a backseat to cum-thirstiness, you ");
		if(pc.isBimbo()) output("giddily bite a hole in the bubble, giggling around a mouthful of spermy treasure as it pours into your mouth.");
		else output("carefully bite a hole in the bubble, trying not to let it show just how much you love the taste of the spermy treasure as it pours into your mouth.");
		if(item is SmallCumBubble) 
		{
			output(" If only there was more! You swish the small load over every inch of your mouth to savor the flavor as long as you can. Your breath is going to smell like jizz, but that’s a small price to pay for having the taste of residual spunk lingering on your tongue.");
			pp.createPerk("Fixed CumQ",300,0,0,0);
		}
		else if(item is MediumCumBubble) 
		{
			output(" Oh yessss.... This is exactly what you need. Your throat bobs as you gulp down the rich ejaculate. There’s enough that you don’t have to slow yourself down to savor the flavor. There’s more than enough for you to pour into your mouth with every swallow. You let your cheeks bulge, filling every nook and cranny with heavenly spunk. It’s like having liters of ambrosia at your disposal, and you consume every last drop.");
			pp.createPerk("Fixed CumQ",4000,0,0,0);
		}
		else if(item is LargeCumBubble) 
		{
			output(" Mmmm.... This is absolute heaven. You can scarcely keep up with the flow. The bubble is so taut with stored jizz that rushes out in a constant, strong flow. Your cheeks bulge. Spunk leaks from the corners of your mouth, but you resolve to scoop it up later. ");
			if(!pc.isBimbo()) output("Waste not, want not.");
			else output("No point in letting any tasty cummies get away!");
			output(" The longer you drink, the less severe the flow becomes. Now you can manage how fast the spooge squirts out by adjusting how hard you squeeze the deflating pouch. Of course you wring it dry as fast as possible. Cum is meant to spurt out in passionate eruptions, not leisurely sipped. When you’ve finished, a huge blob of seed is dribbling down your chin. You push it up into your lips with a mischievous smile, your urges momentarily sated.");
			pp.createPerk("Fixed CumQ",10000,0,0,0);
		}
		else
		{
			output(" Stars, you can barely keep up! Jizz cascades over your cheeks and chin. It spills down your [pc.chest] no matter how you chug, and that’s just perfect. You delight in your self-induced bukkake, content to drown in as much spunk as you can cram into your maw while bathing in the excess. The rest of the universe fades away beneath the spermy tide. There’s just you and the endless, orgasmic taste of drinking cum.\n\nEventually, you run out of sperm-filled goo to drink, but not until your whole front is painted in cream. You must look like a complete and total slut. The assessment wouldn’t be entirely wrong, you suppose, mid-way through scooping a handful of leftovers into your mouth, sucking the residual flavor from your fingers. Mmmmm...");
			pp.createPerk("Fixed CumQ",40000,0,0,0);
			pc.applyCumSoaked();
		}
		pc.loadInMouth(pp);
	}
	//Small Bubble
	else if(item is SmallCumBubble) 
	{
		output("You heft the warm bubble between your hands, feeling the contents slosh a little. It’s hard not to be a little disappointed in yourself! It’s obvious that a little boost is in order, and thanks to the genetic gift of your ‘nuki nuts even a small amount will be more than adequate.");
		output("\n\nNot enough to turn your testes into swollen cum-tankers, but certainly enough to stuff up an eager slut, or paint yourself and others ivory. Just the thought sends a thrum of pleasure right down to your [pc.cocks]. Time to get started.");
		output("\n\nThe first test is figuring out how best to drink from it without wasting the precious reserves. You give the surface a testing poke, feeling it wobble. Placing the bubble to your lips, you nibble at the edges, " + pc.mf("chuckling","giggling") + " to yourself at the ridiculousness of it all. Still, the insistent throbbing of your [pc.cocks], and the need to fill your [pc.balls] until " + (pc.balls <= 1 ? "it" : "they") + " churn with potent seed is very persuasive.");
		output("\n\nYou nibble at the thin boundary between your [pc.lips] and their liquid prize; it still takes a little work, but finally something gives. Your flavorsome [pc.cumNoun] graces the tip of your tongue, and you open wide, all but stuffing the bubble into your mouth. You swallow it down with a wicked smile, spitting out the then-empty membrane afterwards, smacking your [pc.lips] together contentedly.");
		output("\n\nIt doesn’t take long for tingles of pleasure to rush their way to your nethers, heralding future growth in a way that gets you hot under the collar.");
		pc.changeLust(10);
		//increase libido by 2, lust by 10, trigger low-level nuki...growth (Whatever it’s called)
		//Fen note: Nope. No libido gain.
		processTime(6);
		pp.createPerk("Fixed CumQ",300,0,0,0);
		pc.loadInMouth(pp);
	}
	//Medium Bubble
	else if(item is MediumCumBubble)
	{
		output("With a wicked smirk, you squeeze and play with the tension of the cum-bubble. It’s not bad, sure. But you know full well that with this [pc.cumNoun] sloshing around in your stomach instead of this bubble? You could produce something <i>far</i> more impressive thanks to your unique biology. The thought’s enough to get you excited; you could make one of these beauties <i>burst</i>.");
		output("\n\n...It just takes a little kick-starting. Your [pc.cocks] grow");
		if(pc.cockTotal() == 1) output("s");
		output(" hard with the thought, and when your muscles clench, your [pc.balls] lift up a little. That’s right, these babies could ");
		if(pc.ballFullness >= 100) output("still find some room to grow");
		else output("definitely use filling up");
		output(". You squeeze the surface again, watching the bubble stretch beneath your [pc.fingers].");

		output("\n\nThe challenge is drinking from a bubble without making a mess. Not that it’s necessarily a <i>bad</i> thing to make a big [pc.cumNoun]-y mess, but it’s not going to do anything for your ‘nuki nuts if it’s slathered over your [pc.chest] instead of in your stomach. The warmth of the bubble is rather enticing once you’ve placed your lips up against it, teasing the idea of that [pc.cumType] being a hair’s breadth away.");

		output("\n\nYou hum against it, feeling the vibrations tremble through. through the bubble’s membrane. After that it’s just a gentle nibble. Even with that, the pressure of the bubble has your [pc.cumNoun] spurting past your mouth! Yo hurriedly suck and swallow, pressing as much of the bubble up against your lips as you can get away with. The heady scent of [pc.cumNoun] fills your nose, and your prostate already feels like it’s seething with more, getting ready to dump its contents into your balls.");
		output("\n\nYou sigh and pat your [pc.belly], feeling smug as your body begins its work.");
		//increase libido by 2, lust by 10, trigger medium-level nuki...growth (Whatever it’s called)
		pc.changeLust(10);
		processTime(6);
		pp.createPerk("Fixed CumQ",4000,0,0,0);
		pc.loadInMouth(pp);
	}
	//Large Bubble
	else if(item is LargeCumBubble)
	{
		output("Now this... this is a bubble! It’s full of exactly what you’ll need in order to fill your [pc.balls] up until each ball is capable of putting this thing to shame. All the better to turn a willing lover into a [pc.cumNoun]-coated statue. You settle down into a chair and give it a squeeze, feeling the warm contents all but slosh around. Just the thought of getting so full puts a tickle in your pickle, and sets you on edge.");
		output("\n\nIts liquid weight settles into your lap, and you give the bubble a testing poke, " + pc.mf("chuckling","giggling") + " at how membrane giggles, setting a tremble through your cum. Drinking from it seems like it’ll be a rather intense task... and promises to be a messy one, no matter how much [pc.cumNoun] you manage to ingest. You grasp the bubble at the top, lifting it until gravity makes a little empty space. You sink your finger in as hard as it’ll go, hoping the whole thing doesn’t just explode and coat you.");
		output("\n\nThankfully, the moment the membrane pops, it doesn’t take out the entirety of the bubble. Spooge begins to flow freely from the new opening like a tap, and you direct the opening to your mouth as quickly as possible. [pc.CumNoun] trails down your chin, and your cheeks fill with the first mouthful in record time. It trickles down your [pc.chest], ");
		if(pc.biggestTitSize() < 1) output("glazing your pecs");
		else output("making a sticky mess between your tits");
		output(" with potent seed.");
		output("\n\nAfter what feels like a straight minute, you manage to find a rythm of swallowing, until your stomach feels packed with cum. Already the weight of your own [pc.balls] seems to have doubled, and your cock is fiercely erect as the heady aroma and overindulgent state of your body sends hormones into overdrive.");
		output("\n\nStifling a burp, you let the empty bubble sag to the ground, wiping some of the cum from your chest with a grin. You give your soft orbs a squeeze, feeling them grow thicker by the moment. Look out universe.");
		//increase libido by 3, lust by 10-15, trigger large-level nuki...growth (Whatever it’s called)
		pc.changeLust(10);
		processTime(6);
		pp.createPerk("Fixed CumQ",10000,0,0,0);
		pc.loadInMouth(pp);
	}
	//Huge Bubble
	else
	{
		output("It’s hard to say if what you’re considering is genius or madness... the sheer weight of this bubble drags down against your hands, threatening to break whenever you walk with it.");
		output("\n\nYou fall into a chair as opposed to sit in it, the sheer warmth of so much liquid weight reaching deep into your core. Your [pc.cocks] press");
		if(pc.cockTotal() == 1) output("es");
		output(" upwards insistently, and you’re more than a little proud of what you’ve made. This must be what having a child is like... when, you know, you aren’t the scion of the Steele family with a specially-structured daycare.");
		output("\n\nStill. It’s quite an achievement. But really? Drinking this might just be the end of you. It’s far, far too much just to drink. You’ll just have to ensure you don’t consume <i>all</i> of it. It’s hard to imagine how you’ll even start drinking from it without just making a titanic mess of yourself.");
		output("\n\nNot that it’s necessarily a bad thing, but flooding the room isn’t going to do anything for your expansive [pc.balls]. You bury your face into the warm ocean of [pc.cumNoun], laughing at how absurd it is.");
		output("\n\nTime to get to business. You open your [pc.mouth] wide, with a soft <i>“Aaah~”</i>, before biting down as hard as you can. The bubble doesn’t so much burst as it does unleash itself into your mouth and all over your face. Gulping it down is an immediate challenge, forcing you to nearly choke on [pc.cumNoun]. It doesn’t take long for your stomach to fill, and it takes even less time to gather an all-new spunky coating.");
		pc.applyCumSoaked();
		output("\n\nYour body is overwhelmed in little to no time, and it’s a bit of a struggle to keep so much [pc.cumNoun] down.");
		pc.changeLust(10);
		processTime(6);
		pp.createPerk("Fixed CumQ",40000,0,0,0);
		pc.loadInMouth(pp);
	}
	itemConsume(item);
	clearMenu();
	addButton(0,"Next",useItemFunction);
}



//Email Notification
//This is added to the random spam emails that the player receives during the course of their adventure

//Subject: There's Got To Be A Better Way!
//From: Marketing@TamaniCorp.corp
//To: [pc.Email]@SteeleTech.corp

public function bubbleBuddyEmail():String {
	var buffer:String = "";
	buffer += "<i>As soon as you open this message, a video begins to play.</i>";

	buffer += "\n\nA kui-tan boy is displayed from the waist up, one arm moving vigorously just off screen. A voice-over plays, with tiny captioned text at the bottom of the screen. <i>“Are you tired of THIS happening?”</i> The kui-tan’s expression crinkles into a look of bliss, as he extends his free hand to a pile of silver condoms on a nightstand near by. He pulls a fistful back, but notices with horror that they’re all empty wrappers. His body shivers, and a massive jet of sticky white stuff shoots up roughly from the position of his lap, drenching the tanuki in a matter of seconds. He blinks, wiping the goop away from his eyes and turns to the camera with an exasperated shrug.";

	buffer += "\n\n<i>“Or how about THIS?”</i> the voice asks as the video shifts to a female ausar holding a filled condom and struggling to tie a knot in the slack end. She fumbles and flails, spunky goo dripping onto her hands before it slips out of her grip and flips in the air, landing on top of her head, right between her twitching ears. The leaking cream oozes down her hair and over her nose as she turns to the camera and lets out an exasperated sigh.";

	buffer += "\n\n<i>“Or even THIS?”</i>";

	buffer += "\n\nAnother shift and now a pair of laquine women are sitting next to one another, chatting over coffee. One starts pouring cream into her drink as she chats. <i>“We’re trying to get pregnant, but he’s so far away, what with the Planet Rush! He’s tried sending filled condoms back home, but by the time they gets to me, all the sperm has died! I’m in heat and I just don’t know what to do!”</i> she wails with... yes you detect a hint of exasperation here as well.";

	buffer += "\n\nHer friend furrows her brow and nods in sympathetic helplessness. <i>“There’s got to be a better way!”</i>";

	buffer += "\n\nThe screen darkens for a moment before brightening like the rise of a fresh new star. <i>“Now there is! Introducing the new Bubble Buddy!”</i> A picture of a translucent purple cylinder comes on screen, rotating slowly to show off the product. <i>“The Bubble Buddy is reusable, so no more struggling to find a condom right at the worst moment. It’s also incredibly easy to use! Just plug, play, and the Bubble Buddy does the rest!”</i>";

	buffer += "\n\nThe condom is replaced by a punky woman in a too-revealing corset, the bubblegum pink skin of her wobbling breasts straining mightily against the leather. She tilts her head to the side, a shock of purple hair flipping over one of her pointed ears as she does so. <i>“Hi. I’m Tamani, founder and CEO of Tamani Corp. I spend all day thinking about YOUR cum. Let me assure you, the Bubble Buddy will keep that baby batter fresh and potent until the heat death of the universe!”</i>";

	buffer += "\n\nShe steps over to a large pile of purple latex bubbles, with sizes ranging from no bigger than your pinkie all the way up to the size of a small bed. <i>“If you’ve got any doubts that the Bubble Buddy can keep your sperm swimming, send a bubble of your cum to our corporate offices. If your spunk can’t knock up an intern, we’ll send you a full refund!”</i> The camera pans a little further and standing next to the cum balloon pile is a small group of interns of various races, all heavily pregnant.";

	buffer += "\n\n<i>“Bubble Buddy cum bubbles also make great gifts for the rahn or galotian in your life,”</i> Tamani goes on, grinning. <i>“Just look at these satisfied faces!”</i> A bevy of pictures cascade across the screen, showing rahn of all sorts posing in front of the violet rubber blobs. Some are miming eating the bubbles while others actually have, the shadow of the latex orb visible in their swollen bellies.";

	buffer += "\n\nThe screen cuts back to the Bubble Buddy product page, a small host of tiny legal text flashing at the bottom of the screen. <i>“Pick up your Bubble Buddy today, anywhere fine Tamani Corp products are sold!”</i>";
	CodexManager.unlockEntry("Bubble Buddy");
	return buffer;
}

//Masturbate
//option only available for players with a penis. Blanked out for centaur, females, and neuter PCs.
//unavailable mouseover text: You'd need a conveniently located dick to use this toy.
public function jackIntoDaBubbleBooty():void
{
	clearOutput();
	author("Adjatha");
	showName("BUBBLE\nBUDDY");
	CodexManager.unlockEntry("Bubble Buddy");
	
	var x:int = pc.biggestCockIndex();
	
	if(flags["BUBBLE_BUDDIED"] == undefined) output("Taking out the light purple toy, you turn it around in your hands for a moment to inspect the thing. It’s roughly six inches long and two inches wide, with a hole at one of the ends. The interior drips with an oily lubrication that the wobbly gel of the toy seems to perpetually produce. The sheath has a thin membrane at the top that seems to serve as a cap, resembling nothing so much as a circle of stretched latex. It’s not shooting out any lasers or floating in mid air, so you assume you’ll have to do this the old fashioned way.\n\n");
	
	if(!pc.isNude()) output("Stripping out of your [pc.gear], you tentatively grip the squishy toy in one hand. ");
	output("The Bubble Buddy is warm to the touch, its supple surface jiggling in your grip. Your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is");
	else output("are");
	output(" already stiffening at the thought of your release, so you bring the violet onahole to your [pc.cockHead " + x + "].");
	if(pc.cocks[x].thickness() < 2) output(" The slick, slimy interior slides down the tender flesh of your swollen member, enlarging as it conforms to the shape of your stiffening shaft.");
	else if(pc.cocks[x].thickness < 4) output(" The yielding toy slides over your [pc.cock " + x + "] with only a modicum of difficulty. Its yielding, purple bulk distends as it swallows the girth of your plump pecker.");
	//Cock Thickness over 4":
	else output(" The narrow opening of the toy makes for a difficult fitting, but the toy’s gelatinous bulk stretches, inch by inch, until it slides down onto your cockhead, taut and straining.");
	output(" The inner folds of the pocket pussy clench with a moist softness that caresses your throbbing trunk with squelching voracity.");

	//added text for cocks between 7" and 18": 
	if(pc.cocks[x].cLength() < 7) {}
	else if(pc.cocks[x].cLength() < 18) output("\n\nSliding the six inch toy onto your weighty member tenderly, you bottom out inside of it. Your [pc.cockHead " + x + "] bumps the latex top and pushes outward. The rubbery cap stretches over your crest as you drag the lilac onahole the rest of the way down to your root. Pausing, you marvel at the flexibility of the thing- your entire cockhead is perfectly wrapped in a stretchy second skin that connects all the way down to the toy’s gelatinous base. When you ease it back up, the latex returns to its taut state without so much as a stretch mark as evidence of your distending thrust. Despite its size, this will work just fine for someone of your endowments.");
	//added text for cocks over 18":
	else output("\n\nSliding the six inch toy onto your weighty member tenderly, you bottom out inside of it all too quickly. Your [pc.cockHead " + x + "] bumps the latex top and pushes outward. The rubbery cap stretches over your crest as you drag the lilac onahole further and further down. The tension of the stretching elastic, rather than squishing entirely against your cockhead, is transferred all along the toy’s inner surface, tightening the whole sheath the further you go. The flexibility of the thing is incredible- an entire foot of your titanic shaft is perfectly wrapped in a stretchy second skin that connects all the way down to the toy’s gelatinous base. When you ease it back up, the latex pulls eagerly, adding speed to your return stroke as compensation for the slow tightness of insertion. Despite the dilating pressure your [pc.cock " + x + "] puts on the small pussy, it returns to its taut state without so much as a stretch mark where you your length had distended it. Despite its size, this will work just fine for someone of your endowments.");
	output("\n\nFingers tightening around the pliant Bubble Buddy, you ease into a slow, steady pace. The toy fits you perfectly - its slurping, gooey interior suckling at your [pc.cock " + x + "] with an almost organic heat. Squeezing its gelatinous base does wonderful things to the interior, the complex gel structure spreading small amounts of tension around its length like the trembling tightness of a pussy at the verge of climax. As you pump the sheath along your member, you unconsciously gnaw at your lower lip, [pc.chest] rising and falling with exhilarated quickness. Before long, you have both hands firmly around the lilac toy, pumping the semi-transparent jelly with uninhibited delight.");
	output("\n\nThe Bubble Buddy slaps wetly against your [pc.skinFurScales] as you jerk the slimy sheath along your length, the fat cumvein of your member tensing with the final, exquisite strokes of your imminent orgasm. Squeezing the lavender-hued tightness around your tingling tool provokes a trembling jiggle that starts at your root and whips upward like a jet of liquid distress through the sensitive surface of your [pc.cock " + x + "]. Clutching the onahole at the peak of your cockhead, you moan in a satisfied stupor as the toy hugs and suckles at your meat. [pc.CumColor] spurts of bubbling pre-cum splatter against the taut tip of the sheath for a desperate, tense moment before you release your [pc.cumVisc] seed.");
	//small volume (1-300mL)
	if(pc.cumQ() <= 300) 
	{
		output("\n\nRather than maintaining its elastic resistance, however, the rubber cap on the translucent amethyst toy bulges slightly, creating a reservoir for your seed. Drawn upwards, as if by vacuum pressure, your [pc.cumVisc] goo spurts into the small bubble eagerly. The toy reacts to the warm splatter by lightly vibrating, coaxing out your [pc.cumColor] spunk to the very last drop. With each spasm, the bump expands a bit more until a small, plum-colored orb tops your toy.");
		output("\n\nBreathing more calmly as the after-shudders of your orgasm fade, you admire the little purple blob on top of your pocket pussy. ");
		//cum 1-100mL:
		if(pc.cumQ() < 100) output("At 1\" across, the sphere is a bit smaller than a golf ball.");
		else if(pc.cumQ() < 200) output("At 2\" across, the sphere is roughly the size of a billiard ball.");
		else output("At 3\" across, the sphere is a bit larger than a tennis ball.");
		output(" Nothing leaks back down as you pull the sheath off your [pc.cock " + x + "] and a closer inspection shows that the tip has already resealed itself. The tiny orb lifts off of its rubbery base easily enough, its elastic covering tightens, shrinking slightly as it pressurizes your load. You roll the small, rubber-wrapped cum-ball in the palm of your hand and as you climb back into your [pc.gear], you tuck it away for later.\n\n");
		//player’s lust resets to zero and they gain 1x Small Cum Bubble
		processTime(13);
		pc.orgasm();
		quickLoot(new SmallCumBubble());
	}
	//medium volume (301-4,000 mL)
	else if(pc.cumQ() <= 4000)
	{
		output("\n\nRather than maintaining its elastic resistance, however, the rubber cap on the translucent amethyst toy bulges and expands, filling with the fat globs of your orgasm. Drawn upwards, as if by vacuum pressure, your [pc.cumVisc] goo fills the expanding bubble eagerly. The toy reacts to the plumping bounty by lightly vibrating, coaxing out your seeping spunk to the very last drop. With each spasm, the orb expands, your cream filling the condom’s reservoir with the rush of your [pc.cumColor] [pc.cumNoun].");
		output("\n\nWhen the suddering orgasm fades, the cylindrical sex toy now has ");
		if(pc.cumQ() < 2000) output("a hefty, apple-sized");
		else if(pc.cumQ() < 3000) output("a heavy, grapefruit-sized");
		else output("a massive, melon-sized");
		output(" sphere at its peak. The rubbery sheath, flush with your seed, resizes itself to a sphere, the pressurized contents sloshing within the semi-firm ball. The toy’s latex cap has apparently resealed itself, leaving the cum bubble barely connected by a thin membrane. The jiggling balloon seems perfectly sealed so, as you climb back into your [pc.gear], you decide to hang onto the palmable cum pod.\n\n");
		//player’s lust resets to zero and they gain 1x Medium Cum Bubble
		processTime(13);
		pc.orgasm();
		quickLoot(new MediumCumBubble());
	}
	//large volume (4,001-10,000 mL)
	else if(pc.cumQ() <= 10000)
	{
		output("\n\nThe gushing volume of your ejaculate hits the taut tip of the gel pussy like an iron ball on a rubber sheet. The liquid mass pouring from your [pc.cockHead " + x + "] floods the resevoir so quickly that in a matter of moments it has expanded into a blobby balloon thicker than the toy itself. With every spasmodic thrust of your [pc.cock " + x + "], the cum-thirsty sheath ripples and vibrates across your tender shaft. A shiver of heat passes from one shoulder to the other, your fingers tensed around the squishy, plum-colored pocket pussy so tightly that its rubbery surface bulges between your fingers. Your [pc.ass] clenches with the gushing release of your [pc.cumGem] seed.");
		output("\n\nWhen the suddering orgasm fades, the cylindrical sex toy has gained a hefty, cum-filled orb at its peak. The bubble is ");
		if(pc.cumQ() < 6000) output("as big as a volleyball");
		else if(pc.cumQ() < 8000) output("bigger than your head");
		else if(pc.cumQ() < 10000) output("practically the size of a punch bowl");
		output(". The straining, elastic sphere flexes and gradually settles into a jelly blob 7\" in diameter. The toy’s latex cap has apparently resealed itself, leaving the cum bubble barely connected by a thin membrane. The goo-filled globe seems safely sealed so, as you climb back into your [pc.gear], you decide to hang onto the slightly saggy cum cache.\n\n");
		//player’s lust resets to zero and they gain 1x Large Cum Bubble
		processTime(13);
		pc.orgasm();
		quickLoot(new LargeCumBubble());
	}
	//massive volume (10,001-70,000mL)
	else if(pc.cumQ() <= 70000)
	{
		output("\n\nWhen your geysering cream surges past the narrow vent of your urethral slit, the squishy toy is nearly blasted out of your grip. It’s all you can do to clamp down with tingling fingers as your orgasmic release floods into the Bubble Buddy’s condom-like reservoir. Your shoulders clench together as the spunk orb fills, gaining inches with alarming rapidity. Cheeks flushed and breath coming in ragged gasps, you hold on as best you can while gallon upon gallon of hot, seething seed gushes from your trembling form. The [pc.cumColor] bounty pours from your spasming [pc.cock " + x + "] like a mythological deluge. Sinking to your [pc.ass], the thinning latex toy bloats and distends under the inflating swell, losing its spherical elasticity with squeaking groans of protest. The heavy contents sag against your [pc.hips] and [pc.legOrLegs], nearly ready to bury you beneath the warm, fluid pressure of your rubber-sealed largess.");
		output("\n\nWhen the suddering orgasm fades, the cylindrical sex toy is utterly buried under the massive, cum-filled globe at its peak. The heavy, sloshing pouch is ");
		if(pc.cumQ() < 30000) output("bigger than an overfilled beach ball!");
		//cum 30,001-50,000mL:
		else if(pc.cumQ() < 50000) output("nearly as big as your upper body!");
		else output("large enough to be a fluid-filled chair!");
		output(" For a moment, you’re worried the squeaking surface of the spunk sphere might give out, but the straining elastic flexes and contracts. The lilac sheath compresses to a mere 15\" diameter, the pressurized contents sloshing dangerously inside the lavender orb. The cap has apparently resealed itself, leaving the cum bubble barely connected by a thin membrane. The huge cream capsule seems securely contained so, as you climb back into your [pc.gear], you decide to hang onto the taut, straining cum reservoir.\n\n");
		//player’s lust resets to zero and they gain 1x Huge Cum Bubble
		processTime(13);
		pc.orgasm();
		quickLoot(new HugeCumBubble());
	}
	//OhShitNukiWhatDidYou Do?!? volume (over 70,000mL)
	else
	{
		output("\n\nWhen your geysering cream surges past the narrow vent of your urethral slit, the squishy toy is nearly blasted out of your grip. It’s all you can do to clamp down with tingling fingers as your orgasmic release floods into the condom-like reservoir of the purple pocket pussy. Your shoulders clench together as the spunk orb fills, gaining inches with alarming rapidity. Cheeks flushed and breath coming in ragged gasps, you hold on as best you can while gallon upon gallon of hot, seething seed gushes from your trembling form. The [pc.cumColor] bounty pours from your spasming [pc.cock " + x + "] like a mythological deluge. Sinking to your [pc.ass], the thinning latex bloats and distends under the inflating swell, losing its spherical elasticity with squeaking groans of protest. The heavy contents sag against your [pc.hips] and your [pc.legOrLegs], nearly ready to bury you beneath the warm, fluid pressure of your rubber-sealed passion.");
		output("\n\nThe toy’s tip seems to be reaching its limit! You could probably pinch it off, or you could just ride it out and hope for the best!");
		//[Seal the Load] [Keep Filling It]
		processTime(13);
		pc.orgasm();
		clearMenu();
		addButton(0,"Seal It",hashtagShareTheLoad);
		addButton(1,"Keep Filling",battenTheHatches);
	}
	IncrementFlag("BUBBLE_BUDDIED");
}

//[Seal the Load]
public function hashtagShareTheLoad():void
{
	clearOutput();
	author("Adjatha");
	showName("CONTAINMENT\nBREACH");
	output("Figuring that the toy is likely to give out before your orgasm does, you clench your teeth and hold the bubble with one hand while the other rotates the base of the Bubble Buddy around your gushing spout. The neck of the reservoir twists, tightens, and seals, falling from the toy with a heavy, wet impact. A fresh gout of [pc.cumGem] [pc.cumNoun] catches your pocket pussy before you can get both hands on it again, and tears it from your grip, sending the rubbery device bouncing along the ground. No time to worry about that, however, as the warm waves of your spouting climax come hard and fast. Arcs of [pc.cumColor] spurt into the air as your [pc.cocks] leap");
	if(pc.cockTotal() == 1) output("s");
	output(" upwards with every tensing spasm.");
	output("\n\nWhen - finally - your reserves are expended and the weight of your climax has been lifted from your chest, you take stock of your surroundings. The pocket pussy lays a short distance away, spunk oozing from inside the purple sleeve. The orb you managed to tie off sags under its gorged mass, nearly the size of a small bed! The latex sheath strains, contracting and pressurizing the contents until it has shrunk to a mere 15\". It groans with the weight of its bathtub-filling burden and you resolve to be extra careful with that one. As for your surroundings... it seems the second half of your release has left the ground around you steeped in [pc.cumVisc] lakes of your [pc.cumColor] spunk. Gathering your [pc.gear] and hoisting the wobbling cum bubble you’ve made, you hope nobody slips in the mess.\n\n");
	//player’s lust resets to zero and they gain 1x Huge Cum Bubble
	processTime(8);
	pc.orgasm();
	quickLoot(new HugeCumBubble());
}

//[Keep Filling It]
public function battenTheHatches():void
{
	clearOutput();
	author("Adjatha");
	showName("GIVING ‘ER\nALL YOU’VE GOT!");
	output("Clinging to the sex toy like it’s a life raft, you toss back your head and lean backward until you’re lying on the ground. ");
	if(pc.tailCount > 0) output("Your [pc.tail] thrashes under you, frenzied by the raw, blinding organ-pleasure that leaves the rest of your body trembling and diminished. ");
	output("Weakly pumping your hands around the squelching toy, the jiggling mass of its carnal contents roll up your [pc.legs], over your [pc.hips] and even across your groin, pinning your arms with its liquid weight. The [pc.cumColor] lake within the purple latex fills with each spasming pump, slowly burying you under the heavy warmth of your gushing seed.");
	output("\n\nThe swelling condom expands to cover your [pc.chest], and you can almost imagine you’re slipping into some warm, aquatic shelter. Your [pc.skinFurScales] seems almost to be engulfed by the toy’s overwrought rubber and the fluid tide within. The pressure of your [pc.cumNoun] takes your breath away as it rolls over you like a hungry, amethyst galotian. When it sloshes over your neck and bulges obscenely against your [pc.lips], you gurgle in incoherent bliss, very nearly completely covered by your expanding release. With a full bathtub worth of [pc.cum] pinning you down, it’s all you can do to keep yourself from passing out as the blob spreads past your eyes, blinding you with its ocean of torrid [pc.cumNoun].");
	output("\n\nThe latex sheath, so thin that tension lines have spread all across its bulk, squeals in protest. Groaning, creaking pressure sends rippling waves through the too-full spunk vessel and, without further warning, it pops! Tens of gallons of [pc.cumVisc] [pc.cumNoun] erupt from the exploded bubble, painting you stem to stern in warm, [pc.cumGem] goo. Wallowing in the small lake of jizz around you, a spectator would be hard pressed not to mistake you for a [pc.cumColor] galotian! While you lay there, enjoying the slimy polish of your monumental climax, a faint flicker of concern crosses your mind: how are you going to clean up? Hopefully your gear has been waterproofed, because you’re going to be wearing your fresh coat of [pc.cumVisc] laquer until you can find a shower or a hungry rahn.");
	//player’s lust resets to zero, they gain the “Cum Soaked” status, and their libido increases by 2-5
	pc.applyCumSoaked();
	processTime(10);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*
output("\n\nGift Options");
output("\n\nGive the bubbles to galotians and rahn for special scenes and potentially increase your “relationship points” with relevant NPCs.");
output("\n\nPossibly add scenes for: Jardi, Sera’s private slut; Zo’dee, Adventurer in various places; Vaande, stripper on Tavros");
*/

//Give to Celise
//Add [Cum Bubble] option to Celise’s [Feed] menu.
// “Give the galotian a gift of sealed cum.”
public function hasACumBubble():Boolean
{
	return (pc.hasItemByClass(SmallCumBubble) || pc.hasItemByClass(MediumCumBubble) || pc.hasItemByClass(LargeCumBubble) || pc.hasItemByClass(HugeCumBubble));
}


//Tooltip Mouseover:
//Celise loves cum right from the tap, but she’d probably enjoy a stored sample too.
public function giveCeliseATreatSetup():void
{
	var choices:Array = [];
	for(var x:int = 0; x < pc.inventory.length; x++)
	{
		if(pc.inventory[x] is SmallCumBubble) choices.push(x);
		else if(pc.inventory[x] is MediumCumBubble) choices.push(x);
		else if(pc.inventory[x] is LargeCumBubble) choices.push(x);
		else if(pc.inventory[x] is HugeCumBubble) choices.push(x);
	}
	if(choices.length == 1) giveCeliseATreat(pc.inventory[choices[0]]);
	else
	{
		clearOutput();
		showCelise();
		showName("WHICH\nONE?");
		output("Which cum bubble will you give her?");
		clearMenu();
		for(x = 0; x < choices.length; x++)
		{
			if (pc.inventory[choices[x]].quantity > 0) {
				addItemButton(x, pc.inventory[choices[x]], giveCeliseATreat, pc.inventory[choices[x]]);
			}
		}
		if(flags["GIGACELISE"] != 1) addButton(14,"Back",celiseFeedBack);
		else addButton(14,"Back",gigaCeliseFeedRouter);
	}
}
public function celiseFeedBack():void
{
	clearOutput();
	showCelise();
	output("How would you like to feed her?");
	celiseFeedingRouter();
}


public function giveCeliseATreat(item:ItemSlotClass):void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	//First Time
	if(flags["BUBBLED_CELISE"] == undefined)
	{
		output("Beckoning the burbling galotian girl over, you pull out a lilac-hued latex bubble filled with your cum. <i>“Know what this is?”</i> you ask with a teasing lilt to your voice.");
		output("\n\nCelise cocks her head, eyes transfixed on the slightly yielding weight of the orb in your palm. She purses her emerald lips as you gently bounce the fluid sphere tantalizingly in front of the goo girl’s face. <i>“Is it a snack?”</i> she asks hopefully, a concerned expression of doubt passing across her bubbly face. <i>“It looks a bit like a condom, but where’s the knot?”</i>");
		output("\n\n<i>“The goods news is: you’re right! It is a snack,”</i> you assure her. <i>“The bad news is: it’s fully sealed. You’ll have to get the goods out yourself.”</i> You’re actually a little curious to see what kind of approach the ");
		if(flags["GIGACELISE"] != 1) output("bimbo-proportioned");
		else output("wiggling and impatient");
		output(" slimegal will take.");
	}
	//Repeat
	else
	{
		output("Producing another cum bubble brings a sweetly dopey grin to your galotian gal’s face. <i>“Oooo... more treats?”</i> Sloshing up to you, she tenderly takes the potent package with a solemn reverence. Holding it with both hands, she licks her lips hungrily.");
	}
	//Small Bubble
	if(item is SmallCumBubble)
	{
		output("\n\nRolling the plum-sized sack between sticky, slimy fingers, Celise seems to be enjoying the ambient heat from the preserved sample. Despite the semi-opacity of the girl’s body, the rich purple of the bubble is easily visible through her goo, even as she cups it with both hands to squish the elastic surface in her palms. She seems to be getting nearly as much fun out of playing with the gooey ball as she would actually eating it. You should probably get the girl some toys or something one of these days.");
		output("\n\nHer eyes meet yours and a sly look crosses her face. Placing a finger across the plump swell of her wanton pucker, Celise shakes her head, oozing tresses drooping across one eye seductively. <i>“Why, I just can’t figure out how to get into this yummy little eggy! I guess I’d better keep it somewhere safe, until it hatches,”</i> she purrs. Leaning backwards onto her bubble butt, she seems to lift out of the sloshing puddle of slime at her waist. The pool shrinks as she settles backward, hips and thighs forming where before there was just amorphous goo.");
		output("\n\nBefore long, the galotian has used up nearly all of her mass, producing a pair of legs that link together at the ankles. Apparently she didn’t have enough mass for feet, or maybe she just forgot about them. She turns slightly to show off her newly sculpted curves, lounging against the floor like an eye-popping model posing for a photoshoot. Spreading her knees, the slimy vixen holds your cum bubble between her fore and middle finger, arching an eye at you as she runs the latex load over her pursed lips and down the moist, dripping valley of her ");
		if(flags["GIGACELISE"] != 1) output("titanic cleavage");
		else output("modest cleavage");
		output(".");
		output("\n\nCelise draws your gift further down her body, the girl’s lush skin even more pliant than the rubber droplet she loosely clutches. The orb is lowered across her taut tummy and pauses atop the plump pussy she’s created between her wobbling legs. <i>“Mammals keep their eggs here, don’t they?”</i> she asks with a seductive murmur. She’s technically right, but... well you could correct her, but it probably doesn’t matter, so you give a noncommittal shrug. <i>“Well, I don’t have a lot of other pockets,”</i> she teases, her fingers pushing the little bubble into her puffy slit.");
		output("\n\n<i>“Ooooh,”</i> she moans, sliding her fingers in after the cum bubble. Through the galotian’s semi-transparent mass, you can easily make out the shadow of her wiggling fingers and the wobbling sphere of your latex package. Fingertips playing across her lips, Celise gasps and pushes your egg-sized gift deeper and deeper, her breasts shrinking slightly as her pussy thickens and her abdomen bulges. Caressing herself, the girl’s legs tremble with delight, ripples of bliss sending her jiggling like a gelatinous sculpture in an earthquake.");
		output("\n\n<i>“Ah! Ah! Aaaaaaah!”</i> she gasps as she pushes the bubble into where her womb would be, belly swelling as if undergoing an exceedingly rapid pregnancy. The dark shadow of the bubble is momentarily lost amid a murky, [pc.cumColor] mist. You guess that her digestive system must’ve melted a small hole in the orb, to get the cream out. Your cum spreads within Celise’s gooey frame as she reaches her climax. Her legs vibrate with her wordless bliss before losing their consistency, collapsing into her more normal puddle. With a heaving motion, her massive belly shrinks as the latex bubble slides back out of the goo girl and wobbles onto the deck of your ship.");
		output("\n\nIt seems Celise has managed to get the cum out of the bubble and filled it up with a bit of her own goo before the latex resealed itself. Pantomiming the panting gasps of a new mother, she tenderly picks up the goo-filled violet blob and cradles it atop her breasts. <i>“A sweet little baby doh’rahn,”</i> she sighs. <i>“Betcha didn’t know we could cross-breed, huh? I sure hope you’ll take responsibility,”</i> she giggles. Leave it to Celise to turn a little snack into a whole production!");
		pc.changeLust(2+rand(4));
		processTime(5);
		//[End]
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Medium Bubble
	else if(item is MediumCumBubble)
	{
		output("\n\n<i>“Nothing like some protein to start the day right,”</i> Celise remarks, though somehow you doubt the slime has ever so much as looked at a clock. Holding her mouth open, she lifts the grapefruit-sized sphere above her head. She carelessly drops the condom which and - predictably - it’s too large for her mouth. The orb smacks her across the face and sits there while her fluid frame ripples from the impact. The galotian adjusts her head vaguely in your direction, her eyes peeking out over the purple, latex blob stuck to her head. She points at her too-large meal and mumbles something from under the orb, seemingly asking for a little help.");
		output("\n\nReaching a hand out, you apply a little pressure to the back of the pliant package. With a little effort, the bubble slides past her lips and floats inside her head for a moment. With a focused effort, Celise takes a hard swallow and forces the bubble down, her throat distending from the size of the cum-ball. When it finally passes through, the orb sinks past her chest and settles where her stomach would be, giving her a slight paunch, which the goo girl pats happily.");
		output("\n\n<i>“Delicious! But, you know, they say you should get some exercise after eating, so all those calories don’t settle into your hips.”</i> By way of demonstration, she rises up slightly, creating hips as she does so, and then fattens them considerably despite the fact that your bubble is still safely bound in its rubber sheath. <i>“I bet I can think of a fun little exercise,”</i> Celise coos, your orb sinking from her belly to her abdomen and then to her pelvis. It’s pushed against the junction of her thighs and with a gooey deformation, finally settles in a tight envelope of lime green that hangs heavily from the front of her pelvis. You can pretty much see where this is going.");
		processTime(3);
		//[Don’t Play] [Futa Goo] / [Tentacle Goo]
		clearMenu();
		addButton(0,"Don’t Play",dontPlayWithYourFood,undefined);
		if(flags["GIGACELISE"] != 1)
		{
			if(pc.hasCock()) addButton(1,"Futa Goo",celiseFutaGooForYou2,undefined);
			else addDisabledButton(1,"Futa Goo","Futa Goo","You need a penis for this. Where did you get all this cum without a penis?");
		}
		else addButton(1,"Tentacle Goo",tentacleGooCeliseFeeding,undefined);
		addButton(0,"Don’t Play",dontPlayWithYourFood,undefined);
	}
	//Large Bubble
	else if(item is LargeCumBubble)
	{
		if(flags["CELISE_LARGE_BUBBED"] == undefined) 
		{
			output("\n\nSqueezing and squishing the massive, melon-sized orb, Celise lets her fingers lose some of their firmness to slide over the oddly organic latex covering. <i>“Oh! Interesting,”</i> she murmurs, her brow furrowing with a focused attention you rarely see on the bubbly galotian bimbo. Her hands flatten and spread over the lilac surface of the rubbery sack, forming a lime sheath that seems to poke and prod the condom’s surface in dozens of places at once.");
			output("\n\n<i>“Oh neat! It’s self-sealing! As long as you don’t pop it, it’ll seal up any little cuts.”</i> She seems really excited about this detail and looks up at you with a big grin. <i>“Check this out,”</i> she giggles. Reforming the slimy sheath into a pair of hands, she grabs the pliant surface of the hefty bubble on the right and left side.");
		}
		output("\n\nWith a slow twist in opposite directions, Celise starts to pinch the orb at its center, flattening it to a cylinder and then into an hourglass shape as the stretchy covering swivels in the galotian’s grip. Eventually, the center pinches tightly, your cum squeezed equally into two balloons connected by a narrow cinch of dark purple.");
		output("\n\nCelise gives another twist and the two halfs pop free! Where once she had a single cum sphere, your goo girl now has a matching pair. There’s no trace of where the bubbles were once joined; their surfaces intact and perfectly featureless. <i>“So cool! Now... what to do with these?”</i> She tilts her head and glances upward, full cheeks flushed a dark emerald.");
		output("\n\n<i>“Oh, I know,”</i> she titters. <i>“How about a boob job?”</i> Holding the two 4\" orbs in front of her ");
		if(flags["GIGACELISE"] != 1) output("FF-cup breasts");
		else output("B-cup breasts");
		output(", she raises her eyebrows to make sure you’re paying attention. Then, with a gurgling coo, she pushes the bubbles into her breasts, the permeable surface of her mammaries offering only token resistance as the cum-laden implants sink into her chest. Moaning with the pleasure of the penetration, your slutty slime rolls her hips in the squishy sludge of her goo puddle, her skin beading with slick moisture that gives the girl a well-oiled appearance.");
		output("\n\nPanting, she juts out her chest to inspect the operation. Her normal chest has grown considerably with the additions, all the way up to ");
		if(flags["GIGACELISE"] != 1) output("H-cups!");
		else output("D-cups!");
		output(" <i>“What do you think? Will people be able to tell they’re fake?”</i> she asks with a demonstrative jiggle. Her milkshake’s just as hypnotically undulating as ever, but the dark shadows of the cum bubbles in her chest are plainly visible through the galotian’s semi-transparent body.");
		processTime(4);
		pc.changeLust(5);
		IncrementFlag("CELISE_LARGE_BUBBED");
		//[Too Obvious] [Perfect]
		//Perfect option is grayed out if the player doesn’t have a penis. Mouse over text: You’ll need sex organs for this. How did you fill up the Bubble Buddy without them?
		clearMenu();
		addButton(0,"Too Obvious",tooObviousTittyCelise,undefined,"Too Obvious","That’s way too obvious. You’ve got better things to do.")
		if(pc.hasCock()) addButton(1,"Perfect",tittyFuckCelise);
		else addDisabledButton(1,"Perfect","Perfect","You’ll need sex organs for this. How did you fill up the Bubble Buddy without them?");
	}
	//Huge Bubble
	else
	{
		output("\n\nA mischievous look passes across the galotian’s face and she sets the massive orb down with a beaming smile. <i>“You know, you’re really too kind,”</i> Celise remarks as she pats the wobbling load affectionately. <i>“A hearty meal and a uniform all in one?”</i> She’s clearly baiting you, so rather than asking what she means, you simply take a seat, cross your arms under your [pc.chest], and watch the feisty slime.");
		output("\n\nLeaning down, she fondles and caresses the taut surface of the pressurized spunk bubble. Licking the latex sheath with eager delight, she presses her face against the bubble and wiggles her shoulders back and forth. Almost imperceptibly, a tiny hole opens in the rubber covering; you wouldn’t even notice the breech if it weren’t for the jet of [pc.cumColor] that appears in your goo girl’s head, thick spunk gushing down her neck and filling her belly. Strangely, even as she siphons the [pc.cumNoun] out of the bubble, it begins to fill with her green goo. Celise seems to be pouring herself into the condom!");
		output("\n\nShe squeezes her face against the sphere and it sinks against her shoulders, the goo inside it resolving into her head. Wearing the condom like a huge, sloshing helmet, she snaps off a smart salute, her head wobbling and bobbing inside the jizz-stuffed sack. She burbles something, realizes you can’t make out her words through the cum-immersed helmet, and reforms her mouth at her belly. <i>“Officer Celise, reporting for duty!”</i>");
		output("\n\nYou shake your head, holding a palm over your eyes. <i>“Celise, hasn’t anybody ever told you not to play with your food?”</i>");
		output("\n\n<i>“But Captain, I haven’t even begun to play with you yet,”</i> she returns with a giggle. Wiggling and squirming, she swallows gallon after gallon of your spunk, forcing more of herself into the violet latex as she does so. The deep emerald hue of her body softens to a pale lime green before becoming as [pc.cumColor] as if she’d come right out of your body in an orgasmic, [pc.cumVisc] spree. The galotian pours more and more of herself into the resilient rubber until, with a final, wet slurping, the last of her goo slides into the condom.");
		output("\n\nThe Bubble Buddy’s surface reseals the microscopic breach and you’re left with a lilac-colored sphere, roughly two feet across and sagging slightly under its gooey contents. The sheath tries to contract, but its galotian occupant pushes back, forcing it to expand instead. The orb distorts and deforms, hand-prints pushing from within. The hands are followed by forearms and shoulders as the bottom gains another pair of bumps that resolve into shapely legs. The squeaking, groaning latex gradually gains shape as Celise forms her body within the glossy sheath, her torso expanding and her breasts bulging outward. Finally, her head emerges from between her shoulders with a squeaking shake.");
		output("\n\nPerfectly sealed inside a latex body-condom, Celise looks more like a rahn than a galotian. The girl’s normally sloshing exterior actually has tone and definition, her sleek, rubber shell magnifying the absurdly disproportionate dimensions of her sexpot form. Unsteadily rising to her unfamiliar feet, she barely manages to stand, snapping off another salute.");
		processTime(4);
		pc.changeLust(5);
		//[Pop Her] [Fuck Her]
		clearMenu();
		if(pc.hasCock()) addButton(1,"Fuck Her",fuckCeliseAfterTooMuchStuff,undefined,"Fuck Her","Use the bubble buddy suit as a condom.");
		else addDisabledButton(1,"Fuck Her","Fuck Her","You need a penis for this.");
		addButton(0,"Pop Her",popCeliseAfterTooStuff,undefined,"Pop Her","Enough of this. Pop her!");
	}
	IncrementFlag("BUBBLED_CELISE");
	itemConsume(item);
}

//[Don’t Play]
public function dontPlayWithYourFood():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	output("Rolling your eyes, you push the makeshift teste back into the goo girl’s body. <i>“Celise, stop playing with your food,”</i> you scold. The galotian pouts, and seems about ready to try something else until the two of you hear the audible sound of her tummy grumbling. She flushes slightly and shrugs.");
	output("\n\n<i>“Okay " + pc.mf("</i>Dad<i>","</i>Mom<i>") + ", if I have to,”</i> she sulks. The shadow of your bubble disrupts as her digestive system makes quick work of the latex and begins ravenously devouring the [pc.cumVisc] [pc.cumNoun] within. As the [pc.cumColor] jizz spreads within her, your slime’s body widens, growing appreciably fatter with each passing second. <i>“I told you we should’ve had a little exercise,”</i> she remarks, mildly.");
	output("\n\nThe idea of a goo girl trying to get into shape is just too ridiculous for you to press. You leave the sassy slime to her meal with an exasperated sigh.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Futa Goo] (normal Celise)
//Req's dick
public function celiseFutaGooForYou2():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	var x:int = pc.biggestCockIndex();
	output("The green galotian taps the glistening slime of her pelvis, just above her makeshift sack and, with a wince of concentration, a slight bulge rises up from the smooth surface. The bump grows and expands into a roughly cylindrical shape. She seems a bit lost on what to do with the featureless pole, until a thought strikes her. Wordlessly, she slides over to you and pulls off your [pc.gear], taking a focused, critical look at your [pc.groin]. It’s almost surreal - being viewed as an art subject instead of as a food dispenser by the ever-hungry slime.");
	output("\n\nWith a grunt of effort, inch by inch she sculpts the wobbly shaft into a near replica of your [pc.cock " + x + "], all in emerald green. From your [pc.sheath " + x + "] all the way to your [pc.cockHead " + x + "], the galotian gal has done a remarkable job replicating the full length of your member. She wiggles her hips slightly, letting the unstead organ waver back and forth. It seems she can’t quite get the trick of making the pole hard, though given her squishy body that comes as no surprise.");
	output("\n\n<i>“Yay! Now I can be Captain Steele too,”</i> she giggles. <i>“Traveling the galaxy and bedding all the crazy aliens I run across! Look over there,”</i> she insists, holding a hand over her eyes and squinting into the distance. <i>“I think I see one of those slime monsters.”</i> The base of her puddle bubbles and a second head rises, identical to her own. The second Celise face lifts herself up to the waist, but she lacks the first’s thick curves, with barely an A-cup chest. <i>“Don’t worry, [pc.name], I’ll subdue this creature,”</i> she assures you.");
	output("\n\nThe second Celise pushes against the first hungrily and it’s all she can do to keep herself back with wet, rippling slaps. The pantomime goes back and forth, with each side gaining the upperhand only to lose it when the other exploits an opening. The clone grabs hold of the original’s breasts and begins suckling at her teats, forcing her to the ground with moist moans. It seems as if Celise has been defeated... by herself. The doppelganger looms above the would-be adventurer with lustful need, focusing wholly upon the swollen shaft protruding from her pelvis and the thick cream inside the monoball directly beneath it.");
	output("\n\nRavenously, the girl descends on her own shaft, the clone’s mouth suckling wetly as she forces the other’s inches into her maw with reckless abandon. The original clutches her breasts with both hands, squirming under the oral assault with helpless delight, her hips pumping in time with the other’s thirsty throat. Frothing bubbles of jade slime drool from the slime’s second throat even as the bubble inside her sack is internally tapped. A small line of your cum is drawn from the imitation gonad, visibly traveling up her shaft and into the false slime’s mouth.");
	output("\n\nAs the ‘pre-cum’ spurts from Celise’s borrowed cock, the clone seems to gain mass while Celise loses it. Their chests begin changing, as if playing a tug of war with her biomass. The second goo girl redoubles her efforts, drawing more and more spunk from the gradually shrinking latex orb. <i>“I don’t think I can hold out much longer,”</i> Celise moans, her face contorted in the blissful agony of holding back a massive orgasm. <i>“I’m... I’m... I’m cumming!”</i> she cries, grabbing her attacker’s head and thrusting it against her pelvis, bottoming out in her clone’s throat.");
	output("\n\nThe condom in her sack pops, the fullness of her gooey contents rushing up the slime’s shaft and into her clone’s head, showering the other girl’s belly with jetting spurts of [pc.cumColor]. The more she jizzes, the larger her clone gets and the more the original sinks into her goo puddle. As the last of the cum travels from one slime to the other, the original Celise is barely more than a cock and a head, her expression one of helpless release. She sinks entirely into the slime, leaving only the clone, with her belly full of the borrowed spunk.");
	output("\n\nShe turns her attention to you and you nearly jump when she lunges as if to get a second helping. Just before she reaches you, hands shoot up out of the goo and stop her short. The monster Celise struggles and lets out tiny roars of displeasure, but the arms grip her firmly and, with a brutal yank, drag her down into the slime pool. The goo bubbles and churns, like the surface of a troubled sea, before a single Celise rises, looking exhausted. <i>“I did it,”</i> she pants. <i>“I’ve subdued the beast. But, [pc.name], look at what she’s done to me!”</i>");
	output("\n\nYou look over your goo girl, unable to spot any differences. <i>“She’s turned me into a galotian!”</i> the goo girl wails. <i>“I’m a monster!”</i> Giving her a ");
	if(pc.isNice()) output("sighing laugh");
	else if(pc.isMischievous()) output("sympathetic word");
	else output("groan");
	output(", you pat the silly slime and assure her that you’ll take care of her, even if she is a terrifying alien beast now. She looks up at you with big, puppydog eyes and a simpering smile of innocent trust, your cum still floating around inside her.");
	//Lust increases 3-7
	processTime(10);
	pc.changeLust(3 + rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Tentacle Goo] (giga Celise)
public function tentacleGooCeliseFeeding():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	output("Celise eagerly claps her hands, sloshing over to you to help strip off your [pc.gear] and pull you into the bubbling puddle of emerald slime that seems to be spreading across the interior of your ship. With a wink, she pulls the makeshift testicle off of her pelvis and plops it in the center of her slimy sea. With the cum-filled nucleus in place, the gurgling pool begins to manifest growing protrusions. Pole-like appendages rise from the gunk around you, wavering and wobbling at first, but slowly tightening into firm - though still dripping - shafts.");
	output("\n\n<i>“Oh no, Captain Steele,”</i> Celise cries in an breathy falsetto, <i>“I accidentally lead us into a pit of slimy tentacles! Whatever will we do?”</i> Your goo girl plumps her lips to bimbo thickness and stares at you with her palms pressed helplessly against her cheeks. Apparently she doesn’t have a very high opinion of your other adventuring companions, if she assumes this is how they act.");
	if(pc.isNice()) output("\n\n<i>“Don’t worry, Celise,”</i> you assure her, adopting a gravelly, whispering tone. <i>“I’d never leave you to the lusts of such a beast. We’ll endure it together!”</i> She lets out a gleeful little squeak and practically throws herself at you as the tentacles advance menacingly.");
	else if(pc.isMischievous()) output("\n\n<i>“Why, don’t be afraid of a little tentacle pit,”</i> you respond in an equally bubbly, airheaded tone. <i>“What’s the worst they could do to us?”</i> Celise raises an eyebrow, but rolls with it. She clings to you, grinding her squishy curves against your [pc.chest] as the tentacles advance menacingly.");
	else output("\n\n<i>“Ha ha ha!”</i> you laugh with wicked relish. <i>“Foolish girl! We did not stumble into this tentacle pit by accident. I’ve trained this beast to break innocent waifs like you. Soon enough, you’ll join the others who came before you to slave in my slut mines!”</i> Celise lets out a high-pitched scream of delight and faux terror, clutching at you and weakly slapping her palms against the [pc.chest] of her cruel captor. The tentacles advance, menacingly.");

	output("\n\n One limb wraps around the small of your back, circling around to nab Celise as well, pinning the two of you together. A pair of squishy olive wigglers loop around your [pc.legOrLegs] while two more give Celise equal treatment. More tentacles than you would’ve believed the goo could manifest rise up around the two of you, sliding along your exposed [pc.skinFurScales] like writhing snakes. Tendrils dripping with jade moisture prod the cheeks of your [pc.ass] and graze across the heat of your [pc.groin]. The galotian wiggles against you, moaning lewdly as her plump, viridian pussy is teased by a pair of too-thick tentacles that seem to be wordlessly arguing over which one will take her.");
	output("\n\n<i>“Oh!”</i> your slime cries out. Pointing at the cum bubble a little distance away, she slips back into her bimbo voice. <i>“That must be the slime’s core! I’ve heard if you pop that, the whole monster bye bye!”</i>");
	if(pc.isNice()) output("\n\n<i>“Then we must make for the heart,”</i> you confirm, grimly. <i>“No matter how many tentacles rape us, we’re going to survive this. Nothing can keep me down when you’re by my side, Celise.”</i> The goo girl gives you a pleased smootch.");
	else if(pc.isMischievous()) output("\n\n<i>“Maybe! But, like, what are we supposed to do? Fuck it?”</i> Celise nods encouragingly.");
	else output("\n\n<i>“Pathetic! You’ll never reach the heart in time. It is too late to save yourself, slime! Submit!”</i> The galotian puts on an expression of defiance and wiggles valiantly against you.");

	output("\n\nUnwilling to give the slime a chance to attack the ‘core,’ the tentacles around the two of you set to work. The two at Celise’s slit apparently come to a compromise and both go in at once, stretching out the moaning slime. A slippery limb by your posterior forces itself past your pucker with ease, the pliant surface of the tendril contracting and expanding within you like the throbbing of a heartbeat.");
	if(pc.hasCock()) output(" More tentacles curl and coil around your [pc.cocks], caressing your cockflesh between emerald loops as thick as rope.");
	if(pc.hasVagina()) output(" A pair of feelers as large as the ones probing your slime girl brace themselves at the lips of [pc.oneVagina], oozing in anticipation before jamming their collective girth into your defenseless depths.");
	output("\n\n<i>“If I stretch,”</i> Celise pants, between the torso-expanding thrusts of the weighty jade pillars inside her womb, <i>“I might just be able to reach the core...”</i> The biggest, thickest tentacle among the swarm surrounding the two of you seems to take notice of her plan and lashes about with whip-like speed, driving itself into her mouth and down her throat in a moment. Her eyes go wide and her body trembles against yours with a spit-roasted climax, but she swings an arm out all the same. Her arm stretches and stretches until her hand reaches the cum bubble at the center of the pool.");
	if(pc.isNice()) output("\n\n<i>“You’ve... you’ve got it!”</i> you moan through the milking goo doing its best to smother you in pleasure. <i>“That’s my girl! Now... give it a squeeze!”</i>");
	else if(pc.isMischievous()) output("\n\n<i>“Aw, I wanted to fondle the core! And how come you get a throat-fucking? Like, SO not fair!”</i>");
	else output("\n\n<i>“What? How did you reach that? Impossible! Beast, I command you: redouble your efforts! Do not defy me!”</i>");
	output("\n\nThe tentacles inside both you and Celise being vibrating, the sticky, sloppy surface of the green ooze heating with the intensity of their motion. The galotian’s semi-translucent skin shows the tentacles in her gut pushing up even as the one in her throat sinks deeper until all three meet in her belly. The limbs inside and surrounding your body practically buzz with the organic engine driving them on, squelching with lascivious fixation. The temple of your resistance begins to crumble before the tentacle siege. Your throat catches with the overheated gasps that draw the strength from your seemingly boneless limbs bit by bit.");
	output("\n\nWith her last bit of defiance, your googirl squeezes the cum bubble as hard as she can. Its pliant surface stretches, bulges and deforms before at last popping in a [pc.cumColor] blowout! The liquid mass splits in a dozen streams, as if being vacuumed by an invisible pressure and siphoned in different directions. Each [pc.cumVisc] stream rushes through the slime pool and is channelled up the quivering lengths of the gooey tentacles, their loads rushing with accelerating haste until - in gushing spree - the tentacles discharge their creamy burdens.");
	output("\n\nCelise distends with the gooey [pc.cumNoun] of your breached cum bubble, her belly filling from above and below as the transfixing tentacles swell her curvaceous frame with gut-bloating seed. The limbs inside your body release similar streams next, your hot cum flooding back into your body with a spine tingling, slimy texture that leaves your shoulders shivering and your hips quaking.");
	if(pc.hasCock())
	{
		output(" The milking coils around your [pc.cocks]");
		if(pc.cockTotal() == 1) output(" is too skilled at its");
		else output(" are too skilled at their");
		output(" trade and fresh seed rushes from your tender loins, filling the thin gap between you and your galotian with [pc.cumVisc] [pc.cumNoun].");
	}
	if(pc.hasVagina()) output(" The tentacles inside your clenching cavity spray the thick salve of your hot jism deep into your body, the potent issue painting your vagina folds [pc.cumColor].");

	output("\n\nA few weak spurts of jizz rain down on the two of you from the encircling tentacles as they slowly lose their firmness, gradually sinking into the puddle until you and Celise are left to yourselves once more. The slimy girl licks a stray glob of cum from your cheek and plants a gooey kiss on your forehead. <i>“Never underestimate us galotians,”</i> she murmurs, cuddling you in a big, wet hug that incidentally cleans the rest of the cum from you hungrily. You give the girl a peck in return and gradually pry yourself from her clinging mass. You kind of wonder how many of these little pantomimes she’s been acting out when you’re off the ship.");
	//reset lust to 0, remove all ‘fluid filled’ statuses, clean character as per shower
	processTime(15);
	pc.orgasm();
	pc.shower();
	pc.removeStatusEffect("Anally-Filled");
	pc.removeStatusEffect("Vaginally-Filled");
	pc.removeStatusEffect("Orally-Filled");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Too Obvious]
public function tooObviousTittyCelise():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	output("You let the inflated girl know that her additions aren’t going to fool anybody. Folding her arms under her bolstered udders, Celise leans backwards, a pout on her cute face. <i>“Well goo on you,”</i> she clucks. <i>“Captain Killjoy, you’re needed on the bridge,”</i> she sniffs as she turns away. The latex bubbles in her chest dissolve, releasing their [pc.cumGem] contents into the galotian’s chest, coloring her tits [pc.cumColor]. Tilting her head over her shoulder she flashes a mercurial grin. It seems as long as she gets a meal, there’s just about nothing you can do to discourage that girl!");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Perfect]
public function tittyFuckCelise():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	output("Forming your forefinger and thumb into an “O” of approval, you give her an encouraging nod. <i>“Ha hah, you’re terrible,”</i> she laughs with a dismissive wave. <i>“Don’t go encouraging me or I’ll just turn into a big ole titty monster!”</i> Holding her hands, palms-out she curls her squishy digits into a rough approximation of claws and leans forward. <i>“Grr! Rar! Scary boob-beast wants cum!”</i>");
	//tentacles:
	if(flags["GIGACELISE"] == 1) output(" The gelatinous pseudopods wiggling from her viscous base loosely encircle the two of you, forming a loose trellis of phallic affection.");
	output(" Eyeing her rubber-amplified chest, you shrug out of your [pc.gear] and prepare to subdue this terrible threat before the galaxy succumbs to her gooey hunger.");

	output("\n\n<i>“Yay!”</i> she cheers, momentarily breaking character. Wiggling her pert nipples with a ");
	if(flags["GIGACELISE"] != 1) output("tidal heave,");
	else output("swelling sashay,");
	output(" Celise looms once more, the moist warmth of her sticky slime mere inches from your [pc.skinFurScales]. <i>“How will you ever defeat the titty monster,”</i> she gloats, arching an eyebrow and smiling with suggestive suspense.");

	output("\n\n<i>“Well,”</i> you respond slowly, <i>“I have an idea where I might be able to find a weak point or two.”</i> You grab her expanded breasts with both hands, their pliant surface firmer than usual thanks to the cum-implants. She moans and you rotate your grip, fondling the galotian’s augmented breasts with wickedly relentless caresses. You pinch, squeeze, tug, and rub her substantial rack, the goo girl shrinking bit by bit into her puddle, diminished by your massaging assault.");
	output("\n\n<i>“Oh no, what a galaxy...”</i> she wails, bliss adding a heated gurgle to her moans. <i>“To think a simple " + pc.mf("boy","girl") + " like you could destroy my beautiful horniness!”</i> She leans into you, her curvaceous frame suckling at your [pc.chest], her head resting against your shoulder.");
	if(flags["GIGACELISE"] == 1) output(" The slimy pseudopods close in, amorous wigglers coiling around your [pc.legOrLegs] and [pc.hips].");
	output(" Celise slides a hand across your shoulder and down your back as she shifts her hips against your pelvis.");

	if(pc.hasVagina() && !pc.hasCock()) output("\n\n<i>“Oh my, you seem to have left your weapon at home. No fear, you’ll conquer that goo girl menace yet,”</i> Celise teases, her hand cupping the swell of your mons. A slight firmness presses into your [pc.vagina], as your galotian feeds a thick rod of semi-firm slime into your depths. A shuddering sigh escapes your lips and your fingers tighten against the pliant peaks of her augmented chest. Celise pulls her hand away and where it had been, a gooey shaft now remains. Celise has left a double-sided dildo halfway inside you, made of her own green goo! No telling how long its integrity will hold, so you’d best make use of it while you can.");
	output("\n\nThe emerald girl pressing against you glances down at your [pc.groin] with a delighted eagerness. <i>“Oh no! It’s the neutronic lance! My one weakness! I can feel its gravity pulling me in,”</i> she wails, squishing herself against you so tightly that your hands sink into her breasts and end up grabbing the cum bubble implants floating within them. Experimentally, you give the rubbery orbs a squeeze. Celise lets out a high pitched shriek of delight, her body clenching down against you with an unfamiliar tightness.");
	output("\n\n<i>“O-ooh! Sweet syrup, that was awesome!”</i> She reports back, her eyes wide and her mouth not quite able to choose between a huge smile and an ‘O’ of shock. Her dark jade irises twinkle as she wraps her arms around the back of your neck, her abdomen slurping up the girth of your ‘star lance’ or whatever she was calling it. The heat of her body transmits all the way through your length and right into your spine, sending sharp strokes of tingling impatience through your nerves. <i>“Do it again,”</i> she begs with a little head bob that pokes her little green nose against yours.");
	output("\n\nYou give the girl’s orbs another squeeze and her body squeezes in sympathy. ");
	if(pc.hasVagina() && !pc.hasCock()) output("The gooey dildo inside her is squished, making the end inside you inflate with a vibrating thickness that hugs every inner fold. ");
	else output("The normally gelatinous interior of the goo girl manages a taut density that you didn’t think she was capable of. ");
	//if tentacle Celise:
	if(flags["GIGACELISE"] == 1) output("Wriggling helplessly against your [pc.skinFurScales], Celise’s tentacles are rendered just as defenseless as the galotian herself. They feebly slap against your back with moist pats, but it seems you truly have found the titty monster’s weak point!");
	output(" Caressing your own cum bubbles harder and harder, your slimy partner is obliged to hug herself to you for fear of sinking into her puddle in shapeless ecstasy. With her body transmitting every fondling grope directly to your crotch, it’s almost like you’re masturbating by proxy - albeit far more pleasurably than any hand could manage!");

	output("\n\nClutching the latex balloons with tightening force, you give the slime such an embrace that the puddle at her feet momentarily reshapes itself into a perfect sphere. Her interior is so tight and her skin so firm that you’d almost swear the galotian just orgasmed herself into a rahn. Her body vibrates with the intensity of your grip and your own climax follows hers swiftly, [pc.cumNoun] filling her lower body with [pc.cumColor]. You shudder and pump into her with short, rapid strokes. The pleasure is so great that you end up squeezing the girl’s bubbles too hard, their rubber sheaths rupturing under the pressure. Fresh, [pc.cumGem] jizz floods her chest, a delicious feast of [pc.cumNoun] filling her top to bottom.");
	output("\n\nCelise sags, her normal, squishiness returning. <i>“Ha ha woah! I think I just understood what ‘getting a hard-on’ means! If you beat up all the monsters like that, no wonder everything tries to jump your bones!”</i> Celise plants a gooey kiss on your cheek and lets herself sink down into a [pc.cumColor] puddle as she digests her rich meal. The top of her head peaks out from the amorphous blob and she winks at you with burbling glee.");
	output("\n\nNormally, you’d want to wash yourself up after such a sticky encounter, but Celise has left you cleaner than when you came aboard the ship!");
	if(pc.hasVagina() && !pc.hasCock()) output(" Sadly, she seems to have taken the gooey double-sided dildo with her. You should mention that idea to R&D one of these days.");
	output(" You climb back into your [pc.gear] and try to remember what you were doing before defeating the galotian invasion.");
	//reset lust to 0, remove all ‘fluid filled’ statuses, clean character as per shower
	processTime(15);
	pc.orgasm();
	pc.shower();
	pc.removeStatusEffect("Anally-Filled");
	pc.removeStatusEffect("Vaginally-Filled");
	pc.removeStatusEffect("Orally-Filled");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Pop Her]
public function popCeliseAfterTooStuff():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	output("The silly slime has had her fun. Reaching forward, you grab the slight rise of her gel-like teats pinching and twisting each. The galotian lets out a muffled moan from inside her glistening suit, sinking to her knees. Without letting up, you continue your assault, the taut latex letting out a dangerous squeak as it contorts around your swirling grasp. Celise bucks her hips, thrusting her globular breasts against your hands as she wiggles inside her purple casing.");
	output("\n\nYou twist relentlessly, the material growing thinner and thinner until, with a loud pop, the condom breaks, spilling galotian goo all over the floor. The blob of slime gurgles and burbles amorphously for a moment before Celise regains her composure and reforms her upper body with wincing tenderness. <i>“If that’s how you treat all your officers,”</i> she remarks, massaging her flushed nipples, <i>“no wonder you’ve got such a small crew!”</i>");
	output("\n\nYour slime girl sticks out her tongue before lunging forward to grab you in a gooey hug.");
	processTime(3);
	pc.applyCumSoaked();
	//[End]
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Fuck Her]
//Dick req
public function fuckCeliseAfterTooMuchStuff():void
{
	clearOutput();
	showCelise();
	author("Adjatha");
	var x:int = pc.biggestCockIndex();
	output("Grabbing the rahn-shaped galotian by her slim wrists, you step forward, holding your body tight against hers. The warm latex of her suit distorts a bit under your firm pressure, but retains the bulk of its shape. Celise seems a bit lost, unable to simply engulf your body with hers, so she tentatively wraps her arms around your shoulders. The normally over-affectionate slime seems almost shy in her uncertain movements, trying to adjust to her unfamiliar surface tension.\n\n");
	if(!pc.isNude()) output("With one arm around the slime’s impossibly narrow waist, you pull down your [pc.lowerGarments] to expose your [pc.groin] to the slick surface of the rubber-bound goo girl. ");
	output("Appreciatively grinding her hips against your girth, Celise widens her eyes with excited delight - as if you hadn’t just fed her the ponderous contents of the very condom she’s now wearing! Some goos just never get enough, you suppose with an idle sigh as her mitten-like hands wrap around your [pc.cock " + x + "] and begin to stroke gingerly.");
	output("\n\nDespite her enthusiasm, she only gives a few pumps before guiding your length to the puffy lips between her thick thighs. Pushing your [pc.cockHead " + x + "] against the thin rubber film, you find that this cleft, at least, is still quite soft. Inch by inch, you push into her, the latex sheath wrapping around your member as her clenching depths swallow your shaft. She trembles against you, the rippling contractions of her slimy form only slightly muted by her rubber wrapping. With both hands on her literal bubble-butt, you begin thrusting back and forth, careful not to pop her covering with a too-sudden impact.");
	output("\n\nCelise runs her glossy, squeaking palms across your [pc.chest], thumbs teasing your [pc.nipples] as her body bounces against yours. Massive, jiggling breasts plop ponderously against you with latex creaks of protest, but she lets out only muffled moans of insulated glee. Your [pc.cock " + x + "] throbs within her, visible as a shadow through the lilac covering and the galotian’s trembling volume. The girl’s tightness resolves into squeezing, suckling bands of pressure that milk your cock even through the stretchy covering of her sealed attire.");
	output("\n\nThe goo girl seems to be getting off from the pressure of her wrapping as much as from the thick strokes of your [pc.cock " + x + "], and her rapid, clenching orgasms send a rippling cascade across your tender flesh. With groaning thrusts, you try to hold back a bit longer, but the bimbo-proportioned cum-addict clinging desperately to you is too good at getting what she wants. With wincing relief, you release the sweet heat of your [pc.cumVisc] seed inside the latex-clad galotian. The shadow of your cock bulges as the tip bloats with the pressure of your load. The bubble grows as each spine-tingling jet surges from your shaft");
	if(pc.cockTotal() > 1)
	{
		//if multi-dick: 
		output(" while your other cock");
		if(pc.cockTotal() > 2) output("s spray their");
		else output(" sprays its");
		output(" spunk across the exterior of the girl’s glossy latex sheath");
	}
	output(".");
	output("\n\nBetween the form-fitting suit and the bulging intrusion of your [pc.cock " + x + "], however, you’ve pushed the absurdly elastic rubber to its limits. With the added weight of your [pc.cumNoun], the latex can take no more. With an echoing snap, the girl-shaped bubble pops! The force of the rupture knocks you onto your [pc.ass], Celise following you down with a laugh and sloshing all over you in a gooey spree. The suckling pressure on your cock spreads to her whole body as she loses cohesion and becomes little more than an amorphous, cum-thirsty blob.");
	output("\n\nWhen she’s finally sated and you’re completely emptied, she resculpts herself into a gooey approximation of her normal shape. <i>“I don’t know how the rahn do it,”</i> she marvels with dreamy sighs. <i>“I was only in that thing for a little while, but I couldn’t stop climaxing! Sorry captain, I don’t think I’ll be able to wear your uniform for very long, or you’ll have a sex-crazed goo girl on your hands!”</i> You contemplate rising to this bait, but decide to just let it pass, running your hands over the sex-crazed goo girl all the same.");
	processTime(15);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Give to Flahne
//Add “Cum Bubble” option to Flahne’s dialog menu once you’re on friendly terms with her.
// “Give the rahn a gift of sealed cum.”

public function giveFlahneATreatSetup():void
{
	var choices:Array = [];
	for(var x:int = 0; x < pc.inventory.length; x++)
	{
		if(pc.inventory[x] is SmallCumBubble) choices.push(x);
		else if(pc.inventory[x] is MediumCumBubble) choices.push(x);
		else if(pc.inventory[x] is LargeCumBubble) choices.push(x);
		else if(pc.inventory[x] is HugeCumBubble) choices.push(x);
	}
	if(choices.length == 1) rahnCumBubbleGift(pc.inventory[choices[0]]);
	else
	{
		clearOutput();
		showFlahne();
		showName("WHICH\nONE?");
		output("Which cum bubble will you give her?");
		clearMenu();
		for(x = 0; x < choices.length; x++)
		{
			if (pc.inventory[choices[x]].quantity > 0) {
				addItemButton(x, pc.inventory[choices[x]], rahnCumBubbleGift, pc.inventory[choices[x]]);
			}
		}
		//addButton(14,"Back",meetingFlahne);
		addButton(14, "Back", mainGameMenu);
	}
}

public function rahnCumBubbleGift(item:ItemSlotClass):void
{
	clearOutput();
	showFlahne();
	author("Adjatha");
	//First Time
	if(flags["FLAHNE_BUBBLED"] == undefined)
	{
		output("Stepping up to the secretary’s well-organized desk, you take a quick glance around the lobby before pulling out a cum bubble. <i>“Oh!”</i> Flahne cries out in delight, absent-mindedly dropping the lollipop she was sucking on. <i>“[pc.name], did you get a Bubble Buddy? That’s awesome! Don’t get me wrong, I love sweets, but nothing beats a mid-day pick-me-up.”</i>");
		output("\n\nThe amber-hued gel girl gratefully takes the bubble from you and hoists it next to her head. Rooting through her purse, she produces a small black disk, about the size of her palm. She lifts it up in front of her, squeezes the circular device, and flashes a saucy grin. Noticing your confusion, Flahne shrugs with mild embarrassment. <i>“Oh, that was a CaptchaLens. Takes photos and uploads them to the extranet. Normally, I’m not one of those girls who takes photos of every little thing she eats, but it’s kinda fun to take a picture with these cum bubbles.”</i>");
		output("\n\n<i>“Plus,”</i> she adds with a little laugh, <i>“Tamani Corp hosts the pictures on their corporate site as a promotional incentive. I could be the next face of the Bubble Buddy!”</i> You try to picture the sweet little customs agent as an extranet starlet, but just can’t make the role fit that cute expression.");
	}
	//Repeat
	else
	{
		output("<i>“Ooooh,”</i> Flahne coos as you present her with another cum bubble. <i>“You’d make a good go-for, [pc.name]. Ever thought of giving up the jet-setting life of a corporate adventurer and settle down for some public service?”</i> she teases. Producing her CaptchaLens, she beckons you to come around to her side of the desk. The two of you pose next to the jizz-filled orb as the honey-hued rahn girl snaps a photo for the extranet.");
	}
	//Small Bubble
	if(item is SmallCumBubble)
	{
		output("\n\nFlahne drops the grape-sized condom discretely in the breast pocket of her stretched blouse. <i>“Do you mind keeping an eye out for visitors, [pc.name]? I just have to grab something from the break room.”</i> Rising to her high-heeled feet, the gel gal sashays to a small, inconspicuous door and steps inside. When she returns, the buxom beauty is carefully balancing a yellow and black striped mug filled with a dark amber liquid, several ice cubes, and a tiny slice of Mhen’gan Mango at the top. She places the sweet tea on a metal coaster and you can practically see all the dissolved sugar making granular eddies in the candied concoction.");
		output("\n\nSettling at her desk once more, the loo’rahn retrieves the squishy package and drops it into her drink with a soft ‘plunk!’ Arching an eyebrow at you, she cradles the mug between both hands and gently rocks it in circles, the ice cubes clinking softly. She’s about to speak, when the landing port door opens and a rather dour, travel-worn woman walks in. Flahne motions for you to take a seat to the side while she helps the newcomer, her bubble tea momentarily forgotten.");
		output("\n\nFlahne is the very model of positive, helpful efficiency as she reviews the visitor’s documents while making polite small talk. Every so often, she grabs her mug and dips her long, thin tongue into it, slurping up sweet tea through the straw-like appendage. Just as she’s putting the finishing touches on the last few papers, she takes a deep pull from her tea and her tongue bulges outward, as a grape-sized shadow is sucked up and into her mouth. She flushes and swallows, but the guest apparently hasn’t noticed. A small, spherical balloon bobs inside the girl’s semi-translucent gel, floating gradually down her neck. She squirms, trying not to digest the spunk in front of her guest.");
		output("\n\n<i>“Excuse me, but are you alright?,”</i> the woman asks, her tone rather annoyed.");
		output("\n\n<i>“Hrm?”</i> Flahne asks, suddenly panicking. She hiccups and the cum sphere jumps up from her neck to the very center of her head, like the nucleus of a honey-colored amoeba. <i>“Oh, um, yes. Everything’s quite well thank you.”</i>");
		output("\n\n<i>“It’s just that you’ve asked me the same question three times now,”</i> she prompts, a little aggrieved.");
		output("\n\n<i>“Oh, ha ha hah,”</i> she nervously titters. <i>“Just something on my mind, I guess. I’m sorry about that. Let’s get you all finished up- oh.”</i> She stops mid-sentence as the bubble in her body ruptures, her expression coloring slightly as your [pc.cumColor] spunk diffuses behind her plump cheeks. You can practically see her legs rubbing together under the desk as your cum fills her head and floods the gel girl’s senses. With gasping, lustful starts and stops, Flahne manages to finish processing the other woman’s paperwork and sends her on her way.");
		output("\n\nYou rise and wave at the panting girl as you step away. Even from this distance, the smell of her honeyed nectar is unmistakable. The saucy rahn girl seems to have orgasmed just from eating your jizz bubble. You make a mental note to bring her more later.");
		pc.changeLust(5+rand(3));
		processTime(12);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Medium Bubble
	else if(item is MediumCumBubble)
	{
		output("\n\nFlahne sets the grapefruit-sized condom on her desk carefully as she rises from her seat. <i>“Do you mind keeping an eye out for visitors, [pc.name]? I just have to grab something from the break room.”</i> Her high-heeled pumps clicking against the floor, the gel gal sashays to a small, inconspicuous door and steps inside. When she returns, the buxom beauty is carefully balancing a yellow and black striped mug filled with a dark amber liquid, several ice cubes, and a tiny slice of Mhen’gan Mango at the top. She places the sweet tea on a metal coaster and you can practically see all the dissolved sugar making granular eddies in the candied concoction.");
		output("\n\nSettling at her desk once more, the loo’rahn turns her attention to the squishy package. Humming to herself, she grabs and twists bits of the rubbery sheath. After a few turns, the latex thins and snaps, resealing itself on both ends. She sets the small bubble down and repeats the process again and again, turning the fist-sized balloon into a small pile of grape-sized mini-condom balls. One by one, she drops them into her drink while arching an eyebrow at you. <i>“Surely you didn’t think I was just going to shove the whole thing into my mouth,”</i> she teases.");
		output("\n\nCradling the mug between both hands and gently rocking it in circles, she glances around her desk. <i>“Now where did I put that straw,”</i> she ponders. <i>“Oh, that’s right!”</i> Sticking her tongue out at you, the long, flexible member shrinks and stiffens, turning to a cylindrical tube just wide enough to allow the spunk sacks through. Lifting her drink, she winds her gelatinous tongue down into the bubble-filled tea with relish. Flahne slurps up the sweet drink slowly, making sure you can see each and every cum balloon tumbling up her straw-tongue and plop into her cheeks.");
		output("\n\nJust as she’s finished half the seed-spiked libation, the landing port door opens and a couple of travelers step in. Flahne gulps reflexively, her tongue spooling back into her sweet-stuffed mouth as she subtly motions for you to take a seat while she helps the newcomers. Setting the tea down, she smooths her blouse and folds her hands in the perfect picture of professionalism. She seems to have forgotten the cum bubbles floating in the gel of her mouth and throat, still visible as darkened shadows through her semi-translucent, honey-yellow skin.");
		output("\n\nThe visitors appear to be a mixed pair of trouble makers. A dusky skinned dzaan alpha pushes her way to the front, her battle-scarred suit etched with any number of scorch marks. Curiously, the caramel-skinned woman has removed the crotch plate of her armor, allowing her heavy, 11” cock to droop against her low-hanging, cum-fattened balls. Doesn’t seem like she’s had much in the way of relief recently. She catches you staring and meets your gaze with an imposing glare as if to invite you to say something about it. Flahne distracts the amazonian traveler with a perky greeting. <i>“Hello! Welcome to Mhen’ga! How may I help you?”</i>");
		output("\n\nThe dzaan flashes a tablet with some pre-filled documentation. Apparently this isn’t her first time to the planet. She leans forward on the desk, speaking in a low, throaty voice to the rahn girl, her hips swaying just enough to let her thick member dangle against the edge of the desk. You can smell Flahne’s nectar-sweet scent all the way over here as the full force of the alpha’s commanding temperament buffets the gel girl’s easily tempted resolve.");
		output("\n\nShe swallows hard and a handful of the bubbles floating inside her head pop, releasing their creamy contents. Your semen seems to have an almost calming effect, taking the edge off her ever-sharp hunger. With a politely regretful smile, Flahne explains that she can’t possibly take a break just now, so there’s no time to pop off to the back to “check for invasive biological matter” as the dzaan suggested. The alpha’s cock begins drooling scented pre-cum and Flahn blushes slightly, more of your cum bubbles bursting to help keep her steady in the face of such temptation.");
		output("\n\nApparently offended by the rebuff and trying to save face with a suitably intrusive gesture, the imposing woman snatches the secretary’s iced tea from the desk. Scowling she takes a deep swig from it, her eyes trained on the gooey receptionist. You can see the tiny purple bubbles rolling into the hermaphrodite’s mouth, one by one. She’s so focused on the golden girl sitting behind the desk that the dzaan takes no notice of the squishy balls, ice cubes, or melon slice, her throat bobbing as she swallows each in turn. Flahne darts an eye over to you, her lips tightly pressed together so she doesn’t accidentally laugh. Once the drink has been fully drained, the rude visitor slams the bee-striped mug in front of nervously smiling rahn. Turning on her heel, she heads for the door to Esbeth, her stomach gurgling ominously.");
		output("\n\nThe other traveler is nearly as rude as the first. A crimson-skinned man with curling horns and a bulbous, scorpion-like tail makes loud, lewd insinuations about what kind of place a goo girl should have, his stinger dancing dangerously around the secretary while she pushes a stack of paperwork towards him. You’re about ready to step up and deal with the brute when Flahne’s hand shoots up and snatches the barbed tail tip in one amorphous hand, dragging it - and its owner - closer to her with surprising strength.");
		output("\n\n<i>“Sir,”</i> she calmly explains with a saccharine smile, <i>“I am a loo’rahn, not a ‘goo girl.’ And, frankly, I eat stronger stuff than your venomous little prick for breakfast. If you’d be so kind as to fill out those papers, we can get you on your way in no time.”</i> Just to prove her point, the hand clutching his stinger milks a few drops of poison from the barb only to have it dissolve in her hand harmlessly. She releases the cowed man and sends him back to the landing bay with a back-breaking stack of paperwork.");
		output("\n\nWhen the lobby is clear once more, you step over to Flahne, the two of you wearing a matching pair of grins. The gel girl shivers, ripples running through her body as the last of your bubbles dissolves inside her. <i>“Whew,”</i> she pants. <i>“I don’t usually have to put my foot down, but every so often, we get jerks who just want to throw their weight around. Thanks again for the snack, [pc.name]! Dealing with those rascals is a lot easier with something more nourishing than lollipops in me.”</i>");
		output("\n\nYou set your hand on her shoulder and give the sweet girl an encouraging squeeze.");
		processTime(20);
		pc.changeLust(3);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Large Bubble
	else if(item is LargeCumBubble)
	{
		output("\n\nAs Flahne is about to put away the camera, you stop her with a sly smile. <i>“Hey, why don’t you let me use that CaptchaLens and take a few... private pictures with the bubble?”</i>");
		output("\n\nThe honey-hued rahn raises an eyebrow and purses her lips as she considers your proposal. <i>“Well, I could take a lunch break,”</i> she offers. <i>“But, if they’re going to be private, just send them to yourself, okay?”</i> She tweaks the little disk and hands it off to you. <i>“Squeeze for a picture, or press and hold for video,”</i> she explains, rising to lock the lobby doors for a little privacy.");
		output("\n\nYou look over the coin-sized device. It’s a simple squeeze-and-shoot interface, set to automatically upload the pictures right to your Extranet Messenger. It seems you could adjust the destination, easily enough. It’s got an option to send the pictures to a GalLink Fuckmeet group, as well as to the Tamani Corp marketing division. If you sent it to the GalLink, some of Flahne’s other friends could enjoy the show, but if you sent it to Tamani Corp, the whole extranet could get an eyeful.");
		//[Private] [GalLink] [Extranet]
		processTime(3);
		pc.changeLust(3);
		clearMenu();
		addButton(0,"Private",flahneCumPhotoshoot,0);
		addButton(1,"GalLink",flahneCumPhotoshoot,1);
		addButton(2,"Extranet",flahneCumPhotoshoot,2);
	}
	//Huge Bubble
	//(unavailable for huge players who can’t fit under a desk)
	else
	{
		output("\n\n<i>“Gosh, did you kidnap a galotian in this thing or what?”</i> Flahne laughs, practically drooling at the sight of your back-breaking load. She affectionately caresses the wobbling, purple blob with both hands, but conscientiously stows it under her desk and out of public sight. <i>“Sorry, [pc.name]. I’d love to give you a show, but I’m not sure how I’m supposed to eat this without making a huge mess!”</i>");
		output("\n\nWith a mild shrug, you let the honey-colored secretary know that you’ve got the perfect method for her to enjoy the treat and still attend to her job at the same time. With a reassuring squeeze on her shoulder, you pull out her chair and slip under her desk yourself, next to the 15\" beachball of latex-sealed jizz. With a little giggle, the rahn girl seems keen to find out what you’ve got planned. She takes her seat, wiggling her plump booty comfortably in the rolling task chair. You grab her ankles and pull the gel girl’s lap flush with the desk");
		if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output(", her wobbling ovipositor bouncing under her skirt in anticipation");
		output(".");
		output("\n\n<i>“Whatever you’ve got planned,”</i> she whispers, <i>“try to keep it subtle! I haven’t locked the doors, so we’ll be getting lobby traffic.”</i> You silently loop a hand around her ankle, drawing your palm up and down the receptionist’s smooth, pliant leg. Her knees tremble and she clears her throat as footsteps approach the desk. <i>“Hello, how can I help you today,”</i> she asks, her voice muffled by the constraining desk around you.");
		output("\n\nNow that she’s distracted, you set to work. Pinching the torso-sized cum balloon, you pull a palm-sized protrusion from the rubbery surface, twisting it in your palm until it is connected to the main mass by only a thin, taut string of wound latex. With a gentle tug, you pull the waterballoon sized sphere free, the Bubble Buddy’s almost organic sheath sealing both sides shut without spilling so much as a drop. You grab and twist off another and another until you’ve reduced the massive blob into a hefty cache of variously sized cum balls.");
		output("\n\nCarefully, you place your hands on her knees and spread her legs apart. Flahne’s voice raises an octave, but she maintains her cover. <i>“Yes, of course we allow imports, sir. Within reason, of course. Please consult the list on the third page there,”</i> she indicates in a saccharine-sweet tone. She starts backing her chair up to see what you’re doing under there, but you wrap an arm around the back of her knees and keep her firmly in place. The curvaceous girl’s open skirt shadows her loins slightly, but the light streaming down her semi-translucent body gives her puffy pussy a golden glow");
		if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output(" even with her sixteen inch ovi-cock bobbing above it");
		output(".");
		output("\n\nGrabbing one of the smallest bubbles, you spread her legs as widely as the interior of the desk’s walls allow and slowly, teasingly push the squishy orb against her nectar-drooling slit. <i>“I’m afraid I can’t speak for Xen-OH!”</i> she cries out a bit as you push the plum-sized balloon into her pussy, a pair of fingers sliding in after it to make sure the sphere’s really up in there. <i>“...Gen,”</i> she finishes, pushing forward. <i>“You will have to, um, speak with a... a... representative at their, uh, local office. Sir.”</i>");
		output("\n\nFootsteps walk away from the desk and the door opens, giving Flahne a moment to recover. <i>“What are you doing down there? What did you put in me? Where’d you even get that?”</i> She whispers breathlessly, squirming in her seat and adjusting to the addition of a warm, rubbery bubble inside her pussy. Rather than explain, you keep her lap hidden under her workspace, and stuff another bubble into her. The secretary moans softly, reaching a hand down to stroke ");
		if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output("her girthy rahn-shaft");
		else output("her amber clit");
		output(" through the sheer fabric of her skirt. You lightly slap the hand away and stuff another two spheres into her quivering quim.");
		output("\n\n<i>“H-how many of those things do you have down there?”</i> she gasps as a door opens and she straightens up again. <i>“H- hello, how may I help you today?”</i> Between her legs, you’ve just about run out of the smaller bubbles, leaving only the big boys. Moreover, you’ve already got a good dozen little ones in her and the rahn’s pussy is looking pretty packed. For most other races, this would be a problem, but the rahn are about the second stretchiest species in the galaxy. Time to see just how big you can make that womb.");
		processTime(15);
		pc.changeLust(10+rand(10));
		clearMenu();
		addButton(0,"Next",flahneHugeBubbleStuffing2);
	}
	IncrementFlag("FLAHNE_BUBBLED");
	itemConsume(item);
}

//[All options]
public function flahneCumPhotoshoot(arg:int):void
{
	clearOutput();
	showFlahne();
	author("Adjatha");
	output("When the busty, amber secretary returns, you note that she’s undone a few more buttons than usual, giving you an exceedingly deep view into the sweet valley of her massive breasts. Her long, elfin ears twitch as she slides behind her desk, hands flat and tense as she leans forward to flash a candied smile. <i>“You know, it’s not everybody who’d make a big, yummy meal like this and deliver it to a girl at work. If you’re not careful, somebody’s gonna snatch you up, one of these days.”</i>");
	output("\n\nYou flash a grin and snap a picture of the dizzying depths of the rahn’s cleavage. Her glossy, perpetually moist skin glistens as she toys with the middle button of her blouse- the only thing keeping her jiggling bosom from complete exposure. She runs her fingers across the 7\", slightly sagging latex of your filled condom and you note a slight flush of reddish orange bloom on her cheeks. Your camera clicks as you capture the burgeoning thirst overtaking the receptionist, her yielding skin drinking in the heat of your sealed seed.");
	output("\n\nCarefully, delicately, she lifts the purple package in both hands. It is easily as large as her head, even with the squishy bun of her mousy hair-style. Turning it this way and that, Flahne’s long, sinuous tongue slowly licks the swell of her lips. With sweetened saliva dripping from her tendril-like organ, she drags her greedy tongue across the rubbery surface of the bubble, as if seeking some breach to exploit. You record a small clip of her amorous, tasting touches, noting that her building hunger has inflated her lips from a plump pucker to a whorish, pillowy portal. A trickle of drool leaks down the side of her mouth and dribbles from her chin onto the sleek, shiny gloss of her gelatinous curves.");
	output("\n\nFlahne presses the pliant orb against her face, moaning at the squish of its liquid cream. She lightly nibbles the semi-firm surface, sucking in small portions of the violet blob only to let them slide back out, covered in her saccharine slaver. She wiggles and squirms, dropping a hand down between her legs. Slouching in her chair, she then lets the squishy balloon drop on top of her breasts, lightly gripping it between her lips as both hands writhe under the elastic of her short, black skirt.");
	output("\n\nA few more clicks capture the girl’s cum-hungry frantic fingering. You step forward to help pose her without interrupting her gasping masturbation. You try to pull the cum bubble away, but she’s reluctant to let it go. The latex stretches between your hand and her mouth until the rubber sheath is so thin that the [pc.cumColor] of your [pc.cumNoun] is visible through the purple covering. You wiggle it back and forth, but Flahne just moans and suckles at the warm bubble with such bliss that you snap another picture of the spunk-starved woman.");
	output("\n\nYou finally wrest it away from her and reposition the cum bubble on top of her head. The latex seems a bit stretched, however, because it immediately begins to flatten and droop over the perky girl’s face, covering one violet eye. Under the desk, her hands speed up, the fragrance of her nectar filling the room with each passing second. Her tongue loops out from between her wanton lips and begins bathing the spunk-heavy package once more.");
	output("\n\nHer head half covered by the jizz-filled balloon, you click another picture and reach out for the sole, straining button of her overfilled top. Squeezing for a video capture, you free the fabric of her blouse with a twist and let it fly aside as the entirety of Flahne’s magnificent G-cups bounce into view. Huge, wobbling orbs with caramel peaks glisten with the dripping moisture of her dextrous tongue and watering mouth. Panting, she snakes her tongue down to encircle one of her breasts, teasing and pinching the nipple with her oral appendage.");
	output("\n\nSlowly, gradually, the hefty condom slides down her face and settles in the vale of her colossal chest. Flahne pulls a hand up, fingers sticky with the dripping web of her honey-thick femme-cum, and strokes the violet sack with her oozing lubrication before pushing it deep in the nestling depths of her cleavage. Using her tongue on one breast and a hand on the other, she begins pumping her curves around the liquid excess of your spunk balloon. You grab a few pictures of the gel girl’s tit-fucking show but switch to a video when she grows more forceful. The pressure on your bubble is so intense that it bulges up with every pump, the rubber growing thinner and thinner with each squelching squeeze.");
	output("\n\nA fresh wave of sweet nectar splashes from between her legs, the oozing goo dripping down her chair as Flahne bounces your condom between her tits with complete disregard for its structural integrity. You click a few more pictures and she seems to notice at last that you’re still photographing her. She winks and holds up her hand to wave at the camera just as the pressure of her breasts draws a high-tension whine from the rubber pillar pinched within her curves.");
	output("\n\nYou quickly switch to video and are rewarded for your quick reactions as the Bubble Buddy bursts! Gallons of your [pc.cumVisc] [pc.cumNoun] geyser from the breached condom up into Flahne’s face like a gooey shotgun blast. In a second, her visage is painted [pc.cumColor] with the thickness of your seed. She jerks back, surprised by the release and sputtering as her mouth and eyes are filled with spunk. Reeling back, her chair wheels away from the slimy puddle left by the frantic fingering of her drooling puss, so you pan down to capture her own fluid mess.");
	output("\n\nThe rahn secretary recovers quickly, her tongue lapping up the globular curtains of spunk that cascade from her face and wash over her breasts. She cups both hands together, shoveling bowls of jizz into her ravenous mouth, puckered lips slurping at the sagging ropes of your glossy spoo. You snap pictures of the cream-covered civil servant from a variety of angles, getting in close to capture the draining seed that slowly drips down her cute mouth and into her taut throat.");
	output("\n\nWhen, at last, she’s gathered up the last of your spilt spunk, she turns to cleaning out the burst bubble between her curves. Flahne vigorously laps at the interior of the latex, finishing her meal to the last, succulent drop. Gripping the burst condom between her lips, she proudly smiles up at the camera like a cat showing off its latest kill and you obligingly click a picture of the contented rahn.");
	output("\n\n<i>“Thanks again for the meal, [pc.name].”</i> Flahne gurgles with delight, taking back her CaptchaLens and dropping it into her purse. <i>“Remind me to return the favor one of these days.”</i> She buttons up her blouse and rises to unlock the lobby doors and take care of the traffic her little lunch break built up. On your way out, you check your Codex to see where those pictures and videos went.");
	pc.changeLust(5+rand(6));
	processTime(25);
	if(arg == 2) 
	{
		if(flags["FLAHNE_EXTRANETTED"] == undefined) flags["FLAHNE_EXTRANETTED"] = 1;
		if(!MailManager.isEntryUnlocked("extranetFlahnePics"))
		{
			MailManager.unlockEntry("extranetFlahnePics", GetGameTimestamp());
			AddLogEvent("<b>New Email from TamaniCorp (Marketing@TamaniCorp.corp)!</b>", "passive");
			pc.createKeyItem("Coupon - TamaniCorp", 0.9, 0, 0, 0, "Save 10% on your next purchase from your local TamaniCorp retailer!");
		}
	}
	if(arg == 1)
	{
		if(flags["FLAHNE_GALLINKED"] == undefined) flags["FLAHNE_GALLINKED"] = 1;
		if(!MailManager.isEntryUnlocked("galLinkFlahnePics"))
		{
			MailManager.unlockEntry("galLinkFlahnePics", GetGameTimestamp());
			AddLogEvent("<b>New Email from GalLink Fuckmeet (support@GalLink.org)!</b>", "passive");
		}
	}
	if(arg == 0) 
	{
		if(!MailManager.isEntryUnlocked("privateFlahnePics"))
		{
			MailManager.unlockEntry("privateFlahnePics", GetGameTimestamp());
			AddLogEvent("<b>New Email from Flahne (Flahne_Rahn@UGC.gov)!</b>", "passive");
		}
	}
	clearMenu();
	addButton(0,"Next", move, rooms[currentLocation].southExit);
}

//[Private]
//After the player finishes the scene for the first time, they get an email notification

//Subject: [No Subject]
//From: Flahne (Flahne_Rahn@UGC.gov)
//To: [pc.Email]@SteeleTech.corp

public function privateFlahneSceneMessage():String
{
	var ret:String = "This message has all of the private pictures and video clips of Flahne you took during her “lunch break.” They’re actually not half bad, and flipping through the progress from hungry receptionist to spunk-slurping cum slut sends a fresh wave of heat through your body.";
	//First time reading the email, player’s lust increases by 5-10
	ret += "\n\n<i>You save the pictures for later, sending them to your ship’s memory banks.</i>";
	//Maybe add viewable picture of Flahne covered in spunk or playing with a filled condom, etc. when the in-game image pack comes out
	return ret;
}

//[GalLink]
//[GalLink - Email]
//Subject: New comment on your picture(s)
//From: GalLink Fuckmeet (support@GalLink.org) (4)
//To: [pc.Email]@SteeleTech.corp
public function gallinkFlahneBubbleEmail():String
{
	//After the player finishes the scene for the first time, if they accepted Kiro’s Fuckmeet request, they get an email notification after an hour
	var ret:String = "All of the pictures and video clips you took of Flahne seem to have been automatically grouped into one album. You take a moment to flip through the sequence, depicting an innocent but hungry secretary toying with your filled condom. She seems so enamored by it that she begins stripping and drooling until, no longer able to suppress her need, she pops it and licks all the creamy goo from herself with wanton desire. Not a half-bad sequence, if you have to admit.";
	//First time reading the email, player’s lust increases by 5-10
	ret += "\n\nSeveral comments have been posted to the album:";
	//If Saendra hasn’t been Bad Ended:
	if(flags["FALL OF THE PHOENIX STATUS"] >= 1 && flags["SAENDRA_DISABLED"] == undefined) ret += "\nSaendra en Ilya: Love it, Flahne! But you left out your best feature- dat booty! Next time use those honey buns to squeeze out a juicy load!";
	ret += "\nKiro Tamahime: Psh, you call that a cum bubble? I jizz more than that before most people have had breakfast.";
	ret += "\nGirlBoy Alex: Flahne, did you do that at WORK?! Ha ha ha, you’re crazy, girl. I love ya, but you’re crazy.";
	ret += "\nSera Succubus: I feel like I’m watching a nature documentary on a territorial dispute between a loo’rahn and a doh’rahn. Damn nature, you’re scary! >:D";
	ret += "\nBigBooty Flahne: " + pc.nameDisplay() + "! What the goo! I said those were supposed to be private! Oooo, you are in for it next time I see you!";
	ret += "\nSera Succubus: Re: BigBooty Flahne: Oh my god, that’s hilarious.";
	return ret;
}

//[Gal Link - Consequence]
//After completing the medium bubble scene for the first time, the next time they enter the Customs Office on Mhen’ga, the following scene plays
public function galLinkConsequence():void
{
	clearOutput();
	showFlahne();
	author("Adjatha");
	flags["FLAHNE_GALLINKED"] = 2;
	output("As you step into the Customs Office, you practically smack into Flahne. The honey-hued rahn has her arms crossed under her breasts, thrusting the massive G-cups ever higher. The cute receptionist’s face is pinched in an expression of annoyance.");
	output("\n\nShe takes a step forward and presses her pliant peaks against your [pc.chest] in what would normally be quite a seductive fashion. Now, however, you’re forced to imagine yourself just like the filled condom she popped between those gelatinous mountains. <i>“Somebody had a little fun changing around the settings on my CaptchaLens, did they?”</i> she sweetly inquires with an arched eyebrow.");
	if(pc.isNice()) 
	{
		output("\n\nYou offer an apologetic shrug, smiling sheepishly. <i>“I just thought you wouldn’t mind sharing with your friends, you know? You’re too cute to keep all to myself.”</i>");
		output("\n\nFlahne flushes and can’t keep up the angry facade. <i>“I think that was sweeter than my lollipops, you goof. I’m still gonna make you pay, though!”</i> She drags you off to a janitorial closet and ravages you as only a gel girl can. By the time she’s done, you’re having trouble [pc.walking] straight. All told, not a bad punishment at all!");
		//player’s lust and energy set to 0
		processTime(45);
		for(var x:int = 0; x < 5; x++) { pc.orgasm(); }
		pc.energy(-100);
	}
	else if(pc.isMischievous())
	{
		output("\n\nYou place a finger on the rahn’s face where a nose would be on any other race. <i>“Boop,”</i> you announce with a grin, offering no further explanation.");
		output("\n\nFlahne’s bubbling ire slowly trickles away into exasperated mirth. <i>“You dummy. I don’t care that you posted those on GalLink. Those sluts are always posting smutty pictures of themselves. I just wanted you to keep the pictures for yourself as something special. Guess we’ll have to try it again some time,”</i> She finishes, walking back to her desk with a booty-shaking gait that looks ready to tear open her skirt’s seams with every step.");
		//player’s lust increases by 5-10
		pc.changeLust(5+rand(6));
	}
	else
	{
		output("\n\nWrapping an arm around the receptionist’s backside, you give her a squeeze. <i>“Ah, come on. You know you love putting on a show. I bet if I brought out another cum bubble right now, you wouldn’t even think twice before popping it all over yourself again.”</i>");
		output("\n\nFlahne furrows her little brow and meets your dismissive gaze with narrowed, violet eyes. She slides a hand down and grabs your crotch possessively. <i>“You’re just lucky you’re so tasty,”</i> she says with a squeeze. Pushing you away and marching back to her desk, the rahn glances back and sticks out her tongue. It’s good to keep ‘em riled up, you muse with an appreciative leer at the gel girl’s ample curves.");
		pc.changeLust(5+rand(6));
	}
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Extranet]
//[Extranet - Email]
//After the player finishes the scene for the first time, they get an email notification after an hour
//Subject: Thank You For Your Submission
//From: Marketing@TamaniCorp.corp
//To: [pc.Email]@SteeleTech.corp
public function extranetShareEmail():String
{
	var ret:String = "Thank you for the numerous pictures and videos you submitted detailing your enjoyment of Tamani Corp’s fine Bubble Buddy product. We encourage all customers to distribute pictures of themselves utilizing our fantastic semen storage solution, and we appreciate the “Liquid Lunch” social media movement among our rahn users.";
	ret += "\n\nUnfortunately, we will not be able to utilize the majority of your pictures for our public advertising campaign. The rather explicit nature of your pictures and video clips exceed what our Marketing department has determined to be “good taste.” However, we at Tamani Corp would like to personally thank you for your dedication and brand loyalty.";
	ret += "\n\nPlease accept this coupon on our behalf. We look forward to seeing more from you in the future.";
	ret += "\n<i>Included at the bottom of the form letter is a 10% off coupon for Tamani Corp products. Most shops would probably take this.</i>";
	//Add key item: “Coupon - Tamani Corp - Save 10% on your next Tamani Corp purchase!”
	//9999 haldo
	return ret;
}



//[Extranet - Consequences]
//After completing the medium bubble scene for the first time, the next time they enter the Customs Office on Mhen’ga, the following scene plays
public function extranetFlahneConsequences():void
{
	clearOutput();
	showFlahne();
	author("Adjatha");
	flags["FLAHNE_EXTRANETTED"] = 2;
	output("As you step into the Customs Office, you practically smack into Flahne. The honey-hued rahn has her arms crossed under her breasts, thrusting the massive G-cups ever higher. The cute receptionist’s face is pinched in an expression of outrage.");
	output("\n\nShe takes a step forward and presses her pliant peaks against your [pc.chest] in what would normally be quite a seductive fashion. Now, however, you’re forced to imagine yourself just like the filled condom she popped between those gelatinous mountains. <i>“Somebody had a little fun changing around the settings on my CaptchaLens, did they?”</i> she demands, poking your chest with a translucent finger.");
	output("\n\nYou’re about to open your mouth to explain, but she waves a hand in front of you. <i>“Ugh. Don’t even. I don’t know WHAT you were thinking, but that was a real jerk thing for you to do!”</i> She delivers an open-palmed slap to your face that leaves a surprisingly sharp sting. Turning on her heels, she clicks back to her desk angrily. Without turning around she calls back, <i>“Get lost. I’m too angry to even talk to you right now.”</i>");
	output("\n\nMaybe she’ll cool off if you give her some time?");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//Player is unable to interact with Flahne for 24 hours. After 24 hours, the next time they enter the Customs Office, the following scene players
	pc.createStatusEffect("Flahne_Extra_Pissed");
	pc.setStatusMinutes("Flahne_Extra_Pissed", 1440);
}

public function extranetFlahneConsequencesMakeup():void
{
	clearOutput();
	showFlahne();
	author("Adjatha");
	//Clear after proccing:
	flags["FLAHNE_MAKEUP"] = undefined;
	output("Stepping back into the Customs Office, you brace yourself for another tongue lashing from Flahne, but are pleasantly surprised to see the rahn girl looking quite pleased. She waves you over to her desk and you cautiously approach.");
	output("\n\nNoticing your reluctance, Flahne gives you a dismissive wave. <i>“Oh, don’t act like that, [pc.name]. You were a big scumbag for posting all that stuff publicly, but I’m over it. Actually, I got a rather nice letter from the folks at Tamani Corp! They’re working on a spin-off of the Bubble Buddy intended specifically for Rahn meals and they said they’d like me to be the spokeswoman when it comes out! I’m sure it’ll be quite a while till they’re ready to market it, but just think: I’ll be an extranet starlet,”</i> she sighs with a delighted smile.");
	output("\n\nYou pat the gel girl on the shoulder. ");
	if(pc.isNice()) output("<i>“That’s awesome! I’m so happy for you, Flahne!”</i>");
	else if(pc.isMischievous()) output("<i>“Putting on saucy shows for the whole galaxy? I always knew you had it in you.”</i>");
	else output("<i>“What are they going to call it? The Bimbo Buddy?”</i>");
	output(" She doesn’t really seem to be listening to you, however, her mind still swimming with the possibilities.");

	output("\n\n<i>“Anyway, even if you were being a real goo-head with those pictures, I wouldn’t have gotten the offer otherwise. So I guess I forgive you, ya jerk.”</i> She looks up at you with a small, amused smile. <i>“Just, next time warn me before you post my boobies all over the extranet, okay?”</i> She reaches up and tweaks your nose before sending you on your way. That turned out a lot better than you would’ve expected!");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


public function flahneHugeBubbleStuffing2():void
{
	clearOutput();
	showFlahne();
	author("Adjatha");
	output("Grabbing a fist-sized balloon, you squish the pliant lilac orb against Flahne’s well-stretched vulva, encountering the resistance of the other cum balls. You can hear Flahne’s fingers clicking away at her station, vigorously sucking on a lollipop to take her mind off of what’s happening between her knees. The rubbery surfaces squeak in protest as you force the larger orb into her with a sudden thrust that sends ripples through her gelatinous body and cuts her typing short.");
	output("\n\n<i>“Are you alright?”</i> a female voice asks. <i>“It’s just, you seem to have swallowed your sucker, stick and all.”</i>");
	output("\n\n<i>“Oh, I’m just working through my break,”</i> Flahne replies in a high, tight voice, practically gurgling as she tries to dislodge the swallowed sweet. <i>“Guess I got a little hungry,”</i> she laughs, too loudly, a manic edge creeping into her voice as you keep up your relentless pace, jamming another squeaking bubble into her packed pussy. Despite the skirt, you can actually see the shadow of all the bubbles inside her abdomen slowly grow with each addition, your cum bundle rising up to waist level. By now she’s freely leaking sticky strings of femme-cum into her skirt, the honey-like goo pooling between her legs and slowly oozing down the sloped seat of her chair. You squeak another few bubbles into her, rolling them in her fluids for added lubrication.");
	output("\n\n<i>“Working through your break and they force you to use a squeaking chair? And, I think I can hear a drip! You should really talk to somebody about these simply terrible working conditions, dear!”</i>");
	output("\n\n<i>“Ah, the job has some perks,”</i> Flahne giggles, between her panting gasps.");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output(" Flahne’s hefty goo-cock begins leaking its honey-hued pre-cum, the intoxicating scent of the flavorful treat flooding your nostrils. No sense in wasting the added lube, you reason, and wrap a hand around her wobbling length, squeezing the honied spoo on each bubble before squashing it into receptionist’s jam-packed puss.");
	output(" Flahne’s belly has begun to expand under the weight of your bulky, rubber-bound seed. The buttons of her blouse strain mightily against the swelling inflation of your insertions, so you discreetly reach up and uncinch a few of the lower buttons to make room for her bloated stomach. No sense in ruining a perfectly good shirt, you reason and you push another couple of cum capsules into her crammed cunt. Her right leg starts vibrating slightly, rocking rapidly on the tip of her high heeled pumps. <i>“Is... is there anything else I can h-h-help you with, Miss?”</i> Flahne politely asks, obviously trying to get rid of the visitor.");
	output("\n\nThe sound of a door opening elicits a slight moan from Flahne. The woman tuts and responds sympathetically: <i>“Oh, well I see you’re going to be busy with all these folks, so I’ll let you get back to work. You keep what I said in mind though, honey. If you don’t stand up for yourself, they’ll walk all over you!”</i> She steps away as a practical swarm of stomping, scraping feet pound up to Flahne’s desk.");
	output("\n\nBusy day, you suppose, stuffing another cum-egg into the rahn. Trying to keep her voice level, the secretary tries to bring the crowd of visitors to some sort of order. A particularly troublesome bubble keeps slipping out of Flahne’s spongy slit, so you grip it firmly and jam the huge orb deep into her, the cache of latex shifting and groaning under the added weight as her womb expands higher and higher into her torso. She lets out an orgasmic shriek that brings the noisy lobby to absolute silence in an instant. <i>“Um... ah... now that I have your... your attention. Um. Please form an orderly line and we’ll process each of you in turn,”</i> she meeps, her embarrassment flushing her whole body a rich, ruddy orange.");
	output("\n\nFor the next half hour, Flahne tends to the crowd while you fill her with rubbery balls, the heat of your sealed cum bringing beads of sugary sweat to her smooth surface. You teasingly lick her inner thighs and sink your fingers into the tender, bulging lips of her well-breached vulva.");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output(" Her throbbing ovi-cock drools a constant stream of oozing nectar, its sixteen inch length nearly entirely filled by the egg-like shadows of her pent-up rahn seed.");
	output(" Her body gurgles with the liquid weight of your latex bounty, while her voice has become the tight, pinched murmuring moan of someone doing their best to hide a slow-burning orgasm. She’s slouched in her seat and meekly coos in lust-drunk bliss at your every touch.");

	output("\n\nHer bubble-filled womb has stretched out of your limited sight, by the time you’re down to a single remaining sphere and you idly wonder if the people in the lobby can see the balloon shadows through her cleavage yet. Well, it’s been fun, but time to finish off the last of your load. You hoist the final, 5\" sphere and slide it between her thighs, bracing the latex orb against her packed pussy. <i>“No no no no,”</i> she whispers, feeling the hot weight of your fluid present pressing against her loins. <i>“Not that. It’s too big!”</i> she moans quietly.");

	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) 
	{
		output("\n\nYou shrug, pulling the huge condom back. Afterall, she might want a snack later. Still, it’d be a shame to leave that fat, honey-hued ovi-cock just drooping helplessly. Gripping the yielding surface of the gelatinous member in both hands, you begin stroking the semi-firm shaft eagerly. Fingers running across the bulging, egg-distended gel, fat blobs of sticky pre ooze from the dimpled tip as her body tenses. The pussy-stuffing has apparently left her with a hair-trigger!");
		output("\n\nYou’re about to put your lips to the massive organ when a thought strikes you. Giving her a few more rough pumps to make sure she’s right at the edge of climax, you grab the gooey shaft and bend it around in a U-shape. The jelly member wobbles in your hands as you thrust the tip into her own pussy, holding it firmly in place as her orgasm hits. Above you, Flahne’s fist pounds the desk, a small cache of wrapped lollipops scattering off the edge and clattering on the floor.");
		output("\n\nEgg after egg spurts from her ovipositor back into her pussy, the squishy globules adding their mass to the rubbery trove of cum bubbles you’ve filled her up with. Openly moaning now, her feet tense as she kicks the underside of her desk with her heels. The mutters of the visitors turn to shocked gasps as, load after load, Flahne fills herself with a positively body-deforming volume of eggs and honey.");
	}
	else
	{
		output("\n\nDown to the last one and she wants to quit? Now that would really be a shame. Squeezing the warm condom with both hands, you help flatten its spherical shape into a more manageable cylinder. Pressing firmly, you feed inch after inch into the secretary’s depths. The mass of bubbles inside her shift and squeak, pushed upward by the volume of their big brother. Flahne lets out a <i>“glurk!”</i> of over-burdened fullness, her fist slamming down on the desk as she kicks one of her heels off a smooth, toe-less amber foot.");
		output("\n\nThe mutters of the visitors turn to shocked gasps as, bit by bit, you squeeze the final bubble into her. <i>“What’s wrong with her head?”</i> someone asks. <i>“Is it full of eggs or something?”</i> another presses. <i>“Look at how thick her neck is! Is she choking?”</i> The visitors crowd around the secretary’s desk, trying to help the girl but unsure of her biology or what to do. With a final push, you stuff the last of the bubbles into her, the girl’s absurdly elastic pussy stretching so far as to allow both of your hands to slide in after it.");
	}
	output("\n\nFlahne is just too full. She lets out a choking gurgle, her body clenching down in a vibrating orgasm that floods the room with the scent of gushing honey. She weakly manages to provide a breathy <i>“I’m fine,”</i> before the pressure in her body is too much. A series of wet plops rain down on her desk as the cum bubbles you stuffed into her are forced out through her mouth. She slaps her hand over her lips, but a hiccuping tremble of her ongoing orgasm lets another cascade of gooey latex condoms spill from her flushed face.");
	output("\n\n<i>“Is she pregnant?”</i> one of the less informed visitors asks quietly. <i>“If so, this has to be the weirdest birth I’ve ever seen.”</i>");
	output("\n\nPanting and gasping, Flahne tries to explain the bubbles away but keeps interrupting herself with more hiccups and more loose lilac bubbles. She apologizes and asks the travelers to fill out their paperwork on their ships. <i>“Just a little rahn emergency,”</i> she assures them weakly. <i>“Nothing to worry about.”</i> When the last of the guests clears out, she pulls her chair away from her desk and rushes over to the door to lock it. Unfortunately, the added weight of her bubble-filled interior throws her off balance and the secretary face-plants onto the floor instead.");
	output("\n\nYou come out of the desk and help Flahne off the ground and into a seat. Locking the doors for her, you take stock of the gel girl’s state. Sure enough, your cum bubbles");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output(" and her own rahn eggs");
	output(" seem to have stretched her womb all the way from pussy to mouth. Clumps of dark shadows inside her honey-hued body are plainly visible along the exposed flesh of her distended belly, her plump cleavage, her bloated neck, and her hiccuping head. She’d probably be mad at you, if she weren’t so out of it. Rounding up the dozen or so stray bubbles that escaped her, you leave a small pile on her desk. A treat for after she finishes the buffet you left inside her.");
	output("\n\nYou exit into Esbeth with a little smile as Flahne gurgles with blissed-out gratitude.");
	processTime(15);
	clearMenu();
	addButton(0,"Next", move, rooms[currentLocation].southExit);
}

public function giveVaandeATreatSetup():void
{
	var choices:Array = [];
	for(var x:int = 0; x < pc.inventory.length; x++)
	{
		if(pc.inventory[x] is SmallCumBubble) choices.push(x);
		else if(pc.inventory[x] is MediumCumBubble) choices.push(x);
		else if(pc.inventory[x] is LargeCumBubble) choices.push(x);
		else if(pc.inventory[x] is HugeCumBubble) choices.push(x);
	}
	var func:Function = giveVaandeTheGiftOfCum;
	if(pc.hasItemByClass(BubbleBuddy) && pc.hasCock()) func = giveVaandeBubbleBuddyFun;


	if(choices.length == 1) func(pc.inventory[choices[0]]);
	else
	{
		clearOutput();
		showVaande();
		showName("WHICH\nONE?");
		output("Which cum bubble will you give her?");
		clearMenu();
		for(x = 0; x < choices.length; x++)
		{
			if (pc.inventory[choices[x]].quantity > 0) {
				addItemButton(x, pc.inventory[choices[x]], func, pc.inventory[choices[x]]);
			}
		}
		addButton(14,"Back",vaandeGo);
	}
}

//Give to Vaande
//[Give Bubble w/o Bubble Buddy toy in inventory]
//Add [Cum Bubble] option to Celise’s [Feed] menu.
// “Give the rahn a gift of sealed cum.”
public function giveVaandeTheGiftOfCum(item:ItemSlotClass):void
{
	clearOutput();
	showVaande();
	author("Adjatha");
	output("You present a lilac bubble to the lavender girl and a look of hunger crosses her normally serene face for just a second before her cat-like calm returns. <i>“Oh, you’ve brought me a gift? What a good " + pc.mf("boy","girl") + " you are,”</i> she purrs, the faint scent of cold rain filling your nostrils. Vaande places a finger to her plump, glistening lips and folds an arm under her E-cups in thought. <i>“Now, I wonder if you happen to have brought the toy that made this?”</i> she muses aloud, her voice echoing between your ears as the distant perfume makes its way into your head.");
	output("\n\nA warm blur settles over you and you shake your head slowly. Your hands pat down your [pc.gear] and you vaguely wonder where you left the Bubble Buddy. A thought strikes you that you’ll have to bring it with you next time, though you’re not sure if you arrived at that conclusion on your own. Your eyelids seem heavy and when you blink to clear the wooziness, you find that ");
	if(!pc.isNude()) output("you are now naked");
	else output("your equipment has been stacked in one corner of the room");
	output(". Of course, you rationalize, you won’t need any of that. No use worrying about it.");

	output("\n\nTurning slowly so your spinning head doesn’t start doing loops around the room, you notice that Vaande is also naked. The violet woman is lounging on her cheap cot like the empress of an ancient world. <i>“[pc.BoyGirl], would you kindly attend me,”</i> she beckons, bending a forefinger ever so slightly. The almost undetectable essence of the rahn’s bouquet plays across your tensing senses with greater effect than the most fragrant incense. The stirring scent of water burbling at a natural spring seems to awaken a spring within you, liquid heat filling your [pc.groin] as you are drawn to her side. You are still holding out the cum bubble in both hands and she looks up with favor at your offering.");
	output("\n\n<i>“Hrmmm,”</i> she murmurs with an rippling tremble that sends shivers all the way through her body and up into yours. <i>“So little. And yet you surely did your best?”</i> The lilting question and the chilly tang in the air sends a wave of panic through you! What if your mistress doesn’t like your offering? She notices your fear and offers a magnanimous smile that puts you at ease. The cloying scent of the room strengthens and you lower yourself before her, eagerly awaiting instructions.");
	output("\n\nVaande rolls the white, plastic ball of a pin between her forefinger and thumb, its small metal spur flickering in the electric light of her room. <i>“You wouldn’t mind taking this pin and bathing me with that bubble, would you?”</i> You gulp and take the pin from her, unsteadily pressing it into the blobby purple sphere. You almost expect it to pop, but the sheath holds fast and a small droplet of cum oozes from the breach. Pressing the tiny metal spike all the way to the firm orb of its tip, you grip the sphere with both hands and reverently set it against the smooth, pliant surface of her succulent breasts. The rahn moans softly at the pressure of your leaking condom, her back arching with delight.");
	output("\n\nYou squeeze the bubble slightly and trickles of hot cum dribble out from the puncture, oozing across the lavender skin of your gelatinous goddess. Dragging the squeaking, leaking orb up and down the gel girl’s curving peaks, your [pc.cumColor] [pc.cumNoun] washes over her like the glossy coat of a fresh lacquer. Her already slick skin becomes ever glossier, and her moans grow in pitch and frequency, the tip of her pinkie pressed against the pillowy plumpness of her plum lips. The moist heat of the room thickens into a nearly tangible thing - the urgency of her arousal giving the rainy scent an electricity more suited to a thunderstorm.");

	//Cum bubbles: medium and higher:
	if(item is MediumCumBubble)
	{
		output("\n\nWith her breasts bathed in the slick heat of your spunk, you pull the seeping sack down to Vaande’s impossibly slim torso. The taut surface of her faintly flushed skin rises and falls with appreciative shivers as your [pc.cumVisc] cream drips down her abdomen and pools in the recess of her navel. She raises one leg and you obediently slide the salivating sphere up her thick thigh and across her yielding gel. Delicately, you cradle the heel of her small, lilac foot and sweep her arch with a fondling slaver from your punctured bubble. Her toeless foot wiggles with ticklish pleasure and she drapes one freshly bathed limb against your [pc.chest] while you lift her other leg for equal treatment. The sopping junction of her hips practically drools with the ecstasy of your attentive ministrations.");
	}
	//Cum bubbles: large and higher:
	if(item is LargeCumBubble)
	{
		output("\n\nWhen her legs and feet are dripping with [pc.cumGem] droplets, she turns over, allowing you to bathe her back as well. You lower the shrinking bubble at the base of her neck and squeeze it enough to send a cascade of drizzling cum across her shoulders. With tender strokes, you sweep the weeping cum ball over her surface, feeling the quivering tremors of her back run up your fingers with each motion. Raising the ball to the ponderous peak of her perfectly sculpted posterior, you tighten your grip on the bubble so that thick spurts of spunk splatter over her amethyst orbs. Your [pc.cumColor] [pc.cumNoun] oozes down between her cheeks and you follow the flow with the orb, parting those magnificent bubbles with your own diminished orb. The added attention earns you a delighted squeal from the enraptured rahn and you can feel your [pc.groin] throbbing with the nearness of your own release.");
	}
	//Cum bubbles: huge:
	if(item is HugeCumBubble) output("\n\nSuitably slicked by your seeping spunk, Vaande rolls to her side and motions for you to rise with the oozing remnants of your cum bubble. <i>“Be a dear, and finish me off, won’t you?”</i> She gestures to the cascade of gooey ‘hair’ that hangs around one half of her elfin face. There’s a tension to her voice that seems to carry an urgency with it, so you set to work, holding the cum sack over her head and squeezing fresh spouts of [pc.cumNoun] from the condom to shower the lavender woman in your warmth. She draws a sharp breath as the [pc.cumNoun] pools on her hair and forms sticky cataracts that fall across her face in a [pc.cumVisc] deluge. She can’t help herself from letting the long, sinuous length of her tongue gather up precious beads of thick cream.");
	processTime(20);
	pc.changeLust(50);
	IncrementFlag("VAANDE_BUBBLED");
	itemConsume(item);
	clearMenu();
	addButton(0,"Next",vaandeGiftPartTwo);
}

public function vaandeGiftPartTwo():void
{
	clearOutput();
	showVaande();
	author("Adjatha");

	output("When, at last, your bubble is empty, Vaande lightly touches your [pc.hips] and draws you to the bed with her, the two of you lying side by side in a sticky, creamy embrace. She holds her face inches from yours in a kiss that can’t quite reach you, her hot breath filling your mouth with a dizzying flavor of rain-slick blossoms. The rahn draws the pin from the emptied sheath of your bubble and lightly touches the tip to a point on your forehead between your eyes. The tiny prick of pain clears your mind for a split second, just in time for her to whisper <i>“Cum with me,”</i> to you.");
	output("\n\nThe trembling rahn girl embracing you shudders with cum-drunk bliss and the built-up pressure inside your body blooms into a full fledged eruption of passion. Your throat leaps in your mouth and your tongue feels dry as the liquid heat of your climax surges to your pelvis. Your chest burns as air refuses to reach your lungs, but such trivial concerns are meaningless next to the ecstasy of the woman beside you.");
	if(pc.hasVagina())
	{
		output("\n\nThe shuddering, clenching depths of your [pc.pussies] send");
		if(pc.totalVaginas() == 1) output("s");
		output(" bands of tightening convulsions through your frame as dripping rivulets of [pc.girlCum] gush between clenched lower lips. Fingers robbed of all volition by the mind-blanking orgasm, you tremble feebly against the lilac rahn. Eyes rolling up and mouth hanging open, you are spun in a swirling vortex of pheromone-drunk euphoria. Depleted and exhausted, your body continues its squeezing, trembling release long after you lose the ability to tell one orgasm from the next.");
	}
	if(pc.hasCock())
	{
		output("\n\nYour body feels almost like the cum bubble you had been squeezing a minute ago. The pin’s touch seems to rid you of all self control and the rush of your orgasm is sped along your [pc.cocks] by the hungry scent of the gelatinous woman pressing her supple curves against you. You cum and it is as if every muscle in your body is working in unison to release a greater load than you’ve ever experienced. Time compresses into a single, wet, rain-scented instant and the sensation of your exultant peak stretches out into an eternity.");
	}
	output("\n\nWhen, finally, your senses return, your whole body aches with the intensity of your climax. One that the doh’rahn was able to achieve with a single touch, you recall vaguely. You rise unsteadily and are a bit surprised to see Vaande standing and slipping on her panties and bra once more. The cloying, suffocating scent is gone, replaced by a rather satisfied perfume of pollinated flowers. There’s no sign of all the cum you smeared across her body, though the gel girl’s lavender skin does appear glossier than before.");
	output("\n\nYou retrieve your belongings and just before she shepherds you to the door, Vaande presses her lips against your cheek in a kiss that leaves tingles radiating through your [pc.skinFurScales]. <i>“Don’t forget to bring your toy next time,”</i> she whispers before closing her door.");
	processTime(15);
	pc.orgasm();
	pc.ballFullness = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Give Bubble w/ Bubble Buddy toy in inventory]
//centaurs and dickless PCs need not apply
// “Show Vaande how your gelatinous masturbation toy works.”
public function giveVaandeBubbleBuddyFun(item:ItemSlotClass):void
{
	clearOutput();
	showVaande();
	author("Adjatha");
	output("You present a lilac bubble to the lavender girl and a look of hunger crosses her normally serene face for just a second before her cat-like calm returns. <i>“Oh, you’ve brought me a gift? What a good [pc.boyGirl] you are,”</i> she purrs, the faint scent of cold rain filling your nostrils. Vaande places a finger to her plump, glistening lips and folds an arm under her E-cups in thought. <i>“Now, I wonder if you happen to have brought the toy that made this?”</i> she muses aloud, her voice echoing between your ears as the distant perfume makes its way into your head.");
	output("\n\nA warm blur settles over you and you nod your head slowly. Your hands pat down your gear, and you produce the purple pocket pussy. Vaande offers you a slight smile and holds you in her gaze with her slitted, crimson eyes. <i>“My, aren’t you eager to please,”</i> she murmurs and indeed you are. A little too eager, if the throbbing stiffness between your legs is any indication. She places a hand on your cheek and a faintly sweet odor, not quite like paint thinner fills your nostrils. Your eyelids seem heavy and when you blink to clear the wooziness, you find that ");
	if(!pc.isNude()) output("you are now naked");
	else output("your equipment has been stacked in one corner of the room");
	output(". Of course, you rationalize, you won’t need any of that. No use worrying about it.");

	output("\n\nTurning slowly so your spinning head doesn’t start doing loops around the room, you notice that Vaande is also naked. The violet woman is lounging on her cheap cot like the empress of an ancient world. <i>“[pc.BoyGirl], would you kindly attend me,”</i> she beckons, bending a forefinger ever so slightly. The almost undetectable essence of the rahn’s bouquet plays across your tensing senses with greater effect than the most fragrant incense. The stirring scent of water burbling at a natural spring seems to awaken a spring within you, liquid heat filling your [pc.groin] as you are drawn to her side. You are still holding out the Bubble Buddy, though the cum bubble you initially offered her seems to have vanished.");
	output("\n\n<i>“Normally, I would put on a show for you, but I’m ever so tired today. You wouldn’t mind putting on a show for me, would you?”</i> Shaking your head enthusiastically, you feel like you’ve got the perfect show for a rahn. Lifting the Bubble Buddy by way of explanation, you’re rewarded with the scent of falling rain. Your sight flexes a bit and when the walls stop panting, you find yourself as hard as you’ve ever been. Your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is");
	else output("are");
	output(" at full attention and already dribbling with pre-cum. <i>“Oh, do go on,”</i> Vaande encourages you. <i>“By all means, show me just how much you can produce.”</i>");

	output("\n\nHappy to comply, you fit your [pc.cock " + x + "] with the rubbery, lilac sheath. Feeding inches into the pliant plastic seems different somehow. It’s as if you’re sliding into a living thing - the interior tensing and gradually acclimating to your girth. The purple cock sheath practically drools with silky lubrication, as hungry for your cum as you are for release. Wrapping both hands around the latex cylinder, you slowly rock in and out of it, turning sideways so Vaande has a clear view through the semi-translucent toy. She seems to be enjoying the show, a sharp intake of breath sending ripples through her lavender form.");

	output("\n\nYou pull the toy to your [pc.biggestSheath], savoring the clenching, squeezing voracity of the pussy nearly as much as the tightening of your lower body. The muscles in your [pc.thigh] and back work in concert with your arms to milk your building orgasm for all it’s worth. Pumping your swollen member with strident strokes, you wince at the numbing cold building in your gut as gurgling cum production goes into overdrive. The smell of rain weaves in and out of your awareness and in the uncertain illumination of Vaande’s room, you could almost swear that the lube-gushing pocket pussy and the drooling rahn woman seem one and the same.");

	output("\n\nYou shake the distracting fantasy away and focus on the gelatinous sheath suckling at your thumping spout. With long, agitated caresses, you sweep the toy along your [pc.cock " + x + "] until you can hold back no longer. A warm, sweet tightness of release seizes your body one second and the next, you find yourself pumping away again, orgasm so close you can nearly taste it. You blink, trying to remember what happened, but it’s difficult to think with the frantic, desperate heat in your chest. You take a deep breath, sucking in as much cool air as you can but it only serves to throw fuel onto your inner fire.");

	output("\n\nA buzzer set into the wall goes off and a voice chimes in: <i>“This is the front desk. Are you all right?”</i> You growl at the distraction and reply in a tight voice that you’re just dandy before returning to the task at hand. <i>“All right,”</i> the voice replies, a little annoyed, <i>“but this is the third check in, so I’m going to have to charge you for the overtime.”</i> You don’t have time to think on this as the agonizing sweetness of your climax approaches once more and - again - you find your body denying you release. You blink hard, trying to shake off the dizzying compulsion for liquid bliss, but your limbs are not your own. Arms aching from the rapid pace, hips aching from their slapping assault, and [pc.cock " + x + "] aching with a strangely numb stiffness, it’s all you can do to remain standing.");

	//if vagina:
	if(pc.hasVagina())
	{
		output("\n\nStrangely, your [pc.vaginas] ");
		if(pc.totalVaginas() == 1) output("is");
		else output("are");
		output(" nearly as sore as the rest of your body. Your inner walls spasm with the aftershocks of a phantom climax. With a high, moaning whine, you ache to give some attention to your sensitive folds and [pc.clits], but just can’t afford to stop now. You’re so close to your climax, if you tried to pause without finishing it might drive you mad. You arch your back, [pc.chest] jutting in the throes of your nearness and press on, heedless of the cascade of [pc.girlCum] leaking down your inner thigh.");
	}
	//if multiple cocks:
	if(pc.cockTotal() > 1)
	{
		output("\n\nYour eyes happen to glance down and you can make out the [pc.cumColor] pools of spunk leaking from your unoccupied cock");
		if(pc.cockTotal() > 2) output("s");
		output(". You’re a little surprised as how much pre-cum has leaked out in such a short time! ");
		if(pc.cumQ() < 200) output("Spatters of [pc.cumNoun] are everywhere");
		else if(pc.cumQ() < 7000) output("Pools of [pc.cumNoun] are sloshing against your [pc.feet]");
		else output("The floor is flooded with an inch of the [pc.cumVisc] stuff");
		output(", and your mind tries to make sense of the sight. The scent of running water interrupts your connections and you simply try moving the Bubble Buddy to ");
		if(pc.cockTotal() > 2) output("an");
		else output("the");
		output(" unused member, pumping at the oddly tender flesh with redoubled effort.");
	}
	output("\n\nYou climb the mountain of your climax again and again, never quite reaching the peak. Your body aches and your muscles scream at you, but a comforting numbness takes the sharpness from the warnings. You settle to your [pc.ass], sitting to better focus on the task at hand. The lavender pussy bounces in your lap and, as darkness closes in, the last thing you see is the tip of the gel-like toy bloating with the long-sought cream of your shuddering, gasping orgasm.");

	IncrementFlag("VAANDE_BUBBLED");
	itemConsume(item);
	processTime(60);
	pc.orgasm();
	//Player’s lust and energy are reduced to 0 and they take 50% hp damage
	clearMenu();
	addButton(0,"Next",bubbleBuddyVaandeEpilogue);
}

public function bubbleBuddyVaandeEpilogue():void
{
	clearOutput();
	showVaande();
	author("Adjatha");
	output("When you wake, you feel oddly moist. You appear to be clean, practically glistening from head to toe, with no sign of spilt fluids or even sweat on you. You try to stand and almost immediately collapse in an agonized pile of sore muscles and deferred exhaustion. Closing your eyes and gathering yourself once more, you take stock of your surroundings.");
	output("\n\nVaande’s normally quite spartan room is filled with cum bubbles of assorted sizes. Piles of melon-sized orbs sit in one corner, while apple-sized spunk balloons line the top of her dresser like trophies. All over the floor, fourty or more plum-sized bubbles are scattered in wild disarray. A single, massive jizz sack is on her cot and the rahn herself is curled up on top of it like the cat who got the cream. There must be dozens of cum bubbles around the room- a treasure trove of [pc.cumVisc] seed.");
	output("\n\nFragments of memories come back to you and you start putting together the tricky, mesmeric feat the pheromone-flooded rahn must’ve accomplished. You even recall someone from the front desk calling to check in on you mid-way through the gluttonous girl’s harvest. How long have you been here? You grab your [pc.gear] and check your Codex quickly. TWELVE HOURS?! No wonder Vaande seems to have suddenly inherited her own sperm bank!");
	output("\n\nGroaning, you pick up the sorely abused Bubble Buddy off of the floor and stow it with your other belongings. Poor girl had nearly as tough a time as you did yourself! You notice a credit chit on the nightstand and grab it in consideration of your unexpected generosity. At the very least, it should cover the added expenses the brothel mistress was so keen to hit you with. You leave with a mental note to avoid putting yourself on the wrong end of a hungry doh’rahn again.");
	processTime(660);
	pc.energyRaw = 0;
	pc.credits += 15 + rand(16);
	pc.changeHP(-Math.round(pc.HPMax()/2));
	for(var x:int = 0; x < 15; x++) { pc.orgasm(); }
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
