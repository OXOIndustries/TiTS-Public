package classes.TITSSaveEdit.Data 
{
	import classes.CockClass;
	import classes.VaginaClass;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CoCCharacterData 
	{
		// Something I think might be kinda cool (as in I'm going to do this before we "release" the save editor") is making a few quick references to CoC the first time you load a save that had a CoC char imported.
		// I'll round up some progression flags or properties to maybe hang off once this is all working at a minimum level.
		
		public var short:String;
		public var level:int;
		public var xp:int;
		public var femininity:int;
		
		public var skinAdj:String;
		public var skinDesc:String;
		public var skinTone:String;
		public var skinType:int;
		
		public var tailType:int;
		
		public var tallness:int;
		public var tone:int;
		public var thickness:int;
		
		public var tongueType:int;
		
		public var wingDesc:String;
		public var wingType:int;
		
		public var nippleLength:Number;
		
		public var armType:int;
		
		public var eyeType:int;
		public var faceType:int
		public var hairColor:String;
		public var hairType:int;
		public var hairLength:int;
		public var hornType:int;
		public var horns:int;
		public var earType:int;
				
		public var hoursSinceCum:int;
		
		public var buttRating:Number;
		public var hipRating:int;
		
		public var balls:int;
		public var ballSize:Number;
		public var cumMultiplier:Number;

		public var clitLength:Number;
		
		public var ass:CoCAssClass;
		public var breastRows:Array;
		public var cocks:Array;
		public var vaginas:Array;
		
		public function CoCCharacterData() 
		{
			short = "";
			level = 1;
			xp = 0;
			femininity = 50;
			skinAdj = "";
			skinDesc = "skin";
			skinType = 0;
			skinTone = "albino";
			tailType = 0;
			tallness = 0;
			tone = 0;
			thickness = 0;
			tongueType = 0;
			wingDesc = "";
			wingType = 0;
			nippleLength = 0.25;
			armType = 0;
			eyeType = 0;
			faceType = 0;
			hairColor = "no";
			hairType = 0;
			hairLength = 0;
			hipRating = 0;
			hornType = 0;
			horns = 0;
			hoursSinceCum = 0;
			balls = 0;
			ballSize = 0;
			buttRating = 0;
			clitLength = 0.5;
			cumMultiplier = 1.0;
			earType = 0;
			
			ass = new CoCAssClass();
			breastRows = [new CoCBreastRowClass()];
			cocks = [];
			vaginas = [];
		}
		
		public function loadSaveObject(o:Object):void
		{
			this.short = o.short;
			this.level = o.level;
			this.xp = o.XP;
			this.femininity = o.femininity;
			this.skinAdj = o.skinAdj;
			this.skinDesc = o.skinDesc;
			this.skinType = o.skinType;
			this.skinTone = o.skinTone;
			this.tallness = o.tallness;
			this.tone = o.tone;
			this.thickness = o.thickness;
			this.tongueType = o.tongueType;
			this.wingDesc = o.wingDesc;
			this.wingType = o.wingType;
			this.nippleLength = o.nippleLength;
			this.armType = o.armType;
			this.eyeType = o.eyeType;
			this.faceType = o.faceType;
			this.hairColor = o.hairColor;
			this.hairType = o.hairType;
			this.hairLength = o.hairLength;
			this.hipRating = o.hipRating;
			this.hornType = o.hornType;
			this.horns = o.horns;
			this.hoursSinceCum = o.hoursSinceCum;
			this.balls = o.balls;
			this.ballSize = o.ballSize;
			this.buttRating = o.buttRating;
			this.clitLength = o.clitLength;
			this.cumMultiplier = o.cumMultiplier;
			this.earType = o.earType;
			
			this.ass = new CoCAssClass();
			this.ass.loadSaveObject(o.ass);
			
			this.breastRows = new Array();
			for (var i:int = 0; i < o.breastRows.length; i++)
			{
				this.breastRows.push(new CoCBreastRowClass());
				this.breastRows[this.breastRows.length - 1].loadSaveObject(o.breastRows[i]);
			}
			
			this.cocks = new Array();
			for (var i:int = 0; i < o.cocks.length; i++)
			{
				this.cocks.push(new CoCCockClass());
				this.cocks[this.cocks.length - 1].loadSaveObject(o.cocks[i]);
			}
			
			this.vaginas = new Array();
			for (var i:int = 0; i < o.vaginas.length; i++)
			{
				this.vaginas.push(new CoCVaginaClass());
				this.vaginas[this.vaginas.length - 1].loadSaveObject(o.vaginas[i]);
			}
		}	
	}

}