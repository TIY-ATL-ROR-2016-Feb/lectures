## Blarg

In this assignment, you'll fork
the Blarg repo from the organization page
and make changes to your fork so that
individual posts can be edited.

## Objectives

### Learning Objectives

After completing this, you should ...

* Be comfortable creating and editing records in a basic Rails application
* Be comfortable passing data to views using locals
* Understand how to define basic routes in a Rails application
* Understand the process from Request -> Router -> Controller -> Response/View

### Performance Objectives

* Be comfortable using Rails form helpers
* Be comfortable using Rails path helpers
* Be comfortable using `link_to` and `redirect_to` for site navigation

## Details

### Requirements

* Add a route to edit a specific post. It should have a route parameter.

* Modify the index view so that next to each post there's a link to edit the post.

* Clicking on the link should take you to a form to edit that specific post.
  (**Note**: This will require a new controller method and view.)

* Submitting the form should go to a method in the controller that updates
  the database and redirects the user to the show page for that post.
  (**Note**: This requires a second route and another controller method but no view.)

* Add a show route, method, and view for looking at an individual post.

### Hard Mode

* Can you make the form a partial that
  is reused by both the New Post page
  and the Edit Post page?

  If not, what prevents you from doing so?

## Resources/Hints

[Rails Routing From the Outside In](http://guides.rubyonrails.org/routing.html)
  * Just read chapter 1!

[Rails Form Helpers Guide](http://guides.rubyonrails.org/form_helpers.html)
  * Just chapter 1 again.

* Form tag helpers (such as `text_field_tag`, `text_area_tag`, etc.) can be passed an optional
  second argument. Instead of just saying `the_tag :parameter_name`, you can say
  `the_tag :parameter_name, some.expression` and the result of the expression will be the
  pre-filled value for that form input! :)
