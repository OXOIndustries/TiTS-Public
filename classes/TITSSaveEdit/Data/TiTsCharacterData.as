package classes.TITSSaveEdit.Data 
{
	import classes.BreastRowClass;
	import classes.CockClass;
	import classes.DataManager.Serialization.ISaveable;
	import classes.DataManager.Serialization.VersionedSaveable;
	import classes.GLOBAL;
	import classes.VaginaClass;
	
	/**
	 * ...
	 * @author Gedan
	 */
	
	public dynamic class TiTsCharacterData implements ISaveable
	{
		// General
		public var short:String;
		public var level:int;
		public var XPRaw:int;
		public var credits:int;
		public var personality:int;
		public var characterClass:int;
		
		// Core Stats
		public var _physiqueRaw:int;
		public var _reflexesRaw:int;
		public var _aimRaw:int;
		public var _intelligenceRaw:int;
		public var _willpowerRaw:int;
		public var _libidoRaw:int;
		public var affinity:String;
		
		// Combat stats
		public var HPMod:int;
		public var energyMod:Number;
		public var lustRaw:Number;
		public var lustVuln:Number;
		
		// Resistances
		public var resistances:Array;
		
		// Tail
		public var tailType:Number;
		public var tailCount:Number;
		public var tailFlags:Array;
		public var tailGenitalArg:Number;
		public var tailGenital:Number;
		
		// Fluids
		public var cumType:Number;
		public var girlCumType:Number;
		public var ballFullness:Number;
		public var ballEfficiency:Number;
		public var refactoryRate:Number;
		public var milkType:Number;
		public var milkMultiplier:Number;
		public var milkStorageMultiplier:Number;
		public var milkFullness:Number;
		public var milkRate:Number;
		
		// Sex Characteristics -- General
		public var genitalSpot:Number;
		public var minutesSinceCum:Number;
		public var timesCum:Number;
		
		// Appearance - General
		public var femininity:Number;
		public var tallness:Number;
		public var thickness:Number;
		public var tone:Number;
		public var hipRatingRaw:Number;
		public var buttRatingRaw:Number;
		public var bellyRatingRaw:Number;
		
		// Appearance -- Hair
		public var hairType:Number;
		public var hairColor:String;
		public var hairLength:Number;
		
		// Appearance -- Skin
		public var skinTone:String;
		public var furColor:String;
		public var scaleColor:String;
		public var skinType:Number;
		public var skinFlags:Array;
		
		// Appearance -- Head
		public var faceType:Number;
		public var faceFlags:Array;
		public var tongueType:Number;
		public var tongueFlags:Array;
		public var lipMod:Number;
		public var lipColor:String;
		public var earType:Number;
		public var horns:Number;
		public var hornLength:Number;
		public var hornType:Number;
		
		// Appearance -- Body
		public var armType:Number;
		public var wingType:Number;
		public var legType:Number;
		public var legFlags:Array;
		public var legCount:Number;
		
		// Sexy Bits
		public var cocks:Array;
		public var vaginas:Array;
		public var breastRows:Array;
		public var ass:VaginaClass;
		
		// Sexy Bits -- Cocks
		public var balls:Number;
		public var ballSizeRaw:Number;
		public var cockVirgin:Boolean;
		
		// Sexy Bits -- Cunts
		public var clitLength:Number;
		public var elasticity:Number;
		public var vaginalVirgin:Boolean;
		
		// Sexy Bits -- Titties
		public var nippleColor:String;
		public var nipplesPerBreast:int;
		public var nippleLengthRatio:Number;
		public var nippleWidthRatio:Number;
		public var dickNippleMultiplier:int;
		public var dickNippleType:int;
		
		// Sexy Bits -- Ass
		public var analVirgin:Boolean;
		
		public TiTsCharacterData()
		{
			analVirgin = true;
			
			nippleColor = "pink";
			nipplesPerBreast = 1;
			nippleLengthRatio = 1;
			nippleWidthRatio = 1;
			dickNippleMultiplier = 3;
			dickNippleType = 0;
			
			clitLength = 0.5;
			elasticity = 1;
			vaginalVirgin = true;
			
			balls = 0;
			ballSizeRaw = 1;
			cockVirgin = true;
			
			cocks = [];
			vaginas = [];
			breastRows = [new BreastRowClass()];
			ass = new VaginaClass(false);
			
			armType = 0;
			wingType = 0;
			legType = 0;
			legFlags = [];
			legCount = 2;
			
			faceType = 0;
			faceFlags = [];
			tongueType = 0;
			tongueFlags = [];
			lipMod = 0;
			lipColor = "peach";
			horns = 0;
			hornType = 0;
			hornLength = 0;
			
			skinTone = "albino";
			furColor = "brown";
			scaleColor = "blue"; // Not red, The Wurst.
			skinType = GLOBAL.SKIN_TYPE_SKIN;
			skinFlags = [];
			
			femininity = 50;
			tallness = 0;
			thickness = 0;
			tone = 0;
			hipRatingRaw = 0;
			buttRatingRaw = 0;
			bellyRatingRaw = 0;
			
			hairType = 0;
			hairColor = "no"; // lel
			hairLength = 0;
			
			short = "Unnamed";
			level = 0;
			XPRaw = 0;
			credits = 0;
			personality = 50;
			characterClass = GLOBAL.CLASS_ENGINEER;
			
			_physiqueRaw = 3;
			_reflexesRaw = 3;
			_aimRaw = 3;
			_intelligenceRaw = 3;
			_willpowerRaw = 3;
			_libidoRaw = 3;
			affinity = "intelligence";
			
			HPMod = 0;
			energyMod = 0;
			lustRaw = 0;
			lustVuln = 1.0;
			
			resistances = [];
			for (var i:int = 0; i < GLOBAL.MAX_DAMAGE_TYPES; i++)
			{
				resistances.push(1.0);
			}
			
			tailType = 0;
			tailCount = 0;
			tailFlags = [];
			tailGenital = 0;
			tailGenitalArg = 0;
			
			cumType = 0;
			girlCumType = 0;
			ballFullness = 100;
			ballEfficiency = 3;
			refactoryRate = 1;
			milkType = 0;
			milkMultiplier = 0;
			milkStorageMultiplier = 1;
			milkFullness = 0;
			milkRate = 10;
			
			genitalSpot = 0;
			timesCum = 0;
			minutesSinceCum = 0;
		}
		
		public function getSaveObject():Object
		{
			return new Object();
		}
		public function loadSaveObject(o:Object):void
		{
			for each (var property:String in this)
			{
				if (property == "cocks")
				{
					this.cocks = new Array();
					
					for (var i:int = 0; i < o.cocks.length; i++)
					{
						this.cocks.push(new CockClass().loadSaveObject(o.cocks[i]));
					}
				}
				else if (property == "vaginas")
				{
					this.vaginas = new Array();
					
					for (var i:int = 0; i < o.vaginas.length; i++)
					{
						this.vaginas.push(new VaginaClass().loadSaveObject(o.vaginas[i]));
					}
				}
				else if (property == "breastRows")
				{
					this.breastRows = new Array();
					
					for (var i:int = 0; i < o.breastRows.length; i++)
					{
						this.breastRows.push(new BreastRowClass().loadSaveObject(o.breastRows[i]));
					}
				}
				else if (property == "ass")
				{
					this.ass = new VaginaClass(false).loadSaveObject(o.ass);
				}
				else
				{
					this[property] = o[property];
				}
			}
		}
	}

}