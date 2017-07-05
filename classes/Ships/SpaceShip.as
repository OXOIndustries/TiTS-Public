package classes.Ships 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.DataManager.Serialization.VersionedSaveableV2;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.ShipCombat.DamageTypes.*;
	import classes.Engine.ShipCombat.*
	import classes.Resources.StatusIcons;
	import classes.Ships.Actions.ShipAction;
	import classes.Ships.Map.*;
	import classes.Ships.Map.Library.TestMapInterior;
	import classes.Ships.Modules.*;
	import classes.Ships.Modules.UpgradeModules.*;
	import classes.kGAMECLASS;
	import classes.StorageClass;
	import classes.GameData.CombatManager;
	import classes.Engine.Utility.*;
	import classes.Engine.Interfaces.*;
	
	//TODO: Weapon assignments
	//TODO: Console assignments
	//TODO: Skill rank value added to any rolls to avoid being hacked.
	//TODO: Support console position assignments middlemanning the bonuses from the flat OwningCreature
	//TODO: Staffing Engine module provides bonuses to evasion/speed
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SpaceShip extends VersionedSaveableV2 implements IOwner
	{
		private var _owner:IOwner;
		public function get Owner():IOwner { return _owner; }
		public function set Owner(owner:IOwner):void { _owner = owner; }
	
		// Owner is essentially the pilot, so we'll have a nicer accessor in addition to the base IOwned 
		// interface even though we don't implement IOwned directly (because it has serialization implications)
		public function get OwningCharacter():Creature { return (_owner == null ? null : _owner as Creature); }
		public function get IsPlayerShip():Boolean { return (OwningCharacter is PlayerCharacter); }
		
		public function SpaceShip() 
		{
			_temporaryEffects = { };
			_statusEffects = { };
			
			_lightdriveModule = new LightdriveModule(this);
			_engineModule = new EngineModule(this);
			_shieldModule = new ShieldModule(this);
			_hullArmoringModule = new HullArmoringModule(this);
			_reactorModule = new ReactorModule(this);
			_capacitorModule = new CapacitorModule(this);
			_gunneryModule = new GunneryModule(this);
			
			_inherentGadgets = [];
			
			_hullMaxBase = 100;
			Hull = HullMax;
			
			_armor = _shieldHardness = 0;
			
			_shieldsMaxBase = 100;
			Shields = ShieldsMax;
			
			_capacitorMaxBase = 100;
			Capacitor = CapacitorMax;
			
			_targeting = _thrust = _aim = _agility = _systems = 10;
			_power = 1000;
			
			_internalMap = new TestMapInterior(this);
			
			_storageTypeGeneral = 10;
			_storageTypeConsumable = 20;
			_storageTypeArmor = 10;
			_storageTypeWeapons = 20;
			
			_inventory = [];
			_fittedModules = [];
			_level = 1;
			
			_hullResistances = new ShipTypeCollection( { em: 50, kin: 20, exp: 10, therm: 40 }, ShipDamageFlag.TYPE_HULL);
			_shieldResistances = new ShipTypeCollection( { em: 0, kin: 40, exp: 60, therm: 20 }, ShipDamageFlag.TYPE_SHIELD);
		}
		
		//{ region Display & other info
		
		[Serialize]
		public var _name:String;
		public function get Name():String { return _name; }
		public function set Name(v:String):void { _name = v; }
		
		public function CombatName(cap:Boolean = false):String
		{
			return (cap ? "The " : "the ") + _name;
		}
		public function CombatNameFormatted(cap:Boolean = false):String
		{
			return (cap ? "<i>The " : "<i>the ") + _name + "</i>";
		}
		
		protected var _manufacturer:String;
		public function get Manufacturer():String { return _manufacturer; }
		
		protected var _model:String;
		public function get Model():String { return _model; }
		
		protected var _baseValue:int;
		public function get BaseValue():int { return _baseValue; }
		
		//} endregion
		
		//{ region Basic stats
		
		protected var _level:Number;
		public function get Level():Number { return _level; }
		
		[Serialize]
		public var _hull:Number;
		public function get Hull():Number { return _hull; }
		public function set Hull(v:Number):void { _hull = v; }
		
		protected var _hullMaxBase:Number;
		public function get HullMax():Number
		{ 
			var h:Number = _hullMaxBase;
			var m:Number = 1.0;
			
			var dm:Array = GetDefensiveModules();
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				h += dmm.BonusHull;
				m += dmm.BonusHullMultiplier;
			}
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Hull");
			if (payload != null)
			{
				h += payload.hull;
				m += payload.hullMultiplier;
			}
			
			h += HullArmoring.HullBonus;
			m += HullArmoring.HullMultiplier;
			
			// TODO: @Fenoxo: Sign off on potential hull bonus
			// I don't really know what the intended value ranges are for any of this, so its hard to ass-pull a good solution yet
			if (OwningCharacter != null)
			{
				h += OwningCharacter.willpower();
			}
			
			return h * m;
		}
		
		public function get HullPercent():Number { return Hull / HullMax; }
		
		public function get HullRechargePerRound():Number
		{
			var r:Number = HullArmoring.RechargeRatePerRound;
			var m:Number = 1.0 + HullArmoring.RechargeRateMultiplier;
			
			var dm:Array = GetDefensiveModules();
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				r += dmm.BonusHullRechargePerMinute;
				m += dmm.BonusHullRechargeMultiplier;
			}
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Shield");
			if (payload != null)
			{
				r += payload.hullRechargePerRound;
				m += payload.hullRechargeMultiplier;
			}
			
			if (ShieldGenerator.HookedCrew != null)
			{
				var perk:StorageClass = HullArmoring.HookedCrew.getPerkEffect("Crew Skill - Mechanic");
				if (perk != null)
				{
					r += (HullMax * (perk.value1 * 0.015));
				}
			}
			
			return r * m;
		}
		public function get HullRechargePerMinute():Number
		{
			var r:Number = HullArmoring.RechargeRatePerMinute;
			var m:Number = 1.0 + HullArmoring.RechargeRateMultiplier;
			
			var dm:Array = GetDefensiveModules();
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				r += dmm.BonusHullRechargePerMinute;
				m += dmm.BonusHullRechargeMultiplier;
			}
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Shield");
			if (payload != null)
			{
				r += payload.hullRechargePerMinute;
				m += payload.hullRechargeMultiplier;
			}
			
			if (ShieldGenerator.HookedCrew != null)
			{
				var perk:StorageClass = ShieldGenerator.HookedCrew.getPerkEffect("Crew Skill - Mechanic");
				if (perk != null)
				{
					r += (HullMax * (perk.value1 * 0.015));
				}
			}
			
			return r * m;
		}
		
		[Serialize]
		public var _shields:Number;
		public function get Shields():Number { return _shields; }
		public function set Shields(v:Number):void { _shields = v; }
		
		protected var _shieldsMaxBase:Number;
		public function get ShieldsMax():Number 
		{ 
			var s:Number = _shieldsMaxBase;
			var m:Number = 1.0;
			
			var dm:Array = GetDefensiveModules();
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				s += dmm.BonusShields;
				m += dmm.BonusShieldsMultiplier;
			}
			
			s += ShieldGenerator.ShieldBonus;
			m += ShieldGenerator.ShieldMultiplier;
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Shield");
			if (payload != null)
			{
				s += payload.shield;
				m += payload.shieldMultiplier;
			}
			
			return s * m;
		}
		
		public function get ShieldPercent():Number { return Shields / ShieldsMax; }
		
		public function get ShieldRechargePerRound():Number
		{
			var r:Number = ShieldGenerator.RechargeRatePerRound;
			var m:Number = 1.0;
			
			var dm:Array = GetDefensiveModules();
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				r += dmm.BonusShieldRechargePerRound;
				m += dmm.BonusShieldRechargeMultiplier;
			}
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Shield");
			if (payload != null)
			{
				r += payload.shieldRechargePerRound;
				m += payload.shieldRechargeMultiplier;
			}
			
			if (ShieldGenerator.HookedCrew != null)
			{
				var perk:StorageClass = ShieldGenerator.HookedCrew.getPerkEffect("Crew Skill - Shielding");
				if (perk != null)
				{
					r += (ShieldsMax * (perk.value1 * 0.015));
				}
			}
			
			return r * m;
		}
		public function get ShieldRechargePerMinute():Number
		{
			var r:Number = ShieldGenerator.RechargeRatePerMinute;
			var m:Number = 1.0;
			
			var dm:Array = GetDefensiveModules();
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				r += dmm.BonusShieldRechargePerMinute;
				m += dmm.BonusShieldRechargeMultiplier;
			}
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Shield");
			if (payload != null)
			{
				r += payload.shieldRechargePerMinute;
				m += payload.shieldRechargeMultiplier;
			}
			
			if (ShieldGenerator.HookedCrew != null)
			{
				var perk:StorageClass = ShieldGenerator.HookedCrew.getPerkEffect("Crew Skill - Shielding");
				if (perk != null)
				{
					r += (ShieldsMax * (perk.value1 * 0.015));
				}
			}
			
			return r * m;
		}
		
		[Serialize]
		public var _capacitor:Number;
		public function get Capacitor():Number { return _capacitor; }
		public function set Capacitor(v:Number):void { _capacitor = v; }
		
		protected var _capacitorMaxBase:Number;
		public function get CapacitorMax():Number
		{ 
			var c:Number = _capacitorMaxBase + CapacitorBattery.PowerStorage;
			var m:Number = 1.0;
			
			var dm:Array = GetDefensiveModules();
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				c += dmm.BonusCapacitor;
				m += dmm.BonusCapacitorMultiplier;
			}
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Capacitor");
			if (payload != null)
			{
				c += payload.capacitor;
				m += payload.capacitorMultiplier;
			}
			
			return c * m;
		}
		
		public function get CapacitorPercent():Number { return Capacitor / CapacitorMax; }
		
		public function get CapacitorRechargePerRound():Number
		{
			var c:Number = CapacitorBattery.RechargeRatePerMinute;
			var m:Number = 1.0;
			
			var dm:Array = GetDefensiveModules();
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				c += dmm.BonusCapacitorPerRound;
				m += dmm.BonusCapacitorRechargeMultiplier;
			}
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Capacitor");
			if (payload != null)
			{
				c += payload.capacitorRechargePerRound;
				m += payload.capacitorRechargeMultiplier;
			}
			
			if (CapacitorBattery.HookedCrew != null)
			{
				var perk:StorageClass = CapacitorBattery.HookedCrew.getPerkEffect("Crew Skill - Power Specialist");
				if (perk != null)
				{
					c += (CapacitorMax * (perk.value1 * 0.015));
				}
			}
			
			return c * m;
		}
		public function get CapacitorRechargePerMinute():Number
		{
			var c:Number = CapacitorBattery.RechargeRatePerMinute;
			var m:Number = 1.0;
			
			var dm:Array = GetDefensiveModules();
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				c += dmm.BonusCapacitorPerMinute;
				m += dmm.BonusCapacitorRechargeMultiplier;
			}
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Capacitor");
			if (payload != null)
			{
				c += payload.capacitorRechargePerMinute;
				m += payload.capacitorRechargeMultiplier;
			}
			
			if (CapacitorBattery.HookedCrew != null)
			{
				var perk:StorageClass = CapacitorBattery.HookedCrew.getPerkEffect("Crew Skill - Power Specialist");
				if (perk != null)
				{
					c += (CapacitorMax * (perk.value1 * 0.015));
				}
			}
			
			return c * m;
		}
		
		protected var _targeting:Number;
		public function Targeting(flatBonus:Number = 0, bonusMul:Number = 0):Number
		{
			return TargetingStaffed(OwningCharacter, flatBonus, bonusMul);
		}
		public function TargetingStaffed(crewMember:Creature, flatBonus:Number = 0, bonusMul:Number = 0):Number
		{
			var t:Number = _targeting;
			var m:Number = 1.0 + bonusMul;
			
			var om:Array = GetOffensiveModules();
			for (var i:int = 0; i < om.length; i++)
			{
				var omm:OffensiveModule = om[i] as OffensiveModule;
				t += omm.BonusTargeting;
				m += omm.BonusTargetingMultiplier;
			}
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Targeting");
			if (payload != null)
			{
				t += payload.targeting;
				m += payload.targetingMultiplier;
			}
			
			if (crewMember != null)
			{
				var maxStat:Number = Math.max(crewMember.willpower(), crewMember.aim());
				t += (maxStat * 0.2);
			}
			
			t += flatBonus;
			
			return t * m;
		}
		
		protected var _thrust:Number;
		public function get Thrust():Number
		{ 
			var t:Number = _thrust + Engine.ThrustBonus;
			var m:Number = 1.0 + Engine.ThrustMultiplier;
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Maneuvering");
			if (payload != null)
			{
				t += payload.thrust;
				m += payload.thrustMultiplier;
			}
			
			// 20% of pilots phys or will (whichever is highest)
			if (OwningCharacter != null)
			{
				var maxStat:Number = Math.max(OwningCharacter.physique(), OwningCharacter.willpower());
				t += (maxStat * 0.2);
			}

			return t * m;
		}
		
		protected var _agility:Number;
		public function get Agility():Number
		{
			var a:Number = _agility + Engine.AgilityBonus;
			var m:Number = 1.0 + Engine.AgilityMultiplier;

			var payload:Object = GetCombinedStatusPayloads("Bonus Maneuvering");
			if (payload != null)
			{
				a += payload.agility;
				m += payload.agilityMultiplier;
			}
			
			if (OwningCharacter != null)
			{
				a += (OwningCharacter.reflexes() * 0.2);
			}

			return a * m;
		}
		
		protected var _systems:Number;
		public function get Systems():Number
		{ 
			var s:Number = _systems;
			var m:Number = 1.0;

			var payload:Object = GetCombinedStatusPayloads("Bonus Systems");
			if (payload != null)
			{
				s += payload.systems;
				m += payload.systemsMultiplier;
			}
			
			if (OwningCharacter != null)
			{
				s += (OwningCharacter.intelligence() * 0.2);
			}

			return s * m;
		}
		
		protected var _aim:Number;
		public function get Aim():Number
		{ 
			var a:Number = _aim;
			var m:Number = 1.0;

			var payload:Object = GetCombinedStatusPayloads("Bonus Aim");
			if (payload != null)
			{
				a += payload.aim;
				m += payload.aimMultiplier;
			}
			
			if (OwningCharacter != null)
			{
				a += OwningCharacter.aim();
			}

			return a * m;
		}
		
		public function get Reflexes():Number
		{
			if (OwningCharacter != null) return OwningCharacter.reflexes();
			return 0;
		}
		
		protected var _armor:Number;
		public function get Armor():Number
		{
			var a:Number = _armor;
			var m:Number = 1.0;

			var dm:Array = GetDefensiveModules();
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;

				a += dmm.BonusArmor;
				m += dmm.BonusArmorMultiplier;
			}

			var payload:Object = GetCombinedStatusPayloads("Bonus Armor");
			if (payload != null)
			{
				a += payload.armor;
				m += payload.armorMultiplier;
			}

			return a * m;
		}

		protected var _shieldHardness:Number;
		public function get ShieldHardness():Number
		{
			var s:Number = ShieldGenerator.ShieldHardness;
			var m:Number = 1.0;

			var dm:Array = GetDefensiveModules();
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;

				s += dmm.BonusShieldHardness;
				m += dmm.BonusShieldHardnessMultiplier;
			}

			var payload:Object = GetCombinedStatusPayloads("Bonus Shield");
			if (payload != null)
			{
				s += payload.shieldHardness;
				m += payload.shieldHardnessMultiplier;
			}

			return s * m;
		}
		
		protected var _power:Number;
		public function get Power():Number { return _power; }
		
		public function PowerConsumed():Number
		{
			var tPC:Number = 0;
			for (var i:int = 0; i < _fittedModules.length; i++)
			{
				var m:ShipModule = _fittedModules[i] as ShipModule;
				tPC += m.PowerConsumption;
			}
			
			tPC += Lightdrive.PowerConsumption;
			tPC += Engine.PowerConsumption;
			tPC += ShieldGenerator.PowerConsumption;
			tPC += HullArmoring.PowerConsumption;
			tPC += Reactor.PowerConsumption;
			tPC += CapacitorBattery.PowerConsumption;
			
			return tPC;
		}
		
		//} endregion
		
		//{ region Inventory management
		
		protected var _crewSlots:int;
		public function get CrewSlots():int { return _crewSlots; }
		public function set CrewSlots(v:int):void { _crewSlots = v; }
		public function CrewSlotsTotal():int
		{
			var slots:int = _crewSlots;
			
			var um:Array = GetUtilityModules();
			for (var i:int = 0; i < um.length; i++)
			{
				var umm:UtilityModule = um[i] as UtilityModule;
				slots += umm.BonusCrewSlots;
			}
			
			return slots;
		}
		
		[Serialize]
		public var _inventory:Array;
		public function get Inventory():Array { return _inventory; }
		
		// Used during ship swaps
		public function TransferInventory(inInv:Array):void
		{
			_inventory = inInv;
		}
		
		protected var _storageTypeGeneral:int;
		public function get StorageTypeGeneral():int { return _storageTypeGeneral; }
		public function StorageTypeGeneralTotalSlots():int 
		{ 
			var slots:int = _storageTypeGeneral;
			
			var um:Array = GetUtilityModules();
			for (var i:int = 0; i < um.length; i++)
			{
				var umm:UtilityModule = um[i] as UtilityModule;
				slots += umm.BonusGeneralInventorySlots;
			}
			
			return slots;
		}
		
		protected var _storageTypeConsumable:int;
		public function get StorageTypeConsumable():int { return _storageTypeConsumable; }
		public function StorageTypeConsumableTotalSlots():int
		{ 
			var slots:int = _storageTypeConsumable; 
			
			var um:Array = GetUtilityModules();
			for (var i:int = 0; i < um.length; i++)
			{
				var umm:UtilityModule = um[i] as UtilityModule;
				slots += umm.BonusConsumableInventorySlots;
			}
			
			return slots;
		}
		
		protected var _storageTypeArmor:int;
		public function get StorageTypeArmor():int { return _storageTypeArmor; }
		public function StorageTypeArmorTotalSlots():int
		{ 
			var slots:int = _storageTypeArmor;
			
			var um:Array = GetUtilityModules();
			for (var i:int = 0; i < um.length; i++)
			{
				var umm:UtilityModule = um[i] as UtilityModule;
				slots += umm.BonusArmorInventorySlots;
			}
			
			return slots;
		}
		
		protected var _storageTypeWeapons:int;
		public function get StorageTypeWeapons():int { return _storageTypeWeapons; }
		public function StorageTypeWeaponsTotalSlots():int
		{ 
			var slots:int = _storageTypeWeapons;
			
			var um:Array = GetUtilityModules();
			for (var i:int = 0; i < um.length; i++)
			{
				var umm:UtilityModule = um[i] as UtilityModule;
				slots += umm.BonusWeaponInventorySlots;
			}
			
			return slots;
		}
		
		public function StorageSlots():ShipInventoryContainer
		{
			var inv:ShipInventoryContainer = new ShipInventoryContainer();
			inv.Armor = StorageTypeArmor;
			inv.Weapons = StorageTypeWeapons;
			inv.Consumable = StorageTypeConsumable;
			inv.General = StorageTypeGeneral;
			
			var um:Array = GetUtilityModules();
			for (var i:int = 0; i < um.length; i++)
			{
				var umm:UtilityModule = um[i] as UtilityModule;
				inv.Armor += umm.BonusArmorInventorySlots;
				inv.Weapons += umm.BonusWeaponInventorySlots;
				inv.Consumable += umm.BonusConsumableInventorySlots;
				inv.General += umm.BonusGeneralInventorySlots;
			}
			
			return inv;
		}
		
		//} endregion
		
		protected var _internalMap:ShipMap;
		public function get InternalMap():ShipMap { return _internalMap; }
		
		//{ region Equipment & Modules
		
		/* These are modules that all ships must have, and what implements the basics of all of the various ship mechanics */
		/* Initially (at least), these will not be user-customisable, but may be in the future. */
		[Serialize]
		public var _lightdriveModule:LightdriveModule;
		public function get Lightdrive():LightdriveModule { return _lightdriveModule; }
		
		[Serialize]
		public var _engineModule:EngineModule;
		public function get Engine():EngineModule { return _engineModule; }
		
		[Serialize]
		public var _shieldModule:ShieldModule;
		public function get ShieldGenerator():ShieldModule { return _shieldModule; }
		
		[Serialize]
		public var _hullArmoringModule:HullArmoringModule;
		public function get HullArmoring():HullArmoringModule { return _hullArmoringModule; }
		
		[Serialize]
		public var _reactorModule:ReactorModule;
		public function get Reactor():ReactorModule { return _reactorModule; }
		
		[Serialize]
		public var _capacitorModule:CapacitorModule;
		public function get CapacitorBattery():CapacitorModule { return _capacitorModule; }
		
		[Serialize]
		public var _gunneryModule:GunneryModule;
		public function get Gunnery():GunneryModule { return _gunneryModule; }
		
		/* These are the customised modules that the player may have fitted to the ship */
		[Serialize]
		public var _fittedModules:Array;
		protected var _cachedFittedModules:Array;
		public function get FittedModules():Array
		{ 
			if (_cachedFittedModules == null)
			{
				_cachedFittedModules = [];
				_cachedFittedModules.concat(_fittedModules);
				_cachedFittedModules.concat(Lightdrive, Engine, ShieldGenerator, HullArmoring, Reactor, CapacitorBattery, Gunnery);
			}
			return _cachedFittedModules;
		}
		public function get OnlyExtensionFittedModules():Array
		{
			return _fittedModules; 
		}
		
		public function GetUtilityModules():Array
		{
			return FittedModules.filter(function(e:ShipModule, i:int, a:Array):Boolean {
				return e is UtilityModule;
			});
		}
		public function GetDefensiveModules():Array
		{
			return FittedModules.filter(function(e:ShipModule, i:int, a:Array):Boolean {
				return e is DefensiveModule;
			});
		}
		public function GetOffensiveModules():Array
		{
			return FittedModules.filter(function(e:ShipModule, i:int, a:Array):Boolean {
				return e is OffensiveModule;
			});
		}
		public function GetWeaponModules():Array
		{
			return FittedModules.filter(function(e:ShipModule, i:int, a:Array):Boolean {
				return e is WeaponModule;
			});
		}
		
		public function EquipModule(newModule:ShipModule, targetRoom:ModularShipRoom = null):void
		{
			// Ensure the target room is present within this ship object if it is not null
			if (targetRoom != null)
			{
				if (_internalMap == null)
				{
					throw new Error("A room was specified, but the ship has no internal map structure available.");
					return;
				}
				if (_internalMap.Rooms.indexOf(targetRoom) == -1)
				{
					throw new Error("A room was specified, but it is not contained in the target ships internal map.");
					return;
				}
				
				newModule.RoomIndexReplacement = targetRoom.Index;
				newModule.HookedRoom = targetRoom;
				targetRoom.FittedModule = newModule;
			}
				
			// If the module isn't already fitted to this ship, do the needful to do so
			if (_fittedModules.indexOf(newModule) == -1)
			{
				_fittedModules.push(newModule);
				_cachedFittedModules = null;
				_cachedAssignableModules = null;
				_cachedGadgets = null;
				newModule.Owner = this;
			}
		}
		public function UnequipModule(oldModule:ShipModule):void
		{
			if (_fittedModules.indexOf(oldModule) != -1)
			{
				_fittedModules.splice(_fittedModules.indexOf(oldModule), 1);
				_cachedFittedModules = null;
				_cachedAssignableModules = null;
				_cachedGadgets = null;
			}
			
			if (oldModule.Owner != null)
			{
				oldModule.Owner = null;
			}
			
			if (oldModule.HookedRoom != null)
			{
				oldModule.RoomIndexReplacement = null;
				oldModule.HookedRoom.FittedModule = null;
				oldModule.HookedRoom = null;
			}
		}
		
		public function AssignCrewToModule(crew:Creature, module:ShipModule):void
		{
			UnassignCrewFromModule(crew);
			
			if (module != null)
			{
				crew.assignedModule = module;
				module.AssignedCrewMember = crew.Index;
				module.HookedCrew = crew;
			}
		}
		public function UnassignCrewFromModule(crew:Creature):void
		{
			_cachedAssignedCrewmembers = null;
			
			if (crew.assignedModule != null)
			{
				crew.assignedModule.AssignedCrewMember = null;
				crew.assignedModule.HookedCrew = null;
				crew.assignedModule = null;
			}
		}
		
		protected var _cachedAssignedCrewmembers:Array;
		public function get AssignedCrewmembers():Array
		{
			if (_cachedAssignedCrewmembers == null)
			{
				_cachedAssignedCrewmembers = [];
				
				var fm:Array = FittedModules;
				for (var i:int = 0; i < fm.length; i++)
				{
					var m:ShipModule = fm[i] as ShipModule;
					
					if (m.HookedCrew != null)
					{
						_cachedAssignedCrewmembers.push(m.HookedCrew);
					}
				}
			}
			return _cachedAssignedCrewmembers;
		}
		protected var _cachedAssignableModules:Array;
		public function get AssignableModules():Array
		{
			if (_cachedAssignableModules == null)
			{
				_cachedAssignableModules = [];
				
				var fm:Array = FittedModules;
				for (var i:int = 0; i < fm.length; i++)
				{
					var m:ShipModule = fm[i] as ShipModule;
					
					if (m.CanBeStaffed)
					{
						_cachedAssignableModules.push(m);
					}
				}
			}
			return _cachedAssignableModules;
		}
		
		protected var _inherentGadgets:Array;
		public function get InherentGadgets():Array { return _inherentGadgets; }
		
		//} endregion
		
		//{ region Status Effects
		
		[Serialize]
		public var _statusEffects:Object;
		public function get StatusEffects():Object { return _statusEffects; }
		
		// Temporary effects are things that are only intended to last a single round or such.
		// They are how all of the console/order/attack bonuses are generated
		protected var _temporaryEffects:Object;
		public function get TemporaryEffects():Object { return _temporaryEffects; }
		
		public function AddBonusHullEffect(inHull:Number, inHullMulti:Number, inRechargeRound:Number, inRechargeMinute:Number, inRechargeMulti:Number):void
		{
			AddTemporaryModifier("Bonus Hull", { 
				hull: inHull, 
				hullMultiplier: inHullMulti,
				hullRechargePerRound: inRechargeRound,
				hullRechargePerMinute: inRechargeMinute,
				hullRechargeMultiplier: inRechargeMulti
			});
		}
		
		public function AddBonusHullResistances(inEm:Number, inKin:Number, inExp:Number, inTherm:Number, inAll:Number):void
		{
			AddTemporaryModifier("Bonus Hull Resistance", {
				allRes: inAll,
				em: inEm,
				kin: inKin,
				exp: inExp,
				therm: inTherm
			});
		}
		
		public function AddBonusShieldEffect(inShield:Number, inShieldMulti:Number, inRechargeRound:Number, inRechargeMinute:Number, inRechargeMulti:Number):void
		{
			AddTemporaryModifier("Bonus Shield", { 
				shield: inShield, 
				shieldMultiplier: inShieldMulti, 
				shieldRechargePerRound: inRechargeRound,
				shieldRechargeMultiplier: inRechargeMulti,
				shieldRechargePerMinute: inRechargeMinute
			});
		}
		
		public function AddBonusShieldResistances(inEm:Number, inKin:Number, inExp:Number, inTherm:Number, inAll:Number):void
		{
			AddTemporaryModifier("Bonus Shield Resistance", {
				allRes:inAll,
				em: inEm,
				kin: inKin,
				exp: inExp,
				therm: inTherm
			});
		}
		
		public function AddBonusCapacitorEffect(inCap:Number, inCapMulti:Number, inRechargeRound:Number, inRechargeMinute:Number, inRechargeMulti:Number):void
		{
			AddTemporaryModifier("Bonus Capacitor", {
				capacitor: inCap,
				capacitorMultiplier: inCapMulti,
				capacitorRechargePerRound: inRechargeRound,
				capacitorRechargePerMinute: inRechargeMinute,
				capacitorRechargeMultiplier: inRechargeMulti
			});
		}
		
		public function AddBonusTargetingEffect(inTargeting:Number, inMulti:Number):void
		{
			AddTemporaryModifier("Bonus Targeting", {
				targeting: inTargeting,
				targetingMultiplier: inMulti
			});
		}
		
		public function AddBonusManeuveringEffect(inThrust:Number, inThrustMulti:Number, inAgi:Number, inAgiMulti:Number):void
		{
			AddTemporaryModifier("Bonus Maneuvering", {
				thrust: inThrust,
				thrustMultiplier: inThrustMulti,
				agility: inAgi,
				agilityMultiplier: inAgiMulti
			});
		}
		
		public function AddBonusSystemsEffect(inSystems:Number, inSysMulti:Number):void
		{
			AddTemporaryModifier("Bonus Systems", {
				systems: inSystems,
				systemsMultiplier: inSysMulti
			});
		}
		
		public function AddBonusAimEffect(inAim:Number, inAimMulti:Number):void
		{
			AddTemporaryModifier("Bonus Aim", {
				aim: inAim,
				aimMultiplier: inAimMulti
			});
		}
		
		public function AddBonusArmorEffect(inArmor:Number, inArmorMulti:Number):void
		{
			AddTemporaryModifier("Bonus Armor", {
				armor: inArmor,
				armorMultiplier: inArmorMulti
			});
		}
		
		public function AddBonusWeaponEffect(inKinWeapBonus:Number, inKinWeapMult:Number, inKinWeapAccBonus:Number, inKinWeapAccMult:Number, inEnergyWeapBonus:Number, inEnergyWeapMult:Number, inEnergyWeapAccBonus:Number, inEnergyWeapAccMulti:Number):void
		{
			AddTemporaryModifier("Bonus Weapons", {
				kineticWeaponBonus: inKinWeapBonus,
				kineticWeaponMultiplier: inKinWeapMult,
				kinetciWeaponAccuracyBonus: inKinWeapAccBonus,
				kineticWeaponAccuracyMultiplier: inKinWeapAccMult,
				energyWeaponBonus: inEnergyWeapBonus,
				energyWeaponMultiplier: inEnergyWeapMult,
				energyWeaponAccuracyBonus: inEnergyWeapAccBonus,
				energyWeaponAccuracyMultiplier: inEnergyWeapAccMulti
			});
		}
		
		public function AddCloakEffect(duration:int, durationType:String, cloakStrength:Number = 1):void
		{
			var se:StatusEffectPayload = new StatusEffectPayload("Cloaked", {
				strength: cloakStrength
			}, duration, durationType, StatusIcons.Icon_Blind, true, false);
			
			AddStatusEffect(se);
		}
		public function RemoveCloakEffect():void
		{
			RemoveStatusEffect("Cloaked");
		}
		
		protected function AddTemporaryModifier(mName:String, payload:Object):void
		{
			if (TemporaryEffects[mName] == undefined)
			{
				AddEffect(new StatusEffectPayload(mName, payload, -1, StatusEffectPayload.DURATION_ROUNDS, null, true, true), TemporaryEffects);
			}
			else
			{
				var se:StatusEffectPayload = TemporaryEffects[mName];
				
				for (var prop:String in payload)
				{
					if (se.Payload[prop] == undefined)
					{
						se.Payload[prop] = payload[prop];
					}
					else
					{
						se.Payload[prop] += payload[prop];
					}
				}
			}
		}
		
		private function AddEffect(se:StatusEffectPayload, targetObject:Object):void
		{
			if (targetObject[se.Name] == undefined)
			{
				targetObject[se.Name] = se;
				if (se.OnCreate != null)
				{
					se.OnCreate(se, this);
				}
			}
			else
			{
				throw new Error("EFfect with the name '" + se.Name + "' already exists!");
			}
		}
		
		public function AddStatusEffect(se:StatusEffectPayload):void
		{
			AddEffect(se, StatusEffects);
		}
		
		// HasEffect is intentionally missing; rather than the old way of doing things (if (has) { getv1(); } etc
		// Get the effect and store it in a var; if its null, the effect doesn't exist. If it does exist, you have the object with its values
		private function GetEffect(n:String, targetObject:Object):StatusEffectPayload
		{
			if (targetObject[n] !== undefined)
			{
				return targetObject[n];
			}
			return null;
		}
		public function GetStatusEffect(n:String):StatusEffectPayload
		{
			return GetEffect(n, StatusEffects);
		}
		public function GetTemporaryEffect(n:String):StatusEffectPayload
		{
			return GetEffect(n, TemporaryEffects);
		}
		
		private function RemoveEffect(n:String, targetObject:Object):void
		{
			if (targetObject[n] !== undefined)
			{
				var se:StatusEffectPayload = targetObject[n];
				if (se.OnRemove != null)
				{
					se.OnRemove(se, this);
				}
				
				delete targetObject[n];
			}
		}
		public function RemoveStatusEffect(n:String):void
		{
			RemoveEffect(n, StatusEffects);
		}
		public function RemoveTemporaryEffect(n:String):void
		{
			RemoveEffect(n, TemporaryEffects);
		}
		
		public function RemoveStatusEffects(a:Array):void
		{
			for (var i:int = 0; i < a.length; i++)
			{
				RemoveEffect(a[i], StatusEffects);
			}
		}
		public function RemoveTemporaryEffects(a:Array):void
		{
			for (var i:int = 0; i < a.length; i++)
			{
				RemoveEffect(a[i], TemporaryEffects);
			}
		}
		
		public function ClearCombatStatusEffects():void
		{
			var keys:Array = [];
			for (var prop:String in StatusEffects)
			{
				var se:StatusEffectPayload = StatusEffects[prop];
				
				if (se.CombatOnly == true)
				{
					keys.push(prop);
				}
			}
			
			RemoveStatusEffects(keys);
			
			keys = [];
			for (prop in TemporaryEffects)
			{
				se = TemporaryEffects[prop];
				if (se.CombatOnly == true)
				{
					keys.push(prop);
				}
			}
			
			RemoveTemporaryEffects(keys);
		}
		
		public function ClearTemporaryEffects():void
		{
			var keys:Array = [];
			for (var prop:String in TemporaryEffects)
			{
				var se:StatusEffectPayload = TemporaryEffects[prop];
				if (se.CombatOnly == true)
				{
					keys.push(prop);
				}
			}
			
			RemoveTemporaryEffects(keys);
		}
		
		public function GetCombinedStatusPayloads(n:String):Object
		{
			var t:Object = null;
			
			var se:StatusEffectPayload = GetTemporaryEffect(n);
			if (se != null)
			{
				t = se.Payload;
				se = null;
			}
			
			se = GetStatusEffect(n);
			if (se != null)
			{
				if (t == null)
				{
					return se.Payload;
				}
				else
				{
					var tt:Object = { };
					for (var prop:String in t)
					{
						tt[prop] = t[prop];
					}
					for (prop in se.Payload)
					{
						if (tt[prop] == undefined)
						{
							tt[prop] = se.Payload[prop];
						}
						else
						{
							tt[prop] += se.Payload[prop];
						}
					}
					return tt;
				}
			}
			return t;
		}
		
		private function OnRoundStartEffectEvents():void
		{
			for (var key:String in StatusEffects)
			{
				var se:StatusEffectPayload = StatusEffects[key];
				if (se.OnRoundStart != null)
				{
					se.OnRoundStart(se, this);
				}
			}
		}
		
		private function OnRoundEndEffectEvents():void
		{
			var rem:Array = [];
			
			for (var key:String in StatusEffects)
			{
				var se:StatusEffectPayload = StatusEffects[key];
				if (se.OnRoundEnd != null)
				{
					se.OnRoundEnd(se, this);
					if (se.DurationMode == StatusEffectPayload.DURATION_ROUNDS && se.Duration == 0)
					{
						rem.push(key);
					}
				}
			}
			
			if (rem.length > 0)
			{
				RemoveStatusEffects(rem);
			}
		}
		//} endregion
		
		//{ region Combat
		
		public function get HasAvailableGadgets():Boolean
		{
			if (_cachedGadgets == null)
			{
				var t:Array = AvailableGadgets;
			}
			
			return _cachedGadgets.length > 0;
		}
		
		protected var _cachedGadgets:Array;
		public function get AvailableGadgets():Array
		{
			if (_cachedGadgets == null)
			{
				_cachedGadgets = [];
				_cachedGadgets = _cachedGadgets.concat(_inherentGadgets);
				
				var m:Array = FittedModules;
				for each (var mod:ShipModule in m)
				{
					_cachedGadgets = _cachedGadgets.concat(mod.GrantedGadgets);
				}
			}
			
			return _cachedGadgets;
		}
		
		public function BeginCombat():void
		{
			_shipCombatOrders = new ShipCombatOrderContainer();
		}
		
		public function EndCombat():void
		{
			_shipCombatOrders = null;
			ClearCombatStatusEffects();
		}
		
		private var _shipCombatOrders:ShipCombatOrderContainer;
		public function get CombatOrders():ShipCombatOrderContainer { return _shipCombatOrders; }
		
		public function get IsDefeated():Boolean { return Hull <= 0; }
		
		private var _isAlreadyDefeated:Boolean;
		public function get IsAlreadyDefeated():Boolean { return _isAlreadyDefeated; }
		public function set IsAlreadyDefeated(v:Boolean):void { _isAlreadyDefeated = v; }
		
		public function get IsShielded():Boolean { return Shields > 0; }
		
		public function IsCloaked():Boolean
		{
			return StatusEffects["Cloaked"] !== undefined;
		}
		
		protected var _hullResistances:ShipTypeCollection;
		public function get HullResistances():ShipTypeCollection
		{
			var dm:Array = GetDefensiveModules();
			
			var res:ShipTypeCollection = _hullResistances.MakeCopy();
			if (HullArmoring.Resistances != null) res.CombineResistances(HullArmoring.Resistances);
			
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				if (dmm.BonusHullResistances != null) res.CombineResistances(dmm.BonusHullResistances);
			}

			var payload:Object = GetCombinedStatusPayloads("Bonus Hull Resistance");
			if (payload != null)
			{
				var bonusR:ShipTypeCollection = new ShipTypeCollection();

				bonusR.em.DamageValue += (payload.allRes + payload.em);
				bonusR.kin.DamageValue += (payload.allRes + payload.kin);
				bonusR.exp.DamageValue += (payload.allRes + payload.exp);
				bonusR.therm.DamageValue += (payload.allRes + payload.therm);

				res.CombineResistances(bonusR);
			}
			
			return res;
		}
		
		protected var _shieldResistances:ShipTypeCollection;
		public function get ShieldResistances():ShipTypeCollection
		{
			var dm:Array = GetDefensiveModules();
			
			var res:ShipTypeCollection = _shieldResistances.MakeCopy();
			if (ShieldGenerator.Resistances != null) res.CombineResistances(ShieldGenerator.Resistances);
			
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				if (dmm.BonusShieldResistances != null) res.CombineResistances(dmm.BonusShieldResistances);
			}
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Shield Resistance");
			if (payload != null)
			{
				var bonusR:ShipTypeCollection = new ShipTypeCollection();

				bonusR.em.DamageValue += (payload.allRes + payload.em);
				bonusR.kin.DamageValue += (payload.allRes + payload.kin);
				bonusR.exp.DamageValue += (payload.allRes + payload.exp);
				bonusR.therm.DamageValue += (payload.allRes + payload.therm);

				res.CombineResistances(bonusR);
			}

			return res;
		}
		
		public function OnRoundStart():void
		{
			OnRoundStartEffectEvents();
			CrewMechanicShieldingRepair();
			CrewSystemsEffects();
		}
		
		private function CrewSystemsEffects():void
		{
			if (Reactor.HookedCrew != null)
			{
				// Attempt to decloak any cloaked enemy ships
				var perk:StorageClass = Reactor.HookedCrew.getPerkEffect("Crew Skill - Systems");
				if (perk != null && perk.value1 > 0)
				{
					var decloakChance:Number = perk.value1 * 10;
					if (decloakChance > 0)
					{
						var enemyShips:Array = CombatManager.getHostileActors();
						for (var i:int = 0; i < enemyShips.length; i++)
						{
							var tShip:SpaceShip = enemyShips[i] as SpaceShip;
							if (tShip.IsCloaked() && rand(100) <= decloakChance)
							{
								tShip.RemoveCloakEffect();
								// TODO: Cloak remove notification
							}
						}
					}
				}
				
				// TODO: Clearing "hacking" statuses- the doc doesn't mention these outside of a few minor references
			}
		}
		
		private function CrewMechanicShieldingRepair():void
		{
			var doFix:int = 0;
			var chanceToFixModule:Number = 0;
			
			if (ShieldGenerator.HookedCrew != null)
			{
				var perk:StorageClass = ShieldGenerator.HookedCrew.getPerkEffect("Crew Skill - Shielding");
				if (perk != null)
				{
					chanceToFixModule = perk.value1 > 0 ? perk.value1 * 10 : 0;
					if (chanceToFixModule > 0 && rand(100) <= chanceToFixModule)
					{
						doFix = 1;
					}
				}
			}
			if (doFix == 0 && HullArmoring.HookedCrew != null)
			{
				perk = HullArmoring.HookedCrew.getPerkEffect("Crew Skills - Mechanic");
				if (perk != null)
				{
					chanceToFixModule = perk.value1 > 0 ? perk.value1 * 10 : 0;
					if (chanceToFixModule > 0 && rand(100) <= chanceToFixModule)
					{
						doFix = 2;
					}
				}
			}
			
			if (doFix > 0)
			{
				var fm:Array = FittedModules;
				for (var i:int = 0; i < fm.length; i++)
				{
					var fmm:ShipModule = fm[i] as ShipModule;
					if (fmm.DisabledForRounds > 0)
					{
						fmm.DisabledForRounds = 0;
						//TODO: Notification that an offline module was fixed
						// doFix == 1 => shielding, == 2 => mechanic
					}
				}
			}
		}
		
		public function OnRoundEnd():void
		{
			RoundRegenerationEffects();
			ClearTemporaryEffects();
			OnRoundEndEffectEvents();
		}
		
		private function RoundRegenerationEffects():void
		{
			Hull += HullRechargePerRound;
			Shields += ShieldRechargePerRound;
			Capacitor += CapacitorRechargePerRound;
		}
		
		public function CombatAI(playerShips:Array, enemyShips:Array):void
		{
			// Do things with the ShipCombatOrderContainer instance!
			throw new Error("CombatAI has not been overridden!");
		}
		
		public function CalculateCapacitorCostForAction(forAction:ShipAction):Number
		{
			// TODO: Implement cost bonuses
			return forAction.CapacitorCost;
		}
		
		public function CalculateCapacitorCostForModule(forModule:ShipModule):Number
		{
			// TODO: Implement cost bonuses
			return forModule.CapConsumption;
		}
		
		public function TakeDamage(sdr:ShipDamageResult):void
		{
			var spoolEffect:StatusEffectPayload = GetStatusEffect("Lightdrive Spooling");
			if (spoolEffect && HullPercent < 0.75 && sdr.hullDamage > 0)
			{
				RemoveStatusEffect("Lightdrive Spooling");
				
				if (IsPlayerShip)
				{
					output("\n\nAdditional hull damage has engaged your lightdrives safety protocols, cancelling the engine spool-up process!");
				}
				else
				{
					output("\n\nAdditional hull damage has engaged " + possessive(Name) + " lightdrive safety protocols, cancelling the engine spool-up process!");
				}
			}
		}
		
		public function DealDamage(sdr:ShipDamageResult):void
		{
			
		}
		
		//} endregion
		
		//{ region Serialization hooks
		
		override public function loadSaveObject(o:Object):void
		{
			super.loadSaveObject(o);
			
			HydrateModules();
		}
		
		// Weird naming, but this is what I'm using to indicate we need to "fill up" properties after 
		// deserialization. ie we get basis from the serialization system, and then have to use
		// thsoe basics to "inflate" the full range of properties.
		private function HydrateModules():void
		{
			// Ensure the lookup properties in the map container & modules point to the correct objects
			for (var i:int = 0; i < _fittedModules.length; i++)
			{
				var m:ShipModule = _fittedModules[i] as ShipModule;

				HydrateModuleRoom(m);
				HydrateModuleCrew(m);
			}
			
			HydrateModuleCrew(Lightdrive);
			HydrateModuleCrew(Engine);
			HydrateModuleCrew(ShieldGenerator);
			HydrateModuleCrew(Reactor);
			HydrateModuleCrew(CapacitorBattery);
			HydrateModuleCrew(Gunnery);
		}
		private function HydrateModuleRoom(m:ShipModule):void
		{
			if (m.RoomIndexReplacement != null && m.RoomIndexReplacement.length > 0)
			{
				var room:ModularShipRoom = _internalMap.RoomDefinitions[m.RoomIndexReplacement];
				EquipModule(m, room);
			}
		}
		private function HydrateModuleCrew(m:ShipModule):void
		{
			if (m.AssignedCrewMember != null && m.AssignedCrewMember.length > 0)
			{
				var crew:Creature = kGAMECLASS.chars[m.AssignedCrewMember];
				m.HookedCrew = crew;
			}
		}
		
		//} endregion
	}
}