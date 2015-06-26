package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ZilRation extends ItemSlotClass
	{
		
		//constructor
		public function ZilRation()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			
			//Used on inventory buttons
			this.shortName = "ZilRation";
			
			//Regular name
			this.longName = "tasty-smelling zil ration";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a tasty-smelling zil ration";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "These are dried rations appear to be made from local fruits and plant nectars. There's a good chance that something in it would make you sick if you didn't have a microsurgeon-boosted immune system. In your case, you'll probably just undergo a mutation or two.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 0;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var changeLimit:int = 1;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			if(rand(3) == 0) changeLimit++;
			if(rand(3) == 0) changeLimit++;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.output("You unwrap the dried fruits and find them to be surprisingly tasty. They're both sweet and a touch spicy to your tongue at the some time. Some of the rations even have a nectar glaze applied to them to make them even more delicious. Before you know it, they're gone.");
				
				//Stat TFs before everything!
				if(rand(3) == 0 && changes < changeLimit && target.libido() < 40) {
					if(target.libido() < 10) kGAMECLASS.output("\n\nIdly daydreaming as you examine the lingering taste in your mouth, you find yourself considering the zil and their oddly sexual rituals and society. Do they try to fuck every stranger they meet? What would it be like to live like that.... You shake your head to clear the errant thoughts away, a slight blush on your [pc.skin].");
					else if(target.libido() < 30) {
						kGAMECLASS.output("\n\nYou idly rub at your crotch");
						if(target.isCrotchGarbed()) kGAMECLASS.output(" through your [pc.lowerGarment]");
						kGAMECLASS.output(" while entertaining a daydream about an encounter will a zil in the jungle. " + target.mf("She","He") + " comes upon you before you're ready and instead of fighting, you offer not to resist... in exchange for more rations.\n\nShaking your head to clear away the increasingly lustful fantasy, you can't help but wonder if this stuff is effecting you somehow... spiking your libido to match the aliens' own.");
						target.lust(5);
					}
					else {
						kGAMECLASS.output("\n\nA wicked thought surfaces in your mind: what if the zil are just misunderstood? What if they live a freer, happier existence by strutting around like they do, seducing any new person they meet into a pleasure-filled coupling. You start heating up the more you think about it until you're almost overwhelmed by desire. You fan at your neck to cool off, turning your attention back to the taste in your mouth. This stuff is definitely boosting your libido.");
						target.lust(10);
					}
					target.slowStatGain("libido",1+rand(2));
					changes++;
				}
				if(rand(3) == 0 && changes < changeLimit && target.reflexes() < 5) {
					kGAMECLASS.output("\n\nYou feel... twitchy - agitated. If a mosquito or similar creature tried landing on you right now, you'd probably swat it away before it got anywhere near biting you. Your reflexes feel sharpened... honed.");
					target.slowStatGain("reflexes",.5);
					changes++;
				}
				if(rand(3) == 0 && changes < changeLimit && target.physique() < 4) {
					kGAMECLASS.output("\n\nThe alien food does more than make you feel full, though. It leaves you full of vim and vigor, suffused with more vitality than you're used to experience. It reminds you of the high you get from a good workout.");
					target.slowStatGain("physique",.5);
					changes++;
				}
				//Randomly order male & female TFs so neither takes priority for herms!
				choices = new Array();
				//Masculine Focused Changes
				if(target.hasCock()) {
					choices[choices.length] = dudeZilTfs;
				}
				if(target.hasVagina()) {
					choices[choices.length] = chickZilTfs;
				}
				while(choices.length > 0) {
					x = rand(choices.length);
					changes = choices[x](target,changes,changeLimit);
					choices.splice(x,1);
				}
				//Gender Neutral TFs
				//Human-style face
				if(target.faceTypeUnlocked(GLOBAL.TYPE_HUMAN) && target.skinType != GLOBAL.SKIN_TYPE_FUR && target.faceType != GLOBAL.TYPE_HUMAN && changes < changeLimit && rand(4) == 0) {
					//Has muzzle
					if(target.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) {
						kGAMECLASS.output("\n\nYour snout compresses, your bones flowing like butter, reforming your jaw into a much more compact package. Surprisingly, it doesn't really hurt. It's more disconcerting than anything, making you dizzy as the change completes. You use the camera on your codex to check on the results and discover <b>you have a face shaped much like a human's!</b>");
					}
					//Otherwise
					else kGAMECLASS.output("\n\nA strange numbness spreads out across your face, starting at your lips before penetrating deeper, into your very bones. There's a transient sense of dizziness that leaves you grabbing your head to steady yourself, and when you do, <b>you find that your [pc.face] has shifted into a human-shaped visage!</b>");
					target.clearFaceFlags();
					target.faceType = GLOBAL.TYPE_HUMAN;
					changes++;
				}
				else if (!target.faceTypeUnlocked(GLOBAL.TYPE_HUMAN))
				{
					kGAMECLASS.output(target.skinTypeLockedMessage());
				}
				
				//Legs to chitin-armored.
				if(target.legTypeUnlocked(GLOBAL.TYPE_BEE) && target.legCountUnlocked(2) && target.armType == GLOBAL.TYPE_BEE && target.legType != GLOBAL.TYPE_BEE && changes < changeLimit && rand(3) == 0) {
					//First split single things into multiples!
					if(target.legCount == 1) kGAMECLASS.output("\n\nYou fall flat on your [pc.butt] as your [pc.leg] begins to writhe, splitting apart into two lengths of rapidly shaping flesh.");
					//First get rid of taurbodies and merge legs
					else if(target.legCount > 2) {
						kGAMECLASS.output("\n\nStrangely, you find yourself dumped on your ass out of the blue. Your [pc.legs] are thrashing on the ground, the flesh writhing, squirming and reshaping. ");
						if(target.legCount > 3) kGAMECLASS.output("All but two of your [pc.legs] begin to dwindle");
						else kGAMECLASS.output("Your extra [pc.leg] begins to dwindle");
						kGAMECLASS.output(", and the supporting muscles diminish along with it. The longer it goes on, the faster the transformation goes. Before you know it, you're down to two [pc.legs], and they're changing even further.");
					}
					//Else intro
					else kGAMECLASS.output("\n\nYou're dumped on your ass when your [pc.legs] turn to jelly, going numb as they start to change.");
					//Not plantigrade!
					if(!target.hasLegFlag(GLOBAL.FLAG_PLANTIGRADE)) kGAMECLASS.output(" They quickly form into a plantigrade shape and resolve further into a very humanoid look, complete with five toes.");
					kGAMECLASS.output(" A black encasement forms around the tip, then divides into an armored incasement for your toes. Each tiny digit gleams shiny black, covered in chitinous armor.  Maneuverable joints appear wherever you would need to bend or flex. Then, the blackness travels up like a wave of slippery oil. Every inch of your body below the thigh is swiftly encased in the gleaming, ebony armor, and there, the transformation stops. While you take a few experimental steps to get used to <b>your new zil-like legs</b>, a tuft of yellow fluff grows out into a soft border between you and your new legs.");
					target.clearLegFlags();
					target.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
					target.addLegFlag(GLOBAL.FLAG_SMOOTH);
					target.legType = GLOBAL.TYPE_BEE;
					target.legCount = 2;
					target.genitalSpot = 0;
					changes++;
				}
				else if (!target.legCountUnlocked(2))
				{
					kGAMECLASS.output(target.legCountLockedMessage());
				}
				else if (!target.legTypeUnlocked(GLOBAL.TYPE_BEE))
				{
					kGAMECLASS.output(target.legTypeLockedMessage());
				}
				
				//Arms to chitin-armored.
				if(target.armTypeUnlocked(GLOBAL.TYPE_BEE) && target.armType != GLOBAL.TYPE_BEE && changes < changeLimit && rand(3) == 0) {
					kGAMECLASS.output("\n\nStarting at your fingertips, you feel your [pc.skinFurScales] tightening, slowly shaping into a smooth, black expanse. The inky, chitinous darkness expands to cover the whole of your hand, forming joints to allow the hardening flesh to allow you movement. It doesn't stop there. Your wrists and your forearms are encased in ebony armor, followed shortly after by about half of your upper arms. The border between your [pc.skinFurScales] and the growth fluffs up with a tuft of yellowish fuzz, similar to that of a zil. <b>You have chitin-armored arms now.</b>");
					target.armType = GLOBAL.TYPE_BEE;
					changes++;
				}
				else if (!target.armTypeUnlocked(GLOBAL.TYPE_BEE))
				{
					kGAMECLASS.output(target.armTypeLockedMessage());
				}
				
				//Removal of fur
				if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN) && target.skinType == GLOBAL.SKIN_TYPE_FUR && changes < changeLimit && rand(3) == 0) {
					kGAMECLASS.output("\n\nYou idly itch at your [pc.belly]. When you finish, there's a patch of bare [pc.skin] there, and the itch is spreading! You scratch madly, shedding [pc.skinFurScales] everywhere. There's no relief from the itch until you've scrubbed every bit of hair from a particular spot. Needless to say, it takes a solid fifteen minutes to get rid of it and leave you with ");
					target.skinType = GLOBAL.SKIN_TYPE_SKIN;
					target.clearSkinFlags();
					kGAMECLASS.output("[pc.skin].")
					changes++;
					//Pass 15m
					kGAMECLASS.processTime(15);
				}
				else if (!target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
				{
					kGAMECLASS.output(target.skinTypeLockedMessage());
				}
				
				if(changes == 0) {
					kGAMECLASS.output("\n\nNothing special happened, though you do feel a bit fuller.")
				}
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " eats the rations to no effect.");
			}
			return false;
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
		protected function chickZilTfs(target:Creature,changes:int,changeLimit:int):Number {
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			//Zilcunt!
			if(target.vaginaTotal(GLOBAL.TYPE_BEE) < target.vaginaTotal() && changes < changeLimit && rand(3) == 0) {
				x = 0;
				choices = new Array();
				//Make a list of all the nonbeecunts
				while(x < target.vaginaTotal())
				{
					if(target.vaginas[x].type != GLOBAL.TYPE_BEE) choices[choices.length] = x;
					x++;
				}
				x = choices[rand(choices.length)];
				kGAMECLASS.output("\n\nA ticklish feeling in your groin alerts you to a coming change, and you rapidly");
				if(target.isNude()) kGAMECLASS.output(" bend over to check it out");
				else kGAMECLASS.output(" strip out of your [pc.gear] to see what's going on");
				kGAMECLASS.output(". Your [pc.vagina " + x+ "] is rapidly engorging");
				if(target.vaginaTotal() == 2) kGAMECLASS.output(" along with your other entrance");
				else if(target.vaginaTotal()  > 2) kGAMECLASS.output(" along with your other entrances");
				if(target.vaginaTotal() == 1) kGAMECLASS.output(". It starts ");
				else kGAMECLASS.output(". They start ");
				kGAMECLASS.output("leaking lubricant as you watch the lips plump and reshape slightly, blotches of yellow and black rolling across your skin as your body adapts to the foreign foods. The shifting hues settle into a shiny, almost lightless black, leaving the exterior of your [pc.vaginas] dusky. You pry ");
				if(target.vaginaTotal() == 1) kGAMECLASS.output("it");
				else kGAMECLASS.output("they");
				kGAMECLASS.output(" open to find");
				if(target.vaginas[x].clits > 1) {
					kGAMECLASS.output(" yourself with " + kGAMECLASS.num2Text(target.vaginas[x].clits - 1) + " less clit");
					if(target.vaginas[x].clits > 2) kGAMECLASS.output("s");
					if(target.vaginaTotal() > 1) kGAMECLASS.output(" at each channel");
					kGAMECLASS.output(" than before and");
				}
				kGAMECLASS.output(" a yellow-gold hue reminiscent of some zil. It seems ");
				if(target.vaginaTotal() == 1) kGAMECLASS.output("<b>you have a zil-like pussy now!</b>");
				else kGAMECLASS.output("<b>you have zil-like pussies now!</b>");
				//Loop through and set 'em all, baby!
				for(x = 0; x < target.totalVaginas(); x++)
				{
					target.shiftVagina(x, GLOBAL.TYPE_BEE);
				}
				changes++;
			}
			//Clit shrinkage - down to one inch!!
			var newClitLength:Number = target.clitLength;
			newClitLength -= 1;
			newClitLength = Math.round((rand(newClitLength / 4 * 10) / 10 + newClitLength / 4 + .2) * 10) / 10;
			newClitLength = target.clitLength - newClitLength;
			
			if(target.clitLength > 1 && target.clitLengthUnlocked(newClitLength) && changes < changeLimit && rand(3) == 0) {
				kGAMECLASS.output("\n\nTickles of tingling pleasure race up and down your [pc.clits] until ");
				if(target.totalClits() == 1) kGAMECLASS.output("it peeks out of its hood");
				else kGAMECLASS.output("they peek out of their hoods");
				kGAMECLASS.output(", growing to a full, rigid size almost immediately. ");
				if(target.isCrotchGarbed()) kGAMECLASS.output("You pull open your [pc.lowerGarment] to check on the sudden change");
				else kGAMECLASS.output("You bend over to check on the sudden change");
				kGAMECLASS.output(" just in time to see ");
				if(target.totalClits() == 1) kGAMECLASS.output("it");
				else kGAMECLASS.output("them");
				kGAMECLASS.output(" start shrinking, still fully engorged and sensitive but compacting down to a more reasonable size.");

				if(y >= 3) kGAMECLASS.output(" You wind up losing a few inches of clitoral length by the time it stabilizes.");
				else if(y >= 1.75) kGAMECLASS.output(" You wind up losing about two inches of clitoral length by the time it stabilizes.");
				else if(y >= 1.1) kGAMECLASS.output(" You wind up losing a little over an inch by the time it stabilizes.");
				else if(y >= .75) kGAMECLASS.output(" You wind up losing around an inch by the time it stabilizes.");
				else kGAMECLASS.output(" You wind up losing a fraction of an inch of your overall clitoral length by the time it stabilizes.");
				target.clitLength = newClitLength;
				changes++;
			}
			else if (!target.clitLengthUnlocked(newClitLength))
			{
				kGAMECLASS.output(target.clitLengthLockedMessage());
			}
			
			//Wetness to ⅖ - gotta check if pc needs it somewhere
			x = 0;
			choices = new Array();
			while (x < target.totalVaginas()) {
				if(target.wetness(x) < 2 && target.wetnessUnlocked(x, 2)) {
					choices[choices.length] = x;
				}
				x++;
			}
			x = choices[rand(choices.length)];
			if(target.wetness(x) < 2 && target.wetnessUnlocked(x, 2) && rand(3) == 0 && changes < changeLimit) {
				//No wetness
				if(target.wetness(x) == 0) kGAMECLASS.output("\n\nWhile you digest the snack, you become increasingly aware of a slippery feeling down below, much different than the dry emptiness you've become accustomed to. You tentative slip a finger into [pc.oneVagina] and discover that <b>you've started naturally lubricating yourself.</b>");
				//Less than 2 wetness
				else {
					kGAMECLASS.output("\n\nWhile you digest the snack, you become more and more of a burgeoning wetness ");
					if(target.legCount > 1) kGAMECLASS.output("between your [pc.legs]");
					else kGAMECLASS.output("above your [pc.leg]");
					kGAMECLASS.output(". It's almost as slippery as when you're really, really turned, but you aren't even ");
					if(target.lust() <= 33) kGAMECLASS.output("thinking about sex right now");
					else if(target.lust() <= 66) kGAMECLASS.output("that focused on sex right now");
					else kGAMECLASS.output("anticipating getting laid right now");
					kGAMECLASS.output("! You guess that <b>you're just getting more slippery ");
					if(target.hasCock()) kGAMECLASS.output("female ");
					kGAMECLASS.output("genitals, like a zil woman.</b>");
				}
				target.vaginas[x].wetnessRaw++;
				changes++;
			}
			else if (!target.wetnessUnlocked(x, 2))
			{
				kGAMECLASS.output(target.wetnessLockedMessage());
			}
			
			//Find biggest Tit row!
			x = 0;
			y = 0;
			choices = new Array();
			while (x < target.bRows()) {
				if(target.breastRows[x].breastRatingRaw > target.breastRows[y].breastRatingRaw) {
					y = x;
				}
				x++;
			}
			//Breast shrink to large EE's
			if(target.bRatingRaw(x) >= 11 && target.breastRatingUnlocked(x, 11) && changes < changeLimit && rand(2) == 0) {
				kGAMECLASS.output("\n\nA ripple runs through ");
				if(target.bRows() == 1) kGAMECLASS.output("your [pc.chest]");
				else if(x == 0) kGAMECLASS.output("your top row of breasts");
				else if(x == 1) kGAMECLASS.output("your second row of breasts");
				else if(x == 2) kGAMECLASS.output("your third row of breasts");
				else kGAMECLASS.output("one of your lower rows of breasts");
				kGAMECLASS.output(". It almost throws you off balance with how generously it shakes the girls around! In its wake, the [pc.skin] covering them starts feeling tight, a little tingly even. You heft your weighty chest with concern, only to feel your [pc.breasts " + x + "] diminishing in your hands. They stabilize a while later at a " + target.breastCup(x) + ".");
				kGAMECLASS.output(" Your [pc.nipples " + x + "] tighten up right along with your smaller breasts to keep themselves proportional to your reduced bust.");
				y = target.bRatingRaw(x) - 11;
				y = Math.round((rand(y/4*10)/10 + y/4 + 1)*10)/10;
				target.breastRows[x].breastRatingRaw -= y;
				changes++;
			}
			else if (!target.breastRatingUnlocked(x, 11))
			{
				kGAMECLASS.output(target.breastRatingLockedMessage());
			}
			
			//Breasts grow to C's - top row only
			if(target.bRating(0) < 3 && target.breastRatingUnlocked(0, target.bRating(0) + 1) && changes < changeLimit && rand(2) == 0) {
				kGAMECLASS.output("\n\nA tightness builds in your chest until you feel your upper body gaining a little weight.");
				//Flat chest
				if(target.bRating(0) < 1) {
					kGAMECLASS.output(" Your pecs swell with a slight, feminine curve - <b>you could probably fit into A-cups now!</b>");
				}
				//A cups
				else if(target.bRating(0) < 2) {
					kGAMECLASS.output(" Your A-cups slowly blossom into a burgeoning pair of B-cups");
					if(target.bRows() > 1) {
						kGAMECLASS.output(", though the additional ");
						if(target.bRows() == 2) kGAMECLASS.output("row does't change");
						else kGAMECLASS.output("rows don't change");
						kGAMECLASS.output(" - just the top one");
					}
					kGAMECLASS.output(". Cupping them in your hands, you tentatively hold your newly expanded chest. It's quite sensitive and is just big enough to have a little bit of jiggle.");
				}
				//B cups
				else {
					kGAMECLASS.output(" Your B-cups tingle pleasantly, giving you just enough time to get your hands up to wrap around them. Almost on cue, your breasts swell up into your hands, expanding and jiggling with each passing moment, feeling so warm and wonderful as they expand. <b>You barely suppress a moan as you grow into nicely-rounded C-cups.</b> They still tingly hotly with the pleasant aftershocks of excitement.");
					target.lust(5);
				}
				target.breastRows[0].breastRatingRaw++;
				changes++;
			}
			else if (!target.breastRatingUnlocked(0, 3))
			{
				kGAMECLASS.output(target.breastRatingLockedMessage());
			}
			
			//Hips widen to 6
			if(target.hipRatingRaw < 6 && target.hipRatingUnlocked(target.hipRatingRaw + 1) && changes < changeLimit && rand(3) == 0) {
				kGAMECLASS.output("\n\nYou adjust idly adjust your posture only to have to do it again a second later. ");
				if(target.armor.shortName != "") kGAMECLASS.output("Your [pc.armor.longName] creaks ominously. Your [pc.hips] are getting bigger!");
				else kGAMECLASS.output("You look down and watch, and then you spot it: your [pc.hips] are getting bigger!");
				kGAMECLASS.output(" The change is slow enough to you almost missed it, but <b>there's definitely a little extra thickness to your waist.</b>");
				target.hipRatingRaw++;
				changes++;
			}
			else if (!target.hipRatingUnlocked(target.hipRatingRaw + 1))
			{
				kGAMECLASS.output(target.hipRatingLockedMessage());
			}
			
			//Butt expands to 7
			if(target.buttRatingRaw < 7 && target.buttRatingUnlocked(target.buttRatingRaw + 1) && changes < changeLimit && rand(3) == 0) {
				kGAMECLASS.output("\n\nAn odd feeling runs through your [pc.butt], earning a small jump of surprise at the abrupt onset of sensation. It reminds you of that pins and needles feeling you get when part of you falls asleep, only on your ass. You reach back, massaging the feeling away and find yourself with a little bit more cheek in your hand than before. <b>Your [pc.butt] has gotten bigger!</b>");
				target.buttRatingRaw++;
				changes++;
			}
			else if (!target.buttRatingUnlocked(target.buttRatingRaw + 1))
			{
				kGAMECLASS.output(target.buttRatingLockedMessage());
			}
			
			//HONEY GIRLCUM! - Req's appropriate wetness of 2 first.
			x = 0;
			y = 1;
			while (x < target.totalVaginas()) {
				if(target.wetness(x) < 2) {
					y = 0;
				}
				x++;
			}
			if(target.girlCumType != GLOBAL.FLUID_TYPE_HONEY && target.girlCumTypeUnlocked(GLOBAL.FLUID_TYPE_HONEY) && y == 1 && changes < changeLimit && rand(3) == 0) {
				kGAMECLASS.output("\n\nYou stumble as an unexpected wetness builds ");
				if(target.legCount > 1) kGAMECLASS.output("between your [pc.legs]");
				else kGAMECLASS.output("at the joint between your [pc.leg] and your [pc.hips]");
				kGAMECLASS.output(". Not that it's unwelcome. It feels quite pleasant, but you weren't really planning on dealing with having such ");
				if(target.vaginaTotal() == 1) kGAMECLASS.output("a wet pussy");
				else kGAMECLASS.output("wet pussies");
				kGAMECLASS.output(". You gingerly touch your folds and shudder with excitement before drawing away. You'll need to get yourself off soon. Catching your nose, a sweet smell lingers on your fingertips. You look closer at the stained digits and realize that <b>your [pc.girlCum] has been replaced by a honey-like substitute!</b>");
				//Raise lust!
				target.lust(50);
				target.girlCumType = GLOBAL.FLUID_TYPE_HONEY;
				changes++;
			}
			else if (!target.girlCumTypeUnlocked(GLOBAL.FLUID_TYPE_HONEY))
			{
				kGAMECLASS.output(target.girlCumTypeLockedMessage());
			}
			
			//Grow zilbutt!
			if(target.armType == GLOBAL.TYPE_BEE && target.legType == GLOBAL.TYPE_BEE && target.tailType != GLOBAL.TYPE_BEE && target.tailTypeUnlocked(GLOBAL.TYPE_BEE) && changes < changeLimit && rand(3) == 0) {
				//Has tails!
				if(target.tailType != GLOBAL.TYPE_HUMAN && target.tailCount > 1) {
					kGAMECLASS.output("\n\nYour [pc.tails] twitch, compulsively squeezing together. Beating faster, your heart hammers with sudden excitement, and you can feel it heating warmer and warmer back there. The flesh of your tails feels so hot and so strange. Nerves are firing nonsensically, leaving you confused about what's happening back there. You turn for a look in time to see them moulding together into one bloated lump, vaguely reminiscent of an insectile abdomen. The surface of it turns black and hard, like chitin, and a strange pressure is building near the very tip of it.");
					kGAMECLASS.output("\n\nAn audible 'snick' fills the air as a stinger forces its way out of the very back, full of potent, arousing venom. <b>Your [pc.tails] have been replaced by a fully functional zil tail.</b>");
				}
				//Just one tail
				else if(target.tailType != GLOBAL.TYPE_HUMAN && target.tailCount > 0) {
					kGAMECLASS.output("\n\nYour [pc.tail] twitches, compulsively flexing and contracting down into a knotted ball of pain. Beating faster, your heart accelerates in sudden excitement, and you can feel it getting warmer and warmer back there. It feels so strange. Nerves are firing off-kilter, leaving you confused about just what's happening back there. You turn for a look in time to see that your [pc.tail] has turned into a large lump of flesh, vaguely reminiscent of an insectile abdomen. The surface blackens rapidly, picking up a polished shine as it does, like chitin, and a strange pressure builds near the very tip of it.");
					kGAMECLASS.output("\n\nAn audible 'snick' meets your [pc.ears] as a stinger forces its way out of the back, full of potent, arousing venom. <b>Your [pc.tail] has been replaced by a fully functional zil tail.</b>");
				}
				//No tail!
				else kGAMECLASS.output("\n\nJust at the bottom of your spine, right above your [pc.butt], a knot of heat blooms into existence. At first, it's not much of a bother, but the sensation gets less and less bearable over time. You even seem to be swelling back there! Suddenly, a wave of relief rolls over you, and out of the corner of your eye, you're treated to the sight of an insectile abdomen, black as night and slick with fluid, settling into place above your [pc.butt]. It bobs heavily, stinger in all. <b>It seems you have a fully functional zil tail!</b>");
				target.clearTailFlags();
				target.addTailFlag(GLOBAL.FLAG_SMOOTH);
				target.addTailFlag(GLOBAL.FLAG_STINGER_TIPPED);
				target.tailType = GLOBAL.TYPE_BEE;
				target.tailCount = 1;
				changes++;
			}
			else if (!target.tailTypeUnlocked(GLOBAL.TYPE_BEE))
			{
				kGAMECLASS.output(target.tailTypeLockedMessage());
			}
			return changes;
		}
		
		protected function dudeZilTfs(target:Creature,changes:int,changeLimit:int):Number {
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			var blockedChoices:Array;
			
			//Gain zilcock!
			if(target.cockTotal(GLOBAL.TYPE_BEE) < target.cockTotal() && changes < changeLimit && rand(3) == 0) {
				x = 0;
				choices = new Array();
				//Make a list of all the non-zil dicks
				while(x < target.cockTotal())
				{
					if (target.cocks[x].cType != GLOBAL.TYPE_BEE && target.cockTypeUnlocked(x, GLOBAL.TYPE_BEE)) choices[choices.length] = x;
					if (!target.cockTypeUnlocked(x, GLOBAL.TYPE_BEE)) blockedChoices.push(x);
					x++;
				}
				
				//Pick a random dick out of the list
				if (choices.length > 0)
				{
					x = choices[rand(choices.length)];
					kGAMECLASS.output("\n\nYour [pc.cock " + x + "] suddenly trembles, getting hard in fitful throbs and spurts of engorgement");
					if(target.totalCocks() > 1) 
					{ 
						kGAMECLASS.output(" until it stands out from ");
						if(target.cockTotal() == 2) kGAMECLASS.output("your other flaccid dick");
						else kGAMECLASS.output("the rest of your [pc.cocks]");
					}
					kGAMECLASS.output(". You look down, wide-eyed at the tumescent penis. You didn't do anything particularly arousing. Is it swelling up from an allergic reaction? Before you can posit any other theories, the changes start. ");
					if(target.hasSheath(x)) {
						kGAMECLASS.output(" Your sheath expands out, flowing over your length with the inevitability of a wave. You fumble to try and hold it back, but it's so sensitive that you lose your grip almost immediately.");
						if(target.hasKnot(x)) kGAMECLASS.output(" It quickly envelops your knot. The rounded distention flattens almost as soon as its covered.");
						kGAMECLASS.output(" Watching it happen, you realize that the skin isn't expanding so much stretching out, lengthening to give your entire penis a sensitive shroud. It's soon wrapped around your [pc.cockHead " + x + "]");
						if(target.hasCockFlag(GLOBAL.FLAG_BLUNT) || target.hasCockFlag(GLOBAL.FLAG_FLARED) || target.hasCockFlag(GLOBAL.FLAG_TAPERED)) kGAMECLASS.output(", rounding it out into a rather human-like shape under its new wrapping");
						kGAMECLASS.output(".");
					}
					//"No Sheath:
					else 
					{
						kGAMECLASS.output(" The skin of your [pc.cock " + x + "] is thickening perceptibly.");
						if(target.hasKnot(x)) kGAMECLASS.output(" It's definitely worst on your knot, which is shrinking away before your eyes. Soon your familiar bulge is reduced to just another part of your smoothing shaft. Higher,");
						else kGAMECLASS.output("Up");
						kGAMECLASS.output(" at the [pc.cockHead " + x+ "], the skin separates into two layers, an inner and outer layer. You're growing a long, stretchy foreskin");
						if(target.hasCockFlag(GLOBAL.FLAG_BLUNT) || target.hasCockFlag(GLOBAL.FLAG_FLARED) || target.hasCockFlag(GLOBAL.FLAG_TAPERED)) 
							kGAMECLASS.output(", moulding your phallus into a more human-like shape as it develops");
						kGAMECLASS.output("! All traces of its old appearance long gone, <b>you find yourself with a gently-wilting zil-cock</b> packed with enough foreskin to stay covered - even when hard.");
					}
					
					target.shiftCock(x,GLOBAL.TYPE_BEE);
					changes++;
				}
				else if (blockedChoices.length > 0)
				{
					// In case you wanna do something special with the lock message.
					//x = blockedChoices[rand(blockedChoices.length)];
					
					kGAMECLASS.output(target.cockTypeLockedMessage());
				}
			}
			//Dick shrinkage - shrink down to 8" max
			if(target.longestCockLength() > 8 && changes < changeLimit && rand(2) == 0) {
				x = 0;
				choices = new Array();
				blockedChoices = new Array();
				
				//Make a list of all the big
				while(x < target.cockTotal())
				{
					if (target.cocks[x].cLengthRaw > 8 && target.cockLengthUnlocked(x, 8)) choices[choices.length] = x;
					if (!target.cockLengthUnlocked(x, 8)) blockedChoices.push(x);
					x++;
				}
				
				//Pick a random dick out of the list
				if (choices.length > 0)
				{
					x = choices[rand(choices.length)];
					kGAMECLASS.output("\n\nA tightness in your package is the only warning your get before your [pc.cock " + x + "] starts shrinking.");
					y = target.cocks[x].cLengthRaw - 8;
					y = Math.round((rand(y/4*10)/10 + y/4 + 1)*10)/10;
					if(target.hasPerk("Mini")) y *= 2;
					if(y > 22 && target.hasPerk("Mini")) y = 22;
					else if(y > 11) y = 11;
					if(y >= target.cocks[x].cLengthRaw) y = target.cocks[x].cLengthRaw - 1;

					if(y >= 13) kGAMECLASS.output(" Inch after inch, it shortens rapidly until you've lost well over a foot of cock flesh.");
					else if(y >= 9) kGAMECLASS.output(" An inch at a time, it shortens until you've lost the better part of a foot.");
					else if(y >= 2) kGAMECLASS.output(" It recedes until you've lost " + kGAMECLASS.num2Text(Math.round(y)) + " inches from your length.");
					else if(y >= 1.1) kGAMECLASS.output(" Gradually, you lose well over an inch.");
					else kGAMECLASS.output(" Gradually, you lose about an inch.");
					target.cocks[x].cLengthRaw -= y;
					kGAMECLASS.output(" Your girth thins to match your new proportions more appropriately. It's still pretty thick, all things considered.");
					changes++;
				}
				else if (blockedChoices.length > 0)
				{
					// x = blockedChoices[rand(blockedChoices.length)];
					kGAMECLASS.output(target.cockLengthLockedMessage());
				}
			}
			//Girth booster!
			//Search for dick that needs girthening first!
			x = 0;
			choices = new Array();
			blockedChoices = new Array();
			
			//Make a list of all the girth needing
			while(x < target.cockTotal())
			{
				if (target.cocks[x].cThicknessRatioRaw < 1.5 && target.cockThicknessUnlocked(x, 1.5)) choices[choices.length] = x;
				if (!target.cockThicknessUnlocked(x, 1.5)) blockedChoices.push(x);
				x++;
			}
			//Pick a random dick out of the list
			if (choices.length > 0)
			{
				x = choices[rand(choices.length)];
				if(choices.length == 0) x = -1;
				//If you got a dick that needs thickening, take the chance!
				if(x != -1 && changes < changeLimit && rand(2) == 0) {
					kGAMECLASS.output("\n\nOhhh, something feels nice in your crotch. You reach down to find the source, grabbing your [pc.cock " + x + "] ");
					if(target.cockTotal() == 1) kGAMECLASS.output("in your hand");
					else if(target.cockTotal() == 2) kGAMECLASS.output("out from next to its less excited brother");
					else kGAMECLASS.output("out from next to its less excited brethren");
					kGAMECLASS.output(". Almost immediately, you feel it pulsate and thicken, hardening with alarming rapidity. Soon, you're holding a full-sized rager, but it doesn't stop there. The shaft continues to thicken, slowly spreading your fingers wider and wider as it gains about a quarter inch of additional girth.");
					target.cocks[x].cThicknessRatioRaw += .1;
					changes++;
				}
			}
			else if (blockedChoices.length > 0)
			{
				// x = blockedChoices[rand(blockedChoices.length)];
				kGAMECLASS.output(target.cockThicknessLockedMessage());
			}
			
			//Ball shrinkage
			var newBallSize:Number = target.ballSizeRaw - 3.5;
			newBallSize = Math.round((rand(newBallSize / 4 * 10) / 10 + newBallSize / 4 + .5) * 10) / 10;
			newBallSize = target.ballSizeRaw - newBallSize;
			
			if(target.balls > 0 && target.ballSizeRaw >= 4 && target.ballSizeUnlocked(newBallSize) && changes < changeLimit && rand(2) == 0) {
				kGAMECLASS.output("\n\nYour weighty sack weighs less and less on you with each passing moment. You look down to watch, treated to the sight of your [pc.balls] compressing down into a tighter, more compact package.");
				y = target.ballSizeRaw - 3.5;
				y = Math.round((rand(y/4*10)/10 + y/4 + .5)*10)/10;
				if(y > 5) y = 5;
				if(y >= 4) kGAMECLASS.output(" You lost quite a few inches off your testicular diameter!");
				else if(y >= 2) kGAMECLASS.output(" You lost a few inches of testicular diameter!");
				else if(y >= 1.3) kGAMECLASS.output(" You lost over an inch of testicular diameter!");
				else if(y >= .85) kGAMECLASS.output(" You lost around an inch of testicular diameter!");
				else kGAMECLASS.output(" You only lost a little bit of size, all things considered.");
				target.ballSizeRaw -= y;
				changes++;
			}
			else if (!target.ballSizeUnlocked(newBallSize))
			{
				kGAMECLASS.output(target.ballSizeLockedMessage());
			}

			//Trappy Smoothpouch! - requires balls small enough
			if(target.balls > 0 && target.balls < 4 && !target.hasStatusEffect("Uniball") && changes < changeLimit && rand(3) == 0) {
				kGAMECLASS.output("\n\nIt starts with a tingle in your crotch to get your attention. ");
				if(!target.isCrotchGarbed()) {
					kGAMECLASS.output("You pull open your [pc.upperGarment] curiously. ");
				}
				kGAMECLASS.output("Then, every fold, hair, wrinkle, and blemish on your [pc.sack] smooths away, leaving nothing behind by perfect, glossy [pc.skinNoun]. It pulls a little tighter, compacting around your [pc.balls] without actually shrinking them, framing them into an adorable pouch.");
				changes++;
				target.createStatusEffect("Uniball",0,0,0,0,true,"","",false,0);
			}

			//Facial Hair vanishes!
			//Your [pc.beard] tickles, and when you scratch it, your hand comes away covered in hair. A snow of [haircolor] falls from your chin, leaving it bare and smooth. <b>You no longer have facial hair.</b>

			//Facial hair stops growing!
			//A painful feeling runs through your chin, but nothing changes outwardly. A closer inspection using the sensors on your codex reveals that <b>your facial hair has stopped growing.</b>

			//Grow wings once!
			//Requires legs!
			if(target.legType == GLOBAL.TYPE_BEE && target.wingType != GLOBAL.TYPE_BEE && target.wingTypeUnlocked(GLOBAL.TYPE_BEE) && rand(3) == 0 && changes < changeLimit) {
				if(!target.hasWings()) {
					kGAMECLASS.output("\n\nCramps attack your shoulder blades, forcing you to arch your back and cry out. You drop and roll on the ground to try and keep it together, and before you know, the pain is gone. In its place, there's the pleasant ache of growing muscles and something sliding down your back. You crane your head over your shoulder");
					if(target.armor.shortName != "") kGAMECLASS.output(" and pull back your [pc.armor.longName]");
					kGAMECLASS.output(" to take a look; <b>there are small, transparent wings pressed against your back</b>. They're too small to allow you to fly, but you're definitely getting more zil-like.");
					target.wingType = GLOBAL.TYPE_SMALLBEE;
				}
				//Grow small zil wings to full size!
				else if(target.wingType == GLOBAL.TYPE_SMALLBEE) {
					kGAMECLASS.output("\n\nA small cramp tugs at the muscles of your back, but a quick stretch evens it out.");
					if(target.armor.shortName != "") kGAMECLASS.output(" You pull off the top of your [pc.armor.longName] to get a look, just in case.");
					kGAMECLASS.output(" Those muscles feel like they're getting bigger, bulkier, and your wings are growing bigger to match. A quick flex sends them flapping, kicking up a gust of wind, nearly lifting you off the ground. <b>You have wings just like a male zil, big enough to fly!</b>");
					target.wingType = GLOBAL.TYPE_BEE;
				}
				//TF other wings!
				else {
					kGAMECLASS.output("\n\nA cramp ruffles your [pc.wings], making them flutter wildly as they contort and twist. You can feel them changing as they flail around, and with each gasp of air you drag into your lungs, you feel them thinning. They never stop kicking up a hell of a breeze, though. A few seconds later, your body calms, and you're able to look behind you. <b>You've grown transparent, zil-like wings, big enough to fly with!</b>");
					target.wingType = GLOBAL.TYPE_BEE;
				}
				changes++;
			}
			else if (!target.wingTypeUnlocked(GLOBAL.TYPE_BEE))
			{
				kGAMECLASS.output(target.wingTypeLockedMessage());
			}
			
			//Honeycum!
			if(target.totalCocks(GLOBAL.TYPE_BEE) > 0 && target.cumType != GLOBAL.FLUID_TYPE_HONEY && target.cumTypeUnlocked(GLOBAL.FLUID_TYPE_HONEY) && changes < changeLimit && rand(4) == 0) 
			{
				kGAMECLASS.output("\n\nThere is a sudden pinch in your ");
				if(target.balls > 0) kGAMECLASS.output("[pc.balls]");
				else kGAMECLASS.output("middle");
				kGAMECLASS.output(" that's painful enough to make you jump! It leaves behind a very, very intense soreness. ");
				if(target.balls > 0) kGAMECLASS.output("You cradle your [pc.sack] in your hand, regarding the poor thing warily as you try to find the source of the hurt. Then, you notice it contract up against you tightly, like it does when you cum. Only, there is no blissful release here.");
				else kGAMECLASS.output("You give yourself a thorough once-over but can't find the source of the hurt. Then, you feel your abdominal muscles clenching, like when you orgasm, but there is no accompanying pleasure.");
				kGAMECLASS.output(" [pc.Cum] starts drizzling out of your [pc.cocks]. This strange, pleasureless release continues on much longer than a normal orgasm, and it doesn't stop until you feel... well, emptied. The last few drops are chased out by sticky strands of honey-like goo. It's clear to you that <b>your [pc.cum] has been replaced by honey.</b> The codex verifies that there are still sperm in the new fluid, so you haven't lost your ability to knock someone up.");
				target.cumType = GLOBAL.FLUID_TYPE_HONEY;
				changes++;
			}
			else if (!target.cumTypeUnlocked(GLOBAL.FLUID_TYPE_HONEY))
			{
				kGAMECLASS.output(target.cumTypeLockedMessage());
			}
			
			return changes;
		}
	}
}
