require "xmpp4r"
require 'xmpp4r/client'
require 'xmpp4r/muc'

Capistrano::Configuration.instance(:must_exist).load do 
  set :jabber_server, "talk.google.com" unless exists?(:jabber_server)
  set :jabber_roompassword, nil unless exists?(:jabber_roompassword)
  raise Exception, "jabber_user must be specified" unless exists?(:jabber_user)
  raise Exception, "jabber_password must be specified" unless exists?(:jabber_password)
  raise Exception, "jabber_room must be specified" unless exists?(:jabber_room)

  set :jabber_nick, jabber_user unless exists?(:jabber_nick)

  client = Jabber::Client::new(Jabber::JID::new(jabber_user))
  client.connect(jabber_server)
  client.auth(jabber_password)
  client.send(Jabber::Presence::new.set_type(:available))
   
  bot = Jabber::MUC::SimpleMUCClient.new(client) 
  bot.join(Jabber::JID.new("#{jabber_room}/#{jabber_nick}", jabber_roompassword))

  set :local_user, ENV['USER'] || ENV['USERNAME'] || 'unknown'
  branch ||= "master"
   
  namespace :say do
    task :end do
      if client && bot
        info = "#{local_user} deployed #{application} to #{stage} with branch #{branch}. Result: OK"
        bot.say(info)
      end
    end
  end

  after "deploy:restart", "say:end"
end