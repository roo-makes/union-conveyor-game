
TODO: Add more Patricia, including conversation.
TODO: Add more references to sanitizing being a pain.
TODO: Finish conditional confrontation section.
TODO: Write conditional epilogues.

==day2_boss_announce==
BOSS: Unfortunately, Edna didn't end up being a great fit. We're a family here, and like many families, we've had to make the difficult decision to cut ties with a poorly-performing relative who does not help us meet our objectives at this time.
BOSS: In one sense, I owe you an apology. 

BOSS: I hired a loser. I've exhibited that tendency in the past, and in many cases we're still living with the effects of those mistakes. 

BOSS: This doesn't entirely absolve me of blame, but to be fair to myself I should note that many of our applicants are among the most worthless our society has to offer.
BOSS: In any case, you won't have to pay the price for Edna's inadequacy and pick up her slack today. I've brought in Patricia, my neice, to help out. Everyone, welcome Patricia.
BOSS: Also, I have some good news! Due to a large number of complaints, we will now be sanitizing the bottles before filling. 
BOSS: First, press and hold {left_btn} to charge the sanitizer. Then, when bottles are in the first zone on your left, press {left_btn} again to sanitize all of the ones in that zone.
BOSS: You'll figure it out.
->DONE

==day2_helena==

TRIGGER_ASYNC: start-day

HELENA: What the fuck. One day? 

YOU: I know, and I'm not even sure what happened. She was supposed to be getting out early to pick up her brother. And then she just... stayed in the boss's office?

HELENA: I feel like this is worse than a firing. I wouldn't put any depraved shit past the boss. Damn it, we didn't even get her number yesterday.

    * [Go ask] YOU: Why don't you go ask? Say she left something with you and you need to get in touch with her.
    HELENA: You're right. We can at least get her side of it.
    Helena talks to the boss, inaudible to you.
    HELENA: He said he'll make sure things get to her if we hand them over to him. Unbelievable.
    ~helena_opinion +=1 
    ~labor_unrest +=1 
    ->day2_helena.organize

    * [Let's stay out of it] YOU: Seems like scary stuff. We'd better stay out of it.
    ~helena_opinion -=1
    HELENA: Ugh, why do I bother bringing real issues up with you?
    ->day2_stu

    * [Sad for her family] YOU: All those siblings she was supporting. If something happened to her, they're pretty screwed.
    HELENA: Yup, and he just calls her a loser.
    ->day2_helena.organize

=organize
    * [Everyone is mad] YOU: We can't be the only ones who are pissed about this.
    HELENA: You're right. You talk to Stu today. I'll see what Charlie thinks. We'll report back.
    ~helena_opinion +=1 
    *[Have you organized people before?] YOU: Did you ever get people to work together at your old office job?
    ~helena_opinion += 1 
    HELENA: Well, we never got as far as forming ...
    ...
    a union or anything. 
    HELENA: But we did get everyone to demand a pay increase. Which also put a target on my back. But still, I think we can accomplish something here. You talk to Stu and I'll see if we can get Charlie motivated.
    *[You're friendly with Boss, right?] YOU: You're kinda friendly with the boss, right? Can't you convince him to treat us better?
    ~helena_opinion -=1 
    HELENA: What?? Are you TRYING to insult me? Pretty sure that guy hates me.
    YOU: I don't know, all the one-on-one conversations? Heated back-and-forths? Thought you had the inside track.
    HELENA: Yeah, I've got a talent for pissing him off, I guess. How have I not been fired if Edna got canned for nothing?
    YOU: Guess it's easier when someone's brand new.
- HELENA: Alright, good luck on spreading the word. 
-> DONE

==damien_day2==
DAMIEN: I can't believe it. I blew it.

    * [What? About Edna?] YOU: What? Is this about Edna?

    DAMIEN: Yes! I fucked up. And now she's gone.
    YOU: Wait, what do you know Damien?
    DAMIEN: That I'm going to be alone forever!

    * [What'd you do this time?] YOU: What did you do this time?
    DAMIEN: I missed my shot. As always.


    * [This work doesn't matter] YOU: Nobody cares if a couple baby formula bottles go out unsanitized, Damien.
    DAMIEN: What? Oh, I know. No one cares. It's about Edna.
    YOU: You know what happened to her?
    DAMIEN: Well I know what didn't happen. I didn't get her number, and now she's gone.

- 
        ** [This is about a date??] YOU: This is some bullshit about getting a date?
        DAMIEN: It's about NOT getting a date, Carol!  If it was about getting a date I would have brought cupcakes in.

        **[She didn't like you] YOU: Damien. She didn't like you. At all, as far as I could tell.
        ~damien_opinion -=1 
        DAMIEN: Well that's just mean! She hardly knew me. 
        ** [Sure must be hard] YOU: I understand it must be... difficult for you. To have a woman pass through your life... without dating you.
        ~damien_opinion +=1
        DAMIEN:Sometimes I feel like you're the only one here who gets me, CAROL.
            ***[You're just lonely] YOU: I know you're lonely Damien, but I can see where your desperate mind is taking you.

            *** [Boss wronged you] YOU: I can't believe the Boss would do that to you. He saw you liked Edna. He probably got rid of her to spite you.

            ~damien_opinion +=1 
            ~labor_unrest +=1
    
            DAMIEN: Wow, that's messed up. But I see it!

            *** Go on?
            ~damien_opinion += 1
- 
DAMIEN: If you keep joking about that, I'm going to start thinking you really do like me!

YOU: If you're willing to talk about something real, rather than complete fiction, everyone's talking about how we don't get bathroom breaks.

DAMIEN: Oh, yeah, that's not fair and all. 

    * [We're fired up!] YOU: Yeah, we're fired up about it! We're going to confront the boss soon!

    DAMIEN: Ah, yeah. That's cool. Do you think Edna got fired because of... bathroom break?
    YOU: Let's talk about this another time, Damien.
    * [It'd help your looks] YOU: I know, it's hard to stay hydrated and maintain our youthful good looks when we don't get to pee all day.
    ~labor_unrest += 1 
    DAMIEN: Wait, how do I stay hydrated and look good?
    YOU: You drink water.
    DAMIEN. I drink... water. And then I have to pee.
    YOU: Yes, but we're not allowed to pee. 
    DAMIEN: I know! Sometimes it makes me feel like I'm going to pee my pants. But I haven't.
    YOU: Well, you shouldn't have to worry about that, any more than the normal amount anyway.
    DAMIEN: Our chats always put me in a thoughtful mood. Thanks Carol.

- -> DONE

==day2_stu==
    *[Hey Stu] YOU: Hey there, Stu.
    STU: Hey Carol. Weird day today.
    YOU: Seriously.
    ->day2_stu.edna
    *[Shame about Edna] YOU: Such a shame what happened to Edna, huh?
    STU: Yeah, here one day, gone the next? Apparently because she was a "loser"?
    ->day2_stu.edna
    *[Stand and fight!] YOU: It's time to stand up and fight, Stu!
    ~stu_opinion -=1
    STU: What? I don't want to fight anyone.
        **[Smell the injustice!] YOU: Injustice is all around us! Can't you smell it?
        ~stu_opinion -=1 
        STU: Oh, you're talking about Edna? Yeah, that was wrong. 
        ->day2_stu.edna
        
        **[After what they did to Edna?] YOU: But after what they did to Edna?
        STU: Oh yeah, that wasn't fair. I don't even really get what happened.
        ->day2_stu.edna
        **[We're already suffering] YOU: And they're pulling this crap when we're already suffering from the lack of bathroom breaks, not to mention the workload.
        STU: It's true, we've got a lot to be mad about.
        ~labor_unrest +=1 
            ***[They keep piling it on] YOU: They keep piling it on, and we've been so understanding so far.
            ~stu_opinion +=1
            ~labor_unrest +=1 
            
            *** [They treat us well actually] YOU: Eh, actually, I think they treat us pretty well.
            STU: Oh? Well, I guess I can see it that way.
            ~labor_unrest -=1 
            
            *** [Sure.] YOU: Sure.
            STU: Uh, ok.
            --- ->day2_stu.edna
=edna
        ** [What do you make of Edna situation?] YOU: What do you make of all this with Edna?
    STU: I don't know - it's scary to be reminded that they could just get rid of any of us at any time. I'm not trying to cause any trouble. But Edna didn't seem to be doing anything wrong. 
    YOU: I know, we're always vulnerable, even when it doesn't seem like it. 
    ~labor_unrest +=1 
    STU: That's a dark thought. But it's true I guess. I've seen it first hand, had some terrible bosses.
    ->day2_stu.bad_bosses
    
        **[I trained her, she's great] YOU: I trained Edna. She seemed great.
        STU: I didn't get to talk to her, but I can't imagine what would have justified disappearing her like that. That's probably what it looked like when they fired me at my old job.
        ~stu_opinion +=1
        ->day2_stu.bad_bosses
        **[I'd keep quiet if they were fair] YOU: Yeah, I'd be perfectly happy to keep quiet if they were treating everyone fairly. But I feel like we have to stand up for ourselves or they'll walk all over us.
            ~stu_opinion +=1
            ~labor_unrest +=1 
        STU: That's what I'm thinking. I wish the boss was like, nice, and we could count him as a friend. But I don't trust him. I've had some bad bosses before.
        ->day2_stu.bad_bosses
        
    ->day2_stu.end
        **[Get those bastards] YOU: We're gonna get those bastards for what they did to Edna.
        ~stu_opinion -=1 
        STU: Like, firing her? What did they do exactly?
        YOU: Well, we don't know. But it doesn't look good.
        STU: Oh, yeah. Well, that's true. But I thought you like, knew something.
            ***[It was obviously unjust] YOU: I do know she was asking for a perfectly reasonable accommodation. That she needed this job and wouldn't have quit. And so clearly they fucked her over somehow.
           
            *** [Ground her up for dog food] YOU: They ground her up for dog food, for all we know!
            ~stu_opinion -=1
            STU: Huh, you're really fired up about this, aren't you? I hope that's not what happened.
            ***[Yeah, not really.] YOU: Yeah, not really.
            ---
->day2_stu.end
=end 
STU: Alright, I'll talk to you later Carol.
->DONE
    
=bad_bosses
            ***[What happened?] YOU: What happened with you?
            STU: This one guy had it out for me cause I'm really into clothes. He must have thought I was mocking his style, but it's just something I like. 
            STU: I mean, if I started judging everyone based on my standards, no one would look great. 
                ****[You dress great!] YOU: I've always noticed that you're a snappy dresser Stu, can't believe someone would be pissed about that.
                STU: Well thanks, that's nice. 
                ~stu_opinion +=1 
                ->day2_stu.end
                ****[Did you get fired?] YOU: Did you lose the job?
                STU: Yeah, he said it was for performance, but I knew that was crap. I did a great job.
                YOU: I'm sorry to hear that Stu.
                ~stu_opinion +=1 
                ->day2_stu.end
                ***[Won't tolerate a tyrant] YOU: Yeah, we have to show him that we won't tolerate a tyrant.
            ~labor_unrest +=1
                **** [You don't dress well] YOU: You think you dress well? That's news to me.
                    STU: Jeez Carol. That's harsh.
                    ~stu_opinion -= 1
->day2_stu.end

===mysterious_whisper_day2==
EDNA: Carol...
EDNA: Carol...
EDNA: They're deschhhhhh... I can't cut through
EDNA: I'm ooooooshhh here but shhhhhsss help you.
->DONE





===damien_day2_convo2===
DAMIEN: Now I've gotta talk to Patricia.

YOU: Damien. I don't know how this can be true if she's working in this facility, but I think she's like 10?

DAMIEN: Disgusting Carol, it's not like that. I just haven't met anyone new today.

YOU: What?

DAMIEN: Usually I go out for a walk before work to talk to a stranger and meet someone new. But I've been so tired all the time since I started really restricting water to avoid peeing at work.

DAMIEN: Meeting people is part of my "one-a-day" philosophy. 
* [What's that?] YOU: What's that?

DAMIEN: You know how everything is good for you in moderation? What's more moderate than once a day? It applies to anything. In this case, I gotta meet one new person a day.
YOU: So you eat once a day?
DAMIEN: No, I eat breakfast once a day, and lunch once. And so on.
YOU: Seems like cheating to me.

* [Enough with the philosophies] YOU: Enough with the philosophies from you.
DAMIEN: It's good to have a code, so it's even better to have a bunch of them.

* [You jack off once a day?] So you have to jack off once a day?
DAMIEN: Ew Carol, it's not one of those masturbation philosophies! I just do it once a day sometimes and abstain once a day other times.
~damien_opinion -=1 
-
YOU: You don't seem to mind the new work station.

DAMIEN: Oh, I figure if we weren't doing it before, no one will notice the ones I miss now.

->DONE

==complain_day2==
HELENA: Can't believe this place thinks they can fire people AND not let us have bathroom breaks. Why do any of us work here?

DAMIEN: I'm so lonely, and it's all the BOSS's fault.

STU: I bet I'm next. I'm always the target.

    * [Gotta confront the boss] YOU: We've gotta talk to the boss, like right now. 
-> carol_confronts
    *[Just keep quiet.] YOU: Just keep quiet about it for now everyone. Our time will come... eventually.
    
    -> helena_confronts
    
    *[This sucks] YOU: I didn't realize this job could get more depressing.
    
    -> helena_confronts
    
    ===helena_confronts===

HELENA: Boss! We've gotta talk.
BOSS: Oh yeah? What about?
HELENA: Things have been shitty here for a while, but firing Edna after one day was the last straw.
-> carol_confronts.confront

->DONE
    
    
==carol_confronts==
YOU: Boss! We've gotta talk.
BOSS: Yeah?
-> confront

=confront
* [We're pissed] YOU: We're pretty pissed off. You got rid of Edna after one day. You have us doing this new sanitization thing for the same pay. We still don't have bathroom breaks.
~labor_unrest += 3
BOSS: Yes, those are all within the realm of business decisions. My job. Sanitizing and filling tubes? Your job.
{ stu_opinion > 3 :
STU: This is serious. Don't blow us off.
-> carol_confronts.stage2
~labor_unrest +=1
stu_opinion < 3 :
STU: Whatever, he's never going to take us seriously. 
~labor_unrest -=1
-> carol_confronts.stage2
}
*[Things could improve somewhat] YOU: We've noticed that there are few areas with room for improvement.
~labor_unrest += 1
BOSS: Very interesting, I'm sure. I'll pass it to upper management. Is that it?
YOU: I haven't told you what's this is about yet.
BOSS: Sure, sure. Just write it down and hand it over before you leave.
    { stu_opinion > 3 :
    STU: This is serious. Don't blow us off.
    ~labor_unrest +=1
    -> carol_confronts.stage2
    stu_opinion < 3 :
    STU: Whatever, let's just write it out Carol. 
    ~labor_unrest -=1
    -> carol_confronts.stage2
    }
=stage2
    *[Bathroom breaks are a right] YOU: Bathroom breaks are a human right. You can't keep us at these belts all day.
    ~labor_unrest +=1


    *[The pace is too fast] YOU: These belts move too fast. We can hardly keep up.

    ~labor_unrest +=1 


    *[Never mind] YOU: Never mind.
    ~labor_unrest-=1 

    - 
        { helena_opinion > 5 :
        HELENA: I'm not gonna stand for it either.
        ~labor_unrest +=1
        -> carol_confronts.stage3
        helena_opinion < 5 :
        HELENA: Maybe there's no hope for this shitty place.
        ~labor_unrest -=1
        -> carol_confronts.stage3
        }
=stage3

YOU: See, it's not just me who's fed up.


    

    *[Could fire us at any moment] YOU: After what happened to Edna, how can any of us feel secure in our jobs?
    BOSS: Listen, personnell decisions are for me to make. You don't need to know where Edna went, or why. Just believe me that if you keep doing a good job, or start doing a good job, you'll be fine.
    ~labor_unrest +=1
    
    *[And what goes on here anyway] YOU: And then we don't even get to know what we're doing here. Is making toothpaste a matter of national security or something?
    BOSS: Carol, you've been here for over a decade now, and now you've got a problem?
    YOU: Yeah, my curiousity has grown.
    BOSS: Once again, you're getting into things that have nothing to do with you, and that you'll deeply regret speaking of ever again.
    ~labor_unrest +=1
    
    *[Let's just get new jobs] YOU: Whatever, we might as well just move on to new jobs.
    BOSS: Great, I hope you feel better. I'll see you back here tommorrow. And the next day.
    ~labor_unrest -=1
    -
    {damien_opinion > 5 :
    DAMIEN: I'm sick of this too. CAROL said not being able to pee is bad for my skin.
    ~labor_unrest +=1
    ->carol_confronts.stage4
    }
    { damien_opinion < 5:
    DAMIEN: OK, calm down Carol, you've said your piece.
    ~labor_unrest -=1 
    ->carol_confronts.stage4
    }
    =stage4
    {labor_unrest>6:
    HELENA: You're going to listen to us, or we're going to walk off. You may not be afraid of us, but you're afraid of what your bosses will say if production shuts down.
    }
    
    {labor_unrest < 6 :
    HELENA: You have to listen to us. Your tubes don't get filled with red goop without us. 
    }
    ->DONE
    }
    {else:
    HELENA: I know there's no chance you'll listen to us, so why don't we quit pretending here? 
    }
    
    
    
    
    {labor_unrest>6:
    STU: We need to have a say in how this place is run, as workers.
    }
    
    {labor_unrest < 6 :
    STU: We just want you to stop pushing us around. 
    }
    ->DONE
    }
    {else:
    STU: I just want to stay out of this.
    }
    
    
      {labor_unrest>6:
    DAMIEN: It's a lot of us against one of you.
    }
    
    {labor_unrest < 6 :
    DAMIEN: If I'm going to stay here as long as Carol has, it's got to be a better place to work.
    }
    ->DONE
    }
    {else:
    DAMIEN: Carol and Helena need to relax.
    }
    
    
->DONE




COMMENT: Fade to black screen?

==end==
YOU: Everything at Convei changed after that day.
      {~labor_unrest>6:
    YOU: We realized the power we held by working together for once, and made it official with a union.
    YOU: It goes without saying that Boss tried to bust it. 
    YOU: But Helena's in a meeting right now negotiating our new contract.
    YOU: Still, I could tell there was something else going on. Not only was Boss scared of us - he was scared of his bosses. 
    YOU: It always seemed like far more than the fear just of losing his job.
    YOU: Eventually he said that a representative would be visiting soon. Something about traveling from another plane. 
    
    ->END
    
    ~labor_unrest<3:
    YOU: Helena quit almost immediately after. She wanted someplace better to work, or at least someplace she could make better.
    YOU: Damien met someone. He was preparing to see him in person for the first time and also move across the country to live nearby, so his departure was imminent.
    YOU: The whole thing was demoralizing, really.
    YOU: Still, Boss was clearly angry, and a little scared of what his bosses had to say about him letting some employees berate him.
    YOU: Someone from corporate was coming up, he said, so we'd better be ready. 
    
    -> END
    
    ~else :
    YOU: We made some progress. Boss backed off some, and things did get better. 
    YOU: We certainly didn't win on everything. Sick leave was a bridge too far.
    YOU: But we felt confident we could win more with time.
    YOU: Still, Boss was clearly angry, and a little scared of what his bosses had to say about him letting some employees berate him.
    YOU: Someone from corporate was coming up, he said, so we'd better be ready.
    ->END
    }
   
    

