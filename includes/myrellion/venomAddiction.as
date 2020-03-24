import classes.Items.Drinks.RedMyrVenom;

/*****************************
 *   MECHANICS OF MYR VENOM  *
 *****************************
 DRANK_MYR_VENOM - Count of how many times imbibed
 SEXED_MYR_VENOM - count of venom applications from sex
 VENOM_PROGRESS - Increased on dosage. Decreases over time spent sober. Stays at 100 while addicted
 VENOM_ADDICTION - If not undefined, PC is addicted. Scales from 1 to 100. Decreases while in withdrawal
 "Venom Slut" - If you reach 100 VENOM_ADDICTION, gain the venom slut perk.
 			  - Increases maximum lust by 35 while on venom

"Red Myr Venom" - +35 minimum lust if below 35, 150% lust over time, +25% tease damage vuln
				- 12 hour duration.
"Myr Venom Withdrawal" - Half libido, tease attacks disabled, cannot fap

/* LEGACY MYR VENOM NOTES
Red Myr Venom (Status)
//Effect: Raises current lust by 50 points when consumed. For the duration, significantly reduces the PC’s lust resistance (/increases lust damage taken) and quadruples lust gain over time. ~25% to permanently gain 1 Libido.
//Status Effect lowers willpower significantly!
//Gain When: When drinking distilled venom pot. After any of Lieve’s repeat sex scenes and her kiss/try venom scene. During Nehzara’s <i>“Storage Closet”</i> scene. I’m sure more will come along~

Status Duration: 12 hours
Blurb: The red myr venom coursing through your veins is keeping your cheeks flushed with growing arousal. The longer it lasts, the more your mind gives over to its primal desires...

Red Myr Venom Withdrawal (Status)
//Thoughts: When withdrawing from red myr venom, you get a buff of all things! Your Libido tanks, lust over time drops, and you gain a bonus to lust resistance. But you take a huge penalty to tease attacks and damage. You just can’t get your rocks on as easily without that wonderful chemical arousal burning through your veins!

//Status Effect: Venom Withdrawal
You’re currently suffering withdrawal from red myr venom. Your senses seem dulled: your lusts are rising more slowly, and you feel less amorous towards those you might otherwise find attractive - and it’s harder to rouse the lusts of others. Worst of all, even when someone does manage to turn you on, you can’t be bothered to try and bring yourself off!
 */

public function imbibeVenomEffects(sexed:Boolean = true, combatAttack:Boolean = false):void
{
	if(!combatAttack)
	{
		if(sexed) IncrementFlag("SEXED_MYR_VENOM");
		else IncrementFlag("DRANK_MYR_VENOM");
	}
	//In withdrawal? Do shit
	if(pc.hasStatusEffect("Myr Venom Withdrawal"))
	{
		//Big relapse bump for addiction
		myrAddiction(10);
		//Remove withdrawal
		pc.removeStatusEffect("Myr Venom Withdrawal");
		//Got Yer Fix Via Sex
		AddLogEvent("Ahh, that was just what you needed. Maybe you should come back for more before this dose finishes wearing off next time. Withdrawal sucks.", "passive");
	}
	//Not in withdrawal
	else
	{
		//Addicted? ADD MORE ADDICTION
		if(flags["VENOM_ADDICTION"] != undefined) myrAddiction(5);
		//Bump progress to addiction +5.
		venomProgress(5);
	}
	//Apply status effect if not yet on
	if(!pc.hasStatusEffect("Red Myr Venom")) pc.createStatusEffect("Red Myr Venom",0,0,0,0,false,"Icon_LustUp","The red myr venom coursing through your veins is keeping your cheeks flushed with growing arousal. The longer it lasts, the more your mind gives over to its primal desires...",false,720,0xB793C4);
	//Else add minutes
	else
	{
		//Lengthen status effect to a max of 24 hours.
		if(pc.getStatusMinutes("Red Myr Venom") <= 720) pc.addStatusMinutes("Red Myr Venom",720);
		else pc.setStatusMinutes("Red Myr Venom",1440);
	}
	if(!combatAttack)
	{
		if(!sexed) 
		{
			pc.changeLust(50);
		}
		else pc.changeLust(1);
		if(rand(4) == 0) pc.slowStatGain("libido",1);
		if(pc.libido() > pc.taint() * 2) pc.taint(0.5);
		else if(rand(4) == 0) pc.taint(0.5);
	}
}
//Current progress towards addiction
public function venomProgress(arg:Number):Number
{
	if(arg != 0)
	{
		if(flags["VENOM_PROGRESS"] == undefined) flags["VENOM_PROGRESS"] = 0;
		flags["VENOM_PROGRESS"] += arg;
		if(flags["VENOM_PROGRESS"] > 100) 
		{
			flags["VENOM_PROGRESS"] = 100;
		}
		//If we hit rock bottom:
		else if(flags["VENOM_PROGRESS"] <= 0) flags["VENOM_PROGRESS"] = 0;
	}
	return flags["VENOM_PROGRESS"];
}
//Addiction progress toward "venom slut"
public function myrAddiction(arg:Number):Number
{
	if(arg != 0)
	{
		if(flags["VENOM_ADDICTION"] == undefined) flags["VENOM_ADDICTION"] = 0;
		var original:Number = flags["VENOM_ADDICTION"];

		flags["VENOM_ADDICTION"] += arg;
		if(flags["VENOM_ADDICTION"] > 100) flags["VENOM_ADDICTION"] = 100;
		//If we hit rock bottom:
		else if(flags["VENOM_ADDICTION"] <= 0) flags["VENOM_ADDICTION"] = undefined;
		//Addiction Fading 1
		if(original > 50 && flags["VENOM_ADDICTION"] <= 50) AddLogEvent("The world doesn’t seems quite so drab anymore. Maybe you’re starting to get over your need for the red myr’s pernicious saliva? You give your crotch a needy squeeze, but for all the desire it elicits, you might as well be pinching your shoulder. You’d better <b>find some venom</b>... or wait even longer.", "passive");
		else if(original > 10 && flags["VENOM_ADDICTION"] <= 10) AddLogEvent("A brief fantasy of a busty gold myr, complete with honey-swollen tits, hits you out of nowhere. Best of all, you can actually feel your body responding with a tiny mote of desire. It’s not enough to really get you going, but you must be closer to beating your addiction.", "passive");
		//Addiction Over
		else if(original > 0 && flags["VENOM_ADDICTION"] == undefined)
		{
			AddLogEvent("With a start, you realize that full sensation has returned to your body, and with it, your own desires and fantasies. You’re certain that you could drop trou and start ", "passive");
			if(pc.hasVagina()) ExtendLogEvent("jilling yourself off");
			else if(pc.hasCock()) ExtendLogEvent("jacking off");
			else ExtendLogEvent("fingering your asshole");
			ExtendLogEvent("right here and now if you wanted to. Maybe you should");
			if(!InShipInterior()) ExtendLogEvent(" head back to the ship and");
			ExtendLogEvent(" have a little self-pleasure... to celebrate.\n\n<b>You’ve overcome your addiction to red myr venom.</b>");
			pc.removeStatusEffect("Myr Venom Withdrawal");
		}

	}
	return flags["VENOM_ADDICTION"];
}

public function drankMyrVenom():Boolean
{
	return (flags["DRANK_MYR_VENOM"] != undefined);
}
public function sexedMyrVenom():Boolean
{
	return (flags["SEXED_MYR_VENOM"] != undefined);
}


//Use Text (First Time, non addict):
public function useRedMyrVenom(targetItem:RedMyrVenom):void
{
	author("Savin");
	if(flags["DRANK_MYR_VENOM"] == undefined)
	{
		output("You pull the small pink vial out of your pack and give it a look over. It’s hard to think something so unassuming as a primitive vial of glass full of a thick, viscous pink liquid could be something so potent - and so polarizing - as red myr’s venom. Popping the cork out, and you’re instantly assailed by the sweet scent of the venom. It’s almost like putting your face right next to a big stick of cotton candy, or maybe bubblegum. You try not to think too hard about it as your mouth waters from the smell, and you feel a very faint burn on your cheeks... and elsewhere.");
		output("\n\nYou shake the effects off, breathing out hard as you consider what to do with the bright pink substance. ");
		//if has had venom before from sex: 
		if(sexedMyrVenom()) output("You know it’s a powerful aphrodisiac, after all.");
		//if read RM Codex:
		else if(CodexManager.entryViewed("Red Myr")) output(" You know it’s a powerful aphrodisiac... and highly addictive, too. Maybe that explains why the reds seem so much more uptight than golds about sex?");
		else output(" You’re pretty sure you’ve heard something about it being a biological pleasure-drug!");
		output(" You could drink it, if you were feeling adventurous or need a quick sexual high.");
		//[Drink It] [Put Away]
		clearMenu();
		addButton(0,"Drink It",drinkDatRedVenoShitYooooooo, targetItem);
		addButton(1,"Put Away",putRedMyrVenomAway);
	}
	else 
	{
		drinkDatRedVenoShitYooooooo(targetItem);
	}

}

//[Put Away]
//You’re not drinking that!
public function putRedMyrVenomAway():void
{
	clearOutput();
	author("Savin");
	output("You put the cork back in and replace the vial of red venom in your pack.");
	clearMenu();
	addButton(0,"Next",useItemFunction);
}

//[Drink It]
public function drinkDatRedVenoShitYooooooo(targetItem:RedMyrVenom):void
{
	clearOutput();
	author("Savin");
	showName("DOWN\nTHE HATCH");
	if (!infiniteItems())
	{
		pc.destroyItemByReference(targetItem);
	}
	if(flags["DRANK_MYR_VENOM"] == undefined)
	{
		output("Curious about the effects of red myr venom");
		if(!drankMyrVenom() && sexedMyrVenom()) output(" from anything but the source");
		output(", you bring the vial up to your lips and slosh it a bit, sniffing at the sweet perfume radiating from it. Your cheeks flush almost instantly, responding to the deliciously lusty odor. With a deep breath, you knock back the vial’s contents: the frothy, thick, viscous liquid slowly sloughs out of the vial and onto your [pc.tongue].");
		output("\n\nThe venom is as sweet as it smells, washing down your throat in a tingling, warm wave until the vial’s gone. You let out a long sigh and toss the vial aside, wiping your lips to finish the deal. Your fingers brushing lips sends an unexpected shock of pleasure through you, making you shiver from head to toe. Whew, that stuff’s potent!");
		output("\n\nShaking it off for the moment, you get ready for what promises to be one hell of a lust-high.");
		imbibeVenomEffects(false);
	}
	//Use Text (Repeat, non-addict)
	else if(flags["VENOM_ADDICTION"] == undefined)
	{
		output("You take out the vial of myrish lust-venom and look it over, head already swimming with the memory of your last venom-high. You pop the cork and take a deep whiff of the candy-sweet liquid, already feeling your cheeks flush by the time you’re breathing out again. Nothing this lurid has any right to smell so sweet...");
		output("\n\nTaking another breath to steady yourself, you bring the vial to your lips and swig its contents down in one gulp. Your [pc.lips] tremble at the mere touch of the vial");
		if(pc.hasCock()) output(", and you can feel your [pc.cocks] stiffening");
		output(" in anticipation. The lust-drug goes down easily, leaving your throat and tongue burning with its too-sweet taste... and your whole mouth feels so incredibly <i>sensitive</i> afterwards! You feel every movement of your [pc.tongue] in exaggerated detail, and with trembling pleasure. You’ve barely had time to swallow, and already your body feels like ");
		if(silly && pc.hasCock()) output("a sexual stallion");
		else output("a beast in heat");
		output(". You could probably cum just from <b>giving</b> oral the way you are now!");

		output("\n\nYou move to wipe your lips off, but think better of it. The sensation might be a little much for you right now, after all, and you find yourself licking your [pc.lips] clean. The act still leaves your mouth quivering with pleasure, but at least this way your tongue gets a thrill, too.");
		imbibeVenomEffects(false);
	}
	//Use Text (Addict, not withdrawing)
	else if(flags["VENOM_ADDICTION"] != undefined && !pc.hasStatusEffect("Myr Venom Withdrawal"))
	{
		output("Though your body is still tingling with the supernal sensitivity you’ve come to rely on, you decide it’s time for a re-up. You can’t imagine not feeling this <i>good</i> for a long while longer. Even the air against your [pc.skinFurScales]");
		if(!pc.isNude()) 
		{
			output(" and your clothing rubbing against your [pc.nipples]");
			if(pc.hasCock() && pc.hasVagina()) output(", [pc.cocks], and [pc.vaginas]");
			else if(pc.hasCock()) output(" and [pc.cocks]");
			else output(" and [pc.vaginas]");
		}
		output(" makes you shudder with delight from moment to moment. You can easily imagine getting off so wonderfully hard if you just play with yourself, even for a few scant seconds. Orgasm comes like second nature to you now, and thoughts of pleasure command more and more attention.");
		output("\n\nYou don’t want that to end.");
		output("\n\nYou pull the bottled-up venom from your pack and uncork it with too-eager hands, living the feeling of smooth, polished glass against your tender fingertips - it almost reminds you of a myr’s chitin, in a way. Ah, what you wouldn’t give to have a firm red ant-babe with you right now to feed you your dose the way it’s meant to be gotten: through kisses and licks and loving attention to your groin... but you’ll settle for the vial in a pinch.");
		output("\n\nOnly when you think the word do you realize your hands are already groping at yourself, pinching at your [pc.nipples], desperate for more of the heightened sensations you crave. Without a moment’s further hesitation, you greedily down the venom vial, flooding your mouth with thick pink slime that leaves your whole body burning with desire before you even swallow.");
		output("\n\nYour [pc.tongue] reaches in to get every drop from the vial, cleaning it until it shines like new. You sigh contentedly as the venom takes hold over you once again, spreading out with creeping tendrils of heat and lust. Just the movements of your tongue are enough to send chills down your spine - you know from experience that you could probably get off just by giving oral about now... or better yet, finding a nice, hard red myr’s body to worship, bathing her down in exchange for a few tantalizing tastes of her glorious mouth.");
		output("\n\n");
		if(rooms[currentLocation].planet != "PLANET: MYRELLION") output("You should head back to Myrellion soon...");
		else output("You doubt it’d be hard to find one around here.");
		imbibeVenomEffects(false);
	}
	//Use Text (Addict, withdrawing)
	//Note to self: Make PC autodrink red myr venom if withdrawing
	else
	{
		output("You can’t hold back any longer. The need is too great, all but controlling you by the time you fish a vial of frothy pink venom out of your pack and pop the cork with shaky, numb fingers. You need it so badly... you need to <i>feel</i> again! In desperation, you fumble the vial up to your lips and drink down, gulping the slushing pink goo as fast as it will pour from the tube.");
		output("\n\nThe vial clatters to the ground a moment later, falling from your leaden arms as you’re hit with a sunburst of sensation, more powerful than anything you can remember feeling - and that’s just your [pc.tongue] brushing against your teeth. You breathe hard, running your fingers across your [pc.face] as the familiar, comforting warmth of red venom spreads through you, reawakening your body from its lifeless, husk-like reverie.");
		output("\n\nYour hands roam on auto-pilot across your body, pinching and caressing and fondling every curve and pleasure-point you have.");
		pc.changeLust(100);
		imbibeVenomEffects(false);
		if(!inCombat() && useItemFunction == inventory)
		{
			output(" There’s no way you could stop yourself from masturbating, right here, right now");
			if(pc.exhibitionism() < 66) output(" - and who cares if people watch you? You need relief too badly to care");
			output("!");
			//Force fap!
			clearMenu();
			addButton(0,"Next",masturbateMenu,true);
			return;
		}
	}
	clearMenu();
	addButton(0,"Next",useItemFunction);
}

public function venomExpirationNotice():void
{
	if(!pc.hasPerk("Venom Slut") && flags["VENOM_ADDICTION"] == 100)
	{
		AddLogEvent("No doubt about it, you’re a venom slut at this point. You need the stuff, and even if you didn’t, you’d want it every second of your life. Without it, life is a dull gray mess. With it, you’re an infinitely fuckable receptable for the attentions of the nearest sapient. You’ve gotten so used to having your senses heightened by the myr venom that you can withstand even more lust while you’re under its effects. <b>You don’t think it’s possible to break your addiction any longer.</b>\n\n(<b>Perk Gained: Venom Slut</b> - Gain 35 maximum lust while under the effects of red myr venom.)", "passive");
		if(!pc.hasPerk("Venom Slut")) pc.createPerk("Venom Slut",0,0,0,0,"You’re a total venom slut, raising your maximum lust while on red myr venom.");
		if(!pc.hasStatusEffect("Myr Venom Withdrawal")) pc.createStatusEffect("Myr Venom Withdrawal",0,0,0,0,false,"Icon_LustDown","You’re so used to being under the effects of red myr venom that you’re incapable of getting yourself off alone. You’ll need to find a lover (preferably a red myr) if you want to feel anything at all!",false,0,0xB793C4);
	}
	else if(pc.hasPerk("Venom Slut") || flags["VENOM_ADDICTION"] != undefined)
	{
		AddLogEvent("Fuck! You can feel the pleasant high of your venom receding. Without it, you’re barely interested in sex, let alone living life. You can’t even masturbate like this. <b>You need to get some more red venom!</b> Maybe you could just go the front lines and become a trench-" + pc.mf("husband","wife") + ". At least you’d have access to a steady source. Then, you’d never even need to come down; you could just bump and grind the hours away in sublime pleasure...", "passive");
		if(!pc.hasStatusEffect("Myr Venom Withdrawal")) pc.createStatusEffect("Myr Venom Withdrawal",0,0,0,0,false,"Icon_LustDown","You’re so used to being under the effects of red myr venom that you’re incapable of getting yourself off alone. You’ll need to find a lover (preferably a red myr) if you want to feel anything at all!",false,0,0xB793C4);
	}
	//START ADDICTION!
	//Venom Addiction Alert!
	else if(flags["VENOM_ADDICTION"] == undefined && flags["VENOM_PROGRESS"] == 100)
	{
		AddLogEvent("Oh no. You can feel the color draining your vision and the tingles of erotic ecstasy receding from your limbs, but nowhere so strongly as your crotch. You close your eyes to imagine an attractive partner, and nothing happens. Not even a little ", "passive");
		if(pc.hasCock()) ExtendLogEvent("bit of a boner");
		else if(pc.hasVagina()) ExtendLogEvent(ParseText("bit of warmth in your [pc.vaginas]"));
		else ExtendLogEvent("hot flush of desire");
		ExtendLogEvent(". Shit, you’ve gotten so used to being affected by the red venom that you couldn’t even masturbate if you wanted to!\n\n<b>You’re a red venom addict who needs the stuff just to get off!</b>");
		//Start at 15
		flags["VENOM_ADDICTION"] = 15;
		if(!pc.hasStatusEffect("Myr Venom Withdrawal")) pc.createStatusEffect("Myr Venom Withdrawal",0,0,0,0,false,"Icon_LustDown","You’re so used to being under the effects of red myr venom that you’re incapable of getting yourself off alone. You’ll need to find a lover (preferably a red myr) if you want to feel anything at all!",false,0,0xB793C4);
	}
	//Venom Expires Addiction Warning Numero Dos Equis
	else if(flags["VENOM_ADDICTION"] != undefined && flags["VENOM_ADDICTION"] >= 95)
	{
		AddLogEvent("With every passing second, the red heat of your favorite myr intoxicant is fading, numbing your senses under the drudgery of an unenhanced existence. You’ll have to find more if you want to feel so... sexy and fuckable once more. You might be skirting the edge of a potential addiction, but it’s worth it, right?", "passive");
	}
	else if(flags["VENOM_ADDICTION"] != undefined && flags["VENOM_ADDICTION"] >= 80)
	{
		//Venom Expires Addiction Warning
		AddLogEvent("No! You can feel the heart-pounding high of the red myr venom, leaving the world empty and dull. You’d like another taste of the stuff for sure. You can take a break after the next time. You wouldn’t want to get <b>addicted</b> to it.", "passive");
	}
	//Venom Expires
	else
	{
		AddLogEvent(ParseText(" Your [pc.skin] no longer feels quite so flush"), "passive");
		if(pc.hasFur() || pc.hasScales() || pc.hasFeathers() || pc.hasChitin()) ExtendLogEvent(" beneath your " + pc.skinNoun(false, true));
		ExtendLogEvent(". Nor is it quite so sensitive to the touch. The effects of the red myr venom must be subsiding.");
	}
	//trace("PROGRESS TO ADDICTION: " + flags["VENOM_PROGRESS"] + " ADDICTION SUPERMAX PROG: " + flags["VENOM_ADDICTION"]);
}

//Special Scene: Desperation Oral
//PC is either withdrawing or addicted and not high on R.Venom. Only plays in Kressia or the DMZ. Small chance to play per step.
public function sluttyMcSlutOralBonus():Boolean
{
	if(pc.hasStatusEffect("Myr Venom Withdrawal") && rand(10) == 0)
	{
		sluttyMcSlutOral();
		return true;
	}
	return false;
}
public function sluttyMcSlutOral():void
{
	showName("RED\nMYR");
	showBust("MYR_RED_GUARD");
	author("Savin");
	output("\n\nYour heart feels like it’s turning to stone, slowing down and down. Your whole body feels leaden, even, wanting for the wondrous pleasures you’re so familiar with now. Nothing feels the same anymore, and your thoughts constantly drift towards gorgeous red myr women and their lush, crimson lips... and the treasure within.");
	output("\n\nExcept now, here, surrounded by reds, your fantasies are so much more than that. Temptations. That’s the word. Any of the crimson-clad beauties around here could sate your needs with a kiss, and you find yourself staring at each in turn, your lusts mounting with every passing heartbeat. You can’t take it anymore!");
	output("\n\nA moment later and you’ve grabbed the arm of a passing soldier, a prim and proper-looking young woman with russet curls spilling down her back in a loose ponytail. Her black eyes widen when you grab her, instinctively reaching for the axe on her hip... until she sees the wanton desperation clear on your face. Her expression softens into a mix of concern and pity.");
	output("\n\n<i>“What’s wrong, spacer?”</i> she asks - as if she couldn’t tell! You’re close enough to smell the sweet scent of the drug that’s left you in its stranglehold on her rosy lips. You lead in to get a better taste, nearly pulling the confused soldier into a kiss. Just being so close to one of the living drug factories has your heart racing out of control now, your whole body reacting with growing arousal.");
	output("\n\nRealization dawns on the trooper’s face, and somehow her red-tinted cheeks grow darker. <i>“Woah, you’re not... I’ve never heard of one of you star-walkers getting, um...”</i> she murmurs, looking nervously over your shoulders at the other red troopers nearby. Nobody’s looking at the two of you yet, not that you’d care if the whole world was watching you at this point. Your desire has blocked out any sense of propriety, any lingering pride. You’re nothing but animal instinct and desire now, shameless in your need.");
	output("\n\nYou’d do anything for a hit of her venom, now, and you tell her as much.");
	output("\n\nThe red bombshell chews her lower lip for a moment, thinking, looking between you and the other soldiers nearby. Finally she breaks down and grabs you by the ");
	if(!(pc.armor is EmptySlot)) output("collar");
	else output("shoulders");
	output(", pulling you into the dark embrace of a nearby alley. The next thing you know, you’re pinned against a brick wall behind a dumpster, held in place by the myr woman’s fearsome strength. Her cold, black eyes search over you appraisingly for a moment, before she leans in so close that your lips almost touch and breathes across your face, giving you a hint of what’s to come. You drink deep of the venomous perfume, feeling your body burn in response. It’s so hard to keep yourself from just grabbing her and forcing your [pc.tongue] into her mouth, but you don’t dare offend your benevolent mistress. And she knows it.");

	output("\n\n<i>“You know you’re going to have to earn this, right?”</i> she murmurs, running her chitinous fingers across your ");
	if(pc.isChestGarbed()) output("[pc.upperGarmentOuter]");
	else output("bare chest");
	if(pc.biggestTitSize() >= 1) output(", stopping to cup one of your [pc.breasts]");
	output(". You nod eagerly, letting her caress you in any way she wants. The crimson vixen smiles, pleased by your answer, and with one rough, strong gesture, rips your gear off to bare you to her. You shudder violently as your mistress runs her tongue along your [pc.chest], leaving a trace of pink venom seeping through the [pc.skinFurScales] around your [pc.nipple] in a shockwave of sensation. A whimper escapes your lips as she circles your nipple with a finger, never quite brushing it, teasing you until your [pc.legOrLegs] ");
	if(pc.legCount == 1) output("is");
	else output("are");
	output(" trembling.");

	output("\n\nIf she actually touched you there, you’re afraid - no, you <i>hope</i> - you’d cum. But she doesn’t. The red smiles playfully at you, reaching her other hand up to cup your chin until you’re looking her in the eye.");

	output("\n\n<i>“That’s a taste,”</i> she whispers, taking a step back and releasing you. You slump down, unable to keep yourself standing without her there to support you. The red woman giggles, too girlish and cute for the rough-and-tumble trooper she is, and she hooks her black-plated thumbs through her belt. You watch with wide, eager eyes as she drops her trousers, revealing a pair of smooth, muscular legs and a beautiful pink slit between them. Her clit is a tiny red beacon over her slick lower lips, beckoning you forward.");

	output("\n\nIts owner smiles, putting a firm, black-clad hand on your head and pulling you into her crotch. She purrs a commanding <i>“Get to work,”</i> and spreads her legs just enough to let you plant your cheeks between her thighs. She’s as almost as sweet down here as on those other, darker lips of hers, and the promise of your chemical reward drives your body onto automatic. Your [pc.tongue] rockets out at the first opportunity, lunging between her rosy lips and into the musky, sodden gash between your savior’s legs. She moans, bracing herself against the wall with one hand and caressing the top of your head with the other, telling you what a good " + pc.mf("boy","girl") + " you are between gasps and murmurs of pleasure.");
	output("\n\n<i>“I had - ah! - no idea you star-walkers were such eager little sluts!”</i> she laughs as she hitches one of her legs over your shoulder, trapping you in a powerful vice of amazonian thigh. All you can see, smell, and taste is pussy now: it’s your entire world, save for her soothingly contemptuous voice, putting you in your place as her personal venom-bitch. <i>“Mmm, you remind me of my trench-wives. Maybe I ought to take you back to the barracks and introduce you, hmm? You’d like that, wouldn’t you?”</i>");
	output("\n\nTrapped in her mighty embrace as you are, there’s no way you can respond - but every bone in your body says <i>“YES!”</i> You don’t think you could resist her if she tried to drag you off to join her harem at this point: the promise of her venom is too much! All you can try and do is bring her to climax, to prove your worthiness for a mere myr’s kiss.");
	output("\n\nYour hands grab at the soldier’s ass, fingers clutching at her firm behind and pulling her down onto your thrusting [pc.tongue]. Her sweet slit squeezes down on you, reacting with milking caresses as you find and tease the most tender stretches of her deep channel. Her hips buck against your face, humping your tongue like a ");
	if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("miniature");
	else output("long but slender");
	output(" cock. Her movements become more and more erratic as you eat her sweet little rosebud out, voice growing huskier and more aggressive.");
	output("\n\n<i>“Come on!”</i> she grunts, fucking your face hard and fast. <i>“You can do better! Deeper!”</i>");
	output("\n\nYou whine pathetically, apologetically, desperate for your mistress’s approval. Thrusting as deep as you can, you lick and kiss and suck at every inch of red pussy you can find. Your thumbs brush around her clit, trying to give her more, doing everything you can to bring her even a fraction of the pleasure one kiss would give you.");
	output("\n\nAssailed by your tongue and hands and lips, all working in desperate concert for her pleasure, your scarlet mistress finally reaches her climax in an explosion of sweet juices and pleasured grunts. She bites her lips so hard you expect to see blood, choking back a scream that would have echoed all across town; she makes do with a muted growl and a buck of her hips that shoves your back against the wall and pins you there until she’s nice and finished, and your face is slathered in a thick glaze of feminine slime. You’re covered in her juices, marked like a bitch for anyone to see. You’re hers, if she wanted - and you wouldn’t say no.");
	output("\n\nWith a heavy sigh, your crimson mistress steps back and runs a single black fingers across her twat’s cleft, and the sodden mess you’ve left behind. <i>“Mmm, and you’re even a good lay. Wish I could take you back with me, spacer-slut,”</i> she smiles, leaning down and cupping your splattered cheeks in both hands. <i>“But I think my CO would have me whipped. Might be worth it, to come back to </i>that<i> every night.”</i>");
	output("\n\nYou whimper, desperate, eyes transfixed on your mistress’s treasure-trove of a mouth. She smiles pityingly and leans in, pressing her lips to yours.");
	output("\n\nAnd just like that, your world explodes in a shockwave of almost-forgotten sensation. You moan, going limp in the red myr woman’s hands as her tongue slathers your mouth with her lusty venom: a full and massive dose that leaves your whole face tingling, arousal spreading like wildfire through you. Your desperate needs changes in the blink of an eye, from needing your hit to need her body for an altogether more pleasurable purpose: you need to <b>fuck</b>!");
	output("\n\nBut that’s one reward she won’t give you. Before you can come to your senses, the myr pulls out of your embrace and yanks her pants back up with a contented smile, giving you a pat on the cheek that feels almost like a slap. <i>“See you around, spacer,”</i> she grins, adjusting the rifle slung on her shoulder. <i>“If you don’t find one of us to make you her personal little fucktoy first!”</i>");
	output("\n\nShe gives you a wink and rounds the bend, back onto the street. You sigh and lick your lips, shivering at the forgotten tenderness your venom-highs bring. God damn you needed that... and now you need something to sate your rising lusts.");
	pc.changeLust(150);
	imbibeVenomEffects();
	pc.applyPussyDrenched();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
