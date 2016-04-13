package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gedan
	 */
	public class JacquesBusts 
	{
		public function get PREVIEW():Class { return Bust_QUEENOFTHEDEEP; }
		
		[Embed(source = "../../../assets/images/npcs/jacques00/dally.png", mimeType = "image/png")]
		public var Bust_DALLY:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/dally_nude.png", mimeType = "image/png")]
		public var Bust_DALLY_NUDE:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/dally_limp_nude.png", mimeType = "image/png")]
		public var Bust_DALLY_LIMP_NUDE:Class;
		
		// Easiest way to specify these- compiler constants will avoid these being embedded in the non-imagepack version aka OH GOD WHERE DID THE FILESIZE GOOOOO
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/dally.png", mimeType = "image/png", compression = true)]
			public var Full_DALLY:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/dally_nude.png", mimeType = "image/png", compression = true)]
			public var Full_DALLY_NUDE:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/dally_limp_nude.png", mimeType = "image/png", compression = true)]
			public var Full_DALLY_LIMP_NUDE:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/deep_lake_queen.png", mimeType = "image/png")]
		public var Bust_QUEENOFTHEDEEP:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/deep_lake_queen.png", mimeType = "image/png", compression = true)]
			public var Full_QUEENOFTHEDEEP:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/firewall.png", mimeType = "image/png")]
		public var Bust_FIREWALL:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/firewall_battle.png", mimeType = "image/png")]
		public var Bust_FIREWALL_BATTLE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/firewall.png", mimeType = "image/png", compression = true)]
			public var Full_FIREWALL:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/firewall_battle.png", mimeType = "image/png", compression = true)]
			public var Full_FIREWALL_BATTLE:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/queen_fuzzlebottom.png", mimeType = "image/png")]
		public var Bust_FUZZLEBOTTOM:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/queen_fuzzlebottom.png", mimeType = "image/png", compression = true)]
			public var Full_FUZZLEBOTTOM:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/gray_goo_prime.png", mimeType = "image/png")]
		public var Bust_GRAY_GOO_PRIME:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/gray_goo_prime_2.png", mimeType = "image/png")]
		public var Bust_GRAY_GOO_PRIME_2:Class;
		public var Bounds_GRAY_GOO_PRIME_2:Rectangle = new Rectangle(30, 6, 60, 55);
		[Embed(source = "../../../assets/images/npcs/jacques00/gray_goo_giga.png", mimeType = "image/png")]
		public var Bust_GRAY_GOO_GIGA:Class;
		public var Bounds_GRAY_GOO_GIGA:Rectangle = new Rectangle(70, 6, 60, 60);
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/gray_goo_prime.png", mimeType = "image/png", compression = true)]
			public var Full_GRAY_GOO_PRIME:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/gray_goo_prime_2.png", mimeType = "image/png", compression = true)]
			public var Full_GRAY_GOO_PRIME_2:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/gray_goo_giga.png", mimeType = "image/png", compression = true)]
			public var Full_GRAY_GOO_GIGA:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/hand_so.png", mimeType = "image/png")]
		public var Bust_HAND_SO:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/hand_so.png", mimeType = "image/png", compression = true)]
			public var Full_HAND_SO:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/irellia.png", mimeType = "image/png")]
		public var Bust_IRELLIA:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/irellia.png", mimeType = "image/png", compression = true)]
			public var Full_IRELLIA:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/liliana.png", mimeType = "image/png")]
		public var Bust_LILIANA:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/liliana_blanket.png", mimeType = "image/png")]
		public var Bust_LILIANA_BLANKET:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/liliana_nude.png", mimeType = "image/png")]
		public var Bust_LILIANA_NUDE:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/liliana_cyborg.png", mimeType = "image/png")]
		public var Bust_LILIANA_CYBORG:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/liliana_cyborg_nude.png", mimeType = "image/png")]
		public var Bust_LILIANA_CYBORG_NUDE:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/liliana_regen.png", mimeType = "image/png")]
		public var Bust_LILIANA_REGEN:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/liliana_regen_nude.png", mimeType = "image/png")]
		public var Bust_LILIANA_REGEN_NUDE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/liliana.png", mimeType = "image/png", compression = true)]
			public var Full_LILIANA:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/liliana_blanket.png", mimeType = "image/png", compression = true)]
			public var Full_LILIANA_BLANKET:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/liliana_nude.png", mimeType = "image/png", compression = true)]
			public var Full_LILIANA_NUDE:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/liliana_cyborg.png", mimeType = "image/png", compression = true)]
			public var Full_LILIANA_CYBORG:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/liliana_cyborg_nude.png", mimeType = "image/png", compression = true)]
			public var Full_LILIANA_CYBORG_NUDE:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/liliana_regen.png", mimeType = "image/png", compression = true)]
			public var Full_LILIANA_REGEN:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/liliana_regen_nude.png", mimeType = "image/png", compression = true)]
			public var Full_LILIANA_REGEN_NUDE:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/lyralla.png", mimeType = "image/png")]
		public var Bust_LYRALLA:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/lyralla_nude.png", mimeType = "image/png")]
		public var Bust_LYRALLA_NUDE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/lyralla.png", mimeType = "image/png", compression = true)]
			public var Full_LYRALLA:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/lyralla_nude.png", mimeType = "image/png", compression = true)]
			public var Full_LYRALLA_NUDE:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/myr_gold_pilot.png", mimeType = "image/png")]
		public var Bust_MYR_GOLD_PILOT:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/myr_gold_soldier.png", mimeType = "image/png")]
		public var Bust_MYR_GOLD_GUARD:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/myr_gold_guard.png", mimeType = "image/png")]
		public var Bust_MYR_GOLD_GUARD_HAMMER:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/myr_gold_rebel.png", mimeType = "image/png")]
		public var Bust_MYR_GOLD_REBEL:Class;
		[Embed(source = "../../../assets/images/npcs/jacques00/myr_gold_student.png", mimeType = "image/png")]
		public var Bust_MYR_GOLD_STUDENT:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/myr_gold_pilot.png", mimeType = "image/png", compression = true)]
			public var Full_MYR_GOLD_PILOT:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/myr_gold_soldier.png", mimeType = "image/png", compression = true)]
			public var Full_MYR_GOLD_GUARD:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/myr_gold_guard.png", mimeType = "image/png", compression = true)]
			public var Full_MYR_GOLD_GUARD_HAMMER:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/myr_gold_rebel.png", mimeType = "image/png", compression = true)]
			public var Full_MYR_GOLD_REBEL:Class;
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/myr_gold_student.png", mimeType = "image/png", compression = true)]
			public var Full_MYR_GOLD_STUDENT:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/myr_red_guard.png", mimeType = "image/png")]
		public var Bust_MYR_RED_GUARD:Class;
		public var Bounds_MYR_RED_GUARD:Rectangle = new Rectangle(34, 10, 75, 75);
		
		[Embed(source = "../../../assets/images/npcs/jacques00/myr_red_guard_mask.png", mimeType = "image/png")]
		public var Bust_MYR_RED_GUARD_MASK:Class;
		public var Bounds_MYR_RED_GUARD_MASK:Rectangle = new Rectangle(34, 10, 75, 75);
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/myr_red_guard.png", mimeType = "image/png", compression = true)]
			public var Full_MYR_RED_GUARD:Class;
			
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/myr_red_guard_mask.png", mimeType = "image/png", compression = true)]
			public var Full_MYR_RED_GUARD_MASK:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/nehzara.png", mimeType = "image/png")]
		public var Bust_NEHZARA:Class;		
		[Embed(source = "../../../assets/images/npcs/jacques00/nehzara_nude.png", mimeType = "image/png")]
		public var Bust_NEHZARA_NUDE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/nehzara.png", mimeType = "image/png", compression = true)]
			public var Full_NEHZARA:Class;		
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/nehzara_nude.png", mimeType = "image/png", compression = true)]
			public var Full_NEHZARA_NUDE:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/queen_marsail.png", mimeType = "image/png")]
		public var Bust_MARSAIL:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/queen_marsail.png", mimeType = "image/png", compression = true)]
			public var Full_MARSAIL:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/matron_oserre.png", mimeType = "image/png")]
		public var Bust_MATRON_OSERRE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/matron_oserre.png", mimeType = "image/png", compression = true)]
			public var Full_MATRON_OSERRE:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/scalla.png", mimeType = "image/png")]
		public var Bust_SCALLA:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/scalla.png", mimeType = "image/png", compression = true)]
			public var Full_SCALLA:Class;
		}
		
		[Embed(source = "../../../assets/images/npcs/jacques00/varmint.png", mimeType = "image/png")]
		public var Bust_VARMINT:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jacques00/hr/varmint.png", mimeType = "image/png", compression = true)]
			public var Full_VARMINT:Class;
		}
		
	}

}