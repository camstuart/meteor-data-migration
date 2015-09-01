mysql = Meteor.npmRequire 'mysql'

class @ImportBase
  constructor: (appSettings) ->
    console.log "+ Connecting to mysql source database: [#{appSettings.name}] on host: [#{appSettings.host}] as user: [#{appSettings.user}]"
    @sourceDbConnection = mysql.createConnection(
      host: appSettings.host
      user: appSettings.user
      database: appSettings.name
    )
    @sourceDbConnection.connect()