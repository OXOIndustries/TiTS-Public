package classes.TITSSaveEdit.Data 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class CoCBreastRowClass 
	{
		public var breasts:Number;
		public var nipplesPerBreast:Number;
		public var breastRating:Number;
		public var lactationMultiplier:Number;
		public var milkFullness:Number;
		public var fullness:Number;
		public var fuckable:Boolean;
		
		public function CoCBreastRowClass() 
		{
			breasts = 2;
			nipplesPerBreast = 1;
			breastRating = 0;
			lactationMultiplier = 0;
			milkFullness = 0;
			fullness = 0;
			fuckable = false;
		}
		
		public function loadSaveObject(o:Object):void
		{
			this.breastRating = o.breastRating;
			this.breasts = o.breasts;
			this.fuckable = o.fuckable;
			this.fullness = o.fullness;
			this.lactationMultiplier = o.lactationMultiplier;
			this.milkFullness = o.milkFullness;
			this.nipplesPerBreast = o.nipplesPerBreast;
		}
	}

}