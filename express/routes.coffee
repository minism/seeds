# Routes & Controllers

module.exports = (app) ->

    app.get '/', (req, res) ->
        req.message 'info', "A message"
        res.render 'index',
            foo: 'bar'
