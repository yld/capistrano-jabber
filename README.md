capistrano-jabber
=================

Writes an message to Jabber conference after capistrano deploy succesfully.

Usage
-----

Note: This gem works only with `capistrano-ext-multistage`.

In your `Gemfile`

    group :development do
      ...
      gem 'capistrano'
      gem 'capistrano-ext'
      gem 'capistrano-jabber'
      ...
    end

In your `deploy.rb`

  require 'capistrano/ext/multistage'

  ...

  set :jabber_user, "mail@example.com"
  set :jabber_password, "secret"
  set :jabber_room, "room_name"

  # optional, defaults to jabber_user
  set :jabber_nick, "Deploy Bot"

  # optionally save the room's password
  set :jabber_roompassword, "secret_roompassword"

  # defaults to 'talk.google.com'
  set :jabber_server, "jabber.server.com"

  # require this gem after variables have been set
  require 'capistrano-jabber'