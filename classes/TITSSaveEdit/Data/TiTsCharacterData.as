package classes.TITSSaveEdit.Data 
{
	import classes.BreastRowClass;
	import classes.CockClass;
	import classes.DataManager.Serialization.ISaveable;
	import classes.DataManager.Serialization.VersionedSaveable;
	import classes.GLOBAL;
	import classes.VaginaClass;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author Gedan
	 */
	
	public class TiTsCharacterData
	{
		public var flagNewFile:Boolean;
		
		private var _backup:Object;
		public function get backup():Object { return _backup; }
		public function set backup(v:Object):void 
		{
			if (v == null)
				trace("bp");
				
			_backup = v; 
		}
		
		public var propertyNames:Array = [
			"short",
			"level",
			"XPRaw",
			"credits",
			"personality",
			"characterClass",
			"physiqueRaw",
			"reflexesRaw",
			"aimRaw",
			"intelligenceRaw",
			"willpowerRaw",
			"libidoRaw",
			"affinity",
			"HPMod",
			"energyMod",
			"lustRaw",
			"lustVuln",
			"resistances",
			"tailType",
			"tailCount", 
			"tailFlags",
			"tailGenitalArg",
			"tailGenital",
			"cumType",
			"girlCumType",
			"ballFullness",
			"ballEfficiency",
			"refractoryRate",
			"milkType",
			"milkMultiplier",
			"milkStorageMultiplier",
			"milkFullness",
			"milkRate",
			"genitalSpot",
			"minutesSinceCum",
			"timesCum",
			"femininity",
			"tallness",
			"thickness",
			"tone",
			"hipRatingRaw",
			"buttRatingRaw",
			"bellyRatingRaw",
			"hairType",
			"hairColor",
			"hairLength",
			"skinTone",
			"furColor",
			"scaleColor",
			"skinType",
			"skinFlags",
			"faceType",
			"faceFlags",
			"tongueType",
			"tongueFlags",
			"lipMod",
			"lipColor",
			"earType",
			"horns",
			"hornLength",
			"hornType",
			"armType",
			"wingType",
			"legType",
			"legFlags",
			"legCount",
			"cocks",
			"vaginas",
			"breastRows",
			"ass",
			"balls",
			"ballSizeRaw",
			"cockVirgin",
			"clitLength",
			"elasticity",
			"vaginalVirgin",
			"nippleColor",
			"nipplesPerBreast",
			"nippleLengthRatio",
			"nippleWidthRatio",
			"dickNippleMultiplier",
			"dickNippleType",
			"analVirgin",
			"eyeType",
			"eyeColor",
			"cumMultiplierRaw",
			"unspentStatPoints",
			"unclaimedClassPerks",
			"unclaimedGenericPerks"
		];
		
		// General
		public var short:String;
		public var level:int;
		public var XPRaw:int;
		public var credits:int;
		public var personality:int;
		public var characterClass:int;
		
		public var unspentStatPoints:int;
		public var unclaimedClassPerks:int;
		public var unclaimedGenericPerks:int;
		
		public var loadLevel:int;
		
		// Core Stats
		public var physiqueRaw:int;
		public var reflexesRaw:int;
		public var aimRaw:int;
		public var intelligenceRaw:int;
		public var willpowerRaw:int;
		public var libidoRaw:int;
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
		public var refractoryRate:Number;
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
		public var eyeType:Number;
		public var eyeColor:String;
		
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
		public var cumMultiplierRaw:Number;
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
		
		public function TiTsCharacterData()
		{
			backup = null;
			
			loadLevel = 0;
			unspentStatPoints = 0;
			unclaimedClassPerks = 0;
			unclaimedGenericPerks = 0;
			
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
			hornType = GLOBAL.TYPE_DEMONIC;
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
			level = 1;
			XPRaw = 0;
			credits = 0;
			personality = 50;
			characterClass = GLOBAL.CLASS_ENGINEER;
			
			physiqueRaw = 3;
			reflexesRaw = 3;
			aimRaw = 3;
			intelligenceRaw = 3;
			willpowerRaw = 3;
			libidoRaw = 3;
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
			girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			ballFullness = 100;
			ballEfficiency = 3;
			refractoryRate = 1;
			milkType = 0;
			milkMultiplier = 0;
			milkStorageMultiplier = 1;
			milkFullness = 0;
			milkRate = 10;
			
			genitalSpot = 0;
			timesCum = 0;
			minutesSinceCum = 0;
			cumMultiplierRaw = 1;
			
			eyeType = 0;
			eyeColor = "blue";
		}
		
		public function getSaveObject():Object
		{
			if (level != loadLevel)
			{
				unspentStatPoints = level - loadLevel * 13;
				unclaimedClassPerks = level - loadLevel;
				unclaimedGenericPerks = level - loadLevel;
			}
			
			var newObj:Object;
			
			if (flagNewFile)
			{
				newObj = {
					classInstance: "classes.Characters::PlayerCharacter",
					version: 1
				};
			}
			else
			{
				newObj = clone(backup);
			}
			
			
			for each (var property:String in propertyNames)
			{
				if (property == "backup")
				{
					continue;
				}
				else if (property == "cocks")
				{
					newObj.cocks = new Array();
					
					for (var i:int = 0; i < this.cocks.length; i++)
					{
						newObj.cocks.push(this.cocks[i].getSaveObject());
					}
				}
				else if (property == "vaginas")
				{
					newObj.vaginas = new Array();
					
					for (var i:int = 0; i < this.vaginas.length; i++)
					{
						newObj.vaginas.push(this.vaginas[i].getSaveObject());
					}
				}
				else if (property == "breastRows")
				{
					newObj.breastRows = new Array();
					
					for (var i:int = 0; i < this.breastRows.length; i++)
					{
						newObj.breastRows.push(this.breastRows[i].getSaveObject());
					}
				}
				else if (property == "ass")
				{
					newObj.ass = this.ass.getSaveObject();
				}
				else
				{
					newObj[property] = this[property];
				}
			}
			
			return newObj;
		}
		
		public function newCharacter():void
		{
			flagNewFile = true;
		}
		
		public function loadSaveObject(o:Object):void
		{
			flagNewFile = false;
			
			this.backup = clone(o);
			
			for each (var property:String in propertyNames)
			{
				if (o[property] == undefined)
				{
					throw new DataError("Couldn't find property name " + property + " on the incoming data object.", 0);
				}
				
				if (this[property] == undefined)
				{
					throw new DataError("Couldn't find property name " + property + " on the Editor Character storage shim.", 1);
				}
				
				if (property == "backup")
				{
					continue;
				}
				else if (property == "cocks")
				{
					this.cocks = new Array();
					
					for (var i:int = 0; i < o.cocks.length; i++)
					{
						this.cocks.push(new CockClass());
						this.cocks[this.cocks.length - 1].loadSaveObject(o.cocks[i]);
					}
				}
				else if (property == "vaginas")
				{
					this.vaginas = new Array();
					
					for (var i:int = 0; i < o.vaginas.length; i++)
					{
						this.vaginas.push(new VaginaClass());
						this.vaginas[this.vaginas.length - 1].loadSaveObject(o.vaginas[i]);
					}
				}
				else if (property == "breastRows")
				{
					this.breastRows = new Array();
					
					for (var i:int = 0; i < o.breastRows.length; i++)
					{
						this.breastRows.push(new BreastRowClass());
						this.breastRows[this.breastRows.length - 1].loadSaveObject(o.breastRows[i]);
					}
				}
				else if (property == "ass")
				{
					this.ass = new VaginaClass(false);
					this.ass.loadSaveObject(o.ass);
				}
				else
				{
					if (o[property] == null || o[property] == undefined) continue;
					if (o[property] is Number && isNaN(o[property])) continue;
					this[property] = o[property];
				}
			}
			
			loadLevel = level;
		}
		
		public function resetToInitialState():void
		{
			loadSaveObject(backup);
		}
		
		private function clone(o:Object):Object
		{
			var cp:ByteArray = new ByteArray();
			cp.writeObject(o);
			cp.position = 0;
			var newO:Object = cp.readObject();
			return newO;
		}
		
		// Assistance functions to generate the stored save file data used for slot indent
		public function mfn(m:String, f:String, n:String = null):String
		{
			var w:Number = femininity;
			
			if (biggestTitSize() >= 1)
			{
				if (biggestTitSize() * 3 > 50) w += 50;
				else w += biggestTitSize() * 3;
			}
			else if (biggestTitSize() == 0)
			{
				w -= 20;
			}
			
			if (hipRatingRaw >= 6) w += hipRatingRaw * 1.5;
			else w -= (6 - hipRatingRaw) * 3;
			
			if (hairLength > 8) w += (hairLength - 7) * 1.5;
			else w -= (8 - hairLength) * 1.5;
			
			if (tone > 70) w -= 10;
			if (tone < 30) w += 10;
			
			if (lipMod > 1) w += lipMod * 3;
			
			if (n != null)
			{
				if (w >= 45 && w <= 55) return n;
				if (w <= 45) return m;
				return f;
			}
			else
			{
				if (w < 50) return m;
				return f;
			}
		}
		
		public function biggestTitSize():Number
		{
			if (breastRows.length == 0) return -1;
			
			var ret:Number = -1;
			
			for (var i:int = 0; i < breastRows.length; i++)
			{
				if (breastRows[i].breastRating() > ret) ret = breastRows[i].breastRating();
			}
			
			return ret;
		}
	}

}