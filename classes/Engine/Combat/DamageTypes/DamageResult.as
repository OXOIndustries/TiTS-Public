package classes.Engine.Combat.DamageTypes 
{
	/**
	 * Provides a structured means of passing damage information around during combat
	 * calculations, clarifying what actually happens.
	 * @author Gedan
	 */
	public class DamageResult 
	{
		public var totalDamage:Number = 0;
		public var typedTotalDamage:TypeCollection = new TypeCollection();
		
		public var shieldDamage:Number = 0;
		public var typedShieldDamage:TypeCollection = new TypeCollection();
		
		public var hpDamage:Number = 0;
		public var typedHPDamage:TypeCollection = new TypeCollection();
		
		public var wasCrit:Boolean = false;
		
		public var totalAttacks:uint = 0;
		public var numMisses:uint = 0;
		public var numHits:uint = 0;
		public var numCrits:uint = 0;
		
		public var remainingDamage:TypeCollection = new TypeCollection();
		
		public function addResult(o:DamageResult):void
		{
			totalDamage += o.totalDamage;
			typedTotalDamage.add(o.typedTotalDamage);
			
			shieldDamage += o.shieldDamage;
			typedShieldDamage.add(o.typedShieldDamage);
			
			hpDamage += o.hpDamage;
			typedHPDamage.add(o.typedHPDamage);
			
			remainingDamage.add(o.remainingDamage);
			
			if (o.wasCrit) numCrits++;
			else numHits++;
		}
		
	}

}