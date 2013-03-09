capistrano-jabber
=================

Writes an message to Jabber conference after capistrano deploy succesfully.

Usage
-----

Note: This gem works only with `capistrano-ext-multistage`.

In your `deploy.rb`

  require 'capistrano/ext/multistage'
  require 'capistrano-jabber'

  ...

  set :jabber_user, "mail@example.com"
  set :jabber_password, "secret"
  set :jabber_room, "room_name"

  # optionally save the room's password
  set :jabber_roompassword, "secret_roompassword"

  # defaults to 'talk.google.com'
  set :jabber_server, "jabber.server.com"