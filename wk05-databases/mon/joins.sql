## Join examples

sqlite> SELECT * FROM tags INNER JOIN post_tags ON tags.id=post_tags.tag_id;

sqlite> SELECT tags.id, tags.name FROM tags INNER JOIN post_tags
...>   ON tags.id=post_tags.tag_id;

## Tag
-------------
| id | name |
-------------
| 2  | ruby |
| 3  | dogs |
| 4  | code |
| 5  | food |
-------------

## Post
---------------------
| id | title | body |
---------------------
| 44 | examp | stuff|
| 45 | fluffy| things|
---------------------

## Post Tags
-------------------------
| id | tag_id | post_id |
-------------------------
| 01 | 2      | 44      |
| 02 | 4      | 44      |
| 03 | 3      | 45      |
| 04 | 4      | 45      |
-------------------------
