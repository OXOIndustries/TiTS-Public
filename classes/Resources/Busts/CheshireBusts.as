package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CheshireBusts 
	{
		public function get PREVIEW():Class { return Bust_ALISS; }
		public function get SIGNATURE():Class { return SigEmbed; }
		
		[Embed(source = "../../../assets/images/npcs/cheshire/HR/sig.png", mimeType = "image/png")]
		public var SigEmbed:Class;
		
		[Embed(source = "../../../assets/images/npcs/cheshire/aliss.png", mimeType = "image/png")]
		public var Bust_ALISS:Class;
		public function get Bust_ALISS_NUDE():Class { return Bust_ALISS; }

		[Embed(source = "../../../assets/images/npcs/cheshire/anno.png", mimeType = "image/png")]
		public var Bust_ANNO:Class;
		public var Bounds_ANNO:Rectangle = new Rectangle(25, 15, 70, 70);
		[Embed(source = "../../../assets/images/npcs/cheshire/anno_nude.png", mimeType = "image/png")]
		public var Bust_ANNO_NUDE:Class;
		public function get Bust_ANNO_HUSKAR():Class { return Bust_ANNO; }
		public function get Bust_ANNO_HUSKAR_NUDE():Class { return Bust_ANNO_NUDE; }
		
		[Embed(source = "../../../assets/images/npcs/cheshire/Carl.png", mimeType = "image/png")]
		public var Bust_CARL:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/Celise.png", mimeType = "image/png")]
		public var Bust_CELISE:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/Cunt_Snake.png", mimeType = "image/png")]
		public var Bust_CUNTSNAKE:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/Dr_Haswell.png", mimeType = "image/png")]
		public var Bust_DR_HASWELL:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/embry_0.png", mimeType = "image/png")]
		public var Bust_EMBRY_0:Class;
		[Embed(source = "../../../assets/images/npcs/cheshire/embry_0_nude.png", mimeType = "image/png")]
		public var Bust_EMBRY_0_NUDE:Class;
		[Embed(source = "../../../assets/images/npcs/cheshire/embry_1.png", mimeType = "image/png")]
		public var Bust_EMBRY_1:Class;
		[Embed(source = "../../../assets/images/npcs/cheshire/embry_1_nude.png", mimeType = "image/png")]
		public var Bust_EMBRY_1_NUDE:Class;
		//No appropriate bust for this. Use size 3 as filler rather than jar with a different style
		[Embed(source = "../../../assets/images/npcs/cheshire/embry_3_nude.png", mimeType = "image/png")]
		public var Bust_EMBRY_2_NUDE:Class;
		[Embed(source = "../../../assets/images/npcs/cheshire/embry_3.png", mimeType = "image/png")]
		public var Bust_EMBRY_3:Class;
		[Embed(source = "../../../assets/images/npcs/cheshire/embry_3_nude.png", mimeType = "image/png")]
		public var Bust_EMBRY_3_NUDE:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/Flahne.png", mimeType = "image/png")]
		public var Bust_FLAHNE:Class;
		public function get Bust_FLAHNE_NUDE():Class { return Bust_FLAHNE; }
		public function get Bust_FLAHNE_OVI_NUDE():Class { return Bust_FLAHNE; }

		[Embed(source = "../../../assets/images/npcs/cheshire/Rival_Jack.png", mimeType = "image/png")]
		public var Bust_JACK:Class;
		public function get Bust_JACK_NUDE():Class { return Bust_JACK; }
		
		[Embed(source = "../../../assets/images/npcs/cheshire/Rival_Jill.png", mimeType = "image/png")]
		public var Bust_JILL:Class;
		public function get Bust_JILL_NUDE():Class { return Bust_JILL; }

		[Embed(source = "../../../assets/images/npcs/cheshire/Kelly.png", mimeType = "image/png")]
		public var Bust_KELLY:Class;
		public function get Bust_KELLY_NUDE():Class { return Bust_KELLY; }

		[Embed(source = "../../../assets/images/npcs/cheshire/Lapinara.png", mimeType = "image/png")]
		public var Bust_LAPINARA:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/Lapinara_2.png", mimeType = "image/png")]
		public var Bust_LAPINARA_2:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/liriel.png", mimeType = "image/png")]
		public var Bust_LIRIEL:Class;
		
		[Embed(source = "../../../assets/images/npcs/cheshire/milodanfem.png", mimeType = "image/png")]
		public var Bust_MILODANFEM:Class;
		
		[Embed(source = "../../../assets/images/npcs/cheshire/milodanmale.png", mimeType = "image/png")]
		public var Bust_MILODANMALE:Class;
		public var Bounds_MILODANMALE:Rectangle = new Rectangle(20, 1, 62, 62);
		public function get Bust_MILODANMALE_CLUB():Class { return Bust_MILODANMALE; }
		public function get Bounds_MILODANMALE_CLUB():Rectangle { return Bounds_MILODANMALE; }
		public function get Bust_MILODANMALE_AXE():Class { return Bust_MILODANMALE; }
		public function get Bounds_MILODANMALE_AXE():Rectangle { return Bounds_MILODANMALE; }
		public function get Bust_MILODANMALE_NUDE():Class { return Bust_MILODANMALE; }
		public function get Bounds_MILODANMALE_NUDE():Rectangle { return Bounds_MILODANMALE; }
		
		[Embed(source = "../../../assets/images/npcs/cheshire/Machina.png", mimeType = "image/png")]
		public var Bust_MACHINA:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/Mimbrane.png", mimeType = "image/png")]
		public var Bust_MIMBRANE:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/Naleen_Female.png", mimeType = "image/png")]
		public var Bust_NALEEN:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/Naleen_Male.png", mimeType = "image/png")]
		public var Bust_NALEEN_MALE:Class;
		
		[Embed(source = "../../../assets/images/npcs/cheshire/Penny.png", mimeType = "image/png")]
		public var Bust_PENNY:Class;
		public function get Bust_PENNY_NUDE():Class { return Bust_PENNY; }
		public function get Bust_PENNY_NUDE_VIXEN():Class { return Bust_PENNY; }
		public function get Bust_PENNY_NUDE_VIXEN_1():Class { return Bust_PENNY; }
		public function get Bust_PENNY_NUDE_VIXEN_2():Class { return Bust_PENNY; }
		public function get Bust_PENNY_NUDE_HORSE():Class { return Bust_PENNY; }
		public function get Bust_PENNY_NUDE_HORSE_1():Class { return Bust_PENNY; }
		public function get Bust_PENNY_NUDE_HORSE_2():Class { return Bust_PENNY; }
		public function get Bust_PENNY_BIMBO():Class { return Bust_PENNY; }
		public function get Bust_PENNY_BIMBO_VIXEN():Class { return Bust_PENNY; }
		public function get Bust_PENNY_BIMBO_VIXEN_1():Class { return Bust_PENNY; }
		public function get Bust_PENNY_BIMBO_VIXEN_2():Class { return Bust_PENNY; }
		public function get Bust_PENNY_BIMBO_HORSE():Class { return Bust_PENNY; }
		public function get Bust_PENNY_BIMBO_HORSE_1():Class { return Bust_PENNY; }
		public function get Bust_PENNY_BIMBO_HORSE_2():Class { return Bust_PENNY; }

		[Embed(source = "../../../assets/images/npcs/cheshire/Reaha.png", mimeType = "image/png")]
		public var Bust_REAHA:Class;
		
		[Embed(source = "../../../assets/images/npcs/cheshire/sellesy.png", mimeType = "image/png")]
		public var Bust_SELLESY:Class;
		public function get Bust_SELLESY_NUDE():Class { return Bust_SELLESY; }

		[Embed(source = "../../../assets/images/npcs/cheshire/Syri.png", mimeType = "image/png")]
		public var Bust_SYRI:Class;
		[Embed(source = "../../../assets/images/npcs/cheshire/Syri_Nude.png", mimeType = "image/png")]
		public var Bust_SYRI_NUDE:Class;
		//public function get Bust_SYRI_NUDE():Class { return Bust_SYRI; }

		[Embed(source = "../../../assets/images/npcs/cheshire/Vanae_Huntress.png", mimeType = "image/png")]
		public var Bust_VANAE_HUNTRESS:Class;
		[Embed(source = "../../../assets/images/npcs/cheshire/Vanae_Maiden.png", mimeType = "image/png")]
		public var Bust_VANAE_MAIDEN:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/Venus_Pitcher.png", mimeType = "image/png")]
		public var Bust_VENUSPITCHER:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/Venus_Pitcher_Elder.png", mimeType = "image/png")]
		public var Bust_VENUS_PITCHER_ELDER:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/V-Ko.png", mimeType = "image/png")]
		public var Bust_VKO:Class;
		public function get Bust_VKO_NUDE():Class { return Bust_VKO; }

		[Embed(source = "../../../assets/images/npcs/cheshire/Zil_Female.png", mimeType = "image/png")]
		public var Bust_ZILFEMALE:Class;

		[Embed(source = "../../../assets/images/npcs/cheshire/Zil_Male.png", mimeType = "image/png")]
		public var Bust_ZIL:Class;

		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/aliss.png", mimeType = "image/png")]
			public var Full_ALISS:Class;
			public function get Full_ALISS_NUDE():Class { return Full_ALISS; }

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/anno.png", mimeType = "image/png")]
			public var Full_ANNO:Class;
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/anno_nude.png", mimeType = "image/png")]
			public var Full_ANNO_NUDE:Class;
			
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Carl.png", mimeType = "image/png")]
			public var Full_CARL:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Celise.png", mimeType = "image/png")]
			public var Full_CELISE:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Cunt_Snake.png", mimeType = "image/png")]
			public var Full_CUNTSNAKE:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Dr_Haswell.png", mimeType = "image/png")]
			public var Full_DR_HASWELL:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/embry_0.png", mimeType = "image/png")]
			public var Full_EMBRY_0:Class;
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/embry_0_nude.png", mimeType = "image/png")]
			public var Full_EMBRY_0_NUDE:Class;
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/embry_1.png", mimeType = "image/png")]
			public var Full_EMBRY_1:Class;
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/embry_1_nude.png", mimeType = "image/png")]
			public var Full_EMBRY_1_NUDE:Class;
			//No appropriate bust for this. Use size 3 as filler rather than jar with a different style
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/embry_3_nude.png", mimeType = "image/png")]
			public var Full_EMBRY_2_NUDE:Class;
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/embry_3.png", mimeType = "image/png")]
			public var Full_EMBRY_3:Class;
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/embry_3_nude.png", mimeType = "image/png")]
			public var Full_EMBRY_3_NUDE:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Flahne.png", mimeType = "image/png")]
			public var Full_FLAHNE:Class;
			public function get Full_FLAHNE_NUDE():Class { return Full_FLAHNE; }
			public function get Full_FLAHNE_OVI_NUDE():Class { return Full_FLAHNE; }

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Rival_Jack.png", mimeType = "image/png")]
			public var Full_JACK:Class;
			public function get Full_JACK_NUDE():Class { return Full_JACK; }
			
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Rival_Jill.png", mimeType = "image/png")]
			public var Full_JILL:Class;
			public function get Full_JILL_NUDE():Class { return Full_JILL; }

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Kelly.png", mimeType = "image/png")]
			public var Full_KELLY:Class;
			public function get Full_KELLY_NUDE():Class { return Full_KELLY; }

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Lapinara.png", mimeType = "image/png")]
			public var Full_LAPINARA:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Lapinara_2.png", mimeType = "image/png")]
			public var Full_LAPINARA_2:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/liriel.png", mimeType = "image/png")]
			public var Full_LIRIEL:Class;
			
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/milodanfem.png", mimeType = "image/png")]
			public var Full_MILODANFEM:Class;
			
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/milodanmale.png", mimeType = "image/png")]
			public var Full_MILODANMALE:Class;
			public function get Full_MILODANMALE_CLUB():Class { return Full_MILODANMALE; }
			public function get Full_MILODANMALE_AXE():Class { return Full_MILODANMALE; }
			public function get Full_MILODANMALE_NUDE():Class { return Full_MILODANMALE; }
			
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Machina.png", mimeType = "image/png")]
			public var Full_MACHINA:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Mimbrane.png", mimeType = "image/png")]
			public var Full_MIMBRANE:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Naleen_Female.png", mimeType = "image/png")]
			public var Full_NALEEN:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Naleen_Male.png", mimeType = "image/png")]
			public var Full_NALEEN_MALE:Class;
			
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Penny.png", mimeType = "image/png")]
			public var Full_PENNY:Class;
			public function get Full_PENNY_NUDE():Class { return Full_PENNY; }
			public function get Full_PENNY_NUDE_VIXEN():Class { return Full_PENNY; }
			public function get Full_PENNY_NUDE_VIXEN_1():Class { return Full_PENNY; }
			public function get Full_PENNY_NUDE_VIXEN_2():Class { return Full_PENNY; }
			public function get Full_PENNY_NUDE_HORSE():Class { return Full_PENNY; }
			public function get Full_PENNY_NUDE_HORSE_1():Class { return Full_PENNY; }
			public function get Full_PENNY_NUDE_HORSE_2():Class { return Full_PENNY; }
			public function get Full_PENNY_BIMBO():Class { return Full_PENNY; }
			public function get Full_PENNY_BIMBO_VIXEN():Class { return Full_PENNY; }
			public function get Full_PENNY_BIMBO_VIXEN_1():Class { return Full_PENNY; }
			public function get Full_PENNY_BIMBO_VIXEN_2():Class { return Full_PENNY; }
			public function get Full_PENNY_BIMBO_HORSE():Class { return Full_PENNY; }
			public function get Full_PENNY_BIMBO_HORSE_1():Class { return Full_PENNY; }
			public function get Full_PENNY_BIMBO_HORSE_2():Class { return Full_PENNY; }

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Reaha.png", mimeType = "image/png")]
			public var Full_REAHA:Class;
			
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/sellesy.png", mimeType = "image/png")]
			public var Full_SELLESY:Class;
			public function get Full_SELLESY_NUDE():Class { return Full_SELLESY; }

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Syri.png", mimeType = "image/png")]
			public var Full_SYRI:Class;
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Syri_Nude.png", mimeType = "image/png")]
			public var Full_SYRI_NUDE:Class;
			//public function get Full_SYRI_NUDE():Class { return Full_SYRI; }

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Vanae_Huntress.png", mimeType = "image/png")]
			public var Full_VANAE_HUNTRESS:Class;
			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Vanae_Maiden.png", mimeType = "image/png")]
			public var Full_VANAE_MAIDEN:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Venus_Pitcher.png", mimeType = "image/png")]
			public var Full_VENUSPITCHER:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Venus_Pitcher_Elder.png", mimeType = "image/png")]
			public var Full_VENUS_PITCHER_ELDER:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/V-Ko.png", mimeType = "image/png")]
			public var Full_VKO:Class;
			public function get Full_VKO_NUDE():Class { return Full_VKO; }

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Zil_Female.png", mimeType = "image/png")]
			public var Full_ZILFEMALE:Class;

			[Embed(source = "../../../assets/images/npcs/cheshire/hr/Zil_Male.png", mimeType = "image/png")]
			public var Full_ZIL:Class;
		}
	}

}