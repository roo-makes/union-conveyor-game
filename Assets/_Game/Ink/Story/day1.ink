VAR boss_opinion = 5
VAR edna_opinion = 5
VAR labor_unrest = 0
VAR damien_opinion = 5
VAR helena_opinion = 5
VAR stu_opinion = 5
VAR avoid_edna = false
VAR center_btn = "x"
VAR left_btn = "z"
VAR right_btn = "c"
VAR big_btn = "space"

-> day_1_intro

=== day_1_intro ===
COMMENT: Open with YOU entering the facility, walking up to your spot on the conveyor. EDNA is in the spot next to you.

BOSS: Hey Carol, get up here.

COMMENT: YOU walk up to the BOSS's office.

TRIGGER: carol_goto_office

BOSS: We’ve got a new gal today, name's Edna. Hope she isn’t as lazy as that last guy. Show her how everything works. 

BOSS: And don’t mention anything about our 10 percent discount at the restaurant downstairs.

BOSS: Those guys will lower it to 5 percent if anyone but the bigwigs like us use it. 
  * [OK] YOU: OK
    BOSS: Great. Knew I could count on you.
  * [Don't tell about the donut place] YOU: And don't forget, that's true of the donut place across the street too. She can never know.
    BOSS: I’ve always said you’ve got the spirit of a master conveyor. I’d better watch out or you’re gonna be in my seat soon *heh heh*
    ~ boss_opinion += 1
  * [I can't do that] YOU: I can't do that and you know it.
        BOSS: Whatever. You think cause you’ve been here 12 years you can talk to me however you want. Maybe Edna’ll be my new favorite.
    ~ boss_opinion -= 1
- BOSS: Anyway should be an easy day. Business is slow. *Sighs* That’s all.

COMMENT: You walk back down to your conveyor spot.

    -> edna_training

=== edna_training ===

YOU: Hi, I'm Carol. You're Edna?

EDNA: Hello, yup, I'm Edna.

YOU: Good to meet you. Welcome to Conveyor. I've been here the longest, so looks like I'm training you.

EDNA: Training? This doesn't look so hard.

YOU: It's not right now, but the boss is always changing things up on us. I'll help you learn the ropes, but things could be different tomorrow if they get a new contract or something. The same basic principles apply though.

EDNA: A new contract? For what?

YOU: Honestly, I have no idea. Materials come down the conveyor, we push buttons, and the machines do their thing. 
YOU: The product goes into the chute at the end, to god knows where. Sometimes the boss says "we've got a new contract" and the machine is different, or you use more than one machine. 

EDNA: That sounds both boring and mysterious.

YOU: It's just boring. Here, I'll show you.

-> edna_training.start_chatless_tutorial

= start_chatless_tutorial

TRIGGER: start-conveyor 

YOU: OK, so when the material arrives in this zone hold down the {center_btn} button, and let go when it gets to the second line. Like this.

TRIGGER: do-center-demo 

EDNA: Then what?

YOU: That's it.

EDNA: Oh my god.

YOU: Yeah. Well, it's a little harder when you're trying to have a conversation at the same time. Since the work is so tedious, people here love to chat. 

YOU: Make sure to keep the work going while you listen and decide what to say. If you don't hit your quota for the day, you'll get a demerit or even get fired if you're bad enough. 

YOU: If you take too long to answer people, they'll get bored and wander away. 

-> edna_training.after_chatless_tutorial

= after_chatless_tutorial

EDNA: Ugh, I have eight younger siblings at home. 3 brothers, 5 sisters. They talk constantly. I don't need any more chatter. 

* [Whatever works for you] YOU: Well, whatever works for you.
EDNA: Do you think anyone will mind?
-> conveyor_and_chat_tutorial
* [People might be offended.] YOU: People might be offended. 
EDNA: I hope they can deal with it. I really need this job, but I'm just not a chatterbox.

= conveyor_and_chat_tutorial
YOU: TESTING DOES THIS NOT BREAK

** [I'll tell people to leave you alone.] YOU: I'll mention to everyone that you just like to keep to yourself.
EDNA: Thanks!
~edna_opinion += 1
~avoid_edna = true
** [Got it.] YOU: Got it.

* [Just explain yourself at least, and I'm sure everyone will understand.]YOU: Just explain yourself at least, and I'm sure everyone will understand.
EDNA: I hope they can deal with it. I really need this job, but I'm just not a chatterbox.
** [I'll mention to everyone that you just like to keep to yourself.] YOU: I'll mention to everyone that you just like to keep to yourself.
EDNA: Thanks!
~edna_opinion += 1
~avoid_edna = true

** [Got it.] YOU: Got it.
- EDNA: Oh also I've got to leave five minutes early to pick up my little brother Blendo. That seems ok, right? 
YOU: That should be fine. Just go talk to the boss before the end of the day.

TRIGGER:sfx_start_whistle 

YOU: Alright, that's our sign to start for real. 

* Don't forget, you get breaks at noon and 3pm. 
EDNA: Oh, I had no idea, thanks!
~edna_opinion += 1

* [Good luck.] YOU: Good luck.

* [Stay at the belt.] Make sure to stay at the belt at all times.
~boss_opinion +=1 
~labor_unrest +=1 

EDNA: Damn, this place is strict. 

CHARLES, while passing by: Well, there's break time too! 

EDNA: We get breaks?

  *  * Well, technically, but it's really not best to actually take them.
~edna_opinion -= 1
~labor_unrest += 1
~boss_opinion += 1 
EDNA: Wow, super strict.
    ** [Yes! Can't believe they slipped my mind.] YOU: Yes! Can't believe they slipped my mind.
    EDNA: OK, well. Thanks. I guess I'll get started. 
    
    
- COMMENT: Work day begins.
-> damien_day1

== damien_day1 ==
It's 11am.

DAMIEN: You're training the new girl?

YOU: Yeah, didn't take much.

DAMIEN: What's she like?

* Weird
DAMIEN: Wow, very descriptive. Do you think she'll be my friend?

* Nice, but pretty shy. Don't worry if she doesn't talk too much.
DAMIEN: Man, all there is to do here is talk. I've got an hour on the train to get home to my empty apartment. I wouldn't say a word for days if it wasn't for talking to you all. And talking to myself. Do you think she'll be my friend?
-
    ** I really don't think so. She seems to have her own stuff going on.

    DAMIEN: If the boss didn't keep making us work late, maybe I could make some friends outside of work. Or get a date. According to my timeline, I'm supposed to be engaged next year to have three kids on schedule.
    
    ***I'm too old to have your three kids Damien. Don't bother.
    DAMIEN: Ha ha, good one Carol. But seriously. If I don't meet anyone here, I'm not going to meet anyone anywhere. I'll take my chances.
    ->damien_goes_over
    
    ***Have you tried getting a hobby?
    DAMIEN: I'm pretty much a legend on the pickup artist forums. My manifesto is the most popular one left online after the media blamed that terrorist attack on us. I wouldn't want to hang out with any of the freaks from there though.
    YOU: Damien, please leave Edna alone.
    DAMIEN: Fine, whatever.
    ~damien_opinion -=1 
    ->damien_desists
    
    *** If that's what you're thinking about, you should definitely leave her alone. 
    DAMIEN: You're right, folks can smell desperation. That's what they keep telling me when I try to start a conversation.
    ->damien_desists
    
    ** Why not ask?
    DAMIEN: You're right!
    ~damien_opinion += 1 
    ->damien_goes_over
    


==damien_goes_over==
COMMENT: Damien talks to Edna, and you see that they're conversing but not what they're saying.
{ 
    -avoid_edna: 
    Edna saw that Damien started the conversation after talking to you and glares at you. 
    ~edna_opinion -=1  
    }
Damien breaks off the conversation awkwardly.
DAMIEN: Great to meet you!
Edna is silent, looking at her work.

-> helena_day_1 

==damien_desists==
COMMENT:Damien walks back to his conveyor, and periodically glances over at Edna.
{
    -avoid_edna: 
    Edna gathers that you helped deflect Damien from her and gives you a slight smile.
    ~edna_opinion +=1  
    }
- 
-> helena_day_1

==helena_day_1==

HELENA: Hey

YOU: Hi HELENA
HELENA: So you're training the new girl?

YOU: Yup.

HELENA: What's she like?

YOU: Uh, I don't know. Keeps to herself? Has a bunch of brothers and sisters?

HELENA: But like, is she on our side?

YOU: I really don't know what you mean.

HELENA: Yes you do. Is she gonna suck up to the boss, or is she on our side?

    * [Wants to keep her job] YOU: I think she wants to keep her job.
    HELENA: THIS job, THIS is the one you all want to keep at any cost?

    * [Wants to kidnap BOSS] YOU: She wants us to join her in kidnapping him.
    HELENA: I'm in, no question.
    ~helena_opinion += 1 
    YOU: I'm kidding.
    
    * [We all suck up to the boss] YOU: We've all got to suck up to the boss Helena, what else are we going to do?
    ~helena_opinion -= 1 
    HELENA: Speak for yourself, that's embarrassing. 
    
    - YOU: She seems pleasant enough.
    HELENA: Well, we've got work to do with her. I want bathroom breaks. I try not to drink any water all day so I can wait until quitting time. 
    HELENA: That can't be healthy. Getting another ally would be a big deal.
    * [Relax about breaks] Can you relax about breaks? It's the busy season. They can't afford to have us jumping off the line for something that can wait.
    HELENA: Oh, the busy season for shipping out scam cleaning products that are just water and blue food coloring. Can't disrupt that. My old office job didn't put nearly this much effort into convincing us we were doing valuable work.
    ~helena_opinion -=1
    ~labor_unrest -= 1
    YOU: If those things didn't sell, we'd be fucked.
    HELENA: Yeah, well we're pretty fucked now too.
    * [The boss has no idea] The boss has no idea how pissed we are. You should tell him.
    HELENA: You're right. Watch this.
    Helena says things you can't make out to the boss. 
    ~helena_opinion +=1
    ~labor_unrest +=1
    ~boss_opinion -=1 
    *[Get everyone on our side.] Can't run in all half-cocked.
    HELENA: You're right - as fun as it would be, yelling at the boss wouldn't do much right now.
    ~labor_unrest +=1 
    - HELENA: OK, back to work. Recruiting people, that is.
    -> edna_disappears
    
==edna_disappears==
EDNA: So Carol ... you think I should just go ask him, now? 

YOU: Yeah, just tell him you've gotta pick up your little brother early today. He has kids. He'll get it.

EDNA: Edna enters the boss's office.

COMMENT: Time passes and the whistle blows for quitting time. 

YOU: Edna hasn't left the BOSS's office yet.

YOU: Edna's going to be really late to get her brother.

* [Wait for her] YOU: I'll wait around and make sure everything is ok.
-> edna_disappears.wait

* [Ask tomorrow] YOU: I'll ask her what happened tomorrow.
-> edna_disappears.leave

* [Whatever.] YOU: Whatever.
-> edna_disappears.leave
=wait
YOU:  You wait. #italics
COMMENT: More time passes, and everyone else is gone. The light in the boss's office is still on.
YOU: Goddamnit, I can't stay here all night.
->day1_end
=leave 
You leave.
->day1_end

==day1_end==
-> END