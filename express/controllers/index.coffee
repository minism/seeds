module.exports = (app) ->

  app.get '/', (req, res) ->
    req.message 'info', "Example message"
    res.render 'index',
        foo: 'bar'
