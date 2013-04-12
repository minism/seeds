class Message
    constructor: (@text, @type='info', @icon='envelope') ->


module.exports = 

    # Flash messaging middleware
    messages: (req, res, next) ->
        # Clear any messages
        messages = res.locals.messages = req.session.messages = []

        # Register shortcut functions on request object
        req.message = (type, text) ->
            switch type
                when 'success' then messages.push(new Message(text, 'success', 'ok'))
                when 'error' then messages.push(new Message("<strong>Error: </strong>#{ text }", 'error', 'exclamation-sign'))
                when 'warning' then messages.push(new Message("<strong>Warning: </strong>#{ text }", 'warn', 'flag'))
                else messages.push(new Message(text))

        next()
