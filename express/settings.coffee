settings =

    PORT: 3000
    SECRET_KEY: '24kjbakjbiouhsdboiua083'


# Override with environment, if set
for key, val in settings
    settings[key] = process.env[key] or val

module.exports = settings
