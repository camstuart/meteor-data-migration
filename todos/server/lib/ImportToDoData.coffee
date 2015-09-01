################################################################################
class @ImportToDoData extends @ImportBase
  constructor: (appSettings) ->
    super appSettings, ['lists', 'todos']

################################################################################
  import: ->
    console.log '+ Starting load...'

    Lists.remove {}
    Todos.remove {}

    sourceLists = null
    try
      sourceLists = new (Mongo.Collection)('list', _driver: @sourceDbConnection)
    catch error
      console.warn "Collection exists: #{error}"
      sourceLists = Mongo.Collection.get('list', _driver: @sourceDbConnection)

    sourceTasks = null
    try
      sourceTasks = new (Mongo.Collection)('task', _driver: @sourceDbConnection)
    catch error
      console.warn "Collection exists: #{error}"
      sourceTasks = Mongo.Collection.get('task', _driver: @sourceDbConnection)

    lists = sourceLists.find {}, {}, {}
    newList = {}

    lists.forEach (sourceListRecord) ->
      newList.name = sourceListRecord.title
      listId = Lists.insert newList
      console.log "> New list item: '#{newList.name}' inserted with _id: '#{listId}'"

      todos = sourceTasks.find {list_id: sourceListRecord.id}, {}, {}
      newTodo = {}

      todos.forEach (sourceTaskRecord) ->
        newTodo.listId = listId
        newTodo.text = sourceTaskRecord.text
        todoId = Todos.insert newTodo
        console.log ">> New todo item: '#{newTodo.text}' inserted with _id: '#{todoId}'"

################################################################################
