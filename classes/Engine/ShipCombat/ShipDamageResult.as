package classes.Engine.ShipCombat 
{
	import classes.Characters.Shade;
	import classes.Engine.ShipCombat.DamageTypes.ShipTypeCollection;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipDamageResult 
	{
		public var totalDamage:Number = 0;
		public var typedTotalDamage:ShipTypeCollection = new ShipTypeCollection();
		
		public var shieldDamage:Number = 0;
		public var typedShieldDamage:ShipTypeCollection = new ShipTypeCollection();
		
		public var hullDamage:Number = 0;
		public var typedHullDamage:ShipTypeCollection = new ShipTypeCollection();
		
		public var wasCrit:Boolean = false;
		public var wasCloaked:Boolean = false;
		
		public function get totalAttacks():uint { return numMisses + numHits + numCrits; }
		public var numMisses:uint = 0;
		public var numHits:uint = 0;
		public var numCrits:uint = 0;
		
		public var remainingDamage:ShipTypeCollection = new ShipTypeCollection();
		
		public function addResult(o:ShipDamageResult):void
		{
			totalDamage += o.totalDamage;
			typedTotalDamage.Add(o.typedTotalDamage);
			
			shieldDamage += o.shieldDamage;
			typedShieldDamage.Add(o.typedShieldDamage);
			
			hullDamage += o.hullDamage;
			typedHullDamage.Add(o.typedHullDamage);
			
			wasCrit = wasCrit || o.wasCrit;
			wasCloaked = wasCloaked || o.wasCloaked;
			
			numMisses += o.numMisses;
			numHits += o.numHits;
			numCrits += o.numCrits;
		}
		
		public function Round():void
		{
			totalDamage = Math.round(totalDamage);
			shieldDamage = Math.round(shieldDamage);
			hullDamage = Math.round(hullDamage);
		}
	}

}