INCLUDE final_day.ink
INCLUDE day2.ink
INCLUDE variables.ink




-> day_1_intro

=== day_1_intro ===

    COMMENT: Open with YOU entering the facility, walking up to your spot on the conveyor. EDNA is in the spot next to you.
    
    TRIGGER_ASYNC: carol-goto-boss
    
    BOSS: Hey Carol, get over here.
    
    BOSS: New gal today is Edna. Less lazy than the last guy, I hope. Show her how everything works. 
    
    BOSS: Don’t mention the free session of phone counseling with a therapist that corporate made us start offering to employees. They're crazy to think that's a worthwhile investment. 
    
    *   [Tell her to work late] YOU: I'll tell her about the policy of keeping up with work email after hours too.
        
        BOSS: Now that's...
        
        BOSS: The Convei way.
        
        ~boss_opinion += 1
        ~labor_unrest -=1
    
    *   [I can't do that] YOU: I can't do that and you know it.

        BOSS: Whatever. You think 'cause you’ve been here 12 years you can talk to me however you want. Maybe Edna’ll be my new favorite.

        ~boss_opinion -= 1
    
    *   [OK] YOU: OK

        BOSS: Great. Knew I could count on you.

    -   BOSS: Anyway, should be an easy day. We're filling toothpaste. Big red cylinders full of toothpaste. Sigh. That’s all.

    TRIGGER_SYNC: carol-goto-conveyor

    -> edna_training

=== edna_training ===

    YOU: Hi, you're Edna?
    
    EDNA: Hello, yup, and you're Carol, according to your name tag.
    
    YOU: Good to meet you. Welcome to Convei. I've been here the longest, so looks like I'm training you.
    
    EDNA: Training? There's one button.
    
    YOU: That's true right now, but tasks change every day. I'll help you learn the ropes, but chances are you'll have to learn something new tomorrow. 
    
    EDNA: What are we doing today exactly?
    
    YOU: Metal tubes come down the conveyor, we push a button, and they fill with viscous red fluid. 
    
    YOU: They continue down the conveyor and into the chute at the end, ending up god knows where.
    
    YOU:  They're telling us it's toothpaste but I doubt it.
    
    EDNA: That sounds both boring and mysterious.
    
    YOU: It's just boring. Here, I'll show you.
    
    TRIGGER_SYNC: player-conveyor-demo-start
    
    -> edna_training.start_chatless_tutorial

    = start_chatless_tutorial
    
        YOU: When the tube arrives in this zone hold down the {center_btn} button, and let go when it gets to the second line. Like this.
        
        TRIGGER_ASYNC: player-conveyor-demo-fill
        
        EDNA: Then what?
        
        YOU: That's it.
        
        EDNA: Oh my god. I'm going to spend all day doing that.
        
        YOU: Yup. It's a little harder when you're trying to have a conversation at the same time. Since the work is so tedious, people here love to chat. 
        
        YOU: Make sure to keep working while you listen and decide what to say. If you're distracted you could easily say something rude.
    
        TRIGGER_ASYNC: cam-conveyors-tight
    
        YOU: Alright, it's about time to get started.
    
        TRIGGER_SYNC: start-day
    
        -> edna_training.after_chatless_tutorial
    
    = after_chatless_tutorial
    
        EDNA: I don't really want to talk. I have eight younger siblings at home. 3 brothers, 5 sisters. They talk constantly. I don't need any more. 
    
        *   [A lot of siblings] YOU: That's a lot of siblings. 
            
            EDNA: Yeah, I'm kind of forced to take care of them. I hate it.
            
            **  [Sucks being here] YOU: If it's got you working here, it must be pretty bad.
                
                EDNA: Can't argue with that.
                
                ~labor_unrest += 1
    
            **  [Try to get used to it] YOU: Well, try to get used to it anyway I guess.
                
                EDNA: This doesn't bode well.
    
            **  [Sucks for you] YOU: That sucks for you. I'm so glad I don't have to deal with that.
                
                EDNA: Yeah.
                
                ~edna_opinion -=1 
            
            --  EDNA: But no one will mind me being on the quiet side, right?
            
        *   [People might be offended.] YOU: People might be offended if you don't engage at all. 
            
            EDNA: I hope they can deal with it. I really need this job, but I'm just not a chatterbox.
    
        *   [Whatever works for you] YOU: Well, whatever works for you.
            
            EDNA: Do you think anyone will mind?
        
        -   -> conveyor_and_chat_tutorial

    = conveyor_and_chat_tutorial

        *   [I'll tell people to leave you alone.] YOU: I'll mention to everyone that you just like to keep to yourself.
            
            EDNA: Thanks!
            
            ~edna_opinion += 1
            ~avoid_edna = true
        
        *   [Maybe] YOU: Yeah, maybe. What do I know?
        
        *   [Got it.] YOU: Got it.

        -   EDNA: Oh also I've got to leave five minutes early to pick up my little brother Blendo. Is he going to be mad?
        
        YOU: That should be fine. Just go talk to Boss before the end of the day.
        
        *   [We get a counseling session] YOU: Convei, in its infinite generosity, will also give you one free phone counseling session with a therapist. You can talk about work.

            EDNA: Oh, I had no idea, thanks!
            
            ~edna_opinion += 1
            
            -> started

        *   [Good luck.] YOU: Good luck.
            
            -> started

        *   [Stay at the belt.] Make sure to stay at the belt at all times.
            
            ~boss_opinion +=1 
            ~labor_unrest -=1 
            
            EDNA: Damn, this place is strict. 

            SID: Don't forget to tell our new colleague about the free counseling session! 

            EDNA: We get what?
            
            **  [Not great benefit but sure] YOU: They make a huge deal about it, but it's single counseling session by phone. Go ahead and use it though. 
            
            **  [Don't use it] YOU: Well, technically, but they don't really like it when you use it. They get mad.
                
                EDNA: Wow, that's so stupid.
                
                ~edna_opinion -= 1
                ~labor_unrest -= 1
                ~boss_opinion += 1 
            
            **  [Yes! Can't believe that slipped my mind.] YOU: Yes! Can't believe that slipped my mind. We all get one phone call with a therapist.
            
            -   -> started

    = started

        EDNA: OK, well. Thanks. I guess I'll get started. 
        
        -> DONE
    
=== damien_day1 ===

    TRIGGER_ASYNC: damien-cam
    
    DAMIEN: You're training the new girl?
    
    YOU: Yeah, didn't take much.
    
    DAMIEN: What's she like?
    
    *   [Weird] YOU: Weird

        DAMIEN: Wow, very descriptive. Do you think she'll be my friend?
    
    *   [Nice but shy] YOU: Nice, but pretty shy. Don't worry if she doesn't talk too much.

        DAMIEN: Man, all there is to do here is talk. I've got an hour on the train to get home to my empty apartment. I wouldn't say a word for days if it wasn't for talking to you all. And talking to myself. Do you think she'll be my friend?
    
    *   [Don't know] YOU: I didn't get to know much about her.

        DAMIEN: I bet she wants to talk to me. I should talk to her.
        
    -
    
    *  [Don't think so] YOU: I really don't think so. She seems to have her own stuff going on.
        
        ~damien_opinion -=1 
        
        DAMIEN: If the boss didn't keep making us work late, maybe I could make some friends outside of work. Or get a date. According to my timeline, I'm supposed to be engaged next year to have three kids on schedule.
    
        ** [I can't have your kids] YOU: I'm too old to have your three kids Damien. Don't bother.
        
            DAMIEN: Ha ha, good one Carol. But seriously. If I don't meet anyone here, I'm not going to meet anyone anywhere. I'll take my chances.
            
            -> damien_goes_over
    
        ** [Get a hobby?] YOU: Have you tried getting a hobby?
            
            DAMIEN: I'm pretty much a legend on the pickup artist forums. My manifesto is the most popular one left online after the media blamed that terrorist attack on us. I wouldn't want to hang out with any of the freaks from there though.
            
            YOU: Damien, please leave Edna alone.
            
            DAMIEN: Fine, whatever.
            
            ~damien_opinion -=1 
            
            -> damien_desists
    
        ** [Leave her alone] YOU: If that's what you're thinking about, you should definitely leave her alone. 
            
            DAMIEN: You're right, folks can smell desperation. That's what they keep telling me when I try to start a conversation.
            
            -> damien_desists
    
    *  [Why not ask?] YOU: Why not ask?
        
        DAMIEN: You're right!
        
        ~damien_opinion += 1 
        
        -> damien_goes_over
    
    *  [Do whatever you want] YOU: Do whatever you want Damien.
        
        -> damien_goes_over

=== damien_goes_over ===
    
    COMMENT: Damien talks to Edna, and you see that they're conversing but not what they're saying.
    
    TRIGGER_SYNC: damien-goto-edna

    DAMIEN: ...
    
    EDNA: ...

    { avoid_edna: 
        
        EDNA: Carol, I thought you were going to tell people to leave me alone. 
        
        ~edna_opinion -= 1
    }
    
    DAMIEN: Great to meet you!

    EDNA: ...

    TRIGGER_SYNC: damien-walk-back

    -> DONE

=== damien_desists ===

    COMMENT:Damien does not speak to Edna.
    
    DAMIEN: Nobody gives me a chance...

    { avoid_edna: 
        
        EDNA: Thanks for helping give me some breathing space Carol.
        
        ~edna_opinion +=1  
    }

    TRIGGER_SYNC: cam-conveyors-tight

    -> DONE

=== helena_day_1 ===

    TRIGGER_ASYNC: cam-conveyors-tight
    
    HELENA: Hey
    
    YOU: Hi HELENA

    HELENA: So you're training the new girl?
    
    YOU: Yup.
    
    HELENA: What's she like?
    
    YOU: Uh, I don't know. Keeps to herself? Has a bunch of brothers and sisters?
    
    HELENA: But like, is she on our side?
    
    YOU: I really don't know what you mean.
    
    HELENA: Yes you do. Is she gonna suck up to the boss, or is she on our side?

    *   [Wants to keep her job] YOU: I think she wants to keep her job.
        
        HELENA: THIS job, THIS is the one you all want to keep at any cost?

    *   [Wants to kidnap BOSS] YOU: She wants us to join her in kidnapping him.
        
        HELENA: I'm in, no question.
        
        ~helena_opinion += 1 
        
        YOU: I'm kidding.
    
    *   [We all suck up to the boss] YOU: We've all got to suck up to the boss Helena, what else are we going to do?
        
        ~helena_opinion -= 1 
        ~labor_unrest -=1 
        
        HELENA: Speak for yourself, that's embarrassing. 
    
    -   YOU: She seems pleasant enough.
    
    HELENA: Well, we've got work to do with her. I want bathroom breaks. I try not to drink any water all day so I can wait until quitting time. 
    
    HELENA: That can't be healthy. Getting another ally would be a big deal.
    
    *   [Relax about breaks] Can you relax about breaks? It's the busy season. They can't afford to have us jumping off the line for something that can wait.
        
        HELENA: Oh, the busy season for shipping out scam cleaning products that are just water and blue food coloring. Can't disrupt that. My old office job didn't put nearly this much effort into convincing us we were doing valuable work.
        
        ~helena_opinion -=1
        ~labor_unrest -= 1
    
        YOU: If those things didn't sell, we'd be fucked.
        
        HELENA: Yeah, well we're pretty fucked now too.
    
    *   [Tell boss you're mad] The boss has no idea how pissed we are. You should tell him.
        
        HELENA: You're right. Watch this.
        

        ~helena_opinion +=1
        ~labor_unrest +=1
        ~boss_opinion -=1 

    *   [Get everyone on our side.] Can't run in all half-cocked.
        
        HELENA: You're right - as fun as it would be, yelling at the boss wouldn't do much right now.
        
        ~labor_unrest +=1 
    
    -   HELENA: OK, back to work. Recruiting people, that is.
    
    -> DONE

=== meet_stu ===

    TRIGGER_ASYNC: cam-conveyors-tight

    STU: Hey.

    YOU: What, you want to date the new girl too?

    STU: What?

    *   [Sorry] YOU: Sorry, I hate training people, kinda on edge.
    
        STU: Oh, I get it, don't worry. Glad we're getting some help with this "toothpaste" order though.
        
        **  [It smells evil] YOU: That stuff smells like it came straight out of hell. 
            
            STU: I bet it did. Or at least out of a butt.
            
            YOU: Speaking of which, I've had to go since the whistle blew. 
            
            STU: We go in our pants here. That's the Convei way. 
        
            -> meet_stu.bathroom

        **  [What do we make?] YOU: Edna asked about what we make. Felt kind of silly saying I have no idea.
        
            STU: Hey, unless knowing what we make comes with a raise, I don't really care. 

            YOU: Yeah, knowing too much could lead to a subpoena too, the way this place runs. 

            STU: Boss is always so twitchy and suspicious. The owners must have him on a short leash. Whoever they are.

            *** [No bathroom breaks sucks] YOU: I wonder which of them came up with this ridiculous "no bathroom break" policy.
                
                ~labor_unrest +=1 

                STU: Probably a joint effort, at the same meeting where they decided we don't need sick leave.

                YOU: Hopefully no one is eating this stuff right out of the tube after we cough in it.

                -> meet_stu.bathroom

            *** [Bond with Stu] YOU: Hey, we've both been here the longest of anyone. We'll probably outlast a dozen more bosses.

            STU: Now that's truly dark, Carol.

            YOU: Anyway, <> ->meet_stu.bathroom
            
            *** [Must be doing something right] YOU: Hey, the company seems successful, they must be doing something right.

                STU: Ew, come on Carol. 

                ~stu_opinion -=1 
                ~labor_unrest -=1 

                YOU: Anyway, <> -> meet_stu.bathroom

        **  [Love to fill tubes] YOU: Who doesn't love filling a tube with a strange substance?

            STU: We're living the dream here Carol. The wife and kids and I are going to Greece in a month though - I don't know how I'll deal with being away from the conveyor. 

            YOU: Are you allowed to use the bathroom in Greece?

            STU: Yeah, in that sense it might be nicer. But you have to ask in Greek. Here you don't need to ask at all, cause it's not happening anyway. 

            *** [We could change that] TODO: This had no text

            *** [If you like hearing "no"] YOU: Of course you can ask, if you like hearing the word "no."

            *** [I'd learn Greek] YOU: I'd learn Greek if that's what it took to step off the line for a second.

            --- -> meet_stu.bathroom

    *   [Everyone's fascinated with Edna] -> meet_stu.EDNA

    *   [You meet Edna?] YOU: You meet Edna? -> meet_stu.EDNA
    
    = EDNA 

        YOU: Everyone's fascinated with Edna, huh?
    
        STU: And what, you think I'm like Damien?
    
        *   [No, but...] YOU: No, but considering how boring it is here people can get obsessed with a fresh face. 
            
            ~stu_opinion +=1
            
            STU: Listen, I'm a happily married man. I just want to pack this battery acid crap into tubes so people can put it on their toast or whatever the hell happens after it leaves this place.
            
            YOU: Our customers disgust me, whoever they are.
            
            -> meet_stu.bathroom
        
        *   [He's persuasive] YOU: Well, apparently he has a large following online. 
        
            ~stu_opinion -=1

            STU: Yeah, and that is truly scary. You think he got me?
            
            **  [Never!] YOU: No way, you'd never go for that crap.
            
                ~stu_opinion +=1 
                
                STU: Thanks Carol. 
                
                YOU: Speaking of crap...
                
                -> meet_stu.bathroom
            
            **  [Fight for bathroom rights] -> meet_stu.bathroom
            
            **  [Got some on your shirt] YOU: You've got some on your shirt.
                
                STU: Oh, thanks for looking out!
                
                ~stu_opinion +=1 
                
                -> meet_stu.bye
            
            **  [Leave it alone]

                -> meet_stu.bye
        
        *   [He's not so bad] YOU: Damien isn't so bad. Kind of funny at least.

            ~stu_opinion -=1

            ~damien_opinion += 1

            STU: We have pretty different concepts of what's funny I suppose.

            ->meet_stu.bathroom

        *   [Never mind.] YOU: Never mind.

 
            ->meet_stu.bathroom
    
    = bathroom

        YOU: We COULD try standing up for our right to pee. 

        ~labor_unrest += 1

        STU: Sure, I bet the BOSS will find it funny at least.

        YOU: More likely he'll be pissed, but I don't really care.

        STU: Funny. But this is just a job. I keep myself good and dehydrated during the day, then I go home to my lovely wife and toilet and kids. 

        *   [Apathy is embarrassing] YOU: Stu, that kind of apathy is just embarrassing. 

            ~stu_opinion -=1
            ~labor_unrest+=1 

        *   [Can't let them walk over us] YOU: They're treating us like shit, Stu, and it's just cause they think they can get away with it.
            
            ~labor_unrest +=1
        
        *   [Fair enough.] YOU: Fair enough.
            
            ~labor_unrest -=1 
        
        -   -> meet_stu.bye
            
    = bye

        STU: Well, I'm getting a bit behind on my tubes here. Talk to you later Carol.
        
        -> DONE
    
=== edna_disappears ===

    TRIGGER_ASYNC: cam-edna-tight

    EDNA: So Carol ... you think I should just go ask him, now? 
    
    YOU: Yeah, just tell him you've gotta pick up your little brother early today. He has kids. He'll get it.

    TRIGGER_SYNC: edna-goto-boss

    -> DONE

=== day1_over ===

    TRIGGER_SYNC: day-end

    YOU: Edna hasn't left the BOSS's office yet.
    
    YOU: Edna's going to be really late to get her brother.
    
    *   [Wait for her] YOU: I'll wait around and make sure everything is ok.
        
        -> day1_over.wait
    
    *   [Ask tomorrow] YOU: I'll ask her what happened tomorrow.
        
        -> day1_over.leave
    
    *   [Whatever.] YOU: Whatever.
        
        -> day1_over.leave
    
    = wait

        YOU:  Where is she?



        TRIGGER_SYNC: wait-3

        YOU: Goddamnit, I can't stay here all night.

        -> day1_end

    = leave
    
        TRIGGER_SYNC: carol-leaves
        
        ->day1_end

==day1_end==

TRIGGER_SYNC: scene-end

-> END
