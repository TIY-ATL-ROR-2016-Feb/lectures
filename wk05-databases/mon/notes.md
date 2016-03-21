# Good Morning

## First things first ...

### Take a deep breath ...

---

# Ah, Programming

* I know how it feels.

--

* It can be so **tumultuous**.

--

* One moment everything is clicking...

--

* You're in sync with the machine, capable of *magic*!

--

.center[![magic](http://i.imgur.com/o0vd1Jg.gif)]

---

# And then ...

.center[![fish-slapped](https://media.giphy.com/media/C2x6phxndE61W/giphy.gif)]

--

* I know it can be discouraging. And exhausting. 

.center[![exhausted](http://i.imgur.com/zyk2jFL.gif)]

--

But we're learning tons. Keep grinding.

---

# Quiz

Yaaaaay, Quiz Tiiiiime!*

[quiz](https://gist.github.com/kingcons/9ef947975849a4f3ac1c)
Disclaimer: Quizzes are for retention and waking us up, not for a grade. Do not panic.

---

## Big Picture Goals - Week 3

* Understand how to create and modify database schemas
* Understand how to perform basic CRUD querying with SQL *and* ActiveRecord
* Understand how to use basic joins
* Understand how to use associations to simplify common query patterns
* Understand how to incorporate models into an application

---

# Databases

* First, we'll be concering ourselves with *Relational Databases* (aka RDBMS).

--

* Sure, there's MongoDB and NoSQL. But I know of *zero* businesses built on the backs of them exclusively.

--

* Various relational databases out there: sqlite, postgresql, mysql, oracle, mssql

--

* We're going to use sqlite this week. Will switch to postgresql later on.

--

* Sqlite is already installed on your macbooks, hooray!

--

* But you'll want to grab the database I'm using for today's lecture.
  See: http://redlinernotes.com/docs/redlinernotes.sqlite3

--

* Can connect to the database on the command line with `sqlite3 my-db-file.sqlite3`

---

# But why Database?

* (Remember: Historical context is important!)

--

* Came to prominence in the 80s. A couple of reasons ...

--

1. Companies needed multiple users to be able to see/update data
   *simultaneously* and *reliably*. (I.e. concurrency is hard)

--

2. Had a standardized interface in the form of a very simple and
   regular special purpose language called SQL (pronounced "sequel" usually).

--

3. Programming languages and hardware were in wild flux for a long time.
   Databases act as a long-term data storage technique. Any language that
   has a SQL library (that's basically all of them) can talk to the database.
   This was very comforting to software/IT managers at the time.

--

4. They have better speed and support for querying, etc, than files and custom formats.

---

# SQL Things!

* *Disclaimer:* May need to google syntax at various points.

--

* Tables and Columns

--

* Basic clauses: SELECT FROM, INSERT INTO, UPDATE SET, DELETE FROM

--

* Modifiers: WHERE (LIKE, <, >, etc), LIMIT, OFFSET

--

* Aggregation and Sorting: COUNT, ORDER BY, GROUP BY, SUM

--

* Annnnd the cuddly, wonderful Joins!

---

# HW

Tonight's homework involves performing a number of queries on a simple database.

To submit, link to a *gist* with your answers and the queries you used to find them.
