import classes.Characters.Mimbrane;
import classes.Characters.PlayerCharacter;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.GameData.CombatAttacks;
/*

Removal and Body Part Change Denial
Mimbranes can only be removed at medical centers and must be removed en masse, i.e. all or none. Any other attempts to remove the parasite will result in either pain to the PC or attacks towards anyone else that attempts to remove them. Mimbranes removed from the PC will perish.
The parasites will not hinder any transformations – the only exception to this is for feet. Mimbranes will only attach to two human feet and will block any attempts to transform them once they have claimed them. This is strictly for the first pass at the parasite and can be expanded to include the many feet transformations in the game at a later time if requested. 
However, Mimbranes will block attempts to remove the organ they are attached to. The only way to remove an organ that Mimbranes have attached to is to kill off all Mimbrane parasites on the PC first.

Feeding Mimbranes
Most Mimbranes are able to feed whenever a scene revolving around their body part takes place. A scene will not take place for this, nor will it go towards increasing trust. Put simply, dick parasites are fed when the PC cums, anal when the PC is penetrated anally, vaginal when penetrated vaginally, and face when penetrated orally. 
Mimbranes on balls, hands and feet must always be cared for separately, as they are not sharing an orifice and will hide during contact with strangers.
Hand and feet Mimbranes are always fed and interacted with their “partner” simultaneously if possible as well. As a result, the second foot or hand Mimbrane will match the first existing Mimbrane in appearance, falling under the same feed tracker for both feet or both hand Mimbranes.
Each time a Mimbrane feeds, it grows a little bit. If it is fed manually by the PC, it grows by a larger amount. These growths are detailed more specifically in the listed effects section below and in Reproduction.
Mimbranes can go for one week between feedings. If they reach a week without being fed, they will start to rebel, detailed in the next section. 
Due to their slow metabolisms, Mimbranes can only be fed once per day. Manual feedings by the PC will fill a parasite up more efficiently than if they were to feed through normal sex, and they will employ the same default 24 hour waiting period until the critter can feed again.
Regardless of trust level, all Mimbranes will participate in a PC-triggered feeding session if they are not full.

Ignoring Mimbranes
These little guys are patient critters, but they aren’t invulnerable from basic cravings. Mimbranes that have found hosts will never starve; there’s plenty of errant secretions and moisture flinging around for them to last out the PC’s lifetime. But these meager drippings aren’t enough to keep the parasites silent and content forever. As mentioned in the previous section, Mimbranes will only go one week without being fed until they try and drive their host a little crazy.
After five days without being fed, a Mimbrane will subtly try to get their host’s attention. When the little critters are at a trust level of at least 2, their shuffling may be a little more overt.
Towards the end of the sixth day without sustenance, Mimbranes will try one more time to get attention. Low trust level Mimbranes will only shuffle a little more intensely. Parasites at a trust level of at least two will overtly cry out to their host.
Once the PC has entered the seventh day of depriving a Mimbrane a meal, the parasite’s trust level will drop by one. Its trust level will continue to drop by one more point every additional two days it goes without. In addition, if a Mimbrane goes a total of nine days without food, all attached parasites’ trust levels will go down by one. Their trust levels will continue to drop by a point every three days after that.
In addition to the trust decreases, the moment a Mimbrane hits the week mark without food, it will begin to secrete its lust-increasing oil in an attempt to get the PC horny enough to get busy and see to their desire. Unlike the oil secretions gained from trusting Mimbranes, this effect targets only the PC and increases at a quicker rate. That rate is 1 point of lust every hour. If this weren’t enough, on the eighth day, all other attached Mimbranes will begin to sweat oil as well, each increasing the hourly lust gain by one point. This makes for a potential of gaining up to around 10 points an hour for neglecting just one Mimbrane.
On top of everything else, various factors in combat will be employed, such as the possibility to lose a turn. Look below in Unlockable Combat Effects for more details.
SO, in summary:
New Mimbranes start at 0 trust.
If a Mimbrane exists at a minimum of 2 trust, then all new Mimbranes start at 1 trust instead.
Mimbranes can go for a week between feedings
Feedings can be either via manual feedings from the PC or from scenes that focus on that organ
Mimbrane organs with only mouths and no orifices (feet, hands, scrotum) require manual feeding and will not feed from a scene.
On the seventh day, hungry Mimbranes will sweat and increase the PC’s lust gain to 1 point every hour. They will drop their trust level by one.
Every two days, the hungry Mimbrane’s trust level will drop another point.
On the eighth day, all attached Mimbranes will sweat and increase PC’s lust by 1 point for every other parasite.
One the ninth day, all attached Mimbranes’ trust levels will drop by 1 level.
Every three days, all other Mimbranes’ trust levels will drop by 1.
Various combat effects are enabled when a hungry Mimbrane is active.
Mimbrane Reproduction
Mimbranes store and process all food, forcing their organ to grow larger until they are ready to split off all gained weight into a new parasite that leaves to start its own life. All Mimbranes require 15 servings to get them big enough to produce a child. Once a Mimbrane is ready to reproduce, it can no longer be fed and will perform the act the next time the PC goes to sleep.
Feedings through sex scenes count for one serving. Manual feedings performed by the PC count for three servings. Either of these feedings will result in a 24 hour waiting period before the parasite can feed once more.
Each feeding will force a Mimbrane (and thus the organ size) to swell to varying degrees. Organs with variables will go up by percentages while organs without variables (e.g. hands, feet, face) will only have appearance text changes.
Specific Body Part Effects
All Mimbranes create various effects once they’ve bonded to a PC. Most are positive, some could be negative. These vary depending on the body part. Most all stat changes have 15 different variables depending on how fed the parasite is. This variable resets to base level when it reproduces.
Penis Mimbranes
Gain 5% girth and 2% length with each feeding. Grand total of 175% girth, 130% length after 15 feedings.
Lose .4% willpower with each feeding. Grand total loss of 6% to willpower stat after 15 feedings.
Vagina Mimbranes
Three different mentions of vagina size in appearance text. Three feedings mentions that pussy appears slightly swollen. Eight feedings changes the text to pussy appears noticeably inflated and creates a slight bulge. Thirteen feedings changes it to mention that pussy appears delightfully plump and creates an undeniable bulge in your armor.
Based on CoC stats, vaginalLooseness and vaginalWetness both increase by one point after 3 feedings. This is ignored when the PC’s default value is greater than the following stat increases:
3 feedings = looseness set to 1, wetness set to 1
6 feedings = looseness set to 2, wetness set to 2
9 feedings = looseness set to 3, wetness set to 3
12 feedings = looseness set to 4, wetness set to 4
15 feedings = looseness set to 5, wetness set to 5
Lose .4% willpower with each feeding. Grand total loss of 6% to willpower stat after 15 feedings.
Ass Mimbranes
Based on CoC stats, analWetness and analLooseness increase by one point after 3 feedings. This is ignored when the PC’s default value is greater than the following stat increases:
3 feedings = looseness set to 1, wetness set to 1
6 feedings = looseness set to 2, wetness set to 2
9 feedings = looseness set to 3, wetness set to 3
12 feedings = looseness set to 4, wetness set to 4
15 feedings = looseness set to 5, wetness set to 5
If buttRating <10, gain 1 point to buttRating with each feeding. If buttRating ≥ 10, gain 1 point to buttRating with every two feedings.
Lose .4% willpower with each feeding. Grand total loss of 6% to willpower stat after 15 feedings.
Scrotum Mimbranes
Add .5 to cumMultiplier for each feeding. Grand total of an extra 750% cum production after 15 feedings.
Gain 5% ballsize with each feeding. Grand total of 175% ballsize after 15 feedings.
Lose .4% willpower with each feeding. Grand total loss of 6% to willpower stat after 15 feedings.
Breasts Mimbranes
Enables lactation if not enabled.
Gain 4% lactationMultiplier with each feeding. Grand total of 160% lactationMultiplier after 15 feedings.
Based on CoC stats, Gain 1 point to breastRating with each feeding when breastRating < 6. Gain 1 point to breastRating every 3 feedings when breastRating ≥ 6.
Gain 7% nippleLength with each feeding. Grand total of 205% nippleLength after 15 feedings. (Too much? Generally want nips to grow a bit bigger in scale to the larger breasts)
Lose .4% willpower with each feeding. Grand total loss of 6% to willpower stat after 15 feedings.
Hands Mimbranes
If two hand Mimbranes are present, both are always in sync with one another. The second Mimbrane will match the first upon arrival.
Three different mentions of hands in appearance text. Three feedings mentions that hand(s) appear(s) distended slightly. Eight feedings changes the text to hand(s) appear(s) puffy. Thirteen feedings changes it to mention that hand(s) appear(s) unusually large.
Hand Mimbranes at ≤ 2 trust that have gone four days without feeding have a 5% chance to waste a turn groping the PC. Two hand Mimbranes increase this chance to 10%. When trust is > 2, percent chances decrease to 3% and 5% respectively.
Hand Mimbranes at trust level 3 have a 15% chance to produce an extra attack when using an HP-targeted attack. Two hand Mimbranes means two 15% chances for extra attacks. When hand Mimbrane reaches level 4 trust, the chance increases to 30%
Lose .4% willpower with each feeding. Grand total loss of 6% to willpower stat after 15 feedings.
Feet Mimbranes
If two feet Mimbranes are present, both are always in sync with one another. The second Mimbrane will match the first upon arrival.
Three different mentions of feet in appearance text. Three feedings mentions that foot/feet appear(s) distended slightly. Eight feedings changes the text to foot/feet appear(s) puffy. Thirteen feedings changes it to mention that foot/feet appear(s) unusually large.
Foot Mimbranes at ≤ 2 trust that have gone four days without feeding have a 5% chance to waste a turn ruining the PC’s footing. Two foot Mimbranes increase this chance to 10%. When trust is >2, percent chances decrease to 3% and 5% respecitvely.
Foot Mimbranes at trust level 3 give a 10% chance to evade attacks. Two foot Mimbranes produces two 15% chances to evade. When foot Mimbrane reaches level 4 trust, the chance increases to 20%.
Lose .4% willpower with each feeding. Grand total loss of 6% to willpower stat after 15 feedings.
Head Mimbranes
Lose .4% willpower with each feeding. Grand total loss of 6% to willpower stat after 15 feedings.
Three different mentions of lips in appearance text. Three feedings mentions that lips appear slightly puffy. Eight feedings changes the text to lips appear delicious and pillowy. Thirteen feedings changes it to mention that lips appear lusciously large and undeniably kissable.
Head Mimbrane enhances teases with lines mentioning lips. ≤3 feedings sets the tease bonus odds of occurring at 10%. ≤8 feedings is a 25% chance. ≤13 feedings is a 50% chance.
Head Mimbranes that are hungry after a week of being unfed will disable the tease bonus.
Level 2 trust head Mimbranes gain the ability to toggle their eye lid bumps above the player’s lips to appear like beauty marks.
Level 4 trust head Mimbranes gain the ability to toggle their eye lid bumps above the player’s lips to appear like piercings.
Unlockable Effects 
Oily Sweat (Neglected Mimbrane)
These effects are placed on a PC suffering from a Mimbrane that hasn’t been fed in over a week. 
Hungry Mimbranes that are sweating on the PC will deal 2 points of lust damage to the PC each turn in combat. Every other Mimbrane that is secreting oil as a result of the hungry parasite will each add an additional 1 points of lust damage each turn.
Hungry Mimbranes and sweating Mimbranes that are supporting it each cause a 10% chance to lose a turn and gain 10 points of lust damage from a lust cloud used against the PC. 
Hungry Mimbranes and sweating Mimbranes that are supporting it each add 1 point of lust every hour outside of combat.
Each body part suffering from a sweating Mimbrane takes on a slick, oily, sweating status when checked under appearance.
Oily Sweat (Trusting Mimbrane)
These effects are placed on a PC with trust level 3 or higher with enabled lust oil secretion.
Each body part with a sweating Mimbrane takes on a slick, oily, sweating status when checked under appearance.
PCs with this effect enabled gain 1 point of lust damage every two hours, regardless of how many Mimbranes are actively sweating.
Enables Lust Cloud attacks in combat (below)
PC gains 1 additional point of lust damage each turn in battle, regardless of how many Mimbranes are actively sweating.
Opponents in battle take 1 point of lust damage for each sweating Mimbrane after every turn in battle.
Fighting Against Wild Mimbranes
Whenever fighting against a wild Mimbrane, all attached Mimbranes will immediately start secreting the lust-increasing oily sweat. Each deals 1 lust point of damage a turn.
Same effects as neglected Mimbranes, only chance to lose a turn is increased to 20%
Lust Clouds
This attack is enabled when oily sweat is toggled on from trusting Mimbranes.
This attack costs 3 feedings. Cannot attempt if Mimbrane does not have at least 3 accumulated feedings.
When PC performs any action in combat, each sweating Mimbrane has a 25% chance to blow a cloud of lust-increasing perspiration towards the enemy. If it lands, each attack causes 5 additional points of lust damage for three turns.
Each attempt has a 20% chance to backfire and cause 5 points of lust damage to the PC for one turn.
Spit
This attack is able to be toggled on when the PC gains at least one Mimbrane at level 4 trust.
This attack costs 5 feedings. Cannot attempt if Mimbrane does not have at least 5 accumulated feedings.
When PC uses a lust-based attack, each level 4 trust parasite has a 40% chance to fire a powerful burst secretion. If the attack connects, it deals 15 points of lust damage.
Attack has a 10% to misfire and cause 5 points of lust damage to the player.
If Mimbrane has at least 10 feedings, there’s a 30% chance that a connecting attack will be boosted to a critical 50 points of lust damage to opponent. Spread of attack causes 5 lust damage to PC. Costs 10 feedings. 
*/

public function showMimbrane(forSelf:Boolean = false):void
{
	showBust("MIMBRANE");
	if(!forSelf) showName("\nMIMBRANE");
	else showName("\nMIMBRANE" + (attachedMimbranes() == 1 ? "" : "S"));
}

// Going to do this through statuseffects
// There's too many things to track sensibly using flags, and the extra storage from effects is... almost perfect for this
// v1 == trust
// v2 == last fed
// v3 == feed level/counter
// v4 == reproductive cycle counter

// This could possibly be done using int packing, allowing the use of a singular statusEffect to track everything, but it would probably be overly terse.
public var mimbraneEffects:Array = 
[
	"Mimbrane Cock",
	"Mimbrane Pussy",
	"Mimbrane Ass",
	"Mimbrane Balls",
	"Mimbrane Boobs",
	"Mimbrane Hand Left",
	"Mimbrane Hand Right",
	"Mimbrane Foot Left",
	"Mimbrane Foot Right",
	"Mimbrane Face"
];

public var regularFeedMimbranes:Array =
[
	"Mimbrane Cock",
	"Mimbrane Pussy",
	"Mimbrane Ass",
	"Mimbrane Boobs",
	"Mimbrane Face",
];

public var mimbraneDebug:Boolean = false;

// Figure out the total number of attached mimbranes
public function attachedMimbranes():int
{
	var total:int = 0;

	for (var i:int = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i])) total++;
	}

	return total;
}

// Find the lowest current mimbrane trust level
public function lowestMimbraneTrust():int
{
	var trust:int = 5;

	for (var i:int = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]))
		{
			if (pc.statusEffectv1(mimbraneEffects[i]) < trust) trust = pc.statusEffectv1(mimbraneEffects[i]);
		}
	}

	return trust;
}

public function highestMimbraneTrust():int
{
	var trust:int = -1;

	for (var i:int = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]))
		{
			if (pc.statusEffectv1(mimbraneEffects[i]) > trust) trust = pc.statusEffectv1(mimbraneEffects[i]);
		}
	}

	return trust;
}

public function mimbranesAtTrustMinimum(trust:int = 0):int
{
	var num:int = 0;
	
	for (var i:int = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]))
		{
			if (pc.statusEffectv1(mimbraneEffects[i]) >= trust) num++;
		}
	}
	
	return num;
}

public function mimbranesNeglected():int
{
	var numNeglected:int = 0;

	for (var i:int = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]))
		{
			if (pc.statusEffectv2(mimbraneEffects[i]) >= 7) numNeglected++;
		}
	}

	return numNeglected;
}

public function reduceAllMimbraneTrust():void
{
	for (var i:int = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]))
		{
			if (pc.statusEffectv1(mimbraneEffects[i]) > 0)
			{
				pc.setStatusValue(mimbraneEffects[i], 1, pc.statusEffectv1(mimbraneEffects[i]) - 1);
			}
		}
	}
}

public function hasFeedableMimbranes():Boolean
{
	for (var i:int = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]))
		{
			//Old: if (pc.statusEffectv2(mimbraneEffects[i]) > 0) return true;
			//Fix suggested here: https://github.com/Fenoxo/sourceTiTS/issues/203
			if (pc.statusEffectv2(mimbraneEffects[i]) > 0 && pc.statusEffectv3(mimbraneEffects[i]) < 15) return true;
		}
	}
	return false;
}

public function hasVisibleMimbranes():Boolean
{
	if (pc.hasStatusEffect("Mimbrane Face")) return true;
	if (pc.hasAirtightSuit()) return false;
	if (pc.hasStatusEffect("Mimbrane Hand Left") || pc.hasStatusEffect("Mimbrane Hand Right") || pc.hasStatusEffect("Mimbrane Foot Left") || pc.hasStatusEffect("Mimbrane Foot Right")) return true;
	if (pc.isChestExposed() && pc.hasStatusEffect("Mimbrane Boobs")) return true;
	if (pc.isCrotchExposed())
	{
		if (pc.hasStatusEffect("Mimbrane Cock") && !pc.hasStatusEffect("Genital Slit")) return true;
		if (pc.hasStatusEffect("Mimbrane Balls")) return true;
		if (pc.hasStatusEffect("Mimbrane Pussy")) return true;
	}
	if (pc.isAssExposed() && pc.hasStatusEffect("Mimbrane Ass")) return true;
	return false;
}

public function logAllEffects(old:Object = null):Object
{
	if (old == null)
	{
		var log:Object = { };
		
		log.lip = { };
		log.lip.old = pc.lipMod;
		
		if (pc.vaginas.length > 0)
		{
			log.vwet = { };
			log.vwet.old = pc.vaginas[0].wetnessMod;
			log.vloose = { };
			log.vloose.old = pc.vaginas[0].loosenessMod;
		}
		
		log.awet = { };
		log.awet.old = pc.ass.wetnessMod;
		
		log.aloose = { };
		log.aloose.old = pc.ass.loosenessMod;
		
		if (pc.balls > 0)
		{
			log.balls = { };
			log.balls.old = pc.ballSizeMod;
			
			log.cumq = { };
			log.cumq.old = pc.cumMultiplierMod;
		}
		
		if (pc.cocks.length > 0)
		{
			log.cthick = { };
			log.cthick.old = pc.cocks[0].cThicknessRatioMod;
			
			log.clen = { };
			log.clen.old = pc.cocks[0].cLengthMod;
		}
		
		log.brating = { };
		log.brating.old = pc.breastRows[0].breastRatingMod;
		
		log.buttrating = { };
		log.buttrating.old = pc.buttRatingMod;
		
		return log;
	}
	else
	{
		old.lip.newval = pc.lipMod;
		old.awet.newval = pc.ass.wetnessMod;
		old.aloose.newval = pc.ass.loosenessMod;
		
		if (pc.vaginas.length > 0)
		{
			old.vwet.newval = pc.vaginas[0].wetnessMod;
			old.vloose.newval = pc.vaginas[0].loosenessMod;
		}
		
		if (pc.balls > 0)
		{
			old.balls.newval = pc.ballSizeMod;
			old.cumq.newval = pc.cumMultiplierMod;
		}
		
		if (pc.cocks.length > 0)
		{
			old.cthick.newval = pc.cocks[0].cThicknessRatioMod;
			old.clen.newval = pc.cocks[0].cLengthMod;
		}
		
		old.brating.newval = pc.breastRows[0].breastRatingMod;
		old.buttrating.newval = pc.buttRatingMod;
		
		for (var key:String in old)
		{
			if (old[key].old != old[key].newval)
			{
				trace(key + " [Old: " + old[key].old + "] [New: " + old[key].newval + "]"); 
			}
		}
		
		return null;
	}
}

public function feedCost(effectName:String, feedCost:int):void
{
	var tLog:Object;
	if (mimbraneDebug) tLog = logAllEffects();
	
	var pDays:int = pc.statusEffectv2(effectName);
	var pFeeds:int = pc.statusEffectv3(effectName);
	
	var nFeedCount:int = Math.max(0, pFeeds - feedCost);
	
	resetMimbraneEffects(effectName);
	pc.setStatusValue(effectName, 3, 0);
	if (nFeedCount > 0) feedAMimbrane(effectName, nFeedCount, true);
	
	if (mimbraneDebug) logAllEffects(tLog);
}

/**
 * "Feed" any available mimbranes that are eligible to receive ~nutrition~
 * target selects the "grouping" that feeding will apply to; "all" or "regular"
 * "all" applies to all currently attached mimbranes
 * "regular" applies to only mimbranes that fall into the bracket of "regular sexytimes activity contact"
 */
public function mimbraneFeed(target:String = "regular", feedValue:int = 1):void
{
	var i:int;
	if (mimbraneDebug) trace("Feeding Mimbrane Group [" + target + "] " + feedValue + " time(s).");

	if (target == "all")
	{
		for (i = 0; i < mimbraneEffects.length; i++)
		{
			feedAMimbrane(mimbraneEffects[i], feedValue);
		}
	}
	else if (target == "regular")
	{
		for (i = 0; i < regularFeedMimbranes.length; i++)
		{
			feedAMimbrane(regularFeedMimbranes[i], feedValue);
		}
	}
	else if (target == "cock" || target == "dick")
	{
		feedAMimbrane("Mimbrane Cock", feedValue);
	}
	else if (target == "pussy" || target == "vagina" || target == "vag")
	{
		feedAMimbrane("Mimbrane Pussy", feedValue);
	}
	else if (target == "ass" || target == "butt" || target == "asshole" || target == "butthole")
	{
		feedAMimbrane("Mimbrane Ass", feedValue);
	}
	else if (target == "mouth" || target == "face" || target == "throat")
	{
		feedAMimbrane("Mimbrane Face", feedValue);
	}
	else if (target == "boobs" || target == "chest" || target == "tits")
	{
		feedAMimbrane("Mimbrane Boobs", feedValue);
	}
	else if (target == "hands" || target == "left hand" || target == "right hand")
	{
		if (target == "hands" || target == "left hand") feedAMimbrane("Mimbrane Hand Left", feedValue);
		if (target == "hands" || target == "right hand") feedAMimbrane("Mimbrane Hand Right", feedValue);
	}
	else if (target == "feet" || target == "left foot" || target == "right foot")
	{
		if (target == "feet" || target == "left foot") feedAMimbrane("Mimbrane Foot Left", feedValue);
		if (target == "feet" || target == "right foot") feedAMimbrane("Mimbrane Foot Right", feedValue);
	}
	else
	{
		throw new Error("target property string was an unexpected value. Only 'all', 'regular', 'cock', 'vag', 'ass', 'mouth', 'boobs', 'hands' or 'feet' are supported.");
	}
	
}

public function feedAMimbrane(effectName:String, feedValue:int = 1, force:Boolean = false):void
{	
	if (mimbraneDebug) trace("Feeding Mimbrane [" + effectName + "] " + feedValue + " time(s)");
	
	if (pc.cocks.length == 0 && effectName == "Mimbrane Cock" && pc.hasStatusEffect("Mimbrane Cock"))
	{
		pc.removeStatusEffect("Mimbrane Cock");
		trace("ERROR: The player previously had a cock, but it was removed whilst a mimbrane was attached. Quickfix removing the mimbrane effect to avoid hard scene crashes, but the mechanic used to remove the cock should be patched.");
		return;
	}
	else if (pc.vaginas.length == 0 && effectName == "Mimbrane Pussy" && pc.hasStatusEffect("Mimbrane Pussy"))
	{
		pc.removeStatusEffect("Mimbrane Pussy");
		trace("ERROR: The player previously had a vagina, but it was removed whilst a mimbrane was attached. Quickfix removing the mimbrane effect to avoid hard scene crashes, but the mechanic used to remove the vagina should be patched.");
		return;
	}
	
	var tPC:PlayerCharacter = pc;
	
	//Update 
	if (tPC.hasStatusEffect(effectName) && (force || tPC.statusEffectv2(effectName) > 0))
	{
		if (!force) tPC.setStatusValue(effectName, 2, 0);
		var oldFeedValue:int = tPC.statusEffectv3(effectName);
		
		if (oldFeedValue == 15) return;
		
		var actualFeed:int = 0;
		if (feedValue + tPC.statusEffectv3(effectName) <= 15)
		{
			actualFeed = feedValue;
		}
		else
		{
			actualFeed = 15 - tPC.statusEffectv3(effectName);
		}
		
		tPC.addStatusValue(effectName, 3, actualFeed);
		var newFeedValue:int = tPC.statusEffectv3(effectName);
		
		// Omit willpower change
		if (tPC.hasPerk("Mimbrane Symbiosis"))
		{
			if(tPC.willpowerMod != 0 && !willpowerModAffected()) tPC.willpowerMod = 0;
		}
		// Calc willpower change
		// Making this a flat change at certain breakpoints, becuase otherwise it's going to be a nightmare to track and undo later
		else
		{
			if (oldFeedValue < 3 && newFeedValue >= 3) tPC.willpowerMod -= 0.2;
			if (oldFeedValue < 8 && newFeedValue >= 8) tPC.willpowerMod -= 0.2;
			if (oldFeedValue < 13 && newFeedValue >= 13) tPC.willpowerMod -= 0.2;
		}
		
		// Mimbrane-specific changes
		if (effectName == "Mimbrane Cock" && pc.cocks.length > 0)
		{
			(tPC.cocks[0] as CockClass).cThicknessRatioMod += (0.05 * actualFeed);
			(tPC.cocks[0] as CockClass).cLengthMod += (0.75 * actualFeed);
		}
		else if (effectName == "Mimbrane Pussy" && pc.vaginas.length > 0)
		{
			if (oldFeedValue < 3 && newFeedValue >= 3)
			{
				(tPC.vaginas[0] as VaginaClass).wetnessMod++;
				(tPC.vaginas[0] as VaginaClass).loosenessMod++;
			}
			if (oldFeedValue < 6 && newFeedValue >= 6)
			{
				(tPC.vaginas[0] as VaginaClass).wetnessMod++;
				(tPC.vaginas[0] as VaginaClass).loosenessMod++;
			}
			if (oldFeedValue < 9 && newFeedValue >= 9)
			{
				(tPC.vaginas[0] as VaginaClass).wetnessMod++;
				(tPC.vaginas[0] as VaginaClass).loosenessMod++;
			}
			if (oldFeedValue < 12 && newFeedValue >= 12)
			{
				(tPC.vaginas[0] as VaginaClass).wetnessMod++;
				(tPC.vaginas[0] as VaginaClass).loosenessMod++;
			}
			if (oldFeedValue < 15 && newFeedValue >= 15)
			{
				(tPC.vaginas[0] as VaginaClass).wetnessMod++;
				(tPC.vaginas[0] as VaginaClass).loosenessMod++;
			}
		}
		else if (effectName == "Mimbrane Ass")
		{
			if (oldFeedValue < 3 && newFeedValue >= 3)
			{
				(tPC.ass as VaginaClass).wetnessMod++;
				(tPC.ass as VaginaClass).loosenessMod++;
			}
			if (oldFeedValue < 6 && newFeedValue >= 6)
			{
				(tPC.ass as VaginaClass).wetnessMod++;
				(tPC.ass as VaginaClass).loosenessMod++;
			}
			if (oldFeedValue < 9 && newFeedValue >= 9)
			{
				(tPC.ass as VaginaClass).wetnessMod++;
				(tPC.ass as VaginaClass).loosenessMod++;
			}
			if (oldFeedValue < 12 && newFeedValue >= 12)
			{
				(tPC.ass as VaginaClass).wetnessMod++;
				(tPC.ass as VaginaClass).loosenessMod++;
			}
			if (oldFeedValue < 15 && newFeedValue >= 15)
			{
				(tPC.ass as VaginaClass).wetnessMod++;
				(tPC.ass as VaginaClass).loosenessMod++;
			}

			tPC.buttRatingMod += actualFeed / 2.0;
		}
		else if (effectName == "Mimbrane Balls")
		{
			tPC.cumMultiplierMod += (actualFeed * 0.5);
			tPC.ballSizeMod += (actualFeed * 0.25);
		}
		else if (effectName == "Mimbrane Boobs" && pc.breastRows.length > 0)
		{
			// Toggle lactation
			if (oldFeedValue == 0 && tPC.milkMultiplier < 50) tPC.milkMultiplier = 50;
			
			// Doc called for a 4% lactate rate per feed level but a) pain b) pain
			
			(tPC.breastRows[0] as BreastRowClass).breastRatingMod += actualFeed;
		}
		else if (effectName == "Mimbrane Face")
		{
			if (oldFeedValue < 6 && newFeedValue >= 6) tPC.lipMod += 1;
			if (oldFeedValue < 12 && newFeedValue >= 12) tPC.lipMod += 1;
		}
	}
}

public function willpowerModAffected():Boolean
{
	if
	(	pc.isBuzzed()
	||	pc.hasStatusEffect("Mead")
	||	pc.hasStatusEffect("Crabbst")
	||	pc.hasStatusEffect("Naleen Venom")
	||	pc.hasStatusEffect("Lane Detoxing Weakness")
	||	pc.hasStatusEffect("Lane's Hypnosis - Willpower")
	)
	{
		return true;
	}
	return false;
}
public function resetAllMimbraneFeedings():void
{
	for (var i:uint = 0; i < mimbraneEffects.length; i++)
	{
		var tEff:String = mimbraneEffects[i];
		
		if (pc.hasStatusEffect(tEff))
		{
			if(pc.willpowerMod < 0 && !willpowerModAffected())
			{
				pc.willpowerMod = 0;
				pc.setStatusValue(tEff, 3, 0);
			}
			
			switch (tEff)
			{
				case "Mimbrane Cock":
					pc.cocks[0].cThicknessRatioMod = 0;
					pc.cocks[0].cLengthMod = 0;
					break;
					
				case "Mimbrane Pussy":
					pc.vaginas[0].loosenessMod = 0;
					pc.vaginas[0].wetnessMod = 0;
					break;
					
				case "Mimbrane Ass":
					pc.ass.loosenessMod = 0;
					pc.ass.wetnessMod = 0;
					pc.buttRatingMod = 0;
					break;
					
				case "Mimbrane Balls":
					pc.cumMultiplierMod = 0;
					pc.ballSizeMod = 0;
					break;
					
				case "Mimbrane Boobs":
					pc.breastRows[0].breastRatingMod = 0;
					break;
					
				case "Mimbrane Face":
					pc.lipMod = 0;
				
				default:
					break;
			}
		}
	}
	
	mimbraneMenu();
}

public function resetMimbraneEffects(effectName:String):void
{
	if (mimbraneDebug) trace("Resetting Mimbrane Part Modifiers for [" + effectName + "] @ " + pc.statusEffectv3(effectName));

	var willMod:Number = 0;
	if(pc.hasPerk("Mimbrane Symbiosis"))
	{
		if(pc.willpowerMod != 0 && !willpowerModAffected()) pc.willpowerMod = 0;
	}
	else
	{
		if (pc.statusEffectv3(effectName) >= 3) willMod += 0.2;
		if (pc.statusEffectv3(effectName) >= 8) willMod += 0.2;
		if (pc.statusEffectv3(effectName) >= 13) willMod += 0.2;
	}
	pc.willpowerMod += willMod;
	
	if (effectName == "Mimbrane Cock")
	{
		pc.cocks[0].cThicknessRatioMod -= 0.05 * Number(pc.statusEffectv3("Mimbrane Cock"));
		pc.cocks[0].cLengthMod -= 0.75 * Number(pc.statusEffectv3("Mimbrane Cock"));
	}
	else if (effectName == "Mimbrane Pussy")
	{
		var pussyMod:int = 0;
		if (pc.statusEffectv3(effectName) >= 3) pussyMod++;
		if (pc.statusEffectv3(effectName) >= 6) pussyMod++;
		if (pc.statusEffectv3(effectName) >= 9) pussyMod++;
		if (pc.statusEffectv3(effectName) >= 12) pussyMod++;
		if (pc.statusEffectv3(effectName) >= 15) pussyMod++;
		
		pc.vaginas[0].loosenessMod -= pussyMod;
		pc.vaginas[0].wetnessMod -= pussyMod;
		
		//The sub-zero checks are all supposed to be temporary. Remove these after a patch or 2.
		//if(pc.vaginas[0].loosenessMod < 0) pc.vaginas[0].loosenessMod = 0;
		//if(pc.vaginas[0].wetnessMod < 0) pc.vaginas[0].wetnessMod = 0;
	}
	else if (effectName == "Mimbrane Ass")
	{
		var buttMod:int = 0;
		if (pc.statusEffectv3(effectName) >= 3) buttMod++;
		if (pc.statusEffectv3(effectName) >= 6) buttMod++;
		if (pc.statusEffectv3(effectName) >= 9) buttMod++;
		if (pc.statusEffectv3(effectName) >= 12) buttMod++;
		if (pc.statusEffectv3(effectName) >= 15) buttMod++;
		
		pc.ass.loosenessMod -= buttMod;
		pc.ass.wetnessMod -= buttMod;
		pc.buttRatingMod -= Number(pc.statusEffectv3(effectName)) / 2.0;
		
		//The sub-zero checks are all supposed to be temporary. Remove these after a patch or 2.
		//if(pc.ass.loosenessMod < 0) pc.ass.loosenessMod = 0;
		//if(pc.ass.wetnessMod < 0) pc.ass.wetnessMod = 0;
	}
	else if (effectName == "Mimbrane Balls")
	{
		pc.cumMultiplierMod -= (0.5 * Number(pc.statusEffectv3(effectName)));
		pc.ballSizeMod -= (0.25 * Number(pc.statusEffectv3(effectName)));
	}
	else if (effectName == "Mimbrane Boobs")
	{
		pc.breastRows[0].breastRatingMod -= pc.statusEffectv3(effectName);
	}
	else if (effectName == "Mimbrane Face")
	{
		var lipMod:int = 0;
		if (pc.statusEffectv3(effectName) >= 6) lipMod++;
		if (pc.statusEffectv3(effectName) >= 12) lipMod++;
		pc.lipMod -= lipMod;
	}
	
}

private var mimbraneEventHeaderDone:Boolean = false;

public function addMimbraneEvent(msg:String):void
{
	if (mimbraneEventHeaderDone == false)
	{
		if (attachedMimbranes() == 1) AddLogEvent("<u>Your mimbrane makes its presence known....</u>", "passive");
		else if (attachedMimbranes() > 1) AddLogEvent("<u>Your mimbranes make their presence known....</u>", "passive");
		mimbraneEventHeaderDone = true;
	}
	ExtendLogEvent("\n\n" + msg);
}

// Reproduction/stat mod tasks

//Once a Mimbrane has maxed out on feedings, it will no longer track days and go into a hunger state. It will still aid other hungry Mimbranes.
//Reproduction always occurs when the PC is asleep. Unnoticed Reproduction takes place when the PC awakes, normal reproduction takes place in the middle of sleep.
//Only Unnoticed Reproduction scenes occur at trust level 0 and 1. At trust levels 2-4, the reproduction scenes still only have a small chance to occur instead of the Unnoticed Reproduction. The chance raises with each level, potentially at 10, 20, and 30% respectively.
//Mimbrane resets to 0 feedings after reproduction, reseting all of its feeding-based effects on the organ. All parser activity in scenes reflects the enlarged organ.

// v1 == trust
// v2 == last fed
// v3 == feed level/counter
// v4 == reproductive cycle counter
public function mimbraneReproduce(effectName:String):void
{
	if (mimbraneDebug) trace("Mimbrane [" + effectName + "] triggered reproduction!");

	if (!pc.hasStatusEffect(effectName)) throw new Error("A mimbrane the player doesn’t have attempted to reproduce.");

	var currentTrust:int = pc.statusEffectv1(effectName);
	resetMimbraneEffects(effectName);

	// 0->1
	if (pc.statusEffectv1(effectName) == 0)
	{
		pc.setStatusValue(effectName, 1, 1);
		pc.setStatusValue(effectName, 2, 0);
		pc.setStatusValue(effectName, 3, 0);
		pc.setStatusValue(effectName, 4, 0);
	}
	// 1-2 -- requires 2 cycles
	else if (pc.statusEffectv1(effectName) == 1)
	{
		if (pc.statusEffectv4(effectName) == 0)
		{
			pc.setStatusValue(effectName, 2, 0);
			pc.setStatusValue(effectName, 3, 0);
			pc.setStatusValue(effectName, 4, 1);
		}
		else
		{
			pc.setStatusValue(effectName, 1, 2);
			pc.setStatusValue(effectName, 2, 0);
			pc.setStatusValue(effectName, 3, 0);
			pc.setStatusValue(effectName, 4, 0);
		}
	}
	// 2->3 -- requires 3 cycles
	else if (pc.statusEffectv1(effectName) == 2)
	{
		if (pc.statusEffectv4(effectName) < 3)
		{
			pc.setStatusValue(effectName, 2, 0);
			pc.setStatusValue(effectName, 3, 0);
			pc.setStatusValue(effectName, 4, pc.statusEffectv4(effectName) + 1);
		}
		else
		{
			pc.setStatusValue(effectName, 1, 3);
			pc.setStatusValue(effectName, 2, 0);
			pc.setStatusValue(effectName, 3, 0);
			pc.setStatusValue(effectName, 4, 0);
		}
	}
	// 3->4 -- requires 5 cycles
	else if (pc.statusEffectv1(effectName) == 3)
	{
		if (pc.statusEffectv4(effectName) < 5)
		{
			pc.setStatusValue(effectName, 2, 0);
			pc.setStatusValue(effectName, 3, 0);
			pc.setStatusValue(effectName, 4, pc.statusEffectv4(effectName) + 1);
		}
		else
		{
			pc.setStatusValue(effectName, 1, 4);
			pc.setStatusValue(effectName, 2, 0);
			pc.setStatusValue(effectName, 3, 0);
			pc.setStatusValue(effectName, 4, 0);
		}
	}
	else if (pc.statusEffectv1(effectName) == 4)
	{
		pc.setStatusValue(effectName, 1, 4);
		pc.setStatusValue(effectName, 2, 0);
		pc.setStatusValue(effectName, 3, 0);
		pc.setStatusValue(effectName, 4, pc.statusEffectv4(effectName) + 1);
	}
}

public function removeMimbranes():void
{
	for (var i:int = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]))
		{
			resetMimbraneEffects(mimbraneEffects[i]);
			pc.removeStatusEffect(mimbraneEffects[i]);
		}
	}
	flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] = undefined;
	flags["PLAYER_MIMBRANE_SPIT_ENABLED"] = undefined;
	flags["MIMBRANE_FACE_APPEARANCE"] = undefined;
}

public function mimbranesIncreaseDaysSinceFed(totalDays:uint):void
{
	var i:int;
	if (mimbraneDebug) trace("Incrementing Mimbrane days since last fed");
	
	var mimStates:Object = { };

	for (i = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]))
		{
			mimStates[mimbraneEffects[i]] = pc.statusEffectv2(mimbraneEffects[i]);
			pc.addStatusValue(mimbraneEffects[i], 2, totalDays);
		}
	}

	// Always show the state transitions to "hungry" for every mimbrane
	// These will always show at the time a mimbrane transitions into the "hungry" state. Showing all of them might be overkill, but that can be handled later.
	if (pc.hasStatusEffect("Mimbrane Cock") && mimStates["Mimbrane Cock"] < 7 && pc.statusEffectv2("Mimbrane Cock") == 7)
	{
		if (mimbraneDebug) trace("Mimbrane Cock unfed for 7 days!");

		addMimbraneEvent("A sudden burst of lewd moisture surrounding your manhood takes you by surprise. <b>Your hungry Mimbrane is drenching your [pc.cock] in its sweat.</b>");
	}
	
	if (pc.hasStatusEffect("Mimbrane Pussy") && mimStates["Mimbrane Pussy"] < 7 && pc.statusEffectv2("Mimbrane Pussy") == 7)
	{
		if (mimbraneDebug) trace("Mimbrane Pussy unfed for 7 days!");

		addMimbraneEvent("A tidal wave of fluids overcoming your pussy about knocks you over with sexual ferocity. <b>Your hungry Mimbrane is drowning your [pc.vagina] in its sweat.</b>");
	}

	if (pc.hasStatusEffect("Mimbrane Ass") && mimStates["Mimbrane Ass"] < 7 && pc.statusEffectv2("Mimbrane Ass") == 7)
	{
		if (mimbraneDebug) trace("Mimbrane Ass unfed for 7 days!");
		
		addMimbraneEvent("A sudden, strawberry-scented rain cascades down your butt, almost knocking you out with its sexual nature. <b>Your hungry Mimbrane is casting your [pc.ass] through unending streams of Mimbrane sweat.</b>");
	}

	if (pc.hasStatusEffect("Mimbrane Balls") && mimStates["Mimbrane Balls"] < 7 && pc.statusEffectv2("Mimbrane Balls") == 7)
	{
		if (mimbraneDebug) trace("Mimbrane Balls unfed for 7 days!");

		addMimbraneEvent("An abrupt carnal wave grabs you by the balls, its lewd intentions about knocking you over. <b>Your hungry Mimbrane is smothering your [pc.balls] with its sweat.</b>");
	}

	if (pc.hasStatusEffect("Mimbrane Boobs") && mimStates["Mimbrane Boobs"] < 7 && pc.statusEffectv2("Mimbrane Boobs") == 7)
	{
		if (mimbraneDebug) trace("Mimbrane Boobs unfed for 7 days!");

		addMimbraneEvent("Your titty flesh is suddenly overwhelmed by a downpour of strawberry-scented liquid passion. <b>Your hungry Mimbrane is dousing your [pc.fullChest] in endless amounts of its sweat.</b>");
	}

	if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right") && mimStates["Mimbrane Hand Left"] < 7 && pc.statusEffectv2("Mimbrane Hand Left") == 7)
	{
		if (mimbraneDebug) trace("Mimbrane Hands unfed for 7 days!");

		addMimbraneEvent("An abrupt slickness overtakes your hands out of nowhere accompanied with tingling insidiousness. <b>Your hungry Mimbranes are coating your hands in their sweat.</b>");
	}
	else if ((pc.hasStatusEffect("Mimbrane Hand Left") && !pc.hasStatusEffect("Mimbrane Hand Right") && mimStates["Mimbrane Hand Left"] < 7 && pc.statusEffectv2("Mimbrane Hand Left") == 7)
		|| (!pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right") && mimStates["Mimbrane Hand Right"] < 7 && pc.statusEffectv2("Mimbrane Hand Right") == 7))
	{
		if (mimbraneDebug) trace("Mimbrane Hand unfed for 7 days!");

		addMimbraneEvent("An abrupt slickness overtakes your hand out of nowhere accompanied with tingling insidiousness. <b>Your hungry Mimbrane is coating your hand in its sweat.</b>");
	}

	if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right") && mimStates["Mimbrane Foot Right"] < 7 && pc.statusEffectv2("Mimbrane Foot Left") == 7)
	{
		if (mimbraneDebug) trace("Mimbrane Feet unfed for 7 days!");

		addMimbraneEvent("A powerful humidity wraps around your feet like a snake, followed with a dripping sexual passion. <b>Your hungry Mimbranes have cloaked your [pc.feet] in their oily sweat.</b>");
	}
	else if ((pc.hasStatusEffect("Mimbrane Foot Left") && !pc.hasStatusEffect("Mimbrane Foot Right") && mimStates["Mimbrane Foot Left"] < 7 && pc.statusEffectv2("Mimbrane Foot Left") == 7)
		|| (!pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right") && mimStates["Mimbrane Foot Right"] < 7 && pc.statusEffectv2("Mimbrane Foot Right") == 7))
	{
		if (mimbraneDebug) trace("Mimbrane Foot unfed for 7 days!");

		addMimbraneEvent("A powerful humidity wraps around your foot like a snake, followed with a dripping sexual passion. <b>Your hungry Mimbrane has cloaked your [pc.foot] in its oily sweat.</b>");
	}

	if (pc.hasStatusEffect("Mimbrane Face") && mimStates["Mimbrane Face"] < 7 && pc.statusEffectv2("Mimbrane Face") == 7)
	{
		if (mimbraneDebug) trace("Mimbrane Face unfed for 7 days!");

		addMimbraneEvent("Your head begins to feel tingly and moist. Viscous, sweet liquid starts pouring out of your [pc.face]. <b>The hungry Mimbrane surrounding your head has started to sweat profusely.</b>");
	}

	// Show on the 8th day since feeding, if applicable
	for (i = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]) && mimStates[mimbraneEffects[i]] < 8 && pc.statusEffectv2(mimbraneEffects[i]) == 8)
		{
			if (mimbraneDebug) trace("Mimbranes unfed for 8 days!");

			if (attachedMimbranes() == 2)
			{
				addMimbraneEvent("Frustrated by the ignorance to its fellow parasite’s plight, your other Mimbrane comes to its aid and begins sweating profusely. The additional onslaught of oily passionate perspiration won’t make things any easier for you.");

				i = mimbraneEffects.length; // break the loop without returning
			}
			else if (attachedMimbranes() > 2)
			{
				addMimbraneEvent("Frustrated by the ignorance to their follow parasite’s plight, all your other Mimbranes decide to come to its aid and begin sweating profusely. A good deal of your body is under their oily passionate assault, escalating the sexual torment swirling around your senses!");

				i = mimbraneEffects.length; // break the loop without returning
			}
		}
	}
	
	mimbraneEventHeaderDone = false;
}

//These scenes/lines take place in between scenes much like Shouldra’s. Other than messages dictated by time (i.e. hungry Mimbrane warnings), the odds for these to occur are low to help prevent from getting repetitive and annoying.
// This shit is basically called every time the time hour ticks over, so yeah it might be slow as balls 
public function mimbranesComplainAndShit():void
{
	// Throw things into the eventQueue for time progression events
	// 4 day warnings
	var doneHands:Boolean = false;
	var doneFeet:Boolean = false;
	var hungryMimbrane:Boolean = false;
	var trustValue:int;
	var mimFreq:int = 3;

	for (var ii:int = 0; ii < mimbraneEffects.length; ii++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[ii]))
		{
			// There comes a point where you just don't give a shit anymore, and you just want this shit to WORK.
			// Copypaste code, best code.

			//Hungry Mimbranes
			//Warning One
			//Occurs on fifth day since last feeding
			if (pc.statusEffectv2(mimbraneEffects[ii]) == 5)
			{
				// Cock
				if (mimbraneEffects[ii] == "Mimbrane Cock")
				{
					if (mimbraneDebug) trace("Mimbrane Cock unfed for 5 days!");

					// 0-2 trust
					if (pc.statusEffectv1("Mimbrane Cock") <= 2)
					{
						addMimbraneEvent("Your [pc.cock] rustles around a little, surprising you. Somehow, you figure it’s yearning for some much needed action.");
					}
					// 3+ trust
					else
					{
						addMimbraneEvent("Some anxious little squeals are coming from your [pc.cock]. The Mimbrane member has gotten a little hungry.");
					}
				}
				// Vag
				else if (mimbraneEffects[ii] == "Mimbrane Pussy")
				{
					if (mimbraneDebug) trace("Mimbrane Pussy unfed for 5 days!");

					//0-2 Trust: 
					if (pc.statusEffectv1("Mimbrane Pussy") <= 2)
					{
						addMimbraneEvent("There’s an odd craving to feed your [pc.pussy] lingering around in your headspace. You aren’t sure why.");
					}
					//3-4 Trust: 
					else
					{
						addMimbraneEvent("The Mimbrane in your [pc.lowerGarment] is getting to be a bit parched. It’s lewdly pulsating, trying to remind you.");
					}
				}
				// Butt
				else if (mimbraneEffects[ii] == "Mimbrane Ass")
				{
					if (mimbraneDebug) trace("Mimbrane Ass unfed for 5 days!");

					//0-2 Trust: 
					if (pc.statusEffectv1("Mimbrane Ass") <= 2)
					{
						addMimbraneEvent("A surprising little quaver of your [pc.asshole] catches you off guard. It longs for some action.");
					}
					//3-4 Trust: 
					else
					{
						addMimbraneEvent("Your [pc.ass] starts chirping at you, revealing to you a particularly famished Mimbrane is trying to get your attention.");
					}
				}
				else if (mimbraneEffects[ii] == "Mimbrane Balls")
				{
					if (mimbraneDebug) trace("Mimbrane Balls unfed for 5 days!");

					//0-2 Trust: 
					if (pc.statusEffectv1("Mimbrane Balls") <= 2)
					{
						addMimbraneEvent("Some unusual churning in your [pc.balls] gives you pause. It felt more like a low grumble....");
					}
					//3-4 Trust: 
					else
					{
						addMimbraneEvent("Your [pc.balls] rustle around a little, seemingly rubbing against your thigh. Seems your Mimbrane is getting hungry.");
					}
				}
				else if (mimbraneEffects[ii] == "Mimbrane Boobs")
				{
					if (mimbraneDebug) trace("Mimbrane Boobs unfed for 5 days!");

					//0-2 Trust: 
					if (pc.statusEffectv1("Mimbrane Boobs") <= 2)
					{
						addMimbraneEvent("The wobbling in your [pc.fullChest] stops you in your tracks. They feel... hungry.");
					}
					//3-4 Trust: 
					else
					{
						addMimbraneEvent("A little series of chirps escape from your [pc.nipples]. You’re worried for a moment, but then realize that your hungry Mimbrane is vying for your attention.");
					}
				}
				else if (mimbraneEffects[ii].indexOf("Mimbrane Hand") != -1)
				{
					if (!doneHands)
					{
						if (mimbraneDebug) trace("Mimbrane Hand(s) unfed for 5 days!");

						// Two hands
						if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right"))
						{
							// Both hands should following the same feeding/upgrading pattern
							if (pc.statusEffectv1("Mimbrane Hand Left") <= 2)
							{
								addMimbraneEvent("Your hands start to feel weak. It’s as if they were eager for something....");
							}
							else
							{
								addMimbraneEvent("Both your hands chirp and squeak in unison, letting you know there are a couple of famished Mimbranes trying to get your attention.");
							}
						}
						// Only one hand
						else
						{
							trustValue = -1;
							if (pc.hasStatusEffect("Mimbrane Hand Left")) trustValue = pc.statusEffectv1("Mimbrane Hand Left");
							else trustValue = pc.statusEffectv1("Mimbrane Hand Right");

							if (trustValue <= 2)
							{
								addMimbraneEvent("Your hand trembles a little, taking you by surprise. It feels like it needs something....");
							}
							else
							{
								addMimbraneEvent("Fingers wiggle and poke at you, alerting you to a rather anxious Mimbrane. The parasite must be getting hungry....");
							}
						}

						doneHands = true;
					}
				}
				// Feets
				else if (mimbraneEffects[ii].indexOf("Mimbrane Foot") != -1)
				{
					if (!doneFeet)
					{
						if (mimbraneDebug) trace("Mimbrane Feet unfed for 5 days!");

						// Two heet
						if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right"))
						{
							// Both feet should following the same feeding/upgrading pattern
							if (pc.statusEffectv1("Mimbrane Foot Left") <= 2)
							{
								addMimbraneEvent("There’s an indescribable feeling of hunger coming from your [pc.feet].");
							}
							else
							{
								addMimbraneEvent("Muffled squeaks and chirps are coming from your [pc.feet]. Your Mimbranes must be getting hungry.");
							}
						}
						// Only one foot
						else
						{
							trustValue = -1;
							if (pc.hasStatusEffect("Mimbrane Foot Left")) trustValue = pc.statusEffectv1("Mimbrane Foot Left");
							else trustValue = pc.statusEffectv1("Mimbrane Foot Right");

							if (trustValue <= 2)
							{
								addMimbraneEvent("You can feel the toes of your [pc.foot] twitch involuntarily. It feels anxious for something.");
							}
							else
							{
								addMimbraneEvent("The Mimbrane on your [pc.foot] is getting a little hungry, judging by how it impatiently wiggles your toes from time to time.");
							}
						}

						doneFeet = true;
					}
				}
				else if (mimbraneEffects[ii] == "Mimbrane Face")
				{
					if (mimbraneDebug) trace("Mimbrane Face unfed for 5 days!");

					//0-2 Trust: 
					if (pc.statusEffectv1("Mimbrane Face") <= 2)
					{
						addMimbraneEvent("A little trembling in your [pc.lips] catches you off guard. You figure someone’s getting hungry....");
					}
					//3-4 Trust: 
					else
					{
						addMimbraneEvent("Your [pc.face] feels a little... loose? Your [pc.lips] suddenly squeeze together and squeak. Looks like the head-mounted Mimbrane’s getting a might hungry.");
					}
				}
			}
			//Warning Two
			//Occurs on sixth day since last feeding
			else if (pc.statusEffectv2(mimbraneEffects[ii]) == 6)
			{
				// Cock
				if (mimbraneEffects[ii] == "Mimbrane Cock")
				{
					if (mimbraneDebug) trace("Mimbrane Cock unfed for 6 days!");

					// 0-2 trust
					if (pc.statusEffectv1("Mimbrane Cock") <= 2)
					{
						addMimbraneEvent("The involuntary wiggling of your [pc.cock] is getting worse. You’re worried something might happen if you don’t take care of it soon.");
					}
					// 3+ trust
					else
					{
						addMimbraneEvent("Your [pc.cock] is trying to escape from your [pc.lowerGarment], chirping at you. This hungry Mimbrane is liable to start getting upset.");
					}
				}
				// Vag
				else if (mimbraneEffects[ii] == "Mimbrane Pussy")
				{
					if (mimbraneDebug) trace("Mimbrane Pussy unfed for 6 days!");

					//0-2 Trust: 
					if (pc.statusEffectv1("Mimbrane Pussy") <= 2)
					{
						addMimbraneEvent("The bizarre desire radiating from your [pc.pussy] is only getting worse. Something may happen if you don’t satisfy it soon.");
					}
					//3-4 Trust: 
					else
					{
						addMimbraneEvent("A fiery passion blooming in your [pc.pussy] is only escalating. Your Mimbrane is getting really hungry and may take action soon.");
					}
				}
				// Butt
				else if (mimbraneEffects[ii] == "Mimbrane Ass")
				{
					if (mimbraneDebug) trace("Mimbrane Ass unfed for 6 days!");

					//0-2 Trust: 
					if (pc.statusEffectv1("Mimbrane Ass") <= 2)
					{
						addMimbraneEvent("Your [pc.ass] shivers and shakes uncontrollably here and again, aching for some action. Something may happen soon if you don’t see about helping it.");
					}
					//3-4 Trust: 
					else
					{
						addMimbraneEvent("The rather frequent cries from your [pc.asshole] paired with the strange wiggling of your [pc.ass] is getting obnoxious. The hungry Mimbrane is on the verge of doing something....");
					}
				}
				else if (mimbraneEffects[ii] == "Mimbrane Balls")
				{
					if (mimbraneDebug) trace("Mimbrane Balls unfed for 6 days!");

					//0-2 Trust: 
					if (pc.statusEffectv1("Mimbrane Balls") <= 2)
					{
						addMimbraneEvent("The odd sense of thirst surrounding your [pc.balls] is only getting worse. If you don’t quench it soon, you worry something may happen.");
					}
					//3-4 Trust: 
					else
					{
						addMimbraneEvent("A deluge of squeaks and wiggling from your [pc.sack] means your Mimbrane is getting hungrier. It’s liable to take action if you don’t first.");
					}
				}
				else if (mimbraneEffects[ii] == "Mimbrane Boobs")
				{
					if (mimbraneDebug) trace("Mimbrane Boobs unfed for 6 days!");

					//0-2 Trust: 
					if (pc.statusEffectv1("Mimbrane Boobs") <= 2)
					{
						addMimbraneEvent("This craving engulfing your [pc.fullChest] is only growing stronger. You fear something may happen if you ignore it any longer.");
					}
					//3-4 Trust: 
					else
					{
						addMimbraneEvent("Your [pc.fullChest] is rubbing anxiously against your [pc.armor], soft squeaks pouring from your [pc.nipples]. The hungry Mimbrane may do something drastic if it doesn’t see any action soon.");
					}
				}
				else if (mimbraneEffects[ii].indexOf("Mimbrane Hand") != -1)
				{
					if (!doneHands)
					{
						if (mimbraneDebug) trace("Mimbrane Hand(s) unfed for 6 days!");

						// Two hands
						if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right"))
						{
							// Both hands should following the same feeding/upgrading pattern
							if (pc.statusEffectv1("Mimbrane Hand Left") <= 2)
							{
								addMimbraneEvent("Your hands feel hungry, and you don’t understand it. Things may rise past this odd yearning if you don’t take care of it soon.");
							}
							else
							{
								addMimbraneEvent("Your Mimbrane mitts keep trying to dash into your [pc.armor] and get a bite to eat. You’re worried that if you don’t feed them soon, something may happen.");
							}
						}
						// Only one hand
						else
						{
							trustValue = -1;
							if (pc.hasStatusEffect("Mimbrane Hand Left")) trustValue = pc.statusEffectv1("Mimbrane Hand Left");
							else trustValue = pc.statusEffectv1("Mimbrane Hand Right");

							if (trustValue <= 2)
							{
								addMimbraneEvent("This urge to get your hand some action is unquestionable yet vague. Whatever it means, you’re worried things may get worse for you if you don’t figure it out soon.");
							}
							else
							{
								addMimbraneEvent("You occasionally catch your hand sneaking away into your [pc.armor], trying to feed. The hungry Mimbrane may do something brash if you don’t feed it soon.");
							}
						}

						doneHands = true;
					}
				}
				// Feets
				else if (mimbraneEffects[ii].indexOf("Mimbrane Foot") != -1)
				{
					if (!doneFeet)
					{
						if (mimbraneDebug) trace("Mimbrane Feet/Foot unfed for 6 days!");

						// Two heet
						if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right"))
						{
							// Both feet should following the same feeding/upgrading pattern
							if (pc.statusEffectv1("Mimbrane Foot Left") <= 2)
							{
								addMimbraneEvent("Nothing you do helps you ignore the craving surrounding your [pc.feet]. The unusual urge worries you, as things may escalate if you don’t see to it soon.");
							}
							else
							{
								addMimbraneEvent("Your [pc.feet] cry out to you, the Mimbranes anxious for some food. You’re worried something worse than wiggling toes and digging heels is in store for you if you don’t help them out.");
							}
						}
						// Only one foot
						else
						{
							trustValue = -1;
							if (pc.hasStatusEffect("Mimbrane Foot Left")) trustValue = pc.statusEffectv1("Mimbrane Foot Left");
							else trustValue = pc.statusEffectv1("Mimbrane Foot Right");

							if (trustValue <= 2)
							{
								addMimbraneEvent("The hunger you feel in your [pc.foot] is no less strange as it grows in tenacity. Something may happen if you don’t see to it soon, you fear.");
							}
							else
							{
								addMimbraneEvent("Your toes move like impatient fingers tapping on a surface. Your Mimbrane is getting hungry and may do something soon if you continue ignoring it.");
							}
						}

						doneFeet = true;
					}
				}
				else if (mimbraneEffects[ii] == "Mimbrane Face")
				{
					if (mimbraneDebug) trace("Mimbrane Face unfed for 6 days!");

					//0-2 Trust: 
					if (pc.statusEffectv1("Mimbrane Face") <= 2)
					{
						addMimbraneEvent("A sexual craving surrounds your [pc.face] like a mask, and it’s only getting stronger. You fear things may get ugly if you don’t figure out how to quell it.");
					}
					//3-4 Trust: 
					else
					{
						addMimbraneEvent("The Mimbrane on your [pc.face] is upset, squeaking incessantly via your [pc.lips] while shifting your features around uncomfortably. Things may only get worse if you don’t feed it soon.");
					}
				}
			}
			//Still Hungry
			//Occurs when the following Mimbrane is still in a state of hunger. Chance of scene occurring during a transition is only slightly higher than sweating, breathing, and friendly lines below. 
			else if (pc.statusEffectv2(mimbraneEffects[ii]) >= 7)
			{
				hungryMimbrane = true;

				// Cock
				if (mimbraneEffects[ii] == "Mimbrane Cock")
				{
					if (mimbraneDebug) trace("Mimbrane Cock unfed for 7 days!");

					addMimbraneEvent("You find it difficult to concentrate on your activities as you’re constantly aroused and bothered by your Mimbrane-slickened [pc.cock]. It occasionally glides around within your [pc.armor], spreading its lust-inducing perspiration around your body. The hungry parasite is relentless in its teasing.");
				}
				// Vag
				else if (mimbraneEffects[ii] == "Mimbrane Pussy")
				{
					if (mimbraneDebug) trace("Mimbrane Pussy unfed for 7 days!");

					addMimbraneEvent("It’s hard to focus on the task at hand when your [pc.pussy] is sopping wet in Mimbrane sweat. Constant threats of sexual humidity poke at you, occasionally escaping the confines of your [pc.armor] to peck at your senses. The hungry parasite refuses to give you a moment’s rest.");
				}
				// Butt
				else if (mimbraneEffects[ii] == "Mimbrane Ass")
				{
					if (mimbraneDebug) trace("Mimbrane Ass unfed for 7 days!");

					addMimbraneEvent("Your [pc.ass] makes it nearly impossible to calmly assess a thing as the Mimbrane-soaked pair of cheeks lewdly slide and slather the inside of your armor. Endless clouds of strawberry passion enshroud your behind, occasionally escaping to stroke you with their hot, sexual intentions. Your Mimbrane-controlled [pc.asshole] cries out for some much-desired sustenance.");
				}
				else if (mimbraneEffects[ii] == "Mimbrane Balls")
				{
					if (mimbraneDebug) trace("Mimbrane Balls unfed for 7 days!");

					addMimbraneEvent("Doing anything at all becomes an exercise in frustration as your [pc.sack] goes on suffering from Mimbrane perspiration. A constant cloud of hot, carnal desire kisses at your [pc.balls] and slides around your groin. The hungry parasite has turned the environment within [pc.armor] to a veritable sexual rainforest.");
				}
				else if (mimbraneEffects[ii] == "Mimbrane Boobs")
				{
					if (mimbraneDebug) trace("Mimbrane Boobs unfed for 7 days!");

					addMimbraneEvent("It’s almost gotten too stressful to breathe with the nonstop sexual turmoil the Mimbrane is coating your [pc.fullChest] in. Every square inch of your bosom – down to the tip of your [pc.nipples] – is just sopping wet in the hungry parasite’s sweat. What’s more, constant strawberry-scented odors race out of your [pc.gear] to greet you, bending you over and pounding you with their sensual intentions.");
				}
				else if (mimbraneEffects[ii].indexOf("Mimbrane Hand") != -1)
				{
					if (!doneHands)
					{
						if (mimbraneDebug) trace("Mimbrane Hand(s) unfed for 7 days!");

						// Two hands
						if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right"))
						{
							addMimbraneEvent("You’re forced to keep your hands at a safe distance, lest you be overwrought with their noxious sexual odors. Your hungry Mimbranes have slathered your appendages in a torrential downpour of oily sweat which spreads to everything you touch. It’s hard to get much done without succumbing to the lustful anguish.");
						}
						// Only one hand
						else
						{
							addMimbraneEvent("You’re forced to keep your hand at a safe distance, lest you be overwrought with its noxious sexual odors. Your hungry Mimbrane has slathered your appendage in a torrential downpour of oily sweat which spreads to everything you touch. It’s hard to get much done without succumbing to the lustful anguish.");
						}

						doneHands = true;
					}
				}
				// Feets
				else if (mimbraneEffects[ii].indexOf("Mimbrane Foot") != -1)
				{
					if (!doneFeet)
					{
						if (mimbraneDebug) trace("Mimbrane Feet/Foot unfed for 7 days!");

						// Two heet
						if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right"))
						{
							addMimbraneEvent("Your [pc.feet] are hot and soaked, covered in your hungry Mimbranes’ sexual fluids. The constant lust-inducing sweat is pushing out a powerful scent of strawberry lust that is unrelenting in its teasing. You’re tempted to expose the appendages to the open air just to find a reprieve, but know that you would only be unleashing a kraken of carnal might.");
						}
						// Only one foot
						else
						{
							addMimbraneEvent("Your [pc.foot] is hot and soaked, covered in your hungry Mimbrane’s sexual fluids. The constant lust-inducing sweat is pushing out a powerful scent of strawberry lust that is unrelenting in its teasing. You’re tempted to expose the appendage to the open air just to find a reprieve, but know that you would only be unleashing a kraken of carnal might.");
						}

						doneFeet = true;
					}
				}
				else if (mimbraneEffects[ii] == "Mimbrane Face")
				{
					if (mimbraneDebug) trace("Mimbrane Face unfed for 7 days!");

					addMimbraneEvent("You’ve lost count how many times you’ve wiped sweat from your brow. There’s no escape from the hungry Mimbrane’s angry revolt as it coats your [pc.face] and head in its seemingly limitless sexual sweat. You constantly fan away building clouds of strawberry perspiration before they can further poison you with their wanton instincts.");
				}
			}
		}
	}

	// If any hungry mimbrane exists, all other mimbranes have a chance to spam a message too
	if (hungryMimbrane == true && attachedMimbranes() > 1)
	{
		if (pc.hasStatusEffect("Mimbrane Cock") && pc.statusEffectv2("Mimbrane Cock") < 7)
		{
			if (mimbraneDebug) trace("Mimbrane Cock spamming a message in cooperation with another hungry mimbrane!");


			addMimbraneEvent("You find it difficult to concentrate on your activities as you’re constantly aroused and bothered by your Mimbrane-slickened [pc.cock]. It occasionally glides around within your [pc.armor], spreading its lust-inducing perspiration around your body. The spiteful parasite is relentless in its teasing.");
		}

		if (pc.hasStatusEffect("Mimbrane Pussy") && pc.statusEffectv2("Mimbrane Pussy") < 7)
		{
			if (mimbraneDebug) trace("Mimbrane Pussy spamming a message in cooperation with another hungry mimbrane!");

			addMimbraneEvent("It’s hard to focus on the task at hand when your [pc.pussy] is sopping wet in Mimbrane sweat. Constant threats of sexual humidity poke at you, occasionally escaping the confines of your [pc.armor] to peck at your senses. The sullen parasite refuses to give you a moment’s rest.");
		}

		if (pc.hasStatusEffect("Mimbrane Ass") && pc.statusEffectv2("Mimbrane Ass") < 7)
		{
			if (mimbraneDebug) trace("Mimbrane Ass spamming a message in cooperation with another hungry mimbrane!");

			addMimbraneEvent("Your [pc.ass] makes it nearly impossible to calmly assess a thing as the Mimbrane-soaked pair of cheeks lewdly slide and slather the inside of your armor. Endless clouds of strawberry passion enshroud your behind, occasionally escaping to stroke you with their hot, sexual intentions. Your Mimbrane-controlled [pc.asshole] cries out in protest to support its hungry brethren.");
		}

		if (pc.hasStatusEffect("Mimbrane Balls") && pc.statusEffectv2("Mimbrane Balls") < 7)
		{
			if (mimbraneDebug) trace("Mimbrane Balls spamming a message in cooperation with another hungry mimbrane!");

			addMimbraneEvent("Doing anything at all becomes an exercise in frustration as your [pc.balls] goes on suffering from Mimbrane perspiration. A constant cloud of hot, carnal desire kisses at your [pc.balls] and slides around your groin. The resentful parasite has turned the environment within [pc.armor] to a veritable sexual rainforest.");
		}

		if (pc.hasStatusEffect("Mimbrane Boobs") && pc.statusEffectv2("Mimbrane Boobs") < 7)
		{
			if (mimbraneDebug) trace("Mimbrane Boobs spamming a message in cooperation with another hungry mimbrane!");

			addMimbraneEvent("It’s almost gotten too stressful to breathe with the nonstop sexual turmoil the Mimbrane is coating your [pc.fullChest] in. Every square inch of your bosom – down to the tip of your [pc.nipples] – is just sopping wet in the frustrated parasite’s sweat. What’s more, constant strawberry-scented odors race out of your [pc.gear] to greet you, bending you over and pounding you with their sensual intentions.");
		}

		if ((pc.hasStatusEffect("Mimbrane Hand Left") && !pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv2("Mimbrane Hand Left") < 7)
			|| (!pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv2("Mimbrane Hand Right") < 7))
		{
			if (mimbraneDebug) trace("Mimbrane Hand(s) spamming a message in cooperation with another hungry mimbrane!");

			addMimbraneEvent("You’re forced to keep your hand at a safe distance, lest you be overwrought with its noxious sexual odors. Your impassioned Mimbrane has slathered your appendage in a torrential downpour of oily sweat which spreads to everything you touch. It’s hard to get much done without succumbing to the lustful anguish.");
		}

		if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv2("Mimbrane Hand Left") < 7)
		{
			if (mimbraneDebug) trace("Mimbrane Hand(s) spamming a message in cooperation with another hungry mimbrane!");

			addMimbraneEvent("You’re forced to keep your hands at a safe distance, lest you be overwrought with their noxious sexual odors. Your impassioned Mimbranes have slathered your appendages in a torrential downpour of oily sweat which spreads to everything you touch. It’s hard to get much done without succumbing to the lustful anguish.");
		}

		if ((pc.hasStatusEffect("Mimbrane Foot Left") && !pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv2("Mimbrane Foot Left") < 7)
			|| (!pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv2("Mimbrane Foot Right") < 7))
		{
			if (mimbraneDebug) trace("Mimbrane Foot spamming a message in cooperation with another hungry mimbrane!");

			addMimbraneEvent("Your [pc.foot] is hot and soaked, covered in your indignant Mimbrane’s sexual fluids. The constant lust-inducing sweat is pushing out a powerful scent of strawberry lust that is unrelenting in its teasing. You’re tempted to expose the appendage to the open air just to find a reprieve, but know that you would only be unleashing a kraken of carnal might.");
		}

		if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv2("Mimbrane Foot Left") < 7)
		{
			if (mimbraneDebug) trace("Mimbrane Feet spamming a message in cooperation with another hungry mimbrane!");

			addMimbraneEvent("Your [pc.feet] are hot and soaked, covered in your indignant Mimbranes’ sexual fluids. The constant lust-inducing sweat is pushing out a powerful scent of strawberry lust that is unrelenting in its teasing. You’re tempted to expose the appendages to the open air just to find a reprieve, but know that you would only be unleashing a kraken of carnal might.");
		}

		if (pc.hasStatusEffect("Mimbrane Face") && pc.statusEffectv2("Mimbrane Face") < 7)
		{
			if (mimbraneDebug) trace("Mimbrane Face spamming a message in cooperation with another hungry mimbrane!");

			addMimbraneEvent("You’ve lost count how many times you’ve wiped sweat from your brow. There’s no escape from the outraged Mimbrane’s angry revolt as it coats your [pc.face] and head in its seemingly limitless sexual sweat. Constantly you fan away building clouds of strawberry perspiration before they can further poison you with their wanton instincts.");
		}
	}

	// If no hungry mimbranes exist, and the player has voluntarily allowed Mimbranes to sweat on them...
	if (hungryMimbrane == false && flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] != undefined)
	{
		if (mimbraneDebug) trace("Spamming some voluntary mimbrane sweat messages.");

		if (pc.hasStatusEffect("Mimbrane Cock") && pc.statusEffectv1("Mimbrane Cock") >= 3 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Cock is sweaing!");

			if(pc.isCrotchGarbed()) addMimbraneEvent("The ever-present moist spot on your [pc.lowerGarment] is the telltale sign that your [pc.cock] is absolutely soaked in oily, sexual sweat. The Mimbrane member occasionally rubs against your inner thighs or slides up your waist, tickling you with moist perversion while simultaneously arousing you with each well-lubricated stroke.");
			else addMimbraneEvent("Your [pc.cock] is absolutely soaked in oily, sexual sweat. If you had anything on, it would probably clearly display a wet spot for anyone to see. The Mimbrane member occasionally rubs against your inner thighs or slides up your waist, tickling you with moist perversion while simultaneously arousing you with each well-lubricated stroke.");
		}

		if (pc.hasStatusEffect("Mimbrane Pussy") && pc.statusEffectv1("Mimbrane Pussy") >= 3 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Pussy is sweating!");

			addMimbraneEvent("The pinkish haze around your groin about masks the constant dripping of Mimbrane sweat pouring out and around your [pc.pussy]. Your gait blends the perspiration all along your midsection, ensuring your oily perplexion doesn’t go to waste.");
		}

		if (pc.hasStatusEffect("Mimbrane Ass") && pc.statusEffectv1("Mimbrane Ass") >= 3 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Ass is sweating!");
			var textBuffer:String = "Coated in oily Mimbrane persuasion, your [pc.ass]";
			if(pc.armor.shortName != "") textBuffer += " no longer seems to form any sort of traction against your [pc.armor]. Instead, each of your steps merely glides each cheek against the surface, tantalizing you with each whimsical caress.";
			else textBuffer += " gleams dully in the light, so slick that any garment you were to put on would glide effortlessly across its cheeks, tantalizing you with whimsical caresses.";
			textBuffer += " Occasionally small pink clouds of moist, humid, dense lust will escape out into the open, showing a fairly clear trail of where you’ve been. You suspect the parasitic [pc.asshole] is enjoying itself.";
			addMimbraneEvent(textBuffer);
		}

		if (pc.hasStatusEffect("Mimbrane Balls") && pc.statusEffectv1("Mimbrane Balls") >= 3 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Balls are sweating!");

			addMimbraneEvent("It’s actually surprising how comfortable a friendly bath-of-sorts in Mimbrane lubricant can feel compared to when it is done in an aggressive fashion. A curtain of oily, tingly lust drapes around your [pc.balls], causing them to effortlessly glide about in your [pc.armor]. The typically oppressive humid shroud that comes as a result of this parasitic perspiration is more pleasant to you as well. Though you still aren’t completely immune to just how much the ongoing oil massage turns you on....");
		}

		if (pc.hasStatusEffect("Mimbrane Boobs") && pc.statusEffectv1("Mimbrane Boobs") >= 3 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Boobs are sweating!");

			if(pc.isChestGarbed()) addMimbraneEvent("The amusement from having your [pc.fullChest] constantly covered in oily Mimbrane sweat hasn’t gotten old to you yet. Your bosom glides freely about in your [pc.upperGarment], seeming to not even understand the meaning of the word “friction.” Not only that, but occasional clouds of strawberry-scented salaciousness escape your garments and tickle your senses.");
			else addMimbraneEvent("The amusement from having your [pc.fullChest] constantly covered in oily Mimbrane sweat hasn’t gotten old to you yet. Not only that, but occasional clouds of strawberry-scented salaciousness tickle your senses, given off by your bare chest.");
		}

		if (((pc.hasStatusEffect("Mimbrane Hand Left") && !pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv1("Mimbrane Hand Left") >= 3)
			|| (!pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv1("Mimbrane Hand Right") >= 3)) && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Hand is sweating!");

			addMimbraneEvent("You hadn’t counted on the expert control your hand-bound Mimbrane would impart on its oily secretions. In one instance your lubricated, sex-charged grasp glides effortlessly over all genitalia it encounters. But in another instance, you command a firm grip on your weapon in combat, while refusing to abandon your moist sheen. It’s an impressive feat.");
		}

		if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv1("Mimbrane Hand Left") >= 3 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Hands are sweating!");

			addMimbraneEvent("You hadn’t counted on the expert control your hand-bound Mimbranes would impart on their oily secretions. In one instance your lubricated, sex-charged grasp glides effortlessly over all genitalia it encounters. But in another instance, you command a firm grip on your weapons in combat, while refusing to abandon your moist sheen. It’s an impressive feat.");
		}

		if (((pc.hasStatusEffect("Mimbrane Foot Left") && !pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv1("Mimbrane Foot Left") >= 3)
			|| (!pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv1("Mimbrane Foot Right") >= 3)) && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Foot is sweating!");

			addMimbraneEvent("Blissful confusion is a good description for what your [pc.foot] feels it’s going through. The Mimbrane-covered extremity is swimming in the parasite’s love-bent secretions, and yet you never lose your footing. The satisfaction of exposing a sweat-drenched, hot foot to the air is one you apparently can cherish continuously as well. However, the usual stench of body odor has been overwritten by the wanton strawberry aroma that radiates from the creature’s work.");
		}

		if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv1("Mimbrane Foot Left") >= 3 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Feet are sweating!");

			addMimbraneEvent("Blissful confusion is a good description for what your [pc.feet] feel they are going through. The Mimbrane-covered extremities are swimming in the parasites’ love-bent secretions, and yet you never lose your footing. The satisfaction of exposing a sweat-drenched, hot foot to the air is one you apparently can cherish continuously as well. However, the usual stench of body odor has been overwritten by the wanton strawberry aroma that radiates from the creatures’ work.");
		}

		if (pc.hasStatusEffect("Mimbrane Face") && pc.statusEffectv1("Mimbrane Face") >= 3 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Face is sweating!");

			addMimbraneEvent("You continue to enjoy the passionate sheen you get from the neverending downpour of oily Mimbrane sweat running down your [pc.face]. Even your [pc.lips] glint in the sunlight, their [pc.lipColor] color mixing with the lightly pink fluid. Any worries that your head would be in a 24 hour sauna melt away by how the almost eerily refreshing perspiration makes you feel. The clouds of carnality that you shed seem to have a larger effect on your surroundings than they do you.");
		}
	}
	
	mimbraneEventHeaderDone = false;
}

//Reproduction
//Once a Mimbrane has maxed out on feedings, it will no longer track days and go into a hunger state. It will still aid other hungry Mimbranes.
//Reproduction always occurs when the PC is asleep. Unnoticed Reproduction takes place when the PC awakes, normal reproduction takes place in the middle of sleep.
//Only Unnoticed Reproduction scenes occur at trust level 0 and 1. At trust levels 2-4, the reproduction scenes still only have a small chance to occur instead of the Unnoticed Reproduction. The chance raises with each level, potentially at 10, 20, and 30% respectively.
//Mimbrane resets to 0 feedings after reproduction, reseting all of its feeding-based effects on the organ. All parser activity in scenes reflects the enlarged organ.
public function mimbraneSleepEvents():void 
{
	var outputDone:Boolean = false;
	var trustedRepro:Boolean;
	var mimNoticed:Boolean = false;
	var mimFreq:int = 5;
	
	// Special Perk Gain!
	// Face Mimbrane trust level 4 or higher and feeding at 15 or more
	// Total Mimbrane trust 24 or higher
	// 1/4 chance
	if (!mimNoticed && !pc.hasPerk("Mimbrane Symbiosis") && !pc.hasStatusEffect("Disable Mimbrane Symbiosis") && pc.statusEffectv1("Mimbrane Face") >= 4 && pc.statusEffectv3("Mimbrane Face") >= 15 && rand(4) == 0)
	{
		var mimTotalTrust:Number = 0;
		mimTotalTrust += pc.statusEffectv1("Mimbrane Cock");
		mimTotalTrust += pc.statusEffectv1("Mimbrane Balls");
		mimTotalTrust += pc.statusEffectv1("Mimbrane Pussy");
		mimTotalTrust += pc.statusEffectv1("Mimbrane Ass");
		mimTotalTrust += pc.statusEffectv1("Mimbrane Hand Left");
		mimTotalTrust += pc.statusEffectv1("Mimbrane Hand Right");
		mimTotalTrust += pc.statusEffectv1("Mimbrane Foot Left");
		mimTotalTrust += pc.statusEffectv1("Mimbrane Foot Right");
		mimTotalTrust += pc.statusEffectv1("Mimbrane Face");
		
		if(mimTotalTrust >= 24)
		{
			eventQueue.push(function():void {
				clearOutput();
				author("Jacques00");
				
				output("You rise to an uncomfortable feeling all around you. Your head is stuffed and congested, your vision blurry, your hearing muffled, and your limbs stiff... You shake your head and stretch yourself in an attempt to wear it off. It seems to work as you slightly limber up and your senses gradually return to you. When your sight clears up, you take a good look at your");
				if((pc.statusEffectv3("Mimbrane Hand Left") >= 8 && pc.statusEffectv3("Mimbrane Hand Right") < 8) || (pc.statusEffectv3("Mimbrane Hand Left") < 8 && pc.statusEffectv3("Mimbrane Hand Right") >= 8)) output(" unevenly");
				if(pc.statusEffectv3("Mimbrane Hand Left") >= 8 || pc.statusEffectv3("Mimbrane Hand Right") >= 8) output(" bloated");
				output(" hands. Nothing out of the ordinary. However, as your hearing returns, you pick up on a constant nagging sound... of chirping and squeaking? If your twitchy, swollen lips are any indication, your Mimbranes are trying to get your attention!");
				output("\n\nThe chirping and pulsing continues and you try your best to figure out what they want. You smell a cloud of strawberries surrounding you...");
				
				clearMenu();
				addButton(0, "Next", mimbraneGainSymbiosis);
			});
			
			outputDone = true;
			mimNoticed = true;
		}
	}

	// Reprorduction takes precedence over breathing events
	if (pc.hasStatusEffect("Mimbrane Cock") && pc.statusEffectv3("Mimbrane Cock") >= 15)
	{
		outputDone = true;

		if (!mimNoticed && pc.statusEffectv1("Mimbrane Cock") >= 2 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Noticed Mimbrane Cock Reproduction!");

			// Noticed Reproduction
			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();
				author("Kirbu");
				output("Some totally awesome dream of yours fades away, chased away by an odd feeling. Going back to sleep is paramount until you again feel an odd straining in your [pc.cock]. No longer concerned with pursuing your lost fantasy, you throw off your covers to figure out what is going on. The slab of meat has swollen considerably and appears to be erect, but you’re more concerned with the erratic twitching. When your cock spasms to one side, you finally notice that the Mimbrane’s eyes are wide open. The parasite appears to be under some heavy stress. Strangely, you feel fine despite knowing full well the second skin has worked all sorts of kinks into your nervous system.");
				output("\n\nYour convulsing dick lets out a long, drawn-out squeak. It feels a little- Suddenly the life just vanishes from the Mimbrane’s eyes. The distended pecker limps to one side. For a moment you’re concerned the little bastard is doing something malicious, but then your senses kick in. The Mimbrane is reproducing!");
				if (flags["MIMBRANE_COCK_REPRODUCTION_NOTICED"] != undefined) output(" The vestiges of sleep must be why you forgot.");
				output(" The reason you aren’t being traumatized or being artificially thrusted to lust’s end is due to the parasite’s natural inclination to raise its host’s ire. This one apparently isn’t entirely too concerned whether or not you’re awake for its performance.");
				output("\n\nA pressure besieges your pumped-up pecker suddenly. You can no longer feel the cool air of your ship on your manhood; it feels as if it were encased in concrete! Despite knowing this is a natural part of the creature’s life cycle, you’re unable to keep from worrying about your penis. A concerned grasp confirms it: you can’t feel your cock, at least not what’s in front of you. Nothing looks different - your [pc.cock] doesn’t appear lifeless unlike the empty gaze of the parasite - but you may as well be pawing at a perfect replica of your fuckstick.");
				output("\n\nBubbling on your [pc.cockhead] grabs your attention. What appears to be an odd mixture of pre-cum and the Mimbrane’s oily secretion is drooling out of your opening. As odd as this looks, it pales in comparison when you start to feel a bizarre peeling sensation around your dick. You can feel your manhood shuffling around inside the imitation in front of you, flexing and wiggling as it separates itself from the phallic shell.");
				output("\n\nThere is no pain, nor immense sexual pleasure. The best description of what you feel is like ridding yourself of a bandage or peeling off a latex glove. But your cock does feel incredibly tender and sensitive. You back away when your [pc.cock] shuffles around again. Each shrug and shake separates your inner prick from the outer. Honestly, the whole ordeal is confusing. You feel your dick shedding its former self. You see your healthy-looking former prick dancing strangely around.");
				output("\n\nShockingly cool air hitting the base of your rod alerts you to the first clearly visible change. The Mimbrane is flaying off its former self right at the seam to your natural skin. Still you feel nothing more unusual than a sticker cleanly falling off your [pc.skin]. Your eyes are trying to alert your brain to something horrendous happening, but the message is hit with skepticism. There is no ripping or tearing. You’re still unable to really perceive where the parasite ends and your real [pc.skin] begins. But now it looks like you were just wearing a beautifully realistic sleeve.");
				output("\n\nThen the [pc.cock] droops forward, and air rushes in through the opening. That’s when you realize just how slick your inner dick feels. You’re no longer shedding anything. The Mimbrane is slipping free. You can only watch in awe as your former cock just effortlessly glides off of you and flops onto the floor. Even now it still looks perfectly healthy and natural... until you gaze inside the hollow center to see the familiar texture of the underside of a natural Mimbrane.");
				output("\n\nThe inquisitive stare is interrupted by a faintly sweet fragrance. Your [pc.cockNounSimple] dong – back to a size you’re familiar with – is soaking wet, coated in the mixture of cum and Mimbrane sweat you saw earlier. A finger running along your masculine length reveals how tender it is to the touch, more sensitive and raw than its ever been before. The parasite must-");
				output("\n\nThe battle for your attention turns back to the replica penis on the ground, now writhing around with newfound life. The dead gaze has been replaced with a pair of clenched-shut eyes. Your former urethral opening is now working its way along the prick’s length, unfolding the cylinder to more closely resemble something closer to the Mimbrane’s more square appearance.");
				output("\n\nIt’s an odd sight to say the least.");
				output("\n\nYou aren’t quite sure how to feel about watching your former pride and joy cast aside its penile attributes. The newly formed parasite casts a gaze back at you, still resembling a cleanly flayed [pc.cockhead]. Your fairly smaller cock throws its prodigy a quick little chirp. And then it disappears into the darkness of your ship, crawling on its odd-looking four corners. Presumably it’ll finish out the rest of its transformation before sneaking its way off your vessel to continue on its life elsewhere.");
				output("\n\nAwkward silence is your only ally now. Your own Mimbrane has decided to call it a night and your dick seems to have done the same, relaxing and drying back to something much more normal. All you can do is ponder over the interesting occurrence, the image of your [pc.cock] flopping and crawling away from you burned into your mind.");
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});

			if (flags["MIMBRANE_COCK_REPRODUCTION_NOTICED"] == undefined) flags["MIMBRANE_COCK_REPRODUCTION_NOTICED"] = 1;
			else flags["MIMBRANE_COCK_REPRODUCTION_NOTICED"]++;
			mimNoticed = true;
		}
		else
		{
			if (mimbraneDebug) trace("Unnoticed Mimbrane Cock Reproduction!");

			// Unnoticed Reproduction
			addMimbraneEvent("Upon waking up, you’re surprised to find that your [pc.cock] has reduced down to your average size. It feels a little tender; perhaps the Mimbrane was able to split off its offspring while you were asleep?");
		}

		mimbraneReproduce("Mimbrane Cock");
	}

	if (pc.hasStatusEffect("Mimbrane Pussy") && pc.statusEffectv3("Mimbrane Pussy") >= 15)
	{
		outputDone = true;

		if (!mimNoticed && pc.statusEffectv1("Mimbrane Pussy") >= 2 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Noticed Mimbrane Pussy Reproduction!");

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();
				author("Kirbu");
				output("One second you’re a mighty sexual " + pc.mf("god", "goddess") + ", dominating the galaxy armed only with your amazing body. The next second you’re listening to the hum of your ship. Eyes dart around in pursuit of your dream slayer, but it’s a curious straining down at your [pc.pussy] that lets you know who the culprit was. Covers are tossed to the side, dim lighting revealing your spasming snatch. The Mimbrane’s miniature eyes are open as wide as they can manage. Something is wrong, but you sure as hell aren’t feeling anything stranger than the typical oddness that follows involuntary movement of your body.");
				output("\n\nStrained little chirps and squeaks escape your folds as they stretch and clench. The puffed-up pussy looks to be going through some ordeal, clearly. For a brief moment you figure the parasite is up to no good, but then you remember your codex’s valuable information. The little creature is reproducing!");
				if (flags["MIMBRANE_PUSSY_REPRODUCTION_NOTICED"] != undefined) output(" The vestiges of sleep must be why you forgot.");
				output(" The reason you aren’t being traumatized or being artificially thrusted to lust’s end is due to the parasite’s natural inclination to not alert its host to its actions. This one apparently isn’t entirely too concerned whether or not you’re awake for its performance.");
				output("\n\nThe traumatized gaze of the Mimbrane goes blank. You wave a hand past to confirm the absence of life. In the process of waving, another realization crawls up into daylight: your [pc.pussy] is numb. It looks normal and healthy, other than perhaps an overly plump appearance, but any attempts to manhandle it only feel like you’re tapping away at a fleshy shell.");
				if(pc.hasClit()) output(" Prodding at your [pc.clit] is a fruitless effort.");
				output(" It’s a relief that you recalled your electronic encyclopedia, otherwise you may be freaking the fuck out! Regardless, this is still disconcerting to say the least.");
				output("\n\nLiquid starts drooling out of your snatch suddenly, causing your wandering digits to back off. Swirls of clear and pink liquids make it look like a mixture of sexual fluids and Mimbrane sweat. You get a few moments to stare at the concoction before your snatch stirs yet again. Amongst all the contracting, straining and flexing you can make out a peeling sensation. It’s as if your pussy were trapped under a rather bloated replica, struggling to free itself.");
				output("\n\nThe liquid stream starts and stops in time with the convulsions. Each time you can make out a little more feminine flesh casting off from the hollow love box atop it. Should you help? The bizarre process is a little mesmerizing as it plays out, your half-awake senses too hypnotized to try and aid in the parasite’s natural cycle. Said senses do get a little jolt once the decidedly cool air seeps under your pussy-coating. It can be difficult to make out the finer details in the dim lighting of your quarters, so the mystery of where the parasite ends and your own [pc.skin] begins remains just that.");
				output("\n\nSoon the unorthodox movements of your vagina stop perfectly reflecting those of your outward flesh. The air makes it plainly obvious that your buried pussy is soaking wet, lubricating itself to cleanly rid itself of the second skin – or would this make it a third skin? The [pc.pussy] keeps getting looser, confusing you as its visual movements continue to not match up with what you can feel. It gets easier to perceive the box as a covering when more and more air sneaks in under the ever-expanding opening, kissing the underlying skin.");
				output("\n\nOne final, forceful push is all that remains before your former vagina slips down off your body. It’s as if it never was yours to begin with. In its place is a much smaller canyon, shining in a sheen of fluids and emitting the faint, yet unmistakable scent of Mimbrane secretion. With the involuntary action subsiding, you resume the courage to examine your slimed genitalia. It’s sensitive and raw to the touch, feeling as fresh as you would have expected. Clearly this is straight off the Mimbrane production line.");
				output("\n\nSuddenly the withdrawn [pc.pussy]");
				if(pc.legCount > 1) output(" between your [pc.legs]");
				output(" shuffles and shakes, stealing away your attention. The once lifeless stare has found a new source of vigor, both eyes clenched shut as new life bursts forth in your former flesh. The gash fills and flattens, slightly working its way to resembling the more square appearance of a normal Mimbrane.");
				output("\n\nThe thrashing calms and the new parasite looks up towards you, your erstwhile vagina pulsing rather lewdly. The Mimbrane still attached to you lets out a humble little squeak, causing a little reaction out of its offspring. But before the bizarre moment can get any more touching, the new pussy parasite awkwardly clamors away on its hastily fashioned four corners. It must be seeking any form of solitude to complete its transformation back into that of a normal Mimbrane. Once it’s finished, the creature will sneak its way off your ship to start out its own life.");
				output("\n\nOther than the odd movement and sleeker pussy, you aren’t much different now that everything’s said and done. Your Mimbrane tuckered itself out, and your tender cavern is quickly drying back to its natural moisture. Probably best to just go back to sleep....");
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});

			if (flags["MIMBRANE_PUSSY_REPRODUCTION_NOTICED"] == undefined) flags["MIMBRANE_PUSSY_REPRODUCTION_NOTICED"] = 1;
			else flags["MIMBRANE_PUSSY_REPRODUCTION_NOTICED"]++;
			mimNoticed = true;
		}
		else
		{
			if (mimbraneDebug) trace("Unnoticed Mimbrane Pussy Reproduction!");

			addMimbraneEvent("Casting off the remnants of sleep, an odd realization strikes your crotch. Namely, your [pc.pussy] is back to its normal size and qualities. Judging by the tenderness it exudes upon touch, it’s safe to assume the Mimbrane was able to shed its excess size into a new parasite.");
		}

		mimbraneReproduce("Mimbrane Pussy");
	}

	if (pc.hasStatusEffect("Mimbrane Ass") && pc.statusEffectv3("Mimbrane Ass") >= 15)
	{
		outputDone = true;

		if (!mimNoticed && pc.statusEffectv1("Mimbrane Ass") >= 2 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Noticed Mimbrane Ass Reproduction!");

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();
				author("Kirbu");
				output("A delightful romp through the idyllic dreamscape fades into whatever forgotten realm lost dreams subside. Something has pushed you out from slumber and into the dim silence of your idling ship. You lay motionless on your back staring at nothing in particular. For a moment you hope you’ll merely fade back unconsciousness, but a trembling shudder from your [pc.butt] about scares you half to death. Covers fly off as you flip over; though you may be curious enough to investigate the disturbance, your half-conscious subconscious isn’t ready to completely surrender the notion of returning to sleep.");
				output("\n\nThe moment your hind quarters aren’t pressed against your bed, strained squeaks and chirps escape your [pc.asshole]. It’s clear now that the strange spasms and anal contractions are due to this restless Mimbrane. Typically, sexual urges and depravity accompany strange, uncontrolled body complications. So it’s at least nice to know that no one slipped you something sinister.");
				output("\n\nBut then what is wrong with the parasite for it to suddenly send your bubble butt into a conniption? Is it hungry? Does the parasite long for your hind end to be ravaged by some uncouth cock? It’s already driven your poor rear hole to a gaping moist mess. What more does it want? Then it hits you: your codex mentioned something about Mimbrane reproduction. The enthusiastic bugger has plumped your ass out so much that it must be ready to split off a new Mimbrane!");
				output("\n\n");
				if (flags["MIMBRANE_ASS_REPRODUCTION_NOTICED"] != undefined) output("You’ve gone through this before, you remember. ");
				output("The reason you aren’t being traumatized or being artificially thrusted to lust’s end is due to the parasite’s natural inclination to not alert its host to its actions. This one apparently isn’t entirely too concerned whether or not you’re awake for its performance. Hell, if nothing else, the Mimbrane’s only gotten more lively now that it isn’t pressed up against your bed.");
				output("\n\nJust as your curiousity was to turn to cautious exploration, a numbing sensation overtakes your ass. A worried glare over your shoulder doesn’t alert you to anything new; all it makes out is the continued oddity of your parasitic bottom wiggling out of control. What you can’t see is the dead glaze that’s taken residence in its little eyes. The Mimbrane’s consciousness has faded out from its shell.");
				output("\n\nYou run your hands around your [pc.ass] confirming its lack of feeling. But as you run your finger close to your [pc.asshole], it suddenly clenches shut with amazing force! Your finger is unable to find any sort of purchase from what was once a cavernous wet den. Your only guess is that the Mimbrane would rather not have its hole penetrated in any fashion right at the moment. You’re too groggy to get upset over this and challenge the little monster.");
				output("\n\nA peeling sensation from within your cheeks surprises you next. The parasite must be separating from its second skin. You can make out your new, smaller cheeks as they flex and pull against your [pc.ass]. It’s as if a comically large bandage were being taken off piece by piece from your supple fresh [pc.skin]. Soon, air slinks in and kisses your bottom, letting you know that the parasite has managed to get the edges of its former flesh free. The sensation also alerts you to how moist and tender your behind is. Unbeknownst to you, your new cheeks are covered in a film of Mimbrane sweat.");
				output("\n\nA final tingling peel right at your still-clamped asshole is all that’s left of the parasite’s work.");
				if (pc.ass.looseness() <= 4) output(" As it pops off, you feel your asshole recover from some of the forced looseness brought on to you by the parasite.");
				output(" Your Mimbrane starts thrusting your posterior to the side, trying to slide its offspring off of you. However, your curiosity has grown too large for you to sit on the sidelines any longer, and you promptly grab the lifeless ass-shaped sheet sitting atop your moistened bottom. Your Mimbrane chirps in surprise, but you let the worried critter know you’ll let its prodigy free momentarily. How many other opportunities does one have to inspect a being such as this?");
				output("\n\nYou remain laying on your front, uninterested in smearing your bedspread with the lingering coating of parasitic sweat on your bare bottom. Instead, you rest your head on its side and hold the former [pc.butt] up with one hand. It’s an odd sight paired with the feeling in your grasp. On one side you can feel the [pc.skin], see the unmistakable resemblance of your old bubble butt – [pc.asshole] still forced shut. On the hollow inside, however, is the smooth, damp underside of a Mimbrane.");
				output("\n\nDuring one of your awe-filled glimpses of the ass oddity, the hollow former gaze of your Mimbrane gets a new burst of life. Once the new parasite realizes it’s stuck in your grasp, it flails wildly, forcing you into dropping it helplessly onto the floor. It flops around like the oddest looking fish you’ve ever seen, desperately trying to push out its four corners and get closer to its natural square shape, but it’s unable to hastily rid itself of your former appearance.");
				output("\n\nYour Mimbrane chirps and squeaks again, which seems to bring ease to its offspring as it settles down. The [pc.butt] stares up at you with a cautious gaze before crawling awkwardly into the shadows.");
				output("\n\nThat image will probably linger for some time.");
				output("\n\nAs your own, slimmer Mimbrane bottom dries and calms down, you’re left to yourself and your thoughts. You at least recall from your codex that the new beastie will try and flee the instant the opportunity arrives. You just hope it doesn’t freak anyone out too much before that occurs. Your worry subsides as you slip back into the comforting embrace of sleep.");
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});

			if (flags["MIMBRANE_ASS_REPRODUCTION_NOTICED"] == undefined) flags["MIMBRANE_ASS_REPRODUCTION_NOTICED"] = 1;
			else flags["MIMBRANE_ASS_REPRODUCTION_NOTICED"]++;
			mimNoticed = true;
		}
		else
		{
			if (mimbraneDebug) trace("Unnoticed Mimbrane Ass Reproduction!");

			addMimbraneEvent("Your march back to consciousness is troubled by an odd feeling in your rear. Your [pc.ass] has reverted to its usual size and qualities. It feels delicate to the touch; you suspect the Mimbrane managed to stealthily split off its offspring over the course of your slumber.");
		}

		mimbraneReproduce("Mimbrane Ass");
	}

	if (pc.hasStatusEffect("Mimbrane Balls") && pc.statusEffectv3("Mimbrane Balls") >= 15)
	{
		outputDone = true;

		if (!mimNoticed && pc.statusEffectv1("Mimbrane Balls") >= 2 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Noticed Mimbrane Balls Reproduction!");

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();
				author("Kirbu");
				output("The melodic hums of your ship surround you, a blissful sleep only resident in your memory. Something’s dragged you back to consciousness, but you’ll be damned if it’ll keep you here. Before you can toss and turn, however, that “something” materializes. Your [pc.balls] are wiggling around something fierce! Covers fly to the side, fueled by your sudden anxiety that some manner of insect – or worse – has infiltrated your privates.");
				output("\n\nAll you find is the Mimbrane that has already captured your cum pouch. Its normally well-hid little bumps for eyes look to be clenched shut, straining for some reason. The parasite is trembling about, rustling your [pc.sack] every so often in its costive spasms. What’s gotten into this thing? Is it not enough that its already jacked up your [pc.cumNoun] factories? You’re tempted to grab onto the possessed purse, but your frustrated weariness is brutally stabbed by calm reason and blossoming memories.");
				if (flags["MIMBRANE_BALLS_REPRODUCTION_NOTICED"] != undefined) output(" You really ought to try and recall times like these more often before jumping to other conclusions.");
				output(" The codex... it had discussed Mimbrane reproduction. Typically the parasite waits until the dead of night when its host is asleep to do the deed. This one has done a poor job of remaining concealed, or more likely it doesn’t mind you getting to bear witness to the magic.");
				output("\n\nInstead you decide it to better to");
				if(pc.legCount > 1) output(" spread your [pc.legs] and");
				else output(" present your crotch and");
				output(" give the struggling thing some room. Though the sensation of having your family jewels manipulated as such is particularly unordinary, you aren’t the least bit interested in not taking caution against them being caught or injured. Your role as spectator gets a little more interesting when the Mimbrane’s eyes burst open. There’s a strange hollowness to their gaze, however. What follows is an unsettling numbness overtaking your [pc.balls]. Unable to keep your hands free of the action, some fingers along your [pc.sack] confirm the lack of life.");
				output("\n\nThey look fine, just as lax and healthy-looking as they were before you hit the hay. Reproduction or not, numbness in one’s genitalia is a fairly worthwhile cause for concern. A rustling within your sack keeps you from reaching for a directory to find a doctor. The rustling is followed by the feeling of your scrotum’s [pc.skin] peeling deep within. It’s similar to having them stick to your thighs on an especially humid summer day. Your pouch’s pliability makes the Mimbrane’s task easier, as you can tell it’s moving with directed swiftness in its separation.");
				output("\n\nBut it’s still an extremely weird sensation.");
				output("\n\nAir brushes against your new balls, alerting you that the parasite has freed an edge of its former covering. A whiff of strawberries dances with a newfound dampness, now. Exposed to the open air, it’s become evident that the Mimbrane has coated itself in sweat to aid in the separation process. The creature makes short work of the ordeal, easily manipulating your malleable man-purse. Soon, you feel the former [pc.skin] go lax and merely slide off you.");
				output("\n\nThe former scrote-skin comes off cleanly, flattening out. It hardly resembles the [pc.sack] it once appeared as outside of the clear appearance of flesh. You do spot its underside, standing out with its smooth, pink characteristics mirroring those of natural Mimbranes.");
				output("\n\nOnly a minute or two flutters by before the rag starts to shuffle around once again. The once-dead gaze of the parasite renews with a sense of life, peering around the room from its fleshy perch. The new Mimbrane is shocked when it catches your stare, but a calm squeak from its parent settles its fears. It pushes your former flesh around in an attempt to get closer to its square shape, but it’s having to work double time just to get a little less flexible and flimsy.");
				output("\n\nEventually the confused critter gets enough wits about it to fall off your bed and escape into the darkness of your ship. It will most likely befriend seclusion to aid in its transformation into a full-fledged Mimbrane. You recall that they typically will seek independence straight from birth; most likely this one will flee from your ship the instant the opportunity arises.");
				output("\n\nYour balls appear smaller now, and they’re certainly not working as hard at production as before. Your Mimbrane seems to have passed out from all the excitement. You, however, find it a little more difficult to simply go back to sleep after the odd ordeal. But not too difficult.");
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});

			if (flags["MIMBRANE_BALLS_REPRODUCTION_NOTICED"] == undefined) flags["MIMBRANE_BALLS_REPRODUCTION_NOTICED"] = 1;
			else flags["MIMBRANE_BALLS_REPRODUCTION_NOTICED"]++;
			mimNoticed = true;
		}
		else
		{
			if (mimbraneDebug) trace("Unnoticed Mimbrane Balls Reproduction!");

			addMimbraneEvent("While greeting the new day, an unfamiliar feeling on your crotch worries you. Upon investigation, you find that your [pc.balls] have returned to their normal size and features. They feel soft to the touch; most likely your Mimbrane split off its offspring.");
		}

		mimbraneReproduce("Mimbrane Balls");
	}

	if (pc.hasStatusEffect("Mimbrane Boobs") && pc.statusEffectv3("Mimbrane Boobs") >= 15)
	{
		outputDone = true;

		if (!mimNoticed && pc.statusEffectv1("Mimbrane Boobs") >= 2 && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Noticed Mimbrane Boobs Reproduction!");

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();
				author("Kirbu");
				output("Sweet dreams are made of this. Who are you to disagree? You travel the world and the hum of your ship–");
				output("\n\nGroggy eyes stare at the uninteresting ceiling of your room. Some manner of slumber has been mercilessly slain, leaving you confused and awake. It isn’t entirely obvious why you woke up, but you aren’t all that interested in finding out. But find out you will, as your [pc.fullChest] frightens you down to the core with a mighty shudder. The massive mounds are straining, trembling and wobbling as if possessed by some unholy demon!");
				output("\n\nWhen you hear – and feel – an exerted chirp from one of your [pc.nipples], it becomes a lot more clear what the real deal is. Your chest-mounted Mimbrane seems to be having some sort of complication, flailing and shaking your titties around as a result. You attempt to calm the parasite, but it still shakes and thrusts in your grasp. Is it up to some new form of unusual mischief? Or maybe it’s getting ready to multiply?");
				if (flags["MIMBRANE_BOOBS_REPRODUCTION_NOTICED"] != undefined) output(" You would have noticed sooner that this was happening again had you not been so tired.");
				output(" It has to be reproducing, you figure, it matches what your codex taught you. Typically the parasite will wait until the dead of night to split off its accumulated mass into a fresh new Mimbrane. Typically they only act when their host is asleep, but it would appear that yours doesn’t mind you getting a glimpse of the action.");
				output("\n\nAnd get a glimpse you do. Laying on your back and staring at your chest, it’s mighty hard to miss the involuntary movements of your [pc.chest]. You almost miss the strained expression on the parasite’s eyes, which soon after glaze over, devoid of life. The sight is troubling, but your attention moves elsewhere when your mighty bosom numbs over. The terror thought to be shed returns to your eyes as you paw away helplessly at your chest. Supple boobflesh appears normal and healthy – there’s still the telltale sign of [pc.milk] drizzling from your [pc.nipples] – but only faint sensations register deep under your [pc.skin].");
				output("\n\nAgain you calm. Overreacting isn’t really healthy. The best course of action, you figure, is to sit back and wait this out. You can already feel the parasite working away to separate itself from your now-excess boobage. It’s as if thousands of tiny strips of tape were being plucked from your chest. Beneath this titty shell lies some incredibly sensitive, new breast-flesh. It’s particularly titillating as the Mimbrane takes extra care around your nipples, slowly separating new from old.");
				output("\n\nEventually the creature works it way to the edge of its covering, allowing air to race in and tickle your raw hide. You hadn’t realized before just how moist your new skin was. As the edges lift up, you can even see the escaping liquid. It’s made up of some mixture of [pc.milk] and Mimbrane sweat from the look and smell of it. Before long, your [pc.breasts] are but a hollow shell resting atop your sleek and slender new jubblies.");
				output("\n\nThey stir yet again when the Mimbrane beneath them starts rustling your chest to force off the bygone boobs. It’s tempting to aid, but you’re unusually enamored by the spectacle. Hell, it’s more tempting to get a pen and paper and write a poem involving boob cocoons or something.");
				output("\n\nYou’re still tired.");
				output("\n\nMimbrane labor proves successful and the now-oversized molding of your chest flops to the ground with a wet thud. Even in the dim light of your quarters you can make out the non-stop jiggling of the [pc.breasts]. It’s hard to take your eyes off of them; they’re as perky and hearty as they were when they were on you! Temptation gets its pin count over your willpower, forcing you to reach down and inspect the milkduds. The hollow tits give in a lot more than yours of course. Also surprising is the underside: it’s pure Mimbrane, as smooth, pink, and moist as any other.");
				output("\n\nThe odd grope comes to an end when one of your former breasts wrestles out of your hand. The old eyes of the Mimbrane have been enkindled with new life, and the Mimbrane appears to be scared to death of you. A calm set of squeaks and chirps from your nipples puts it at ease before it can run off. The parent must have let it know everything’s all right.");
				output("\n\nFor a Mimbrane, your former chest seems like a lot of mass to work with. The fresh parasite seems to be having trouble adjusting to the weight, impeding its attempts to try and even slightly resemble its usual flat, square self. The creature manages the best it can, hobbling into the shadows. There’s no way you can’t snicker quietly at the view of your boobs jiggling away from you.");
				output("\n\nAnd that’s that. What’s left of your chest is drying quickly. The remaining parent seems to be sound asleep. Or just pretending, you can’t tell. Hopefully the mountains that hobbled out of your quarters will remain hidden long enough to transform into a normal Mimbrane and get lost. You figure it will. A breast-related dream will probably greet you on your way back to slumberville.");
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
		});

			if (flags["MIMBRANE_BOOBS_REPRODUCTION_NOTICED"] == undefined) flags["MIMBRANE_BOOBS_REPRODUCTION_NOTICED"] = 1;
			else flags["MIMBRANE_BOOBS_REPRODUCTION_NOTICED"]++;
			mimNoticed = true;
		}
		else
		{
			if (mimbraneDebug) trace("Unnoticed Mimbrane Boobs Reproduction!");

			addMimbraneEvent("As you bid farewell to your dreams, a significant loss in weight on your chest catches your attention. It would seem that your [pc.fullChest] " + (!pc.hasBreasts() ? "has returned back to its" : "have returned back to their") + " normal size and stature. Your " + (!pc.hasBreasts() ? "sensitive chest is" : "supple mounds are") + " a little tender to the touch, leading you to believe that your Mimbrane was able to split off its offspring while you were asleep.");
		}

		mimbraneReproduce("Mimbrane Boobs");
	}

	if ((pc.hasStatusEffect("Mimbrane Hand Left") && pc.statusEffectv3("Mimbrane Hand Left") >= 15) || (pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv3("Mimbrane Hand Right") >= 15))
	{
		outputDone = true;

		// The first hand reproduction cycle triggered will syncronize both hands from there on out
		trustedRepro = false;
		if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.statusEffectv1("Mimbrane Hand Left") >= 2) trustedRepro = true;
		if (pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv1("Mimbrane Hand Right") >= 2) trustedRepro = true;

		if (!mimNoticed && trustedRepro && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Noticed Mimbrane Hand Reproduction!");

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();
				author("Kirbu");
				var bothHands:Boolean = false;
				if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right")) bothHands = true;

				output("Your eyelids very slowly rise, allowing what little light there is to rush into your dilating pupils. Something’s clocked you right into consciousness. Laying still for a few minutes doesn’t do much for you, so you sit on the edge of your bed and cradle your head in your hand");
				if (bothHands) output("s");
				output(". Maybe you just need to get up and move around a bit or something. That’s when you feel it: your fingers are twitching and trembling. You pull your hand");
				if (bothHands) output("s");
				output(" back away from your face and notice");
				if (bothHands) output(" trails");
				else output(" a trail");
				output(" of liquid hanging from your cheek");
				if (bothHands) output("s");
				output(" to your palm");
				if (bothHands) output("s");
				output(". Seems your Mimbrane");
				if (bothHands) output("s are");
				else output(" is");
				output(" having some sort of complication.");
				output("\n\nStaring at your somewhat bloated hand");
				if (bothHands) output("s");
				output(", it’s plainly obvious that the parasite");
				if (bothHands) output("s are");
				else output(" is");
				output(" ready to multiply. At least, that’s what you hope is going on. Now would be a very poor time to find out whether or not Mimbranes can get sick. In your experience, the parasites are typically known to wait until the dead of night when a host is out like a light to split off their offspring.");
				if (bothHands) output(" These Mimbranes");
				else output(" This Mimbrane");
				output(" must not mind too much if you catch");
				if (bothHands) output(" them");
				else output(" it");
				output(" in the act, though. Or");
				if (bothHands) output(" they");
				else output(" it");
				output(" just clumsily woke you up.");
				output("\n\nYour hand");
				if (bothHands) output("s go");
				else output(" goes");
				output(" numb and become");
				if (!bothHands) output("s");
				output(" harder to move. Little parasite eyes blank out next, creeping you out with");
				if (!bothHands) output(" a dead empty stare");
				else output(" dead empty stares");
				output(". You’re tempted to ball up your");
				if (!bothHands) output(" hand into a fist");
				else output(" hands into fists");
				output(" just to see what would happen, but think better of it. The numbing would make it incredibly awkward. You just remain the curious observer, hopeful that things go well.");
				output("\n\nYou can feel your fingers peeling off of the now-extra flesh, [pc.skin] pulling away in a manner you could never achieve. Each digit shuffles and moves independently, but never too much. The procedure must be on a smaller scale than you had figured. Soon, cool air skates across your wrist");
				if (bothHands) output("s");
				output(" and onto tender skin.");
				if (!bothHands) output(" An edge has");
				else output(" Edges have");
				output(" started to appear. It begins to feel as if you’re wearing");
				if (!bothHands) output(" a skin-tight glove");
				else output(" skin-tight gloves");
				output(" now.");
				output("\n\n");
				if (!bothHands) output("This glove is");
				else output(" These gloves are");
				output(" itching to come off. Some liquid trails down your arm from underneath the faux skin. Judging by the smell and appearance, it seems to be Mimbrane sweat. As more space opens up, you realize that your");
				if (!bothHands) output(" hand is");
				else output(" hands are");
				output(" drenched in the stuff. The Mimbrane");
				if (bothHands) output("s");
				output(" must be using it as lubricant. Luckily it doesn’t seem to be very concentrated, judging by your lack of any new sexual desires.");
				output("\n\nOut of the clear blue your");
				if (!bothHands) output(" hand lurches");
				else output(" hands lurch");
				output(" forward, drooping towards the ground. The sudden action in the dead of night is frightening, but you’re more worried about anyone catching you with a visibly limp wrist. Thankfully, you aren’t stuck like this long. The " + pc.skinFurScales(false, true, true));
				if (!bothHands) output(" mitt slides");
				else output(" mitts slide");
				output(" off your hand");
				if (bothHands) output("s");
				output(", landing on the floor with a moist thud. What’s left on you");
				if (!bothHands) output(" is a");
				else output(" are some");
				output(" rather slim and sensitive hand");
				if (bothHands) output("s");
				output(", still particularly drenched in Mimbrane fluid. You peer back down to the ground, expecting to see a monster movie-style disembodied hand crawl away on fingers or something.");
				output("\n\nWhat actually happens is a tad less impressive. The back");
				if (bothHands) output("s");
				output(" of the hollow, flattened hand");
				if (bothHands) output("s");
				output(" start");
				if (bothHands) output("s");
				output(" to split open, revealing smooth, pink Mimbrane underside");
				if (bothHands) output("s");
				output(". The once inert visage");
				if (bothHands) output("s");
				output(" of the palm-based eyes find life once more, staring frantically around the room. The Mimbrane");
				if (bothHands) output("s");
				output(" are kept from panicking when");
				if (!bothHands) output(" its");
				else output(" their");
				output(" still-attached");
				if (!bothHands) output(" parent puts it");
				else output(" parents put them");
				output(" at ease with soft squeaks and chirps.");
				output("\n\nYou’re still trying to process the bizarre sight of");
				if (!bothHands) output(" a");
				output(" split-open hand... glove...");
				if (bothHands) output(" <i>thing</i>.");
				else output(" <i>things</i>.");
				output(" It never really fully connects for you before the");
				if (!bothHands) output(" parasite hobbles");
				else output(" parasites hobble");
				output(" away into the darkness, not even remotely resembling the typically square Mimbrane shape. The creature");
				if (bothHands) output("s");
				output(" must have sought out some seclusion before");
				if (!bothHands) output(" it");
				else output(" they");
				output(" could begin to attempt to shed the remains of your likeness.");
				output("\n\nOnly awkward silence sits with you now. Your Mimbrane");
				if (!bothHands) output(" is");
				else output("s are");
				output(" fast asleep and drying rapidly. Perhaps it’d be best to just go back to sleep yourself....");
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});

			if (flags["MIMBRANE_HAND_REPRODUCTION_NOTICED"] == undefined) flags["MIMBRANE_HAND_REPRODUCTION_NOTICED"] = 1;
			else flags["MIMBRANE_HAND_REPRODUCTION_NOTICED"]++;
			mimNoticed = true;
		}
		else
		{
			if (mimbraneDebug) trace("Unnoticed Mimbrane Hand Reproduction!");

			var bothHands:Boolean = false;
			if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right")) bothHands = true;

			var handMsg:String = "The dulcet tones of an idling spaceship hoist you from your sleep just in time for you to notice something off about your hand";
			if (bothHands) handMsg += "s";
			handMsg += ". Namely,";
			if (!bothHands) handMsg += " it has";
			else handMsg += " they have";
			handMsg += " reduced back to";
			if (!bothHands) handMsg += " its";
			else handMsg += " their";
			handMsg += " normal size. Judging by the slightly raw feeling in your [pc.skin], you imagine that the Mimbrane";
			if (bothHands) handMsg += "s were";
			else handMsg += " was";
			handMsg += " able to split off";
			if (!bothHands) handMsg += " its";
			else handMsg += " their";
			handMsg += " offspring.";

			addMimbraneEvent(handMsg);
		}

		if (pc.hasStatusEffect("Mimbrane Hand Left")) mimbraneReproduce("Mimbrane Hand Left");
		if (pc.hasStatusEffect("Mimbrane Hand Right")) mimbraneReproduce("Mimbrane Hand Right");
	}

	if ((pc.hasStatusEffect("Mimbrane Foot Left") && pc.statusEffectv3("Mimbrane Foot Left") >= 15) || (pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv3("Mimbrane Foot Right") >= 15))
	{
		outputDone = true;

		// The first Foot reproduction cycle triggered will syncronize both feet from there on out
		trustedRepro = false;
		if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.statusEffectv1("Mimbrane Foot Left") >= 2) trustedRepro = true;
		if (pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv1("Mimbrane Foot Right") >= 2) trustedRepro = true;

		if (!mimNoticed && trustedRepro && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Noticed Mimbrane Foot Reproduction!");

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();
				author("Kirbu");
				var bothFeet:Boolean = false;
				if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right")) bothFeet = true;

				output("The ceiling is very good at winning at staring contests. You are merely studying under its keen ways. Sleep has abandoned you and moving about seems fruitless. So, you stare endlessly at nothing. Something dragged you from your comfy dreams, but there’s no telling what–");
				output("\n\nYour");
				if (!bothFeet) output(" [pc.foot] spasms");
				else output(" [pc.feet] spasm");
				output(" suddenly. Your toes clench and stretch. Has some nerve disorder crept within you? Has fucking the galaxy’s many offerings proven to be your undoing? Throwing your covers off rids you of these qualms. It’s merely your Mimbrane");
				if (bothFeet) output("s");
				output(", judging by the strained look in");
				if (!bothFeet) output(" its");
				else output(" their");
				output(" eyes. Your");
				if (!bothFeet) output(" [pc.foot] has");
				else output(" [pc.feet] have");
				output(" been looking pretty swollen lately. It must be time to split off some offspring, you figure. Normally Mimbranes handle this when their hosts are snoozing away, but it would seem yours");
				if (!bothFeet) output(" doesn’t");
				else output(" don’t");
				output(" mind the company.");
				output("\n\n");
				if (!bothFeet) output("It acts");
				else output("They act");
				output(" quickly, beginning with a sudden numbness overtaking your");
				if (!bothFeet) output(" foot");
				else output(" feet");
				output(". You imagine it would be immensely uncomfortable if you were to try and stand right now. Next, the life disappears from the");
				if (!bothFeet) output(" parasite’s");
				else output(" parasites’");
				output(" eyes.");
				if (!bothFeet) output(" It");
				else output(" They");
				output(" must be separating its consciousness from the now-surplus skin. It’s hard to imagine what that must be like.");
				output("\n\nThe process continues as tiny peeling sensations blossom up all around your");
				if (!bothFeet) output(" foot");
				else output(" feet");
				output(". The Mimbrane");
				if (!bothFeet) output(" is");
				else output("s are");
				output(" manipulating your skin on a magnitude much smaller than your joints would account for. It’s as if multitudes of tiny strips of tape were all being peeled away.");
				output("\n\nAir smacking against your ankle");
				if (bothFeet) output("s");
				output(" lets you know the");
				if (!bothFeet) output(" parasite has");
				else output(" parasites have");
				output(" worked");
				if (!bothFeet) output(" its way to its edge");
				else output(" their way to their edge");
				output(". Not only that, but you’re also made aware how wet your");
				if (!bothFeet) output(" foot is");
				else output(" feet are");
				output(". Judging from the slight sense of strawberries and the hint of a tingle, you guess it must be Mimbrane sweat. The parasite");
				if (bothFeet) output("s");
				output(" must be using it as a lubricant. It only takes a few more minutes of peeling, wiggling, sliding and contracting until you seemingly have a");
				if (bothFeet) output(" pair of");
				output(" [pc.skinTone] socks....");
				output("\n\nYour");
				if (!bothFeet) output(" [pc.foot] flicks");
				else output(" [pc.feet] flick");
				output(" forward involuntarily, working to slide the new Mimbrane");
				if (bothFeet) output("s"); 
				output(" off");
				if (!bothFeet) output(" it");
				else output(" them");
				output(". It works, and the hollow, bloated");
				if (!bothFeet) output(" casting of your foot falls");
				else output(" castings of your feet fall");
				output(" to the ground, Mimbrane slime oozing out the top");
				if (bothFeet) output("s");
				output(". You scoot forward to get a good look, seeing just what you’d expect:");
				if (!bothFeet) output(" a sock that used to resemble your foot");
				else output(" socks that used to resemble your feet");
				output(". Maybe");
				if (!bothFeet) output(" it’ll");
				else output(" they’ll");
				output(" start walking off on its own or something.");
				output("\n\nIt’s much less satisfying – but no less strange – when the castoff skin");
				if (bothFeet) output("s");
				output(" begin");
				if (!bothFeet) output("s");
				output(" to peel down the back and along the underside, revealing to you that the underside of a Mimbrane lies beneath what still visibly looks like your [pc.skin]. You figured");
				if (!bothFeet) output(" it’d");
				else output(" they’d");
				output(" compress rather than split, honestly. Just as");
				if (!bothFeet) output(" it’s");
				else output(" their");
				output(" eyes start to show a re-found sense of life, your Mimbrane");
				if (bothFeet) output("s");
				output(" chirp and squeak at");
				if (!bothFeet) output(" its");
				else output(" their");
				output(" children.");
				output("\n\nThe new");
				if (!bothFeet) output(" Mimbrane stares");
				else output(" Mimbranes stare");
				output(" up at you for a moment, wiggling");
				if (!bothFeet) output(" its");
				else output(" their");
				output(" hollow toes. Then");
				if (!bothFeet) output(" it takes");
				output(" they take");
				output(" off into the darkness, escaping to some forgotten corner of your ship to complete transformation. You’re left trying to think about what just took place and hope no one falls across some bizarre amalgamation of foot and Mimbrane.");
				if (!bothFeet) output(" It");
				else output(" They");
				output(" should be able to escape without garnering any attention, you figure.");
				output("\n\nBest to just get back to sleep than dwell on it any further.");
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});

			if (flags["MIMBRANE_FOOT_REPRODUCTION_NOTICED"] == undefined) flags["MIMBRANE_FOOT_REPRODUCTION_NOTICED"] = 1;
			else flags["MIMBRANE_FOOT_REPRODUCTION_NOTICED"]++;
			mimNoticed = true;
		}
		else
		{
			if (mimbraneDebug) trace("Unnoticed Mimbrane Foot Reproduction!");

			var bothFeet:Boolean = false;
			if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right")) bothFeet = true;

			var footMsg:String = "Slowly crawling back to the land of the conscious, a different feeling radiates from your";
			if (!bothFeet) footMsg += " [pc.foot]. It appears";
			else footMsg += " [pc.feet]. They appear";
			footMsg += " to have returned to";
			if (!bothFeet) footMsg += " its";
			else footMsg += " their";
			footMsg += " normal size. Based on the tender feeling you get while rubbing your toes, it’s safe to assume that your Mimbrane";
			if (bothFeet) footMsg += "s were";
			else footMsg += " was";
			footMsg += " able to split off";
			if (!bothFeet) footMsg += " its";
			else footMsg += " their";
			footMsg += " offspring.";

			addMimbraneEvent(footMsg);
		}

		if (pc.hasStatusEffect("Mimbrane Foot Left")) mimbraneReproduce("Mimbrane Foot Left");
		if (pc.hasStatusEffect("Mimbrane Foot Right")) mimbraneReproduce("Mimbrane Foot Right");
	}

	if (pc.hasStatusEffect("Mimbrane Face") && pc.statusEffectv3("Mimbrane Face") >= 15)
	{
		outputDone = true;

		if (!mimNoticed && rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Special Event Mimbrane Face Reproduction!");

			// Head mimbranes should always be >= 2 trust
			if (flags["MIMBRANE_FACE_REPRODUCTION_NOTICED"] == undefined)
			{
				flags["MIMBRANE_FACE_REPRODUCTION_NOTICED"] = 1;
				eventQueue.push(mimbraneFaceReproduction);
			}
			else
			{
				eventQueue.push(function():void {
					clearOutput();
					author("Kirbu");
					flags["MIMBRANE_FACE_REPRODUCTION_NOTICED"]++;

					output("Something’s escorted you away from blissful slumber. Your ship is as silent as always, never the cheeriest of greeters. Dazed eyes peer around the room, curious to find anything out of the ordinary. They find nothing. Did you just wake up for no reason?");

					clearMenu();
					addButton(0, "Next", mimbraneFaceReproductionGo);
				});
			}
			mimNoticed = true;
		}
		else
		{
			if (mimbraneDebug) trace("Generic Mimbrane Face Reproduction!");

			outputDone = true;

			addMimbraneEvent("Upon stretching off the last vestiges of sleep, you notice something feels off about your [pc.face]. It would appear that your [pc.lips] have shrunk down to their normal size. In fact, your entire head feels a little raw and fresh, for lack of a more appropriate description. Somehow, your head-mounted Mimbrane managed to reproduce while you were knocked out.");
		}

		mimbraneReproduce("Mimbrane Face");
	}

	//Breathing Mimbranes
	//These scenes can only occur when the PC is waking from sleep. They apply only to Mimbranes with a trust level anywhere from 0 to 2. These have a very low frequency.
	if (!outputDone && pc.hasStatusEffect("Mimbrane Cock") && pc.statusEffectv1("Mimbrane Cock") <= 2)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Cock Wake Event Called");

			outputDone = true;

			addMimbraneEvent("An odd sensation on your [pc.cockhead] drags you out of the haze of sleep you were only slowly stepping out from. For a moment, you thought you caught your urethra widening on its own before returning to normal. You instead figure you just need to get moving around or something.");
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Pussy") && pc.statusEffectv1("Mimbrane Pussy") <= 2)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Pussy Wake Event Called");

			outputDone = true;

			addMimbraneEvent("The experience of your [pc.vagina] opening and closing on its own bursts you out from sleep. You could have sworn you felt a faint movement of air around your orifice. However, you find nothing unusual upon inspection.");
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Ass") && pc.statusEffectv1("Mimbrane Ass") <= 2)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Ass Wake Event Called");

			outputDone = true;

			addMimbraneEvent("A sudden, brief dilation of your [pc.asshole] forces you to bolt up out of tender slumber. You grope around to try and find anything to explain what happened, but find nothing. Must have been an odd dream or something.");
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Balls") && pc.statusEffectv1("Mimbrane Balls") <= 2)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Balls Wake Event Called");

			outputDone = true;

			addMimbraneEvent("When an odd feeling of air moving around and possibly into your [pc.balls] hits you, sleep gets thrown out immediately. You find nothing of note upon inspection, however. You decide to ignore the potential sleep-induced hallucination.");
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Boobs") && pc.statusEffectv1("Mimbrane Boobs") <= 2)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Boobs Wake Event Called");

			outputDone = true;

			addMimbraneEvent("Your [pc.nipples] feel as if they were expanding slightly, pushing a slight bit of air within them. The faint sensation is enough to kick you from the lingering bits of sleep you were enjoying to examine them. You find nothing out of the ordinary.");
		}
	}

	if ((!outputDone && pc.hasStatusEffect("Mimbrane Hand Left") && !pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv1("Mimbrane Hand Left") <= 2)
		|| (!outputDone && !pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv1("Mimbrane Hand Right") <= 2))
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Hand Wake Event Called");

			outputDone = true;

			addMimbraneEvent("Air seems to inexplicably move in and around the palm of your hand, shocking you out of your half-awake state. Upon inspection, however, you come across nothing strange.");
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv1("Mimbrane Hand Left") <= 2)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Hands Wake Event Called");

			outputDone = true;

			addMimbraneEvent("Your hands feel as if they were drawing in a little bit of air, a feeling strange enough to hurl you out into full consciousness. They both feel and look fine, however. You chalk it up to your waking mind or something.");
		}
	}

	if ((!outputDone && pc.hasStatusEffect("Mimbrane Foot Left") && !pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv1("Mimbrane Foot Left") <= 2)
		|| (!outputDone && !pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv1("Mimbrane Foot Right") <= 2))
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Foot Wake Event Called");

			outputDone = true;

			addMimbraneEvent("Some air tickles your toes and seems to seep into your foot right below them. The feeling is strange enough that you tumble down from sleep’s embrace to find the culprit. But you leave empty-handed, unable to find anything but your [pc.foot].");
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv1("Mimbrane Foot Left") <= 2)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Feet Wake Event Called");

			outputDone = true;

			addMimbraneEvent("Air brushes past your toes and over both of your [pc.feet], batting you out of the park and into consciousness. You can’t help but try and find what is going on, but there’s nothing to be found. You figure your sheets must have tickled your feet or something.");
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Face") && pc.statusEffectv1("Mimbrane Face") <= 2)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Face Wake Event Called");

			outputDone = true;

			addMimbraneEvent("An otherwise normal morning of sleeping in runs into a complication. It seems as if air were seeping into your [pc.lips] of all places just as you were taking a breath! However, no amount of pawing and pulling at your mouth cushions reveals a damn thing. You figure it’s just time to wake up.");
		}
	}
	
	mimbraneEventHeaderDone = false;
}

public function mimbraneGainSymbiosis(response:String = "intro"):void
{
	clearOutput();
	author("Jacques00");
	clearMenu();
	
	switch(response)
	{
		case "intro":
			output("Suddenly, your lust skyrockets.");
			if(pc.hasGenitals())
			{
				if(pc.hasStatusEffect("Genital Slit")) output(" Your gential slit parts as");
				else output(" Your loins light up as");
				if(pc.hasCock()) output(" [pc.eachCock] stiffens");
				if(pc.isHerm()) output(" and");
				if(pc.hasVagina()) output(" [pc.eachVagina] swells");
				output(".");
			}
			else output(" Your [pc.asshole] swells and flexes with need.");
			output(" Are... are they trying to get you off?");
			output("\n\nYour hands automatically float to your most sensitive spots and begin coaxing you into peak arousal... Clearly this is a test of some kind. You could accept the urge to cum and let the Mimbranes do what they will to sate your ever-building lust, or you could try to refuse and bare the consequences of holding it in...");
			output("\n\nWhat will you choose to do?");
			
			pc.maxOutLust();
			
			addButton(0, "Accept", mimbraneGainSymbiosis, "yes", "Accept Urges", "Give in to the power of your Mimbranes.");
			if(pc.WQ() >= 75) addButton(1, "Refuse", mimbraneGainSymbiosis, "nah", "Refuse Urges", "Actively resist the urge to give in.");
			else addDisabledButton(1, "Refuse", "Refuse Urges", "You don’t have enough willpower to resist!");
			break;
		case "yes":
			output("You allow the pink strawberry fog to consume you. The pressure of the oncoming orgasm causes you to bite your lower lip and moan before you prepare to open the flood gates. Then, relinquishing a bit of your willpower, you let go...");
			
			// Shed all valid mimbranes
			var mimRep:int = 0;
			if(pc.statusEffectv3("Mimbrane Cock") >= 15) { mimbraneReproduce("Mimbrane Cock"); mimRep++; }
			if(pc.statusEffectv3("Mimbrane Balls") >= 15) { mimbraneReproduce("Mimbrane Balls"); mimRep++; }
			if(pc.statusEffectv3("Mimbrane Pussy") >= 15) { mimbraneReproduce("Mimbrane Pussy"); mimRep++; }
			if(pc.statusEffectv3("Mimbrane Ass") >= 15) { mimbraneReproduce("Mimbrane Ass"); mimRep++; }
			if(pc.statusEffectv3("Mimbrane Hand Left") >= 15) { mimbraneReproduce("Mimbrane Hand Left"); mimRep++; }
			if(pc.statusEffectv3("Mimbrane Hand Right") >= 15) { mimbraneReproduce("Mimbrane Hand Right"); mimRep++; }
			if(pc.statusEffectv3("Mimbrane Foot Left") >= 15) { mimbraneReproduce("Mimbrane Foot Left"); mimRep++; }
			if(pc.statusEffectv3("Mimbrane Foot Right") >= 15) { mimbraneReproduce("Mimbrane Foot Right"); mimRep++; }
			if(pc.statusEffectv3("Mimbrane Face") >= 15) { mimbraneReproduce("Mimbrane Face"); mimRep++; }
			
			output("\n\nYou cum, and cum, and cum.... As " + (mimRep == 1 ? "a" : "each") + " reproduced Mimbrane sheds from you, a sigh of blissful relief runs across your lips.");
			output("\n\nThe post-climax sets in and the squeaks and chirps gradually soften until all that’s left for you to hear is the sound of you exhaling. Wiping your brow with a free hand, you can’t tell if the wetness is the sweat from your body or the perspiration from the Mimbranes.");
			output("\n\nWhen your heavy breathing dies down, so do your swelling Mimbranes; calm and barely agitated. It seems they are pleased with your subservience. Hopefully you won’t have to go through that ordeal again, at least for a while...");
			
			pc.willpower(-1);
			pc.orgasm();
			pc.orgasm();
			pc.orgasm();
			// Disable new message for 3 days.
			pc.createStatusEffect("Disable Mimbrane Symbiosis", 0, 0, 0, 0, true, "", "", false, (3 * 24 * 60));
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "nah":
			output("You suck in a deep breath and mentally build your confidence. Your hands try to roam to your sensitive bits, but you refuse to allow them to move and just set them still. The Mimbranes will not give up; they try and try again to force you to satisfy yourself but you continue to fight the urges, despite inhaling all the pink, lust-inducing mist the Mimbranes have produced to inebriate you.");
			output("\n\nSuddenly, you have an idea. If you can’t make the Mimbranes physically stop their urges, you can at least convince the demanding parasites that you don’t need to satisfy yourself at the moment. So you close your eyes and" + (pc.isBimbo() ? ", like, try your best to concentrate and stuff" : " try to concentrate") + "...");
			output("\n\n<i>");
			if(pc.isBimbo()) output("Hey, I know I like to cum and all, but don’t force it--it’s no fun that way! </i>Hm... or is it?<i> Anyway, if you keep acting like little brats, I don’t think we should be friends anymore!");
			else if(pc.isNice()) output("Please don’t be upset, little ones. You’ll have your fill when the time comes--just don’t be so impatient or I’ll have to take some drastic measures... and I don’t think it’ll be the kind you’ll like!");
			else output("Alright, stop being a pain in the ass, you living paper sticky notes. If you’re gonna keep waking me up like this, I’ll bring out the torch and show you who’s boss! I mean it!");
			output("</i>");
			output("\n\nThe squeaks stop instantly. Did... did that actually work?");
			output("\n\nYou’re not sure if it’s a mental connection or a total dependence on your well-being, but their symbiotic bond with you is so strong that the Mimbranes seem to genuinely believe you. What do you know - trust prevails after all! Well, while this won’t guarantee that you can get off scot-free when they get cranky, at least they’ll respect your free will a little more than they did previously.");
			
			output("\n\n(<b>Perk Gained: Mimbrane Symbiosis</b> - Due to your body’s adaptation to the Mimbranes attached to you, they will no longer drain your willpower after each feeding.)");
			pc.createPerk("Mimbrane Symbiosis", 0, 0, 0, 0, "Attached Mimbranes will no longer drain your willpower when feeding.");
			
			pc.maxOutLust();
			
			addButton(0, "Next", mainGameMenu);
			if(pc.lust() >= 33)
			{
				output("\n\nYou could probably do something about that lust buildup too...");
				masturbateButton(1, false, true);
			}
			break;
	}
}

public function mimbraneFaceReproduction():void
{
	clearOutput();
	author("Kirbu");

	output("“Anything you want want before I head out for the night?” Victor asks. You stare around the room blankly, trying to think if you left anything out. Nothing comes to mind, and you tell him as much. Your father gives you a slight little wave and heads out the door.");
	output("\n\nWait! An ice cream cone would be great! You jump over the coffee table and barrel down towards the door to catch him before he’s gone. Inky blackness is all that greets you. Which way did he go? You squint and strain, but can’t make out any details. Nothing’s clear. Nothing doing but to go back inside.");
	output("\n\nAs you close the door behind you, something starts to seem off. It’s hard to focus on anything around you. Some instinct in the back of your head tells you to look at your hand and try to count your fingers.");
	output("\n\nYou can’t. Nothing looks wrong, but you just can’t. You have an idea of what’s going on. Next you poke your index finger against the palm of your hand, pushing hard. It pokes out the other side of your hand with ease.");
	output("\n\nYou’re dreaming. Those lucid dreaming techniques you read on the extranet paid off! But now everything’s getting even more unstable, like you’re being sucked out! What was it they said to do... oh! Rub your hands together and try spinning in place!");
	output("\n\nYou’re back in your quarters now instead of the listless room of before, back to your normal self. Looks like it worked! There’s a higher sense of clarity to your surroundings now. Looking around the room, you realize you’ve started flying without even thinking about it. It is the most common dream sensation, after all. Try not to get too excited, you remind yourself. If you want to make the most of this little head vacation, you’ll have to get ensconced in some little activity.");
	output("\n\nBut what first?");

	//[Talk to subconscious] [Orgy] [Find Follower] [Find Victor] [Fly in Space]
	clearMenu();
	addButton(0, "Talk to Subc.", mimbraneFaceReproductionGo, true, "Talk to your subconscious", "Talk to your subconscious mind.");
	addButton(1, "Orgy", mimbraneFaceReproductionGo, true);
	addButton(2, "Find Follower", mimbraneFaceReproductionGo, true);
	addButton(3, "Find Victor", mimbraneFaceReproductionGo, true);
	addButton(4, "Fly in Space", mimbraneFaceReproductionGo, true);
}

public function mimbraneFaceReproductionGo(dream:Boolean = false):void
{
	clearOutput();
	author("Kirbu");

	if (dream)
	{
		output("You’re awake! How?! Why? You did everything you’re supposed to, right? What went wrong?");
		output("\n\n");
	}

	output("All concerns vanish from your head when your [pc.lips] suddenly tremble and constrict! Hell, your whole head feels as if it were trying to rip itself apart, and not in that cute little headache way. You can actually feel the [pc.skin] on your skull tensing and shifting ever so slightly, like an eyelid twitch pushed to an obscene level. There’s little doubt in your mind as to the reason for this uncomfortable phenomenon: Mimbrane.");
	output("\n\nMore specifically Mimbrane reproduction. You’ve been feeling a little fat-headed lately, and it doesn’t have anything to do with your intelligence. Someone could rent your lips out as a bounce house, and your [pc.face] feels a little puffy even if it doesn’t look it. You know from your codex that the parasite prefers to wait until their host is in slumber’s embrace before attempting to multiply. Your head-mounted friend already seemed pretty cool with you from the get-go; it must not mind if you wake up to watch it make some children.");
	output("\n\nYour instincts are to paw at your face, hands desperate to get a grip on the writhing flesh around your head. It takes a lot of willpower to merely keep still, controlling your breathing through your nose with your mouth acting as if it were in great pain. The Mimbrane’s little squeaks and chirps through your bimbo-esque lips are audible enough as it is. One feature you can’t see is the sudden dead-eye glare in the parasite’s miniscule eyes.");
	output("\n\nIt’s only a sign for what’s to come. A numbness shrouds your head. You can’t decide if it feels like you’re wearing a mask or went through a really lousy trip to the dentist. All that’s certain is that it’s uncomfortable. But you maintain your calm. Freaking out or getting upset won’t get you anywhere, you remind yourself. It’ll only make things worse. And making things worse is stupidly easy when you can’t feel a thing.");
	output("\n\nThe Mimbrane goes to work underneath the [pc.skin] of your head. Now it definitely feels like you just have excess weight over your noggin. You can make out your [pc.face] wriggling free, peeling away from its outer shell. Individual strands of hair are imbued with life and push against their thin coating. Though you’re fully aware an organism is posing as the skin to your head, you’ve never really been reminded of the fact quite like you are right now. Down to every cell is some manner of self-locomotion that you could never hope to naturally achieve.");
	output("\n\nEverything feels heavy. Even your eyelids feel like something’s sitting on them. Your mouth especially feels pinned down by the [pc.lips] atop it. Maintaining a relaxed composure is odd at the very least. You’re used to <i>one</i> sort of facial, but not this. There’s no rhyme or reason as to what parts of your new face smoothly separates from your old one. Your scalp pulls away, cheeks follow, ears bend and flex, nose twitches, lids constrict");
	if (pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output(", muzzle shifts");
	output("... it’s a neverending stream of simply bizarre facial movements and sensations.");
	output("\n\nThe experience culminates when air runs up along your neck and underneath your [pc.face]. It’s incredibly cool, or rather your new skin is incredibly tender. Not only that, but you hadn’t realized how wet it was. As the crease expands, you notice trickles of liquid skipping down your neck. The faint scent reveals the substance’s identity: it’s Mimbrane sweat. The oily, strawberry-scented fluid must be the key ingredient from keeping this molting from turning into a horror show.");
	output("\n\nBefore long, your head’s new outer shell is completely loose, draped awkwardly in places. It’s actually quite interesting: you can feel where the Mimbrane stores most of its nutrition. Fleshy bits like your ears and especially your lips are obvious, and thin parts like your forehead and scalp are equally lean. The parasite moves your [pc.skin] in a wave-like motion, attempting to push the remains of your former head-covering up and off your head. This is as good as any time to intervene, you figure, as the creature seems to be having a little trouble. It also feels really weird.");
	output("\n\nYou calmly sit up and pull the faux head off, much to the Mimbrane’s surprise. It chirps softly, but you quiet it with a gentle reassurance. It glides off easily, revealing the moist, matted mess your head is now. The hollow shell collapses in your grasp, an odd sight to see when the rest of the mask looks exactly like your head. Well, if you ignore that this thing is dry and still sports [pc.lips] that put your now-slimmer ones to shame.");
	output("\n\nLooking through the empty sockets where your eyes once were, you can see the inside of the skin is normal Mimbrane. That smooth, pink barely textured surface couldn’t be mistaken for much else. There’s a slight hint of macabre humor in your head handling this perfect replica of your pate. You could hang them up around your room, telling the tale of how you beheaded and flayed an evil army of " + pc.short + "-clones that threatened you, making a clear message for any stragglers.");
	output("\n\nSadly, your empty boasting flutters away when the bloated lips shuffle around and the dead glaze of a gaze springs to life. You had secretly hoped that this new Mimbrane would use your former head much in the same manner as you did, just so things would be extra weird. But instead it flops awkwardly out of your hands to try and scamper off your bed. Its parent chirps at it before it gets too far along, calming the oddity down before things get too out of hand.");
	output("\n\nThe back of the fleshy mask cleanly splits, getting the Mimbrane one tiny step closer to the flat, square appearance it wants to achieve. You can only watch in awe at the thing, your split-open chubby mirror self reminding you of some popular horror vids. You hope to some deity that this thing doesn’t cross paths with another soul before it can completely cast off any semblance of your appearance. It disappears into the darkness of your ship after trading unintelligible pleasantries with your head-mounted parasite.");
	output("\n\nYour Mimbrane calms down and apparently goes to sleep, leaving you alone once again. You run a hand through your [pc.hair], finding it surprisingly dry compared to just a few moments earlier. Indeed, your entire head is closer to its normal moisture. Though it is still feeling mighty sensitive. That feeling, that notion that you are merely rubbing some manner of critter wrapped around your head only resides in your mind again. Your senses tell you everything’s normal again.");
	output("\n\nNormal. That’s a word you’d rather forget. You go to sleep, anxious to redefine “normal” for another day.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Friendly Mimbranes
//These scenes can occur during any transitions. They apply only to Mimbranes with a trust level of 3 or 4. They have a low frequency and only one can occur at any given time.
public function friendlyMimbraneEvents():void
{
	var outputDone:Boolean = false;
	var mimFreq:int = 5;

	if (pc.hasStatusEffect("Mimbrane Cock") && pc.statusEffectv1("Mimbrane Cock") >= 3)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Cock Friendly Event");

			outputDone = true;

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();
				var messageArray:Array = []; // [] is an array literal for "blank"/empty
				var msg:String;

				msg = "A bizarre stirring in your [pc.lowerGarment] catches your attention. Your [pc.cock] is attempting to poke out into the open air, pushed along by a particularly curious Mimbrane.";
				if (pc.isNice()) msg += " It’s a little embarrassing, but no one seems to notice. You politely ask the parasite to stow back away, to which it cheerily chirps its compliance.";
				else if (pc.isMischievous()) msg += " It’s actually quite amusing seeing your trouser snake soaking in the scenery. You let it bob around freely for a while before it eventually returns to its lair.";
				else msg += " You huff angrily, grabbing the cock and shoving it back into your clothes. You don’t have the patience for such irritations.";

				messageArray.push(msg);

				if (pc.biggestCockLength() > 30 && pc.lust() >= 50 && pc.biggestTitSize() > 1)
				{
					messageArray.push("Your [pc.cock] begins to slide up within your armor, making it hard to focus. This is no normal erection that’s escaping from your [pc.lowerGarment], this is your Mimbrane’s doing. It squeezes your enormous pole comfortably between your [pc.breasts], oh-so-slowly pumping it vertically. You’re unsure if you want it to stop or not.");
				}

				if (pc.lust() < 40)
				{
					messageArray.push("It’s a tad hard to concentrate as your [pc.cock] takes advantage of its rather flaccid state to continuously shuffle around in your [pc.armor]. The Mimbrane seems unable to sit still today, sliding and prodding at everything in your penis’ radius.");
				}

				messageArray.push("Your Mimbrane member occasionally works its way down your [pc.leg] like a lewd snake.");
				messageArray.push("Your [pc.cock] slowly rubs lewdly against your [pc.skin] and clothes. The Mimbrane seems to be teasing your cock.");

				output(messageArray[rand(messageArray.length)]);
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Pussy") && pc.statusEffectv1("Mimbrane Pussy") >= 3)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Pussy Friendly Event");

			outputDone = true;

			var msgArray:Array = [];
			var msg:String = "Your actions are cut short by what vaguely sounds like some whistling coming from your crotch. It’s your [pc.pussy], actually; your Mimbrane has gone beyond its little chirps and squeaks and seems to be trying out something more musical.";
			if (pc.isNice()) msg += " You believe a symphonic snatch, while interesting, may attract unwanted attention and ask the parasite to stop. It does with a particularly disappointed chirp.";
			else if (pc.isMischievous()) msg += "You recall seeing some vid or something that featured a woman with a singing snatch. Yours barely resembles a songbird. It’ll need some training.";
			else msg += "You squeeze your thighs together in an attempt to get the parasite to stop. Following with a quick, harsh scold, silence and stillness resumes reign over your genitalia.";

			msgArray.push(msg);

			if (pc.wetness() > 3)
			{
				msgArray.push("Your Mimbrane seems to be having fun with your [pc.pussy] and its veritable river of feminine fluids. One moment the parasite seems to be blowing bubbles, the next it’s starting and stopping the works, and the next it’s merely producing moist chirps.");
			}

			msgArray.push("Your [pc.pussy] nips at your [pc.armor], throwing you for a surprise. The Mimbrane must be feeling playful you imagine.");
			if (pc.hasClit())
			{
				msgArray.push("Your [pc.legOrLegs] about melt to jello all of a sudden. Your Mimbrane is messing with your [pc.clit], moving the little fun button around in provocative ways beneath your [pc.armor].");
			}
			msgArray.push("A sudden pressure against your [pc.pussy] about knocks you over. You know there’s nothing there.... Is your Mimbrane just messing around with you?");

			addMimbraneEvent(messageArray[rand(messageArray.length)]);
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Ass") && pc.statusEffectv1("Mimbrane Ass") >= 3)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Ass Friendly Event");

			outputDone = true;
			
			var messageArray:Array = [];

			msg = "Your eyes go wide when a noisy sound stumbles out from your [pc.ass]. Luckily, it appears you garnered no unwanted attention. It would seem your enthusiastic Mimbrane has taken to playing practical jokes on you, using its unique control of your posterior to produce faux fart sounds.";
			if (pc.isNice()) msg +=" You politely ask that the parasite at least not be too loud. There’s no harm in fun, but there’s certainly harm to be had from certain sources should the racket get out of hand.";
			else if (pc.isMischievous()) msg += "Funny enough, you begin to cook up some creative outlets for the Mimbrane’s newfound antics. Why only embarrass yourself when it’s so much easier to embarrass others?";
			else msg += "Confident no one of any importance is looking, you grab your cheeks and stop the parasite’s raspberries. You make it clear to the creature that you will have no part in its stupid circus act.";

			messageArray.push(msg);

			if (pc.ass.looseness() > 3)
			{
				messageArray.push("It’s hard to go about your day when your [pc.asshole] pulsates between a gaping cavern and a tight pin hole. Your butt-bound Mimbrane seems to be enjoying your flexible lower chute.");
			}

			messageArray.push("Each step you take is exaggerated by a rather large swing of your [pc.ass]. It isn’t long before you clearly suspect the rambunctious Mimbrane of the flamboyant disregard for your gait.");
			messageArray.push("Occasionally your [pc.ass] rubs its cheeks together. You derive no pleasure from the motion, but it’s entertainingly weird. The Mimbrane just seems to enjoy manipulating your hind quarters.");

			output(messageArray[rand(messageArray.length)]);
		}
	}
	
	if (!outputDone && pc.hasStatusEffect("Mimbrane Balls") && pc.statusEffectv1("Mimbrane Balls") >= 3)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Balls Friendly Event");

			outputDone = true;

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();

				var messageArray:Array = [];
				var msg:String;

				msg = "You get a little shaky in the [pc.legOrLegs] when your [pc.balls] start to loosen and tighten in succession. The [pc.sack] is acting as if you were cumming. Best you figure, your Mimbrane has formed some sort of attachment to the motion. Understandable considering the state you’re in when it typically happens.";
				if (pc.isNice()) msg += " You decide to carry on and enjoy the pseudo kegel exercise. It’s doing no harm and the parasite doesn’t seem to be pushing out any [pc.cum].";
				else if (pc.isMischievous()) msg += " As the parasite manipulates your balls, you begin to imagine if this ability can be manipulated in the sack. Bending your orgasm to your whims could have its benefits....";
				else msg += " You come to a dead stop, ensuring no one of any importance will care about what you’re about to do, and tell the parasite to cease the annoyance. Your balls pop back to their normal stature, accompanied with what you’re certain is the Mimbrane equivalent of a disappointed huff.";

				messageArray.push(msg);

				messageArray.push("Your [pc.balls] are rubbing tantalizingly against your inner thighs. Your Mimbrane must be enjoying itself.");
				messageArray.push("A trickle of pre runs down your [pc.leg]. Is your Mimbrane screwing around with your [pc.balls]? You wonder.");
				messageArray.push("An unseen hand begins massaging your [pc.balls]. It’s troubling at first and certainly makes it harder to walk, but you find it extremely comfortable. Your Mimbrane seems to enjoy just getting to do it judging by the soft chirps it makes from time to time.");

				output(messageArray[rand(messageArray.length)]);

				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Boobs") && pc.statusEffectv1("Mimbrane Boobs") >= 3)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Boobs Friendly Event");

			outputDone = true;

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();

				var messageArray:Array = [];
				var msg:String;

				msg = "Your balance begins to become an obstacle as your gait resembles more of a stagger. Each step seems to be exaggerated to a rather large degree by your [pc.breasts]. They sway and bounce as if gravity were little more than a dream. Judging by the odd little wiggling of your [pc.nipples], you figure this must be the work of your Mimbrane.";
				if (pc.isNice()) msg += " You ask the parasite to at least knock it down a few notches. The show is probably a fun one, but you would rather not get thrown off stage.";
				else if (pc.isMischievous()) msg += " You continue on with the excessive chest swings and bounces, finding it amusing. Maybe you should try and keep track of the double takes you cause.";
				else msg += " Maybe you should invest in some sort of titanium bra. You grasp the mounds and angrily whisper to them, demanding the parasite knock it off with your knockers.";

				messageArray.push(msg);

				if (pc.hasDickNipples() && pc.lust() >= 50)
				{
					msg = "Your [pc.nipples] suddenly project their inner dicks, creating a";
					if (pc.totalBreasts() == 2) msg += " pair";
					else if (pc.totalBreasts() == 3) msg += " trio";
					else if (pc.totalBreasts() > 3) msg += " multitude";
					msg += " of tents in your [pc.upperUndergarment]. For a moment you try to figure out what could happening, but when the chest-mounted cocks start to squeak and chirp, you know exactly what’s going on."

					messageArray.push(msg);
				}

				messageArray.push("Every so often, your [pc.breasts] will just bounce or shake of their own accord, a clear sign your Mimbrane is just having a good time.");
				messageArray.push("For whatever reason, your [pc.breasts] seem to be particularly perky and light no matter what size they seem to get. Perhaps your Mimbrane is responsible?");

				output(messageArray[rand(messageArray.length)]);

				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});
		}
	}

	if ((!outputDone && pc.hasStatusEffect("Mimbrane Hand Left") && !pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv1("Mimbrane Hand Left") >= 3)
		|| (!outputDone && !pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv1("Mimbrand Hand Right") >= 3))
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Hand Friendly Event");

			outputDone = true;

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();

				var messageArray:Array = [];
				var msg:String;

				messageArray.push("Your Mimbrane-covered hand starts to make groping gesture at nothing in particular. You aren’t entirely sure if it wants to get at some boobs or if you’ve just been making an impression on the parasite. At least it hasn’t started doing a jerk-off motion....");
				messageArray.push("It isn’t doing much of anything, but just the sight of your Mimbrane’s tiny eyes and mouth on your palm is distracting. The parasite looks to be content with itself from what you can tell.");
				messageArray.push("Your fingernails lately have looked particularly pristine as of late despite your lack of high-end maintenance. Is the Mimbrane responsible for your fine manicure?");

				output(messageArray[rand(messageArray.length)]);

				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right") && pc.statusEffectv1("Mimbrane Hand Left") >= 3)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Hands Friendly Event");

			outputDone = true;

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();

				var messageArray:Array = [];
				var msg:String;

				messageArray.push("Your Mimbrane-covered hands start to make groping gestures at nothing in particular. You aren’t entirely sure if they want to get at some boobs or if you’ve just been making an impression on the parasites. At least they haven’t started doing a jerk-off motion....");
				messageArray.push("They aren’t doing much of anything, but just the sight of your Mimbranes’ tiny eyes and mouths on your palms is distracting. The parasites look to be content with themselves from what you can tell.");
				messageArray.push("Your fingernails lately have looked particularly pristine as of late despite your lack of high-end maintenance. Are the Mimbranes responsible for your fine manicure?");

				output(messageArray[rand(messageArray.length)]);

				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});
		}
	}

	if ((!outputDone && pc.hasStatusEffect("Mimbrane Foot Left") && !pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv1("Mimbrane Foot Left") >= 3)
		|| (!outputDone && !pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv1("Mimbrand Foot Right") >= 3))
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Foot Friendly Event");

			outputDone = true;

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();

				var messageArray:Array = [];
				var msg:String;

				messageArray.push("You’re distracted by the odd little movements your Mimbrane-controlled [pc.foot] is making. The parasite occasionally rubs your toes around, either seeming bored or enjoying interacting with its surroundings. You aren’t sure what’s worse.");
				messageArray.push("A squeak escapes your [pc.foot] with each step you take. A noisy Mimbrane appears to be having a goofy time of itself.");
				messageArray.push("You’ve noticed that your toe nails have looked well-manicured for a while lately through no action of your own. Could your Mimbrane be responsible?");

				output(messageArray[rand(messageArray.length)]);

				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right") && pc.statusEffectv1("Mimbrane Foot Left") >= 3)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Feet Friendly Event");

			outputDone = true;

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();

				var messageArray:Array = [];
				var msg:String;

				messageArray.push("You’re distracted by the odd little movements your Mimbrane-controlled [pc.feet] are making. The parasites occasionally rub your toes around, either seeming bored or enjoying interacting with their surroundings. You aren’t sure what’s worse.");
				messageArray.push("Squeaks and chirps escape your [pc.feet] with each step you take. A pair of noisy Mimbranes appear to be having a goofy time of themselves.");
				messageArray.push("You’ve noticed that your toe nails have looked well-manicured for a while lately through no action of your own. Could your Mimbranes be responsible?");

				output(messageArray[rand(messageArray.length)]);

				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});
		}
	}

	if (!outputDone && pc.hasStatusEffect("Mimbrane Face") && pc.statusEffectv1("Mimbrane Face") >= 3)
	{
		if (rand(100) <= mimFreq)
		{
			if (mimbraneDebug) trace("Mimbrane Face Friendly Event");

			outputDone = true;

			eventQueue.push(function():void {
				kGAMECLASS.clearOutput();

				var messageArray:Array = [];
				var msg:String;

				messageArray.push("Your [pc.lips] make kissing motions involuntarily, puckering and wavering at nothing. Thankfully, no one that matters seems to have noticed. You imagine your Mimbrane has taken an interest in you doing it yourself, probably attaching that motion to the passion that normally overtakes you. It’s probably a good idea to later describe to the parasite how meaningless the gesture is when directed at nobody in particular.");
				messageArray.push("While going about your business, you suddenly start feeling your [pc.hair] moving around and changing your haircut. Sadly there’s nothing nearby for you to get a look at what’s going on. Your Mimbrane must be fascinating itself with your hairdo. You ask it to at least put it back the way it found it when it’s done.");
				messageArray.push("Occasionally your [pc.lips] move on their own, mimicking various expressions. You aren’t quite sure why the Mimbrane is doing it, but you just let it have its fun so long as no one is watching.");
				
				msg = "You’ve noticed your [pc.face] has looked particularly clean lately. Is the Mimbrane responsible?";
				if (pc.isMischievous()) msg += " You wonder if there’s a business opportunity to be had here....";

				messageArray.push(msg);

				output(messageArray[rand(messageArray.length)]);

				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			});
		}
	}
}

//Encounter & Combat
//Encounter a Mimbrane (Jungle)
public function encounterMimbrane():void
{
	showMimbrane();
	if (flags["ENCOUNTERED_MIMBRANE"] == undefined)
	{
		flags["ENCOUNTERED_MIMBRANE"] = 1;
		output("\n\nAn otherwise pleasant stroll through the woods is brought to a startling halt when something darts past your head. You glance around frantically in order to identify just what grazed your ear. Your skin begins to tingle as a mesmerizing scent flows in the trail of whatever flew by you. A few quick steps in the opposite direction seems to be your best course of action. Coincidentally, this helps you evade a followup strike by your mystery attacker.");
		output("\n\nWhat appears to be a large, flowing sheet has careened into the ground where you once stood. Speechless awe is the best you can respond as you eye the strange, oily square creature below you. Most of its body can’t possibly be more than half an inch thick! Your codex snaps you back to your senses with a sharp beep.");
		output("\n\n<i>“A Mimbrane has been detected in the immediate vicinity. This is a parasitic species that relies less on physical attacks and more on its aphrodisiac secretions along its epidermis to overpower opponents. Seek medical assistance immediately should you fall to one of these creatures.”</i>");
		output("\n\nThere’s little time for you to consider this information further; the creature’s recovered from its embarrassing fumble. It shakes its body furiously, clearing away the dirt and dust to reveal its smooth, flawless sheen. That’s not all the shake did, you realize as the same mesmerizing aroma ambushes your senses. The parasite chirps angrily at you, ready to fight!");
		CodexManager.unlockEntry("Mimbranes");
	}
	else
	// Repeat encounters
	{
		flags["ENCOUNTERED_MIMBRANE"]++;

		// (PC has no Mimbranes)
		if (attachedMimbranes() == 0)
		{
			output("\n\nA Mimbrane swoops in from above towards you. The moistened, flat parasite flaps and steadies itself in the air, ready to engage!");
		}
		// (PC has Mimbranes) 
		else
		{
			output("\n\nAnother Mimbrane drops in from the sky, startling you from your casual enjoyment of nature. Its memorable odor fills the air as the thin, flat sheet flaps and hovers in the air.");

			//if PC has one Mimbrane
			if (attachedMimbranes() == 1)
			{
				output(" Your preparatory combat stance falters a bit when an unusual sensation radiates from your nether regions. Your");
				if (pc.hasStatusEffect("Mimbrane Cock")) output(" [pc.cock]");
				else if (pc.hasStatusEffect("Mimbrane Pussy")) output(" [pc.pussy]");
				else if (pc.hasStatusEffect("Mimbrane Ass")) output(" [pc.ass]");
				else output("\\\[MIMBRANE DETECTION FAILED\\\]")
				output(" suddenly starts making high-pitched chirping and squeaking noises! It seems as though the Mimbrane that already conquered you has detected its brethren. The bizarre manipulation of your body, your orifice puckering and undulating of its own volition, is strangely turning you on and making it difficult to regain your composure.");

				output("\n\nThe muffled sounds from your");
				if (pc.hasStatusEffect("Mimbrane Ass")) output(" rear");
				else output(" crotch"); 
				output(" reach your new opponent, causing the parasite to take pause and chirp back. You’re left a little confused as the brief conversation goes on for another few moments. The silken sheet in the air before you tenses up yet again, presumably ready to fight you. But just as you try and do the same, you’re distracted by yet another strange occurrence");
				if(pc.armor.shortName != "") output(" within your [pc.armor]");
				output(".");

				output("\n\nA damp spot on your");
				if (pc.hasStatusEffect("Mimbrane Ass")) output(" butt");
				else output(" groin");
				output(" plants a seed of worry within you. Prying open your garments to investigate the issue blossoms that seed in a hurry as your senses are blasted with an overwhelmingly thick cloud of noxious ardour originating from under your protection. The scent is a more concentrated variant similar to the Mimbrane before you. Before you reel back in surprise, you do manage to catch a surprising fact: your");
				if (pc.hasStatusEffect("Mimbrane Cock")) output(" [pc.cock]");
				else if (pc.hasStatusEffect("Mimbrane Pussy")) output(" [pc.pussy]");
				else output(" [pc.ass]");
				output(" is sweating profusely, absolutely drenched in the clear, light pink oil wild Mimbranes use to assault their prey.");

				output("\n\nLooks like your parasitic passenger is turning traitorous in favor of coming to the aid of its comrade. Best to end this fight quick before you fall victim to its sexual urges.");

				pc.lust(10);
			}
			//if PC has multiple Mimbranes
			else
			{
				output("Your preparatory combat stance falters a bit when an unusual sensation radiates from around your body. The various parts of you under the watchful eyes of Mimbranes have started to go into a frenzy, all chirping and squeaking to your rather surprised opponent. The commotion feels as if your body is protesting against you, various holes and patches of skin crying out in unison.");

				output("\n\nThe Mimbrane flying before you joins in on the conversation. The chatter between it and your parasitic body parts only manages to put you on edge, unsure of where this unbidden allegiance will go. A moment of silence finally descends just as the wild silken sheet before you tenses back up, preparing to duel.");
			
				output("\n\nA secondary attempt to enter anything resembling a combat stance is thwarted as numerous damp sensations perk up along your body. A second later and your olfactory senses are brought to their knees with an overwhelmingly thick cloud of noxious ardour originating from the various Mimbranes on your body. Indeed, they’ve all begun to sweat profusely, coating you in their clear, oily secretion of pure ardour.");
	
				output("\n\nThe best you can manage against the surprise assault is a coughing stumble away from the unbidden sensual perspiration. Looks like your parasitic passengers are turning traitorous in favor of coming to the aid of their comrade. Best to end this fight quick before you fall victim to their sexual urges.");

				pc.lust(10); // Doublecheck the mechanics on this value
			}
		}
	}
	
	CodexManager.unlockEntry("Mimbranes");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Mimbrane());
	CombatManager.victoryScene(defeatMimbrane);
	CombatManager.lossScene(beatUpByAFuckinDishcloth);
	CombatManager.displayLocation("MIMBRANE");
	
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

//Mimbrane Combat Attacks and Effects
//Any Mimbranes in a state that could cause a skipped turn (mutinous, aiding mutinous, or four-day hungry, ≤2 trust hand/feet) should take priority in order to avoid actions taking place prior.
//General Effect Text

//Suffering from neglected Mimbrane in-combat (choose randomly from group, appears at start of combat): 
public function neglectedMimbranesCombat():void
{
	if (mimbranesNeglected() == 0) return;
	if (CombatManager.hasEnemyOfClass(Mimbrane)) return;
	
	output("\n\n");
	
	var select:int = rand(3);

	if (select == 0)
	{
		output("The hungry Mimbrane")
		if (attachedMimbranes() > 1) output("s");
		output(" on your body make");
		if (attachedMimbranes() == 1) output("s")
		output(" concentrating a little tough, slowly chipping away at your resolve.");
	}
	else if (select == 1)
	{
		output("It’s difficult for you to focus as the hungry Mimbrane");
		if (attachedMimbranes() > 1) output("s");
		output(" revolt");
		if (attachedMimbranes() == 1) output("s");
		output(" against you,");
		if (attachedMimbranes() > 1) output(" their");
		else output(" its");
		output(" oily secretions building your desire.");
	}
	else if (select == 2)
	{
		output("Your sexual desire is only growing as your hungry Mimbrane");
		if (attachedMimbranes() > 1) output("s");
		output(" continue");
		if (attachedMimbranes() == 1) output("s");
		output(" to slather you in");
		if (attachedMimbranes() > 1) output(" their");
		else output(" its")
		output(" sensual sweat.");
	}
}

//Suffering from mutinous Mimbranes in-combat (choose randomly from group, appears at start of combat)
public function mutinousMimbranesCombat():void
{
	if (!CombatManager.hasEnemyOfClass(Mimbrane)) return;
	if (attachedMimbranes() == 0) return;
	
	output("\n\n");
	
	var select:int = rand(3);

	if (select == 0)
	{
		output("The Mimbrane");
		if (attachedMimbranes() > 1) output("s");
		output(" attached to you");
		if (attachedMimbranes() == 1) output(" is");
		else output(" are");
		output(" sweating profusely, doing");
		if (attachedMimbranes() > 1) output(" their");
		else output(" its");
		output(" best to throw your will off-balance as you combat");
		if(attachedMimbranes() > 1) output(" their");
		else output(" its");
		output(" brethren.");
	}
	else if (select == 1)
	{
		output("It’s difficult to focus on your opponent as your own parasite");
		if (attachedMimbranes() > 1) output("s do");
		else output(" does");
		output(" all");
		if (attachedMimbranes() > 1) output(" they");
		else output(" it");
		output(" can to impede your efforts."); 
	}
	else if (select == 2)
	{
		output("Your focus is weary, struggling against the mutinous Mimbrane");
		if (attachedMimbranes() > 1) output("s");
		output(" on your body, doing");
		if (attachedMimbranes() > 1) output(" their");
		else output(" its");
		output(" best to keep you from defeating");
		if (attachedMimbranes() > 1) output(" their");
		else output(" its");
		output(" fellow parasite.");
	}
}

// Spit attacks are automatic additions to any lust attack the player attempts
public function playerMimbraneSpitAttack():void
{
	var i:int;
	
	// Only if enabled.
	if (flags["PLAYER_MIMBRANE_SPIT_ENABLED"] == undefined) return;

	// Find all mimbranes that can spit
	// Anything with 4+ trust, costs 5 feedings
	var eligibleMimbranes:Array = new Array();

	for (i = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]))
		{
			if (pc.statusEffectv1(mimbraneEffects[i]) >= 4 && pc.statusEffectv3(mimbraneEffects[i]) >= 5)
			{
				eligibleMimbranes.push(mimbraneEffects[i]);
			}
		}
	}

	// Each eligible mimbrane has a 40% chance to fire their spit attack
	for (var ii:int = 0; ii < eligibleMimbranes.length; ii++)
	{
		// 40% chance to happen
		if (rand(5) <= 1) // 2 in 5 [(0-4)]
		{
			// 100% chance of misfire while inside an airtight suit!
			if(pc.hasAirtightSuit())
			{
				output("\n\nYou’re surprised when you feel an odd buildup");
				if (eligibleMimbranes[ii] == "Mimbrane Cock") output(" along the length of your [pc.cock]");
				else if (eligibleMimbranes[ii] == "Mimbrane Pussy") output(" pulsing around your [pc.pussy]");
				else if (eligibleMimbranes[ii] == "Mimbrane Ass") output(" radiating from your [pc.ass]");
				else if (eligibleMimbranes[ii] == "Mimbrane Balls") output(" concentrated around your [pc.balls]");
				else if (eligibleMimbranes[ii] == "Mimbrane Boobs") output(" tingling your [pc.nipples]");
				else if (eligibleMimbranes[ii].indexOf("Mimbrane Hand") != -1) output(" coming from your [pc.hand]");
				else if (eligibleMimbranes[ii].indexOf("Mimbrane Foot") != -1) output(" emanating from your [pc.foot]");
				else if (eligibleMimbranes[ii] == "Mimbrane Face") output(" swelling in your [pc.lips]");
				else output(" somewhere on your body");
				output("... The Mimbrane covering that portion of your anatomy readies a dangerous ball of lust to launch at your opponent. Unfortunately, your airtight [pc.armor] prevents the parasite’s explosive attack to go anywhere but all over yourself! You can’t help but to breathe in the lust-inducing vapors as the mimbrane finishes. <b>Maybe you should wear something less encapsulating next time!</b>");
				
				// Cost "feeds"
				feedCost(eligibleMimbranes[ii], 5);
				// Raises player lust
				pc.lust(10);
				
				return;
			}
			// 10% chance to misfire
			if (rand(10) == 0) // 1 in 10 [(0-9)]
			{
				// Failure effects
				// Cost "feeds"
				//pc.setStatusValue(eligibleMimbranes[ii], 3, pc.statusEffectv3(eligibleMimbranes[ii]) - 5);
				feedCost(eligibleMimbranes[ii], 5);

				// Raises player lust
				pc.lust(5);

				// Failure text
				output("\n\n");
				if (eligibleMimbranes[ii] == "Mimbrane Cock")
				{
					// Cock misfire
					output("An unusual pressure builds in your [pc.cock]. You rush to unleash your dragon from its cage in order to allow it to rain sexual fury on your foe. Instead, your Mimbrane-controller member is jostled as you fumble at your [pc.armor], causing the parasite to misfire and douse you with a potent blast of lust.");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Pussy")
				{
					// Vag misfire
					output("An odd buildup in your [pc.pussy] proves to be too much for you to continue ignoring. In the fumbling of your [pc.armor] you manage to startle your snatch... or more appropriately the parasite controlling it. The Mimbrane-controlled genitalia accidentally fires its weaponized lust directly into your [pc.leg], throwing you back with its potent urges.");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Ass")
				{
					// Ass misfire
					output("Your [pc.ass] interrupts your combat with a series of shakes and squeaks, begging for your attention. You rush to undo your [pc.armor], but the enthusiastic Mimbrane acts too soon. Your rear end spins you around and fires its prepared lust-charge before you can clear the airspace, causing the attack to be wasted and splattering you with its prurient payload. The " + enemy.short + " can only look on in speechless shock, giving you time to recover.");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Balls")
				{
					// Balls misfire
					output("An interruption runs through your fight, fueled by your antsy [pc.balls]. The Mimbrane seems ready to come to your aid with a batch of deep red loving. But as you futz around with your [pc.armor], your [pc.balls] jostle around enough to knock the parasite’s assistance out prematurely, pelting your [pc.legOrLegs] in amorous goo.");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Boobs")
				{
					// Boobs misfire
					output("The fight halts, distracted by the involuntary noise and jubilance radiating from your [pc.chest]. You figure the Mimbrane is trying to get your attention in order to serve a dish of sexual surprise. You work to undo your [pc.armor] so the parasite can have its fun, but it accidentally fires the second open air hits your cleavage. Your [pc.nipples], still ensconced within your garments, waste their payload and soak you with slick red liquid desire.");
				}
				else if (eligibleMimbranes[ii].indexOf("Mimbrane Hand") != -1)
				{
					// Hands misfire
					// PC should always be armed, so I'm cutting the armed/unarmed check (for now)
					// {If hand is armed}It gets harder to get a solid grip on your weapon, however, and you involuntarily drop it to the ground.
					output("Jittering and trembling from your hand worries you, but you try and ignore it in favor of focusing on the battle. It gets harder to get a solid grip on your weapon, however, and you involuntarily drop it to the ground. Determination drives you to put the sensation behind you, clasping your troubled hand into a tight fist. That’s when you feel a strange protrusion on your palm, followed by an explosive burst of red liquid lust. Turns out the Mimbrane on your hand was trying to ready a projectile for you, but never got the opening it needed to launch it.");
				}
				else if (eligibleMimbranes[ii].indexOf("Mimbrane Foot") != -1)
				{
					// Feet misfire
					output("The Mimbrane covering your [pc.foot] is squeaking and squirming suddenly. You’re too focused on your battle to see to whatever is troubling it, however, ignoring the unusual pressure building below your toes. Regret sinks in when you feel that pressure released, your foot covered in the parasite’s passionate projectile that it could no longer contain.")
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Face")
				{
					output("You’re surprised when you feel an odd buildup along your [pc.face], working its way towards your [pc.lips]. The Mimbrane covering your head is readying a dangerous ball of lust to server to your opponent. Unfortunately your timing isn’t precisely matched with that of the parasite’s. A sudden breath on your part clashes with the parasite’s attempt to gather its attack, causing an explosion of misty desire to take place in front of your face.");
				}
			}
			else
			{
				var damage:TypeCollection;
				// Succesful attack, calculate if critical
				if (pc.statusEffectv3(eligibleMimbranes[ii]) >= 10 && rand(10) <= 2) // 10+ food, 3 in 10 [0-9]
				{
					// Backsplash (lol)
					pc.lust(5);

					// Cost
					// Converted to feedcost to prevent excess growth
					//pc.setStatusValue(eligibleMimbranes[ii], 3, pc.statusEffectv3(eligibleMimbranes[ii]) - 10);
					feedCost(eligibleMimbranes[ii], 10);

					// Output text
					output("\n\n");
					if (eligibleMimbranes[ii] == "Mimbrane Cock")
					{
						output("You’re about brought to your [pc.knees] by a tremendous buildup of pressure in your [pc.cock]. Unable to ignore it, you quickly undo your [pc.armor] to find out what’s wrong. Your Mimbrane-controlled member bursts free to fire a mighty blast of its concentrated liquid lust. The attack explodes all over the " + enemy.short + ", hard enough to hit you with a little splash damage.")
					}
					else if (eligibleMimbranes[ii] == "Mimbrane Pussy")
					{
						output("A tremendous buildup in your [pc.pussy] forces you to your [pc.knees]. You frantically undo your [pc.armor], surprised when your Mimbrane gash launches a powerful volley of concentrated liquid lust at your opponent. The attack explodes on contact, drenching the " + enemy.short + " and hitting you with a little splash damage.");
					}
					else if (eligibleMimbranes[ii] == "Mimbrane Ass")
					{
						output("Powerful quivers and clenching overtake your [pc.ass], forcing you into undoing your [pc.armor]. The second your bottom greets the air, the Mimbrane-controlled rear pivots you around a full 180 degrees. The parasite launches an extra-dense blast of accumulated liquid lust that explodes on contact with your opponent. It’s strong enough to hit you with splash damage.");
					}
					else if (eligibleMimbranes[ii] == "Mimbrane Balls")
					{
						output("You feel an unordinary buildup of pressure on your [pc.balls] that doesn’t appear to be cum-related. You undo your [pc.armor] just in time for the Mimbrane-covered sack to burst free and launch an extra-powerful volley of liquid lust directly at your opponent. The attack explodes upon contact with the " + enemy.short + ", hitting you with a little splash damage.");
					}
					else if (eligibleMimbranes[ii] == "Mimbrane Boobs")
					{
						output("A powerful pressure builds on your [pc.chest], proving to be too difficult for you to ignore. You succumb and undo your [pc.armor], surprised when the Mimbrane mounds burst forth. Each of your [pc.nipples] launch extra-powerful doses of liquid lust towards your opponent that explode on contact. The attack is so out of control that you even manage to get splashed a little yourself.");
					}
					else if (eligibleMimbranes[ii].indexOf("Mimbrane Hand") != -1)
					{
						output("Your hand suddenly clenches into a fist and trembles uncontrollably. You try and figure out what’s going on when the Mimbrane extremity pushes away from you to face your opponent. Fingers flare and the parasite’s mouth bursts open, launching a powerfully potent blast of liquid lust at your opponent. The attack explodes upon contact with the " + enemy.short + ", hitting you with a little splash damage.");
					}
					else if (eligibleMimbranes[ii].indexOf("Mimbrane Foot") != -1)
					{
						output("Your toes are clenching, involuntarily trying to contain some unusual buildup of pressure. Unable to ignore it, you bring your [pc.foot] out to light, surprised when the Mimbrane extremity pushes towards your opponent! It launches a powerfully potent blast of liquid lust at your opponent. The attack explodes on contact with the " + enemy.short + ", powerful enough to hit you with a little splash damage.");
					}
					else if (eligibleMimbranes[ii] == "Mimbrane Face")
					{
						output("Your [pc.face] feels tense, as if an powerful pressure were caving it in. Just when you start to worry, the pressure builds in your [pc.lips], culminating into a powerful blast of liquid lust aimed directly for your opponent. The attack bursts upon contact, hitting you with a little splash damage.");
					}
					damage = new TypeCollection( { drug: 25 } );
					damageRand(damage, 15);
					applyDamage(damage, pc, enemy);
				}
				// Regular attack
				else
				{
					// Cost
					//pc.setStatusValue(eligibleMimbranes[ii], 3, pc.statusEffectv3(eligibleMimbranes[ii]) - 5);
					// Converted to feedcost to prevent excess growth
					feedCost(eligibleMimbranes[ii], 5);

					// Output text
					output("\n\n");
					if (eligibleMimbranes[ii] == "Mimbrane Cock")
					{
						output("An unusual pressure builds in your [pc.cock]. You undo your [pc.armor], just in time for your Mimbrane-controlled member to fire a blast of concentrated sexual desire at the " + enemy.short + ".");
					}
					else if (eligibleMimbranes[ii] == "Mimbrane Pussy")
					{
						output("A bizarre pressure cloys away at your [pc.pussy], begging for you to investigate. Your hands fly back just as you undo your [pc.armor] taken by complete surprise when your Mimbrane-possessed snatch launches a heady blast of concentrated romance at the " + enemy.short + ".");
					}
					else if (eligibleMimbranes[ii] == "Mimbrane Ass")
					{
						output("The assault against the " + enemy.short + " slows as you’re distracted by quivering and squeaking escaping from your [pc.asshole]. You’re barely able to slip your [pc.armor] down before your [pc.ass] quickly swivels you 180 degrees to face your opponent. The excited Mimbrane can hardly contain itself, spreading your cheeks wide and launching a concentrated blast of oily lust from your pucker. The " + enemy.short + "’s bewilderment allows you time to regain your composure after the strange outburst.");
					}
					else if (eligibleMimbranes[ii] == "Mimbrane Balls")
					{
						output("Your [pc.balls] gains your attention, the Mimbrane chirping wildly. You undo your [pc.armor] just enough for your [pc.balls] to burst forth, showing you the parasite’s bloated mouth is primed and ready. It launches a ball of oily lust directly for the " + enemy.short + ".");
					}
					else if (eligibleMimbranes[ii] == "Mimbrane Boobs")
					{
						output("You’re shocked when your [pc.chest] squeak and jiggle of their own accord. Clearly the Mimbrane fused to them has something to share with you, you figure. You open your [pc.armor], shocked when your puppies burst forth, [pc.nipples] blasting shots of concentrated desire straight at the " + enemy.short + ".");
					}
					else if (eligibleMimbranes[ii].indexOf("Mimbrane Hand") != -1)
					{
						output("You’re taken aback when your hand begins to tremble, fingers jittering. You grab its weapon with your other hand before anything can go wrong. The Mimbrane’s face on the palm of your hand appears to be bulging, its mouth creating a large welt that only continues to grow. You only get another moment to stare at the oddity before the parasite thrusts your hand forward, launching its payload of thick, saturated lust at the " + enemy.short + ".");
					}
					else if (eligibleMimbranes[ii].indexOf("Mimbrane Foot") != -1)
					{
						output("An unusual pressure in your [pc.foot] distracts you from the fight, and involuntary wiggling of your toes grabs your full attention. You expose the Mimbrane-controlled appendage to the air just in time for it fire a concentrated mass of pure lust from its mouth at the " + enemy.short + ".");
					}
					else if (eligibleMimbranes[ii] == "Mimbrane Face")
					{
						output("A surprising pressure builds over your cheeks, surging towards your [pc.lips]. The Mimbrane covering your [pc.face] forces you into spitting a large, dense ball of pure lechery right towards your opponent!");
					}
					damage = new TypeCollection( { drug: 15 } );
					damageRand(damage, 15);
					applyDamage(damage, pc, enemy);
				}
			}
		}
	}
}

// Cloud attacks are automatic additions to any action the player takes in combat
// Cloud debuff causes increased lust gain on the target when the player attacks, rather than a durational debuff that applies its own lust modifier.
public function playerMimbraneCloudAttack():void
{
	if (mimbraneDebug) trace("Mimbrane player assist cloud attack processing...");
	
	// Only if enabled
	if (flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] == undefined) return;
	
	// Find all eligible mimbranes that could produce a cloud
	var eligibleMimbranes:Array = new Array();

	for (var i:int = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]))
		{
			if (pc.statusEffectv1(mimbraneEffects[i]) >= 3 && pc.statusEffectv3(mimbraneEffects[i]) >= 3)
			{
				eligibleMimbranes.push(mimbraneEffects[i]);
			}
		}
	}

	for (var ii:int = 0; ii < eligibleMimbranes.length; ii++)
	{
		// Each eligible mimbrane has a 25% chance to attack
		if (rand(4) == 0) // 1 in 4 (0-3)
		{
			// Cost
			// Converted to feedcost to prevent excess growth
			//pc.setStatusValue(eligibleMimbranes[ii], 3, pc.statusEffectv3(eligibleMimbranes[ii]) - 3);
			feedCost(eligibleMimbranes[ii], 3);

			// 100% chance of misfire while inside an airtight suit!
			if(pc.hasAirtightSuit())
			{
				output("\n\nThings are getting unusually hot and heavy in your [pc.armor]. The Mimbrane covering your");
				if (eligibleMimbranes[ii] == "Mimbrane Cock") output(" [pc.cock]");
				else if (eligibleMimbranes[ii] == "Mimbrane Pussy") output(" [pc.pussy]");
				else if (eligibleMimbranes[ii] == "Mimbrane Ass") output(" [pc.ass]");
				else if (eligibleMimbranes[ii] == "Mimbrane Balls") output(" [pc.balls]");
				else if (eligibleMimbranes[ii] == "Mimbrane Boobs") output(" [pc.nipples]");
				else if (eligibleMimbranes[ii].indexOf("Mimbrane Hand") != -1) output(" [pc.hand]");
				else if (eligibleMimbranes[ii].indexOf("Mimbrane Foot") != -1) output(" [pc.foot]");
				else if (eligibleMimbranes[ii] == "Mimbrane Face") output(" [pc.lips]");
				else output(" body");
				output(" reactively unleashes a cloud of lust, unknowingly - and unintentionally - trapping you inside the airtight attire with nowhere to escape its lust-triggering effects. Trying to control your inhalation, you can only hope the thick billowing mass doesn’t stick around for too long... <b>Maybe you should’ve worn something a little more breathable before heading out!</b>");
				
				// Misfires!
				applyCloudDebuff(pc);
				// Also initially raises lust
				pc.lust(5);
				return;
			}
			// 20% chance of misfire
			if (rand(5) == 0) // 1 in 5 (0-4)
			{
				if (mimbraneDebug) trace("Cloud attack misfire!");
				
				// Misfires!
				applyCloudDebuff(pc);

				// Also initially raises lust
				pc.lust(2);

				// Output text
				output("\n\n");
				if (eligibleMimbranes[ii] == "Mimbrane Cock")
				{
					output("Things are getting unusually hot and heavy in your [pc.armor]. You peek inside, unknowingly opening a pressure cooker filled with clouds of concentrated sexual tension generated by your surprised [pc.cock]. The Mimbrane tries desperately to rid you of its premature perspiration, but you don’t come out of it unscathed.");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Pussy")
				{
					output("The clammy moisture building up around your [pc.pussy] is reaching uncomfortable thresholds for you, driving you to try and release some of the tension. Unfortunately, your parasitic pussy wasn’t expecting you and fails to contain the attack it was preparing to aid you with. Your snatch squeeks apologetically as you frantically wave off the potent haze of sexual cravings.");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Ass")
				{
					output("The fight gets harder to focus on the more sweaty and steamy your [pc.ass] gets, spurred on by its parasitic covering. It finally gets to be unbearable when the Mimbrane starts to quake and tremble with unrelenting pressure, clenching your [pc.asshole] tight and compressing your cheeks. You go for your [pc.armor] in an attempt to come to the parasite’s aid, but can hardly accomplish anything as it prematurely disperses its payload, smothering you in clouds of sweet, red lust. Low, apologetic squeaks can be heard from your rear as you escape the haze to focus on the " + enemy.short + ".");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Balls")
				{
					output("The clammy moisture clinging to your [pc.balls] is getting to be too much to bear, forcing you to try and vent some of it through your [pc.armor]. You’re shocked when the slightest peek into the situation reveals the Mimbrane-controlled [pc.sack] has been working to create a cloud of lust to aid in your combat. The attack escapes from the confines of your clothing, smothering you in its nectary wanton desire.");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Boobs")
				{
					output("Your [pc.chest] feel as if they’re broiling in a pressure cooker, drenched in moisture. You loosen your [pc.armor] around your neck to try and let off some steam only to be greeted with angry protests from the Mimbrane-controlled breasts. That’s because only a moment later your head is surrounded by a potent cloud of lust-inducing perspiration that the parasite wasn’t finished preparing. You can only recoil, coughing wildly as you stumble out of the gas.");
				}
				else if (eligibleMimbranes[ii].indexOf("Mimbrane Hand") != -1)
				{
					output("Your eye catches a thick red haze surrounding your sweaty hand. You involuntarily try and fan it away, but somehow manage just to cover yourself in your hand’s passionate perspiration. The Mimbrane chirps at you, probably frustrated over its premature attack being wasted.");
				}
				else if (eligibleMimbranes[ii].indexOf("Mimbrane Foot") != -1)
				{
					output("Your [pc.foot] makes it hard for you to concentrate on the battle, drenched in dense sweat. Anxious for some relief, you take a moment to expose it to the open air. This startles the Mimbrane causing the overactive perspiration, however. It had been building up a cloud of lascivious intentions for use against your opponent, but it instead winds up accidentally shrouding you with it in its panic instead.");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Face")
				{
					output("It’s bad enough that the Mimbrane encasing your head has drenched you in a rich layer of sweat, but now you’re having trouble seeing through the thick cloud of salacious intent that’s forming as a result. You involuntarily go to wipe your brow, which accidentally causes you to inhale some of the dangerous fumes. The parasite manipulates your [pc.face] enough to avoid any further exposure to its premature attack.");
				}
				
				return;
			}
			// Success
			else
			{
				if (mimbraneDebug) trace("Cloud attack successful!");
				
				applyCloudDebuff(enemy);

				// Output text
				output("\n\n");
				if (eligibleMimbranes[ii] == "Mimbrane Cock")
				{
					output("An unusually high amount of humidity gathers in your [pc.armor], forcing you to undo it and investigate. Your Mimbrane-controlled [pc.cock] has worked up quite the sweat, producing a thick, noxious smog of concentrated lust. The parasite quickly fans it towards the bewildered " + enemy.short + ".");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Pussy")
				{
					output("Your fight falls back in your mind, replaced by the worry that your sopping [pc.pussy] may become an undiscovered swampland if you don’t air out the unusual perspiration. You’re shocked to find your Mimbrane-controlled vaginal walls exuding a deep red cloud of potent lust. The parasite quickly fans it towards the " + enemy.short + " before you fall victim to its secretion.");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Ass")
				{
					output("The sweltering, moist ambience encompassing your [pc.ass] is slinking its way forefront in your mind. It snaps into focus when your hind quarters tremble fiercely, low-pitched squeaks escaping your [pc.asshole]. The pressure forces you to involuntarily drop trou, allowing the Mimbrane to force you around and point its parasitic pucker directly at the " + enemy.short + ". The enthusiastic creature unleashes a sweet, dense haze of pink passion directly at " + enemy.mfn("him", "her", "it") + ". You quickly regain your composure, anxious to just move on.");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Balls")
				{
					output("Your buildup of sweat and steam around your [pc.balls] starts to get to you, forcing you to try and air things out. You’re startled to see a thick red haze emanating from your parasitic sack. The Mimbrane gets to work, furiously swinging your [pc.balls] to force its secretion towards the " + enemy.short + ".");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Boobs")
				{
					output("Things are getting positively balmy within your [pc.armor]. Your [pc.chest] are absolutely drenched. You quickly try and relieve them with some fresh air, only to be shocked to discover a thick red cloud of potent sensuality surrounds them. The Mimbrane mammaries quickly direct the haze over towards your opponent before either of you react in any meaningful fashion.");
				}
				else if (eligibleMimbranes[ii].indexOf("Mimbrane Hand") != -1)
				{
					output("A thick red haze forms around your sweaty hand. You distance yourself from it as far as possible. The Mimbrane-controlled appendage fans the potent cloud of carnal desire towards the " + enemy.short + " before you can fall victim to it yourself.");
				}
				else if (eligibleMimbranes[ii].indexOf("Mimbrane Foot") != -1)
				{
					output("Your attention slides to your [pc.foot], stewing in uncomfortably dense perspiration. You expose your foot to the air for some relief, only to find it enshrouded in a haze of red carnal steam. The Mimbrane manages to direct it directly towards your opponent in short time.");
				}
				else if (eligibleMimbranes[ii] == "Mimbrane Face")
				{
					output("It’s beginning to get hard to see, your head sweating profusely from the Mimbrane encasing it. Your vision is then covered entirely by a thick cloud of red lust surrounding your head! The parasite works to keep your [pc.face] from inhaling any of its dangerous vapors, instead manipulating it into sending the wanton fog towards your opponent.");
				}
				
				return;
			}
		}
	}
}

public function applyCloudDebuff(target:Creature):void
{
	if (target.isLustImmune)
	{
		if(target == pc) output("\n\nIt seems your Mimbranes’ thick lust cloud has no affect on you.");
		else output("\n\nIt seems as though your Mimbranes’ efforts to aid you might be wasted; your assailant doesn’t seem the least bit hindered by the thick cloud of lust surrounding them.");
		return;
	}
	
	if (!target.hasStatusEffect("Mimbrane Lust Cloud"))
	{
		target.createStatusEffect("Mimbrane Lust Cloud", 3, 1, 0, 0, false, "Icon_LustUp", "", true);
		return;
	}
	else
	{
		target.setStatusValue("Mimbrane Lust Cloud", 1, 3);
		target.setStatusValue("Mimbrane Lust Cloud", 2, target.statusEffectv2("Mimbrane Lust Cloud") + 1);
	}
}

public function cloudDebuffHandler(target:Creature):void
{
	target.lust(target.statusEffectv2("Mimbrane Lust Cloud") * 2);
	target.addStatusValue("Mimbrane Lust Cloud", 1, -1);
	
	if (target.statusEffectv1("Mimbrane Lust Cloud") <= 0)
	{
		target.removeStatusEffect("Mimbrane Lust Cloud");
		output("\n\n<b>The lust inducing cloud produced by your Mimbranes has faded from " + target.a + target.short + "!</b>");
	}
}

// Effects that interrupt combat and cause the player to potentially "miss" a turn
public function mimbraneCombatInterference():Boolean
{
	var i:int;
	// Turn loss/effects from mutinious mimbranes
	if (enemy is Mimbrane)
	{
		// 10% chance of mutiny from each attached mimbrane, ie actively working against the player. Going to chew through feed counter to do this too.

		// Find all mimbranes that can spit
		// Anything with 4+ trust, costs 5 feedings
		var eligibleMimbranes:Array = new Array();

		for (i = 0; i < mimbraneEffects.length; i++)
		{
			if (pc.hasStatusEffect(mimbraneEffects[i]))
			{
				if (pc.statusEffectv3(mimbraneEffects[i]) >= 3)
				{
					eligibleMimbranes.push(mimbraneEffects[i]);
				}
			}
		}

		// Each eligible mimbrane has a 10% to mutiny
		for (i = 0; i < eligibleMimbranes.length; i++)
		{
			// 10
			if (rand(10) == 0) // 1 in 10 [(0-9)]
			{
				// Cost "feeds"
				//pc.setStatusValue(eligibleMimbranes[i], 3, pc.statusEffectv3(eligibleMimbranes[i]) - 3);
				feedCost(eligibleMimbranes[i], 3);

				// Raises player lust
				pc.lust(2);

				// Apply the debuff
				applyCloudDebuff(pc);

				// Failure text
				if (eligibleMimbranes[i] == "Mimbrane Cock")
				{
					output("Some unrelenting pressure in your");
					if(pc.isCrotchGarbed()) output(" [pc.lowerGarments]");
					else output(" crotch");
					output(" is getting unbearable, forcing you to find out what’s going on. The moment you peek inside, your [pc.cock] overwhelms you with a potent blast of sexual fog. Your Mimbrane-controlled dick works furiously to smother you in its sexual cloud before you can entomb it back under your garments, only its furious chirps able to escape.");
				}
				else if (eligibleMimbranes[i] == "Mimbrane Pussy")
				{
					//Vagina Mimbranes
					output("You find it difficult to concentrate on the " + enemy.short + " as the moisture trapped in and around your [pc.pussy] becomes too much to bear. An absentminded gesture to undo your [pc.armor] is all the opening your parasitic pussy needs to gas you with its concoction of licentious intentions mixed into a potent crimson fog.");
				}
				else if (eligibleMimbranes[i] == "Mimbrane Ass")
				{
					//Ass Mimbranes
					output("Your enthusiastic [pc.ass] is doing everything in the parasite’s power to throw you off kilter, soaking the seat of your [pc.armor] in oily sweat. The Mimbrane suddenly uses its perch to its advantage, spreading your cheeks wide and letting rip a noxious, nectarous volley of cloudy lust from your [pc.asshole]. You try and swear to the " + enemy.short + " that it isn’t what it looks like, but are cut off as you’re forced to evacuate from your current position inside the dangerous smog.");
				}
				else if (eligibleMimbranes[i] == "Mimbrane Balls")
				{
					//Scrotum Mimbranes
					output("The rivalry against the " + enemy.short + " halts as you’re distracted by rapid tensing and flailing of your [pc.balls]. The Mimbrane is thrashing your [pc.balls] about wildly, forcing you into your [pc.armor] to investigate. The moment you peek inside, the mutinous sack overwhelms you with a cloud of sexual desire.");
				}
				else if (eligibleMimbranes[i] == "Mimbrane Boobs")
				{
					//Breasts Mimbranes
					output("It gets a little hard to breathe and focus on your opponent as your [pc.breasts] continue sweating to an unparalleled degree. The Mimbrane-controlled mammaries within your [pc.armor] suddenly shake fiercely, slamming into one another. They wind up forcing thick red clouds of pure libido up and out of your garments, causing you to stagger back out of the dense haze.");
				}
				else if (eligibleMimbranes[i].indexOf("Mimbrane Hand") != -1)
				{
					// Hand Mimbranes
					output("Your Mimbrane-possessed hand continues its sweaty crusade against you by secreting a thick red amorous fog. You decide to grin and bear the parasite’s attack, unwilling to give your opponent an upper hand.");
				}
				else if (eligibleMimbranes[i].indexOf("Mimbrane Foot") != -1)
				{
					//Feet Mimbranes
					output("You do your best to ignore your [pc.foot], the appendage soaking in its Mimbrane’s thick sweat and intoxicating aroma. The parasite is working so hard against you, in fact, that it actually manages to produce enough of a haze down from your foot that you start to feel the effects of it!");
				}
				else if (eligibleMimbranes[i] == "Mimbrane Face")
				{
					//Head Mimbranes
					output("The Mimbrane covering your head is working double time, clouding your [pc.face] with sweat and a fog of lust. You can’t hold your breath forever and eventually wind up inhaling some of the noxious, nectary fumes.");
				}

				// Break the loop so we only have a single mutiny action that skips a player combat turn
				return true;
			}
		}
	}
	// Other sources of turn loss

	// Hungry mimbranes
	var numHungry:int = mimbranesNeglected();
	if (numHungry > 0)
	{
		// If any hungry mimbrane is active, all attached mimbranes have a 10% chance to make the player lose a turn
		for (i = 0; i < mimbraneEffects.length; i++)
		{
			if (pc.hasStatusEffect(mimbraneEffects[i]))
			{
				if (rand(10) == 0) // 1 in 10 (0-9)
				{
					// Lose a turn!
					if (mimbraneEffects[i] == "Mimbrane Cock")
					{
						output("You’re unable to focus, too distracted by your Mimbrane-controlled [pc.cock] soaking in a parasitic stew of clammy passion and sweaty lust.");
					}
					else if (mimbraneEffects[i] == "Mimbrane Pussy")
					{
						output("Your [pc.legOrLegs] quiver");
						if(pc.legCount == 1) output("s");
						output(" and shake");
						if(pc.legCount == 1) output("s");
						output(", a sign of uneasiness as you find it difficult to ignore your [pc.pussy]. Your Mimbrane-possessed snatch undulates slowly, ensuring a dangerous cocktail of thick, oily sweat and potent clouds of lust meet you should you ever try and calm the frustrated parasite.");
					}
					else if (mimbraneEffects[i] == "Mimbrane Ass")
					{
						output("Focus fades from your grasp as your [pc.ass] involuntarily rubs its sweaty, sugary skin against the inside of your [pc.armor]. The Mimbrane lewdly quivers your [pc.asshole], slowly pumping its salacious gas in its confinements, hoping that enough will escape to only drive you further into the brink.");
					}
					else if (mimbraneEffects[i] == "Mimbrane Balls")
					{
						output("You find it difficult to continue your spat with the " + enemy.short + ", unable to concentrate as your [pc.sack] gets even sweatier and sultrier every passing second. The Mimbranes encasing your [pc.balls] is doing its best trying to throw you off kilter.");
					}
					else if (mimbraneEffects[i] == "Mimbrane Boobs")
					{
						output("You’re unable to keep pace with the " + enemy.short + ", too paralyzed as your sweat-drenched breasts slink erotically from under your [pc.armor]. The parasite goes further by rubbing your [pc.nipples] against the inside of the garment, doing whatever it can to hinder you.");
					}
					else if (mimbraneEffects[i].indexOf("Mimbrane Hand") != -1)
					{
						output("You find yourself unable to act, too distracted by your sweaty hand. The parasite covering it moves your fingers suggestively, hinting at its desire to explore your body rather than aid you in combat.");
					}
					else if (mimbraneEffects[i].indexOf("Mimbrane Foot") != -1)
					{
						output("It becomes difficult for you to continue fighting against the [enemy.name], too distracted by your [pc.foot] soaking in sexual sweat and being lewdly controlled by its parasitic coating.");
					}
					else if (mimbraneEffects[i] == "Mimbrane Face")
					{
						output("You’re unable to focus on your fight. The Mimbrane around your head is only increasing its output of oily sweat and salacious fog, making it difficult to ignore.");
					}

					// Break the loop
					return true;
				}
			}
		}
	}

	// Hand mimbrane gropes
	var handGropeChance:int = 0;
	if (pc.hasStatusEffect("Mimbrane Hand Left"))
	{
		// > 4 days without feed
		if (pc.statusEffectv2("Mimbrane Hand Left") >= 4)
		{
			// <= 2 trust = 5% chance
			if (pc.statusEffectv1("Mimbrane Hand Left") <= 2)
			{
				handGropeChance += 5;
			}
			else if (pc.statusEffectv1("Mimbrane Hand Left") > 2)
			{
				handGropeChance += 3;
			}
		}
	}

	if (pc.hasStatusEffect("Mimbrane Hand Right"))
	{
		// > 4 days without feed
		if (pc.statusEffectv2("Mimbrane Hand Right") >= 4)
		{
			// <= 2 trust = 5% chance
			if (pc.statusEffectv1("Mimbrane Hand Right") <= 2)
			{
				handGropeChance += 5;
			}
			else if (pc.statusEffectv1("Mimbrane Hand Right") > 2)
			{
				handGropeChance += 3;
			}
		}
	}

	// Roll!
	if (handGropeChance > 0 && rand(100) <= (handGropeChance - 1)) // handGropeChance in 100 == (0-99) <= handGropeChance-1
	{
		output("Your hand suddenly dives into your [pc.armor], anxiously grasping for your");
		if (pc.hasCock()) output(" [pc.cock]");
		else if (pc.hasVagina()) output(" [pc.vagina]");
		else output(" bare nether regions");
		output(" in the hopes of satisfying its craving. You yank the Mimbrane-controlled appendage back, frustrated by its horrible sense of timing.");
		return true;
	}

	// Stupid mimbrane feets
	var footStumbleChance:int = 0;
	if (pc.hasStatusEffect("Mimbrane Foot Left"))
	{
		// > 4 days without feed
		if (pc.statusEffectv2("Mimbrane Foot Left") >= 4)
		{
			// <= 2 trust = 5% chance
			if (pc.statusEffectv1("Mimbrane Foot Left") <= 2)
			{
				footStumbleChance += 5;
			}
			else if (pc.statusEffectv1("Mimbrane Foot Left") > 2)
			{
				footStumbleChance += 3;
			}
		}
	}

	if (pc.hasStatusEffect("Mimbrane Foot Right"))
	{
		// > 4 days without feed
		if (pc.statusEffectv2("Mimbrane Foot Right") >= 4)
		{
			// <= 2 trust = 5% chance
			if (pc.statusEffectv1("Mimbrane Foot Right") <= 2)
			{
				footStumbleChance += 5;
			}
			else if (pc.statusEffectv1("Mimbrane Foot Right") > 2)
			{
				footStumbleChance += 3;
			}
		}
	}

	// Roll!
	if (footStumbleChance > 0 && rand(100) <= (footStumbleChance - 1)) // footStumbleChance in 100 == (0-99) <= footStumbleChance-1
	{
		output("Your fight takes an abrupt turn when you lose your footing and tumble to the ground. Seems your [pc.foot] was the cause, or more specifically the Mimbrane controlling it.");
		return true;
	}

	return false;
}

public function mimbraneHandBonusAttack(target:Creature):void
{
	if (target is Mimbrane) return;

	var bonusAttackChance:int = 0;

	if (pc.hasStatusEffect("Mimbrane Hand Left"))
	{
		if (pc.statusEffectv1("Mimbrane Hand Left") >= 3 && pc.statusEffectv2("Mimbrane Hand Left") < 7)
		{
			bonusAttackChance += 15;
			if(pc.hasPerk("Mimbrane Symbiosis")) bonusAttackChance += 5;
		}
	}

	if (pc.hasStatusEffect("Mimbrane Hand Right"))
	{
		if (pc.statusEffectv1("Mimbrane Hand Right") >= 3 && pc.statusEffectv2("Mimbrane Hand Right") < 7)
		{
			bonusAttackChance += 15;
			if(pc.hasPerk("Mimbrane Symbiosis")) bonusAttackChance += 5;
		}
	}

	var attackRoll:int = rand(100);
	var msg:String = (bonusAttackChance - 1 >= attackRoll) ? "SUCCESS" : "FAILURE";
	if (mimbraneDebug) trace("Handling Mimbrane Hand Bonus Attacks... " + bonusAttackChance + "%, rolled " + attackRoll + " for " + msg);
	
	if (bonusAttackChance - 1 >= attackRoll)
	{
		// Bonus attack successful
		output("\n\nYou’re taken by surprise when your hand moves all on its own, quickly mimicking your previous attack. It seems as though the Mimbrane controlling it is eager to come to your aid!\n");

		(pc as PlayerCharacter).createStatusEffect("Mimbrane Bonus Attack", 0, 0, 0, 0, true, "", "", true, 0);
		CombatAttacks.SingleMeleeAttackImpl(pc, target, false);
		(pc as PlayerCharacter).removeStatusEffect("Mimbrane Bonus Attack");
	}
}

public function mimbraneFeetBonusEvade(target:Creature, attacker:Creature):Boolean
{
	var dodgeBonus:int = 0;

	if (attacker is Mimbrane) return false;
	if (target != pc) return false;

	if (target.hasStatusEffect("Mimbrane Foot Left") && target.statusEffectv2("Mimbrane Foot Left") <= 6)
	{
		if (target.statusEffectv1("Mimbrane Foot Left") == 3)
		{
			dodgeBonus += 5;
		}
		else if (target.statusEffectv1("Mimbrane Foot Left") >= 4)
		{
			dodgeBonus += 10;
		}
		if(target.hasPerk("Mimbrane Symbiosis")) dodgeBonus += 5;
	}

	if (target.hasStatusEffect("Mimbrane Foot Right") && target.statusEffectv2("Mimbrane Foot Right") <= 6)
	{
		if (target.statusEffectv1("Mimbrane Foot Right") == 3)
		{
			dodgeBonus += 5;
		}
		else if (target.statusEffectv1("Mimbrane Foot Right") >= 4)
		{
			dodgeBonus += 10;
		}
		if(target.hasPerk("Mimbrane Symbiosis")) dodgeBonus += 5;
	}

	// Rolls!
	if (dodgeBonus > 0 && rand(100) <= (dodgeBonus - 1))
	{
		return true;
	}
	
	return false;
}
public function mimbraneFeetBonusEvadeBonus():String
{
	return "You’re taken by surprise as your [pc.foot] suddenly acts on its own, right as you’re about be attacked. The action is intense enough to slide you right out of the face of danger. Seems your Mimbrane is even more attentive than you are!";
}

/* Bonus tese shit that's not implemented atm due to lack of face/lip/etc teases
// Face
Lip Tease (small): You make a suggestive kiss towards the {monster} with your less-than-lean lips.
Lip Tease (medium): You lick your plump lips in a suggestive fashion, tantalizing the {monster} with their delicious volume.
Lip Tease (large): You form your luscious, buxom lips into a nice, tight “o,” suggestively positioning the moist face cushions.
*/

//Mimbranes can only be removed by doctor facilities and must be removed entirely rather than piecemeal. Mimbranes will block any attempts to remove their organ and in the case of feet, they will block transformation attempts away from human feet (as of this writing anyway). These scenes play to highlight that block. Scenes are included for body parts that presumably cannot be removed anyway.
//Ass Mimbrane: Your [pc.asshole] gapes beyond your wildest imagination, cheeks flaring wide. Seems any attempt to seal your [ass] or otherwise rid your lower disposal hole is met with resistance by your butt-hugging Mimbrane.

// HOLY SHIT SCENES

//Victory over Mimbrane
public function defeatMimbrane():void
{
	showMimbrane();
	output("Your adversary falls from the sky, too injured to combat any further. The Mimbrane can only pant uselessly on the ground, slowly extending its four corners to try and crawl away.");
	if (pc.hasCock()) output(" The parasite did manage to work you up into a bit of a frenzy. That slick skin could make for a halfway decent tension reliever.");

	clearMenu();
	addButton(0, "Kill It", killDatMimbrane);
	addButton(1, "Let It Go", letMimbraneGo);

	if (pc.hasCock() && pc.lust() >= 33) addButton(2, "Mimbrane Fap", useDatMimbraneLikeACondom,undefined,"Mimbrane Fap","Use the mimbrane like a living sextoy. It’s certainly slippery enough.");
	else if(pc.lust() >= 33) addDisabledButton(2,"Mimbrane Fap","Mimbrane Fap","You need a penis to fap with a mimbrane.");
	else addDisabledButton(2, "Mimbrane Fap","Mimbrane Fap","You aren’t aroused enough for this.");
}

//Let it Go
public function letMimbraneGo():void
{
	clearOutput();
	showMimbrane();
	output("The battered rag disappears into the wilderness to tend to its wounds. It’ll be quite some time before it can pester a traveler again.\n\n");

	CombatManager.genericVictory();
}

//Kill it
public function killDatMimbrane():void
{
	clearOutput();
	showMimbrane();
	output("You make short work of the wounded parasite, discarding it somewhere out of sight.");

	if (attachedMimbranes() > 0)
	{
		// Any attached Mimbranes go down one trust level
		reduceAllMimbraneTrust();

		output("The Mimbrane");
		if (attachedMimbranes() > 1) output("s");
		output(" on you");
		if (attachedMimbranes() == 1) output(" is");
		else output(" are");
		output(" stone silent. You have little doubt that");
		if (attachedMimbranes() == 1) output(" it");
		else output(" they");
		output(" saw your act.\n\n");
	}
	else output("\n\n");

	CombatManager.genericVictory();
}

//Use it as a masturbation aid - Cock
public function useDatMimbraneLikeACondom():void
{
	clearOutput();
	showMimbrane();

	output("You grab the fleeing parasite by one of its corners, holding it firmly with one hand as it meekly squirms and cries. The Mimbrane’s scent flows around you once you lift the creature up, smelling somewhat of strawberries and lube at first whiff. Your free hand examines its smooth, oily topside, fingers tingling upon contact. This ought to make a fine rag to relieve some of your pent-up pressure. What life is left in the parasite doesn’t seem to be enough for it present a threat anymore.");
	output("\n\n");
	if (!pc.isNude()) output("Juggling the floundering blanket between your hands, you eventually slip off your [pc.armor] to reveal your naked form.");
	output(" You grasp the Mimbrane by its sides now, its miniscule face pointing skyward. It’s as if you’re grasping onto a writhing terry cloth. Drawn out, desperate squeaks and chirps tumble through the jungle, anxious to find any passing ears. The little bugger isn’t entirely certain what you’re planning to do to it.");
	output("\n\nThe Mimbrane’s struggle calms as you position the sentient sheet under your [pc.cock], catching its attention. Though you’re certain the little guy lacks the strength to mend itself onto your cock, caution is never worth neglecting.");
	if (pc.hasStatusEffect("Mimbrane Cock")) output(" Would it even attempt to latch onto your already-claimed shaft?"); 
	output(" Special attention is made to ensure the slick glossy underside of the parasite never comes into contact with anything but your firm grip. Precautions in place, you’re left to tend to your pleasure pole, already erect and throbbing from just a few moments of it hanging in the thick musk radiating from the Mimbrane.");
	output("\n\nYou’re bowled over by a rather intense tingling the instant dick flesh rubs against the lubricious leech. The breeze of the forest suddenly feels more intense on your [pc.skinfurscales]. [pc.Feet] dig into the dirt instinctively. Obviously, direct contact with the parasite’s main line of offense is stirring up your senses something fierce. You’re undeterred in your endeavor however. May as well strap in.");
	output("\n\nThe Mimbrane falls limp in your grasp, ready and willing to serve as your plaything. No doubt it’s hoping to get a nice consolation prize out of having the life bashed out of its flat hide. A flash of cool followed by radiating warmth seeps into your penis once you lay one end of the being’s sleek, red flesh on it. The tingling sensations seem to be intensifying as well; the odds of you backing out now have dwindled into little more than ash in your mind, singed by a power station revving to life around your manhood.");
	output("\n\nAn endless inward gasp is all you can manage as you wrap the Mimbrane around your [pc.cock], overwhelmed by tingling, oily rapture. It feels like a lifetime and an instant before you finish the job.");
	if (pc.biggestCockLength() > 20) output(" Your proud, tall dick pokes out triumphantly from the wriggling tortilla you’ve created around it.");
	else if (pc.biggestCockLength() < 7) output(" The top of your makeshift dick-cocoon collapses inward a little, the parasites size far more than adequate for encompassing your small member.");
	else output(" Your throbbing dick sits comfortably within the parasitic tortilla, air teasing your [pc.cockhead] as it blows in and out the opening.");
	output(" For a few moments, you can only breathlessly revel in the lascivious jolts and vibrations the squirming cock cover is flooding you with.");
	output("\n\nThe Mimbrane’s fulsome secretions ooze out of the bottom, soaking your base");
	if (pc.balls > 0) output(" and trickling over your [pc.sack]");
	output(". Dry [pc.skinfurscales] coming into contact with the sexy slime gets you stirring again and drags you back out of the mesmerizing haze you fell into. Your hands grasp the parasite’s underside; it isn’t nearly as soaking and slick as what’s entertaining your dick, but it’s certainly a little more to grasp than a buxom partner on a hot summer’s day. Your toy gets antsy under your grip, teasing your fingertips and massaging your palm while simultaneously tightening and rubbing your shaft.");
	output("\n\nAs thrilling as the intoxicating massage is, this was supposed to be a domineering act of selfish intent! You claw your way back from the pits of sensuality to reassert yourself as the " + pc.mf("master", "mistress") + " of the situation. The parasite chirps timidly as your hold strengthens. An inhale solidifies your resolve. An exhale commits you to your fate. You push the creature up your [pc.cock].");
	output("\n\nYour resolve is weary. Your commitment is slipping through your fingers. Merely sliding the pernicious sleeve up your length is tantamount to your crotch going on a year-long vacation through the inner reaches of some whore nebula. The sensual shock, the lustrous wanton desire seeping into your rod.... You may as well have licked a frog... and then fucked its brains out. But this battle – this veritable round two – is of your own making, and you’ll be damned if you’ll succumb to something so carnal now. This jungle will bear witness to your successive success.");
	output("\n\nYou pull the Mimbrane back down. The music of the wilderness bows to the thick, gooey sounds.");
	if (pc.biggestCockLength() >= 7) output(" Your [pc.cockhead] feels alien to you once the top of your drowned cock erupts from the top of the parasite’s embrace.");
	output(" Holding the sleeve hard against your base only exposes more of your crotch to the dangerous liquid lust. With the push and pull thoroughly explored, you finally go to work. You stroke for the heavens. You tug for the underworld. Each motion sends out a wet squish that overpowers nature’s melody.");
	output("\n\nThe motion only picks up in pace as you continue. The war is waging between artificial and controlled ambitions. To think such pleasure lies in a mere chemical, one a creature thoughtlessly exudes. Somewhere in an unimportant corner of your mind you make a mental note to tread lightly when discovering the undiscovered. Especially when you discover by using your dick.");
	output("\n\nThe stroking is becoming involuntary now. At some point you fell to your back, [pc.butt] digging into the ground as more of your body gets into the act. Even your [pc.toes] are grasping at the ground in any way they can. Time fading in and out worries you; this is no way for a warrior to battle. Your macho bravado doesn’t really relish in the fact that you’ve consigned to dealing directly with a potent parasite. This fact is only further buried under the mounting torrent of release");
	if (pc.balls > 0) output(" within your balls,");
	output(" on the cusp of breaking free.");
	output("\n\nEach stroke only gets harder. Your [pc.cock] twitches and convulses in preparation. The Mimbrane is unrelenting in its part: tickling your hands, massaging your member, releasing every last bit of moist craving directly into your [pc.skin]. You assuredly would be releasing a cascade of pre, but there’s no distinguishing it from the vigorous slathering you and the parasite have coated your midsection in.");
	output("\n\nEverything goes silent, your breath caught.");
	if (pc.hasDickNipples()) output(" Your [pc.nipples] spit [pc.cum] everywhere around you.");
	if (pc.hasVagina())
	{
		output(" An ignored [pc.pussy] relishes its own");
		if (pc.wetness() <= 1) output(" meager");
		else if (pc.wetness() <= 3) output(" ample");
		else output(" plentiful");
		output(" release of feminine fluids.")
	} 
	
	if (pc.balls > 0) output(" More than a few heads would turn at the sight of your [pc.sack] clenching its damnedest, anxious for clemency.");
	output(" " + StringUtil.capitalize(indefiniteArticle(pc.cumColor())));
	if (pc.cumQ() <= 100) output(" burst");
	else if (pc.cumQ() <= 200) output(" fountain");
	else if (pc.cumQ() <= 400) output(" downpour");
	else output(" torrential deluge");
	output(" fills the air, piercing through the hazy clouds of sexual perspiration the parasite has emitted in your anxiety. The Mimbrane summons a sudden burst of strength timed with your orgasmic relinquishing of its body, unfurling itself from around your [pc.cock] to stretch and catch as much [pc.cumNoun] nutrition as it can handle.");
	output("\n\nThrough your convulsions and the slight shock of your lust-soaked prick meeting the air again, you’re amazed by the parasite when it stretches to easily double its original surface area. The creature is essentially acting as a tarp, frantically moving around your lower half as it works to collect your [pc.cum].");
	if (pc.cumQ() <= 100) output(" The act may be a little overzealous for what little your penis has to share, sadly. But you figure a battered creature has to make the most of any gift horse it comes across.");
	else if (pc.cumQ() <= 400) output(" Its actions are enough to contain your sizeable contribution. The parasite should have enough of your jism to last it a week or three.");
	else if (pc.cumQ() <= 600) output(" The parasite is barely able to stretch large enough to catch your outrageous spasms of spunk. Your [pc.cum] slides down the creature’s slick skin and collects in the center, creating a [pc.cumType] pool in the middle of the parasitic blanket.");
	else output(" There’s no lengths the parasite can stretch to that would allow it to properly contain your otherworldly discharge. The poor creature strains to move under the sheer weight of the [pc.cumColor] volume its collected. It would happily consume all that it could not carry if it could, but its metabolism would prevent it from indulging for very long.");
	output("\n\nYou watch the Mimbrane");
	if (pc.cumQ() <= 600) output(" waddle off with its payload. The parasite takes precious care to maintain that which it cannot eat on the spot.");
	else output(" struggle under its immense payload. The parasite’s forced to let off some of its [pc.cumColor] load just so it can begin to drag itself along the jungle floor.");
	output(" It’s an interesting sight to say the very least. Let no one say you aren’t a merciful conqueror.");
	if (!pc.isNude()) output("\n\nReclaiming your [pc.armor], you realize that while you have satisfied your initial craving, y");
	else output("\n\nY");
	output("our [pc.cock] still tingles and twitches. No amount of rubbing it dry of the Mimbrane’s coating seems to be helping. Best you figure, <b>your actions are probably going to stir you up for a few hours.</b> Guess you can’t always play with fire without getting burned sometimes.\n\n");

	// Todo: Possibly add a lust increasing effect. Dunno if I want to considering how complicated this shit is already though.

	pc.orgasm();
	pc.orgasm();
	processTime(10+rand(10));

	//Lust increases two points an hour for 10 hours.
	
	CombatManager.genericVictory();
}


//Defeated by Mimbrane
//Beginning Defeated Text
public function beatUpByAFuckinDishcloth():void
{
	showMimbrane();
	
	if(pc.hasAirtightSuit() && !pc.hasStatusEffect("Mimbrane Lust Cloud"))
	{
		if(pc.lust() >= pc.lustMax()) output("Being too turned on to fight anymore, you fall down in a heap of horniness that only a good masturbation session would cure.");
		else output("The physical effort to fight such a small parasitic creature is just too much for you to handle and you collapse under the fatigue, falling to your [pc.knees].");
		output("\n\nProdding you with great effort, the victorious Mimbrane attempts to break into your [pc.armor] several times but to no avail... Giving up, it leaves your defeated body in search of a more penetrable victim.\n\n");
		
		processTime(10 + rand(10));
		CombatManager.genericLoss();
		return;
	}
	output("The air around you feels so dense, so thick. Humidity chokes you. It’s become so hard to breathe. You can’t stop panting. Deep, healing breaths elude you, leaving you to your hyperventilation.");
	if (!pc.isNude()) output(" Maybe if you strip off your [pc.armor] it’ll be easier to settle down. So you do.");
	else output(" You feel compelled to fan yourself, hoping that the brisk forest air will help to cool your burning need.");
	output(" But it doesn’t help, it’s only gotten worse, your naked [pc.skinfurscales] only more exposed.");
	output("\n\n[pc.LegOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" getting weak. You lie down. The dirt isn’t helping. The grass doesn’t comfort. The shade may as well not exist. Any stray breeze is powerless. Your hands hopelessly grope around your body, uselessly caressing you. All you can smell is that parasite. Its sweet, musty lust overpowers your senses, surrounding you in a heavy cloud. You’re confused, stuck between an agonizing rut and the oppressive environment.");
	pc.lust(100);
	if(pc.hasTailCock() && rand(2) == 0)
	{
		processTime(2);
		clearMenu();
		addButton(0,"Next",zeikTailPlusMimbMadness);
		return;
	}
	output("\n\nThe Mimbrane waits for the aftermath of its deluge to paralyze you further.");
	if (attachedMimbranes() == 1) output(" The Mimbrane already on you is unrelenting in its emissions.");
	else if (attachedMimbranes() > 1) output(" The Mimbranes already on you are unrelenting in their emissions.");
	output(" You eventually do calm down to some degree, crushed under the artificial passion and salacious smog. The sentient sheet silently revels in its victory by approaching you, scoping out its spoils.");
	if (attachedMimbranes() == 1) output(" Your Mimbrane begins squeaking and chirping yet again, probably helping aim your conqueror on where on your body it could set up shop.");
	else if (attachedMimbranes() > 1) output(" Your Mimbranes squeak and chirp at your conqueror. No doubt they’re helping it quickly decide where on your body it can set up shop.");
	processTime(2);
	clearMenu();
	addButton(0, "Next", attachAMimbrane);
}

/*Parasite Mechanics and Effects
All numbers in this section may be subject to change.
Preferred Order of Attachment
Mimbranes will attach to the PC’s body in a specific order, ideally prioritizing nourishment, seclusion, and warmth. Parasites will only skip to the next organ when previous organs have been claimed by other Mimbranes or the PC does not have the organ. If the missing organ appears later, new Mimbranes will target it before the organ next in the list (e.g. a male PC becomes a herm by gaining a vagina, but already has parasites on their dick, ass and balls. The next Mimbrane will target the new pussy before going for breasts or hands). 
Head Mimbranes require all attached Mimbranes to be at least level two trust before they can be gained. They will start at level two trust.
Breasts must be more than flat (A cup+) to be a target for Mimbranes.
If by some happenstance, a PC has testicles and no dick, then they’re skipped as well.
The order is as follows:
Penis(es) > Vagina > Ass > Scrotum > Breasts > Hands > Feet > Head
*/

public function attachAMimbrane():void
{
	clearOutput();
	showMimbrane();

	clearMenu();
	addButton(0, "Next", mainGameMenu);

	if (pc.hasCock() && pc.totalCocks() >= 1 && !pc.hasStatusEffect("Mimbrane Cock")) attachCockMimbrane();
	else if (pc.hasVagina() && pc.totalVaginas() >= 1 && !pc.hasStatusEffect("Mimbrane Pussy")) attachVagMimbrane();
	else if (!pc.hasStatusEffect("Mimbrane Ass")) attachAssMimbrane();
	else if (pc.balls > 0 && pc.ballSize() > 0 && !pc.hasStatusEffect("Mimbrane Balls") && pc.hasStatusEffect("Mimbrane Cock")) attachBallsMimbrane();
	else if (pc.biggestTitSize() >= 1 && !pc.hasStatusEffect("Mimbrane Boobs")) attachBoobMimbrane();
	else if (!pc.hasStatusEffect("Mimbrane Hand Left")) attachHandMimbrane();
	else if (!pc.hasStatusEffect("Mimbrane Hand Right")) attachHandMimbrane();
	else if (pc.isBiped() && pc.hasFeet() && pc.hasToes() && !pc.hasStatusEffect("Mimbrane Foot Left")) attachFootMimbrane();
	else if (pc.isBiped() && pc.hasFeet() && pc.hasToes() && !pc.hasStatusEffect("Mimbrane Foot Right")) attachFootMimbrane();
	else if (!pc.hasStatusEffect("Mimbrane Face") && lowestMimbraneTrust() >= 2)
	{
		// Face attachment doesn't want to run genericLoss yet.
		// cba to refactor, lazyfix.
		attachFaceMimbrane();
		processTime(10 + rand(10));
		pc.orgasm();
		return;
	}
	else noRoomForDishcloths();

	processTime(10 + rand(10));
	pc.orgasm();
	
	CombatManager.genericLoss();
}

/*Trust Score
0: New parasites start at 0 trust until a parasite at 2 trust exists on the PC. This will cause any new parasites to start at 1 trust. 
1: Mimbranes at 1 trust will still hide from their host naturally, but they can occasionally be spotted looking around with their eyes.
2: Level two trust parasites are cautiously optimistic of their host’s intentions. They will not act very much on their own, but they are incredibly receptive to attention from the PC.
3: Parasites at this level rarely hide from the PC. This trust level unlocks the ability for the PC to request the Mimbranes to “sweat” their natural lust-increasing oil. This is controlled over all 3+ parasites with a global toggle.
4: Mimbranes at maximum trust can randomly augment the PC’s lust attacks by breaking free and spitting at opponents. PCs that have enabled sweating Mimbranes may also occasionally find Mimbranes creating lust clouds that they will fan towards opponents. These attacks can be disabled with a global toggle.*/
public function createMimbraneEffect(targetEffect:String):void
{
	var startingTrust:int = 0;
	var lastFed:int = 1; // Start not-full so an initial feeding scene can happen the first time the player goes back to the ship
	var startingFeedCounter:int = 0;

	if (highestMimbraneTrust() >= 2) startingTrust = 1;

	pc.createStatusEffect(targetEffect, startingTrust, lastFed, startingFeedCounter, 0, true, "", "", false, 0);

	if (mimbraneDebug) trace("Attaching mimbrane ["+ targetEffect +"]to player. Starting Trust ["+ startingTrust +"].")
}

//Get Penis Mimbrane
public function attachCockMimbrane():void
{
	output("Your [pc.cock] stands like a lighthouse to the troubled Mimbrane at sea, [pc.cockhead] a shining beacon through the thick red fog. Its slick skin sliding along your [pc.legOrLegs] breaks up your frenzied breathing with short gasps. The smooth, flat parasite quickly glides across your body to your pecker, inspecting it like a Christmas gift. The bow on top is a bead of pre which the creature quickly gulps down into its tiny mouth. The sensation of the miniscule feeding on your already-overburdened dick doesn’t help your fragile state.");
	output("\n\nIts meager appetite satisfied, the parasite goes to work, sizing itself up to slightly overtake your " + num2Text(Math.round(pc.cocks[0].cLength())) + " inches of masculinity. The Mimbrane hooks one of its four corners down around your base. The caress of its velvet underside on your delicates would send you to the edge had you not already tumbled over it. Its diminutive set of eyes and mouth fade into the parasite’s thin flesh and it quickly wraps itself around your turgid tower.");
	output("\n\nIt doesn’t take long before your member is entirely covered. Where once a proud pecker stood tall now rests an odd, moist, light red cocoon. You don’t really get a good look at it, however. You’re much too preoccupied with the throes of ecstasy, heat, and humidity that are clouding your every thought. Things are only escalating now that your cock is in direct contact with what put you here in the first place.");
	output("\n\nThrough the haze of confusion, you notice a new sensation on your penis. The Mimbrane is wiring itself to your nervous system. It doesn’t hurt - heaven only knows if you can actually feel anything currently and distinguish it as a real sensation. Your dick feels nebulous to you as the parasite does its magic, making you unsure of its shape or size in your mind’s eye. And then the sensations pass. You feel the hazy, tainted air on your crotch again.");
	output("\n\nThat’s when you calm down long enough to get a look at your dick. Your [pc.cock] remains unchanged, seemingly exactly the same as it was before. You examine it with your hands; it certainly feels like nothing’s changed. Your [pc.cockhead] looks as normal to you as it did mere moments bef– no. Something is off. Two odd, tiny little bumps are just north of your opening. Poking and prodding at them reveals nothing. You motion as if to squeeze one like a pimple, but the pain is extraordinary before you can so much as pinch. The instant your fingers lift off, however, the sensation disappears.");
	output("\n\nFurther examination reveals an extremely slight bulge running all the way around the base of your prick. Fingering at it feels as futile as peeling your own skin off. The parasite actually managed to bond itself onto your dick. Then it dawns on you: you aren’t just free of the sexual spasm from earlier. It actually feels as if you managed to knock your rocks off. But you have no memory of any sort of climax, nor do you recall even blacking out.");
	if (pc.cumQ() <= 100) output(" By sheer chance, you run your hand up your side to find a rough little spot of dry [pc.cum].");
	else if (pc.cumQ() <= 400) output(" That’s when you notice the dried [pc.cum] around your body.");
	else if (pc.cumQ() <= 600) output(" That’s when you spot evidence of your massive load on and around you. Small pools of [pc.cum] still remain even.");
	else output(" That’s when you start to really strain to remember as enormous pools of [pc.cum] come into focus on and around you. How you failed to notice the plentiful [pc.cumColor] evidence surrounding you, you’ll never know.");
	output(" Looks like the Mimbrane got to have its cake and eat it, too.");
	output("\n\nNot wanting to re-experience the mind-melting pain of trying to remove the faux flesh from your crotch, you resign to your fate as host. One last wistful glance down at your [pc.cock] is all you pay, still wrapping your head around the ordeal. You feel the same as you did before you even ran into the creature. And you even almost look the same, save for those two miniscule blemishes on your [pc.cockhead]. They’re barely noticeable, but they may as well be flashing lights to you.");
	if (!pc.isNude()) output(" You gather your [pc.armor] and head off");
	else output(" You gather your equipment and head off,");
	output(" doing your best to get your mind off your new traveling companion.");

	createMimbraneEffect("Mimbrane Cock");
	pc.orgasm();
}

//Get Vagina Mimbrane
public function attachVagMimbrane():void
{
	output("Your [pc.cunt] sits as an unexplored chasm of wonder and merriment to the Mimbrane before you. The parasite brushes up");
	if(pc.legCount > 1) output(" between");
	else output(" against");
	output(" your [pc.legOrLegs] to your feminine crevice. Its moist, smooth skin gently brushing up against your [pc.skinTone] thighs definitely doesn’t help your currently precarious mental state. A meager mouth teases you as it explores your folds, eager to lap up any fluids you may already have let free in your ecstasy.");
	output("\n\nIts paltry appetite sated, the Mimbrane goes to work smothering your groin, tiny face – or what meager options it has to constitute a face – sinking into the thin sheet.");
	if(pc.hasClit()) output(" Excited gasps muscle in through your panting when your [pc.clit] is stimulated beyond belief.");
	output(" The sheet covers little else beyond your snatch, uninterested in serving double duty as a sentient bikini. You can feel it shift and push its way into every part of your cooch. Every detail - every opening - is coated in parasitic paint, as it were.");
	output("\n\nThe Mimbrane splits itself to accommodate your own fissure, mimicking its every facet. In your throes of wanton desire and uncomfortable tension, you can’t even discern just how far into your box the creature goes. What you do feel, though, is the parasite melding with your nervous system. There is no pain; only mounting confusion at the mixed messages coming from both your nerve endings and your <i>new</i> nerve endings. For a moment, you can’t picture your pussy. A nebulous region exists in its place, one where a clit is as familiar as a deity’s true intentions.");
	output("\n\nThen nothing. Well, you feel normal. Suddenly you’re fine, albeit laying naked on the jungle floor. Your hands rush to investigate your [pc.pussy], eager to find something amiss. But it’s the same as before you ran into that blanket with a grudge.");
	output("\n\nNo... Further examination clues you in on a new development. Two, in fact. A pair of tiny little bumps sit just above your pussy. You get no response from pressing and prodding at them. But the instant you try and squeeze one of them, a debilitating pain blasts through you, lasting only as long as your fingers are poised to squeeze the blemish. The second they’re free is the second you feel fine again. That’s when you clue in on the barely-discernable lump of flesh outlining a little ways around your vagina. You try and work your way around it, but it feels as if you were trying to pry open a wrinkle.");
	output("\n\nAnother revelation dawns on you: not only are you free of the artificially-induced desire the parasite thrust upon you during your fight, but you feel completely sated of any sexual passion. But you don’t recall experiencing the delightful climax that typically precedes how you feel now. Did it happen at all? It feels slightly wet");
	if(pc.legCount > 1) output(" between");
	else output(" against");
	output(" your [pc.legOrLegs], but now you aren’t even sure if that’s just your head making excuses.");
	output("\n\nYou decide it better to just gather your equipment and move on. Whether or not you climaxed - and can remember it if you did - is secondary to worrying about your latest involuntary traveling companion.");

	createMimbraneEffect("Mimbrane Pussy");
}

//Get Ass Mimbrane
public function attachAssMimbrane():void
{
	// Genderless hoes
	if (!pc.hasCock() && !pc.hasVagina()) output("The barren tract of land across your crotch doesn’t exactly thrill the parasite. The");
	else if (pc.hasStatusEffect("Mimbrane Cock") && !pc.hasStatusEffect("Mimbrane Pussy")) output("With your [pc.cock] already claimed, the");
	else if (pc.hasStatusEffect("Mimbrane Pussy") && !pc.hasStatusEffect("Mimbrane Cock")) output("With your [pc.pussy] already claimed, the");
	else if (pc.hasStatusEffect("Mimbrane Cock") && pc.hasStatusEffect("Mimbrane Pussy")) output("With both your [pc.cock] and [pc.pussy] already claimed, the");
	else output("The");
	output (" Mimbrane sets its tiny sights on your hind quarters. One would assume the little guy wouldn’t make it much farther than your [pc.hips] laying on your back the way you are. But assumptions with alien lifeforms are typically dangerous to make.");
	output("\n\nYour exaggerated panting gets interrupted by surprised gasps as the slick sheet forces itself in between the ground and your [pc.ass]. The parasite would likely have little trouble encompassing your posterior in this position, but your lust-addled mind involuntarily reacts to the wedging as a sign to flip over. You aren’t thinking straight enough to realize that pointing your bottom skyward may be to your disadvantage.");
	output("\n\nThe Mimbrane, however, is ecstatic with its endeavor being made that much easier. The creature scrambles atop your duo of hills only to find that first it must play janitor. It slides and sweeps over your [pc.skinfurscales], removing any of evidence of the jungle from its new home. You feel as if someone is sensually massaging your ass with a wet silk rag. It goes on for several minutes, long enough for you to start digging your hands into the ground to deal with the unrelenting turmoil.");
	output("\n\nIts job complete, the parasite wastes no more time in draping itself atop your [pc.ass], sealing to its every detail. The sentient rag worms its way into your crack and within your [pc.asshole]. It isn’t long before your butt is completely smothered, Mimbrane stretched to easily embrace your");

	if (pc.buttRating() <= 4) output(" average");
	else if (pc.buttRating() <= 8) output(" hefty"); 
	else if (pc.buttRating() <= 16) output(" expansive");
	else output(" titanic");

	output(" trunk. Next, the creature weaves itself into your nervous system, confusing you further as your mind is unable to discern between genuine and relayed feelings. You absentmindedly try and clench your pucker, but get no response. One moment you feel tight, the next moment you feel as if your asshole was a gaping crater.");
	output("\n\nThen you’re relaxed. The sounds of the jungle drag you back from whatever trance you were under. With your wits again on your side, your hands race to your backside, anxious to find anything amiss. All it seems you’re doing is groping your [pc.ass], though. You even go so far as to finger your [pc.asshole], afraid to come across something untoward. Still nothing.");
	output("\n\nBut just as you think all is normal, your hands brush past a couple of tiny bumps sitting smack center above your rear crevice. Manhandling them a little yields no response, but a devastating pain bowls you over the instant you even attempt to squeeze them. The injury doesn’t linger, however. Continuing to brush over the lumps reveals an ever-so-slight ascension of your [pc.skin]. The light seam runs all around outside the perimeter of your ass and up your [pc.hips]. You think you can see it, but it’s hardly noticeable. There’s definitely no way for you to pry it, an action as easy as scraping at your own [pc.skin].");
	output("\n\nIt’s obvious that the Mimbrane got its prize: an ample pair of cheeks with a hole hidden in between them. You aren’t quite sure how you managed to miss the elation that typically comes with the relief of ridding yourself of sexual tension, but it isn’t a concern that lingers long. You gather your gear and set out, lingering between worry and curiosity as to what will come of your posterior parasite.");

	createMimbraneEffect("Mimbrane Ass");
}

//Get Scrotum Mimbrane 
public function attachBallsMimbrane():void
{
	output("Despite your suffering, you can’t help but stutter out a curse to no one, frustrated to succumb to yet another of the blanket-looking parasites. Your [pc.cock] springs to life, moving on its own and frantically chirping to your conqueror. Seems as though the Mimbrane member has prime real estate scoped out for its new friend. You desperately want to reach out and grasp onto your puppeted meat, the parasite’s movement only furthering your sexual hysteria, but you’re oddly paralyzed by the thick, humid smog of lust that lingers from your battle. You can only cast a weary gaze on the [pc.cockNounSimple] shaft, still coated in the Mimbrane’s secretions and glimmering in the light.");
	output("\n\nThe victor heeds the friendly cries of your cock and crawls up your [pc.legOrLegs] towards it. Despite the amped blood flow stiffening your dick, the raging erection is able to bend enough to greet its compatriot in some manner of face-to-face contact. The two cease any remaining pleasantries and get down to brass tacks as the new Mimbrane grasps onto your cock with a couple of its corners and stuffs its miniscule face atop your [pc.cockHead]. Your meat obliges with a steady stream of pre which the parasite anxiously laps down.");
	output("\n\nYour pole acting on its own coupled with the warm, slick parasite enjoying itself makes it all the worse that you can’t seem to organize any voluntary muscle movement. The most coherent urge you can fathom is just wanting to press your aggressor up against your [pc.cock] and rub one out to satiate your pent-up urges. Sadly, it’s taking the same amount of effort just to close your mouth for a second when your panting dries it out. The stuffy, oppressive cloud of craving surrounding you is just too strong.");
	output("\n\nMeager appetite full, the Mimbrane enjoys a few more unintelligible chirps and squeaks with your cock before it backs off. Its attention focuses squarely on your [pc.balls]. Once you feel the parasite cup itself around them it becomes all too clear just what it and its friend had to talk about. Familiar sensations of smothering and crossed nerves flood you yet again, a sign that the parasite is merging onto your [pc.sack]. The manhandling of your jewels as the sheet works its way around them only furthers your craving to tend to their payload.");
	output("\n\nYou re-experience the nebulous feeling that accompanies the integration of a Mimbrane into your nervous system. Unable to peer your head up at the action, your inner perception of your sack fluctuates like a boat caught atop a nervous ocean. And – just as before – you suddenly feel fine. The humidity vanishes, your lust subsides, and your [pc.balls] look as they did before. You know better at this point, though, quickly discovering the pair of meager lumps disguising the Mimbrane’s eyes sitting front and center on your coin purse.");
	output("\n\nWhat you hadn’t expected was a third, slightly larger bump sitting below and between them. Without an orifice to re-appropriate as its own, it would seem that the Mimbrane has maintained its mouth. So you assume, anyway. Neither of your parasitic pals seem all that interested in blowing their covers to you at the moment as it is. You gather your equipment and set off, eager to explore this mystery further at a later time.");

	createMimbraneEffect("Mimbrane Balls");
}

//Get Breasts Mimbrane 
public function attachBoobMimbrane():void
{
	output("Through the uncomfortable humidity and insatiable sex drive, a tiny voice far back in your head ponders to itself. Falling victim to yet another Mimbrane makes it question whether or not you even tried to get around this. But the voice fucks off into a forgotten oblivion, hushed by your agony and desire to know just where the next contestant will wind up. After exchanging pleasantries with your appropriated body parts, the parasite glides along your body until it’s right atop your [pc.fullChest]. No hint of hesitation lies in the creature.");
	output("\n\nYou’re granted a short stare from your conqueror while its body stretches to encompass");
	if (pc.breastRows.length > 1 || pc.breastRows[0].breasts > 2) output(" all");
	else output(" both");
	output(" of your jiggling");
	if (pc.biggestTitSize() <= 4) output(" hilltops");
	else if (pc.biggestTitSize() <= 8) output(" mountains");
	else output(" planets");
	output(". You can’t get a good read on what it’s thinking, but you’re certain that there is some train of thought going on in there. Any breakthroughs into a sentient parasite’s inner machinations vanish as quickly as the creature’s face once it sinks back into the wriggling sheet.");
	output("\n\nThere’s a desperate inclination to at least run your hands along the glistening topside of the fiend. The thought of rubbing the oily pseudo-cloth across your torso isn’t enough to break free of the stuffy eroticism that pins you to the jungle floor. The form of your chest bumps are clearly visible now, the Mimbrane sealing its form over yours. You have a much nicer vantage point of the parasite’s handiwork now that it’s right in front of you. Replicas of your [pc.nipples] form along its surface. The creature easily slides itself over every square inch of breast flesh.");
	output("\n\nA moist pink replica of your chest is all that remains of the Mimbrane. You can’t admire it for too long before the familiar tinge of the creature weaving its way into your nervous system seeps into your mind. Again you feel the unusual, nebulous sensation of not exactly having a grasp on what form your body’s in. But through squinted eyes covered in sweat, you can make out the wobbling silhouette of your [pc.chest]. They’re still there. But things feel off.");
	output("\n\nThen everything’s back to normal. Did you black out or something? The instantaneous ending of the multiple sensations and urges and feelings wracking away at you is just as jarring and out of place as it always is. From your point of view, its as if everything just happened in less time than the blink of an eye. But by now you’re certain there’s more to it.");
	output("\n\nYour next course of action is to examine your chest to try and find where the Mimbrane is hiding its eyes. The first assumption is around one of your [pc.nipples], but you don’t discover anything new. It takes a little bit of fondling before you find the two little lumps square center above your cleavage. Guess nature just can’t resist symmetry. You also miss the practically invisible bulge of [pc.skin] running around the perimeter of your knockers, presumably marking where the parasite ends and you begin. As always, it’s easy to miss and you have no hope of prying the thing off of you.");
	output("\n\nYou gather up your equipment and head off with the new addition to your close family.");
	
	createMimbraneEffect("Mimbrane Boobs");
}

//Get Hands Mimbranes
public function attachHandMimbrane():void
{
	//First hand
	if (!pc.hasStatusEffect("Mimbrane Hand Left") && !pc.hasStatusEffect("Mimbrane Hand Right"))
	{
		output("Your conqueror is actually a little confused. All of its prime targets have been taken! But it would seem that your parasitic attachments are doing their damnedest to keep their friend from being discouraged. The constant movement and noise around your body struggles against the haze that’s locked you into a stuffy bout of sensual passion. Trying to stay current on the Mimbrane’s actions is proving to be a difficult ordeal.");
		output("\n\nThat’s when a slick, smooth touch of your palm garners your attention. The parasite is prodding at your hand, seemingly examining it. Though you lack the coherence to whip your arm away, you’re at least able to clench your fingers. Your grip isn’t quite up to your full potential, but you do manage to snag the Mimbrane’s inquisitive corner. It doesn’t startle the creature, however, much to your disappointment. If anything, the direct contact with the parasite’s oily top side is only making your inner turmoil worse.");
		output("\n\nNo, instead the Mimbrane casually wraps the rest of its body around your weak fist. You make a weak gesture, relinquishing your grapple to try and move your fingers in some useless attempt to escape the parasite. All you manage to do is make it easier for it to work its way around your digits and onto your palm. Falling back to making another fist is your final recourse, unable to move or react intelligibly enough to effectively defend yourself.");
		output("\n\nThe gesture proves meaningless, and soon it appears you’ve found yourself a wriggling glove of sorts, grasped firmly onto your wrist. Next comes the recognizable sensation of the Mimbrane integrating into your nervous system. Though you can’t get a coherent feeling from them, you can at least still move your fingers. Soon, the moist, warm feeling of entrapment is replaced with the comparatively cool breeze of the jungle.");
		output("\n\nYou’ve gotten rather used to this process by now. The jolt of normalcy isn’t even a shock anymore. The hunt for the creature’s eyes and mouth doesn’t even take long; a triage of tiny bumps lay concealed square center on your [pc.skinTone] palm. You rub your other thumb over them, a tad surprised to see how much more durable the typically sensitive additions are. You suppose the Mimbrane has a grasp on what a hand actually is and has modified itself accordingly.");
		output("\n\nAs you reach over for your gear, anxious to keep moving, something dawns on you. You run your thumb back over the parasitic palm again. It’s actually moist. But this isn’t the remnants of your opponent. It looks like");
		if (pc.hasCock()) output(" cum");
		else if (pc.hasVagina()) output(" girl spunk");
		else output(" it came from you");
		output(". Maybe you aren’t quite through wondering just what goes on when a Mimbrane couples onto its prey....");

		createMimbraneEffect("Mimbrane Hand Left");
	}
	//Second hand
	else if ((pc.hasStatusEffect("Mimbrane Hand Left") && !pc.hasStatusEffect("Mimbrane Hand Right")) 
		|| (!pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right")))
	{
		output("It’s a Mimbrane soiree and everyone’s invited! You think you said that out loud, but honestly aren’t sure. You’ve fallen victim to these parasites enough times now to start speculating whether or not you’re even trying anymore. Maybe you enjoy it. Maybe it’s really hard for you to resist them when they start sweating and attacking you uncontrollably. Maybe nurturing these creatures is some sort of penance for your father’s sins. Maybe you’ve been suffering from a series of bad days that just so happen to coincide with every moment you run into a Mimbrane.");
		//output("\n\n...It’s hard being introspective when you’re hornier than a cactus and stuffier than a sauna.");
		output("\n\nThe creature brushes up against your other hand, the one free of parasitic control. You had a good feeling that was where it would wind up.");
		output("\n\nYou don’t even bother looking at it – trying to pierce through the haze that’s pinned you down to fight it off. Did your other hand just direct it or something? Who knows. The Mimbranes always seem to get riled up when they run into a new roommate. Experiencing various parts of your body acting of their own accord has become second nature to you by now.");
		output("\n\nYou can’t feel your hand anymore. The parasite must have already smothered your other hand and has moved onto that integration. Does it turn you on still? Maybe. It’s hard to say. It probably would have been faster had you just gone limp the instant the damn thing fell out of the sky at you.");
		output("\n\nSeems like you’ve got a bit of angry lust for no good reason. Or you’re frustrated. Or just confused. Or– oh, things are back to normal. That same normal you’ve run into " + num2Text(attachedMimbranes() + 1) + " times now. You look down at your hand; three bumps are arranged on your palm same as they are on your other one.");
		output("\n\nWith your wits back with you, a heavy sigh accompanies the gathering of your equipment. Best not to dwell on this further.");

		if (pc.hasStatusEffect("Mimbrane Hand Left")) createMimbraneEffect("Mimbrane Hand Right");
		else if (pc.hasStatusEffect("Mimbrane Hand Right")) createMimbraneEffect("Mimbrane Hand Left");
	}
	else
	{
		throw new Error("Derp you dun fucked up.")
	}
}

//Get Feet Mimbranes 
public function attachFootMimbrane():void
{
	//First foot
	if (!pc.hasStatusEffect("Mimbrane Foot Left") && !pc.hasStatusEffect("Mimbrane Foot Right"))
	{
		output("...Again! You’ve succumbed again! Your body is covered in these things! Where will this Mimbrane go? Do you even care?");
		output("\n\nYou’ve honed the act of retreating back to your subconscious into an art at this point. Anything to escape the repeated anguish these Mimbranes throw you under. You can barely even feel the parasites manipulating your body in all sorts of strange and unnatural ways. It’s the same as always, you figure.");
		output("\n\nYou’ve given up trying to figure out why you keep losing to what amounts to a rag in the wind. You can’t concentrate immediately after the fact, and when the parasite’s on you, you’re done caring. Are you even frustrated anymore? When something becomes so commonplace, can someone continue to act surprised?");
		output("\n\nThe commotion calms down, leaving only your labored panting to your ears. A moist, deft touch lands on your [pc.foot], snapping you out of the odd bout of self-pity. You can’t get a good view over your struggling [pc.fullChest], but it would appear the parasite has opted to attach itself to your foot. Oily coverings weave their way between your toes, along your arch and up your ankle. As always, little time transpires before your extremity is sealed within the creature’s undulating, form-fitting grip.");
		output("\n\nYou cease paying attention to the little thing once the familiar feeling of it weaving its way into your nervous system kicks in. The sensation of forgetting how your body part is constructed is old hat, no matter how bizarre it feels each time. It’ll be over soon anyway; may as well try and focus on something beyond the excruciating humidity and torrents of desire...");
		output("\n\n...Usually it can be difficult to get even the vaguest semblance of a clear head when you’re thrown into a rut like this. Sure, your body still feels like it wants to penetrate and be penetrated and do anything else it can to get through these anxious times. But here, safe in your mind, you’ve at least gotten better at not <i>thinking</i> like a psychopathic pervert. Maybe the repetition of being artificially driven to want to bang something isn’t doing as well of a job as it once did?");
		output("\n\nAny further exploration into the topic flutters away the instant things return to – you guessed it – normal. The normal always hits you like an oncoming car out of nowhere. The normal is always the anticlimax that leaves you feeling refreshed and unfulfilled. The normal is getting to be frustratingly abnormal.");
		output("\n\nYour idle thoughts are getting to be noxious, you fear. You instead think to grasp your [pc.foot] in your hand, curious to hunt down the three bumps at the bottom of the cereal box. The two eye bumps are easy enough to find centered right above your middle toe – you’ve gotten good at this, sadly. But the third tiny bulge is actually hidden underneath that same toe. Another instance of symmetry, you figure; the Mimbranes just must be naturally attracted to it.");
		output("\n\nYou begin to start getting anxious over when your other foot will find its counterpart parasite, but perish the thought before it can germinate. There’s enough on your plate already with your " + num2Text(attachedMimbranes() + 1) + " additional mouths to feed. You take your equipment and leave.");

		createMimbraneEffect("Mimbrane Foot Left");
	}
	//Second Foot
	else if ((pc.hasStatusEffect("Mimbrane Foot Left") && !pc.hasStatusEffect("Mimbrane Foot Right")) 
		|| (!pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right")))
	{
		output("You don’t even know if your body is your own anymore. Not when this happens, anyway. Everything under Mimbrane control is having a picnic greeting the latest arrival to Casa De La " + pc.short + ". It’s the same as always. You know it’ll go to your free foot. Better to just put it all out of your head and wait for “normal.”");
		output("\n\nStaring up through the pink haze surrounding you is the jungle canopy. Tall trees wobble lightly in the breeze. Scant beams of");
		if (hours <= 6 || hours >= 18) output(" moonlight");
		else output(" sunlight");
		output(" burst their way in through the brush. Nature is oblivious to your plight.");
		output("\n\nThe Mimbrane wraps around your [pc.foot].");
		output("\n\nThere don’t seem to be very many other signs of wildlife around at the moment. The involuntary movement of your body paired with the unusual sounds produced by the Mimbranes must be keeping them at bay. It’s too bad; now would be the perfect time for a little birdwatching.");
		output("\n\nThe Mimbrane weaves into your nervous system.");
		output("\n\nIt’s so hot. It’s always hot when you lose to these things. But when you’re absorbing nature like this, it’s hard to ignore every facet of it, regardless of how it came about. Sure, the lust fog surrounding you weighs on you like a steaming bag of bricks, but it isn’t like the jungle is that much better typically. How many creatures must love living here, you wonder.");
		if (flags["TIMES_MET_VENUS_PITCHER"] != undefined) output(" Do the venus pitchers get many catches out in the middle of nowhere like this?");
		output("\n\nYou can’t feel your [pc.foot].");
		output("\n\nMaybe if it were winter it wouldn’t be as uncomfortable around here. Surely most of the unsavory types wouldn’t enjoy even a slight drop in temperatures. It’s doubtful that the seasons make much of a difference around here, though, you figure. That seems to be how jungles usually work, right? Maybe it was foolish to imagine otherwise.");
		output("\n\nThings are back to normal.");
		output("\n\nThat’s it. Panting’s gone. Your desire to fuck something is back to your more sustainable levels. The jungle feels like its typical self. You don’t even bother examining your new parasite. There’s no need. You’ve already gotten used to feeding a foot, as it were. Same as the rest of your body. This is common practice for you at this point.");
		output("\n\nYou take your equipment and go, refusing to dwell on what transpired.");

		if (pc.hasStatusEffect("Mimbrane Foot Left")) createMimbraneEffect("Mimbrane Foot Right");
		else if (pc.hasStatusEffect("Mimbrane Foot Right")) createMimbraneEffect("Mimbrane Foot Left");
	}
	else
	{
		throw new Error("You done fucked up even more!");
	}
}

//Get Head Mimbrane
public function attachFaceMimbrane():void
{
	//Requires all attached Mimbranes be minimum level 2 trust
	// Shit should already have been checked in the attachment scene router.
	output("It’s as routine as morning wood. You’re flat on your back, panting your brains out, covered in parasitic sweat that is contending with your own. The sound of the Mimbranes all around your body happily conversing with one another and the new arrival is as loud as ever. You don’t pay the creatures much mind as they manipulate your paralyzed body; it’s easier to just wait out for “normal” to drop in when you’re blissfully ignorant of the stress. For once, not a hint of concern has penetrated your mind. Though the body may be unable to resist the attack of the parasites, your mind has learned how to deal with the dilemma.");
	output("\n\nNature seems especially interesting again today. The pink haze isn’t as thick as usual, giving you a clearer sight at the Mimbrane hovering over your face.");
	output("\n\nWait. What?");
	output("\n\nYour mind is dragged back to reality. You’re fully aware again, right in the moment. The odd sensation of being watched by a multitude of eyes is upon you. But nothing is more apparent than the Mimbrane staring you right in the eyes. The parasite’s front two corners are perched on the sides of your face, letting the creature suspend the best representation it has of a face a good distance above yours. Your labored breathing pushes the parasite a little with each exhale and sucks in a little of its haze with each inhale.");
	output("\n\nWhat does it intend to do? Have the number of Mimbranes gotten high enough for them to claim dominance over your body? You start to worry, but the look in the Mimbrane’s face is inquisitive. It’s as if it’s waiting for a response. The parasite taps on your [pc.face] again, tracing your [pc.lips] with one of its corners while chirping lightly at you. There’s no way in hell your microsurgeons can translate that for you...");
	output("\n\nThat’s when you recall the codex! Mimbranes naturally avoid the face, instinctively afraid that a position anywhere near a host’s sensitive head will spell doom for them. This one seems reluctant to break that inbred habit. So then what is it doing?");
	output("\n\nYou think for a moment, eyes darting around your close-up champion, its face tilted to one side to only further appear as if awaiting a response. The rest of the Mimbranes on your body seem to think you’re alright... Perhaps they goaded this one into testing its luck? That would explain the tense feeling you’re getting about being watched. But rather than just go whole hog on your head, it would seem this parasite at least wants to try and get approval from you before working against its instincts.");
	output("\n\nIt makes sense to you anyway.");
	output("\n\nIt’s been awhile since you haven’t abandoned your body when it’s in a state like this. Shuddering from the humidity and thrust-upon lust from these parasites. Getting words out proves to be difficult. Through numerous stutters, pants and restarts, you ask the parasite cautiously perched atop you if it wants to attach itself on your head. The Mimbrane moves in a fashion that appears to be nodding. But it continues staring at you.");
	output("\n\nLooks like the decision is up to you.");

	//[Go ahead][No!]
	clearMenu();
	addButton(0, "Go ahead", acceptFaceMimbrane);
	addButton(1, "No!", refuseFaceMimbrane);
}

public function refuseFaceMimbrane():void
{
	clearOutput();
	showMimbrane();

	//[No!]
	output("You’re wary of letting the Mimbrane cover your head, unsure how this final measure would pan out for you. You’re at least compelled to spit out an apology with your decline. It’s weird to have some hint of conversation with what you figured was just an animal.");
	output("\n\nThe parasite scoots backwards from you, talking amongst your puppeted body parts. You think it’s disappointed, but there’s really no way to tell. Especially not when you’re feeling as horny and norma–-");
	output("\n\nNormal. Normal’s burst back onto the scene. It’s a bit more of a shock this time. Your conqueror has vanished and your body is pre-savaged. You double check your head to make sure the parasite didn’t get on it. There aren’t any unusual bumps or sensations. The assumption was that the blink from rut to right was a byproduct of a Mimbrane latching onto you. Now you don’t know what to think again.");
	output("\n\nThe question simmers while you gather your equipment and leave.\n\n");

	CombatManager.genericLoss();
}

public function acceptFaceMimbrane():void
{
	clearOutput();
	showMimbrane();

	//[Go ahead!]
	output("Whether it’s because you’re feeling adventurous or just succumbing to the rut you thought you had become accustomed to, no one can say. But you nod your head to the anxious Mimbrane, stuttering out a labored “Sure.” The parasite exchanges a few more unintelligible squeaks with its cohorts, possibly to confirm what it’s about to do. Then it smothers your [pc.face], forcing you to react by slamming your eyes shut.");
	output("\n\nSmooth, slick skin wraps all around your head. It’s as if someone were wrapping a hot, wet towel around your head. Your involuntary panting strains at finding air, instead sucking wet flesh into your mouth and nose. Warm waves meld to your every contour, encasing your head completely in short time. Just as panic begins to sinks in, the fleshy cocoon splits open at your orifices, prompting a deep gasp. The Mimbrane is over your lips and fades seamlessly into your mouth. It’s hard to tell where it ends anywhere the parasite has penetrated your head. You try and open your eyes as well, but are less successful in that endeavor; your eyelids refuse to move.");
	output("\n\nThe electrifying sensation of the creature weaving its way into your nervous system is next. Your reaction would be to grasp your melon with your hands, but the extremities feel as if they’re under an immense weight. It’s no easier to move now than it ever has been any other time you lost to a Mimbrane.");
	output("\n\nThe sensation of not feeling your head is confusing. The smothered, moist titillation is more intense than what you experienced for any other bonding to your body, and now it’s competing with signals telling your brain the comparatively cool air is breezing past your skin. Your eyelids suddenly obey, and your head settles back its normal position.");
	output("\n\nNormal.");

	if (pc.hasCock())
	{
		output("\n\nBut you’re still panting. Still horny. Still hot, still paralyzed, still confused. This is anything but normal now! Not snapping free of this hell is the most abnormal thing ever in this process that you had once thought you had become so accustomed to. Now what?");
		output("\n\nThe light red haze crushing you starts to dissipate. Actually... it seems to be sucking into you. More accurately, the Mimbranes are absorbing it! Your whole body feels as if it’s taking in a deep breath, somehow. Soon, the cloud is clear, and with it goes the boiling humidity! That’s one nuisance down. The next is your searing libido, aching for release. What would be the best way to take care of that?");
		output("\n\nYour rock-hard [pc.cock] knows, apparently; it’s stroking itself! The Mimbrane member is standing at full attention, skin applying pressure in vertical waves. From base to tip and back, going from tinge to more than a hand could grasp, each stroke is unique. The parasite is working your cock with pinpoint precision. There’s little preamble to be had; by now it knows your penis down to the last square nanometer. [pc.Cum]");

		if (pc.cumQ() <= 100) output(" spurts");
		else if (pc.cumQ() <= 300) output(" bursts");
		else if (pc.cumQ() <= 600) output(" blasts");
		else output(" unnaturally explodes");
		output(" forth.");

		output("\n\nTypically your body would be getting into the act, but your back doesn’t even get the chance to arch. Your hands – controlled by their own Mimbrane coverings – bolt for the [pc.cumColor] fountain. Fingers rigid as steel work to contain the fruit of your loins in the general vicinity, strangely enough. It appears as if they don’t want to waste any of the precious cargo to the surrounding wilderness. By the time they’re – and consequently you – finished, the majority of your jism is strewn about your midsection and torso.");
		output("\n\nYour body goes into a sudden uproar of noisy squeaks and chirps! Your [pc.lips] move on their own as well, reminding you of the latest addition to your merry band. Indeed, the skin around your head feels as if it were wriggling about ever so slightly, making for a rather peculiar experience. Seems everyone is amped to be fed, and your puppeted hands are happy to oblige. Smatterings of [pc.cum] are distributed around you, smeared anywhere a Mimbrane mouth may be.");
		output("\n\nThere’s a hypothesis to be had here. Though you can’t entirely explain it, it would seem that your jolt to “normalcy” was the period in which your aggressors would feed on your liquid lust. Mimbranes naturally act in methods that preserve their secrecy on a host. When someone loses to one of the parasites, it becomes easy to simply overwhelm them in the parasite’s natural funk. A momentary lapse in consciousness doesn’t seem all that farfetched when one is already sweaty, hot and suffering from sexual yearning beyond perceivable belief.");
		output("\n\nBut the Mimbrane that <i>“asked”</i> to attach itself to your head must be a sign that the collective trusts you. Their confidence in you is strong enough that they can overcome their instinct to knock you out and instead let you experience their feeding frenzy. “Frenzy” is how it feels, too, with your body acting on the whims and volitions of its puppet masters. A duo of fingers deliver a dollop of warm sustinence to your eager [pc.lips]. The [pc.cumFlavor] flavor is lost to you, however; the morsel is absorbed into your lips, which squeak happily in thanks.");
		output("\n\nThe Mimbranes satiated, they begin to calm down. Though they’re incapable of wrestling away complete control of your body from you, awe was enough to render you essentially paralyzed up until this point. You touch your fingers to your lips, finding no trace of their treat. But they do suddenly kiss your tender touch, forcing a breathless laugh out of you. Digits return to find a duo of small bumps right above your upper lip. You weren’t going to be completely satisfied until you found those eyes...");
		output("\n\nA veil of complacency has been lifted this day. The Mimbranes certainly seem content, and you even got a peek into some of their more rare tendencies. Sure, they may be driven to feed and survive more than anything – heaven forbid anyone hear about how fast they jerked one out of you – but there seems to be some semblance of companionship in the faux skin.");
		output("\n\nRejuvenated, you gather your equipment and venture forth a bit happier than you were before.");
	}
	else if (pc.hasVagina())
	{
		output("\n\nBut you’re still panting. Still horny. Still hot, still paralyzed, still confused. This is anything but normal now! Not snapping free of this hell is the most abnormal thing ever in this process that you had once thought you had become so accustomed to. Now what?");
		output("\n\nThe light red haze crushing you starts to dissipate. Actually...it seems to be sucking into you. More accurately, the Mimbranes are absorbing it! Your whole body feels as if it’s taking in a deep breath, somehow. Soon, the cloud is clear, and with it goes the boiling humidity! That’s one nuisance down. The next is your searing libido, aching for release. What would be the best way to take care of that?");
		output("\n\nYour [pc.pussy] knows, apparently; it’s going crazy! The Mimbrane folds are exciting themselves into a soaked frenzy.");
		if(pc.hasClit()) output(" Even your [pc.clit] is stimulating itself, flesh pushing and teasing the love button with exacting precision.");
		output(" The parasite knows itself – and by extension you – down to seemingly every last cell. A");

		if (pc.wetness() < 2) output(" splash");
		else if (pc.wetness() <= 3) output(" wave");
		else output(" torrent");
		output(" of femspunk gushes out your gash.");

		output("\n\nTypically your body would be getting into the act, but your back doesn’t even get the chance to arch. Your hands – controlled by their own Mimbrane coverings – bolt for the feminine fountain. Fingers rigid as steel work to contain the fruit of your loins in the general vicinity, strangely enough. It appears as if they don’t want to waste any of the precious cargo to the surrounding wilderness. By the time they’re finished, the majority of your excitement is strewn about your midsection and groin.");
		output("\n\nYour body goes into a sudden uproar of noisy squeaks and chirps! Your [pc.lips] move on their own as well, reminding you of the latest addition to your merry band. Indeed, the skin around your head feels as if it were wriggling about ever so slightly, making for a rather peculiar experience. Seems everyone is amped to be fed, and your puppeted hands are happy to oblige. Smatterings of pussy juice are distributed around you, smeared anywhere a Mimbrane mouth may be.");
		output("\n\nThere’s a hypothesis to be had here. Though you can’t entirely explain it, it would seem that your jolt to “normalcy” was the period in which your aggressors would feed on your liquid lust. Mimbranes naturally act in methods that preserve their secrecy on a host. When someone loses to one of the parasites, it becomes easy to simply overwhelm them in the parasite’s natural funk. A momentary lapse in consciousness doesn’t seem all that farfetched when one is already sweaty, hot and suffering from sexual yearning beyond perceivable belief.");
		output("\n\nBut the Mimbrane that <i>“asked”</i> to attach itself to your head must be a sign that the collective trusts you. Their confidence in you is strong enough that they can overcome their instinct to knock you out and instead let you experience their feeding frenzy. “Frenzy” is how it feels, too, with your body acting on the whims and volitions of its puppet masters. A duo of fingers deliver a dollop of sustenance to your eager [pc.lips]. The feminine flavor is lost to you, however; the morsel is absorbed into your lips, which squeak happily in thanks.");
		output("\n\nThe Mimbranes satiated, they begin to calm down. Though they’re incapable of wrestling away complete control of your body from you, awe was enough to render you essentially paralyzed up until this point. You touch your fingers to your lips, finding no trace of their treat. But they do suddenly kiss your tender touch, forcing a breathless laugh out of you. Digits return to find a duo of small bumps right above your upper lip. You weren’t going to be completely satisfied until you found those eyes...");
		output("\n\nA veil of complacency has been lifted this day. The Mimbranes certainly seem content, and you even got a peek into some of their more rare tendencies. Sure, they may be driven to feed and survive more than anything – heaven forbid anyone hear about how fast they pushed you to climax – but there seems to be some semblance of companionship in the faux skin.");
		output("\n\nRejuvenated, you gather your equipment and venture forth somewhat happier than you were before.");
	}
	else
	{
		output("\n\nAnd that’s that. Suddenly, you’re returned to that tranquil yet jarring peace that you’ve become oh-so-accustomed to. Though something bothers you this time. For no fathomable reason, it feels as if you missed out on something. You dwell on that thought for a moment, but nothing more substantial roots. Maybe you’re imagining things.");
		output("\n\nYou put your fingers to your mouth, surprised when your [pc.lips] suddenly kiss them! Seems the Mimbrane on your face is quite content, and isn’t anxious to hide away from you quite so soon. A breathless laugh escapes you, taken aback by the cute little show of affection. Fingers return and find a couple of little bumps just above your upper lip. You weren’t going to be leaving before you knew where those eyes were, after all.");
		output("\n\nRejuvenated, you gather your equipment and venture forth somewhat happier than you were before.");
	}
	output("\n\n");
	createMimbraneEffect("Mimbrane Face");

	CombatManager.genericLoss();
}

//No Room for Mimbrane 
public function noRoomForDishcloths():void
{
	output("Much to the Mimbrane’s chagrin, it seems there’s simply no room for it on your body! You’re hoping it’ll leave so you can at least get out of its humid, paralyzing cloud of insidious behavior, but it seems to be talking again to your Mimbranes. You wonder what it–");
	output("\n\n...It’s gone. So is any inkling of sexual fervor. You glance around a little, surprised by the relative peace that’s attacked you out of nowhere. You snatch up your gear and get on your way before the parasite decides to get creative!");
}

// v1 == trust
// v2 == last fed
// v3 == feed level/counter
// v4 == reproductive cycle counter
public function mimbraneStatusString(effectName:String):String
{
	var trustLevel:int = pc.statusEffectv1(effectName);
	var feedLevel:int = pc.statusEffectv3(effectName);
	var reproductionCounter:int = pc.statusEffectv4(effectName);
	var daysSinceLastFed:int = pc.statusEffectv2(effectName);

	var msg:String = "";
	msg += "<b>" + effectName + ":</b>";
	msg += "\n\tLevel " + trustLevel + " Trust.";
	msg += "\n\t" + String(feedLevel) + " Feedings.";

	if (!mimbraneDebug)
	{
		if (daysSinceLastFed > 0)
		{
			msg += " <i>" + daysSinceLastFed + " Day" + (daysSinceLastFed == 1 ? "" : "s") + " since last fed.";
			if (daysSinceLastFed >= 7) msg += " <b>Hungry.</b>";
			msg += "</i>";
		}
	}
	else
	{
		msg += "\n\t" + daysSinceLastFed + " Days since last fed.";
		msg += "\n\t" + reproductionCounter + " times reproduced.";
	}

	return msg;
}

//Mimbrane Menu
//Accessible on the ship. Options only appear if available
public function mimbranePrivateLocation():Boolean
{
	if(InShipInterior()) return true;
	if(InRoomWithFlag(GLOBAL.PRIVATE)) return true;
	if(InPublicSpace()) return false;
	if(rooms[currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL)) return false;
	if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP)) return false;
	/*
	if(pc.exhibitionism() >= 66) return true;
	return false;
	*/
	return true;
}

//List of Mimbranes, showing Trust Level, Number of Feedings, and Enabled Toggles
//Example:
public function mimbraneMenu():void
{
	clearOutput2();
	showMimbrane(true);
	clearGhostMenu();
	
	var totalMimbs:Number = attachedMimbranes();
	var publicNotice:String = "You cannot do this action outside of your ship or in the open.";
	// update tooltip
	if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP)) publicNotice = "Masturbating here would be impossible.";
	else if(InPublicSpace()) publicNotice = "Due to U.G.C. laws against foreign parasites, you cannot perform this action in public.";

	output2("You currently have " + totalMimbs + " Mimbrane");
	if (totalMimbs > 1) output2("s");
	output2(" attached to you.");

	output2("\n");

	for (var i:int = 0; i < mimbraneEffects.length; i++)
	{
		if (pc.hasStatusEffect(mimbraneEffects[i]))
		{
			output2("\n" + mimbraneStatusString(mimbraneEffects[i]));
		}
	}

	output2("\n\n");

	// Fap/feeding stuff
	if (hasFeedableMimbranes() && mimbranePrivateLocation())
	{
		if (pc.lust() < 33)
		{
			// Gendered, not enough lust to fap
			if (pc.hasCock() || pc.hasVagina())
			{
				output2("You have " + (totalMimbs == 1 ? "a Mimbrane that is" : "Mimbranes that are") + " ready to feed. However, you aren’t turned on enough to get your juices flowing!");
			}
			// Genderless, not enough lust to fap
			else
			{
				output2("You have " + (totalMimbs == 1 ? "a Mimbrane that is" : "Mimbranes that are") + " ready to feed. However, you have no means to feed " + (totalMimbs == 1 ? "it" : "them") + "!")
			}

			addDisabledGhostButton(0, "Penis Feed","Penis Feed","You need to have a dick and the libido to get it up to do this.");
			addDisabledGhostButton(1, "Vaginal Feed","Vaginal Feed","You need to have a pussy and the libido to get it going to do this.");
		}
		else
		{
			// FAPS
			output2("You have " + (totalMimbs == 1 ? "a Mimbrane that is" : "Mimbranes that are") + " ready to feed.");
			
			//[Feed With Cock][Feed With Pussy]
			if (pc.hasCock()) addGhostButton(0, "Penis Feed", feedMimbranesWithCock, undefined, "Penis Feed", "Feed attached Mimbranes using your penis.");
			else addDisabledGhostButton(0, "Penis Feed","Penis Feed","You don’t have a penis to use.");
			if (pc.hasVagina()) addGhostButton(1, "Vaginal Feed", feedMimbranesWithPussy, undefined, "Vaginal Feed", "Feed attached Mimbranes using your vagina.");
			else addDisabledGhostButton(1, "Vaginal Feed","Vaginal Feed","You don’t have a vagina to use for this.");
		}
	}
	else if (hasFeedableMimbranes() && !mimbranePrivateLocation())
	{
		output2("Maybe if you were somewhere a little more private, you could ensure your Mimbranes were properly fed....");
		
		addDisabledGhostButton(0, "Penis Feed","Penis Feed", publicNotice);
		addDisabledGhostButton(1, "Vaginal Feed","Vaginal Feed", publicNotice);
	}
	//If all Mimbranes are full
	else
	{
		if(mimbranePrivateLocation())
		{
			output2("You try and interact with your Mimbrane");
			if (attachedMimbranes() > 1) output2("s");
			output2(", but");
			if (attachedMimbranes() == 1) output2(" it doesn’t seem");
			else output2(" they don’t seem");
			output2(" to be interested.");
			if (attachedMimbranes() == 1) output2(" It");
			else output2(" They");
			output2(" must be full.");
			
			addDisabledGhostButton(0, "Penis Feed","Penis Feed","You don’t have any mimbranes wanting to eat at the moment.");
			addDisabledGhostButton(1, "Vaginal Feed","Vaginal Feed","You don’t have any mimbranes wanting to eat at the moment.");
		}
		else
		{
			output2("If you were somewhere a little more private, you could interact with your mimbrane");
			if (attachedMimbranes() > 1) output2("s");
			output2(", but");
			if (attachedMimbranes() > 1) output2(" none seem");
			else output2(" it doesn’t seem");
			output2(" that hungry.");
			addDisabledGhostButton(0, "Penis Feed","Penis Feed", publicNotice);
			addDisabledGhostButton(1, "Vaginal Feed","Vaginal Feed", publicNotice);
		}
	}

	// Ability toggles

	//Unlock Sweating
	//Unlocked when any Mimbrane hits level three trust. Occurs once, a few hours after hitting level three. Starts toggled off. Toggle disappears if no Mimbranes at level three or four exist.
	if (highestMimbraneTrust() >= 3)
	{		
		output2("\n\n<b>You’ve unlocked the ability to toggle sweating for any Mimbranes at Level 3 Trust or higher.</b>");

		var sweatText:String = "Sweat: ";
		if (flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] == undefined)
		{
			sweatText += "On";
			output2("\nMimbrane sweating is currently <b>Disabled</b>.");
		}
		else
		{
			sweatText += "Off";
			output2("\nMimbrane sweating is currently <b>Enabled</b>.");
		}

		addGhostButton(5, sweatText, toggleMimbraneSweat);
	}
	else
	{
		addDisabledGhostButton(5, "Toggle Sweat", "Toggle Sweat", "Your Mimbrane trust level is not high enough to use this.");
	}

	// Spit attacks
	if (highestMimbraneTrust() >= 4)
	{
		output2("\n\n<b>You’ve unlocked the ability to toggle spit attacks for any Mimbranes at Level 4 Trust.</b>");

		var spitText:String = "Spit: ";
		if (flags["PLAYER_MIMBRANE_SPIT_ENABLED"] == undefined)
		{
			spitText += "On";
			output2("\nSpit attacks are currently <b>Disabled</b>.");
		}
		else
		{
			spitText += "Off";
			output2("\nSpit attacks are currently <b>Enabled</b>.");
		}

		addGhostButton(6, spitText, toggleMimbraneSpit);
	}
	else
	{
		addDisabledGhostButton(6, "Toggle Spit", "Toggle Spit", "Your Mimbrane trust level is not high enough to use this.");
	}

	// Toggle Swelling
	if (pc.hasPerk("Mimbrane Symbiosis"))
	{
		output2("\n\n<b>You’ve unlocked the ability to adjust the swelling appearance of specific Mimbrane-attached body parts.</b>");
		
		addGhostButton(7, "Swelling", toggleMimbraneSwellingMenu);
	}
	else
	{
		addDisabledGhostButton(7, "Swelling", "Swelling", "Your Mimbrane attachment is not strong enough to use this.");
	}

	// Face customisation
	if (pc.hasStatusEffect("Mimbrane Face"))
	{
		addGhostButton(10, "Face Hide", function():void {
			clearOutput2();
			flags["MIMBRANE_FACE_APPEARANCE"] = undefined;
			output2("You convince the Mimbrane on your head to just make the bumps concealing its eyes to appear like your normal [pc.skinNoun] tone.");
			clearGhostMenu();
			addGhostButton(0, "Back", mimbraneMenu);
		});

		addGhostButton(11, "B.Marks", function():void {
			clearOutput2();
			flags["MIMBRANE_FACE_APPEARANCE"] = 1;
			output2("You ask the Mimbrane on your [pc.face] to disguise its eye bumps to look like beauty marks.");
			clearGhostMenu();
			addGhostButton(0, "Back", mimbraneMenu);
		});

		output2("\n\nThe Mimbrane covering your face has offered to disguise itself to your liking.");
		if (flags["MIMBRANE_FACE_APPEARANCE"] == undefined)
		{
			addDisabledGhostButton(10, "Face Hide");
			output2("\nIt’s currently hiding itself as much as possible.");
			output2("\nYou could ask it to disguise its eyes as beauty marks.");
			if (pc.statusEffectv1("Mimbrane Face") >= 4) output2("\nYou could also ask it to resemble a pair of lip piercings.");
		}
		else if (flags["MIMBRANE_FACE_APPEARANCE"] == 1)
		{
			addDisabledGhostButton(11, "Face B.Marks");
			output2("\nIt’s currently disguised as beauty marks above your lips.");
			output2("\nYou could ask it to hide itself as much as possible.");
			if (pc.statusEffectv1("Mimbrane Face") >= 4) output2("\nYou could also ask it to resemble a pair of lip piercings.");
		}
		else if (flags["MIMBRANE_FACE_APPEARANCE"] == 2)
		{
			addDisabledGhostButton(12, "Face Lip Pc.Ing");
			output2("\nIts eyes currently resemble a pair of lip piercings.");
			output2("\nYou could ask it to hide itself as much as possible.");
			output2("\nYou could also ask it to disguise its eyes as beauty marks.");
		}
		if (pc.statusEffectv1("Mimbrane Face") >= 4)
		{
			output2("\nIt’s also offered to disguise itself as a set of lip piercings.");

			if (flags["MIMBRANE_FACE_APPEARANCE"] != 2)
			{
				addGhostButton(12, "Lip Pc.Ing", function():void {
					clearOutput2();
					flags["MIMBRANE_FACE_APPEARANCE"] = 2;
					output2("You ask the Mimbrane surrounding your noggin to change its eye bumps to resemble a metal piercing.");
					clearGhostMenu();
					addGhostButton(0, "Back", mimbraneMenu);
				});
			}
			else
			{
				addDisabledGhostButton(12, "Lip Pc.Ing");
			}
		}
		else
		{
			addDisabledGhostButton(12, "Lip Pc.Ing", "Lip Piercing", "Your Mimbrane trust level is not high enough to use this.");
		}
	}
	else
	{
		addDisabledGhostButton(10, "Face Hide");
		addDisabledGhostButton(11, "Face B.Marks")
		addDisabledGhostButton(12, "Face Lip Pc.Ing");
	}
	
	if 
	(	(pc.hasVagina() && (pc.vaginas[0].loosenessMod < -5 || pc.vaginas[0].wetnessMod < -5 || pc.vaginas[0].loosenessMod > 5 || pc.vaginas[0].wetnessMod > 5))
	||	(pc.hasCock() && (pc.cocks[0].cLengthMod < -5 || pc.cocks[0].cThicknessRatioMod < -5))
	||	(pc.lipMod < -4)
	||	(pc.ass.loosenessMod < -5 || pc.ass.wetnessMod < -5 || pc.buttRatingMod < -5)
	||	(pc.breastRows[0].breastRatingMod < -5)
	||	(pc.willpowerMod < -10 && !willpowerModAffected())
	)
	{
		addGhostButton(4, "RstFeed", resetAllMimbraneFeedings, undefined, "Reset Feed Effects", "Reset all current mimbrane feed values to zero, and revert all applicable part-modification values to match. This is a ‘recovery’ features to attempt to ‘fix’ broken saves that have built up huge negative modification values. BE CAREFUL!");
	}
	
	addGhostButton(14, "Back", backToAppearance, pc);
}

//Mimbrane body parts, if possible, is a list of all applicable Mimbrane body parts. So, it could be
//	...your [cock] is soaked...
//	...your [cock] and [pussy] are soaked...
//	...your [cock], [pussy] and [ass] are soaked...
//	...your [cock], [pussy], [ass], [balls] and [breasts] are soaked...
//If player has all possible Mimbranes, then it reads
//	...your entire body is soaked...
public function unlockMimbraneSweatEvent(partName:String):void
{
	clearOutput();
	showMimbrane();

	output("An odd sensation accompanied by cheerful chirping seems to be coming from your " + partName + ". Upon investigation, you discover the parasite has made itself sweat. But this isn’t your normal perspiration, this is oily and sweet to the nose. This is the Mimbrane’s natural lust-inducing sweat!");
	output("\n\nIt seems the parasite is fond enough of you that the little thing is comfortable letting some of its sugary, slightly-red ooze coat your body. The sweat tingles to the touch, turning you on somewhat as time goes on. It doesn’t seem to be nearly as volatile to you as it did when you were under attack by the Mimbrane. Perhaps you could use this against your enemies?");
	output("\n\nBefore you can consider any further applications of your newfound slickness, the Mimbrane stops pumping its sexual syrup. It squeaks again... Looks like the parasite’s leaving it up to you whether or not you’d like to start coating your body in its sweet sweat.");
	output("\n\n<b>You’ve unlocked the ability to toggle sweating for any Mimbranes at Level 3 Trust or higher.</b>");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function toggleMimbraneSweat():void
{
	clearOutput2();

	// Toggling on
	if (flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] == undefined)
	{
		flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] = 1;

		output2("You ask your Mimbrane");
		if (attachedMimbranes() > 1) output2("s");
		output2(" to sweat.");
		if (attachedMimbranes() == 1) output2(" It cheerfully squeaks its affirmation.");
		else output2(" They cheerfully squeak their affirmation.");
		output2(" Little time passes before your " + mimbraneBodypartString());
		if (attachedMimbranes() == 1) output2(" is");
		else output2(" are");
		output2(" soaked in oily, sensual perspiration.");
	}
	// Toggling off
	else
	{
		flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] = undefined;

		output2("You ask your Mimbrane");
		if (attachedMimbranes() > 1) output2("s");
		output2(" to stop sweating.");
		if (attachedMimbranes() == 1) output2(" It cheerfully squeaks its affirmation.");
		else output2(" They cheerfully squeak their affirmation.");
		output2(" Before too long, your body is completely dry and free of the sweet, heady aroma that followed you around.");
	}

	clearGhostMenu();
	addGhostButton(0, "Back", mimbraneMenu);
}

public function mimbraneSweatHandler(numHours:int = 1):void
{
	if (flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] != undefined && flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] == 1)
	{
		var numSweating:int = mimbranesAtTrustMinimum(3);
		pc.lust(numSweating * numHours);
	}
}

public function mimbraneBodypartString():String
{
	var parts:Array = [];
	var msg:String = "";

	if (attachedMimbranes() == mimbraneEffects.length) return "entire body";

	if (pc.hasStatusEffect("Mimbrane Cock")) parts.push("[pc.cock]");
	if (pc.hasStatusEffect("Mimbrane Pussy")) parts.push("[pc.pussy]");
	if (pc.hasStatusEffect("Mimbrane Ass")) parts.push("[pc.ass]");
	if (pc.hasStatusEffect("Mimbrane Balls")) parts.push("[pc.balls]");
	if (pc.hasStatusEffect("Mimbrane Boobs")) parts.push("[pc.fullChest]");

	if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right")) parts.push("hands");
	else if (pc.hasStatusEffect("Mimbrane Hand Left") && !pc.hasStatusEffect("Mimbrane Hand Right")) parts.push("hand");
	else if (!pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right")) parts.push("hand");

	if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right")) parts.push("[pc.feet]");
	else if (pc.hasStatusEffect("Mimbrane Foot Left") && !pc.hasStatusEffect("Mimbrane Foot Right")) parts.push("[pc.foot]");
	else if (!pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right")) parts.push("[pc.foot]");

	if (pc.hasStatusEffect("Mimbrane Face")) parts.push("face");

	msg = parts[0];
	parts.splice(0, 1);

	while (parts.length > 0)
	{
		if (parts.length == 1)
		{
			msg += " and ";
		}
		else
		{
			msg += ", ";
		}

		msg += parts[0];
		parts.splice(0, 1);
	}

	if (mimbraneDebug) trace("Generated Part String: " + msg);
	return msg;
}

//Unlock Spitting
//Unlocked when any Mimbrane hits level four trust. Occurs once, a few hours after hitting level four. Starts toggled on. Toggle disappears if no Mimbranes at level four exist.
public function unlockMimbraneSpittingEvent(partName:String):void
{
	clearOutput();
	showMimbrane();

	flags["PLAYER_MIMBRANE_SPIT_ENABLED"] = 1;

	output("An unusual pressure builds in your " + partName + ", prompting you to check it out. The Mimbrane surprises you by suddenly dropping a large volley of something onto the ground. It’s a deep red, oily glob. Its saccharine smell is powerful, drawing you into a potent den of desire.");
	output("\n\n The parasite chirps loudly, emphasizing its accomplishment. It calls your attention again with a harsh squeak, acting as if it were attacking something. It’s obvious now; your Mimbrane wants to help you seduce prey with its natural projectiles of moist sensuality!");
	output("\n\n<b>You’ve unlocked the ability to toggle spit attacks for any Mimbranes at Level 4 Trust.</b>");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function toggleMimbraneSpit():void
{
	clearOutput2();

	// Toggling on
	if (flags["PLAYER_MIMBRANE_SPIT_ENABLED"] == undefined)
	{
		flags["PLAYER_MIMBRANE_SPIT_ENABLED"] = 1;

		output2("You let your Mimbrane");
		if (attachedMimbranes() > 1) output2("s");
		output2(" know that you’d like if");
		if (attachedMimbranes() == 1) output2(" it");
		else output2(" they");
		output2(" helped you in combat.");
		if (attachedMimbranes() == 1) output2(" It squeaks a happy affirmation.");
		else output2(" They squeak a happy affirmation.");
	}
	//Toggling Off
	else
	{
		flags["PLAYER_MIMBRANE_SPIT_ENABLED"] = undefined;
		output2("You ask your Mimbrane");
		if (attachedMimbranes() > 1) output2("s");
		output2(" not to interfere with your combat, preferring");
		if (attachedMimbranes() == 1) output2(" it doesn’t");
		else output2(" they don’t");
		output2(" interrupt you with");
		if (attachedMimbranes() == 1) output2(" its");
		output2(" their");
		output2(" own dangerous blasts of desire.");
	}

	clearGhostMenu();
	addGhostButton(0, "Next", mimbraneMenu);
}

public function toggleMimbraneSwellingMenu(newTxt:Boolean = true):void
{
	if(newTxt) clearOutput2();
	clearGhostMenu();
	
	var numMims:int = attachedMimbranes();
	var btnSlot:int = 0;
	
	if(newTxt)
	{
		output2("Your Mimbrane" + (numMims == 1 ? "" : "s") + " will swell based on " + (numMims == 1 ? "its" : "their") + " feeding level. You are able to tell " + (numMims == 1 ? "it" : "them") + " to look less bloated if you desire.");
		output2("\n\n<i>Note that this only changes the swollen appearance of the body part, if applicable, and may not necessarily decrease the extra size added to the body part from the swelling. The Mimbrane" + (numMims == 1 ? "" : "s") + " can only do so much with " + (numMims == 1 ? "its" : "their") + " own mass after all.</i>");
	}
	
	output2("\n\n<b><u>Current Mimbranes</u></b>");
	if(pc.hasStatusEffect("Mimbrane Cock")) {
		output2("\n<b>* Penis:</b> Swelling " + (flags["MIMBRANE_NOSWELL_COCK"] == undefined ? "enabled" : "disabled"));
		addGhostButton(btnSlot++, ("Penis:" + (flags["MIMBRANE_NOSWELL_COCK"] == undefined ? "ON" : "OFF")), toggleMimbraneSwelling, "COCK");
	}
	if(pc.hasStatusEffect("Mimbrane Pussy")) {
		output2("\n<b>* Vagina:</b> Swelling " + (flags["MIMBRANE_NOSWELL_CUNT"] == undefined ? "enabled" : "disabled"));
		addGhostButton(btnSlot++, ("Vagina:" + (flags["MIMBRANE_NOSWELL_CUNT"] == undefined ? "ON" : "OFF")), toggleMimbraneSwelling, "CUNT");
	}
	if(pc.hasStatusEffect("Mimbrane Ass")) {
		output2("\n<b>* Asshole:</b> Swelling " + (flags["MIMBRANE_NOSWELL_BUTT"] == undefined ? "enabled" : "disabled"));
		addGhostButton(btnSlot++, ("Asshole:" + (flags["MIMBRANE_NOSWELL_BUTT"] == undefined ? "ON" : "OFF")), toggleMimbraneSwelling, "BUTT");
	}
	if(pc.hasStatusEffect("Mimbrane Balls")) {
		output2("\n<b>* Testicle:</b> Swelling " + (flags["MIMBRANE_NOSWELL_SACK"] == undefined ? "enabled" : "disabled"));
		addGhostButton(btnSlot++, ("Testicle:" + (flags["MIMBRANE_NOSWELL_SACK"] == undefined ? "ON" : "OFF")), toggleMimbraneSwelling, "SACK");
	}
	if(pc.hasStatusEffect("Mimbrane Boobs")) {
		output2("\n<b>* Chest:</b> Swelling " + (flags["MIMBRANE_NOSWELL_TITS"] == undefined ? "enabled" : "disabled"));
		addGhostButton(btnSlot++, ("Chest:" + (flags["MIMBRANE_NOSWELL_TITS"] == undefined ? "ON" : "OFF")), toggleMimbraneSwelling, "TITS");
	}
	if(pc.hasStatusEffect("Mimbrane Hand Left") || pc.hasStatusEffect("Mimbrane Hand Right")) {
		output2("\n<b>* Hand:</b> Swelling " + (flags["MIMBRANE_NOSWELL_HAND"] == undefined ? "enabled" : "disabled"));
		addGhostButton(btnSlot++, ("Hand:" + (flags["MIMBRANE_NOSWELL_HAND"] == undefined ? "ON" : "OFF")), toggleMimbraneSwelling, "HAND");
	}
	if(pc.hasStatusEffect("Mimbrane Foot Left") || pc.hasStatusEffect("Mimbrane Foot Right")) {
		output2("\n<b>* Feet:</b> Swelling " + (flags["MIMBRANE_NOSWELL_FOOT"] == undefined ? "enabled" : "disabled"));
		addGhostButton(btnSlot++, ("Feet:" + (flags["MIMBRANE_NOSWELL_FOOT"] == undefined ? "ON" : "OFF")), toggleMimbraneSwelling, "FOOT");
	}
	if(pc.hasStatusEffect("Mimbrane Face")) {
		output2("\n<b>* Face:</b> Swelling " + (flags["MIMBRANE_NOSWELL_FACE"] == undefined ? "enabled" : "disabled"));
		addGhostButton(btnSlot++, ("Face:" + (flags["MIMBRANE_NOSWELL_FACE"] == undefined ? "ON" : "OFF")), toggleMimbraneSwelling, "FACE");
	}
	output2("\n\n");
	
	addGhostButton(14, "Back", mimbraneMenu);
}
public function toggleMimbraneSwelling(mimType:String = ""):void
{
	clearOutput2();
	
	var swell:Number = 0;
	var both:Boolean = false;
	var part:String = "";
	
	switch(mimType)
	{
		case "COCK":
			swell = pc.statusEffectv3("Mimbrane Cock");
			part = "[pc.cock 0]";
			break;
		case "CUNT":
			swell = pc.statusEffectv3("Mimbrane Pussy");
			part = "[pc.vagina 0]";
			break;
		case "BUTT":
			swell = pc.statusEffectv3("Mimbrane Ass");
			part = "[pc.cheeks]";
			break;
		case "SACK":
			swell = pc.statusEffectv3("Mimbrane Balls");
			part = "[pc.ballsack]";
			break;
		case "TITS":
			swell = pc.statusEffectv3("Mimbrane Boobs");
			part = (!pc.hasBreasts() ? "[pc.chest]" : "[pc.breasts]");
			break;
		case "HAND":
			swell = Math.max(pc.statusEffectv3("Mimbrane Hand Left"), pc.statusEffectv3("Mimbrane Hand Right"));
			both = (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right"));
			part = (!both ? "[pc.hand]" : "[pc.hands]");
			break;
		case "FOOT":
			swell = Math.max(pc.statusEffectv3("Mimbrane Foot Left"), pc.statusEffectv3("Mimbrane Foot Right"));
			both = (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right"));
			part = (!both ? "[pc.foot]" : "[pc.feet]");
			break;
		case "FACE":
			swell = pc.statusEffectv3("Mimbrane Face");
			part = "[pc.face]";
			break;
		default:
			output2("<b>ERROR:</b> Mimbrane for " + mimType + " does not exist!");
			break;
	}
	
	output2("The Mimbrane" + (!both ? "" : "s") + " residing on your " + part);
	if(flags["MIMBRANE_NOSWELL_" + mimType] == undefined) output2(" constrict" + (!both ? "s" : "") + " " + (swell <= 0 ? "slightly" : ("and gradually flatten" + (!both ? "s itself" : " themselves") + " to the surface of your [pc.skin]")) + ", holding " + (!both ? "its" : "their") + " form so is to no longer look so obviously bloated.");
	else output2(" relax" + (!both ? "es itself" : " themselves") + ", " + (swell <= 0 ? ("making you aware that " + (!both ? "it" : "they") + " can swell up when " + (!both ? "it is" : "they are") + " well-fed again") : ("gradually inflating " + (!both ? "its" : "their") + " form back to a more natural state of fullness")) + ".");
	
	flags["MIMBRANE_NOSWELL_" + mimType] = (flags["MIMBRANE_NOSWELL_" + mimType] != undefined ? undefined : 1);
	
	toggleMimbraneSwellingMenu(false);
}


//Unlock Head Customization
//Unlocks immediately upon getting a Head Mimbrane, as it starts at level two. Toggle disappears if Head Mimbrane goes under level two trust. Occurs a few hours after getting the head Mimbrane. Occurs once.
public function unlockMimbraneFaceCustomisation():void
{
	clearOutput();
	showMimbrane();

	output("The Mimbrane encasing your head has one more surprise for you, using your [pc.lips] to get your attention. It moves the skin around its eyes to show you what it can do, but you’re unable to feel anything. You find a reflective surface, revealing to you that the Mimbrane has taken to disguising its miniscule eye bumps as a pair of beauty marks.");
	output("\n\n<b>You’ve unlocked the ability to toggle face Mimbrane appearance.</b>");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function unlockMimbraneFacePiercingCustomisation():void
{
	clearOutput();
	showMimbrane();

	output("Your [pc.lips] start acting of their own volition, alerting you to the Mimbrane requesting your attention. Seems it has something new to show you again. You find a reflective surface, which reveals to you that the parasite has figured out how to disguise its tiny eye bumps to appear as an upper lip piercing. You aren’t quite sure how to react, but the ability is impressive at the least.");
	output("\n\n<b>You’ve unlocked an extra head customization for head Mimbranes.</b>");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Feeding
//Requires same lust as masturbation 
//Feed with Cock, Cum
public function feedMimbranesWithCock():void
{
	clearOutput();
	showMimbrane(true);

	output("Feeding time’s come early");
	if (InShipInterior()) output(" to the ship");
	output(". Your [pc.cock] is ready for some manual milking, dribbling a little [pc.cumColor] pre to help things along. You talk a little to your parasite");
	if (attachedMimbranes() > 1) output("s");
	output(", cluing them in to your actions working for");
	if (attachedMimbranes() == 1) output(" its");
	else output(" their");
	output(" favor as opposed to just another extraneous act of self-pleasure. It seems to do the trick;");
	if (attachedMimbranes() == mimbraneEffects.length) output(" your body seems");
	else output(" parts of your body seem");

	output(" to be trembling a bit in anticipation. Removing your equipment is essentially the alert to get ready.");
	output("\n\nIf ever there were a time to dust off a handy ‘master masturbation’ joke, now would be the time. Rare is the individual that can overcome your sexual savvy, and you’re just as proficient at getting what you want out of yourself. A deft touch and skilled stroke works out some [pc.cum] gold from your well in record time.");
	if (pc.cumQ() >= 500) output(" It isn’t quite up to your typical standards of production, but let no one say you aren’t conservative when necessary.");
	output(" Few would cotton to that as an accomplishment, but you aren’t choking the chicken for the pleasure today.");

	output("\n\nNo one worth worrying about is watching you anyway.");

	// Cock Mimbrane
	if (pc.hasStatusEffect("Mimbrane Cock"))
	{
		output("\n\nYour [pc.cock] has little trouble helping itself to its own creation. You can feel the inner rim of your urethra become remarkably sensitive. Jism is seeping right into your tip. It’s indescribable; the sensation of your [pc.cockhead] moving of its own accord will never be something you can truly get accustomed to. The Mimbrane member gets its meager fill in just a few seconds, rejuvenation coursing down through the fiber of your rod.");
	}

	// 1 hand mimbrane
	if ((pc.hasStatusEffect("Mimbrane Hand Left") && !pc.hasStatusEffect("Mimbrane Hand Right")) || pc.hasStatusEffect("Mimbrane Hand Right") && !pc.hasStatusEffect("Mimbrane Hand Left"))
	{
		output("\n\nA five-fingered bandit uses its prime location to go right for the [pc.cumColor] goodness. Indeed, the Mimbrane-controlled hand forces an open palm to your [pc.cockhead] like a thirsty spirit to an inviting spigot on a blazing summer’s day. It’s one thing to watch the miniature mouthfuls disappear into the unseen parasite’s gullet. It’s an entirely different thing to feel it. Each gulp pulses through your extremity as if it were being cleansed. Your fingertips waver a little as the creature finishes its meal, a sign that it’s undeniably satiated.");
	}
	// 2 hand mimbranes
	else if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right"))
	{
		output("\n\nA flurry of ten fingers work their way in towards your [pc.cockhead], eager to sample your latest batch. For a moment you’re worried a fight could break out between ol’ Leftie and Righty, but instead the parasites intertwine your digits. Figures. You’ve never known the creatures to really compete in any fashion. Your conjoined palms hover just above and around your prick, allowing for both tiny mouths to get at the action. Each of their miniature gulps is a cleansing pulse that flies through your extremities and seemingly out your tips. Those tips gently rapping against your knuckles assures you that the sensation isn’t only in your head.");
	}

	// Vagoo
	if (pc.hasStatusEffect("Mimbrane Pussy"))
	{
		output("\n\nTwo helpful fingers deliver a healthy dollop of cum south to an anxious [pc.pussy]. The Mimbrane maw can hardly contain itself, your labia feeling as though it’s tugging at you just to get closer to your descending digits. Your pussy sucks on your fingers, absorbing the [pc.cumFlavor] treat into its feminine flesh. It’s a bizarre experience every time that you may never be able to just get completely adjusted to. The reinvigoration that pulses through your gentials more than makes up for it, though.");
	}

	// Mimbrane ass
	if (pc.hasStatusEffect("Mimbrane Ass"))
	{
		output("\n\nYour [pc.ass] spreads its cheeks wide once you reach around to deliver the Mimbrane its treat, giving you pause. The rear-mounted parasite has always seemed overly enthusiastic – perhaps more than you’d like at times like this. Your [pc.asshole] is loose and inviting, practically panting like a dog at dinnertime. It’s admittedly a little cute even if you’d rather never admit to it. The second your [pc.cumColor]-colored fingers get close to your pucker, however, your buttocks spring down on them like a trap. The parasite savors its catch, absorbing every last drop right into its excited starfish. The Mimbrane releases your hand once satisfied, which you yank back with gusto. Maybe cute isn’t the word you’d use again....");
	}

	// Mimbrane Balls
	if (pc.hasStatusEffect("Mimbrane Balls"))
	{
		output("\n\nA little [pc.cumFlavor] savoriness runs down the length of your [pc.cock], much to the satisfaction of your [pc.sack]. The Mimbrane stares up the savory morsel, keen on its arrival. However, it slows to a stop just short of the parasite’s hungry maw. The creature desperately manipulates your [pc.balls], trying to coerce the liquid down the remaining homestretch. Unable to ignore its plight – the undulating and determined stretching of the creature’s mouth was actually quite alarming – you push the [pc.cum] down into the parasite’s happy mouth. It gives you an affectionate suck before you can draw your fingers back up.");
	}

	// Mimbrane boobs
	if (pc.hasStatusEffect("Mimbrane Boobs"))
	{
		output("\n\nYour [pc.fullChest] jiggle with excitement as [pc.cum]-soaked fingers draw their way. The Mimbrane mounds seem to want to burst from your chest just to get closer to the [pc.cumNoun] feast. You press your hands against your [pc.nipples], sighing at the strangely pleasant suckling against your digits.");
		if (pc.hasFuckableNipples()) output(" You’re almost worried your hands will get sucked right in.");
		output(" Breastflesh massages against your grasp. The parasite has essentially turned the tables on typical breast features, groping and nursing in the reserve direction. Not that you mind so much when it still feels just as nice.");
	}

	// 1 Foot Mimbrane
	if ((pc.hasStatusEffect("Mimbrane Foot Left") && !pc.hasStatusEffect("Mimbrane Foot Right")) || pc.hasStatusEffect("Mimbrane Foot Right") && !pc.hasStatusEffect("Mimbrane Foot Left"))
	{
		output("\n\nWiggling toes alert you to your hungry [pc.foot] or more appropriately your hungry Mimbrane. You bend your [pc.leg] to bring the parasite closer, getting a clear view of its hungry maw hiding underneath your digits. A finger’s worth of [pc.cum] is plenty for the meager appetite. Toes curl around you once the offerings in place. Luckily, the angle keeps the parasite from any meaningful grip. It thanks you with a happy chirp, but the pleasurable sensation sinking through your foot with each of its tiny gulps is thanks enough.");
	}
	// 2 feeties mimbranes
	else if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right"))
	{
		output("\n\nYour [pc.feet] wiggle their toes anxiously. The Mimbranes are afraid you’d have forgotten them down south. Involuntary body movement isn’t easy to overlook, though. You bend both [pc.legs] to draw the parasites in closer while dipping your fingers in [pc.cum]. Your digits part ways to reveal both parasites’ maws, eager to down their [pc.cumNoun] treat. Their angles keep the creatures from grasping your fingers with their toes, but they at least try and pet you in some bizarre show of affection. The gesture isn’t lost on you, nor is their thankful chirp.");
	}

	// head mimbrane
	if (pc.hasStatusEffect("Mimbrane Face"))
	{
		output("\n\nTrembling along your [pc.face] lets you know that your head-mounted Mimbrane is ready and raring to partake from your [pc.cumNoun] handout. Your [pc.lips] pull against you, squeaking quietly like a kitten wanting every last ounce of its mother’s attention. It’s a blessing the parasite doesn’t have control over your entire mouth; it’d probably be lashing out with your tongue, too. You bring the [pc.cum]-soaked tip of your finger up to your mouth. The Mimbrane puckers your lips, not wanting to suffer through your slow approach. It feels as if you were applying lipstick for a moment, but the overwhelming sensation of your cum soaking into your skin dashes that relation in short order. Instead your face feels tingly and reinvigorated.");
	}

	output("\n\nWith");
	if (attachedMimbranes() == 1) output(" your Mimbrane");
	else if (attachedMimbranes() == 2) output(" both Mimbranes");
	else output(" all of your Mimbranes");
	output(" satisfied, you retrieve your gear and go back to something a little more self-gratifying.");

	mimbraneFeed("all", 3);
	processTime(15);
	pc.orgasm();
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Feed with Vagina, Femspunk
public function feedMimbranesWithPussy():void
{
	clearOutput();
	showMimbrane(true);

	output("You may not have a dinner bell, but comforting words seem to have the same effect on your body-mounted Mimbrane");
	if (attachedMimbranes() > 1) output("s");
	output(". The");
	if (attachedMimbranes() == 1) output(" parasite perks up");
	else output(" parasites perk up");
	output(" at your offer, shedding the usual facsimile of normalcy to let you know");
	if (attachedMimbranes() == 1) output(" it’s");
	else output(" they’re");
	output(" more than receptive. You can’t help but be a little entertained by the innocent squeaks and shuffling as you remove your gear. The prospect of rewarded attention seems to overcome much.");

	output("\n\nLaying your hand to your [pc.pussy] reveals shockingly sensitive skin.");
	if (pc.hasStatusEffect("Mimbrane Pussy")) output(" The Mimbrane has prepped itself to hurry along your wanton finger massage.");
	else output(" Mimbranes seem to have the innate ability to make your tender spots all the more delicate.");
	output(" The creature");
	if (attachedMimbranes() > 1) output("s have"); 
	else output(" has");
	output(" little interest in foreplay and");
	if (attachedMimbranes() > 1) output(" are");
	else output(" is");
	output(" more than capable of exaggerating your stimulation when");
	if(attachedMimbranes() > 1) output(" they aren’t");
	else output(" it isn’t");
	output(" trying to hide.");
	if(pc.hasClit()) output(" Your [pc.clit] may as well be a hardline to any sense of pleasure your being has ever known.");
	output(" Merely a few minutes is all it takes to get your juices");
	if (pc.wetness() <= 1) output(" dripping");
	else if (pc.wetness() == 2) output(" flowing");
	else if (pc.wetness() <= 3) output(" gushing");
	else output(" bursting.");

	output("\n\nInduced or not, it’s a little disconcerting.");

	if (pc.hasStatusEffect("Mimbrane Pussy"))
	{
		output("\n\nYour [pc.pussy] needn’t work hard for its take of your offering. The Mimbrane maw undulates slowly, absorbing what it would consider a hearty portion directly back into your pussy. It’s fairly breathtaking. Were you pressed to describe the feeling, “deep breathing” may be the most adequate description. Each little intake of femspunk back into your canyon is a radiating wave of bliss");
		if(pc.hasClit()) output(", crashing into your [pc.clit]");
		output(". The parasite exaggerates the movement, making it that much more difficult to even consider overlooking the provocative experience.");
	}

	if ((pc.hasStatusEffect("Mimbrane Hand Left") && !pc.hasStatusEffect("Mimbrane Hand Right")) || (pc.hasStatusEffect("Mimbrane Hand Right") && !pc.hasStatusEffect("Mimbrane Hand Left")))
	{
		output("\n\nThe parasite ensconced over your hand helps itself while you make with the self-loving. It isn’t entirely clear who’s in control here, but either way your palm gets close enough to the goods for the Mimbrane to help itself. A charge of tingling clarity hits you with each tiny gulp, fueling your own actions further. It’s only when the parasite finally fills to its meager brim do you come down from your brief sexual high.");
	}
	else if (pc.hasStatusEffect("Mimbrane Hand Left") && pc.hasStatusEffect("Mimbrane Hand Right"))
	{
		output("\n\nBoth of your hands get in on the action, the Mimbrane-covered extremities anxious to partake in your feminine delight. You’re left questioning whether its them or you that’s suddenly turned this into a two-hand job. The ordeal fades from your mind, however, once the creatures start to indulge in your sexual fluids. Invigorating crests of pleasure march right through to your fingertips with each miniature gulp the parasites take.");
	}

	if (pc.hasStatusEffect("Mimbrane Cock"))
	{
		output("\n\nYour eager [pc.cock] can’t help but feel a tad betrayed as you milk your cooch for all its worth. The Mimbrane member is too engorged on blood, rocking through your ever-ascending sexual high, to bend down towards the");
		if (pc.wetness() <= 1) output(" brook");
		else if (pc.wetness() == 2) output(" stream");
		else if (pc.wetness() <= 3) output(" river");
		else output(" torrent");
		output(" flowing below it. You don’t leave the parasitic rod waiting too long, however, dabbing your fingers in your juices and rubbing them generously onto your [pc.cockhead]. Gentle squeaks let you know how content the Mimbrane is, and its absorption of your fluids fills your dick with streams of vibrant tidings. It’s a small wonder you don’t lose another load right there.");
	}

	if (pc.hasStatusEffect("Mimbrane Ass"))
	{
		output("\n\nA stroll down your taint leads to your [pc.ass], clearly enthusiastic to get a piece of your delightful feminine broth. The Mimbrane spreads your buttocks almost uncomfortably wide as a couple of femspunk-coated fingers wind their way close. The parasite is presenting your [pc.asshole] much like a pet’s whimpering mouth mere inches from a treat. Once you’re within range, it traps your hand with an unusually strong grasp. You try and pull your hand from from the cheeky constraint, but are subdued by the awe-inspiring sensations radiating from your pucker. Each little suckle and absorption of the enthusiastic Mimbrane is a turbocharged sexual pulse that defies expectations. It finishes its meal in short time, releasing your hand as it chirps playfully.");
	}

	if (pc.hasStatusEffect("Mimbrane Balls"))
	{
		output("\n\nYour [pc.sack] hangs above your [pc.pussy], the Mimbrane frustrated that its placement of features renders it incapable of easily lapping at your feminine fountain. The squirming [pc.balls] amuse and titillate you for a moment before you eventually cave in, delivering some of the coveted cargo all over its miniature, subdued face. The parasite delights in the feast, each of its tiny indulgences tickling your senses with comfortable blasts of passion.");
	}

	if (pc.hasStatusEffect("Mimbrane Boobs"))
	{
		output("\n\nDripping anticipation pours from your [pc.fullChest]. The Mimbrane mounds are anxious for a taste of your pussy treats, bouncing and chirping softly. A moist hand delivers them what they seek, unsure which of your [pc.nipples] to go to first. It makes little difference to the parasite so long as you eventually choose one. Your breast pushes back against your tender touch, massaging your hand as it sucks up your feminine fluids. It almost becomes a grope tug-of-war, though neither of you are all that competitive about it.");
	}

	if ((pc.hasStatusEffect("Mimbrane Foot Left") && !pc.hasStatusEffect("Mimbrane Foot Right")) || (pc.hasStatusEffect("Mimbrane Foot Right") && !pc.hasStatusEffect("Mimbrane Foot Left")))
	{
		output("\n\nIf it had its way, your [pc.foot] would very well dive into your [pc.pussy], gorging itself on your female fountain. Too timid to try, the Mimbrane instead wiggles your toes impatiently to try and get your attention. The show works, as you bend your [pc.leg] and bring the extremity closer to the action. Its angle keeps it from merely sucking from your puddle of femininity, but this inconvenience is quickly forgotten once you bring some liquid encouragement directly to its tiny mouth. You smear it vigorously under your toes, finding it odd for a brief moment before pulses of tingling comfort melt your regret away.");
	}
	else if (pc.hasStatusEffect("Mimbrane Foot Left") && pc.hasStatusEffect("Mimbrane Foot Right"))
	{
		output("\n\nYour [pc.feet] wiggle anxiously, the Mimbranes hoping you won’t overlook them. You imagine they forget how hard it is to ignore any involuntary action thrust upon you. They aren’t kept waiting long as you bend your [pc.legOrLegs] inward, presenting their infinitesimale mouths hiding under your toes, eager for a drop of your feminine fluids. Small dabs of femspunk are more than enough for their meager appetites. Each of their little indulgences tickles you down to your core. From toe to heel, the parasites push a surprisingly dense sensation of sexual invigoration right through you.");
	}

	if (pc.hasStatusEffect("Mimbrane Face"))
	{
		output("\n\nYour [pc.face] feels as though it wants to pull off of your skull at just the thought of getting to your pussy juice. Its [pc.lips] tremble pathetically. The Mimbrane acts as if it’d gone eons without food. You can’t help but smile at its melodrama, causing it to squeak helplessly at your apathy. The parasite purses your lips as you draw a couple fingerfuls of pussy nectar closeby, dying to get closer to the tiny oasis. Your fingers rub your face cushions, delighting the parasite to no end. The sensation of it absorbing your sexual vapors into your skin feels as if you were kissing pure desire.");
	}

	output("\n\nWith");
	if (attachedMimbranes() == 1) output(" your Mimbrane");
	else if (attachedMimbranes() == 2) output(" both Mimbranes");
	else output(" all of your Mimbranes");
	output(" satisfied, you retrieve your equipment and go back to something a little more self-gratifying.");

	mimbraneFeed("all", 3);
	processTime(15);
	pc.orgasm();
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function zeikTailPlusMimbMadness():void
{
	clearOutput();
	showName("PARASITE\nPALS");
	author("Zeikfried");
	showBust("MIMBRANE","COCKVINESEEDLING");
	output("The mimbrane, strangely, vacillates as well. It lurches at you, halts, and starts again, distracted by something still moving in the periphery. That... ‘something’ lunges at the mimbrane, hitting the flexible creature center mass and battering a dent. The silken symbiote deforms around the blow, rubbing folds of warm, oily skin against the intruder while it twists away, and a sudden electric pleasure shoots up your back. As your [pc.thighs] begin to fidget uncontrollably in sexual excitement, you realize which other creature is here with you: your cockvine.");
	output("\n\nYour blushing-red mimbrane assailant quickly identifies your semi-autonomous parasite as an unsubdued threat and regains its aggressive posture. Beads of perspiration form on its surface, thickening the fog of lusty aphrodisiacs until you can taste the pungent chemical on your tongue. It twists like a banner and wraps around your [pc.tail], smothering the vine in drug and teasing its [pc.tailCock] free from concealment. The mimbrane caresses the sensitive glans, gliding along the slit like spreading oil, wicking up droplets of lubrication and causing the parasite to shiver.");
	if(pc.hasCock())
	{
		output(" Your own [pc.cocksLight] shudder");
		if(pc.cockTotal() == 1) output("s");
		output(" with reflected pleasure as if ");
		if(pc.cockTotal() == 1) output("it was the one");
		else output("they were the ones");
		output(" touched, and dabs of your pre ");
		if(!pc.isCrotchExposed()) output("wet your [pc.lowerGarment].");
		else 
		{
			output("bead and run down your shaft");
			if(pc.cockTotal() > 1) output("s");
			if(pc.balls > 0) output(" to pool on your [pc.sack]");
			else if(pc.hasVagina()) output(" to tickle your [pc.vaginas]");
			output(".");
		}
	}
	output("\n\nThe struggle doesn’t go the mimbrane’s way. The arousing fog that reduced your defenses to a ");
	if(pc.hasCock()) output("warm, sticky paste");
	else output("soft, gibbering pile");
	output(" has much less effect on the cockvine’s alien, vegetable mind. If anything, the trickle of drug pumping through your blood and into the parasite is only enough to make it <i>extremely</i> randy and aggressive. It squirms in the mimbrane’s loose grip, battering folds and creases into the velvety scarf, trying to fuck the mimbrane like an oily, soft pussy. Mistaking the affection for hostility, the scarlet parasite secretes more fluid from its surface, pooling it and spitting it at the cockvine - which, at this moment,  is directly over your exposed crotch.");

	if(pc.hasGenitals()) output("\n\n");
	if(pc.hasCock())
	{
		output("The aphrodisiac hits like a tropical storm, deluging your crotch in contact arousal until [pc.eachCock] sways like a palm tree from your hip shakes. ");
		if(pc.cockTotal() > 1) 
		{
			output("Pre-cum slops everywhere, filling the gap");
			if(pc.cockTotal() > 2) output("s");
			output(" between your shafts and making each feel like a half-pussy licking at its neighbor");
			if(pc.cockTotal() > 2) output("s");
			output(". ");
		}
		output("Your ");
		if(pc.balls > 1) output("[pc.balls] tense");
		else output("body tenses");
		output(" to release - you feel as if already in the final, irrevocable strokes of great sex, despite not even being inside.");
		if(pc.hasVagina()) output(" ");
	}
	//(if pussy, including herms)
	if(pc.hasVagina()) 
	{
		output("[pc.EachVagina] takes the splash of liquid lust like the first lick of an eagerly-awaited cunnilingus, tingling and swelling with blood");
		if(pc.gapestVaginaLooseness() < 4) output(", spreading slightly");
		output(", ");
		if(pc.wettestVaginalWetness() <= 2) output("dripping");
		else if(pc.wettestVaginalWetness() <= 4) output("drooling");
		else output("splattering");
		output(" juices to outdo the slippery mimbrane for sex-readiness.");
		if(pc.balls > 1 && !pc.hasStatusEffect("Uniball")) output(" So much hot girl-lube coats your labia that your balls are quickly coated in it, pinching and rolling your [pc.clit] in sticky, soft spheres every time your pelvis twitches.");
	}
	output("\n\nThe perverted visions in your head demand your every iota of attention, so much so that your prone body is given over to the cockvine’s control. It becomes as tense as a violin string");
	if(!pc.isTaur()) output(", bent awkwardly backwards with your crotch poking up in the air and plenty of room for the virile vine to maneuver.");

	output("\n\nThe oblivious mimbrane continues to spit, spooge, and slime drugs onto your overtuned nerves as it pursues the vine over your [pc.skin], trying its best to stun, but the plant parasite gains <i>more</i> control, if anything. The inhuman need to fuck brought on by the fog overdose is concentrating every neuron you own on your throbbing ");
	if(!pc.hasGenitals()) output("pulse");
	else output("sex");
	output(". With no thought to spare for resisting the cockvine’s breeding impulse, it infiltrates your mind, plunging you into a feverish dream of impossible coitus....");
	
	output("\n\nA slender, red-skinned woman with hair like a veil stands at the entrance to your garden. Two of your mates look up from their lounging; the third continues to stroke your sticky, sap-oozing penis, hoping you won’t notice the newcomer’s come-hither eyes. But you do, and pull your cock away. She huffs, but she knows that you value seeding a new womb over sex for pleasure’s sake, and entertains herself rubbing her heavy, gravid belly instead.");
	output("\n\nThe red woman smiles at you, a greedy, desirous smile that you’ve seen somewhere before. Her small eyes move down your [pc.chest], to your [pc.belly] and then to your green, fertile cock. The leaves adorning your genitals rustle with excitement. She chirps in a language you don’t understand, and takes your penis in her hand; her palm is like a warm, silken handkerchief. It yields to your turgid prick, bending just slightly when you push into it.");
	output("\n\nYou reach for the woman’s breast and squeeze it; it ripples like cloth and her small eyes smile at your sexual aggression. She steps closer, pressing her soft body to yours; your florid penis is pinned between your stomachs. Your new lover mouths a word again and you lift her up. She’s so light that you can easily line her up with your seed-cock, and she wraps her arms around your neck, clearly anticipating the moment you lower her.");
	output("\n\nYour flexible breeding stalk noses at the red woman’s labia, depositing a line of precum prepared by your mate’s unfinished handjob. Her teeth pinch her lower lip in excitement; a sweet, fragrant sweat beads on her neck and her beautiful breasts. The scent of it drives up your urge to fuck and drives up your cock as well, right into her pussy. She gasps.");
	output("\n\nHer sex conforms to you, glove-like, wrapping velvet around your crown and shaft as your stroke fills her. You hit the back of her pussy before you can hilt your entire cock, but your disappointment is short-lived when her womb ripples and parts to allow you even deeper. Gratefully, you slide in all the way, feeling the ring of her womb constrict around you.");
	output("\n\nThe woman giggles a high, chittering giggle and presses her chest close, to smear you in her fragrant sweat. It climbs into your nose, forcing blood into your cock until you’re painfully hard; her scent demands you to fuck her, makes you <i>need</i> it. You draw your shaft out, and then slam it home again, and again. Each stroke weakens the woman’s muscles, causing her to lean away with a little moan of pleasure, until by the tenth she’s hanging over your arms like a rag doll with her petite breasts bouncing on her chest and her tongue dangling from her open mouth.");
	output("\n\nHer pussy ripples around you like a flag, undulating and drawing you in with tongues of oily, warm skin. Every fold yields to your thrust only to rush up behind to lick at your verdant, tingling prick; the reverse stroke is no less loving as the tongues pull in the other direction, dragging along the crown and collecting tolls of incessantly-streaming precum. You feel a tightening in your back as your body prepares to release its load, and you fuck furiously, trying to enjoy a few more strokes before the end. Your lover senses your tension, and her soft thighs wrap around you like a shawl.");
	output("\n\nYou grunt and cum, pushing down on your lover’s hips to pin your prick deep inside her ready womb. When the first stroke touches her, her small eyes open wide, and her mouth spreads in a smile. ");
	if(pc.cumQ() < 8) output("Your tiny squirts don’t seem to impinge upon her joy in the least; you finish in seconds but she merely wraps her arms around you and nibbles on your ear as you slump to the ground with her in your arms.");
	else if(pc.cumQ() < 3000) output("Each stroke widens her smile, until it nearly splits her face. Her pussy roils around you, bathing your glans in your warm, gooey deposit as you spend your last and slump to the ground.");
	else
	{
		output("Her joy quickly becomes astonishment, as your incredible [pc.balls] produce");
		if(pc.balls <= 1) output("s");
		output(" an endless stroke of cum that pushes aside everything - her shifting, loving pussy, her welcoming womb, and finally, even her petite shape. Your orgasm continues for minutes, producing cum to make a whore sweat, until you can stand no longer and slump to the ground, still squirting small aftershocks into her.");
	}
	output("\n\nYour newest mate sighs, relaxes and lets herself down from your cock, cradling her ");
	if(pc.cumQ() < 3000) output("stomach");
	else output("swollen, rounded belly, which looks almost as pregnant with your spawn as she’ll soon become");
	output(". A trickle of greenish sperm falls from her ruby-red pussy and she looks up at you with an adoring, possessive gaze. You’d like nothing more than to bask in her afterglow, but the massive orgasm has stirred and cleared your mind. You feel the ethereal lover’s garden begin to slip away....\n\n");
	processTime(29);
	pc.orgasm();
	processTime(10);
	clearMenu();
	addButton(0,"Next",cockVineVictoryPostParasitePals);
}


public function cockVineVictoryPostParasitePals():void
{
	clearOutput();
	showName("PARASITE\nPALS");
	author("Zeikfried");
	showBust("MIMBRANE","COCKVINESEEDLING");

	//cockvine wins fork
	//chosen either randomly or  by considering mimbrane's post-combat stats (e.g. how much damage/lust the PC dealt it)
	//a cockvine victory should be low probability
	if(rand(3) == 0)
	{
		output("You emerge from the venereous, alien dream with the taste of your lover on your lips, to find ");
		if(pc.hasCock())
		{
			output("your crotch covered with jism. The ");
		}
		else if(pc.hasVagina()) 
		{
			output("your [pc.vaginasLight] swollen and stinging in the jungle air");
			if(pc.wettestVaginalWetness() > 0)
			{
				if(pc.wettestVaginalWetness() <= 2) output(", trickling");
				else if(pc.wettestVaginalWetness() <= 3) output(", trickling");
				else if(!pc.isSquirter()) output(", drooling");
				else output(", gushing");
				output(" with [pc.girlCumColor] fem-cum");
			}
			output(". The ");
		}
		else output("the ");
		output("mimbrane, finally exhausted of chemicals, has been pinned by your cockvine. Your sticky, cum-drooling plant-prick shakes and jabs with its head - finally starting to feel the mimbrane drug or just motivated by your own bone-shaking climax, you don’t know - and is preparing to fuck the symbiote despite the latter’s lack of a pussy.");
		output("\n\nThe vine shifts to pin the mimbrane with its lower length and rears up to dominate its prey. The mimbrane struggles on a bit longer... until a droplet of pre from the viny glans falls onto it. Perhaps figuring that one free meal is better than nothing, it stops fidgeting and rumples up, turning its velvety body into a perfect pocket pussy.");
		output("\n\nYour cockvine identifies the mimbrane’s intent as soon as you lay eyes on its new shape.  It curls down and lines up with the hole, peeling back its foreskin-like covering completely to expose as much to the tender strokes as possible. Two eyes glow dimly at you from the mimbrane’s depths, smiling with anticipation, and then the crown of your tail-cock slides into the sticky, soft valley. The velvet creature ripples, almost like a sigh.");
		output("\n\nYour parasite is in no mood for foreplay and fucks the mimbrane relentlessly, iron-hard and bursting to cum already from your shared fantasy. As the cockvine’s lust builds to climax, its haze spills over again... a vision flashes before you of an adoring, red woman, seated against your [pc.legOrLegs] and rubbing her swollen, pregnant belly with love. The image intensifies until you can see the dark, greedy desire for you in her small eyes, and then fades away again as the vine cums, hard.");
		output("\n\nIt fires stroke upon stroke, some with such force that they push past the mimbrane’s curled flaps to shoot through the creature, landing in the grass beyond. The mimbrane tries its best to catch as much cum as possible, even assuming a parachute shape to catch the sperm when its initial shape proves too porous. After almost fifteen seconds of cumming, your tail collapses, sluggish and drooping. Its [pc.tailCock] slowly recedes into the concealing slits as the mimbrane devours its offering. Your own energy matches that of your parasite, and you doze fitfully, haunted by dreams of a red-skinned wife and children.");
		output("\n\nWhen you awake, your tail is sprightly and once again as horny as ever, and the mimbrane is nowhere to be found.\n\n");
		processTime(10);
		pc.orgasm();
		processTime(100);
		//do pc.orgasm times 2 (or pc orgasm x1 and tail orgasm x1, if set up), do other loss consequences
		CombatManager.genericLoss();
	}
	//else mimbrane wins fork
	else
	{
		output("You come out of the mad, lecherous hallucination toward the end of your massive orgasm to find ");
		if(pc.hasCock())
		{
			output("a ");
			if(pc.cumQ() < 10) output("sprinkle");
			else if(pc.cumQ() < 5000) output("puddle");
			else output("lake");
			output(" of [pc.cumNoun] covering your [pc.cocksLight]");
			if(pc.balls > 0) output(" and [pc.sack]");
			output(". The ");
		}
		else if(pc.hasVagina())
		{
			output("your [pc.vaginasLight] inflamed and grasping for penetration, desperate to be filled before the climax fades - unfortunately with no luck. Your ");
		}
		else output("that your ");
		output("cockvine has fared poorly against the more agile mimbrane. The ropy green dick is pinned by the slippery symbiote, which is already trying to bond to its most phallic parts; the mimbrane probes around the crown of your [pc.tailCock], trying to attach itself, but seems to run into a problem. Because the vine is only minimally sensitive to the mimbrane’s chemical weapon, it squirms wildly, confounding any attempt to stick to and mimic its glossy, green surface. After several unsuccessful captures that only cause the vine glans to slip through the velvety layers one moist flesh-fold at a time, sending chills through your hypersensitized nerves, the mimbrane thankfully gives up.");
		output("\n\nUnfortunately, the next potential host it turns its attention to is <i>you</i>");
		//(if PC has mimbs already)
		if(attachedMimbranes() > 0) 
		{
			output(" - or fortunately, if you remember to stay positive about your sometimes-helpful symbiote");
			if(attachedMimbranes() > 1) output("s");
		}
		output(". The mimbrane abandons the unruly tail and begins to search out a suitable place on your own skin, smearing you with more of it’s arousing chemicals, forcing you to pant and gasp your way right back to a needy, whining state.");
		//(if PC is full on mimbs)
		//[tbd any additional lines needed to bridge the scene to existing mimbrane attach]");
		//do pc.orgasm times 1, other loss consequences
		//do mimbrane attach if eligible and end
		processTime(10);
		pc.lust(150);
		clearMenu();
		addButton(0,"Next",attachAMimbrane);
	}
}
