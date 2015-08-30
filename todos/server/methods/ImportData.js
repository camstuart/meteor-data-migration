/**
 * Server methods to import to-do data
 */
Meteor.methods({
    'importToDoData': function() {
        console.log('+ Received the call to load data');

        Todos.remove({});
        Lists.remove({});

        console.log('+ Starting import');
        var data = [
            {name: "Meteor Principles",
                items: ["Data on the Wire",
                    "One Language",
                    "Database Everywhere",
                    "Latency Compensation",
                    "Full Stack Reactivity",
                    "Embrace the Ecosystem",
                    "Simplicity Equals Productivity"
                ]
            },
            {name: "Languages",
                items: ["Lisp",
                    "C",
                    "C++",
                    "Python",
                    "Ruby",
                    "JavaScript",
                    "Scala",
                    "Erlang",
                    "6502 Assembly"
                ]
            },
            {name: "Favorite Scientists",
                items: ["Ada Lovelace",
                    "Grace Hopper",
                    "Marie Curie",
                    "Carl Friedrich Gauss",
                    "Nikola Tesla",
                    "Claude Shannon"
                ]
            }
        ];

        var timestamp = (new Date()).getTime();
        //_.each(data, function(list) {
        //    var list_id = Lists.insert({name: list.name,
        //        incompleteCount: list.items.length});
        //
        //    _.each(list.items, function(text) {
        //        Todos.insert({listId: list_id,
        //            text: text,
        //            createdAt: new Date(timestamp)});
        //        timestamp += 1; // ensure unique timestamp.
        //    });
        //});
    }
});