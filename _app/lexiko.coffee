$(document).ready ->
    $(".wordbox").keypress (e) ->
        if e.keyCode == 13
            box = $(this);
            t_val = $(box).val();
            if t_val.length > 0 
                console.log t_val;
        return
    return

                


