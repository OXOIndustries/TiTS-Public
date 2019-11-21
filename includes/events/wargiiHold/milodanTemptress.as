//Temptress
//First Temptress encountered is the special Tuuva version, as long as you have met Tuuva, otherwise Tuuva will not be involved at all.
//Tuuva version has identical stats, but extra attacks.
//Tuuva Version intro

//By QuestyRobotik (QuestyRobo)
//Coded by Fenbono
public function showMiloTemptress(nude:Boolean = false):void
{
	showBust("MILO_TEMPTRESS" + (nude ? "_NUDE":""));
	showName("MILODAN\nTEMPTRESS");
}
public function encounterMiloTemptress():void 
{
	showMiloTemptress();
	author("QuestyRobo");
	if(flags["MET_MILO_TEMPTRESS"] == undefined && flags["WARGII_TUUVA_SAVED"] == undefined)
	{
		addBust(tuuvaBustString());
		output("As you’re walking through the hold, you hear faint footsteps in the distance. You duck behind a nearby rock and get ready to ambush whoever comes by, only to hear a thud and a loudly cursing female’s voice.");
		output("\n\n<i>“Damn it you little mutt! This leash means I own you now, so stop fucking around!”</i>");
		output("\n\nYou peer around the rock, [pc.weapon] drawn, and see the culprit. It’s a milodan female, one with a massive ass and rack stuffed into a skintight bodysuit. Zippers adorn the slutty getup, all placed conveniently as to be able to expose any of her assets, or even remove the suit outright at a moments notice. She’s face down on the ground, apparently tripped up by something, and in her hand is a leash connected to a familiar looking korg.");
		output("\n\nIt’s " + (flags["MET_TUUVA"] != undefined ? "Tuuva":"another korgonne, a fairly small one at that") + ": not just leashed, but bound in a near-full-body gimp suit, covered in small clear domes full of bubbling pink liquid.");
		output("\n\n<i>“Looks like you need some more incentive!”</i> The milodan presses a button on her... codex? It causes " + (flags["MET_TUUVA"] != undefined ? "Tuuva":"the bound korg") + " to cry out against her gag, and the pink liquid bubbles even harder as it drains into her. Her [tuuva.cock] grows painfully hard as she helplessly orgasms on the spot. Time to intervene.");
		output("\n\n<i>“Let her go!”</i> you yell as you step out into the open, [pc.weapon] drawn.");
		output("\n\nShe looks taken aback at first, but quickly develops a huge grin as she wraps herself around " + (flags["MET_TUUVA"] != undefined ? "Tuuva":"the korg") + ". <i>“Look runt, " + (flags["MET_TUUVA"] != undefined ? "it’s your outsider friend!":"it’s another slut for you to mount") + "”</i> She presses her hand against the back of " + (flags["MET_TUUVA"] != undefined ? "Tuuva’s":"the drooling mutt’s") + " neck and with a light slap and a mechanical hiss, the gimp suit falls right off. <i>“Let’s go say hi!”</i> " + (flags["MET_TUUVA"] != undefined ? "Tuuva":"The tiny pup") + " looks at you with wide, unblinking eyes, and an erection that could pierce a cruiser hull. Whatever drugs the cat-bitch gave her have put her completely out of it; hopefully not permanently!");
		output("\n\nYou raise your [pc.weapon] against the milodan slut, determined to ");
		if(flags["MET_TUUVA"] != undefined)
		{
			output("get your ");
			if(!tuuvaLover()) output("friend");
			else output("lover");
			output(" back.");
		}
		else output("free another prisoner from the enemy’s clutches.");
		startTemptressFight(true);
		enemy.createStatusEffect("Has Captive",4);
	}
	//Normal Version
	else
	{
		output("\n\nYour [pc.ears] twitch as you hear a voice off in the distance. It <i>could</i> be friendly, but at this point you know it’s better to be safe than sorry. The voice comes closer and closer as you duck behind a nearby wall. The melodic tone of another slave-catching Temptress is near enough to make the hairs on your neck stand. You try and sneak away before she realizes you’re there, only to jump when a small dart sticks itself in the ground in front of you.");
		output("\n\n<i>“Going somewhere, darling? And here I had so many plans for you. Come, stay a while. I promise I’ll make you enjoy it!”</i> The Temptress cracks her whip and struts toward you. No choice now, you’ve got to put this seductive slut in her place!");
		startTemptressFight();
	}
	IncrementFlag("MET_MILO_TEMPTRESS");
}

public function startTemptressFight(noProcs:Boolean = false):void
{
	var tEnemy:MilodanTemptress = new MilodanTemptress();
	setEnemy(tEnemy);
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatThisMiloSlut);
	CombatManager.lossScene(loseToZeSlutKitten);
	CombatManager.displayLocation("TEMPTRESS");
	//After first one, can get randoz
	if(!noProcs) randomKorgSavingProcChances();
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

//Combat Victory
public function defeatThisMiloSlut():void
{
	showMiloTemptress(true);
	author("QuestyRobo");
	
	var tuuvaTag:Boolean = false;
	if(flags["WARGII_TUUVA_SAVED"] != undefined)
	{
		var allies:Array = CombatManager.getFriendlyActors().slice(1);
		for(var i:int = 0; i < allies.length; i++)
		{
			if(allies[i] is Tuuva) tuuvaTag = true;
		}
	}
	
	if(enemy.lust() >= enemy.lustMax())
	{
		output("The Temptress falls to the ground, too overcome with lust to keep fighting you. She paws at herself, clumsily trying to undo her zippers so she can receive <i>any</i> sort of stimulating contact. A sense of pride wells up inside you as you watch the once-domineering kitty-bitch completely lose herself to your display. She writhes on the ground, twisting and turning as she feels herself up all over.");
		output("\n\nHalf of her zippers fly down as she finally focuses herself. Pounds and pounds of erogenous flesh spill out of every angle of her suit and she works to make sure every newly-revealed inch gets thoroughly groped.");
		output("\n\n<i>“M-my my, you’re f-f... fuuuuck... far more... sensual than these wretched little mutts! In my tribe the victor, through whatever means, takes the spoils. Take me! Pillage me like the " + pc.mf("studly","sexy") + " conqueror you are!”</i>");
	}
	//combat:
	else
	{
		output("The Temptress stumbles to her knees, beaten down hard enough that she can barely stand. Rather than being dissuaded by this, she actually seems like she’s getting off on it!");
		output("\n\nSlowly she starts to undo her zippers, starting with the ones on her breasts. The mewling bitch-kitty unzips one of her mammaries, letting the heavy orb flop out under their own weight. She grabs both of them and starts massaging them, moaning like a bitch in heat the whole time. Her eyes lock onto yours, glaring with the lusty intensity of a close lover.");
		output("\n\nIt’s obvious she’s trying to seduce you, and you’d be lying if you said it wasn’t working. You shift uncomfortably, trying not to be too obvious, but the milodan bitch is too savvy not to take notice. Her mouth twists into a huge, toothy grin as she repositions, presenting her big, shapely ass to you as she undoes the zippers covering her pussy and ass cheeks. Her fuzzy globes bounce as they burst free from their tight confines, and her fat, drenched pussy lips seem to wobble as they’re set free.");
		output("\n\n<i>“You’re liking this, aren’t you? Of course you do! You won, you conquered me and now I’m presenting myself for you! So go ahead, take me you " + pc.mf("studly","sexy") + " beast!”</i>");
	}
	if(enemy.statusEffectv1("Has Captive") == 4) //Tuuva, first time:
	{
		output("\n\nBefore you can worry about that, however, your attention turns to " + (flags["MET_TUUVA"] == undefined ? "the captured korg":"Tuuva") + ". Without the Temptress holding her leash, she’s taken to just jerking off all over herself. She must have blown several loads already if the amount on and around her is any indication.");
		output("\n\nYou walk up and give her a few light shoves, not expecting her to be in any good condition. She cums again, just missing you with her geysering eruptions of spooge. Even more surprising is that she seems to snap out of it immediately after.");
		output("\n\n<i>“" + (!korgiTranslate() ? "S-stupid kitty make Tuuva feel stupid! Where kitty? Tuuva want smash her!":"T-that damn milodan made me look like a fucking idiot! Where did she go? I’m gonna pound that bitch raw!") + "”</i>");
		output("\n\nYou’re not sure how to take that, considering she’s still got a raging hard-on. You put your hand on her chest and tell her to hold off and let you deal with her. She grumbles, but doesn’t have the strength left to fight you on it.");
		if(flags["MET_TUUVA"] == undefined)
		{
			output("\n\n<i>“");
			if(!korgiTranslate()) output("Oh, Tuuva thank friend for saving Tuuva. Tuuva name Tuuva, nice to meet!");
			else output("Oh, thank you so much for saving me. My name’s Tuuva, nice to meet a friendly face!");
			output("”</i>");
			flags["MET_TUUVA"] = 1;
		}
		output("\n\nNow, what are you going to do with the Temptress?");
		
		tuuvaTag = true;
	}
	else if(tuuvaTag) //Tuuva, repeat:
	{
		output("\n\nTuuva glares at the defeated Temptress in equal parts rage and arousal. Even if it’s not the same one that caught her, she’s similar enough that it sets Tuuva off.");
		output("\n\n<i>“");
		if(!korgiTranslate()) output("Tuuva happy help put stupid kitty in place, if " + (!tuuvaLover() ? "friend":"lover") + " want");
		else output("I’d be happy to help put this stupid bitch in her place, if you want me to");
		output(".”</i>");
		output("\n\nA tempting offer. What are you going to do?");
	}
	//no Tuuva:
	else output("\n\nIf that’s not an invitation you don’t know what is. The question now is if you accept.");

	var capacity:Number = enemy.vaginalCapacity(0);
	addButton(0,"Sit on Face",sitOnTemptingKittyFace,undefined,"Sit on Face","The rubberized feline considers herself a domme. See how she likes servicing <i>her</i> betters.");
	//[PussPound] Take the bitch, cat, thing right on down to poundtown! /Requires a dick
	if(pc.cockThatFits(capacity) >= 0) addButton(1,"PussyPound",penisRouter,[chooChooPussyPlowing,capacity,false,0],"Pussy Pound","Take the bitch, cat, thing right on down to poundtown!");
	else if(pc.hasCock()) addDisabledButton(1,"PussyPound","Pussy Pound","You’re too big to fit inside her.");
	else addDisabledButton(1,"PussyPound","Pussy Pound","You need a penis for this.");

	//[Tuuva-Tag] Help Tuuva take revenge on the Temptress. /Available when Tuuva is present (first fight and if she shows up as a helper).
	if(tuuvaTag)
	{
		if((pc.hasCock() && pc.cockThatFits(capacity) >= 0) || pc.hasVagina()) addButton(2,"Tuuva3Some",tuuvaTagTeamScene,undefined,"Tuuva Tag-Team Threesome","Help Tuuva take revenge on the Temptress.");
		else if(pc.hasCock()) addDisabledButton(2,"Tuuva3Some","Tuuva Tag-Team Threesome","You’re too big to fit this scene.");
		else addDisabledButton(2,"Tuuva3Some","Tuuva Tag-Team Threesome","You need genitals for this.");
	}
	else addDisabledButton(2,"Tuuva3Some","Tuuva Tag-Team Threesome","Tuuva isn’t here right now.");
	//[Leave] You’ve got more important things to do.
	captiveRescueButton(5);
	addButton(14,"Leave",leaveBehindDatKorgoTemptress);
}

//Leave
public function leaveBehindDatKorgoTemptress():void
{
	clearOutput();
	showMiloTemptress(true);
	author("QuestyRobo");
	//Tuuva, initial:
	if(enemy.statusEffectv1("Has Captive") == 4)
	{
		output("You decide to walk away from the Temptress, more focused on dealing with the current crisis than sating your lusts. Tuuva feels differently, and you can hear her scream as she pounces on the milodan and begins to have her way with her. You turn around to see her thrusting wildly into the milodan’s kitty cunny.");
		output("\n\n<i>“" + (!korgiTranslate() ? "T-Tuuva catch up later! N-need revenge now!":"I-I’ll catch up with you later! Right now I’m gonna get my revenge on this bitch!") + "”</i>");
		output("\n\nYou just nod and head on your way, letting the two hatefuck in peace.\n\n");
		enemy.removeStatusEffect("Has Captive");
		flags["WARGII_TUUVA_SAVED"] = 1;
		IncrementFlag("WARGII_FIGHTS_WON");
		CombatManager.genericVictory();
		return;
	}
	//Normal:
	else
	{
		output("Rather than give into her, you turn around and walk away. A loud <i>“awww”</i> rings out from the Temptress as she’s denied her pleasure.");
	}
	output("\n\n");
	wargiiFightWinRouting();
}

//Loss Scene
public function loseToZeSlutKitten():void
{
	showMiloTemptress(true);
	author("QuestyRobo");
	//Pussy Petting Bitch
	output("You fall to your knees in front of the Temptress, " + (pc.legCount > 1 ? "unable to keep your [pc.legsNoun] straight with the amount of lust flooding your psyche":"too beaten down to even stand at this point") + ". The curvy Milodan MILF looms over you, contemplating the [pc.raceCuteShort] prize she’s won..");
	output("\n\nYour tongue lolls out, hanging limp in exhaustion, only to be grabbed and violently yanked further out of your mouth by the Temptress" + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? ", who seems a bit taken aback at its length":"") + " <i>“What a lazy little muscle we have here. You outsiders are so undisciplined. Let’s change that!”</i> She yanks you forward by your dangling appendage, putting you face-to-face with her encased honeypot.");
	output("\n\n<i>“Now, undo my zipper.”</i>");
	output("\n\nYou raise your hand up to do so, only to feel her whip crack on your back. She squeezes down on your tongue and presses it against her latex-encased crotch. <i>“With. This!”</i>");
	output("\n\nUnder threat of being whipped again, you try your best to work her zipper down. The spot where she struck you feels odd. It doesn’t sting, and instead there’s a slow, building heat that seeps out into the rest of your body. No doubt she’s pumping you full of some kind of aphrodisiac, but you’re in no place to stop her.");
	output("\n\nAs you ponder that, she notices the lull and gives you another quick strike with her whip. <i>“Focus! I’m gonna have to give you over to the tribe after I’m done with you, and I want you to be good and trained before I do that!”</i> The Temptress delivers another two lashes before grabbing you by the back of the head and pressing you <i>hard</i> into her crotch. <i>“No teeth either!”</i>");
	output("\n\nYou comply and do your hardest to get the offending garment open. However, the skin-tight nature of it proves to be a bigger roadblock than the awkwardness of undoing it with your [pc.tongue]. If you didn’t know any better, you’d assume it was glued in place, with how utterly rigid it is. Every few seconds without progress yields you another disappointed note from The Temptress, followed by another whip-crack against your back.");
	output("\n\nEach strike pumps another load of lust-inducing poison into you. You feel hot, <i>very</i> hot in spite of the frigid temperature around you. It pools inside you like a flowing river, pooling in your back more and more with each strike before slowly, agonizingly dripping into your [pc.crotch]. It’s ingeniously playing havoc with your head, keeping you " + (pc.hasCock() ? "only lightly blueballed":"confused and needy") + ", with the constant feeling that the whole load is going to tip over and break you.");
	output("\n\nFinally you feel the zipper budge, and so does the Milodan. She stops just as she was about to deliver another strike, and coos at you. <i>“There, that’s a good little muscle. Now get the rest down!”</i> She follows through with the hit, this time with some extra kick.");
	output("\n\nYou yelp and jerk, pushing down the zipper by another inch or two as you feel the reservoir of aphrodisiac overflow into your naughty bits.");
	if(pc.hasCock()) output(" Your [pc.cocks] rocket" + (!pc.hasCocks() ? "s":"") + " to full harness in a second, drawing all-important blood from your head.");
	if(pc.hasVagina()) output(" Your [pc.vagina] " + (pc.hasCock() ? "also ":"") + "plumps, growing extremely sensitive and feeling fit-to-bursting.");
	output(" Even your [pc.anus] clenches from the lusty deluge, starting to feel more and more sensitive with each passing second.");

	output("\n\nYou finally get the zipper all the way down, thinking that finally fulfilling her desire will earn you some slack. Her fat mound spills out, soaking wet and steaming against the cold air. That feeling of relief is quickly dashed when you feel a tinge on your [pc.tongue]. As you lap at her lips you begin to feel the same pooling lust as from her whip.");
	output("\n\n<i>“I’ll admit, working with you outsiders has had some very nice perks. Where else could I and my sisters get our own fluids turned into an aphrodisiac potent and plentiful enough to be weaponized?”</i>");
	output("\n\nYou try and pull off, only to feel three strikes land on your back in quick succession. <i>“Keep licking, meat!”</i>");

	output("\n\nCaught between a cunt and a stinging place, you decide to dive in, cramming every inch of your [pc.tongue] into her lust-laced honeypot. Aphrodisiacs seep into your taste buds. The flavor is like piping hot strawberry cream with a tinge of alcohol. It’s a taste that makes you <i>want</i> to keep going, even though you know what it’s doing to you.");

	output("\n\n<i>“Mhmmm. Faster!”</i> The Temptress brings her whip down on you again. At this point you’re full of the stuff that you’re growing numb to it. Most of the blood in your body is trying to migrate down south, leaving you feeling lightheaded as your crotch fills with more and more blood.");

	output("\n\n<i>“Feeling a little out of it? Good, that means you’re doing it right! Now, faster!”</i> She whips you again, egging you on to eat her at speeds only a dedicated fuck-machine could match. You achieve her wet wishes with gusto, pumping in and out with a hungry fervor. You’re practically drunk on her juices at this point, unable to pry yourself from her drugged honeypot even if you wanted too.");
	output("\n\nNo matter how well you work, her whip continues to strike.. The warm feeling from before is starting to become almost searingly hot, sapping the strength from your limbs. Such a thing should be concerning to you, but you’re too far gone at this point to care. Her tunnel clings and throbs erratically, responding eagerly to your ministrations.");
	output("\n\n<i>“Good, gooooooooooooooood! They’re gonna <b>love</b> how quick you learn. Fuuuuuck, you learn real good! Really wish I could just keep you for myself, but I guess I just have to hope they put you up on auction.”</i> She jams her crotch into your face, letting her spiked juices splatter all over you, running down your front and soaking into every pore.");
	output("\n\nYou’re so hot that it almost feels like your [pc.skin] is melting. The lightheaded feeling has progressed to the point where you feel like you’re about to float away. Even your vision is barely coherent, at least when you can keep your eyes open.");
	output("\n\n<i>“Worst thing about this stuff is that it ends the action way quicker than I’d like. Oh well. At least I can get a good one out of you before you’re gone.”</i> She rubs even harder against your face, her inner walls going absolutely wild, almost feeling like she’s trying to rip your tongue out right of your mouth.");
	output("\n\nYou’re nothing but a living sextoy by this point. every ounce of energy has left your body, save for your still-probing tongue, working hard to please the busty milodan bitch.");
	output("\n\nJust when you feel her about to get off, she suddenly pushes you to the ground. <i>“HERE IT COMES, MEAT!”</i> She frigs her thrumming clitty like she’s playing with a light switch in a bad horror movie. Milodan cuntjuice doesn’t spray, it squirts out onto your insensate body with all the precision of bunker buster missiles. She cums and cums, making sure to mark you thoroughly on the off-chance she has a real opportunity to claim you later. The warm splashes of intoxicating girlcum are the last sensation you feel before passing out cold.");
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",wargiiBadEnds);
}

//Win Scenes
//[Sit on Face] Will’s Scene
// Tooltip: The rubberized feline considers herself a domme. See how she likes servicing <i>her</i> betters.
// Available for all PCs, though neuters will lose most of the scene.
// Not for ‘taurs or Nagas.
// No genital selection, it’ll use what the PC has, prioritizing Cock over Vaginas for later variations.
public function sitOnTemptingKittyFace():void
{
	clearOutput();
	showMiloTemptress(true);
	author("William");
	output("Korg’ii Hold isn’t safe right now, but going too long without satisfying your baser instincts would be foolish. The so-defined milodan temptress is a latex-bound sexpot, perfect for anyone’s use. Her body’d shame some of the top earners in a brothel to tears");
	if(flags["FERTILITY_PRIESTESSES_FOUGHT"] != undefined || flags["FERTILITY_PRIESTESSES_FUCKED"] != undefined) output(" not to mention some of the curvy cats you’ve seen elsewhere on Uveto");
	output(".");

	var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
	output("\n\nBlood flows south");
	if(pc.isHerm())
	{
		output(", animating your [pc.cocks] and stretching them ");
		if(!pc.isCrotchExposed()) output("against the material of your [pc.crotchCoverUnder]");
		else output("into raw and ready shape");
		output("; your [pc.clits] aren’t too far behind either, heating up in the anticipatory juices of your [pc.pussyNoun].");
	}
	else if(pc.hasVagina()) output("; a low, hollow ache forms in [pc.clits], plumping those wanton buds up with pulses of heat. [pc.EachPussy] is warming up too, splashing anticipatory juices at the thought of receiving the fallen feline’s service.");
	else if(pc.hasCock())
	{
		output(", giving your flaccid [pc.cocksLight] the shape and rigidity they will need. They ");
		if(!pc.isCrotchExposed()) output("stretch the limits of your [pc.crotchCoverUnder]");
		else output("point like spears at your slutty prey");
		output(", ");
		if(cumQ < 300) output("beading");
		else if(cumQ < 10000) output("spurting");
		else output("squirting");
		output(" [pc.cumColor] pre-seed uncontrollably.");
	}
	else output(", stoking a fire in your belly that spreads to every muscle in your body.");

	output("\n\n");
	if(pc.libido() < 33) output("You have to admit, you would be a fool to pass up this stellar opportunity.");
	else if(pc.libido() < 66) output("You needn’t give the matter much thought. The milodan is living up to her moniker, proving too <i>tempting</i> a prize to ignore.");
	else output("Yeah, there’s no way you could pass up those banging tits, those sweet, sweet hips, or that bratty tongue that’d be better used coaxing out your pent-up lusts.");
	output("\n\nWithout a word, you [pc.walk] towards the defeated domme, a grin etched on your [pc.face]. She stares up, her [enemy.eyeColor] eyes wild with lust. A hint of resentment stains what would otherwise be two gleaming gems reflecting her acceptance of the new status quo. The savage cat’s long, feral tongue hangs from her mouth in supplication. Warm puffs of oxygen promise you relief from the cold and your desires. " + (enemy.lust() < enemy.lustMax() ? "After the beatdown you gave her":"After your overwhelmingly erotic assault") + ", her masturbatory thrashes morph into submissive writhing.");
	output("\n\n<i>“Why do you stand around, you flippant subjugator!”</i> the leopardess groans in the frigid air. <i>“You’re not... You can’t be in control! My body is meant to make " + (pc.tallness <= 66 ? "little":"big") + " " + pc.mf("","she-") + "studs like you into horny pets! Breed me - stake your claim on me!”</i>");
	// PC Bimbo
	if(pc.isBimbo()) 
	{
		output("\n\nAw, she’s so eager! <i>“Don’t mind if I do!”</i> you say, " + (pc.legCount > 1 ? "[pc.legsNoun] on either side of her head":"[pc.legNoun] on her shoulder]") + ", bringing your [pc.ass] into full view. You can hear the titty-kitty gasp in surprise, your ");
		if(pc.hasScales()) output("scaly ");
		else if(pc.hasFur()) output("furry ");
		else if(pc.hasChitin()) output("smooth ");
		output("backside shining in what light there is.");
	}
	// PC Bro
	else if(pc.isBro())
	{
		output("\n\n<i>“So I will,”</i> you grunt, stepping over the titty-kitty, " + (pc.legCount > 1 ? "[pc.legsNoun] on either side of her head":"[pc.legNoun] on her shoulder]") + ", occupying her sight with your [pc.ass]. A shocked gasp escapes her stubborn lips: a reverent, expectant hiss of excitement.");
	}
	// PC Kind
	else if(pc.isNice()) output("\n\n<i>“If you don’t mind, then I’ll do just that.”</i> You smirk, planting your " + (pc.legCount > 1 && pc.hasFeet() ? "[pc.feet] on either side of her head":"[pc.legNoun] over her shoulder") + ". The litany of moans and curses stops when your [pc.ass] dominates her view, shining in the dim light.");
	// PC Misch
	else if(pc.isMischievous()) output("\n\n<i>“My " + (pc.legCount > 1 && pc.hasFeet() ? "feet are":"[pc.legNoun] is") + " killing me,”</i> you bluntly state, cracking your neck as you stand directly over the grousing leopard-woman. <i>“Good thing I’ve got the best, warmest seat in the house.”</i> Her voice fades in the shadow of your [pc.ass].");
	// PC Hard
	else output("\n\n<i>“You’re right. You’re just a pathetic bitch drunk on unearned power. This is all you’re good for now, slut,”</i> you bark, silencing her with your dominant voice and the pervasive view of your [pc.ass].");
	// Merge
	output("\n\n" + (pc.hasKnees() ? "Bending your knees, y":"Y") + "ou gingerly lower your butt onto the cat-woman’s muzzle. A sense of childlike glee disrupts the speed of your descent");
	//, cockOrVaginaClothed:
	if(pc.hasGenitals() && !pc.isCrotchExposed()) output(", particularly with how desperate " + (pc.hasCock() ? "[pc.eachCock]":"[pc.eachPussy]") + " is to escape its comparably seething confines");
	output(". Half-way down you grab her tits, one unzipped and the other still locked away, using those celestially soft pillows " + (!pc.isCrotchExposed() ? "as a prop-up while you expose your nethers":"as cushions for your slide into pleasure") + ".");
	output("\n\nHer lusty paws shoot up to grip your [pc.hips], but you slap them away and grip her jaw, clamping it shut. A rumbling growl vibrates your palm just moments before her wet nose touches your taint. The top of her elongated face slides up your crack and the bottom half settles between your inner thighs");
	if(pc.isHerm()) 
	{
		output(", her tongue having nowhere to lay but on the " + (pc.hasPlumpPussy() ? "chubby ":"") + "lips of your flexing [pc.pussyNoun]");
		if(pc.balls > 0) output(", the tip juggling the musk-drenched underside of your dangling nut" + (pc.balls > 1 ? "s":""));
	}
	else if(pc.hasVagina()) output(", her tongue having nowhere to lay itself except for the inviting" + (pc.hasPlumpPussy() ? "ly chubby":"") + " folds of your winking [pc.pussyNoun]");
	//
	else if(pc.hasCock())
	{
		output("; her flat tongue slides into your musky crevice, the lengthy tip ");
		if(pc.balls > 0) output("lapping at the underside of your churning nut" + (pc.balls > 1 ? "s":""));
		else output("lapping hungrily at your [pc.base]");
	}
	else output(", her tongue having ample space to move in your joyless nether regions");
	output(". Your ");
	if(pc.buttRating() <= 7) output("shapely");
	else if(pc.buttRating() <= 14) output("thick");
	else output("wobbly");
	output(", clenching ass-cheeks massage the bridge of her nose while your thighs slide down, wedging her head deeper into the sweaty cleft of your bottom.");
	output("\n\nHer resistance fades seconds after you shift all your weight to your waistline with a long, contented sigh, delighting in the servile wetness on your [pc.skinFurScales].");
	// PC herm (add-on, no new pg)
	if(pc.isHerm())
	{
		output(" Dragging a [pc.finger] over your [pc.cockHeadBiggest] and then through your sopping [pc.pussyColor] slit, you gather a heady mixture to wipe on her tongue and around her lips like some sort of sexual lipstick. You do this again, and again, until the horny minx is lapping at your ambrosial digit of her own volition. The divine taste of your hermaphroditic sex spurs her into fulfilling her purpose as a transient concubine.");
	}
	// PC vagina (add-on, no new pg)
	else if(pc.hasVagina()) output("Humping and grinding your [pc.pussy] into her face, you achieve a selfish and tiny orgasm. The conquered cat’s thoughts are flushed washed away by a warm, dewy coating of delicious pussy-juice. You rake a [pc.finger] between your " + (!pc.hasPlumpPussy() && !pc.hasVagina(GLOBAL.TYPE_EQUINE) ? "silky":"fat, rubbery") + " folds, collecting a superheated dollop of [pc.girlCumNoun] that you apply to the milodan’s lips like some sort of sexual lipstick. You do this again, until she instinctively laps at your blessedly warm digit, spurred by your taste into accepting her place as your slit slut.");
	// PC cock (add-on, no new pg)
	else if(pc.hasCock()) 
	{
		output("\n\nRocking back and forth");
		if(pc.balls > 0) 
		{
			output(", you smear your ");
			if(pc.ballDiameter() < 2) {}
			else if(pc.ballDiameter() < 4) output("weighty");
			else if(pc.ballDiameter() < 6) output("heavy");
			else output("tremendous");
			output(" ball" + (pc.balls > 1 ? "s":"") + " back and forth over the milodan’s face");
		}
		else output(", you press [pc.eachCockHead] into the valley of the milodan’s bosom");
		output(", insistently coaxing out a few wads of pre that you collect on a [pc.finger]. Taking her by surprise, you paint the slut-cat’s lips with your [pc.cumColor] preseed like some sort of sexual lipstick. Your tangy musk breaks her silent spell, and in her hungry licks for more she indicates to you just how ready she is to be your concubine, fleeting as her new, phallic-obsessed title may be.");
	}
	// PC neuter (add-on, no new pg)
	else
	{
		output("\n\nYou chew and lick at your lips, that tongue darting for genitals not there. A low, mewling whine follows until you slide forward, letting her have a taste of your [pc.asshole]");
		if(pc.hasPlumpAsshole()) output("; her tongue finds it as easy to please a pussy, what with you having a sensitive mound of obscene, protruding anus-flesh");
		output(".");
	}
	// Merge
	output("\n\n<i>“");
	if(pc.isBimbo()) 
	{
		output("I knew you’d love the taste, sweetie! Just had to let ‘ya test the water.");
		if(pc.hasVagina()) 
		{
			output(" Pussy’s great");
			if(pc.hasCock()) output(", but I bet you love dick even more!");
			else if(pc.hasVagina()) output(", and you’re gonna love my taste, I just know it!");
		}
		else if(pc.hasCock()) output(" You’re gonna fall in love with the taste of my dick!");
	}
	else if(pc.isBro()) output("Consider yourself claimed. For now.");
	else if(pc.isNice()) output("Looks like your wish was granted. Let’s see if it’s what you wanted, though.");
	else if(pc.isMischievous()) output("Now this... I could get used to this. One of the perks of owning a bitch right here!");
	else output("You’re going to be my chair for a while. It’s up to you if anyone else can sit here later, though.");
	output("”</i>");
	processTime(15);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",sitOnTemptingKittyFace2);
}

public function sitOnTemptingKittyFace2():void
{
	clearOutput();
	showMiloTemptress(true);
	author("William");
	output("You rise, finally giving the would-be domme a chance to breathe. Looking down, you can see her gloved fingertips lurching, wanting so badly to take possession of what’s on offer. ");
	if(pc.isHerm()) output("You can see her eyes locked unerringly to your [pc.cocks], but every time [pc.oneClit] throbs, her gaze naturally diverts to your juicy cuntlips.");
	else if(pc.hasVagina()) output("Her vision doesn’t stray from the enticing shine of your cunt" + (pc.hasVaginas() ? "s":"") + ", the [pc.clits] adorning " + (!pc.hasVaginas() ? "it":"them") + " throbbing with greater frequency");
	else if(pc.hasCock()) output("There’s nothing you could do to divert her attention from your [pc.cocks]. They’re locked on unerringly, not even blinking." + (pc.balls > 0 ? " When your [pc.sack] twitches heavily, she gasps and shudders, perhaps expecting you to cum.":""));
	else output("<i>“You have only " + (pc.ass.wetness() == 0 ? "a dry ":"an ass") + "hole, outsider! What do-”</i> You slap her chin.");
	output(" <i>“Get to it!”</i> you shout, and her neck propels upwards like a launched rocket, smashing her nose into your ");
	if(pc.hasVagina()) output("[pc.pussy]");
	else if(pc.hasCock()) output((pc.balls > 0 ? "[pc.balls]":"[pc.base]"));
	else output("[pc.asshole]");
	output(" with enough force and stimulation to draw a moan from your lungs.");

	output("\n\nHead swimming from her aggressive motions, you groan into the air");
	if(pc.hasVagina()) output(", the stretching of her oral organ around your [pc.clits] playing havoc with your nerves");
	else if(pc.balls > 0) output(", the wrap of her oral organ around " + (pc.balls > 1 ? "each":"the") + " orb in your cumpouch drawing you closer to soft release");
	output(". You can’t let her have the fun, you’re on top around here!");

	output("\n\nYou push up off her chest, or try to, only losing your hands into crisp and rubbery tit. With a huff, you fidget with the second stubborn zipper - <i>why the fuck is this suit so tight?</i> - yanking it down... and then tangling with a third fastener, unveiling... no, <i>spilling</i> her massive chest " + (pc.hasCock() ? "to the instant, erecting satisfaction of your [pc.cocksLight]":"to further abuse") + ". She has enough warm boob to obscure her entire body depending on the angle. Enough that you could appreciate them from every angle and use them as heartbeat-laden pillows.");
	output("\n\n<i>“Maybe I should keep you!”</i> you marvel at the immense amount of light-furred titty on display. <i>“You’d keep me warm in the winter!”</i>");
	output("\n\nLeaning forward, you cup one of her enormous black nubs, thick as the average man’s thumb, and then the other. Your [pc.tongue] dips into the saucer-shaped areolae and then the hills of her fur-creasing teats. There’s no milk to be found inside her glistening, heaving breasts, though considering what toys this upjumped cat’s carrying you’re not confident it’d be safe for your consumption. Lust-fattened nipples taunt you into biting down and sucking. What the latex-flavored texture does to your [pc.tongue] reinforces that provocation. Tight, jutting tits shimmer in light of your appreciations, glowing in molten bliss.");
	output("\n\nHer salivating tongue slips in and out of your " + (pc.hasVagina() ? "vaginal":"anal") + " interior, pumping your " + (pc.hasVagina() ? "cunt":"colon") + " with its uniquely rough edges, traversing your rippling extremities with surprisingly intimate knowledge. There’s no other way to describe how she’s fucking your " + (pc.hasVagina() ? "[pc.pussy]":"[pc.asshole]") + " with such ease.");
	output("\n\nThis sapient cat-domme must have spent no small amount of her life uncovering ways to please others. You realize that you may be the only one to ever enjoy these ministrations without the caveat of becoming her depraved toy." + (pc.libido() >= 66 ? " Part of you thinks, however, that scenario wouldn’t matter one bit if she could do this to you every day.":""));
	output("\n\nPrickling flesh massages your sensitive innards, those tiny spines lending her an exotic means of worship. She purrs in delight when thrusting it deep, opening her muzzle wide to invade the furthest corners of your " + (!pc.hasVagina() ? "cavern":"satiny tunnel, seeking out the tastiest drops of feminine passion and withdrawing to let it all drain down her throat") + ".");

	// PC suula or aphrodisiac pussy
	if(pc.hasVagina() && (pc.vaginas[0].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.vaginas[0].type == GLOBAL.TYPE_SUULA))
	{
		output("\n\n<i>No better time,</i> your venom-loaded tendrils must be thinking: the tiny stingers and short tentacles lash at their venusian invader’s flesh, chucking loads of lust-spiking venom through her system. That spit-smattered maw gets wetter, and the hapless korg-napper underneath can only moan and shriek at all the new sensations bombarding her addled senses.");
	}
	// Merge
	// PC is Herm or has Vagina
	if(pc.hasVagina())
	{
		output("\n\nBarbed tongue slaps against your abusable cunt");
		if(pc.hasVaginas()) output(", and then the other" + (pc.totalVaginas() > 2 ? "s":""));
		output("; the tigress flicks her neck upward and combs your kitty (quite literally) with squishy alien muscle. The predator makes her moves, pushing hard and licking to the sky then using the plush underside to lap softly back, mopping your cunt with alternating, animalistic strokes. She tickles at your engorged [pc.clit] with a slowness that makes you shiver to your knees, enjoying all of its magnificent detail.");
		if(pc.balls > 0)
		{
			output("\n\nThose ministrations aren’t exclusive to [pc.eachPussy]. The ");
			if(pc.ballDiameter() < 3) {}
			else if(pc.ballDiameter() < 7) output("taut ");
			else output("straining ");
			output("sack pooling across her pointed chin receives as much attention, if not more. The captive cat inhales " + (pc.balls > 1 ? "one of your nuts":"your nut") + ", planting it to the flat of her tongue at the center of her oral altar, squeezing and suckling at it like a cum-filled jawbreaker.");
		}
		output("\n\nThe heavy thickness of the tribal woman’s inhuman tongue slides in reverse, switching up her expert rhythm, splitting your crotch in half with her uniquely pleasurable take on cunnilingual persuasion. Arcs of pleasure twirl around your spine, exploding inside your head and dispersing throughout your muscles in shudderingly satisfying quivers. Her masterful maneuvers make it almost impossible to think about anything except the gigantic titties in front of you...");
		output("\n\nWiggling left and right, you tap [pc.oneClit] to the feline’s nose, suffocating her in the heat of your pheromonal furnace. That tongue dances back out, licking and licking, filling her moist nostrils with [pc.girlCumFlavor] runoff. Two rough fingers grip your clitoral extension" + (pc.totalClits() > 1 ? "s":"") + ", tweaking, pulling, forcing you to thrash at the indelicate pressure. Your miniature spasm has her nose deflecting off your lube-slathered button, booping the subby slut on her nose.");
		output("\n\nSee, you can be friendly when you want.");
		output("\n\nSlaking her thirst on ");
		//wetness:
		if(!pc.isSquirter()) output("occasional streams");
		else if(pc.girlCumQ() < 5000) output("unceasing waves");
		else output("lurid tides");
		output(" of mound-soaking girljuice, your milodan redoubles her efforts, drenching your lower half with feral speed, not content with giving you one or two orgasms.");
		if(pc.hasCock()) output(" Shifting some weight back, you stroke your [pc.cocksLight], making sure she gets a hand around " + (!pc.hasCocks() ? "the":"one") + " shaft");
		output(". The supine pussy cries out in pure, delirious need, her fingers working their hardest on your ");
		if(pc.hasCock()) output("gloriously rigid male-half");
		else output("ecstasy-imbued clitty");
		output(", lost in a haze of unthinking desire.");
	}
	// PC has Cock or is Neuter
	else
	{
		output("\n\nThe feline fancies your [pc.asshole], content to swab your [pc.ass] and your buttcrack with spit, flicking upwards and traveling down. Barbed flesh slaps against [pc.skinFurScalesNoun], leaving crystalline ropes behind to be mopped up by fluffy cheek. " + (pc.hasPlumpAsshole() ? "Your excess of anal-ring gets the most attention, clenching tight in delight when the skillful domme’s tongue wanders over it. The texture must be to her liking, as she polishes your donut to a mirror shine seconds after.":"Your anal entrance is worshiped just as well as a pussy, clenching tight in delight when the skilled domme’s tongue threatens to lunge inside.") + " You groan outwards when she travels down with the smoother underside, undoing the lingering prickles of her alien muscle.");
		output("\n\nNowhere in your nether-crevice is left unlicked. You moan in comfort and arousal, grinding back and forth on the slut-cat. Twitching ears fan the warmer spots of your well-suckled rear. Heat builds inside, encouraging you to move faster, to give her even more of your body to work with. It’s something you do happily, easing her restraint for good behavior, and then a little more for admirable submissiveness.");
		if(pc.hasCock()) output("\n\nHer hands come up from either side to pay tender respect to your [pc.cocks]. She doesn’t need to see, only feel. Your swelled veins are easy trails for her furry fingers to follow, tracing a web of pleasure up down and around your dick" + (pc.hasCocks() ? "s":"") + " that bring you to lightheadedness. It’s only the tongue below, and the cumslit-teasing fingertip, that keep you alert and content with your place as her [pc.master].");
	}
	// Merge
	// Balls
	if(pc.balls > 0 && pc.hasCock())
	{
		output("\n\nOnce she’s given your " + (pc.hasVagina() ? "hermaphroditic ":"") + "nook the respect it deserves, that tongue, and all of its associated features, nestle deep into your sumptuous sack. The breaths you allow her to take are filled with your sweat and ballmusk. She licks up and down your [pc.balls], ");
		if(pc.ballDiameter() < 4) output("curling her feral organ around the diameter of your pouch");
		else output("struggling to curl around the hefty diameter of your pouch");
		output(". Needy groans ripple through your saliva-soaked nad" + (pc.balls > 1 ? "s":"") + " which even now grow fatter with a heavier load of [pc.cumNoun].");
		output("\n\nYou allow her hands to close in, and her fingers show a surprising amount of restraint. She kneads and fondles your virile fruits, building a tender tightness within your testicular core. It’s the familiar sensation of nearing orgasm. Swabbing the underside of your burgeoning cum-factories, her tip heads up to tease your [pc.base] shortly after. Your balls look and <i>feel</i> so much larger now.");
		output("\n\nDominated in combat and now dominated by your maleness, she can only ponder how densely packed with cum they must be... and lamenting the fact she’s not receiving her new [pc.master]’s seed in a more traditional manner.");
	}
	var dick:Number = pc.biggestCockIndex();
	// Merge
	// PC biggest cock <=8 inches
	if(pc.hasCock())
	{
		if(pc.cocks[dick].cLength() <= 8)
		{
			output("\n\nDespite the size of her chest, you can’t risk sticking your modestly-sized dick between the temptress’ tempting tits " + (!pc.hasVagina() ? "without giving her a faint chance to turn the tables":"without losing the stimulations on your wet and lust-infused pussy") + ".");
			output("\n\nThat’s fine, because her mouth is the next best thing. You sit up and lean forward slightly, swiveling your hips and directing your [pc.cock " + dick + "] into her slavering maw. Pre dribbles freely as you burrow in; her gleeful tongue is half-pinned on your passage to her throat, the rest sticking out. Cheeks hollowing, she slurps it all out without hesitation, treating your dick as little more than a glorified straw. The squelching undulations against your shaft bid your hips to squirm around on rhythmic autopilot.");
			output("\n\nKneading her heavenly boobs you rise and fall, plunging balls deep into her throat and struggling not to unload. Your [pc.cockType " + dick + "] shaft has little difficulty conquering her clenching muscles and flattening out their decadent ridges.");
			if(pc.balls > 0) output(" Her nose ends up buried in your ball" + (pc.balls > 1 ? "s":"") + "; the soft, vulnerable skin engraves your unique signature on her animal brain.");
			//suulaOrAphroDick:
			if(pc.cocks[dick].cType == GLOBAL.TYPE_SUULA || pc.cocks[dick].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) 
			{
				output(" The tendrils lining your alien mast ");
				if(pc.hasVagina() && (pc.vaginas[0].hasFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || pc.vaginas[0].type == GLOBAL.TYPE_SUULA)) output("further ");
				output("drain her mind of coherency, lashing at pretty nerves and stinging her palate with liquid lust, making your swampy trip even easier.");
			}
			output("\n\nWhen you slide into her neck now, your [pc.cockHead " + dick + "] brushes her tonsil before replacing her adam’s apple with its perverse shape. That’s the spot you aim for on every descent. Convulsing neck-muscles arrest your thick phallus when you take too much from her, but you can hardly be blamed for that. The frictious massage against your urethral lips spreads them a bit wider, enabling you to vent more masculine pressure into her subservient suck-hole.");
			output("\n\nYour prey strokes your [pc.thighs] tenderly while you hump away at her jaw with slow, tentative gyrations, brushing her teeth, jerking left and right between her cheeks. You’re spurting so much pre that it’s coming back up on her strained gurgles, rinsing her taste buds and turning her flipped mouth into a slippery waterpark that very few dicks will have a problem participating in.");
			output("\n\nWith her O-lips hugging just below the [pc.base " + dick + "], you pull back and explore her warm muzzle. Left - you bulge her cheek outwards; right, you bulge it obscenely this time, biting into your lip on the verge of climax before plugging in and making her gag once more.");
			if(pc.hasCocks()) output(" Your unused member" + (pc.cockTotal() > 2 ? "s flop":" flops") + " around almost uselessly. " + (pc.cockTotal() == 2 ? "It drools":"They drool") + " drool cummy [pc.cumColor] pre that mats her fur in lewd lines, giving the korg-napper a ruined makeup look that the galaxy loves on slutty porn stars.");
		}
		// PC biggest cock >=8 inches
		else if(pc.cocks[dick].cLength() < 35)
		{
			output("\n\n[pc.EachCock] " + (pc.cocks.length == 1 ? "is" : "are") + " dangling helpless, little more than " + (!pc.hasCocks() ? "a lever":"levers") + " your bottom bitch can tug " + (pc.hasVagina() ? "on for an extra helping of cuntjuice":"and stroke") + "; however, with tits as big as hers, and " + (pc.hasCocks() ? "dicks":"a dick") + " as long as <i>yours</i>, it’s a simple matter to put those cushions to work. You move her wrists to the side, freeing up the space you need. You get her mouth and her tits. What could be better?");
			output("\n\nThe pressure on your swollen erection elicits a groan when you push it down and scoot forward. Your [pc.cockHead " + dick + "] glides through the pre moistened channel of her mammoth mammaries, throbbing demandingly against her ribcage. The sudden soft compression around your bitch-taming meat coaxes out greater loads that develop into gooey [pc.cumColor] pockets and burst out from the mammarian seam.");
			output("\n\nA neurological need to remain on your throne builds deep down. Trading your balance to stay here until you cum somehow becomes a mental quandary your brain conveniently fails to solve.");
			output("\n\nYou rock back and forth, making sure your milo-slut is ");
			if(pc.hasVagina()) output("munching more box");
			else if(pc.balls > 0) output("tending your teste" + (pc.balls > 1 ? "s":"") + " rather");
			else output("working more");
			output(" than sucking air. Curvy ass-cheeks ruffle her head of hair, blinding her with sweaty fluff and [pc.skinFurScalesNoun] while your [pc.cockNoun " + dick + "] explores her euphoric, bosomy paradise. While she attempts to please you, she fills her breaths with as much of your musk as possible.");
			output("\n\nWhile your waistline wiggles, her arms come up and around to cup her breasts together in a show of acquiescence, providing you - her conqueror - the fullest effect of her sublime, prick-pleasing chest. The buzz of dominant desire brings a smile to your face, especially when you imagine how good she’ll look drenched in cum. <i>Your cum.</i> All of a sudden you want to bathe her in sperm, let it soak into her fur, and permanently mark her in your scent so that nobody else will ever want to touch her.");
			output("\n\nCleavage too big to be legally contained bounces around your dick while you howl in delight. You heave back and slam in, nearly allowing her to surface from below your [pc.ass].");
			if(pc.balls > 0) output(" Your ball" + (pc.balls > 1 ? "s swing":" swings") + " forward just far enough to clap into the topside, able to do so only by you pulling " + (pc.balls > 1 ? "them":"it") + " towards her spit-drenched chin");
			output(". These bombshell tits offer up so many ways to play with her. More jiggle than firm, it’s hard to keep them stable even with her help. You’re stuffed in there so deep that you can feel her heartbeat through your burgeoning [pc.cockHead " + dick + "].");
			if(pc.hasCocks())
			{
				output("\n\nBattering away at her brings you nearer to the release you crave, but only one dick is getting attention. It’s time to fix that. You raise yourself on your haunches, grunting over her gasps for air. She doesn’t get long before you direct " + (pc.cockTotal() == 2 ? "your extra dick":"another of your dicks") + " down and into her swampy maw, pinning her feline tongue and sealing her throat shut. She gags straight away");
				if(pc.balls > 0) 
				{
					output(" while the top of her nose disappears into your ");
					if(pc.hasScales()) output("scaly ");
					else if(pc.hasFur()) output("furry ");
					output("nutsack");
				}
				output(".");
			}
		}
		// PC biggest cock Hyper (Fen Decide Volume)
		else
		{
			output("\n\nHefting your [pc.cock " + dick + "] is a difficult task while it responds to the feline’s assiduous attention and the promise of a place between stiff nipples and wonderfully soft tits. Rapid heartbeats add inch after inch to your sensitive dick, swelling it into a size much too grand for any of this kitty’s orifices - save one. You can hardly keep your battleship on course, its angry throbs bouncing it skyward and carrying you up with it like a reverse see-saw.");
			output("\n\nBut the only sawing you intended to do is between her cock-devouring boobs. Grunting and groaning, you push your slab of a boner down and slam it to the warm channel between her boobs, spreading them then smushing them into a tight, dick-pleasing squeeze. The impact of your cleavage-claiming cock shocks her body into a skyward lurch. Deliriously aroused, you arch back and limp forward on your knees, totally unprepared for so much stimulation on your [pc.cockType " + dick + "] totem.");
			output("\n\nPre doesn’t spurt on your initial thrusts, it squirts. Your urethral passage has spread wide enough that if she were on her knees you could slide her nipple into it, back up all the pre inside, then let it all out to drench her. Your upper body twists and turns in overaroused excitement, half-giggles chasing all the flinging sexual juice. Fantasizing about ways you could use her body for personal comfort excites you beyond raw fullness. It’s almost a shame, you think, that she’s not getting a good taste of it.");
			output("\n\nSo much fluid pours out of you that the milodomme looks like she just emerged from a lube-shower. There’s a strangely orgasmic feeling to what you’re doing: dribbling curtains of goo all over her and making it easy to fuck her [pc.cockNoun " + dick + "]-engulfing tits like a pussy. Her hands come up to the side, cupping those gorgeous mounds together in a show of pliant acquiescence. Even with her help, the ratio of jiggle to firmness has them flopping wildly around your aggressive reaming.");
			output("\n\nShe can’t see an inch of your turgid dick, but deep down, she knows how big it is. How much of a monster it is. How much she doesn’t want it to go anywhere else. How much she wants it all for herself. Latex-wrapped thighs launch and lock around the far end of your prick, all the cock slime you’ve leaked letting your thickened girth fuck her thigh-gap as pleasurably as you plow her tits.");
			output("\n\nMoaning in mindless bliss, you hump away. You become rational only to adjust your angle downward. Your [pc.cockHead " + dick + "] ‘pops’ out of the underside of her curvy chest with an exaggerated squelch of jizz-soaked fur against humping [pc.cockNoun " + dick + "], fucking the dizzyingly warm proximity of her crotch. Sanguine crotch-air adds a third and overwhelmingly erotic element to the climate stimulation. The top is cold, the bottom is warm, and the end is an orgasmic blast furnace!");
			output("\n\nNobody else could be packing the right kind of dick to tame this oversexed kitty-cat, something stupidly huge to match the jaw-dropping curves of your partner. The underside of your glans, where spunk-vein meets iron-hard cocktip, is massaged by the swollen milo-cunt outlined against another zipper. The metal’s coldness does nothing to extinguish the carnal heat in your body-taming cock, nor does it do anything to dull the warmth of her soaking prick-mitten.");
			if(pc.hasCocks() && pc.smallestCockLength() <= 8)
			{
				output("\n\nThanks to having a little extra, you do give your cat a fancy treat, sliding " + (pc.cockTotal() > 2 ? "one of your extra dicks":"your extra dick") + " through her mouth, gagging her while you avail yourself of her wobbling sugarmounds. On the outstroke her tongue traces your slotted [pc.cock " + pc.smallestCockIndex() + "], and on both her tits are working wonders on your diamondback dong.");
			}
		}
	}
	// Pussy or Neuter (don’t use if PC has a dick)
	else
	{
		output("\n\nYou shift your ass back and forth, taking a more controlling position atop her neckline and exposing the full measurement of " + (pc.hasVagina() ? "[pc.eachPussy] and ":"your ") + "[pc.asshole] to the fuck-drunk temptress. Furry, padded palms rise to rub at the fat of your [pc.ass], rubbing circles into your ");
		if(pc.buttRating() < 7) output("petite");
		else if(pc.buttRating() < 12) output("vast");
		else output("jiggly");
		output(" expanse that shift to your [pc.hips].");
		output("\n\nReverence is rewarded with another faceful of " + (!pc.hasVagina() ? "ass":"muff") + ", and you smother her again, pushing back down until she’s lapping at your " + (pc.hasVagina() ? "vulva":"sphincter") + ". Enjoying her every motion, you buck your hips after a powerful spike of pleasure, capturing her nose a few inches into your " + (pc.hasVagina() ? "[pc.pussyNoun]":"anus") + " and carrying her muzzle on your newfound waves of miniature orgasm. At this point you’re just humping her face with your ass while yanking on her tits." + (!pc.hasVagina() ? " Sweat":" [pc.GirlCumNoun]") + " spills down her nostrils as she yanks free, throwing beads of sexual runoff when she does... then doing it all over again!");

		// Clitdick
		if(pc.hasVagina() && pc.clitLength >= 6)
		{
			output("\n\nThe way her breasts jiggle this close to your clitoral fuckpole gives you one hell of an idea. You pull those unfirm globes towards your crotch and thrust outward, wrapping as much milo-boob around its unnatural length as possible. Nerves never meant to grow so large explode in the searingly warm compression of furry titflesh. Your enormous [pc.clit] manages to shove half of itself into the devouring canyon of her chest before you have to pull away from the raw sensation. Anymore intense pressure on your achingly sensitive muscle would have driven you into unconscious release.");
		}
		// Merge
		output("\n\nShe eats away, puddling the entire space of her tongue with " + (!pc.hasVagina() ? "perspirant":"girlmusk") + " and gulping it down, tilting her head to claim more inches of your " + (pc.hasVagina() ? "[pc.girlCumFlavor]":"salty") + " interior. Although you’re here to hopefully break the siege of the hold, you find that task to be falling down the ladder of importance the closer your quivering body comes to overpowering orgasm.");
	}
	// Merge
	output("\n\nBreaths shallow, your whole body tenses up. You grunt and clinch the milo invader’s muzzle, boiling arousal surging through your " + (pc.isHerm() ? "mixed sex":"loins") + ". The halting heave of orgasm slows you to a crawl and you grip tight to the woman below; orgasm mere moments away, you arch back and cry out.");

	var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
	// Hermgasm & Cockgasm
	if(pc.hasCock())
	{
		// No Titfuck
		if(pc.cocks[dick].cLength() <= 8)
		{
			output("\n\nThe leopardess’ O-mouth is stretched just a bit wider on the onset of your ejaculation");
			if(pc.balls > 0) output(", spurred on by the heavy twitching in your ball" + (pc.balls > 1 ? "s":""));
			output(". ");
			if(cumQ < 1000) output("An outpouring of [pc.cum] surges up through your holstered cock, spurting into the she-cat’s throat and certainly into her belly. Dizzied from lack of oxygen and from the musky seed launching into her gut, her eyes roll back.");
			else if(cumQ < 3000) output("Your dick swells with a mighty load, stretching her neck wider to accept it all. You can feel it in your prostate, all of those belly-fattening loads churning into her one turgid eruption at a time.");
			else output("You’re not sure even you were ready for the vein-straining load you’re pumping into the hapless cat. Her stomach swells to be as gravid as a third tit, visible, liquid bulges flowing down (up?) her throat into the gurgling space they belong.");
			if(pc.hasCocks()) output(" What she’s not being force-fed is leaving beautiful [pc.cumColor] lines all across her chest, neck, and face, your extra dick" + (pc.cockTotal() > 2 ? "s":"") + " giving her a lovely reminder of your dominance.");
			if(pc.hasVagina()) output("\n\nFeminine release comes crashing up seconds later, forcing you to withdraw from her maw and replace your dick with [pc.girlCumNoun]-oozing cunt." + (pc.isSquirter() ? " It doesn’t just ooze, it squirts, breaking against her face, nose... wherever.":"") + " You can’t really be sure of anything except sweet release, of your combined fluids leaving an indelible mark on the dommy kitty.");
		}
		//titFucking
		else if(pc.cocks[dick].cLength() < 35)
		{
			output("\n\nThe leopardess’ whole body quivers on your final thrust, jets of [pc.cumColor] goo sloughing in her gigantic breasts. Titflesh seems to cascade down thanks to her gratified clutching and squeezing, wanting more of that boiling-hot [pc.cumNoun] to splatter her soft mounds. ");
			if(cumQ < 250) output("It’s almost like her breasts subsist on the stuff, because you can’t see any of it. Not one drop of [pc.cumNoun] leaks out from between her mammarian morass, making sure all of your [pc.cumVisc] load sloughs inside while you ride out this overpowering orgasm. The brief thought that you’re impregnating her tits is a powerful one.");
			else if(cumQ < 3000) output("The musky odor of your [pc.cumNoun] fills your nostrils as well as the [pc.cumVisc] spooge fills the gap between her gigantic breasts. Pockets of seed develop at the seam, bursting out on your subsequent eruptions, covering her in a beautiful reminder of your dominance.");
			else output("Your prostate seems to quake as it churns out tit-glazing loads of [pc.cumNoun]. A funnel of seed-filled fluid encapsulates your [pc.cockNoun] before exploding outwards in a semi-circular tide of [pc.raceShort]-spunk, splattering the zipsuit-wearing milodan in a permanent reminder of her time as your bitch.");
			if(pc.hasCocks() && pc.smallestCockLength() <= 8) output(" While you’re squirting most of your [pc.cum] into her breasts, your throat-holstered cock has been feeding the rest of your orgasm into her belly" + (cumQ < 10000 ? ", plumping it up quite nicely":", plumping it up to the point it could be a third boob") + ".");
			if(pc.hasVagina()) 
			{
				output("\n\n[pc.EachPussy] share in the tit-based climax, the clenching of your [pc.thighs] " + (!pc.isSquirter() ? "smearing the milo-slut’s face with [pc.girlCumNoun]":"splattering the milo-slut’s face with [pc.girlCumNoun] in long"));
				if(pc.isSquirter()) output((pc.girlCumQ() < 10000 ? ", fragrant waves":", erotic missiles"));
				output(". [pc.GirlCumVisc], crystal-clear juices settle deep into her fur, sure to be an adequate reminder of her submission to a better [pc.master].");
			}
		}
		//hyperTitfucking
		else
		{
			output("\n\nThe stretch of your urethra upon orgasm is greater than what her heavenly tits caused. Your [pc.hips] slap into her breasts and your vision fades to black, eyes rolling back in wonderful orgasm aided by her rapidly jerking legs. The warmth of your thick, [pc.cumVisc] seed filling every nook and cranny of your [pc.cock " + dick + "] momentarily wrests reality away from you, leaving you think about how great cumming is, how great it is to be led around by this dick, to share in all of its virile climaxes. There’s no pain when your piping opens up, only the spikes of surging [pc.cumNoun].");
			if(cumQ < 1000) output("\n\nIt’s a curious matter that with a size like yours, what you’re shooting doesn’t match up. Thin ropes of [pc.cum] shoot across the space you’re in, splatting wasted against the rocks. It only reduces to a rhythmic dribble from there.");
			else if(cumQ < 3000) output("\n\nPowerful, thick, and nearly unbroken ropes of [pc.cumFlavor]-orgasm spill from your throbbing, hugged dong. Girthy arcs of spooge whirl through the air, painting primitive art along the walls, your bottom doing everything in her subdued power to saturate this place with your seed.");
			else output("\n\n[pc.Cum] geysers from your lust-thickened girth, spurting in loads so thick that you can’t stay still, bobbing upwards to the blissful throes of your cumming cock. [pc.CumVisc] jizz gets everywhere, painting primitive art on the walls, the ceiling, tracing boundaries of your tryst here with the possibility of permanence.");
			if(pc.hasCocks() && pc.smallestCockLength() <= 8) output(" While your battleship blasts, your throat-holstered cock has been feeding the rest of your orgasm into her belly" + (cumQ < 10000 ? ", plumping it up quite nicely":", plumping it up to the point it could be a third boob") + ".");
			if(pc.hasVagina()) 
			{
				output("\n\nNo longer able to keep your place, you stand and furiously jill yourself off while the burdensome [pc.cockNoun " + x + "] between your legs bounces, its [pc.cumVisc] deluge still flowing. Feminine release follows close on the heels of masculine relief, ");
				if(pc.wettestVaginalWetness() < 4) output("thigh-drenching");
				else if(pc.girlCumQ() >= 10000) output("body-soaking");
				else output("erotic squirts");
				output(" of [pc.girlCum] trailing down your [pc.legOrLegs] and plastering the cat-dog’s fucked-silly muzzle in girlish passion.")
			}
		}
	}
	// Pussygasm
	else if(pc.hasVagina())
	{
		output("\n\nThe cunt-embedded leopardess’ tongue furiously lances your constricting ladybox, and you couldn’t be readier for your most explosive climax. When it hits, aided by that rough tongue seeking out the freshest drops of moisture, your whole body locks up and your biological impulses take it from there. The feminine slave-catcher is overwhelmed by a sensuality greater than her own, hopefully realizing who her superior is while drowning in your flooding, [pc.girlCumVisc] juices.");
		output("\n\n[pc.GirlCum] oozes out at the slow, building onset, long lines trickling down the slut’s cheeks. ");
		if(pc.isSquirter()) output("It’s merely the prelude to long, bursting squirts of the stuff to bathe her in your flooding essence. ");
		output("It glides down her tongue, holding it in place, flexing along its length and dribbling into her gut. Or brain. You don’t really know what’s going on down there.");
		output("\n\nIt’s not as important as flexing out another milo-masking load of [pc.girlCumFlavor] girljizz. Your [pc.hands] fall to her muzzle, rubbing it all in, making sure it settles deep like JoyCo conditioner. It will be a reminder to her from now on that she encountered a [pc.master] of her own, who can make her into this much of a wrecked slut whenever [pc.heShe] wants.");
	}
	// Neutergasm
	else
	{
		output("\n\nThe tongue in your [pc.asshole] cycles a full 360-degrees, then goes in reverse, licking in desperate circles while its wielder fades into unconsciousness. The heat inside swells into a body-wide shiver, an inner orgasm flexing out of your pores.");
	}
	// Merge
	output("\n\nYou sigh. It’s long and hot, and exceedingly pleasant. When you stand, the cold air assaults you all over again, but the incredible satisfaction of orgasm fights it off easily enough.");
	output("\n\nThe milodan temptress lies there, tongue hanging lewdly from her mouth");
	if((pc.hasVagina() && pc.isSquirter()) || (pc.hasCock() && pc.biggestCockLength() > 8 && cumQ >= 3000)) output(" and soaked in effluent");
	output(". She looks like a complete slut, the way her eyes are half rolled back, the way her entire body ripples in the aftermath. She’s not going to be hurting anyone in that state.");
	output("\n\nWhile you get your things together, you think that’s for the best.");
	if(pc.isAss()) output(" Maybe when you deal with this siege, the korgs will keep her on a chain for you to use whenever you want.");
	processTime(50);
	if(pc.hasVagina()) enemy.girlCumInMouth(pc);
	if(pc.hasCock() && pc.biggestCockLength() <= 8) enemy.loadInMouth(pc);
	pc.orgasm();
	output("\n\n");
	wargiiFightWinRouting();
}

//Tuuva Tag-Team
//genital choice only for herms.
public function tuuvaTagTeamScene():void
{
	clearOutput();
	showBust("MILO_TEMPTRESS_NUDE",tuuvaBustString(true));
	showName("TEMPTRESS\n& TUUVA");
	author("QuestyRobo");
	output("What are you going to handle this with?");
	clearMenu();
	//[Cock] Use your male half to help Tuuva double-team this bitch.
	var capacity:Number = enemy.vaginalCapacity(0);
	if(pc.hasCock() && pc.cockThatFits(capacity) >= 0) addButton(0,"Cock",cockSelect,[tuuvaTagTeamCockstuff,capacity,false,0],"Cock",("Use your " + (pc.isHerm() ? "male half" : "dick") + " to help Tuuva double-team this bitch."));
	else addDisabledButton(0,"Cock","Cock","You’re too big to put this to use.");
	//[Pussy] Use your lady bits to keep the Temptress busy while Tuuva rails her.
	if(pc.hasVagina()) addButton(1,"Pussy",vaginaRouter,[tuuva3someTagTeamingWithCuntsauce,tuuva.cockVolume(0),0,0,false],"Pussy","Use your lady bits to keep the Temptress busy while Tuuva rails her.");
	else addDisabledButton(1,"Pussy","Pussy","You need a vagina for this.");
}


//Both
public function tuuvaTagTeamIntroShit():void
{
	if(enemy.statusEffectv1("Has Captive") == 4) output("Tuuva must have plenty of the Temptresses aphrodisiac still pumping through her. Her [tuuva.cock] is ragingly hard and " + (!tuuva.hasCock(GLOBAL.TYPE_EQUINE) ? "dripping":"drooling") + " pre like mad. You can see the sheer desire in her eyes. She doesn’t just want to fuck the Temptress, she wants to ruin her!");
	else output("Tuuva strips down the second you tell her your plan. She gets most of it off pretty quickly, only running into problems trying to maneuver around her already-erect [tuuva.cockNoun]. The little woman is already bursting at the seams with excitement!");
	output("\n\nThe Temptress understands full well what the diminutive korg is about to do and presses a button on the wrist of her suit that causes the whole thing to fly off, leaving her absurdly curvy body completely bare for you two.");
}

//Cock
public function tuuvaTagTeamCockstuff(x:int):void
{
	clearOutput();
	showBust("MILO_TEMPTRESS_NUDE",tuuvaBustString(true));
	showName("TEMPTRESS\n& TUUVA");
	author("QuestyRobo");

	tuuvaTagTeamIntroShit();
	output("\n\nShe gets even more excited when you pull out your own [pc.cock " + x + "].");
	output("\n\n<i>“");
	if(!korgiTranslate()) output((!tuuvaLover() ? "Friend":"Lover") + " help Tuuva fill up stupid kitty? Nice!");
	else output("Want to help me stuff her full? Sounds like a good plan to me!");
	output("”</i>");

	output("\n\nBoth of you strut over to the prone milodan, presenting your packages to her.");
	output("\n\n<i>“Mhmmm, both of you at once? I suppose I’ll live with it, ");
	if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) 
	{
		output("even if the mutt is a bit small for my tastes.”</i> She chides, much to Tuuva’s anger.");
		if(pc.cocks[x].cLength() < 14) output(" <i>“You’re not particularly impressive either, but I suppose with both of you, it’ll make up for it.”</i> What a bitch!");
		else output(" <i>“Now this,”</i> the Temptress grasps your member, <i>“is a cock!”</i> Tuuva fumes even more at that.");
	}
	else output("especially if I get a taste of that nice piece the mutt has.”</i> She licks her lips, causing Tuuva’s bitchbreaker to visibly jump, even as she tries to ignore the comment. " + (pc.cocks[x].cLength() < 14 ? "<i>“If only your friend here was as lucky.”</i> You ignore the dig, determined to plow her bratty ass even harder.":"<i>“Oh, looks like I’ve got two studs today! And here I thought I lost that fight!”</i> Her ego stroking has the same effect on you as it had on Tuuva, but all that means is that you’re not going to be afraid to go all out."));
	output("\n\nSuddenly Tuuva runs up and gags the Temptress on her cock. <i>“" + (!korgiTranslate() ? "You done talking, now start sucking!":"That’s enough talking from you, now you can use your mouth to choke on my cock!") + "”</i>");
	output("\n\nWell, that’s one way to start this off. " + (!tuuva.hasCock(GLOBAL.TYPE_EQUINE) ? "Despite making fun of Tuuva’s size earlier, she seems to be having a hell of a time choking her down. All bark and no bite. Typical.":"She wasn’t kidding when she complimented Tuuva’s cock. The overconfident skank can barely keep the tip down, let alone get even half way. Part of you hopes Tuuva doesn’t break her, but most of you doesn’t really care.") + " With Tuuva handling things up there, that leaves you with her lower half to yourself.");
	output("\n\nHer legs are flailing under Tuuva’s assault, forcing you to keep them still so you can get a clear shot at her. She settles down after a bit, but you still get the occasional jump when Tuuva decides to push hard.");

	output("\n\nYou appraise her cunt, watching the fat little honeypot squirm and juice itself at Tuuva’s ministrations. Doesn’t seem like you’re going to need any foreplay here, so you might as go in hard! ");
	if(pc.cocks[x].cLength() < 14) output("You slide in with little resistance, likely owing her experience with milodan males. She definitely wasn’t bluffing when she said your size wasn’t impressive to her, but that’s not gonna stop you from proving that size doesn’t mean everything!");
	else if(pc.cocks[x].cLength() < 20) output("It’s a tight fit, but she’s more than willing to take you with some effort. No doubt she’s taken plenty of cocks of your calibre, but you’re no primitive brute, and you’re going to show how a civilized stud fucks!");
	else output("She squirms back when she feels you pressing your monster member against her opening. Seems you’re size is too large even among the milodan. Still, you know when a hole’s going to be too small, and this bitch is just playing hard to get. You give it a few more knocks and find her loosening up in no time, and with just a bit more coaxing you batter right in.");
	pc.cockChange();
	output("\n\nImmediately you feel a strange, wet warmth in your member, like her juices are starting to seep into your skin. The warmth blossoms into a heat that makes you think of pure, undiluted desire.");
	if(flags["TEMPTRESS_PUSSVENOMED"] == undefined) output("\n\nCould her pussy be laced with aphrodisiacs? That crazy bitch!");
	else output("\n\nYou knew this was coming, but it never seems to get easier to take!");
	output(" Your pace ratchets up without you even thinking, and soon you’re mashing pelvises with her like a wild animal.");
	output("\n\nMeanwhile Tuuva is busy working over her mouth. ");
	if(!tuuva.hasCock(GLOBAL.TYPE_EQUINE)) output("Looks like she was finally able to tame that mouth of hers. The Temptress’s throat bulges as Tuuva rams herself down to the knot inside her warm sluthole.");
	else output("Despite her earlier issues, the Temptress is managing to take quite a bit of Tuuva’s massive member. Even then, she can’t even get halfway up, thanks to its immense girth.");
	output(" For all the roughness, both of them seem to be enjoying themselves if the muffled moaning from the Temptress is any indication. You can say the same for yourself, but maybe a bit too much. It feels like you’re about to cum already and it’s only been a few minutes!");
	output("\n\nRather than accept blowing early, you call out to Tuuva for her to switch places.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("Oh? Want her mouth now? Okay!");
	else output("Oh? Did you want to use her mouth now? Fine by me!");
	output("”</i> She yanks her [tuuva.cock] out of the milo-sluts mouth and runs over to you, spit flinging from her member as it bobs in the air. You pull out, feeling the chill of the air batter against your super-heated member. Your [pc.cock " + x + "] is still soaked in her devilish juices, throbbing with unnaturally induced need. Time for a spit-shine.");
	output("\n\nYou move over to her face and plant your cock on her face. <i>“An aphrodisiac cunt, huh? Tricky little thing! Let’s see if you can stomach your own flavor!”</i> Without another word you ram your [pc.cockNounSimple " + x + "] down her maw, letting her taste her own aphrodisiac. The reaction is immediate. Even before Tuuva gets to work her pussy clenches and gives a small, joyful squirt.");
	output("\n\nTuuva heard you talking about her aphrodisiac cunt, but either wasn’t paying attention or she doesn’t care. The excitable little pup buries every inch of her [tuuva.cock] inside the Temptress" + (tuuva.hasCock(GLOBAL.TYPE_EQUINE) ? ", making a nice, fat bulge in her gut":"") + ".");
	output("\n\nShe hollers out in surprise when she finally gets a taste of the kitty-bitch’s drugged honeypot. <i>“Oooooooooh! " + (!korgiTranslate() ? "Tuuva":"I") + " like that!”</i> She bunkers down and starts to really rut the milodan. Her throat really tightens up in response, but you’re not about to slow down over a little thing like that. You ram every inch you can down her gullet, somehow feeling less and less on edge as you do. Yet with each thrust she seems to grow more wanton.");
	output("\n\nHer hands have gone to manhandling her tits, pulling and squeezing with reckless abandon, all while the rest of her body squirms under your combined assault. You pull your [pc.cock " + x + "] out for a second, admiring the way it shines, free from her girlcum. She gasps and moans, too turned on to form words.");
	output("\n\nJust then you catch a look from Tuuva. <i>“");
	if(!korgiTranslate()) output((!tuuvaLover() ? "F-friend":"L-lover") + " switch with Tuuva again! Tuuva need break.");
	else output("H-hey, switch with me again! I need a break from this.");
	output("”</i>");
	output("\n\nYou nod and switch places again, letting Tuuva give her another dose of her own medicine while you dive back into her intoxicating pit. Each pass drives the three of you further and further into the rut. You stop seeing her as a living thing and more as a simple sex toy, something to share between you and Tuuva.");
	output("\n\nAt least an hour must have passed before you and your korgonne companion feel like you’ve gotten as much out of her as you possibly can. With a shared nod you both ram your rods as far and as hard as you can; you at her cunt and Tuuva back in her mouth.");
	
	var cumQ:Number = pc.cumQ();
	output("\n\n");
	if(cumQ < 100) output("You empty out your [pc.balls] in an instant, the excessive blueballing you’ve put yourself through making the process slightly painful. Even after you run completely dry your [pc.cock " + x + "] keeps going, keeps trying to pump out more sperm than you could possibly make without extensive modding.");
	else if(cumQ < 5000) output("You let loose a torrent of [pc.cum] inside her, unable to give anything less than every drop thanks to how thoroughly you’ve built yourself up. Her belly swells up with the fruit of your labor" + (pc.cumQuality() > 0 ? ", likely just a prelude to what’s coming for her after this":"") + ". Even with such a large ejaculation however, you still run dry long before your orgasm actually finishes, leaving you firing blanks for several seconds.");
	else 
	{
		output("You wince as the insensate milodan bloats out instantly from your volcanic eruption of an orgasm. You spray so much that it actually hurts; like a pipe at the end of a broken valve, you have no control over the pace or volume. You’re practically a prisoner in your own body, simply watching from the sidelines as you ruin the Temptress.");
		output("\n\nIn the time it took you to think of those metaphors, you’ve already stuffed her beyond any reasonable or even unreasonable capacity, and your [pc.cum] has started to leak out in small rivers. By the time you finish up, you’re sitting in a veritable ocean of your own seed.");
	}
	output("\n\nTuuva also fires on all cylinders, " + (!tuuva.hasCock(GLOBAL.TYPE_EQUINE) ? "emptying her own overworked, overstuffed sack down the milo-slut’s throat.":"Pumping the milo-slut with what seems like her own body weight in horse-pupper seed."));
	output("\n\nYou both fall back, exhausted and spent. Both of you know that you don’t have the time to sit around, though, and you quickly get to your feet and start to prepare.");
	processTime(45);
	enemy.loadInCunt(pc,0);
	IncrementFlag("TEMPTRESS_PUSSVENOMED");
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	wargiiFightWinRouting();
}

public function tuuva3someTagTeamingWithCuntsauce(x:int):void
{
	clearOutput();
	showBust("MILO_TEMPTRESS_NUDE",tuuvaBustString(true));
	showName("TEMPTRESS\n& TUUVA");
	author("QuestyRobo");

	tuuvaTagTeamIntroShit();
	output("\n\nHer eyes go wide when you tell her that she’ll get a go at both of you. You strut over toward the prone Temptress and place yourself over her.");
	if(!pc.isCrotchExposed()) output(" You drop your [pc.crotchCovers], letting them drop onto her face and lay there for a second before you kick them away.");
	output("\n\n<i>“A little rude, but I must say I do like this attitu- mmph!”</i> You plant yourself down on her, letting your [pc.pussy] rest right on her tongue.");
	output("\n\n<i>“Less talking and more working!”</i> you berate her. She grumbles a bit, but gets working pretty quickly. You moan a bit as you feel her thick tongue dig into your honeypot, drawing out ");
	if(pc.vaginas[x].wetness() < 2) output("drips");
	else if(pc.vaginas[x].wetness() < 4) output("strands");
	else if(pc.vaginas[x].wetness() < 5) output("splashes");
	else output("waves");
	output(" of [pc.girlCum] from you. Your eyes lock with Tuuva’s, letting you see just how excited she is.");

	output("\n\nShe doesn’t waste any more time in diving in now that you’re in position. The Temptress buckles as Tuuva enters her, her tongue spasming inside you in time with each thrust. You whistle for Tuuva’s attention");
	if(pc.biggestTitSize() >= 4) output(" as you grab your [pc.breasts] and push them together, jiggling them for her pleasure as you gyrate your [pc.hips] on top of the Temptress’s face");
	else if(pc.isBimbo()) output(", wishing you had some titties to jiggle for her, but making due with your [pc.hips] and lewd expressions");
	else output(", wishing you had a something to shake to get her attention, but making due with your [pc.hips] and lewd expressions");
	output(".");

	output("\n\nTuuva ups her pace as she watches you dance for her while riding the face of the slut she’s fucking. Suddenly her eyes shoots open, her tongue lolls out of her mouth, and she starts to pound the milo-slut like she’d just gone into rut.");
	output("\n\nYou try and ask her what’s wrong, but the milodan’s foraging tongue starts to go wild in response to Tuuva’s fervor. Your inner walls start to clench down, trying to control her pace to no avail. She tosses you clear over the edge, making you squirm as you cum all over her face. While the kitty-bitch’s tongue is <i>very</i> pleasing, you can’t help but feel like Tuuva needs some extra attention right now.");
	output("\n\nYou pull up and off the Temptress’s face, letting her moan and groan unimpeded while Tuuva rails her. Tuuva’s blurry eyes lock once-again with yours as you scoot up toward her. You press your [pc.lipsChaste] against hers and guide her thrusting cock out of the milodan’s snatch, much to her dismay.");
	output("\n\nShe won’t have to wait long though. You turn around, lay face-to-face with the Temptress, and stack your [pc.pussy " + x + "] on top of hers. An almost unnatural warmth migrates over to your womanhood as your juices mingle. It makes you feel like you haven’t cum in weeks even though you did just a minute ago!");
	output("\n\nThe sight of her juice-covered [tuuva.cockNoun] grows sweeter and sweeter by the second, and you almost feel like you’re about to lose control and start begging for it. Luckily you don’t have to resort to that, as Tuuva gets the hint and thrusts her member between your stacked pussy.");
	output("\n\nYou and the Temptress moan in unison as Tuuva starts to work her cock through your combined valley." + (tuuva.hasCock(GLOBAL.TYPE_EQUINE) ? " Her stallion member is even long enough that you can feel it pass between the milo-slut’s huge tits and your [pc.chest], giving her even more stimulation as she uses you like a pair of living sex toys.":"") + " The Temptress’s copious juices splatter all over Tuuva’s [tuuva.cock], your [pc.vaginaNoun " + x + "], and even up to your [pc.belly].");
	output("\n\nEvery bit of skin it touches starts to feel hot, like pure arousal burned right into your [pc.skin]. It’s definitely drugged with something, and you have a good hunch it’s some kind of aphrodisiac. Tuuva must be feeling it even harder, since by now her whole cock is coated in layers of the stuff. She pants and grunts behind you, and you can her precum " + (!tuuva.hasCock(GLOBAL.TYPE_EQUINE) ? "drip":"drool") + " onto your skin as it passes.");
	output("\n\nShe gets faster, but her movements become way less precise as the lusty concoction starts to drive her crazy. On one thrust she rears back but doesn’t go back in. You start to look back and check what she’s up to, only to get a cunt full of [tuuva.cock] as she penetrates you.");
	pc.cuntChange(x,tuuva.cockVolume(0));
	output("\n\n<i>“S-sorry!”</i> Tuuva yells out as she starts to pound you relentlessly. Even more of the Temptress’s juices seep into you off of Tuuva’s member, mixing with your own and making your [pc.pussy " + x + "] feel on fire with pleasure. The sheer sensation of it makes you forget how suddenly she did it, in fact you can’t imagine not asking, no, begging Tuuva to fill you with that wonderful cock of hers!");
	output("\n\nThe Temptress scowls at you, angry that you’re getting all of the little stud’s attention. She doesn’t have long to wait for her turn, though. With no warning Tuuva blows her load in you, pumping you full of thick korg seed. She doesn’t even wait for her orgasm to be over before moving on to the next round. Her cock flies out of your [pc.pussy " + x + "], still flinging fresh ropes of seed onto your [pc.ass] before she sinks it into the Temptress.");
	output("\n\nShe cries out as she’s stuffed full of [tuuva.cock]. Even though she just orgasmed, Tuuva doesn’t seem to have lost any energy; if anything she’s even more ferocious than before. The milo-slut’s eyes roll back into her head as she’s mercilessly violated by the energetic little pup.");
	output("\n\nAs she did, you start to feel a pang of jealousy at not getting any action, and as before Tuuva doesn’t last long enough for you to feel it long. The Temptress groans as Tuuva fills her up.");
	output("\n\n<i>“" + (!korgiTranslate() ? "T-Tuuva":"I-I") + " need more!”</i> She shouts as she switches back to you, again, filling you with the same combination of cock, aphrodisiacs, and eventually cum. The cycle repeats for stars know how long. The time between being filled grows shorter and shorter until Tuuva stops caring which hole each thrust goes in.");
	output("\n\nShe breeds you both like an alpha beast, pumping you both with so much cum that by the time she’s done you both look several months pregnant" + (pc.bellyRating() >= 40 ? ", with triplets":"") + ", and your ponderous bellies push you apart.");
	output("\n\nThe Temptress passes out under you, and you feel yourself about to do the same until Tuuva yanks you off and back to attention.");
	output("\n\n<i>“" + (!korgiTranslate() ? "No time sleep, need stop stupid kitties!":"There’s no time to sleep now, we need to stop the milodans!") + "”</i>");
	output("\n\nYou nod and try your best to press on despite your sore pussy and full womb.");
	processTime(45);
	pc.orgasm();
	pc.orgasm();
	pc.loadInCunt(tuuva,x);
	output("\n\n");
	IncrementFlag("TEMPTRESS_PUSSVENOMED");
	wargiiFightWinRouting();
}

//Tuuva rescue:
public function rescueTuuvaBlurb():void
{
	clearOutput();
	showTuuva();
	author("QuestyRobo");
	output("Tuuva stretches, finally freed of the Temptress’s clutches. She seems reinvigorated, if anything, after the encounter.");
	output("\n\n<i>“");
	if(!korgiTranslate()) output("HA! " + (!tuuvaLover() ? "Friend":"Lover") + " and Tuuva beat stupid kitty real good! Tuuva go get smashies! Come back and beat more stupid kitties!");
	else output("HA! We really messed that bitch up, didn’t we! I’m gonna go back to my shop and get some weapons! I’ll be back to beat some more milodan ass!");
	output("”</i>");
	output("\n\nShe runs off, giddy at the prospect of getting revenge.");
	output("\n\nYou too need to get moving. Sieges to stop, princesses to save, the usual.");
	output("\n\n");
	CombatManager.genericVictory();
	tuuvaAffection(15);
	flags["WARGII_TUUVA_SAVED"] = 1;
	IncrementFlag("WARGII_FIGHTS_WON");
}

//Tuuva repeat:
public function tuuvaRepeatAssistLeave():void
{
	clearOutput();
	showTuuva();
	author("QuestyRobo");
	output("Tuuva rearms in a hurry, not even taking time to wipe off. <i>“");
	if(!korgiTranslate()) output("No stop, more kitties to beat! See " + (!korgiTranslate() ? "friend":"lover") + "later.");
	else output("No time to stop right now, more milodans to smash up! I’ll see ya after the fighting.");
	output("”</i>");
	output("\n\nShe runs off, ready to take the fight back to the milodan invaders.");
	output("\n\nYou also need to get moving. Sieges to stop, princesses to save, the usual.");
	output("\n\n");
	//99999
}

//Pussy Plowing
public function chooChooPussyPlowing(x:int):void
{
	clearOutput();
	showMiloTemptress(true);
	author("QuestyRobo");
	output("You whip out your [pc.cocks], letting the hard, hot rod" + (pc.hasCocks() ? "s":"") + " almost steam against the cold air of the hold. In response, as if by instinct, the MILFy milodan presses a button on her wrist that causes the rest of her suit to fly off, leaving her completely naked as she inspects your package.");
	var cumQ:Number = pc.cumQ();
	var y:int = pc.cockThatFits(enemy.analCapacity(),"volume",[x]);
	//Multi Bobby
	//The boy aint right.
	if(y >= 0)
	{
		output("\n\nThe Temptress oohs and awes and your [pc.multiCocks], sizing up your odd genital arrangement. <i>“You outsiders always have the most interesting... tools. I’ve taken multiple men at once, many times, but never had the pleasure of one like you!”</i>");
		output("\n\nShe rolls onto her front and raises her bubble butt into the air in order to give you a better look at it. Her puffy pussy visibly throbs and juices itself up, and even with her bountiful ass blocking your view, you can tell her other hole is clenching in excitement.");
		output("\n\nYou strut up and plant both of your hands on her jutting rump. The fur-coated flesh yields under your grip, jiggling sensually under even the slightest motion. You plant one of your [pc.cocks] in the crack of her rear, and thread the other between her thighs, just touching her labia. Your other cock" + (pc.cockTotal() > 2 ? "s rest":" rests") + " on " + (pc.cockTotal() > 2 ? "various parts of ":"") + "her ass, throbbing lightly as " + (pc.cockTotal() == 2 ? "it indents":"they indent") + " her assflesh.");
		output("\n\nThe sensation of having " + (pc.cockTotal() == 2 ? "both":"all") + " of your members given different stimulation makes your brain go slightly haywire as it tries to reconcile it all. The generous flesh and warm, downy fur squeezes down on your [pc.cock " + y + "], while the generous leakage and excessive heat of her puffy pussy makes your [pc.cock " + x + "] feel like it’s being stuck through a soft, fur-lined gloryhole into a sauna.");
		output("\n\nThat’s not even mentioning the way her pussy juice reacts on your skin. It’s so hot it almost burns, but in a good way, like the heat is melding into your [pc.skin] and energizing every cell in your [pc.cockNounSimple " + x + "] with " + (!silly ? "lust.":"sexual energy!") + " It’s potent enough that your other member" + (pc.cockTotal() > 2 ? "s":"") + " start to feel the same sensation. You start thrusting without thinking, scissoring through her backside with reckless abandon.");
		output("\n\nThe Temptress looks back at you with a big, cheshire grin. <i>“What’s wrong, feeling a little hot under the collar?”</i>");
		if(flags["TEMPTRESS_PUSSVENOMED"] == undefined) output("\n\nDamn it, she must have some kind of drug in her girl cum. Tricky bitch!");
		else output("\n\nIt seems like no matter how many times you do this, it always manages to get the best of you.");
		output(" You give her a slap in order to remind her who’s in charge right now, but that only seems to make her grin larger.");
		output("\n\nEnough foreplay though, time to get down to business! You pull back, facing some resistance as the Temptress squeezes her thighs together to keep you in her sweltering trap for as long as possible. You grab your [pc.cock " + y + "] and cockslap her ass to get her to let go, but she only squeezes tighter. You start to huff in exertion as your strength is drained by the expert combination of squeezing thigh muscles and swelteringly hot, drug-laced juices.");
		output("\n\nOff-[pc.cumColor] pre ");
		if(cumQ < 100) output("drips");
		else if(cumQ < 800) output("drools");
		else output("sprays");
		output(" from the cumslit" + (pc.cockTotal() > 2 ? "s":"") + " of your free member" + (pc.cockTotal() > 2 ? "s":"") + ", signaling just how close you are to blowing your load without even getting a nanometer inside her! Right when you’re about to fly off the edge like a lightspeed train off a sheer cliff, she stops.");
		output("\n\nYou almost fly backward as her hips release you at the peak of a backswing. The mischievous milodan minx snickers as you desperately struggle to keep your footing, [pc.cocks] flinging pre-seed into the air as you flail.");
		output("\n\nAfter recovering, you glare at her, eliciting a full-on laugh in response from the cackling cat.");
		output("\n\n<i>“Oh dear, I’ve gone and offended you, haven’t I? I’m just the worst! Maybe you could, oh I don’t know, grab me by the neck, push me down and rail me till I’m basted in your seed and full to bursting with your strong kits!”</i>");
		output("\n\nYou go wide-eyed at the sudden assertiveness, as she flutters her eyelashes innocently. <i>“Just an idea, unless of course I really did tire you out.”</i> Her voice continues to drip with a kind of dry sarcasm that boils your blood and just makes the idea of plowing her into the ground more and more appealing by the second, even though you know that’s exactly what she wants.");
		output("\n\nWhat she wants and doesn’t want stops meaning much to you after you grab your hips and line your [pc.cock " + y + "] up with her pucker while your [pc.cock " + x + "] bumps up to her fat outer lips. A primal feeling of <i>dominance</i> fills you, brought on by a mix of anger and drug-induced lust. Drool starts to drip from the sides of your mouth as you press deeper, forcing her holes to slowly buckle to you.");
		output("\n\nThe Temptress coos as you ease yourself into her, trying to wiggle her hips back in order to get you in quicker, only to reel back as you slap her ass to remind her, again, who’s in charge. As much as you’d love to bury every inch of doubled-up dong right away, you have enough restraint, and spite, left to make her work for it. You pop your members in just passed the tip. She yelps out in pleasure, preemptively getting herself nice and psyched for a real, double-dicked fucking, only to gasp in surprise as you pull out almost instantly.");
		output("\n\nShe looks back with a scolding look, but you just give her another smack to the booty and then point at your straining [pc.cocks] to remind her what she did to you not even a minute ago. The pent-up pussy fumes but relents to you. You reward her by thrusting back in, planting an extra inch in each of her entrances before yanking back out just as quick.");
		output("\n\nHer frustration is palpable as you continue doing so. She gets just enough to feel it right before it’s yanked away unceremoniously. It’s like dangling a toy in front of a cat; only the toy is your dicks. Even the small stimulation starts to build over time, for both of you. There’s a thick layer of lust-inducing juices coating the top few inches of your [pc.cock " + y + "], which seems to jolt through your crotch and over-stimulate your other member" + (pc.cockTotal() > 2 ? "s":"") + ". It’s bad enough that you almost don’t notice the Temptress start to enjoy your edging treatment. <i>Almost</i>.");
		output("\n\nShe starts really getting into your groove of relentless teasing. You can’t have that! After pulling back you decide enough is enough, grasp her haunches hard and ram as far in as you can go! ");
		//Chosen dicks more than 6 inches apart:
		if(Math.abs(pc.cocks[x].cLength() - pc.cocks[y].cLength()) > 6) 
		{
			output("You both shudder at the odd rhythm that your mismatched pricks create. It’s always a strange feeling to have one of your boys hanging while the other is buried deep inside a warm hole. You’re sure she’s taking her time adjusting to the asynchronous rhythm too. The big one goes in, taking all the attention, then the little one follows up before they can even get used to the first one!");
			output("\n\nShe lets out loud, uneven moans. The octave of her pleasured shouts peaks every time you give her the old one two. You even vary up your pace, slowing and speeding up whenever you think she’s starting to follow along with you.");
			output("\n\nThe MILF" + (!silly ? "y":"tastic") + " milodan turns back to you, face twisted in ecstasy. <i>“O-oooooh! You outsiders are so full of surprises. I can’t wait to see what else you have in store!”</i>");
		}
		else if(pc.cocks[x].cLength() < 14 || pc.cocks[y].cLength() < 14)
		{
			output("You sink in to the hilt in surprisingly short order. She’s very loose, at least to someone of your size. No doubt she’s well-used to cocks of a much larger size, but the unique feeling of getting double-stuffed seems to more than make up for it. The panting pussy thrusts back into you, trying to set the tempo despite your repeated insistence that you’re in charge. Rather than let her have her way you push forward, knocking her hands out from under her and almost forcing her face onto the ground.");
			output("\n\nShe manages to bring herself back up despite your continued motion, cooing in appreciation rather than being upset at your rough treatment. <i>“My my, you do understand how this works. Now if only you had the... volume, you’d be a good milodan!”</i>");
			output("\n\nYou bunker down and give her another rough few thrusts in order to shut her up again. You know she’s <i>trying</i> to make you mad, but you’d be lying if you said it wasn’t working!");
		}
		else
		{
			output("The Temptress goes breathless as you cram your long, thick double dongs into her holes. Each one individually feels more than accommodating, but the added pressure of having <i>both</i> of them stuffed so full makes her feel almost virgin tight. Her inner walls are so thin that your [pc.cocks] feel like a single, throbbing mass penetrating the stretched-out slut. None of that stops you from pressing on, though. If anything, the way her face contorts as she tries to comprehend just what’s happening.");
			output("\n\n<i>“Uhmmf. I-I must admit y-yoooooooooohh! You’re something q-quite s-sp-special! D-do all... oh my! Do all outsiders have such woOOOONDERFUL COCKS!?”</i>");
			output("\n\nHer comments combined with her visible shuddering as you keep stuffing her fuels your ego to keep you pressing on, fucking her more and more silly despite not even being a full thrust into her yet!");
			if(pc.cocks[x].cLength() < 20 || pc.cocks[y].cLength() < 20) 
			{
				output(" The cock-crazy cat-bitch squeals when you bottom out, pressing a hand to her gut in order to feel just how much you’ve crammed into her.");
				output("\n\n<i>“S-so voluminous! I haven’t been filled like this since the last breeding solstice! Don’t hold back, outsider. I can, no, I’m desperate to take it!”</i>");
			}
			else
			{
				output(" The overstuffed skank groans when she feels you bottom out, not even managing to get all of you in. You stroke the many inches of yourself left hanging bare. The contrasting sensations only serve to enhance to feeling of stuffing her so thoroughly.");
				output("\n\nThe Temptress’s eyes are rolled up into her skull, and her tongue is hanging limp with strands of drool running down its considerable length. She’s trying, and failing, to process just what’s happening. Very few bipedal races were made to take even a single cock of your size, and you’re trying to pack two into the mind-melted milodan!");
				output("\n\nShe finally manages to get enough of her senses back to be able to stammer out something coherent. <i>“S-s-so fucking big! Your women must be truly blessed to be able to handle breeders of your size. T-teach me how they do it, how they breed with beautiful giants like you!”</i>");
			}
		}
		pc.cockChange();
		output("\n\nYou plant your [pc.footOrFeet] on the ground and start railing the double-stuffed dominatrix with all you’ve got. Her holes squeeze down hard on you, and at this point you’re not sure if it’s to slow you down or speed you up. The bucking bitch tries to talk but everything just comes out as a stammering, moaning mess. Her body shakes and buckles under your assault, barely able to keep herself held up. That doesn’t stop you though. You keep up the attack, plowing her until she loses her balance and falls on her face.");
		output("\n\nYou lean down and wrap yourself around her, grabbing her huge, bouncy tits and putting your mouth up to her neck. She grows quieter, yet more intense at your closeness. The newly-submissive minx starts mewling and writhing like a bitch in heat. Her body heat starts cranking up like a furnace, both inside and out. You bite down on her neck on instinct, realizing just how eager to be filled she is.");
		output("\n\n<i>“Y-you beast! I’ve never been bred like this before. I-I’m going into heat! Give me strong kits! So many kits!”</i>");
		output("\n\nHer words grasp you by the [pc.balls] tight and make you only want to do her harder. Your groin starts to feel sore as you mash your pelvis into hers like an overclocked fuck-machine. All the while you feel her drugged cunt juice flood all over your crotch, " + (pc.balls > 0 ? "soaking your sack and ":"") + "running down your [pc.legOrLegs] in small streams. The powerful, induced lust had slipped from your mind, becoming just another part of the rut. You feel like your groin is on fire, from both the drugs and the never-ceasing friction. It blossoms into a strange feeling, like the individual nerves themselves are alight with energy.");
		output("\n\nYour lower half and hers merge into a single mass of pleasure, throbbing and mashing into itself as it grows hotter and hotter. You move up from her neck and start to make out with her, utterly lost with her.");
		output("\n\nIf someone came by right now you wouldn’t be surprised if they mistook the two of you for a pair of wild animals breeding. Not like you’d care at this point. The entire milodan horde could descend on the two of you and you wouldn’t skip a beat. Sound fades aside from the sounds of your rampant fucking. The world itself almost seems to go black as the only thing you care to see is fat milodan ass getting speared on your twin members.");
		if(pc.cockTotal() >= 3)
		{
			output("\n\nYour other cock" + (pc.cockTotal() > 3 ? "s haven’t":" hasn’t") + " had the pleasure of her holes, but " + (pc.cockTotal() == 3 ? "has":"have") + " been making great use of her generous ass flesh. Every thrust of your main pair has been accompanied by a yearning slap on her rear by your straggling member" + (pc.cockTotal() > 3 ? "s":"") + ". Each slap rings out with the same intensity as if you’d done it with an open palm. Pre cum ");
			if(cumQ < 50) output("leaks");
			else if(cumQ < 500) output("dribbles");
			else output("sprays");
			output(" out of your " + (pc.hasVagina() ? "she-dick":"manhood") + "" + (pc.cockTotal() > 3 ? "s":"") + ", basting the milo-slut’s rear [pc.cumColor].");
		}
		output("\n\nYou feel incredible pressure start to build in your [pc.balls] and you can tell that you’re right on the edge of climax. Just as you realize that, you feel her holes start to squeeze down on you in reverent climax. You push in as far as you can go, needing to force your way through her spasming muscles to get anywhere, and stop for what feels like the first time in hours as you finally climax.");
		if(cumQ < 500) 
		{
			output("\n\nYou give the cum-starved Temptress every ounce you have, split between her back door and baby maker. You’re sure it’s not much compared to what she’s used to, but you don’t think she cares too much right now.");
			if(pc.cockTotal() > 2) output(" Your other member" + (pc.cockTotal() > 3 ? "s leak":" leaks") + " [pc.cum] onto her rear, coating it in an extra layer of [pc.cumColor].");
			output(" Your reserves drain quickly, leaving you buried in her, simply enjoying the spasming of her continuing orgasm.");
		}
		else if(cumQ < 10000)
		{
			output("\n\nYou pump her holes with what feels like gallons of spunk. The throbbing spurts are so powerful that they reverberate between your hilted [pc.cocks], drawing out your orgasm ever longer and harder. Her belly starts to bloat out as both her back door and womb are crammed full of [pc.cum] to an almost ludicrous degree.");
			if(pc.cockTotal() > 2) output(" Your other member" + (pc.cockTotal() > 3 ? "s fire":" fires") + " off stray shots of " + (pc.cockTotal() == 3 ? "its":"their") + " own, absolutely coating her ass and even reaching far enough to land on the top of her head.");
			output(" You stop just shy of making her look like she’s about to pop out twins" + (pc.cumQuality() > 0 ? ", which she might, given how much you just stuffed her with":"") + ". Her holes continue to milk you, even after you’ve obviously gone dry.");
		}
		else
		{
			output("\n\nShe groans out through her before-now debilitating stupor as you instantly fill her with what seems like gallons of [pc.cum].");
			output("\n\nThe temptress seems in awe of your sheer production as her belly bloats to obscene proportions in the span of a few seconds. <i>“Y-you could breed my whole tribe in a single climax!”</i> Her eyes go even wider when huge, pressurized streams of spunk go flying now that there isn’t a nanometer of space to spare in her. <i>“By the ancestors...”</i>");
			if(pc.cockTotal() > 2) output("\n\nYour other cock" + (pc.cockTotal() > 3 ? "s impress":" impresses") + " just as much, firing off like " + (pc.cockTotal() == 3 ? "a bursting fire hydrant":"bursting fire hydrants") + ", coating the skank in a winter storm’s worth of spunk. ");
			else output("\n\n");
			output("You’re just getting started too. [pc.cum] floods the area around you, making an ankle deep puddle of [pc.cumColor] that only grows as your godlike virility asserts itself for the world to see.");
			output("\n\nSadly even you have limits, as insane as they are. The Temptress is caught in a continuous, gushing orgasm brought on by the otherworldly insemination you just performed. You’re all out now, finally, so all that’s left is to just bask in the worship of her insensate body.");
		}
		output("\n\nYou enjoy her for a few more moments before you remember the whole invasion thing. Groggily you pull out of her and get to your feet. The Temptress falls to the ground without your support, ");
		if(cumQ < 200) output("leaking");
		else if(cumQ < 10000) output("gushing");
		else output("spewing");
		output(" your [pc.cum] from both holes as she passes out. With nothing left here, you ");
		if(!pc.isCrotchExposed()) output("re-cover your members");
		else output("make sure your bare members are clean");
		output(" and set off to continue combating" + (pc.cumQuality() > 0 ? ", or knocking up, if you get lucky again,":"") + " the milodan menace!");
	}
	//Single Johnny
	else
	{
		if(pc.cocks[x].cLength() < 14) 
		{
			output("\n\nThe Temptress seems less than impressed at your member. <i>“Hmm, and here I heard you outsiders all had massive cocks from all of your strange drugs.”</i>");
			output("\n\n<i>“Hey, not all of us are Throbb addicts!”</i>");
			if(flags["TIMES_THROBB_USED"] != undefined && flags["TIMES_THROBB_USED"] >= 5) output(" You say so knowing full well how much of the stuff you yourself have used.");
			output("\n\n<i>“Perhaps I will seek these ‘Throbb addicts’ once this is done. For now, I suppose I will make due with you.”</i>");
			output("\n\nYou are going to <i>rail</i> this bitch!");
		}
		else if(pc.cocks[x].cLength() < 19)
		{
			output("\n\nThe Temptress smiles as she watches your member throb in the open air. <i>“Nice and big, just like one of our own. I wonder if you know how to use it as well, though?”</i>");
			output("\n\nOh, you’ll show her how well you know how to use it!");
		}
		else
		{
			output("\n\nThe cock-hungry kitty’s mouth drops when she sees the sheer size you’re packing. She reaches out to touch it, sweeping her finger delicately along your underside as she breathes hoarsely. <i>“So... decadent. I’ve heard about what you outsiders can do to your cocks, but this is the first time I’ve been able to see one for myself. I hope you can live up to your member. Don’t want such a beautiful thing being wasted, do we?”</i>");
			output("\n\nOh, you’ll show her!");
		}
		output("\n\nYou grab her roughly by the back of the head and shove her down as far as you can get her to go. ");
		if(pc.cocks[x].cLength() < 19) output("You feel an extra twinge of lust when you see her pressed right against your groin, big [enemy.eyeColor] eyes staring up into yours as she engulfs your member completely" + (pc.cocks[x].cLength() >= 14 ? ", despite its impressive size":"") + ".");
		else output("Seeing her struggle to take even half of your ogre cock in makes you swell with a feeling of domination. She looks up at you with determination, willing to take your challenge even if she can’t satisfy all of you!");
		output("\n\nYou don’t even need to push her for her to start bobbing her head up and down your shaft. Her tongue even starts darting ahead of her mouth, ensuring that every inch of you" + (pc.tallness - 10 > enemy.tallness ? " she can reach":"") + " stays wet and stimulated.");
		if(pc.balls > 0) output(" She reaches down and cups your [pc.balls], jostling your cum factor" + (pc.balls > 1 ? "ies":"y") + " in order to work " + (pc.balls > 1 ? "them":"it") + " up for what’s coming.");
		output(" You just hold her head and enjoy while she works you over, the backhanded insults from earlier melting away in her maw.");
		output("\n\nThe Temptress is certainly living up to her name. If you didn’t know any better you’d swear you were at a high-class whorehouse, getting service from an expensive slut. Instead you snap back to reality and remember you’re standing in the middle of a besieged hold full of angry cat people, making one of them suck your [pc.cock]. Just when you sigh at the realization, she pulls off, giving you one last cock-straining lick before standing up.");
		output("\n\n<i>“Nice and lubed up? Alright, now let’s get down to the real fun.”</i> She turns and bends over, giving you a clear look as her fat pussy wobbles enticingly, dripping so much that in the back of your mind you wonder why she felt the need to lube you up. Maybe she just loves sucking cock?" + (pc.isBimbo() ? " You know you do!":"") + " But that doesn’t matter right now. You strut up and grab her by the hips, pulling her back onto your [pc.cock] so you can give her puffy lips a try. They bend and mold around your member like a pair of actual lips, drooling warm girlcum onto your dick skin.");
		output("\n\nHer juices start to heat up on you. It’s not a natural heat, rather it seems to spread out throughout your [pc.cock] at an alarming rate. You get even harder than before as the heat blossoms into burning lust. Part of you wants to stop, but most of you wants to get even more! The foreplay comes to a screeching halt as you let out a bestial growl and thrust into her.");
		if(pc.cocks[x].cLength() < 14) 
		{
			output("\n\nYour " + pc.mf("manhood","she-dick") + " sinks in without a single bit of resistance. For a second it almost feels like you’ve found yourself in a wet, steamy cave, until her muscles constrict into a tight knot around you. <i>“Don’t worry little [pc.boyGirl], you can still satisfy me, despite your... lack of volume.”</i>");
			output("\n\nOk, that’s enough! You plant yourself firmly and thrust as hard as your [pc.hips] will carry you. The condescending cat-bitch actually seems taken off guard by your ferocity. She tries to keep up her domineering posture, but falters under your angered pumps.");
			output("\n\n<i>“S-see? Just a little effort and you can- YAAGH!”</i> You slap her across the hindquarters to get her to shut up and let you work. The slaps keep coming, integrated into your routine between thrusts. Her confident veneer melts away completely as you reduce her to what she really is; a cock-hungry bitch who just wants to get plugged!");
		}
		else if(pc.cocks[x].cLength() < 19)
		{
			output("\n\nThe Temptress moans as you sink your meat in. Every inch passes through with just the right amount of resistance, and you settle in her depths feeling like a king. <i>“Ooooh, there you go! Nice and big, just like a real milodan. Of course, you’ve just started. I do hope you don’t let me down after such a grand entrance.”</i>");
			output("\n\nHer smugness is palpable, even beyond her shit-eating grin. In response you pull back and thrust in as hard as you can; again, and again, and again. She takes your slamming pumps like a champ, meeting each one with a press of her own.");
			output("\n\nHer smirk grows wider and wider despite your efforts. <i>“Good start here. I’d give it a solid C.”</i>");
			output("\n\nLooks like you’re going to have to give her everything in order to put her in her place. You bunker down and start battering her down with every ounce of strength you can muster. The effect is immediate when you see her flinch on the first jab. That drives you to keep going; faster, harder, stronger! You beat down her prideful grin one booty-quaking thrust at a time. The struggling slut even tries to slow you down by squeezing down harder, but you’ve built up enough momentum to break through it.");
			output("\n\nIn short order you melt any pretense of confidence she had, reducing her to the babbling, cock-craving slut she really is!");
		}
		else
		{
			output("\n\nThe Temptress’s jaw drops as she lets out a silent scream. She wasn’t expecting you to stuff so much of yourself in all at once. It’s not an uncommon reaction; you downright expect it at this point, with a cock of your magnitude. Still, it never gets old watching them squirm when they just can’t take it, especially when they still try and act in charge like she is.");
			output("\n\nShe tries to maintain her smug grin, but she’s noticeably buckling under the weight of your [pc.cock]. <i>“O-oh m-my, it feels even b-bigger than it looks! But s-size isn’t e-everything of c-course. You must know how to uUUUUUUUUUUUSE IT!”</i> You shift your ogre meat a few inches, causing her to completely lose composure.");
			output("\n\nThat’s the signal you need to start thrusting again. You pull out, dragging inch upon inch of thick meat out of her snatch, feeling her struggle not to cum with each one. You get to the tip and let her rest for a second. You can see just how messed up she is already, and it makes you <i>throb</i> in satisfaction.");
			output("\n\nShe opens her mouth to talk again and you pick that moment to jam yourself back in. The milodan MILF’s words disintegrate into pleasured, whorish moans, and you doubt she’s in much of a position to let out much else. You don’t give her any more breaks after that, going as fast as her limits will allow. Surprisingly she doesn’t cum right away like she was close to doing just a minute ago. In fact, you’d say she’s actually getting used to it. Good on her.");
		}
		output("\n\nYou break out into a rut, slamming your [pc.hips] into hers like a jackhammer burrowing into pavement. It should hurt at least a bit, but whatever’s in her pussy juices that’s getting you so turned on seems to be numbing any other sensations to keep you focused on fucking. Not that there’s anything wrong with that. The Temptress sure doesn’t think there is either.");
		output("\n\nThe placid bitch is eagerly juicing herself on your [pc.cock], letting you have your way with her completely, and forgoing her previous smug attitude from earlier, just focusing on getting railed. Man, you love a good, eager bitch! You give her a few good slaps, listening to her moans pitch up an octave as she enjoys your tough treatment.");
		output("\n\nYou think it’s time for a change, though. Grasping her haunches even hard, you pull her back, sending to two of you flying backward, your [pc.cock] still buried inside the convulsing cat cunt. You land on your [pc.ass], with the Temptress quickly following, spearing herself on your member as she starts to juice herself on your lap.");
		output("\n\nBefore you can restart thrusting, she turns and starts making out with you. You return the favor as you start up again. Your room for thrusting has been significantly diminished, but the milodan mistress is more than willing to pick up the slack. The bruise-inducing rut continues like a speeding train. Even her starting to cum her brains out through her cunt doesn’t put a hitch in your rhythm.");
		output("\n\nPre starts to ");
		if(cumQ < 50) output("seep");
		else if(cumQ < 3000) output("drool");
		else if(cumQ < 30000) output("spray");
		else output("blast");
		output(" out of your cumslit at the feeling of her clamping down on you. Under normal circumstances, you’d feel like slowing down in order to prolong this as long as possible; but the combination of drugged juices, her foreplay, and the thought of siring a litter of bastards with your conquered enemy means that holding back isn’t an option in your mind any more!");
		output("\n\nYou grab her as tight as you can and thrust your [pc.cock] into her as far as possible. The Temptress catches on almost instantly, and seems more than supportive of what you’re about to do. <i>“Are you going to give me a nice litter, outsider? You’re so strong and virile. I bet our children will be immaculate!”</i> She squeezes down on you like a vice, causing you to wince. <i>“Breed. Me!”</i>");
		if(cumQ < 500) 
		{
			output("\n\nYou fulfill her desire with gusto, pumping every drop of [pc.cum] you can muster into her. Her honeypot squeezes you for more, the greedy hole seeming to want and want no matter how much you give it. Part of you wishes you’d juiced up your production some more before going into this, " + (pc.cumQuality() == 0 ? "but it’s not like you’d be knocking her up anyway":"but hopefully it’s still enough to stick") + ".");
		}
		else if(cumQ < 10000)
		{
			output("\n\nBig boi output:Her words echo from your head down to your [pc.balls] as you unload gloriously. Her belly bloats as you sigh in relief at finally dumping what must be gallons of [pc.cum] into a willing receptacle. The Temptress cradles her swollen gut, reveling in the feeling of inevitable motherhood" + (pc.cumQuality() == 0 ? ", though <i>you</i> know that’s not going to happen":"") + ". She sighs and turns to kiss you again, rewarding the " + (pc.cumQuality() == 0 ? "supposed ":"") + pc.mf("father","mother") + " of her future litter. All the while you keep cumming, keep stuffing her until you run dry after pumping her out to the point where she looks like she’s about to pump out twins.");
		}
		else 
		{
			output("\n\nSuper duper big boi output:Her wishes are granted and then some. She recoils back in surprise as her gut fills out into a titanic, cum-stuffed tub. That was just the first shot too. The next spurt fills her to even more insane proportions. Her stomach is hanging down to your legs by the time she’s too full to take any more. Either milodans can really pack it in or your [pc.cum] is magic!");
			output("\n\nEven that’s not the end of it, it never is. You spurt and spurt, pressurized streams of spunk flying out of her overstuffed honeypot and onto your [pc.legOrLegs] and pooling on the cold ground. It pools until you feel it get about half-way up your [pc.ass].");
			output("\n\n<i>“O-oh my. Your women must be utterly blessed to have breeders of your caliber. If I could save this I could spread your seed to every empty womb in our tribe.”</i> You let out another thick spurt as she says that, even though you were already nearly empty. <i>“Mhmm, maybe even enough to do it twice over.”</i> The thought of seeding a whole tribe of busty bitches gets your [pc.balls] working over time to dredge up another load for you, but you don’t have time to go again right now.");
		}
		output("\n\nYou push the Temptress off and sit up. She doesn’t follow, instead deciding to just lay on the ground and revel in the warm bounty you’ve given her.");
		output("\n\n<i>“Nice to know that even if we lose this I’ll come away with something to remember it by.");
		//9999 add back in if questy makes this possible: I might even track you down after they’re born so I can get another round. Would you like that? I know you would if how eager you were this time is any indication."
		output("”</i>");
		output("\n\nYou try and ignore both her and how horny her proposal makes you as you " + (!pc.isCrotchExposed() ? "re-cover and ":"") + "get ready to move." + (!pc.isCrotchExposed() ? " Your [pc.crotchCovers] feel noticeably tighter as you look back and see the milodan minx wave sensually at you.":" Your [pc.cock] stiffens noticeably as you look back at the milodan minx. Her eyes are glued to your shaft as it involuntarily expands under her scrutiny.") + " You turn and start moving away quicker, before you’re tempted into another round!");
	}
	output("\n\n");
	processTime(45);
	pc.lust(150);
	enemy.loadInCunt(pc,x);
	if(y >= 0) enemy.loadInAss(pc);
	pc.orgasm();
	wargiiFightWinRouting();
}