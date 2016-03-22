## Good Morning!

* It's time to ActiveRecord.

--

* But first ...

--

### Homework Review!

<div align="center">
<img src="http://cache29.fansshare.com/pictures/facebookmeme/famous-characters-troll-face-okay-meme-face-930346914.jpg" width="65%" >
</div>

---

# Introducing Bundler and Libraries (Gems)

* `bundle gem $NAME` scaffolds out a project called $NAME for you.
  * Since it autogenerates folders and code, we avoid spaces, dots, colons, dashes, etc
    in our project names. We generally stick to lower case, too.

--

* Tweak the gemspec quickly. Gemspec is mostly for publishing to rubygems.
  * Making a gem is not magic! (But we won't see that today.)

--

* Add `sqlite3` and `activerecord` gems. Put `pry` in the development group.

--

* Run `bundle` in the project directory and it grabs all the libraries we need.
  * Commit!

---

# Some Basic Config Gunk

* ActiveRecord is the same database library Rails uses.

--

* We configure it just the same as we would a Rails app:

  * Configuration goes in a file called "config/database.yml".
  * Migrations go in a "db/migrate" folder.
  * Add a Rakefile with a task to run your migrations.
  * We need to start a connection to the database in our code.

--

* All this is shown in the following gist:
  * [example active_record setup][example_ar]

--

* One last thing:
  * Sqlite stores database in the file specified by database.yml
  * You can delete it to "wipe" the database. Good for learning.
  * Probably worth adding "db/foo.db" to your `.gitignore`

[example_ar]: https://gist.github.com/kingcons/51fe3f9a359307cbdc59

---

# Schemas, Migrations, Models

* To have a class that can be saved in the database we have to do a few things.

--

1. The class must subclass `ActiveRecord::Base`.

--

2. The class **must not** define an `initialize` method. We'll see why shortly.

--

3. We have to add the model to the database "Schema".

--

4. All changes to the schema *must* be made by "Migrations".

--

* Let's write one and talk a bit about the schema file ...

---

# Classes vs Models

### Classes

1. Definition: `class Foo ... def method1 ... def method2 ... end`
2. Creation: `my_new_instance = Foo.new(maybe_some_args)`
3. Usage: `my_new_instance.method1`, `my_new_instance.method2`, etc.

--

### Models (oh boy ...)

1. Prepare the database by *Writing a migration* and *Running that migration*.
   (Otherwise you don't have a table to store the models in!)
2. Write the model: `class Foo < ActiveRecord::Base`.
   **DO NOT WRITE AN INITIALIZE METHOD!** (ActiveRecord gives us the one we want.)
3. Creation: `my_new_instance = Foo.new(column1: "cookies", column2: 42)`
4. Usage: `my_new_instance.save`, `my_new_instance.method1`, `my_new_instance.method2`, etc.

---

# CRUD - Create / Read

## Create
* Full::PathTo::ModelClass.new (or .create which also saves for you)
  * Pass keyword arguments for all columns

## Read
* Full::PathTo::ModelClass.stuff
  * count ( get the number of records in the table )
  * all ( return an enumerator for everything in the table ) USE WITH CAUTION!
  * where ( return an enumerator for everything matching the clause )
  * find (return a model instance by id)
  * find_by_$ ( return a model instance by column )
  * find_each ( return each model instance in turn )

---

# CRUD - Update / Delete

## Updating ( good old accessors / update_attribute / update_attributes )
* model_instance.stuff (call it toy)
  * toy.name = 'foo' ( aka good old accessors, must be followed by toy.save )
  * toy.update_attributes :name => "foo" (saves for you, any number of attributes)

## Deleting ( delete / destroy )
* model_instance.stuff (call it toy)
  * toy.delete ( only kills it on the database side )
  * toy.destroy ( kills it database side, nils the ruby object, runs arbitrary helper code )
