/**
 * Server methods to import to-do data
 */
Meteor.methods({
    'importToDoData': function() {
        importer = new ImportToDoData(Meteor.settings.source_db);

        //Todos.remove({});
        //Lists.remove({});

    }
});