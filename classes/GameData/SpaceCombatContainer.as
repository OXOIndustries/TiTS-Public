package classes.GameData 
{
	import classes.Creature;
	import classes.Engine.ShipCombat.*;
	import classes.Engine.Interfaces.*;
	import classes.Ships.SpaceShip;
	import classes.Ships.StatusEffectPayload;
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
		
		// Just a nice utility func for shorthand code/optimization
		private var _playerShip:SpaceShip;
		public function get PlayerShip():SpaceShip { return _playerShip; }
		
		public function get PlayerShip():SpaceShip
		{
			return kGAMECLASS.shipDb.ActivePlayerShip;
		}
		
		private var _currentCombatRange:uint = ShipCombatOrderContainer.RANGE_FAR;
		public function get CurrentCombatRange():uint { return _currentCombatRange; }
		public function set CurrentCombatRange(v:uint):void { _currentCombatRange = v; }
		
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
			displayFightLocation();
			showCombatMenu();
			userInterface().levelUpOff();
			userInterface().messengerOff();
		}
		
		override public function showCombatMenu():void
		{
			if (!doneRoundActions())
			{
				doPerRoundActions();
			}
			
			setAllButtonColors(true);
			
			addButton(0, "Overcharge", showOverchargeMenu);
			
			// We don't (yet) have any maneuvers that the player can learn, so I'm yoloing implementation until we do
			//addButton(1, "Maneuvers", );
			addDisabledButton(1, "Maneuvers", "Maneuvers", "You haven't learned or been granted any maneuvers yet!");
			
			addButton(2, "Gadgets", );
			
			addButton(5, "Navigation", showNavigationMenu);
			
			addButton(6, "Gunnery", );
			addButton(7, "Crew", );
			
			addButton(14, "EXECUTE", executePlayerOrders);
		}
		
		private function showNavigationMenu():void
		{
			clearOutput();
			clearMenu();
			
			setAllButtonColors(true);
			
			var dRange:uint = PlayerShip.CombatOrders.DesiredRange;
			
			if (dRange < 4)
			{
				output("Your navigation profile will attempt to maintain " + ShipCombatOrderContainer.RANGE_NAMES[dRange] + " against the enemy ship.");
			}
			else
			{
				output("Your navigation profile will focus purely on evading enemy fire and pay little attention to combat range.");
			}
			
			for (var i:int = 0; i < 4; i++)
			{
				if (dRange != i)
				{
					addButton(i, ShipCombatOrderContainer.RANGE_BUTTON_NAMES[i], setDesiredRange, i);
				}
				else
				{
					addDisabledButton(i, ShipCombatOrderContainer.RANGE_BUTTON_NAMES[i]);
					setButtonPurple(i);
				}
			}
			
			addButton(i, "Evasion", setDesiredRange, 4);
			
			addButton(14, "Back", showCombatMenu);
		}
		
		private function setDesiredRange(rangeV:uint):void
		{
			PlayerShip.CombatOrders.DesiredRange = rangeV;
			showNavigationMenu();
		}
		
		private function showOverchargeMenu():void
		{
			clearOutput();
			clearMenu();
			setAllButtonColors(true);
			
			output("You can elect to provide selected stations around your ship a temporary burst of power, vastly increasing the effects that they provide for a single combat round. Once overcharged, the console will require time to cool back down, so select wisely; each station can only be overcharged once per fight.");
			
			var overchargeStates:StatusEffectPayload = PlayerShip.GetStatusEffect("Overcharge States");
			var usedOvercharges:uint = 0;
			
			if (overchargeStates != null)
			{
				usedOvercharges = overchargeStates.Payload.overchargeStates;
			}
			
			for (var i:int = 0; i < ShipCombatOrderContainer.OVERCHARGE_STATION_DETAILS.length; i++)
			{
				var sDetails:OverchargeStationDetails = ShipCombatOrderContainer.OVERCHARGE_STATION_DETAILS[i] as OverchargeStationDetails;
				
				if (i == 0) output("\n\n<b>" + sDetails.StationTitle + "</b>: ");
				else output("\n<b>" + sDetails.StationTitle + "</b>: ");
				
				if (usedOvercharges & sDetails.OverchargeMask > 0)
				{
					output(sDetails.UnavailableDescription);
					addDisabledButton(i, sDetails.ButtonTitle);
				}
				else
				{
					output(sDetails.AvailableDescription);
					addButton(i, sDetails.ButtonTitle, overchargeToggle, sDetails.OverchargeMask);
					if (PlayerShip.CombatOrders.DesiredOverchargeStation & sDetails.OverchargeMask > 0)
					{
						output(" " + sDetails.SelectedAddendum);
						setButtonPurple(i);
					}
				}
			}
				
			addButton(14, "Back", showCombatMenu);
		}
		
		private function overchargeToggle(tarStation:uint):void
		{
			// We could check for a perk or some equipment here to allow the player to charge multiple stations in a single
			// round or something, but for now...
			if (PlayerShip.CombatOrders.DesiredOverchargeStation == tarStation)
			{
				PlayerShip.CombatOrders.DesiredOverchargeStation = ShipCombatOrderContainer.OVERCHARGE_NONE;
			}
			else
			{
				PlayerShip.CombatOrders.DesiredOverchargeStation = tarStation;
			}
			
			showOverchargeMenu();
		}
		
		private function executePlayerOrders():void
		{
			clearOutput();
			
			// TODO: Rough plan of action:
			// Gather all of the actions that must be decided on first on each ship (f.ex select range).
			// Stuff all of these decisions in the ShipCombatOrderContainer present on _that_ ship, then begin execution in layers
			
			// > Resolve distance
			// > All effects applied
			// > Weaponsfire
			
			var concatLists:Array = _friendlies.concat(_hostiles);
			var numShips:uint = concatLists.length;
			
			for (var i:int = 0; i < numShips; i++)
			{
				var ss:SpaceShip = concatLists[i] as SpaceShip;
				if (ss != PlayerShip) ss.CombatAI(_friendlies, _hostiles);
				
				// We can apply the overcharges right now, as this'll be the first "tier" of things that need to happen
				applyOverchargeStates(ss);
			}
			
			// This will need to be reworked for multiple ships but that'll be way down the line if it ever happens.
			// This should be (relatively) easy, it's just legworking I don't want to invest right now:
			// Offer target selection when selecting a new range, store that alongside the desired range, allow all ships
			// to resolve based off this and give the ships that _arent_ the target essentially a free-roll to their desired range.
			if (_friendlies.length > 1 || _hostiles.length > 1)
			{
				throw new Error("Ship range resolution requires refactoring to handle multiple ships on either side of combat!");
			}
			
			resolveRangeChanges(_friendlies[0], _hostiles[0]);
			
			
		}
		
		private function applyOverchargeStates(tarShip:SpaceShip):void
		{
			if (tarShip.CombatOrders.DesiredOverchargeStation != ShipCombatOrderContainer.OVERCHARGE_NONE)
			{
				// This will apply ALL overcharge effects as stored in the single mask value. See the overchargeToggle() function; this shouldn't need
				// be touched to enable multiple overcharges. The tracking of overcharges may need to be fiddled though if we want to enable the player
				// being able to do things like overcharge the same thing multiple times in a single encounter etc. (Heatsinking?)
				for (var i:int = 0; i < ShipCombatOrderContainer.OVERCHARGE_STATION_MASKS.length; i++)
				{
					if (tarShip.CombatOrders.DesiredOverchargeStation & ShipCombatOrderContainer.OVERCHARGE_STATION_MASKS[i] > 0)
					{
						var overchargeDetails:OverchargeStationDetails = ShipCombatOrderContainer.OVERCHARGE_STATION_DETAILS[i] as OverchargeStationDetails;
						overchargeDetails.EffectApplicator(tarShip);
					}
				}
			}
		}
		
		private function resolveRangeChanges(shipA:SpaceShip, shipB:SpaceShip):void
		{
			// Shortcut- if both ships want to be closer than current, just make them closer.
			if (shipA.CombatOrders.DesiredRange < CurrentCombatRange && shipB.CombatOrders.DesiredRange < CurrentCombatRange)
			{
				CurrentCombatRange--;
				output("You and "+ shipB.CombatNameFormatted() + " race head-on toward each other, closing to " + getCurrentRange() + "!");
				return;
			}
			else if (shipA.CombatOrders.DesiredRange > CurrentCombatRange && shipB.CombatOrders.DesiredRange > CurrentCombatRange)
			{
				CurrentCombatRange++;
				output("You and " + shipB.CombatNameFormatted() + " list away from each other, the void between your ships increasing to " + getCurrentRange() + "!");
			}
			
			var aRoll:Number = shipA.Thrust() + rand(20) + 1;
			var bRoll:Number = shipB.Thrust() + rand(20) + 1;
			
			if (Math.abs(aRoll - bRoll) < 10) return;
			
			var bestRollShip:SpaceShip;
			var rangeChange:int = 0;
			if (aRoll > bRoll)
			{
				bestRollShip = shipA;
			}
			else
			{
				bestRollShip = shipB;
			}
			
			if (bestRollShip.CombatOrders.DesiredRange < CurrentCombatRange)
			{
				CurrentCombatRange--;
				rangeChange = -1;
			}
			else if (bestRollShip.CombatOrders.DesiredRange > CurrentCombatRange)
			{
				CurrentCombatRange++;
				rangeChange = 1;
			}
			
			if (bestRollShip == shipA)
			{
				if (rangeChange == -1)
				{
					output("You close to " + getCurrentRange() + "!");
				}
				else if (rangeChange == 1)
				{
					output("You pull back from " + shipB.CombatNameFormatted() + ", out to " + getCurrentRange() + "!");
				}
				else
				{
					output("You maintain " + getCurrentRange() + " against " + shipB.CombatNameFormatted() + "!");
				}
			}
			else
			{
				if (rangeChange == -1)
				{
					output(shipB.CombatNameFormatted(true) + " closes to " + getCurrentRange() + !");
				}
				else if (rangeChange == 1)
				{
					output(shipB.CombatNameFormatted(true) + " pulls away from you, expanding the gap between your ships to " + getCurrentRange() + "!");
				}
				else
				{
					output(shipB.CombatNameFormatted(true) + " maintains " + getCurrentRange() + " against you!");
				}
			}
		}
		private function getCurrentRange():String
		{
			return ShipCombatOrderContainer.RANGE_NAMES[CurrentCombatRange];
		}
		
		private function doPerRoundActions():void
		{
			clearOutput();
			clearMenu();
			showCombatUI();
			
			if (checkForVictory()) return;
			if (checkForLoss()) return;
			
			showCombatDescriptions();
			
			_initForRound = _roundCounter;
			
			var concatLists:Array = _friendlies.concat(_hostiles);
			
			for (var i:int = 0; i < concatLists.length; i++)
			{
				var ss:SpaceShip = concatLists[i] as SpaceShip;
				ss.OnRoundStart();
			}
		}
		
		private function showCombatDescriptions():void
		{
			output("{{PLACEHOLDER}} Player ship status.");
			output("\n\n{{PLACEHOLDER}} Enemy ship status.");
		}
		
		override public function processCombat():void
		{
			
		}
		
		override public function endCombatRound():void
		{
			if (checkForVictory(true)) return;
			if (checkForLoss(true)) return;
			
			_roundCounter++;
			
			var concatLists:Array = _friendlies.concat(_hostiles);
			
			for (var i:int = 0; i < concatLists.length; i++)
			{
				var ss:SpaceShip = concatLists[i] as SpaceShip;
				ss.OnRoundEnd();
			}
			
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
			
			if (_playerShip == null)
			{
				throw new Error("Player group was set but the players active ship was not present in the list of Actors.");
			}
		}
		
		private function prepFriendlyForCombat(actor:SpaceShip):void
		{
			// TODO: Placeholder. Anything that needs to be done to setup for a new fight.
			if (actor == kGAMECLASS.shipDb.ActivePlayerShip)
			{
				_playerShip = actor;
			}
			
			actor.BeginCombat();
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
			actor.BeginCombat();
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
				ss.EndCombat();
			}
			
			for (i = 0; i < _hostiles.length; i++)
			{
				ss = _hostiles[i] as SpaceShip;
				ss.EndCombat();
			}
		}
		
		override public function showCombatUI(setAsInit:Boolean = false):void
		{
			
		}
	}

}