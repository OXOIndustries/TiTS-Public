package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Characters.PlayerCharacter;
	import classes.Items.Guns.FlamethrowerII;
	import classes.Items.Protection.SalamanderShield;
	import classes.Items.Piercings.SilverStudPiercing;
	import classes.Items.Piercings.SilverRingPiercings;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Utility.*;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class CoronaFlamer extends Creature
	{
		public function CoronaFlamer()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;

			this.btnTargetText = "Flamer";
			this.short = "Corona Flamer";
			this.originalRace = "huskar";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Dressed in nothing but her shoulder and waist-mounted coolant rigs she’s a saucy sight, but her otherwise pretty features are twisted into the cruel grin of a pyromaniac. This woman is wild, unrestrained by things like morality; she just wants to watch everything burn as the flames dance in the reflection of her glittering eyes, and she’s got the ammunition to do it. Strapped to the backs of her shoulders are tanks of fuel, ready to be slammed home into her heavy flamer.";
			this.long += "\n\nHer heavy breasts are barely constrained by a tight strap running around her chest, just obscuring her nipples beneath it. That’s all she’s wearing aside from the combat visor and the straps around her body, the purpose of which are either to hold ammunition or draw well-deserved attention to her incredibly fine physique, you’re not sure which.";
			this.customBlock = "She easily avoids your attack.";
			this.customDodge = "She easily avoids your attack.";
			this.isPlural = false;
			this.isUniqueInFight = true;

			this.rangedWeapon = new FlamethrowerII();
			this.rangedWeapon.baseDamage.multiply(2.5);
			this.rangedWeapon.hasRandomProperties = true;

			this.armor.longName = "straps";
			this.armor.description = "a collection of taut straps";
			this.armor.resistances.kinetic.resistanceValue = 15;
			this.armor.resistances.burning.resistanceValue = 35;
			this.shield.resistances.freezing.resistanceValue = -25;
			this.armor.hasRandomProperties = true;

			this.shield = new SalamanderShield();
			this.shield.shields = 300;
			this.shield.resistances.kinetic.resistanceValue = 35;
			this.shield.resistances.burning.resistanceValue = 65;
			this.shield.resistances.freezing.resistanceValue = -25;
			this.shield.hasRandomProperties = true;

			this.baseHPResistances.kinetic.resistanceValue = 20;
			this.baseHPResistances.burning.resistanceValue = 30;

			this.characterClass = GLOBAL.CLASS_MERCENARY;
			this.physiqueRaw = 35;
			this.reflexesRaw = 45;
			this.aimRaw = 20;
			this.intelligenceRaw = 30;
			this.willpowerRaw = 40;
			this.libidoRaw = 85;
			
			this.energyRaw = 100;
			this.lustRaw = 25;

			this.level = 10;
			this.XPRaw = normalXP();
			this.credits = 250 + rand(351);
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			// Body
			this.tone = 60;
			this.tallness = 77;
			this.thickness = 80;
			this.femininity = 75;
			this.addSkinFlag(GLOBAL.FLAG_FLUFFY);
			this.furColor = "white";
			this.skinTone = "tan";
			this.hipRatingRaw = 16;
			this.buttRatingRaw = 8;
			this.breastRows[0].breastRatingRaw = 16;
			this.nippleWidthRatio = 2;

			// Head
			this.hairColor = "white";
			this.hairLength = 14;
			this.eyeColor = "green";
			this.earType = GLOBAL.TYPE_CANINE;
			this.earFlags = [GLOBAL.FLAG_TAPERED, GLOBAL.FLAG_FURRED];
			createPerk("Regal Mane", GLOBAL.FLAG_FURRED, 0, 0, 0, "");
			this.earPiercing = new SilverRingPiercings();
			this.nosePiercing = new SilverStudPiercing();

			// Limbs
			this.armType = GLOBAL.TYPE_CANINE;
			this.armFlags = [GLOBAL.FLAG_FURRED, GLOBAL.FLAG_FLUFFY];
			this.legType = GLOBAL.TYPE_CANINE;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_FURRED, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_PAWS];
			this.tailCount = 1;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailFlags = [GLOBAL.FLAG_SHORT, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];

			// Fun Bits
			createVagina();
			this.vaginas[0].wetnessRaw = 6;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].hymen = false;
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;

			analVirgin = false;
			vaginalVirgin = false;
			
			//createStatusEffect("Disarm Immune");
			
			createPerk("Appearance Enabled");

			setDefaultSexualPreferences();
			kGAMECLASS.zhengShiSSTDChance(this);
		}

		override public function get bustDisplay():String
		{
			return "FIREPUP";
		}

		override public function setDefaultSexualPreferences():void
		{
			//Loves
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,			GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,				GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,			GLOBAL.REALLY_LIKES_SEXPREF);
			
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS,		GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,				GLOBAL.REALLY_DISLIKES_SEXPREF);
		}

		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			if (rand(6) == 0 || hasStatusEffect("Disarmed")) doggoThrowsYouAnExplosiveBone(target);
			else if (rand(5) == 0) fireBitchGoesOffEarly(target);
			else if (rand(2) == 0 && !hasStatusEffect("Blue Fire Cooldown")) theBlueFlamesAreLuckier(target);
			else setSomeBitchesOnFire(hostileCreatures);
		}

		private function setSomeBitchesOnFire(hostileCreatures:Array):void
		{
			output("The Flamer depresses the trigger on her weapon and sweeps it in a wide arc, clouds of flame spewing from the barrel as her maniacal laughter fills the remaining air!");

			var hits:int = 0;
			var dmg:TypeCollection = rangedDamage();
			var critDmg:TypeCollection = dmg.makeCopy().multiply(1.5);
			for each (var target:Creature in hostileCreatures)
			{
				kGAMECLASS.setTarget(target);
				// No blind miss check 'cause flamers skip those anyways
				if (rangedCombatMiss(this, target)) output("\n\n[target.CombatName] " + (target is PlayerCharacter ? "manage" : "manages") + " to get out of the way completely, the heat licking at the ground ineffectually. The Flamer looks on in glee, her eyes shining with almost religious fervor.");
				else if (rand(20) == 0)
				{
					output("\n\nFire surrounds");
					if (target.shields() > 0) output(" [target.combatName], burning [target.combatHisHer] fizzling shields until they <b>penetrate momentarily and [target.combatHeShe] " + (target is PlayerCharacter ? "catch" : "catches") + " alight!</b>");
					else if (target is PlayerCharacter) output(" you as you try to escape, your limbs smoldering until <b>you catch alight!</b>");
					else output(" [target.combatName] as [target.combatHeShe] tries to escape, [target.combatHisHer] limbs smoldering until <b>[target.combatHeShe] catches alight!</b>");
					applyDamage(damageRand(critDmg, 15), this, target, "minimal");
					//sets Burn on a crit. Probably massive damage if you're unshielded.
					CombatAttacks.applyBurn(target);
					hits++;
				}
				else
				{
					if (target.shields() > 0) output("\n\n" + (target is PlayerCharacter ? "Your" : "[target.CombatName]’s") + " shields take the brunt of the heat, crackling against the flames.");
					else output("\n\nShit! Without shields, these flames <i>really</i> hurt" + (target is PlayerCharacter ? "!" : " [target.combatName]!"));
					applyDamage(damageRand(dmg, 25), this, target, "minimal");
					hits++;
				}
			}
			
			if (hits > 0) output("\n\n<i>“Hahahaha!”</i> the Flamer screams through the smoke. <i>“Burn, mother" + (hits > 1 ? "fuckers" : "fucker") + "!”</i>");
		}

		//doesn't crit. Has a few turns cooldown (3?).
		private function theBlueFlamesAreLuckier(target:Creature):void
		{
			var dmg:TypeCollection = rangedDamage().multiply(0.6);
			dmg.addFlag(DamageFlag.BYPASS_SHIELD);

			kGAMECLASS.setTarget(target);
			output("The huskar woman pops the ammunition canister from her flamethrower and slams in a new one underhand, this one clearly different from the last. With a wide, snarling grin she pulls the trigger and the flame that pours from her weapon in a focused stream is blue! She aims it directly at [target.combatHimHer], following [target.combatHisHer] movements!");
			if (rangedCombatMiss(this, target, attack(false) - 5)) output("\n\nThe width of the stream winds up being its undoing, allowing you to keep it at bay as you twist and turn out of its way. The huskar growls in disappointment, dropping the spent canister.");
			else
			{
				output("\n\nThe flame licks at");
				if (target.shields() > 0) output(" [target.combatHisHer] shields and to [target.combatHisHer] surprise, <b>momentarily penetrates them!</b>");
				else output(" [target.combatHimHer], completely deadening the nerves of any limb it grazes!");
				output(" The huskar just grins, keeping the nozzle trained on you until the canister runs dry and she swaps in a new one.");
				applyDamage(damageRand(dmg, 20), this, target, "minimal");
			}

			createStatusEffect("Blue Fire Cooldown", 3);
		}

		private function doggoThrowsYouAnExplosiveBone(target:Creature):void
		{
			kGAMECLASS.setTarget(target);
			output("The Flamer draws a metallic orb from behind her, spinning it in her hand until she’s got a good grip and hefts it in " + (target is PlayerCharacter ? "your" : "[target.combatName]’s") + " direction -- and she does <i>not</i> throw like a girl. It lands in front of [target.combatHimHer] and [target.combatHeShe] " + (target is PlayerCharacter ? "have" : "has") + " just enough time to register the Reaper logo on the front; it’s an incendiary grenade!");
			if ((rand(target.reflexes() / 3) + target.reflexes() / 2) >= 30) output("\n\n[target.CombatHeShe] " + (target is PlayerCharacter ? "leap" : "leaps") + " back just in time to avoid the ball of scorching white plasma, catching the heat radiating from it. That was close!");
			else
			{
				output("\n\nLeft without enough time to avoid it, the grenade detonates in a ball of scorching white plasma, blasting [target.combatHimHer] with heat!");
				applyDamage(damageRand(new TypeCollection({ burning: 75 }), 30), this, target, "minimal");
			}
		}

		private function fireBitchGoesOffEarly(target:Creature):void
		{
			kGAMECLASS.setTarget(target);
			output("The huskar woman reaches back and grabs a shiny orb, spinning it in her hand until she’s got a good grip and hefts it into the air. She tracks its descent as it approaches [target.combatName], aiming her flamethrower in its arcing path and hitting the falling projectile in midair.");
			output("\n\nIt immediately explodes into a ball of fire; there must have been something highly volatile inside!");
			if ((rand(target.reflexes() / 3) + target.reflexes() / 2) >= 40) output(" [target.CombatHeShe] narrowly " + (target is PlayerCharacter ? "avoid" : "avoids") + " having it burn [target.combatHisHer] face off, leaping back to avoid both the explosion and the flaming ground it leaves behind.");
			else
			{
				output(" Unable to avoid the explosion, [target.combatHeShe] " + (target is PlayerCharacter ? "find yourself" : "finds [target.combatHimHer]self") + " leaping back to avoid the flaming ground!");
				applyDamage(damageRand(new TypeCollection({ burning: 75 }), 30), this, target, "minimal");
			}	
		}
	}
}