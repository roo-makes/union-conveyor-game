
==final_day_intro==

YOU: It's been a tough couple of months.

{
        - labor_unrest > 12:
        HELENA: Sure has been. But at least we're standing up for ourselves now.

        YOU: Who would have thought that I could work here for over a decade with everything as shitty as it was? 

        HELENA: And now I couldn't imagine going back to having no bathroom breaks, no sick leave, and that ridiculous pace of work.

        YOU: I wish we figured out what happened to Edna though. If anything, improving the working conditions has me more suspicious about what kind of business this is, and what we're sending out into the world.
            

        - labor_unrest < 3:
        HELENA: Who would have thought things could get worse?
        
        YOU: I could have.
        
        HELENA: Yeah, me too. 
        
             

        - else:
        HELENA: Things have gotten a bit better.
        
        YOU: Yeah, a bit.
        
        HELENA: I wish they were scared of us. But they're listening more, which is something too.
            
    }



->demon_arrives

COMMENT: This should begin immediately after intro dialog, before work starts.

==demon_arrives==

    TRIGGER: SFX_scary_music

    SATIN: HEY! So what in the... HELL is going on here?

    BOSS: I tried to tell them, D. There's no way the... production will be enough if people are using our time to piss or only working when they're healthy.

    SATIN: These people would never survive a day in hell.

    BOSS: Don't I know it. I bet I'd do pretty well though.

    SATIN: Sure. Sure. Anyway. You're getting a REAL boss now.

    YOU: Who are you?

    SATIN: They don't know about me, huh? I own this place. I'm from hell. 

    STU: You own stuff in hell?

    SATIN: Please, you couldn't guess that private ownership would be the ultimate organizing principle in hell? We're strictly anarcho-capitalists. Take and own what you can, and destroy whoever you can to get it.

    SATIN: The army of cute little devils and goblins and other assorted minions that enforce my property rights need their hell juice. It makes them happy. You here make it for me. It's simple.

    STU: I knew that stuff wasn't toothpaste.

    DAMIEN: Yeah, that time I took a bottle off the line, it melted my toothbrush before I could even brush with it.

    SATIN: Theft off the line? Boss is gonna pay for running such a sloppy shop. My cutest, tiniest little red guy will eat you bit by bit over the next thousand years. And this might not have been clear, but it'll be very painful.

    HELENA: Is that what goes on in hell?

    SATIN: Sometimes.

    * [So what do you want?] YOU: So what do you want from us then?
    
    SATIN: I want you to be good workers. The same thing Boss has been trying and failing to turn you into. You'll find I'm a more effective leader though.


->DONE
