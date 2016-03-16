# Me Right Now

It's [not a good look](https://www.youtube.com/watch?v=9iC45-tMR34)


---

# Programming: It's Fucking Hard

The good news: You're always learning new things and being forced to do things you've never done before.

--

The bad news: That means you'll always be second guessing yourself.

--

Ultimately, it's a lot of work. But it's work we're capable of.

--

And at least we are all screwed together.

---

## Week 1 - Core Ideas

* Conditionals, Loops, I/O
* Local Variables, Function Scope
* Data structure choice matters!
* Arrays for data we want to access by index (position)
* Hashes for data we want to access by name  (key)
* How we break up the problem matters!

---

## Week 2 - Core Ideas

* Instance Variables, Class Scope
* How Method Dispatch actually works
* Duck Typing allows us to easily swap out objects that share an interface
  * Like Plugins, right?
* Unit Testing allows us to check our code works in an automated way
  * If we can figure out what and how to test it.
* Coming up with reasonable object oriented designs is hard.

---

## Week 3 - Core Ideas

* The majority of what we care about in the internet works on HTTP
  * Some old chat protocols (IRC, AIM) and bittorrent are the exceptions
* HTTP works the same whether you're using Ruby, a command line tool, or anything else!
* We can grab libraries to make our lives easier using `bundler` and the `Gemfile`
* When working with HTTP a client sends requests to a server and the server returns a response.
* Requests and Responses *both* have a route (http verb + path), headers and a body.
  * The body of requests is often empty (GET requests)
  * We are especially interested in the status code of responses to know what happened.
* APIs are made up of routes that expect certain parameters (and usually authorization)
* APIs usually return JSON which can take some extensive processing on our end.

---

## Week 4 - Core Ideas

* A controller is just a collection of routes and methods.
* Those methods can do anything normal Ruby code can do.
* We can use the Sinatra gem to easily define controllers in Ruby.
* Next, we'll see how to use views to have real web pages!
* Git is scary but also cool. More coming soon ...

---

#### HTML 101

- HTML is a language used to describe the structure of web pages.
- CSS is a language used to describe the appearance of web pages.
- An element is composed of three parts: an opening tag, content, and a closing
  tag. There are a few elements, like `<img>`, that are an exception to this rule.
- All html documents should have tags for `<html>`, `<head>`, and `<body>`.
- `<head>` is information *about* the document.
- `<body>` is the content of the document.
- Elements can have attributes as well. Attributes are written inside the
  opening tag of an element, e.g. the 'src' in `<img src="image.jpg">`
- Most whitespace (tabs, returns, spaces) is ignored by the browser, but you can
  use it to make your HTML more readable.

---

# HTML Overview

  * Overview of doctype, html, head, body
    * `<!DOCTYPE html>` - HTML5 Doctype
  * HTML Elements
    - `<doctype>`
    - `<html>`
    - `<head>`
    - `<body>`
    - `<p>`
    - `<div>`
    - `<a>`
    - `<h1>`
    - `<img>`

---

# HTML Overview 2.0
  * Block vs Inline
    * Block
        * If no width is set, will expand naturally to fill its parent container
        * By default, will be placed below previous elements in the markup
        * Examples:  `<p>`, `<div>`, `<ul>`, `<li>`, and `<h1>`.
    * Inline
        * Flows along with text content
        * Examples:  `<a>`, `<span>`, `<img>`

---

#### Links
- You can create a link element with the `<a>` tag. You specify the location to
  link to in the `href` attribute of the tag and the title in the content, e.g.
  `<a href="http://theironyard.com">The Iron Yard</a>`
- You can use words or an image as the content for a link.

#### Block vs inline
- Block level elements like `<p>` ol, ul, li and `<blockquote>` appear on their
  own line and expand all the way to the left and right of their container.

#### Semantics
- You should always use the element that is closest to meaning to the type of
  your content, even if the appearance is incorrect. You can adjust the
  appearance with CSS.

---

#### Void elements
- Some elements are "void", meaning they don't have a closing tag. The most
  common examples are `<img>` and `<link>`

#### Images
- Use the `<img>` tag to add an image to your page. You specify the source of
  the image with the `src` attribute. The source can be a file on your site, or
  an external URL.

#### Validation
- The validator at http://html5.validator.nu is a free online service that
  checks pages for compliance with standards.

---

# CSS overview


  * What is CSS?
    * Overview of adding colors, styling fonts, etc.
    * Adding styling with id and class names
  * CSS Properties


#### CSS Rules

- A block of CSS code that applies properties to a selection of elements is
  called a "rule".
- A rule is made up of a "selector" and one or more property declarations.
- The selector specifies the set of elements the rule applies to.
- A property declaration is made up of a property name and one or more property
  values.
- Each property declaration ends with a semicolon
- The list of property declarations goes between curly braces (i.e. `{ }`)

#### Example

```css
div > a // selector
{
  border-color: red;
  // property: value;
  // Also, the whole line is a "rule"
}
```

## Box Model

Every element on the page is a box. Every box can be styled with a border, background, etc. There are 4 parts to the box:

* Content
* Padding
* Border
* Margin

By default when you set the `width` of an element, you are specifing the width of the content portion of the box only. Any padding, border, and margin will be added to the width. For example, if you had a div with the styles:

```css
{
  width: 100px;
  border: 1px solid red;
  padding: 10px;
}
```

The full width of the entire box would be `122px` because it has the border and margin on each side of the content:

| Margin | Border | Padding | Content | Padding | Border | Margin |
|--------|--------|---------|---------|---------|--------|--------|
| 0 | 1px | 10px | 100px | 10px | 1px | 0 |

0 + 1 + 10 + 100 + 10 + 1 + 0 = 122


#### Box Sizing

You can change the way __width__ works on boxes using the `box-sizing` css property. The default value for this is `content-box` which works as described above where the width property only applies to the content of the box. The other possible values are:

* `padding-box` the __width__ property is applied to the content plus the padding
* `border-box` the __width__ property is applied to the content, padding and border


## Positioning

[CSS Positioning](https://developer.mozilla.org/en-US/docs/Web/CSS/position)

* `position:relative;`
* `position:absolute;`

Introduction of `top`, `right`, `bottom`, `left` and `z-index`

## Floating

* `float: left;`
* `float: right;`
* `float: none'`

[Clearfix Hack](http://learnlayout.com/clearfix.html)
[Floating boxes](http://s.codepen.io/jisaacks/debug/myOpLJ)


## Links / Resources

* [Mozilla Developer Network](https://developer.mozilla.org/en-US/)
* [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML)
* [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)
* [HTML Attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes)
* [CSS Selectors](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started/Selectors)
* [HTML Elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)
* [Block Level Elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Block-level_elements)
* [Inline Level Elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Inline_elemente)
* [CSS Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)
* [CSS Z-INDEX](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Understanding_z_index/The_stacking_context)
* [Learn Layout](http://learnlayout.com/)
