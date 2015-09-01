################################################################################
class @ImportToDoData extends @ImportBase
  constructor: (appSettings) ->
    super appSettings

################################################################################
  import: ->
    console.log '+ Starting load...'
    @_loadLists()
################################################################################
  _loadLists: ->
    @sourceDbConnection.query 'SELECT * FROM list', (listErr, listRows, listFields) ->
      throw listErr if listErr
      listRows.forEach (sourceListItem) ->
        listItem = {}
        listItem.name = sourceListItem.title
        id = Lists.insert listItem # <- Error here!! Fiber with Meteor.bindEnvironment or Async needed
        console.log "+ Loaded list record: [#{listItem.name}] under _id: [#{id}]"

################################################################################

#W20150901-23:57:23.544(10)? (STDERR) Error: Meteor code must always run within a Fiber. Try wrapping callbacks that you pass to non-Meteor libraries with Meteor.bindEnvironment.
#W20150901-23:57:23.544(10)? (STDERR)     at Object.Meteor._nodeCodeMustBeInFiber (packages/meteor/dynamics_nodejs.js:9:1)
#W20150901-23:57:23.544(10)? (STDERR)     at [object Object]._.extend.get (packages/meteor/dynamics_nodejs.js:21:1)
#W20150901-23:57:23.544(10)? (STDERR)     at Object.DDP.randomStream (packages/ddp/random_stream.js:69:1)
#W20150901-23:57:23.544(10)? (STDERR)     at [object Object].self._makeNewID (packages/mongo/collection.js:72:1)
#W20150901-23:57:23.545(10)? (STDERR)     at [object Object].Mongo.Collection.(anonymous function) [as insert] (packages/mongo/collection.js:488:1)
#W20150901-23:57:23.545(10)? (STDERR)     at server/lib/ImportToDoData.coffee:17:20
#W20150901-23:57:23.545(10)? (STDERR)     at Array.forEach (native)
#W20150901-23:57:23.545(10)? (STDERR)     at Query._callback (server/lib/ImportToDoData.coffee:14:16)
#W20150901-23:57:23.545(10)? (STDERR)     at Query.Sequence.end (/Users/cam/sde/meteor-apps/meteor-data-migration/todos/.meteor/local/isopacks/npm-container/npm/node_modules/mysql/lib/protocol/sequences/Sequence.js:96:24)
#W20150901-23:57:23.545(10)? (STDERR)     at Query._handleFinalResultPacket (/Users/cam/sde/meteor-apps/meteor-data-migration/todos/.meteor/local/isopacks/npm-container/npm/node_modules/mysql/l
#
