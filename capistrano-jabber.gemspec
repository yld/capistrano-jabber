$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'capistrano-jabber'
  s.version     = '0.1'
  s.date        = '2013-03-09'
  s.summary     = "Make capistrano write to a jabber conference"
  s.description = ""
  s.authors     = ["Tomáš Dundáček"]
  s.email       = 'tomas.dundacek@khlhokej.cz'
  s.files       = ["lib/capistrano-jabber.rb"]

  s.add_dependency 'xmpp4r', '~> 1.3.4'
end
