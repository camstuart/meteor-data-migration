# Migrating legacy data to a Meteor Application

Source code examples to accompany [Google Slides](https://docs.google.com/presentation/d/1bwcvMLBo70jeSwG5qlekNaMxFgsUiFKhzW5Wi5Ks00k/edit?usp=sharing) And [YouTube videos here](https://www.youtube.com/watch?v=gOCevRP8VUk&list=PLqoJDYdHr0dgyfQq7jp13caF3pVPMUmrn&index=6)

Prepared for [Melbourne Meteor #22](http://www.meetup.com/Meteor-Melbourne/events/223647433/) by Cameron Stuart

There are git tags specified in the presentation slides to step through the code changes

## GIT Stages

### Initial clone:

```
git clone git@github.com:camstuart/meteor-data-migration.git
```

### Stage 1 - Original 'todo' app with simple seeding:

```
git checkout b99ad702c2f729973829b5ef56b95802f2feb193
```

Affected files:

```
todos/lib/router.js
```

### Stage 2 - Call a webhook instead:

```
git checkout bf4b37a31d5656bdbfb5d99e941005de2e275a1f
```

Affected files:

```
todos/server/bootstrap.js
todos/server/methods/ImportData.js
```

### Stage 3 - Where is the loading code going to live?

```
git checkout 5ebab7202ffe0aee03c3028b91a5e8a7adc1f866
```

Affected files:

```
todos/.meteor/packages
todos/config/settings.dev.json
todos/server/lib/ImportBase.coffee
todos/server/lib/ImportToDoData.coffee
todos/server/methods/ImportData.js
```

### Stage 4 - Connection to MySQL with failed attempt to insert into local mongodb

```
git checkout 5168930c39f0f181105b85ef0c76034cf54b0ca9
```

Affected files:

```
data/load_mysql.sh
data/todo.mysql.sql
todos/.meteor/packages
todos/server/lib/ImportBase.coffee
todos/server/lib/ImportToDoData.coffee
todos/server/methods/ImportData.js
```

### Stage 5 - Mysql to Mongo to Meteor Mongo

```
git checkout 0a98cda6536377ebde6863963c2b9804365be9fd
```

Affected files:

```
data/mysql2mongo.pl
todos/.meteor/packages
todos/server/lib/ImportBase.coffee
todos/server/lib/ImportToDoData.coffee
```

### Stage 6 - Validate data with simple schema


```
git checkout 8e99311715a0cf44fac4f688256e4c63583b7153
```

Affected files:

```
data/load_mysql.sh
data/todo.mysql.sql
todos/.meteor/packages
todos/server/lib/ImportToDoData.coffee
todos/lib/collections.js
```
