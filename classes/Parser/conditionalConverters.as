


		// Possible text arguments in the conditional of a if statement
		// First, there is an attempt to cast the argument to a Number. If that fails,
		// a dictionary lookup is performed to see if the argument is in the conditionalOptions[]
		// object. If that fails, we just fall back to returning 0
		public var conditionalOptions:Object =
		{

			// TODO: FIX
				"strength"			: function(thisPtr:*):* {return  thisPtr.player.str;},
				"toughness"			: function(thisPtr:*):* {return  thisPtr.player.tou;},
				"speed"				: function(thisPtr:*):* {return  thisPtr.player.spe;},
				"intelligence"		: function(thisPtr:*):* {return  thisPtr.player.inte;},
				"libido"			: function(thisPtr:*):* {return  thisPtr.player.lib;},
				"sensitivity"		: function(thisPtr:*):* {return  thisPtr.player.sens;},
				"corruption"		: function(thisPtr:*):* {return  thisPtr.player.cor;},
				"fatigue"			: function(thisPtr:*):* {return  thisPtr.player.fatigue;},
				"hp"				: function(thisPtr:*):* {return  thisPtr.player.HP;},
				"hour"				: function(thisPtr:*):* {return  thisPtr.model.time.hours;},
				"days"				: function(thisPtr:*):* {return  thisPtr.model.time.days;},
				"tallness"			: function(thisPtr:*):* {return  thisPtr.player.tallness;},
				"hairlength"		: function(thisPtr:*):* {return  thisPtr.player.hairLength;},
				"femininity"		: function(thisPtr:*):* {return  thisPtr.player.femininity;},
				"masculinity"		: function(thisPtr:*):* {return  100 - thisPtr.player.femininity;},
				"cocks"				: function(thisPtr:*):* {return  thisPtr.player.cockTotal();},
				"breastrows"		: function(thisPtr:*):* {return  thisPtr.player.bRows();},
				"biggesttitsize"	: function(thisPtr:*):* {return  thisPtr.player.biggestTitSize();},
				"vagcapacity"		: function(thisPtr:*):* {return  thisPtr.player.vaginalCapacity();},
				"analcapacity"		: function(thisPtr:*):* {return  thisPtr.player.analCapacity();},
				"balls"				: function(thisPtr:*):* {return  thisPtr.player.balls;},
				"cumquantity"		: function(thisPtr:*):* {return  thisPtr.player.cumQ();},
				"biggesttitsize"	: function(thisPtr:*):* {return  thisPtr.player.biggestTitSize();},
				"milkquantity"		: function(thisPtr:*):* {return  thisPtr.player.lactationQ();},
				"hasvagina"			: function(thisPtr:*):* {return  thisPtr.player.hasVagina();},
				"istaur"			: function(thisPtr:*):* {return  thisPtr.player.isTaur();},
				"isnaga"			: function(thisPtr:*):* {return  thisPtr.player.isNaga();},
				"isgoo"				: function(thisPtr:*):* {return  thisPtr.player.isGoo();},
				"isbiped"			: function(thisPtr:*):* {return  thisPtr.player.isBiped();},
				"hasbreasts"		: function(thisPtr:*):* {return  (thisPtr.player.biggestTitSize() >= 1);},
				"hasballs"			: function(thisPtr:*):* {return  (thisPtr.player.balls > 0);},
				"hascock"			: function(thisPtr:*):* {return  thisPtr.player.hasCock();},
				"isherm"			: function(thisPtr:*):* {return  (thisPtr.player.gender == 3);},
				"cumnormal"			: function(thisPtr:*):* {return  (thisPtr.player.cumQ() <= 150);},
				"cummedium"			: function(thisPtr:*):* {return  (thisPtr.player.cumQ() > 150 && thisPtr.player.cumQ() <= 350);},
				"cumhigh"			: function(thisPtr:*):* {return  (thisPtr.player.cumQ() > 350 && thisPtr.player.cumQ() <= 1000);},
				"cumveryhigh"		: function(thisPtr:*):* {return  (thisPtr.player.cumQ() > 1000 && thisPtr.player.cumQ() <= 2500);},
				"cumextreme"		: function(thisPtr:*):* {return  (thisPtr.player.cumQ() > 2500);},
				"issquirter"		: function(thisPtr:*):* {return  (thisPtr.player.wetness() >= 4);},
				"ispregnant"		: function(thisPtr:*):* {return  (thisPtr.player.pregnancyIncubation > 0);},
				"isbuttpregnant"	: function(thisPtr:*):* {return  (thisPtr.player.buttPregnancyIncubation > 0);},
				"hasnipplecunts"	: function(thisPtr:*):* {return  thisPtr.player.hasFuckableNipples();},
				"canfly"			: function(thisPtr:*):* {return  thisPtr.player.canFly();},
				"islactating"		: function(thisPtr:*):* {return  (thisPtr.player.lactationQ() > 0);},
				"true"				: function(thisPtr:*):* {return  true;},
				"false"				: function(thisPtr:*):* {return  false;}
			}
