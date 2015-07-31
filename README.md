# User Registration and Authentication

## Summary
In this challenge we're going to build a toy application that explores user registration and authentication.  To begin, our application will be limited to allowing users to register for our site and afterward login and logout.  Once our application has this functionality, we'll look at filtering—allowing logged in users access to content that guests cannot access.


### Working with Sessions
In the vanilla world of HTTP, our web applications don't recognize when two requests come from the same browser; they treat each request the same way.  In this challenge, we'll learn to use [sessions][] in Sinatra, which store
data using [HTTP cookies][].  We use cookies to retain state across web requests—in this challenge, we'll use them so that our application recognize that a user is logged in.


### Protecting User Data
When users sign up to use our application, they will be trusting us with their data:  names, e-mail addresses, passwords.  We want to do everything we can to protect our users in case our database is compromised.  We should never store a user's plain-text password in our database.


### Application Description
Our application will have only one model: `User`.  We'll work with our user model to build an application that supports a few core actions:

- User registeration (i.e., creating an account)
- Login
- Logout

Once this functionality is built, then we'll begin to restrict access to our application to logged in users.  In other words, when a user attempts to see a page in our application, they will be redirected to the login page, unless they have already been logged in.

As we build our application, we'll need to make decisions about the routes that we need and the types of request the browser should make (e.g., get, post, etc.).


## Releases
### Release 0:  User Registration
The first feature that we're going to add to our application is user registration; when users visit our site, they should be able to create accounts.

Users will need to provide us with some information.  We'll keep things simple and only require some basics:

- full name
- email address
- password 

When a user registers with our site, we'll need to persist the information that they provide to us in our database (i.e., save the new user in the database).  What data should we keep in our database?  How should we store it?  Remember, we should not store a user's plain-text password.  What constraints should we have in our database and validations in our models?  What would happen if two users registered with the same e-mail address?  Or, if a user did not supply an e-mail address?

*Note:*  When users later return to our site and login, they will submit their email address and password.




How do we know whether they
submitted the correct password or not?

Design a `users` schema and add a method to the `User` model that works as
follows:

```ruby
class User < ActiveRecord::Base
  # e.g., User.authenticate('jesse@devbootcamp.com', 'apples123')
  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end
end
```

### Release 1:  Get an Expert&trade; Opinion

Once you've designed the schema for `users` and implemented the
`User.authenticate` method, bring a staff member over and have them review your
schema.  How user authentication works, what's secure and what's not, are one
of the most basic bits of web development.  It will be much easier to
understand if you've implemented it on your own once, even if your first try
wasn't secure.

Refactor your code according to the advice of the staff.

### Release 2:  Implement Logging In

Now implement logging in by POSTing to a `/login` URL with the user's email and
password.  If the user sent a valid email and password, store what data you
need to "remember" the user in the `session` Hash.

If you don't understand what this means, first read the [using sessions
section][using sessions] of the Sintra documentation.  Next, ask for help from
a staff member if it's still unclear what you need to store and how you store
it.

### Release 3:  Implement Logging Out

Implement a controller method that will log a user out when they visit it.
This will most likely involve deleting some content from the `session` hash.

### Authorization

**Authentication** is the processes of answering the question, "Who are you?"
**Authorization** is the process of answering the question, "What do you have
permission to do?"

A user should be authorized to see the secret page only if they're logged in.
Write code that redirects a user back to the login page if they try to access
the secret page when they're not logged in.

One way is to use a [before filter][].
**Note**: This not the only way, or even necessarily the best way in this case.
But it's one tool to implement this kind of pre-route logic.

For an app this simple, it's ok to put it in the route itself.

## Resources

* [Sinatra sessions][sessions]
* [HTTP cookies][]
* [Sinatra sessions][using sessions]
* [Sinatra before filter][before filter]

[sessions]: http://www.sinatrarb.com/faq.html#sessions
[HTTP cookies]: http://en.wikipedia.org/wiki/HTTP_cookie
[using sessions]: http://www.sinatrarb.com/intro#Using%20Sessions
[before filter]: http://www.sinatrarb.com/intro#Filters
