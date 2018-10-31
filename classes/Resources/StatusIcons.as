package classes.Resources
{
	/**
	 * Basically, a static library of embedded asset references. You can target things in this class to grab
	 * class type references and instantiate new versions of the assets; 
	 * f.ex var thing:* = new EmbeddedAssets.Icon_Missing();
	 * 
	 * The include path is relative to the location of the file defining the embeds. I'm trying to keep everything
	 * under <PROJECT_FOLDER>/assets/*, so we gots to walk back from the location of the AS source to get there.
	 * @author Gedan
	 */
	public class StatusIcons 
	{
		[Embed(source = "../../assets/icons/statuseffects/unknown.svg", mimeType = "image/svg")]
		public static var Icon_Missing:Class;

		[Embed(source = "../../assets/icons/statuseffects/belly_pregnant.svg", mimeType = "image/svg")]
		public static var Icon_Belly_Pregnant:Class;

		[Embed(source = "../../assets/icons/statuseffects/blocked.svg", mimeType = "image/svg")]
		public static var Icon_Blocked:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/radiosignal.svg", mimeType = "image/svg")]
		public static var Icon_RadioSignal:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/blind.svg", mimeType = "image/svg")]
		public static var Icon_Blind:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/blind-alt.svg", mimeType = "image/svg")]
		public static var Icon_BlindAlt:Class;

		[Embed(source = "../../assets/icons/statuseffects/boob_torso.svg", mimeType = "image/svg")]
		public static var Icon_Boob_Torso:Class;

		[Embed(source = "../../assets/icons/statuseffects/bull.svg", mimeType = "image/svg")]
		public static var Icon_Bull:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/charmed.svg", mimeType = "image/svg")]
		public static var Icon_Charmed:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/confused.svg", mimeType = "image/svg")]
		public static var Icon_Confused:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/constricted.svg", mimeType = "image/svg")]
		public static var Icon_Constricted:Class;

		[Embed(source = "../../assets/icons/statuseffects/cooking.svg", mimeType = "image/svg")]
		public static var Icon_Cooking:Class;

		[Embed(source = "../../assets/icons/statuseffects/cow.svg", mimeType = "image/svg")]
		public static var Icon_Cow:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/crying.svg", mimeType = "image/svg")]
		public static var Icon_Crying:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/def-down.svg", mimeType = "image/svg")]
		public static var Icon_DefDown:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/def-up.svg", mimeType = "image/svg")]
		public static var Icon_DefUp:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/dizzy_drunk.svg", mimeType = "image/svg")]
		public static var Icon_DizzyDrunk:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/dog_paw.svg", mimeType = "image/svg")]
		public static var Icon_Dog_Paw:Class;

		[Embed(source = "../../assets/icons/statuseffects/donut.svg", mimeType = "image/svg")]
		public static var Icon_Donut:Class;

		[Embed(source = "../../assets/icons/statuseffects/drug-pill.svg", mimeType = "image/svg")]
		public static var Icon_DrugPill:Class;
		[Embed(source = "../../assets/icons/statuseffects/drug_pill_heal.svg", mimeType = "image/svg")]
		public static var Icon_Drug_Pill_Heal:Class;
		[Embed(source = "../../assets/icons/statuseffects/drug_pill_heart.svg", mimeType = "image/svg")]
		public static var Icon_Drug_Pill_Heart:Class;
		[Embed(source = "../../assets/icons/statuseffects/drug-vial.svg", mimeType = "image/svg")]
		public static var Icon_DrugVial:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/gears_three.svg", mimeType = "image/svg")]
		public static var Icon_Gears_Three:Class;

		[Embed(source = "../../assets/icons/statuseffects/haste.svg", mimeType = "image/svg")]
		public static var Icon_Haste:Class;

		[Embed(source = "../../assets/icons/statuseffects/horse.svg", mimeType = "image/svg")]
		public static var Icon_Horse:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/lips.svg", mimeType = "image/svg")]
		public static var Icon_Lips:Class;
		[Embed(source = "../../assets/icons/statuseffects/lips_fanged.svg", mimeType = "image/svg")]
		public static var Icon_Lips_Fanged:Class;
		[Embed(source = "../../assets/icons/statuseffects/lips_glossed.svg", mimeType = "image/svg")]
		public static var Icon_Lips_Glossed:Class;
		[Embed(source = "../../assets/icons/statuseffects/lips_lick.svg", mimeType = "image/svg")]
		public static var Icon_Lips_Lick:Class;

		[Embed(source = "../../assets/icons/statuseffects/lollipop.svg", mimeType = "image/svg")]
		public static var Icon_Lollipop:Class;

		[Embed(source = "../../assets/icons/statuseffects/lust-down.svg", mimeType = "image/svg")]
		public static var Icon_LustDown:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/lust-up.svg", mimeType = "image/svg")]
		public static var Icon_LustUp:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/milk.svg", mimeType = "image/svg")]
		public static var Icon_Milk:Class;
		[Embed(source = "../../assets/icons/statuseffects/mindcontrolled_mindbroke.svg", mimeType = "image/svg")]
		public static var Icon_MindcontrolledMindbroke:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/off-down.svg", mimeType = "image/svg")]
		public static var Icon_OffDown:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/off-up.svg", mimeType = "image/svg")]
		public static var Icon_OffUp:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/paralysis.svg", mimeType = "image/svg")]
		public static var Icon_Paralysis:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/penis.svg", mimeType = "image/svg")]
		public static var Icon_Penis:Class;

		[Embed(source = "../../assets/icons/statuseffects/perfume.svg", mimeType = "image/svg")]
		public static var Icon_Perfume:Class;

		[Embed(source = "../../assets/icons/statuseffects/poison.svg", mimeType = "image/svg")]
		public static var Icon_Poison:Class;

		[Embed(source = "../../assets/icons/statuseffects/rain-drops.svg", mimeType = "image/svg")]
		public static var Icon_Rain_Drops:Class;

		[Embed(source = "../../assets/icons/statuseffects/rotate.svg", mimeType = "image/svg")]
		public static var Icon_Rotate:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/splatter.svg", mimeType = "image/svg")]
		public static var Icon_Splatter:Class;

		[Embed(source = "../../assets/icons/statuseffects/silence.svg", mimeType = "image/svg")]
		public static var Icon_Silence:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/slow.svg", mimeType = "image/svg")]
		public static var Icon_Slow:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/smelly.svg", mimeType = "image/svg")]
		public static var Icon_Smelly:Class;

		[Embed(source = "../../assets/icons/statuseffects/sperm.svg", mimeType = "image/svg")]
		public static var Icon_Sperm:Class;
		[Embed(source = "../../assets/icons/statuseffects/sperm_hearts.svg", mimeType = "image/svg")]
		public static var Icon_Sperm_Hearts:Class;
		[Embed(source = "../../assets/icons/statuseffects/sperm_multi.svg", mimeType = "image/svg")]
		public static var Icon_Sperm_Multi:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/spiderweb.svg", mimeType = "image/svg")]
		public static var Icon_SpiderWeb:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/unknown.svg", mimeType = "image/svg")]
		public static var Icon_Unknown:Class;

		[Embed(source = "../../assets/icons/statuseffects/vagina.svg", mimeType = "image/svg")]
		public static var Icon_Vagina:Class;

		[Embed(source = "../../assets/icons/statuseffects/water_drop.svg", mimeType = "image/svg")]
		public static var Icon_Water_Drop:Class;

		[Embed(source = "../../assets/icons/statuseffects/wine.svg", mimeType = "image/svg")]
		public static var Icon_Wine:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/wings.svg", mimeType = "image/svg")]
		public static var Icon_Wings:Class;

		[Embed(source = "../../assets/icons/statuseffects/snowflake.svg", mimeType = "image/svg")]
		public static var Icon_Snowflake:Class;
		
		// Alias some of the Icons to "friendly" properties; basically, lets us reinterpret/configure
		// which icons to use in some cases
		public static var Blind:Class = StatusIcons.Icon_BlindAlt;
		public static var Blocked:Class = StatusIcons.Icon_Blocked;
		public static var Charmed:Class = StatusIcons.Icon_Charmed;
		public static var Constrict:Class = StatusIcons.Icon_Constricted;
		public static var DefenseUp:Class = StatusIcons.Icon_DefUp;
		public static var DefenseDown:Class = StatusIcons.Icon_DefDown;
		public static var OffenseUp:Class = StatusIcons.Icon_OffUp;
		public static var Paralyze:Class = StatusIcons.Icon_Paralysis;
		public static var Pill:Class = StatusIcons.Icon_DrugPill;
		public static var Poison:Class = StatusIcons.Icon_Poison;
		public static var Radio:Class = StatusIcons.Icon_RadioSignal;
		public static var Stun:Class = StatusIcons.Icon_MindcontrolledMindbroke;
		public static var LustUp:Class = StatusIcons.Icon_LustUp;
	}

}