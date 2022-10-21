=== day2_boss_announce ===

    BOSS: Unfortunately, Edna didn't end up being a great fit. We're a family here, and like many families, we've had to make the difficult decision to cut ties with a poorly-performing relative who does not help us meet our objectives at this time.

    BOSS: In one sense, I owe you an apology. 
    
    BOSS: I hired a loser. I've exhibited that tendency in the past, and in many cases we're still living with the effects of those mistakes. 
    
    BOSS: This doesn't entirely absolve me of blame, but to be fair to myself I should note that many of our applicants are among the most worthless our society has to offer.

    BOSS: In any case, you won't have to pay the price for Edna's inadequacy and pick up her slack today. I've brought in Patricia, my neice, to help out. Everyone, welcome Patricia.

    TRIGGER_SYNC: patricia-enter

    BOSS: Also, I have some good news! Due to a large number of complaints, we will now be sanitizing the bottles before filling. 

    BOSS: First, press and hold {left_btn} to charge the sanitizer. Then, when bottles are in the first zone on your left, press {left_btn} again to sanitize all of the ones in that zone.

    BOSS: You'll figure it out.

    -> day2_helena

=== day2_helena ===

    TRIGGER_SYNC: start-day

    TRIGGER_ASYNC: cam-conveyors-tight

    HELENA: What the fuck. One day? 
    
    YOU: I know, and I'm not even sure what happened. She was supposed to be getting out early to pick up her brother. And then she just... stayed in the boss's office?
    
    HELENA: I feel like this is worse than a firing. I wouldn't put any depraved shit past the boss. Damn it, we didn't even get her number yesterday.

    *   [Go ask] YOU: Why don't you go ask? Say she left something with you and you need to get in touch with her.

        HELENA: You're right. We can at least get her side of it.
        
        
        TRIGGER_ASYNC: helena-goto-boss
        
        HELENA: ........
        BOSS: .......
        

        HELENA: He said we can't contact her but he'll pass on any of her stuff "if that's even possible down there." Now I'm worried..

        ~helena_opinion +=1 
        ~labor_unrest +=1 

        -> organize

    *   [Sad for her family] YOU: All those siblings she was supporting. If something happened to her, they're pretty screwed.

        HELENA: Yup, and he just calls her a loser.

        -> organize

    *   [Let's stay out of it] YOU: Seems like scary stuff. We'd better stay out of it.

        ~helena_opinion -=1

        HELENA: Ugh, why do I bother bringing real issues up with you?

        -> DONE
    
    = organize
    
        *   [Everyone is mad] YOU: We can't be the only ones who are pissed about this.

            HELENA: You're right. You talk to Stu today. I'll see what Sid thinks. We'll report back.

            ~helena_opinion +=1 

            *[Have you organized people before?] YOU: Did you ever get people to work together at your old office job?

            ~helena_opinion += 1 

            HELENA: Well, we never got as far as forming ...

            HELENA: ...
            
            HELENA: a union or anything. 

            HELENA: But we did get everyone to demand a pay increase. Which also put a target on my back. But still, I think we can accomplish something here. You talk to Stu and I'll see if we can get Sid motivated.

        *   [You're friendly with Boss, right?] YOU: You're kinda friendly with the boss, right? Can't you convince him to treat us better?

            ~helena_opinion -=1 

            HELENA: What?? Are you TRYING to insult me? Pretty sure that guy hates me.

            YOU: I don't know, all the one-on-one conversations? Heated back-and-forths? Thought you had the inside track.

            HELENA: Yeah, I've got a talent for pissing him off, I guess. How have I not been fired if Edna got canned for nothing?

            YOU: Guess it's easier when someone's brand new.

    -   HELENA: Alright, good luck on spreading the word. 
    
    -> DONE
    
===sid_stoppage===

    SID: In all my years here, I've never seen someone get fired that fast.

    YOU: There was Lenore back when... seven or eight years ago?

    SID: That's about right. But she lasted a whole week.

        * [And she stole, which was cool] YOU: She was stealing money out of Boss's desk too. Which was cool and all, but it wasn't surprising when she got canned.
        ~labor_unrest +=1 
    
        SID: True. Actually, that's right around when they were upgrading the belts and I found out something cool.
    
        * [And she stole] YOU: She was stealing money out of Boss's desk too. So it wasn't much of a surprise she got canned. 
    
        SID: True. Actually, that's right around when they were upgrading the belts and I found out something cool.
    
        * [Gotta lose the losers] YOU: Like the boss said, some people are just losers and you've got to get rid of them.
    
        ~labor_unrest -=1 
        ~sid_opinion -=1
    
        SID: Uh, you ok Carol? Sounds like Boss temporarily took over your body there. Wait a sec, I've got something to show you that'll get you thinking rationally again.
    
- 
    YOU: Oh yeah, what's that?
    
    SID: So during the old belt upgrade, the installers included a kill switch that's hidden away in some obscure panel. They told me about it, but I never ended up sharing that information with anyone. 
    
    YOU: Wow, so Boss doesn't know?
    
    SID: He certainly does not. I figure if he's going to jerk us around and flex his power, we'd better take some control of our own. Time for a little shutdown.
    
        * [Do it!] YOU: Do it!
        ~sid_opinion += 1 
        ~labor_unrest += 1 
    
        * [Wait, be careful] YOU: Hang on - is he going to know you shut it down? We don't need another firing here.
        ~sid_opinion += 1 
        SID: Nah, he really has no idea. I'll be a hero for fixing it.
    
        *[Don't do it] YOU: Stop! Boss said it's really bad if we don't meet our red goop quotas.
        ~sid_opinion -= 1 
        ~labor_unrest -= 1 
        SID: Carol, it's always been pretty depressing for both of us to work here this long, but only now am I really worried about you. 
- -> shutdown
    
=shutdown
    TRIGGER_SYNC: sid-shutdown

    SID: There we go. 

    TRIGGER_SYNC : boss_goto_door
    
    BOSS: WHAT THE HELL
    
    SID: Boss, the stipulator is down again! Don't worry, I'm on it.
    
    BOSS: Well hurry up!
    
    STU: Heh heh.
    
    HELENA: Sid's a man after my own heart.
    
    DAMIEN: Damn stipulator! We've got to get it fixed.
    
    PATRICIA: It's OK everyone, we can wipe the tubes with our shirts to sanitize, fill them manually, and carry them to the chute at the end!
    
    SID: Uh, I've almost got it fixed Patricia. Don't worry about it.
    
    TRIGGER_SYNC: helena-pause-end
    
    HELENA: Wow, that took some work for Sid to fix. Where'd you get these shitty parts, Boss?
    
    BOSS: Shut up. I've gotta make some calls. Don't let it happen again!
    TRIGGER_SYNC : boss_goto_office
    
    *[Sid did it.] 
    TRIGGER_SYNC: carol-goto-boss
    YOU: Boss, Sid was the one who shut down the belt. It was no accident. 
    BOSS: That bastard. Thanks Carol, I knew I could count on you.
    TRIGGER_SYNC: carol-goto-conveyor
    ~labor_unrest -= 3 
    ~rat_sid = true
    
    *[These things happen]
    YOU: These things happen when you have crappy old machinery. We can't really do anything about it.
    
    *[Say nothing] YOU: ...
    -
    ->DONE


==patricia_convo==

PATRICIA: That was really scawwy. 

YOU: Don't worry, the belt isn't going to hurt you. It took a few severed fingers, but they did eventually fix that last year.

PATRICIA: What? I'm not worried about me. But all that lost pwofit. The poor Boss. The shareholders. 

YOU: We have shareholders?

PATRICIA: It's an expwession. 

    * [I don't care] YOU: I'm sure these shareholders, if they do exist, will be fine. 
    PATRICIA: We'll agwee to disagwee then. 
    YOU: Agreed.
    
    * [I liked it] YOU: I thought it was pretty neat stepping away from the tubes, even if just for a minute.
    PATRICIA: That's a tewwible attitude. Do you know how to register a complaint about another employee to Boss?
    YOU: Uh, no. 
    
    * [I agree] YOU: Seriously, all I could think of were our disappointed customers.
    PATRICIA: Oh, I don't really care about them. In fact I've been thinking we should raise prices to get Boss a nice bonus this year.
    YOU: Oh, gotcha.
    
    - PATRICIA: The demons and devils took on a majow wisk getting this place up and running. And the workers are so unruly they had to summon me to blend with one of them to keep production from falling behind.
    PATRICIA: I've been sleeping for a thousand years. It's not easy to blend with a mortal when -
    
    BOSS: PATRICIA!! Stop talking right now! Uh, back to work!
    
    PATRICIA: But I've been working?
    
    BOSS: QUIET!

->DONE

=== damien_day2 ===

    TRIGGER_ASYNC: cam-damien

    DAMIEN: I can't believe it. I blew it.

    *   [What? About Edna?] YOU: What? The belt stopping went off without a hitch. Is this about Edna?

        DAMIEN: Yes! I fucked up. And now she's gone. Wait, what about the belt?

        YOU: Nothing. What are you worried about, Damien?

        DAMIEN: That I'm going to be alone forever!

    *   [What'd you do this time?] YOU: What did you do this time?

        DAMIEN: I missed my shot. As always.

    *   [Our work doesn't matter] YOU: Nobody cares if a couple baby formula bottles go out unsanitized, Damien.

        DAMIEN: What? Oh, I know. No one cares. It's about Edna.

        YOU: You know what happened to her?

        DAMIEN: Well I know what didn't happen. I didn't get her number, and now she's gone.

    -

    *   [This is about a date??] YOU: This is some bullshit about getting a date?
        
        DAMIEN: It's about NOT getting a date, Carol!  If it was about getting a date I would have brought cupcakes in.

    *   [Sure must be hard] YOU: I understand it must be... difficult for you. To have a woman pass through your life... without dating you.
        
        ~damien_opinion +=1
        
        DAMIEN: Sometimes I feel like you're the only one here who gets me, Carol..
        
    *   [She didn't like you] YOU: Damien. She didn't like you. At all, as far as I could tell.
        
        ~damien_opinion -=1 
        
        DAMIEN: Well that's just mean! She hardly knew me. 
    
    -
    
    *   [You'll find someone] YOU: I know you're lonely Damien, but you'll find someone who actually likes you. You're a catch, kind of.
    
    DAMIEN: If you keep joking about that, I'm going to start thinking you really do like me!

    *   [Boss wronged you] YOU: I can't believe the Boss would do that to you. He saw you liked Edna. He probably got rid of her to spite you.

        ~damien_opinion +=1 
        ~labor_unrest +=1

        DAMIEN: Wow, that's messed up. But I see it!

    *   [Probably for the best] YOU: Your desperation might make you think otherwise, but talking to her more would have made her like you less.
        

    
        ~damien_opinion -= 1
        
    -   


    YOU: Let's move on from your delusional fantasies though. Everyone's talking about how we don't get bathroom breaks.
    
    DAMIEN: Oh, yeah, that's not fair and all. 


    *   [We're fired up!] YOU: Yeah, we're fired up about it! I think we're going to confront the boss soon!

        DAMIEN: Ah, yeah. That's cool. Do you think Edna got fired because of... bathroom break?

        YOU: Let's talk about this another time, Damien.

    *   [It'd help your looks] YOU: I know, it's hard to stay hydrated and maintain our youthful good looks when we don't get to pee all day.
        
        ~labor_unrest += 1 

        DAMIEN: Wait, how do I stay hydrated and look good?

        YOU: You drink water.

        DAMIEN. I drink... water. And then I have to pee.

        YOU: Yes, but we're not allowed to pee. 

        DAMIEN: I know! Sometimes it makes me feel like I'm going to pee my pants. But I haven't.

        YOU: Well, you shouldn't have to worry about that, any more than the normal amount anyway.
        
    * [Maybe it's fine actually] YOU: Actually, the boss should be able to do basically whatever he wants, so it's fine.
    ~labor_unrest -=1 
    
    DAMIEN: Weird, that contradicts what you were just saying. But you're smart, so I'll basically believe what you say.
    YOU: That means a lot Damien..
        
        -

        DAMIEN: Our chats always put me in a thoughtful mood. Thanks Carol.

        TRIGGER_SYNC: cam-zoomed-out
    
    -   -> DONE

=== day2_stu ===

    TRIGGER_SYNC: cam-stu

    YOU: ...Stu?

    *   [Hey Stu] YOU: Hey there, Stu.

        STU: Hey Carol. Weird day today.

        YOU: Seriously.

        -> day2_stu.edna

    *   [Shame about Edna] YOU: Such a shame what happened to Edna, huh?
        
        STU: Yeah, here one day, gone the next? Apparently because she was a "loser"?
        
        -> day2_stu.edna
    
    *   [Stand and fight!] YOU: It's time to stand up and fight, Stu!
        
        ~stu_opinion -=1
        
        STU: What? I don't want to fight anyone.
        
        **  [Smell the injustice!] YOU: Injustice is all around us! Can't you smell it?
            
            ~stu_opinion -=1 
        
            STU: Oh, you're talking about Edna? Yeah, that was wrong. 
        
            -> day2_stu.edna
        
        **  [After what they did to Edna?] YOU: But after what they did to Edna?
            
            STU: Oh yeah, that wasn't fair. I don't even really get what happened.
            
            -> day2_stu.edna
        
        **  [We're already suffering] YOU: And they're pulling this crap when we're already suffering from the lack of bathroom breaks, not to mention the workload.
        
            STU: It's true, we've got a lot to be mad about.
            ~labor_unrest +=1 
            
            *** [They keep piling it on] YOU: They keep piling it on, and we've been so understanding so far.
                
                ~stu_opinion +=1                
                ~labor_unrest +=1 
            
            *** [Sure.] YOU: Sure.
                
                STU: Uh, ok.
            
            *** [They treat us well actually] YOU: Eh, actually, I think they treat us pretty well.
    
                STU: Oh? Well, I guess I can see it that way.
    
                ~labor_unrest -=1 
            
            --- -> day2_stu.edna
    = edna
 
        *   [What do you make of Edna situation?] YOU: What do you make of all this with Edna?

            STU: I don't know - it's scary to be reminded that they could just get rid of any of us at any time. I'm not trying to cause any trouble. But Edna didn't seem to be doing anything wrong. 
 
            YOU: I know, we're always vulnerable, even when it doesn't seem like it. 
 
            ~labor_unrest +=1 
 
            STU: That's a dark thought. But it's true I guess. I've seen it first hand, had some terrible bosses.
 
            -> day2_stu.bad_bosses
            
        *   [I trained her, she's great] YOU: I trained Edna. She seemed great.

            STU: I didn't get to talk to her, but I can't imagine what would have justified disappearing her like that. That's probably what it looked like when they fired me at my old job.

            ~stu_opinion +=1
            
            -> day2_stu.bad_bosses
        
        *   [I'd keep quiet if they were fair] YOU: Yeah, I'd be perfectly happy to keep quiet if they were treating everyone fairly. But I feel like we have to stand up for ourselves or they'll walk all over us.
            
            ~stu_opinion +=1
            ~labor_unrest +=1 
        
            STU: That's what I'm thinking. I wish the boss was like, nice, and we could count him as a friend. But I don't trust him. I've had some bad bosses before.
        
            -> day2_stu.bad_bosses
        
        *   [Get those bastards] YOU: We're gonna get those bastards for what they did to Edna.
            
            ~stu_opinion -=1 

            STU: Like, firing her? What did they do exactly?

            YOU: Well, we don't know. But it doesn't look good.

            STU: Oh, yeah. Well, that's true. But I thought you like, knew something.

            **  [It was obviously unjust] YOU: I do know she was asking for a perfectly reasonable accommodation. That she needed this job and wouldn't have quit. And so clearly they fucked her over somehow.
           
            **  [Yeah, not really.] YOU: Yeah, not really.
            
            **  [Ground her up for dog food] YOU: They ground her up for dog food, for all we know!
                
                ~stu_opinion -=1
                
                STU: Huh, you're really fired up about this, aren't you? I hope that's not what happened.

            --  ->day2_stu.end

    = end 

        STU: Alright, I'll talk to you later Carol.

        TRIGGER_SYNC: cam-conveyors-tight

        -> DONE
    
    = bad_bosses


        *   [What happened?] YOU: What happened with you?
        ~stu_opinion +=1
            
            STU: This one guy had it out for me cause I'm really into clothes. He must have thought I was mocking his style, but it's just something I like. 
            
            STU: I mean, if I started judging everyone based on my standards, no one would look great. 
            
            **  [You dress great!] YOU: I've always noticed that you're a snappy dresser Stu, can't believe someone would be pissed about that.
                
                STU: Well thanks, that's nice. 
                
                ~stu_opinion +=1 
                
                ->day2_stu.end
                
            **  [Did you get fired?] YOU: Did you lose the job?
                
                STU: Yeah, he said it was for performance, but I knew that was crap. I did a great job.
                
                YOU: I'm sorry to hear that Stu.
                
                ~stu_opinion +=1 
                
                ->day2_stu.end
                

                
                //  ***[Won't tolerate a tyrant] YOU: Yeah, we have to show him that we won't tolerate a tyrant.
                //  ~labor_unrest +=1
                    
            **  [You don't dress well] YOU: You think you dress well? That's news to me.
                
                STU: Jeez Carol. That's harsh.
                ~stu_opinion -= 1
                
            --
        * [Too bad. Anyway.] YOU: Sorry to hear that. Anyway, I'd better get back to it.
        
        *[Probably your fault] YOU: Most of the time when people get fired it's their own fault. 
        ~stu_opinion -=1 
        ~labor_unrest -=1 
        STU: Uh, ok. Not in this case.
        YOU: Whatever.
        -
            -> day2_stu.end

=== mysterious_whisper_day2 ===

    TRIGGER_SYNC: edna-flash

    EDNA: Carol...

    TRIGGER_SYNC: edna-pause

    EDNA: Carol.................................................

    TRIGGER_SYNC: edna-pause

    EDNA: They're deschhhhhh... I can't cut through

    TRIGGER_SYNC: edna-pause

    EDNA: I'm ooooooshhh here but shhhhhsss help you.

    YOU: Does anybody else see this?

    EDNA: Patricia ssshhhhhssefff but my sseefffsfs inside her

    EDNA: eeerrrrrraeawwwww not to be trusted.

    TRIGGER_SYNC: edna-flash-end

    -> DONE

=== damien_day2_convo2 ===

    TRIGGER_ASYNC: cam-damien
    
    DAMIEN: Now I've gotta talk to Patricia.
    
    YOU: Damien. I don't know how this can be true if she's working in this facility, but I think she's like 10? Also kind of scary.
    
    DAMIEN: Disgusting Carol, it's not like that. I just haven't met anyone new today.
    
    YOU: What?
    
    DAMIEN: Usually I go out for a walk before work to talk to a stranger and meet someone new. But I've been so tired all the time since I stopped drinking water to avoid peeing at work.
    
    DAMIEN: Meeting people is part of my "one-a-day" philosophy. 

    *   [What's that?] YOU: What's that?

        DAMIEN: You know how everything is good for you in moderation? What's more moderate than once a day? It applies to anything. In this case, I gotta meet one new person a day.

        YOU: So you eat once a day?

        DAMIEN: No, I eat breakfast once a day, and lunch once. And so on.

        YOU: Seems like cheating to me.

    *   [Enough with the philosophies] YOU: Enough with the philosophies from you.

        DAMIEN: It's good to have a code, so it's even better to have a bunch of them.

    *   [You do EVERYTHING once a day?] YOU: You do EVERYTHING once a day? So you have to jack off once a day?

        DAMIEN: Ew Carol, it's not one of those masturbation philosophies! I just do it once a day sometimes and abstain once a day other times.

        ~damien_opinion -=1 

    -

    YOU: You don't seem to mind the new work station.
    
    DAMIEN: Oh, I figure if we weren't doing it before, no one will notice the ones I miss now.

    TRIGGER_SYNC: cam-conveyors-tight

    -> DONE

=== complain_day2 ===

    HELENA: Can't believe this place thinks they can fire people AND not let us have bathroom breaks. Why do any of us work here?
    
    DAMIEN: I'm so lonely, and it's all the BOSS's fault.
    
    STU: I bet I'm next. I'm always the target.

    *   [Gotta confront the boss] YOU: We've gotta talk to the boss, like right now. 
        
        -> carol_confronts
    
    *   [Just keep quiet.] YOU: Just keep quiet about it for now everyone. Our time will come... eventually.
    
        -> helena_confronts
    
    *   [This sucks] YOU: I didn't realize this job could get more depressing.
    
        -> helena_confronts
    
    = helena_confronts

        TRIGGER_SYNC: helena-confront-boss

        HELENA: Boss! We've gotta talk.

        TRIGGER_SYNC: boss-goto-door

        BOSS: Oh yeah? What about?

        HELENA: Things have been shitty here for a while, but firing Edna after one day was the last straw.

        -> stage1

        ->DONE
    
    = carol_confronts

        TRIGGER_SYNC: carol-confront-boss
    
        YOU: Boss! We've gotta talk.
    
        TRIGGER_SYNC: boss-goto-door
    
        BOSS: Yeah?

        -> stage1

    = stage1

        TRIGGER_SYNC: edna-flash

        EDNA: ... gotta help show they mean business

        EDNA:  ... think I can shut the conveyor down

        TRIGGER_SYNC: edna-pause

        EDNA: ... then he'll have no choice but to listen

        TRIGGER_SYNC: edna-shutdown

        TRIGGER_SYNC: edna-flash-end

        BOSS: What the hell? What's going on out here??

        PATRICIA: Come on, let's get this conveyor moving again everyone! We can figure it out.

        STU: I'm not a mechanic.

        SID: I know I don't complain much, but things are getting pretty bad here.
        


        *   [We're pissed] YOU: We're pretty pissed off. You got rid of Edna after one day. You have us doing this new sanitization thing for the same pay. We still don't have bathroom breaks.
            
            SID: I do like going to the bathroom.
            
            ~labor_unrest += 3

            BOSS: Yes, those are all within the realm of business decisions. My job. Sanitizing and filling tubes? Your job.
    
            { stu_opinion > 3:
                
                STU: This is serious. Don't blow us off.
    

                ~labor_unrest +=1
        
            - else:

                STU: Whatever, he's never going to take us seriously. 
    

                ~labor_unrest -=1
            }

        *   [Things could improve somewhat] YOU: We've noticed that there are few areas with room for improvement.

            ~labor_unrest += 1

            BOSS: Very interesting, I'm sure. I'll pass it to upper management. Is that it?

            YOU: I haven't told you what's this is about yet.

            BOSS: Sure, sure. Just write it down and hand it over before you leave.

            { stu_opinion > 3 :

                STU: This is serious. Don't blow us off.

                ~labor_unrest +=1
                
            - else:

                STU: Whatever, let's just write it out Carol. 

                ~labor_unrest -=1
            }
        *   [Let's take a step back] YOU: Wait wait wait, we're getting a little heated here. Let's take a step back and leave Boss alone.

            ~labor_unrest -= 1

            BOSS: Finally someone's talking sense.

            HELENA: Carol, seriously?

            { labor_unrest > 12 :

                STU: We can't back down now!

                ~labor_unrest +=1
                
            - else:

                STU: Carol's probably right. I'm getting nervouse. 

                ~labor_unrest -=1
            }
        -   -> stage2

    = stage2

        *   [Bathroom breaks are a right] YOU: Bathroom breaks are a human right. You can't keep us at these belts all day.

            ~labor_unrest +=1
            
            DAMIEN: Seriously, I heard dehydration is bad.

        *   [The pace is too fast] YOU: These belts move too fast. We can hardly keep up.
            
            ~labor_unrest +=1 

            SID: Yeah, I'm constantly falling behind now.

        *   [Never mind] YOU: Never mind.
        
            ~labor_unrest-=1 

        -

        { helena_opinion > 5 :

            HELENA: I'm not gonna stand for it either.
        
            ~labor_unrest +=1
        
        - else:

            HELENA: Maybe there's no hope for this shitty place.
    
            ~labor_unrest -=1
        }
        
        -> stage3

    = stage3

        YOU: See, it's not just me who's fed up.
        
        PATRICIA: Some of us are very happy though!

        *   [Could fire us at any moment] YOU: After what happened to Edna, how can any of us feel secure in our jobs?

            BOSS: Listen, personnel decisions are for me to make. You don't need to know where Edna went, or why. Just believe me that if you keep doing a good job, or start doing a good job, you'll be fine.
        
            ~labor_unrest +=1
    
        *   [And what goes on here anyway] YOU: And then we don't even get to know what we're doing here. Is making toothpaste a matter of national security or something?

            BOSS: Carol, you've been here for over a decade now, and now you've got a problem?

            YOU: Yeah, my curiosity has grown.

            BOSS: Once again, you're getting into things that have nothing to do with you, and that you'll deeply regret speaking of ever again.

            ~labor_unrest += 1

            -> stage4
    
        *   [Let's just get new jobs] YOU: Whatever, we might as well just move on to new jobs.
            
            BOSS: Great, I hope you feel better. I'll see you back here tommorrow. And the next day.

            ~labor_unrest -= 1
    
        -
        
        { damien_opinion > 5 :
            
            DAMIEN: I'm sick of this too. CAROL said not being able to pee is bad for my skin.
        
            ~labor_unrest += 1
        
        - else:

            DAMIEN: OK, calm down Carol, you've said your piece.

            ~labor_unrest -= 1 
        }
        
        -> stage4

    = stage4
    
        {
            - labor_unrest > 12: HELENA: You're going to listen to us, or we're going to walk off. You may not be afraid of us, but you're afraid of what your bosses will say if production shuts down.

            - labor_unrest < 3: HELENA: I know there's no chance you'll listen to us, so why don't we quit pretending here? 

            - else: HELENA: You have to listen to us. Your tubes don't get filled with red goop without us. 
        }
  
        {
            - labor_unrest > 12: SID: It's about time we start working together. Boss can't push us around if we're united.

            - labor_unrest < 3: SID: Ok, I've had about enough of this. I'm not ready to lose my job today.

            - else: SID: We just have some pretty reasonable requests for how we can be treated better.
        }
        
        PATRICIA: Everyone back to work! Come on, we can do this! Go team!
    
        {
            - labor_unrest > 12: STU: We need to have a say in how this place is run, as workers.

            - labor_unrest < 3: STU: I just want to stay out of this. 
        
            - else: STU: We just want you to stop pushing us around. 
        }

        {
            - labor_unrest > 12: DAMIEN: It's a lot of us against one of you.
    
            - labor_unrest < 3: DAMIEN: Carol and Helena need to relax.

            - else: DAMIEN: If I'm going to stay here as long as Carol has, it's got to be a better place to work.
        }
    
        -> endgame
    
=== endgame ===

    TRIGGER_SYNC: day-end

    YOU: Everything at Convei changed after that day.

    {
        - labor_unrest > 12:

            YOU: We realized the power we held by working together for once, and made it official with a union.

            YOU: It goes without saying that Boss tried to bust it. 

            YOU: But Helena's in a meeting right now negotiating our new contract.

            YOU: Still, I could tell there was something else going on. Not only was Boss scared of us - he was more scared of his bosses than ever. 

            YOU: It was far more than the fear just of losing his job.

            YOU: After a couple months of us asserting our power he said that someone high up in the company would be visiting soon. Apparently something about moving between planes made it especially difficult. I've never done much air travel, so I didn't get it. 

        - labor_unrest < 3:

            YOU: It got worse. 
        
            YOU: Helena talked about quitting on a daily basis, and it was sad to see her keep coming back despite that. She wanted someplace better to work, or at least someplace she could make better.

            YOU: Damien met someone, so that was nice at least. He was preparing to see him in person for the first time and also move across the country to live nearby, so his departure was imminent. He said he hoped the new boy looked like his pictures.

            YOU: The whole thing was demoralizing, really.

            YOU: Still, Boss was clearly angry, and a little scared of what his bosses had to say about his employees seizing any kind of control, even if just momentary.

            YOU: A couple months after the confrontation, Boss said that someone high up in the company would be visiting soon. Apparently something about moving between planes made it especially difficult. I've never done much air travel, so I didn't get it. 

        - else:

            YOU: We made some progress, but had to fight for every inch. Things did get better in some ways, but Boss fought like he was possessed, denying or clawing back every improvement that he could.

            YOU: We didn't win on everything. Sick leave was a bridge too far. But we were able to leave the line for a few minutes to use the bathroom.

            YOU: We felt confident we could win more with time, but Boss kept saying "they" wouldn't be happy about this.

            YOU: He was clearly angry, but also seemed truly frightened about his boss's reaction to us taking any control in the workplace.

            YOU: A couple months after the confrontation, Boss said that someone high up in the company would be visiting soon. Apparently something about moving between planes made it especially difficult. I've never done much air travel, so I didn't get it. 
    }
    
    TRIGGER_SYNC: scene-end
    
    -> END
