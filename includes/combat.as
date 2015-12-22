public function goozookaCannon(target:Creature):void
{
	clearOutput();
	pc.destroyItem(new GrayMicrobots(), 1);
	
	output("You pull the goo launcher from over your shoulder and slam a vial of Gray Goo into the back. You brace yourself, sighting in on your target and flipping the ON switch. The launcher beeps, and you pull the trigger, sending a great big blob of gray goop hurtling toward your opponent!");
	
	if (rangedCombatMiss(pc, target, 0))
	{
		// Missed
		output("\n\nHowever the goo sample goes wide, splattering on the ground a little ways away. A moment later, a miniature gray googirl congeals from the mess, looks around, and starts hauling ass away from the fight. Whoops.");
	}
	else
	{
		var damage:TypeCollection;
		var damageResult:DamageResult
		
		// Hit
		if (target is GrayGoo)
		{
			output("\n\nAlthough you probably should have thought this plan through a little better before actioning it; firing Gray Goo samples <i>at a Gray Goo</i> might not have been the smartest choice. All you seem to have achieved is bolstering the strength of your foe!\n");
			
			var heal:Number = target.HPMax() * 0.2;
			if (target.HP() + heal > target.HPMax()) heal = target.HPMax() - target.HP();
			
			damage = new TypeCollection( { tease: 5 } );
			damageResult = applyDamage(damage, pc, target, "suppress");
			
			output("The Gray Goo absorbs her smaller twin on contact.");
			output(" (Heals " + heal + ")");
			
			target.HP(heal);
		}
		else
		{
			output("\n\nThe gray goo splatters across " + target.a + target.short + ", quickly congealing into a miniature googirl who quickly goes to work, attacking your enemy's most sensitive spots with gusto. ");
		
			damage = new TypeCollection( { tease: 33 } );
			damageResult = applyDamage(damage, pc, target, "suppress");
			output("\n");
			output(teaseReactions(damageResult.lustDamage, target));
		}
		
		outputDamage(damageResult);
	}
	
	processCombat();
}

public function pcGooClone(target:Creature):void
{
	clearOutput();
	output("<i>“Go get 'em, [goo.name]!”</i> you shout. She cheers and leaps off of you, half her gooey mass plopping down beside you and reforming into a miniature, big-tittied dancing goo-girl. The mini-goo bounces around, showing off her tits or bending over, flashing her ass and crotch at " + target.a + target.short + ".");
	
	target.lust(3 + rand(3));
	
	pc.createStatusEffect("Reduced Goo", 0, 0, 0, 0, false, "Icon_DefDown", chars["GOO"].short + " has split from your frame and is busy teasing your foes - but it's reduced your defense!", true, 0);
	pc.armor.defense -= 5;
	target.createStatusEffect("Gray Goo Clone", 0, 0, 0, 0, false, "Icon_LustUp", chars["GOO"].short + " is busy distracting your foes!", true, 0);
	processCombat();
}

public function pcRecallGoo():void
{
	clearOutput();
	//Set target as PC incase something gets fucked up with the enemy. That way it doesn't crash when attempting to remove the status from the target.
	var target:Creature = pc;
	
	for (var i:uint = 0; i < foes.length; i++)
	{
		if (foes[i].hasStatusEffect("Gray Goo Clone"))
		{
			target = foes[i];
			break;
		}
	}
	
	output("<i>“Come on back, [goo.name]!”</i> you shout. In the blink of an eye, your body is wrapped in a thick covering of gray goo, cool and wet and comforting.");
	pc.removeStatusEffect("Reduced Goo");
	pc.armor.defense += 5;
	target.removeStatusEffect("Gray Goo Clone");
	processCombat();
}