################################################################################
class @ImportBase
  constructor: (appSettings, @collections) ->
    console.log "+ Connecting to mongodb source database: [#{appSettings.name}] on host: [#{appSettings.host}]"
    @sourceDatabaseCollections = {}
    @sourceDbConnection
    dsn = "mongodb://#{appSettings.host}:27017/#{appSettings.name}"
    try
      @sourceDbConnection = new MongoInternals.RemoteCollectionDriver(dsn)
    catch error
      console.error("! Connect error: #{error}")
    return @

################################################################################