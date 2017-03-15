package classes.Ships 
{
	import classes.DataManager.Serialization.VersionedSaveableV2;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.ShipCombat.DamageTypes.*;
	import classes.Ships.Map.ShipMap;
	import classes.Ships.Modules.*;
	import classes.Ships.Modules.UpgradeModules.*;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SpaceShip extends VersionedSaveableV2 implements IOwner
	{
		public function SpaceShip() 
		{
			HullMaxBase = 100;
			Hull = HullMaxBase;
			
			ShieldsMax = 100;
			Shields = ShieldsMax;
			
			CapacitorMax = 100;
			Capacitor = CapacitorMax;
			
			Targeting = Thrust = Agility = Systems = Aim = 10;
			
			_inventory = [];
			_internalMap = new InternalMapClass();
			
			_hullResistances = new ShipTypeCollection( { em: 50, kin: 20, exp: 10, therm: 40 }, ShipDamageFlag.TYPE_HULL);
		}
		
		//{ region Display & other info
		
		[Serialize]
		public var _name:String;
		public function get Name():String { return _name; }
		public function set Name(v:String):void { _name = v; }
		
		protected var _manufacturer:String;
		public function get Manufacturer():String { return _manufacturer; }
		
		protected var _model:String;
		public function get Model():String { return _model; }
		
		protected var _baseValue:int;
		public function get BaseValue():int { return _baseValue; }
		
		//} endregion
		
		//{ region Basic stats
		
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
			
			return h * multi;
		}
		
		public function get HullPercent():Number { return Hull / HullMax; }
		
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
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Capacitor");
			if (payload != null)
			{
				c += payload.capacitor;
				m += payload.capacitorMultiplier;
			}
			
			return c * m;
		}
		
		public function get CapacitorPercent():Number { return Capacitor / CapacitorMax; }
		
		public function get CapacitorRecharge():Number
		{
			var c:Number = CapacitorBattery.RechargeRate;
			var m:Number = 1.0;
			
			var payload:Object = GetCombinedStatusPayloads("Bonus Capacitor");
			if (payload != null)
			{
				c += payload.capacitorRecharge;
				m += payload.capacitorRechargeMultiplier;
			}
			
			return c * m;
		}
		
		protected var _targeting:Number;
		public function get Targeting():Number
		{
			var t:Number = _targeting;
			var m:Number = 1.0;
			
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

			return a * m;
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
			var s:Number = 
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
			tPC += Reactor.PowerConsumption;
			tPC += Capacitor.PowerConsumption;
			
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
		
		protected var _storageTypeGeneral:int;
		public function get StorageTypeGeneral():int { return _storageTypeGeneral; }
		public function set StorageTypeGeneral(v:int):void { _storageTypeGeneral = v; }
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
		public function set StorageTypeConsumable(v:int):void { _storageTypeConsumable = v; }
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
		public function set StorageTypeArmor(v:int):void { _storageTypeArmor = v; }
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
		public function set StorageTypeWeapons(v:int):void { _storageTypeWeapons = v; }
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
		
		protected var _internalMapClass:Class;
		public function get InternalMapClass():Class { return _internalMapClass; }
		
		//} endregion
		
		protected var _internalMap:ShipMap;
		public function get InternalMap():ShipMap { return _internalMap; }
		
		//{ region Equipment & Modules
		
		/* These are modules that all ships must have, and what implements the basics of all of the various ship mechanics */
		/* Initially (at least), these will not be user-customisable, but may be in the future. */
		protected var _lightdriveModule:LightdriveModule;
		public function get Lightdrive():LightdriveModule { return _lightdriveModule; }
		
		protected var _engineModule:EngineModule;
		public function get Engine():EngineModule { return _engineModule; }
		
		protected var _shieldModule:ShieldModule;
		public function get ShieldGenerator():ShieldModule { return _shieldModule; }
		
		protected var _reactorModule:ReactorModule;
		public function get Reactor():ReactorModule { return _reactorModule; }
		
		protected var _capacitorModule:CapacitorModule;
		public function get CapacitorBattery():CapacitorModule { return _capacitorModule; }
		
		/* These are the customised modules that the player may have fitted to the ship */
		[Serialize]
		public var _fittedModules:Array;
		public function get FittedModules():Array { return _fittedModules; }
		
		public function GetUtilityModules():Array
		{
			return _fittedModules.filter(function(e:ShipModule, i:int, a:Array):Boolean {
				return e is UtilityModule;
			});
		}
		public function GetDefensiveModules():Array
		{
			return _fittedModules.filter(function(e:ShipModule, i:int, a:Array):Boolean {
				return e is DefensiveModule;
			});
		}
		public function GetOffensiveModules():Array
		{
			return _fittedModules.filter(function(e:ShipModule, i:int, a:Array):Boolean {
				return e is OffensiveModule;
			});
		}
		
		//} endregion
		
		//{ region Status Effects
		
		[Serialize]
		public var _statusEffect:Object;
		public function get StatusEffects():Object { return _statusEffects; }
		
		// Temporary effects are things that are only intended to last a single round or such.
		// They are how all of the console/order/attack bonuses are generated
		protected var _temporaryEffects:Object;
		public function get TemporaryEffects():Object { return _temporaryEffects; }
		
		public function AddBonusHullEffect(inHull:Number, inHullMulti:Number):void
		{
			AddTemporaryModifier("Bonus Hull", { 
				hull: inHull, 
				hullMultiplier: inHullMulti 
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
		
		public function AddBonusCapacitorEffect(inCap:Number, inCapMulti:Number, inRecharge:Number, inRechargeMulti:Number):void
		{
			AddTemporaryModifier("Bonus Capacitor", {
				capacitor: inCap,
				capacitorMultiplier: inCapMulti,
				capacitorRecharge: inRecharge,
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
			}
			
			delete targetObject[n];
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
				RemoveEffect(a, StatusEffects);
			}
		}
		public function RemoveTemporaryEffects(a:Array):void
		{
			for (var i:int = 0; i < a.length; i++)
			{
				RemoveEffect(a, TemporaryEffects);
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
		
		//} endregion
		
		//{ region Combat
		
		public function IsDefeated():Boolean
		{
			return Hull <= 0;
		}
		
		protected var _hullResistances:ShipTypeCollection;
		public function get HullResistances():ShipTypeCollection
		{
			var dm:Array = GetDefensiveModules();
			
			var res:ShipTypeCollection = _hullResistances.MakeCopy();
			
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				res.CombineResistances(dmm.BonusHullResistances);
			}
			
			if (HasStatusEffect("Hull Resistance Bonus"))
			{
				var se:StatusEffectPayload = StatusEffects["Hull Resistance Bonus"];
				var bonusR:ShipTypeCollection = new ShipTypeCollection();
				
				if (se.Payload.AllRes != undefined)
				{
					bonusR.em.DamageValue += se.Payload.AllRes;
					bonusR.kin.DamageValue += se.Payload.AllRes;
					bonusR.therm.DamageValue += se.Payload.AllRes;
					bonusR.exp.DamageValue += se.Payload.AllRes;
				}
				
				if (se.Payload.em != undefined) bonusR.em.DamageValue += se.Payload.em;
				if (se.Payload.kin != undefined) bonusR.kin.DamageValue += se.Payload.kin;
				if (se.Payload.therm != undefined) bonusR.therm.DamageValue += se.Payload.therm;
				if (se.Payload.exp != undefined) bonusR.exp.DamageValue += se.Payload.exp;
				
				res.combineResistances(bonusR);
			}
			
			return res;
		}
		
		public function get ShieldResistances():ShipTypeCollection
		{
			var dm:Array = GetDefensiveModules();
			var res:ShipTypeCollection = ShieldGenerator.Resistances.MakeCopy();
			
			for (var i:int = 0; i < dm.length; i++)
			{
				var dmm:DefensiveModule = dm[i] as DefensiveModule;
				res.CombineResistances(dmm.BonusShieldResistances);
			}
			
			if (HasStatusEffect("Shield Resistance Bonus"))
			{
				var se:StatusEffectPayload = StatusEffects["Shield Resistance Bonus"];
				var bonusR:ShipTypeCollection = new ShipTypeCollection();
				
				if (se.Payload.AllRes != undefined)
				{
					bonusR.em.DamageValue += se.Payload.AllRes;
					bonusR.kin.DamageValue += se.Payload.AllRes;
					bonusR.therm.DamageValue += se.Payload.AllRes;
					bonusR.exp.DamageValue += se.Payload.AllRes;
				}
				
				if (se.Payload.em != undefined) bonusR.em.DamageValue += se.Payload.em;
				if (se.Payload.kin != undefined) bonusR.kin.DamageValue += se.Payload.kin;
				if (se.Payload.therm != undefined) bonusR.therm.DamageValue += se.Payload.therm;
				if (se.Payload.exp != undefined) bonusR.exp.DamageValue += se.Payload.exp;
				
				res.combineResistances(bonusR);
			}
		}
		
		//} endregion
	}
}