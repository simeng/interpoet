lapis = require "lapis"

lapis.serve class extends lapis.Application
    [ index: "/" ]: =>
        @title = "INTERPoet"
        render: true

    handle_404: =>
        @html ->
            @title = "Not found"
            h1 "404 not found"
