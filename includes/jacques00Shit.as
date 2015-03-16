//Sexual Gift
public function chooseSexualGift():void {
    clearOutput();
    setLocation("CHOOSING A\nSEXUAL GIFT","PLANET: TERRA","SYSTEM: SOL");
    
    /* Fine here! */
    
    //Make sure there is a none option.
    this.clearMenu();
    if(pc.hasPerk("Virile"))
    {
        //pc.cumQualityRaw -= 1.15;
        pc.removePerk("Virile");
    }
    if(pc.hasPerk("Potent"))
    {
        //pc.cumMultiplierRaw -= 1;
        //pc.refractoryRate -= 1;
        pc.removePerk("Potent");
    }
    if(pc.hasPerk("Elasticity"))
    {
        //pc.elasticity -= .5;
        pc.removePerk("Elasticity");
    }
    if(pc.hasPerk("Fertility"))
    {
        //pc.fertilityRaw -= 0.15;
        pc.removePerk("Fertility");
    }
    if(pc.hasPerk("Milky"))
    {
        pc.removePerk("Milky");
    }
    if(pc.hasPerk("Incubator"))
    {
        //pc.pregnancyMultiplierRaw -= .5;
        pc.removePerk("Incubator");
    }
    if(pc.hasPerk("Hung"))
    {
        if(pc.hasCock()) {
            pc.cocks[0].cLengthRaw -= 1+rand(3);
            pc.cocks[0].cThicknessRatioRaw = 1.0;
        }
        pc.removePerk("Hung");
    }
    if(pc.hasPerk("Mini"))
    {
        if(pc.hasCock()) {
            pc.cocks[0].cLengthRaw += 1;
        }
        pc.removePerk("Mini");
    }
    if(pc.hasPerk("Bulgy"))
    {
        pc.ballSizeRaw -= 4;
        pc.ballEfficiency -= 1;
        pc.removePerk("Bulgy");
    }
    if(pc.hasPerk("Extra Ardor"))
    {
        pc.removePerk("Extra Ardor");
    }
    if(pc.hasPerk("Ice Cold"))
    {
        pc.removePerk("Ice Cold");
    }
    
    /* Fine here! */
    
}


public function applySexualGift(arg:String = "none"):void {
    if(arg == "virile") {
        //pc.cumQualityRaw += 1.15;
        pc.createPerk("Virile",1.15,0,0,0,"Increases the quality of your sperm.");
    }
    else if(arg == "potent") {
        //pc.cumMultiplierRaw += 1;
        //pc.refractoryRate += 1;
        pc.createPerk("Potent",1,1,0,0,"Increases the size of your orgasms and the speed at which you produce ejaculate.");
    }
    else if(arg == "elasticity") {
        pc.createPerk("Elasticity",.5,0,0,0,"Increases the elasticity of your orifices and renders them more resistant to stretching.");
        //pc.elasticity += .5;
    }
    else if(arg == "fertility") {
        //pc.fertilityRaw += 0.15;
        pc.createPerk("Fertility",0.15,0,0,0,"Increases your odds of getting pregnant.");
    }
    else if(arg == "milky") {
        pc.createPerk("Milky",0,0,0,0,"Causes lactation to be induced more easily and harder to stop.");
    }
    else if(arg == "incubator") {
        //(pc as PlayerCharacter).pregnancyIncubationBonusMotherRaw += 0.5;
        pc.createPerk("Incubator",0.5,0,0,0,"Increases the speed at which your pregnancies progress.");
    }
    else if(arg == "hung") {
        pc.createPerk("Hung",0,0,0,0,"Increases the size of your penis and how fast it grows.");
        if(pc.hasCock()) {
            pc.cocks[0].cLengthRaw += 1+rand(3);
            if(pc.cocks[0].cThicknessRatioRaw < 1.1) pc.cocks[0].cThicknessRatioRaw = 1.1;
        }
    }
    else if(arg == "mini") {
        pc.createPerk("Mini",0,0,0,0,"Decreases the size of your penis and how fast it shrinks.");
        if(pc.hasCock()) {
            pc.cocks[0].cLengthRaw -= 1;
        }
    }
    else if(arg == "bulgy") {
        pc.createPerk("Bulgy",0,0,0,0,"Increase the size of any gonads and the speed at which they are enhanced.");
        pc.ballSizeRaw += 4;
        pc.ballEfficiency += 1;
    }
    else if(arg == "extra ardor") {
        pc.createPerk("Extra Ardor",0,0,0,0,"Increases lust gain over time.");
    }
    else if(arg == "ice cold") {
        pc.createPerk("Ice Cold",0,0,0,0,"Slows lust gain over time.");
    }
chooseAPhysicalAffinity();
}