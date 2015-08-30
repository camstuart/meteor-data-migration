// if the database is empty on server start, create some sample data.
Meteor.startup(function () {
  if (Lists.find().count() === 0 && Todos.find().count() === 0) {
      console.log('+ Database seems to be empty, loading seeds');
      Meteor.call('importToDoData');
  }
});
