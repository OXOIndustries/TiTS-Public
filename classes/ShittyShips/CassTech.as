package classes.ShittyShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class Casstech extends ShittyShip
	{
		//constructor
		public function Casstech()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Casstech Z14";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS2";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "THRALL";
			this.modelDisplay = "Z14";
			this.factionDisplay = "T.HORDE";

			this.a = "a ";
			this.capitalA = "A ";
			this.long = "It’s been painted bright red with silvery stripes. Looking at it again, you realize that you recognize this from some of your father’s holo-pics, at least the ones he’d let you see. This is the same ship that he took out on the Thirteenth Planet Rush, almost two centuries ago.";
			this.customBlock = "He easily avoids your attack.";
			this.customDodge = "He easily avoids your attack.";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "overalls";
			this.armor.description = "a pair of overalls";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.shield = new NovaShield();

			this.physiqueRaw = 50;
			this.reflexesRaw = 37;
			this.aimRaw = 14;
			this.intelligenceRaw = 26;
			this.willpowerRaw = 20;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;

			baseHPResistances = new TypeCollection();
			baseHPResistances.tease.damageValue = 25.0;
			baseHPResistances.drug.damageValue = 50.0;
			baseHPResistances.burning.damageValue = 50.0;
			
			this.level = 10;
			this.XPRaw = bossXP();
			this.credits = 500;
			this.HPMod = 550;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			
			/*
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Tough 2",0,0,0,0);
			this.createPerk("Juggernaut",0,0,0,0);
			this.createPerk("Iron Will",0,0,0,0);
			this.createPerk("Single Minded",0,0,0,0);
			this.createPerk("Riposte",0,0,0,0);*/
			isUniqueInFight = true;
			btnTargetText = "CT.Z14";
			//setDefaultSexualPreferences();
			//sexualPreferences.setRandomPrefs(3 + rand(3));
			//Giant tiddies
			//Softythicc
			//Big boot

			//masculine
			//tone
			//huge dicks
			//scales

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}

		override public function get bustDisplay():String
		{
			return "Z14";
		}

		//Combat Abilities
		//Agrosh is a tank. He has boatloads of Heath and high damage resistances. He starts with high Lust Resistance, but it degrades every turn as he gets progressively more turned on by the fighting. He has ~75% Heat (or thermal or w/e it is) resistance from working in the hot Foundry fabrication facility all day.
		//He has the Mercenary perks/abilities Tough II, Juggernaut, Iron Will, Single Minded, & Riposte
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(this.hasStatusEffect("Stunned")) psycheUp(target);
			else if(CombatManager.getRoundCount() % 4 == 0 && energy() >= 25)
			{
				//As the PC attack
				CombatAttacks.HeadbuttImpl(alliedCreatures, hostileCreatures, this, target);
				energy( -25);
			}
			else if(rand(3) == 0) goringRush(target);
			else oneTwoHaymaker(target);
		}

		//One-Two-Haymaker
		//Basic attack, used most of the time. Three attacks, the third of which deals higher damage and can stagger.
		public function oneTwoHaymaker(target:Creature):void
		{
			output("The thraggen brute rushes you, fists swinging. One, two, <i>three</i>!");
			if (!this.hasStatusEffect("Riposting")) this.createStatusEffect("Riposting", 0, 0, 0, 0, true, "", "", true, 0);
			//each hit
			for(var ii:int = 0; ii < 3; ii++)
			{
				output("\nThe ");
				if(ii == 0) output("first");
				else if(ii == 1) output("second");
				else output("third");
				output(" punch ");
				if(combatMiss(this, target)) output("misses!");
				else
				{
					output("hits!");
					if(ii < 2) applyDamage(meleeDamage().multiply(0.5), this, target,"minimal");
					if(ii == 2) 
					{
						output(" The third strike comes in as a brutal haymaker");
						if(!target.isPlanted())
						{
							output(", <b>leaving you staggering back</b>");
							CombatAttacks.applyStagger(target, 3);
						}
						output("!");
						applyDamage(meleeDamage(), this, target,"minimal");
					}
				}
			}
		}
		//Goring Rush
		//Deals high Penetrating damage and knocks the PC prone on a failed Physique test.
		public function goringRush(target:Creature):void
		{
			output("With a bellowing roar, Agrosh comes at you like a raging bull, head low and tusks aimed right for you! ");
			if(combatMiss(this, target)) output(" You side-step him, letting the thraggen’s momentum carry him right past you!");
			else 
			{
				output(" He crashes into you like a freighter with a suped-up LightDrive, throwing you backwards and digging his tusks deep into you!");
				applyDamage(meleeDamage(), this, target,"minimal");
				//Prone: 
				if(target.physique()/2 + rand(20) + 1 >= this.physique()/2 + 10 && !target.hasStatusEffect("Tripped") && !target.isPlanted()) 
				{
					output("\n<b>You’re knocked down</b> by the impact!");
					CombatAttacks.applyTrip(target);
				}
				else output("\nYou manage to keep your footing... barely!");
			}
		}
		//Psyche Up
		//When Agrosh would be stunned, he gains 10 Lust damage and shrugs the condition off at the start of his next turn.
		public function psycheUp(target:Creature):void
		{
			output("<i>“That the best you got!?”</i> Agrosh growls, grabbing his crotch. <i>“Fuck, that just turns me on! Stop trying to fight me and FIGHT ME!”</i>");
			applyDamage(new TypeCollection( { tease: 40 } ), target, this,"minimal");
			this.removeStatusEffect("Stunned");
		}
	}
}