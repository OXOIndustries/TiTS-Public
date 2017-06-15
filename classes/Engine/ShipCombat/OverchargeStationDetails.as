package classes.Engine.ShipCombat 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class OverchargeStationDetails
	{
		public var StationTitle:String;
		public var ButtonTitle:String;
		public var OverchargeMask:uint;
		public var AvailableDescription:String;
		public var UnavailableDescription:String;
		public var SelectedAddendum:String;
		public var EffectApplicator:Function;
		
		public function OverchargeStationDetails(InTitle:String, InButton:String, InMask:uint, InAvail:String, InUnavail:String, InSelAdd:String, EffectApply:Function)
		{
			StationTitle = InTitle;
			ButtonTitle = InButton;
			OverchargeMask = InMask;
			AvailableDescription = InAvail;
			UnavailableDescription = InUnavail;
			SelectedAddendum = InSelAdd;
			EffectApplicator = EffectApply;
		}
	}

}