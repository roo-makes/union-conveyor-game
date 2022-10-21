VAR dialog_speed = "normal"

-> dialog_speed_check

=== dialog_speed_check ===
    
    BOSS: This is the {dialog_speed} dialog speed.

    {
        - dialog_speed == "chill":
            -> dialog_speed_chill
        - dialog_speed == "normal":
            -> dialog_speed_normal
        - else:
            -> dialog_speed_fast
    }

=== dialog_speed_chill ===

    +   [Too Fast] BOSS: Well, pick up the pace!
        
    +   [Too Slow]
        ~dialog_speed = "normal"

    +   [Just riiiight] BOSS: Glad to hear it!
            
    -   -> dialog_speed_check
    
=== dialog_speed_normal ===
    
    +   [Too Fast]
        ~dialog_speed = "chill"
        
    +   [Too Slow]
        ~dialog_speed = "fast"
            
    +   [Just riiiight] BOSS: Glad to hear it!

    -   -> dialog_speed_check
    
=== dialog_speed_fast ===

    +   [Too Fast]
        ~dialog_speed = "normal"
        
    +   [Too Slow] BOSS: Impressive, but this is as fast as it'll go.
            
    +   [Just riiiight] BOSS: Glad to hear it!

    -   -> dialog_speed_check
    