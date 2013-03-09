require "xmpp4r"
require 'xmpp4r/client'
require 'xmpp4r/muc'

Capistrano::Configuration.instance(:must_exist).load do 
  jabber_server ||= "talk.google.com"
  jabber_roompassword ||= nil

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