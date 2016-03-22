## databasics redux

### install

Fork and clone the [databasics][databasics] repo from the course organization page.
**Note that you will need to download a copy of the database into a "db" folder as
described in the README!**

### details

Add an `App` class in `lib/databasics.rb` to the project from today's lecture and methods
to prompt the user with various questions and interact with the database appropriately.
Submit the link to your fork when you're finished with the homework.

#### Normal Mode

* Add models in the `lib/databasics/` directory for the items and orders tables.
  * Don't forget to require any new ruby files in `lib/databasics.rb`!
* Add a method to prompt for a first name, last name, and email which then
  creates a new user and tells the user their ID.
* Add a method to display a user's current addresses.
* Add a method to display the items a user has ordered in the past and the number ordered.
* Add a method to prompt a user for an item name and quantity and create a new order.
  If no such item can be found, you may tell them the order has been declined.
  
#### Additional Notes

You will find it valuable to read the [Active Record Querying][querying] guide,
especially sections 1.1, 2.1, 2.2, 2.3, 2.4 for basic querying.

More interesting conditions and clauses can be found in chapters 3, 5, 6, and 19.

[querying]: guides.rubyonrails.org/active_record_querying.html
