package classes.GameData 
{
	import classes.Creature;
	import classes.Engine.Interfaces.*;
	import classes.Ships.SpaceShip;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SpaceCombatContainer extends CombatContainer
	{	
		// Rounds are an entire set of stages
		private var _initForRound:int = -1;
		private var _roundCounter:int = 0;
		
		public function SpaceCombatContainer() 
		{
			genericVictory = function():void {
				StatTracking.track("space combat/wins");
				getCombatPrizes();
				doCombatCleanup();
			}
			
			genericLoss = function():void {
				StatTracking.track("combat/losses");
				clearMenu();
				
				// TODO: Maybe some form of "Help I am bad" mode similar to initial ground combat
				
				addButton(0, "Next", postCombatReturnToMenu);
				doCombatCleanup();
			}
		}
		
		private function postCombatReturnToMenu():void
		{
			mainGameMenu();
		}
		
		override public function displayFightLocation():void
		{
			var r:String = (roomString != null ? "FIGHT:\n" + roomString : kGAMECLASS.userInterface.roomText);
			var p:String = (planetString != null ? planetString : kGAMECLASS.userInterface.planetText);
			var s:String = (systemString != null ? systemString : kGAMECLASS.userInterface.systemText);
			
			kGAMECLASS.setLocation(r, p, s);
		}
		
		override public function get roundCounter():int { return _roundCounter; }
		
		override public function beginCombat():void
		{
			
		}
		
		override public function showCombatMenu():void
		{
			
		}
		
		override public function processCombat():void
		{
			
		}
		
		override public function endCombatRound():void
		{
			if (checkForVictory(true)) return;
			if (checkForLoss(true)) return;
			
			_roundCounter++;
			
			clearMenu();
			addButton(0, "Next", showCombatMenu);
		}
		
		private function checkForVictory(atEndOfRound:Boolean = false):Boolean
		{
			if (playerVictoryCondition(atEndOfRound))
			{
				var tEnemy:SpaceShip;
				
				if (victoryCondition == CombatManager.SPECIFIC_TARGET_DEFEATED)
				{
					tEnemy = victoryArgument;
				}
				else
				{
					tEnemy = _hostiles[0] as SpaceShip;
				}
				
				showCombatUI();
				
				clearMenu();
				addButton(0, "Victory", function(t_enemy:SpaceShip, t_victoryFunctor:Function):Function {
					return function():void {
						clearOutput();
						
						output("<b>You’ve damaged the enemy ship severely enough to disable it!</b>");
						
						kGAMECLASS.SetEnemyShip(t_enemy);
						showCombatUI();
						t_victoryFunctor();
					}
				}(tEnemy, _victoryFunction));
				return true;
			}
			return false;
		}
		
		private function playerVictoryCondition(atEndOfRound:Boolean = false):Boolean
		{
			if (victoryCondition == CombatManager.ENTIRE_PARTY_DEFEATED || (victoryCondition == CombatManager.SURVIVE_WAVES && !atEndOfRound))
			{
				for (var i:int = 0; i < _hostiles.length; i++)
				{
					var ss:SpaceShip = _hostiles[i] as SpaceShip;
					if (!ss.IsDefeated) return false;
				}
				return true;
			}
			else if (victoryCondition == CombatManager.SURVIVE_WAVES && atEndOfRound)
			{
				if (isNaN(victoryArgument) || victoryArgument <= 0) throw new Error("Wave survival declared as a win condition, with no target waves defined.");
				if (roundCounter >= victoryArgument) return true;
				return false;
			}
			else if (victoryCondition == CombatManager.SPECIFIC_TARGET_DEFEATED)
			{
				if (victoryArgument == undefined || !(victoryArgument is SpaceShip)) throw new Error("Unique target for victory declared as a win condition, with no target defined.");
				if ((victoryArgument as SpaceShip).IsDefeated) return true;
				return false;
			}
			
			return false;
		}
		
		private function checkForLoss(atEndOfRound:Boolean):Boolean
		{
			var tEnemy:SpaceShip;
			
			var bLossCond:Boolean = playerLossCondition(atEndOfRound);
			
			if (bLossCond && lossCondition == CombatManager.ESCAPE && atEndOfRound)
			{
				tEnemy = _hostiles[0] as SpaceShip;
				
				showCombatUI();
				clearMenu();
				
				addButton(0, "Defeat", function(t_enemy:SpaceShip, t_lossFunctor:Function):Function {
					return function():void {
						clearOutput();
						kGAMECLASS.SetEnemyShip(t_enemy);
						CombatManager.showCombatUI();
						t_lossFunctor();
					}
				}(tEnemy, _lossFunction));
				return true;
			}
			else if (bLossCond)
			{
				if (victoryCondition == CombatManager.SPECIFIC_TARGET_DEFEATED)
				{
					tEnemy = victoryArgument;
				}
				else
				{
					tEnemy = _hostiles[0];
				}
				
				showCombatUI();
				
				clearMenu();
				addButton(0, "Defeat", function(t_enemy:SpaceShip, t_lossFunctor:Function):Function {
					return function():void {
						clearOutput();
						
						output("<b>Your ship has sustained too much damage! Critical systems are starting to fail!</b>");
						
						kGAMECLASS.SetEnemyShip(t_enemy);
						showCombatUI();
						t_lossFunctor();
					}
				}(tEnemy, _lossFunction));
				return true;
			}
			return false;
		}
		
		private function playerLossCondition(atEndOfRound:Boolean = false):Boolean
		{
			if (lossCondition == CombatManager.ENTIRE_PARTY_DEFEATED || (lossCondition == CombatManager.SURVIVE_WAVES && !atEndOfRound))
			{
				for (var i:int = 0; i < _friendlies.length; i++)
				{
					var ss:SpaceShip = _friendlies[i] as SpaceShip;
					if (ss.IsDefeated == false) return false;
				}
				return true;
			}
			else if (lossCondition == CombatManager.SURVIVE_WAVES && atEndOfRound)
			{
				if (isNaN(lossArgument) || lossArgument <= 0) throw new Error("Wave limit declared as a loss condition, with no target waves defined.");
				if (roundCounter >= lossArgument) return true;
				return false;
			}
			
			
			
			return false;
		}
		
		override public function doneRoundActions():Boolean
		{
			if (_initForRound == _roundCounter) return true;
			return false;
		}
		
		override public function getCombatPrizes():void
		{
			
		}
		
		override public function setPlayerGroup(... args):void
		{
			if (args.length > 1)
			{
				_friendlies = args;
			}
			else if (args.length == 1)
			{
				if (args[0] is Array)
				{
					_friendlies = args[0];
				}
				else if (args[0] is SpaceShip)
				{
					_friendlies = [args[0]];
				}
			}
			
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				prepFriendlyForCombat(_friendlies[i]);
			}
		}
		
		private function prepFriendlyForCombat(actor:SpaceShip):void
		{
			// TODO: Placeholder. Anything that needs to be done to setup for a new fight.
		}
		
		override public function addFriendlyActor(newActor:*):void
		{
			if (!(newActor is SpaceShip)) throw new Error("Attempted to add a non-ship object as a friendly actor.");
			
			if (_friendlies.indexOf(newActor) != -1) throw new Error("Attempted to add a ship object as a friendly actor, but it already exists in the list of friendly actors.");
			_friendlies.push(newActor);
			prepFriendlyForCombat(newActor);
		}
		
		override public function setEnemyGroup(... args):void
		{
			if (args.length > 1)
			{
				_hostiles = args;
			}
			else if (args.length == 1)
			{
				if (args[0] is Array)
				{
					_hostiles = args[0];
				}
				else if (args[0] is SpaceShip)
				{
					_hostiles = [args[0]];
				}
			}
			
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				prepHostileForCombat(_hostiles[i]);
			}
		}
		
		private function prepHostileForCombat(actor:SpaceShip):void
		{
			// TODO: Placeholder for things that need to happen at the start of combat
		}
		
		override public function addHostileActor(newActor:*):void
		{
			if (!(newActor is SpaceShip)) throw new Error("Attempted to add a non-ship object as a hostile actor.");
			if (_hostiles.indexOf(newActor) != -1) throw new Error("Attempted to add a ship object as a hostile actor, but it already exists in the list of hostile actors.");
			_hostiles.push(newActor);
			prepHostileForCombat(newActor);
			showCombatUI();
		}
		
		override public function removeHostileActor(actorRef:*):void
		{
			if (!(actorRef is SpaceShip)) throw new Error("Attempted to remove a non-ship hostile actor.");
			
			_hostiles.splice(_hostiles.indexOf(actorRef), 1);
			showCombatUI();
		}

		override public function doCombatCleanup():void
		{
			kGAMECLASS.SetAttackerShip(null);
			kGAMECLASS.SetEnemyShip(null);
			kGAMECLASS.SetTargetShip(null);
			
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				var ss:SpaceShip = _friendlies[i] as SpaceShip;
				
				ss.ClearCombatStatusEffects();
			}
			
			for (i = 0; i < _hostiles.length; i++)
			{
				ss = _hostiles[i] as SpaceShip;
				ss.ClearCombatStatusEffects();
			}
		}
		
		override public function showCombatUI(setAsInit:Boolean = false):void
		{
			
		}
	}

}