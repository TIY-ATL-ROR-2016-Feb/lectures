# Databasics

Download the file at `http://redlinernotes.com/docs/databasics.sqlite3` as we did in class (`curl http://path/to/file > file`)
and then open the database with `sqlite3 file` and answer the following questions.

Copy the queries you used to answer these questions into a Gist and post the link to that Gist on TIY Online when you're finished!

## Objectives

### Learning Objectives

After completing this assignment, you should understand:

* How to connect directly to an SQL database and run queries to manipulate data

### Performance Objectives

After completing this assignment, you be able to effectively use

* `select` and `where` to find data
* `limit` and `offset` to limit results
* `insert` and `update` to modify data
* `sum` and aggregation methods

## Details

Copy the included SQLite3 database. Connect to it using `sqlite3 <filename>` and explore the following. (Note: you may want to make a backup copy before running queries that change the database.)

### Deliverables

A gist containing answers to the following questions and the command(s) you used to find them.

## Normal Mode - No Joins Required!

* How many users are there?

`sqlite> SELECT COUNT(*) FROM users;`

* What are the 5 most expensive items?

`sqlite> SELECT id,title,price FROM items ORDER BY price DESC LIMIT 5;`

* What's the cheapest book? (Does that change for "category is exactly 'book'" versus "category contains 'book'"?)

NOTE: There is a Books category.

`sqlite> SELECT title, category, MIN(price) FROM items WHERE category="Books";`

NOTE: Could also use ORDER BY and LIMIT...

`sqlite> SELECT title,category,price FROM items WHERE category="Books"
   ...>   ORDER BY price LIMIT 1;`

* Who lives at "6439 Zetta Hills, Willmouth, WY"? Do they have another address?

`sqlite> SELECT user_id FROM addresses WHERE street LIKE("6439 Zetta%");
 sqlite> SELECT * FROM addresses WHERE user_id = 40;`

* Correct Virginie Mitchell's address to " New York, NY 12345".

`sqlite> SELECT * FROM users WHERE first_name="Virginie";
 sqlite> UPDATE addresses SET zip=12345 WHERE id=41;`

* How many total items did we sell?

`sqlite> SELECT SUM(quantity) FROM orders;`

* Simulate buying an item by inserting a User for yourself and an Order for that User.

```
sqlite> INSERT INTO users VALUES (null, "brit", "butler", "brit@thenevermind.com");
sqlite> INSERT INTO orders VALUES (null, 51, 39, 3, null);
```

## Hard Mode - Joins, Summation, More Advanced Queries

* How much would it cost to buy one of each tool?

`sqlite> SELECT SUM(price) FROM items WHERE category="Tools";`

* What item was ordered most often? What grossed the most money?

`
sqlite> SELECT SUM(quantity) AS total, items.title FROM orders INNER JOIN items
   ...>   ON orders.item_id=items.id GROUP BY item_id ORDER BY total DESC LIMIT 1;
`

Can get away without `AS`:

`
sqlite> SELECT SUM(quantity), items.title FROM orders INNER JOIN items
   ...>   ON orders.item_id=items.id GROUP BY item_id ORDER BY SUM(quantity) DESC;
`

The most money?

`
sqlite> SELECT SUM(orders.quantity * items.price) AS total, items.title
   ...>   FROM orders INNER JOIN items ON orders.item_id=items.id
   ...>   GROUP BY orders.item_id ORDER BY total DESC LIMIT 1;
`

* What user spent the most?

To just get a user_id isn't *sooooo* bad...

`
sqlite> SELECT SUM(orders.quantity * items.price) AS total, orders.user_id 
   ...>   FROM orders INNER JOIN items ON orders.item_id=items.id
   ...>   GROUP BY orders.user_id ORDER BY total DESC LIMIT 1;
`

To actually get the name and total amount spent...

`
sqlite> SELECT SUM(orders.quantity * items.price) AS total, first_name, last_name
   ...>   FROM orders INNER JOIN items ON orders.item_id=items.id
   ...>   INNER JOIN users ON orders.user_id=users.id
   ...>   GROUP BY orders.user_id ORDER BY total DESC;
`

* What were the top 3 highest grossing categories?

`
sqlite> SELECT category, SUM(price * quantity) AS total FROM orders
   ...>   INNER JOIN items ON orders.item_id=items.id
   ...>   GROUP BY items.category ORDER BY category DESC LIMIT 1;
`
