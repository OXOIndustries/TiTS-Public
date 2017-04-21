package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.rand;
	
	
	public class SheepTF extends ItemSlotClass
	{
		
		//constructor
		public function SheepTF()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Ovinium";
			//Regular name
			this.longName = "an Ovinium pill"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a white pill stamped with the word “Ovinium”";
			//Displayed on tooltips during mouseovers
			this.tooltip = "Not to be confused with the similarly named Bovinium, this is a transformative pill designed by Xenogen Biotech to make the user take on characteristics similar to that of a Terran sheep. Effects are recorded to range between giving the user ram horns (though almost exclusively this occurs in men) and causing them to start growing a thick layer of fluffy, insulating wool. The pill itself looks bland, but the wrapper with the stylized sheep printed on it is rather fetching.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("GothPastel&SheepPun");
			if(target is PlayerCharacter) {
				var pc:Creature = target;
				var changes:Number = 0;
				var changeLimit:Number = 1;
				if(rand(2) == 0) changeLimit++;
				if(rand(2) == 0) changeLimit++;

				//Consumption text
				output("You deftly peel open the wrapper, removing the white pill. Taking a moment, you allow yourself to gather up a slight amount of saliva in your mouth to swallow it with, before popping the pill into your mouth, gulping it all down. A slight taste of what might be cotton candy fills your mouth before you feel a fuzzy, blissful sensation flow through you from your stomach - where the pill must have reached.");
				//PC willpower more than 70%: Reduce willpower by 2 points [50%]
				//PC willpower less than or equal to 70%, but more than 20%: Reduce willpower by 1 point [50%]
				//Reduce willpower by 2 points/1 point: 
				if(pc.WQ() > 20 && rand(2) == 0 && changes < changeLimit)
				{
					output("\n\nThe fuzzy feeling doesn’t stop at your stomach, it soon fills your brain, leaving you calm, relaxed… Maybe it’s better to just let life take you where it wants.");
					pc.willpower(-1);
					if(pc.WQ() >= 70) pc.willpower(-1);
					changes++;
				}
				//Change horn type to ram horns:
				//PC has 2 horns: Change horn type to ram horns [75% chance]
				if(pc.horns == 2 && !InCollection(pc.hornType, [GLOBAL.TYPE_SHEEP, GLOBAL.TYPE_GOAT]) && rand(3) > 0 && changes < changeLimit)
				{
					output("\n\nYou feel a mounting pressure from behind and even within your horns, gritting your teeth as it soon turns into a violent headache. Eventually, it fades and you pull out your codex to examine the offenders. The source of all of this quickly becomes apparent - <b>your horns have twisted and reshaped into impressive, curved ram’s horns!</b>");
					changes++;
					pc.removeHorns();
					pc.hornType = GLOBAL.TYPE_SHEEP;
					pc.hornLength = 11;
					pc.horns = 2;
				}
				//PC has multiple horns: Merge all horns into one pair/two horns [75% chance]
				else if(pc.horns > 2 && rand(4) > 0 && changes < changeLimit)
				{
					if(pc.hornsUnlocked(2))
					{
						output("\n\nYour [pc.horns] suddenly start to feel sensitive, almost itchy, and reaching up to feel just what’s going on, you swear they’re actually shrinking. A quick check of the reflection in your codex confirms that this is <i>almost</i> true, but your first horns remain unscathed. You’re forced to look on in horror as your once-impressive rack fades into a shadow of its former self - but at least you’ve still got two horns.");
						pc.horns = 2;
						changes++;
					}
					else output("\n\n" + pc.hornsLockedMessage());
				}			
				//PC has 1 horn: Horn flakes off, leaving none [75% chance]
				else if(pc.horns == 1 && changes < changeLimit && rand(4) > 0)
				{
					if(pc.hornsUnlocked(0))
					{
						output("\n\nYou notice a flake of something pass by your field of vision, and look up, confused. You can’t see anything above you that could be causing it, but when you go to move on, it happens again. Hmm. Raising a hand, you try searching your own head to see if you can find the issue, and soon come into your [pc.horn] - or, more accurately, what’s left of it. Even more rubs off in your hand and you panic, jerking it away. It doesn’t do any good though - the process continues and soon you’re left with no horn whatsoever.");
						pc.removeHorns();
						changes++;
					}
					else output("\n\n" + pc.hornsLockedMessage());
				}
				//PC is male and has no horns: Grow ram horns [50% chance]
				if(!pc.hasHorns() && pc.mf("m","") == "m" && pc.hasCock() && changes < changeLimit)
				{
					if(pc.hornTypeUnlocked(GLOBAL.TYPE_SHEEP) && pc.hornsUnlocked(2))
					{
						output("\n\nYou feel a sudden pressure from behind your temples and reach up a hand to investigate. Feeling a pair of bumps from where the ache emanates, you realize - as they seem to harden and push outward - that you’re growing horns! The pain in your head starts to grow and you pull your hands away as the horns rapidly push and grow outwards. By the time it fades, you’ve pulled out your codex to have a look at your recent additions. <b>You’ve grown curved, impressive rams horns!</b>");
						pc.hornType = GLOBAL.TYPE_SHEEP;
						pc.hornLength = 11;
						pc.horns = 2;
						changes++;
					}
					else if(pc.hornsUnlocked(2)) output("\n\n" + pc.hornTypeLockedMessage());
					else output("\n\n" + pc.hornsLockedMessage());
				}
				//PC has more than two legs: Legs merge to leave two of the same type as the original set [100% chance]
				//Legs merge to leave two of the same type as the original set:
				if(pc.legCount > 2 && changes < changeLimit)
				{
					if(pc.legCountUnlocked(2))
					{
						output("\n\nIt’s not long after taking the pill that you suddenly crash to the floor, legs turned to jelly. You spend the next few minutes in near agony as your lower body completely reassembles itself until you’ve lost your tauric configuration and are left with a single pair of [pc.legs].");
						pc.legCount = 2;
						pc.genitalSpot = 0;
						changes++;
					}
					else output("\n\n" + pc.legCountLockedMessage());
				}
				//PC is naga: Tail splits in two to leave two human legs [100% chance]
				//Tail splits in two to leave two human legs: 
				else if(pc.isNaga() && changes < changeLimit)
				{
					if(pc.legTypeUnlocked(GLOBAL.TYPE_SHEEP) && pc.legCountUnlocked(2))
					{
						output("\n\nYou feel something strange in the tip of your tail and twist down to have a look. The problem soon becomes apparent - it’s split in two! The divide starts to spread up and up your tail until your balance is thrown completely off as you’re left with two running down from your thighs. Luckily, this doesn’t seem permanent as they start to shift and transform, eventually <b>leaving you with two human legs</b>. It’s going to take a while to get used to walking instead of slithering again!");
						pc.clearLegFlags();
						pc.legCount = 2;
						pc.legType = GLOBAL.TYPE_HUMAN;
						pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
						pc.genitalSpot = 0;
						changes++;
					}
					else if(pc.legCountUnlocked(2)) output("\n\n" + pc.legTypeLockedMessage());
					else output("\n\n" + pc.legCountLockedMessage());
				}
				//PC has two legs: Change to hooved, sheeplike legs [25%]
				//Change to hooved, sheeplike legs: 
				else if(pc.legCount == 2 && pc.legType != GLOBAL.TYPE_SHEEP && rand(4) == 0 && changes < changeLimit)
				{
					if(pc.legTypeUnlocked(GLOBAL.TYPE_SHEEP))
					{
						output("\n\nYour [pc.legs] suddenly start shaking and quickly give out under you, leaving you sprawled out along the ground. Looking back, you realize that your legs and feet are reshaping themselves. It takes a while, but as you watch,<b> they transform into hooved, sheeplike legs.</b>");
						pc.clearLegFlags();
						pc.legType = GLOBAL.TYPE_SHEEP;
						pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
						pc.addLegFlag(GLOBAL.FLAG_HOOVES);
						pc.addLegFlag(GLOBAL.FLAG_FURRED);
						changes++;
					}
					else output("\n\n" + pc.legTypeLockedMessage());
				}
				//Ears: Change to floppy, outwards pointing sheep ears [50%]
				//Change to floppy, outwards pointing sheep ears:
				if(pc.earType != GLOBAL.TYPE_SHEEP && changes < changeLimit && rand(2) == 0)
				{
					if(pc.earTypeUnlocked(GLOBAL.TYPE_SHEEP))
					{
						output("\n\nYour ears twitch and tingle and you pull out your codex to check them out. Oh! Well that explains it - <b>you’ve got sheep ears now!</b>");
						pc.earType = GLOBAL.TYPE_SHEEP;
						changes++;
					}
					else output("\n\n" + pc.earTypeLockedMessage());
				}
				//PC has straight hair: Change hair to curly/frizzy [25%]
				//Change hair to curly/frizzy: 
				if(!pc.hasStatusEffect("frizzy hair") && pc.hairType == GLOBAL.HAIR_TYPE_HAIR && rand(4) == 0 && changes < changeLimit)
				{
					output("\n\nAn odd, tingling sensation passes through your scalp, shortly followed by the feeling of your [pc.hairColor] hair seeming to pull up and away from where it normally hangs. Running your hands through it gives an answer as your fingers get caught up in <b>your now-curly hair.</b>");
					pc.createStatusEffect("frizzy hair");
				}
				//PC has hair color that is neither white or black: Change hair colour to white [20%] or black [10%]
				//Change hair color to white or black: 
				var sheepColors:Array = ["white", "black"];
				if(pc.hairType == GLOBAL.HAIR_TYPE_HAIR && !InCollection(pc.hairColor, sheepColors) && rand(3) == 0 && changes < changeLimit)
				{
					var newHairColor:String = "black";
					if(rand(3) >= 1) newHairColor = "white";
					if(pc.hairColorUnlocked(newHairColor))
					{
						output("\n\nA tickling sensation passes through your scalp before fading almost as soon as it appeared. Confused, you pull out your codex to have a look and see a new color racing down your ");
						if(pc.hairLength < 3) output("short");
						else if(pc.hairLength < 10) output("mid-length");
						else output("long");
						output(" hair. By the time it’s done,<b> you’re left with " + newHairColor + " hair!</b> Well, you guess you can always have it dyed if you’re not a fan.");
						pc.hairColor = newHairColor;
						changes++;
					}
					else output("\n\n" + pc.hairColorLockedMessage());
				}
				//PC does not have fur: Grow coarse, short fur the same colour as hair colour [50%]
				//Grow coarse, short fur the same colour as hair color: 
				if(pc.hairType == GLOBAL.HAIR_TYPE_HAIR && InCollection(pc.hairColor, sheepColors) && !pc.hasFur() && rand(2) == 0 && changes < changeLimit)
				{
					if(pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
					{
						output("\n\nYou scratch at your arm, feeling something itching just beneath the surface. Strange. Looking down for a closer look, you see that any hair on your arms is growing rapidly more pronounced - in fact, it’s coming in on your hands and face too! After a long and slightly nerve wracking wait, you realize it’s not going to stop at all - the covering is actually better described as fur now. <b>Well, looks like you’ve got a thin layer of coarse " + pc.hairColor + " fur!</b>");
						pc.furColor = pc.hairColor;
						pc.skinType = GLOBAL.SKIN_TYPE_FUR;
						pc.clearSkinFlags();
						changes++;
					}
					else output("\n\n" + pc.skinTypeLockedMessage());
				}
				//PC does not have wool: Grow a thick layer of wool on the chest and back, gains the “Wooly” perk described later. White [40%] or black [10%].
				//Grow a thick layer of wool on the chest and back: 
				/* Fen note: cut. No built in support for such a thing and dont want people stuck with wool forever.
				if(!)
				{
					output("\n\nAn almost familiar feeling spreads across your chest and back and you pause for a moment, concerned");
					if(!pc.hasFur()) output(".");
					else output(" - you already have fur!");
					output(" Suddenly though, you remember the packet and how it mentioned you could grow wool from this - maybe that’s what’s happening to you now. It doesn’t make the process feel, or look, any less strange. ");
					if(pc.hasFur()) output("The fur on your chest and back thickens and lengthens, pushing outward and curling up.");
					else output("A thick, curly ‘fur’ starts to push out from your chest and back.");
					output(" <b>Soon, you’re left with a thick layer of sheep’s wool!</b> It’s a little awkward to move around with, but it’ll certainly keep you warm!");
					//[Gain 'Wooly' Perk] - Fen: Nein.
				}*/
				//PC has more than two eyes: Lose eyes until there are only two of the original type [75%]
				//Lose eyes until there are only two of the original type:
				if(pc.eyeType == GLOBAL.TYPE_ARACHNID && changes < changeLimit && rand(4) > 0)
				{
					if(pc.eyeTypeUnlocked(GLOBAL.TYPE_SHEEP))
					{
						output("\n\nYour vision swims dramatically, temporarily blinding you and find yourself reaching out to try and grab onto something to ensure your balance. There’s an uncomfortable feeling in your eyes, they feel almost like they’re shrinking! Eventually, the sensation wears off and your vision returns - but only from your remaining two eyes.");
						pc.eyeType = GLOBAL.TYPE_SHEEP;
						changes++;
					}
					else output("\n\n" + pc.eyeTypeLockedMessage());
				}
				//PC does not have sheep eyes: Eye type changes to sheep - horizontal, long pupil, iris takes up majority of eye [50%]
				//Eye type changes to sheep:
				if(pc.eyeType != GLOBAL.TYPE_SHEEP && changes < changeLimit && rand(2) == 0)
				{
					if(pc.eyeTypeUnlocked(GLOBAL.TYPE_SHEEP))
					{
						output("\n\n Your vision clouds over and you blink rapidly, trying to clear it. When the effect fades enough to see what you’re doing again, you pull out your codex to see if anything’s happened to your eyes. It’s not long before you notice it - <b>your eyes have changed to that of a sheep or goat!</b> Your pupils are now long, horizontal lines and your [pc.eyeColor] irises take up the majority of the visible part of your eyes, obscuring the sclera.");
						pc.eyeType = GLOBAL.TYPE_SHEEP;
						changes++;
					}
					else output("\n\n" + pc.eyeTypeLockedMessage());
				}
				//PC has non-sheep face: Morph into sheep-like, muzzled face [10%]
				//Morph into sheep-like, muzzled face: 
				if(pc.faceType != GLOBAL.TYPE_SHEEP && pc.hasFur() && changes < changeLimit && rand(4) == 0)
				{
					if(pc.faceTypeUnlocked(GLOBAL.TYPE_SHEEP))
					{
						output("\n\nThere’s a sharp pain in your jaw and your eyes water as the feeling spreads across the entire lower half of your face as your ");
						if(pc.hasMuzzle()) output("muzzle changes its shape");
						else output("face lengthens out into a muzzle");
						output(". Once it’s done and the pain from your bones reconfiguring themselves fades, <b>you’re left with a somewhat blunt, cute sheep’s face</b> You let out an experimental ‘baa’, the sound coming much more naturally to you now than ever before.");
						pc.faceType = GLOBAL.TYPE_SHEEP;
						pc.clearFaceFlags();
						pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
						pc.addFaceFlag(GLOBAL.FLAG_FURRED);
						changes++;
					}
					else output("\n\n" + pc.faceTypeLockedMessage());
				}
				//PC does not have tail: Grow a small sheep tail [50%]//
				//Grow a sheep's tail: 
				if(pc.tailCount == 0 && changes < changeLimit && rand(2) == 0)
				{
					if(pc.tailTypeUnlocked(GLOBAL.TYPE_SHEEP) && pc.tailCountUnlocked(1))
					{
						output("\n\nA buzzing sensation overwhelms the base of your spine and when you grab at the source you feel a lump. Shaking and twitching, the bump morphs into a small furry tail. A couple test swishes confirms that <b>you now a cute little sheep’s tail!</b> You’re probably going to have to alter some of your clothes to better fit this new extremity.");
						pc.tailCount = 1;
						pc.tailType = GLOBAL.TYPE_SHEEP;
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
						changes++;
					}
					else if(pc.tailCountUnlocked(1)) output("\n\n" + pc.tailTypeLockedMessage());
					else output("\n\n" + pc.tailCountLockedMessage());
				}
				//PC has more than one tail: Lose tails until there is only one [75%]
				//Merge all tails into one:
				if(pc.tailCount > 1 && changes < changeLimit && rand(4) > 0) 
				{
					if(pc.tailCountUnlocked(1))
					{
						output("\n\nThe fuzzy sensation from your stomach travels up and down your spine. The moments of bliss quickly become slight panic as you feel your tails meld slowly together. Twisting your body to get the best look you can get, you watch as your [pc.tails] melt into each other. After what feels like forever, it appears you now only have one [pc.tail]!");
						pc.tailCount = 1;
						changes++;
					}
					else output("\n\n" + pc.tailCountLockedMessage());
				}
				//PC does not have sheep tail and has one tail: Change tail into sheep tail [75%]
				//Change tail into a sheep's tail:
				if(pc.tailCount == 1 && pc.tailType != GLOBAL.TYPE_SHEEP && changes < changeLimit && rand(4) == 0)
				{
					if(pc.tailTypeUnlocked(GLOBAL.TYPE_SHEEP))
					{
						output("\n\nFeeling a twisting and turning sensation in your tail, you instinctively go to grab at it. ");
						if(pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("It’s definitely shorter and fluffy.");
						else output("It’s still short but fluffier then you remember it being.");
						output(" A quick glance confirms that <b>your tail has changed into a " + pc.mf("puffy ram’s tail","little lamb’s tail") + ".</b>");
						pc.tailType = GLOBAL.TYPE_SHEEP;
						pc.clearTailFlags();
						pc.addTailFlag(GLOBAL.FLAG_FLUFFY);
						changes++;
					}
					else output("\n\n" + pc.tailTypeLockedMessage());
				}
				//PC has human skin: Turn skin color black [50%]
				//Turn skin color black: 
				if(pc.skinTone != "black" && rand(2) == 0 && changes < changeLimit)
				{
					if(pc.skinToneUnlocked("black"))
					{
						output("\n\nYou absentmindedly rub your skin. The rubbing soon becomes itching as you scrape off more old skin then you probably should. Glaring down at the source of your irritation, your mood suddenly changes when you see your new skin is a different color. <b>It seems you now have black skin!</b>");
						pc.skinTone = "black";
						changes++;
					}
					else output("\n\n" + pc.skinToneLockedMessage());
				}
				//PC has black human skin: Turn nipples black [75%]
				//Turn nipples black: 
				if(pc.skinTone == "black" && pc.nippleColor != "black" && rand(4) > 0 && changes < changeLimit)
				{
					if(pc.nippleColorUnlocked("black"))
					{
						output("\n\nThe tingling sensation soon climbs from your stomach and focuses on your nipples. Covering up a moan as you automatically move to fondle your nipples, you take a quick peek at the source of your pleasure. <b>You find out your nipples are now black to match your skin!</b>");
						pc.nippleColor = "black";
						changes++;
					}
					else output("\n\n" + pc.nippleColorLockedMessage());
				}
				//PC has black human skin: Turn lips black [75%]
				//Turn lips black: 
				if(pc.skinTone == "black" && pc.lipColor != "black" && rand(4) > 0 && changes < changeLimit)
				{
					output("\n\nThe tingling sensation spreads to your lips and, curiously, you flick your tongue over them only to feel skin flaking off. Ick. Despite that, they don’t seem to be more sensitive underneath the old layer - something else must have changed. <b>Lifting your codex to your face you find your lips are now black!</b>");
					pc.lipColor = "black";
					changes++;
				}
				//Dud: 
				if(changes == 0) output("\n\nNo matter how long you wait, nothing else seems to happen. Looks like that pill was either a dud or you’re already as sheeplike as you can get. Either way, that was a waste of your hard-earned credits.");
				return false;
			}
			else kGAMECLASS.output(target.capitalA + target.short + " ingests the pill but to no effect.");
			return false;
		}
	}		
}