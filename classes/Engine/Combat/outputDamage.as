package classes.Engine.Combat 
{
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Interfaces.output;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function outputDamage(damageResult:DamageResult):void
	{
		if (damageResult.shieldDamage <= 0 && damageResult.hpDamage <= 0 && damageResult.lustDamage <= 0) return;
		
		var combine:Boolean = kGAMECLASS.gameOptions.combineDamageValueOutput;
		var colour:Boolean = kGAMECLASS.gameOptions.colourDamageValueOutput;
		
		var tMsg:String = "";
		
		if (damageResult.shieldDamage > 0 || damageResult.hpDamage > 0 || damageResult.lustDamage > 0)
		{
			if (!combine)
			{
				tMsg += " (<b>";
				if (damageResult.shieldDamage > 0)
				{
					if (colour) tMsg += "S: -<span class='shield'>" + Math.round(damageResult.shieldDamage) + "</span>";
					else tMsg += "S: -" + Math.round(damageResult.shieldDamage);
					
					if (damageResult.hpDamage > 0 || damageResult.lustDamage > 0) tMsg += ", ";
				}
				if (damageResult.hpDamage > 0)
				{
					if (colour) tMsg += "H: -<span class='hp'>" + Math.round(damageResult.hpDamage) + "</span>";
					else tMsg += "H: -" + Math.round(damageResult.hpDamage);
					if (damageResult.lustDamage > 0) tMsg += ", ";
				}
				if (damageResult.lustDamage > 0)
				{
					if (colour) tMsg += "L: -<span class='lust'>" + Math.round(damageResult.lustDamage) + "</span>";
					else tMsg += "L: -" + Math.round(damageResult.lustDamage);
				}
				tMsg += "</b>)";
			}
			else
			{
				tMsg += " (<b>";
				tMsg += Math.round(damageResult.shieldDamage + damageResult.hpDamage + damageResult.lustDamage);
				tMsg += "</b>)";
			}
			
			output(tMsg);
		}
	}
}