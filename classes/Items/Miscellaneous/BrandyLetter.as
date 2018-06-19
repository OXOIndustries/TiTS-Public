package classes.Items.Miscellaneous 
{
	/**
	 * ...
	 * @author DrunkZombie
	 */
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class BrandyLetter extends ItemSlotClass
	{
		public function BrandyLetter() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			this.shortName = "BrandyNote";
			this.longName = "Brandy’s Letter";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a letter from Brandy";
			this.tooltip = "A red envelope containing a hand-written letter from Brandy.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 0;
			
			this.version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
	
				kGAMECLASS.output("You take out the crimson envelope from your inventory and hold it up to look at it better. The paper is colored a deep crimson, and on one side is written “[pc.name]” in a rather gorgeous and flowing cursive.");
				kGAMECLASS.output("\n\nFinishing your inspection, you carefully undo the sealing on the envelope and open it to reveal black ink on plain, white paper. The whole thing is rather old-fashioned for this day and age, you think, probably less so for a place like New Texas, but still, all those curvy words on the parchment strike you as oddly personal. Speaking of, Brandy has beautiful penmanship by the looks of it, each word flowing into the next before trailing off like wispy clouds against a blue sky.");
				kGAMECLASS.output("\n\nYou figure you better stop admiring this letter and actually get to <i>reading</i> it, and that’s just what you do:");
				
				kGAMECLASS.output("<i>");
				
				kGAMECLASS.output("\n\nDear [pc.name],");
				kGAMECLASS.output("\n\nI don’t really know how to explain all of this to you, so I’m probably just going to hand this off to customs so they can give it to you. I don’t think I could hand this letter to you in person without blushing and tearing up!");
				kGAMECLASS.output("\n\nAnyway, here it goes.");
				kGAMECLASS.output("\n\nSo, I told you about a mod I took that messed up my Treatments, but I didn’t tell you what it was. Well, back when I was a kid, I had a weird degenerative genetic disorder that ate away at my vocal cords, and that effectively made me mute. So I needed to continuously take meds to stop my body from eating away at the muscles of my larynx. It wasn’t fun sticking myself with a needle every other day, but it would’ve been worse not being able to talk, which I know all too well now.");
				kGAMECLASS.output("\n\nThe thing about those mods, though, is that they’re tailored for each person that uses them, not generic pharmacy stuff. The meds even warned that it’d be sort’ve dangerous to use them with other mods. So, come my treatment, I end up like this... disorder cured, but mute.");
				kGAMECLASS.output("\n\nIt was upsetting for a while, but I learned to live with it... I was always so embarrassed of the mooing though, made me feel so goofy.");
				kGAMECLASS.output("\n\nEventually, I got myself a job at the brewery I work at now.");
				if (kGAMECLASS.flags["BRANDY_MODS"] != undefined) kGAMECLASS.output(" Like I showed you before, I was “free samples” and got those mods that you like so much.\n\n</i>You see a little winking face drawn on the margin of the page after that.<i>\n\n");
				else kGAMECLASS.output(" The position I applied for was a sort of “free samples” and they gave me some mods that let me... lactate alcohol and I started working in the lobby of the brewery itself. ");
				kGAMECLASS.output("It was fun for a while, because I wasn’t very good at, well, asking people for sex, but I got to have fun with plenty of people there!");
				kGAMECLASS.output("\n\nAfter a while though, I started to feel empty, if that makes sense. At the brewery every lover was just come-and-go, never to be seen again, no one to hold me afterwards, no one to talk to. It all started to make me feel uncomfortable after a while, so I put in for a transfer from my job out here, in the stockyard. I actually like it out here a lot; it’s nice and quiet, but all the time I feel like I need </i>someone<i>.");
				kGAMECLASS.output("\n\nThat’s why I’m writing this... and I hope this isn’t too personal or cheesy for you, but I feel like you’re that someone. Most people don’t really bother trying to talk to me or getting to know me... and believe me I’ve tried, but I don’t think anyone on this planet would bother to learn sign language or stop to read anything I might try to tell them through writing. You though, [pc.name], you keep coming to talk to me, and it makes me feel so good! You treat me so nice too... and I even feel comfortable mooing around you! What I’m trying to explain is that I like you, [pc.name], a lot.");
				kGAMECLASS.output("\n\nI just wanted to let you know how I feel, but I also wanted to know if you’d be okay with us being... you know, a couple.");
				kGAMECLASS.output("\n\nI hope this letter doesn’t weird you out or anything, but I really needed to get all this off my chest, and I’m really looking forward to seeing you again soon.");
				kGAMECLASS.output("\n\nLove,");
				kGAMECLASS.output("\n\tBrandy");
				
				kGAMECLASS.output("</i>");
				
				kGAMECLASS.output("\n\nLooking at those last couple sentences, you notice that “Love” has quite a few crossed out words next to it on the paper’s margins.");
				kGAMECLASS.output("\n\nWell, looks like Brandy has developed some feelings for you, and some quite serious feelings for a cowgirl at that.");
				
				if(!target.hasKeyItem("Brandy's Letter"))
				{
					kGAMECLASS.output("\n\n<b>You could probably go talk about this with Brandy, or just pretend like you never got her letter in the first place</b>.");
					target.createKeyItem("Brandy's Letter", 0, 0, 0, 0, "A red envelope containing a hand-written letter from Brandy.");
				}
			}
			//Not player!
			else
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " will not read the letter from Brandy.");
			}
			return false;
		}
		
	}

}