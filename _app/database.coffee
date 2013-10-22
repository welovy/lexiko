    sqlite3 = require 'sqlite3'
    class Database
        open: ->
            @db = new sqlite3.Database('wnjpn.db')

        getWord: (word)->
            console.log word
            @db.each 'select * from word where lemma= "' + word + '"', (err, row) ->
                console.log row

        
