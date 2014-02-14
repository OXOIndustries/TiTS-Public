import flash.system.SecurityDomain;
import flash.system.Security;

public function doThatTestingThang():void
{

	// Excercise the parser. This should catch parser regressions, I think.
	// 
	// 
	this.clearOutput();

	this.output(<![CDATA[

**Parser Tests!**

##Bracket escaping!##

* \\\[cock\\\]
* [cock]

**Single word nouns**

* \\\[pc.gear\\\]                  - [pc.gear]
* \\\[pc.short\\\]                 - [pc.short]
* \\\[pc.name\\\]                  - [pc.name]
* \\\[pc.race\\\]                  - [pc.race]
* \\\[pc.armor\\\]                 - [pc.armor]
* \\\[pc.lowerUndergarment\\\]     - [pc.lowerUndergarment]
* \\\[pc.upperUndergarment\\\]     - [pc.upperUndergarment]
* \\\[pc.originalRace\\\]          - [pc.originalRace]
* \\\[pc.skinFurScales\\\]         - [pc.skinFurScales]
* \\\[pc.skin\\\]                  - [pc.skin]
* \\\[pc.hairDescript\\\]          - [pc.hairDescript]
* \\\[pc.hair\\\]                  - [pc.hair]
* \\\[pc.hairsDescript\\\]         - [pc.hairsDescript]
* \\\[pc.face\\\]                  - [pc.face]
* \\\[pc.lips\\\]                  - [pc.lips]
* \\\[pc.lip\\\]                   - [pc.lip]
* \\\[pc.tongue\\\]                - [pc.tongue]
* \\\[pc.base\\\]                  - [pc.base]
* \\\[pc.sheath\\\]                - [pc.sheath]
* \\\[pc.knot\\\]                  - [pc.knot]
* \\\[pc.multiCockDescript\\\]     - [pc.multiCockDescript]
* \\\[pc.cocks\\\]                 - [pc.cocks]
* \\\[pc.cocksDescript\\\]         - [pc.cocksDescript]
* \\\[pc.cocksDescriptLight\\\]    - [pc.cocksDescriptLight]
* \\\[pc.cocksLight\\\]            - [pc.cocksLight]
* \\\[pc.cockNounComplex\\\]       - [pc.cockNounComplex 0]
* \\\[pc.cockNounSimple\\\]        - [pc.cockNounSimple 0]
* \\\[pc.cockHead\\\]              - [pc.cockHead 0]
* \\\[pc.cockhead\\\]              - [pc.cockhead 0]
* \\\[pc.cockHeads\\\]             - [pc.cockHeads]
* \\\[pc.cockDescript\\\]          - [pc.cockDescript]
* \\\[pc.cock\\\]                  - [pc.cock]
* \\\[pc.biggestCockDescript\\\]   - [pc.biggestCockDescript]
* \\\[pc.biggestCock\\\]           - [pc.biggestCock]
* \\\[pc.cockBiggest\\\]           - [pc.cockBiggest]
* \\\[pc.biggestCockHead\\\]       - [pc.biggestCockHead]
* \\\[pc.cockHeadBiggest\\\]       - [pc.cockHeadBiggest]
* \\\[pc.eachCockHead\\\]          - [pc.eachCockHead]
* \\\[pc.tailCock\\\]              - [pc.tailCock]
* \\\[pc.cockTail\\\]              - [pc.cockTail]
* \\\[pc.nipple\\\]                - [pc.nipple]
* \\\[pc.nippleDescript\\\]        - [pc.nippleDescript]
* \\\[pc.nipples\\\]               - [pc.nipples]
* \\\[pc.nipplesDescript\\\]       - [pc.nipplesDescript]
* \\\[pc.nippleCockDescript\\\]    - [pc.nippleCockDescript]
* \\\[pc.nippleCock\\\]            - [pc.nippleCock]
* \\\[pc.nippleCocksDescript\\\]   - [pc.nippleCocksDescript]
* \\\[pc.nippleCocks\\\]           - [pc.nippleCocks]
* \\\[pc.eachCock\\\]              - [pc.eachCock]
* \\\[pc.oneCock\\\]               - [pc.oneCock]
* \\\[pc.ballsDescript\\\]         - [pc.ballsDescript]
* \\\[pc.balls\\\]                 - [pc.balls]
* \\\[pc.sackDescript\\\]          - [pc.sackDescript]
* \\\[pc.sack\\\]                  - [pc.sack]
* \\\[pc.chestDesc\\\]             - [pc.chestDesc]
* \\\[pc.chest\\\]                 - [pc.chest]
* \\\[pc.allChestDescript\\\]      - [pc.allChestDescript]
* \\\[pc.fullChest\\\]             - [pc.fullChest]
* \\\[pc.biggestBreastDescript\\\] - [pc.biggestBreastDescript]
* \\\[pc.sheathDescript\\\]        - [pc.sheathDescript]
* \\\[pc.sheath\\\]                - [pc.sheath]
* \\\[pc.biggestSheath\\\]         - [pc.biggestSheath]
* \\\[pc.cockClit\\\]              - [pc.cockClit]
* \\\[pc.sackDescript\\\]          - [pc.sackDescript]
* \\\[pc.assholeDescript\\\]       - [pc.assholeDescript]
* \\\[pc.asshole\\\]               - [pc.asshole]
* \\\[pc.buttDescript\\\]          - [pc.buttDescript]
* \\\[pc.butt\\\]                  - [pc.butt]
* \\\[pc.hipDescript\\\]           - [pc.hipDescript]
* \\\[pc.hip\\\]                   - [pc.hip]
* \\\[pc.hipsDescript\\\]          - [pc.hipsDescript]
* \\\[pc.hips\\\]                  - [pc.hips]
* \\\[pc.vaginaDescript\\\]        - [pc.vaginaDescript]
* \\\[pc.vagina\\\]                - [pc.vagina]
* \\\[pc.pussy\\\]                 - [pc.pussy]
* \\\[pc.cunt\\\]                  - [pc.cunt]
* \\\[pc.vaginasDescript\\\]       - [pc.vaginasDescript]
* \\\[pc.vaginas\\\]               - [pc.vaginas]
* \\\[pc.pussies\\\]               - [pc.pussies]
* \\\[pc.eachVagina\\\]            - [pc.eachVagina]
* \\\[pc.oneVagina\\\]             - [pc.oneVagina]
* \\\[pc.vagOrAss\\\]              - [pc.vagOrAss]
* \\\[pc.pussyOrAsshole\\\]        - [pc.pussyOrAsshole]
* \\\[pc.clitDescript\\\]          - [pc.clitDescript]
* \\\[pc.clit\\\]                  - [pc.clit]
* \\\[pc.eachClit\\\]              - [pc.eachClit]
* \\\[pc.oneClit\\\]               - [pc.oneClit]
* \\\[pc.clitsDescript\\\]         - [pc.clitsDescript]
* \\\[pc.clits\\\]                 - [pc.clits]
* \\\[pc.tailVagina\\\]            - [pc.tailVagina]
* \\\[pc.tailCunt\\\]              - [pc.tailCunt]
* \\\[pc.cuntTail\\\]              - [pc.cuntTail]
* \\\[pc.tailgina\\\]              - [pc.tailgina]
* \\\[pc.milkDescript\\\]          - [pc.milkDescript]
* \\\[pc.milk\\\]                  - [pc.milk]
* \\\[pc.cumDescript\\\]           - [pc.cumDescript]
* \\\[pc.cum\\\]                   - [pc.cum]
* \\\[pc.girlCumDescript\\\]       - [pc.girlCumDescript]
* \\\[pc.girlCum\\\]               - [pc.girlCum]
* \\\[pc.cumNoun\\\]               - [pc.cumNoun]
* \\\[pc.cumColor\\\]              - [pc.cumColor]
* \\\[pc.girlCumColor\\\]          - [pc.girlCumColor]
* \\\[pc.milkColor\\\]             - [pc.milkColor]
* \\\[pc.tail\\\]                  - [pc.tail]
* \\\[pc.leg\\\]                   - [pc.leg]
* \\\[pc.legs\\\]                  - [pc.legs]
* \\\[pc.feet\\\]                  - [pc.feet]
* \\\[pc.foot\\\]                  - [pc.foot]
* \\\[pc.toes\\\]                  - [pc.toes]
* \\\[pc.knees\\\]                 - [pc.knees]
* \\\[pc.belly\\\]                 - [pc.belly]



**Boolean tests**

* 1 \\\[if (4==4) HERP|DERP\\\]
* 1 [if (4==4) HERP|DERP]
* 2 \\\[if (4 == 7) HERP|DERP\\\]
* 2 [if (4 == 7) HERP|DERP]
* 3 \\\[if (4==(2+2)) HERP|DERP\\\]
* 3 [if (4==(2+2)) HERP|DERP]
* 4 \\\[if (4==4) HERP|DERP\\\]
* 4 [if (4==4) HERP|DERP]
* 5 \\\[if (4==7) [if (4==7) HERP]\\\]
* 5 [if (4==7) [if (4==7) HERP]]
* 6 \\\[if (4==7) [if (4==7) HERP|DERP]\\\]
* 6 [if (4==7) [if (4==7) HERP|DERP]]
* 7 \\\[if (4=4) [if (4=4) HERP]\\\]
* 7 [if (4=4) [if (4=4) HERP]]
* 8 \\\[if (4==4) [if (4==4) HERP]\\\]
* 8 [if (4==4) [if (4==4) HERP]]
* 9 \\\[if (4==biggesttitsize) \\\]
* 9 [if (4==biggesttitsize) ]
* 10 \\\[if (4==biggesttitsize) HERP|DERP\\\]
* 10 [if (4==biggesttitsize) HERP|DERP]
* 11 \\\[if (analcapacity>3)    HERP|DERP\\\]
* 11 [if (analcapacity>3)    HERP|DERP]
* 12 \\\[if (analcapacity>3) HERP|DERP\\\]
* 12 [if (analcapacity>3) HERP|DERP]
* 13 \\\[if (analcapacity = 0)  HERP|DERP\\\]
* 13 [if (analcapacity = 0)  HERP|DERP]
* 14 \\\[if (analcapacity = 0) HERP|DERP\\\]
* 14 [if (analcapacity = 0) HERP|DERP]
* 15 \\\[if (analcapacity > 0)  HERP|DERP\\\]
* 15 [if (analcapacity > 0)  HERP|DERP]
* 16 \\\[if (analcapacity > 0) HERP|DERP\\\]
* 16 [if (analcapacity > 0) HERP|DERP]
* 17 \\\[if (hasCock == True) HERP|DERP\\\]
* 17 [if (hasCock == True) HERP|DERP]
* 18 \\\[if (hasVagina == True) HERP|DERP\\\]
* 18 [if (hasVagina == True) HERP|DERP]

**Gender tests**

**PC**

**FancyQuotes!**

Convert '  
It's a herm!

convert "  
"derp a herp"

	]]>, true);


	
	this.clearMenu();
//	this.addButton(4, "Back", debugPane)

}

