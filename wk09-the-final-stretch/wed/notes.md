### The Last Lecture?

--

Not sure if:

![disappoint](http://mashable.com/wp-content/uploads/2013/07/Dr.-Who.gif)

---

### The Last Lecture?

OR

--

![awesome](https://33.media.tumblr.com/474bb51f05a33360d70f18cbde9fd18c/tumblr_mlr7aiP4OF1r4aiyzo1_500.gif)

---

## Administrivia

* No Weekend Assignment *BUT* this will be the best window to make up
  some incomplete or complete but unsatisfactory weekend assignments!

  You are in danger of not graduating on time if you have more than 2
  incomplete or unsatisfactory *weekend assignments*.
  
  I had a quick look at TIYO and if a few folks get in Tic Tac Toe Redux
  and Code Champ then we're in good shape. Let's finish strong on Planeswalkr
  today but I'll be checking slack a few times a day throughout the weekend.
   
-- 

* Two things today:
  * Quick Search Overview
  * Add Email and get the Background Job stuff merged

---

## Enter Email

So it turns out Email sucks. Shocking, right?

--

Good news: Old protocol called [SMTP][smtp] allows us to send mail without running our own mailservers.

I.e. we could Gmail to send emails on our behalf. ... But that means using our personal accounts. :-/

[smtp]: https://en.wikipedia.org/wiki/Simple_Mail_Transfer_Protocol

--

Better idea: We'll sign up for a service for sending email, [SendGrid][sendgrid]!
(Used to use Mandrill for this but they added a bunch of restrictions to be able
to send email.)

They have a free Heroku add on (`heroku addons:create sendgrid:starter` does the trick) and you get a few thousand messages a month at no charge.

Could also sign up on SendGrid's site and add the info to your `.env` and `heroku config`.

[sendgrid]: https://devcenter.heroku.com/articles/sendgrid#ruby-rails

---

## Config Pains

Similar to file uploads, the biggest hassle with adding and testing email
tends to be:

1. Making sure that everything is configured correctly.
2. Making sure the email actually was sent.
3. You can never be 100% sure something isn't sending and being flagged as spam.

--

#### An Example Config

```
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
```

---

## Enter Actionmailer

[ActionMailer][mailer-guide] is Rails way of sending email at random.

You *can* `rails g mailer MyMailer` ... but there are just 3 important things to know:

1. Mailers
  * Live in `app/mailers`.
  * Much like controllers, there's an `ApplicationMailer` and subclasses.
  * Have methods that define instance variables and call `mail`.
2. Views
  * Live in `app/views/my_mailer/method.html.erb or method.text.erb`.
    * I think, if I'm wrong we'll just see the path when it crashes!
  * Are really boring otherwise, even more so than normal views. :)
3. Sending an email is done as follows:
  * `MyMailer.my_email(foo).deliver_later` (queue it for delivery via background jobs, comes with [delivery-options])
    * Note that if you don't have background workers set up it defaults to sending immediately.
  * `MyMailer.my_email(bar).deliver_now`

[actionmailer]: http://api.rubyonrails.org/classes/ActionMailer/Base.html
[mailer-guide]: http://guides.rubyonrails.org/action_mailer_basics.html
[delivery-options]: http://edgeapi.rubyonrails.org/classes/ActionMailer/MessageDelivery.html

---

## So here we are ...

* It's been my pleasure to teach you all.

* Mentorship doesn't end at the end of the cohort.

* Your journey into programming is just beginning.

* Don't stop learning.

🍰 🍻 👾 🎉 ❤️
