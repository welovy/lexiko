$(document).ready ->
    socket = io.connect('http://localhost:3000')
    socket.on 'news', (data) ->
        console.log(data)
        socket.emit 'my other event', {my: 'data'}
        
    $(".wordbox").keypress (e) ->
        if e.keyCode == 13
            box = $(this);
            t_val = $(box).val();
            if t_val.length > 0
                $(".wordlist").append("<div class='worditem'>" + t_val + "</div>")
            socket.emit 'add', {word: t_val}
                
        return
    return

                


