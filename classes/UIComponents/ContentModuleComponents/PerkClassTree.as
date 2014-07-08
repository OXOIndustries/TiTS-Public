package classes.UIComponents.ContentModuleComponents 
{
	import classes.Creature;
	import fl.containers.ScrollPane;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.TiTS;
	import classes.kGAMECLASS;
	import classes.GameData.Perks;
	import classes.GameData.PerkData;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class PerkClassTree extends ScrollPane
	{
		private var _perkButtonHandler:Function;
		
		private var _content:MovieClip;
		private var _tarCreature:Creature;
		
		private var _perkGroups:Vector.<PerkButtonGroup>;
		private var _perkData:Vector.<PerkData>;
		
		private var _maxPlayerLevel:int = 5;
		private var _maxButtonGroups:int = 10;
		
		private var _configured:Boolean = false;
		private var _configuredForClass:int;
		
		public function PerkClassTree(buttonHandler:Function) 
		{
			_perkButtonHandler = buttonHandler;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.opaqueBackground = null;
		}
		
		private function Build():void
		{
			_content = new MovieClip();
			_content.name = "perkContent";
			this.source = _content;
			
			_perkGroups = new Vector.<PerkButtonGroup>();
			_perkData = kGAMECLASS.perkDB.getPlayerClassPerksList();
			
			// Temporary level cap of... something, because we don't actually need more than 5 atm
			for (var i:int = 2; i <= _maxButtonGroups; i++)
			{
				var pg:PerkButtonGroup = new PerkButtonGroup();
				pg.groupLevel = i;
				
				var levelPerks:Vector.<PerkData> = kGAMECLASS.perkDB.getPerksForLevel(_perkData, i);
				
				if (levelPerks.length == 0)
				{
					pg.setPerkData(PerkData.UNKNOWN, PerkData.UNKNOWN);
				}
				else if (levelPerks.length == 1)
				{
					pg.setPerkData(levelPerks[0]);
				}
				else if (levelPerks.length == 2)
				{
					pg.setPerkData(levelPerks[0], levelPerks[1]);
				}
				else
				{
					throw new Error("Perk level filter fucked up, oops.");
				}
				
				pg.buttonOne.addEventListener(MouseEvent.CLICK, _perkButtonHandler);
				pg.buttonTwo.addEventListener(MouseEvent.CLICK, _perkButtonHandler);
				
				_perkGroups.push(pg);
				
				_content.addChild(pg);
				pg.y = (i - 2) * 45;
				pg.x = (800 / 2) - pg.width / 2;
			}
			
			_configured = true;
			this.update();
		}
		
		public function setInitialState(creature:Creature):void
		{
			if (_configured == false || _configuredForClass != creature.characterClass)
			{
				this.Build();
				_configuredForClass = creature.characterClass;
			}
			
			// Check each perk from each group
			for (var i:int = 0; i < _perkGroups.length; i++)
			{
				// Quick checks -- level < group tier, both unavailable
				if (creature.level < i + 2) 
				{
					_perkGroups[i].setBothUnavailable();
				}
				else
				{
					var perk1:PerkButton = _perkGroups[i].buttonOne;
					var perk2:PerkButton = _perkGroups[i].buttonTwo;
					if (perk2.parent == null) perk2 = null;
					
					if (!creature.hasPerk(perk1.name) && (perk2 && !creature.hasPerk(perk2.name)))
					{
						perk1.setAvailable();
						perk2.setAvailable();
					}
					if (!creature.hasPerk(perk1.name) && !perk2)
					{
						perk1.setAvailable();
					}
					
					if (creature.hasPerk(perk1.name))
					{
						perk1.setTaken();
						if (perk2) perk2.setUnavailable();
					}
					
					if (perk2 && creature.hasPerk(perk2.name))
					{
						perk1.setUnavailable();
						perk2.setTaken();
					}
				}
			}
			
			this.update();
		}
		
		public function getSelectedPerks():Vector.<PerkData>
		{
			var selectedPerks:Vector.<PerkData> = new Vector.<PerkData>();
			
			for (var i:int = 0; i < _perkGroups.length; i++)
			{
				if (_perkGroups[i].buttonOne.isSelected && _perkGroups[i].buttonTwo.isAvailable)
				{
					selectedPerks.push(_perkGroups[i].buttonOne.perkReference);
				}
				else if (_perkGroups[i].buttonTwo.isSelected && _perkGroups[i].buttonOne.isAvailable)
				{
					selectedPerks.push(_perkGroups[i].buttonTwo.perkReference);
				}
			}
			
			return selectedPerks;
		}
	}
}