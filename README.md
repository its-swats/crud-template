# Dummy Users 
 
##Learning Competencies 

##Summary 

 We're going to build a toy application that explores user authentication.  It won't do anything other than let people sign up for an account, log in with that account, and display a special "users-only" page for logged-in users.

The application will have only one model: `User`.

The goal is to learn about how to retain state across web requests.  In the vanilla world of HTTP, your web app doesn't "know" that two requests came from the same browser.  This will require using [sessions](http://www.sinatrarb.com/faq.html#sessions) in Sinatra, which store data using [HTTP cookies](http://en.wikipedia.org/wiki/HTTP_cookie).

## Learning Goals

- Learn about secure implementation of authentication in a web application.
- Understand sessions and HTTP cookies.

## Objectives

### Determine Your Routes

Feel free to use the [basic Sinatra skeleton](http://cl.ly/2n3D2V0R0L2f).

We only have one model, `User`, so let's focus on our controllers for a bit.  We need to support a few core actions:

1. Logging in
2. Logging out
3. Creating an account
4. Viewing the secret page
5. Redirecting a user back to the "log in" screen if they try to view the secret page without being logged in

There should be four routes involved.  Why?  Which ones are POST requests, which ones are GET requests.  Why?

### Create an Account

Start by creating the behavior to create an account.  When signing up, I should enter my full name, my email, and a password.

What fields should there be in the `users` table?  A user will be logging in by submitting their email and password somewhere.  How do we know whether they submitted the correct password or not?

Design a `users` schema and add a method to the `User` model that works as follows:

```ruby
class User < ActiveRecord::Base
  # e.g., User.authenticate('jesse@devbootcamp.com', 'apples123')
  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end
end
```

### Staff!  Find them!

Once you've designed the schema for `users` and implemented the `User.authenticate` method, bring a staff member over and have them review your schema.  How user authentication works, what's secure and what's not, are one of the most basic bits of web development.  It will be much easier to understand if you've implemented it on your own once, even if your first try wasn't secure.

Refactor your code according to the advice of the staff.

### Logging In

Now implement logging in by POSTing to a `/login` URL with the user's email and password.  If the user sent a valid email and password, store what data you need to "remember" the user in the `session` Hash.

If you don't understand what this means, first read the [using sessions section](http://www.sinatrarb.com/intro#Using%20Sessions) of the Sintra documentation.  Next, ask for help from a staff member if it's still unclear what you need to store and how you store it.

### Logging Out

Implement a controller method that will log a user out when they visit it.  This will most likely involve deleting some content from the `session` hash.

### Authorization

**Authentication** is the processes of answering the question, "Who are you?"  **Authorization** is the process of answering the question, "What do you have permission to do?"

A user should be authorized to see the secret page only if they're logged in.  Write code that redirects a user back to the login page if they try to access the secret page when they're not logged in.

One way is to use a [before filter](http://www.sinatrarb.com/intro#Filters).  **Note**: This not the only way, or even necessarily the best way in this case.  But it's one tool to implement this kind of pre-route logic.

For an app this simple, it's ok to put it in the route itself. 

##Releases
###Release 0 

##Optimize Your Learning 

##Resources
