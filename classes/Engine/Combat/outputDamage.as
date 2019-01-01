package classes.Engine.Combat 
{
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Interfaces.output;
	import classes.kGAMECLASS;
	import classes.Engine.Interfaces.userInterface;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function outputDamage(damageResult:DamageResult):void
	{
		if (damageResult.shieldDamage == 0 && damageResult.hpDamage == 0 && damageResult.lustDamage == 0) return;
		
		var combine:Boolean = kGAMECLASS.gameOptions.combineDamageValueOutput;
		var colour:Boolean = kGAMECLASS.gameOptions.colourDamageValueOutput;
		
		var tMsg:String = "";
		
		//var numDisplayed:int = 0;
		//var numDigits:int = 0;
		
		if (damageResult.shieldDamage != 0 || damageResult.hpDamage != 0 || (damageResult.lustDamage != 0 || damageResult.lustResisted == true))
		{
			if (!combine)
			{
				tMsg += "(<b>";
				if (damageResult.shieldDamage != 0)
				{
					//numDisplayed++;
					//numDigits += Math.log(damageResult.shieldDamage) + 1;
					
					tMsg += "S: " + (damageResult.shieldDamage > 0 ? "-" : "+");
					if (colour) tMsg += "<span class='shield'>";
					tMsg += Math.abs(Math.round(damageResult.shieldDamage));
					if (colour) tMsg += "</span>";
					if (damageResult.hpDamage != 0 || (damageResult.lustDamage != 0 || damageResult.lustResisted == true)) tMsg += ", ";
				}
				if (damageResult.hpDamage != 0)
				{
					//numDisplayed++;
					//numDigits += Math.log(damageResult.hpDamage) + 1;
					
					tMsg += "H: " + (damageResult.hpDamage > 0 ? "-" : "+");
					if (colour) tMsg += "<span class='hp'>";
					tMsg += Math.abs(Math.round(damageResult.hpDamage));
					if (colour) tMsg += "</span>";
					if (damageResult.lustDamage != 0 || damageResult.lustResisted == true) tMsg += ", ";
				}
				if (damageResult.lustDamage != 0 || damageResult.lustResisted == true)
				{
					//numDisplayed++;
					//numDigits += Math.log(damageResult.lustDamage) + 1;
					
					tMsg += "L: " + (damageResult.lustDamage < 0 ? "-" : "+");
					if (colour) tMsg += "<span class='lust'>";
					tMsg += Math.abs(Math.round(damageResult.lustDamage));
					if (colour) tMsg += "</span>";
				}
				tMsg += "</b>)";
			}
			else
			{
				tMsg += "(<b>";
				tMsg += Math.round(damageResult.shieldDamage + damageResult.hpDamage + damageResult.lustDamage);
				tMsg += "</b>)";
			}
			
			// Option A: Handwave
			/*
			var targetOutput:TextField = userInterface().getMainTextField();
			var currLineLength:int = targetOutput.getLineLength(targetOutput.numLines - 2); 
			// The closing </span> seems to be forced into a new "line" internally because of the <p/> it wraps
			
			var estMaxLength:int = 100 - ((numDisplayed - 1) * 2) - ((numDigits - numDisplayed) / 2);
			
			if (currLineLength > estMaxLength) tMsg = "\n" + tMsg;
			else tMsg = " " + tMsg;
			
			output(tMsg, false, false);
			*/
			
			// Option B: OH GOD WHY
			
			var targetOutput:TextField = userInterface().getMainTextField();
			var currText:String = userInterface().outputBuffer;
			
			var currLines:int = targetOutput.numLines;
			
			output(" " + tMsg, false, false);
			
			if (targetOutput.numLines != currLines)
			{
				userInterface().outputBuffer = currText;
				userInterface().output();
				output("\n" + tMsg, false, false);
			}
		}
	}
}