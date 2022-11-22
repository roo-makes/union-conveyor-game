
==final_day_intro==

YOU: It's been a tough couple of months.

{
        - labor_unrest > 7:
        HELENA: Sure has been. But at least we're standing up for ourselves now.

        YOU: Who would have thought that I could work here for over a decade with everything as shitty as it was? 

        HELENA: And now I couldn't imagine going back to having no bathroom breaks, no sick leave, and that ridiculous pace of work.

        YOU: I wish we figured out what happened to Edna though. If anything, the union only has me more suspicious about what kind of business this is, and what we're sending out into the world.
            

        - labor_unrest < -2:
        HELENA: Who would have thought things could get worse?
        
        YOU: I could have.
        
        HELENA: Yeah, me too. 
        
        YOU: But Boss was pissed at the open insubordination that happened that day, even if we never really got our shit together to stand up for ourselves.
        
             

        - else:
        HELENA: Things have gotten a bit better.
        
        YOU: Yeah, a bit.
        
        HELENA: I wish they were scared of us. But they're listening more, which is something too.
            
    }



->demon_arrives

COMMENT: This should begin immediately after intro dialog, before work starts.

==demon_arrives==

    BOSS: We have a very special visitor today. We don't get many representatives from the home office. Extraplanar individuals find it difficult to remain here. 
    
    BOSS: Meet Satin. I don't know what else to say.

    TRIGGER: SFX_scary_music

    SATIN: HEY! So what in the... HELL is going on here?

    BOSS: I tried to tell them, S. There's no way production will be enough if people are stealing our time to piss or only working when they're healthy.

    SATIN: These people would never survive a day in hell.

    BOSS: Don't I know it. I bet I'd do pretty well though.

    SATIN: Sure. Sure. 
    
    SATIN: Anyway, what am I doing? You do not simply stand and listen on my time. Start the conveyor. 
    
    TRIGGER_SYNC : conveyor-start
    
    SATIN: You're getting a REAL boss now.

    YOU: Who are you?
    
    SATIN: First - you are now equipped with a dropper spout, in the third region of your conveyor. 
    
    SATIN: Press {right_btn} twice to drop the... substance
    
    SATIN: into the tube. Make sure all tubes are sanitized, filled, and droppered. That's all. 
    
        * [This job isn't worth it.]
        
        YOU: I don't know what's going on here, but I'm not going to work for a damn monster, even if I need the money.
        SATIN: Stopping your work is not an option. I could kill you or something.
        
        * [What's in the tubes?]
        YOU: I'm sick of not having any idea what I'm doing. What are we filling and dropping here?
        SATIN: Hang on.
        
        * [...] YOU: ...
        - 

    SATIN: You don't know anything about me, do you? I own this place. I'm from hell. 

    STU: You own stuff in hell?

    SATIN: Please, private ownership is of course the ultimate organizing principle in hell. Strict anarcho-capitalism. Take and own what you can, and destroy whoever you can to get it.
    
    DAMIEN: I read online that that would result in maximum freedom and equitable distribution of resources.
    
    SATIN: Ha ha, I like you.
    
    YOU: Are you like, the prince of darkness?
    
    SATIN: No, but I have a VERY important role running recreational product supply chains for the entire sub-region.
    
    STU: You're middle management?
    
    SATIN: No! 
    
    BOSS: I thought I was middle management.
    
    SATIN: You wish.

    SATIN: See, the army of cute little devils and goblins and other assorted minions that enforce our property rights need their hell juice. It makes them happy. You here make it for me. It's simple.
    
    SATIN: And with these new drops of concentrated hellish protein powder, our little devils will be stronger than they've ever been.
    
    SATIN: I heard from my boss -
    
    SATIN: - from my colleague this is the final step before we have enough power to unleash our minions on the world of the living.
    
    SATIN: And with my factory making the essential hell juice, I'm in a great position to get a sweet spot on the invasion's hellish longitudinal planning commission.

    STU: I knew that stuff wasn't toothpaste.

    DAMIEN: Yeah, that time I took a bottle off the line, it melted my toothbrush before I could get in my mouth. And I tried a bunch of times.

    SATIN: Theft off the line? Boss is gonna pay for running such a sloppy shop. My cutest, tiniest little red guy will eat you bit by bit over the next thousand years. 
    
    SATIN: And if I wasn't clear, it'll be very painful.

    HELENA: Is that what goes on in hell?

    SATIN: Sometimes.

    * [So what do you want?] YOU: So what do you want from us then?
    
    SATIN: I want you to be good workers. The same thing Boss has been trying and failing to turn you into. 
    
    { 
    -low_unrest == true: SATIN: I heard about your pathetic attempt to stand up for yourselves. Half-baked, like your work.
    
    -med_unrest == true: SATIN: You really thought you were making progress with that little disruption, didn't you?
    SATIN: Boss might have backed off, but he's not a demon from hell.
    
    -high_unrest == true: SATIN: You've caused enough trouble here for some of the big guys downstairs to take notice. 
    SATIN: Fortunately, the problems are over now that I'm here. 
    }
    SATIN: And lucky you - it won't be possible to open a new portal to hell for some time, so you're stuck with me for a while.
    
    HELENA: How long is that?
    
    SATIN: 500 years, give or take a few. So probably most of your lifetime. 
    
    STU: Probably.
    
    SATIN: And since they can't send anyone after me until then, I'll be making sure everything is done exactly to the proper specifications. 
    

    * [Why tell us this?] YOU: Why are you explaining all of this to us?
    SATIN: It's for entertainment, mostly. There's a part of me that hopes you'll understand how futile it is to keep causing trouble once you understand this isn't some two-bit mean boss situation, but I'm not holding my breath. 
    
    * [What happened to Edna?] YOU: So do you know what happened to Edna when she mysteriously disappeared last month? Nobody has heard from her since.
    SATIN: Ah, you swapped someone recently?
    BOSS: Uh... yes.
    SATIN: The top minds in hell have been working on applying our dark magics to labor discipline. It's possible to extract the compliant part of someone's personality and stick it in a new vessel. We haven't figured out how to grow humans very quickly though, so all our vessels are small version humans, whatever you call them.
    BOSS: Children.
    SATIN: Yes, exactly.
    PATRICIA: Thanks for creating me and making me so obedient!
    SATIN: You're very welcome, child. 
    ~knows_about_edna=true
    
    * [Got it, boring] YOU: As long as I get my paycheck and the job doesn't get worse, I don't really care about the whole backstory.
    SATIN: Fortunately, things will be getting much worse for you. Enjoy.
    
    - -> edna_returns
    
==edna_returns==

TRIGGER_SYNC: edna-flash

EDNA: I'm still here ... kinda.

    * [You're back!] YOU: I haven't seen you for a month - where have you been?
    *[Thanks for shutting down the belt] YOU: Thanks for shutting down production last month. That made a huge difference when we confronted Boss.
    EDNA: You're welcome. Ready for more?
    YOU: Uh, I think so. Maybe?
    EDNA: They took part of me out of myself, and put it in that terrifying child. But what's left is angrier. I'll destroy them.
    *[Causing more trouble?] YOU: I don't know if this is a great time. That demon is going to kill us if we mess with production again.
    EDNA: I'm sorry, but that's not my biggest concern right now. They took part of me from myself, and put it in that terrifying child. And I think I can do something about it.
    {knows_about_edna:
    * [I thought you're Patricia] YOU: The demon just said that you were like, implanted into Patricia? Or part of you was?
    EDNA: It's true. Some of myself was taken, and it's in her now. But what's left of me is angrier. I want to destroy these evil beings for what they've done to me, and all of us. -> continue
    }
    - ->continue
    =continue 
    YOU: I get the sentiment, but these are violent supernatural beings.
    EDNA: Don't worry, you'll look like you're complying with everything they ask for. 
    EDNA: I have some kind of connection to the machinery as a result of this soul removal. I can change what's in the dropper at the end of the conveyor.
    EDNA: I've already started filling it with pure liquid solidarity, the substance that's most corrosive to evil devil tyrants. 
    EDNA: When they drink what they think is demon juice, they'll be killed. Or whatever equivalent to dying exists in hell. 
    YOU: And they're not going to get mad and ... hurt us?
    EDNA: I sure hope not!
    YOU: That is't comforting.
    EDNA: No, the effect should be immediate upon consumption. But the shipment will be well on its way towards hell by the time Satin here takes a sip. 
    YOU: Ok, guess I have no choice but to believe you there.
    

->DONE
