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

TRIGGER_ASYNC: carol-goto-boss

BOSS: Hey Carol, get over here.

BOSS: We’ve got a new gal today, name's Edna. Hope she isn’t as lazy as that last guy. Show her how everything works. 

BOSS: And don’t mention our discount at the diner downstairs. Those jokers will snatch it away if anyone but the bigwigs like us use it.

  * [Don't tell about other discount] YOU: And don't forget about our discount on nutritional gruel across the street. She can never know.
    ~ boss_opinion += 1
  * [I can't do that] YOU: I can't do that and you know it.
        BOSS: Whatever. You think cause you’ve been here 12 years you can talk to me however you want. Maybe Edna’ll be my new favorite.
    ~ boss_opinion -= 1
  * [OK] YOU: OK
    BOSS: Great. Knew I could count on you.
- BOSS: Anyway should be an easy day. Business is slow. *Sighs* That’s all.

TRIGGER_SYNC: carol-goto-conveyor

    -> edna_training

=== edna_training ===

YOU: Hi, I'm Carol. You're Edna?

EDNA: Hello, yup, I'm Edna.

YOU: Good to meet you. Welcome to Conveyor. I've been here the longest, so looks like I'm training you.

EDNA: Training? This doesn't look so hard.

YOU: It's not right now, but the boss is always changing things up on us. I'll help you learn the ropes, but things could be different tomorrow if they get a new contract or something. The same basic principles apply though.

EDNA: A new contract? For what?

YOU: Materials come down the conveyor, we push buttons, and the machines do their thing. Today it looks like some kind of viscous red fluid. They're telling us it's toothpaste but I doubt it.
YOU: You fill the tube. It  goes into the chute at the end, to god knows where. Sometimes the boss says "we've got a new contract" and they change things up. 

EDNA: That sounds both boring and mysterious.

YOU: It's just boring. Here, I'll show you.

TRIGGER_SYNC: player-conveyor-demo-start

-> edna_training.start_chatless_tutorial

= start_chatless_tutorial

YOU: OK, so when the material arrives in this zone hold down the {center_btn} button, and let go when it gets to the second line. Like this.

TRIGGER_ASYNC: player-conveyor-demo-fill

EDNA: Then what?

YOU: That's it.

EDNA: Oh my god.

YOU: Yeah. Well, it's a little harder when you're trying to have a conversation at the same time. Since the work is so tedious, people here love to chat. 

YOU: Make sure to keep the work going while you listen and decide what to say. If you don't hit your quota for the day, you'll get a demerit or even get fired if you're bad enough. 

-> edna_training.after_chatless_tutorial

= after_chatless_tutorial

EDNA: Ugh, I have eight younger siblings at home. 3 brothers, 5 sisters. They talk constantly. I don't need any more chatter. 

*[That's a lot] YOU: That's a lot of siblings. 
EDNA: Yeah, I'm kind of forced to take care of them. I hate it.
    ** [Sucks being here] YOU: If it resulted in you working here, it must be pretty bad.
    ~labor_unrest += 1
        EDNA: I can't argue with that.
         ->conveyor_and_chat_tutorial
    
    ** [At least you're used to chatter] YOU: At least you're use to people talking constantly. You'll fit in.
    EDNA: This doesn't bode well.
    ~edna_opinion +=1 
     ->conveyor_and_chat_tutorial
    ** [Yikes] YOU: Yikes.
    EDNA: Yeah.
    ->conveyor_and_chat_tutorial

* [People might be offended.] YOU: People might be offended. 
EDNA: I hope they can deal with it. I really need this job, but I'm just not a chatterbox.
-> conveyor_and_chat_tutorial

* [Whatever works for you] YOU: Well, whatever works for you.
EDNA: Do you think anyone will mind?
-> conveyor_and_chat_tutorial

= conveyor_and_chat_tutorial

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

TRIGGER_ASYNC: start-day

YOU: Alright, that's our sign to start for real. 

* [We get a discount downstairs] YOU: Don't forget, we get a very small discount at the diner downstairs. 
EDNA: Oh, I had no idea, thanks!
~edna_opinion += 1

* [Good luck.] YOU: Good luck.

* [Stay at the belt.] Make sure to stay at the belt at all times.
~boss_opinion +=1 
~labor_unrest -=1 

EDNA: Damn, this place is strict. 

SID: Don't forget to tell our new employee about the discount downstairs! 

EDNA: We get a discount where?
** [Not great discount but sure] YOU: They make a huge deal about it, but it's a tiny discount. Go ahead and use it though. And there's one for the hip nutri gruel place.

  *  * [Don't use it] YOU: Well, technically, but they don't really like it when you use it. They get mad.
~edna_opinion -= 1
~labor_unrest -= 1
~boss_opinion += 1 
EDNA: Wow, that's so stupid.
    ** [Yes! Can't believe that slipped my mind.] YOU: Yes! Can't believe that slipped my mind.
    EDNA: OK, well. Thanks. I guess I'll get started. 

-> DONE
    
    
== damien_day1 ==
COMMENT: It's 11am.

DAMIEN: You're training the new girl?

YOU: Yeah, didn't take much.

DAMIEN: What's she like?

* [Weird] YOU: Weird
DAMIEN: Wow, very descriptive. Do you think she'll be my friend?

* [Nice but shy] YOU: Nice, but pretty shy. Don't worry if she doesn't talk too much.
DAMIEN: Man, all there is to do here is talk. I've got an hour on the train to get home to my empty apartment. I wouldn't say a word for days if it wasn't for talking to you all. And talking to myself. Do you think she'll be my friend?
* [Don't know] You: I didn't get to know much about her.
DAMIEN: I bet she wants to talk to me. I should talk to her.
-
    ** I really don't think so. She seems to have her own stuff going on.
~damien_opinion -=1 
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
    
    ** Do whatever you want Damien.
    ->damien_goes_over


==damien_goes_over==
COMMENT: Damien talks to Edna, and you see that they're conversing but not what they're saying.
DAMIEN: ...
EDNA: ...

{ 
    -avoid_edna: 
    EDNA: Carol, I thought you were going to tell people to leave me alone. 
    ~edna_opinion -=1  
    }
Damien breaks off the conversation awkwardly.
DAMIEN: Great to meet you!
EDNA: ...

-> DONE

==damien_desists==
COMMENT:Damien does not speak to Edna.
DAMIEN: Nobody gives me a chance...
{
    -avoid_edna: 
    Edna gathers that you helped deflect Damien from her and gives you a slight smile.
    ~edna_opinion +=1  
    }
- 
-> DONE

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
    
    ->DONE
    
    ==meet_stu==
    STU: Hey.
    YOU: What, you want to date the new girl too?
    STU: What?
    * [Sorry] YOU: Sorry, I hate training people, kinda on edge.
    STU: Oh, I get it, don't worry. Glad we're getting some help with this "toothpaste" order though.
        **[It smells evil] YOU: That stuff smells like it came straight out of hell. 
        STU: I bet it did. Or at least out of a butt.
        YOU: Speaking of which, I've had to go since the whistle blew. 
        STU: We go in our pants here. That's the Convei way. 
        ->meet_stu.bathroom
        **[What do we make?]  YOU: Edna asked about what we make. Felt kind of silly saying I have no idea.
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
        YOU: Anyway, <> ->meet_stu.bathroom
        **[Love to fill tubes] YOU: Who doesn't love filling a tube with a strange substance?
        STU: We're living the dream here Carol. The wife and kids and I are going to Greece in a month though - I don't know how I'll deal with being away from the conveyor. 
            YOU: Are you allowed to use the bathroom in Greece?
            STU: Yeah, in that sense it might be nicer. But you have to ask in Greek. Here you don't need to ask at all, cause it's not happening anyway. 
            *** [We could change that] -> meet_stu.bathroom 
    * [Everyone's fascinated with Edna] YOU: Everyone's fascinated with Edna, huh?
        STU: And what, you think I'm like Damien?
        **[No, but...] YOU: No, but considering how boring it is here people can get obsessed with a fresh face. 
        ~stu_opinion +=1
            STU: Listen, I'm a happily married man. I just want to pack this battery acid crap into tubes so people can put it on their toast or whatever the hell happens after it leaves this place.
            YOU: Our customers disgust me, whoever they are.
            ->meet_stu.bathroom
        ** [He's persuasive] YOU: Well, apparently he has a large following online. 
        ~stu_opinion -=1
        STU: Yeah, and that is truly scary. You think he got me?
            *** [Never!] YOU: No way, you'd never go for that crap.
            ~stu_opinion +=1 
            STU: Thanks Carol. 
            YOU: Speaking of crap...
            **** [Fight for bathroom rights]
            ->meet_stu.bathroom
            **** [Leave it alone]
            ->meet_stu.bye
    * [Never mind.]YOU: Never mind. 
    ->meet_stu.bye
    
    =bathroom
    YOU: We could try standing up for our right to pee. 
            ~labor_unrest += 1
            STU: Sure, I bet the BOSS will find it funny at least.
            YOU: More likely he'll be pissed, but I don't really care.
            STU: Funny. But this is just a job. I keep myself good and dehydrated during the day, then I go home to my lovely wife and toilet and kids. 
            * [Apathy is embarrassing] YOU: Stu, that kind of apathy is just embarrassing. 
            ~stu_opinion -=1
            ~labor_unrest+=1 
            * [Can't let them walk over us] YOU: They're treating us like shit, Stu, and it's just cause they think they can get away with it.
            ~labor_unrest +=1
            * [Fair enough.] YOU: Fair enough.
            ~labor_unrest -=1 
            - -> meet_stu.bye
    
    =bye
    STU: Well, I'm getting a bit behind on my cylinders here. Talk to you later Carol.

    
    -> DONE
    
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
YOU:  Where is she?
COMMENT: More time passes, and everyone else is gone. The light in the boss's office is still on.
YOU: Goddamnit, I can't stay here all night.
->day1_end
=leave 
You leave.
->day1_end

==day1_end==
-> END
