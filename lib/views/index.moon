import Widget from require "lapis.html"

class Index extends Widget
    content: =>
        script src:"/js/interpoet.js"
        link rel:"stylesheet", href:"/css/interpoet.css"
        div class:"content", ->
            h1 ->
                span class:"inter", "INTERP"
                span class:"poet", "oet"
            p "Speech recognition poetry"
            button class:"record", "Poe Me"
            div class:"result"
            div class:"iresult"

