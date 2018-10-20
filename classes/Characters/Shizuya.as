package classes.Characters 
{
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.Items.Melee.ShockGear;
	import classes.Items.Armor.YellowClothes;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.addDisabledButton;
	import classes.Engine.Combat.*
	import classes.Engine.Combat.DamageTypes.*
	import classes.GameData.CombatAttacks;
	
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class Shizuya extends Creature 
	{
		
		public function Shizuya() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			short = "Shizuya";
			originalRace= "kaithrit";
			a = "";
			capitalA = "";
			
			meleeWeapon = new ShockGear();
			meleeWeapon.hasRandomProperties = true;
			//Doesn't need MORE CCs.
			meleeWeapon.baseDamage.removeFlag(DamageFlag.CHANCE_APPLY_STUN);

			armor = new YellowClothes();
			shield = new ReaperArmamentsMarkIShield();
			shield.shields = 240;
			
			physiqueRaw = 50;
			reflexesRaw = 50;
			aimRaw = 35;
			intelligenceRaw = 40;
			willpowerRaw = 35;
			libidoRaw = 80;
			energyRaw = 150;
			lustRaw = 20;
			level = 10;
			HPMod += 650 - HPMax();
			
			baseHPResistances.tease.damageValue = 5;
			baseHPResistances.drug.damageValue = 40;
			baseHPResistances.pheromone.damageValue = 50;
			baseHPResistances.kinetic.damageValue = 20;
			
			femininity = 80;
			hairColor = "dark red";
			hairLength = 4,
			tallness = 132;
			tone = 100;
			thickness = 70;
			eyeColor = "red and green";
			eyeType = GLOBAL.TYPE_FELINE;
			earType = GLOBAL.TYPE_FELINE;
			hornType = GLOBAL.TYPE_GOAT;
			legType = GLOBAL.TYPE_HUMAN;
			legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_FURRED];
			tailType = GLOBAL.TYPE_FELINE;
			tailCount = 2;
			tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLUFFY];
			hipRatingRaw = 20;
			buttRatingRaw = 18;
			
			cocks = [];
			createCock(24);
			createCock(24);
			
			vaginas = [];
			createVagina();
			
			createPerk("Inhuman Desire", 60, 0, 0, 0, "Increases maximum lust by 60.");
			createPerk("Improved Agility",0,0,0,0,"");
			
			//Where's mah ship
			majinLocation = null;
		}
		public var majinLocation:String = undefined;
		
		public function encounterText():String
		{
			var eText:String = "";
		
			switch(combatMode)
			{
				case 0:
					eText = "Shizuya certainly cuts an imposing figure. She’s eleven feet tall, easily towering over most people. Her breasts are tied down with bandages to keep them from moving while she fights. She’s wearing a bright yellow jacket, with black stripes along the sleeves and sides. The jacket is so small on her that you doubt she could zip it up if she wanted to. Like the jacket, her pants are bright yellow and look <b>very</b> small on her, almost painted on. Her torso, aside from her massive K-Cup tits, is what you’d call athletic. Her arms are svelte, but with highly visible muscle, and her waist is tight with pronounced six-pack abs. Her legs, by contrast, are massive. Her thighs are almost wider than her torso, and her ass looks like it could deflect a torpedo with how much padding it has. Her skintight pants do a horrible job of hiding how much muscle is packed into her legs, not to mention the massive bulge that looks like it’s about to rip her pants open. She’s coming at you with a manic look on her face. She has thick, black gauntlets and greaves that let off large crackles every few seconds.";
					if (HPQ() < 75) eText += "\n\nShe’s coated in sweat and looking very winded.";
					if (lustQ() > 30) eText += "\n\nShe’s looking very flustered. The bulge in her pants is starting to twitch and flex.";
					if (hasStatusEffect("Counters Melee")) eText += "\n\nHer eyes are focused intently on you, she’s not even blinking! <b>It might not be a good idea to attack her head-on or give her an opening.</b>";
					if (kGAMECLASS.pc.hasStatusEffect("Grappled")) eText += "\n\n<b>She has you held tightly in her arm.</b>";
					break;
				case 1:
					eText = "Outwardly, not much about Shizuya has changed. If anything she looks less intimidating at a passing glance, her crazed expression replaced with a straighter, more focused scowl. But, despite her calm expression, her slitted eyes pierce you like daggers, staying locked onto you, reading every move you make. Her movements carry an extra weight to them, making her exude an aura of menace with every step. Even her gauntlets are more composed, the random crackling replaced with a soft, constant glow that seems to spread to her whole body.";
					if (HPQ() < 25) eText += "\n\nDespite all the injuries she’s taken, her expression never shifts, her focus never leaving you. It looks like she’s going to push herself until her body completely gives out!";
					if (hasStatusEffect("Counters Melee")) eText += "\n\nHer eyes are focused even more intently on you, she’s not even blinking! <b>It might not be a good idea to attack her head-on or give her an opening.</b>";
					if (kGAMECLASS.pc.hasStatusEffect("Grappled")) eText += "\n\n<b>She has you held tightly in her arm.</b>";
					break;
				case 2:
					eText = "It’s hard to believe this is the same woman you were just fighting. Her eyes are still locked on you, but her expression is one of pure want, with small strings of drool leaking from her mouth. Instead of taking an offensive stance, she takes every opportunity to grope herself seductively, the electric shocks of her gauntlets only seeming to excite her further. Her nipples are straining her bandages to the limit, with large drops of pearly white seeping out the tips.";
					if (lust() < 90)
					{
						eText += "\n\nHer pants are equally strained. Titanic bulges run down each of her pant legs, revealing her multiple endowments, each hosing precum down her legs.";
						if (kGAMECLASS.pc.hasStatusEffect("SHIZZY CUM")) eText += "\n\n<b>She reeks so strongly of pheromones that it’s starting to get to you.</b>";
					}
					else eText += "\n\nShe’s completely given up on modesty, undoing her zipper to allow her crotch-rockets to fly free. The two foot shafts aim wantingly at you, hosing off-white streams of pre onto the floor. Her four balls are straining against her sack, filled to bursting with her cargo. They’re also soaked in sexual fluids from her yet unseen vagina.\n\n<b>Her pheromones have gotten so thick that you feel like you’re swimming in them. You’d better end this quick, before you succumb to them!</b>";
					break;
			}
			
			return eText;
		}
		
		override public function get bustDisplay():String
		{
			return "SHIZUYA";
		}
		
		override public function lustMin():Number
		{
			return Math.max(super.lustMin(), (combatMode == 2 ? 50 : 0));
		}
		/* Fen cut dis because it's super inelegant and confusing as to why it still shows damage but does nothing.
		override public function lust(arg:Number = 0, apply:Boolean = false):Number
		{
			if (combatMode == 1) return super.lust();
			else return super.lust(arg, apply);
		}*/
		
		//AI vars
		private var combatMode:int = 0;
		private var thunderCountdown:int = 0;
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var i:int;
			if (hasStatusEffect("Counters Melee"))
			{
				i = statusEffectv1("Counters Melee") + statusEffectv1("Counters Ranged");
				removeStatusEffect("Counters Melee");
				removeStatusEffect("Counters Ranged");
				if (i == 0) return output("Shizuya shrugs as you refuse to attack, retaking a more proper combat stance.");
			}
			
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (HP() < 500 && combatMode != 1)
			{
				if (combatMode == 0)
				{
					output("Shizuya falls forward after your last attack, propping herself up with her arms and panting heavily.");
					output("\n\n<i>“Giving up already?”</i> You ask, wondering if that’s all she has.");
					output("\n\n<i>“Heh... heh heh heh... ha ha ha... HA HA HA HA HA!”</i> She begins to laugh maniacally as she hoists herself back up. <i>“GIVING UP!? I HAVEN’T HAD THIS MUCH FUN SINCE... GODDAMN I CAN’T EVEN REMEMBER!”</i> She stares into your eyes with a ferociousness that somehow makes what she’s been like up until now look downright lethargic.");
					output("\n\n<i>“We ain’t stopping ‘til one of us fucking drops!”</i>");
					output("\n\nLooks like this is far from over.");
				}
				else
				{
					output("Your last blow sends her reeling back, barely managing to catch herself before she falls down. The lustful look on her face quickly shifts to confusion, and even quicker to anger.");
					output("\n\n<i>“DAMN IT! I got distracted again!”</i> She starts slapping herself across the face repeatedly. When she stops, she begins to murmur to herself. <i>“Calm down. calm down. calm down. calm... </i>sigh<i> there... Damn, Steele, you’re something else ain’t ya? Gettin’ me all hot ‘n bothered while you wail on me. Hope ya didn’t think I’d just take it lying’ down! I am gonna fuck your ass so hard after I kick it!”</i>");
					output("\n\nShe stares at you with renewed focus, retaking her fighting stance.");
				}
				combatMode = 1;
				isLustImmune = true;
				return;
			}
			else if (lust() > 50 && combatMode == 0)
			{
				output(" You’re really starting to wear her down. She’s panting and sweating, and her pants are straining to hold in her package.");
				output("\n\n<i>“I-I thought... we were gonna settle this with our fists... But if this is how ya want it.... THEN I’LL FUCK YOU INTO THE GROUND!”</i>");
				output("\n\nHer entire demeanor shifts in an instant, her determined expression shifting to one of pure want, and her stance shifting to accentuate her “features”. Looks like this is turning into a different kind of fight!");
				if (target.hasStatusEffect("Grappled")) target.setStatusValue("Grappled", 4, 0);
				combatMode = 2;
				return;
			}
			
			switch(combatMode)
			{
				case 0: case 1: normalAI(target); break;
				case 2: lustAI(target); break;
			}
		}
		
		private function normalAI(target:Creature):void
		{
			if (target.hasStatusEffect("Grappled")) return grapple(target);
			++thunderCountdown;
			if (hasStatusEffect("Counters Melee")) return;
			if (thunderCountdown >= 4) return thunderBreak(target);
			switch(rand(6))
			{
				case 0: return countercats();
				case 1: return grapple(target);
				default: return regularAttack(target);
			}
		}
		
		private function thunderBreak(target:Creature):void
		{
			thunderCountdown = 0;
			var dmg:TypeCollection = meleeDamage();
			dmg.electric.damageValue += dmg.kinetic.damageValue;
			dmg.kinetic.damageValue = 0;
			
			output("Shizuya aims her hands at you, palms out. The electricity around her hands goes berserk, arcing around the room before settling into her palms. She closes her hands and a massive surge of electricity shoots toward you.");
			if (combatMiss(this, target, attack()-8) || blindMiss(this, target, true)) output(" You manage to dodge out of the way just in time, though your [pc.hair] is still standing on edge.");
			else
			{
				output(" The surge hits you like a truck, making you feel extra crispy.");
				if (this.aim()/2 + rand(20) + 1 > target.physique()/2 + 10){
					CombatAttacks.applyStun(target,1);
					output(" Every part of your body is tingling with electricity, making it hard to move. <b>You are stunned!</b>");
				}
				else output(" Your whole body is tingling, but you manage to fight through it.");
				applyDamage(damageRand(dmg, 20).multiply(2.5), this, target, "minimal");
			}
		}
		
		private function regularAttack(target:Creature):void
		{
			var variation:int = rand(3);
			switch(variation)
			{
				case 0: output("Shizuya closes in and takes a few jabs."); break;
				case 1: output("Shizuya rears a kick aimed at your face, missing by less than an inch."); break;
				case 2: output("Shizuya lunges at you"); break;
			}
		
			if (combatMiss(this, target) || blindMiss(this, target, true)){
				switch(variation)
				{
					case 0: output(" She tries to fake you out, but you parry all of her blows expertly."); break;
					case 1: output(" She tries to put out another, but you dodge out of the way before it can connect."); break;
					case 2: output(" but you manage to avoid her blows."); break;
				}
			}
			else
			{
				switch(variation)
				{
					case 0: 
						if (combatMode == 1) output(" She fakes you out with her left hand, allowing her right to deliver a solid blow to your gut, before her left hand comes back and socks you in the face.");
						else output(" She fakes you out with her left hand, while her right hand socks you across the face. Ouch!");
						break;
					case 1: 
						if (combatMode == 1) output(" Just when her foot touches the ground, she uses her other leg to kick you square in the gut, before bringing the other around again for another hit.");
						else output(" Just when her foot touches the ground, she uses her other leg to kick you square in the gut.");
						break;
					case 2: 
						if (combatMode == 1) output(" and delivers a solid blow to your chest, before using her other hand to slam you right in the gut.");
						else output(" and delivers a solid hit to your chest.");
						break;
				}
				applyDamage(damageRand(meleeDamage(), 20), this, target, "minimal");
				if (combatMode == 1) applyDamage(damageRand(meleeDamage(), 20), this, target, "minimal");
			}
		}
		
		private function grapple(target:Creature):void
		{
			//lustgrapple
			if (combatMode == 2)
			{
				if (target.hasStatusEffect("Grappled"))
				{
					target.addStatusValue("Grappled", 4, 1);
					
					switch (target.statusEffectv4("Grappled"))
					{
						case 1: output("Shizuya gently kneads your [pc.chest], squeezing your [pc.nipples]. Her gauntlets are sending small electric jolts into your [pc.chest], sending shocks of pleasure through your body. While she’s doing that, she begins to hump your [pc.butt], smearing your backside with her pre.\n\n<i>“Just give in, I’ll treat you real nice... unless you want it rough...”</i>"); break;
						case 2: output("Shizuya is tugging at your [pc.nipples], becoming more and more rough as time goes on. The shocks she’s putting into you are also becoming more intense, making you jump at each surge. Her humps are taking on a wetter, more desperate tone. If she weren’t hosing your [pc.butt] with so much precum she’d be rubbing you raw!"); break;
						case 3: output("This is getting bad! Her shocks have grown so strong that your vision is starting to blur with each. You’re kept on the line between pleasure and pain, crossing over for just long enough to leave you deliciously sore. Her humping has grown frantic, pounding you with enough force to send you bouncing in her grip, and releasing enough precum to make your [pc.butt] feel like a waterfall.\n\n<i>“I’m sooooo close, lover. D-do you want me to... Gah... mark you? To... to own you?”</i>\n\n<b>This is bad, you need to get her off NOW!</b>"); break;
						case 4:
							output("<i>“Oh- OH GOD! THIS IS IT, LOVER!”</i>");
							output("\n\nYou try to struggle, but she’s knocked all the resistance out of you. You can’t do anything as she throws you onto your back, fishes her dicks out of her pants and aims them directly at you. Fountains of cum gush out, coating you from head to toe. She gives you a few full layers before finally stopping and falling backwards onto her ass. Thankfully she seems to need just as much time as you to recover from that. You stand back up to see her finish stuffing her still-hard pricks back into her pants. Just how virile is she? She just came what seems like gallons and she still looks pent up!");
							target.applyCumSoaked();
							if (target.hasStatusEffect("SHIZZY CUM")) target.addStatusValue("SHIZZY CUM", 1, 5);
							else target.createStatusEffect("SHIZZY CUM",10,0,0,0,true,"","",true);
							lust(-30);
							break;
					}
					quickLust(target.statusEffectv4("Grappled")*5+rand(6), this);
					if (target.statusEffectv4("Grappled") == 4) target.removeStatusEffect("Grappled");
				}
				else
				{
					output("Shizuya saunters over to you, making sure to accentuate the movement of her hips and package. She licks her lips before pouncing on you.");
					if (combatMiss(this, target) || blindMiss(this, target, true))
					{
						output(" She knocks you to the ground and circles around you before you can get up. She hoists you up from behind, restaining you while groping your [pc.chest] and pressing her crotch against your [pc.butt].");
						CombatAttacks.applyGrapple(target);
					}
					else output(" You manage to fend her off before she can restrain you. She steps back, disappointed but still determined to lay you.");
				}
			}
			else
			{
				if (target.hasStatusEffect("Grappled"))
				{
					if (target.statusEffectv4("Grappled") < 3)
					{
						output("Shizuya tightens her grip even more, winds her head back, and slams it into yours. Ouch!");
						applyDamage(damageRand(meleeDamage(), 20).multiply(0.75), this, target, "minimal");
						target.addStatusValue("Grappled", 4, 1);
					}
					else
					{
						output("As you continue to struggle against her, you gasp in sudden shock as she lifts you off the ground.");
						if (combatMiss(this, target) || blindMiss(this, target, true) || target.isPlanted()) output(" She rears back, attempting to throw you, but you shift your weight just in time to throw her off balance. She falls to the ground, and you manage to slip out of her grip and ready yourself as she gets up.");
						else
						{
							output(" She rears back, hoisting you over her, and slams you into the ground behind her! You’re not grappled anymore, but that hurt like hell and you’re still on the ground.");
							applyDamage(damageRand(meleeDamage(), 20).multiply(2), this, target, "minimal");
							CombatAttacks.applyTrip(target);
						}
						target.removeStatusEffect("Grappled");
					}
				}	
				else
				{
					output("Shizuya suddenly closes in on you with amazing speed.");
					if (combatMiss(this, target) || blindMiss(this, target, true))
					{
						output(" You’re caught off guard and she manages to squeeze you into a massive bearhug, practically immobilizing you!");
						CombatAttacks.applyGrapple(target);
					}
					else output(" However, you stay focused and manage to fend her off before she can do anything nasty.");
				}
			}
		}
		
		private function countercats():void
		{
			output("Shizuya doesn’t attack, and instead stares at you intently.");
			createStatusEffect("Counters Melee",0,0,0,0,true,"","",true);
			createStatusEffect("Counters Ranged",0,0,0,0,true,"","",true);
		}
		
		public function counterAttack(target:Creature, melee:Boolean = false):void
		{
			var canStagger:Boolean =  (!target.isPlanted());
			if (melee) output("You go in for an attack, only for her to " + (canStagger ? "knock your feet from under you" : "swiftly dodge your attack") + ", giving you a parting punch in the gut before you " + (canStagger ? "land on your ass, still reeling" : "recover") + " from her blow.");
			else output("In the split-second it takes you to aim, she’s already on you. Delivering a swift punch to the gut" + (canStagger ? " before kicking your feet from under you. You get up" : ". You attempt to recover") + ", still winded from her attack.");
			output("\n\n<b>You are staggered!</b>");
			applyDamage(damageRand(meleeDamage(), 20), this, target, "minimal");
			if(melee) setStatusValue("Counters Melee", 1, 1);
			else setStatusValue("Counters Ranged", 1, 1);
			if(canStagger) CombatAttacks.applyStagger(target);
		}
		
		//Goddamn this function is complicated
		private function lustAI(target:Creature):void
		{
			if (target.hasStatusEffect("Grappled") || rand(4) == 0) return grapple(target);
			else return lustAttack(target);
		}
		
		private function lustAttack(target:Creature):void
		{
			var hit:Boolean = rand(lustMax()) < lust();
			var lustdmg:int = 10 + rand(11);
			switch(rand((lust() < 90 ? 3 : 4)))
			{
				case 0:
					output("Shizuya begins to grope herself more vigorously, running one hand down her lengths and using the other to expose one of her nipples. Streams of milk begin to run down her breast, while her pricks continue to drool their copious pre.\n\n<i>“It’s all delicious, why not come and have a taste?”</i>");
					if (hit) output(" Her words and actions penetrate your mind, getting you hot under the collar.");
					else output(" You ignore her lewd display, keeping your focus on the fight.");
					break;
				case 1:
					output("Shizuya dashes up to you and begins to grope your [pc.chest], her gauntlets beginning to spark.");
					if (hit)
					{
						output(" Small shocks surge into your [pc.chest], sending pleasure throughout your body. You push her off quickly, but you still feel horny from her assault.");
						applyDamage(new TypeCollection({electric: 5}), this, target, "minimal");
					}
					else output(" Acting quickly, you push her back just as a small surge shoots from her gauntlets.");
					break;
				case 2:
					output("<i>“Oh, maybe you’re not into dicks... that’s okay.”</i>");
					output("\n\nShe turns around, reaching her hands into her pants and pulling them down. She makes a show of it, pulling down slowly and shaking her hips with each tug. When her whole ass is exposed, she bends over, reaching back and spreading her cheeks and fingering her sopping, puffy pussy.");
					output("\n\n<i>“I’ve got ya covered...”</i>");
					output("\n\nShe gives a sultry look before tugging her pants back up and facing you, making sure to lick the pussy juice from her fingers.");
					if (hit) output("\n\nThe image of her rump and pussy feels like it’s burned into your mind, still as clear now as it was when you could see it.");
					else output("\n\nYou shake off your lewd thoughts, calming your blood before it boils over.");
					break;
				case 3:
					output("Shizuya squeezes her massive balls with one hand, while catching the resulting spray of pre with the other.");
					output("\n\n<i>“There’s so much here, it’d be a shame not to share!”</i>");
					output("\n\nShe charges at you with wild eyes, both of her hands soaked in copious precum.");
					if (hit) output("\n\nShe grabs you by the face and tackles you to the ground, smearing your face with her juices. She pounces off of you, hoisting her dicks in your direction. <i>“Plenty more where that came from. Why not come get some more?”</i> You get up and wipe your face off, but the smell won’t go away!");
					else output("\n\nShe reaches for your face, but you manage to catch her arms before she can touch you. You both go tumbling to the ground, her hands scraping across the floor, wiping her pre off them. <i>“What a waste...”</i> She says disappointedly as you both get up.");
					lustdmg *= 1.5;
					break;
			}
			if (hit) quickLust(lustdmg, this);
		}
		
		public function freshenUp():void
		{
			removeStatuses();
			maxOutHP();
			maxOutEnergy();
			combatMode = 0;
			thunderCountdown = 0;
			isLustImmune = false;
			lust(35, true);
		}
	}
}